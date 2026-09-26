#!/bin/sh
# Exercise launch.sh with stub claude, codex and launch-note commands, in paths that contain spaces:
# each recipe with no note, with an empty note and with a note (start, the builder, end), a
# transcript call after a claude record and after a resumed codex record, each recipe resuming a
# session (codex also with the network setting, with relative files and with a note, claude also
# with a note), the ways start can fail to give an id, a launch that returns before its builder
# ends, an exit file left by an earlier run removed at the launch, every usage error with its
# message, a note command that cannot run, and a builder killed by a signal (exit 137, end
# called). Then:
# - the pid in the pid file leads a session of its own, is the pid start receives, is alive at
#   start and at end, and is gone once the exit file is written;
# - TERM, INT and HUP to that pid: no builder process left, exit 143, 130 and 129, end called
#   after the exit file is written, and the runner not among the processes it stops;
# - against a builder that ignores TERM and has a child in a process group of its own, the land
#   skill's sequence (TERM, then KILL two seconds later, then its five-second wait for the pid to
#   be gone and the exit file present): as it falls, with the leader still alive at two seconds
#   (held by a hanging end), and with a runner's stop widened past two seconds in a patched copy
#   (TERM and INT); no process of the session left, the exit file saying 128 plus the signal;
# - a descendant outside the builder's group gets TERM before the KILL, and a process of the
#   leader's session outside the builder's group and tree ends on TERM to the leader;
# - KILL to the leader alone: no process of the builder left within about a second, the exit file
#   written by the runner, exit 137, also against a builder that ignores TERM; the builder's own
#   code when it ended as the leader was killed; an exit file the leader wrote kept; TERM and then
#   KILL while end hangs: the builder's code; while start hangs: no exit file;
# - TERM while the builder or the note's start is being started, and while the builder's runner
#   is between its fork and its next step, each window widened in a patched copy of launch.sh;
# - a note that hangs on start (after printing an id), on end and on transcript: each stopped
#   after 3 seconds with its processes, the builder run, the exit file written, no end after a
#   stopped start; TERM while start hangs stops it with the session leader;
# - a second launch refused with exit 75 while the first runs, and while a live launch holds the
#   lock, naming its pid; a launch writing its own pid into the lock file; a lock file naming a
#   dead launcher taken over; a pid file that is empty, not a number, 0 or a dead pid does not
#   refuse; two launches started together: one runs, one is refused;
# - relative paths for both harnesses resolved from the caller's directory;
# - the body's errors (a missing prompt, a missing --cwd) in the stderr file, and a stderr file
#   that cannot be written refusing the launch;
# - the session id written before the builder starts and passed with --session-id, a new one per
#   launch, the resumed id written on --resume;
# - the exit file moved into place, never written in place;
# - the session scanner started through the interpreter python3 resolves to, not through a python3
#   on PATH, and that setting kept from the builder;
# - a detached process that writes the pid file and ends at once counted as launched;
# - the allow file: each line of it that is not blank passed to claude as --allowedTools
#   "Bash(<line>:*)", on a first launch and on --resume, from a path holding a space and from a
#   relative path, carried through the lock re-run and the detached body; a claude launch without
#   --allow-file, or naming an empty value, a missing file, a directory, an unreadable file or a
#   file of blank lines, refused with exit 64 before anything starts; --allow-file refused for
#   codex and for transcript.
# With LAUNCH_SHELL set (for example dash), sh on PATH is that shell, so launch.sh and the
# process it starts run under it.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

scratch=$(mktemp -d "${TMPDIR:-/tmp}/launch-test.XXXXXX") || fail "could not create scratch directory"
scratch=$(CDPATH= cd "$scratch" && pwd -P)
# Stop every process this test started that is still running, then remove the scratch folder.
# A pid is signalled only while its command line names the scratch folder, so a pid the system
# has given to another process since is left alone.
cleanup() {
    for f in "$scratch/launched" "$scratch/a test root/pids" "$scratch/a test root/note pids"; do
        [ -f "$f" ] || continue
        while read -r p; do
            case "$(ps -o command= -p "$p" 2>/dev/null)" in
                *"$scratch"*) kill -TERM "$p" 2>/dev/null ;;
            esac
        done <"$f"
    done
    rm -rf "$scratch"
}
trap cleanup 0
trap 'exit 1' 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
launch=$script_dir/launch.sh

test_root="$scratch/a test root"
bin=$test_root/bin
work="$test_root/work dir"
mkdir -p "$bin" "$work" || fail "could not create the test directories"
CALLS=$test_root/calls.log
PIDS=$test_root/pids
NOTE_PIDS="$test_root/note pids"
ALIVE=$test_root/alive.log
export CALLS PIDS NOTE_PIDS ALIVE
: >"$scratch/launched"

if [ -n "${LAUNCH_SHELL:-}" ]; then
    shell_path=$(command -v "$LAUNCH_SHELL") || fail "no shell $LAUNCH_SHELL"
    ln -s "$shell_path" "$bin/sh" || fail "could not link sh to $shell_path"
fi

# A builder stub: logs its name, working directory and arguments (and, with SESSION_CHECK set, what
# that file holds as it starts, and a line when LAUNCH_PYTHON is in its environment), copies its
# stdin to stdout, writes a line to stderr, records its pid and its children's in PIDS, waits
# STUB_SLEEP seconds, and exits with STUB_EXIT. With
# STUB_IGNORE_TERM it ignores TERM (and so do the children it starts), with STUB_OWN_GROUP it also
# starts a sleeping child in a process group of its own, with STUB_TRAP_CHILD a child in a process
# group of its own that records each TERM it receives in TERM_LOG and keeps running (it records
# its own pid once its handler is set, so a TERM sent after that is always recorded), and with
# STUB_SESSION_JOB a sleeping process in a process group of its own whose parent has exited, so it
# is neither in the builder's group nor descended from it, only in its session.
for name in claude codex; do
    cat >"$bin/$name" <<EOF
#!/bin/sh
{
    printf '$name|%s' "\$(pwd -P)"
    for a in "\$@"; do printf '|%s' "\$a"; done
    printf '\n'
} >>"\$CALLS"
[ -z "\${LAUNCH_PYTHON+set}" ] || printf 'LAUNCH_PYTHON reached the builder\n' >>"\$CALLS"
if [ -n "\${SESSION_CHECK:-}" ]; then
    if [ -s "\$SESSION_CHECK" ]; then
        printf 'session file|%s\n' "\$(cat "\$SESSION_CHECK")" >>"\$CALLS"
    else
        printf 'no session file\n' >>"\$CALLS"
    fi
fi
cat
printf '$name stderr\n' >&2
[ -z "\${STUB_IGNORE_TERM:-}" ] || trap '' TERM
echo \$\$ >>"\$PIDS"
if [ -n "\${STUB_OWN_GROUP:-}" ]; then
    perl -e 'setpgrp(0, 0); exec @ARGV' sleep "\${STUB_SLEEP:-0}" &
    echo \$! >>"\$PIDS"
fi
if [ -n "\${STUB_TRAP_CHILD:-}" ]; then
    perl -e 'setpgrp(0, 0);
        \$SIG{TERM} = sub { open my \$f, ">>", \$ENV{TERM_LOG}; print \$f "TERM\\n"; close \$f };
        open my \$p, ">>", \$ENV{PIDS}; print \$p "\$\$\\n"; close \$p;
        sleep 1 while 1' &
fi
if [ -n "\${STUB_SESSION_JOB:-}" ]; then
    perl -e 'my \$p = fork; if (\$p) { print "\$p\\n"; exit 0 } setpgrp(0, 0); exec "sleep", @ARGV' \
        "\${STUB_SLEEP:-0}" >>"\$PIDS"
fi
sleep "\${STUB_SLEEP:-0}" &
echo \$! >>"\$PIDS"
wait \$!
exit "\${STUB_EXIT:-0}"
EOF
    chmod +x "$bin/$name"
done

# A launch-note stub: logs every call. start prints NOTE_ID (two lines when NOTE_TWO is set, an
# empty line when NOTE_ID is set empty) and exits NOTE_START_EXIT; transcript writes to stderr and
# exits NOTE_TRANSCRIPT_EXIT. The call NOTE_HANG names (start, after printing its id; end;
# transcript) hangs for 60 seconds with a child in a process group of its own, its pids recorded
# in NOTE_PIDS; with NOTE_IGNORE_TERM the hanging call and its children ignore TERM. start and end
# record in ALIVE whether the pid start was given is alive.
note="$test_root/note cmd"
cat >"$note" <<'EOF'
#!/bin/sh
{ printf 'note'; for a in "$@"; do printf '|%s' "$a"; done; printf '\n'; } >>"$CALLS"
hang() {
    [ "${NOTE_HANG:-}" = "$1" ] || return 0
    [ -z "${NOTE_IGNORE_TERM:-}" ] || trap '' TERM
    echo $$ >>"$NOTE_PIDS"
    perl -e 'setpgrp(0, 0); exec @ARGV' sleep 60 &
    echo $! >>"$NOTE_PIDS"
    sleep 60 &
    echo $! >>"$NOTE_PIDS"
    wait $!
}
case "$1" in
    start)
        while [ "$#" -gt 1 ]; do
            [ "$1" != --pid ] || printf '%s\n' "$2" >"$ALIVE.pid"
            shift
        done
        if kill -0 "$(cat "$ALIVE.pid")" 2>/dev/null; then echo "start: alive" >>"$ALIVE"; fi
        printf '%s\n' "${NOTE_ID-note-7}"
        [ -z "${NOTE_TWO:-}" ] || printf 'second-line\n'
        hang start
        exit "${NOTE_START_EXIT:-0}"
        ;;
    end)
        if [ -e "$NOTE_EXIT_FILE" ]; then printf 'exit file already written\n' >>"$CALLS"; fi
        if kill -0 "$(cat "$ALIVE.pid")" 2>/dev/null; then echo "end: alive" >>"$ALIVE"; fi
        hang end
        ;;
    transcript)
        printf 'transcript stderr\n' >&2
        hang transcript
        exit "${NOTE_TRANSCRIPT_EXIT:-0}"
        ;;
esac
EOF
chmod +x "$note"
# A perl on PATH that passes every call to the real one; with SLOW_DETACH set, the launch's call
# that starts the session leader returns one second late, so the builder is running by the time
# the launch goes on.
real_perl=$(command -v perl) || fail "no perl"
cat >"$bin/perl" <<EOF
#!/bin/sh
case "\${SLOW_DETACH:-}:\$1:\$2" in
    ?*:-e:*POSIX::setsid*)
        "$real_perl" "\$@"
        status=\$?
        sleep 1
        exit \$status
        ;;
esac
exec "$real_perl" "\$@"
EOF
chmod +x "$bin/perl"
# A python3 on PATH that passes every call to the real one and records in PY_LOG each start of the
# runner's session scanner through it.
real_python=$(command -v python3) || fail "no python3"
cat >"$bin/python3" <<EOF
#!/bin/sh
case "\$*" in
    *"for request in sys.stdin"*) printf 'scanner\n' >>"\$PY_LOG" ;;
esac
exec "$real_python" "\$@"
EOF
chmod +x "$bin/python3"
PY_LOG=$test_root/python.log
export PY_LOG
PATH="$bin:$PATH"
export PATH

cd "$test_root" || fail "could not enter the test root"
printf 'the prompt\n' >"$test_root/prompt"
# The allow file of every claude launch: two commands, the first with blanks around it, a blank
# line and a line of blanks between them, and no newline after the last one.
allow_file="$test_root/allow list"
printf '  sh a.sh \t\n\n   \ntail -1' >"$allow_file"
printf 'sh a.sh\n' >"$test_root/allow-words"
allowed='|--allowedTools|Bash(sh a.sh:*)|--allowedTools|Bash(tail -1:*)'

# Polling checks every 0.1 second where sleep takes fractions, every second otherwise, and gives
# up after 30 seconds either way (land_wait after five seconds of wall time).
if sleep 0.1 2>/dev/null; then
    tick=0.1
    max_ticks=300
else
    tick=1
    max_ticks=30
fi

# The stub settings for the next launch, exported so the detached process and its children see them.
settings() {
    STUB_EXIT=$1 STUB_SLEEP=$2 NOTE_ID=$3 NOTE_TWO=$4 NOTE_START_EXIT=$5 NOTE_TRANSCRIPT_EXIT=$6
    export STUB_EXIT STUB_SLEEP NOTE_ID NOTE_TWO NOTE_START_EXIT NOTE_TRANSCRIPT_EXIT
    unset STUB_IGNORE_TERM STUB_OWN_GROUP STUB_TRAP_CHILD STUB_SESSION_JOB NOTE_HANG SESSION_CHECK \
        SLOW_DETACH NOTE_IGNORE_TERM
}

# patched <name> <perl expression>: a copy of launch.sh in the scratch folder, changed by the
# expression run over the whole file, which must change it; sets patched_launch to its path.
patched() {
    patched_launch=$scratch/$1-launch.sh
    perl -0pe "$2" "$script_dir/launch.sh" >"$patched_launch" || fail "could not patch launch.sh for $1"
    ! cmp -s "$script_dir/launch.sh" "$patched_launch" || fail "the patch for $1 changed nothing"
}

# wait_until <description> <command...>: poll until the command succeeds.
wait_until() {
    what=$1
    shift
    tries=0
    until "$@"; do
        tries=$((tries + 1))
        [ "$tries" -le "$max_ticks" ] || fail "$what"
        sleep "$tick"
    done
}

wait_file() {
    wait_until "no file at $1" test -s "$1"
}

not_alive() {
    ! kill -0 "$1" 2>/dev/null
}

# expect_gone <what> <pid file>: every pid the file lists ends within the polling time.
expect_gone() {
    [ -f "$2" ] || return 0
    while read -r p; do
        wait_until "$1: process $p is still running" not_alive "$p"
    done <"$2"
}

# launch_into <name> <harness> [extra options...]: start a launch with its files named by <name>.
launch_into() {
    name=$1
    harness=$2
    shift 2
    d="$test_root/$name out"
    mkdir -p "$d"
    : >"$CALLS"
    : >"$PIDS"
    : >"$NOTE_PIDS"
    : >"$ALIVE"
    : >"$PY_LOG"
    NOTE_EXIT_FILE=$d/exit
    export NOTE_EXIT_FILE
    set -- "$harness" --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report" \
        --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid" "$@"
    if [ "$harness" = claude ]; then
        set -- "$@" --session-file "$d/session" --allow-file "$allow_file"
    else
        set -- "$@" --events "$d/events" --effort high
    fi
    sh "$launch" "$@" || fail "$name: launch.sh failed"
    [ -s "$d/pid" ] || fail "$name: no pid file"
    cat "$d/pid" >>"$scratch/launched"
}

run() {
    launch_into "$@"
    wait_file "$d/exit"
}

expect_calls() {
    got=$(cat "$CALLS")
    [ "$got" = "$1" ] || fail "$2: calls were
$got
expected
$1"
}

expect_file() {
    [ "$(cat "$1")" = "$2" ] || fail "$3: $1 holds $(cat "$1"), expected $2"
}

expect_in() {
    case "$(cat "$1")" in
        *"$2"*) ;;
        *) fail "$3: $1 holds $(cat "$1"), expected it to contain $2" ;;
    esac
}

start_call() {
    printf 'note|start|--launcher|plan-orchestration|--label|%s|--harness|%s|--model|m1' "$1" "$2"
    printf '|--parent|%s|--cwd|%s|--pid|%s' "$3" "$work" "$(cat "$d/pid")"
}

claude_call() {
    printf 'claude|%s|-p|--session-id|%s' "$work" "$(cat "$d/session")"
    printf '|--model|m1|--permission-mode|acceptEdits|--output-format|json%s' "$allowed"
}
codex_call() {
    printf 'codex|%s|exec|-C|%s|-s|workspace-write|%s-c|' "$test_root" "$work" "$1"
    printf 'model_reasoning_effort="high"|-m|m1|-o|%s|--json|-' "$d/report"
}

lines_at_least() {
    [ "$(wc -l <"$1")" -ge "$2" ]
}

# session_gone <session id>: no process is left in the session, found by session id with python3's
# os.getsid, since ps prints no session id on macOS.
session_gone() {
    python3 -B -c '
import os, subprocess, sys
sid = int(sys.argv[1])
out = subprocess.run(["ps", "-ax", "-o", "pid="], stdout=subprocess.PIPE, universal_newlines=True)
for word in out.stdout.split():
    try:
        if os.getsid(int(word)) == sid:
            sys.exit(1)
    except OSError:
        pass
' "$1"
}

# now_ms: the wall clock in milliseconds.
now_ms() {
    perl -MTime::HiRes=time -e 'printf "%d\n", time() * 1000'
}

# land_wait <what> <leader>: the land skill's check after its KILL: within five seconds, checked
# every tenth of a second, the leader is gone and the exit file is present; then no process is
# left in the leader's session.
land_wait() {
    deadline=$(($(now_ms) + 5000))
    until not_alive "$2" && [ -s "$d/exit" ]; do
        if [ "$(now_ms)" -gt "$deadline" ]; then
            not_alive "$2" || fail "$1: the session leader is still running after five seconds"
            fail "$1: no exit file five seconds after the KILL"
        fi
        sleep "$tick"
    done
    wait_until "$1: a process of the session is still running" session_gone "$2"
}

has_builder_call() {
    grep -q "^$1|" "$CALLS"
}

# No note: the recipes' exact arguments, the prompt on stdin, stdout and stderr redirected, the
# exit code kept.
settings 3 0 note-7 '' 0 0
run a0 claude
expect_calls "$(claude_call)" "claude without a note"
expect_file "$d/report" "the prompt" "claude without a note"
expect_file "$d/stderr" "claude stderr" "claude without a note"
expect_file "$d/exit" "exit 3" "claude without a note"

settings 5 0 note-7 '' 0 0
run c0 codex
expect_calls "$(codex_call '')" "codex without a note"
expect_file "$d/events" "the prompt" "codex without a note"
expect_file "$d/stderr" "codex stderr" "codex without a note"
expect_file "$d/exit" "exit 5" "codex without a note"

settings 0 0 note-7 '' 0 0
run c1 codex --network
expect_calls "$(codex_call '-c|sandbox_workspace_write.network_access=true|')" \
    "codex with the network setting"

# A resumed session: claude continues it with --resume and the session file receives that id;
# codex runs exec resume in the working directory, the sandbox set through -c, the session id and
# the stdin prompt last.
settings 6 0 note-7 '' 0 0
run a6 claude --resume sess-r
claude_resume_call="claude|$work|-p|--resume|sess-r|--model|m1|--permission-mode|acceptEdits"
claude_resume_call="$claude_resume_call|--output-format|json$allowed"
expect_calls "$claude_resume_call" "claude resuming a session"
expect_file "$d/report" "the prompt" "claude resuming a session"
expect_file "$d/exit" "exit 6" "claude resuming a session"
expect_file "$d/session" "sess-r" "claude resuming a session"

codex_resume_call() {
    printf 'codex|%s|exec|resume|-c|sandbox_mode="workspace-write"|%s-c|' "$work" "$1"
    printf 'model_reasoning_effort="high"|-m|m1|-o|%s|--json|thr-1|-' "$2"
}
settings 7 0 note-7 '' 0 0
run c3 codex --resume thr-1
expect_calls "$(codex_resume_call '' "$d/report")" "codex resuming a session"
expect_file "$d/events" "the prompt" "codex resuming a session"
expect_file "$d/stderr" "codex stderr" "codex resuming a session"
expect_file "$d/exit" "exit 7" "codex resuming a session"

settings 0 0 note-7 '' 0 0
run c4 codex --resume thr-1 --network
expect_calls "$(codex_resume_call '-c|sandbox_workspace_write.network_access=true|' "$d/report")" \
    "codex resuming a session with the network setting"

# A resumed run with a note is a record of its own: start, the builder, end.
settings 0 0 note-6 '' 0 0
run a7 claude --resume sess-r --note "$note" --id "$test_root/a7 out/id" --label 2.B/3 --parent sess-1
expect_calls "$(start_call 2.B/3 claude sess-1)
$claude_resume_call
note|end|note-6" "claude resuming a session with a note"

# A resumed codex run with a note: start with the codex harness, the resume, end; then transcript
# passes a rollout path to that codex record.
settings 0 0 note-8 '' 0 0
run c6 codex --resume thr-1 --note "$note" --id "$test_root/c6 out/id" --label 2.B/3 --parent sess-1
expect_calls "$(start_call 2.B/3 codex sess-1)
$(codex_resume_call '' "$d/report")
note|end|note-8" "codex resuming a session with a note"
: >"$CALLS"
sh "$launch" transcript --note "$note" --id "$d/id" "/rollout path/rollout-thr-1.jsonl" ||
    fail "transcript on a codex record failed"
expect_calls "note|transcript|note-8|/rollout path/rollout-thr-1.jsonl" "transcript on a codex record"

# Relative files resolve from the caller's directory for both harnesses, --cwd included, and reach
# the builder as absolute paths.
settings 0 0 note-7 '' 0 0
d="$test_root/rel-c out"
mkdir -p "$d"
: >"$CALLS"
sh "$launch" codex --cwd "work dir" --model m1 --prompt prompt --report "rel-c out/report" \
    --stderr "rel-c out/stderr" --exit "rel-c out/exit" --pid "rel-c out/pid" \
    --events "rel-c out/events" --effort high --resume thr-1 || fail "a relative codex resume failed"
cat "$d/pid" >>"$scratch/launched"
wait_file "$d/exit"
expect_calls "$(codex_resume_call '' "$d/report")" "a relative codex resume"
expect_file "$d/events" "the prompt" "a relative codex resume"
[ ! -e "$work/rel-c out" ] || fail "a relative codex resume wrote its files in the working directory"

settings 0 0 note-7 '' 0 0
d="$test_root/rel-f out"
mkdir -p "$d"
: >"$CALLS"
sh "$launch" codex --cwd "work dir" --model m1 --prompt prompt --report "rel-f out/report" \
    --stderr "rel-f out/stderr" --exit "rel-f out/exit" --pid "rel-f out/pid" \
    --events "rel-f out/events" --effort high || fail "a relative first codex run failed"
cat "$d/pid" >>"$scratch/launched"
wait_file "$d/exit"
expect_calls "$(codex_call '')" "a relative first codex run"

settings 4 0 note-5 '' 0 0
d="$test_root/rel-a out"
mkdir -p "$d" "$work/rel-a out"
: >"$CALLS"
NOTE_EXIT_FILE=$d/exit
export NOTE_EXIT_FILE
sh "$launch" claude --cwd "work dir" --model m1 --prompt prompt --report "rel-a out/report" \
    --stderr "rel-a out/stderr" --exit "rel-a out/exit" --pid "rel-a out/pid" \
    --session-file "rel-a out/session" --allow-file "allow list" --note "$note" \
    --id "rel-a out/id" \
    --label 2.B/7 --parent sess-5 || fail "a relative claude launch failed"
cat "$d/pid" >>"$scratch/launched"
wait_file "$d/exit"
expect_calls "$(start_call 2.B/7 claude sess-5)
$(claude_call)
note|end|note-5" "a relative claude launch"
expect_file "$d/report" "the prompt" "a relative claude launch"
expect_file "$d/stderr" "claude stderr" "a relative claude launch"
expect_file "$d/exit" "exit 4" "a relative claude launch"
expect_file "$d/id" "note-5" "a relative claude launch"
[ -z "$(ls "$work/rel-a out")" ] || fail "a relative claude launch wrote files in the working directory"

# An earlier run's exit file is gone once the launch returns, and the new run writes its own.
settings 5 1 note-7 '' 0 0
mkdir -p "$test_root/s1 out"
printf 'exit 0\n' >"$test_root/s1 out/exit"
launch_into s1 codex --resume thr-1
[ ! -e "$d/exit" ] || fail "an earlier run's exit file was still there after the launch"
wait_file "$d/exit"
expect_file "$d/exit" "exit 5" "a resume over an earlier run's exit file"

settings 0 1 note-7 '' 0 0
printf 'exit 9\n' >"$test_root/rel-s-exit"
printf 'exit 9\n' >"$work/rel-s-exit"
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report rel-s-report \
    --stderr rel-s-stderr --exit rel-s-exit --pid rel-s-pid --resume sess-r \
    --allow-file "allow list" ||
    fail "a relative stale launch failed"
cat rel-s-pid >>"$scratch/launched"
[ ! -e "$test_root/rel-s-exit" ] ||
    fail "an earlier run's relative exit file was still there after the launch"
[ -e "$work/rel-s-exit" ] || fail "a claude launch removed an exit file in its working directory"
wait_file "$test_root/rel-s-exit"
expect_file "$test_root/rel-s-exit" "exit 0" "a resume over an earlier run's relative exit file"

# An empty note is no note, and transcript with it does nothing.
settings 0 0 note-7 '' 0 0
run a1 claude --note '' --id "$test_root/a1 out/id" --label 2.B/2 --parent sess-0
expect_calls "$(claude_call)" "claude with an empty note"
expect_file "$d/exit" "exit 0" "claude with an empty note"
[ ! -e "$d/id" ] || fail "claude with an empty note: an id file was written"
: >"$CALLS"
sh "$launch" transcript --note '' --id "$d/id" /t || fail "transcript with an empty note failed"
expect_calls "" "transcript with an empty note"
settings 8 0 note-7 '' 0 0
run c5 codex --note '' --id "$test_root/c5 out/id" --label 2.B/2 --parent sess-0
expect_calls "$(codex_call '')" "codex with an empty note"
expect_file "$d/exit" "exit 8" "codex with an empty note"
[ ! -e "$d/id" ] || fail "codex with an empty note: an id file was written"

# A note: start with the launch's details and the session leader's pid, alive at start and at
# end, the builder, end with the id, and the leader gone once the exit file is written.
settings 4 0 note-7 '' 0 0
run a2 claude --note "$note" --id "$test_root/a2 out/id" --label 2.B/3 --parent sess-1
expect_calls "$(start_call 2.B/3 claude sess-1)
$(claude_call)
note|end|note-7" "claude with a note"
expect_file "$d/exit" "exit 4" "claude with a note"
expect_file "$ALIVE" "start: alive
end: alive" "the leader's pid at start and at end"
wait_until "the leader outlived its exit file" not_alive "$(cat "$d/pid")"
: >"$CALLS"
sh "$launch" transcript --note "$note" --id "$d/id" "/path with space/transcript" ||
    fail "transcript failed"
expect_calls "note|transcript|note-7|/path with space/transcript" "transcript"

# A transcript call that fails is ignored.
settings 0 0 note-7 '' 0 9
: >"$CALLS"
out=$(sh "$launch" transcript --note "$note" --id "$d/id" /t 2>&1) ||
    fail "a failing transcript call stopped launch.sh"
[ -z "$out" ] || fail "a failing transcript call printed: $out"

settings 2 0 note-7 '' 0 0
run c2 codex --note "$note" --id "$test_root/c2 out/id" --label 2.B/4 --parent sess-2
expect_calls "$(start_call 2.B/4 codex sess-2)
$(codex_call '')
note|end|note-7" "codex with a note"
expect_file "$d/exit" "exit 2" "codex with a note"

# start printing two lines: end and transcript get the first.
settings 0 0 note-8 1 0 0
run a3 claude --note "$note" --id "$test_root/a3 out/id" --label 2.B/6 --parent sess-4
expect_calls "$(start_call 2.B/6 claude sess-4)
$(claude_call)
note|end|note-8" "start printing two lines"

# start giving no id: no end, no transcript, the builder run and its exit code kept, whether start
# fails with nothing printed, fails after printing an id, or succeeds with an empty line.
for case_ in "fails|6|note-7|1" "prints then fails|7|note-9|1" "prints an empty line|8||0"; do
    label=${case_%%"|"*}
    rest=${case_#*"|"}
    code=${rest%%"|"*}
    rest=${rest#*"|"}
    id=${rest%%"|"*}
    start_exit=${rest#*"|"}
    if [ "$label" = fails ]; then
        settings "$code" 0 '' '' 1 0
    else
        settings "$code" 0 "$id" '' "$start_exit" 0
    fi
    run a4 claude --note "$note" --id "$test_root/a4 out/id" --label 2.B/5 --parent sess-3
    expect_calls "$(start_call 2.B/5 claude sess-3)
$(claude_call)" "claude when start $label"
    expect_file "$d/exit" "exit $code" "claude when start $label"
    : >"$CALLS"
    sh "$launch" transcript --note "$note" --id "$d/id" /t || fail "transcript when start $label failed"
    expect_calls "" "transcript when start $label"
    rm -rf "$d"
done

# A note command that cannot run makes no record: the builder runs, and no end follows.
settings 0 0 note-7 '' 0 0
printf '#!/bin/sh\nexit 0\n' >"$test_root/plain note"
run noexec claude --note "$test_root/plain note" --id "$test_root/noexec out/id" --label 2.B/5 \
    --parent sess-3
expect_calls "$(claude_call)" "a note command that cannot run"
expect_file "$d/exit" "exit 0" "a note command that cannot run"
[ ! -s "$d/id" ] || fail "a note command that cannot run: the id file holds $(cat "$d/id")"

# A builder killed by a signal: the exit file says 128 plus the signal number, and end follows.
settings 0 60 note-7 '' 0 0
launch_into killed claude --note "$note" --id "$test_root/killed out/id" --label 2.B/5 --parent sess-3
wait_until "killed: the builder never recorded its pids" lines_at_least "$PIDS" 2
while read -r p; do
    kill -KILL "$p"
done <"$PIDS"
wait_file "$d/exit"
expect_file "$d/exit" "exit 137" "a builder killed by a signal"
expect_calls "$(start_call 2.B/5 claude sess-3)
$(claude_call)
note|end|note-7" "a builder killed by a signal"

# The launch returns while the builder runs, and the pid in the pid file leads a session of its
# own: its process group is its own pid, not the caller's.
settings 0 1 note-7 '' 0 0
launch_into a5 claude
[ ! -e "$d/exit" ] || fail "the launch waited for its builder"
leader=$(cat "$d/pid")
kill -0 "$leader" 2>/dev/null || fail "the session leader was gone right after the launch"
group=$(ps -o pgid= -p "$leader" | tr -d ' ')
[ "$group" = "$leader" ] ||
    fail "the pid file's process $leader is in process group $group, not its own"
wait_file "$d/exit"
expect_file "$d/exit" "exit 0" "a builder in a session of its own"

# The land skill's sequence with the leader still alive at two seconds, held by a note whose end
# hangs on the signal path: the KILL reaches the leader, and no process of the builder or of the
# note is left, and the exit file is present.
settings 0 60 note-7 '' 0 0
STUB_IGNORE_TERM=1 STUB_OWN_GROUP=1 NOTE_HANG=end
export STUB_IGNORE_TERM STUB_OWN_GROUP NOTE_HANG
launch_into land-kill claude --note "$note" --id "$test_root/land-kill out/id" --label 2.B/8 \
    --parent sess-6
wait_until "land sequence with KILL: the builder never recorded its pids" lines_at_least "$PIDS" 3
leader=$(cat "$d/pid")
kill -TERM "$leader" || fail "land sequence with KILL: could not send TERM"
sleep 2
kill -0 "$leader" 2>/dev/null || fail "land sequence with KILL: the leader was gone before the KILL"
kill -KILL "$leader"
land_wait "land sequence with KILL" "$leader"
expect_file "$d/exit" "exit 143" "land sequence with KILL"
expect_gone "land sequence with KILL" "$PIDS"
expect_gone "land sequence with KILL, the note" "$NOTE_PIDS"

# TERM, INT and HUP to the pid: the builder and its children end, the exit file says 128 plus the
# signal number, and end follows the exit file.
for pair in TERM:143 INT:130 HUP:129; do
    sig=${pair%%:*}
    code=${pair#*:}
    settings 0 60 note-7 '' 0 0
    launch_into "sig-$sig" claude --note "$note" --id "$test_root/sig-$sig out/id" --label 2.B/8 \
        --parent sess-6
    wait_until "$sig: the builder never started" has_builder_call claude
    wait_until "$sig: the builder never recorded its pids" lines_at_least "$PIDS" 2
    kill -s "$sig" "$(cat "$d/pid")" || fail "$sig: could not signal the session leader"
    wait_file "$d/exit"
    wait_until "$sig: the session leader is still running" not_alive "$(cat "$d/pid")"
    expect_file "$d/exit" "exit $code" "$sig to the session leader"
    expect_calls "$(start_call 2.B/8 claude sess-6)
$(claude_call)
note|end|note-7
exit file already written" "$sig to the session leader"
    expect_gone "$sig to the session leader" "$PIDS"
    # The runner leaves itself out of its session sweep: a runner that sent itself KILL is reported
    # by the leader's shell on the stderr file as a killed "run_claude" job.
    ! grep -q 'run_' "$d/stderr" ||
        fail "$sig to the session leader: the runner stopped itself: $(cat "$d/stderr")"
done

# The land skill's sequence against a builder that ignores TERM and has a child in a process group
# of its own: TERM, then KILL two seconds later if the pid is still alive, then the land skill's
# wait for the pid to be gone and the exit file present. Whether the KILL finds the leader alive
# depends on how long its stop takes, which a loaded machine stretches past two seconds.
settings 0 60 note-7 '' 0 0
STUB_IGNORE_TERM=1 STUB_OWN_GROUP=1
export STUB_IGNORE_TERM STUB_OWN_GROUP
launch_into land-seq claude
wait_until "land sequence: the builder never recorded its pids" lines_at_least "$PIDS" 3
leader=$(cat "$d/pid")
kill -TERM "$leader" || fail "land sequence: could not send TERM"
sleep 2
if kill -0 "$leader" 2>/dev/null; then
    kill -KILL "$leader"
fi
land_wait "land sequence" "$leader"
expect_gone "land sequence" "$PIDS"
expect_file "$d/exit" "exit 143" "land sequence"

# A descendant of the builder outside its process group gets TERM before the KILL.
settings 0 60 note-7 '' 0 0
STUB_TRAP_CHILD=1 TERM_LOG=$test_root/term.log
export STUB_TRAP_CHILD TERM_LOG
: >"$TERM_LOG"
launch_into trap-child claude
wait_until "trap child: the builder never recorded its pids" lines_at_least "$PIDS" 3
kill -TERM "$(cat "$d/pid")"
wait_file "$d/exit"
expect_gone "trap child" "$PIDS"
expect_in "$TERM_LOG" "TERM" "a descendant outside the builder's group"

# A process of the leader's session that is neither in the builder's group nor descended from it
# (its parent has exited) ends on TERM to the leader.
settings 0 60 note-7 '' 0 0
STUB_SESSION_JOB=1
export STUB_SESSION_JOB
launch_into session-job claude
wait_until "session job: the builder never recorded its pids" lines_at_least "$PIDS" 3
kill -TERM "$(cat "$d/pid")"
wait_file "$d/exit"
expect_file "$d/exit" "exit 143" "a job of the leader's session"
expect_gone "a job of the leader's session" "$PIDS"

# KILL to the leader alone: the builder's runner sees its parent gone, stops every process of the
# session within about a second and writes the exit file, exit 137.
settings 0 60 note-7 '' 0 0
launch_into leader-killed claude
wait_until "leader killed: the builder never recorded its pids" lines_at_least "$PIDS" 2
leader=$(cat "$d/pid")
began=$(date +%s)
kill -KILL "$leader"
expect_gone "KILL to the leader alone" "$PIDS"
took=$(($(date +%s) - began))
[ "$took" -le 3 ] || fail "KILL to the leader alone: the builder ran on for $took seconds"
land_wait "KILL to the leader alone" "$leader"
expect_file "$d/exit" "exit 137" "KILL to the leader alone"

# KILL to the leader alone while the builder ignores TERM and has a child in a process group of its
# own: the runner's stop ends them with KILL after its grace, and the exit file says exit 137.
settings 0 60 note-7 '' 0 0
STUB_IGNORE_TERM=1 STUB_OWN_GROUP=1
export STUB_IGNORE_TERM STUB_OWN_GROUP
launch_into leader-killed-hard claude
wait_until "leader killed, TERM ignored: the builder never recorded its pids" \
    lines_at_least "$PIDS" 3
leader=$(cat "$d/pid")
kill -KILL "$leader"
land_wait "KILL to the leader alone, TERM ignored" "$leader"
expect_gone "KILL to the leader alone, TERM ignored" "$PIDS"
expect_file "$d/exit" "exit 137" "KILL to the leader alone, TERM ignored"
# The launch resolves python3 to its interpreter once, so the session scanner starts without a
# wrapper on PATH (a version manager's shim can take seconds on a loaded machine).
[ ! -s "$PY_LOG" ] ||
    fail "KILL to the leader alone, TERM ignored: the scanner started through python3 on PATH"

# The land skill's sequence when the runner's stop takes longer than two seconds (widened by a
# sleep in a patched copy), so the KILL always finds the leader waiting on the runner: the runner
# writes the exit file itself once it has stopped the builder, with the code of the signal the
# leader passed on to it (TERM 143, INT 130).
patched slow-stop \
    's/(\nsub stop \{\n.*?\n)/$1    Time::HiRes::sleep(2.5) if \$limit == 0;\n/'
for pair in TERM:143 INT:130; do
    sig=${pair%%:*}
    code=${pair#*:}
    settings 0 60 note-7 '' 0 0
    STUB_IGNORE_TERM=1 STUB_OWN_GROUP=1
    export STUB_IGNORE_TERM STUB_OWN_GROUP
    launch=$patched_launch
    launch_into "slow-stop-$sig" claude
    launch=$script_dir/launch.sh
    wait_until "slow stop, $sig: the builder never recorded its pids" lines_at_least "$PIDS" 3
    leader=$(cat "$d/pid")
    kill -s "$sig" "$leader" || fail "slow stop, $sig: could not signal the session leader"
    sleep 2
    kill -0 "$leader" 2>/dev/null || fail "slow stop, $sig: the leader was gone before the KILL"
    kill -KILL "$leader"
    land_wait "land sequence with a slow stop, $sig" "$leader"
    expect_gone "land sequence with a slow stop, $sig" "$PIDS"
    expect_file "$d/exit" "exit $code" "land sequence with a slow stop, $sig"
done

# The builder ends while the leader is being killed, and the runner finds both at once (its first
# look delayed by a sleep in a patched copy): the exit file holds the builder's own code.
patched late-look \
    's/(\nmy \$start = Time::HiRes::time\(\);\n)/$1Time::HiRes::sleep(2) if \$limit == 0;\n/'
settings 3 1 note-7 '' 0 0
launch=$patched_launch
launch_into late-look claude
launch=$script_dir/launch.sh
wait_until "late look: the builder never recorded its pids" lines_at_least "$PIDS" 2
leader=$(cat "$d/pid")
kill -KILL "$leader"
land_wait "the builder ended as the leader was killed" "$leader"
expect_file "$d/exit" "exit 3" "the builder ended as the leader was killed"

# An exit file the leader has written is never replaced by the runner: a patched copy writes exit 5
# as soon as the builder starts, and KILL to the leader then leaves exit 5.
patched keep-exit 's/(\n    "run_\$harness" &\n    spawned "\$!"\n)/$1    write_exit 5\n/'
settings 0 60 note-7 '' 0 0
launch=$patched_launch
launch_into keep-exit claude
launch=$script_dir/launch.sh
wait_until "keep exit: the builder never recorded its pids" lines_at_least "$PIDS" 2
wait_file "$d/exit"
leader=$(cat "$d/pid")
kill -KILL "$leader"
expect_gone "an exit file the leader wrote" "$PIDS"
wait_until "an exit file the leader wrote: a process of the session is still running" \
    session_gone "$leader"
expect_file "$d/exit" "exit 5" "an exit file the leader wrote"

# TERM and then KILL to the leader while the note's end hangs, ignoring TERM, after the builder
# ended: the leader writes the builder's code to the exit file before it stops end, so the KILL,
# arriving during that stop, still leaves the exit file.
settings 0 0 note-7 '' 0 0
NOTE_HANG=end NOTE_IGNORE_TERM=1
export NOTE_HANG NOTE_IGNORE_TERM
launch_into end-kill claude --note "$note" --id "$test_root/end-kill out/id" --label 2.B/9 \
    --parent sess-7
wait_until "end kill: end never hung" lines_at_least "$NOTE_PIDS" 3
leader=$(cat "$d/pid")
kill -TERM "$leader" || fail "end kill: could not send TERM"
sleep "$tick"
kill -KILL "$leader" 2>/dev/null
land_wait "TERM and KILL while end hangs" "$leader"
expect_file "$d/exit" "exit 0" "TERM and KILL while end hangs"
expect_gone "TERM and KILL while end hangs" "$NOTE_PIDS"

# TERM and then KILL to the leader while the note's start hangs, ignoring TERM: no builder ran, the
# start call's runner stops the note once the leader is gone and writes no exit file.
settings 0 0 note-7 '' 0 0
NOTE_HANG=start NOTE_IGNORE_TERM=1
export NOTE_HANG NOTE_IGNORE_TERM
launch_into start-kill claude --note "$note" --id "$test_root/start-kill out/id" --label 2.B/9 \
    --parent sess-7
wait_until "start kill: start never hung" lines_at_least "$NOTE_PIDS" 3
leader=$(cat "$d/pid")
kill -TERM "$leader" || fail "start kill: could not send TERM"
sleep "$tick"
kill -KILL "$leader" 2>/dev/null
wait_until "TERM and KILL while start hangs: the session leader is still running" \
    not_alive "$leader"
expect_gone "TERM and KILL while start hangs" "$NOTE_PIDS"
wait_until "TERM and KILL while start hangs: a process of the session is still running" \
    session_gone "$leader"
[ ! -e "$d/exit" ] || fail "TERM and KILL while start hangs: the start call wrote $(cat "$d/exit")"
expect_calls "$(start_call 2.B/9 claude sess-7)" "TERM and KILL while start hangs"

# A signal while the builder is being started, before the leader has recorded its pid (the window
# widened by a sleep at the top of spawned in a patched copy): the builder is stopped once its pid
# is known, and the exit file written. The builder ignores TERM, so it is still running at the
# exit file unless the leader stopped it before writing that file.
patched spawn-window 's/(\nspawned\(\) \{\n)/$1    sleep 3\n/'
settings 0 60 note-7 '' 0 0
STUB_IGNORE_TERM=1
export STUB_IGNORE_TERM
launch=$patched_launch
launch_into spawn-window claude
launch=$script_dir/launch.sh
wait_until "spawn window: the builder never recorded its pids" lines_at_least "$PIDS" 2
kill -TERM "$(cat "$d/pid")"
wait_file "$d/exit"
not_alive "$(head -n 1 "$PIDS")" ||
    fail "TERM while the builder is being started: the builder ran on after the exit file was written"
wait_until "spawn window: the session leader is still running" not_alive "$(cat "$d/pid")"
expect_file "$d/exit" "exit 143" "TERM while the builder is being started"
expect_gone "TERM while the builder is being started" "$PIDS"

# The same window for the note's start: a start that hangs and ignores TERM is stopped, with its
# processes, before the exit file is written, and no builder starts.
patched start-window 's/(\nspawned\(\) \{\n)/$1    sleep 3\n/'
settings 0 0 note-7 '' 0 0
NOTE_HANG=start NOTE_IGNORE_TERM=1
export NOTE_HANG NOTE_IGNORE_TERM
launch=$patched_launch
launch_into start-window claude --note "$note" --id "$test_root/start-window out/id" --label 2.B/9 \
    --parent sess-7
launch=$script_dir/launch.sh
wait_until "start window: start never hung" lines_at_least "$NOTE_PIDS" 3
kill -TERM "$(cat "$d/pid")"
wait_file "$d/exit"
while read -r p; do
    not_alive "$p" ||
        fail "TERM while start is being started: note process $p ran on after the exit file was written"
done <"$NOTE_PIDS"
expect_file "$d/exit" "exit 143" "TERM while start is being started"
expect_calls "$(start_call 2.B/9 claude sess-7)" "TERM while start is being started"
[ ! -s "$d/id" ] || fail "TERM while start is being started: the id file holds $(cat "$d/id")"

# A signal that reaches the builder's runner after it has forked the builder and before its next
# step (the window widened by a sleep in a patched copy): the runner still stops the builder, which
# ignores TERM, before the exit file is written.
patched runner-window 's/(\nsetpgrp\(\$pid, \$pid\);\n)/$1Time::HiRes::sleep(3) if \$limit == 0;\n/'
settings 0 60 note-7 '' 0 0
STUB_IGNORE_TERM=1
export STUB_IGNORE_TERM
launch=$patched_launch
launch_into runner-window claude
launch=$script_dir/launch.sh
wait_until "runner window: the builder never recorded its pids" lines_at_least "$PIDS" 2
kill -TERM "$(cat "$d/pid")"
wait_file "$d/exit"
not_alive "$(head -n 1 "$PIDS")" ||
    fail "TERM while the runner starts the builder: the builder ran on after the exit file was written"
expect_file "$d/exit" "exit 143" "TERM while the runner starts the builder"
expect_gone "TERM while the runner starts the builder" "$PIDS"

# A note that hangs: each call stopped after 3 seconds with its processes, the builder run and the
# exit file written; a stopped start gives no id, so no end and no transcript follow.
settings 3 0 note-7 '' 0 0
NOTE_HANG=start
export NOTE_HANG
began=$(date +%s)
run hang-start claude --note "$note" --id "$test_root/hang-start out/id" --label 2.B/9 --parent sess-7
took=$(($(date +%s) - began))
[ "$took" -le 6 ] || fail "a hanging start held the exit file for $took seconds"
expect_calls "$(start_call 2.B/9 claude sess-7)
$(claude_call)" "a hanging start"
expect_file "$d/exit" "exit 3" "a hanging start"
[ ! -s "$d/id" ] || fail "a hanging start: the id file holds $(cat "$d/id")"
expect_in "$d/stderr" "the launch note's start call did not return within 3 seconds and was stopped" \
    "a hanging start"
expect_gone "a hanging start" "$NOTE_PIDS"
: >"$CALLS"
sh "$launch" transcript --note "$note" --id "$d/id" /t || fail "transcript after a hanging start failed"
expect_calls "" "transcript after a hanging start"

# TERM while start hangs: the call is stopped with its processes by the time the session leader
# is gone, no builder starts, the exit file says 143, and no end follows.
settings 0 0 note-7 '' 0 0
NOTE_HANG=start
export NOTE_HANG
launch_into hang-term claude --note "$note" --id "$test_root/hang-term out/id" --label 2.B/9 \
    --parent sess-7
wait_until "hang-term: start never hung" lines_at_least "$NOTE_PIDS" 2
kill -TERM "$(cat "$d/pid")"
wait_until "hang-term: the session leader is still running" not_alive "$(cat "$d/pid")"
while read -r p; do
    not_alive "$p" || fail "TERM while start hangs: note process $p outlived the session leader"
done <"$NOTE_PIDS"
expect_file "$d/exit" "exit 143" "TERM while start hangs"
expect_calls "$(start_call 2.B/9 claude sess-7)" "TERM while start hangs"
[ ! -s "$d/id" ] || fail "TERM while start hangs: the id file holds $(cat "$d/id")"

settings 0 0 note-7 '' 0 0
NOTE_HANG=end
export NOTE_HANG
began=$(date +%s)
run hang-end claude --note "$note" --id "$test_root/hang-end out/id" --label 2.B/9 --parent sess-7
took=$(($(date +%s) - began))
[ "$took" -le 6 ] || fail "a hanging end held the exit file for $took seconds"
expect_file "$d/exit" "exit 0" "a hanging end"
expect_calls "$(start_call 2.B/9 claude sess-7)
$(claude_call)
note|end|note-7" "a hanging end"
expect_gone "a hanging end" "$NOTE_PIDS"

settings 0 0 note-7 '' 0 0
NOTE_HANG=transcript
export NOTE_HANG
: >"$CALLS"
began=$(date +%s)
out=$(sh "$launch" transcript --note "$note" --id "$d/id" /t 2>&1) ||
    fail "a hanging transcript stopped launch.sh"
took=$(($(date +%s) - began))
[ "$took" -le 6 ] || fail "a hanging transcript held its caller for $took seconds"
expect_calls "note|transcript|note-7|/t" "a hanging transcript"
case "$out" in
    *"the launch note's transcript call did not return within 3 seconds and was stopped"*) ;;
    *) fail "a hanging transcript printed $out" ;;
esac
expect_gone "a hanging transcript" "$NOTE_PIDS"

# A second launch while the first runs is refused before anything starts: exit 75, the pid named,
# the first launch's files untouched.
settings 0 2 note-7 '' 0 0
launch_into twice claude
first_pid=$(cat "$d/pid")
first_session=$(cat "$d/session")
wait_until "twice: the builder never started" has_builder_call claude
out=$(sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report2" \
    --stderr "$d/stderr2" --exit "$d/exit" --pid "$d/pid" --session-file "$d/session" \
    --allow-file "$allow_file" 2>&1)
status=$?
[ "$status" -eq 75 ] || fail "a second launch exited $status, expected 75"
case "$out" in
    *"names pid $first_pid, which is still running; not launched"*) ;;
    *) fail "a second launch printed $out" ;;
esac
expect_file "$d/pid" "$first_pid" "a second launch"
expect_file "$d/session" "$first_session" "a second launch"
[ ! -e "$d/stderr2" ] || fail "a second launch wrote its stderr file"
[ "$(grep -c '^claude|' "$CALLS")" -eq 1 ] || fail "a second launch started a builder"
wait_file "$d/exit"

# A lock held by a live launch refuses with exit 75, naming its pid.
perl -MFcntl=:flock -e 'open my $f, "+>>", $ARGV[0] or die; flock($f, LOCK_EX) or die;
    truncate $f, 0; print $f "$$\n"; $f->flush; sleep 30' "$d/pid.lock" &
holder=$!
echo "$holder" >>"$scratch/launched"
holds_lock() {
    [ "$(cat "$d/pid.lock" 2>/dev/null)" = "$holder" ]
}
wait_until "the lock holder never wrote its pid" holds_lock
out=$(sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report" \
    --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid" --allow-file "$allow_file" 2>&1)
status=$?
kill "$holder"
wait "$holder" 2>/dev/null
[ "$status" -eq 75 ] || fail "a launch with the lock held exited $status, expected 75"
case "$out" in
    *"another launch (pid $holder) holds $d/pid.lock; not launched"*) ;;
    *) fail "a launch with the lock held printed $out" ;;
esac

# A launch writes its own pid into the lock file: the pid of the launch.sh process started here.
settings 0 0 note-7 '' 0 0
mkdir -p "$test_root/lockpid out"
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" \
    --report "$test_root/lockpid out/report" --stderr "$test_root/lockpid out/stderr" \
    --exit "$test_root/lockpid out/exit" --pid "$test_root/lockpid out/pid" \
    --allow-file "$allow_file" &
lock_launcher=$!
wait "$lock_launcher" || fail "the lock pid launch failed"
cat "$test_root/lockpid out/pid" >>"$scratch/launched"
expect_file "$test_root/lockpid out/pid.lock" "$lock_launcher" "the lock file after a launch"
wait_file "$test_root/lockpid out/exit"

# A lock file left by a launcher that died, naming its dead pid, is taken over.
settings 0 0 note-7 '' 0 0
dead=$(sh -c 'echo $$')
printf '%s\n' "$dead" >"$d/pid.lock"
launch_into twice claude
wait_file "$d/exit"
expect_file "$d/exit" "exit 0" "a lock left by a dead launcher"

# A pid file that names no live process does not refuse: empty, not a number, 0, a dead pid.
dead=$(sh -c 'echo $$')
for old in '' abc 0 "$dead"; do
    settings 0 0 note-7 '' 0 0
    mkdir -p "$test_root/stale out"
    printf '%s\n' "$old" >"$test_root/stale out/pid"
    run stale claude
    expect_file "$d/exit" "exit 0" "a pid file holding '$old'"
done

# Two launches started together: one runs, the other is refused.
settings 0 1 note-7 '' 0 0
mkdir -p "$test_root/pair out"
: >"$CALLS"
for n in 1 2; do
    (
        p="$test_root/pair out"
        sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$p/report" \
            --stderr "$p/stderr$n" --exit "$p/exit" --pid "$p/pid" --allow-file "$allow_file" \
            >/dev/null 2>&1
        echo $? >"$test_root/pair out/status$n"
    ) &
done
wait
cat "$test_root/pair out/pid" >>"$scratch/launched"
statuses=$(cat "$test_root/pair out/status1" "$test_root/pair out/status2" | sort | tr '\n' ' ')
[ "$statuses" = "0 75 " ] || fail "two launches together exited $statuses, expected 0 and 75"
wait_file "$test_root/pair out/exit"
started=$(grep -c '^claude|' "$CALLS")
[ "$started" -eq 1 ] || fail "two launches together started $started builders"

# The body's own errors reach the stderr file: a prompt that does not exist, a --cwd that does not.
settings 0 0 note-7 '' 0 0
d="$test_root/err out"
mkdir -p "$d"
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/no such prompt" --report "$d/report" \
    --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid2" --allow-file "$allow_file" ||
    fail "a launch with a missing prompt failed"
cat "$d/pid2" >>"$scratch/launched"
wait_file "$d/exit"
expect_in "$d/stderr" "no such prompt" "a missing prompt"
[ "$(cat "$d/exit")" != "exit 0" ] || fail "a missing prompt: the exit file says exit 0"
settings 0 0 note-7 '' 0 0
: >"$CALLS"
sh "$launch" codex --cwd "$test_root/no such dir" --model m1 --prompt "$test_root/prompt" \
    --report "$d/report" --stderr "$d/stderr3" --exit "$d/exit3" --pid "$d/pid3" --events "$d/events" \
    --effort high --resume thr-1 ||
    fail "a launch with a missing --cwd failed"
cat "$d/pid3" >>"$scratch/launched"
wait_file "$d/exit3"
expect_in "$d/stderr3" "no such dir" "a missing --cwd"
expect_calls "" "a missing --cwd"
# A detached process that writes the pid file and ends at once is a launch, not a failure, even
# when it ends between the launch's read of the pid file and its check for an ended process (that
# window widened by a sleep in a patched copy).
patched quick-end 's/(\n    exit 1 if )/\n    Time::HiRes::sleep(0.5);$1/'
sh "$patched_launch" codex --cwd "$test_root/no such dir" --model m1 --prompt "$test_root/prompt" \
    --report "$d/report" --stderr "$d/stderr5" --exit "$d/exit5" --pid "$d/pid5" \
    --events "$d/events" --effort high --resume thr-1 ||
    fail "a detached process that ends right after writing the pid file failed the launch"
cat "$d/pid5" >>"$scratch/launched"
wait_file "$d/exit5"
out=$(sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report" \
    --stderr "$test_root/no such dir/stderr" --exit "$d/exit4" --pid "$d/pid4" \
    --allow-file "$allow_file" 2>&1)
status=$?
[ "$status" -eq 1 ] || fail "a stderr file that cannot be written exited $status, expected 1"
[ ! -s "$d/pid4" ] || fail "a stderr file that cannot be written: a builder was started"

# The session id: written before the builder starts (the launch held back after the start, so a
# write after it comes too late), passed with --session-id, a UUID, a new one per launch, and
# passed even with no --session-file.
settings 0 0 note-7 '' 0 0
SESSION_CHECK="$test_root/sid out/session" SLOW_DETACH=1
export SESSION_CHECK SLOW_DETACH
run sid claude
sid=$(cat "$d/session")
uuid='^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'
printf '%s\n' "$sid" | grep -Eq "$uuid" || fail "the session id $sid is not a version 4 UUID"
expect_calls "$(claude_call)
session file|$sid" "the session id before the builder"
settings 0 0 note-7 '' 0 0
run sid claude
[ "$(cat "$d/session")" != "$sid" ] || fail "two launches got the same session id $sid"
settings 0 0 note-7 '' 0 0
: >"$CALLS"
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report" \
    --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid" --allow-file "$allow_file" ||
    fail "a launch with no session file failed"
cat "$d/pid" >>"$scratch/launched"
wait_file "$d/exit"
got=$(sed -n 's/^claude|[^|]*|-p|--session-id|\([0-9a-f-]\{36\}\)|--model|.*/\1/p' "$CALLS")
[ -n "$got" ] || fail "a launch with no session file passed no session id: $(cat "$CALLS")"

# The exit file is moved into place: a link put where the exit file goes is replaced, and the file
# it points at is left as it was.
settings 0 1 note-7 '' 0 0
launch_into rename claude
printf 'sentinel\n' >"$d/target"
ln -s "$d/target" "$d/exit"
wait_until "the exit file was written through the link, not moved into place" test ! -L "$d/exit"
expect_file "$d/exit" "exit 0" "the exit file moved into place"
expect_file "$d/target" "sentinel" "the exit file moved into place"
[ ! -e "$d/exit.tmp" ] || fail "the exit file's temporary file was left behind"

# Each usage error exits 64 and names what is wrong. usage_error <message> <arguments>: the
# arguments are split on spaces. A launch with no arguments prints the usage text alone, so its
# output starts with it.
usage_error() {
    want=$1
    # shellcheck disable=SC2086
    out=$(sh "$launch" $2 2>&1)
    status=$?
    [ "$status" -eq 64 ] || fail "usage error '$2' exited $status, expected 64"
    case "$out" in
        *"$want"*) ;;
        *) fail "usage error '$2' printed $out, expected $want" ;;
    esac
}
full="--cwd x --model m --prompt p --report r --stderr s --exit e --pid p"
claude_full="$full --allow-file allow-words"
out=$(sh "$launch" 2>&1)
status=$?
[ "$status" -eq 64 ] || fail "a launch with no arguments exited $status, expected 64"
case "$out" in
    Usage:*"--session-file <file>"*"--allow-file <file>"*) ;;
    *) fail "a launch with no arguments printed $out, expected the usage text alone" ;;
esac
[ "$(printf '%s\n' "$out" | grep -c -e '--label <entry>/<step>')" -eq 2 ] ||
    fail "the usage text does not name --label <entry>/<step> for both harnesses: $out"
usage_error "unknown mode bogus" "bogus"
usage_error "--cwd needs a value" "claude --cwd"
usage_error "unknown option --bogus" "claude --bogus x"
usage_error "unknown option --session-id" "claude $full --session-id x"
usage_error "unexpected argument stray" "claude $full stray"
usage_error "unexpected argument /b" "transcript --note /n --id x /a /b"
usage_error "--note must be an absolute path" "claude $full --note n --id i --label l --parent p"
usage_error "--note must be an absolute path" "transcript --note n --id x /t"
for name in cwd model prompt report stderr exit pid; do
    args=$(printf '%s\n' "$full" | sed "s/--$name [^ ]*//")
    usage_error "--$name is required" "claude $args"
done
usage_error "--events is required for codex" "codex $full --effort high"
usage_error "--effort is required for codex" "codex $full --events v"
usage_error "--session-file is for claude only" "codex $full --events v --effort high --session-file f"
usage_error "--allow-file is for claude only" \
    "codex $full --events v --effort high --allow-file allow-words"
usage_error "--events is for codex only" "claude $full --events v"
usage_error "--effort is for codex only" "claude $full --effort high"
usage_error "--network is for codex only" "claude $full --network"
usage_error "--id is required with --note" "claude $claude_full --note /n --label l --parent p"
usage_error "--label is required with --note" "claude $claude_full --note /n --id i --parent p"
usage_error "--parent is required with --note" "claude $claude_full --note /n --id i --label l"
for name in cwd model prompt report stderr exit pid events effort label parent resume session-file \
    allow-file; do
    usage_error "--$name is not a transcript option" "transcript --$name v /t"
done
usage_error "--network is not a transcript option" "transcript --network /t"
usage_error "--id is required with --note" "transcript --note /n /t"
usage_error "the transcript path is required" "transcript --note /n --id x"
usage_error "--resume needs a value" "claude $full --resume"
usage_error "--resume needs a session id, not --last" "claude $full --resume --last"
# shellcheck disable=SC2086
out=$(sh "$launch" claude $full --resume '' 2>&1)
status=$?
[ "$status" -eq 64 ] || fail "an empty --resume exited $status, expected 64"
case "$out" in
    *"--resume needs a session id, not an empty value"*) ;;
    *) fail "an empty --resume printed $out" ;;
esac
# shellcheck disable=SC2086
out=$(sh "$launch" claude $full --session-file '' 2>&1)
status=$?
[ "$status" -eq 64 ] || fail "an empty --session-file exited $status, expected 64"
case "$out" in
    *"--session-file needs a file name, not an empty value"*) ;;
    *) fail "an empty --session-file printed $out" ;;
esac

# A claude launch whose allow file is left out or cannot give a command is refused with exit 64 and
# the usage text before anything starts: no stderr, pid, lock or session file is written and no
# builder runs. refused_launch <case> <message> [extra options...]. Red when --allow-file is not
# required for claude, or when the file is not checked before the launch goes on.
refused_launch() {
    what=$1
    want=$2
    shift 2
    d="$test_root/refused out"
    rm -rf "$d"
    mkdir -p "$d"
    : >"$CALLS"
    out=$(sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" \
        --report "$d/report" --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid" \
        --session-file "$d/session" "$@" 2>&1)
    status=$?
    [ "$status" -eq 64 ] || fail "$what: exited $status, expected 64: $out"
    case "$out" in
        *"$want"*Usage:*) ;;
        *) fail "$what: printed $out, expected $want and the usage text" ;;
    esac
    for f in stderr pid pid.lock session exit; do
        [ ! -e "$d/$f" ] || fail "$what: the launch wrote $d/$f"
    done
    expect_calls "" "$what"
}
settings 0 0 note-7 '' 0 0
refused_launch "claude without --allow-file" "--allow-file is required for claude"
refused_launch "claude with --allow-file empty" \
    "--allow-file needs a file name, not an empty value" \
    --allow-file ''
refused_launch "an allow file that does not exist" \
    "--allow-file names no readable file: $test_root/no such allow list" \
    --allow-file "$test_root/no such allow list"
refused_launch "a relative allow file that does not exist, named from the caller's directory" \
    "--allow-file names no readable file: $test_root/no such allow list" \
    --allow-file "no such allow list"
refused_launch "an allow file that is a directory" "--allow-file names no readable file: $work" \
    --allow-file "$work"
printf '\n  \n\t\n' >"$test_root/blank allow list"
refused_launch "an allow file of blank lines" \
    "--allow-file names a file with no command: $test_root/blank allow list" \
    --allow-file "$test_root/blank allow list"
: >"$test_root/empty allow list"
refused_launch "an empty allow file" \
    "--allow-file names a file with no command: $test_root/empty allow list" \
    --allow-file "$test_root/empty allow list"
printf 'sh a.sh\n' >"$test_root/closed allow list"
chmod 000 "$test_root/closed allow list"
[ ! -r "$test_root/closed allow list" ] ||
    fail "the test runs as a user who reads a file of mode 000"
refused_launch "an allow file that cannot be read" \
    "--allow-file names no readable file: $test_root/closed allow list" \
    --allow-file "$test_root/closed allow list"
chmod 600 "$test_root/closed allow list"
# A line holding a character no permission rule can hold is refused, naming the line. Red when the
# check is removed (the launch goes on and passes the line to claude).
for line in 'sh b.sh)' 'sh $X' 'sh *.sh' "sh 'q'" 'sh "q"' 'sh a\b' 'sh [a' 'sh a]' 'sh a,b' \
    'sh {' 'sh }' 'sh (' 'sh `x`' 'sh a?'; do
    printf 'sh a.sh\n%s\n' "$line" >"$test_root/refused allow list"
    refused_launch "an allow file holding $line" \
        "--allow-file holds a line with a character no rule can hold: $line" \
        --allow-file "$test_root/refused allow list"
done
# A carriage return inside a line is refused, naming the line: claude would receive it inside a
# rule. Red when the check is removed (the launch goes on).
printf 'sh a.sh\nsh a\rb.sh z\n' >"$test_root/refused allow list"
refused_launch "an allow file with a carriage return inside a line" \
    "--allow-file holds a carriage return inside line 2" \
    --allow-file "$test_root/refused allow list"
# The control: the same launch with the allow file runs the builder with the list.
settings 0 0 note-7 '' 0 0
run allow-control claude
expect_calls "$(claude_call)" "the allow file control"

printf 'PASS: launch.sh scratch tests\n'

#!/bin/sh
# Exercise launch.sh with stub claude, codex and launch-note commands, in paths that contain spaces:
# each recipe with no note and with an empty note, each with a note (start, the builder, end, then
# transcript), the ways start can fail to give an id, a launch that returns before its builder ends
# and survives a hangup, a relative exit file, and the usage errors.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

scratch=$(mktemp -d "${TMPDIR:-/tmp}/launch-test.XXXXXX") || fail "could not create scratch directory"
scratch=$(CDPATH= cd "$scratch" && pwd -P)
trap 'rm -rf "$scratch"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
launch=$script_dir/launch.sh

test_root="$scratch/a test root"
bin=$test_root/bin
work="$test_root/work dir"
mkdir -p "$bin" "$work" || fail "could not create the test directories"
CALLS=$test_root/calls.log
export CALLS

# A builder stub: logs its name, working directory and arguments, copies its stdin to stdout,
# writes a line to stderr, waits STUB_SLEEP seconds, and exits with STUB_EXIT.
for name in claude codex; do
    cat >"$bin/$name" <<EOF
#!/bin/sh
{ printf '$name|%s' "\$(pwd -P)"; for a in "\$@"; do printf '|%s' "\$a"; done; printf '\n'; } >>"\$CALLS"
cat
printf '$name stderr\n' >&2
sleep "\${STUB_SLEEP:-0}"
exit "\${STUB_EXIT:-0}"
EOF
    chmod +x "$bin/$name"
done

# A launch-note stub: logs every call. start prints NOTE_ID (two lines when NOTE_TWO is set, an
# empty line when NOTE_ID is set empty) and exits NOTE_START_EXIT; transcript exits NOTE_TRANSCRIPT_EXIT
# after writing to stderr.
note="$test_root/note cmd"
cat >"$note" <<'EOF'
#!/bin/sh
{ printf 'note'; for a in "$@"; do printf '|%s' "$a"; done; printf '\n'; } >>"$CALLS"
case "$1" in
    start)
        printf '%s\n' "${NOTE_ID-note-7}"
        [ -z "${NOTE_TWO:-}" ] || printf 'second-line\n'
        exit "${NOTE_START_EXIT:-0}"
        ;;
    end)
        if [ -e "$NOTE_EXIT_FILE" ]; then printf 'exit file already written\n' >>"$CALLS"; fi
        ;;
    transcript)
        printf 'transcript stderr\n' >&2
        exit "${NOTE_TRANSCRIPT_EXIT:-0}"
        ;;
esac
EOF
chmod +x "$note"
PATH="$bin:$PATH"
export PATH

cd "$test_root" || fail "could not enter the test root"
printf 'the prompt\n' >"$test_root/prompt"

# The stub settings for the next launch, exported so the detached process and its children see them.
settings() {
    STUB_EXIT=$1 STUB_SLEEP=$2 NOTE_ID=$3 NOTE_TWO=$4 NOTE_START_EXIT=$5 NOTE_TRANSCRIPT_EXIT=$6
    export STUB_EXIT STUB_SLEEP NOTE_ID NOTE_TWO NOTE_START_EXIT NOTE_TRANSCRIPT_EXIT
}

wait_file() {
    tries=0
    while [ ! -s "$1" ]; do
        tries=$((tries + 1))
        [ "$tries" -le 30 ] || fail "no file at $1"
        sleep 1
    done
}

# launch_into <name> <harness> [extra options...]: start a launch whose files are named after <name>.
launch_into() {
    name=$1
    harness=$2
    shift 2
    d="$test_root/$name out"
    mkdir -p "$d"
    : >"$CALLS"
    NOTE_EXIT_FILE=$d/exit
    export NOTE_EXIT_FILE
    set -- "$harness" --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$d/report" \
        --stderr "$d/stderr" --exit "$d/exit" --pid "$d/pid" "$@"
    [ "$harness" = claude ] || set -- "$@" --events "$d/events" --effort high
    sh "$launch" "$@" || fail "$name: launch.sh failed"
    [ -s "$d/pid" ] || fail "$name: no pid file"
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

start_call() {
    printf 'note|start|--launcher|plan-orchestration|--label|%s|--harness|%s|--model|m1|--parent|%s|--cwd|%s|--pid|%s' \
        "$1" "$2" "$3" "$work" "$(cat "$d/pid")"
}

claude_call="claude|$work|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json"
codex_call() {
    printf 'codex|%s|exec|-C|%s|-s|workspace-write|%s-c|model_reasoning_effort="high"|-m|m1|-o|%s|--json|-' \
        "$test_root" "$work" "$1" "$d/report"
}

# No note: the recipes' exact arguments, the prompt on stdin, stdout and stderr redirected, the
# exit code kept.
settings 3 0 note-7 '' 0 0
run a0 claude
expect_calls "$claude_call" "claude without a note"
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
expect_calls "$(codex_call '-c|sandbox_workspace_write.network_access=true|')" "codex with the network setting"

# An empty note is no note, and transcript with it does nothing.
settings 0 0 note-7 '' 0 0
run a1 claude --note '' --id "$test_root/a1 out/id" --label 2 --parent sess-0
expect_calls "$claude_call" "claude with an empty note"
[ ! -e "$d/id" ] || fail "claude with an empty note: an id file was written"
: >"$CALLS"
sh "$launch" transcript --note '' --id "$d/id" /t || fail "transcript with an empty note failed"
expect_calls "" "transcript with an empty note"

# A note: start with the launch's details and the detached pid, the builder, end with the id.
settings 4 0 note-7 '' 0 0
run a2 claude --note "$note" --id "$test_root/a2 out/id" --label 3 --parent sess-1
expect_calls "$(start_call 3 claude sess-1)
$claude_call
note|end|note-7" "claude with a note"
expect_file "$d/exit" "exit 4" "claude with a note"
: >"$CALLS"
sh "$launch" transcript --note "$note" --id "$d/id" "/path with space/transcript" || fail "transcript failed"
expect_calls "note|transcript|note-7|/path with space/transcript" "transcript"

# A transcript call that fails is ignored.
settings 0 0 note-7 '' 0 9
: >"$CALLS"
out=$(sh "$launch" transcript --note "$note" --id "$d/id" /t 2>&1) || fail "a failing transcript call stopped launch.sh"
[ -z "$out" ] || fail "a failing transcript call printed: $out"

settings 2 0 note-7 '' 0 0
run c2 codex --note "$note" --id "$test_root/c2 out/id" --label 4 --parent sess-2
expect_calls "$(start_call 4 codex sess-2)
$(codex_call '')
note|end|note-7" "codex with a note"
expect_file "$d/exit" "exit 2" "codex with a note"

# start printing two lines: end and transcript get the first.
settings 0 0 note-8 1 0 0
run a3 claude --note "$note" --id "$test_root/a3 out/id" --label 6 --parent sess-4
expect_calls "$(start_call 6 claude sess-4)
$claude_call
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
    run a4 claude --note "$note" --id "$test_root/a4 out/id" --label 5 --parent sess-3
    expect_calls "$(start_call 5 claude sess-3)
$claude_call" "claude when start $label"
    expect_file "$d/exit" "exit $code" "claude when start $label"
    : >"$CALLS"
    sh "$launch" transcript --note "$note" --id "$d/id" /t || fail "transcript when start $label failed"
    expect_calls "" "transcript when start $label"
    rm -rf "$d"
done

# The launch returns while the builder runs, and the detached process survives a hangup.
settings 0 3 note-7 '' 0 0
launch_into a5 claude
[ ! -e "$d/exit" ] || fail "the launch waited for its builder"
kill -HUP "$(cat "$d/pid")" 2>/dev/null || fail "the detached process was gone right after the launch"
wait_file "$d/exit"
expect_file "$d/exit" "exit 0" "a builder after a hangup"

# A relative id file still reaches end after the claude recipe changes directory.
settings 0 0 note-5 '' 0 0
: >"$CALLS"
NOTE_EXIT_FILE=$test_root/rel-id-exit
export NOTE_EXIT_FILE
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report "$test_root/rel-id-report" \
    --stderr "$test_root/rel-id-stderr" --exit "$test_root/rel-id-exit" --pid "$test_root/rel-id-pid" \
    --note "$note" --id rel-id --label 7 --parent sess-5 || fail "a launch with a relative id file failed"
wait_file "$test_root/rel-id-exit"
got=$(sed -n '$p' "$CALLS")
[ "$got" = "note|end|note-5" ] || fail "a relative id file: the last call was $got, expected note|end|note-5"

# A relative exit file resolves from the builder's working directory, as in the recipe.
settings 0 0 note-7 '' 0 0
: >"$CALLS"
sh "$launch" claude --cwd "$work" --model m1 --prompt "$test_root/prompt" --report rel-report \
    --stderr rel-stderr --exit rel-exit --pid "$test_root/rel-pid" || fail "a relative launch failed"
wait_file "$work/rel-exit"
[ ! -e "$test_root/rel-exit" ] || fail "a relative exit file landed in the caller's directory"
expect_file "$work/rel-report" "the prompt" "a relative report"

# Usage errors exit 64.
full="--cwd x --model m --prompt p --report r --stderr s --exit e --pid p"
for args in "" "bogus" "claude --cwd x" "claude --bogus x" "claude $full stray" "claude $full --network" \
    "claude $full --effort high" "codex $full" "claude $full --note /n" "claude $full --note /n --id i --label l" \
    "claude $full --note /n --id i --parent p" "claude $full --note n --id i --label l --parent p" \
    "transcript --note /n --id x" "transcript --note /n --id x /a /b" "transcript --note /n /t" \
    "transcript --note n --id x /t" "transcript --cwd x /t"; do
    # shellcheck disable=SC2086
    sh "$launch" $args >/dev/null 2>&1
    status=$?
    [ "$status" -eq 64 ] || fail "usage error '$args' exited $status, expected 64"
done

printf 'PASS: launch.sh scratch tests\n'

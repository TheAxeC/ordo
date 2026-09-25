#!/bin/sh
# Exercise verify.sh on scratch state files and scratch test scripts: a green list with a summary
# test, a plain command and a folded-scalar command; a summary test that prints PASS but exits 1;
# a summary test that exits 0 without a PASS last line; a plain command that exits 1; a test that
# prints PASS and exits 1 under every spelling of a pipe into tail; a quoted pipe; standard input,
# quoting and a carriage return in a command; yml and YAML fences; the stop at the first red
# command; INT, HUP, QUIT and TERM to the runner, and a command that ignores TERM; each state file
# the runner refuses with exit 64; a missing python3, PyYAML, bash or ps; a command killed by a
# signal; and a scratch folder it cannot make.
#
# The runner is started through the shell VERIFY_TEST_SHELL names. Without it, this file runs
# itself twice, with VERIFY_TEST_SHELL=sh and, when dash is installed, VERIFY_TEST_SHELL=dash. The
# dash run is red when the runner's shell part uses a construct only bash knows. Each run ends with
# its own PASS line, which the outer run checks, and the outer PASS line names the shells used.

set -u

fail() {
    printf 'FAIL: %s (runner under %s)\n' "$1" "${VERIFY_TEST_SHELL:-}" >&2
    exit 1
}

if [ -z "${VERIFY_TEST_SHELL:-}" ]; then
    ran='' skipped=''
    for shell in sh dash; do
        if ! command -v "$shell" >/dev/null 2>&1; then
            skipped="$skipped $shell"
            continue
        fi
        out=$(VERIFY_TEST_SHELL=$shell sh "$0" 2>&1)
        status=$?
        printf '%s\n' "$out"
        [ "$status" -eq 0 ] || exit 1
        case $(printf '%s\n' "$out" | tail -n 1) in
            "PASS: verify.sh scratch tests (runner under $shell)") ;;
            *) printf 'FAIL: the run under %s ended without its PASS line\n' "$shell" >&2; exit 1 ;;
        esac
        ran="$ran $shell"
    done
    if [ -n "$skipped" ]; then
        printf 'PASS: verify.sh scratch tests (runner under%s; not installed:%s)\n' \
            "$ran" "$skipped"
    else
        printf 'PASS: verify.sh scratch tests (runner under%s)\n' "$ran"
    fi
    exit 0
fi
shell_path=$(command -v "$VERIFY_TEST_SHELL") || fail "no shell named $VERIFY_TEST_SHELL"

test_root=$(mktemp -d "${TMPDIR:-/tmp}/verify-test.XXXXXX") ||
    fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
verify=$script_dir/verify.sh

work=$test_root/work
runner_tmp=$test_root/tmp
mkdir -p "$work" "$runner_tmp"

cat >"$work/green.test.sh" <<'EOF'
printf 'noise\n'
printf 'PASS: green\n'
EOF
cat >"$work/passexit1.test.sh" <<'EOF'
printf 'PASS: x\n'
exit 1
EOF
cat >"$work/nopass.test.sh" <<'EOF'
printf 'PASS: early\n'
printf 'done\n'
EOF
cat >"$work/red.test.sh" <<'EOF'
printf 'FAIL: x\n'
exit 1
EOF
# Moves itself to a process group of its own in the same session, ignores TERM, writes its pid to
# helper.pid, forks a child that joins the first group and exits at once, never reaps that child
# (a zombie in the first group), writes the file ready and sleeps 20 seconds.
cat >"$work/zombie.py" <<'EOF'
import os, signal, time
group = os.getpgrp()
os.setpgid(0, 0)
signal.signal(signal.SIGTERM, signal.SIG_IGN)
open("helper.pid", "w").write(str(os.getpid()))
if os.fork() == 0:
    os.setpgid(0, group)
    os._exit(0)
time.sleep(0.5)
open("ready", "w").close()
time.sleep(20)
EOF
cat >"$work/broken.sh" <<'EOF'
printf 'broken out\n' >&2
exit 1
EOF

# Writes a state file named $1 in the scratch work folder whose first yaml block is standard input.
state() {
    {
        printf '# State\n\n```yaml\n'
        cat
        printf '```\n\nText after the block.\n'
    } >"$work/$1"
}

# Runs the runner from the scratch work folder on state file $1; sets out and status. Red when the
# runner leaves its scratch folder behind.
run() {
    out=$(cd "$work" && TMPDIR=$runner_tmp "$shell_path" "$verify" "$1" 2>&1)
    status=$?
    [ -z "$(ls -A "$runner_tmp")" ] || fail "the runner left files in its scratch folder on $1"
}

expect() {
    [ "$status" -eq "$1" ] || fail "$2: exit $status, expected $1; output: $out"
    [ "$out" = "$3" ] || fail "$2: output differs; got: $out"
}

# All green. The summary test pipes into tail -n 2, so its output has two lines. Red when the
# runner prints a summary test's whole output instead of its last line.
state green.md <<'EOF'
verify:          # a comment the block may carry
- sh green.test.sh 2>&1 | tail -n 2
- printf 'plain out\n'
- >-
  printf '%s\n'
  folded-joined
rules: x
EOF
run green.md
expect 0 "all green" "PASS: green
plain out
folded-joined
verify: 3 commands passed"

# A pipe inside quotes is text: the command runs as written. Red when the runner runs only what
# comes before the last pipe.
state quotedpipe.md <<'EOF'
verify:
- |
  echo 'PASS: a | tail -1'
EOF
run quotedpipe.md
expect 0 "a quoted pipe" "PASS: a | tail -1
verify: 1 commands passed"

# The text after the last single pipe, past a backslash-newline, is a tail stage when it is tail
# or a path ending in /tail; after || it is not, and the command is plain. Red when the runner does
# not skip a backslash-newline, does not take a path to tail, or takes the text after || as well.
state stage.md <<'EOF'
verify:
- |
  sh green.test.sh 2>&1 | \
  tail -n 2
- sh green.test.sh 2>&1 | /usr/bin/tail -n 2
- printf 'x\n' || tail -n 1
EOF
run stage.md
expect 0 "the tail stage" "PASS: green
PASS: green
x
verify: 3 commands passed"

# A summary test that prints PASS but exits 1 is red. Red when the runner runs a command without
# pipefail, so that tail's exit status is the pipeline's.
state passexit1.md <<'EOF'
verify:
- sh green.test.sh 2>&1 | tail -1
- sh passexit1.test.sh 2>&1 | tail -1
EOF
run passexit1.md
expect 1 "a summary test that exits 1" "PASS: green
RED: sh passexit1.test.sh 2>&1 | tail -1
exit status: 1
PASS: x"

# A summary test that exits 0 with a last line that is not PASS: is red, even with an earlier PASS
# line. The command runs as written, so its output is what tail prints. Red when the PASS: check is
# removed.
state nopass.md <<'EOF'
verify:
- sh nopass.test.sh 2>&1 | tail -1
EOF
run nopass.md
expect 1 "a summary test without a PASS last line" "RED: sh nopass.test.sh 2>&1 | tail -1
exit status: 0
last line does not start with PASS:
done"

# A plain command that exits 1 is red, and its output, stderr included, is printed. Red when a
# plain command is judged passed whatever its exit status.
state broken.md <<'EOF'
verify:
- sh broken.sh
EOF
run broken.md
expect 1 "a plain command that exits 1" "RED: sh broken.sh
exit status: 1
broken out"

# A test that prints PASS and exits 1 is red however its output is piped into tail. Each spelling
# sits in a literal block, which keeps a trailing newline. Red when the runner runs a command
# without pipefail, and when it does not strip a command's trailing whitespace, which turns the
# tail-stage case red first.
for spelling in 'sh passexit1.test.sh 2>&1 | tail -n 1' 'sh passexit1.test.sh 2>&1  | tail -1' \
    'sh passexit1.test.sh | tail -1' 'sh passexit1.test.sh 2>&1|tail -1' \
    'sh passexit1.test.sh 2>&1 | tail -1 2>/dev/null' 'sh passexit1.test.sh 2>&1 | tail -1 >&2' \
    'sh passexit1.test.sh 2>&1 | tail -1;' 'sh passexit1.test.sh 2>&1 | tail -1 # keep | last' \
    'sh passexit1.test.sh 2>&1 | grep PASS | tail -1'; do
    printf 'verify:\n- |\n  %s\nrules: x\n' "$spelling" | state spelling.md
    run spelling.md
    expect 1 "the spelling $spelling" "RED: $spelling
exit status: 1
PASS: x"
done

# A backslash-newline before tail. Red when the runner runs a command without pipefail.
state backslash.md <<'EOF'
verify:
- |
  sh passexit1.test.sh 2>&1 | \
  tail -1
EOF
run backslash.md
expect 1 "a backslash-newline before tail" "RED: sh passexit1.test.sh 2>&1 | \\
tail -1
exit status: 1
PASS: x"

# A command ending in "; true" is not a summary test: it is judged on its exit status, which is 0.
# This is the control for the tail stage. Red when any command whose text after its last pipe
# starts with tail is taken as a summary test.
state true.md <<'EOF'
verify:
- sh red.test.sh 2>&1 | tail -1; true
EOF
run true.md
expect 0 "a command ending in ; true" "FAIL: x
verify: 1 commands passed"

# A command reads end-of-file from standard input at once, whatever the runner's input holds. Red
# when the command runs with the runner's standard input.
state stdin.md <<'EOF'
verify:
- if read -r line; then printf 'read %s\n' "$line"; else printf 'eof\n'; fi
EOF
out=$(cd "$work" &&
    printf 'from stdin\n' | TMPDIR=$runner_tmp "$shell_path" "$verify" stdin.md 2>&1)
status=$?
expect 0 "a command reading standard input" "eof
verify: 1 commands passed"

# Quotes, a newline inside a literal block and a carriage return reach the command as written. Red
# when the runner drops carriage returns, and when it runs only the first line of a command, which
# turns the tail-stage case red first.
state quoting.md <<'EOF'
verify:
- |
  printf '%s|%s\n' "a 'b'" 'c "d"'
  printf 'second line\n'
- "printf 'a\rb' | od -An -tx1 | tr -d ' \\n'; printf '\\n'"
EOF
run quoting.md
expect 0 "quotes, a newline and a carriage return" "a 'b'|c \"d\"
second line
610d62
verify: 2 commands passed"

# The fence word yml and any case of yaml count. Red when only a fence word of exactly yaml counts.
for word in yml YAML; do
    printf '# State\n\n```%s\nverify:\n- printf %s\n```\n' "$word" "'fence $word\\n'" \
        >"$work/fence.md"
    run fence.md
    expect 0 "a $word fence" "fence $word
verify: 1 commands passed"
done

# The runner stops at the first red command: the command after it would write a marker file. Red
# when the runner carries on after a red command and exits 1 only at the end.
state stop.md <<'EOF'
verify:
- sh nopass.test.sh 2>&1 | tail -1
- touch marker
EOF
run stop.md
[ "$status" -eq 1 ] || fail "the stop case: exit $status, expected 1"
[ -e "$work/marker" ] && fail "a command after the first red command ran"
case "$out" in
    *"commands passed"*) fail "the stop case printed a count: $out" ;;
esac

# The refusals, each with exit 64 and a message naming what is missing.
refused() {
    run "$1"
    [ "$status" -eq 64 ] || fail "$2: exit $status, expected 64; output: $out"
    case "$out" in
        *"$3"*) ;;
        *) fail "$2: the message does not say \"$3\": $out" ;;
    esac
    [ -e "$work/marker" ] && fail "$2: a command ran"
}

# Red when an error opening the state file is not caught.
refused missing.md "a missing state file" "verify: cannot read the state file missing.md"

# Red when a state file with no yaml block is passed with exit 0.
printf '# State\n\n```sh\ntouch marker\n```\n' >"$work/noblock.md"
refused noblock.md "a state file with no yaml block" "verify: noblock.md has no yaml block"

# Red when the exit 64 on a missing list is replaced by exit 0.
state nokey.md <<'EOF'
rules: docs/dev/change-standard.md
EOF
refused nokey.md "a block with no verify: key" \
    "verify: the first yaml block of nokey.md has no verify: list"

# Only the first yaml block is read: a verify list in a second block does not count, and a yaml
# fence inside another fenced block is not a yaml block. Red when the runner reads the first yaml
# block that holds a verify key, and when it ignores fences other than yaml ones.
{
    printf '# State\n\n````markdown\n```yaml\nverify:\n- touch marker\n```\n````\n\n'
    printf '```yaml\nrules: x\n```\n\n```yaml\nverify:\n- touch marker\n```\n'
} >"$work/second.md"
refused second.md "a verify list only in a second yaml block" \
    "verify: the first yaml block of second.md has no verify: list"

# Red when the check for an empty list is removed.
state empty.md <<'EOF'
verify: []
EOF
refused empty.md "an empty verify list" "verify: the verify: list of empty.md is empty"

# Red when the check that the key holds a list is removed.
state notalist.md <<'EOF'
verify: touch marker
EOF
refused notalist.md "a verify key that is not a list" \
    "verify: the verify: key of notalist.md is not a list of commands"

# Red when the check that each command is a string is removed.
state number.md <<'EOF'
verify:
- touch marker
- 5
EOF
refused number.md "a verify item that is not a string" \
    "verify: command 2 of the verify: list of number.md is not a string"

# Red when the check for an empty command is removed.
state blank.md <<'EOF'
verify:
- touch marker
- ""
EOF
refused blank.md "a verify item that is empty" \
    "verify: command 2 of the verify: list of blank.md is empty"

# Red when the YAML error is not caught.
state badyaml.md <<'EOF'
verify: [touch marker
EOF
refused badyaml.md "a block that is not valid YAML" \
    "verify: the first yaml block of badyaml.md is not valid YAML"

# Red when the check for a NUL character is removed.
state nul.md <<'EOF'
verify:
- "touch marker\0"
EOF
refused nul.md "a verify item holding a NUL" \
    "verify: command 1 of the verify: list of nul.md holds a NUL character"

# Red when the decoding error is not caught.
printf '# State \377\n\n```yaml\nverify:\n- touch marker\n```\n' >"$work/latin1.md"
refused latin1.md "a state file that is not UTF-8" "verify: the state file latin1.md is not UTF-8"

# Red when a block left open at the end of the file is read as closed.
printf '# State\n\n```yaml\nverify:\n- touch marker\n' >"$work/open.md"
refused open.md "a yaml block that is never closed" \
    "verify: the first yaml block of open.md is not closed"

# A python3 that cannot import yaml exits 69 with a message naming PyYAML. Red when the import
# error is not caught.
mkdir "$test_root/noyaml"
printf 'raise ImportError("no yaml here")\n' >"$test_root/noyaml/yaml.py"
out=$(cd "$work" &&
    PYTHONPATH=$test_root/noyaml TMPDIR=$runner_tmp "$shell_path" "$verify" green.md 2>&1)
status=$?
[ "$status" -eq 69 ] || fail "no PyYAML: exit $status, expected 69; output: $out"
[ "$out" = "verify: python3 cannot import yaml; install PyYAML" ] || fail "no PyYAML: $out"

# A PATH without python3 exits 69. Red when the check for python3 is removed.
mkdir "$test_root/emptybin"
out=$(cd "$work" &&
    PATH=$test_root/emptybin TMPDIR=$runner_tmp "$shell_path" "$verify" green.md 2>&1)
status=$?
expect 69 "no python3" "verify: python3 is not on PATH"

# A PATH with python3 and without bash exits 69. Red when the check for bash is removed.
mkdir "$test_root/pybin"
ln -s "$(command -v python3)" "$test_root/pybin/python3"
out=$(cd "$work" &&
    PATH=$test_root/pybin TMPDIR=$runner_tmp "$shell_path" "$verify" green.md 2>&1)
status=$?
expect 69 "no bash" "verify: bash is not on PATH"

# A PATH with python3 and bash and without ps exits 69. Red when the check for ps is removed.
mkdir "$test_root/pybashbin"
ln -s "$(command -v python3)" "$test_root/pybashbin/python3"
ln -s "$(command -v bash)" "$test_root/pybashbin/bash"
out=$(cd "$work" &&
    PATH=$test_root/pybashbin TMPDIR=$runner_tmp "$shell_path" "$verify" green.md 2>&1)
status=$?
expect 69 "no ps" "verify: ps is not on PATH"

# A command killed by a signal reports 128 plus its number. Red when the runner prints the
# negative status Python gives a killed child.
state killed.md <<'EOF'
verify:
- kill -9 $$
EOF
run killed.md
expect 1 "a command killed by a signal" "RED: kill -9 \$\$
exit status: 137"

# Starts the runner in the background on a state file whose first command is $3, sends it signal
# $1 once the command has written its pid to cmd.pid, and checks that the runner exits $2 within
# 10 seconds, that the command and its session are gone, that no later command ran and that the
# scratch folder is gone. $4, when given, names the case in a failure instead of the signal.
signal_case() {
    name=${4:-$1}
    rm -f "$work/cmd.pid" "$work/second"
    printf 'verify:\n- %s\n- touch second\n' "$3" | state signal.md
    (cd "$work" && TMPDIR=$runner_tmp exec "$shell_path" "$verify" signal.md) \
        >"$test_root/signal.out" 2>&1 &
    runner=$!
    tries=0
    while [ ! -s "$work/cmd.pid" ]; do
        [ "$tries" -lt 100 ] || fail "$name: the command did not start"
        sleep 0.1
        tries=$((tries + 1))
    done
    (sleep 10; kill -KILL "$runner" 2>/dev/null) &
    watchdog=$!
    kill -s "$1" "$runner"
    wait "$runner"
    status=$?
    kill "$watchdog" 2>/dev/null
    signal_out=$(cat "$test_root/signal.out")
    [ "$status" -ne 137 ] || fail "$name: the runner did not stop within 10 seconds"
    [ "$status" -eq "$2" ] || fail "$name: exit $status, expected $2; output: $signal_out"
    group=$(cat "$work/cmd.pid")
    tries=0
    while kill -0 "$group" 2>/dev/null || kill -0 -- "-$group" 2>/dev/null; do
        [ "$tries" -lt 30 ] || fail "$name: the command still runs after the signal"
        sleep 0.1
        tries=$((tries + 1))
    done
    [ -e "$work/second" ] && fail "$name: a command after the signal ran"
    [ -z "$(ls -A "$runner_tmp")" ] || fail "$name: the runner left files in its scratch folder"
}

# Each of INT, HUP, QUIT and TERM stops the running command and its session at once. Red, for each
# signal, when the runner does not handle that signal; red for all four when the command runs in
# the runner's own session, and when the handler does not end the command's session. Taking EPERM
# from killpg as an error can turn these red too: once the leader is reaped, KILL can find only a
# dying sleep in its group.
signal_case INT 130 'echo $$ >cmd.pid; sleep 20; touch after'
signal_case HUP 129 'echo $$ >cmd.pid; sleep 20; touch after'
signal_case QUIT 131 'echo $$ >cmd.pid; sleep 20; touch after'
signal_case TERM 143 'echo $$ >cmd.pid; sleep 20; touch after'

# A command whose session holds a second process group, which ignores TERM, and whose own group
# holds only a zombie once TERM has ended it: macOS then refuses KILL to that group with EPERM. The
# second group is killed too. Red when the runner signals only the leader's group, when it takes
# EPERM as an error, and when it sends only TERM.
rm -f "$work/ready" "$work/helper.pid"
signal_case TERM 143 \
    'python3 zombie.py & while [ ! -e ready ]; do sleep 0.1; done; echo $$ >cmd.pid; sleep 20' \
    "TERM to a command whose session has a second group"
helper=$(cat "$work/helper.pid")
tries=0
while kill -0 "$helper" 2>/dev/null; do
    [ "$tries" -lt 30 ] || fail "the second process group of the session still runs"
    sleep 0.1
    tries=$((tries + 1))
done

# A command that ignores TERM is killed two seconds later. Red when the runner sends only TERM.
signal_case TERM 143 'trap "" TERM; echo $$ >cmd.pid; sleep 20; touch after' \
    "TERM to a command that ignores TERM"

# Red when the check of the argument count is removed.
out=$(cd "$work" && TMPDIR=$runner_tmp "$shell_path" "$verify" 2>&1)
status=$?
[ "$status" -eq 64 ] || fail "no argument: exit $status, expected 64"
case "$out" in
    *"usage: sh utils/verify.sh <state file>"*) ;;
    *) fail "no argument: no usage line: $out" ;;
esac

# A scratch folder that cannot be created exits 1 before any command runs. Red when the runner
# falls back to another folder.
out=$(cd "$work" && TMPDIR=$test_root/no/such/folder "$shell_path" "$verify" green.md 2>&1)
status=$?
expect 1 "no scratch folder" \
    "verify: cannot create a scratch folder in $test_root/no/such/folder: No such file or directory"

printf 'PASS: verify.sh scratch tests (runner under %s)\n' "$VERIFY_TEST_SHELL"

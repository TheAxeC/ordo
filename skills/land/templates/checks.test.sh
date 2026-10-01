#!/bin/sh
# Exercise checks.sh on scratch state files. Each case runs checks.sh from this file's own folder,
# from a scratch directory under $TMPDIR. The cases prove:
#   - a list of three commands whose first two fail, the first being a pipeline into tail whose
#     left side fails (so it fails only under pipefail), exits 1, runs the third command, and
#     prints each command, its output and its failure line, then the count of failures, in that
#     order;
#   - a command ended by a signal is a failure with status 128 plus the signal's number, and the
#     command after it runs;
#   - a list of passing commands exits 0 and prints the count;
#   - a state file with no yaml block is refused with exit 2 before anything runs.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

assert_contains() {
    case "$1" in
        *"$2"*)
            ;;
        *)
            printf '%s\n' "$1" >&2
            fail "$3: missing [$2]"
            ;;
    esac
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/checks-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) || fail "could not resolve the folder of $0"
checks_script=$script_dir/checks.sh

# Writes the state file $1 whose verify list is the lines of standard input, each a literal block
# item.
write_state() {
    {
        printf '# State\n\n```yaml\nverify:\n'
        awk '{ print "- |-"; print "  " $0 }'
        printf '```\n'
    } >"$1" || fail "could not write $1"
}

# Runs checks.sh on the state file $1 from the scratch directory; sets run_status and run_output.
run_checks() {
    run_output=$(cd "$test_root" && sh "$checks_script" "$1" 2>&1)
    run_status=$?
}

# Fails unless the text $1 equals the text of the file $2, line for line; $3 names the case.
assert_output_equals() {
    printf '%s\n' "$1" >"$test_root/actual.txt"
    diff "$2" "$test_root/actual.txt" >"$test_root/diff.txt" || {
        cat "$test_root/diff.txt" >&2
        fail "$3: the output differs from the expected text"
    }
}

# A failing command does not stop the run: the commands after it run, each failure prints its line
# after the command's output, and the run ends with the count of failures and exit 1. The first
# command is a pipeline whose left side fails and whose right side succeeds, in the form the verify
# list uses, so it fails only under pipefail. The last command passes, so an exit status taken
# from the last command would be 0.
write_state "$test_root/failing.md" <<'EOF'
sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
exit 5
touch third-ran
EOF
cat >"$test_root/failing.expected" <<'EOF'
$ sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
FAIL: x
checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
$ exit 5
checks: failed with exit 5: exit 5
$ touch third-ran
checks: 2 of 3 commands failed
EOF
run_checks "$test_root/failing.md"
[ "$run_status" -eq 1 ] || { printf '%s\n' "$run_output" >&2; fail "failing list exited $run_status, expected 1"; }
[ -e "$test_root/third-ran" ] || fail "failing list did not run the command after the failed ones"
assert_output_equals "$run_output" "$test_root/failing.expected" "failing list"

# A command ended by a signal is a failure with status 128 plus the signal's number, and the
# command after it runs.
write_state "$test_root/signal.md" <<'EOF'
kill -TERM $$
echo after
EOF
cat >"$test_root/signal.expected" <<'EOF'
$ kill -TERM $$
checks: failed with exit 143: kill -TERM $$
$ echo after
after
checks: 1 of 2 commands failed
EOF
run_checks "$test_root/signal.md"
[ "$run_status" -eq 1 ] || { printf '%s\n' "$run_output" >&2; fail "signal list exited $run_status, expected 1"; }
assert_output_equals "$run_output" "$test_root/signal.expected" "signal list"

# A list of passing commands exits 0 and prints the count.
write_state "$test_root/passing.md" <<'EOF'
true
printf 'noise\n' | tail -1
EOF
run_checks "$test_root/passing.md"
[ "$run_status" -eq 0 ] || { printf '%s\n' "$run_output" >&2; fail "passing list exited $run_status, expected 0"; }
assert_contains "$run_output" "checks: 2 commands passed" "passing list"

# A state file with no yaml block is refused with exit 2 before anything runs.
printf '# State\n\nverify:\n- touch refused-ran\n' >"$test_root/no-block.md"
run_checks "$test_root/no-block.md"
[ "$run_status" -eq 2 ] || { printf '%s\n' "$run_output" >&2; fail "no yaml block exited $run_status, expected 2"; }
assert_contains "$run_output" "checks: " "no yaml block"
[ ! -e "$test_root/refused-ran" ] || fail "no yaml block ran a command"

printf 'PASS: checks.sh scratch tests\n'

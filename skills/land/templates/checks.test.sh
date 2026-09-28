#!/bin/sh
# Exercise checks.sh on scratch state files: a list whose second of three commands fails exits 1,
# names that command and does not run the third, the failing command being a pipeline into tail
# whose left side fails, so the case holds only under pipefail; a list of passing commands exits 0 and prints
# the count; a state file with no yaml block is refused with exit 2. Each case runs checks.sh from
# this file's own folder, from a scratch directory under $TMPDIR.

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

# A failing command stops the run with exit 1 and its line; the command after it does not run.
# The failing command is a pipeline whose left side fails and whose right side succeeds, in the
# form the verify list uses, so it fails only under pipefail.
write_state "$test_root/failing.md" <<'EOF'
echo first ran
sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
touch third-ran
EOF
run_checks "$test_root/failing.md"
[ "$run_status" -eq 1 ] || { printf '%s\n' "$run_output" >&2; fail "failing list exited $run_status, expected 1"; }
assert_contains "$run_output" "checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1" "failing list"
assert_contains "$run_output" '$ echo first ran' "failing list echo"
[ ! -e "$test_root/third-ran" ] || fail "failing list ran the command after the failed one"

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

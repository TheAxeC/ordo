#!/bin/sh
# Exercise check_step.py on scratch plan.md files under $TMPDIR. Each case writes a plan whose
# "Steps, in execution order" section holds the step lines and whose Rulings section holds the
# ruling lines, runs the script for one step, and checks its exit status, its standard output and
# its standard error. Each case names the change to check_step.py that turns it red.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-step-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_step.py
needed="the user's ruling is needed"
n=0

# The ruling lines most cases use: an open item, an open item continued, a ruling with no open
# item that ends "(The user.)", a ruling that is not the user's, and an open item whose letter is
# followed by a colon.
rulings='- Open item H (2025-01-02): (a), the runner moves (the user).
- Open item U (2025-01-03), continued: 4 (a), the check (the user).
- The plan cut to its goal (2025-01-01): step 1b removed. (The user.)
- Models: Opus (the user). Superseded by ruling U.
- Open item E: (b), step 7 launched from a shell (the user).'

# Write a fresh plan.md with the step lines $1 and the ruling lines $2.
plan() {
    n=$((n + 1))
    file=$test_root/plan-$n.md
    printf '# Plan: 1.A Test\n\n## Goal\n\nA goal.\n\n## Steps, in execution order\n\n%s\n\n' \
        "$1" >"$file"
    printf '## Could run in parallel\n\n- 1 alone (approved)\n\n### Step 2, Step 0\n\n- x\n\n' \
        >>"$file"
    printf '## Rulings (2025-01-01)\n\n%s\n\n## Blocked, and by what\n\n- 3: 2.\n' "$2" >>"$file"
}

# Run the script on the plan for step $2 and check it exits $3 and prints exactly $4 on standard
# output and nothing on standard error; $1 names the case.
expect_out() {
    out=$(python3 "$check" "$file" "$2" 2>"$test_root/err")
    status=$?
    err=$(cat "$test_root/err")
    [ "$status" = "$3" ] || fail "$1: exit $status, expected $3 [$out] [$err]"
    [ "$out" = "$4" ] || fail "$1: printed [$out], expected [$4]"
    [ -z "$err" ] || fail "$1: printed [$err] on standard error, expected nothing"
}

# Run the script with the arguments after $1 and $2 and check it exits 64, prints nothing on
# standard output and exactly the line $2 on standard error.
expect_error() {
    label=$1
    text=$2
    shift 2
    out=$(python3 "$check" "$@" 2>"$test_root/err")
    status=$?
    err=$(cat "$test_root/err")
    [ "$status" = 64 ] || fail "$label: exit $status, expected 64 [$out] [$err]"
    [ -z "$out" ] || fail "$label: printed [$out] on standard output, expected nothing"
    [ "$err" = "$text" ] || fail "$label: printed [$err] on standard error, expected [$text]"
}

# The brief's cases, on scratch plans shaped as the plan the brief names.

# Red when (approved) at the end of a line is not read as the user's authority, or the ok line
# takes another shape.
plan '- 1 The first step (1 commit) (approved)
- 2 The second step (1 commit)' "$rulings"
expect_out "approved" 1 0 "ok: step 1 has the user's authority: (approved)"

# Red when a line with no tag at its end is passed. The control of the case above.
expect_out "no tag" 2 1 \
    "refused: step 2 ends with neither (approved) nor (ruling <name>); $needed"

# Red when a checkmark before the step is read as the step's name.
plan "- $(printf '\342\234\205') 17 The retro applied (1 commit) (approved)
- 18 The closure table (1 commit)" "$rulings"
expect_out "a ticked step" 17 0 "ok: step 17 has the user's authority: (approved)"

# Red when an open item line's name is not its letter.
plan '- 1a The runner moved (ruling H): the texts (1 commit) (ruling H)' "$rulings"
expect_out "an open item ruling" 1a 0 "ok: step 1a has the user's authority: (ruling H)"

# Red when a ruling with no open item is not named by the text before its first " (", or when a
# ruling line that ends "(The user.)" is not counted as the user's.
plan '- 6a The collector keeps every item (1 commit) (ruling The plan cut to its goal)' "$rulings"
expect_out "a ruling named by its text" 6a 0 \
    "ok: step 6a has the user's authority: (ruling The plan cut to its goal)"

# Red when only the last tag is read: one tag of several naming a ruling of the user is enough,
# and the ok line names each tag that matched, in the line's order.
plan '- 21 The checks (ruling W) (ruling U) (ruling Q) (ruling H)' "$rulings"
expect_out "several tags" 21 0 "ok: step 21 has the user's authority: (ruling U) (ruling H)"

# Red when a tag naming a ruling the Rulings section lacks is passed.
plan '- 17a The library check (1 commit) (ruling T)' "$rulings"
expect_out "an unknown ruling" 17a 1 \
    "refused: step 17a names no ruling of the user in the Rulings section: (ruling T); $needed"

# Red when a ruling line that does not end with "(the user)" is counted, here one whose "(the
# user)" is followed by more text.
plan '- 9 The models (1 commit) (ruling Models: Opus)' "$rulings"
expect_out "a ruling that is not the user's" 9 1 \
    "refused: step 9 names no ruling of the user in the Rulings section: (ruling Models: Opus); $needed"

# Red when a removed step is passed on its tag.
plan '- Removed by ruling U (never landed; its worktree deleted): 7d The suite under load (1 commit) (ruling U)
- 7 The checkers (approved)' "$rulings"
expect_out "a removed step" 7d 1 \
    "refused: step 7d is removed: its line starts with Removed by; $needed"

# Red when the step name is read as the first word after "- " on a removed line. The control of
# the case above: a step named like the first word of that line is not in the list.
expect_error "the first word of a removed line" \
    "error: step Removed is not in the step list of $file: 7d, 7" "$file" Removed

# Red when a tag before the end of the line is read as the step's authority: only the tags
# that end the line count.
plan '- 3 The step (ruling H) in its text, then (1 commit)' "$rulings"
expect_out "a tag inside the line" 3 1 \
    "refused: step 3 ends with neither (approved) nor (ruling <name>); $needed"

# Red when an open item line of the form "Open item E:" is not named E, and when it is named by
# the text before its first " (" as well.
plan '- 7 The launch (1 commit) (ruling E)
- 8 The launch (1 commit) (ruling Open item E:)' "$rulings"
expect_out "Open item E: named E" 7 0 "ok: step 7 has the user's authority: (ruling E)"
expect_out "Open item E: not named by its text" 8 1 \
    "refused: step 8 names no ruling of the user in the Rulings section: (ruling Open item E:); $needed"

# Red when a level-three heading ends a section: a step after one in the step list, and a ruling
# after one in the Rulings section, are still read.
n=$((n + 1))
file=$test_root/plan-$n.md
printf '# Plan: 1.A\n\n## Steps, in execution order\n\n- 1 x (approved)\n\n### Later\n\n' >"$file"
printf -- '- 2 y (ruling K)\n\n## Rulings\n\n- Open item H (x): y (the user).\n\n' >>"$file"
printf '### More\n\n- Open item K (x): z (the user).\n' >>"$file"
expect_out "a subheading in both sections" 2 0 "ok: step 2 has the user's authority: (ruling K)"

# Red when a step name is matched by its prefix.
plan '- 1 The step (approved)' "$rulings"
expect_error "a prefix of a step" "error: step 1a is not in the step list of $file: 1" \
    "$file" 1a

# The refusals, one per cause, and the edges.

# Red when a step not in the list is not refused with the list.
plan '- 1 The step (approved)
- 2 Another (approved)' "$rulings"
expect_error "no such step" "error: step 5 is not in the step list of $file: 1, 2" "$file" 5
# Red when an empty step name is not refused with the list.
expect_error "an empty step" "error: step  is not in the step list of $file: 1, 2" "$file" ''
# Red when a wrong number of arguments is not refused.
expect_error "no step argument" "error: usage: check_step.py <plan.md> <step>" "$file"
# Red when a missing file is not refused.
expect_error "a missing file" \
    "error: cannot read $test_root/missing.md: No such file or directory" \
    "$test_root/missing.md" 1

# Red when a step listed twice is taken from one of its lines.
plan '- 1 The step (approved)
- 1 The step again' "$rulings"
expect_error "a step listed twice" "error: step 1 is listed twice in $file, at lines 9 and 10" \
    "$file" 1

# Red when a plan with no step list is not refused.
printf '# Plan: 1.A\n\n## Rulings\n\n- Open item H (x): y (the user).\n' >"$test_root/nosteps.md"
expect_error "no step list" \
    "error: $test_root/nosteps.md has no '## Steps, in execution order' section" \
    "$test_root/nosteps.md" 1

# Red when a plan with no Rulings section is not refused.
printf '# Plan: 1.A\n\n## Steps, in execution order\n\n- 1 x (approved)\n' >"$test_root/norulings.md"
expect_error "no rulings section" "error: $test_root/norulings.md has no '## Rulings' section" \
    "$test_root/norulings.md" 1

# Red when a plan that is not UTF-8 is not refused.
printf '## Steps, in execution order\n\n- 1 x (approved)\n\377\n' >"$test_root/binary.md"
expect_error "not UTF-8" "error: $test_root/binary.md is not UTF-8" "$test_root/binary.md" 1

# Red when a removed line that names no step after a colon is skipped.
plan '- Removed by ruling U
- 1 The step (approved)' "$rulings"
expect_error "a removed line with no step" \
    "error: $file:9: a line that starts with Removed by names no step after its colon" "$file" 1

# Red when the section is read past a level-two heading: the step after it is not in the list.
plan '- 1 The step (approved)

## Notes

- 2 Not a step (approved)' "$rulings"
expect_error "a heading ends the list" "error: step 2 is not in the step list of $file: 1" \
    "$file" 2

# Red when an indented list item is read as a step.
plan '- 1 The step (approved)
  - 2 A note under it (approved)' "$rulings"
expect_error "an indented item" "error: step 2 is not in the step list of $file: 1" "$file" 2

# Red when a plan whose lines end in CRLF is not read: its headings are not found, and its lines
# do not end with their tags.
plan '- 1 The step (ruling H)' "$rulings"
awk '{ printf "%s\r\n", $0 }' "$file" >"$file.crlf" && mv "$file.crlf" "$file"
expect_out "a CRLF plan" 1 0 "ok: step 1 has the user's authority: (ruling H)"

printf 'PASS: check_step.py scratch tests\n'

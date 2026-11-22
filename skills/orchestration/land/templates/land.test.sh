#!/bin/sh
# Exercise land.sh on scratch repositories under $TMPDIR, each with a plan.yaml whose path the
# case gives as the fourth argument, a ledger under its ledger_root holding an
# orchestrator-state.md whose verify: list the case sets, and a step worktree under its
# worktree_root, both keys read from the folder that holds the plan.yaml. land.sh and checks.sh
# are run from this file's own folder. The cases: a conflict exits 2, prints the conflicting path
# and leaves main's HEAD and index as they were; a ledger file left uncommitted in the worktree
# never reaches main, under the projects: form of a plan.yaml in a folder of its own with the
# state file given as an absolute path; a failing check exits
# 1 with checks.sh's failure line and leaves main's HEAD as it was; a clean landing exits 0, runs
# its check on main after the cherry-pick and stages the step's change on main; a step that adds a
# test script and its command, both left uncommitted in the worktree as a builder leaves them,
# reaches main and exits 0 with the command's line and the added script's PASS line printed by
# checks.sh on main after the cherry-pick, with the verify list the fixture gives; a plan.yaml in
# a project folder with no worktree_root lands from .agents/worktrees at the repository root and
# keeps the ledger under that folder off main; three arguments exit 64 and change nothing, with a
# .agents/plan.yaml present; a second plan.yaml at .agents/plan.yaml is not read when another
# path is given; a ledger_root or a worktree_root that resolves outside the repository or to its
# root exits 64 and changes nothing.

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

test_root=$(mktemp -d "${TMPDIR:-/tmp}/land-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) || fail "could not resolve the folder of $0"
land_script=$script_dir/land.sh

# Creates the repository $test_root/$1 on main with the plan.yaml text $2 at the relative path
# $5 and the state file at the relative path $3, whose verify list is the lines of standard input,
# and commits them with a base.txt; the worktree root $4, a path from the repository root, is
# ignored.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo/$(dirname "$3")" "$repo/$(dirname "$5")" || fail "could not create $repo"
    printf '%s\n' "$2" >"$repo/$5" || fail "could not write plan.yaml in $repo"
    {
        printf '# State\n\n```yaml\nverify:\n'
        awk '{ print "- |-"; print "  " $0 }'
        printf '```\n'
    } >"$repo/$3" || fail "could not write the state file in $repo"
    printf 'base\n' >"$repo/base.txt"
    printf '/%s/\n' "$4" >"$repo/.gitignore"
    (
        cd "$repo" || exit 1
        git init -q -b main
        git config user.name "Landing Test"
        git config user.email "landing-test@example.invalid"
        git add -A
        git commit -q -m "Initial fixture"
    ) || fail "could not initialise $repo"
}

# Adds the worktree $2 of the step $3 on a new branch at main's head of the repository $1.
add_worktree() {
    (cd "$1" && git worktree add -q -b "$3" "$2" main) || fail "could not add the worktree $2"
}

# Commits the file $2 with the content $3 in the checkout $1.
commit_file() {
    (
        cd "$1" || exit 1
        mkdir -p "$(dirname "$2")"
        printf '%s\n' "$3" >"$2"
        git add "$2"
        git commit -q -m "Change $2"
    ) || fail "could not commit $2 in $1"
}

# Fails when the landing of the step $2 changed the repository $1: main's HEAD $3 or index $4
# moved, the step's branch left $5, or <step>-land exists.
assert_untouched() {
    [ "$(cd "$1" && git rev-parse HEAD)" = "$3" ] || fail "$2: main's HEAD moved"
    [ "$(cd "$1" && git write-tree)" = "$4" ] || fail "$2: main's index changed"
    [ "$(cd "$1" && git rev-parse "$2")" = "$5" ] || fail "$2: the step's branch moved"
    if (cd "$1" && git rev-parse -q --verify "$2-land") >/dev/null 2>&1; then
        fail "$2: the branch $2-land was created"
    fi
}

one_project='ledger_root: ../ledger
worktree_root: ../.agents/wt'

# A conflict: exit 2, the conflicting path printed, main's HEAD and index untouched.
make_repo conflict "$one_project" ledger/plan/orchestrator-state.md .agents/wt docs/plan.yaml <<'EOF'
true
EOF
conflict_repo=$repo
conflict_base=$(cd "$conflict_repo" && git rev-parse HEAD) || fail "could not read the conflict base"
add_worktree "$conflict_repo" .agents/wt/conflict conflict
commit_file "$conflict_repo/.agents/wt/conflict" base.txt step
commit_file "$conflict_repo" base.txt main
conflict_head=$(cd "$conflict_repo" && git rev-parse HEAD) || fail "could not read main's head"
conflict_index=$(cd "$conflict_repo" && git write-tree) || fail "could not read main's index"
conflict_output=$(cd "$conflict_repo" && sh "$land_script" ledger/plan/orchestrator-state.md conflict "$conflict_base" docs/plan.yaml 2>&1)
conflict_status=$?
[ "$conflict_status" -eq 2 ] || { printf '%s\n' "$conflict_output" >&2; fail "conflict exited $conflict_status, expected 2"; }
assert_contains "$conflict_output" "Conflicting paths:
base.txt" "conflict"
[ "$(cd "$conflict_repo" && git rev-parse HEAD)" = "$conflict_head" ] || fail "conflict moved main's HEAD"
[ "$(cd "$conflict_repo" && git write-tree)" = "$conflict_index" ] || fail "conflict changed main's index"

# A ledger file left uncommitted in the worktree does not reach main. The projects: form in
# tools/plan.yaml, with the state file under the second project's ledger_root, given as an
# absolute path.
make_repo ledger 'projects:
  a:
    ledger_root: a/.scratch
    worktree_root: ../.agents/trees-a
  b:
    ledger_root: b/.scratch
    worktree_root: ../.agents/trees-b' tools/b/.scratch/plan/orchestrator-state.md .agents/trees-b tools/plan.yaml <<'EOF'
true
EOF
ledger_repo=$repo
ledger_base=$(cd "$ledger_repo" && git rev-parse HEAD) || fail "could not read the ledger base"
add_worktree "$ledger_repo" .agents/trees-b/ledger ledger
commit_file "$ledger_repo/.agents/trees-b/ledger" tools/b/change.txt change
ledger_report=tools/b/.scratch/plan/agents/reviews/report.md
mkdir -p "$ledger_repo/.agents/trees-b/ledger/$(dirname "$ledger_report")"
printf 'worktree report\n' >"$ledger_repo/.agents/trees-b/ledger/$ledger_report"
ledger_output=$(cd "$ledger_repo" && sh "$land_script" "$ledger_repo/tools/b/.scratch/plan/orchestrator-state.md" ledger "$ledger_base" tools/plan.yaml 2>&1)
ledger_status=$?
[ "$ledger_status" -eq 0 ] || { printf '%s\n' "$ledger_output" >&2; fail "ledger landing exited $ledger_status, expected 0"; }
ledger_staged=$(cd "$ledger_repo" && git diff --cached --name-only) || fail "could not read the ledger staged paths"
[ "$ledger_staged" = tools/b/change.txt ] || fail "ledger landing staged [$ledger_staged], expected [tools/b/change.txt]"
if [ -f "$ledger_repo/$ledger_report" ] && [ "$(cat "$ledger_repo/$ledger_report")" = "worktree report" ]; then
    fail "the worktree's ledger file reached main's working tree"
fi

# A failing check: exit 1, checks.sh's failure line, main's HEAD untouched.
make_repo failing "$one_project" ledger/plan/orchestrator-state.md .agents/wt docs/plan.yaml <<'EOF'
false
EOF
failing_repo=$repo
failing_base=$(cd "$failing_repo" && git rev-parse HEAD) || fail "could not read the failing base"
add_worktree "$failing_repo" .agents/wt/failing failing
commit_file "$failing_repo/.agents/wt/failing" change.txt change
failing_output=$(cd "$failing_repo" && sh "$land_script" ledger/plan/orchestrator-state.md failing "$failing_base" docs/plan.yaml 2>&1)
failing_status=$?
[ "$failing_status" -eq 1 ] || { printf '%s\n' "$failing_output" >&2; fail "failing check exited $failing_status, expected 1"; }
assert_contains "$failing_output" "checks: failed with exit 1: false" "failing check"
[ "$(cd "$failing_repo" && git rev-parse HEAD)" = "$failing_base" ] || fail "failing check moved main's HEAD"

# A clean landing: exit 0, the check run on main after the cherry-pick, the step's committed and
# uncommitted changes staged on main.
make_repo clean "$one_project" ledger/plan/orchestrator-state.md .agents/wt docs/plan.yaml <<'EOF'
test -f change.txt
EOF
clean_repo=$repo
clean_base=$(cd "$clean_repo" && git rev-parse HEAD) || fail "could not read the clean base"
add_worktree "$clean_repo" .agents/wt/clean clean
commit_file "$clean_repo/.agents/wt/clean" change.txt change
printf 'pending\n' >"$clean_repo/.agents/wt/clean/pending.txt"
clean_output=$(cd "$clean_repo" && sh "$land_script" ledger/plan/orchestrator-state.md clean "$clean_base" docs/plan.yaml 2>&1)
clean_status=$?
[ "$clean_status" -eq 0 ] || { printf '%s\n' "$clean_output" >&2; fail "clean landing exited $clean_status, expected 0"; }
assert_contains "$clean_output" "checks: 1 commands passed" "clean landing"
clean_staged=$(cd "$clean_repo" && git diff --cached --name-only) || fail "could not read the clean staged paths"
[ "$clean_staged" = "change.txt
pending.txt" ] || fail "clean landing staged [$clean_staged], expected [change.txt pending.txt]"

# A step that adds a test script and its command: both are left uncommitted in the worktree, as a
# builder leaves them, and the state file's verify list the fixture gives holds the command. Exit 0,
# the command's line printed by checks.sh on main after the cherry-pick, the added script's own
# PASS line, and the command in main's copy of the verification page.
make_repo verification "$one_project" ledger/plan/orchestrator-state.md .agents/wt docs/plan.yaml <<'EOF'
sh utils/added.test.sh
EOF
verification_repo=$repo
commit_file "$verification_repo" docs/verification.md "# Verification"
verification_base=$(cd "$verification_repo" && git rev-parse HEAD) || fail "could not read the verification base"
add_worktree "$verification_repo" .agents/wt/verification verification
verification_worktree=$verification_repo/.agents/wt/verification
mkdir -p "$verification_worktree/utils"
printf '%s\n' "printf 'PASS: added test\\n'" >"$verification_worktree/utils/added.test.sh"
printf '%s\n' "# Verification" "sh utils/added.test.sh" >"$verification_worktree/docs/verification.md"
verification_output=$(cd "$verification_repo" && sh "$land_script" ledger/plan/orchestrator-state.md verification "$verification_base" docs/plan.yaml 2>&1)
verification_status=$?
[ "$verification_status" -eq 0 ] || { printf '%s\n' "$verification_output" >&2; fail "verification landing exited $verification_status, expected 0"; }
assert_contains "$verification_output" '$ sh utils/added.test.sh' "verification landing"
assert_contains "$verification_output" "PASS: added test" "verification landing"
assert_contains "$verification_output" "checks: 1 commands passed" "verification landing"
grep -qxF 'sh utils/added.test.sh' "$verification_repo/docs/verification.md" || fail "verification landing left the added command out of main's docs/verification.md"

# A plan.yaml in a project folder, with no worktree_root: the step lands from
# .agents/worktrees at the repository root, and a ledger file left uncommitted in the worktree
# under the project's ledger does not reach main.
make_repo nested 'ledger_root: ledger' apps/web/ledger/plan/orchestrator-state.md .agents/worktrees apps/web/plan.yaml <<'EOF'
true
EOF
nested_repo=$repo
nested_base=$(cd "$nested_repo" && git rev-parse HEAD) || fail "could not read the nested base"
add_worktree "$nested_repo" .agents/worktrees/nested nested
commit_file "$nested_repo/.agents/worktrees/nested" apps/web/change.txt change
nested_report=apps/web/ledger/plan/agents/reviews/report.md
mkdir -p "$nested_repo/.agents/worktrees/nested/$(dirname "$nested_report")"
printf 'worktree report\n' >"$nested_repo/.agents/worktrees/nested/$nested_report"
nested_output=$(cd "$nested_repo" && sh "$land_script" apps/web/ledger/plan/orchestrator-state.md nested "$nested_base" apps/web/plan.yaml 2>&1)
nested_status=$?
[ "$nested_status" -eq 0 ] || { printf '%s\n' "$nested_output" >&2; fail "nested landing exited $nested_status, expected 0"; }
nested_staged=$(cd "$nested_repo" && git diff --cached --name-only) || fail "could not read the nested staged paths"
[ "$nested_staged" = apps/web/change.txt ] || fail "nested landing staged [$nested_staged], expected [apps/web/change.txt]"
[ ! -e "$nested_repo/$nested_report" ] || fail "the nested worktree's ledger file reached main's working tree"

# Three arguments: exit 64 and nothing changed, in a repository whose .agents/plan.yaml names
# the ledger and the worktree root from the repository root.
make_repo three 'ledger_root: ledger
worktree_root: .agents/wt' ledger/plan/orchestrator-state.md .agents/wt .agents/plan.yaml <<'EOF'
true
EOF
three_repo=$repo
three_base=$(cd "$three_repo" && git rev-parse HEAD) || fail "could not read the three-argument base"
add_worktree "$three_repo" .agents/wt/three three
commit_file "$three_repo/.agents/wt/three" change.txt change
three_index=$(cd "$three_repo" && git write-tree) || fail "could not read the three-argument index"
three_step=$(cd "$three_repo" && git rev-parse three) || fail "could not read the three-argument step"
three_output=$(cd "$three_repo" && sh "$land_script" ledger/plan/orchestrator-state.md three "$three_base" 2>&1)
three_status=$?
[ "$three_status" -eq 64 ] || { printf '%s\n' "$three_output" >&2; fail "three arguments exited $three_status, expected 64"; }
assert_untouched "$three_repo" three "$three_base" "$three_index" "$three_step"

# A second plan.yaml at .agents/plan.yaml, with another ledger_root and worktree_root, is not
# read when apps/web/plan.yaml is the path given: the step lands from the worktree root and with
# the ledger root of the file given.
make_repo second 'ledger_root: ledger
worktree_root: ../../.agents/wt' apps/web/ledger/plan/orchestrator-state.md .agents/wt apps/web/plan.yaml <<'EOF'
true
EOF
second_repo=$repo
mkdir -p "$second_repo/.agents"
printf 'ledger_root: other\nworktree_root: .agents/other\n' >"$second_repo/.agents/plan.yaml"
(cd "$second_repo" && git add .agents/plan.yaml && git commit -q -m "A second plan.yaml") || fail "could not commit the second plan.yaml"
second_base=$(cd "$second_repo" && git rev-parse HEAD) || fail "could not read the second base"
add_worktree "$second_repo" .agents/wt/second second
commit_file "$second_repo/.agents/wt/second" apps/web/change.txt change
second_report=apps/web/ledger/plan/agents/reviews/report.md
mkdir -p "$second_repo/.agents/wt/second/$(dirname "$second_report")"
printf 'worktree report\n' >"$second_repo/.agents/wt/second/$second_report"
second_output=$(cd "$second_repo" && sh "$land_script" apps/web/ledger/plan/orchestrator-state.md second "$second_base" apps/web/plan.yaml 2>&1)
second_status=$?
[ "$second_status" -eq 0 ] || { printf '%s\n' "$second_output" >&2; fail "second landing exited $second_status, expected 0"; }
second_staged=$(cd "$second_repo" && git diff --cached --name-only) || fail "could not read the second staged paths"
[ "$second_staged" = apps/web/change.txt ] || fail "second landing staged [$second_staged], expected [apps/web/change.txt]"
[ ! -e "$second_repo/$second_report" ] || fail "the second worktree's ledger file reached main's working tree"

# A ledger_root or a worktree_root that resolves outside the repository, or to its root: exit 64
# and nothing changed.
outside_number=0
while IFS='|' read -r outside_ledger outside_worktrees; do
    outside_number=$((outside_number + 1))
    outside_step=outside-$outside_number
    make_repo "$outside_step" "ledger_root: $outside_ledger
worktree_root: $outside_worktrees" ledger/plan/orchestrator-state.md .agents/wt docs/plan.yaml <<'EOF'
true
EOF
    outside_repo=$repo
    outside_base=$(cd "$outside_repo" && git rev-parse HEAD) || fail "could not read the base of $outside_step"
    add_worktree "$outside_repo" ".agents/wt/$outside_step" "$outside_step"
    commit_file "$outside_repo/.agents/wt/$outside_step" change.txt change
    outside_index=$(cd "$outside_repo" && git write-tree) || fail "could not read the index of $outside_step"
    outside_head=$(cd "$outside_repo" && git rev-parse "$outside_step") || fail "could not read the step of $outside_step"
    outside_output=$(cd "$outside_repo" && sh "$land_script" ledger/plan/orchestrator-state.md "$outside_step" "$outside_base" docs/plan.yaml 2>&1)
    outside_status=$?
    [ "$outside_status" -eq 64 ] || { printf '%s\n' "$outside_output" >&2; fail "$outside_step ($outside_ledger, $outside_worktrees) exited $outside_status, expected 64"; }
    assert_contains "$outside_output" "must be a folder inside the repository and not its root" "$outside_step"
    assert_contains "$outside_output" "docs/plan.yaml" "$outside_step"
    assert_untouched "$outside_repo" "$outside_step" "$outside_base" "$outside_index" "$outside_head"
done <<'CASES'
../..|../.agents/wt
..|../.agents/wt
../ledger|../..
../ledger|..
CASES

printf 'PASS: land.sh scratch tests\n'

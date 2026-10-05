#!/bin/sh
# Exercise land.sh on scratch repositories under $TMPDIR, each with a .agents/plan.yaml, a ledger
# under its ledger_root holding an orchestrator-state.md whose verify: list the case sets, and a
# step worktree under its worktree_root. land.sh and checks.sh are run from this file's own
# folder. The cases: a conflict exits 2, prints the conflicting path and leaves main's HEAD and
# index as they were; a ledger file left uncommitted in the worktree never reaches main, under the
# projects: form of plan.yaml with the state file given as an absolute path; a failing check exits
# 1 with checks.sh's failure line and leaves main's HEAD as it was; a clean landing exits 0, runs
# its check on main after the cherry-pick and stages the step's change on main.

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

# Creates the repository $test_root/$1 on main with the plan.yaml text $2 and the state file at
# the relative path $3, whose verify list is the lines of standard input, and commits them with a
# base.txt; the worktree root $4 is ignored.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo/$(dirname "$3")" "$repo/.agents" || fail "could not create $repo"
    printf '%s\n' "$2" >"$repo/.agents/plan.yaml" || fail "could not write plan.yaml in $repo"
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

one_project='ledger_root: ledger
worktree_root: .agents/wt'

# A conflict: exit 2, the conflicting path printed, main's HEAD and index untouched.
make_repo conflict "$one_project" ledger/plan/orchestrator-state.md .agents/wt <<'EOF'
true
EOF
conflict_repo=$repo
conflict_base=$(cd "$conflict_repo" && git rev-parse HEAD) || fail "could not read the conflict base"
add_worktree "$conflict_repo" .agents/wt/conflict conflict
commit_file "$conflict_repo/.agents/wt/conflict" base.txt step
commit_file "$conflict_repo" base.txt main
conflict_head=$(cd "$conflict_repo" && git rev-parse HEAD) || fail "could not read main's head"
conflict_index=$(cd "$conflict_repo" && git write-tree) || fail "could not read main's index"
conflict_output=$(cd "$conflict_repo" && sh "$land_script" ledger/plan/orchestrator-state.md conflict "$conflict_base" 2>&1)
conflict_status=$?
[ "$conflict_status" -eq 2 ] || { printf '%s\n' "$conflict_output" >&2; fail "conflict exited $conflict_status, expected 2"; }
assert_contains "$conflict_output" "Conflicting paths:
base.txt" "conflict"
[ "$(cd "$conflict_repo" && git rev-parse HEAD)" = "$conflict_head" ] || fail "conflict moved main's HEAD"
[ "$(cd "$conflict_repo" && git write-tree)" = "$conflict_index" ] || fail "conflict changed main's index"

# A ledger file left uncommitted in the worktree does not reach main. The projects: form, with the
# state file under the second project's ledger_root, given as an absolute path.
make_repo ledger 'projects:
  a:
    ledger_root: tools/a/.scratch
    worktree_root: .agents/trees-a
  b:
    ledger_root: tools/b/.scratch
    worktree_root: .agents/trees-b' tools/b/.scratch/plan/orchestrator-state.md .agents/trees-b <<'EOF'
true
EOF
ledger_repo=$repo
ledger_base=$(cd "$ledger_repo" && git rev-parse HEAD) || fail "could not read the ledger base"
add_worktree "$ledger_repo" .agents/trees-b/ledger ledger
commit_file "$ledger_repo/.agents/trees-b/ledger" tools/b/change.txt change
ledger_report=tools/b/.scratch/plan/agents/reviews/report.md
mkdir -p "$ledger_repo/.agents/trees-b/ledger/$(dirname "$ledger_report")"
printf 'worktree report\n' >"$ledger_repo/.agents/trees-b/ledger/$ledger_report"
ledger_output=$(cd "$ledger_repo" && sh "$land_script" "$ledger_repo/tools/b/.scratch/plan/orchestrator-state.md" ledger "$ledger_base" 2>&1)
ledger_status=$?
[ "$ledger_status" -eq 0 ] || { printf '%s\n' "$ledger_output" >&2; fail "ledger landing exited $ledger_status, expected 0"; }
ledger_staged=$(cd "$ledger_repo" && git diff --cached --name-only) || fail "could not read the ledger staged paths"
[ "$ledger_staged" = tools/b/change.txt ] || fail "ledger landing staged [$ledger_staged], expected [tools/b/change.txt]"
if [ -f "$ledger_repo/$ledger_report" ] && [ "$(cat "$ledger_repo/$ledger_report")" = "worktree report" ]; then
    fail "the worktree's ledger file reached main's working tree"
fi

# A failing check: exit 1, checks.sh's failure line, main's HEAD untouched.
make_repo failing "$one_project" ledger/plan/orchestrator-state.md .agents/wt <<'EOF'
false
EOF
failing_repo=$repo
failing_base=$(cd "$failing_repo" && git rev-parse HEAD) || fail "could not read the failing base"
add_worktree "$failing_repo" .agents/wt/failing failing
commit_file "$failing_repo/.agents/wt/failing" change.txt change
failing_output=$(cd "$failing_repo" && sh "$land_script" ledger/plan/orchestrator-state.md failing "$failing_base" 2>&1)
failing_status=$?
[ "$failing_status" -eq 1 ] || { printf '%s\n' "$failing_output" >&2; fail "failing check exited $failing_status, expected 1"; }
assert_contains "$failing_output" "checks: failed with exit 1: false" "failing check"
[ "$(cd "$failing_repo" && git rev-parse HEAD)" = "$failing_base" ] || fail "failing check moved main's HEAD"

# A clean landing: exit 0, the check run on main after the cherry-pick, the step's committed and
# uncommitted changes staged on main.
make_repo clean "$one_project" ledger/plan/orchestrator-state.md .agents/wt <<'EOF'
test -f change.txt
EOF
clean_repo=$repo
clean_base=$(cd "$clean_repo" && git rev-parse HEAD) || fail "could not read the clean base"
add_worktree "$clean_repo" .agents/wt/clean clean
commit_file "$clean_repo/.agents/wt/clean" change.txt change
printf 'pending\n' >"$clean_repo/.agents/wt/clean/pending.txt"
clean_output=$(cd "$clean_repo" && sh "$land_script" ledger/plan/orchestrator-state.md clean "$clean_base" 2>&1)
clean_status=$?
[ "$clean_status" -eq 0 ] || { printf '%s\n' "$clean_output" >&2; fail "clean landing exited $clean_status, expected 0"; }
assert_contains "$clean_output" "checks: 1 commands passed" "clean landing"
clean_staged=$(cd "$clean_repo" && git diff --cached --name-only) || fail "could not read the clean staged paths"
[ "$clean_staged" = "change.txt
pending.txt" ] || fail "clean landing staged [$clean_staged], expected [change.txt pending.txt]"

printf 'PASS: land.sh scratch tests\n'

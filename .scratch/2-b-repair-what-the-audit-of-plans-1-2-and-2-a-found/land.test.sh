#!/bin/sh
# Exercise the landing helper in isolated repositories: a clean landing with the template's
# defaults, which runs no browser step and no line count, a conflicting one and
# its rerun refused, a builder that committed everything, an index lock held while a git process
# runs (the bounded wait, shortened through LANDING_LOCK_WAIT), a stale lock, a lock gone before the
# bound, a stop at the bound after the worktree's checkout and a rerun that lands, a rerun refused
# while the landing branch holds a change made by hand or main holds staged changes, a bound that
# is not a whole number, a tool directory set on the ADAPT line, a ledger inside the repository
# whose files left uncommitted in the worktree never reach main, under the template's ledger root, under one
# holding pattern characters and under one written with a trailing / or a leading ./, and a ledger root that is not a folder inside the repository
# refused. Each landing starts land.sh
# from a scratch ledger holding its orchestrator-state.md: a green verify list lands, a red one
# fails the landing with verify.sh's RED line, a state file verify.sh cannot use fails it with
# exit 1, verify.sh is found in the repository's
# .agents/skills when the ledger lacks it, and a verify.sh found nowhere, the places named, or a
# missing state file is refused before main is touched. Check usage.py on a Claude Code log, its
# refusal of a file that is not one, and its refusal of a window time without an offset or
# unreadable. Check the
# example plan.yaml files against the state template: inside an Ordo checkout a missing example
# fails, and only a copy outside one skips the check.
# A plan copies this file beside its land.sh; the expected rows follow the ADAPT edits made there.
# verify.sh and usage.py are found as land.sh finds them, so the copy runs from the ledger.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

assert_contains() {
    assert_value=$1
    assert_expected=$2
    assert_label=$3
    case "$assert_value" in
        *"$assert_expected"*)
            ;;
        *)
            fail "$assert_label: missing [$assert_expected]"
            ;;
    esac
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/land-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
land_script=$script_dir/land.sh
# The fixtures follow the tool directory and the ledger root land.sh names on its ADAPT lines.
tool_path=$(sed -n 's/^landing_tool_path=\([^ ]*\).*/\1/p' "$land_script")
[ -n "$tool_path" ] || fail "could not read landing_tool_path from $land_script"
ledger_root=$(sed -n 's/^landing_ledger_root=\([^ ]*\).*/\1/p' "$land_script")
[ -n "$ledger_root" ] || fail "could not read landing_ledger_root from $land_script"

# Sets tool_prefix to the prefix of a path under the tool directory as git prints it: none for
# the whole tree.
set_tool_prefix() {
    if [ "$tool_path" = . ]; then
        tool_prefix=''
    else
        tool_prefix=$tool_path/
    fi
}
set_tool_prefix

# Prints the path of the land skill's template $1, found as land.sh finds it: beside this test,
# then in the land skill's templates under the repository's .agents/skills, ~/.agents/skills and
# $CLAUDE_CONFIG_DIR/skills (default ~/.claude/skills).
find_template() {
    for template_place in \
        "$script_dir" \
        "$(pwd -P)/.agents/skills/land/templates" \
        "$HOME/.agents/skills/land/templates" \
        "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/land/templates"; do
        if [ -f "$template_place/$1" ]; then
            printf '%s\n' "$template_place/$1"
            return 0
        fi
    done
    return 1
}
verify_script=$(find_template verify.sh) || fail "verify.sh not found beside this test or in the land skill's templates"
usage_script=$(find_template usage.py) || fail "usage.py not found beside this test or in the land skill's templates"

# Writes a scratch ledger folder $1: a copy of land.sh ($2, the template when not given) with
# verify.sh and usage.py beside it, as a plan copies them, and an orchestrator-state.md whose
# verify list is the lines of standard input, each written as a literal block item.
make_ledger() {
    mkdir -p "$1" || fail "could not create the ledger $1"
    cp "${2:-$land_script}" "$1/land.sh" || fail "could not copy land.sh into $1"
    cp "$verify_script" "$usage_script" "$1/" || fail "could not copy into $1"
    {
        printf '# State\n\n```yaml\nverify:\n'
        awk '{ print "- |-"; print "  " $0 }'
        printf '```\n'
    } >"$1/orchestrator-state.md" || fail "could not write the state file in $1"
}

# The ledger most landings use: a summary command, and a command that passes only from the
# repository root after main's cherry-pick, where the package's committed.txt then is.
ledger=$test_root/ledger
make_ledger "$ledger" <<EOF
printf 'noise\\nPASS: green list\\n' | tail -1
test -f $tool_path/committed.txt && echo on-main-after-cherry-pick
EOF
ledger_script=$ledger/land.sh

# The folders a line count over src, tests, config and bin would read, so a landing that ran one
# prints their file names.
write_tool_stub() {
    stub_root=$1
    mkdir -p "$stub_root/$tool_path/src" "$stub_root/$tool_path/tests" "$stub_root/$tool_path/bin" "$stub_root/$tool_path/config"
    printf 'source\n' >"$stub_root/$tool_path/src/source.txt"
    printf 'test\n' >"$stub_root/$tool_path/tests/test.txt"
    printf 'bin\n' >"$stub_root/$tool_path/bin/bin.txt"
    printf 'config\n' >"$stub_root/$tool_path/config/config.txt"
}

initialise_repo() {
    repo_root=$1
    mkdir -p "$repo_root"
    write_tool_stub "$repo_root"
    (
        cd "$repo_root" || exit 1
        git init -q -b main
        git config user.name "Landing Test"
        git config user.email "landing-test@example.invalid"
        git add "$tool_path"
        git commit -q -m "Initial fixture"
        mkdir -p .agents/worktrees
    ) || fail "could not initialise scratch repository"
}

# Writes the orchestrator's Claude Code session log to the file $1.
write_session() {
    cat >"$1" <<'JSONL'
{"type":"assistant","timestamp":"2026-09-16T10:05:00.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:05:01.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:30:00.000Z","message":{"id":"msg_b","usage":{"output_tokens":20,"cache_creation_input_tokens":0,"cache_read_input_tokens":2000,"input_tokens":3}}}
JSONL
}

clean_repo=$test_root/clean
initialise_repo "$clean_repo"
clean_base=$(cd "$clean_repo" && git rev-parse HEAD) || fail "could not read clean base"
(
    cd "$clean_repo" || exit 1
    git worktree add -q -b clean .agents/worktrees/clean "$clean_base"
) || fail "could not create clean worktree"
printf 'committed\n' >"$clean_repo/.agents/worktrees/clean/$tool_path/committed.txt"
(
    cd "$clean_repo/.agents/worktrees/clean" || exit 1
    git add "$tool_path/committed.txt"
    git commit -q -m wip
) || fail "could not create clean package commit"
printf 'pending\n' >"$clean_repo/.agents/worktrees/clean/$tool_path/pending.txt"
clean_session=$test_root/clean-session.jsonl
write_session "$clean_session"
# An npm on PATH that records each call, for the landing with the template's defaults below.
mkdir -p "$test_root/npm-bin"
printf '#!/bin/sh\nprintf "npm %%s\\n" "$*" >>"%s"\n' "$test_root/npm-calls" \
    >"$test_root/npm-bin/npm"
chmod +x "$test_root/npm-bin/npm"

# The landing runs with the template's defaults: no --no-browser.
(
    cd "$clean_repo" || exit 1
    PATH="$test_root/npm-bin:$PATH" sh "$ledger_script" clean "$clean_base" \
        --session "$clean_session" --since 2026-09-16T12:00:00+02:00
) >"$test_root/clean.out" 2>&1
clean_status=$?
clean_output=$(cat "$test_root/clean.out")
if [ "$clean_status" -ne 0 ]; then
    printf '%s\n' "$clean_output" >&2
    fail "clean landing exited $clean_status, expected 0"
fi

clean_staged=$(cd "$clean_repo" && git diff --cached --name-only) || fail "could not read clean staged paths"
clean_expected=$(printf '%s\n%s' "${tool_prefix}committed.txt" "${tool_prefix}pending.txt")
if [ "$clean_staged" != "$clean_expected" ]; then
    fail "clean staged paths differ: [$clean_staged]"
fi
assert_contains "$clean_output" "clean, worker claude:opus, first run: <tokens>, <tool uses> tool uses, <seconds> s (from the runner's result); repair round: <the same, or none>; +2 -0 over 2 files; first report passed its bar: <yes or no>; <N> fixes at landing" "worker row"
assert_contains "$clean_output" "clean, reviewer claude:opus, read-only: review <tokens> / <tool uses> / <seconds> s (from the runner's result)" "reviewer row"
case "$clean_output" in
    *"second review"*)
        fail "reviewer row still carries a second review"
        ;;
esac
assert_contains "$clean_output" "Orchestrator row (2026-09-16T12:00:00+02:00 to " "orchestrator row window"
assert_contains "$clean_output" "): 2 messages, 30 output tokens, 100 cache-write tokens, 3000 cache-read tokens, 8 fresh input tokens, " "orchestrator row"
assert_contains "$clean_output" "${tool_prefix}committed.txt" "booking paths"
assert_contains "$clean_output" "${tool_prefix}pending.txt" "booking paths"
# The ledger's verify list ran through verify.sh from the repository root after main's
# cherry-pick. Red when land.sh does not run the list (no count line), and when it runs the list
# before main's cherry-pick or from another folder (the test -f command is red, and so is the
# landing).
assert_contains "$clean_output" "PASS: green list
on-main-after-cherry-pick
verify: 2 commands passed" "the verify list on main"
# The template's defaults run no step that belongs to one project. Red when the browser step
# (its port check and npm run test:browser) runs without --no-browser, and when the line count
# over src, tests, config and bin runs.
[ ! -e "$test_root/npm-calls" ] ||
    fail "defaults: npm ran: [$(cat "$test_root/npm-calls")]"
case "$clean_output" in
    *"port check"* | *8792*) fail "defaults: the browser step's port check ran" ;;
    *source.txt* | *config.txt*) fail "defaults: a line count ran: [$clean_output]" ;;
esac
printf '%s\n' \
    'clean: exit 0, staged paths, usage rows, the orchestrator row and the verify list verified'
printf '%s\n' 'defaults: no browser step and no line count ran'

conflict_repo=$test_root/conflict
initialise_repo "$conflict_repo"
printf 'base\n' >"$conflict_repo/$tool_path/conflict.txt"
(
    cd "$conflict_repo" || exit 1
    git add "$tool_path/conflict.txt"
    git commit -q -m "Add conflict fixture"
) || fail "could not add conflict fixture"
conflict_base=$(cd "$conflict_repo" && git rev-parse HEAD) || fail "could not read conflict base"
(
    cd "$conflict_repo" || exit 1
    git worktree add -q -b conflict .agents/worktrees/conflict "$conflict_base"
) || fail "could not create conflict worktree"
printf 'package\n' >"$conflict_repo/.agents/worktrees/conflict/$tool_path/conflict.txt"
(
    cd "$conflict_repo/.agents/worktrees/conflict" || exit 1
    git add "$tool_path/conflict.txt"
    git commit -q -m wip
) || fail "could not create conflicting package commit"
printf 'pending\n' >"$conflict_repo/.agents/worktrees/conflict/$tool_path/pending.txt"
printf 'main\n' >"$conflict_repo/$tool_path/conflict.txt"
(
    cd "$conflict_repo" || exit 1
    git add "$tool_path/conflict.txt"
    git commit -q -m "Change main fixture"
) || fail "could not create conflicting main commit"

(
    cd "$conflict_repo" || exit 1
    sh "$ledger_script" conflict "$conflict_base" --no-browser
) >"$test_root/conflict.out" 2>&1
conflict_status=$?
conflict_output=$(cat "$test_root/conflict.out")
if [ "$conflict_status" -ne 2 ]; then
    printf '%s\n' "$conflict_output" >&2
    fail "conflict landing exited $conflict_status, expected 2"
fi
assert_contains "$conflict_output" "worktree git cherry-pick failed" "conflict step"
assert_contains "$conflict_output" "Conflicting paths:" "conflict heading"
assert_contains "$conflict_output" "${tool_prefix}conflict.txt" "conflict path"
conflict_branch=$(cd "$conflict_repo/.agents/worktrees/conflict" && git branch --show-current) || fail "could not read conflict branch"
if [ "$conflict_branch" != "conflict-land" ]; then
    fail "conflict worktree is on $conflict_branch, expected conflict-land"
fi
(
    cd "$conflict_repo" || exit 1
    sh "$ledger_script" conflict "$conflict_base" --no-browser
) >"$test_root/conflict-again.out" 2>&1
conflict_status=$?
[ "$conflict_status" -eq 1 ] || fail "conflict landing again exited $conflict_status, expected 1"
assert_contains "$(cat "$test_root/conflict-again.out")" \
    "preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand" \
    "conflict landing again"
printf 'conflict: exit 2, conflicting path and retained landing branch verified, landing again refused\n'

# The command line is <pkg> <base> and options. Exactly two arguments get past the argument-count
# check: run from a folder that is not a repository root, land.sh then stops at its first
# preflight check, before main, the worktree or the browser step is touched. Red when land.sh
# needs a third argument (exit 64 and the usage line instead). The control: one argument is
# refused with exit 64 and the usage line on stderr.
args_dir=$test_root/two-arguments
mkdir -p "$args_dir"
(cd "$args_dir" && sh "$ledger_script" twoargs "$clean_base") >"$test_root/two-arguments.out" \
    2>"$test_root/two-arguments.err"
args_status=$?
args_errors=$(cat "$test_root/two-arguments.err")
[ "$args_status" -eq 1 ] ||
    fail "land.sh <pkg> <base> exited $args_status, expected 1 at the preflight: [$args_errors]"
[ "$args_errors" = "preflight failed: run this script from the repository root" ] ||
    fail "land.sh <pkg> <base> did not stop at the first preflight check: [$args_errors]"
(cd "$args_dir" && sh "$ledger_script" twoargs) >"$test_root/one-argument.out" \
    2>"$test_root/one-argument.err"
args_status=$?
args_errors=$(cat "$test_root/one-argument.err")
[ "$args_status" -eq 64 ] || fail "land.sh <pkg> exited $args_status, expected 64: [$args_errors]"
args_usage="Usage: $ledger_script <pkg> <base> [--no-browser] [--session <session log> --since <ISO time>]"
[ "$args_errors" = "$args_usage" ] || fail "land.sh <pkg> did not print the usage line: [$args_errors]"
printf 'arguments: <pkg> <base> passes the argument check, <pkg> alone is refused with exit 64\n'

# A scratch repository with a worktree for package $1 holding one committed change and nothing
# pending, and a folder for its temporary files; sets $package_base.
committed_package() {
    package_repo=$test_root/$1
    initialise_repo "$package_repo"
    package_base=$(cd "$package_repo" && git rev-parse HEAD) || fail "could not read the $1 base"
    (
        cd "$package_repo" || exit 1
        git worktree add -q -b "$1" ".agents/worktrees/$1" "$package_base"
    ) || fail "could not create the $1 worktree"
    printf 'committed\n' >"$package_repo/.agents/worktrees/$1/$tool_path/committed.txt"
    (
        cd "$package_repo/.agents/worktrees/$1" || exit 1
        git add "$tool_path/committed.txt"
        git commit -q -m wip
    ) || fail "could not create the $1 package commit"
    mkdir -p "$test_root/$1-tmp"
}

# Starts land.sh on package $1 in the background, with the environment assignments that follow;
# sets $landing_pid. Its output goes to $test_root/$1.out and its temporary files under
# $test_root/$1-tmp.
start_landing() {
    landing_name=$1
    shift
    (
        cd "$test_root/$landing_name" || exit 1
        exec env TMPDIR="$test_root/$landing_name-tmp" "$@" sh "$ledger_script" "$landing_name" \
            "$package_base" --no-browser
    ) >"$test_root/$landing_name.out" 2>&1 &
    landing_pid=$!
}

# Waits up to $2 seconds for the landing started last; sets $landing_status and $landing_output.
# A landing still running then is killed, and the test fails with the reason given in $3.
finish_landing() {
    landing_waited=0
    while kill -0 "$landing_pid" 2>/dev/null && [ "$landing_waited" -lt "$2" ]; do
        sleep 1
        landing_waited=$((landing_waited + 1))
    done
    if kill -0 "$landing_pid" 2>/dev/null; then
        kill -9 "$landing_pid" 2>/dev/null
        wait "$landing_pid" 2>/dev/null
        cat "$test_root/$1.out" >&2
        fail "$1: $3"
    fi
    wait "$landing_pid"
    landing_status=$?
    landing_output=$(cat "$test_root/$1.out")
}

# The worktree's git directory, as land.sh reads it from the worktree's .git file.
worktree_git_dir() {
    sed -n 's/^gitdir: //p' "$test_root/$1/.agents/worktrees/$1/.git"
}

# A builder that committed everything leaves nothing staged: the landing makes no wip commit. An
# empty LANDING_LOCK_WAIT keeps the default bound.
committed_package committed
start_landing committed LANDING_LOCK_WAIT=
finish_landing committed 60 "the landing did not end"
if [ "$landing_status" -ne 0 ]; then
    printf '%s\n' "$landing_output" >&2
    fail "a landing with nothing pending exited $landing_status, expected 0"
fi
committed_staged=$(cd "$test_root/committed" && git diff --cached --name-only) ||
    fail "could not read the committed staged paths"
[ "$committed_staged" = "${tool_prefix}committed.txt" ] ||
    fail "committed staged paths differ: [$committed_staged]"
committed_log=$(
    cd "$test_root/committed/.agents/worktrees/committed" && git log --format=%s main..committed-land
) || fail "could not read the committed landing branch"
[ "$committed_log" = wip ] ||
    fail "the landing branch holds commits other than the builder's: [$committed_log]"
printf 'committed: nothing pending, no wip commit made, exit 0\n'

# The stand-in git process: a real git reading its standard input from a FIFO the test holds open.
standin_fifo=$test_root/standin.fifo
mkfifo "$standin_fifo" || fail "could not create the stand-in FIFO"
git hash-object --stdin <"$standin_fifo" >/dev/null &
standin_pid=$!
exec 3>"$standin_fifo"
standin_name=$(ps -p "$standin_pid" -o comm=) || fail "the stand-in git process is not running"
case "$standin_name" in
    git | */git) ;;
    *) fail "the stand-in process is named [$standin_name], not git" ;;
esac

# A lock older than the stale age while a git process runs: the wait stops at the bound.
committed_package locked
locked_lock=$(worktree_git_dir locked)/index.lock
: >"$locked_lock"
touch -t 202001010000 "$locked_lock"
start_landing locked LANDING_LOCK_WAIT=2
finish_landing locked 30 "the lock wait did not stop at its bound"
exec 3>&-
wait "$standin_pid"
[ "$landing_status" -eq 1 ] || fail "locked: exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" \
    "index lock failed: $locked_lock still held after 2 s of waiting" "locked message"
[ -e "$locked_lock" ] || fail "locked: the lock was removed while a git process ran"
locked_staged=$(cd "$test_root/locked" && git diff --cached --name-only) ||
    fail "could not read the locked staged paths"
[ -z "$locked_staged" ] || fail "locked: main was touched: [$locked_staged]"
printf 'locked: a lock held while git runs stops the landing at the bound, exit 1, main untouched\n'

# The same lock with no git process running (pgrep finds none) is stale and removed.
committed_package stale
stale_lock=$(worktree_git_dir stale)/index.lock
: >"$stale_lock"
touch -t 202001010000 "$stale_lock"
mkdir -p "$test_root/no-git-bin"
printf '#!/bin/sh\nexit 1\n' >"$test_root/no-git-bin/pgrep"
chmod +x "$test_root/no-git-bin/pgrep"
start_landing stale LANDING_LOCK_WAIT=2 PATH="$test_root/no-git-bin:$PATH"
finish_landing stale 60 "the landing did not end"
[ "$landing_status" -eq 0 ] || fail "stale: exit $landing_status, expected 0: $landing_output"
printf 'stale: a stale lock with no git process running removed, exit 0\n'

# A fresh lock that goes before the bound: the landing waits for it, then goes on.
committed_package released
released_lock=$(worktree_git_dir released)/index.lock
: >"$released_lock"
start_landing released LANDING_LOCK_WAIT=20
(
    sleep 3
    rm -f "$released_lock"
) &
finish_landing released 60 "the landing did not end"
[ "$landing_status" -eq 0 ] || fail "released: exit $landing_status, expected 0: $landing_output"
assert_contains "$landing_output" "index lock: waiting for $released_lock" "released wait"
printf 'released: a lock gone before the bound waited for, exit 0\n'

# A lock stop at main's wait, after the worktree's checkout and cherry-pick: the worktree is left on
# <pkg>-land; landing again returns it to <pkg>, removes <pkg>-land and lands.
committed_package resumed
resumed_lock=$test_root/resumed/.git/index.lock
: >"$resumed_lock"
start_landing resumed LANDING_LOCK_WAIT=2
finish_landing resumed 30 "the lock wait did not stop at its bound"
[ "$landing_status" -eq 1 ] || fail "resumed: first run exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" "index lock failed: $resumed_lock still held after 2 s of waiting" \
    "resumed stop"
assert_contains "$landing_output" "main is untouched; the worktree is on resumed-land" "resumed state"
resumed_branch=$(cd "$test_root/resumed/.agents/worktrees/resumed" && git branch --show-current) ||
    fail "could not read the resumed worktree branch"
[ "$resumed_branch" = resumed-land ] || fail "resumed: the stop left the worktree on $resumed_branch"
rm -f "$resumed_lock"
start_landing resumed
finish_landing resumed 60 "the landing did not end"
[ "$landing_status" -eq 0 ] || fail "resumed: second run exit $landing_status, expected 0: $landing_output"
assert_contains "$landing_output" "resume: the worktree is back on resumed, resumed-land removed" \
    "resumed message"
resumed_staged=$(cd "$test_root/resumed" && git diff --cached --name-only) ||
    fail "could not read the resumed staged paths"
[ "$resumed_staged" = "${tool_prefix}committed.txt" ] ||
    fail "resumed staged paths differ: [$resumed_staged]"
printf 'resumed: a lock stop after the checkout, then landing again lands, exit 0\n'

# The same stop, then a change on <pkg>-land by hand: landing again refuses to remove the branch,
# first while the change is not committed, then once it is a commit of its own.
committed_package handmade
handmade_lock=$test_root/handmade/.git/index.lock
handmade_worktree=$test_root/handmade/.agents/worktrees/handmade
: >"$handmade_lock"
start_landing handmade LANDING_LOCK_WAIT=2
finish_landing handmade 30 "the lock wait did not stop at its bound"
[ "$landing_status" -eq 1 ] || fail "handmade: first run exit $landing_status, expected 1: $landing_output"
rm -f "$handmade_lock"
printf 'changed\n' >"$handmade_worktree/$tool_path/committed.txt"
start_landing handmade
finish_landing handmade 60 "the landing did not end"
[ "$landing_status" -eq 1 ] || fail "handmade: dirty rerun exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" \
    "preflight failed: handmade-land has changes not committed; commit or discard them by hand" \
    "handmade dirty"
(
    cd "$handmade_worktree" || exit 1
    git commit -q -a -m "by hand"
) || fail "could not commit on handmade-land"
handmade_head=$(cd "$handmade_worktree" && git rev-parse HEAD) || fail "could not read handmade-land"
start_landing handmade
finish_landing handmade 60 "the landing did not end"
[ "$landing_status" -eq 1 ] || fail "handmade: rerun exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" \
    "preflight failed: handmade-land holds commits that are not cherry-picks of handmade: $handmade_head" \
    "handmade commit"
handmade_after=$(cd "$handmade_worktree" && git rev-parse handmade-land) ||
    fail "handmade-land was removed"
[ "$handmade_after" = "$handmade_head" ] || fail "handmade-land moved to $handmade_after"
printf 'handmade: a change made by hand on the landing branch refused, the branch kept\n'

# The same stop, then a change staged on main, as a run stopped at a failed check after main's
# cherry-pick leaves it: landing again refuses before it touches either tree, <pkg>-land kept.
committed_package staged-main
staged_main_lock=$test_root/staged-main/.git/index.lock
: >"$staged_main_lock"
start_landing staged-main LANDING_LOCK_WAIT=2
finish_landing staged-main 30 "the lock wait did not stop at its bound"
[ "$landing_status" -eq 1 ] ||
    fail "staged-main: first run exit $landing_status, expected 1: $landing_output"
rm -f "$staged_main_lock"
printf 'staged by hand\n' >"$test_root/staged-main/staged.txt"
(
    cd "$test_root/staged-main" || exit 1
    git add staged.txt
) || fail "could not stage on the staged-main main"
start_landing staged-main
finish_landing staged-main 60 "the landing did not end"
[ "$landing_status" -eq 1 ] ||
    fail "staged-main: rerun exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" \
    "preflight failed: main holds staged or unmerged changes, so staged-main-land is kept" \
    "staged-main refusal"
staged_main_worktree=$test_root/staged-main/.agents/worktrees/staged-main
staged_main_branch=$(cd "$staged_main_worktree" && git branch --show-current) ||
    fail "could not read the staged-main worktree branch"
[ "$staged_main_branch" = staged-main-land ] ||
    fail "staged-main: the refused rerun left the worktree on $staged_main_branch"
staged_main_staged=$(cd "$test_root/staged-main" && git diff --cached --name-only) ||
    fail "could not read the staged-main staged paths"
[ "$staged_main_staged" = staged.txt ] ||
    fail "staged-main: main's staged paths changed: [$staged_main_staged]"
printf 'staged main: a rerun onto a main with staged changes refused, both trees kept\n'

# A bound that is not a whole number of seconds is refused before anything is touched.
committed_package bad-bound
start_landing bad-bound LANDING_LOCK_WAIT=2s
finish_landing bad-bound 30 "the landing did not end"
[ "$landing_status" -eq 64 ] || fail "bad bound: exit $landing_status, expected 64: $landing_output"
assert_contains "$landing_output" \
    "arguments failed: LANDING_LOCK_WAIT must be a whole number of seconds: 2s" "bad bound message"
printf 'bad bound: LANDING_LOCK_WAIT=2s refused with exit 64\n'

# The landings below start land.sh from their own ledger, with HOME in the scratch folder so that
# an installed land skill is never found.
scratch_home=$test_root/home
mkdir -p "$scratch_home"

# A red command in the verify list fails the landing after main's cherry-pick with verify.sh's
# RED line and output, and the commands after it do not run. Red when land.sh ignores
# verify.sh's exit status.
committed_package red-list
printf 'printf "FAIL: planted\\n"\nexit 1\n' >"$test_root/red-list/red.test.sh"
make_ledger "$test_root/red-list-ledger" <<'EOF'
printf 'PASS: before the red line\n' | tail -1
sh red.test.sh 2>&1 | tail -1
touch after-red
EOF
ledger_script=$test_root/red-list-ledger/land.sh
start_landing red-list HOME="$scratch_home"
finish_landing red-list 60 "the landing did not end"
[ "$landing_status" -eq 1 ] || fail "red list: exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" "PASS: before the red line
RED: sh red.test.sh 2>&1 | tail -1
exit status: 1
FAIL: planted" "red list runner output"
assert_contains "$landing_output" "verify list failed" "red list message"
[ ! -e "$test_root/red-list/after-red" ] || fail "red list: a command after the red line ran"
case "$landing_output" in
    *"=== booking ==="*) fail "red list: the landing went on to the booking" ;;
esac
printf 'red list: a red command fails the landing with its RED line, exit 1\n'

# A ledger without verify.sh finds it in the land skill's templates under the repository's
# .agents/skills. Red when land.sh looks for verify.sh only beside itself.
committed_package lookup
printf 'test -f %s/committed.txt\n' "$tool_path" |
    make_ledger "$test_root/lookup-ledger"
rm "$test_root/lookup-ledger/verify.sh"
mkdir -p "$test_root/lookup/.agents/skills/land/templates"
cp "$verify_script" "$test_root/lookup/.agents/skills/land/templates/verify.sh" ||
    fail "could not install verify.sh in the lookup repository"
ledger_script=$test_root/lookup-ledger/land.sh
start_landing lookup HOME="$scratch_home"
finish_landing lookup 60 "the landing did not end"
[ "$landing_status" -eq 0 ] || fail "lookup: exit $landing_status, expected 0: $landing_output"
assert_contains "$landing_output" "verify: 1 commands passed" "lookup verify list"
printf "lookup: verify.sh found in the repository's .agents/skills, exit 0\n"

# A verify.sh found in none of the places fails before main is touched, with a message naming
# every place looked in. Red when the preflight does not look for verify.sh (the landing then
# stages main before it fails), and when the message leaves out a place.
committed_package nofind
printf 'true\n' | make_ledger "$test_root/nofind-ledger"
rm "$test_root/nofind-ledger/verify.sh"
ledger_script=$test_root/nofind-ledger/land.sh
start_landing nofind HOME="$scratch_home" CLAUDE_CONFIG_DIR=
finish_landing nofind 60 "the landing did not end"
[ "$landing_status" -eq 1 ] || fail "not found: exit $landing_status, expected 1: $landing_output"
nofind_places="$test_root/nofind-ledger, $test_root/nofind/.agents/skills/land/templates"
nofind_places="$nofind_places, $scratch_home/.agents/skills/land/templates"
nofind_places="$nofind_places, $scratch_home/.claude/skills/land/templates"
assert_contains "$landing_output" \
    "preflight failed: verify.sh not found beside this script or in the land skill's templates: \
$nofind_places" "not found message"
nofind_staged=$(cd "$test_root/nofind" && git diff --cached --name-only) ||
    fail "could not read the not-found staged paths"
[ -z "$nofind_staged" ] || fail "not found: main was touched: [$nofind_staged]"
printf 'not found: no verify.sh in any place refused before main is touched, exit 1\n'

# A ledger without its state file fails before main is touched. Red when the preflight does not
# check for the state file (verify.sh then refuses after main's cherry-pick).
committed_package nostate
printf 'true\n' | make_ledger "$test_root/nostate-ledger"
rm "$test_root/nostate-ledger/orchestrator-state.md"
ledger_script=$test_root/nostate-ledger/land.sh
start_landing nostate HOME="$scratch_home"
finish_landing nostate 60 "the landing did not end"
[ "$landing_status" -eq 1 ] ||
    fail "no state file: exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" \
    "preflight failed: state file not found: $test_root/nostate-ledger/orchestrator-state.md" \
    "no state file message"
nostate_staged=$(cd "$test_root/nostate" && git diff --cached --name-only) ||
    fail "could not read the no-state staged paths"
[ -z "$nostate_staged" ] || fail "no state file: main was touched: [$nostate_staged]"
printf 'no state file: a ledger without orchestrator-state.md refused before main is touched\n'

# A state file verify.sh cannot use (no yaml block) fails the landing with exit 1, the exit of a
# failed check, and never with verify.sh's own 64, which land.sh keeps for refusals made before
# main is touched. Red when land.sh passes verify.sh's exit status on.
committed_package badstate
printf 'true\n' | make_ledger "$test_root/badstate-ledger"
printf '# no yaml block\n' >"$test_root/badstate-ledger/orchestrator-state.md"
ledger_script=$test_root/badstate-ledger/land.sh
start_landing badstate HOME="$scratch_home"
finish_landing badstate 60 "the landing did not end"
[ "$landing_status" -eq 1 ] ||
    fail "unusable state file: exit $landing_status, expected 1: $landing_output"
assert_contains "$landing_output" "has no yaml block" "unusable state file verify.sh output"
assert_contains "$landing_output" "verify list failed" "unusable state file message"
printf 'unusable state file: verify.sh refusing the state file fails the landing, exit 1\n'
ledger_script=$ledger/land.sh

# A ledger inside the repository, as a plan keeps it: $2 is the ledger root, $3 the land.sh to
# copy there, and $4, when given, a file of the package's change that the worktree adds beside
# committed.txt. The ledger is committed on main before the worktree is made; then the builder
# leaves its report and another ledger file untracked in the worktree, and main commits its own
# copy of that report, as the orchestrator saves it. The landing stages the package's change and
# no ledger file: main's report stays main's, and the other file does not reach main. Red when
# the worktree's add takes the ledger root in (the cherry-pick then conflicts on the report), and
# when the worktree's checkout of main does not count the untracked ledger files as ignored (the
# checkout then stops on the report).
ledger_case() {
    ledger_repo=$test_root/$1
    initialise_repo "$ledger_repo"
    ledger_dir=$ledger_repo/$2/plan
    printf 'test -f %scommitted.txt\n' "$tool_prefix" | make_ledger "$ledger_dir" "$3"
    (
        cd "$ledger_repo" || exit 1
        git add -- ":(literal)$2"
        git commit -q -m "Open the plan"
    ) || fail "$1: could not commit the ledger"
    ledger_base=$(cd "$ledger_repo" && git rev-parse HEAD) || fail "$1: could not read the base"
    (
        cd "$ledger_repo" || exit 1
        git worktree add -q -b "$1" ".agents/worktrees/$1" "$ledger_base"
    ) || fail "$1: could not create the worktree"
    ledger_tree=$ledger_repo/.agents/worktrees/$1
    printf 'committed\n' >"$ledger_tree/${tool_prefix}committed.txt"
    ledger_expected=${tool_prefix}committed.txt
    if [ -n "${4:-}" ]; then
        mkdir -p "$(dirname "$ledger_tree/$4")"
        printf 'package\n' >"$ledger_tree/$4"
        ledger_expected=$(printf '%s\n%s' "$ledger_expected" "$4")
    fi
    mkdir -p "$ledger_tree/$2/plan/agents/reviews"
    printf 'builder copy\n' >"$ledger_tree/$2/plan/agents/reviews/report.md"
    printf 'builder only\n' >"$ledger_tree/$2/plan/agents/reviews/other.md"
    mkdir -p "$ledger_dir/agents/reviews"
    printf 'main copy\n' >"$ledger_dir/agents/reviews/report.md"
    (
        cd "$ledger_repo" || exit 1
        git add -- ":(literal)$2/plan/agents/reviews/report.md"
        git commit -q -m "Save the report"
    ) || fail "$1: could not commit main's report"
    (
        cd "$ledger_repo" || exit 1
        HOME="$scratch_home" sh "$ledger_dir/land.sh" "$1" "$ledger_base" --no-browser
    ) >"$test_root/$1.out" 2>&1
    ledger_status=$?
    ledger_output=$(cat "$test_root/$1.out")
    [ "$ledger_status" -eq 0 ] || fail "$1: exit $ledger_status, expected 0: $ledger_output"
    ledger_staged=$(cd "$ledger_repo" && git diff --cached --name-only) ||
        fail "$1: could not read the staged paths"
    [ "$ledger_staged" = "$ledger_expected" ] ||
        fail "$1: staged paths differ: [$ledger_staged]"
    [ "$(cat "$ledger_dir/agents/reviews/report.md")" = "main copy" ] ||
        fail "$1: main's report changed: [$(cat "$ledger_dir/agents/reviews/report.md")]"
    [ ! -e "$ledger_dir/agents/reviews/other.md" ] || fail "$1: a ledger file of the worktree reached main"
}
ledger_case ledger "$ledger_root" "$land_script"
printf 'ledger: the ledger files in the worktree left out, main keeps its report, exit 0\n'

# The same under a ledger root holding pattern characters, set on the ADAPT line, with a file of
# the package's change that those characters would match as a pattern. Red when the pattern the
# checkout reads is not escaped (it then names another folder, and the checkout stops on the
# report), and when the add reads the ledger root as a pattern (plans/abc.txt is then left out).
sed 's#^landing_ledger_root=[^ ]*#landing_ledger_root=plans/[a]*#' "$land_script" \
    >"$test_root/pattern-land.sh" || fail "could not write the land.sh with a pattern ledger root"
ledger_case pattern 'plans/[a]*' "$test_root/pattern-land.sh" "${tool_prefix}plans/abc.txt"
printf 'pattern: a ledger root holding [a]* left out as written, exit 0\n'

# The same with the ledger root written on the ADAPT line as plan.yaml may write it: with a
# trailing slash, and with a leading ./ . Red when the value is not normalised (the checkout's
# ignore pattern then matches nothing, and the checkout stops on the report).
sed "s#^landing_ledger_root=[^ ]*#landing_ledger_root=$ledger_root/#" "$land_script" \
    >"$test_root/slash-land.sh" || fail "could not write the land.sh with a trailing slash"
ledger_case slash "$ledger_root" "$test_root/slash-land.sh"
printf 'slash: a ledger root written with a trailing slash left out, exit 0\n'
sed "s#^landing_ledger_root=[^ ]*#landing_ledger_root=./$ledger_root#" "$land_script" \
    >"$test_root/dot-land.sh" || fail "could not write the land.sh with a leading ./"
ledger_case dot "$ledger_root" "$test_root/dot-land.sh"
printf 'dot: a ledger root written with a leading ./ left out, exit 0\n'

# A ledger root that is not a folder inside the repository is refused before main is touched:
# empty, the whole tree, the parent, ./ or / (empty once normalised), absolute, or leaving the
# repository. Red when the check of the ledger root is removed (no preflight message).
for bad_root in '' . .. ./ / /tmp/ledger ../ledger a/../../ledger; do
    committed_package bad-root
    sed "s#^landing_ledger_root=[^ ]*#landing_ledger_root='$bad_root'#" "$land_script" \
        >"$test_root/bad-root-land.sh" || fail "could not write the land.sh with a bad ledger root"
    printf 'true\n' | make_ledger "$test_root/bad-root-ledger" "$test_root/bad-root-land.sh"
    ledger_script=$test_root/bad-root-ledger/land.sh
    start_landing bad-root HOME="$scratch_home"
    finish_landing bad-root 60 "the landing did not end"
    [ "$landing_status" -eq 1 ] ||
        fail "ledger root [$bad_root]: exit $landing_status, expected 1: $landing_output"
    assert_contains "$landing_output" \
        "preflight failed: landing_ledger_root must be a folder inside the repository: $bad_root" \
        "ledger root [$bad_root]"
    bad_root_staged=$(cd "$test_root/bad-root" && git diff --cached --name-only) ||
        fail "could not read the bad-root staged paths"
    [ -z "$bad_root_staged" ] || fail "ledger root [$bad_root]: main was touched: [$bad_root_staged]"
    rm -rf "$test_root/bad-root" "$test_root/bad-root-ledger" "$test_root/bad-root-tmp"
done
printf 'ledger root: empty, ., .., ./, /, absolute and leaving the repository refused, exit 1\n'
ledger_script=$ledger/land.sh

# A plan that points the ADAPT line at another tool directory stages that directory and nothing else.
adapted_dir=$test_root/adapted-script
sed 's#^landing_tool_path=[^ ]*#landing_tool_path=tools/demo#' "$land_script" \
    >"$test_root/adapted-land.sh" || fail "could not write the adapted land.sh"
printf 'test -f tools/demo/pending.txt\n' | make_ledger "$adapted_dir" "$test_root/adapted-land.sh"
tool_path=tools/demo
set_tool_prefix
adapted_repo=$test_root/adapted
initialise_repo "$adapted_repo"
adapted_base=$(cd "$adapted_repo" && git rev-parse HEAD) || fail "could not read adapted base"
(
    cd "$adapted_repo" || exit 1
    git worktree add -q -b adapted .agents/worktrees/adapted "$adapted_base"
) || fail "could not create adapted worktree"
printf 'pending\n' >"$adapted_repo/.agents/worktrees/adapted/$tool_path/pending.txt"
printf 'outside\n' >"$adapted_repo/.agents/worktrees/adapted/outside.txt"
(
    cd "$adapted_repo" || exit 1
    sh "$adapted_dir/land.sh" adapted "$adapted_base" --no-browser
) >"$test_root/adapted.out" 2>&1
adapted_status=$?
if [ "$adapted_status" -ne 0 ]; then
    cat "$test_root/adapted.out" >&2
    fail "adapted landing exited $adapted_status, expected 0"
fi
adapted_staged=$(cd "$adapted_repo" && git diff --cached --name-only) || fail "could not read adapted staged paths"
if [ "$adapted_staged" != "tools/demo/pending.txt" ]; then
    fail "adapted staged paths differ: [$adapted_staged]"
fi
printf 'adapted: tools/demo landed, the file outside it left unstaged\n'
usage_root=$test_root/usage
mkdir -p "$usage_root"
cat >"$usage_root/claude.jsonl" <<'JSONL'
{"type":"user","timestamp":"2026-09-16T10:01:00.000Z","message":{"role":"user","content":"go"}}
{"type":"assistant","timestamp":"2026-09-16T09:59:00.000Z","message":{"id":"msg_before","usage":{"output_tokens":999,"cache_creation_input_tokens":999,"cache_read_input_tokens":999,"input_tokens":999}}}
{"type":"assistant","timestamp":"2026-09-16T10:05:00.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:05:01.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:30:00.000Z","message":{"id":"msg_b","usage":{"output_tokens":20,"cache_creation_input_tokens":0,"cache_read_input_tokens":2000,"input_tokens":3}}}
{"type":"assistant","timestamp":"2026-09-16T10:40:00","message":{"id":"msg_no_offset","usage":{"output_tokens":999,"cache_creation_input_tokens":999,"cache_read_input_tokens":999,"input_tokens":999}}}
{"type":"assistant","timestamp":"2026-09-16T11:01:00.000Z","message":{"id":"msg_after","usage":{"output_tokens":999,"cache_creation_input_tokens":999,"cache_read_input_tokens":999,"input_tokens":999}}}
JSONL
# The window is given with an offset, as git's %cI gives it, while the log carries Z times.
claude_row=$(python3 "$usage_script" "$usage_root/claude.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00) || fail "usage.py failed on the Claude Code log"
[ "$claude_row" = "2 messages, 30 output tokens, 100 cache-write tokens, 3000 cache-read tokens, 8 fresh input tokens, 60 minutes" ] || fail "Claude Code usage row differs: [$claude_row]"
printf 'usage: the Claude Code row verified, one message per id, the window across offsets\n'
# A file in which no line is an assistant message is not a Claude Code session log: refused with
# exit 64 and a message naming it, no row printed. Red when usage.py reads any JSON lines as a log.
cat >"$usage_root/other.jsonl" <<'JSONL'
{"type":"user","timestamp":"2026-09-16T10:01:00.000Z","message":{"role":"user","content":"go"}}
{"type":"note","timestamp":"2026-09-16T10:05:00.000Z","payload":{"usage":{"output_tokens":10}}}
[1, 2]
JSONL
python3 -B "$usage_script" "$usage_root/other.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00 \
    >"$test_root/usage.out" 2>"$test_root/usage.err"
usage_status=$?
usage_errors=$(cat "$test_root/usage.err")
[ "$usage_status" -eq 64 ] || fail "usage.py on a file that is not a Claude Code log exited $usage_status, expected 64: $usage_errors"
[ "$usage_errors" = "usage.py: $usage_root/other.jsonl is not a Claude Code session log: no line is an assistant message" ] ||
    fail "usage.py on a file that is not a Claude Code log: message differs: [$usage_errors]"
[ ! -s "$test_root/usage.out" ] || fail "usage.py printed a row for a file that is not a Claude Code log"
printf 'usage: a file that is not a Claude Code session log refused, exit 64\n'
# A window time without an offset, or one that cannot be read, is refused with exit 64 and a
# message naming it, for either argument.
for usage_window in \
    "from|2026-09-24T19:00:00|2026-09-24T20:00:00+02:00|has no offset" \
    "to|2026-09-24T19:00:00+02:00|2026-09-24T20:00:00|has no offset" \
    "from|yesterday|2026-09-24T20:00:00+02:00|cannot be read" \
    "to|2026-09-24T19:00:00+02:00|at 8 pm|cannot be read"; do
    usage_which=$(printf '%s' "$usage_window" | cut -d '|' -f 1)
    usage_from=$(printf '%s' "$usage_window" | cut -d '|' -f 2)
    usage_to=$(printf '%s' "$usage_window" | cut -d '|' -f 3)
    usage_reason=$(printf '%s' "$usage_window" | cut -d '|' -f 4)
    if [ "$usage_which" = from ]; then
        usage_named=$usage_from
    else
        usage_named=$usage_to
    fi
    python3 -B "$usage_script" "$usage_root/claude.jsonl" "$usage_from" "$usage_to" \
        >"$test_root/usage.out" 2>"$test_root/usage.err"
    usage_status=$?
    usage_errors=$(cat "$test_root/usage.err")
    [ "$usage_status" -eq 64 ] ||
        fail "usage.py $usage_from $usage_to exited $usage_status, expected 64: $usage_errors"
    usage_expected="usage.py: the $usage_which time $usage_named $usage_reason; give an ISO time"
    usage_expected="$usage_expected with an offset, such as 2026-09-24T19:00:00+02:00"
    [ "$usage_errors" = "$usage_expected" ] ||
        fail "usage.py $usage_from $usage_to: message differs: [$usage_errors]"
    [ ! -s "$test_root/usage.out" ] || fail "usage.py $usage_from $usage_to printed a row"
done
printf 'usage: a window time without an offset or unreadable refused, exit 64, both arguments\n'
# The example plan.yaml files carry every key of the state template's configuration block that
# plan.yaml sets, plus the keys only the skills read, each marked required or optional with a
# default equal to its value. The check runs from the folder given: inside an Ordo checkout (the git
# repository around it holds skills/plan/templates/) a missing example or state template fails,
# and only a copy outside any Ordo checkout skips the check, saying so.
check_examples() {
    examples_top=$(git -C "$1" rev-parse --show-toplevel 2>/dev/null) || examples_top=''
    if [ -z "$examples_top" ] || [ ! -d "$examples_top/skills/plan/templates" ]; then
        examples_note="no git repository around $1 holds skills/plan/templates/"
        printf 'examples: not in an Ordo checkout (%s), not checked\n' "$examples_note"
        return 0
    fi
    examples_root=$examples_top/skills
    for examples_file in plan.yaml plan.projects.yaml orchestrator-state.md; do
        examples_path=$examples_root/plan/templates/$examples_file
        [ -f "$examples_path" ] || fail "examples: $examples_path is missing from an Ordo checkout"
    done
    python3 -B - "$examples_root" <<'PY' ||
import re, sys, yaml
root = sys.argv[1]
template = open(f"{root}/plan/templates/orchestrator-state.md").read()
block = re.search(r"```yaml\n(.*?)```", template, re.S).group(1)
expected = {k for k in re.findall(r"^([a-z_]+):", block, re.M)} - {"verify", "executor"}
expected |= {"roadmap", "verification", "ledger_root", "archive_root"}
single = yaml.safe_load(open(f"{root}/plan/templates/plan.yaml"))
errors = []
if set(single) != expected:
    errors.append(f"plan.yaml keys: missing {sorted(expected - set(single))}, extra {sorted(set(single) - expected)}")
for line in open(f"{root}/plan/templates/plan.yaml"):
    m = re.match(r"^([a-z_]+):\s*(.*?)\s+#\s*(required\.|optional, default (.*?)\.\s)", line)
    if re.match(r"^[a-z_]+:", line) and not m:
        errors.append(f"plan.yaml line not marked required or optional with a default: {line.strip()}")
    elif m and m.group(4) is not None and yaml.safe_load(m.group(2)) != yaml.safe_load(m.group(4)):
        errors.append(f"plan.yaml {m.group(1)}: value {m.group(2)} differs from its default {m.group(4)}")
for name, keys in yaml.safe_load(open(f"{root}/plan/templates/plan.projects.yaml"))["projects"].items():
    if set(keys) != expected:
        errors.append(f"plan.projects.yaml {name}: missing {sorted(expected - set(keys))}, extra {sorted(set(keys) - expected)}")
if errors:
    print("\n".join(errors), file=sys.stderr)
    sys.exit(1)
PY
        fail "example plan.yaml files differ from the state template"
    printf 'examples: plan.yaml and plan.projects.yaml match the state template, every key marked\n'
}

# A copy outside any git repository, and one inside a git repository that is not an Ordo checkout,
# skip the check; a copy inside an Ordo checkout that lacks an example fails.
examples_outside=$test_root/examples-outside/skills/land/templates
mkdir -p "$examples_outside"
if git -C "$examples_outside" rev-parse --show-toplevel >/dev/null 2>&1; then
    fail "the scratch directory $test_root is inside a git repository"
fi
examples_output=$(check_examples "$examples_outside") ||
    fail "examples outside a repository exited non-zero"
examples_expected="examples: not in an Ordo checkout (no git repository around $examples_outside"
examples_expected="$examples_expected holds skills/plan/templates/), not checked"
[ "$examples_output" = "$examples_expected" ] ||
    fail "examples outside a repository: [$examples_output]"
examples_other=$test_root/examples-other
mkdir -p "$examples_other/tools/land"
git init -q "$examples_other" || fail "could not create the non-Ordo repository"
examples_output=$(check_examples "$examples_other/tools/land") ||
    fail "examples in a non-Ordo repository exited non-zero"
assert_contains "$examples_output" "examples: not in an Ordo checkout" "examples in a non-Ordo repository"
examples_ordo=$test_root/examples-ordo
mkdir -p "$examples_ordo/skills/plan/templates" "$examples_ordo/skills/land/templates"
git init -q "$examples_ordo" || fail "could not create the Ordo-shaped repository"
printf 'verify: []\n' >"$examples_ordo/skills/plan/templates/plan.yaml"
examples_status=0
(check_examples "$examples_ordo/skills/land/templates") >"$test_root/examples.out" 2>&1 ||
    examples_status=$?
[ "$examples_status" -eq 1 ] ||
    fail "examples in an Ordo checkout without its examples exited $examples_status, expected 1"
assert_contains "$(cat "$test_root/examples.out")" \
    "FAIL: examples: $examples_ordo/skills/plan/templates/plan.projects.yaml is missing" \
    "examples in an Ordo checkout"
printf 'examples: skipped outside an Ordo checkout, a missing example fails inside one\n'
check_examples "$script_dir"
printf 'PASS: land.sh and usage.py scratch tests\n'

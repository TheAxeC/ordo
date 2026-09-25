#!/bin/sh
# Exercise the landing helper in isolated repositories: a clean landing, a conflicting one and
# its rerun refused, a builder that committed everything, an index lock held while a git process
# runs (the bounded wait, shortened through LANDING_LOCK_WAIT), a stale lock, a lock gone before the
# bound, a stop at the bound after the worktree's checkout and a rerun that lands, a rerun refused
# while the landing branch holds a change made by hand or main holds staged changes, a bound that
# is not a whole number, and a tool directory set on the ADAPT line. Check usage.py on a Claude Code
# log and a Codex rollout, and its refusal of a window time without an offset or unreadable. Check
# the example plan.yaml files against the state template: inside an Ordo checkout a missing example
# fails, and only a copy outside one skips the check.
# A plan copies this file beside its land.sh; the stub package.json scripts and the expected rows
# follow the ADAPT edits made there.

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
# The fixtures follow the tool directory land.sh names on its ADAPT line.
tool_path=$(sed -n 's/^landing_tool_path=\([^ ]*\).*/\1/p' "$land_script")
[ -n "$tool_path" ] || fail "could not read landing_tool_path from $land_script"

write_tool_stub() {
    stub_root=$1
    mkdir -p "$stub_root/$tool_path/src" "$stub_root/$tool_path/tests" "$stub_root/$tool_path/bin" "$stub_root/$tool_path/config"
    printf 'source\n' >"$stub_root/$tool_path/src/source.txt"
    printf 'test\n' >"$stub_root/$tool_path/tests/test.txt"
    printf 'bin\n' >"$stub_root/$tool_path/bin/bin.txt"
    printf 'config\n' >"$stub_root/$tool_path/config/config.txt"
    cat >"$stub_root/$tool_path/package.json" <<'JSON'
{
    "name": "landing-test",
    "private": true,
    "scripts": {
        "test": "echo test-stub",
        "check": "echo check-stub",
        "build": "echo build-stub",
        "format:check": "echo format-stub",
        "lint": "echo lint-stub",
        "test:browser": "echo browser-stub"
    }
}
JSON
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

write_events() {
    runs_root=$1
    mkdir -p "$runs_root"
    cat >"$runs_root/events.jsonl" <<'JSONL'
{"type":"turn.completed","usage":{"input_tokens":100,"cached_input_tokens":50,"output_tokens":10,"reasoning_output_tokens":3}}
{"type":"item.completed","item":{"type":"command_execution"}}
{"type":"turn.completed","usage":{"input_tokens":200,"cached_input_tokens":100,"output_tokens":20,"reasoning_output_tokens":4}}
{"type":"item.completed","item":{"type":"command_execution"}}
JSONL
    cat >"$runs_root/repair-events.jsonl" <<'JSONL'
{"type":"turn.completed","usage":{"input_tokens":10,"cached_input_tokens":5,"output_tokens":1,"reasoning_output_tokens":1}}
{"type":"turn.completed","usage":{"input_tokens":20,"cached_input_tokens":10,"output_tokens":2,"reasoning_output_tokens":1}}
{"type":"item.completed","item":{"type":"command_execution"}}
JSONL
    cat >"$runs_root/review-events.jsonl" <<'JSONL'
{"type":"turn.completed","usage":{"input_tokens":5,"cached_input_tokens":2,"output_tokens":1,"reasoning_output_tokens":1}}
{"type":"turn.completed","usage":{"input_tokens":15,"cached_input_tokens":8,"output_tokens":1,"reasoning_output_tokens":1}}
{"type":"item.completed","item":{"type":"command_execution"}}
JSONL
    cat >"$runs_root/session.jsonl" <<'JSONL'
{"type":"assistant","timestamp":"2026-09-16T10:05:00.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:05:01.000Z","message":{"id":"msg_a","usage":{"output_tokens":10,"cache_creation_input_tokens":100,"cache_read_input_tokens":1000,"input_tokens":5}}}
{"type":"assistant","timestamp":"2026-09-16T10:30:00.000Z","message":{"id":"msg_b","usage":{"output_tokens":20,"cache_creation_input_tokens":0,"cache_read_input_tokens":2000,"input_tokens":3}}}
JSONL
    : >"$runs_root/pid.txt"
    : >"$runs_root/exit.txt"
    : >"$runs_root/repair-pid.txt"
    : >"$runs_root/repair-exit.txt"
    : >"$runs_root/review-pid.txt"
    : >"$runs_root/review-exit.txt"
    touch -t 202609140100.00 "$runs_root/pid.txt"
    touch -t 202609140101.05 "$runs_root/exit.txt"
    touch -t 202609140200.00 "$runs_root/repair-pid.txt"
    touch -t 202609140200.10 "$runs_root/repair-exit.txt"
    touch -t 202609140300.00 "$runs_root/review-pid.txt"
    touch -t 202609140300.20 "$runs_root/review-exit.txt"
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
clean_runs=$test_root/clean-runs
write_events "$clean_runs"

(
    cd "$clean_repo" || exit 1
    sh "$land_script" clean "$clean_base" "$clean_runs" --no-browser --session "$clean_runs/session.jsonl" --since 2026-09-16T12:00:00+02:00
) >"$test_root/clean.out" 2>&1
clean_status=$?
clean_output=$(cat "$test_root/clean.out")
if [ "$clean_status" -ne 0 ]; then
    printf '%s\n' "$clean_output" >&2
    fail "clean landing exited $clean_status, expected 0"
fi

clean_staged=$(cd "$clean_repo" && git diff --cached --name-only) || fail "could not read clean staged paths"
clean_expected=$(printf '%s\n%s' "$tool_path/committed.txt" "$tool_path/pending.txt")
if [ "$clean_staged" != "$clean_expected" ]; then
    fail "clean staged paths differ: [$clean_staged]"
fi
assert_contains "$clean_output" "clean, worker codex:gpt-5.6-sol at high, first run: 300 in / 150 cached / 30 out (7 reasoning), 2 items, 65 s (01:00:00 to 01:01:05); repair round on the same thread: 30 in / 15 cached / 3 out (2 reasoning), 1 items, 10 s; +2 -0 over 2 files; first report passed its bar: <yes or no>; <N> fixes at landing" "worker row"
assert_contains "$clean_output" "clean, reviewer codex:gpt-5.6-sol at high, read-only: review 20 in / 10 cached / 2 out, 1 items, 20 s" "reviewer row"
case "$clean_output" in
    *"second review"*)
        fail "reviewer row still carries a second review"
        ;;
esac
assert_contains "$clean_output" "Orchestrator row (2026-09-16T12:00:00+02:00 to " "orchestrator row window"
assert_contains "$clean_output" "): 2 messages, 30 output tokens, 100 cache-write tokens, 3000 cache-read tokens, 8 fresh input tokens, " "orchestrator row"
assert_contains "$clean_output" "$tool_path/committed.txt" "booking paths"
assert_contains "$clean_output" "$tool_path/pending.txt" "booking paths"
printf 'clean: exit 0, staged paths, usage rows and the orchestrator row verified\n'

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
conflict_runs=$test_root/conflict-runs
mkdir -p "$conflict_runs"

(
    cd "$conflict_repo" || exit 1
    sh "$land_script" conflict "$conflict_base" "$conflict_runs" --no-browser
) >"$test_root/conflict.out" 2>&1
conflict_status=$?
conflict_output=$(cat "$test_root/conflict.out")
if [ "$conflict_status" -ne 2 ]; then
    printf '%s\n' "$conflict_output" >&2
    fail "conflict landing exited $conflict_status, expected 2"
fi
assert_contains "$conflict_output" "worktree git cherry-pick failed" "conflict step"
assert_contains "$conflict_output" "Conflicting paths:" "conflict heading"
assert_contains "$conflict_output" "$tool_path/conflict.txt" "conflict path"
conflict_branch=$(cd "$conflict_repo/.agents/worktrees/conflict" && git branch --show-current) || fail "could not read conflict branch"
if [ "$conflict_branch" != "conflict-land" ]; then
    fail "conflict worktree is on $conflict_branch, expected conflict-land"
fi
(
    cd "$conflict_repo" || exit 1
    sh "$land_script" conflict "$conflict_base" "$conflict_runs" --no-browser
) >"$test_root/conflict-again.out" 2>&1
conflict_status=$?
[ "$conflict_status" -eq 1 ] || fail "conflict landing again exited $conflict_status, expected 1"
assert_contains "$(cat "$test_root/conflict-again.out")" \
    "preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand" \
    "conflict landing again"
printf 'conflict: exit 2, conflicting path and retained landing branch verified, landing again refused\n'

# A scratch repository with a worktree for package $1 holding one committed change and nothing
# pending, and an empty runs directory; sets $package_base.
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
    mkdir -p "$test_root/$1-runs" "$test_root/$1-tmp"
}

# Starts land.sh on package $1 in the background, with the environment assignments that follow;
# sets $landing_pid. Its output goes to $test_root/$1.out and its temporary files under
# $test_root/$1-tmp.
start_landing() {
    landing_name=$1
    shift
    (
        cd "$test_root/$landing_name" || exit 1
        exec env TMPDIR="$test_root/$landing_name-tmp" "$@" sh "$land_script" "$landing_name" \
            "$package_base" "$test_root/$landing_name-runs" --no-browser
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
[ "$committed_staged" = "$tool_path/committed.txt" ] ||
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
[ "$resumed_staged" = "$tool_path/committed.txt" ] ||
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

# A plan that points the ADAPT line at another tool directory stages that directory and nothing else.
adapted_dir=$test_root/adapted-script
mkdir -p "$adapted_dir"
sed 's#^landing_tool_path=[^ ]*#landing_tool_path=tools/demo#' "$land_script" >"$adapted_dir/land.sh"
tool_path=tools/demo
adapted_repo=$test_root/adapted
initialise_repo "$adapted_repo"
adapted_base=$(cd "$adapted_repo" && git rev-parse HEAD) || fail "could not read adapted base"
(
    cd "$adapted_repo" || exit 1
    git worktree add -q -b adapted .agents/worktrees/adapted "$adapted_base"
) || fail "could not create adapted worktree"
printf 'pending\n' >"$adapted_repo/.agents/worktrees/adapted/$tool_path/pending.txt"
printf 'outside\n' >"$adapted_repo/.agents/worktrees/adapted/outside.txt"
adapted_runs=$test_root/adapted-runs
write_events "$adapted_runs"
(
    cd "$adapted_repo" || exit 1
    sh "$adapted_dir/land.sh" adapted "$adapted_base" "$adapted_runs" --no-browser
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
usage_script=$script_dir/usage.py
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
# Inside the window: three assistant messages and two token_count events, beside a user message,
# a function call, a reasoning item and an agent_message event, none of which is counted.
cat >"$usage_root/codex.jsonl" <<'JSONL'
{"timestamp":"2026-09-16T09:00:00.000Z","type":"session_meta","payload":{"id":"fixture"}}
{"timestamp":"2026-09-16T09:58:00.000Z","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"before"}]}}
{"timestamp":"2026-09-16T09:59:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":100,"cached_input_tokens":50,"cache_write_input_tokens":0,"output_tokens":10}}}}
{"timestamp":"2026-09-16T10:02:00.000Z","type":"response_item","payload":{"type":"message","role":"user","content":[{"type":"input_text","text":"go"}]}}
{"timestamp":"2026-09-16T10:05:00.000Z","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"one"}]}}
{"timestamp":"2026-09-16T10:06:00.000Z","type":"response_item","payload":{"type":"function_call","name":"shell","arguments":"{}","call_id":"call_a"}}
{"timestamp":"2026-09-16T10:07:00.000Z","type":"response_item","payload":{"type":"reasoning","summary":[]}}
{"timestamp":"2026-09-16T10:08:00.000Z","type":"event_msg","payload":{"type":"agent_message","message":"one"}}
{"timestamp":"2026-09-16T10:10:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":300,"cached_input_tokens":150,"cache_write_input_tokens":20,"output_tokens":40}}}}
{"timestamp":"2026-09-16T10:20:00.000Z","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"two"}]}}
{"timestamp":"2026-09-16T10:40:00.000Z","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"three"}]}}
{"timestamp":"2026-09-16T10:50:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":600,"cached_input_tokens":300,"cache_write_input_tokens":20,"output_tokens":70}}}}
{"timestamp":"2026-09-16T10:55:00","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"no offset"}]}}
{"timestamp":"2026-09-16T10:56:00","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":8000,"cached_input_tokens":8000,"cache_write_input_tokens":8000,"output_tokens":8000}}}}
{"timestamp":"2026-09-16T11:30:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":9000,"cached_input_tokens":9000,"cache_write_input_tokens":9000,"output_tokens":9000}}}}
{"timestamp":"2026-09-16T11:40:00.000Z","type":"response_item","payload":{"type":"message","role":"assistant","content":[{"type":"output_text","text":"after"}]}}
JSONL
# The window is given with an offset, as git's %cI gives it, while the logs carry Z times.
claude_row=$(python3 "$usage_script" "$usage_root/claude.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00) || fail "usage.py failed on the Claude Code log"
[ "$claude_row" = "2 messages, 30 output tokens, 100 cache-write tokens, 3000 cache-read tokens, 8 fresh input tokens, 60 minutes" ] || fail "Claude Code usage row differs: [$claude_row]"
codex_row=$(python3 "$usage_script" "$usage_root/codex.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00) || fail "usage.py failed on the Codex rollout"
[ "$codex_row" = "3 messages, 60 output tokens, 20 cache-write tokens, 250 cache-read tokens, 230 fresh input tokens, 60 minutes" ] || fail "Codex usage row differs: [$codex_row]"
printf 'usage: Claude Code and Codex rows verified, one message per id, the window across offsets\n'
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
    python3 -B "$usage_script" "$usage_root/codex.jsonl" "$usage_from" "$usage_to" \
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

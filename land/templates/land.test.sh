#!/bin/sh
# Exercise the landing helper in isolated repositories for clean and conflicting changes.
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
printf 'conflict: exit 2, conflicting path and retained landing branch verified\n'

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
{"type":"assistant","timestamp":"2026-09-16T11:01:00.000Z","message":{"id":"msg_after","usage":{"output_tokens":999,"cache_creation_input_tokens":999,"cache_read_input_tokens":999,"input_tokens":999}}}
JSONL
cat >"$usage_root/codex.jsonl" <<'JSONL'
{"timestamp":"2026-09-16T09:00:00.000Z","type":"session_meta","payload":{"id":"fixture"}}
{"timestamp":"2026-09-16T09:59:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":100,"cached_input_tokens":50,"cache_write_input_tokens":0,"output_tokens":10}}}}
{"timestamp":"2026-09-16T10:10:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":300,"cached_input_tokens":150,"cache_write_input_tokens":20,"output_tokens":40}}}}
{"timestamp":"2026-09-16T10:50:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":600,"cached_input_tokens":300,"cache_write_input_tokens":20,"output_tokens":70}}}}
{"timestamp":"2026-09-16T11:30:00.000Z","type":"event_msg","payload":{"type":"token_count","info":{"total_token_usage":{"input_tokens":9000,"cached_input_tokens":9000,"cache_write_input_tokens":9000,"output_tokens":9000}}}}
JSONL
# The window is given with an offset, as git's %cI gives it, while the logs carry Z times.
claude_row=$(python3 "$usage_script" "$usage_root/claude.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00) || fail "usage.py failed on the Claude Code log"
[ "$claude_row" = "2 messages, 30 output tokens, 100 cache-write tokens, 3000 cache-read tokens, 8 fresh input tokens, 60 minutes" ] || fail "Claude Code usage row differs: [$claude_row]"
codex_row=$(python3 "$usage_script" "$usage_root/codex.jsonl" 2026-09-16T12:00:00+02:00 2026-09-16T13:00:00+02:00) || fail "usage.py failed on the Codex rollout"
[ "$codex_row" = "2 messages, 60 output tokens, 20 cache-write tokens, 250 cache-read tokens, 230 fresh input tokens, 60 minutes" ] || fail "Codex usage row differs: [$codex_row]"
printf 'usage: Claude Code and Codex rows verified, one message per id, the window across offsets\n'
# The example plan.yaml files carry every key of the state template's configuration block that plan.yaml sets,
# plus the keys only the skills read, each marked required or optional with a default equal to its value.
ordo_root=$(CDPATH= cd "$script_dir/../.." && pwd -P)
if [ -f "$ordo_root/plan/templates/plan.yaml" ] && [ -f "$ordo_root/plan/templates/orchestrator-state.md" ]; then
    python3 - "$ordo_root" <<'PY' || fail "example plan.yaml files differ from the state template"
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
    printf 'examples: plan.yaml and plan.projects.yaml match the state template, every key marked\n'
else
    printf 'examples: not in an Ordo checkout, not checked\n'
fi
printf 'PASS: land.sh and usage.py scratch tests\n'

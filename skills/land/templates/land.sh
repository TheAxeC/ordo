#!/bin/sh
# Run a reviewed package through a plan's landing checks and print its booking data.
# A plan copies this file into its ledger folder and makes the three ADAPT edits: the tool
# directory, the check commands and their pass rules, and the harness and model names in the rows.
#
# In the package's worktree it stages the tool directory and makes a wip commit when something is
# staged; a builder that committed everything lands with no wip commit.
#
# Before each git step it waits for the repository's index.lock to go, and removes a lock older
# than 60 s while no process named git runs, as stale. The wait is bounded: after 60 s of waiting
# the landing stops with a message naming the lock and exit 1, whatever processes run. The
# environment variable LANDING_LOCK_WAIT, when set and not empty, gives the bound in whole seconds
# instead (its test shortens it); a value that is not a whole number is refused with exit 64.
#
# Every stop at a lock leaves main untouched. A stop after the worktree's checkout leaves the
# worktree on <pkg>-land, and landing again resumes: the preflight sees <pkg>-land, returns the
# worktree to <pkg>, deletes <pkg>-land and lands from the start. This is done on the next run
# and not at the stop, because the held lock may be the worktree's own, which blocks the checkout
# that would undo the branch. The preflight refuses instead, keeping <pkg>-land, when main holds
# staged or unmerged changes (a run that reached main's cherry-pick, stopped at a failed check or
# ended, leaves them for the orchestrator), and when <pkg>-land holds a cherry-pick in progress (a
# conflict left for the orchestrator), changes not committed, or a commit that is not a
# cherry-pick of the package's own commits (git cherry marks it +).

set -u

usage() {
    printf 'Usage: %s <pkg> <base> <runs dir> [--no-browser] [--session <session log> --since <ISO time>]\n' "$0" >&2
    exit 64
}

fail() {
    printf '%s\n' "$1" >&2
    exit "${2:-1}"
}

if [ "$#" -lt 3 ]; then
    usage
fi

landing_pkg=$1
landing_base=$2
landing_runs=$3
landing_browser=1
landing_session=''
landing_since=''

case "$landing_pkg" in
    '' | *[!A-Za-z0-9._-]*)
        fail "arguments failed: invalid package name: $landing_pkg" 64
        ;;
esac

case "$landing_base" in
    '' | *[!A-Fa-f0-9]*)
        fail "arguments failed: base must be a hexadecimal commit id" 64
        ;;
esac

shift 3
while [ "$#" -gt 0 ]; do
    case "$1" in
        --no-browser)
            landing_browser=0
            shift
            ;;
        --session)
            [ "$#" -ge 2 ] || usage
            landing_session=$2
            shift 2
            ;;
        --since)
            [ "$#" -ge 2 ] || usage
            landing_since=$2
            shift 2
            ;;
        *)
            usage
            ;;
    esac
done
if [ -n "$landing_session" ] && [ -z "$landing_since" ]; then
    fail "arguments failed: --session needs --since, the previous landing commit's git log -1 --format=%cI" 64
fi
if [ -z "$landing_session" ] && [ -n "$landing_since" ]; then
    fail "arguments failed: --since needs --session, the running session's own log" 64
fi
if [ -n "$landing_session" ] && [ ! -f "$landing_session" ]; then
    fail "arguments failed: session log not found: $landing_session" 64
fi
landing_lock_bound=${LANDING_LOCK_WAIT:-60}
case "$landing_lock_bound" in
    *[!0-9]*)
        fail "arguments failed: LANDING_LOCK_WAIT must be a whole number of seconds: \
$landing_lock_bound" 64
        ;;
esac

landing_root=$(pwd -P)
landing_worktree=$landing_root/.agents/worktrees/$landing_pkg
landing_tool_path=tools/oculus # ADAPT: the tool directory the package's paths are scoped to, relative to the repository root
landing_tool=$landing_root/$landing_tool_path

if [ ! -d "$landing_root/.git" ]; then
    fail "preflight failed: run this script from the repository root"
fi
if [ ! -d "$landing_worktree" ]; then
    fail "preflight failed: worktree not found: $landing_worktree"
fi
if ! command -v node >/dev/null 2>&1; then
    fail "preflight failed: node is not on PATH; the lock wait and the usage rows run on it"
fi
if [ ! -d "$landing_tool" ]; then
    fail "preflight failed: tool directory not found: $landing_tool"
fi
if [ ! -d "$landing_runs" ]; then
    fail "preflight failed: runs directory not found: $landing_runs"
fi

landing_tmp=$(mktemp -d "${TMPDIR:-/tmp}/land.XXXXXX") || fail "preflight failed: could not create a temporary directory"
trap 'rm -rf "$landing_tmp"' 0 1 2 3 15
landing_output=$landing_tmp/output.txt

resolve_git_dir() {
    landing_resolve_root=$1
    if [ -d "$landing_resolve_root/.git" ]; then
        printf '%s\n' "$landing_resolve_root/.git"
        return 0
    fi
    if [ ! -f "$landing_resolve_root/.git" ]; then
        return 1
    fi
    landing_resolve_value=$(sed -n 's/^gitdir: //p' "$landing_resolve_root/.git")
    case "$landing_resolve_value" in
        /*)
            printf '%s\n' "$landing_resolve_value"
            ;;
        *)
            (CDPATH= cd "$landing_resolve_root" && CDPATH= cd "$landing_resolve_value" && pwd -P)
            ;;
    esac
}

git_process_alive() {
    if command -v pgrep >/dev/null 2>&1; then
        pgrep -x git >/dev/null 2>&1
        return $?
    fi
    ps -ax -o comm= 2>/dev/null | awk '
        {
            count = split($0, parts, "/")
            if (parts[count] == "git") {
                found = 1
            }
        }
        END { exit found ? 0 : 1 }
    '
}

wait_for_index() {
    landing_wait_root=$1
    landing_git_dir=$(resolve_git_dir "$landing_wait_root") || fail "index lock failed: cannot resolve .git for $landing_wait_root"
    landing_lock=$landing_git_dir/index.lock
    landing_waited=0
    while [ -e "$landing_lock" ]; do
        landing_age=$(node -e 'const fs = require("fs"); const age = Math.floor((Date.now() - fs.statSync(process.argv[1]).mtimeMs) / 1000); process.stdout.write(String(age));' "$landing_lock" 2>/dev/null || printf '0')
        if [ "$landing_age" -gt 60 ] && ! git_process_alive; then
            rm -f "$landing_lock" || fail "index lock failed: cannot remove stale lock: $landing_lock"
            continue
        fi
        if [ "$landing_waited" -ge "$landing_lock_bound" ]; then
            fail "index lock failed: $landing_lock still held after $landing_waited s of waiting; \
main is untouched; the worktree is on $landing_left. Remove the lock once no git command uses it, \
then land again to resume."
        fi
        if [ "$landing_waited" -eq 0 ]; then
            printf 'index lock: waiting for %s\n' "$landing_lock"
        fi
        sleep 1
        landing_waited=$((landing_waited + 1))
    done
}

run_step() {
    landing_step=$1
    shift
    "$@" >"$landing_output" 2>&1
    landing_status=$?
    if [ -s "$landing_output" ]; then
        cat "$landing_output"
    fi
    if [ "$landing_status" -ne 0 ]; then
        printf '%s failed\n' "$landing_step" >&2
        exit "$landing_status"
    fi
}

landing_main_branch=$(git branch --show-current 2>"$landing_output")
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "preflight failed: cannot read the main checkout branch"
fi
if [ "$landing_main_branch" != "main" ]; then
    fail "preflight failed: repository root is on $landing_main_branch, expected main"
fi

landing_worktree_branch=$(cd "$landing_worktree" && git branch --show-current 2>"$landing_output")
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "preflight failed: cannot read the package worktree branch"
fi
landing_left_land="$landing_pkg-land, which landing again removes before it starts over"
landing_left=$landing_pkg
if [ "$landing_worktree_branch" = "$landing_pkg-land" ]; then
    landing_left=$landing_left_land
    # A landing stopped after its checkout: <pkg>-land holds at most the cherry-picks of the
    # package's commits, so it is removed and the landing starts over from <pkg>, onto a main with
    # nothing staged.
    wait_for_index "$landing_root"
    git diff --cached --quiet >"$landing_output" 2>&1
    landing_status=$?
    if [ "$landing_status" -eq 1 ]; then
        fail "preflight failed: main holds staged or unmerged changes, so \
$landing_pkg-land is kept; land again once main has nothing staged"
    elif [ "$landing_status" -ne 0 ]; then
        cat "$landing_output" >&2
        fail "preflight failed: cannot read what main has staged"
    fi
    wait_for_index "$landing_worktree"
    if (cd "$landing_worktree" && git rev-parse -q --verify CHERRY_PICK_HEAD) >/dev/null 2>&1; then
        fail "preflight failed: a cherry-pick is in progress on $landing_pkg-land; \
resolve or abort it by hand"
    fi
    landing_dirty=$(cd "$landing_worktree" && git status --porcelain --untracked-files=no) ||
        fail "preflight failed: cannot read the status of $landing_pkg-land"
    if [ -n "$landing_dirty" ]; then
        fail "preflight failed: $landing_pkg-land has changes not committed; \
commit or discard them by hand"
    fi
    landing_foreign=$(cd "$landing_worktree" && git cherry "$landing_pkg" "$landing_pkg-land" main) ||
        fail "preflight failed: cannot compare $landing_pkg-land with $landing_pkg"
    landing_foreign=$(printf '%s\n' "$landing_foreign" | sed -n 's/^+ //p' | tr '\n' ' ' | sed 's/ $//')
    if [ -n "$landing_foreign" ]; then
        fail "preflight failed: $landing_pkg-land holds commits that are not cherry-picks of \
$landing_pkg: $landing_foreign"
    fi
    run_step "worktree git checkout $landing_pkg" sh -c 'cd "$1" && git checkout -q "$2"' land \
        "$landing_worktree" "$landing_pkg"
    wait_for_index "$landing_worktree"
    run_step "worktree git branch -D" sh -c 'cd "$1" && git branch -q -D "$2-land"' land \
        "$landing_worktree" "$landing_pkg"
    printf 'resume: the worktree is back on %s, %s-land removed\n' "$landing_pkg" "$landing_pkg"
elif [ "$landing_worktree_branch" != "$landing_pkg" ]; then
    fail "preflight failed: package worktree is on $landing_worktree_branch, expected $landing_pkg"
fi

wait_for_index "$landing_worktree"
run_step "worktree git add" sh -c 'cd "$1" && git add -A "$2"' land "$landing_worktree" "$landing_tool_path"

wait_for_index "$landing_worktree"
(cd "$landing_worktree" && git diff --cached --quiet) >"$landing_output" 2>&1
landing_status=$?
case "$landing_status" in
    0)
        printf 'worktree git commit: nothing staged, no wip commit made\n'
        ;;
    1)
        wait_for_index "$landing_worktree"
        run_step "worktree git commit" sh -c 'cd "$1" && git commit -q -m wip' land "$landing_worktree"
        ;;
    *)
        cat "$landing_output" >&2
        fail "worktree git diff --cached failed" "$landing_status"
        ;;
esac

wait_for_index "$landing_worktree"
run_step "worktree git checkout" sh -c 'cd "$1" && git checkout -b "$2-land" main' land "$landing_worktree" "$landing_pkg"
landing_left=$landing_left_land

wait_for_index "$landing_worktree"
(cd "$landing_worktree" && git cherry-pick "$landing_base..$landing_pkg") >"$landing_output" 2>&1
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    if [ -s "$landing_output" ]; then
        cat "$landing_output" >&2
    fi
    printf 'worktree git cherry-pick failed\n' >&2
    landing_conflicts=$(cd "$landing_worktree" && git diff --name-only --diff-filter=U)
    if [ -z "$landing_conflicts" ]; then
        exit "$landing_status"
    fi
    printf 'Conflicting paths:\n' >&2
    printf '%s\n' "$landing_conflicts" >&2
    exit 2
fi
if [ -s "$landing_output" ]; then
    cat "$landing_output"
fi

wait_for_index "$landing_root"
run_step "main git cherry-pick" git cherry-pick -n "main..$landing_pkg-land"

# ADAPT: the dependency install and the verify commands from here to the browser check, in the
# ledger's order, with each pass rule.
# A package that changed the lockfile brings a dependency main does not hold yet, so the checks
# would fail on a missing package rather than on the package's own work.
if git diff --cached --name-only | grep -qx "$landing_tool_path/package-lock.json"; then
    run_step "main npm ci" sh -c 'cd "$1" && npm ci --silent' sh "$landing_tool"
fi

(cd "$landing_tool" && npm test -- --reporter=dot) >"$landing_output" 2>&1
landing_status=$?
if [ -s "$landing_output" ]; then
    cat "$landing_output"
fi
if [ "$landing_status" -ne 0 ]; then
    fail "npm test -- --reporter=dot failed" "$landing_status"
fi

run_step "npm run check" sh -c 'cd "$1" && npm run check' land "$landing_tool"
run_step "npm run build" sh -c 'cd "$1" && npm run build' land "$landing_tool"
run_step "npm run format:check" sh -c 'cd "$1" && npm run format:check' land "$landing_tool"
run_step "npm run lint" sh -c 'cd "$1" && npm run lint' land "$landing_tool"

(cd "$landing_tool" && LC_ALL=C grep -rna --exclude=glyphs.yml '[^ -~]' src tests bin config) >"$landing_output" 2>&1
landing_status=$?
case "$landing_status" in
    1)
        if [ -s "$landing_output" ]; then
            cat "$landing_output" >&2
            fail "ASCII check failed"
        fi
        ;;
    0)
        cat "$landing_output" >&2
        fail "ASCII check failed"
        ;;
    *)
        if [ -s "$landing_output" ]; then
            cat "$landing_output" >&2
        fi
        fail "ASCII check failed" "$landing_status"
        ;;
esac

run_step "source line counts" sh -c 'cd "$1" && find src tests config bin -type f | xargs wc -l | sort -rn | head -3' land "$landing_tool"

if [ "$landing_browser" -eq 1 ]; then
    node -e '
        const net = require("net");
        const server = net.createServer();
        server.once("error", (error) => {
            console.error(error.message);
            process.exit(1);
        });
        server.listen(8792, "127.0.0.1", () => server.close(() => process.exit(0)));
    ' >"$landing_output" 2>&1
    landing_status=$?
    if [ "$landing_status" -ne 0 ]; then
        printf 'port check failed: 8792 is not free\n' >&2
        if [ -s "$landing_output" ]; then
            cat "$landing_output" >&2
        fi
        exit 3
    fi
    run_step "npm run test:browser" sh -c 'cd "$1" && npm run test:browser' land "$landing_tool"
fi

landing_range=$landing_base..$landing_pkg
git diff --stat "$landing_range" >"$landing_tmp/diff-stat.txt" 2>"$landing_output"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking diff stat failed" "$landing_status"
fi

git diff --numstat "$landing_range" >"$landing_tmp/diff-numstat.txt" 2>"$landing_output"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking diff counts failed" "$landing_status"
fi
landing_counts=$(awk '{ additions += ($1 == "-" ? 0 : $1); deletions += ($2 == "-" ? 0 : $2); files += 1 } END { printf "%d|%d|%d", additions, deletions, files }' "$landing_tmp/diff-numstat.txt")
landing_additions=$(printf '%s' "$landing_counts" | cut -d '|' -f 1)
landing_deletions=$(printf '%s' "$landing_counts" | cut -d '|' -f 2)
landing_files=$(printf '%s' "$landing_counts" | cut -d '|' -f 3)

git diff --cached --name-only >"$landing_tmp/staged-paths.txt" 2>"$landing_output"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking staged paths failed" "$landing_status"
fi

node - "$landing_pkg" "$landing_runs" "$landing_additions" "$landing_deletions" "$landing_files" >"$landing_tmp/usage.txt" 2>"$landing_output" <<'NODE'
const fs = require("fs");
const path = require("path");

const [pkg, runsDir, additions, deletions, files] = process.argv.slice(2);

function requiredFiles(prefix) {
    return {
        events: path.join(runsDir, `${prefix}events.jsonl`),
        pid: path.join(runsDir, `${prefix}pid.txt`),
        exit: path.join(runsDir, `${prefix}exit.txt`),
    };
}

function existsAny(files) {
    return Object.values(files).some((file) => fs.existsSync(file));
}

function requireAll(files, label) {
    for (const file of Object.values(files)) {
        if (!fs.existsSync(file)) {
            throw new Error(`${label} is incomplete: missing ${file}`);
        }
    }
}

function readUsage(files, label) {
    requireAll(files, label);
    const totals = {
        input: 0,
        cached: 0,
        output: 0,
        reasoning: 0,
        items: 0,
    };
    const lines = fs.readFileSync(files.events, "utf8").split(/\r?\n/).filter(Boolean);
    for (const [index, line] of lines.entries()) {
        let event;
        try {
            event = JSON.parse(line);
        } catch (error) {
            throw new Error(`${label} has invalid JSON on line ${index + 1}: ${error.message}`);
        }
        if (event.type === "turn.completed") {
            const usage = event.usage || {};
            totals.input += Number(usage.input_tokens || 0);
            totals.cached += Number(usage.cached_input_tokens || 0);
            totals.output += Number(usage.output_tokens || 0);
            totals.reasoning += Number(usage.reasoning_output_tokens || 0);
        }
        if (event.type === "item.completed") {
            totals.items += 1;
        }
    }
    const startMs = fs.statSync(files.pid).mtimeMs;
    const endMs = fs.statSync(files.exit).mtimeMs;
    if (endMs < startMs) {
        throw new Error(`${label} exit time precedes its pid time`);
    }
    totals.seconds = Math.round((endMs - startMs) / 1000);
    totals.start = Math.round(startMs / 1000);
    totals.end = Math.round(endMs / 1000);
    return totals;
}

function integer(value) {
    return value.toLocaleString("en-US");
}

function clock(epoch) {
    const date = new Date(epoch * 1000);
    return [date.getHours(), date.getMinutes(), date.getSeconds()]
        .map((value) => String(value).padStart(2, "0"))
        .join(":");
}

function workerPart(label, usage, withClock) {
    const time = withClock ? ` (${clock(usage.start)} to ${clock(usage.end)})` : "";
    return `${label}: ${integer(usage.input)} in / ${integer(usage.cached)} cached / ${integer(usage.output)} out (${integer(usage.reasoning)} reasoning), ${integer(usage.items)} items, ${integer(usage.seconds)} s${time}`;
}

function reviewerPart(label, usage) {
    return `${label} ${integer(usage.input)} in / ${integer(usage.cached)} cached / ${integer(usage.output)} out, ${integer(usage.items)} items, ${integer(usage.seconds)} s`;
}

// A worker or reviewer launched through the runner's Agent tool leaves no event log: its tokens,
// tool uses and seconds come from the runner's result, and its row is written by hand from them.
const firstFiles = requiredFiles("");
const repairFiles = requiredFiles("repair-");
const reviewFiles = requiredFiles("review-");
const tail = `; +${additions} -${deletions} over ${files} files; first report passed its bar: <yes or no>; <N> fixes at landing`;

// ADAPT: the harness and model names of the rows, as the state file's Usage section writes them.
let worker;
if (existsAny(firstFiles)) {
    worker = `${pkg}, worker codex:gpt-5.6-sol at high, ${workerPart("first run", readUsage(firstFiles, "first run"), true)}`;
    if (existsAny(repairFiles)) {
        worker += `; ${workerPart("repair round on the same thread", readUsage(repairFiles, "repair round"), false)}`;
    }
} else {
    worker = `${pkg}, worker <harness:model>, first run: <tokens>, <tool uses> tool uses, <seconds> s (from the runner's result; no event log)` +
        `; repair round: <the same, or none>`;
}
worker += tail;

let reviewer;
if (existsAny(reviewFiles)) {
    reviewer = `${pkg}, reviewer codex:gpt-5.6-sol at high, read-only: ${reviewerPart("review", readUsage(reviewFiles, "review"))}`;
} else {
    reviewer = `${pkg}, reviewer <harness:model>, read-only: review <tokens> / <tool uses> / <seconds> s (from the runner's result; no event log)`;
}

console.log(worker);
console.log(reviewer);
NODE
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking usage failed" "$landing_status"
fi

printf '%s\n' '=== booking ==='
printf 'Diff stat against %s:\n' "$landing_base"
cat "$landing_tmp/diff-stat.txt"
printf '%s\n' 'Usage rows:'
cat "$landing_tmp/usage.txt"
if [ -n "$landing_session" ]; then
    # The orchestrator's row, from its own session log between the previous landing and now. The
    # script is looked for beside this one, then in the land skill's templates wherever the skill
    # is installed: the repository, the user's agent skills, the user's Claude Code skills.
    landing_usage_script=''
    landing_script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
    for landing_usage_dir in \
        "$landing_script_dir" \
        "$landing_root/.agents/skills/land/templates" \
        "$HOME/.agents/skills/land/templates" \
        "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/land/templates"; do
        if [ -f "$landing_usage_dir/usage.py" ]; then
            landing_usage_script=$landing_usage_dir/usage.py
            break
        fi
    done
    [ -n "$landing_usage_script" ] || fail "booking usage failed: usage.py not found beside this script or in the land skill's templates"
    landing_now=$(date -Iseconds)
    landing_row=$(python3 "$landing_usage_script" "$landing_session" "$landing_since" "$landing_now") || fail "booking usage failed: usage.py on $landing_session"
    printf 'Orchestrator row (%s to %s): %s\n' "$landing_since" "$landing_now" "$landing_row"
else
    printf '%s\n' 'Orchestrator row: not produced; pass --session <session log> --since <previous landing commit time>'
fi
printf '%s\n' 'Staged paths:'
cat "$landing_tmp/staged-paths.txt"
printf '%s\n' '=== end booking ==='

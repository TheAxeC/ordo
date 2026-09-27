#!/bin/sh
# Run a reviewed package through a plan's landing checks and print its booking data.
# A plan copies this file into its ledger folder, with land.test.sh, verify.sh and usage.py
# beside it, and makes the ADAPT edits: the worktree root (default .agents/worktrees; the package's
# worktree is <worktree root>/<pkg>), the tool directory (default ., the whole tree), the ledger
# root, the ADAPT block for the dependency install and any check beyond the verify list with their
# pass rules (default: nothing runs), and the model names in the rows.
#
# Its check on main is the ledger's verify list: after main's cherry-pick it runs
# sh <verify.sh> <the orchestrator-state.md beside this script> from the repository root, and a
# non-zero exit fails the landing with exit 1 and verify.sh's output printed. verify.sh and usage.py are
# looked for beside this script, then in the land skill's templates under the repository's
# .agents/skills, ~/.agents/skills and $CLAUDE_CONFIG_DIR/skills (default ~/.claude/skills). The
# preflight refuses, before main is touched, when the state file is missing or no place holds
# verify.sh, naming the places.
#
# In the package's worktree it stages the tool directory and makes a wip commit when something is
# staged; a builder that committed everything lands with no wip commit. The ledger root is left
# out of that add, and a ledger file left untracked in the worktree counts as ignored when the
# worktree checks out main, so a ledger file left uncommitted in the worktree (a builder's report,
# any other ledger copy) never reaches main. A ledger file that a commit of the range holds still
# does, since the cherry-picks take whole commits.
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
#
# --no-browser sets landing_browser to 0, for a browser check the ADAPT block may hold.

set -u

usage() {
    printf 'Usage: %s <pkg> <base> [--no-browser] [--session <session log> --since <ISO time>]\n' "$0" >&2
    exit 64
}

fail() {
    printf '%s\n' "$1" >&2
    exit "${2:-1}"
}

if [ "$#" -lt 2 ]; then
    usage
fi

landing_pkg=$1
landing_base=$2
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

shift 2
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
# ADAPT: .agents/plan.yaml's worktree_root, relative to the repository root.
landing_worktree_root=.agents/worktrees
# ADAPT: the tool directory the package's paths are scoped to, relative to the repository root;
# . is the whole tree.
landing_tool_path=.
# ADAPT: .agents/plan.yaml's ledger_root, relative to the repository root.
landing_ledger_root=.scratch
landing_tool=$landing_root/$landing_tool_path
case "$landing_worktree_root" in
    '' | /* | ../* | */.. | */../* | .. | *'
'*)
        fail "preflight failed: landing_worktree_root must be a folder inside the repository: \
$landing_worktree_root"
        ;;
esac
landing_worktree=$landing_root/${landing_worktree_root%/}/$landing_pkg

# The ledger root as plan.yaml may write it, with every leading ./ and every trailing / removed,
# so the add's pathspec and the checkout's ignore pattern name the folder itself. A refusal
# quotes the value as written.
landing_ledger_written=$landing_ledger_root
while :; do
    case "$landing_ledger_root" in
        ./*) landing_ledger_root=${landing_ledger_root#./} ;;
        */) landing_ledger_root=${landing_ledger_root%/} ;;
        *) break ;;
    esac
done
case "$landing_ledger_root" in
    '' | . | .. | /* | ../* | */.. | */../* | *'
'*)
        fail "preflight failed: landing_ledger_root must be a folder inside the repository: \
$landing_ledger_written"
        ;;
esac

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

landing_script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) ||
    fail "preflight failed: cannot resolve the folder of $0"

# Looks for the land skill's template $1 beside this script, then in the land skill's templates
# wherever the skill is installed: the repository, the user's agent skills, the user's Claude
# Code skills. Sets landing_found to its path, empty when no place holds it, and landing_places
# to the places in that order, joined by ", ".
find_template() {
    landing_found=''
    landing_places=''
    for landing_place in \
        "$landing_script_dir" \
        "$landing_root/.agents/skills/land/templates" \
        "$HOME/.agents/skills/land/templates" \
        "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/land/templates"; do
        landing_places=$landing_places${landing_places:+, }$landing_place
        if [ -z "$landing_found" ] && [ -f "$landing_place/$1" ]; then
            landing_found=$landing_place/$1
        fi
    done
}

landing_state=$landing_script_dir/orchestrator-state.md
if [ ! -f "$landing_state" ]; then
    fail "preflight failed: state file not found: $landing_state"
fi
find_template verify.sh
landing_verify=$landing_found
if [ -z "$landing_verify" ]; then
    fail "preflight failed: verify.sh not found beside this script or in the land skill's \
templates: $landing_places"
fi

landing_tmp=$(mktemp -d "${TMPDIR:-/tmp}/land.XXXXXX") || fail "preflight failed: could not create a temporary directory"
trap 'rm -rf "$landing_tmp"' 0 1 2 3 15
landing_output=$landing_tmp/output.txt
# The ledger root as a gitignore pattern anchored at the worktree's root, its special characters
# escaped, for the worktree's checkout of main.
landing_ledger_ignore=$landing_tmp/ledger.gitignore
printf '/%s/\n' "$(printf '%s' "$landing_ledger_root" | sed 's/[][*?!#\\]/\\&/g')" \
    >"$landing_ledger_ignore" || fail "preflight failed: could not write $landing_ledger_ignore"

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
run_step "worktree git add" sh -c 'cd "$1" && git add -A -- "$2" ":(exclude,literal)$3"' land \
    "$landing_worktree" "$landing_tool_path" "$landing_ledger_root"

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
# A ledger file left untracked in the worktree counts as ignored here, so main's copy of it is
# checked out over it rather than stopping the checkout.
run_step "worktree git checkout" sh -c 'cd "$1" && git -c core.excludesFile="$3" checkout -b "$2-land" main' \
    land "$landing_worktree" "$landing_pkg" "$landing_ledger_ignore"
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

# ADAPT: the dependency install the verify list needs, and any check or count beyond the verify
# list with its pass rule, each through run_step, from here to the verify list's run. A check that
# needs a browser runs only when landing_browser is 1. By default nothing runs here.

# The ledger's verify list, from the repository root on main as the cherry-pick left it.
run_step "verify list" sh -c 'sh "$1" "$2" || exit 1' land "$landing_verify" "$landing_state"

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

node - "$landing_pkg" "$landing_additions" "$landing_deletions" "$landing_files" >"$landing_tmp/usage.txt" 2>"$landing_output" <<'NODE'
const [pkg, additions, deletions, files] = process.argv.slice(2);

// A worker or reviewer dispatched through the runner's Agent tool reports its tokens, tool uses and
// seconds in its completion notification, and its row is written by hand from them.
const tail = `; +${additions} -${deletions} over ${files} files; first report passed its bar: <yes or no>; <N> fixes at landing`;

// ADAPT: the model names of the rows, as the state file's Usage section writes them.
const worker = `${pkg}, worker claude:opus, first run: <tokens>, <tool uses> tool uses, <seconds> s (from the runner's result)` +
    `; repair round: <the same, or none>` + tail;
const reviewer = `${pkg}, reviewer claude:opus, read-only: review <tokens> / <tool uses> / <seconds> s (from the runner's result)`;

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
    # The orchestrator's row, from its own session log between the previous landing and now,
    # through usage.py found as find_template looks.
    find_template usage.py
    landing_usage_script=$landing_found
    [ -n "$landing_usage_script" ] || fail "booking usage failed: usage.py not found beside this \
script or in the land skill's templates: $landing_places"
    landing_now=$(date -Iseconds)
    landing_row=$(python3 "$landing_usage_script" "$landing_session" "$landing_since" "$landing_now") || fail "booking usage failed: usage.py on $landing_session"
    printf 'Orchestrator row (%s to %s): %s\n' "$landing_since" "$landing_now" "$landing_row"
else
    printf '%s\n' 'Orchestrator row: not produced; pass --session <session log> --since <previous landing commit time>'
fi
printf '%s\n' 'Staged paths:'
cat "$landing_tmp/staged-paths.txt"
printf '%s\n' '=== end booking ==='

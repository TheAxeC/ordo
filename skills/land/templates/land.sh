#!/bin/sh
# Lands a reviewed step from its worktree onto main: the step's work is committed in its worktree,
# copied onto main as staged changes, the plan's verify list is run on main through checks.sh, and
# the booking data is printed.
#
# In the step's worktree it stages the whole tree with the ledger root left out and makes a wip
# commit when something is staged; a builder that committed everything lands with no wip commit.
# It then checks out <step>-land from main in the worktree, with the ledger root as an ignore
# pattern, so a ledger file left untracked in the worktree counts as ignored there, and
# cherry-picks <base>..<step> onto it. A ledger file left uncommitted in the worktree (a builder's
# report, any other ledger copy) never reaches main; a ledger file that a commit of the range
# holds still does, since the cherry-picks take whole commits. A conflict prints git's output and
# the conflicting paths. Otherwise git cherry-pick -n main..<step>-land stages the range on main.
# A range that holds no commit (git rev-list --count prints 0) copies nothing: both cherry-picks
# are skipped, "nothing to copy: <base>..<step> holds no commit" is printed, and the verify list
# still runs on main.
#
# After the cherry-pick on main it runs sh <its own folder>/checks.sh <state file> from the
# repository root, its own folder being the one that holds this script; a non-zero exit fails the
# landing with checks.sh's output printed. It then prints the booking data between
# "=== booking ===" and "=== end booking ===": the diff stat against <base> and the paths staged
# on main.
#
# Before each git step it waits for the repository's index.lock to go, and removes a lock older
# than 60 s while no process named git runs, as stale. The wait is bounded: after 60 s of waiting
# the landing stops with a message naming the lock and exit 1, whatever processes run.
#
# Every stop at a lock leaves main untouched. A stop after the worktree's checkout leaves the
# worktree on <step>-land, and landing again resumes: the preflight sees <step>-land, returns the
# worktree to <step>, deletes <step>-land and lands from the start. This is done on the next run
# and not at the stop, because the held lock may be the worktree's own, which blocks the checkout
# that would undo the branch. The preflight refuses instead, keeping <step>-land, when main holds
# staged or unmerged changes (a run that reached main's cherry-pick, stopped at a failed check or
# ended, leaves them for the orchestrator), and when <step>-land holds a cherry-pick in progress (a
# conflict left for the orchestrator), changes not committed, or a commit that is not a
# cherry-pick of the step's own commits (git cherry marks it +).
#
# Arguments, run from the repository root:
#   sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
#   <state file>  the plan's orchestrator-state.md, relative to the repository root or absolute.
#   <step>        the step's branch, which is also its worktree folder's name (letters, digits,
#                 ".", "_" and "-").
#   <base>        the recorded base commit, in hexadecimal.
#
# It reads .agents/plan.yaml with python3 and PyYAML. In the one-project form it takes
# worktree_root and ledger_root. In the projects: form it takes the project whose ledger_root
# holds the state file (the deepest, when ledger roots nest) and that project's worktree_root.
# Both keys are required; a missing one is refused. Each value is a folder inside the repository:
# no leading /, no .. part, no newline, not ".". The step's worktree is <worktree_root>/<step>. It
# also reads the state file, through checks.sh, and the git state of main and of the step's
# worktree.
#
# Exit status:
#   0   landed and checked: the range is staged on main and every command of the verify list
#       passed.
#   1   a failed check or a stop:
#       - checks.sh exited non-zero;
#       - the current folder is not the root of a git checkout;
#       - the folder of this script cannot be resolved;
#       - the temporary directory cannot be created;
#       - the step's worktree is not found;
#       - the main checkout is not on main, or the worktree is on neither <step> nor <step>-land;
#       - the preflight of a resume refused: main holds staged or unmerged changes, or what main
#         has staged cannot be read; a cherry-pick is in progress on <step>-land; the status of
#         <step>-land cannot be read, or it holds changes not committed; <step>-land cannot be
#         compared with <step>, or holds a commit that is not a cherry-pick of <step>'s;
#       - an index lock was held past the bound, its .git folder could not be resolved, or a stale
#         one could not be removed.
#   2   a conflict in the worktree's cherry-pick.
#   n   any other status: a git step failed, and the landing ends with git's own exit status after
#       printing git's output and the step that failed; or python3 is not installed (127) or cannot
#       import yaml (1), and the shell's or Python's own message is the only one printed.
#   64  a refusal of its arguments or configuration, before anything is touched: not three
#       arguments; a step name or a base that is not of the form above; no checks.sh in the folder
#       of this script; a state file that is not a file; no .agents/plan.yaml, or one that is
#       empty or not valid YAML; no ledger_root or no worktree_root, in the one-project form or in the project the state file belongs to, or a
#       project of the projects: form without a ledger_root; a ledger_root or worktree_root that is
#       not a folder inside the repository; a state file under no project's ledger_root.

set -u

fail() {
    printf '%s\n' "$1" >&2
    exit "${2:-1}"
}

if [ "$#" -ne 3 ]; then
    fail "Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>" 64
fi

landing_state_arg=$1
landing_step=$2
landing_base=$3

case "$landing_step" in
    '' | *[!A-Za-z0-9._-]*)
        fail "arguments failed: invalid step name: $landing_step" 64
        ;;
esac

case "$landing_base" in
    '' | *[!A-Fa-f0-9]*)
        fail "arguments failed: base must be a hexadecimal commit id" 64
        ;;
esac

landing_lock_bound=60

landing_root=$(pwd -P)
if [ ! -d "$landing_root/.git" ]; then
    fail "preflight failed: run this script from the repository root"
fi
landing_script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) ||
    fail "preflight failed: cannot resolve the folder of $0"
if [ ! -f "$landing_script_dir/checks.sh" ]; then
    fail "preflight failed: checks.sh not found beside land.sh: $landing_script_dir/checks.sh" 64
fi

landing_tmp=$(mktemp -d "${TMPDIR:-/tmp}/land.XXXXXX") || fail "preflight failed: could not create a temporary directory"
trap 'rm -rf "$landing_tmp"' 0 1 2 3 15
landing_output=$landing_tmp/output.txt

# Prints the state file's absolute path, the worktree root and the ledger root, one per line, or
# refuses with a message and exit 64.
python3 - "$landing_root" "$landing_state_arg" >"$landing_tmp/config.txt" <<'PYTHON'
import os, sys
import yaml

root, state = sys.argv[1], sys.argv[2]

def refuse(message):
    sys.stderr.write("configuration failed: " + message + "\n")
    sys.exit(64)

state_path = os.path.realpath(os.path.join(root, state))
if not os.path.isfile(state_path):
    refuse("state file not found: " + state)
relative = os.path.relpath(state_path, root)

def folder(value, key, where):
    if value in ("", ".") or value.startswith("/") or ".." in value.split("/") or "\n" in value:
        refuse(key + where + " must be a folder inside the repository: " + value)
    return value

def under(path, folder_path):
    return path == folder_path or path.startswith(folder_path + "/")

config_path = os.path.join(root, ".agents", "plan.yaml")
try:
    with open(config_path, encoding="utf-8") as handle:
        config = yaml.safe_load(handle)
except FileNotFoundError:
    refuse(".agents/plan.yaml not found")
except yaml.YAMLError as error:
    refuse(".agents/plan.yaml is not valid YAML: " + str(error).replace("\n", " "))
if config is None:
    refuse(".agents/plan.yaml is empty")

if "projects" in config:
    found = None
    for name, project in config["projects"].items():
        where = " of the project " + str(name)
        if "ledger_root" not in project:
            refuse("no ledger_root" + where + " in .agents/plan.yaml")
        ledger = folder(project["ledger_root"], "ledger_root", where)
        if under(relative, ledger) and (found is None or len(ledger) > len(found[1])):
            found = (project, ledger, where)
    if found is None:
        refuse("the state file " + state + " is under no project's ledger_root")
    project, ledger, where = found
    if "worktree_root" not in project:
        refuse("no worktree_root" + where + " in .agents/plan.yaml")
    worktrees = folder(project["worktree_root"], "worktree_root", where)
else:
    if "ledger_root" not in config:
        refuse("no ledger_root in .agents/plan.yaml")
    ledger = folder(config["ledger_root"], "ledger_root", "")
    if not under(relative, ledger):
        refuse("the state file " + state + " is not under the ledger_root " + ledger)
    if "worktree_root" not in config:
        refuse("no worktree_root in .agents/plan.yaml")
    worktrees = folder(config["worktree_root"], "worktree_root", "")

print(state_path)
print(worktrees)
print(ledger)
PYTHON
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    exit "$landing_status"
fi
landing_state=$(sed -n 1p "$landing_tmp/config.txt")
landing_worktree_root=$(sed -n 2p "$landing_tmp/config.txt")
landing_ledger_root=$(sed -n 3p "$landing_tmp/config.txt")
landing_worktree=$landing_root/$landing_worktree_root/$landing_step

if [ ! -d "$landing_worktree" ]; then
    fail "preflight failed: worktree not found: $landing_worktree"
fi

# The ledger root as a gitignore pattern anchored at the worktree's root, its special characters
# escaped, for the worktree's checkout of main.
landing_ledger_ignore=$landing_tmp/ledger.gitignore
printf '/%s/\n' "$(printf '%s' "$landing_ledger_root" | sed 's/[][*?!#\\]/\\&/g')" \
    >"$landing_ledger_ignore"

resolve_git_dir() {
    landing_resolve_root=$1
    if [ -d "$landing_resolve_root/.git" ]; then
        printf '%s\n' "$landing_resolve_root/.git"
        return 0
    fi
    if [ ! -f "$landing_resolve_root/.git" ]; then
        return 1
    fi
    sed -n 's/^gitdir: //p' "$landing_resolve_root/.git"
}

git_process_alive() {
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
        landing_age=$(python3 -c 'import os, sys, time; print(int(time.time() - os.stat(sys.argv[1]).st_mtime))' "$landing_lock" 2>/dev/null || printf '0')
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
    landing_label=$1
    shift
    "$@" >"$landing_output" 2>&1
    landing_status=$?
    if [ -s "$landing_output" ]; then
        cat "$landing_output"
    fi
    if [ "$landing_status" -ne 0 ]; then
        printf '%s failed\n' "$landing_label" >&2
        exit "$landing_status"
    fi
}

landing_main_branch=$(git branch --show-current)
if [ "$landing_main_branch" != "main" ]; then
    fail "preflight failed: repository root is on $landing_main_branch, expected main"
fi

landing_worktree_branch=$(cd "$landing_worktree" && git branch --show-current)
landing_left_land="$landing_step-land, which landing again removes before it starts over"
landing_left=$landing_step
if [ "$landing_worktree_branch" = "$landing_step-land" ]; then
    landing_left=$landing_left_land
    # A landing stopped after its checkout: <step>-land holds at most the cherry-picks of the
    # step's commits, so it is removed and the landing starts over from <step>, onto a main with
    # nothing staged.
    wait_for_index "$landing_root"
    git diff --cached --quiet >"$landing_output" 2>&1
    landing_status=$?
    if [ "$landing_status" -eq 1 ]; then
        fail "preflight failed: main holds staged or unmerged changes, so \
$landing_step-land is kept; land again once main has nothing staged"
    elif [ "$landing_status" -ne 0 ]; then
        cat "$landing_output" >&2
        fail "preflight failed: cannot read what main has staged"
    fi
    wait_for_index "$landing_worktree"
    if (cd "$landing_worktree" && git rev-parse -q --verify CHERRY_PICK_HEAD) >/dev/null 2>&1; then
        fail "preflight failed: a cherry-pick is in progress on $landing_step-land; \
resolve or abort it by hand"
    fi
    landing_dirty=$(cd "$landing_worktree" && git status --porcelain --untracked-files=no) ||
        fail "preflight failed: cannot read the status of $landing_step-land"
    if [ -n "$landing_dirty" ]; then
        fail "preflight failed: $landing_step-land has changes not committed; \
commit or discard them by hand"
    fi
    landing_foreign=$(cd "$landing_worktree" && git cherry "$landing_step" "$landing_step-land" main) ||
        fail "preflight failed: cannot compare $landing_step-land with $landing_step"
    landing_foreign=$(printf '%s\n' "$landing_foreign" | sed -n 's/^+ //p' | tr '\n' ' ' | sed 's/ $//')
    if [ -n "$landing_foreign" ]; then
        fail "preflight failed: $landing_step-land holds commits that are not cherry-picks of \
$landing_step: $landing_foreign"
    fi
    run_step "worktree git checkout $landing_step" sh -c 'cd "$1" && git checkout -q "$2"' land \
        "$landing_worktree" "$landing_step"
    wait_for_index "$landing_worktree"
    run_step "worktree git branch -D" sh -c 'cd "$1" && git branch -q -D "$2-land"' land \
        "$landing_worktree" "$landing_step"
    printf 'resume: the worktree is back on %s, %s-land removed\n' "$landing_step" "$landing_step"
elif [ "$landing_worktree_branch" != "$landing_step" ]; then
    fail "preflight failed: step worktree is on $landing_worktree_branch, expected $landing_step"
fi

wait_for_index "$landing_worktree"
run_step "worktree git add" sh -c 'cd "$1" && git add -A -- "$2" ":(exclude,literal)$3"' land \
    "$landing_worktree" . "$landing_ledger_root"

wait_for_index "$landing_worktree"
(cd "$landing_worktree" && git diff --cached --quiet) >"$landing_output" 2>&1
landing_status=$?
if [ "$landing_status" -eq 0 ]; then
    printf 'worktree git commit: nothing staged, no wip commit made\n'
else
    wait_for_index "$landing_worktree"
    run_step "worktree git commit" sh -c 'cd "$1" && git commit -q -m wip' land "$landing_worktree"
fi

wait_for_index "$landing_worktree"
# A ledger file left untracked in the worktree counts as ignored here, so main's copy of it is
# checked out over it rather than stopping the checkout.
run_step "worktree git checkout" sh -c 'cd "$1" && git -c core.excludesFile="$3" checkout -b "$2-land" main' \
    land "$landing_worktree" "$landing_step" "$landing_ledger_ignore"
landing_left=$landing_left_land

# A range with no commit, as when the builder's only output is a ledger file the add leaves out,
# is one git cherry-pick refuses, so both cherry-picks are skipped and main is left as it is.
wait_for_index "$landing_worktree"
if [ "$(cd "$landing_worktree" && git rev-list --count "$landing_base..$landing_step")" = 0 ]; then
    printf 'nothing to copy: %s..%s holds no commit\n' "$landing_base" "$landing_step"
else
    wait_for_index "$landing_worktree"
    (cd "$landing_worktree" && git cherry-pick "$landing_base..$landing_step") >"$landing_output" 2>&1
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
    run_step "main git cherry-pick" git cherry-pick -n "main..$landing_step-land"
fi

# The plan's verify list, from the repository root on main as the cherry-pick left it, or as it
# was when the range holds no commit.
sh "$landing_script_dir/checks.sh" "$landing_state"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    fail "checks failed: checks.sh exited $landing_status"
fi

landing_range=$landing_base..$landing_step
git diff --stat "$landing_range" >"$landing_tmp/diff-stat.txt" 2>"$landing_output"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking diff stat failed" "$landing_status"
fi

git diff --cached --name-only >"$landing_tmp/staged-paths.txt" 2>"$landing_output"
landing_status=$?
if [ "$landing_status" -ne 0 ]; then
    cat "$landing_output" >&2
    fail "booking staged paths failed" "$landing_status"
fi

printf '%s\n' '=== booking ==='
printf 'Diff stat against %s:\n' "$landing_base"
cat "$landing_tmp/diff-stat.txt"
printf '%s\n' 'Staged paths:'
cat "$landing_tmp/staged-paths.txt"
printf '%s\n' '=== end booking ==='

#!/bin/sh
# Exercise pin.sh on a scratch repository and scratch skill folders, under a HOME whose path holds a space, checking the links it leaves, the pinned worktree, and its exit status; a run whose skills summary line or agents line names a folder outside the test's two scratch roots fails the test.
# Pin mode links every skill of the tag in every skill folder into the pinned worktree, leaves the pinned worktree where it is when the live clone moves on, removes the link of a skill the tag drops, and replaces a link into the live clone for a skill the tag holds.
# Pin mode refuses, before the worktree or a link changes, a link into the live clone for a skill the tag lacks, a pinned worktree with local changes, a link to a folder outside Ordo, a pinned worktree path that is not a git worktree (a folder inside the live clone, which stays on its branch), and a skill folder that is not an absolute path or ends in whitespace.
# Pin mode fails when the check after linking finds a link it could not make, and creates again a pinned worktree deleted by hand while another missing worktree keeps its registration.
# Check mode fails with no pinned worktree, and fails naming a link to a skill the tag lacks, a link into the live clone, a link left in ~/.agents/skills, and a missing link in the $CLAUDE_CONFIG_DIR folder; it passes on a fresh pin.
# The default folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills, not ~/.agents/skills, and ~/.agents/agents is not created with them, and ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs.
# In ~/.agents/skills, pin mode removes each link to the pinned worktree or the live clone or inside either, and keeps a real folder and a link to anywhere else; it leaves the folder alone when ORDO_SKILL_DIRS is set, and when the folder resolves to a folder of the list.
# A tag whose skills are top-level folders pins, and so does the move back to a skills/ tag.
# The agents: pin mode links every agent of the tag (a file agents/<name>.md) into the agents folder beside each skill folder, creating it, from ORDO_SKILL_DIRS and from the default folders with CLAUDE_CONFIG_DIR set, and prints the agents line after an unchanged skills line; a file not ending .md, a file in a subfolder and a hidden file are neither linked nor counted; two skill folders under one parent give one agents folder, linked once and named once.
# Pin mode replaces an agent link into the live clone, removes the links of an agent the tag drops and of every agent when the tag has no agents/ folder, and leaves a user's own agent file and a link outside Ordo under a name the tag does not hold.
# Pin mode refuses, before the worktree or a link changes, an agent link into the live clone for an agent the tag lacks, an entry for an agent of the tag that is a real file, a link outside Ordo or a directory, an agent folder path that is a file, and a folder that is both a skill folder and an agent folder; it fails when the check after linking finds an agent link it could not make.
# Check mode prints the agents line, fails naming a missing agent link, an agent link into the live clone and a link to an agent the pinned tag lacks, and with no agent folder and no agents passes without creating the folder.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/pin-test.XXXXXX") ||
    fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root" ${plain_root:+"$plain_root"}' 0 1 2 3 15
# The folders for the space-separated form, under a root whose path holds no space whatever TMPDIR is.
plain_root=$(mktemp -d /tmp/pin-plain.XXXXXX) || fail "could not create scratch directory in /tmp"
plain_root=$(CDPATH= cd "$plain_root" && pwd -P)
case "$plain_root" in
    *[[:space:]]*) fail "the scratch root $plain_root holds whitespace" ;;
esac
case "$test_root" in
    *'
'*) fail "the scratch root $test_root holds a newline; set TMPDIR to a path without one" ;;
esac
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)

nl='
'
tab=$(printf '\t')
export HOME="$test_root/my home"
mkdir -p "$HOME"
d1=$HOME/.claude/skills
d2=$HOME/.agents/skills
export ORDO_STABLE="$HOME/.local/share/ordo-stable"
export ORDO_SKILL_DIRS="$d1$nl$d2"
unset CLAUDE_CONFIG_DIR

# Runs pin.sh with the given arguments and sets out, err and status from the run. The skills summary line and the agents line are read apart, and each must name only folders under the scratch roots.
run_pin() {
    sh "$pin" "$@" >"$test_root/out" 2>"$test_root/err"
    status=$?
    out=$(cat "$test_root/out")
    err=$(cat "$test_root/err")
    for kind in skills agents; do
        printf '%s\n' "$out" | sed -n "s/^pinned: .* $kind linked in: //p" |
        awk -F ', ' '{ for (i = 1; i <= NF; i++) print $i }' |
        while IFS= read -r dir; do
            case "$dir" in
                "$test_root"/*|"$plain_root"/*) ;;
                *) fail "pin.sh linked $kind into $dir, outside the scratch roots" ;;
            esac
        done || exit 1
    done
}

# expect_line <text> <line> <what failed>: the text holds the line whole.
expect_line() {
    printf '%s\n' "$1" | grep -q -x -F -e "$2" || fail "$3; expected the line \"$2\" in: $1"
}

# expect_in <text> <expected part> <what failed>
expect_in() {
    case "$1" in
        *"$2"*) ;;
        *) fail "$3; expected \"$2\" in: $1" ;;
    esac
}

# Prints each entry of the two skill folders with its link target, one per line, to compare the links before and after a run.
links_state() {
    for entry in "$d1"/* "$d2"/*; do
        printf '%s -> %s\n' "$entry" "$(readlink "$entry")"
    done
}

repo=$test_root/ordo
mkdir -p "$repo/utils" "$repo/skills/alpha" "$repo/skills/beta"
cp "$script_dir/pin.sh" "$repo/utils/pin.sh"
printf -- '---\nname: alpha\n---\n' >"$repo/skills/alpha/SKILL.md"
printf -- '---\nname: beta\n---\n' >"$repo/skills/beta/SKILL.md"
git -C "$repo" init -q
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m one
git -C "$repo" tag v1

pin=$repo/utils/pin.sh
# Every run starts here; a relative folder would land in this folder.
work=$test_root/work
mkdir "$work"
cd "$work" || fail "could not enter $work"

run_pin
[ "$status" -ne 0 ] || fail "check mode passed with no pinned worktree"

run_pin v1
[ "$status" -eq 0 ] || fail "first pin failed: $out $err"
for dir in "$d1" "$d2"; do
    for skill in alpha beta; do
        [ "$(readlink "$dir/$skill")" = "$ORDO_STABLE/skills/$skill" ] ||
            fail "$dir/$skill does not link into the pin"
    done
done
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a fresh pin: $err"

# The live clone moves on; the pin does not until asked.
git -C "$repo" rm -q -r skills/alpha
mkdir -p "$repo/skills/gamma"
printf -- '---\nname: gamma\n---\n' >"$repo/skills/gamma/SKILL.md"
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m two
git -C "$repo" tag v2
[ -f "$ORDO_STABLE/skills/alpha/SKILL.md" ] ||
    fail "the pinned worktree changed with the live clone"

run_pin v2
[ "$status" -eq 0 ] || fail "second pin failed: $out $err"
for dir in "$d1" "$d2"; do
    [ -L "$dir/alpha" ] && fail "$dir/alpha still linked after the tag dropped it"
    [ "$(readlink "$dir/gamma")" = "$ORDO_STABLE/skills/gamma" ] || fail "$dir/gamma not linked"
done

# A link into the pinned worktree for a skill the tag lacks.
ln -s "$ORDO_STABLE/skills/alpha" "$d1/alpha"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a link to a skill the tag lacks"
expect_in "$err" \
    "pin: $d1/alpha links to $ORDO_STABLE/skills/alpha, which the pinned tag does not have" \
    "check mode did not name the link to a skill the tag lacks"
run_pin v2
[ "$status" -eq 0 ] || fail "re-pinning over a link to a skill the tag lacks failed: $out $err"
[ -L "$d1/alpha" ] && fail "the link to a skill the tag lacks was not removed"

# A link into the live clone for a skill the tag holds: check mode names it, pin mode replaces it.
ln -sfn "$repo/skills/beta" "$d1/beta"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a link into the live clone"
expect_in "$err" "pin: $d1/beta links to $repo/skills/beta, in the live clone $repo" \
    "check mode did not name the link into the live clone"
run_pin v2
[ "$status" -eq 0 ] || fail "re-pinning did not repair the link: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "the link into the live clone was not replaced"

# A link into the live clone for a skill the tag lacks: check mode names it; pin mode refuses it before anything changes, so the worktree, the stale link and the other links stay as they are.
ln -s "$repo/skills/dev" "$d1/dev"
ln -s "$ORDO_STABLE/skills/alpha" "$d2/alpha"
run_pin
[ "$status" -ne 0 ] ||
    fail "check mode passed with a link into the live clone for a skill the tag lacks"
expect_in "$err" "pin: $d1/dev links to $repo/skills/dev, in the live clone $repo" \
    "check mode did not name the link into the live clone for a skill the tag lacks"
run_pin v1
[ "$status" -ne 0 ] ||
    fail "pin mode passed with a link into the live clone for a skill the tag lacks"
expect_in "$err" \
    "pin: $d1/dev links into the live clone $repo; move it away or pin a tag that holds it" \
    "pin mode did not refuse the link into the live clone"
[ "$(readlink "$d1/dev")" = "$repo/skills/dev" ] ||
    fail "pin mode removed a link into the live clone"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] ||
    fail "a pin refused for a link into the live clone moved the worktree"
[ "$(readlink "$d2/alpha")" = "$ORDO_STABLE/skills/alpha" ] ||
    fail "a pin refused for a link into the live clone removed a link"
[ "$(readlink "$d1/gamma")" = "$ORDO_STABLE/skills/gamma" ] ||
    fail "a pin refused for a link into the live clone changed a link"
rm "$d1/dev" "$d2/alpha"

# The check after linking fails when a link could not be made.
rm "$d2/beta"
chmod a-w "$d2"
run_pin v2
chmod u+w "$d2"
[ "$status" -ne 0 ] || fail "pin mode passed with a link it could not make"
expect_in "$err" \
    "pin: $d2/beta does not link to $ORDO_STABLE/skills/beta" \
    "the check after linking did not name the missing link"
expect_in "$err" \
    "pin: the links do not match the pin after linking" \
    "the check after linking did not fail"
ln -s "$ORDO_STABLE/skills/beta" "$d2/beta"

# A pinned worktree with local changes is refused before the worktree or a link changes. Red when the pin checks the worktree out, or relinks, before it refuses.
printf 'edit\n' >>"$ORDO_STABLE/skills/beta/SKILL.md"
links_before=$(links_state)
run_pin v1
[ "$status" -ne 0 ] || fail "pinned over a worktree with local changes"
expect_in "$err" \
    "has local changes; the pinned worktree is never edited" \
    "the local-changes refusal has no message"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] ||
    fail "a pin refused for local changes moved the worktree"
[ "$(links_state)" = "$links_before" ] || fail "a pin refused for local changes changed a link"
git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md

# A link to a folder outside Ordo is refused before the worktree or a link changes. Red when the pin checks the worktree out, or relinks, before it refuses.
rm "$d1/beta"
ln -s /elsewhere/beta "$d1/beta"
links_before=$(links_state)
run_pin v1
[ "$status" -ne 0 ] || fail "replaced a link to a folder outside Ordo"
expect_in "$err" \
    "pin: $d1/beta links to /elsewhere/beta, outside Ordo; move it away and run again" \
    "the foreign-link refusal has no message"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] ||
    fail "a pin refused for a link outside Ordo moved the worktree"
[ "$(links_state)" = "$links_before" ] || fail "a pin refused for a link outside Ordo changed a link"
rm "$d1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$d1/beta"

# A pinned worktree path that exists and is not a git worktree is refused before anything changes. The folder sits inside the live clone and the skill folder is empty, so no other refusal stops a pin that went ahead: it would check the live clone out at the tag. Red when the not-a-worktree refusal is dropped.
saved_stable=$ORDO_STABLE
saved_dirs=$ORDO_SKILL_DIRS
ORDO_STABLE=$repo/plain
ORDO_SKILL_DIRS="$test_root/empty-skills$nl"
mkdir "$ORDO_STABLE" "$test_root/empty-skills"
branch_before=$(git -C "$repo" symbolic-ref -q HEAD) || fail "the live clone is not on a branch"
run_pin v1
[ "$(git -C "$repo" symbolic-ref -q HEAD)" = "$branch_before" ] ||
    fail "a pin into a folder inside the live clone moved the live clone off $branch_before"
[ "$status" -eq 1 ] || fail "a pin into a folder that is not a git worktree exited $status: $out $err"
expect_in "$err" \
    "pin: $ORDO_STABLE exists and is not a git worktree" \
    "the not-a-worktree refusal has no message"
[ -z "$(ls -A "$ORDO_STABLE")" ] ||
    fail "a refused pin wrote into the folder that is not a worktree"
rmdir "$ORDO_STABLE" "$test_root/empty-skills"
ORDO_STABLE=$saved_stable
ORDO_SKILL_DIRS=$saved_dirs

# A pinned worktree deleted by hand is still registered with git; pinning creates it again, and another worktree of the clone deleted by hand keeps its registration.
other=$test_root/other
git -C "$repo" worktree add -q --detach "$other" v1
rm -rf "$other" "$ORDO_STABLE"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning after the worktree was deleted by hand failed: $out $err"
[ -f "$ORDO_STABLE/skills/beta/SKILL.md" ] || fail "the deleted worktree was not created again"
git -C "$repo" worktree list --porcelain | grep -q -x -F "worktree $other" ||
    fail "pinning dropped the registration of another missing worktree"

# The default folder list, under the HOME that holds a space, with and without CLAUDE_CONFIG_DIR.
unset ORDO_SKILL_DIRS
rm -rf "$d1" "$d2" "$HOME/.agents/agents"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with the default folders failed: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "$d1/beta not linked with the default folders"
# The default folders are Claude Code's only, so $d2 and its agents folder stay absent. Red when the defaults hold $d2.
[ ! -e "$d2" ] || fail "pin.sh wrote into $d2 with the default folders"
[ ! -e "$HOME/.agents/agents" ] || fail "pin.sh created $HOME/.agents/agents with the default folders"

# ~/.agents/skills, a folder the default list does not hold. Pin mode removes each link there to the pinned worktree or the live clone or inside either, and leaves a real folder and a link to anywhere else.
# One link names a top-level skill folder of the pinned worktree that a skills/ tag does not have; one names the worktree through a link to its parent folder, so it is inside the worktree only once the path is resolved; one names the worktree's root.
gone_line="in a folder pin.sh no longer links into"
mkdir -p "$d2/find-skills" "$test_root/foreign/other"
printf -- '---\nname: find-skills\n---\n' >"$d2/find-skills/SKILL.md"
ln -s "$ORDO_STABLE/land" "$d2/land"
ln -s "$repo/skills/gamma" "$d2/gamma"
ln -s "$test_root/foreign/other" "$d2/other"
ln -s "$HOME/.local/share" "$HOME/share-link"
ln -s "$HOME/share-link/ordo-stable/plan" "$d2/plan"
ln -s "$ORDO_STABLE" "$d2/stable-root"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with links in $d2 failed: $out $err"
# Red when pin mode leaves the folder alone.
[ -L "$d2/land" ] && fail "the link into the pinned worktree in $d2 was not removed"
# Red when the removal matches only the pinned worktree, not the live clone.
[ -L "$d2/gamma" ] && fail "the link into the live clone in $d2 was not removed"
# Red when the target is compared only as the link names it.
[ -L "$d2/plan" ] && fail "the link into the pinned worktree through a linked folder was not removed"
# Red when only a path inside the worktree counts, not the worktree's root.
[ -L "$d2/stable-root" ] && fail "the link to the pinned worktree's root was not removed"
# Red when every link in the folder is removed, whatever its target.
[ "$(readlink "$d2/other")" = "$test_root/foreign/other" ] ||
    fail "the link to a folder outside Ordo in $d2 was changed"
[ -f "$d2/find-skills/SKILL.md" ] || fail "the real folder in $d2 was changed"

# Check mode fails on such a link and names it. Red when check mode does not read the folder.
ln -s "$ORDO_STABLE/land" "$d2/land"
run_pin
[ "$status" -eq 1 ] || fail "check mode did not fail on a link in $d2 (exit $status)"
expect_in "$err" \
    "pin: $d2/land links to $ORDO_STABLE/land, $gone_line; utils/pin.sh <tag> removes it" \
    "check mode did not name the link in $d2"

# With ORDO_SKILL_DIRS set, the folder is not read, in the newline form since the path of $d1 holds a space. Red when the removal ignores ORDO_SKILL_DIRS.
export ORDO_SKILL_DIRS="$d1$nl"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with ORDO_SKILL_DIRS set failed: $out $err"
[ "$(readlink "$d2/land")" = "$ORDO_STABLE/land" ] ||
    fail "the link in $d2 was removed with ORDO_SKILL_DIRS set"
unset ORDO_SKILL_DIRS

rm -rf "$d2" "$HOME/share-link" "$test_root/foreign"

# ~/.agents/skills a link to ~/.claude/skills is a folder of the list by its resolved path: the pin passes and removes nothing. Red when the folders are compared by their paths only.
mkdir -p "$HOME/.agents"
ln -s "$d1" "$d2"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with $d2 a link to $d1 failed: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] || fail "$d1/beta is not linked"
rm "$d2"
rmdir "$HOME/.agents"
export CLAUDE_CONFIG_DIR="$HOME/config"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR set failed: $out $err"
[ "$(readlink "$CLAUDE_CONFIG_DIR/skills/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "the CLAUDE_CONFIG_DIR folder was not linked"
rm "$CLAUDE_CONFIG_DIR/skills/beta"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a missing link in the CLAUDE_CONFIG_DIR folder"
expect_in "$err" "pin: $CLAUDE_CONFIG_DIR/skills/beta does not link to $ORDO_STABLE/skills/beta" \
    "check mode did not name the missing link in the CLAUDE_CONFIG_DIR folder"
rm -rf "$CLAUDE_CONFIG_DIR"
unset CLAUDE_CONFIG_DIR

# ORDO_SKILL_DIRS in its space-separated form, split on spaces and on tabs.
export ORDO_SKILL_DIRS="$plain_root/a  $plain_root/b$tab$plain_root/c"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with a space-separated ORDO_SKILL_DIRS failed: $out $err"
for dir in "$plain_root/a" "$plain_root/b" "$plain_root/c"; do
    [ "$(readlink "$dir/beta")" = "$ORDO_STABLE/skills/beta" ] ||
        fail "$dir/beta not linked from the space-separated list"
done

# A folder that is not an absolute path, or that ends in whitespace, is refused before anything changes, in either form.
for bad in "rel/skills" "$d1 "; do
    for form in newline space; do
        if [ "$form" = newline ]; then
            ORDO_SKILL_DIRS="$bad$nl$d1"
        else
            case "$bad" in
                *[[:space:]]*) continue ;;
            esac
            ORDO_SKILL_DIRS="$plain_root/a $bad"
        fi
        run_pin v1
        [ "$status" -ne 0 ] || fail "pinned with the folder \"$bad\" ($form form)"
        case "$bad" in
            rel/*) want="pin: '$bad' is not an absolute path" ;;
            *) want="pin: '$bad' has leading or trailing whitespace" ;;
        esac
        expect_in "$err" "$want" \
            "the folder \"$bad\" ($form form) was not refused with its message"
        [ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] ||
            fail "a pin refused for the folder \"$bad\" moved the worktree"
        [ "$(readlink "$d1/gamma")" = "$ORDO_STABLE/skills/gamma" ] ||
            fail "a pin refused for the folder \"$bad\" changed a link"
        [ -z "$(ls -A "$work")" ] ||
            fail "a pin refused for \"$bad\" wrote into $work: $(ls -A "$work")"
    done
done
export ORDO_SKILL_DIRS="$d1$nl$d2"

# A tag from before the skills moved under skills/ still pins, and so does the move back.
git -C "$repo" checkout -q --detach v2
old=$test_root/old
git -C "$repo" worktree add -q --detach "$old" v2
mkdir -p "$old/delta"
printf -- '---\nname: delta\n---\n' >"$old/delta/SKILL.md"
git -C "$old" rm -q -r skills
git -C "$old" add -A
git -C "$old" -c user.name=t -c user.email=t@t commit -q -m flat
git -C "$repo" tag v0 "$(git -C "$old" rev-parse HEAD)"
git -C "$repo" checkout -q -
run_pin v0
[ "$status" -eq 0 ] || fail "a top-level tag did not pin: $out $err"
[ "$(readlink "$d1/delta")" = "$ORDO_STABLE/delta" ] ||
    fail "the top-level skill is not linked from the worktree's top level"
[ -L "$d1/beta" ] && fail "a skill the top-level tag lacks is still linked"
run_pin v2
[ "$status" -eq 0 ] || fail "moving back to a skills/ tag failed: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "beta not linked from skills/ after moving back"
[ -L "$d1/delta" ] && fail "the top-level skill is still linked after moving back"

# The agents: v3 holds agents/ordo-a.md and agents/ordo-b.md beside a file that is not .md, a file in a subfolder and a hidden file; v4 drops ordo-b.md; v2 has no agents/ folder. The agent folders are the agents folders beside the skill folders.
a1=$HOME/.claude/agents
a2=$HOME/.agents/agents
mkdir -p "$repo/agents/sub"
for agent in ordo-a ordo-b; do
    printf -- '---\nname: %s\n---\n' "$agent" >"$repo/agents/$agent.md"
done
printf 'notes\n' >"$repo/agents/notes.txt"
printf -- '---\nname: x\n---\n' >"$repo/agents/sub/x.md"
printf -- '---\nname: hidden\n---\n' >"$repo/agents/.hidden.md"
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m agents
git -C "$repo" tag v3
git -C "$repo" rm -q agents/ordo-b.md
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m drop-b
git -C "$repo" tag v4

# Prints each entry of the two agent folders with its link target, one per line, to compare the entries before and after a run.
agent_links_state() {
    for entry in "$a1"/* "$a2"/*; do
        printf '%s -> %s\n' "$entry" "$(readlink "$entry")"
    done
}

# expect_refused <tag the worktree stays at> <what failed>: the run exited 1 and changed neither the worktree nor a link.
expect_refused() {
    [ "$status" -eq 1 ] || fail "$2: exit $status, expected 1: $out $err"
    [ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "$1" ] ||
        fail "$2: the pinned worktree moved"
    [ "$(links_state)" = "$skill_links_before" ] || fail "$2: a skill link changed"
    [ "$(agent_links_state)" = "$agent_links_before" ] || fail "$2: an agent folder entry changed"
}

# A first pin links both agents in the agents folder beside each of the two ORDO_SKILL_DIRS folders, creating the folders, and prints the agents line after the skills line. Red when pin.sh does not link the agents, or prints no agents line.
# The earlier pins of tags without agents left both agent folders empty; they are removed so the first agent pin creates them.
rmdir "$a1" "$a2" || fail "an agent folder is not empty before the first agent pin"
run_pin v3
[ "$status" -eq 0 ] || fail "the first pin of a tag with agents failed: $out $err"
for dir in "$a1" "$a2"; do
    for agent in ordo-a ordo-b; do
        [ "$(readlink "$dir/$agent.md")" = "$ORDO_STABLE/agents/$agent.md" ] ||
            fail "$dir/$agent.md does not link into the pin"
    done
done
expect_line "$out" "pinned: 2 agents linked in: $a1, $a2" "the first agent pin printed no agents line"
[ "$(printf '%s\n' "$out" | sed -n 's/^pinned: v3 ([0-9a-f]*), 2 skills linked in: .*/skills/p')" = skills ] ||
    fail "the skills summary line changed its form: $out"

# A file not ending .md, a file in a subfolder of agents/ and a hidden file are not agents: neither linked nor counted. Red when every file under agents/ counts.
for entry in notes.txt x.md sub .hidden.md; do
    [ -e "$a1/$entry" ] || [ -L "$a1/$entry" ] && fail "$a1/$entry was linked, and it is not an agent"
done

# Check mode passes on a fresh pin and prints the agents line. Red when check mode prints no agents line.
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a fresh agent pin: $err"
expect_line "$out" "pinned: 2 agents linked in: $a1, $a2" "check mode printed no agents line"

# Check mode fails naming an agent whose link is missing. Red when check mode does not read the agent folders.
rm "$a1/ordo-a.md"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with an agent link missing"
expect_in "$err" "pin: $a1/ordo-a.md does not link to $ORDO_STABLE/agents/ordo-a.md" \
    "check mode did not name the missing agent link"

# Check mode fails naming an agent link into the live clone; pin mode replaces it, since the tag holds the agent. Red when either mode ignores links into the live clone in an agent folder.
ln -s "$repo/agents/ordo-a.md" "$a1/ordo-a.md"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with an agent link into the live clone"
expect_in "$err" "pin: $a1/ordo-a.md links to $repo/agents/ordo-a.md, in the live clone $repo" \
    "check mode did not name the agent link into the live clone"
run_pin v3
[ "$status" -eq 0 ] || fail "re-pinning over an agent link into the live clone failed: $out $err"
expect_line "$out" "pin: replaced $a1/ordo-a.md, which linked into the live clone $repo" \
    "pin mode did not report the replaced agent link"
[ "$(readlink "$a1/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
    fail "the agent link into the live clone was not replaced"

# An agent link into the live clone for an agent the tag lacks is refused before anything changes. Red when pin mode does not read the agent folders before it moves the worktree.
ln -s "$repo/agents/ordo-z.md" "$a1/ordo-z.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin over an agent link into the live clone for an agent the tag lacks"
expect_in "$err" \
    "pin: $a1/ordo-z.md links into the live clone $repo; move it away or pin a tag that holds it" \
    "the agent link into the live clone was not refused with its message"
rm "$a1/ordo-z.md"

# A user's own agent file and a link to a file outside Ordo, under names the tag does not hold, are left as they are by pin mode and not reported by check mode. The controls: the same two entries under the name of an agent the tag holds are refused, so the silence is about the name. Red when pin mode refuses, moves or removes every real file or foreign link in an agent folder.
printf 'mine\n' >"$a1/mine.md"
printf 'other\n' >"$test_root/foreign-agent.md"
ln -s "$test_root/foreign-agent.md" "$a1/other.md"
rm "$a1/ordo-a.md"
printf 'my own ordo-a\n' >"$a1/ordo-a.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin over a real file ordo-a.md"
expect_in "$err" "pin: $a1/ordo-a.md is a real file; move it away and run again" \
    "the real agent file was not refused with its message"
[ "$(cat "$a1/ordo-a.md")" = "my own ordo-a" ] || fail "a refused pin changed the real agent file"
rm "$a1/ordo-a.md"
ln -s "$test_root/foreign-agent.md" "$a1/ordo-a.md"
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin over an agent link outside Ordo"
expect_in "$err" \
    "pin: $a1/ordo-a.md links to $test_root/foreign-agent.md, outside Ordo; move it away and run again" \
    "the agent link outside Ordo was not refused with its message"
rm "$a1/ordo-a.md"
ln -s "$ORDO_STABLE/agents/ordo-a.md" "$a1/ordo-a.md"
run_pin v3
[ "$status" -eq 0 ] || fail "a pin with a user's own agent file and a foreign link failed: $out $err"
[ "$(cat "$a1/mine.md")" = "mine" ] && [ ! -L "$a1/mine.md" ] || fail "pin mode changed the user's own agent file"
[ "$(readlink "$a1/other.md")" = "$test_root/foreign-agent.md" ] || fail "pin mode changed the link outside Ordo"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a user's own agent file or a foreign link: $err"
case "$err" in
    *mine.md* | *other.md*) fail "check mode reported the user's own entries: $err" ;;
esac

# A later tag without ordo-b.md removes its links and keeps ordo-a.md's. Red when pin mode leaves the links of an agent the tag drops.
run_pin v4
[ "$status" -eq 0 ] || fail "pinning a tag that drops an agent failed: $out $err"
for dir in "$a1" "$a2"; do
    [ -L "$dir/ordo-b.md" ] && fail "$dir/ordo-b.md still linked after the tag dropped it"
    expect_line "$out" "pin: removed $dir/ordo-b.md, which the tag v4 does not hold" \
        "pin mode did not report the removed agent link in $dir"
    [ "$(readlink "$dir/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
        fail "$dir/ordo-a.md lost its link when the tag dropped ordo-b.md"
done
expect_line "$out" "pinned: 1 agents linked in: $a1, $a2" "the agents line does not count 1 agent"

# Check mode fails naming a link into the pinned worktree for an agent the pinned tag lacks. Red when check mode reads only the agents of the pinned worktree.
ln -s "$ORDO_STABLE/agents/ordo-b.md" "$a1/ordo-b.md"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a link to an agent the tag lacks"
expect_in "$err" \
    "pin: $a1/ordo-b.md links to $ORDO_STABLE/agents/ordo-b.md, which the pinned tag does not have" \
    "check mode did not name the link to an agent the tag lacks"
rm "$a1/ordo-b.md"

# An agent folder entry ordo-a.md that is a directory is refused before anything changes, with the directory refusal's own message. Red when the directory branch is dropped: the real-file branch then refuses the entry with another message.
rm "$a1/ordo-a.md"
mkdir "$a1/ordo-a.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v3
expect_refused v4 "a pin over a directory ordo-a.md"
expect_in "$err" "pin: $a1/ordo-a.md is a directory; move it away and run again" \
    "the directory ordo-a.md was not refused with its message"
[ -z "$(ls -A "$a1/ordo-a.md")" ] || fail "a refused pin wrote into the directory ordo-a.md"
rmdir "$a1/ordo-a.md"
ln -s "$ORDO_STABLE/agents/ordo-a.md" "$a1/ordo-a.md"

# An agent folder path that is a regular file is refused before anything changes. Red when the refusal is dropped: the pin would move the worktree and then fail.
mkdir -p "$test_root/filed/skills"
printf 'not a folder\n' >"$test_root/filed/agents"
export ORDO_SKILL_DIRS="$test_root/filed/skills$nl"
run_pin v3
[ "$status" -eq 1 ] || fail "a pin with an agent folder that is a file exited $status: $out $err"
expect_in "$err" "pin: $test_root/filed/agents is not a folder; move it away and run again" \
    "the agent folder that is a file was not refused with its message"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v4" ] ||
    fail "a pin refused for an agent folder that is a file moved the worktree"
[ -z "$(ls -A "$test_root/filed/skills")" ] || fail "a pin refused for an agent folder that is a file linked a skill"
rm -rf "$test_root/filed"

# A folder that is both a skill folder and an agent folder is refused before anything changes. Red when the refusal is dropped: the skills would be linked into the agent folder.
export ORDO_SKILL_DIRS="$d1$nl$a1"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v3
expect_refused v4 "a pin with a folder that is both a skill folder and an agent folder"
expect_in "$err" "pin: $a1 is both a skill folder and an agent folder" \
    "the folder that is both was not refused with its message"

# The same folder spelled with two trailing slashes is refused the same way. Red when the comparison strips only one trailing slash.
export ORDO_SKILL_DIRS="$d1$nl$a1//"
run_pin v3
expect_refused v4 "a pin with the agent folder spelled with two trailing slashes as a skill folder"
expect_in "$err" "pin: $a1 is both a skill folder and an agent folder" \
    "the folder that is both, spelled with two trailing slashes, was not refused with its message"

# The same folder reached through a symbolic link is refused the same way. Red when the folders are compared only as spelled.
ln -s "$a1" "$test_root/agents-alias"
export ORDO_SKILL_DIRS="$d1$nl$test_root/agents-alias"
run_pin v3
expect_refused v4 "a pin with the agent folder reached through a symbolic link as a skill folder"
expect_in "$err" "pin: $a1 is both a skill folder and an agent folder" \
    "the folder that is both, reached through a symbolic link, was not refused with its message"
rm "$test_root/agents-alias"
export ORDO_SKILL_DIRS="$d1$nl$d2"

# A tag with no agents/ folder pins with 0 agents and removes every agent link into the pinned worktree, leaving the user's own entries. Red when the removal reads only the agents a tag holds.
run_pin v3
[ "$status" -eq 0 ] || fail "pinning v3 again failed: $out $err"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning a tag with no agents failed: $out $err"
expect_line "$out" "pinned: 0 agents linked in: $a1, $a2" "the agents line of a tag with no agents"
for dir in "$a1" "$a2"; do
    for agent in ordo-a ordo-b; do
        [ -L "$dir/$agent.md" ] && fail "$dir/$agent.md still linked after a tag with no agents"
    done
done
[ "$(cat "$a1/mine.md")" = "mine" ] || fail "a tag with no agents changed the user's own agent file"
[ "$(readlink "$a1/other.md")" = "$test_root/foreign-agent.md" ] ||
    fail "a tag with no agents changed the link outside Ordo"

# Check mode with no agent folder and a pinned tag without agents passes with 0 agents and creates no folder. Red when check mode creates the agent folders.
rm -rf "$a1" "$a2"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed with no agent folder and no agents: $err"
expect_line "$out" "pinned: 0 agents linked in: $a1, $a2" "check mode's agents line with no agents"
[ ! -e "$a1" ] && [ ! -e "$a2" ] || fail "check mode created an agent folder"

# The check after linking fails when an agent link could not be made. Red when the check after linking does not read the agent folders.
mkdir -p "$a2"
chmod a-w "$a2"
run_pin v3
chmod u+w "$a2"
[ "$status" -ne 0 ] || fail "pin mode passed with an agent link it could not make"
expect_in "$err" "pin: $a2/ordo-a.md does not link to $ORDO_STABLE/agents/ordo-a.md" \
    "the check after linking did not name the missing agent link"
expect_in "$err" "pin: the links do not match the pin after linking" \
    "the check after linking did not fail on the missing agent link"
run_pin v3
[ "$status" -eq 0 ] || fail "re-pinning after the unwritable agent folder failed: $out $err"

# With the default folders and CLAUDE_CONFIG_DIR set, ~/.claude/agents and $CLAUDE_CONFIG_DIR/agents both get the links. Red when the agent folders are not derived from the default skill folders.
unset ORDO_SKILL_DIRS
export CLAUDE_CONFIG_DIR="$HOME/config"
run_pin v3
[ "$status" -eq 0 ] || fail "an agent pin with CLAUDE_CONFIG_DIR set failed: $out $err"
for dir in "$a1" "$CLAUDE_CONFIG_DIR/agents"; do
    [ "$(readlink "$dir/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
        fail "$dir/ordo-a.md not linked with CLAUDE_CONFIG_DIR set"
done
expect_line "$out" "pinned: 2 agents linked in: $a1, $CLAUDE_CONFIG_DIR/agents" \
    "the agents line with CLAUDE_CONFIG_DIR set"
rm -rf "$CLAUDE_CONFIG_DIR"
unset CLAUDE_CONFIG_DIR

# Two skill folders under one parent share one agents folder, linked once and named once. Red when the agent folders are not deduplicated.
export ORDO_SKILL_DIRS="$plain_root/a  $plain_root/b$tab$plain_root/c"
run_pin v3
[ "$status" -eq 0 ] || fail "an agent pin with one parent for three skill folders failed: $out $err"
[ "$(readlink "$plain_root/agents/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
    fail "$plain_root/agents/ordo-a.md not linked"
expect_line "$out" "pinned: 2 agents linked in: $plain_root/agents" \
    "the shared agents folder is not named once"
export ORDO_SKILL_DIRS="$d1$nl$d2"

printf 'PASS: pin.sh scratch tests\n'

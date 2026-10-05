#!/bin/sh
# Exercise pin.sh on a scratch repository under a scratch HOME whose path holds a space, checking the links it leaves, the pinned worktree and its exit status. A run whose skills summary line or agents line names a folder outside the test's two scratch roots fails the test.
# Each case is kept because its failure loses a user's file, leaves the installed skills moving with the live clone, reports a broken installation as sound, or leaves a tag unpinnable.
# Pin: links every skill of the tag into every default folder (~/.claude/skills and ~/.claude-work/skills, with the config folder that holds no skills folder left alone), leaves the pinned worktree where it is when the live clone moves on, removes the link of a skill the tag drops, and replaces a link into the live clone for a skill the tag holds.
# Refusals before anything changes: a link into the live clone for a skill the tag lacks, a pinned worktree with local changes, a link to a folder outside Ordo, a pinned worktree path that is not a git worktree, and a skill folder that is not an absolute path.
# The check after linking fails when a link could not be made, and a pinned worktree deleted by hand is created again while another missing worktree keeps its registration.
# A tag whose skills stand at the top level (v1.0.0 of Ordo) is pinned and linked.
# Check mode fails with no pinned worktree, names a link into the live clone and a missing link, and passes on a fresh pin.
# CLAUDE_CONFIG_DIR names a folder the glob also finds, which pins, or another folder that is linked; ORDO_SKILL_DIRS, split on spaces and tabs, replaces the list.
# ~/.agents/skills: pin mode removes each link to the pinned worktree or the live clone and keeps a real folder and a link to anywhere else; check mode names such a link; the folder is left alone when ORDO_SKILL_DIRS is set.
# The agents: pin mode links every agent of the tag into the agents folder beside each skill folder, skips a file not ending .md, a file in a subfolder and a hidden file, replaces an agent link into the live clone, removes the links of an agent the tag drops, refuses a real file, a link outside Ordo and a link into the live clone for an agent the tag lacks, refuses an agent folder that is a file or is also a skill folder, and leaves a user's own agent file alone.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/pin-test.XXXXXX") ||
    fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root" ${plain_root:+"$plain_root"}' 0 1 2 3 15
# The folders of ORDO_SKILL_DIRS, split on spaces, sit under a root whose path holds no space whatever TMPDIR is.
plain_root=$(mktemp -d /tmp/pin-plain.XXXXXX) || fail "could not create scratch directory in /tmp"
plain_root=$(CDPATH= cd "$plain_root" && pwd -P)
case "$plain_root" in
    *[[:space:]]*) fail "the scratch root $plain_root holds whitespace" ;;
esac
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)

export HOME="$test_root/my home"
export ORDO_STABLE="$HOME/.local/share/ordo-stable"
unset ORDO_SKILL_DIRS CLAUDE_CONFIG_DIR
d1=$HOME/.claude/skills
d2=$HOME/.claude-work/skills
a1=$HOME/.claude/agents
a2=$HOME/.claude-work/agents
d3=$HOME/.agents/skills
mkdir -p "$d1" "$d2" "$HOME/.claude-science"

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
[ -z "$(ls -A "$HOME/.claude-science")" ] ||
    fail "pin.sh created $(ls -A "$HOME/.claude-science") in a config folder with no skills folder"
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

# A link into the live clone for a skill the tag lacks is refused before anything changes, so the worktree and the other links stay as they are.
ln -s "$repo/skills/dev" "$d1/dev"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v1
expect_refused v2 "a pin over a link into the live clone for a skill the tag lacks"
expect_in "$err" \
    "pin: $d1/dev links into the live clone $repo; move it away or pin a tag that holds it" \
    "pin mode did not refuse the link into the live clone"
rm "$d1/dev"

# The check after linking fails when a link could not be made.
rm "$d2/beta"
chmod a-w "$d2"
run_pin v2
chmod u+w "$d2"
[ "$status" -ne 0 ] || fail "pin mode passed with a link it could not make"
expect_in "$err" \
    "pin: $d2/beta does not link to $ORDO_STABLE/skills/beta" \
    "the check after linking did not name the missing link"
ln -s "$ORDO_STABLE/skills/beta" "$d2/beta"

# A pinned worktree with local changes is refused before the worktree or a link changes.
printf 'edit\n' >>"$ORDO_STABLE/skills/beta/SKILL.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v1
expect_refused v2 "a pin over a worktree with local changes"
expect_in "$err" "has local changes; the pinned worktree is never edited" \
    "the local-changes refusal has no message"
git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md

# A link to a folder outside Ordo is refused before the worktree or a link changes.
rm "$d1/beta"
ln -s /elsewhere/beta "$d1/beta"
skill_links_before=$(links_state)
run_pin v1
expect_refused v2 "a pin over a link to a folder outside Ordo"
expect_in "$err" \
    "pin: $d1/beta links to /elsewhere/beta, outside Ordo; move it away and run again" \
    "the foreign-link refusal has no message"
rm "$d1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$d1/beta"

# A tag whose skills stand at the top level, as v1.0.0 of Ordo does, is pinned and its skills linked, and the pin goes forward again.
blob=$(printf -- '---\nname: alpha\n---\n' | git -C "$repo" hash-object -w --stdin)
inner=$(printf '100644 blob %s\tSKILL.md\n' "$blob" | git -C "$repo" mktree)
top=$(printf '040000 tree %s\talpha\n' "$inner" | git -C "$repo" mktree)
old_commit=$(git -C "$repo" -c user.name=t -c user.email=t@t commit-tree "$top" -m old)
git -C "$repo" tag v0 "$old_commit"
run_pin v0
[ "$status" -eq 0 ] || fail "pinning a tag with its skills at the top level failed: $out $err"
for dir in "$d1" "$d2"; do
    [ "$(readlink "$dir/alpha")" = "$ORDO_STABLE/alpha" ] || fail "$dir/alpha does not link into the top-level skill of the tag"
done
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a tag with its skills at the top level: $err"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning v2 after a top-level tag failed: $out $err"
for dir in "$d1" "$d2"; do
    [ -L "$dir/alpha" ] && fail "$dir/alpha still linked after v2"
    [ "$(readlink "$dir/gamma")" = "$ORDO_STABLE/skills/gamma" ] || fail "$dir/gamma not linked after v2"
done
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] || fail "$d1/beta not linked after v2"

# A pinned worktree path that exists and is not a git worktree is refused before anything changes. The folder sits inside the live clone and the skill folder is empty, so no other refusal stops a pin that went ahead: it would check the live clone out at the tag.
saved_stable=$ORDO_STABLE
ORDO_STABLE=$repo/plain
export ORDO_SKILL_DIRS="$plain_root/empty"
mkdir "$ORDO_STABLE" "$plain_root/empty"
branch_before=$(git -C "$repo" symbolic-ref -q HEAD) || fail "the live clone is not on a branch"
run_pin v1
[ "$(git -C "$repo" symbolic-ref -q HEAD)" = "$branch_before" ] ||
    fail "a pin into a folder inside the live clone moved the live clone off $branch_before"
[ "$status" -eq 1 ] || fail "a pin into a folder that is not a git worktree exited $status: $out $err"
expect_in "$err" "pin: $ORDO_STABLE exists and is not a git worktree" \
    "the not-a-worktree refusal has no message"
[ -z "$(ls -A "$ORDO_STABLE")" ] ||
    fail "a refused pin wrote into the folder that is not a worktree"
rmdir "$ORDO_STABLE" "$plain_root/empty"
ORDO_STABLE=$saved_stable
unset ORDO_SKILL_DIRS

# A pinned worktree deleted by hand is still registered with git; pinning creates it again, and another worktree of the clone deleted by hand keeps its registration.
other=$test_root/other
git -C "$repo" worktree add -q --detach "$other" v1
rm -rf "$other" "$ORDO_STABLE"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning after the worktree was deleted by hand failed: $out $err"
[ -f "$ORDO_STABLE/skills/beta/SKILL.md" ] || fail "the deleted worktree was not created again"
git -C "$repo" worktree list --porcelain | grep -q -x -F "worktree $other" ||
    fail "pinning dropped the registration of another missing worktree"

# ~/.agents/skills, a folder the default list does not hold. Pin mode removes each link there to the pinned worktree or the live clone, and leaves a real folder and a link to anywhere else.
mkdir -p "$d3/find-skills" "$test_root/foreign/other"
printf -- '---\nname: find-skills\n---\n' >"$d3/find-skills/SKILL.md"
ln -s "$ORDO_STABLE/skills/gamma" "$d3/pinned"
ln -s "$repo/skills/gamma" "$d3/clone"
ln -s "$test_root/foreign/other" "$d3/other"
run_pin
[ "$status" -eq 1 ] || fail "check mode did not fail on a link in $d3 (exit $status)"
expect_in "$err" "pin: $d3/pinned links to $ORDO_STABLE/skills/gamma" \
    "check mode did not name the link in $d3"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with links in $d3 failed: $out $err"
[ -L "$d3/pinned" ] && fail "the link into the pinned worktree in $d3 was not removed"
[ -L "$d3/clone" ] && fail "the link into the live clone in $d3 was not removed"
[ "$(readlink "$d3/other")" = "$test_root/foreign/other" ] ||
    fail "the link to a folder outside Ordo in $d3 was changed"
[ -f "$d3/find-skills/SKILL.md" ] || fail "the real folder in $d3 was changed"

# CLAUDE_CONFIG_DIR naming a folder the glob also finds pins, and a folder only it names is linked.
export CLAUDE_CONFIG_DIR="$HOME/.claude-work//"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR a ~/.claude-* folder failed: $out $err"
export CLAUDE_CONFIG_DIR="$HOME/config"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR set failed: $out $err"
[ "$(readlink "$HOME/config/skills/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "the CLAUDE_CONFIG_DIR folder was not linked"
rm "$HOME/config/skills/beta"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a missing link in the CLAUDE_CONFIG_DIR folder"
expect_in "$err" "pin: $HOME/config/skills/beta does not link to $ORDO_STABLE/skills/beta" \
    "check mode did not name the missing link in the CLAUDE_CONFIG_DIR folder"
rm -rf "$HOME/config"
unset CLAUDE_CONFIG_DIR

# ORDO_SKILL_DIRS replaces the list, split on spaces and on tabs, and leaves the default folders and ~/.agents/skills alone.
tab=$(printf '\t')
ln -s "$ORDO_STABLE/skills/gamma" "$d3/pinned"
export ORDO_SKILL_DIRS="$plain_root/a  $plain_root/b$tab$plain_root/c"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with ORDO_SKILL_DIRS set failed: $out $err"
for dir in "$plain_root/a" "$plain_root/b" "$plain_root/c"; do
    [ "$(readlink "$dir/beta")" = "$ORDO_STABLE/skills/beta" ] ||
        fail "$dir/beta not linked from ORDO_SKILL_DIRS"
done
[ "$(readlink "$d3/pinned")" = "$ORDO_STABLE/skills/gamma" ] ||
    fail "the link in $d3 was removed with ORDO_SKILL_DIRS set"

# A skill folder that is not an absolute path is refused before anything changes.
export ORDO_SKILL_DIRS="$plain_root/a rel/skills"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v1
expect_refused v2 "a pin with a relative skill folder"
expect_in "$err" "pin: 'rel/skills' is not an absolute path" \
    "the relative skill folder was not refused with its message"
[ -z "$(ls -A "$work")" ] || fail "a pin refused for a relative folder wrote into $work"
unset ORDO_SKILL_DIRS
rm -rf "$d3" "$test_root/foreign"

# The agents: v3 holds agents/ordo-a.md and agents/ordo-b.md beside a file that is not .md, a file in a subfolder and a hidden file; v4 drops ordo-b.md. The agent folders are the agents folders beside the skill folders.
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

# A first pin of v3 links both agents in the agents folder beside each skill folder and prints the agents line after the skills line.
run_pin v3
[ "$status" -eq 0 ] || fail "the first pin of a tag with agents failed: $out $err"
for dir in "$a1" "$a2"; do
    for agent in ordo-a ordo-b; do
        [ "$(readlink "$dir/$agent.md")" = "$ORDO_STABLE/agents/$agent.md" ] ||
            fail "$dir/$agent.md does not link into the pin"
    done
done
expect_line "$out" "pinned: 2 agents linked in: $a1, $a2" "the first agent pin printed no agents line"
[ ! -e "$HOME/.claude-science/agents" ] || fail "pin.sh created an agents folder beside no skills folder"

# A file not ending .md, a file in a subfolder of agents/ and a hidden file are not agents: neither linked nor counted.
for entry in notes.txt x.md sub .hidden.md; do
    [ -e "$a1/$entry" ] || [ -L "$a1/$entry" ] && fail "$a1/$entry was linked, and it is not an agent"
done

# Check mode passes on a fresh pin, and fails naming an agent whose link is missing.
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a fresh agent pin: $err"
rm "$a1/ordo-a.md"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with an agent link missing"
expect_in "$err" "pin: $a1/ordo-a.md does not link to $ORDO_STABLE/agents/ordo-a.md" \
    "check mode did not name the missing agent link"

# Check mode fails naming an agent link into the live clone; pin mode replaces it, since the tag holds the agent.
ln -s "$repo/agents/ordo-a.md" "$a1/ordo-a.md"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with an agent link into the live clone"
expect_in "$err" "pin: $a1/ordo-a.md links to $repo/agents/ordo-a.md, in the live clone $repo" \
    "check mode did not name the agent link into the live clone"
run_pin v3
[ "$status" -eq 0 ] || fail "re-pinning over an agent link into the live clone failed: $out $err"
[ "$(readlink "$a1/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
    fail "the agent link into the live clone was not replaced"

# An agent link into the live clone for an agent the tag lacks is refused before anything changes.
ln -s "$repo/agents/ordo-z.md" "$a1/ordo-z.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin over an agent link into the live clone for an agent the tag lacks"
expect_in "$err" \
    "pin: $a1/ordo-z.md links into the live clone $repo; move it away or pin a tag that holds it" \
    "the agent link into the live clone was not refused with its message"
rm "$a1/ordo-z.md"

# A user's own agent file under a name the tag does not hold is left as it is. The same name as an agent the tag holds, as a real file or as a link outside Ordo, is refused with nothing changed.
printf 'mine\n' >"$a1/mine.md"
printf 'other\n' >"$test_root/foreign-agent.md"
rm "$a1/ordo-a.md"
printf 'my own ordo-a\n' >"$a1/ordo-a.md"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin over a real file ordo-a.md"
expect_in "$err" "pin: $a1/ordo-a.md " "the real agent file was not refused with its path"
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

# An agent folder path that is a file, and an agent folder that is also a skill folder of the run, are refused before the worktree or a link changes.
mv "$a2" "$a2.moved"
printf 'not a folder\n' >"$a2"
skill_links_before=$(links_state)
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin with an agent folder path that is a file"
expect_in "$err" "pin: $a2 is not a folder; move it away and run again" \
    "the agent folder that is a file was not refused with its message"
rm "$a2"
mv "$a2.moved" "$a2"
export ORDO_SKILL_DIRS="$plain_root/p/skills $plain_root/p/agents"
agent_links_before=$(agent_links_state)
run_pin v4
expect_refused v3 "a pin with an agent folder that is also a skill folder"
expect_in "$err" "pin: $plain_root/p/agents is both a skill folder and an agent folder" \
    "the agent folder that is also a skill folder was not refused with its message"
[ ! -e "$plain_root/p" ] || fail "a refused pin created $plain_root/p"
unset ORDO_SKILL_DIRS

# A later tag without ordo-b.md removes its links and keeps ordo-a.md's and the user's own file.
run_pin v4
[ "$status" -eq 0 ] || fail "pinning a tag that drops an agent failed: $out $err"
for dir in "$a1" "$a2"; do
    [ -L "$dir/ordo-b.md" ] && fail "$dir/ordo-b.md still linked after the tag dropped it"
    [ "$(readlink "$dir/ordo-a.md")" = "$ORDO_STABLE/agents/ordo-a.md" ] ||
        fail "$dir/ordo-a.md lost its link when the tag dropped ordo-b.md"
done
[ "$(cat "$a1/mine.md")" = "mine" ] && [ ! -L "$a1/mine.md" ] || fail "pin mode changed the user's own agent file"
expect_line "$out" "pinned: 1 agents linked in: $a1, $a2" "the agents line does not count 1 agent"

printf 'PASS: pin.sh scratch tests\n'

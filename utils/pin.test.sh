#!/bin/sh
# Exercise pin.sh on a scratch repository and scratch skill folders, under a HOME whose path holds a space, checking the links it leaves, the pinned worktree, and its exit status; a run whose summary line names a folder outside the test's two scratch roots fails the test.
# Pin mode links every skill of the tag in every skill folder into the pinned worktree, leaves the pinned worktree where it is when the live clone moves on, removes the link of a skill the tag drops, and replaces a link into the live clone for a skill the tag holds.
# Pin mode refuses, before the worktree or a link changes, a link into the live clone for a skill the tag lacks, a pinned worktree with local changes, a link to a folder outside Ordo, a pinned worktree path that is not a git worktree (a folder inside the live clone, which stays on its branch), and a skill folder that is not an absolute path or ends in whitespace.
# Pin mode fails when the check after linking finds a link it could not make, and creates again a pinned worktree deleted by hand while another missing worktree keeps its registration.
# Check mode fails with no pinned worktree, and fails naming a link to a skill the tag lacks, a link into the live clone, a link left in ~/.agents/skills, and a missing link in the $CLAUDE_CONFIG_DIR folder; it passes on a fresh pin.
# The default folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills, not ~/.agents/skills, and ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs.
# In ~/.agents/skills, pin mode removes each link to the pinned worktree or the live clone or inside either, and keeps a real folder and a link to anywhere else; it leaves the folder alone when ORDO_SKILL_DIRS is set, and when the folder resolves to a folder of the list.
# A tag whose skills are top-level folders pins, and so does the move back to a skills/ tag.

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

# Runs pin.sh with the given arguments and sets out, err and status from the run. A summary line must name only folders under the scratch roots.
run_pin() {
    sh "$pin" "$@" >"$test_root/out" 2>"$test_root/err"
    status=$?
    out=$(cat "$test_root/out")
    err=$(cat "$test_root/err")
    case "$out" in
        *"skills linked in: "*) ;;
        *) return 0 ;;
    esac
    printf '%s\n' "${out##*skills linked in: }" |
    awk -F ', ' '{ for (i = 1; i <= NF; i++) print $i }' |
    while IFS= read -r dir; do
        case "$dir" in
            "$test_root"/*|"$plain_root"/*) ;;
            *) fail "pin.sh linked into $dir, outside the scratch roots" ;;
        esac
    done || exit 1
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
rm -rf "$d1" "$d2"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with the default folders failed: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "$d1/beta not linked with the default folders"
# The default folders are Claude Code's only, so $d2 stays absent. Red when the defaults hold $d2.
[ ! -e "$d2" ] || fail "pin.sh wrote into $d2 with the default folders"

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

printf 'PASS: pin.sh scratch tests\n'

#!/bin/sh
# Exercise pin.sh on a scratch repository and scratch skill folders: a first pin, a move to a tag that
# adds one skill and drops another, the check mode on good and broken links, and the refusals.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/pin-test.XXXXXX") || fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)

repo=$test_root/ordo
mkdir -p "$repo/utils" "$repo/skills/alpha" "$repo/skills/beta"
cp "$script_dir/pin.sh" "$repo/utils/pin.sh"
printf -- '---\nname: alpha\n---\n' >"$repo/skills/alpha/SKILL.md"
printf -- '---\nname: beta\n---\n' >"$repo/skills/beta/SKILL.md"
git -C "$repo" init -q
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m one
git -C "$repo" tag v1

export HOME=$test_root/home
export ORDO_STABLE=$test_root/home/.local/share/ordo-stable
export ORDO_SKILL_DIRS="$test_root/home/.claude/skills $test_root/home/.agents/skills"
unset CLAUDE_CONFIG_DIR
pin=$repo/utils/pin.sh

sh "$pin" 2>/dev/null && fail "check mode passed with no pinned worktree"

out=$(sh "$pin" v1) || fail "first pin failed: $out"
for dir in $ORDO_SKILL_DIRS; do
    for skill in alpha beta; do
        [ "$(readlink "$dir/$skill")" = "$ORDO_STABLE/skills/$skill" ] || fail "$dir/$skill does not link into the pin"
    done
done
sh "$pin" >/dev/null || fail "check mode failed on a fresh pin"

# The live clone moves on; the pin does not until asked.
git -C "$repo" rm -q -r skills/alpha
mkdir -p "$repo/skills/gamma"
printf -- '---\nname: gamma\n---\n' >"$repo/skills/gamma/SKILL.md"
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m two
git -C "$repo" tag v2
[ -f "$ORDO_STABLE/skills/alpha/SKILL.md" ] || fail "the pinned worktree changed with the live clone"

out=$(sh "$pin" v2) || fail "second pin failed: $out"
for dir in $ORDO_SKILL_DIRS; do
    [ -L "$dir/alpha" ] && fail "$dir/alpha still linked after the tag dropped it"
    [ "$(readlink "$dir/gamma")" = "$ORDO_STABLE/skills/gamma" ] || fail "$dir/gamma not linked"
done
case "$out" in
    *"pinned: v2"*) ;;
    *) fail "the pin does not name v2: $out" ;;
esac

set -- $ORDO_SKILL_DIRS
ln -sfn "$repo/skills/beta" "$1/beta"
sh "$pin" 2>/dev/null && fail "check mode passed with a link into the live clone"
sh "$pin" v2 >/dev/null || fail "re-pinning did not repair the link"
sh "$pin" >/dev/null || fail "check mode failed after the repair"

printf 'edit\n' >>"$ORDO_STABLE/skills/beta/SKILL.md"
sh "$pin" v1 2>/dev/null && fail "pinned over a worktree with local changes"
git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md

# A refusal changes nothing: the pin stays at v2 and the other folder's links stay as they were.
rm "$1/beta"
mkdir "$1/beta"
sh "$pin" v1 2>/dev/null && fail "replaced a real directory in a skill folder"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] || fail "a refused pin moved the worktree"
[ -L "$2/alpha" ] && fail "a refused pin relinked another folder"
rmdir "$1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$1/beta"

rm "$1/beta"
ln -s /elsewhere/beta "$1/beta"
sh "$pin" v2 2>/dev/null && fail "replaced a link to a folder outside Ordo"
[ -z "$(git -C "$ORDO_STABLE" status --porcelain)" ] || fail "the test left files in the pinned worktree"
rm "$1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$1/beta"

sh "$pin" v9 2>/dev/null && fail "pinned a tag that does not exist"

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
out=$(sh "$pin" v0) || fail "a top-level tag did not pin: $out"
set -- $ORDO_SKILL_DIRS
[ "$(readlink "$1/delta")" = "$ORDO_STABLE/delta" ] || fail "the top-level skill is not linked from the worktree's top level"
[ -L "$1/beta" ] && fail "a skill the top-level tag lacks is still linked"
sh "$pin" >/dev/null || fail "check mode failed on a top-level pin"
sh "$pin" v2 >/dev/null || fail "moving back to a skills/ tag failed"
[ "$(readlink "$1/beta")" = "$ORDO_STABLE/skills/beta" ] || fail "beta not linked from skills/ after moving back"
[ -L "$1/delta" ] && fail "the top-level skill is still linked after moving back"

printf 'PASS: pin.sh scratch tests\n'

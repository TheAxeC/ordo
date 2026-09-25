#!/bin/sh
# Exercise pin.sh on a scratch repository and scratch skill folders, under a HOME whose path holds a
# space: a first pin, a move to a tag that adds one skill and drops another, the check mode on good
# and broken links, links into the live clone, the refusals with their messages, the check after
# linking, a pinned worktree deleted by hand, the default folder list, both forms of
# ORDO_SKILL_DIRS, folders that are not absolute paths, and a top-level tag. The test writes only
# under its two scratch roots, and checks that no path a split on a space could name appeared.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/pin-test.XXXXXX") ||
    fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root" ${plain_root:+"$plain_root"}' 0 1 2 3 15
# The folders for the space-separated form, under a root whose path holds no space whatever
# TMPDIR is.
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

# Prints each path that ends just before a space of $1: what a split on that space would name.
split_prefixes() {
    rest=$1
    prefix=""
    while :; do
        case "$rest" in
            *" "*) ;;
            *) break ;;
        esac
        prefix="$prefix${rest%% *}"
        printf '%s\n' "$prefix"
        prefix="$prefix "
        rest=${rest#* }
    done
}
# The split paths that do not exist before any run; each must still not exist at the end.
absent=$(split_prefixes "$d1/x" | while IFS= read -r path; do
    [ -e "$path" ] || [ -L "$path" ] || printf '%s\n' "$path"
done)
[ -n "$absent" ] || fail "no split path of the HOME holding a space to watch"

# Runs pin.sh with the given arguments and sets out, err and status from the run. A summary line
# must name only folders under the scratch roots.
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
expect_in "$out" "pinned: v1 " "the pin does not name v1"
expect_in "$out" ", 2 skills linked in: $d1, $d2" \
    "the summary line does not join the folders with a comma"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a fresh pin: $err"
expect_in "$out" "pinned: v1, 2 skills linked in: $d1, $d2" \
    "the check-mode summary line does not join the folders with a comma"

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
    expect_in "$out" \
        "pin: removed $dir/alpha, which the tag v2 does not hold" \
        "the removal is not reported"
done
expect_in "$out" "pinned: v2" "the pin does not name v2"

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
expect_in "$out" \
    "pin: removed $d1/alpha, which the tag v2 does not hold" \
    "the removal is not reported"

# A link into the live clone for a skill the tag holds: check mode names it once, pin mode
# replaces it and says so.
ln -sfn "$repo/skills/beta" "$d1/beta"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a link into the live clone"
expect_in "$err" "pin: $d1/beta links to $repo/skills/beta, in the live clone $repo" \
    "check mode did not name the link into the live clone"
count=$(printf '%s\n' "$err" | grep -c -F "$d1/beta")
[ "$count" -eq 1 ] || fail "check mode reported the link into the live clone $count times: $err"
run_pin v2
[ "$status" -eq 0 ] || fail "re-pinning did not repair the link: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "the link into the live clone was not replaced"
expect_in "$out" "pin: replaced $d1/beta, which linked into the live clone $repo" \
    "the replacement of a link into the live clone is not reported"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed after the repair: $err"

# A link into the live clone for a skill the tag lacks: check mode names it; pin mode refuses it
# before anything changes, so the worktree, the stale link and the other links stay as they are.
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
[ -z "$out" ] || fail "a pin refused for a link into the live clone printed: $out"
rm "$d1/dev"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning failed once the live-clone link was moved away: $out $err"
[ -L "$d2/alpha" ] && fail "pin mode left a link into the pinned worktree for a skill the tag lacks"
expect_in "$out" \
    "pin: removed $d2/alpha, which the tag v2 does not hold" \
    "the removal is not reported"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed once the live-clone link was moved away: $err"

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

# A link that could not be removed is not reported as removed. Red when the report is printed
# whether rm succeeded or not.
ln -s "$ORDO_STABLE/skills/old" "$d2/old"
chmod a-w "$d2"
run_pin v2
chmod u+w "$d2"
[ "$status" -ne 0 ] || fail "pin mode passed with a stale link it could not remove"
[ -L "$d2/old" ] || fail "the stale link was removed from a folder that is not writable"
case "$out" in
    *"pin: removed $d2/old"*) fail "a link that could not be removed was reported as removed" ;;
esac
rm "$d2/old"

# A link that could not be replaced is not reported as replaced. Red when the report is printed
# whether ln succeeded or not.
ln -s "$repo/skills/beta" "$d2/beta"
chmod a-w "$d2"
run_pin v2
chmod u+w "$d2"
[ "$status" -ne 0 ] || fail "pin mode passed with a live-clone link it could not replace"
[ "$(readlink "$d2/beta")" = "$repo/skills/beta" ] ||
    fail "a link was replaced in a folder that is not writable"
case "$out" in
    *"pin: replaced $d2/beta"*) fail "a link that could not be replaced was reported as replaced" ;;
esac
rm "$d2/beta"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning failed once the folder was writable again: $out $err"

printf 'edit\n' >>"$ORDO_STABLE/skills/beta/SKILL.md"
run_pin v1
[ "$status" -ne 0 ] || fail "pinned over a worktree with local changes"
expect_in "$err" \
    "has local changes; the pinned worktree is never edited" \
    "the local-changes refusal has no message"
git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md

# A refusal changes nothing: the pin stays at v2 and the other folder's links stay as they were.
rm "$d1/beta"
mkdir "$d1/beta"
run_pin v1
[ "$status" -ne 0 ] || fail "replaced a real directory in a skill folder"
expect_in "$err" "pin: $d1/beta is a real directory; move it away and run again" \
    "the real-directory refusal has no message"
[ "$(git -C "$ORDO_STABLE" describe --tags --exact-match)" = "v2" ] ||
    fail "a refused pin moved the worktree"
[ -L "$d2/alpha" ] && fail "a refused pin relinked another folder"
rmdir "$d1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$d1/beta"

rm "$d1/beta"
ln -s /elsewhere/beta "$d1/beta"
run_pin v2
[ "$status" -ne 0 ] || fail "replaced a link to a folder outside Ordo"
expect_in "$err" \
    "pin: $d1/beta links to /elsewhere/beta, outside Ordo; move it away and run again" \
    "the foreign-link refusal has no message"
[ -z "$(git -C "$ORDO_STABLE" status --porcelain)" ] ||
    fail "the test left files in the pinned worktree"
rm "$d1/beta"
ln -s "$ORDO_STABLE/skills/beta" "$d1/beta"

# A pinned worktree path that exists and is not a git worktree is refused before anything changes.
saved_stable=$ORDO_STABLE
ORDO_STABLE=$HOME/plain
mkdir "$ORDO_STABLE"
run_pin v2
[ "$status" -ne 0 ] || fail "pinned into a folder that is not a git worktree"
expect_in "$err" \
    "pin: $ORDO_STABLE exists and is not a git worktree" \
    "the not-a-worktree refusal has no message"
[ -z "$(ls -A "$ORDO_STABLE")" ] ||
    fail "a refused pin wrote into the folder that is not a worktree"
rmdir "$ORDO_STABLE"
ORDO_STABLE=$saved_stable
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] || fail "a refused pin changed a link"

run_pin v9
[ "$status" -ne 0 ] || fail "pinned a tag that does not exist"
expect_in "$err" "pin: no tag v9 in $repo" "the unknown-tag refusal has no message"

# A pinned worktree deleted by hand is still registered with git; pinning creates it again, and
# another worktree of the clone deleted by hand keeps its registration.
other=$test_root/other
git -C "$repo" worktree add -q --detach "$other" v1
rm -rf "$other" "$ORDO_STABLE"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning after the worktree was deleted by hand failed: $out $err"
[ -f "$ORDO_STABLE/skills/beta/SKILL.md" ] || fail "the deleted worktree was not created again"
git -C "$repo" worktree list --porcelain | grep -q -x -F "worktree $other" ||
    fail "pinning dropped the registration of another missing worktree"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on the re-created worktree: $err"

# The default folder list, under the HOME that holds a space, with and without CLAUDE_CONFIG_DIR.
unset ORDO_SKILL_DIRS
rm -rf "$d1" "$d2"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with the default folders failed: $out $err"
for dir in "$d1" "$d2"; do
    [ "$(readlink "$dir/beta")" = "$ORDO_STABLE/skills/beta" ] ||
        fail "$dir/beta not linked with the default folders"
done
[ -z "$(ls -A "$work")" ] || fail "pin.sh wrote into the folder it ran from: $(ls -A "$work")"
[ -e "$test_root/my" ] && fail "pin.sh split the HOME path on its space"
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
run_pin
[ "$status" -eq 0 ] || fail "check mode failed with the default folders: $err"

# ORDO_SKILL_DIRS in its space-separated form, split on spaces and on tabs.
export ORDO_SKILL_DIRS="$plain_root/a  $plain_root/b$tab$plain_root/c"
run_pin v2
[ "$status" -eq 0 ] || fail "pinning with a space-separated ORDO_SKILL_DIRS failed: $out $err"
for dir in "$plain_root/a" "$plain_root/b" "$plain_root/c"; do
    [ "$(readlink "$dir/beta")" = "$ORDO_STABLE/skills/beta" ] ||
        fail "$dir/beta not linked from the space-separated list"
done
expect_in "$out" "skills linked in: $plain_root/a, $plain_root/b, $plain_root/c" \
    "the space-separated list was not read as three folders"
run_pin
[ "$status" -eq 0 ] || fail "check mode failed with a space-separated ORDO_SKILL_DIRS: $err"

# An ORDO_SKILL_DIRS that names no folder is refused.
for empty in " " "$nl" "$tab"; do
    ORDO_SKILL_DIRS=$empty
    run_pin v2
    [ "$status" -ne 0 ] || fail "pinned with an ORDO_SKILL_DIRS that names no folder"
    expect_in "$err" \
        "pin: ORDO_SKILL_DIRS names no folder" \
        "the empty ORDO_SKILL_DIRS has no message"
done

# A folder that is not an absolute path, or that has leading or trailing whitespace, is refused
# before anything changes, in either form.
for bad in "rel/skills" "  $d1" "$d1 " "$tab$d1"; do
    for form in newline space; do
        if [ "$form" = newline ]; then
            ORDO_SKILL_DIRS="$bad$nl$d2"
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
        [ "$(readlink "$d2/gamma")" = "$ORDO_STABLE/skills/gamma" ] ||
            fail "a pin refused for the folder \"$bad\" changed a link"
        [ -z "$(ls -A "$work")" ] ||
            fail "a pin refused for \"$bad\" wrote into $work: $(ls -A "$work")"
    done
done
ORDO_SKILL_DIRS=" $d1$nl$d2"
run_pin
[ "$status" -ne 0 ] || fail "check mode passed with a folder holding a leading space"
expect_in "$err" "pin: ' $d1' has leading or trailing whitespace" \
    "check mode did not refuse the padded folder"
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
run_pin
[ "$status" -eq 0 ] || fail "check mode failed on a top-level pin: $err"
run_pin v2
[ "$status" -eq 0 ] || fail "moving back to a skills/ tag failed: $out $err"
[ "$(readlink "$d1/beta")" = "$ORDO_STABLE/skills/beta" ] ||
    fail "beta not linked from skills/ after moving back"
[ -L "$d1/delta" ] && fail "the top-level skill is still linked after moving back"

# Nothing appeared outside the scratch roots: not in the folder the runs started from, and not at
# a path a split of a skill folder on a space would name.
[ -z "$(ls -A "$work")" ] || fail "pin.sh wrote into the folder it ran from: $(ls -A "$work")"
printf '%s\n' "$absent" | while IFS= read -r path; do
    if [ -e "$path" ] || [ -L "$path" ]; then
        fail "pin.sh created $path, which a split of a skill folder on a space names"
    fi
done || exit 1
printf 'PASS: pin.sh scratch tests\n'

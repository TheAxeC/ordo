#!/bin/sh
# Pin the installed Ordo skills to a tag of this repository, or check the pin.
#
# Usage: utils/pin.sh <tag>    check the pinned worktree out at <tag> and link every skill from it
#        utils/pin.sh          check that every link points into the pinned worktree; change nothing
#
# The pinned worktree is $ORDO_STABLE (default ~/.local/share/ordo-stable), a detached git worktree of
# this repository. The skill folders are $ORDO_SKILL_DIRS when set (space-separated), otherwise
# ~/.claude/skills, ~/.agents/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set.
# A skill is a folder under skills/ in the tag that holds SKILL.md, or a top-level folder that holds one in a
# tag from before the skills moved under skills/. A link into the pinned worktree whose
# skill the tag no longer has is removed. A skill folder entry that is a real directory, or a link to
# anywhere else, is refused and left as it is.

set -u

fail() {
    printf 'pin: %s\n' "$1" >&2
    exit 1
}

repo=$(CDPATH= cd "$(dirname "$0")/.." && pwd -P)
stable=${ORDO_STABLE:-$HOME/.local/share/ordo-stable}
if [ -n "${ORDO_SKILL_DIRS:-}" ]; then
    skill_dirs=$ORDO_SKILL_DIRS
else
    skill_dirs="$HOME/.claude/skills $HOME/.agents/skills"
    if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "${CLAUDE_CONFIG_DIR%/}" != "$HOME/.claude" ]; then
        skill_dirs="$skill_dirs ${CLAUDE_CONFIG_DIR%/}/skills"
    fi
fi

# The folder that holds the skills in a checkout: skills/ when it exists, the top level otherwise.
skill_root() {
    if [ -d "$1/skills" ]; then printf '%s/skills' "$1"; else printf '%s' "$1"; fi
}

skills_of() {
    for entry in "$(skill_root "$1")"/*/SKILL.md; do
        [ -f "$entry" ] || continue
        basename "$(dirname "$entry")"
    done
}

# Prints one line per problem and returns the count through the exit status (capped at 1).
check_links() {
    problems=0
    for skill in $(skills_of "$stable"); do
        for dir in $skill_dirs; do
            target=$(readlink "$dir/$skill" 2>/dev/null) || target=""
            if [ "$target" != "$(skill_root "$stable")/$skill" ]; then
                printf 'pin: %s/%s does not link to %s/%s\n' "$dir" "$skill" "$(skill_root "$stable")" "$skill" >&2
                problems=$((problems + 1))
            fi
        done
    done
    for dir in $skill_dirs; do
        for link in "$dir"/*; do
            [ -L "$link" ] || continue
            target=$(readlink "$link")
            case "$target" in
                "$stable"/*)
                    [ -f "$target/SKILL.md" ] || {
                        printf 'pin: %s links to %s, which the pinned tag does not have\n' "$link" "$target" >&2
                        problems=$((problems + 1))
                    }
                    ;;
            esac
        done
    done
    [ "$problems" -eq 0 ]
}

if [ $# -eq 0 ]; then
    [ -d "$stable" ] || fail "no pinned worktree at $stable; run utils/pin.sh <tag>"
    stable=$(CDPATH= cd "$stable" && pwd -P)
    pinned=$(git -C "$stable" describe --tags --exact-match 2>/dev/null) || pinned=$(git -C "$stable" rev-parse --short HEAD)
    check_links || fail "the links do not match the pin at $pinned"
    printf 'pinned: %s, %s skills linked in: %s\n' "$pinned" "$(skills_of "$stable" | wc -l | tr -d ' ')" "$skill_dirs"
    exit 0
fi

tag=$1
git -C "$repo" rev-parse -q --verify "refs/tags/$tag^{commit}" >/dev/null || fail "no tag $tag in $repo"
tag_files=$(git -C "$repo" ls-tree -r --name-only "$tag")
tag_skills=$(printf '%s\n' "$tag_files" | sed -n 's#^skills/\([^/]*\)/SKILL\.md$#\1#p')
[ -n "$tag_skills" ] || tag_skills=$(printf '%s\n' "$tag_files" | sed -n 's#^\([^/]*\)/SKILL\.md$#\1#p')
[ -n "$tag_skills" ] || fail "tag $tag holds no skill"

# Every refusal happens here, before the worktree or a link changes.
if [ -e "$stable" ]; then
    [ "$(git -C "$stable" rev-parse --show-toplevel 2>/dev/null)" = "$(CDPATH= cd "$stable" && pwd -P)" ] || fail "$stable exists and is not a git worktree"
    [ -z "$(git -C "$stable" status --porcelain)" ] || fail "$stable has local changes; the pinned worktree is never edited"
    stable=$(CDPATH= cd "$stable" && pwd -P)
fi
for dir in $skill_dirs; do
    for skill in $tag_skills; do
        [ -e "$dir/$skill" ] || [ -L "$dir/$skill" ] || continue
        [ -L "$dir/$skill" ] || fail "$dir/$skill is a real directory; move it away and run again"
        case "$(readlink "$dir/$skill")" in
            "$stable"/*|"$repo"/*) ;;
            *) fail "$dir/$skill links to $(readlink "$dir/$skill"), outside Ordo; move it away and run again" ;;
        esac
    done
done

if [ -e "$stable" ]; then
    git -C "$stable" checkout -q --detach "$tag" || fail "could not check $stable out at $tag"
else
    mkdir -p "$(dirname "$stable")"
    git -C "$repo" worktree add -q --detach "$stable" "$tag" || fail "could not create the worktree $stable at $tag"
    stable=$(CDPATH= cd "$stable" && pwd -P)
fi

for dir in $skill_dirs; do
    mkdir -p "$dir"
    for skill in $tag_skills; do
        ln -sfn "$(skill_root "$stable")/$skill" "$dir/$skill"
    done
    for link in "$dir"/*; do
        [ -L "$link" ] || continue
        case "$(readlink "$link")" in
            "$stable"/*|"$repo"/*)
                [ -f "$(skill_root "$stable")/$(basename "$link")/SKILL.md" ] || rm "$link"
                ;;
        esac
    done
done

check_links || fail "the links do not match the pin after linking"
printf 'pinned: %s (%s), %s skills linked in: %s\n' "$tag" "$(git -C "$stable" rev-parse --short HEAD)" "$(skills_of "$stable" | wc -l | tr -d ' ')" "$skill_dirs"

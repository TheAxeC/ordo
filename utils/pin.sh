#!/bin/sh
# Pin the installed Ordo skills to a tag of this repository, or check the pin.
#
# Usage: utils/pin.sh <tag>    check the pinned worktree out at <tag> and link every skill from it
#        utils/pin.sh          check that every link points into the pinned worktree; change nothing
#
# The pinned worktree is $ORDO_STABLE (default ~/.local/share/ordo-stable), a detached git
# worktree of this repository. A pinned worktree deleted by hand is created again with git
# worktree add --force: git replaces its stale record and leaves every other worktree's record as
# it is; a locked record is still refused.
# The skill folders are ~/.claude/skills, ~/.agents/skills and $CLAUDE_CONFIG_DIR/skills when that
# variable is set, or $ORDO_SKILL_DIRS when set. $ORDO_SKILL_DIRS is split on spaces and tabs, or
# read one folder per line when it holds a newline (the form for a folder whose path holds a
# space); empty lines are skipped, and a value that names no folder is refused. The default
# folders are read one per line, so a home folder holding a space needs nothing. Every skill folder
# (from ORDO_SKILL_DIRS, the defaults or $CLAUDE_CONFIG_DIR/skills) must be an absolute path with
# no leading or trailing whitespace, or the run is refused before anything changes. The summary
# line names the folders joined by ", ".
# A skill is a folder under skills/ in the tag that holds SKILL.md, or a top-level folder that
# holds one in a tag from before the skills moved under skills/.
# Check mode reports every link into the live clone, once each, and every link into the pinned
# worktree whose skill the tag lacks. Pin mode refuses, before anything changes, a link into the
# live clone for a skill the tag lacks, a skill folder entry that is a real directory, and a link
# to anywhere outside Ordo; each is left as it is. It replaces a link into the live clone for a
# skill the tag holds and prints a line for each, and removes a link into the pinned worktree
# whose skill the tag lacks and prints a line for each.

set -u

fail() {
    printf 'pin: %s\n' "$1" >&2
    exit 1
}

repo=$(CDPATH= cd "$(dirname "$0")/.." && pwd -P)
stable=${ORDO_STABLE:-$HOME/.local/share/ordo-stable}
nl='
'
# The skill folders, one per line.
if [ -n "${ORDO_SKILL_DIRS:-}" ]; then
    case "$ORDO_SKILL_DIRS" in
        *"$nl"*) skill_dirs=$ORDO_SKILL_DIRS ;;
        *) skill_dirs=$(printf '%s\n' "$ORDO_SKILL_DIRS" | tr ' \t' '\n\n') ;;
    esac
    skill_dirs=$(printf '%s\n' "$skill_dirs" | sed '/^$/d')
    [ -n "$skill_dirs" ] || fail "ORDO_SKILL_DIRS names no folder"
else
    skill_dirs="$HOME/.claude/skills$nl$HOME/.agents/skills"
    if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "${CLAUDE_CONFIG_DIR%/}" != "$HOME/.claude" ]; then
        skill_dirs="$skill_dirs$nl${CLAUDE_CONFIG_DIR%/}/skills"
    fi
fi
while IFS= read -r dir <&3; do
    case "$dir" in
        [[:space:]]* | *[[:space:]]) fail "'$dir' has leading or trailing whitespace" ;;
        /*) ;;
        *) fail "'$dir' is not an absolute path" ;;
    esac
done 3<<EOF
$skill_dirs
EOF
# The folders as the summary line names them.
shown_dirs=$(printf '%s\n' "$skill_dirs" | awk 'NR > 1 { printf ", " } { printf "%s", $0 }')

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
# The folder loops read $skill_dirs one line at a time on descriptor 3, so no path is split.
check_links() {
    problems=0
    for skill in $(skills_of "$stable"); do
        while IFS= read -r dir <&3; do
            target=$(readlink "$dir/$skill" 2>/dev/null) || target=""
            [ "$target" = "$(skill_root "$stable")/$skill" ] && continue
            # A link into the live clone is reported by the loop below.
            case "$target" in
                "$stable"/*) ;;
                "$repo"/*) continue ;;
            esac
            printf 'pin: %s/%s does not link to %s/%s\n' \
                "$dir" "$skill" "$(skill_root "$stable")" "$skill" >&2
            problems=$((problems + 1))
        done 3<<EOF
$skill_dirs
EOF
    done
    while IFS= read -r dir <&3; do
        for link in "$dir"/*; do
            [ -L "$link" ] || continue
            target=$(readlink "$link")
            case "$target" in
                "$stable"/*)
                    [ -f "$target/SKILL.md" ] || {
                        printf 'pin: %s links to %s, which the pinned tag does not have\n' \
                            "$link" "$target" >&2
                        problems=$((problems + 1))
                    }
                    ;;
                "$repo"/*)
                    printf 'pin: %s links to %s, in the live clone %s\n' \
                        "$link" "$target" "$repo" >&2
                    problems=$((problems + 1))
                    ;;
            esac
        done
    done 3<<EOF
$skill_dirs
EOF
    [ "$problems" -eq 0 ]
}

if [ $# -eq 0 ]; then
    [ -d "$stable" ] || fail "no pinned worktree at $stable; run utils/pin.sh <tag>"
    stable=$(CDPATH= cd "$stable" && pwd -P)
    pinned=$(git -C "$stable" describe --tags --exact-match 2>/dev/null) ||
        pinned=$(git -C "$stable" rev-parse --short HEAD)
    check_links || fail "the links do not match the pin at $pinned"
    printf 'pinned: %s, %s skills linked in: %s\n' \
        "$pinned" "$(skills_of "$stable" | wc -l | tr -d ' ')" "$shown_dirs"
    exit 0
fi

tag=$1
git -C "$repo" rev-parse -q --verify "refs/tags/$tag^{commit}" >/dev/null ||
    fail "no tag $tag in $repo"
tag_files=$(git -C "$repo" ls-tree -r --name-only "$tag")
tag_skills=$(printf '%s\n' "$tag_files" | sed -n 's#^skills/\([^/]*\)/SKILL\.md$#\1#p')
[ -n "$tag_skills" ] ||
    tag_skills=$(printf '%s\n' "$tag_files" | sed -n 's#^\([^/]*\)/SKILL\.md$#\1#p')
[ -n "$tag_skills" ] || fail "tag $tag holds no skill"

# Succeeds when the tag holds the skill named $1.
tag_holds() {
    case "$nl$tag_skills$nl" in
        *"$nl$1$nl"*) return 0 ;;
    esac
    return 1
}

# Every refusal happens here, before the worktree or a link changes.
if [ -e "$stable" ]; then
    toplevel=$(git -C "$stable" rev-parse --show-toplevel 2>/dev/null) || toplevel=""
    [ "$toplevel" = "$(CDPATH= cd "$stable" && pwd -P)" ] ||
        fail "$stable exists and is not a git worktree"
    [ -z "$(git -C "$stable" status --porcelain)" ] ||
        fail "$stable has local changes; the pinned worktree is never edited"
    stable=$(CDPATH= cd "$stable" && pwd -P)
fi
while IFS= read -r dir <&3; do
    for skill in $tag_skills; do
        [ -e "$dir/$skill" ] || [ -L "$dir/$skill" ] || continue
        [ -L "$dir/$skill" ] || fail "$dir/$skill is a real directory; move it away and run again"
        target=$(readlink "$dir/$skill")
        case "$target" in
            "$stable"/*|"$repo"/*) ;;
            *) fail "$dir/$skill links to $target, outside Ordo; move it away and run again" ;;
        esac
    done
    for link in "$dir"/*; do
        [ -L "$link" ] || continue
        case "$(readlink "$link")" in
            "$stable"/*) continue ;;
            "$repo"/*) ;;
            *) continue ;;
        esac
        tag_holds "$(basename "$link")" ||
            fail "$link links into the live clone $repo; move it away or pin a tag that holds it"
    done
done 3<<EOF
$skill_dirs
EOF

if [ -e "$stable" ]; then
    git -C "$stable" checkout -q --detach "$tag" || fail "could not check $stable out at $tag"
else
    mkdir -p "$(dirname "$stable")"
    # A pinned worktree deleted by hand is still registered; --force lets git replace that record.
    git -C "$repo" worktree add -q --force --detach "$stable" "$tag" ||
        fail "could not create the worktree $stable at $tag"
    stable=$(CDPATH= cd "$stable" && pwd -P)
fi

while IFS= read -r dir <&3; do
    mkdir -p "$dir"
    for skill in $tag_skills; do
        old=$(readlink "$dir/$skill" 2>/dev/null) || old=""
        ln -sfn "$(skill_root "$stable")/$skill" "$dir/$skill" || continue
        case "$old" in
            "$stable"/*) ;;
            "$repo"/*)
                printf 'pin: replaced %s, which linked into the live clone %s\n' \
                    "$dir/$skill" "$repo"
                ;;
        esac
    done
    for link in "$dir"/*; do
        [ -L "$link" ] || continue
        [ -f "$(skill_root "$stable")/$(basename "$link")/SKILL.md" ] && continue
        case "$(readlink "$link")" in
            "$stable"/*)
                rm "$link" || continue
                printf 'pin: removed %s, which the tag %s does not hold\n' "$link" "$tag"
                ;;
        esac
    done
done 3<<EOF
$skill_dirs
EOF

check_links || fail "the links do not match the pin after linking"
printf 'pinned: %s (%s), %s skills linked in: %s\n' \
    "$tag" "$(git -C "$stable" rev-parse --short HEAD)" \
    "$(skills_of "$stable" | wc -l | tr -d ' ')" "$shown_dirs"

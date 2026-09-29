#!/bin/sh
# Pin the installed Ordo skills and agents to a tag of this repository, or check the pin.
#
# Usage: utils/pin.sh <tag>    check the pinned worktree out at <tag> and link every skill and every agent from it
#        utils/pin.sh          check that every link points into the pinned worktree; change nothing
#
# The pinned worktree is $ORDO_STABLE (default ~/.local/share/ordo-stable), a detached git
# worktree of this repository. A pinned worktree deleted by hand is created again with git
# worktree add --force: git replaces its stale record and leaves every other worktree's record as
# it is; a locked record is still refused.
# The skill folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set,
# or $ORDO_SKILL_DIRS when set. $ORDO_SKILL_DIRS is split on spaces and tabs, or
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
# ~/.agents/skills is not a default folder, so a link there into Ordo is not one of the pin's
# links. When ORDO_SKILL_DIRS is not set and no folder of the list is ~/.agents/skills (compared by
# resolved path, so a folder of the list matches it once both exist), check mode reports each link there to the
# pinned worktree or the live clone or inside either. The target is read as the link names it and
# with its folder resolved. Pin mode removes each such link after linking and prints a line for
# each. Every other entry of that folder, a real folder or a link to anywhere else, is left as it
# is.
# The agent folders are the agents folder beside each skill folder (the skill folder's parent
# followed by /agents): ~/.claude/agents, $CLAUDE_CONFIG_DIR/agents, or the sibling of each
# folder of $ORDO_SKILL_DIRS. Agent folders with the same path are one folder, linked once and
# named once. Pin mode creates an agent folder that does not exist; check mode does not.
# An agent is a file agents/<name>.md directly in the tag's agents/ folder, named by its file name
# without .md; a file not ending .md, a file whose name starts with a dot and anything in a
# subfolder is not an agent, and a tag with no agents/ folder has no agents. In an agent folder,
# the entry <name>.md is the entry of the agent <name>; an entry not ending .md is no agent's.
# Pin mode refuses, before anything changes, an agent folder that is also a skill folder of the
# run (the same path with every trailing slash stripped or, when both exist, the same physical
# path), an agent folder path that exists and is not a folder, an entry for an agent of the tag that
# is a real file, a directory or a link to anywhere outside Ordo, and a link into the live clone
# for an agent the tag lacks; each is left as it is. It then links <folder>/<name>.md to
# <pinned worktree>/agents/<name>.md for every agent of the tag, replaces a link into the live
# clone and prints a line for each, and removes a link into the pinned worktree whose agent the
# tag lacks and prints a line for each. Every other entry of an agent folder, a user's own file or
# a link to anywhere else, is left as it is.
# Check mode, and the check after linking, report an agent of the pinned worktree not linked from
# an agent folder, every link into the live clone, and every link into the pinned worktree whose
# agent the pinned worktree lacks.
# Each mode prints a second summary line after the skills line: pinned: <m> agents linked in:
# <agent folders>, the folders joined by ", ".
# Every refusal and every failed check prints a line starting "pin: " on stderr and exits 1; a run
# that pins, or a check that passes, exits 0.

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
    skill_dirs="$HOME/.claude/skills"
    if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "${CLAUDE_CONFIG_DIR%/}" != "$HOME/.claude" ]; then
        skill_dirs="$skill_dirs$nl${CLAUDE_CONFIG_DIR%/}/skills"
    fi
fi
# Prints ~/.agents/skills, the folder outside the list whose links into Ordo check mode reports
# and pin mode removes; prints nothing when ORDO_SKILL_DIRS is set, or when the folder is one of
# the list, by their resolved paths, both folders existing. It is run where it is
# used, so a folder the pin creates is compared once it exists.
outside_dir() {
    [ -z "${ORDO_SKILL_DIRS:-}" ] || return 0
    outside="$HOME/.agents/skills"
    outside_real=$(CDPATH= cd "$outside" 2>/dev/null && pwd -P) || outside_real=""
    while IFS= read -r dir <&4; do
        [ -n "$outside_real" ] || continue
        [ "$(CDPATH= cd "$dir" 2>/dev/null && pwd -P)" = "$outside_real" ] && return 0
    done 4<<EOF
$skill_dirs
EOF
    printf '%s' "$outside"
}
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
# The agent folders, one per line: the agents folder beside each skill folder, each path once.
agent_dirs=$(printf '%s\n' "$skill_dirs" |
    awk '{ sub(/\/+$/, ""); sub(/\/[^\/]*$/, ""); dir = $0 "/agents" } !seen[dir]++ { print dir }')
shown_agent_dirs=$(printf '%s\n' "$agent_dirs" | awk 'NR > 1 { printf ", " } { printf "%s", $0 }')

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

# The agents of a checkout, one per line: each file agents/<name>.md, <name> not starting with a dot.
agents_of() {
    for entry in "$1"/agents/*.md; do
        [ -f "$entry" ] || continue
        basename "$entry" .md
    done
}

# Prints the agent an agent folder entry $1 is named for: its file name without .md, or nothing
# when the name does not end in .md after at least one character.
agent_name() {
    agent_base=${1##*/}
    case "$agent_base" in
        ?*.md) printf '%s' "${agent_base%.md}" ;;
    esac
}

# Succeeds when the folders $1 and $2 are one folder: the same path with every trailing slash
# stripped, as the agent folders are built, or, when both exist, the same physical path.
same_folder() {
    same_one=$(printf '%s\n' "$1" | sed 's#//*$##')
    same_two=$(printf '%s\n' "$2" | sed 's#//*$##')
    [ "$same_one" = "$same_two" ] && return 0
    same_one=$(CDPATH= cd -P "$1" 2>/dev/null && pwd -P) || return 1
    same_two=$(CDPATH= cd -P "$2" 2>/dev/null && pwd -P) || return 1
    [ "$same_one" = "$same_two" ]
}

# Succeeds when the list $1, one name per line, holds the name $2; an empty name is in no list.
in_list() {
    [ -n "$2" ] || return 1
    case "$nl$1$nl" in
        *"$nl$2$nl"*) return 0 ;;
    esac
    return 1
}

# Succeeds when the link $1 points at the pinned worktree or the live clone or inside either, as
# its target names it or with the target's folder resolved. A relative target is read from the
# link's folder.
links_into_ordo() {
    ordo_target=$(readlink "$1") || return 1
    case "$ordo_target" in
        /*) ;;
        *) ordo_target=$(dirname "$1")/$ordo_target ;;
    esac
    case "$ordo_target" in
        "$stable" | "$stable"/* | "$repo" | "$repo"/*) return 0 ;;
    esac
    ordo_parent=$(CDPATH= cd "$(dirname "$ordo_target")" 2>/dev/null && pwd -P) || return 1
    case "$ordo_parent/$(basename "$ordo_target")" in
        "$stable" | "$stable"/* | "$repo" | "$repo"/*) return 0 ;;
    esac
    return 1
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
    old_dir=$(outside_dir)
    if [ -n "$old_dir" ]; then
        for link in "$old_dir"/*; do
            [ -L "$link" ] || continue
            links_into_ordo "$link" || continue
            printf 'pin: %s links to %s, in a folder pin.sh no longer links into; %s\n' \
                "$link" "$(readlink "$link")" 'utils/pin.sh <tag> removes it' >&2
            problems=$((problems + 1))
        done
    fi
    # The agents: the folder loops read $agent_dirs on descriptor 3 and the agent list on 4.
    stable_agents=$(agents_of "$stable")
    while IFS= read -r agent <&4; do
        [ -n "$agent" ] || continue
        while IFS= read -r dir <&3; do
            target=$(readlink "$dir/$agent.md" 2>/dev/null) || target=""
            [ "$target" = "$stable/agents/$agent.md" ] && continue
            # A link into the live clone is reported by the loop below.
            case "$target" in
                "$stable"/*) ;;
                "$repo"/*) continue ;;
            esac
            printf 'pin: %s/%s.md does not link to %s/agents/%s.md\n' \
                "$dir" "$agent" "$stable" "$agent" >&2
            problems=$((problems + 1))
        done 3<<EOF
$agent_dirs
EOF
    done 4<<EOF
$stable_agents
EOF
    while IFS= read -r dir <&3; do
        for link in "$dir"/*; do
            [ -L "$link" ] || continue
            target=$(readlink "$link")
            case "$target" in
                "$stable"/*)
                    in_list "$stable_agents" "$(agent_name "$link")" || {
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
$agent_dirs
EOF
    [ "$problems" -eq 0 ]
}

# Prints the agents summary line, which follows the skills summary line in both modes.
print_agents_line() {
    printf 'pinned: %s agents linked in: %s\n' \
        "$(agents_of "$stable" | wc -l | tr -d ' ')" "$shown_agent_dirs"
}

if [ $# -eq 0 ]; then
    [ -d "$stable" ] || fail "no pinned worktree at $stable; run utils/pin.sh <tag>"
    stable=$(CDPATH= cd "$stable" && pwd -P)
    pinned=$(git -C "$stable" describe --tags --exact-match 2>/dev/null) ||
        pinned=$(git -C "$stable" rev-parse --short HEAD)
    check_links || fail "the links do not match the pin at $pinned"
    printf 'pinned: %s, %s skills linked in: %s\n' \
        "$pinned" "$(skills_of "$stable" | wc -l | tr -d ' ')" "$shown_dirs"
    print_agents_line
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
tag_agents=$(printf '%s\n' "$tag_files" | sed -n 's#^agents/\([^/.][^/]*\)\.md$#\1#p')

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
while IFS= read -r agent_dir <&3; do
    while IFS= read -r dir <&4; do
        same_folder "$dir" "$agent_dir" && fail "$agent_dir is both a skill folder and an agent folder"
    done 4<<EOF
$skill_dirs
EOF
    if [ -e "$agent_dir" ] || [ -L "$agent_dir" ]; then
        [ -d "$agent_dir" ] || fail "$agent_dir is not a folder; move it away and run again"
    fi
    while IFS= read -r agent <&4; do
        [ -n "$agent" ] || continue
        entry=$agent_dir/$agent.md
        if [ -L "$entry" ]; then
            target=$(readlink "$entry")
            case "$target" in
                "$stable"/*|"$repo"/*) ;;
                *) fail "$entry links to $target, outside Ordo; move it away and run again" ;;
            esac
        elif [ -d "$entry" ]; then
            fail "$entry is a directory; move it away and run again"
        elif [ -e "$entry" ]; then
            fail "$entry is a real file; move it away and run again"
        fi
    done 4<<EOF
$tag_agents
EOF
    for link in "$agent_dir"/*; do
        [ -L "$link" ] || continue
        case "$(readlink "$link")" in
            "$stable"/*) continue ;;
            "$repo"/*) ;;
            *) continue ;;
        esac
        in_list "$tag_agents" "$(agent_name "$link")" ||
            fail "$link links into the live clone $repo; move it away or pin a tag that holds it"
    done
done 3<<EOF
$agent_dirs
EOF
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
while IFS= read -r agent_dir <&3; do
    mkdir -p "$agent_dir"
    while IFS= read -r agent <&4; do
        [ -n "$agent" ] || continue
        entry=$agent_dir/$agent.md
        old=$(readlink "$entry" 2>/dev/null) || old=""
        ln -sfn "$stable/agents/$agent.md" "$entry" || continue
        case "$old" in
            "$stable"/*) ;;
            "$repo"/*)
                printf 'pin: replaced %s, which linked into the live clone %s\n' "$entry" "$repo"
                ;;
        esac
    done 4<<EOF
$tag_agents
EOF
    for link in "$agent_dir"/*; do
        [ -L "$link" ] || continue
        in_list "$tag_agents" "$(agent_name "$link")" && continue
        case "$(readlink "$link")" in
            "$stable"/*)
                rm "$link" || continue
                printf 'pin: removed %s, which the tag %s does not hold\n' "$link" "$tag"
                ;;
        esac
    done
done 3<<EOF
$agent_dirs
EOF
old_dir=$(outside_dir)
if [ -n "$old_dir" ]; then
    for link in "$old_dir"/*; do
        [ -L "$link" ] || continue
        links_into_ordo "$link" || continue
        rm "$link" || continue
        printf 'pin: removed %s, in a folder pin.sh no longer links into\n' "$link"
    done
fi

check_links || fail "the links do not match the pin after linking"
printf 'pinned: %s (%s), %s skills linked in: %s\n' \
    "$tag" "$(git -C "$stable" rev-parse --short HEAD)" \
    "$(skills_of "$stable" | wc -l | tr -d ' ')" "$shown_dirs"
print_agents_line

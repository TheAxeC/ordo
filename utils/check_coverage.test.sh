#!/bin/sh
# Exercise check_coverage.py in a scratch git repository, one change to a complete coverage list per case.
# The complete list passes, with a hidden file, a nested file, an escaped pipe in a reason, the same file name under two skills and a Done roadmap entry.
# The list is refused when a file is not listed (a hidden one, and a file of one skill listed only in another skill's section), when a file is listed twice, when a mark is not rebuild: <skill>, rebuild later: <skill> or drop, when a mark names a skill that is not a row of New skills, when a reason is empty, when a skill named on the command line has no section or two, when a row of New skills names an entry that is not in docs/roadmap.md, and when a skill folder holds a link.
# The check exits 2 when no skill is named and when find fails on a folder it cannot read, and no run changes anything under the scratch folder.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-coverage-test.XXXXXX") || fail "could not create scratch directory"
trap 'chmod -R u+rwx "$test_root" 2>/dev/null; rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_coverage.py

repo=$test_root/repo
root=$test_root/skills
mkdir -p "$repo/docs" "$root/alpha/references/deep" "$root/beta" "$test_root/real/beta"
git -C "$repo" init -q

cat >"$repo/docs/roadmap.md" <<'MD'
# Roadmap

# Open, in execution order

## 3. The writing base

## 5. paper

# Done

- [x] 1. One layout for every skill: the gate printed ok.
MD

printf 'skill\n' >"$root/alpha/SKILL.md"
printf 'ref\n' >"$root/alpha/references/deep/guide.md"
: >"$root/alpha/.gitkeep"
printf 'skill\n' >"$root/beta/SKILL.md"
printf 'tex\n' >"$root/beta/template.tex"
printf 'skill\n' >"$test_root/real/beta/SKILL.md"
mkdir -p "$root/nested"
printf 'skill\n' >"$root/nested/SKILL.md"
ln -s ../../real/beta "$root/nested/sub"

# The complete list.
cat >"$test_root/base.md" <<'MD'
# Coverage

What each file becomes.

## New skills

| Skill | Roadmap entry |
|---|---|
| writing | 3 |
| paper | 5 |
| layout | 1 |

## alpha

| File | Mark | Reason |
|---|---|---|
| `SKILL.md` | rebuild: paper | The paper workflow; a pipe \| inside a reason. |
| `references/deep/guide.md` | rebuild later: writing | Style guidance. |
| `.gitkeep` | drop | An empty placeholder. |

## beta

| File | Mark | Reason |
|---|---|---|
| `SKILL.md` | rebuild: layout | The same name as alpha's, counted in its own section. |
| `template.tex` | drop | Replaced by the venue files. |
MD

# run <case> <skills...>: copy base.md with the case's edit into the repository and run the check. The edit is a Python snippet over the text s, read from $test_root/edit.py.
run() {
    name=$1
    shift
    python3 - "$test_root/base.md" "$repo/docs/$name.md" "$test_root/edit.py" <<'PY' || fail "$name: edit failed"
import sys
s = open(sys.argv[1], encoding="utf-8").read()
exec(open(sys.argv[3], encoding="utf-8").read())
open(sys.argv[2], "w", encoding="utf-8").write(s)
PY
    direct "$repo/docs/$name.md" "$root" "$@"
}

# direct <arguments>: run the check and fail when it changed anything under the scratch folder.
direct() {
    before=$(snapshot)
    output=$(python3 -B "$check" "$@" 2>&1)
    status=$?
    [ "$(snapshot)" = "$before" ] || fail "$name: the check changed something under the scratch folder"
}

# Every entry under the scratch folder with its type, and every regular file with its checksum. A folder the case locks is listed but not read, so find's complaint about it is discarded.
snapshot() {
    find "$test_root" ! -name edit.py -exec ls -ld {} + 2>/dev/null | awk '{print $1, $NF}' | sort
    find "$test_root" -type f ! -name edit.py -exec cksum {} + 2>/dev/null | sort
}

edit() {
    printf '%s\n' "$1" >"$test_root/edit.py"
}

expect_ok() {
    [ "$status" -eq 0 ] || fail "$name: expected exit 0, got $status: $output"
    case $output in
        "ok: $repo/docs/$name.md") ;;
        *) fail "$name: expected only the ok line, got: $output" ;;
    esac
}

expect_error() {
    [ "$status" -eq 1 ] || fail "$name: expected exit 1, got $status: $output"
    case $output in
        *"$1"*) ;;
        *) fail "$name: missing [$1] in: $output" ;;
    esac
}

# A complete list passes, with a hidden file, a nested file, an escaped pipe, the same file name under two skills and a Done entry.
edit 's = s'
run complete alpha beta
expect_ok

# A link inside a skill folder is an error; the files beside it are still checked.
edit 's = s + "\n## nested\n\n| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | drop | Plain. |\n"'
run nested-link nested
expect_error ":0: 'nested/sub' is a link; its target is not listed or read"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "")'
run missing-hidden alpha
expect_error ":0: 'alpha/.gitkeep' is not listed"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n| `.gitkeep` | drop | Again. |\n")'
run listed-twice alpha
expect_error ":20: '.gitkeep' is listed twice in 'alpha' (first at line 19)"

# A file of beta listed in alpha's section: not a file of alpha, and not listed for beta.
edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n| `template.tex` | drop | Wrong section. |\n").replace("| `template.tex` | drop | Replaced by the venue files. |\n", "")'
run wrong-section alpha beta
expect_error ":20: 'template.tex' is not a file of alpha"
expect_error ":0: 'beta/template.tex' is not listed"

edit 's = s.replace("| `.gitkeep` | drop |", "| `.gitkeep` | keep |")'
run unknown-mark alpha
expect_error ":19: the mark 'keep' is not 'rebuild: <skill>', 'rebuild later: <skill>' or 'drop'"

edit 's = s.replace("| rebuild: paper |", "| rebuild: grant |")'
run unknown-skill alpha
expect_error ":17: the mark names 'grant', which is not a row of New skills"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |", "| `.gitkeep` | drop |  |")'
run empty-reason alpha
expect_error ":19: '.gitkeep' has no reason"

edit 's = s.replace("## alpha\n", "## alphabet\n")'
run no-section alpha
expect_error ":0: no '## alpha' section"

edit 's = s + "\n## alpha\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run section-twice alpha
expect_error ":28: '## alpha' appears more than once"

edit 's = s.replace("| paper | 5 |", "| paper | 4 |")'
run entry-missing alpha
expect_error ":10: roadmap entry '4' of 'paper' is not in docs/roadmap.md"

# A run that names no skill is a usage error, exit 2, not a pass that checked nothing.
edit 's = s'
run usage-no-skill
[ "$status" -eq 2 ] || fail "usage-no-skill: expected exit 2, got $status: $output"

# A find that fails is a usage error, exit 2: the section lists the file find can read, and a file in a subfolder find cannot read would otherwise go unlisted and the list pass.
mkdir -p "$root/locked/sub"
printf 'skill\n' >"$root/locked/SKILL.md"
printf 'ref\n' >"$root/locked/sub/guide.md"
edit 's = s + "\n## locked\n\n| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | drop | Readable. |\n"'
chmod 000 "$root/locked/sub"
run find-fails locked
chmod 755 "$root/locked/sub"
case $output in *"ok: "*) fail "find-fails: a list missing a file find could not read passed: $output" ;; esac
[ "$status" -eq 2 ] || fail "find-fails: expected exit 2, got $status: $output"
case $output in *"locked: find failed"*) ;; *) fail "find-fails: got: $output" ;; esac

printf 'PASS: check_coverage.py scratch tests\n'

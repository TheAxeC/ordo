#!/bin/sh
# Exercise check_coverage.py in a scratch git repository: a complete coverage list passes, and each
# error it exists to catch fails with its message, one change per case.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-coverage-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_coverage.py

repo=$test_root/repo
root=$test_root/skills
mkdir -p "$repo/docs" "$root/alpha/references/deep" "$root/beta" "$root/gamma" "$root/empty" "$test_root/real/beta"
git -C "$repo" init -q

cat >"$repo/docs/roadmap.md" <<'MD'
# Roadmap

# Open, in execution order

## 2.A Launch notes

## 3. The writing base

## 5. paper

## 6.B. A dotted lettered heading, a form the roadmap does not use

# Done

- [x] 1. One layout for every skill: the gate printed ok.
MD

printf 'skill\n' >"$root/alpha/SKILL.md"
printf 'ref\n' >"$root/alpha/references/deep/guide.md"
: >"$root/alpha/.gitkeep"
printf 'skill\n' >"$root/beta/SKILL.md"
printf 'tex\n' >"$root/beta/template.tex"
printf 'skill\n' >"$root/gamma/SKILL.md"
printf 'skill\n' >"$test_root/real/beta/SKILL.md"
ln -s ../real/beta "$root/linked"
mkdir -p "$root/nested"
printf 'skill\n' >"$root/nested/SKILL.md"
ln -s ../../real/beta "$root/nested/sub"

# The complete list. gamma's section is malformed on purpose: gamma is not named on the command line
# in the cases below, so its section is not read (the control naming it is the case "gamma-named").
cat >"$test_root/base.md" <<'MD'
# Coverage

What each file becomes.

## New skills

| Skill | Roadmap entry |
|---|---|
| writing | 3 |
| paper | 5 |
| layout | 1 |

```
## beta
```

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

## gamma

| File | Mark |
|---|---|
MD

# run <case> <skills...>: copy base.md with the case's edit into the repository and run the check.
# The edit is a Python snippet over the text s, read from $test_root/edit.py.
run() {
    name=$1
    shift
    python3 - "$test_root/base.md" "$repo/docs/$name.md" "$test_root/edit.py" <<'PY' || fail "$name: edit failed"
import sys
s = open(sys.argv[1]).read()
exec(open(sys.argv[3]).read())
open(sys.argv[2], "w").write(s)
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

# Every entry under the scratch folder with its type, and every regular file with its checksum.
snapshot() {
    find "$test_root" ! -name edit.py -exec ls -ld {} + | awk '{print $1, $NF}' | sort
    find "$test_root" -type f ! -name edit.py -exec cksum {} + | sort
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

# A complete list passes, with a hidden file, a nested file, an escaped pipe, the same file name under
# two skills, a Done entry, and a heading inside a fence that is not a section.
edit 's = s'
run complete alpha beta
expect_ok

# A skill given twice on the command line is checked once: each of its errors is printed once.
edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "")'
run repeated-skill alpha beta alpha
expect_error ":0: 'alpha/.gitkeep' is not listed"
[ "$(printf '%s\n' "$output" | grep -c "is not listed")" -eq 1 ] || fail "$name: the error is printed more than once: $output"

# A lettered entry as the roadmap writes it passes; the dotted form the roadmap does not use fails.
edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| launch | 2.A |")'
run lettered alpha
expect_ok

edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| dotted | 6.B |")'
run lettered-dotted alpha
expect_error ":12: roadmap entry '6.B' of 'dotted' is not in docs/roadmap.md"

# An empty table fails for a folder with files, and passes for a folder with none.
edit 'i = s.index("| `SKILL.md` | rebuild: paper"); j = s.index("## beta\n\n|"); s = s[:i] + "\n" + s[j:]'
run empty-table alpha
expect_error ":0: 'alpha/SKILL.md' is not listed"
expect_error ":0: 'alpha/references/deep/guide.md' is not listed"
expect_error ":0: 'alpha/.gitkeep' is not listed"

edit 's = s + "\n## empty\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run empty-folder alpha empty
expect_ok

# A link inside a skill folder is an error; the files beside it are still checked.
edit 's = s + "\n## nested\n\n| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | drop | Plain. |\n"'
run nested-link nested
expect_error ":0: 'nested/sub' is a link; its target is not listed or read"

# A backtick fence's info string holds no backtick: this line opens no fence, so the heading is read.
edit 's = s.replace("## alpha\n", "```a`b\n\n## alpha\n", 1)'
run backtick-info alpha
expect_ok

# Table rows inside fenced code are not read, before the table or after it.
edit 's = s.replace("## alpha\n\n", "## alpha\n\n```\n| `x.md` | drop | Fenced. |\n```\n\n", 1).replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n\n```\n| `y.md` | drop | Fenced. |\n```\n")'
run fenced-rows alpha
expect_ok

# A heading's closing hashes are not part of its name.
edit 's = s.replace("## alpha\n", "## alpha ##\n", 1)'
run closing-hashes alpha
expect_ok

# A skill folder that is a link to a folder: its files are listed through the link.
edit 's = s + "\n## linked\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run linked-empty linked
expect_error ":0: 'linked/SKILL.md' is not listed"

edit 's = s + "\n## linked\n\n| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | drop | Through the link. |\n"'
run linked-listed linked
expect_ok

# The control for the unread section: naming gamma reads its malformed table.
edit 's = s'
run gamma-named alpha beta gamma
expect_error "the table header of 'gamma' is not | File | Mark | Reason |"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "")'
run missing-hidden alpha
expect_error ":0: 'alpha/.gitkeep' is not listed"

edit 's = s.replace("| `references/deep/guide.md` | rebuild later: writing | Style guidance. |\n", "")'
run missing-nested alpha
expect_error ":0: 'alpha/references/deep/guide.md' is not listed"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n| `.gitkeep` | drop | Again. |\n")'
run listed-twice alpha
expect_error ":24: '.gitkeep' is listed twice in 'alpha' (first at line 23)"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n| `gone.md` | drop | No such file. |\n")'
run not-a-file alpha
expect_error ":24: 'gone.md' is not a file of alpha"

# A file of beta listed in alpha's section: not a file of alpha, and not listed for beta.
edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n| `template.tex` | drop | Wrong section. |\n").replace("| `template.tex` | drop | Replaced by the venue files. |\n", "")'
run wrong-section alpha beta
expect_error ":24: 'template.tex' is not a file of alpha"
expect_error ":0: 'beta/template.tex' is not listed"

edit 's = s.replace("| `.gitkeep` |", "| `../alpha/.gitkeep` |")'
run dotdot alpha
expect_error ":23: '../alpha/.gitkeep' is not a plain path relative to the skill folder"

edit 's = s.replace("| `.gitkeep` |", "| `/tmp/.gitkeep` |")'
run absolute alpha
expect_error ":23: '/tmp/.gitkeep' is not a plain path relative to the skill folder"

edit 's = s.replace("| `references/deep/guide.md` |", "| `references/./deep/guide.md` |")'
run not-normal alpha
expect_error ":22: 'references/./deep/guide.md' is not a plain path relative to the skill folder"

edit 's = s.replace("| `.gitkeep` |", "| .gitkeep |")'
run no-backticks alpha
expect_error ":23: the file cell '.gitkeep' is not one path in backticks"

edit 's = s.replace("| `.gitkeep` | drop |", "| `.gitkeep` | keep |")'
run unknown-mark alpha
expect_error ":23: the mark 'keep' is not 'rebuild: <skill>', 'rebuild later: <skill>' or 'drop'"

edit 's = s.replace("| rebuild: paper |", "| rebuild:paper |")'
run mark-no-space alpha
expect_error ":21: the mark 'rebuild:paper' is not"

edit 's = s.replace("| rebuild: paper |", "| rebuild: grant |")'
run unknown-skill alpha
expect_error ":21: the mark names 'grant', which is not a row of New skills"

edit 's = s.replace("| rebuild later: writing |", "| rebuild later: grant |")'
run unknown-skill-later alpha
expect_error ":22: the mark names 'grant', which is not a row of New skills"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |", "| `.gitkeep` | drop |  |")'
run empty-reason alpha
expect_error ":23: '.gitkeep' has no reason"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |", "| `.gitkeep` | drop |")'
run two-cells alpha
expect_error ":23: a row of 'alpha' has 2 cells, not 3"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |", "| `.gitkeep` | drop | An empty placeholder. | extra |")'
run four-cells alpha
expect_error ":23: a row of 'alpha' has 4 cells, not 3"

edit 's = s.replace("| `.gitkeep` | drop |", "| `.gitkeep` | drop: paper |")'
run drop-with-skill alpha
expect_error ":23: the mark 'drop: paper' is not"

edit 's = s.replace("| `.gitkeep` | drop |", "| `.gitkeep` | dropped |")'
run dropped alpha
expect_error ":23: the mark 'dropped' is not"

edit 's = s.replace("| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | rebuild: paper", "| Path | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | rebuild: paper", 1)'
run wrong-header alpha
expect_error ":19: the table header of 'alpha' is not | File | Mark | Reason |"

edit 's = s.replace("| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | rebuild: paper", "| File | Mark | Reason |\n| `SKILL.md` | rebuild: paper", 1)'
run no-separator alpha
expect_error ":19: the table of 'alpha' has no separator row"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n\nA note.\n\n| `x.md` | drop | After the table. |\n")'
run row-after-table alpha
expect_error ":27: a table row after the end of the table in 'alpha'"

edit 's = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "| `.gitkeep` | drop | An empty placeholder. |\n\n| `x.md` | drop | After a blank line. |\n")'
run row-after-blank alpha
expect_error ":25: a table row after the end of the table in 'alpha'"

# A table indented four spaces is a code block, not the section's table.
edit 'i = s.index("| File | Mark | Reason |\n|---|---|---|\n| `SKILL.md` | rebuild: paper"); j = s.index("## beta\n\n|"); s = s[:i] + "".join("    " + l + "\n" for l in s[i:j].strip().split("\n")) + "\n" + s[j:]'
run indented-table alpha
expect_error ":17: 'alpha' holds no table"

edit 'i = s.index("## alpha"); j = s.index("## beta\n\n|"); s = s[:i] + "## alpha\n\nNo table here.\n\n" + s[j:]'
run no-table alpha
expect_error ":17: 'alpha' holds no table"

edit 's = s.replace("## alpha\n", "## alphabet\n")'
run no-section alpha
expect_error ":0: no '## alpha' section"

edit 's = s + "\n## alpha\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run section-twice alpha
expect_error ":37: '## alpha' appears more than once"

edit 's = s + "\n## New skills\n\n| Skill | Roadmap entry |\n|---|---|\n"'
run new-skills-twice alpha
expect_error ":37: '## New skills' appears more than once"

# A four-backtick fence holds a three-backtick line and a heading: neither closes it nor is read.
edit 's = s.replace("## alpha\n", "````\n```\n## alpha\n```\n````\n\n## alpha\n", 1)'
run long-fence alpha
expect_ok

edit 's = s + "\n```\n## alpha\n"'
run unclosed-fence alpha
expect_error ':37: the fence ``` opened here is never closed'

edit 's = s.replace("| paper | 5 |", "| paper | 4 |")'
run entry-missing alpha
expect_error ":10: roadmap entry '4' of 'paper' is not in docs/roadmap.md"

edit 's = s.replace("| paper | 5 |", "| paper | 5x |")'
run entry-malformed alpha
expect_error ":10: roadmap entry '5x' of 'paper' is not in docs/roadmap.md"

edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| paper | 2.A |")'
run skill-twice alpha
expect_error ":12: new skill 'paper' is named twice"

edit 's = s.replace("| layout | 1 |", "| layout |  |")'
run empty-entry alpha
expect_error ":11: an empty cell in New skills"

edit 's = s.replace("| layout | 1 |", "|  | 1 |")'
run empty-skill alpha
expect_error ":11: an empty cell in New skills"

edit 's = s.replace("## New skills\n", "## Skills\n")'
run no-new-skills alpha
expect_error ":0: no '## New skills' section"
expect_error "the mark names 'paper', which is not a row of New skills"

# The fenced "## beta" is not a section: without the real one, beta has no section.
edit 'i = s.index("## beta\n\n|"); j = s.index("## gamma"); s = s[:i] + s[j:]'
run fenced-heading beta
expect_error ":0: no '## beta' section"

# Usage errors exit 2.
edit 's = s'
run usage-no-skill
[ "$status" -eq 2 ] || fail "usage-no-skill: expected exit 2, got $status: $output"

name=usage-missing-root
direct "$test_root/base.md" "$test_root/nosuch" alpha
[ "$status" -eq 2 ] || fail "usage-missing-root: expected exit 2, got $status: $output"
case $output in *"nosuch: not a folder"*) ;; *) fail "usage-missing-root: got: $output" ;; esac

edit 's = s'
run usage-missing-folder alpha delta
[ "$status" -eq 2 ] || fail "usage-missing-folder: expected exit 2, got $status: $output"
case $output in *"delta: not a folder"*) ;; *) fail "usage-missing-folder: got: $output" ;; esac

name=usage-missing-list
direct "$repo/docs/nosuch.md" "$root" alpha
[ "$status" -eq 2 ] || fail "usage-missing-list: expected exit 2, got $status: $output"
case $output in *"nosuch.md: No such file or directory"*) ;; *) fail "usage-missing-list: got: $output" ;; esac

mkdir -p "$test_root/bare/docs"
git -C "$test_root/bare" init -q
cp "$test_root/base.md" "$test_root/bare/docs/list.md"
name=usage-missing-roadmap
direct "$test_root/bare/docs/list.md" "$root" alpha
[ "$status" -eq 2 ] || fail "usage-missing-roadmap: expected exit 2, got $status: $output"
case $output in *"docs/roadmap.md: No such file or directory"*) ;; *) fail "usage-missing-roadmap: got: $output" ;; esac

printf '# Coverage \377\n' >"$repo/docs/latin1.md"
name=latin1
direct "$repo/docs/latin1.md" "$root" alpha
[ "$status" -eq 2 ] || fail "latin1: expected exit 2, got $status: $output"
case $output in *"not UTF-8"*) ;; *) fail "latin1: got: $output" ;; esac

cp "$test_root/base.md" "$test_root/outside.md"
name=outside-repo
direct "$test_root/outside.md" "$root" alpha
[ "$status" -eq 2 ] || fail "outside-repo: expected exit 2, got $status: $output"
case $output in *"not inside a git repository"*) ;; *) fail "outside-repo: got: $output" ;; esac

printf 'PASS: check_coverage.py scratch tests\n'

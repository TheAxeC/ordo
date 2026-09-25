#!/bin/sh
# Exercise check_coverage.py in a scratch git repository: a complete coverage list passes, and each
# error it exists to catch fails with its message, one change per case. Beyond the list's own
# errors, the cases cover: a done lettered roadmap entry in both forms (done-lettered); lines split
# on "\n" only, in the roadmap (roadmap-separators), in the list (separator-names) and in find's
# output, read NUL-separated (separator-names, newline-name); file names compared in NFC
# (nfc-names); a last cell ending in \| with no closing pipe (escaped-last-cell); the sorted
# output (order); a find that fails (find-fails); and the --built mode (the built-* cases).

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
mkdir -p "$repo/docs" "$root/alpha/references/deep" "$root/beta" "$root/gamma" "$root/empty" "$test_root/real/beta"
mkdir -p "$root/sep" "$root/nl" "$root/nfd"
mkdir -p "$repo/skills/paper/templates" "$repo/skills/writing"
mkdir -p "$repo/skills/layout" "$repo/skills/extra"
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
- [x] 4.C. A done lettered entry, as the roadmap writes one.
- [x] 7.D A done lettered entry without the dot after its letter.
MD
printf '## 30. A line separator\342\200\250- [x] 31. inside a heading\n' >>"$repo/docs/roadmap.md"
printf '## 33. A next-line character\302\205- [x] 32. inside a heading\n' >>"$repo/docs/roadmap.md"

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
: >"$root/sep/$(printf 'a\342\200\250b.md')"
: >"$root/sep/$(printf 'c\302\205d.md')"
nl_name=$(printf 'a\nb.md')
: >"$root/nl/$nl_name"
: >"$root/nfd/$(printf 'cafe\314\201.md')"
: >"$root/nfd/$(printf 'th\303\251.md')"
printf 'skill\n' >"$repo/skills/paper/SKILL.md"
printf 'tex\n' >"$repo/skills/paper/templates/venue.tex"
printf 'skill\n' >"$repo/skills/writing/SKILL.md"
printf 'skill\n' >"$repo/skills/layout/SKILL.md"
printf 'skill\n' >"$repo/skills/extra/SKILL.md"
printf 'outside\n' >"$test_root/outside.txt"
ln -s "$test_root/outside.txt" "$repo/skills/paper/linked.md"
: >"$repo/skills/paper/$(printf 'caf\303\251.md')"

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

# Every entry under the scratch folder with its type, and every regular file with its checksum. A
# folder the case locks is listed but not read, so find's complaint about it is discarded.
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

# A lettered heading as the roadmap writes it passes; a heading with a dot after its letter, a form
# the roadmap does not use for headings, fails.
edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| launch | 2.A |")'
run lettered alpha
expect_ok

edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| dotted | 6.B |")'
run lettered-dotted alpha
expect_error ":12: roadmap entry '6.B' of 'dotted' is not in docs/roadmap.md"

# A done lettered entry passes in both forms: "- [x] 4.C. ", as the roadmap writes it, and
# "- [x] 7.D ".
edit 's = s.replace("| layout | 1 |",
                   "| layout | 1 |\n| done-dotted | 4.C |\n| done-plain | 7.D |")'
run done-lettered alpha
expect_ok

# A line separator (U+2028) or a next-line character (U+0085) inside a roadmap line starts no line:
# the Done text after it is no entry, and the heading before it is one.
edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| heading-a | 30 |\n| inside-a | 31 |\n"
                   "| heading-b | 33 |\n| inside-b | 32 |")'
run roadmap-separators alpha
expect_error ":13: roadmap entry '31' of 'inside-a' is not in docs/roadmap.md"
expect_error ":15: roadmap entry '32' of 'inside-b' is not in docs/roadmap.md"
case $output in
    *"'30'"*|*"'33'"*) fail "$name: a heading holding a separator is not an entry: $output" ;;
esac

# A last cell ending in \| with no closing pipe keeps its escaped pipe.
edit 's = s.replace("| layout | 1 |", "| layout | 1 |\n| piped | 3\\|")'
run escaped-last-cell alpha
expect_error ":12: roadmap entry '3|' of 'piped' is not in docs/roadmap.md"

# A file name holding U+2028 or U+0085 is one name, in find's output and in the list.
edit 's = s + ("\n## sep\n\n| File | Mark | Reason |\n|---|---|---|\n"
             "| `a\u2028b.md` | drop | A line separator in the name. |\n"
             "| `c\u0085d.md` | drop | A next-line character in the name. |\n")'
run separator-names sep
expect_ok

# A file name holding a newline is one name: find's output is read NUL-separated.
edit 's = s + "\n## nl\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run newline-name nl
expect_error ":0: 'nl/$nl_name' is not listed"
[ "$(printf '%s\n' "$output" | grep -c "is not listed")" -eq 1 ] ||
    fail "$name: one file read as more: $output"

# File names are compared in NFC: a name stored decomposed and listed composed, and one stored
# composed and listed decomposed, both match.
edit 's = s + ("\n## nfd\n\n| File | Mark | Reason |\n|---|---|---|\n"
             "| `caf\u00e9.md` | drop | Stored decomposed, listed composed. |\n"
             "| `the\u0301.md` | drop | Stored composed, listed decomposed. |\n")'
run nfc-names nfd
expect_ok

# Errors print sorted by line number, then by message.
edit 's = s.replace("| writing | 3 |", "| writing | 99 |")
s = s.replace("| `.gitkeep` | drop | An empty placeholder. |\n", "")
s = s.replace("| rebuild: paper |", "| rebuild:paper |")
s = s + "\n## nested\n\n| File | Mark | Reason |\n|---|---|---|\n"'
run order nested alpha
expected=$(printf '%s\n' \
    "$repo/docs/order.md:0: 'alpha/.gitkeep' is not listed" \
    "$repo/docs/order.md:0: 'nested/SKILL.md' is not listed" \
    "$repo/docs/order.md:0: 'nested/sub' is a link; its target is not listed or read" \
    "$repo/docs/order.md:9: roadmap entry '99' of 'writing' is not in docs/roadmap.md" \
    "$repo/docs/order.md:21: the mark 'rebuild:paper' is not 'rebuild: <skill>'"\
", 'rebuild later: <skill>' or 'drop'")
[ "$status" -eq 1 ] || fail "$name: expected exit 1, got $status: $output"
[ "$output" = "$expected" ] || fail "$name: expected, in this order: $expected; got: $output"

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

# --built <skill>: each row marked "rebuild: <skill>" names in backticks a file of skills/<skill>/
# of the list's repository, as a repository path. It passes beside a file of the source skill.
edit 's = s.replace("a pipe \\| inside a reason.",
                   "held by `skills/paper/templates/venue.tex`, from `SKILL.md` and `paper`.")'
run built-named --built paper alpha
expect_ok

# A reason that names no path fails; beta's row, marked for a skill not given to --built, is not
# read.
edit 's = s'
run built-none --built paper alpha beta
expect_error ":21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/"\
" in backticks"
case $output in
    *":29:"*) fail "$name: a row of a skill not given to --built was read: $output" ;;
esac

# A path relative to the skill folder is a path of the source skill, even when skills/paper holds
# a file of the same name: only a path that starts skills/paper/ counts.
edit 's = s.replace("a pipe \\| inside a reason.", "held by `SKILL.md` and `templates/venue.tex`.")'
run built-source-only --built paper alpha
expect_error ":21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/"\
" in backticks"

# The control: --built repeated reads layout's row as well, and a skill given twice is read once.
edit 's = s'
run built-repeated --built paper --built layout --built paper alpha beta
expect_error ":21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/"
expect_error ":29: the reason of 'SKILL.md' (rebuild: layout) names no file of skills/layout/"
[ "$(printf '%s\n' "$output" | grep -c ":21:")" -eq 1 ] ||
    fail "$name: the error is printed more than once: $output"

edit 's = s.replace("a pipe \\| inside a reason.",
                   "held by `skills/paper/templates/gone.tex` or `skills/paper/SKILL.md.bak`.")'
run built-missing --built paper alpha
expect_error ":21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/"\
" that exists: skills/paper/templates/gone.tex, skills/paper/SKILL.md.bak"

# The named path is compared with the listing of skills/paper/'s files, as file cells are: a path
# not in normal form, the folder itself, a folder in it, a case variant of a file, and a link out
# of the repository are not files of it, although each reaches something on disk.
for span in skills/paper/../paper/SKILL.md skills/paper/./SKILL.md skills/paper/. skills/paper/ \
        skills/paper/templates skills/paper/Templates/VENUE.tex skills/paper/linked.md; do
    edit "s = s.replace(\"a pipe \\\\| inside a reason.\", \"held by \`$span\`.\")"
    run built-not-a-file --built paper alpha
    name="built-not-a-file [$span]"
    expect_error ":21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/"\
" that exists: $span"
done

# The named path is compared in NFC: a file stored composed passes when the reason spells it
# decomposed.
edit 's = s.replace("a pipe \\| inside a reason.", "held by `skills/paper/cafe\u0301.md`.")'
run built-nfc --built paper alpha
expect_ok

# A "rebuild later" row is not read, so --built writing finds no row to check, which is an error;
# the control marks the same row "rebuild: writing".
edit 's = s'
run built-later --built writing alpha
expect_error ":0: --built names 'writing', but no row of the sections read is marked"\
" 'rebuild: writing'"
case $output in
    *":22:"*) fail "$name: a rebuild later row was read: $output" ;;
esac

edit 's = s.replace("| rebuild later: writing |", "| rebuild: writing |")'
run built-later-control --built writing alpha
expect_error ":22: the reason of 'references/deep/guide.md' (rebuild: writing)"\
" names no file of skills/writing/ in backticks"
case $output in
    *"no row of the sections read"*) fail "$name: the row was not counted: $output" ;;
esac

# A --built skill whose rows are all in sections not named on the command line: no row to check.
edit 's = s'
run built-no-row --built paper beta
expect_error ":0: --built names 'paper', but no row of the sections read is marked 'rebuild: paper'"

edit 's = s'
run built-not-new --built extra alpha
expect_error ":0: --built names 'extra', which is not a row of New skills"

# --built usage errors exit 2: no skill after it, a name that is empty, "." or "..", or holds "/",
# and a skill with no folder under skills/.
edit 's = s'
run built-no-value alpha --built
[ "$status" -eq 2 ] || fail "$name: expected exit 2, got $status: $output"
case $output in *"--built needs a skill"*) ;; *) fail "$name: got: $output" ;; esac

for bad in "" . .. paper/templates; do
    run built-bad-name --built "$bad" alpha
    [ "$status" -eq 2 ] || fail "$name [$bad]: expected exit 2, got $status: $output"
    case $output in
        *"--built '$bad': not a skill name"*) ;;
        *) fail "$name [$bad]: got: $output" ;;
    esac
done

run built-no-folder --built grant alpha
[ "$status" -eq 2 ] || fail "$name: expected exit 2, got $status: $output"
case $output in *"skills/grant: not a folder"*) ;; *) fail "$name: got: $output" ;; esac

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

# A find that fails is a usage error, exit 2.
mkdir -p "$root/locked/sub"
chmod 000 "$root/locked/sub"
name=find-fails
direct "$repo/docs/complete.md" "$root" locked
chmod 755 "$root/locked/sub"
[ "$status" -eq 2 ] || fail "find-fails: expected exit 2, got $status: $output"
case $output in *"locked: find failed"*) ;; *) fail "find-fails: got: $output" ;; esac

printf 'PASS: check_coverage.py scratch tests\n'

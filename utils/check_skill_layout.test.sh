#!/bin/sh
# Exercise check_skill_layout.py on scratch skill folders: a complete SKILL.md passes, and each rule of
# docs/dev/skill-layout.md the check enforces fails with the line that names it, one change per case.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-skill-layout-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_skill_layout.py

# One complete skill; every case copies it and changes one thing.
make_skill() {
    mkdir -p "$test_root/$1"
    cat >"$test_root/$1/SKILL.md" <<MD
---
name: $1
description: "Does one thing and writes one file. Triggers on: do the thing, $1."
metadata:
  version: "1.0.0"
---

# Do the thing

The skill does one thing and leaves one file behind.

## Quick start

\`\`\`
/$1 <arg>        does the thing
\`\`\`

## Use instead

| When | Use |
|---|---|
| The thing is done already | \`/other\` |

## What it reads

1. \`.agents/plan.yaml\`; no file is a refusal.

## Steps

1. Read the input.
2. **Write.** Write the file.

## The file format

- One line per item.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| None | The skill never stops | Nothing | Nothing |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Writing without reading | The file is wrong | Read first |

## Rules

- **Paths.** Every path is relative to the repository root.
- A \`**literal**\` in a code span is not bold.
MD
}

expect_pass() {
    output=$(python3 "$check" "$test_root/$1") || fail "$1: expected a pass, got: $output"
}

expect_error() {
    if output=$(python3 "$check" "$test_root/$1"); then
        fail "$1: expected an error, got a pass: $output"
    fi
    case "$output" in
        *"$2"*) ;;
        *) fail "$1: missing [$2] in: $output" ;;
    esac
}

edit() {
    python3 - "$test_root/$1/SKILL.md" "$2" "$3" <<'PY'
import sys
path, old, new = sys.argv[1], sys.argv[2].replace("\\n", "\n"), sys.argv[3].replace("\\n", "\n")
text = open(path).read()
assert old in text, old
open(path, "w").write(text.replace(old, new, 1))
PY
}

make_skill complete
expect_pass complete

# Frontmatter.
make_skill wrong-name
edit wrong-name "name: wrong-name" "name: other"
expect_error wrong-name "name is 'other', the folder is 'wrong-name'"
make_skill no-triggers
edit no-triggers " Triggers on: do the thing, no-triggers." ""
expect_error no-triggers "description does not hold 'Triggers on:'"
make_skill bad-version
edit bad-version 'version: "1.0.0"' 'version: "1.0"'
expect_error bad-version "metadata.version is '1.0', not <n>.<n>.<n>"
make_skill no-frontmatter
python3 - "$test_root/no-frontmatter/SKILL.md" <<'PY2'
import sys
p = sys.argv[1]; t = open(p).read(); open(p, "w").write(t.split("---\n", 2)[2])
PY2
expect_error no-frontmatter "no frontmatter between two --- lines"
make_skill bad-yaml
edit bad-yaml "name: bad-yaml" "name: [bad-yaml"
expect_error bad-yaml "frontmatter is not YAML"
make_skill list-frontmatter
python3 - "$test_root/list-frontmatter/SKILL.md" <<'PY2'
import sys
p = sys.argv[1]; t = open(p).read(); body = t.split("---\n", 2)[2]; open(p, "w").write("---\n- a\n---\n" + body)
PY2
expect_error list-frontmatter "frontmatter is a list, not a mapping"
make_skill scalar-metadata
edit scalar-metadata 'metadata:\n  version: "1.0.0"' 'metadata: "1.0.0"'
expect_error scalar-metadata "metadata.version is None, not <n>.<n>.<n>"

# Title and paragraph.
make_skill no-paragraph
edit no-paragraph "The skill does one thing and leaves one file behind.\n" ""
expect_error no-paragraph "no paragraph between the title and the first section"
make_skill subheading-only
edit subheading-only "The skill does one thing and leaves one file behind." "### Sub"
expect_error subheading-only "no paragraph between the title and the first section"
make_skill text-before-title
edit text-before-title "# Do the thing" "Stray text.\n\n# Do the thing"
expect_error text-before-title "text before the title"
make_skill no-title
edit no-title "# Do the thing\n" ""
expect_error no-title "no '# ' title after the frontmatter"
make_skill second-title
printf '\n# Appendix\n\nMore.\n' >>"$test_root/second-title/SKILL.md"
expect_error second-title "a second '# ' heading: # Appendix"

# Section order.
make_skill missing-section
edit missing-section "## Use instead\n\n| When | Use |\n|---|---|\n| The thing is done already | \`/other\` |\n\n" ""
expect_error missing-section "section 'Use instead' is missing"
reads_line=$(grep -n '^## What it reads' "$test_root/missing-section/SKILL.md" | cut -d: -f1)
expect_error missing-section "SKILL.md:$reads_line: section 'Use instead' is missing"
: >"$test_root/empty.md"
mkdir -p "$test_root/empty" && mv "$test_root/empty.md" "$test_root/empty/SKILL.md"
expect_error empty "SKILL.md:1: section 'Rules' is missing"
make_skill closing-hashes
edit closing-hashes "## Rules" "## Rules ##"
expect_pass closing-hashes
make_skill out-of-order
edit out-of-order "## What it reads\n\n1. \`.agents/plan.yaml\`; no file is a refusal.\n\n" ""
edit out-of-order "## Stops" "## What it reads\n\n1. \`.agents/plan.yaml\`; no file is a refusal.\n\n## Stops"
expect_error out-of-order "section 'Steps' is out of order: 'What it reads' belongs here"
make_skill twice
edit twice "## Rules" "## Steps\n\n1. Again.\n\n## Rules"
expect_error twice "section 'Steps' appears twice"
make_skill stray-section
edit stray-section "## Use instead" "## Background\n\nSome text.\n\n## Use instead"
expect_error stray-section "section 'Background' is outside the place between Steps and Stops"
make_skill after-rules
printf '\n## Notes\n\nMore.\n' >>"$test_root/after-rules/SKILL.md"
expect_error after-rules "section 'Notes' is outside the place between Steps and Stops"

# The content each section holds.
make_skill no-code
edit no-code "\`\`\`\n/no-code <arg>        does the thing\n\`\`\`" "Type /no-code."
expect_error no-code "Quick start holds no code block"
make_skill no-numbers
edit no-numbers "1. Read the input.\n2. **Write.** Write the file." "Read the input, then write the file."
expect_error no-numbers "Steps holds no numbered list"
make_skill no-read-list
edit no-read-list "1. \`.agents/plan.yaml\`; no file is a refusal." "The configuration file."
expect_error no-read-list "What it reads holds no numbered list"
make_skill steps-in-subsections
edit steps-in-subsections "1. Read the input.\n2. **Write.** Write the file." "### Mode A\n\n1. Read the input.\n\n### Mode B\n\n1. **Write.** Write the file."
expect_pass steps-in-subsections
make_skill no-bullets
edit no-bullets "- **Paths.** Every path is relative to the repository root.\n- A \`**literal**\` in a code span is not bold." "Every path is relative to the repository root."
expect_error no-bullets "Rules holds no bulleted list"

# Table headers.
make_skill bad-header
edit bad-header "| Anti-pattern | Why it fails | Do instead |" "| Anti-pattern | Why | Instead |"
expect_error bad-header "Anti-patterns table header is | Anti-pattern | Why | Instead |"
make_skill bad-use-header
edit bad-use-header "| When | Use |" "| Case | Skill |"
expect_error bad-use-header "Use instead table header is | Case | Skill |"
make_skill bad-stops-header
edit bad-stops-header "| Stop | When | What it shows | What resumes it |" "| Stop | When |"
expect_error bad-stops-header "Stops table header is | Stop | When |"
make_skill no-table
edit no-table "| Stop | When | What it shows | What resumes it |\n|---|---|---|---|\n| None | The skill never stops | Nothing | Nothing |" "The skill never stops."
expect_error no-table "Stops holds no table"
make_skill spaced-header
edit spaced-header "| When | Use |" "|  When  |   Use |"
expect_pass spaced-header

# Bold only as a label.
make_skill mid-bold
edit mid-bold "1. Read the input." "1. Read the **whole** input."
expect_error mid-bold "bold outside a list item's label"
make_skill table-bold
edit table-bold "| Writing without reading |" "| **Writing** without reading |"
expect_error table-bold "bold outside a list item's label"
make_skill nested-label
edit nested-label "2. **Write.** Write the file." "2. **Write.** Write the file.\n   - **Nested.** A sub item with its own label."
expect_pass nested-label
make_skill italic-label
edit italic-label "2. **Write.** Write the file." "2. **Write *all*.** Write the file."
expect_pass italic-label
make_skill star-bullets
edit star-bullets "- **Paths.** Every path" "* **Paths.** Every path"
edit star-bullets "- A \`**literal**\` in a code span is not bold." "* A \`**literal**\` in a code span is not bold."
expect_pass star-bullets
make_skill underscore-bold
edit underscore-bold "1. Read the input." "1. Read the __whole__ input."
expect_error underscore-bold "bold outside a list item's label"
make_skill heading-bold
edit heading-bold "## The file format" "## The **file** format"
expect_error heading-bold "bold in a heading"
make_skill title-bold
edit title-bold "# Do the thing" "# Do the **thing**"
expect_error title-bold "bold in a heading"

# Fenced code is not read: headings, bold and lists inside a fence of any form pass, and the same
# lines outside a fence are the controls above (stray-section, mid-bold).
make_skill fences
edit fences "## The file format\n\n- One line per item." "## The file format\n\n1. Run:\n   \`\`\`sh\n   **x** y\n   ## Not a heading\n   \`\`\`\n\n~~~\n## Fake\n**bold**\n~~~\n\n\`\`\`\`md\n\`\`\`\n## Inner\n\`\`\`\n\`\`\`\`"
expect_pass fences
# A fence closes only on a line of its own character at least as long: bold sits after an inner,
# shorter or different fence line, and is read as fenced only when that line does not close the fence.
make_skill longer-closer
edit longer-closer "- One line per item." "- One line per item.\n\n\`\`\`\`md\n\`\`\`\n**bold**\n\`\`\`\`"
expect_pass longer-closer
make_skill other-closer
edit other-closer "- One line per item." "- One line per item.\n\n~~~\n\`\`\`\n**bold**\n~~~"
expect_pass other-closer
make_skill inline-backticks
edit inline-backticks "- One line per item." "- One line per item.\n\n\`\`\`x\`\`\` is inline code."
expect_pass inline-backticks
make_skill unclosed
edit unclosed "- One line per item." "- One line per item.\n\n\`\`\`sh\nrun"
expect_error unclosed "the fence \`\`\` opened here is never closed"
make_skill tilde-quick-start
edit tilde-quick-start "\`\`\`\n/tilde-quick-start <arg>        does the thing\n\`\`\`" "~~~\n/tilde-quick-start <arg>        does the thing\n## Fake\n~~~"
expect_pass tilde-quick-start

# Version tags in headings.
make_skill version-heading
edit version-heading "## The file format" "## The file format (v2.1)"
expect_error version-heading "version tag in heading"
make_skill version-subheading
edit version-subheading "## The file format" "## The file format\n\n### Rows v1.2"
expect_error version-subheading "version tag in heading: ### Rows v1.2"
make_skill version-deep
edit version-deep "## The file format" "## The file format\n\n#### Format v2.1"
expect_error version-deep "version tag in heading: #### Format v2.1"
make_skill version-in-span
edit version-in-span "## The file format" "## The file format \`v1.2.0\`"
expect_error version-in-span "version tag in heading"

# A path that does not exist is an error line, not a traceback.
output=$(python3 "$check" "$test_root/nowhere/SKILL.md") && fail "a missing file passed"
case "$output" in
    *"nowhere/SKILL.md:0: no such file"*) ;;
    *) fail "a missing file did not print its error line: $output" ;;
esac

# With no argument the check reads skills/*/SKILL.md beside utils/.
mkdir -p "$test_root/repo/utils" "$test_root/repo/skills"
cp "$check" "$test_root/repo/utils/"
make_skill complete-two
mv "$test_root/complete-two" "$test_root/repo/skills/"
output=$(cd "$test_root/repo" && python3 utils/check_skill_layout.py) || fail "the default run failed: $output"
case "$output" in
    *"ok: skills/complete-two/SKILL.md"*) ;;
    *) fail "the default run did not read skills/: $output" ;;
esac

printf 'PASS: check_skill_layout.py scratch tests\n'

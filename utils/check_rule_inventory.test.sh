#!/bin/sh
# Exercise check_rule_inventory.py in a scratch git repository: a complete inventory passes, and each
# error it exists to catch fails with its line, one change per case.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-rule-inventory-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_rule_inventory.py

repo=$test_root/repo
mkdir -p "$repo/skills/demo" "$repo/ledger"
git -C "$repo" init -q

# The old file. Lines carrying text: 2, 3 (a YAML comment, not a heading), 4, 9, 13, 14, 17 and 18
# (inside a fence; 18 is not a fence line), 21, 23 (a body row of dashes, not a separator) and 24.
cat >"$repo/skills/demo/SKILL.md" <<'MD'
---
name: demo
# keep the version below 2
description: "Does the thing. Triggers on: demo."
---

# Demo

The skill does the thing.

## What it does

1. Reads the input.
2. Writes the output.

```
## not a heading
~~~ inner text that is a rule
```

| A | B |
|---|---|
| - | - |
| x | y |
MD
mkdir -p "$repo/skills/blocks" "$repo/skills/bad"
# Lines of the blocks skill: 2 and 3 are frontmatter keys, 4 continues 3; 9 opens an item and 10, 11 are
# nested items; 12 and 13 are items with other markers; 14 is a paragraph, 15-18 a fenced block holding
# two list-shaped lines, 19 a paragraph right after the fence.
cat >"$repo/skills/blocks/SKILL.md" <<'MD'
---
name: blocks
description: >-
  folded text
---

# Blocks

- parent rule
  - nested rule one
  - nested rule two
+ plus rule
1) paren rule
Rule before a fence.
```
- a in code
- b in code
```
Rule after a fence.
MD
printf 'caf\351\n' >"$repo/skills/bad/SKILL.md"
git -C "$repo" add -A
git -C "$repo" -c user.name=t -c user.email=t@t commit -q -m old
old=$(git -C "$repo" rev-parse --short HEAD)
git -C "$repo" branch oldbranch

write_new() {
    cat >"$repo/skills/demo/SKILL.md" <<'MD'
---
name: demo
description: "Does the thing. Triggers on: demo."
---

# Demo

The skill does the thing.

## Steps

### Mode A

1. Read the input.
2. Write the output.

## Inputs / outputs

- One input, one output.

## Phase 2

- The second phase.

## Rules

- A rule.

| A | B |
|---|---|
| x | y |
MD
}
write_new

write_inventory() {
    cat >"$repo/ledger/$1.md" <<MD
# Rule inventory: demo

- Old: \`skills/demo/SKILL.md\` at \`$old\`
- New: \`skills/demo/SKILL.md\`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The name | Steps |
| 3 | The comment | Steps |
| 4 | The description | Steps |
| 9 | What the skill does | Steps / Mode A 1 |
| 13 | Read the input | Steps / Mode A 1 |
| 14 | Write the output | Steps / Mode A 2 |
| 17-18 | The fenced example | Rules 1 |
| 21 | The table's header | Rules 2 |
| 23 | The row of dashes | Rules 2 |
| 24 | The x row | Rules 2 |
MD
}

expect_pass() {
    output=$(python3 "$check" "$repo/ledger/$1.md") || fail "$1: expected a pass, got: $output"
}

expect_error() {
    if output=$(python3 "$check" "$repo/ledger/$1.md"); then
        fail "$1: expected an error, got a pass: $output"
    fi
    case "$output" in
        *"$2"*) ;;
        *) fail "$1: missing [$2] in: $output" ;;
    esac
}

edit() {
    python3 - "$repo/ledger/$1.md" "$2" "$3" <<'PY'
import sys
path, old, new = sys.argv[1], sys.argv[2], sys.argv[3]
text = open(path).read()
assert old in text, old
# Deleting a row removes its whole line; a blank line would end the table.
if new == "" and old + "\n" in text:
    old += "\n"
open(path, "w").write(text.replace(old, new, 1))
PY
}

edit_new() {
    python3 - "$repo/skills/demo/SKILL.md" "$1" "$2" <<'PY'
import sys
path, old, new = sys.argv[1], sys.argv[2].replace("\\n", "\n"), sys.argv[3].replace("\\n", "\n")
text = open(path).read()
assert old in text, old
open(path, "w").write(text.replace(old, new, 1))
PY
}

write_inventory complete
expect_pass complete

# The header lines.
write_inventory no-old
edit no-old "- Old: \`skills/demo/SKILL.md\` at \`$old\`" ""
expect_error no-old "no '- Old: \`<path>\` at \`<commit>\`' line"
write_inventory no-new
edit no-new "- New: \`skills/demo/SKILL.md\`" ""
expect_error no-new "no '- New: \`<path>\`' line"
write_inventory second-old
edit second-old "- New:" "- Old: \`skills/demo/SKILL.md\` at \`$old\`\n- New:"
python3 - "$repo/ledger/second-old.md" <<'PY'
import sys
p = sys.argv[1]; t = open(p).read(); open(p, "w").write(t.replace("\\n- New:", "\n- New:"))
PY
expect_error second-old "a second '- Old:' line"
write_inventory unknown-commit
edit unknown-commit "at \`$old\`" "at \`0000000\`"
expect_error unknown-commit "no commit 0000000 in the repository"
write_inventory branch-commit
edit branch-commit "at \`$old\`" "at \`oldbranch\`"
expect_error branch-commit "the old commit 'oldbranch' is not a hexadecimal commit id"
write_inventory head-commit
edit head-commit "at \`$old\`" "at \`HEAD\`"
expect_error head-commit "the old commit 'HEAD' is not a hexadecimal commit id"
write_inventory option-commit
edit option-commit "at \`$old\`" "at \`--output=$test_root/pwned\`"
expect_error option-commit "is not a hexadecimal commit id"
ls "$test_root" | grep -q pwned && fail "an option in the commit reached git"
git -C "$repo" branch deadbee0 "$old"
write_inventory branch-named-like-a-commit
edit branch-named-like-a-commit "at \`$old\`" "at \`deadbee0\`"
expect_error branch-named-like-a-commit "no commit deadbee0 in the repository"
write_inventory bad-old-path
edit bad-old-path "- Old: \`skills/demo/SKILL.md\`" "- Old: \`skills/none/SKILL.md\`"
expect_error bad-old-path "git show $old:skills/none/SKILL.md failed: the path is not in that commit"
write_inventory escaping-new
edit escaping-new "- New: \`skills/demo/SKILL.md\`" "- New: \`../outside.md\`"
expect_error escaping-new "the new path '../outside.md' is not a relative path inside the repository"
write_inventory absolute-new
edit absolute-new "- New: \`skills/demo/SKILL.md\`" "- New: \`$repo/skills/demo/SKILL.md\`"
expect_error absolute-new "is not a relative path inside the repository"
write_inventory no-new-file
edit no-new-file "- New: \`skills/demo/SKILL.md\`" "- New: \`skills/none/SKILL.md\`"
expect_error no-new-file "the new file skills/none/SKILL.md does not exist"

# The inventory's table.
write_inventory bad-header
edit bad-header "| Old lines | Rule | New place |" "| Lines | Rule | Place |"
expect_error bad-header "the table header is | Lines | Rule | Place |"
write_inventory no-rows
python3 - "$repo/ledger/no-rows.md" <<'PY'
import sys
p = sys.argv[1]; t = open(p).read(); open(p, "w").write(t.split("|---|---|---|\n")[0] + "|---|---|---|\n")
PY
expect_error no-rows "no table rows"
write_inventory four-cells
edit four-cells "| 9 | What the skill does |" "| 9 | What | the skill does |"
expect_error four-cells "a row has 4 cells, not 3"
write_inventory second-table
printf '\n| 99 | A row of a second table | Nowhere |\n' >>"$repo/ledger/second-table.md"
expect_error second-table "a table row after the inventory's table has ended"
write_inventory escaped-pipe
edit escaped-pipe "| What the skill does |" "| Run it as 2>&1 \\| tail -1 |"
expect_pass escaped-pipe
write_inventory fenced-rows
edit fenced-rows "- New: \`skills/demo/SKILL.md\`" "- New: \`skills/demo/SKILL.md\`

\`\`\`
| 99 | Not a row | Nowhere |
\`\`\`"
expect_pass fenced-rows

# Coverage.
write_inventory uncovered
edit uncovered "| 14 | Write the output | Steps / Mode A 2 |" ""
expect_error uncovered "old line 14 is in no row: 2. Writes the output."
write_inventory uncovered-order
edit uncovered-order "| 9 | What the skill does | Steps / Mode A 1 |" ""
edit uncovered-order "| 24 | The x row | Rules 2 |" ""
expect_error uncovered-order "old line 9 is in no row"
printf '%s\n' "$output" | python3 -c '
import re, sys
nums = [int(m) for m in re.findall(r"old line (\d+) is in no row", sys.stdin.read())]
sys.exit(0 if nums == sorted(nums) and len(nums) == 2 else 1)' || fail "uncovered old lines are not in their order: $output"
write_inventory yaml-comment
edit yaml-comment "| 3 | The comment | Steps |" ""
expect_error yaml-comment "old line 3 is in no row: # keep the version below 2"
write_inventory tilde-in-fence
edit tilde-in-fence "| 17-18 |" "| 17 |"
expect_error tilde-in-fence "old line 18 is in no row: ~~~ inner text that is a rule"
write_inventory dash-row
edit dash-row "| 23 | The row of dashes | Rules 2 |" ""
expect_error dash-row "old line 23 is in no row: | - | - |"

# The rows' ranges.
write_inventory bad-range
edit bad-range "| 9 |" "| eight |"
expect_error bad-range "old lines 'eight' is not a number or a range a-b"
write_inventory spaced-range
edit spaced-range "| 9 |" "| 9 - 9 |"
expect_error spaced-range "old lines '9 - 9' is not a number or a range a-b"
write_inventory outside-range
edit outside-range "| 24 |" "| 24-30 |"
expect_error outside-range "old lines 24-30 lie outside the old file's 1-24 or run backwards"
write_inventory backwards-range
edit backwards-range "| 14 |" "| 14-13 |"
expect_error backwards-range "old lines 14-13 lie outside the old file's 1-24 or run backwards"
write_inventory two-items
edit two-items "| 13 | Read the input |" "| 13-14 | Read the input |"
expect_error two-items "old lines 13-14 open 2 list items, table rows or frontmatter keys; one row per item"
write_inventory two-rows
edit two-rows "| 23 |" "| 23-24 |"
expect_error two-rows "old lines 23-24 open 2 list items, table rows or frontmatter keys; one row per item"
write_inventory with-blank
edit with-blank "| 9 |" "| 9-10 |"
expect_error with-blank "old lines 9-10 hold a blank line at 10"
write_inventory with-heading
edit with-heading "| 9 |" "| 11 |"
expect_error with-heading "old lines 11-11 hold a heading at 11"
write_inventory empty-rule
edit empty-rule "| What the skill does |" "|  |"
expect_error empty-rule "the rule is empty"

# The new places.
write_inventory unknown-section
edit unknown-section "| Rules 1 |" "| Stops 1 |"
expect_error unknown-section "no section '## Stops' in skills/demo/SKILL.md"
write_inventory unknown-sub
edit unknown-sub "| Steps / Mode A 2 |" "| Steps / Mode B 2 |"
expect_error unknown-sub "no subsection '### Mode B' under '## Steps'"
write_inventory item-too-large
edit item-too-large "| 24 | The x row | Rules 2 |" "| 24 | The x row | Rules 3 |"
expect_error item-too-large "item 3 of 'Rules' does not exist; it has 2"
write_inventory item-zero
edit item-zero "| Rules 1 |" "| Rules 0 |"
expect_error item-zero "item 0 of 'Rules' does not exist; it has 2"
write_inventory section-own-items
edit section-own-items "| Steps / Mode A 1 |" "| Steps 1 |"
expect_error section-own-items "item 1 of 'Steps' does not exist; it has 0"
write_inventory slash-name
edit slash-name "| What the skill does | Steps / Mode A 1 |" "| What the skill does | Inputs / outputs 1 |"
expect_pass slash-name
write_inventory digit-name
edit digit-name "| What the skill does | Steps / Mode A 1 |" "| What the skill does | Phase 2 |"
expect_pass digit-name
write_inventory digit-name-item
edit digit-name-item "| What the skill does | Steps / Mode A 1 |" "| What the skill does | Phase 2 1 |"
expect_pass digit-name-item

# Items in the new file: fenced lines, nested bullets and a table's header row are not items; the same
# bullet outside a fence or at the top level is one, and a closing-hash heading keeps its name.
write_inventory rules-three
edit rules-three "| 24 | The x row | Rules 2 |" "| 24 | The x row | Rules 3 |"
edit_new "- A rule.\n" "- A rule.\n\n\`\`\`\`md\n\`\`\`\n- not an item\n\`\`\`\n\`\`\`\`\n\n~~~\n- not an item either\n~~~\n  - nested, not an item\n"
expect_error rules-three "item 3 of 'Rules' does not exist; it has 2"
edit_new "  - nested, not an item\n" "- now an item\n"
expect_pass rules-three
write_new
write_inventory inline-backticks
edit inline-backticks "| 24 | The x row | Rules 2 |" "| 24 | The x row | Rules 3 |"
edit_new "- A rule.\n" "- A rule.\n\n\`\`\`x\`\`\` is inline code, not a fence.\n\n- counted\n"
expect_pass inline-backticks
write_new
write_inventory closing-hashes
edit_new "## Rules" "## Rules ##"
expect_pass closing-hashes
write_new

# Blocks: a range stays inside one block and opens at most one item.
cat >"$repo/skills/blocks/SKILL.md" <<'MD'
---
name: blocks
description: "x. Triggers on: x."
---

# Blocks

Para.

## Rules

1. Item one.

   | A |
   |---|
   | nested row |

+ plus item
2) paren item

### Mode A ##

- one
MD
write_blocks() {
    cat >"$repo/ledger/$1.md" <<MD
# Rule inventory: blocks

- Old: \`skills/blocks/SKILL.md\` at \`$old\`
- New: \`skills/blocks/SKILL.md\`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The name | Rules |
| 3-4 | The folded description | Rules |
| 9 | The parent rule | Rules 1 |
| 10 | Nested rule one | Rules 1 |
| 11 | Nested rule two | Rules 1 |
| 12 | The plus rule | Rules 2 |
| 13 | The paren rule | Rules 3 |
| 14 | Before the fence | Rules |
| 15-18 | The fenced block | Rules |
| 19 | After the fence | Rules / Mode A 1 |
MD
}
write_blocks blocks-complete
expect_pass blocks-complete
write_blocks nested-in-range
edit nested-in-range "| 9 | The parent rule | Rules 1 |" "| 9-11 | The parent rule | Rules 1 |"
expect_error nested-in-range "old lines 9-11 open 3 list items, table rows or frontmatter keys"
write_blocks other-markers
edit other-markers "| 12 | The plus rule | Rules 2 |" "| 12-13 | The plus rule | Rules 2 |"
expect_error other-markers "old lines 12-13 open 2 list items, table rows or frontmatter keys"
write_blocks across-fence
edit across-fence "| 14 | Before the fence | Rules |" "| 14-19 | Before the fence | Rules |"
expect_error across-fence "old lines 14-19 cross into another block at 15"
write_blocks fenced-lines-not-items
edit fenced-lines-not-items "| 15-18 | The fenced block | Rules |" "| 15-18 | The fenced block, two list-shaped lines in code | Rules |"
expect_pass fenced-lines-not-items
write_blocks frontmatter-keys
edit frontmatter-keys "| 2 | The name | Rules |" "| 2-4 | The name | Rules |"
expect_error frontmatter-keys "old lines 2-4 open 2 list items, table rows or frontmatter keys"
write_blocks across-delimiter
edit across-delimiter "| 2 | The name | Rules |" "| 1-2 | The name | Rules |"
expect_error across-delimiter "old lines 1-2 cross into another block at 2"
write_blocks list-items-counted
edit list-items-counted "| 13 | The paren rule | Rules 3 |" "| 13 | The paren rule | Rules 4 |"
expect_error list-items-counted "item 4 of 'Rules' does not exist; it has 3"
write_blocks sub-closing-hashes
expect_pass sub-closing-hashes
write_inventory header-and-separator
edit header-and-separator "| 21 | The table's header | Rules 2 |" "| 21-22 | The table's header | Rules 2 |"
expect_pass header-and-separator

# More header and path cases.
write_inventory second-new
edit second-new "- New: \`skills/demo/SKILL.md\`" "- New: \`skills/demo/SKILL.md\`
- New: \`skills/demo/SKILL.md\`"
expect_error second-new "a second '- New:' line"
write_inventory escaping-old
edit escaping-old "- Old: \`skills/demo/SKILL.md\`" "- Old: \`../skills/demo/SKILL.md\`"
expect_error escaping-old "the old path '../skills/demo/SKILL.md' is not a relative path inside the repository"
write_inventory dash-path
edit dash-path "- New: \`skills/demo/SKILL.md\`" "- New: \`-x\`"
expect_error dash-path "the new path '-x' is not a relative path inside the repository"
write_inventory no-separator
edit no-separator "|---|---|---|
" ""
expect_pass no-separator
write_inventory stray-sub
edit_new "# Demo\n" "# Demo\n\n### Stray\n"
edit stray-sub "| 9 | What the skill does | Steps / Mode A 1 |" "| 9 | What the skill does | None / Stray |"
expect_error stray-sub "no section '## None'"
write_new
write_inventory old-not-utf8
edit old-not-utf8 "- Old: \`skills/demo/SKILL.md\`" "- Old: \`skills/bad/SKILL.md\`"
expect_error old-not-utf8 "the old file is not UTF-8"
mkdir -p "$repo/skills/badnew"
printf 'caf\351\n' >"$repo/skills/badnew/SKILL.md"
write_inventory new-not-utf8
edit new-not-utf8 "- New: \`skills/demo/SKILL.md\`" "- New: \`skills/badnew/SKILL.md\`"
expect_error new-not-utf8 "the new file is not UTF-8"
mkdir -p "$test_root/norepo"
write_inventory outside-repo
mv "$repo/ledger/outside-repo.md" "$test_root/norepo/outside-repo.md"
output=$(python3 "$check" "$test_root/norepo/outside-repo.md") && fail "an inventory outside a repository passed"
case "$output" in
    *"the inventory is not inside a git repository"*) ;;
    *) fail "outside-repo: missing [the inventory is not inside a git repository] in: $output" ;;
esac

# Input the check cannot read.
printf '\377\376' >"$repo/ledger/not-utf8.md"
expect_error not-utf8 "not UTF-8"
output=$(python3 "$check" "$repo/ledger/nowhere.md") && fail "a missing inventory passed"
case "$output" in
    *"nowhere.md:0: no such file"*) ;;
    *) fail "a missing inventory did not print its error line: $output" ;;
esac
python3 "$check" 2>/dev/null
[ $? -eq 2 ] || fail "no argument did not exit 2"

printf 'PASS: check_rule_inventory.py scratch tests\n'

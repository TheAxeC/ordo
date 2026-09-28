# Step 7, repair round 1: the rulings

The round starts at the worktree's wip commit named in the dispatch block. The findings are in `agents/reviews/7-refuter.md`. The brief `agents/briefs/7.md` holds unchanged, except where a ruling below changes a case; every case and every check of "Verify before you report" is run again after the round. The paths are the brief's.

## Rulings

1. **The `__init__.py` case** (Spec 1). The brief's case was wrong and its rule is right: CommonMark renders `1. Read the input from __init__.py.` with `init` in strong emphasis (markdown-it-py in CommonMark mode and `pandoc -f commonmark`), so the checker reports it. The test's `dunder` case, the docstring and the README line stay as they are; the orchestrator corrects the brief's case in the ledger.
2. **Indented headings in the inventory checker** (Spec 2). `utils/check_rule_inventory.py` reads a heading indented by up to three spaces as a heading, as the layout checker does now: `HEADING` (line 67) and the `## ` and `### ` matches (lines 148 and 152), and every other place that matches a heading in that file. A case for an indented section heading in the new file and one in the old file, each turning red when its match is reverted to column 0.
3. **The trailing carriage return** (Proof 1). The drop is output-neutral: every reader strips the line, and 4000 generated files gave no difference. Remove it from `read_lines` and `split_lines`, so each splits on the line feed only and a carriage return stays in its line, and say so in both docstrings (the readers strip it). Change-standard rule 11: no code that no case can prove.
4. **`**` inside a word** (Proof 2). A case `1. Read foo**bar**baz.` expecting "bold outside a list item's label", red when `**` is given the `__` word rule.
5. **The `crlf` case** (Proof 3). It is a regression pin, not a proof: the test's comment for it says so, and the report's sentence that each case has a red revert is made true.
6. **The silent cases' controls** (Proof 4). For each case that asserts silence (`intraword`, `version-control`, `indented-code`, `bom`, `crlf`, `indented-heading`, `indented-heading-three`, `underscore-label`), the report names its control case and quotes the control's output, or says it is an audit.
7. **README line 128** (Standards 1). The sentence says what the test checks: the bold error at the line `grep -n` gives when an earlier line holds a line separator or a lone carriage return, or a case is added for each other error it names.
8. **README line 129 and a lone carriage return in the old file** (Standards 2). A case with a lone carriage return inside a line of the old file, read as part of that line, so the sentence holds for all three files.
9. **The docstring line** (Standards 3). `utils/check_rule_inventory.py:26` rewrapped to about 100 characters with the rest of its paragraph.
10. **The report's user-visible changes** (Behaviour 1 and 2). The report states, with before and after: an indented `# ` heading, an indented `## ` heading outside the reference place, a version tag in an indented heading and bold in an indented heading now fail where they passed; the table check reads the first table of a section and reports one with no row after its separator.

## How to run the checks

Only the commands of your allow list run. Each revert is made in place in the worktree with your edit tool, the test run through its listed command, its first `FAIL:` line quoted, and the fix restored with your edit tool and the test run green again. Nothing of a revert stays in the tree.

## Report

Rewrite `agents/reviews/7-report.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" listing each ruling DONE or NOT DONE and the command that proves it, "Verify before you report" rerun and quoted, and the files changed.

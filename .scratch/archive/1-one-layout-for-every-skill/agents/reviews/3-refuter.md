# Step 3 refuter report (on .agents/worktrees/1-3, base 273714d)

## Verification (rerun by the reviewer)

```
$ git log --oneline -1            (in the worktree)
f157b94 Brief step 3 of plan 1, the rule inventory check
$ git status --short
 M README.md
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? utils/check_rule_inventory.py
?? utils/check_rule_inventory.test.sh
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as in docs/dev/building.md)
(no output) exit 0
$ git show 84ce1f7:skills/plan/SKILL.md | awk 'NF' | wc -l
      23
Reverts on a copy under $TMPDIR (report's 2a, 2c, 2h, 2g reproduced red):
2a is_header removed: FAIL: item-too-large: expected an error, got a pass: ok: .../ledger/item-too-large.md
2c coverage skipped: FAIL: uncovered: expected an error, got a pass: ok: .../ledger/uncovered.md
2h bounds skipped: FAIL: outside-range: expected an error, got a pass: ok: .../ledger/outside-range.md
2g empty rule: FAIL: empty-rule: expected an error, got a pass: ok: .../ledger/empty-rule.md
Reverts that stay green:
separator exemption removed: PASS: check_rule_inventory.py scratch tests
fence close length removed: PASS: check_rule_inventory.py scratch tests
tilde fences dropped: PASS: check_rule_inventory.py scratch tests
backtick info-string rule removed: PASS: check_rule_inventory.py scratch tests
closing hashes not stripped: PASS: check_rule_inventory.py scratch tests
nested-item guard removed: PASS: check_rule_inventory.py scratch tests
frontmatter guard removed: PASS: check_rule_inventory.py scratch tests
cell count check removed: PASS: check_rule_inventory.py scratch tests
first>last accepted: PASS: check_rule_inventory.py scratch tests
no-table-rows check removed: PASS: check_rule_inventory.py scratch tests
```

## 1. Spec

- orchestrator-state.md dispatch block / worktree HEAD: the worktree sits at f157b94 (`git log --oneline -1`), which is also the base the dispatch block records; the base given to this review, 273714d, is the dispatch commit after it. `git diff 273714d` therefore shows orchestrator-state.md changed (the dispatch block reverting to `dispatch: none`). That difference is the base gap, not the builder's work; the builder's diff is the one against f157b94. The worktree's copy of the brief still carries the broken premise line that 97c8fdf corrected.
- utils/check_rule_inventory.py:196: `item is not None and int(item) > new_places[key]` accepts item 0. With the probe new file, `| 1-26 | r | Steps 0 |` prints `ok:`. The brief's rule 3 asks for "an item number no larger than the number of items there", and item 0 names no item.
- utils/check_rule_inventory.py:110: an item counts toward the `## ` section as well as its `### ` subsection. As a result, "Steps 3" passes (`ok:`) for a Steps section that has no items of its own and holds `### Mode A` (items 1, 2) and `### Mode B` (item 1). No reader can find "the 3rd item" of that section, because the numbering restarts in each subsection. The test's own complete inventory depends on this: at test.sh:88, `Steps 1` names a section whose only items sit under `### Mode A`. The brief says "the n-th ... item of that section", and the docstring (lines 19-20) does not say that subsection items are counted.
- utils/check_rule_inventory.py:39 (PLACE): some section names cannot be named at all. `## Inputs / outputs` fails with `no section '## Inputs'`. `## Phase 2` fails with `no section '## Phase'`, and passes only when an item number is added (`Phase 2 1` gives `ok:`). A section name containing `/` without spaces does not parse. The brief's format allows any `## ` section name.
- utils/check_rule_inventory.py:115-127: the inventory's table header row is never checked. The first `|` line of the file is dropped as the header, whatever it holds. In an inventory with no header row (ledger/two.md), the first data row `| 1-26 | r | Closing |` was skipped silently: its range covered nothing and its place was not checked. Lines starting with `|` inside a fenced block of the inventory are read as rows.
- utils/check_rule_inventory.py:136-142: when an inventory has two `- Old:` or two `- New:` lines, the last one wins and no error is reported. Brief rule 1 asks for "the two header bullets".

## 2. Proof

- The check passes an inventory that loses rules. Old file (scratch repository, 26 lines, several rule-bearing lines): the single row `| 1-26 | everything | Steps |` prints `ok: ledger/p.md`, exit 0. Coverage is measured by range only, so one row can span the whole file. The brief's format allows this. The plan's gate says "one line per rule of the old file" and no check enforces it. This is for the orchestrator to rule on.
- utils/check_rule_inventory.py:74: a YAML comment inside the frontmatter (`# keep the version below 2`, old line 6) matches `^#{1,6} ` and is exempt as a heading. The probe listed no error for line 6. The line is lost from coverage.
- utils/check_rule_inventory.py:72: inside a backtick fence, the line `~~~ inner text that is a rule` (old line 25) matches FENCE and is exempt as a fence line, although it is content. The probe listed no error for line 25.
- utils/check_rule_inventory.py:43/76: a table body row made only of dashes and colons (`| - | - |`, old line 19) matches SEPARATOR and is exempt. The probe listed no error for line 19. A `-` cell means "none" in some tables.
- utils/check_rule_inventory.py:154: `<commit>` accepts any revision. `oldbranch` and `HEAD` both print `ok:`. Once the restyle lands, `HEAD:<path>`, or a branch that moves, resolves to the new file, so the inventory checked "again on main" no longer compares against the old text. Brief rule 1 says a commit, and an unknown commit is an error.
- utils/check_rule_inventory.test.sh (whole file): ten reverts of the check stay green (see Verification). The ones that matter to the brief:
  - the separator-row exemption, which is brief rule 2. The test's row `19-21` covers the separator line 20, so the exemption is never exercised.
  - tilde fences and fence-close length, which is brief rule 4 ("fenced code of any form"). The test uses only ``` fences.
  - the backtick info-string rule.
  - closing hashes on section names.
  - the nested-item guard.
  - the frontmatter-only `---` guard.
  - the cell-count and no-rows errors.
  - `first > last`.

  Change-standard rule 13 requires every case to name a revert that turns it red. These code paths have no case.
- 3-report.md:11-18: the quoted red outputs are cut short, not verbatim. For example, 2a actually prints `FAIL: item-too-large: expected an error, got a pass: ok: <path>`, and 2d is quoted as `got: ...`. Report row 3 says "seven `PASS:` lines" without quoting them.
- utils/check_rule_inventory.py:214: errors are sorted as (0, message) strings, so the uncovered lines print in string order: old line 12, 14, 15, 17, 2, 20, 22, 3. The probe output shows this.
- utils/check_rule_inventory.py:134/163: an inventory or new file that is not UTF-8 raises a traceback (`UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff`) instead of an `<inventory>:<line>:` error. check_skill_layout.py:222-225 handles the same case with an error line.
- Inputs handled correctly: CRLF line endings (`ok:`), a multi-line description (lines 3-5 reported uncovered), list continuation and table rows (reported uncovered), the range `5 - 7` (rejected), a closing-hash section named without the hashes, and an escaped pipe (rejected, see Standards).

## 3. Standards

- utils/check_rule_inventory.py:154: the untrusted commit value reaches `git show` as an option. With `- Old: \`x\` at \`--output=$S/pwned\``, the check wrote the file `pwned:x` into the scratch directory. docs/dev/change-standard.md rule 15 says a value a file supplies is untrusted where it reaches a command.
- utils/check_rule_inventory.py:157: `os.path.join(root, new[0])` lets an absolute or `../` New path escape the repository. `- New: \`<scratch>/outside.md\`` printed `ok:`. Change-standard rule 15 covers a value that reaches a path.
- utils/check_rule_inventory.py:123: a Rule cell holding an escaped pipe (`a \| b`) is split into 4 cells and fails with `a row has 4 cells, not 3`. Quoted rules often hold shell pipes (`2>&1 | tail -1`), and GFM allows `\|`. Change-standard rule 15 says edges are exercised; this edge is neither handled nor tested.
- utils/check_rule_inventory.py:40: the comment "The fence and item reading matches utils/check_skill_layout.py" is false in three places:
  - check_skill_layout.py has no item counting.
  - It reads fences only after the frontmatter (`mark_fences(lines, start, ...)`), where this check reads them from line 0.
  - It reports an unclosed fence as an error, which this check does not.

  Brief decision 2 and change-standard rule 14 cover a sentence the change makes false.
- utils/check_rule_inventory.py:208-210: with no arguments the check exits 2. The docstring (lines 28-29) and README state only exit 1. This breaks change-standard rule 5.

## 4. Behaviour

- The step adds a new command, `python3 utils/check_rule_inventory.py <inventory>...`, and the test line in README.md, docs/dev/building.md and docs/dev/change-standard.md. The report has no user-visible-changes section with before and after, which change-standard rule 7 requires. It lists the files only.
- The no-argument exit code 2 and the `:0:` line number on uncovered-line errors are user-visible output forms. The report states the `:0:` choice but not exit 2.

## Not checked

- The README.md bullet was not compared word for word against every error form the check prints.
- The check was not run on real `skills/*/SKILL.md` files at 84ce1f7, since no inventory exists yet.

Reviewer usage: 17 tool uses, about 25 minutes.

## Repair round 1, refuted

```
$ git status --short            (in .agents/worktrees/1-3, HEAD f157b94)
 M README.md
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? utils/check_rule_inventory.py
?? utils/check_rule_inventory.test.sh
$ wc -l utils/check_rule_inventory.py utils/check_rule_inventory.test.sh
     351 utils/check_rule_inventory.py
     330 utils/check_rule_inventory.test.sh
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as in docs/dev/building.md)
(no output) exit 0
Reverts on a copy in $TMPDIR/refute3r.vzFFod, reproduced red:
item < 1 dropped:            FAIL: item-zero: expected an error, got a pass: ok: .../ledger/item-zero.md
subsection items added to section: FAIL: section-own-items: expected an error, got a pass: ok: .../ledger/section-own-items.md
frontmatter guard dropped:   FAIL: yaml-comment: expected an error, got a pass: ok: .../ledger/yaml-comment.md
separator i-2 test dropped:  FAIL: dash-row: expected an error, got a pass: ok: .../ledger/dash-row.md
unescaped-pipe split -> split("|"): .../ledger/escaped-pipe.md:0: old line 9 is in no row: The skill does the thing.
hex check dropped:           FAIL: branch-commit: missing [the old commit 'oldbranch' is not a hexadecimal commit id] in: .../branch-commit.md:3: no commit oldbranch in the repository
block check dropped:         FAIL: two-items: expected an error, got a pass: ok: .../ledger/two-items.md
tilde line inside fence as fence line: FAIL: tilde-in-fence: expected an error, got a pass: ok: .../ledger/tilde-in-fence.md
startswith(commit) dropped:  FAIL: branch-named-like-a-commit: expected an error, got a pass: ok: .../branch-named-like-a-commit.md
inside() always true:        FAIL: escaping-new: missing [the new path '../outside.md' is not a relative path inside the repository] in: .../escaping-new.md:4: the new file ../outside.md does not exist
fence close length dropped:  FAIL: rules-three: expected an error, got a pass: ok: .../ledger/rules-three
info-string rule dropped:    .../inline-backticks.md:15: item 3 of 'Rules' does not exist; it has ...
"## " closing hashes kept:   .../closing-hashes.md:15: no section '## Rules' in skills/demo/SKILL....
table-end error dropped:     FAIL: second-table: expected an error, got a pass: ok: .../second-table...
Reverts that stay green:
"### " closing hashes kept (line 139):                        PASS: check_rule_inventory.py scratch tests
second '- New:' not checked (line 253):                        PASS: check_rule_inventory.py scratch tests
old file not UTF-8 -> raise (line 289):                        PASS: check_rule_inventory.py scratch tests
not in a git repository -> SystemExit(3) (line 264):           PASS: check_rule_inventory.py scratch tests
line after header skipped whether or not a separator (line 200): PASS: check_rule_inventory.py scratch tests
separator not excluded from openers in a range (line 232):     PASS: check_rule_inventory.py scratch tests
fenced lines counted as openers in a range (line 232):         PASS: check_rule_inventory.py scratch tests
separator after a fenced line (line 91, flags[i-1]):           PASS: check_rule_inventory.py scratch tests
path starting with "-" allowed (line 215):                     PASS: check_rule_inventory.py scratch tests
"### " before any "## " counted (line 138):                    PASS: check_rule_inventory.py scratch tests
trailing "\|" guard dropped (line 176):                        PASS: check_rule_inventory.py scratch tests
Probe repository $TMPDIR/refute3r.vzFFod/probe, old s/SKILL.md at 3e03bda (35 lines), check = unmodified copy:
rows 2-7 (whole frontmatter), 12-13, 17-20 (item + two nested bullets), 22, 24, 26, 28, 29, 31-35 (paragraph, fence, paragraph) -> ok: l/a.md  exit 0
honest one-rule-per-row inventory (19 and 20 separate, 26-27 header+separator, 32-34 fence) -> ok: l/h.md  exit 0
same "### Mode" under "## Rules" (1 item) and "## Other" (2 items): Rules / Mode 2 and Other / Mode 3 -> both errors, Rules / Mode 1 and Other / Mode 2 pass
"- top", "  - nested", "1) paren item", "+ plus item" under "## Nest", place "Nest 2" -> l/n.md:21: item 2 of 'Nest' does not exist; it has 1
old file not UTF-8 -> l/u.md:3: the old file is not UTF-8: invalid start byte  exit 1
new file not UTF-8 -> l/u2.md:4: the new file is not UTF-8: invalid start byte  exit 1
$ grep -c <case> utils/check_rule_inventory.test.sh
fenced-item: 0   fenced-line-uncovered: 0   bad-commit: 0   second-new: 0
```

- utils/check_rule_inventory.py:56 and 232: the closure of "one row could cover the whole file" (plan.md:49 ruling: at most one line opening a list item) is incomplete. ITEM matches only unindented `- `, `* ` and `N. `. A nested bullet (`   - nested rule one`) does not count as an opener, and neither does a `+ ` or `N) ` item. The probe row `| 17-20 | item with two nested rules | Steps 1 |` covers a parent item and two nested bullets, each its own rule, and prints `ok: l/a.md`. So a restyle can drop a nested rule while the inventory still passes. Spec.
- utils/check_rule_inventory.py:222-236: a range may run across a fence's boundary into the next paragraph. The ruling asks that a range stay inside one block. `| 31-35 | two paragraphs around a fence | Steps |` covers "Rule before a fence.", the fenced block and "Rule after a fence.", with no blank lines between them. That is three blocks and two rules, and the check prints `ok:`. The closing `---` of the frontmatter is not a block boundary either (line 230 skips the whole frontmatter, index <= end). Spec.
- utils/check_rule_inventory.py:228-233 and 113-114: the block rule does not apply inside the frontmatter. `| 2-7 | all frontmatter | Steps |` covers name, the folded description (with its trigger phrases) and metadata.version in one row, and the check prints `ok:`. The test's own complete inventory depends on this: check_rule_inventory.test.sh:100 has `| 2-4 | The name, the comment and the description | Steps |`. This does not meet the plan.md:49 ruling of one rule per row. Spec.
- utils/check_rule_inventory.py:145 against the docstring at 25-26: the docstring says only "top-level" items are counted. Table rows are counted after `lstrip`, so an indented table inside a list item counts as an item of the section. In the probe's new file, `## Steps` holds `1. Item one.` and an indented table with one body row. The check counts 2, and `Steps 2` passes, naming a row nested in item 1. `1) ` and `+ ` items are not counted at all: `Nest 2` fails with "it has 1" against the probe's `+ plus item`. Behaviour.
- utils/check_rule_inventory.test.sh (whole file): the round's claim "each has a case now" is reproduced for the ten reverts of the first review. Eleven code paths that the round added or kept have no case, and their reverts stay green (listed above). This breaks change-standard rule 13. The ones tied to closures the round claims:
  - the second `- New:` line (the report cites only case second-old for "two Old or New lines");
  - the old-file and new-file UTF-8 errors (the report claims "an error line for the inventory, the old file and the new file", but the test covers only the inventory; the probe shows both work, untested);
  - the separator requirement after the inventory header (line 200). A revert there silently skips the first data row of an inventory that has no separator row, which is the defect class of the first review's header finding.
  - the `### ` closing-hash strip;
  - the old-path half of `inside()`. README.md's new bullet claims "an old or new path outside the repository", but only New is tested.

  Proof.
- 3-report.md:7-40 against the tree: the part of the report above "Repair round 1" still describes the state before the round. It gives `check_rule_inventory.py` as 224 lines and the test as 190, where `wc -l` gives 351 and 330. It names cases that no longer exist (`grep -c` gives 0 for fenced-item, fenced-line-uncovered and bad-commit). It quotes 2d as `got: ...`. It also keeps the judgment call "An item number counts top-level items only", which the round's line 145 contradicts. Change-standard rule 7 says the report states the end state only. Proof.
- 3-report.md, Repair round table, row "Proof: ten reverts stayed green": the ten reverts listed there are closed. My reruns of fence close length, info string, `## ` closing hashes, the frontmatter guard and the table end all went red, as the table quotes. The row does not say that the round's new code carries the untested paths above. Proof.

Reviewer usage: 14 tool uses, about 20 minutes.

## Closed

Round 1's findings are closed in the round, each with its revert in `3-report.md`. The findings of the run over round 1, the last round, are closed at landing, each with the revert that now turns the test red:

- Nested items, `+` and `1)` items were not counted as items in a range: a range counts list items at any depth and with any marker. `FAIL: nested-in-range: expected an error, got a pass` with the old markers restored; case other-markers.
- A range could cross a fence boundary or a frontmatter delimiter: each fenced block and each delimiter is a block of its own. `FAIL: blocks-complete: expected a pass` when the fence joins the paragraph; `FAIL: across-delimiter: expected an error, got a pass` when the delimiter is not a block; case across-fence.
- The block rule did not apply in the frontmatter: frontmatter keys and comments are items, so one row covers one key; the complete inventory names lines 2, 3 and 4 in separate rows. `FAIL: frontmatter-keys: expected an error, got a pass`.
- Indented tables counted as items, and `+` and `1)` items did not: only unindented table rows and top-level items of any marker count. `FAIL: list-items-counted: expected an error, got a pass`; `FAIL: blocks-complete: expected a pass` with `+` and `1)` not counted.
- Eleven paths without a case: `###` closing hashes (`FAIL: blocks-complete`), the second `- New:` (`FAIL: second-new`), the old and new file not UTF-8 (`FAIL: old-not-utf8`, `FAIL: new-not-utf8`), outside a repository (`FAIL: outside-repo`), the row after an inventory header without a separator (`FAIL: no-separator: expected a pass`), a separator counted as an item in a range (`FAIL: header-and-separator: expected a pass`), fenced lines counted as items in a range (`FAIL: blocks-complete`), a path starting with `-` (`FAIL: dash-path`), a `###` before any `##` (`FAIL: stray-sub`). The guard on the row separator after a fenced line and the guard on a trailing escaped pipe were redundant and are removed, so they carry no code to test.
- The report's part above the round described the state before it: rewritten to the end state, with the line counts as they land (390 and 470), no case that no longer exists, and the judgment calls as the code now reads.

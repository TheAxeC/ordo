# Report: step 7, after repair round 1

Everything in the brief and in the ten rulings of repair round 1 is done. The brief's `__init__.py` case is corrected by ruling 1: `dunder` asserts the bold error. `crlf` is a regression pin, which no revert turns red; its control `crlf-bold` is below.

## Open items of the state file (verbatim)

- none.

## Repair round 1

| Ruling | State | Command and output |
|---|---|---|
| 1. `__init__.py` case | DONE, nothing to change: `dunder` expects "bold outside a list item's label" | `sh utils/check_skill_layout.test.sh 2>&1 \| tail -1`: `PASS: check_skill_layout.py scratch tests` |
| 2. Indented headings in the inventory checker | DONE. `HEADING = ^ {0,3}#{1,6} ` serves `carries_text`, `blocks` and `check_range_block`; `SECTION = ^ {0,3}(##\|###) ` serves `places`. New cases `indented-section` (new file, `  ## Rules`, `   ### Mode A`), `indented-old` (old file `skills/indent`, line 5 `  ## Rules`), and their controls `indented-section-code` and `indented-old-code` (four spaces) | reverts below; `sh utils/check_rule_inventory.test.sh 2>&1 \| tail -1`: `PASS: check_rule_inventory.py scratch tests` |
| 3. Trailing carriage return | DONE: `read_lines` and `split_lines` split on the line feed only, and the carriage return stays in its line. Both module docstrings and both function docstrings say so, and say that the readers strip it | both tests `PASS:` |
| 4. `**` inside a word | DONE: `intraword-stars` (`1. Read foo**bar**baz.`) expects "bold outside a list item's label" | revert below |
| 5. `crlf` | DONE: its comment says it is a regression pin that no revert turns red, with `crlf-bold` (an error in a CRLF file at its `grep -n` line) as its control | control output below |
| 6. Controls of the silent cases | DONE | table below |
| 7. README line 128 | DONE: "with the bold error at the line `grep -n` gives when an earlier line holds a line separator or a lone carriage return" | `README.md:128` |
| 8. Lone carriage return in the old file | DONE: old file `skills/cr` with a CR inside line 7, and `old-return` passes | revert below |
| 9. Docstring line 26 | DONE: the Old lines paragraph and the New place paragraph rewrapped to 100 characters or fewer | `utils/check_rule_inventory.py` lines 24-35 |
| 10. User-visible changes | DONE: in the table "User-visible changes", each backed by a case | cases `indented-second-title`, `indented-stray`, `indented-heading-bold`, `version-indented`, `stops-second-table` |

## Controls of the silent cases (ruling 6)

Each control was made to expect a pass for one run, with `fail` made non-exiting, to print its output; both were then restored. Command: `sh utils/check_skill_layout.test.sh 2>&1`.

| Silent case | Control | Control's output |
|---|---|---|
| `intraword` (`foo__bar__baz`) | `underscore-bold` (`__whole__`), `dunder` | `.../underscore-bold/SKILL.md:30: bold outside a list item's label`; `.../dunder/SKILL.md:30: bold outside a list item's label` |
| `version-control` (`rev2 1.2`) | `version-word`, `version-bare` | `.../version-word/SKILL.md:33: version tag in heading: ## The file format v2`; `.../version-bare/SKILL.md:33: version tag in heading: ## The file format 1.2.0` |
| `indented-heading`, `indented-heading-three` | `indented-code` (four spaces) | `.../indented-code/SKILL.md:52: section 'Rules' is missing` |
| `indented-code` | asserts an error, so it is not silent; it is the control of the two cases above, which pass with one to three spaces | as above |
| `bom` | `bom-wrong-name` (BOM and a wrong name) | `.../bom-wrong-name/SKILL.md:1: name is 'other', the folder is 'bom-wrong-name'` |
| `crlf` (regression pin) | `crlf-bold` | `.../crlf-bold/SKILL.md:30: bold outside a list item's label` |
| `underscore-label` (`- __Paths.__ x`) | `underscore-bold` | `.../underscore-bold/SKILL.md:30: bold outside a list item's label` |

Inventory silent cases carry their controls in the test: `indented-section-code` prints `no section '## Rules' in skills/demo/SKILL.md`, and `indented-old-code` prints `indented-old-code.md:0: old line 5 is in no row: ## Rules`.

## The cases' first run (unchanged checkers, from the first build)

- Layout, failing on the unchanged tree: `line-separator` and `lone-return` (error at line 31, not 30), `bom` (`no frontmatter between two --- lines`), `indented-heading` (`no '# ' title after the frontmatter`), `indented-heading-three` (`section 'Rules' is missing`), `stops-no-row`, `use-no-row`, `anti-no-row`, `version-word`, `version-bare`, `version-indented`, `top-version` (each passed), `empty-frontmatter` (`frontmatter is a NoneType, not a mapping`), `intraword` and `dunder` (bold error).
- Layout, passing on the unchanged tree: `crlf`, `glob-stars`, `indented-code`, `version-control`, `underscore-label`, `extra-column`, `latin`.
- Inventory, failing on the unchanged tree: `old-separator` (`:11: old lines 9-9 hold a blank line at 9`), `inventory-separator` and `inventory-return` (`a table row after the inventory's table has ended`), `new-separator` and `new-return` (passed), `old-folder` (ten errors against a tree listing), `outside-line` (`old lines 30 lie outside ... or run backwards`).
- Inventory, passing on the unchanged tree: `sibling-new`, `uncovered`, `longest-section`.

## Result table (brief)

| Item | State | Command and output |
|---|---|---|
| 1. `check_skill_layout.py` fixes and docstring | DONE | `sh utils/check_skill_layout.test.sh 2>&1 \| tail -1`: `PASS: check_skill_layout.py scratch tests` |
| 2. Layout test cases, finding 7 | DONE | same; reverts below |
| 3. `check_rule_inventory.py` fixes and docstring | DONE | `sh utils/check_rule_inventory.test.sh 2>&1 \| tail -1`: `PASS: check_rule_inventory.py scratch tests` |
| 4. Inventory test cases, finding 3 | DONE | same; reverts below |
| 5. README bullets, one sentence each | DONE | `README.md:128-129` |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: twelve `PASS:` lines, ten `ok:` lines, `verify: 14 commands passed`, exit 0 |
| Verify 2 | DONE | `python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md`: ten `ok:` lines, exit 0 |
| Verify 3 | DONE | every revert below was rerun on the tree after the round, made in place and restored; both tests `PASS:` after the last restore |

## Reverts and their first FAIL: line (all run on the tree after round 1)

Layout, `sh utils/check_skill_layout.test.sh 2>&1`:

| Revert | First FAIL: line |
|---|---|
| `read_lines` returns `splitlines()` | `FAIL: line-separator: missing [SKILL.md:30: bold outside a list item's label] in: .../line-separator/SKILL.md:31: bold outside a list item's label` |
| `newline=""` removed | `FAIL: lone-return: missing [SKILL.md:30: ...] in: .../lone-return/SKILL.md:31: bold outside a list item's label` |
| `utf-8` in place of `utf-8-sig` | `FAIL: bom: expected a pass, got: .../bom/SKILL.md:1: no frontmatter between two --- lines` |
| `BOLD` back to `\*\*\|__` | `FAIL: intraword: expected a pass, got: .../intraword/SKILL.md:30: bold outside a list item's label` |
| `**` given the `__` word rule (ruling 4) | `FAIL: intraword-stars: expected an error, got a pass: ok: .../intraword-stars/SKILL.md` |
| `HEADING` at column 0 | `FAIL: indented-heading: expected a pass, got: .../indented-heading/SKILL.md:8: no '# ' title after the frontmatter` |
| `split_sections` at column 0 only | `FAIL: indented-heading: expected a pass, got: .../indented-heading/SKILL.md:8: no '# ' title after the frontmatter` |
| `check_title` second-title test at column 0 only | `FAIL: indented-second-title: expected an error, got a pass: ok: .../indented-second-title/SKILL.md` |
| `check_headings_and_bold` at column 0 only | `FAIL: indented-heading-bold: missing [bold in a heading] in: .../indented-heading-bold/SKILL.md:33: bold outside a list item's label` |
| no-row check disabled | `FAIL: stops-no-row: expected an error, got a pass: ok: .../stops-no-row/SKILL.md` |
| separator not skipped | `FAIL: stops-no-row: expected an error, got a pass: ok: .../stops-no-row/SKILL.md` |
| every `\|` line of the section read | `FAIL: stops-second-table: expected an error, got a pass: ok: .../stops-second-table/SKILL.md` |
| `VERSION_TAG` word part back to `\bv\d+\.` | `FAIL: version-word: expected an error, got a pass: ok: .../version-word/SKILL.md` |
| `VERSION_TAG` without the bare part | `FAIL: version-bare: expected an error, got a pass: ok: .../version-bare/SKILL.md` |
| top-level `version` check disabled | `FAIL: top-version: expected an error, got a pass: ok: .../top-version/SKILL.md` |
| empty-frontmatter branch removed | `FAIL: empty-frontmatter: missing [SKILL.md:1: frontmatter is empty] in: .../SKILL.md:1: frontmatter is a NoneType, not a mapping` |
| `LABEL` without `__` (finding 7) | `FAIL: underscore-label: expected a pass, got: .../underscore-label/SKILL.md:51: bold outside a list item's label` |
| header `cells[:len(want)] != want` (finding 7) | `FAIL: extra-column: expected an error, got a pass: ok: .../extra-column/SKILL.md` |
| `except UnicodeDecodeError` removed (finding 7) | a traceback, then `FAIL: latin: missing [latin/SKILL.md:0: not UTF-8] in:` |

The `split_sections`, `check_title` and `check_headings_and_bold` reverts were run in round 1. The other layout reverts were run again after the round.

Inventory, `sh utils/check_rule_inventory.test.sh 2>&1`:

| Revert | First FAIL: line |
|---|---|
| inventory lines `splitlines()` | `FAIL: inventory-separator: expected a pass, got: .../inventory-separator.md:13: a table row after the inventory's table has ended` |
| `read_text` without `newline=""` | `FAIL: inventory-return: expected a pass, got: .../inventory-return.md:13: a table row after the inventory's table has ended` |
| new file lines `splitlines()` | `FAIL: new-separator: expected an error, got a pass: ok: .../new-separator.md` |
| old file lines `splitlines()` | `FAIL: old-separator: expected a pass, got: .../old-separator.md:11: old lines 9-9 hold a blank line at 9; a range stays inside one block` |
| old file split on `\r\n?\|\n` (ruling 8) | `FAIL: old-return: expected a pass, got: .../old-return.md:11: old lines 9-9 hold a blank line at 9; a range stays inside one block` |
| `HEADING` at column 0 (ruling 2) | `FAIL: indented-old: expected a pass, got: .../indented-old.md:0: old line 5 is in no row: ## Rules` |
| `SECTION` at column 0 (ruling 2) | `FAIL: indented-section: expected a pass, got: .../indented-section.md:11: no subsection '### Mode A' under '## Steps' in skills/demo/SKILL.md` |
| blob check disabled | `FAIL: old-folder: missing [old-folder.md:3: the old path is not a file in that commit] in: .../old-folder.md:8: old lines 2-2 hold a blank line at 2; a range stays inside one block` |
| singular message disabled | `FAIL: outside-line: missing [outside-line.md:17: old line 30 lies outside the old file's 1-24] in: .../outside-line.md:17: old lines 30 lie outside the old file's 1-24 or run backwards` |
| `inside()` as `startswith(real_root)` (finding 3) | `FAIL: sibling-new: expected an error, got a pass: ok: .../sibling-new.md` |
| uncovered lines at line 1 (finding 3) | `FAIL: uncovered: missing [uncovered.md:0: old line 14 is in no row: 2. Writes the output.] in: .../uncovered.md:1: old line 14 is in no row: 2. Writes the output.` |
| sections sorted shortest first (finding 3) | `FAIL: longest-section: missing [no subsection '### more' under '## Inputs / outputs'] in: .../longest-section.md:13: no subsection '### outputs / more' under '## Inputs' in skills/demo/SKILL.md` |

The `HEADING`, `SECTION` and old-file `\r` reverts were run in round 1; the rest were run again after the round.

Two cases have no revert that turns them red:
- `crlf` is a regression pin (ruling 5), with its control `crlf-bold`.
- `new-return` shares `read_text` with the inventory, so the `newline=""` revert fails first at `inventory-return`.

## Files

| File | Lines (base, now) |
|---|---|
| `utils/check_skill_layout.py` | 264, 316 |
| `utils/check_skill_layout.test.sh` | 291, 410 |
| `utils/check_rule_inventory.py` | 393, 427 |
| `utils/check_rule_inventory.test.sh` | 479, 584 |
| `README.md` | 179; lines 128-129 rewritten in place |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/7-report.md` | this report |

Round 1 changed all five of these files.

## User-visible changes

| Check | Before | After |
|---|---|---|
| layout, empty frontmatter | `frontmatter is a NoneType, not a mapping` | `frontmatter is empty` |
| layout, top-level `version:` | passes | `a top-level version key; the version lives in metadata.version only` |
| layout, a Stops, Use instead or Anti-patterns table with no row after its separator | passes | `<Section> table has no row after its separator`, read on the first table of the section (a second table with rows does not count) |
| layout, `## ... v2`, `## ... 1.2.0` | pass | `version tag in heading: ...` |
| layout, `foo__bar__baz` | bold error | passes |
| layout, BOM file | `no frontmatter between two --- lines`, `text before the title` | passes |
| layout, `  ## Rules` | `section 'Rules' is missing` | passes |
| layout, an indented second `# ` heading (`  # Appendix`) | passes | `a second '# ' heading: # Appendix` |
| layout, an indented `## ` heading outside the reference place (` ## Background` before Use instead) | passes | `section 'Background' is outside the place between Steps and Stops` |
| layout, a version tag in an indented heading (`  ## The file format v2`) | passes | `version tag in heading: ## The file format v2` |
| layout, bold in an indented heading (`  ## The **file** format`) | `bold outside a list item's label` | `bold in a heading` |
| layout, a line separator or lone CR in a line | later errors one line late | the `grep -n` line |
| inventory, old path a folder | range and coverage errors against a tree listing | one error, `the old path is not a file in that commit` |
| inventory, one-line row outside the file | `old lines 30 lie outside the old file's 1-24 or run backwards` | `old line 30 lies outside the old file's 1-24` |
| inventory, a line separator or lone CR in any of the three files | extra lines, false errors | read as part of the line |
| inventory, a heading indented by up to three spaces in the new file | its section unknown to places (`no section '## Rules'`) | a section |
| inventory, the same in the old file | `old line <n> is in no row` | carries no text |

## Judgment calls

- A path missing from the commit keeps "git show ... failed: the path is not in that commit". The blob check runs after `git show` succeeds.
- A table with no separator line counts every row after its header as a body row.
- The one-line blank-line message still reads `old lines 9-9 hold a blank line at 9`; only "lie outside" has a singular form.
- The refuter's report `agents/reviews/7-refuter.md` is not in the worktree's ledger copy, and the main checkout is outside this run's reach. The round was built from the rulings as written in the round's instructions.

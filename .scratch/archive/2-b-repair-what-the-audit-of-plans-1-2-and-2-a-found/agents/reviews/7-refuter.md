# Refutation: step 7

On .agents/worktrees/2b-7, base f4dd5e8; reviewer claude:opus, a fresh agent, a70fea5f0ba522233.

Review of step 7, plan 2.B (worktree `.agents/worktrees/2b-7`, diff against f4dd5e8)

## 1. Verification lines, verbatim

I ran `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` from the worktree root:
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 14 commands passed
exit 0
```
This is 12 PASS lines, 10 ok lines and 14 commands.

I ran `env -u ... python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md`. It printed ten `ok:` lines (land, ordo-init, plan-help, plan-orchestration, plan-retro, plan, refute, repo-setup, roadmap, spec) and `exit 0`.

**Reverts.** Each revert was made on a copy of the four files under my scratchpad (`$S/rv-<name>/`) and ran that copy's test. The first FAIL/PASS line of each:
- L1 `read_lines` returns `text.splitlines()`: `FAIL: line-separator: missing [SKILL.md:30: bold outside a list item's label] in: .../line-separator/SKILL.md:31: ...`
- L2 `newline=""` removed: `FAIL: lone-return: missing [SKILL.md:30: ...] in: .../lone-return/SKILL.md:31: ...`
- L3 `utf-8-sig` changed to `utf-8`: `FAIL: bom: expected a pass, got: .../bom/SKILL.md:1: no frontmatter between two --- lines`
- L4 `BOLD` set back to `\*\*|__`: `FAIL: intraword: expected a pass, got: .../intraword/SKILL.md:30: bold outside a list item's label`
- L5 `HEADING` set back to `^(#{1,6}) `: `FAIL: indented-heading: expected a pass, got: .../SKILL.md:8: no '# ' title after the frontmatter`
- L6 `VERSION_TAG` word part set back to `\bv\d+\.`: `FAIL: version-word: expected an error, got a pass`
- L7 empty-frontmatter branch removed: `FAIL: empty-frontmatter: missing [SKILL.md:1: frontmatter is empty] in: ...frontmatter is a NoneType, not a mapping`
- L8 `body = rows[1:]`: `FAIL: stops-no-row: expected an error, got a pass`
- L9 trailing CR kept (`return text.split("\n")`): `PASS: check_skill_layout.py scratch tests`
- L10 `**` given the `__` word rule (`(?<!\w)(?:\*\*|__)|(?:\*\*|__)(?!\w)`): `PASS: check_skill_layout.py scratch tests`
- L11 `HEADING` `^ {0,4}`: `FAIL: indented-code: expected an error, got a pass`
- L12 `VERSION_TAG` `v\d+\b|\b\d+\.\d+(?:\.\d+)?\b`: `FAIL: version-control: expected a pass, got: ...:33: version tag in heading: ## The file format rev2 1.2`
- L13 top-level version check removed: `FAIL: top-version: expected an error, got a pass`
- L14 `LABEL` without the `__` alternative: `FAIL: underscore-label: expected a pass, got: ...:51: bold outside a list item's label`
- L15 `cells[:len(want)] != want`: `FAIL: extra-column: expected an error, got a pass`
- I1 old lines through `.splitlines()`: `FAIL: old-separator: expected a pass, got: ...old-separator.md:11: old lines 9-9 hold a blank line at 9; ...`
- I2 blob check disabled: `FAIL: old-folder: missing [old-folder.md:3: the old path is not a file in that commit] in: ...:8: old lines 2-2 hold a blank line at 2; ...`
- I3 singular message disabled: `FAIL: outside-line: missing [outside-line.md:17: old line 30 lies outside the old file's 1-24] in: ...old lines 30 lie outside ... or run backwards`
- I4 `inside()` as `startswith(real_root)`: `FAIL: sibling-new: expected an error, got a pass`
- I5 sections sorted shortest first: `FAIL: longest-section: missing [no subsection '### more' under '## Inputs / outputs'] in: ...no subsection '### outputs / more' under '## Inputs' ...`
- I6 trailing CR kept in `split_lines`: `PASS: check_rule_inventory.py scratch tests`
- I7 new-file lines through `.splitlines()`: `FAIL: new-separator: expected an error, got a pass`
- I8 uncovered lines reported at line 1: `FAIL: uncovered: missing [uncovered.md:0: old line 14 is in no row: ...] in: ...uncovered.md:1: ...`

Every revert the report names that I sampled (L1-L8, L13-L15, I1-I5, I7, I8) reproduces the report's first FAIL line. L9 and I6 reproduce the report's PASS.

**No revert left in the tree.** `fail()` in both tests is `printf ...; exit 1` (lines 7-10). `git status --short` shows only the four modified files and the untracked report. The current code holds every fix. Both suites pass in the verify run.

## 2. Findings

### Spec

1. **The case is inverted in the test and asserted in the docstring and README.** The brief's case `1. Read the input from __init__.py.`, which expects no bold error, is now the opposite assertion:
   - `utils/check_skill_layout.test.sh:280-282`: `edit dunder "1. Read the input." "1. Read the input from __init__.py."` / `expect_error dunder "bold outside a list item's label"`
   - `utils/check_skill_layout.py:24-27`: "__init__.py is, as a renderer shows it, and belongs in a code span"
   - README.md:128: "bold outside a label (`__init__.py` outside a code span included)"

   Change-standard rule 4 says the substitute for a wrong premise is the orchestrator's to write. The builder wrote its own option (a) into the test, the docstring and the README before any ruling. The report does raise it as a decision. **Verdict on the case:**
   - **CommonMark renders a strong emphasis there.** `markdown_it.MarkdownIt('commonmark')` (markdown-it-py 4.0.0) and `pandoc -f commonmark` both render `1. Read the input from __init__.py.` as `Read the input from <strong>init</strong>.py.`.
   - **Why, by the flanking rules.** The first `__` has a space before it and `i` after it, so it is left-flanking only and can open. The second has `t` before it and `.` after it, so it is right-flanking only and can close.
   - **The case is wrong and the rule is right.** The brief's rule, "`__` is bold only when not between word characters", gives bold here, as CommonMark does.
   - **The same renderers on the other cases.** `foo__bar__baz` is not bold, which matches `intraword`. `docs/**/*.md` is not bold in either renderer, so the `glob-stars` case holds `**` to a stricter rule than rendering. The brief chose that ("`**` stays bold everywhere"), and it is not a defect of the build. It does mean that "as a renderer shows it" justifies the `__` rule only, not the `**` one.
   - **Consequence.** If the orchestrator rules (a), the test, docstring and README need no change.

2. **Indented headings reach one checker and not the other.** `utils/check_rule_inventory.py:148` (`if line.startswith("## "):`), `:152` (`line.startswith("### ")`) and `:67` (`HEADING = re.compile(r"^#{1,6} ")`) still read headings at column 0 only. The layout checker now accepts `  ## Rules` (`HEADING = re.compile(r"^ {0,3}(#{1,6}) ")`). A SKILL.md with an indented section heading therefore passes the layout check, while an inventory row naming that section gets "no section '## Rules'". Both files are in this step's paths, and change-standard rule 14 says a changed construct carries to every place that names it. The report's rule-14 grep searched for message strings, not for heading matching.

### Proof

1. **The trailing carriage return has no red case, and cannot have one.** I checked the builder's claim:
   - **The revert stays green.** L9 and I6 above both print PASS.
   - **No input separates the two versions.** I ran a differential over 4000 generated SKILL.md files (CRLF, LF, a trailing lone CR, and inserted `__x__`, `**y**`, ` v2`, `1.2.0`, table rows, fences, indented headings). It compared `check_file` of the current `utils/check_skill_layout.py` against the copy with the CR kept, and printed `cases 4000 diffs 0`.
   - **Why.** Every reader of a line strips it or ends its pattern in `\s*`:
     - layout: `split_frontmatter` `.strip()`, `heading()` `.strip()`, `SEPARATOR ...\s*$`, table cells `.strip()`, `first_table` `lstrip()`, and `line.strip()` in every message that quotes a line
     - inventory: `OLD`/`NEW` `\s*$`, `carries_text` and `blocks` `.strip()`, `places` names `.strip()`, `split_cells` `.strip()`, and the uncovered message `.strip()`
     - YAML: PyYAML reads `\r\n` and a lone `\r` as a line break.
   - **The case that would turn it red.** No case run through either checker's command line can. Only a direct assertion on `read_lines`/`split_lines` would, for example `read_lines` on a CRLF file compared with the LF list. By rule 13 that is an audit of a helper, not a proof.
   - **Consequence.** The drop is output-neutral code that the brief's fix text asks for. The docstrings (`check_skill_layout.py:31`, `check_rule_inventory.py:47-48`) describe it truthfully. Keeping it or removing it (rule 11) is the orchestrator's call, as the report says.

2. **The `**` case catches no mutation of its rule.** The brief asks that "`**` stays bold everywhere outside code". Its only case is `glob-stars` (`utils/check_skill_layout.test.sh:283-285`, `1. Read docs/**/*.md.`), and the report names no revert for it. Revert L10 extends the `__` word rule to `**` and leaves the suite green (`PASS`). A case `1. Read foo**bar**baz.` expecting "bold outside a list item's label" would turn L10 red. I probed it on a scratch SKILL.md: the current checker printed `...SKILL.md:137: bold outside a list item's label`, and the L10 copy printed `ok: ...`.

3. **The `crlf` case is green under every revert.**
   - The claim: report line 118 lists `crlf` among the cases that "exist so that each part of each fix has a revert that turns a case red".
   - Under the CR-drop revert (L9) it passes.
   - Without `newline=""`, Python's text mode turns CRLF into LF, so it passes there too. The report's first-run table already shows it passing on the unchanged tree.
   - So it is a regression pin, not a proof, and the report's sentence about it is false.

4. **The silent cases carry no quoted control output.** `intraword`, `version-control`, `indented-code`, `bom`, `crlf`, `indented-heading(-three)` and `underscore-label` assert that a rule stays silent. Change-standard rule 13 asks that each one's control output be quoted beside it, and the report quotes none.
   - Controls exist for three of them, and I confirmed each: `indented-code` goes red under L11, `version-control` under L12, and `underscore-bold` (pre-existing) is the named control for `intraword`.

### Standards

1. **README.md:128 overclaims the layout test.** It says: "..., and a file that is not UTF-8, each error at the line `grep -n` gives when an earlier line holds a line separator or a lone carriage return". The test checks this for one error only, the bold error (`line-separator` and `lone-return`, `utils/check_skill_layout.test.sh` near lines 344-353). "Each error" is false (rule 14, a sentence the change makes false).

2. **README.md:129 overclaims the inventory test.** It says: "a line separator or a lone carriage return inside a line of the old file, the new file or the inventory read as part of that line". The old file is tested with a U+2028 only (`utils/check_rule_inventory.test.sh:77`, `skills/sep`). No case puts a lone CR in the old file (`grep -n printf` shows `\r` only at lines 379 and 388, both in the inventory and the new file).

3. **A docstring line was not rewrapped.** `utils/check_rule_inventory.py:26` is 123 characters: `  inside one block: it holds no blank line and no heading, crosses no frontmatter delimiter and no fence boundary (a fenced`. The text was inserted into the paragraph without rewrapping it, against the brief's convention "lines of about 100 characters at most". Other new lines over 100 (test `edit` lines up to 176 characters, and f-string error lines) follow the existing files, which already had 9, 17, 23 and 21 such lines at the base.

Nothing else: `LC_ALL=C grep -n '[^ -~]'` over the five changed files printed nothing, and no history appears in the comments or docstrings.

### Behaviour

1. **The report does not state the new errors on indented headings.** Its user-visible table covers indented headings only as "layout, BOM file, indented heading | false errors | pass". The change also makes previously passing text fail.
   - **Before.** The base checker (rebuilt by `patch -R` of `git diff f4dd5e8`) on `skills/land/SKILL.md` renamed `k`, with `  # Second title` and `   ### Format v2` appended, printed `ok: .../k/SKILL.md`.
   - **After.** The current checker prints:
     - `...:137: a second '# ' heading: # Second title`
     - `...:139: version tag in heading: ### Format v2`
   - **Also affected.** For the same reason, an indented `## X` outside the reference place, and bold in an indented heading, now fail.

2. **The table check reads only the first table of a section.** `first_table`, `utils/check_skill_layout.py:258-266`, reads the first run of adjacent `|` lines. Before, the header check took the section's first `|` line and nothing looked past it. The only new effect is the no-row error. The report states this under judgment calls, not as a user-visible change. It is minor.

## 3. Not checked

- These reverts from the report were not run by me:
  - layout: "every `|` line of the section read in place of the first table" (`stops-second-table`)
  - layout: "`except UnicodeDecodeError` removed" (`latin`)
  - inventory: "inventory lines `text.splitlines()`" and "`read_text` without `newline=""`" (`inventory-separator`, `inventory-return`)
  - `version-indented`, `indented-heading-three` and `use-no-row`/`anti-no-row`, each under its own revert (their suites stop at an earlier FAIL)
- The report's first-run table (the cases on the unchanged tree): not reproduced.
- The inventory checker has no differential for the CR drop like the layout one. The conclusion there rests on the list of line readers above and on I6.
- The inventory behaviour for an indented heading in a new file: stated from the code at `check_rule_inventory.py:148,152`, not run, since a scratch git repository was outside my allowed commands.
- The base line counts of the three files other than `check_skill_layout.py` (264).

## 4. Usage

- Commands run: about 22 shell calls, and about 24 full runs of the test suites on scratch copies. Each layout-suite run takes about 3 min 45 s wall time (`time` printed `3:44.68 total`).
- One tool call ran past its 600 s timeout and was moved to the background by the harness. I read its output file once, after its completion notice.
- No file in the worktree or the ledger was written.


# Repair round 1, refuted

On .agents/worktrees/2b-7, round from 114dfca, base f4dd5e8; reviewer claude:opus, a fresh agent, a05c1101d08ecec48.

Review of repair round 1 of step 7, plan 2.B. The worktree is `.agents/worktrees/2b-7`. I read the round's delta with `git diff 114dfca` and the whole step with `git diff f4dd5e8`.

## 1. Verification lines, verbatim

I ran `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` from the worktree root:
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 14 commands passed
exit 0
```
That is 12 PASS lines, 10 ok lines and 14 commands.

I ran `python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md` under the same `env -u` prefix. It printed ten `ok:` lines (land, ordo-init, plan-help, plan-orchestration, plan-retro, plan, refute, repo-setup, roadmap, spec) and `exit 0`.

**Reverts.** I ran 13 reverts, each on a copy of the four `utils` files under my scratch directory. In each copy's test, `fail()` was changed so it does not exit, which makes every FAIL line print. The first FAIL line of each:
- Ruling 2, inventory `HEADING` set to `^#{1,6} `: `FAIL: indented-old: expected a pass, got: .../indented-old.md:0: old line 5 is in no row: ## Rules`
- Ruling 2, inventory `SECTION` set to `^(##|###) `: `FAIL: indented-section: expected a pass, got: .../indented-section.md:11: no subsection '### Mode A' under '## Steps' in skills/demo/SKILL.md`
- Ruling 2, `SECTION` with only its `###` part set back to column 0: the same `indented-section` FAIL.
- Ruling 2, `carries_text` (line 139) only, set to column 0: the same `indented-old` FAIL.
- Ruling 2, `blocks` (line 276) only, set to column 0: `PASS: check_rule_inventory.py scratch tests`, with no FAIL line.
- Ruling 2, the single-heading-row check (line 290) only, set to column 0: `PASS`, with no FAIL line.
- Ruling 2, the range-holds-a-heading check (line 296) only, set to column 0: `PASS`, with no FAIL line.
- Ruling 4, `BOLD = (?<!\w)(?:\*\*|__)|(?:\*\*|__)(?!\w)`: `FAIL: intraword-stars: expected an error, got a pass: ok: .../intraword-stars/SKILL.md`
- Ruling 8, old file split with `re.split(r"\r\n?|\n", ...)`: `FAIL: old-return: expected a pass, got: .../old-return.md:11: old lines 9-9 hold a blank line at 9; a range stays inside one block`
- Ruling 10, layout `HEADING` set to `^(#{1,6}) `: `FAIL: indented-heading: expected a pass, got: .../indented-heading/SKILL.md:8: no '# ' title after the frontmatter`. The later FAIL lines include `indented-second-title`.
- Ruling 10, `split_sections` at column 0 only: `FAIL: indented-heading: ...:8: no '# ' title after the frontmatter`. Its third FAIL line is `FAIL: indented-stray: expected an error, got a pass`.
- Ruling 10, `check_title` second-title test at column 0 only: `FAIL: indented-second-title: expected an error, got a pass: ok: .../indented-second-title/SKILL.md`
- Ruling 10, `check_headings_and_bold` at column 0 only: `FAIL: indented-heading-bold: missing [bold in a heading] in: .../SKILL.md:33: bold outside a list item's label`. The next FAIL line is `version-indented`.

The unreverted control copy printed `PASS` for both suites, with no FAIL line. Every revert the report quotes for this round reproduces its first FAIL line.

**Controls of the silent cases (ruling 6).** I printed the controls' output from a copy of the layout test in which `expect_error` echoes the checker's output:
- `bom-wrong-name`: `SKILL.md:1: name is 'other', the folder is 'bom-wrong-name'`
- `indented-code`: `SKILL.md:52: section 'Rules' is missing`
- `underscore-bold`: `SKILL.md:30: bold outside a list item's label`
- `dunder`: `SKILL.md:30: bold outside a list item's label`
- `version-word`: `SKILL.md:33: version tag in heading: ## The file format v2`
- `version-bare`: `SKILL.md:33: version tag in heading: ## The file format 1.2.0`
- `crlf-bold`: `SKILL.md:30: bold outside a list item's label`

Each one matches the report's table.

**Ruling 3, the carriage return kept in the line.** I compared each checker's output on the same text written with LF and with CRLF line ends:
- Inventory, 3000 generated texts: I compared `places`, `fence_flags`, `separator_rows`, `frontmatter_end`, `carries_text` per line, `blocks`, `check_range_block` over every range up to five lines long, `inventory_rows` and each stripped line. It printed `cases 3000 diffs 0`.
- Layout, 1500 generated files run through `check_file`: `cases 1500 diffs 0`.

**Ruling 10, before and after.** I rebuilt the base checker by applying `git diff f4dd5e8 -- utils/check_skill_layout.py` in reverse to a copy. Base first, then the current checker:
- `  # Appendix`: ok, then `:54: a second '# ' heading: # Appendix`
- ` ## Background`: ok, then `:18: section 'Background' is outside the place between Steps and Stops`
- `  ## The file format v2`: ok, then `:33: version tag in heading: ## The file format v2`
- `  ## The **file** format`: `:33: bold outside a list item's label`, then `:33: bold in a heading`

Every row of the report's table holds.

## 2. Repair round 1, refuted

### Spec

1. **The ruling's premise for bold in an indented heading is wrong, and the report does not say so.**
   - Ruling 10 says that bold in an indented heading "now fail[s] where [it] passed".
   - On the base checker, `  ## The **file** format` already failed, with `bold outside a list item's label`; only the message changed.
   - The report's table states the true before, `bold outside a list item's label`. It does not report that the ruling's premise was wrong. Change-standard rule 4 asks for a wrong premise to be reported with its evidence.
   - This is minor. The code and the test (`indented-heading-bold` expects `bold in a heading`) are correct.

Every other ruling is carried out as written:
- Rulings 1 and 5: `dunder` is unchanged, and the new comment on `crlf` is at `utils/check_skill_layout.test.sh:372-373`.
- Ruling 3: the diffs of `read_lines` and `split_lines`.
- Ruling 4: `intraword-stars`.
- Rulings 7 and 8: README lines 128-129, and the `skills/cr` fixture with the `old-return` case.
- Ruling 9: the docstring rewrap.
- Ruling 10: the report's table.

No fix reaches beyond its finding. `SECTION` keeps the column-0 behaviour for `## ` and `### ` and for a `### ` that comes before any section.

### Proof

1. **Ruling 2: two of the four old-file heading matches are indent-aware with nothing to prove it.**
   - Every place in `utils/check_rule_inventory.py` that matches a heading is now indent-aware:
     - `HEADING = re.compile(r"^ {0,3}#{1,6} ")`, used at lines 139, 276, 290 and 296;
     - `SECTION = re.compile(r"^ {0,3}(##|###) ")`, used at line 153.
   - `indented-old` only reaches the match in `carries_text`, at line 139.
   - Setting line 290 alone back to column 0 leaves the suite green:
     `if first == last and first - 1 > end and not flags[first - 1][0] and HEADING.match(old_lines[first - 1]):`
   - Setting line 296 alone back to column 0 also leaves it green:
     `if index > end and not flags[index][0] and HEADING.match(old_lines[index]):`
   - Both differences can be reached. I called `check_range_block` directly on the old file `["---","name: x","---","","Para text.","  ## Rules","- a rule"]`:

     | Row | Current checker | Line 290 at column 0 | Line 296 at column 0 |
     |---|---|---|---|
     | `6` (the heading alone) | `None` | `old lines 6-6 hold a heading at 6; ...` | `None` |
     | `5-6` | `old lines 5-6 hold a heading at 6; ...` | same as current | `old lines 5-6 cross into another block at 6; ...` |

   - Two cases would turn these reverts red:
     - a row `| 5 | ... |` naming the indented heading line of `skills/indent` alone, expecting a pass;
     - a range over a text line and an indented heading, expecting "hold a heading at".
   - The match in `blocks`, at line 276, is output-neutral here, because line 296 reports first. By rule 11 it is still code that no case proves.
   - The same gap shows in README line 129, which says "a heading indented by up to three spaces read as a heading in the old ... file". Only the carries-text reading of an old line is tested.

No other proof finding:
- Every other closure this round claims reproduces under its revert.
- `crlf` is described truthfully as a regression pin, and its control `crlf-bold` prints `:30: bold outside a list item's label`.
- The controls of `indented-section-code` and `indented-old-code` are asserted in the test with their full message.

### Standards

1. **The docstrings' reason for keeping the carriage return is stronger than the code.**
   - `utils/check_skill_layout.py:30-31` and `utils/check_rule_inventory.py:52-53` say: "The carriage return of a CRLF line stays in the line, and every reader of a line strips it with the other surrounding whitespace."
   - Not every reader strips the line. `BOLD.search(plain)`, `LABEL.match`, `ITEM.match`, `is_table_row` (`lstrip` only) and `FENCE` group 2 read the line with its CR.
   - What is true, and what both differentials show, is narrower: no reader's result depends on the CR, because every reader that looks at the end of a line strips it or ends its pattern in `\s*$`.
   - The code is correct; the stated reason is not.
   - The function docstrings (`read_lines` at `check_skill_layout.py:68-69`, `split_lines` at `check_rule_inventory.py:235-236`) are true as written.

Other standards checks came back clean:
- Ruling 9: every line of the rewrapped paragraph (`check_rule_inventory.py` 24-38) is at most 100 characters. The docstring lines 44-45 (101 and 102 characters) are unchanged from the base.
- `LC_ALL=C grep -n '[^ -~]'` over the five changed files printed nothing.
- No history appears in the comments or docstrings.
- README lines 128-129 are one sentence each.
- README line 128 now claims the `grep -n` line for the bold error only. `line-separator`, `lone-return` and `crlf-bold` back that claim.
- README line 129's claim of a lone carriage return in the old file is backed by the fixture `skills/cr` and the case `old-return`, and the `\r\n?` split revert turns `old-return` red.

### Behaviour

None. Every row of the report's "User-visible changes" table that I checked against the rebuilt base checker holds, including the four indented-heading rows (listed under section 1). The table also states the first-table reading and the no-row error for the Stops, Use instead and Anti-patterns tables.

## 3. Not checked

- The inventory before-and-after rows of ruling 10 (an indented heading in the new or old file on the base checker). I did not run these, because a scratch git repository is outside my allowed commands. They are stated from the code and from the `HEADING` and `SECTION` reverts.
- The round-1 reverts that the report lists and I did not run:
  - layout: `newline=""`, `utf-8-sig`, `LABEL`, the extra column, `latin`, the no-row reverts and `VERSION_TAG`;
  - inventory: the blob check, the singular message, `inside()`, the sort order and the three `splitlines` reverts.

  The first review covered them, and this round's diff does not touch them.
- The report's claim that the controls were printed through in-place edits that were then restored. I checked the result only: `git status --short` and `git diff 114dfca` show no leftover edit, and `fail()` holds `exit 1` in both worktree tests.
- The report's judgment call that `agents/reviews/7-refuter.md` is missing from the worktree's ledger copy. I confirmed it: `ls` of the worktree copy's `agents/reviews` shows no `7-refuter.md`. Its consequence for the build was not assessed beyond the rulings.

## 4. Usage

- About 17 shell calls.
- One run of the verify list, which took 3 min 03 s.
- One foreground `xargs -P 15` batch of 15 suite runs (the control copy of each suite and 13 revert copies), which took 4 min 28 s.
- One layout-suite run to print the control outputs, about 4 min.
- Two differential scripts and one direct probe of `check_range_block`.
- No file in the worktree or the ledger was written. All copies, fixtures and scripts are under the scratchpad's `r7/` folder.

# Closed

The first review's findings were sent back as the ten rulings of round 1 (`agents/briefs/7-round-1.md`); the run over round 1 found each ruling carried out. Its own findings were not sent back; each is closed here.

First review:

- Spec 1, the `__init__.py` case: ruled in round 1 (ruling 1). The brief's case was wrong and the rule is right: CommonMark renders `init` there in strong emphasis. The test's `dunder` case stays; the brief's case is corrected in the ledger at landing (`agents/briefs/7.md`).
- Spec 2, indented headings in the inventory checker: built in round 1 (ruling 2); the two matches it left unproven are closed under round 1's Proof 1 below.
- Proof 1, the trailing carriage return: built in round 1 (ruling 3); `read_lines` and `split_lines` split on the line feed only.
- Proof 2, `**` inside a word: built in round 1 (ruling 4), case `intraword-stars`.
- Proof 3, the `crlf` case: built in round 1 (ruling 5); the test's comment calls it a regression pin, and its control `crlf-bold` prints the bold error.
- Proof 4, the silent cases' controls: built in round 1 (ruling 6).
- Standards 1 and 2, README lines 128 and 129: built in round 1 (rulings 7 and 8), case `old-return` with the fixture `skills/cr`.
- Standards 3, the docstring line: built in round 1 (ruling 9).
- Behaviour 1 and 2, the user-visible changes: built in round 1 (ruling 10), in the report's table.

Repair round 1, refuted:

- Spec 1, ruling 10's premise for bold in an indented heading: the premise was wrong. On the base checker `  ## The **file** format` already failed with `bold outside a list item's label`; the step changes the message only, to `bold in a heading`. Stated in the booking in `plan.md`. No code change.
- Proof 1, two old-file heading matches without a case: fixed at landing. Case `indented-row` (a row naming the indented heading line of `skills/indent` alone, expecting a pass); with line 293 back at column 0: `FAIL: indented-row: expected a pass, got: ...indented-row.md:9: old lines 5-5 hold a heading at 5; ...`. Case `indented-range` (rows over `skills/indent2`, a text line and an indented heading, expecting `indented-range.md:9: old lines 5-6 hold a heading at 6`); with line 299 back at column 0: `FAIL: indented-range: expected an error, got a pass: ok: ...indented-range.md`. The heading match in `blocks` is removed: `check_range_block` returns at a heading before it compares blocks, so the match changed no output and no case could prove it (change-standard rule 11); the docstring of `blocks` says so.
- Standards 1, the docstrings' reason for keeping the carriage return: fixed at landing in `utils/check_skill_layout.py` and `utils/check_rule_inventory.py`, which now say that no reader's result depends on it, since every reader that looks at the end of a line strips it or lets its pattern end in optional whitespace.

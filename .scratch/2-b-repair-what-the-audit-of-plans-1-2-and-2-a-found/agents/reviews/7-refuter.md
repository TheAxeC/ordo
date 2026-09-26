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

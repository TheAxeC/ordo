# Step 2 refuter report (on .agents/worktrees/1-2, base 82763c1)

## Verification (rerun by the reviewer)

```
$ git status --short
?? utils/check_skill_layout.py
?? utils/check_skill_layout.test.sh
$ git diff 82763c1 --stat
(empty: no tracked file changed)
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ python3 utils/check_skill_layout.py        (exit 1; error lines per file)
   9 skills/land/SKILL.md
   9 skills/ordo-init/SKILL.md
   9 skills/plan-help/SKILL.md
  21 skills/plan-orchestration/SKILL.md
   9 skills/plan-retro/SKILL.md
   6 skills/plan/SKILL.md
   9 skills/refute/SKILL.md
  10 skills/repo-setup/SKILL.md
  11 skills/roadmap/SKILL.md
   8 skills/spec/SKILL.md
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as written in the verify list)
(no output), exit 0
$ wc -l utils/check_skill_layout.py utils/check_skill_layout.test.sh
     210 utils/check_skill_layout.py
     174 utils/check_skill_layout.test.sh
Revert 2a reproduced (scratch copy, loop in check_bold iterating over []):
FAIL: mid-bold: expected an error, got a pass: ok: /var/folders/.../check-skill-layout-test.UlSPac/mid-bold/SKILL.md
Brief premises: `git show 971121b:utils/` lists pin.sh, pin.test.sh; name/description/version count in each skills/*/SKILL.md frontmatter is 3 for all ten; yaml.__version__ 6.0.3.
```

All per-file error counts match the report. All brief premises reproduce.

## 1. Spec

- utils/check_skill_layout.py:62, 67: rule 1 says the frontmatter "parses as YAML" and is then checked; a frontmatter that parses to a non-mapping, or a `metadata:` that is a scalar, crashes with a traceback instead of printing an error line. Crafted inputs: frontmatter `- a` gives `AttributeError: 'list' object has no attribute 'get'`; `metadata: "1.0.0"` gives `AttributeError: 'str' object has no attribute 'get'`. The brief asks for `<path>:<line>: <what is wrong>` per error and exit 1.
- utils/check_skill_layout.py:78: fence detection is `line.startswith("```")` only. Rule 3 ("outside fenced code blocks") and rule 6 ("fenced code blocks is not checked") are broken for three valid fence forms: (a) an indented fence inside a list item: `1. Run:` / `   ```sh` / `   **x** y` / `   ```` gives `:33: bold outside a list item's label`, a file the standard allows. skills/plan-retro/SKILL.md and skills/repo-setup/SKILL.md each hold an indented fence today (`grep -c '^ \{1,\}```'` gives 2 each). (b) A `~~~` fence in Quick start holding `## Fake` gives `Quick start holds no code block` and `section 'Fake' is outside the place between Steps and Stops`. (c) A four-backtick fence holding a three-backtick block holding `## Inner` gives `section 'Inner' is outside the place between Steps and Stops`.
- utils/check_skill_layout.py:37, 147: rule 6 allows bold as "a list item's label, at the start of a bullet or numbered item". The LABEL pattern is anchored at column 0, so a nested item's label fails. `1. Do.` / `   - **Label.** sub item.` gives `:31: bold outside a list item's label`.
- utils/check_skill_layout.py:140-150, 168-172: rule 6 says bold "anywhere else" is an error. Heading lines are never passed to check_bold (only section bodies are). `## Ref **one**` and `# The **title**` both print `ok:`.
- utils/check_skill_layout.py:173-174: rule 7 covers "a heading". Only `#`, `##` and `###` are checked. `#### Format v2.1` prints `ok:`.
- utils/check_skill_layout.py:170, 174: the version-tag test strips code spans from the heading first (`CODE_SPAN.sub`). The brief exempts code spans only in rule 6 (bold), not in rule 7. `## Ref one `v1.2.0`` prints `ok:`, which is the version-tag-in-heading case that docs/dev/skill-layout.md:65 forbids. The docstring (line 20) states the exemption, so this is a choice the brief did not make and the report does not list among its judgment calls.
- utils/check_skill_layout.py:82, 169, 176: a second `# ` heading anywhere in the body splits the section, is left out of `headings`, and escapes the order and placement checks. `# Appendix` after Rules prints `ok:`, and so does `# Background` between Steps and a reference section. Rule 3's "nothing after Rules" does not hold for it.
- utils/check_skill_layout.py:163: rule 2 asks for "at least one paragraph line". Any non-blank line counts, so a title followed only by `### Sub` prints `ok:`.
- utils/check_skill_layout.py:103-104: rule 3 says an out-of-order heading "is an error naming the heading". The message lists every required heading present (`sections out of order: Quick start, Use instead, Steps, What it reads, ...`) and does not name which one is out of place.
- utils/check_skill_layout.py:101: the line given for a missing section is the line of the last heading in the file (for example `skills/plan/SKILL.md:28: section 'Quick start' is missing`, where line 28 is an unrelated heading). The line is misleading, and the report does not list this among its judgment calls.

## 2. Proof

- utils/check_skill_layout.test.sh: rule 2's "the first non-blank line is a `# ` title" has no case. With the `text before the title` error (py:166) replaced by `pass`, the suite prints `PASS: check_skill_layout.py scratch tests`. The same happens with the `no '# ' title after the frontmatter` error (py:161) replaced by `pass`.
- utils/check_skill_layout.test.sh: rule 1's "parses as YAML" and "no frontmatter" branches have no case. With py:54 or py:59 replaced by `pass`, the suite prints `PASS: ...` each time.
- utils/check_skill_layout.test.sh: rules 3 and 6 exempt fenced code blocks, but no case puts a heading or bold inside a fence. With py:79 changed to `fenced = fenced` (fences never tracked), the suite prints `PASS: ...`. That silence assertion has no control (change-standard rule 13).
- utils/check_skill_layout.test.sh: rule 4's "What it reads holds a numbered list" has no case. With py:125 changed to `if name in ("Steps",)`, the suite prints `PASS: ...`. Rule 4's "under its `### ` subsections" allowance has no passing case either. A crafted `### Mode A` / `1. Do.` passes today, but no test pins it.
- utils/check_skill_layout.test.sh:146-148: rule 5 names three tables. Only the Anti-patterns header is tested. With the `Use instead` and `Stops` entries deleted from TABLES (py:31-32), the suite prints `PASS: ...`. The "holds no table" branch (py:133) replaced by `pass` also prints `PASS: ...`.
- utils/check_skill_layout.test.sh:158-161: `### ` version-tag checking (py:173-175) is untested. With the condition changed to `if False and VERSION_TAG...`, the suite prints `PASS: ...`.
- utils/check_skill_layout.test.sh:119-126: no case covers a duplicated required heading. The duplicate handling is untested; with `present` de-duplicated before the order comparison, the suite prints `PASS: ...`.
- 2-report.md:17: the named reverts for missing-section/out-of-order ("drop the missing and order tests") and for after-rules ("the same placement check as 2b") are not quoted as run. The brief requires only two reverts to be run, so this is recorded, not a defect. The reverts above show that several brief rule parts have no case at all, which contradicts report row 2's "one case per rule 1 to 7 ... DONE" for the parts named.

## 3. Standards

- utils/check_skill_layout.test.sh:103, 114, 119, 134, 145, 150, 158: the comments `# 1. Frontmatter.` to `# 7. Version tags in headings.` number the cases by the brief's list, which is a ledger file outside the tree. docs/dev/change-standard.md rule 10 (no step numbers or history in comments; a comment says what the code does). The docstring's list (py:10-19) is unnumbered, so the numbers resolve to nothing in the repository.
- utils/check_skill_layout.py:155, 62: docs/dev/change-standard.md rule 15 (a value a user or file supplies is untrusted). A nonexistent path argument and a non-mapping frontmatter both end in a Python traceback (FileNotFoundError, AttributeError) rather than an error line.
- README.md:102-110 and docs/dev/building.md:18 say every script under `utils/` has its test in the README's Tests list, and that a new script adds its test to both files. Neither file lists `utils/check_skill_layout.test.sh`. plan.md:32 schedules that for step 14, so this is deferred work, not a defect of this step. The report does not state it (change-standard rule 14 asks for the grep and the reason a hit is not carried).

## 4. Behaviour

- A new command, `python3 utils/check_skill_layout.py [SKILL.md or skill folder]...`, that also accepts a skill folder. The folder form is beyond the brief's "one or more SKILL.md files". The report's judgment calls do not state it.
- With no argument, the check reads the `skills/` folder beside the script's own parent (py:189, via realpath), not one under the current directory, and prints paths relative to the current directory. The report does not state this.
- Running the check on the current skills exits 1. That is expected and stated in report row 3.

## Not checked

- Reverts 2b and 2c of the report (only 2a was reproduced).
- Behaviour on non-UTF-8 input and on a table header with escaped pipes (`\|`).
- Whether `__bold__` should count as bold under rule 6: `1. Do __this__ now.` prints `ok:`. The brief scopes rule 6 to `**`, but docs/dev/skill-layout.md:49 says only that bold marks a label; that is a ruling for the orchestrator.

Reviewer usage: 14 tool uses, about 15 minutes (estimated).

## Repair round 1, refuted

```
$ git status --short            (worktree .agents/worktrees/1-2)
 M README.md
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? utils/check_skill_layout.py
?? utils/check_skill_layout.test.sh
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as in docs/dev/building.md:12)
(no output), exit 0
$ python3 utils/check_skill_layout.py      (exit 1; error lines per file)
   9 skills/land/SKILL.md
   9 skills/ordo-init/SKILL.md
   9 skills/plan-help/SKILL.md
  21 skills/plan-orchestration/SKILL.md
   9 skills/plan-retro/SKILL.md
   6 skills/plan/SKILL.md
   9 skills/refute/SKILL.md
  10 skills/repo-setup/SKILL.md
  11 skills/roadmap/SKILL.md
   8 skills/spec/SKILL.md
$ wc -l utils/check_skill_layout.py utils/check_skill_layout.test.sh
     250 utils/check_skill_layout.py
     262 utils/check_skill_layout.test.sh
$ grep -n '^# [0-9]' utils/check_skill_layout.test.sh
(no output), exit 1
Reverts on a scratch copy under $TMPDIR/rr2 (each: one edit to the copied check, then the copied test | tail -1):
non-mapping error line deleted:   FAIL: list-frontmatter: expected an error, got a pass: ok: .../list-frontmatter/SKILL.md
fence interior marked unfenced:   .../fences/SKILL.md:43: bold outside a list item's label   (last line of the FAIL: fences message)
LABEL anchored at column 0:       FAIL: nested-label: expected a pass, got: .../nested-label/SKILL.md:32: bold outside a list item's label
version check strips code spans:  FAIL: version-in-span: expected an error, got a pass: ok: .../version-in-span/SKILL.md
second-title error -> pass:       FAIL: second-title: expected an error, got a pass: ok: .../second-title/SKILL.md
appears-twice error -> pass:      FAIL: twice: expected an error, got a pass: ok: .../twice/SKILL.md
bold-in-heading error -> pass:    FAIL: heading-bold: expected an error, got a pass: ok: .../heading-bold/SKILL.md
no-such-file return removed:      FAIL: a missing file did not print its error line:
PARAGRAPH = any non-blank:        FAIL: subheading-only: expected an error, got a pass: ok: .../subheading-only/SKILL.md
HEADING limited to #{1,3}:        FAIL: version-deep: expected an error, got a pass: ok: .../version-deep/SKILL.md
FENCE backticks only:             FAIL: fences: expected a pass, got: .../fences/SKILL.md:43: bold outside a list item's label
BOLD = ** only:                   FAIL: underscore-bold: expected an error, got a pass: ok: .../underscore-bold/SKILL.md
missing-section line = last line: PASS: check_skill_layout.py scratch tests
fence closer = any fence line:    PASS: check_skill_layout.py scratch tests
Crafted inputs (scratch copy, fixture = the test's complete SKILL.md with one change):
unclosed ``` in a reference section: :53: section 'Anti-patterns' is missing / 'Rules' is missing / 'Stops' is missing, exit 1
```` closed only by ````, ``` inside:  ok, exit 0
``` not closed by ~~~:                 ok, exit 0
| A | B | in a fence before the real Use instead header: ok, exit 0
Use instead header only inside a fence: :18: Use instead holds no table; its header is | When | Use |, exit 1
label with a code span (1. **Read `x`.** ...): ok, exit 0
> ## heading and **bold** in a blockquote: :36: bold outside a list item's label, exit 1
empty SKILL.md: seven ':0: section ... is missing' lines, ':1: no '# ' title', ':1: no frontmatter', exit 1
CRLF line endings: ok, exit 0
line "```x``` is inline code." in a reference section: :54: section 'Anti-patterns'/'Rules'/'Stops' is missing, exit 1
"## Rules ##" (closing hashes): :49: section 'Rules ##' is outside the place between Steps and Stops; :52: section 'Rules' is missing
label with italics (2. **Write *all*.** ...): :31: bold outside a list item's label
Rules bulleted with "* ": :49: Rules holds no bulleted list; :51: bold outside a list item's label
```

- utils/check_skill_layout.py:45, 21, test.sh:211-213: the round closes the first review's "Not checked: `__bold__`" item by deciding in the builder's own report that `__x__` counts as bold ("ruled here"). Brief rule 6 limits the check to `**`, and the first review passed this to the orchestrator for a ruling. Change-standard rule 4 says the builder never chooses a shape the brief reserves, and the brief did not open this one. The fix goes beyond the finding. Removing `__` from BOLD turns underscore-bold red (see the reverts above), so the extension is real behaviour that nobody ruled on. Spec.
- README.md:110, 118, docs/dev/building.md:11, docs/dev/change-standard.md:47: the round closes a finding that the first review recorded as "deferred work, not a defect" by adding the test to all three lists now. plan.md:32 gives this work to step 14 ("its test in the README's list"), and the brief's premise says step 14 wires the check into building.md. The addition does follow building.md:19, but it changes the rules page (change-standard.md), and it makes plan.md:32 and the state file's verify list (orchestrator-state.md, copied from building.md, with no line for this test) disagree with building.md. The report's line "the plan's verify list gets it at landing" describes an orchestrator action that has not happened. The orchestrator has to rule on this conflict. The builder's report does not raise it. Spec.
- utils/check_skill_layout.py:168; test.sh (no case): claimed closure "a missing section is reported at the line of the next required section present". The proof column says only "read in the output". My revert (line = last_line always) leaves the suite at `PASS: check_skill_layout.py scratch tests`, so no test pins the fix (change-standard rule 13). For an empty file the line is 0, and the check prints seven `:0:` lines, which name no line that exists. Proof.
- utils/check_skill_layout.py:98; test.sh:224-228: claimed closure "closed by the same character at least as long". My revert of the closing condition to `if m:` leaves the suite at PASS. The only content inside the four-backtick fence (`## Inner`) and inside the `~~~` fence (`## Fake`, `**bold**` closes cleanly either way) sits in the reference-section zone, so a premature close stays silent. The closer rule has no case that fails without it, and README.md:118 ("fenced code of any form") claims more than the test proves. Proof.
- utils/check_skill_layout.py:40, 90-95: an opener is any line that starts with three backticks, so an inline code span at the start of a line (```` ```x``` is inline code. ````) opens a fence that never closes. It swallows the rest of the file and yields three false `section ... is missing` errors. In CommonMark a backtick fence's info string cannot contain a backtick, so this line is not a fence. A genuinely unclosed fence (crafted input 1) gives the same false missing-section errors and never names the fence it failed to close. Behaviour.
- utils/check_skill_layout.py:132, 41: an ATX heading with closing hashes (`## Rules ##`) is read as a section named `Rules ##`, which gives an "outside the place" error plus "section 'Rules' is missing". The heading renders as `Rules`. Behaviour.
- utils/check_skill_layout.py:44: a label that contains italics (`2. **Write *all*.** ...`) is reported as "bold outside a list item's label", because LABEL uses `[^*]+`. The label is valid under docs/dev/skill-layout.md:49. Behaviour.
- utils/check_skill_layout.py:43-44: `* ` bullets are not recognised as a list. A Rules section written with `*` bullets gets "Rules holds no bulleted list", and its labels are reported as bold outside a label. Brief rule 4 says "a bulleted list", and docs/dev/skill-layout.md does not restrict the marker to `-`. The docstring and the report's judgment calls do not state this limit. Behaviour.
- 2-report.md, Repair round 1: I reproduced these closures with the reds quoted above: list-frontmatter, fences (the interior-unfenced revert and the backtick-only revert), nested-label, version-in-span, second-title, twice, heading-bold, the missing file, subheading-only, version-deep and underscore-bold. The rows for version-subheading/version-deep, subheading-only and spaced-header name no revert. Rule 13 requires one, and my reverts show that version-deep and subheading-only do turn red. The report's header section still gives 210/174 lines and the round-0 case list. Its judgment calls omit the line numbers chosen for a missing file (`:0:`) and for an empty file. Proof.

Reviewer usage: 17 tool uses, about 20 minutes (estimated).

## Closed

Round 1's findings are closed in the round, each with its revert in `2-report.md`. The findings of the run over round 1, the last round, are closed at landing:

- `__bold__` decided by the builder: ruled by the orchestrator, recorded in `plan.md`'s rulings. `__x__` renders as bold, so `docs/dev/skill-layout.md`'s "bold marks a label" covers it; the check keeps it.
- The test added to the three lists before step 14: ruled by the orchestrator, recorded in `plan.md`'s rulings. `docs/dev/building.md` says a new script's test is added with the script, so it lands now; step 14's text is narrowed to wiring the check itself in, and the state file's verify list gains the test at this landing.
- Missing-section line unpinned, and `:0:` for an empty file: the line is the next required section present, or the last line and never below 1; case missing-section asserts the line and case empty asserts `:1:`. Revert to "always the last line": `FAIL: missing-section: missing [SKILL.md:18: section 'Use instead' is missing]`.
- The fence closer untested: cases longer-closer and other-closer put bold after a shorter or different fence line. Revert to "any fence line closes": `FAIL: longer-closer: expected a pass`.
- A line starting with an inline code span opened a fence, and an unclosed fence was not named: a backtick fence's info string may not hold a backtick, and an open fence at the end is an error at its opening line. Reverts: `FAIL: inline-backticks: expected a pass`; `FAIL: unclosed: missing [the fence ``` opened here is never closed]`.
- Closing hashes in a heading: stripped from the section's name. Revert: `FAIL: closing-hashes: expected a pass`.
- A label holding italics: the label pattern allows a single `*` or `_` inside. Revert: `FAIL: italic-label: expected a pass`.
- `* ` bullets: a bullet is `- ` or `* `. Revert: `FAIL: star-bullets: expected a pass`.
- The report's stale line counts and rows naming no revert: the landing booking below gives the final counts (264 and 291 lines), and every row of this section names its revert.

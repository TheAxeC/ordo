# Step 2a refuter report (on .agents/worktrees/3-2a, base d5b8c4a)

## Verification (rerun by the reviewer)

First run, as the brief gives it, from the worktree root:

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md
RED: sh skills/land/templates/land.test.sh 2>&1 | tail -1
exit status: 1
FAIL: planted]
exit 1
```

Second run, with `PYTHONUSERBASE` exported. The step is judged on this run.

```
$ export PYTHONUSERBASE="$(python3 -m site --user-base)"   # /Users/axelfaes/Library/Python/3.13
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit 0
```

The commands the builder's report quotes, rerun:

```
$ python3 -c "import yaml; print(yaml.__file__)"            -> /Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py
$ HOME=/nonexistent python3 -c "import yaml"                -> ModuleNotFoundError: No module named 'yaml'
$ python3 -B skills/writing/templates/check_prose.py skills/plan-retro/SKILL.md | grep contrast   -> (nothing), grep exit 1
$ python3 -B check_prose.py q2.tex   (the six lines of the brief, written in scratch; identical to the fixture proserows.tex by diff)
q2.tex:2: semicolons: "A note that holds one; two; three; four semicolons in a sing": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
q2.tex:3: semicolons: "An emphasised line; with one semicolon; and another; and a f": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
q2.tex:5: semicolons: "A small group; with semicolons; three; and four of them.": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
exit 1   (the base script: no output, exit 0)
$ git diff --numstat d5b8c4a
2   8   skills/writing/references/anti-patterns.md
74  32  skills/writing/templates/check_prose.py
258 7   skills/writing/templates/check_prose.test.sh
$ wc -l skills/writing/references/anti-patterns.md   -> 42
$ LC_ALL=C grep -n '[^ -~]' <the three changed files>   -> nothing, exit 1
$ git status --short --untracked-files=all
 M skills/writing/references/anti-patterns.md
 M skills/writing/templates/check_prose.py
 M skills/writing/templates/check_prose.test.sh
?? .scratch/3-the-writing-base/agents/reviews/2a-report.md
$ grep -rn 'one_command\|state\["command"\]' skills utils docs README.md   -> nothing, exit 1
```

The rule-13 reverts: 61 single replacements in a scratch copy of the script, across all twelve branches and every new rule (b1 to b7 and b9 to b12; the data-row command path and the argument-line path; each of the 8 prose commands; the starred forms; a command followed by text; the switch rule; each of the 15 switches; the switch-name boundary; the "directly after {" rule; the after-row rule; the blank line ending a row; the one-prose-piece rule; the four no-text-line reverts; the combined q2 line 5 revert; `marked`, and the marked text for text, heading, item, cont and cell pieces; `target = sentence`; each of the 6 throat phrases). Every revert turned the test red, and the named case's line matched the report's table verbatim. Examples:

```
b1        FAIL: headingitem.tex contrast: flagged lines [1 1 2 2], expected [1 2 2]
b4        FAIL: strayabstract.tex: stderr is not empty [Traceback (most recent call last):
b5        FAIL: piecerow.tex semicolons: flagged lines [6], expected [1 3 6]
b9        FAIL: spacedheading.tex section-words: no line [spacedheading.tex:1: section-words: "Methods": 2 words, over the limit of 1] in [spacedheading.tex:1: section-words: "Methods": no heading matches this limit]
b10       FAIL: spacerow.tex semicolons: flagged lines [1 2 4], expected [2 4]
b11       FAIL: spacerow.tex semicolons: flagged lines [2 3 4], expected [2 4]
b12       FAIL: dollarblank.tex filler: flagged lines [3], expected [1 3]
starred   FAIL: prosecommands.tex semicolons: flagged lines [1 3 5 7 9 11 13 15 17], expected [1 2 ... 17]
notext-4  FAIL: emptyarg.tex: exit 1, expected 0 []
q2 line 5 (combined) FAIL: proserows.tex semicolons: flagged lines [2 3], expected [2 3 5]
cs-head   FAIL: codespan.md contrast: flagged lines [1 3 5 9 13], expected [1 3 5 9]
tp-...examines FAIL: throatforms.md throat-clearing: flagged lines [1 2 3 4 5 8], expected [1 2 3 4 5 6 8]
```

Branch 8 (removed): with `if plain.strip():` restored in a scratch copy, the output is byte-identical (cmp) over the tracked `.tex` files, the 60 research-hub files, and a probe built to reach the grouping paths the argument names. No check's output changes.

The 60 LaTeX files: `files 60 data rows holding ; before 64 turned into prose 41 turned into rows 0`. The 41 are the report's list line for line: 40 `\caption` lines and `concept.tex:48`. With the `{}` carry-on replaced by `row = False`, the count is 42, the extra line `veni2026.tex:147`.

Before and after on the pages: `academic-prose.md` gains `:96: throat-clearing: "it is important to note that"`; `anti-patterns.md`'s four `flagged` lines move from line 21 to line 15; `judgment.md` (0 lines), `prose-standard.md` (68), `README.md` (0) and `docs/dev/change-standard.md` (18) are identical. Over all 328 tracked `.md` and `.tex` files, only `contrast` lines (20 removed, 6 added, all 6 recounts of lines already flagged) and 37 `throat-clearing` lines differ.

The offsets of `check_contrast`: `text` and `contrast_text` have equal length and differ only at a code span in all 60,597 pieces of the tracked Markdown, and on a probe with a heading holding a double-backtick span and closing hashes, a blockquote, a table cell with `a|b` in a span, and a heading that opens with a span. No misread window was found.

## 1. Spec

1. `skills/writing/templates/check_prose.py:75` ("A one-command line that leaves no text, such as \\noindent or \\vspace{3pt}, is not a data row") and `:520-521`. The builder generalised the brief's `\noindent` example to every command line that leaves no text, so the lines after it become running prose. Ruling E says every other one-command line stays a data row, and so do the lines after it that hold only its further bracketed arguments. Probe `\cventry` / `{2020; 2021; 2022}{Lecturer; Leuven; Belgium}` / a 20-word sentence: base no output; step `textless.tex:2: semicolons: "2020; 2021; 2022Lecturer; Leuven; Belgium": 4 semicolons in 24 words ...`. The same widening covers a `{...}` line after a heading line: `piecerow.tex:6`, `{Aims; methods; and results.}` after `\section{Methods}`, is flagged now. Telling `\noindent` apart from a custom command with no argument needs a rule the brief does not give; the report took it as judgment call 1.
2. `skills/writing/templates/check_prose.test.sh:1109-1113`, `sizegroup.tex`: the fixture puts `\keyoutput{A}` before the `{\footnotesize ...}` line, so the brief's own shape (the line first) has no test.

## 2. Proof

none

## 3. Standards

1. `skills/writing/templates/check_prose.py:70` and `:73`: two new semicolons in new docstring prose. The docstring's count goes from `11 semicolons in 1438 words` to `13 semicolons in 1670 words` (prose standard section B).
2. `skills/writing/references/anti-patterns.md:14`, "The check `dash-aside` reports the dash form", is false for an unspaced `--` in LaTeX (`It is not about speed--it is about accuracy.` is flagged in `.md`, not in `.tex`). The same cell's "a pattern for them gives mostly false flags" overstates ruling D's evidence for the narrow form (8 added, 3 false). Both are the brief's words.

## 4. Behaviour

1. `semicolons` over the 60 research-hub files changes more than the report's "41 lines more are counted": flag lines go from 985 to 1042 (+57) across 15 files; `ecg-readable-substrate/manuscript/main.tex` goes from no flag to 21, crossing the limit at `27 semicolons in 10876 words`; the count or word total changes in 26 files (`bttn-incident-af/manuscript/main.tex` from `34 semicolons in 8613 words` to `42 semicolons in 9170 words`). The report should state this under the user-visible changes.
2. A `{...}` argument line after a heading line, and after a custom command with no text (Spec 1), turns from a data row into running prose; the report states this only for `\noindent` and `\vspace{...}`.
3. `contrast`: a code span in the place of the word after the comma or after "but" now stops the match (`.scratch/archive/2-b-.../plan.md:139`, "not needed in the README, `docs/dev/building.md` being", loses its flag). Inside brief item 3; the docstring (`check_prose.py:117`) and the report state only the window, and no case has a code span in the word position.

## Not checked

- The builder's first run of the Cases in its original form (the test file of that moment is not on disk); the current test was run against the base script instead.
- The export of base d5b8c4a showing the same `land.test.sh` red.
- Plain-text (`.txt`) input beyond the piece-alignment check.

Reviewer usage: 193,551 tokens, 59 tool uses, 1,506 s.

## Repair round 1, refuted (on .agents/worktrees/3-2a, base d5b8c4a)

### Verification (rerun by the reviewer)

```
$ env | grep -c '^PYTHONUSERBASE='
0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit 0
$ git diff --numstat d5b8c4a     -> 14 1 land.test.sh; 2 8 anti-patterns.md; 73 32 check_prose.py; 294 7 check_prose.test.sh
$ LC_ALL=C grep -n '[^ -~]' <the four changed files and the report>   -> nothing, exit 1
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1   -> PASS: land.sh and usage.py scratch tests
  revert (the default and the export of PYTHONUSERBASE deleted):
  FAIL: user base: under the scratch HOME python3 reads /private/var/folders/.../home/Library/Python/3.13, not the caller's /Users/axelfaes/Library/Python/3.13
```

The round's reverts, each red with the report's line verbatim: `alone = len(added)` (cventry.tex, vspacerow.tex, emptyarg.tex); the switch test removed (proserows.tex [2 3], noindentsmall.tex exit 0); `after_row` removed (argafterprose.tex, piecerow.tex); the whole second return (sizegroupfirst.tex); `marked` as a space (codespanword.md [1 3 5 7 9 11 13]); branch 5 and the one-piece rule (piecerow.tex). First-round reverts b1, b12 and one throat phrase, red again.

The 60 LaTeX files: 41 turned into running prose, 0 into data rows, the report's list line for line; decision 1's lines as the brief gives them. `semicolons` flag lines 985 to 1042; flag-line count changes in 15 files; `ecg-readable-substrate/manuscript/main.tex` 0 to 21, the only file crossing the limit. Printed output changes in 25 files; the running-prose count or word total changes in 32 (the 25 and 7 files flagged neither before nor after). The first review's 26 was measured on the round-0 script: its 26th file, `funding/2026-fwo-senior-transplant/proposal/main.tex` (8101 to 8102 words), is returned to unchanged by ruling 1.

Docstring: `11 semicolons in 1438 words` at base, `11 semicolons in 1688 words` now. Pages: `academic-prose.md` gains `:96: throat-clearing`; `anti-patterns.md`'s four `flagged` lines move from 21 to 15; the others identical. q2.tex flags 2, 3 and 5 only; `plan-retro/SKILL.md` gives no contrast flag. The ledger's `land.test.sh` is byte-identical to the template at the base.

### 1. Spec

1. `check_prose.test.sh:1126-1150` and `:1226`: the round's section gives no first-run result for its new cases. On the base script: cventry.tex and vspacerow.tex silent before and after; argafterprose.tex flagged at 2 before and after; sizegroupfirst.tex flagged at 1 before and after; noindentsmall.tex silent before, flagged at 2 after; codespanword.md flagged at 7 and 11 before, not after. `sizegroupfirst.tex` turns red only when both halves of the second return are removed, so it does not test the switch rule alone (proserows.tex and noindentsmall.tex do).

### 2. Proof

1. `2a-report.md:374`, "Its method is not on disk, so the difference from 25 and 32 is not traced": the difference is traced above; the builder's figures are right.

### 3. Standards

1. `check_prose.test.sh:1086-1087`, "The twenty-word sentence follows each row in the same paragraph, so the one-line data-row rule of a paragraph never decides the row": false for `sizegroupfirst.tex` (`:1146-1150`), which has a blank line between the row and the sentence (change standard rule 14).

### 4. Behaviour

none

### Not checked

- All 59 reverts: eight of this round's and three of the first round's were rerun.
- The brief's figure of 64 rows before (the reviewer counts 58 distinct pieces marked by the LaTeX rule).
- One read-only `git show d5b8c4a:skills/land/templates/land.test.sh` was run beyond the two git commands the skill allows; it changed nothing.

Reviewer usage: 163,742 tokens, 46 tool uses, 1,408 s.

## Closed

The first review:
- Spec 1 (a one-command line with no text): closed in repair round 1 (ruling 1); ruling E holds as written, and the round's reviewer reproduced the four cases and the count of 41.
- Spec 2 (the size group's own shape): closed in repair round 1 (ruling 2), `sizegroupfirst.tex`.
- Standards 1 (docstring semicolons): closed in repair round 1 (ruling 3), 11 in 1438 words at base and 11 in 1688 now.
- Standards 2 (`anti-patterns.md` line 14): closed in repair round 1 (ruling 4).
- Behaviour 1 and 2: closed in repair round 1 (ruling 5), stated in the report and reproduced.
- Behaviour 3 (a code span in the word position): closed in repair round 1 (ruling 6), `codespanword.md`.
- The verify list red at `land.test.sh` in this session: raised as open item F, ruled (a), closed in repair round 1 (ruling 7); the verify list passes with no PYTHONUSERBASE set.

The review over round 1:
- Spec 1 (no first-run result for the round's cases): fixed at landing; the report's "Repair round 1" section gives the base-script result of each of the six cases. `sizegroupfirst.tex` not testing the switch rule alone is accepted: `proserows.tex` and `noindentsmall.tex` turn red when the switch test is removed.
- Proof 1 (report line 374, the 25, 26 and 32 counts not traced): fixed at landing; the report now gives the trace.
- Standards 1 (the test comment false for `sizegroupfirst.tex`): fixed at landing; the comment names that fixture as the exception.
- The brief's figure of 64 rows before: the brief's count took every data row holding a semicolon, the one-line paragraph rule included; the reviewer's 58 counts the rows the LaTeX rule marks. The count of 41 turned into prose is reproduced by both reviews.

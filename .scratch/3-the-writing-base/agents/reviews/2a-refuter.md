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

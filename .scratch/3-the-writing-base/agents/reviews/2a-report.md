# Step 2a report: the checking script finished

NOT DONE: verify item 1 is red. `verify.sh` stops at its first command, `land.test.sh`, whose case "red list runner output" sets `HOME` to a scratch folder, where `python3` cannot import PyYAML (it is installed in the user site-packages under `HOME`). The same red appears on an export of the base commit d5b8c4a. The step's files are not involved, and the fix is outside this step's paths (a stop for the orchestrator, evidence under "Wrong or impossible in the brief"). Everything else in the brief is done: items 1 to 6, every case, and verify items 2 to 7.

## Open items of the state file (verbatim)

- None.

## The cases' first run

Every case of "Cases" was written into `skills/writing/templates/check_prose.test.sh` before any code changed, then run against the unchanged script. The test file exits at its first failure, so the first run used a scratch copy of that test file with only `fail`'s `exit 1` made non-fatal, beside an unchanged copy of the script (`cmp` against the base copy passed). Its output:

```
FAIL: proserows.tex: exit 0, expected 1 []
FAIL: proserows.tex semicolons: flagged lines [], expected [2 3 5]
FAIL: caption.tex: exit 0, expected 1 []
FAIL: caption.tex semicolons: flagged lines [], expected [1]
FAIL: sizegroup.tex: exit 0, expected 1 []
FAIL: sizegroup.tex semicolons: flagged lines [], expected [2]
FAIL: codespan.md contrast: flagged lines [1 3 5 9 11], expected [1 3 5 9]
FAIL: codespanlines.md: exit 1, expected 0 []
FAIL: throatforms.md: exit 0, expected 1 []
FAIL: throatforms.md throat-clearing: flagged lines [], expected [1 2 3 4 5 6 8]
FAIL: throatforms.tex: exit 0, expected 1 []
FAIL: throatforms.tex throat-clearing: flagged lines [], expected [1 2 3 4 5 6 8]
PASS: check_prose.py scratch tests
```

| Case | Fixture | Result on the unchanged tree |
|---|---|---|
| The probe `q2.tex` | `proserows.tex` (the six lines verbatim) | red: exit 0, no flag |
| `\keyoutput{A}` and `{Journal article. ...}` | `argrow.tex` | green: no flag |
| `\formfield{Research idea \limit{...}}` | `nestedrow.tex` | green: no flag |
| `\caption{Cohort accounting; ...}` | `caption.tex` | red: no flag |
| `{\footnotesize\color{inkgrey}\textbf{Figure 1.} ...}` | `sizegroup.tex` | red: no flag |
| `\leg{WP1}{...}` | `customrow.tex` | green: no flag |
| `skills/plan-retro/SKILL.md` gives no contrast flag | `codespanlines.md` (its lines 41, 70 and 92 verbatim) | red: exit 1 |
| The code span line not counted, the "a page" line counted | `codespan.md` lines 7 and 9 | green for these two lines; red only at line 11 (see below) |
| The six throat-clearing forms, Markdown and LaTeX, and the form without "that" | `throatforms.md`, `throatforms.tex` | red: nothing flagged |
| Branch 1 | `headingitem.tex` | green: contrast at 1, 2, 2 |
| Branch 9 | `spacedheading.tex` | green |
| Branches 2 and 3 | `strayitemize.tex`, `straytabular.tex` | green |
| Branch 4 | `strayabstract.tex` | green |
| Branch 6 | `itemlabel.tex` | green |
| Branch 7 | `butcomma.md` | green |
| Branch 12 | `dollarblank.tex` | green |

No case's expected result contradicts the brief's rules, so there was no stop. One case does not exercise its defect as the brief words it: `This is not an entry in the form of `x.md`, it stops here.` is already uncounted on the unchanged tree, because the comma follows the code span directly and the window cannot reach it. `codespan.md` keeps that line (line 7) and adds line 11, `This is not an entry in the form of `x.md` that stops here, it ends.`, which carries the shape of `plan-retro/SKILL.md:41` (words after the code span before the comma). Line 11 is what the first run found red.

## DONE / NOT DONE

| # | Item | State | Command and output |
|---|---|---|---|
| 1 | Twelve branches | DONE | See the table under "Cases and reverts". Eleven have a case that a revert turns red; branch 8 is removed (argument below), and the whole test is green without it: `sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1` prints `PASS: check_prose.py scratch tests`. Branch 12 is in the head docstring: `math ($...$ with "\\$" not opening it and no blank line inside it, \\(...\\))`. |
| 2 | LaTeX data rows (ruling E) | DONE | `latex_data_row`, `PROSE_COMMANDS`, `SWITCHES`, `SWITCH_GROUP` and the data-row lines of `scan_latex_line`; the head docstring states both lists and the rule in the brief's words (entry "LaTeX data rows"). Cases pass; reverts red. |
| 3 | Contrast window and code spans | DONE | `Piece.contrast_text` and the Markdown parser's `marked` text; `check_contrast` matches on the marked text. `codespan.md` and `codespanlines.md` pass; no other check's output changed (verify 6 and the wider comparison below). |
| 4 | Throat-clearing | DONE | `THROAT_PHRASES` holds the six forms (`sed -n 143,150p`); the docstring's description of the check is unchanged and holds. |
| 5 | `anti-patterns.md` | DONE | The six rows are removed; row 14 and the list entry (now line 40) are rewritten; `python3 -B skills/writing/templates/check_prose.py skills/writing/references/anti-patterns.md` prints four `flagged` lines at line 15 (quoted under verify 6). |
| 6 | Report with "Doc text" | DONE | This file; section "Doc text" at the end. |
| V1 | Verify list through `verify.sh` | NOT DONE (red, environment) | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md` printed `RED: sh skills/land/templates/land.test.sh 2>&1 \| tail -1`, `exit status: 1`, `FAIL: planted]`, exit 1. The other seven commands, run through the same runner from a scratch state file that holds only them, printed the lines quoted below, then `verify: 7 commands passed`, exit 0. |
| V2 | The test | DONE | `sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1` prints `PASS: check_prose.py scratch tests`. |
| V3 | Each new case red under its revert | DONE | 62 reverts, each one change in a scratch copy of the script, run under the tree's test file: all 62 red. Table below. |
| V4 | The probes | DONE | `proserows.tex` (the q2 probe verbatim) prints `semicolons` at 2, 3 and 5 only, exit 1 (output below). `python3 -B skills/writing/templates/check_prose.py skills/plan-retro/SKILL.md \| grep contrast` prints nothing (grep exit 1). |
| V5 | The 60 LaTeX files | DONE | 41 lines turned into running prose holding a semicolon, the 40 captions and the `{\footnotesize ...}` note, which matches decision 1's count; 0 lines turned into data rows. List below. |
| V6 | Before and after on the pages | DONE | Two differences, both explained below. |
| V7 | ASCII and paths | DONE | `LC_ALL=C grep -n '[^ -~]'` over the three changed files and this report prints nothing (exit 1); `git status --short --untracked-files=all` lists the four paths of "Paths this step writes" (quoted below). |

The lines the runner printed for the seven commands after `land.test.sh`:

```
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 7 commands passed
```

The ASCII check (the eighth command) printed nothing within that run, which is its pass.

## Cases and reverts

Each revert is one replacement in a scratch copy of `check_prose.py`, written as old text, then "to", then new text. The red line is the first failing line of the named case, taken from a run of the test with `fail` made non-fatal, so each case's own line is shown even when an earlier fixture fails first. The runs of the tree's own test file (fatal `fail`) were red for all 62 reverts as well.

| Branch or rule | Case | Revert | Red line |
|---|---|---|---|
| Branch 1, a structure command inside a heading's braces is skipped | `headingitem.tex` | the two lines `if match.start() < position:` / `continue` removed | `FAIL: headingitem.tex contrast: flagged lines [1 1 2 2], expected [1 2 2]` |
| Branch 2, list depth floor | `strayitemize.tex` | `state["list"] = max(state["list"] - 1, 0)` to `state["list"] = state["list"] - 1` | `FAIL: strayitemize.tex equal-length: flagged lines [], expected [2]` |
| Branch 3, table depth floor | `straytabular.tex` | `state["table"] = max(state["table"] - 1, 0)` to `state["table"] = state["table"] - 1` | `FAIL: straytabular.tex: exit 0, expected 1 []` |
| Branch 4, stray `\end{abstract}` | `strayabstract.tex` | `if state["abstract"] is not None:` to `if True:` | `FAIL: strayabstract.tex: stderr is not empty [Traceback (most recent call last):` |
| Branch 5, one piece on the line (`len(self.pieces) - first == 1`) | `piecerow.tex` lines 1 and 3 | ` and len(self.pieces) - first == 1 and` to ` and` | `FAIL: piecerow.tex semicolons: flagged lines [6], expected [1 3 6]` |
| Branch 6, the `\item` label is the item's text | `itemlabel.tex` | `self.add(i, "item", latex_plain(match.group("label") or ""))` to `self.add(i, "item", "")` | `FAIL: itemlabel.tex: exit 0, expected 1 []` |
| Branch 7, the comma form's window may hold "but" | `butcomma.md` | `WINDOW.replace(r"(?!but\b)", "")` to `WINDOW` | `FAIL: butcomma.md: exit 0, expected 1 []` |
| Branch 9, white space around a heading's optional argument | `spacedheading.tex` | `section\*?\s*(?:\[[^\]]*\]\s*)?\{` to `section\*?(?:\[[^\]]*\])?\{` | `FAIL: spacedheading.tex section-words: no line [spacedheading.tex:1: section-words: "Methods": 2 words, over the limit of 1] in [spacedheading.tex:1: section-words: "Methods": no heading matches this limit]` |
| Branch 10, a tab between arguments | `spacerow.tex` line 1 (control line 2) | `text[position] in " \t"` to `text[position] in " "` | `FAIL: spacerow.tex semicolons: flagged lines [1 2 4], expected [2 4]` |
| Branch 11, the line is stripped before it is read | `spacerow.tex` line 3 (control line 4) | `latex_data_row(line.strip(), state["row"])` to `latex_data_row(line, state["row"])` | `FAIL: spacerow.tex semicolons: flagged lines [2 3 4], expected [2 4]` |
| Branch 12, inline math does not span a blank line | `dollarblank.tex` | `(?:\\.\|(?!\n[ \t]*\n)[^$\\])` to `(?:\\.\|[^$\\])` | `FAIL: dollarblank.tex filler: flagged lines [3], expected [1 3]` |
| A one-command line is a data row | `argrow.tex`, `nestedrow.tex`, `customrow.tex` | `return command.group(0).rstrip("*")[1:] not in PROSE_COMMANDS` to `return False` | `FAIL: argrow.tex: exit 1, expected 0 []`; `FAIL: nestedrow.tex: exit 1, expected 0 []`; `FAIL: customrow.tex: exit 1, expected 0 []` |
| Its argument lines are data rows | `argrow.tex`, `emptyarg.tex` | `return after_row and only_arguments(text) and not SWITCH_GROUP.match(text)` to `return False` | `FAIL: argrow.tex: exit 1, expected 0 []`; `FAIL: emptyarg.tex: exit 1, expected 0 []` |
| Prose command `\footnote` | `proserows.tex` line 2, `prosecommands.tex` lines 1 and 2 | `"footnote"` to `"xfootnote"` in `PROSE_COMMANDS` | `FAIL: proserows.tex semicolons: flagged lines [3 5], expected [2 3 5]` |
| Prose command `\caption` | `caption.tex`, `customrowcontrol.tex` | `"caption"` to `"xcaption"` | `FAIL: caption.tex: exit 0, expected 1 []` |
| Prose command `\emph` | `proserows.tex` line 3 | `"emph"` to `"xemph"` | `FAIL: proserows.tex semicolons: flagged lines [2 5], expected [2 3 5]` |
| Prose command `\textbf` | `prosecommands.tex` lines 7 and 8 | `"textbf"` to `"xtextbf"` | `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 9 10 11 12 13 14 15 16 17], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]` |
| Prose command `\textit` | lines 9 and 10 | `"textit"` to `"xtextit"` | `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 7 8 11 12 13 14 15 16 17], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]` |
| Prose command `\textsl` | lines 11 and 12 | `"textsl"` to `"xtextsl"` | `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 7 8 9 10 13 14 15 16 17], expected [...]` (same expected list) |
| Prose command `\textsc` | lines 13 and 14 | `"textsc"` to `"xtextsc"` | `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 15 16 17], expected [...]` |
| Prose command `\underline` | lines 15 and 16 | `"underline"` to `"xunderline"` | `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 13 14 17], expected [...]` |
| Starred forms | `prosecommands.tex` even lines 2 to 16 | `command.group(0).rstrip("*")[1:]` to `command.group(0)[1:]` | `FAIL: prosecommands.tex semicolons: flagged lines [1 3 5 7 9 11 13 15 17], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]` |
| A command followed by text is prose | `prosecommands.tex` line 17, `nestedrowcontrol.tex` | `if command and only_arguments(text, command.end()):` to `if command:` | `FAIL: nestedrowcontrol.tex: exit 0, expected 1 []`; `FAIL: prosecommands.tex semicolons: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16], expected [... 17]` |
| A switch group after a data row is prose | `sizegroup.tex`, `switchgroups.tex` | ` and not SWITCH_GROUP.match(text)` removed | `FAIL: sizegroup.tex: exit 0, expected 1 []`; `FAIL: switchgroups.tex semicolons: flagged lines [], expected [2 4 6 8 10 12 14 16 18 20 22 24 26 28 30]` |
| Each switch (15 reverts) | `switchgroups.tex` lines 2, 4, ..., 30, one per switch in the order of `SWITCHES` | `"<switch>",` removed from `SWITCHES` | e.g. `switch tiny`: `FAIL: switchgroups.tex semicolons: flagged lines [4 6 8 10 12 14 16 18 20 22 24 26 28 30], expected [2 4 ... 30]`; each of the 15 drops exactly its own line (`\footnotesize` also turns `sizegroup.tex` red: `FAIL: sizegroup.tex: exit 0, expected 1 []`) |
| A switch name ends at a non-letter (near miss `{\smallskip`, `{\emph{x}`) | `switchgroups.tex` lines 32, 34 | `(?:%s)(?![A-Za-z@])` to `(?:%s)` | `FAIL: switchgroups.tex semicolons: flagged lines [2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34], expected [2 4 ... 30]` |
| The switch follows "{" directly (near miss `{ \small`) | `switchgroups.tex` line 36 | `re.compile(r"\{\\` to `re.compile(r"\{\s*\\` | `FAIL: switchgroups.tex semicolons: flagged lines [2 4 ... 30 36], expected [2 4 ... 30]` |
| An argument line needs a data row before it | `semirow.tex` line 21, `noindentgroup.tex`, `piecerow.tex` line 6 | `return after_row and only_arguments(text)` to `return only_arguments(text)` | `FAIL: semirow.tex semicolons: flagged lines [5 17], expected [5 17 21]`; `FAIL: noindentgroup.tex: exit 0, expected 1 []` |
| A blank line ends the argument lines | `semirow.tex` line 21 | the line `state["row"] = False` under the blank-line branch removed | `FAIL: semirow.tex semicolons: flagged lines [5 17], expected [5 17 21]` |
| The one piece must be prose (`len(added) == 1`) | `piecerow.tex` line 6 (after `\section{Methods}`) | `row = len(added) == 1 and len(` to `row = len(` | `FAIL: piecerow.tex semicolons: flagged lines [1 3], expected [1 3 6]` |
| A one-command line with no text starts no data row | `noindentgroup.tex` lines 2 and 4 | `row = state["row"] and only_arguments(line.strip())` to `row = latex_data_row(line.strip(), state["row"])` | `FAIL: noindentgroup.tex: exit 0, expected 1 []` |
| A no-text line carries the row only after a data row | `noindentgroup.tex` line 9 | `row = state["row"] and only_arguments(line.strip())` to `row = only_arguments(line.strip())` | `FAIL: noindentgroup.tex semicolons: flagged lines [2 4 7], expected [2 4 7 9]` |
| A no-text line carries the row only when it holds only arguments | `noindentgroup.tex` line 7 | `row = state["row"] and only_arguments(line.strip())` to `row = state["row"]` | `FAIL: noindentgroup.tex semicolons: flagged lines [2 4], expected [2 4 7 9]` |
| An empty argument line carries the row | `emptyarg.tex` | `row = state["row"] and only_arguments(line.strip())` to `row = False` | `FAIL: emptyarg.tex: exit 1, expected 0 []` |
| q2 line 5 (after `\noindent`, opened by `\small`): prose by two rules at once | `proserows.tex` line 5 | the no-text revert above together with the removal of ` and not SWITCH_GROUP.match(text)` | `FAIL: proserows.tex semicolons: flagged lines [2 3], expected [2 3 5]` |
| A code span ends the contrast window | `codespan.md`, `codespanlines.md` | `marked = CODE_SPAN.sub("`", line)` to `marked = CODE_SPAN.sub(" ", line)` | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 11 13 15 17 19], expected [1 3 5 9]`; `FAIL: codespanlines.md: exit 1, expected 0 []` |
| ... in a paragraph | `codespan.md` line 11 | `self.add(i, kind, text, marked)` to `self.add(i, kind, text)` for kind text | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 11], expected [1 3 5 9]` |
| ... in a heading | line 13 | `self.add(i, kind, title, marked[start:start + len(title)])` to `self.add(i, kind, title)` | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 13], expected [1 3 5 9]` |
| ... in a list item | line 15, `codespanlines.md` | `marked[item.end():]` argument removed | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 15], expected [1 3 5 9]` |
| ... in a continuation line | line 17 | `self.add(i, kind, text, marked)` to `self.add(i, kind, text)` for kind cont | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 17], expected [1 3 5 9]` |
| ... in a table cell | line 19 | `self.add(i, "cell", cell, marked_cell)` to `self.add(i, "cell", cell)` | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 19], expected [1 3 5 9]` |
| The contrast check reads the marked text | `codespan.md` | `target = marked[offset:offset + len(sentence)]` to `target = sentence` | `FAIL: codespan.md contrast: flagged lines [1 3 5 9 11 13 15 17 19], expected [1 3 5 9]` |
| Throat phrase "In today's rapidly evolving" | `throatforms.md` and `.tex` line 1 | the phrase removed from `THROAT_PHRASES` | `FAIL: throatforms.md throat-clearing: flagged lines [2 3 4 5 6 8], expected [1 2 3 4 5 6 8]` (the `.tex` gives the same with its name) |
| "It is important to note that" | line 2; line 7 without "that" stays silent | removed | `FAIL: throatforms.md throat-clearing: flagged lines [1 3 4 5 6 8], expected [1 2 3 4 5 6 8]` |
| "As a matter of fact" | line 3, and lines 8 to 9 across a line end | removed | `FAIL: throatforms.md throat-clearing: flagged lines [1 2 4 5 6], expected [1 2 3 4 5 6 8]` |
| "We now turn our attention to" (upper case) | line 4 | removed | `FAIL: throatforms.md throat-clearing: flagged lines [1 2 3 5 6 8], expected [1 2 3 4 5 6 8]` |
| "This section will discuss" | line 5 | removed | `FAIL: throatforms.md throat-clearing: flagged lines [1 2 3 4 6 8], expected [1 2 3 4 5 6 8]` |
| "The following paragraph examines" | line 6 | removed | `FAIL: throatforms.md throat-clearing: flagged lines [1 2 3 4 5 8], expected [1 2 3 4 5 6 8]` |

The cases that assert silence, with their controls and the control's flag line from the tree:

| Silent case | Control (the near miss the rule reports) | Control output |
|---|---|---|
| `argrow.tex`: `{Journal article. ...}` after `\keyoutput{A}` | `noindentgroup.tex` line 2: the same line after `\noindent` | `noindentgroup.tex:2: semicolons: "Journal article. Indicators: methodological innovation; use ": 7 semicolons in 37 words of running prose, more than 2 per 1000 words` |
| `nestedrow.tex`: a command nested inside the one argument | `nestedrowcontrol.tex`: `\formfield{Research idea} \limit{(...)}`, the second command outside the argument | `nestedrowcontrol.tex:1: semicolons: "Research idea (Science: max. 500 words; plain text only, no ": 1 semicolon in 31 words of running prose, more than 2 per 1000 words` |
| `customrow.tex`: `\leg{WP1}{...}` | `customrowcontrol.tex`: `\caption[WP1]{...}` | `customrowcontrol.tex:1: semicolons: "[WP1]A self-supervised objective; a second clause; a third o": 2 semicolons in 30 words of running prose, more than 2 per 1000 words` |
| `emptyarg.tex`: `{}` inside a data row's argument lines | `noindentgroup.tex` line 9: `{}` after a prose line | `noindentgroup.tex:9: semicolons: "Eight; nine; ten.": 7 semicolons in 37 words of running prose, more than 2 per 1000 words` |
| `codespanlines.md` and `codespan.md` lines 7, 11 to 19 | `codespan.md` line 9, the same sentence with "a page" | `codespan.md:9: contrast: "not an entry in the form of a page, it": a binary contrast, 4 in this file, more than 2` |
| `spacerow.tex` lines 1 and 3 | lines 2 and 4 of the same file | flagged at 2 and 4 (assertion `expect_all spacerow.tex ... '2 4'`) |
| `switchgroups.tex` lines 32, 34, 36 | lines 2 to 30 | flagged at 2, 4, ..., 30 |
| `throatforms.*` line 7 (no "that") | line 2 | flagged at 2 |

Branch 8, removed (`if plain.strip():` before a LaTeX cell was added). The argument that no input's output depends on it: without the guard, a LaTeX table cell whose text is empty is added as a `cell` piece. An empty cell holds no word, no semicolon and no character that any check's pattern matches, so `words`, `find_phrases`, `sentences` and `check_contrast` give nothing on it; `check_semicolons` and the paragraph data-row rule read only text, item and cont pieces; `section-words` adds its 0 words. Its effect on grouping is also nil. A cell exists only while a table is open. A table's text goes only to cells, and every `\begin` or `\end` of a table adds an `other` piece, so the piece before a text piece or a cont piece after a table is always that `other` piece, never a cell. A math piece joins a block only when the piece before it is text, item or cont, and a math piece carries no text. The data-row state inside a table is always false: the line that opens the table adds an `other` piece, which makes that line not a data row, and no line inside the table adds a text piece. Markdown already adds empty cells unconditionally (`CELL_SPLIT.split`). The whole test is green on the tree without the guard (`PASS: check_prose.py scratch tests`). Beyond the test, the old and the new script give no difference in any check other than contrast, throat-clearing and semicolons over 327 tracked `.md` and `.tex` files and the 60 research-hub files (below).

## Verify 4: the q2 probe

`proserows.tex` holds the six lines of `q2.tex` verbatim. The tree's output:

```
proserows.tex:2: semicolons: "A note that holds one; two; three; four semicolons in a sing": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
proserows.tex:3: semicolons: "An emphasised line; with one semicolon; and another; and a f": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
proserows.tex:5: semicolons: "A small group; with semicolons; three; and four of them.": 9 semicolons in 53 words of running prose, more than 2 per 1000 words
```

Exit 1.

## Verify 5: the 60 LaTeX files

A scratch script loaded the base script and the new script as modules, read each of the 60 files with both, and compared the text pieces holding a semicolon that each marks as a data row. Output: `files: 60 data rows holding a semicolon before: 64`, `turned into running prose: 41`, `turned into data rows: 0`. The 41, by file and line (paths under research-hub):

- `funding/2026-fwo-senior-transplant/proposal/figs/fig-concept.tex:129` (`\caption`)
- `funding/2026-fwo-senior-transplant/meetings/2026-07-03-naesens/concept.tex:48` (`{\footnotesize ...}`)
- `projects/manuscripts/bttd-source-eeg/manuscript/main.tex:324, 367`
- `projects/manuscripts/dongho-ecg-clustering/manuscript/main.tex:563`
- `projects/manuscripts/btfno/manuscript/supplement.tex:121`
- `projects/manuscripts/btfno/manuscript/main.tex:175, 187, 240, 279`
- `projects/active/linfoot-estimator/manuscript/main.tex:185`
- `projects/manuscripts/dries-bttr-ecg/manuscript/main.tex:106, 125, 133, 157, 180`
- `projects/manuscripts/bttn-incident-af/manuscript/main.tex:107, 180, 228, 257, 290, 311, 354`
- `projects/manuscripts/bt-operator-theory/manuscript/main.tex:462, 602, 626, 646`
- `projects/manuscripts/ecg-readable-substrate/manuscript/main.tex:113, 120, 129, 161`
- `projects/manuscripts/covert-applied/manuscript/main.tex:863`
- `projects/manuscripts/meseret-cirrhosis/manuscript/main.tex:162, 210, 227, 268`
- `projects/manuscripts/ward-bttr-crosssubject/manuscript/body.tex:764` and `body_2col.tex:764`
- `projects/manuscripts/fed-multicellular-immune/manuscript/main.tex:490, 557, 576`

All but `concept.tex:48` are `\caption{...}` lines (`grep -c caption` over the list: 40). The count matches decision 1. Decision 1's six named lines, read by both scripts: `veni2026.tex:75` data row before and after; `veni2026.tex:161` data row before and after; `dries-bttr-ecg/manuscript/main.tex:106` data row before, running prose after; `concept.tex:48` data row before, running prose after; `concept.tex:62` data row before and after; `fig-concept.tex:30` data row before and after.

## Verify 6: the pages before and after

`python3 -B skills/writing/templates/check_prose.py <file>`, output saved before any change and after, then `diff -r`:

- `skills/writing/references/academic-prose.md`: one line added, `skills/writing/references/academic-prose.md:96: throat-clearing: "it is important to note that": a throat-clearing opener, to be cut`. Line 96 quotes the phrase in a sentence that says `anti-patterns.md` holds it, the way the same line already quotes "in order to" (flagged before and after). The flag comes from item 4. The page is outside this step's paths, so it is not edited (see the judgment calls).
- `skills/writing/references/anti-patterns.md`: the four `flagged` lines ("landscape", "navigate", "paradigm", "robust") moved from line 21 to line 15, because six rows above them left the table. After:

```
skills/writing/references/anti-patterns.md:15: flagged: "landscape": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:15: flagged: "navigate": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:15: flagged: "paradigm": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:15: flagged: "robust": a flagged word, to be checked against section A of the prose standard
```

- `judgment.md` (0 lines), `prose-standard.md` (68 lines), `README.md` (0 lines) and `docs/dev/change-standard.md` (18 lines): identical before and after.

A wider comparison, base script against new script, over the 327 tracked `.md` and `.tex` files other than `anti-patterns.md` (`git ls-files '*.md' '*.tex'`): only `contrast` and `throat-clearing` lines differ. Every added throat-clearing line is a quotation of one of the six phrases (in `academic-prose.md:96` and in ledger files such as `plan.md:17` and the briefs). Every removed contrast line either had a code span inside its match (for example `skills/plan-retro/SKILL.md:41`) or disappeared because its file's count fell to 2 or fewer (`skills/plan-retro/SKILL.md:70` and `92`); in `.scratch/archive/2-b-.../plan.md` the remaining lines keep their flag with the count lowered from 7 to 6. Over the 60 research-hub files only `semicolons` lines (item 2) and three `throat-clearing` lines differ; the three are real uses of "It is important to note that" (`funding/2024-fwo-postdoc-fbttr/fwo-postdoc/main.tex:346`, `main-old.tex:141` and `363`).

## Verify 7: ASCII and paths

`LC_ALL=C grep -n '[^ -~]' skills/writing/templates/check_prose.py skills/writing/templates/check_prose.test.sh skills/writing/references/anti-patterns.md .scratch/3-the-writing-base/agents/reviews/2a-report.md` prints nothing. `git status --short --untracked-files=all`:

```
 M skills/writing/references/anti-patterns.md
 M skills/writing/templates/check_prose.py
 M skills/writing/templates/check_prose.test.sh
?? .scratch/3-the-writing-base/agents/reviews/2a-report.md
```

## Files changed

| File | Lines now | `git diff --numstat` (added, removed) |
|---|---|---|
| `skills/writing/templates/check_prose.py` | 818 | 74, 32 |
| `skills/writing/templates/check_prose.test.sh` | 1537 | 258, 7 |
| `skills/writing/references/anti-patterns.md` | 42 | 2, 8 |
| `.scratch/3-the-writing-base/agents/reviews/2a-report.md` | new | this report |

The test's total moved upward only by the cases added: 26 fixtures and their assertions (`proserows.tex`, `argrow.tex`, `nestedrow.tex`, `caption.tex`, `sizegroup.tex`, `customrow.tex`, `customrowcontrol.tex`, `nestedrowcontrol.tex`, `noindentgroup.tex`, `emptyarg.tex`, `prosecommands.tex`, `switchgroups.tex`, `piecerow.tex`, `spacerow.tex`, `codespan.md`, `codespanlines.md`, `throatforms.md`, `throatforms.tex`, `headingitem.tex`, `spacedheading.tex`, `strayitemize.tex`, `straytabular.tex`, `strayabstract.tex`, `itemlabel.tex`, `butcomma.md`, `dollarblank.tex`); no existing assertion was changed. The test's header comment names the new file families (throatforms, the LaTeX data-row files, codespan).

Sentences about a changed file as a whole, reread after the change:

- `check_prose.py` docstring, "The script never writes to a file" and the Inputs, Output, Errors and Exit status lists: no input, output form, error or status was added or changed; each still holds.
- `check_prose.py` docstring, "throat-clearing: in prose, case-insensitive, each phrase of THROAT_PHRASES, across any run of white space": holds for the six added phrases (`throatforms.*` lines 4 and 8 to 9).
- `anti-patterns.md` line 3, "The patterns in the table below are judged by hand": holds. Row 14's dash form is reported by `dash-aside` as a dash, but whether it counts toward section D's contrast limit is still judged by hand, and the row says so.
- `anti-patterns.md` line 34, "Each entry names the section of the prose standard that holds the rule, and some add the fix": holds for the rewritten entry at line 40 (section C, and the two fixes).
- `academic-prose.md:96`, "`references/anti-patterns.md` holds "it is important to note that"": still true, line 40 of `anti-patterns.md` holds it.
- Grep for the removed names: `grep -rn "one_command\|state\[\"command\"\]" skills utils docs README.md` prints nothing (exit 1).

## Judgment calls the brief left open

1. **A one-command line that leaves no text.** The brief calls `\noindent` "a line that is not a data row". The script reads that as: a one-command line whose reading adds no piece of prose (`\noindent`, `\vspace{3pt}`) does not start a data row, so a brace line after it is not an argument line. A line of only arguments that leaves no text inside a data row's argument lines (`{}`) carries the row on. Without the second half, `veni2026.tex:147` (after `{}` at line 146) would become prose, and the count would be 42, not decision 1's 41. Both halves are stated in the docstring and have cases (`noindentgroup.tex`, `emptyarg.tex`).
2. **A brace group no switch opens, after a line that is not a data row.** The brief says such a line "is a brace group, read by the second rule". The script reads it as running prose, as it was before this step (`semirow.tex:21`), because only a data row carries arguments onto the next line. The docstring says so in those words. The other reading (a data row unless a switch opens it) would turn an existing prose line into a data row, which ruling E, a rule that only turns data rows into prose, does not ask for.
3. **The switch follows "{" directly.** The brief lists the forms as `{\tiny` and so on. `{ \small` (a space after the brace) is not read as a switch group, and the docstring says "directly". Case: `switchgroups.tex` line 36.
4. **A line that also holds a heading, an `\item`, a cell, or a list, table or abstract begin or end is not a data row.** This is branch 5 as it stood; the docstring now states it.
5. **Fixture shapes.** The twenty-word sentence follows each data-row case in the same paragraph, so that the one-line data-row rule for a paragraph never decides the case. `sizegroup.tex` puts `\keyoutput{A}` before the `{\footnotesize ...}` line, so that the switch rule alone decides it (as line 1 of a file it is prose on the unchanged tree too). `codespan.md` keeps the brief's line and adds the red-able shape, as described in the first run. `strayitemize.tex` also asserts `equal-length`, because the `semicolons` flag alone is the same whether the paragraph is read as prose or as a list item; `equal-length` reads prose only. `strayabstract.tex` carries one `filler` word, so the case shows the file is read past the stray end.
6. **How the contrast window sees a code span.** Each Markdown piece carries a second text, `contrast_text`, the same text with each removed code span shown as a backtick, which ends the window. Only `check_contrast` reads it, with the sentence and offset taken from the unchanged text (both texts have the same length), so no other check can change.
7. **Row 14 of `anti-patterns.md`** keeps its existing sentence about the `contrast` check and adds the ruling D sentence to the same cell.
8. **`academic-prose.md:96`** now draws a `throat-clearing` flag for its quoted mention of "it is important to note that". The page is outside this step's paths and is not edited. The line already carries a flag of the same kind for "in order to". Whether to reword the line is the orchestrator's decision.

## User-visible changes, before and after

- `semicolons` on LaTeX: before, a line of one prose command (`\caption{...}`, `\footnote{...}`, `\emph{...}` and the rest of the list) and a `{\small ...}` line after a one-command line were data rows and not counted. After, they are running prose and counted. A brace line after a command that leaves no text (`\noindent`, `\vspace{...}`) is running prose. Custom commands and their argument lines stay data rows. On the 60 files: 41 lines more are counted.
- `contrast` on Markdown: before, a match could run across a removed code span (`plan-retro/SKILL.md:41`); after, the place of a code span ends the window.
- `throat-clearing`: six more phrases are reported.
- `anti-patterns.md`: the six phrase rows are gone from the table; the list entry names the phrases as found by the script, with the short fixes; row 14 says the dash form is reported by `dash-aside` and the colon and semicolon forms are judged by hand.
- The script's interface is unchanged: the same arguments, output line, exit statuses 0, 1 and 64, and no file written.

## Wrong or impossible in the brief

- **Verify item 1 cannot print `verify: 8 commands passed` here.** `land.test.sh` is red on this worktree and on an export of the base commit (`git archive d5b8c4a`, run in the scratchpad: `FAIL: red list runner output: missing [PASS: before the red line ... FAIL: planted]`). A scratch copy that prints the landing output shows `verify: python3 cannot import yaml; install PyYAML`. The case sets `HOME` to a scratch folder. `python3 -c "import yaml; print(yaml.__file__)"` prints `/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py` (the user site-packages, found through `HOME`), and `HOME=/nonexistent python3 -c "import yaml"` fails with `ModuleNotFoundError: No module named 'yaml'`. With that folder on `PYTHONPATH`, `sh skills/land/templates/land.test.sh 2>&1 | tail -1` prints `PASS: land.sh and usage.py scratch tests`. The cause is where PyYAML is installed on this machine, and the land skill's files are outside this step's paths. The options (install PyYAML where `python3` finds it without `HOME`, or change the land test) are the orchestrator's to choose.
- **The branch 5 probe.** The brief says a scratch copy without branch 5 "gave the same output" on its probe. An input does reach branch 5: `\item{...}` in a list (`piecerow.tex` line 3). The same holds for branches 10 and 11, whose probes lacked a closing full stop, so the paragraph data-row rule hid them. Each now has a case that its revert turns red.
- **The brief's code-span line** is uncounted on the unchanged tree already (see the first run). The added line 11 carries the defect.

## Doc text

Line numbers of `skills/writing/references/anti-patterns.md`, on main at the base (48 lines) and now (42 lines):

| Line on main | Line now | Change |
|---|---|---|
| 1 to 13 | 1 to 13 | unchanged |
| 14 | 14 | changed: the "Why it fails" cell of the one-sentence contrast row gains the ruling D sentence |
| 15 | removed | "In today's rapidly evolving..." row |
| 16 | removed | "It is important to note that..." row |
| 17 | removed | "As a matter of fact..." row |
| 18 | removed | "We now turn our attention to..." row |
| 19 | removed | "This section will discuss..." row |
| 20 | removed | "The following paragraph examines..." row |
| 21 to 45 | 15 to 39 | moved, text unchanged |
| 46 | 40 | changed: the throat-clearing list entry names the six phrases and the short fixes |
| 47 to 48 | 41 to 42 | moved, text unchanged |

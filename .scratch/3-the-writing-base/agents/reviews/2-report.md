Everything in the brief, the cases ruling and repair round 1 is done

## Open items of the state file, verbatim

- None.

## The cases' first run, on the unchanged tree

The cases were written as `skills/writing/templates/check_prose.test.sh` (cases 1 to 4 inside it) and two runners in the builder's scratchpad outside the worktree (`case5.sh`, turning each check off in a scratch copy of the script, and the case 6 command). Run before `check_prose.py` existed:

| Case | Command | Result on the unchanged tree |
|---|---|---|
| 1 | `python3 skills/writing/templates/check_prose.py --limit 'Methods=100' sample.md`, and `sample.tex` with `--limit 'Abstract=10'` | `can't open file '.../skills/writing/templates/check_prose.py': [Errno 2] No such file or directory`, exit 2 for each: red |
| 2 | the same on `clean.md` (`--limit ' limits =12'`) and `clean.tex` (`--limit 'abstract=12'`) | the same message, exit 2 for each: red |
| 3 | no file, `--limit Abstract`, `--limit Abstract=0`, a missing file, a non-UTF-8 file | exit 2 for each, not 64: red |
| 4 | `sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1` | `FAIL: sample.md: exit 2, expected 1 [... can't open file '.../check_prose.py': [Errno 2] No such file or directory]`, exit 1: red |
| 5 | `sh <scratchpad>/case5.sh skills/writing/templates` | `<check>: no check_prose.py to turn the check off in`, for all twelve checks: cannot run |
| 6 | `python3 skills/writing/templates/check_prose.py skills/writing/references/prose-standard.md` | file not found, exit 2: red |

The case the brief's rules got wrong, found while building the cases: `dash-aside` flags `--` in Markdown prose, and a table row (a line starting with `|`) is prose, so every table separator row such as `|---|---|` is flagged. The clean Markdown file's table (lines 47 to 49, separator at line 48) could then not pass case 2. `git ls-files '*.md' | grep -v '^\.scratch' | xargs grep -hE '^\|[ :|-]*--' | wc -l` printed 42, in 16 tracked pages. Raised with four related points (thematic breaks and comment markers, LaTeX date ranges with spaces, display math, combining marks and U+2705).

The orchestrator's ruling, `agents/briefs/2-cases.md` (round 0), applied as written:

1. Table separator rows: (a). A Markdown line of only `|`, `-`, `:` and spaces holding a `-` is not read by `dash-aside`; data rows still are. The clean file keeps its separator row (clean.md line 48); the near miss is dash.md line 11, a data row with `--` and ` - `, flagged twice.
2. A Markdown thematic break (a line of three or more `-`, `*` or `_` with optional spaces) and the markers `<!--` and `-->` are not read by `dash-aside`; the text inside a comment is prose. Cases: dash.md lines 24, 26, 28 (breaks), line 30 (one-line comment) and lines 32 to 34 (multi-line comment), the `--` aside inside each comment flagged at 30 and 33.
3. A dash between two digits with one space on each side is a number range and passes: dash.tex line 12 (`2023 -- 31`, `2023 - 2024`) and dash.md line 36 (`2023 - 2024`, `3 -- 5`) pass; dash.tex lines 13, 14 and dash.md lines 38, 40 (a letter on one side) are flagged.
4. LaTeX display math is left out: `$$...$$`, `\[...\]` and gather, multline, eqnarray, displaymath, math, starred too. Cases: dash.tex lines 15 to 24, each with a spaced hyphen inside the math (not flagged) and the same hyphen outside it (flagged once per line).
5. `non-ascii`: a combining mark after a letter or another combining mark passes; after anything else it is flagged; U+2705 is flagged in every file form. Cases: nonascii.md line 7 (a decomposed name, passes), line 8 (a lone U+0301 after a space, flagged), line 5 (U+2705 in a .md file, flagged).

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| `check_prose.py`, standard library only, twelve checks, the output line, exits 0/1/64, head docstring | DONE | `grep -n '^import' skills/writing/templates/check_prose.py` | `84:import re`, `85:import sys`, `86:import unicodedata` |
| `check_prose.test.sh` | DONE | `sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1` | `PASS: check_prose.py scratch tests`, exit 0 |
| `docs/dev/building.md` command block | DONE | `git diff docs/dev/building.md` | `+sh skills/writing/templates/check_prose.test.sh        # check_prose.py on sample, clean and edge-case Markdown, LaTeX and plain-text files, and its usage errors`, after the `utils/check_coverage.test.sh` line |
| `docs/dev/change-standard.md` command block | DONE | `git diff docs/dev/change-standard.md` | `+sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1`, after the `utils/check_coverage.test.sh` line |
| README requirements reread | DONE | `grep -n 'PyYAML' README.md` | `47:- git, POSIX `sh`, and `python3` with PyYAML. ...`: it holds unchanged, since the script imports only `re`, `sys` and `unicodedata` |
| Verify 1: the plan's verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md` | the block below |
| Verify 2: the test | DONE | `sh skills/writing/templates/check_prose.test.sh 2>&1 \| tail -1` | `PASS: check_prose.py scratch tests`, exit 0 |
| Verify 3: cases 1 to 6 | DONE | below | below |
| Verify 4: diff and status | DONE | `git diff --stat`; `git status --short` | below |
| Verify 5: rule-13 table | DONE | `python3 <scratchpad>/reverts.py skills/writing/templates <scratchpad>` | 100 reverts, each exit 1 with a `FAIL:` line, in the table below |

The verify runner printed:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit 0
```

### Case 1

Run in the test's scratch folder (a copy of the test with its cleanup trap removed, under the builder's scratchpad). The planted U+2019 is written here as `<U+2019>` to keep this report ASCII.

```
sample.md:1: section-words: "Methods": 230 words, over the limit of 100
sample.md:6: non-ascii: "<U+2019>": U+2019 is not ASCII and not a letter
sample.md:9: dash-aside: "read - and": a dash used as an aside
sample.md:11: history: "was changed": a word of history, to be checked
sample.md:13: throat-clearing: "In order to": a throat-clearing opener, to be cut
sample.md:15: filler: "simply": a filler word, to be checked against section A of the prose standard
sample.md:17: vague: "often": a vague qualifier, to be checked against section A of the prose standard
sample.md:19: flagged: "robust": a flagged word, to be checked against section A of the prose standard
sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words
sample.md:23: contrast: "not a style guide, it": a binary contrast, 3 in this file, more than 2
sample.md:25: contrast: "not a target but a": a binary contrast, 3 in this file, more than 2
sample.md:27: contrast: "not a verdict, a": a binary contrast, 3 in this file, more than 2
sample.md:29: equal-length: "The first file is read.": 5 consecutive sentences of 5, 5, 5, 5, 5 words
sample.md:36: colon-lists: "For a usage error, it prints the reason to standard error an": a second consecutive paragraph that ends with a colon and opens a list
exit 1
sample.tex:3: section-words: "Abstract": 20 words, over the limit of 10
sample.tex:6: non-ascii: "<U+2019>": U+2019 is not ASCII and not a letter
sample.tex:8: dash-aside: "read --- and": a dash used as an aside
sample.tex:9: history: "was changed": a word of history, to be checked
sample.tex:10: throat-clearing: "In order to": a throat-clearing opener, to be cut
sample.tex:11: filler: "simply": a filler word, to be checked against section A of the prose standard
sample.tex:12: vague: "often": a vague qualifier, to be checked against section A of the prose standard
sample.tex:13: flagged: "robust": a flagged word, to be checked against section A of the prose standard
sample.tex:14: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words
sample.tex:15: contrast: "not a style guide, it": a binary contrast, 3 in this file, more than 2
sample.tex:16: contrast: "not a target but a": a binary contrast, 3 in this file, more than 2
sample.tex:17: contrast: "not a verdict, a": a binary contrast, 3 in this file, more than 2
sample.tex:18: equal-length: "The first file is read.": 5 consecutive sentences of 5, 5, 5, 5, 5 words
sample.tex:25: colon-lists: "For a usage error, it prints the reason to standard error an": a second consecutive paragraph that ends with a colon and opens a list
exit 1
```

Each check flags exactly its planted lines, each `<file>:<planted line>: <check>: ...`, exit 1.

### Case 2

```
clean.md: no output, exit 0
clean.tex: no output, exit 0
```

### Case 3

```
check_prose.py : exit 64, stdout 0 bytes, stderr: check_prose.py: no file given
check_prose.py --limit Abstract sample.md: exit 64, stdout 0 bytes, stderr: check_prose.py: --limit 'Abstract' is not <heading text>=<positive integer>
check_prose.py --limit Abstract=0 sample.md: exit 64, stdout 0 bytes, stderr: check_prose.py: --limit 'Abstract=0' is not <heading text>=<positive integer>
check_prose.py missing.md: exit 64, stdout 0 bytes, stderr: check_prose.py: cannot read missing.md: No such file or directory
check_prose.py latin1.md: exit 64, stdout 0 bytes, stderr: check_prose.py: latin1.md is not UTF-8
```

### Case 4

```
PASS: check_prose.py scratch tests
test exit 0
```

### Case 5

`sh <scratchpad>/case5.sh skills/writing/templates` copies the script and the test to a scratch folder outside the worktree, inserts `return []` as the first line of the check's function (`check_<name>`), and runs the test:

```
non-ascii off: FAIL: sample.md non-ascii: flagged lines [], expected [6] (exit 1)
dash-aside off: FAIL: sample.md dash-aside: flagged lines [], expected [9] (exit 1)
history off: FAIL: sample.md history: flagged lines [], expected [11] (exit 1)
section-words off: FAIL: sample.md section-words: flagged lines [], expected [1] (exit 1)
semicolons off: FAIL: sample.md semicolons: flagged lines [], expected [21] (exit 1)
throat-clearing off: FAIL: sample.md throat-clearing: flagged lines [], expected [13] (exit 1)
filler off: FAIL: sample.md filler: flagged lines [], expected [15] (exit 1)
vague off: FAIL: sample.md vague: flagged lines [], expected [17] (exit 1)
flagged off: FAIL: sample.md flagged: flagged lines [], expected [19] (exit 1)
equal-length off: FAIL: sample.md equal-length: flagged lines [], expected [29] (exit 1)
contrast off: FAIL: sample.md contrast: flagged lines [], expected [23 25 27] (exit 1)
colon-lists off: FAIL: sample.md colon-lists: flagged lines [], expected [36] (exit 1)
```

### Case 6

`python3 skills/writing/templates/check_prose.py skills/writing/references/prose-standard.md`, exit 1:

```
skills/writing/references/prose-standard.md:3: semicolons: "Every prose surface in this tree is held to this: user pages": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:13: semicolons: "**Em dash: zero.** Use a comma, a full stop, a colon, parent": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:24: semicolons: "Banned as filler; cut or replace with the concrete fact: eas": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:24: filler: "easy": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "quick": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "really": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "simple": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "simply": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:24: filler: "very": a filler word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "generally": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "many": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "most requests": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "near-zero": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "often": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "significantly": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "sub-second": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:26: vague: "typically": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: semicolons: "Flagged, not banned; each use must be the most precise word ": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:28: flagged: "comprehensive": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "cornerstone": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "crucial": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "cutting-edge": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "delve": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "embark": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "foster": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "groundbreaking": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "holistic": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "intricate": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "landscape": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "leverage": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "multifaceted": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "navigate": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "nuanced": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "paradigm": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "pivotal": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "realm": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "robust": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "showcase": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "streamline": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "synergy": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "tapestry": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "testament": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:28: flagged: "underscore": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:39: throat-clearing: "At the end of the day": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "In order to": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "In the realm of": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "It goes without saying that": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "It is worth mentioning that": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "It should be noted that": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "It's important to note that": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "This serves as a testament to": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "When it comes to": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: throat-clearing: "With that being said": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:39: flagged: "realm": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:39: flagged: "testament": a flagged word, to be checked against section A of the prose standard
skills/writing/references/prose-standard.md:41: semicolons: "Never describe what the page is about to do. "This section e": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:41: throat-clearing: "The following covers": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:41: throat-clearing: "This section explains": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:43: throat-clearing: "Now that we": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:43: throat-clearing: "With this setup complete": a throat-clearing opener, to be cut
skills/writing/references/prose-standard.md:48: semicolons: "**Paragraphs cover one idea and stay under roughly four sent": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:58: history: "Previously": a word of history, to be checked
skills/writing/references/prose-standard.md:61: semicolons: "**Personified artifacts** for colour are banned; personifica": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:64: semicolons: "**Sentence length**: under roughly 20 words unless the mecha": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:71: semicolons: "Source formatting: one paragraph or bullet per source line, ": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
skills/writing/references/prose-standard.md:75: semicolons: "Per page, in order: read the whole page; recompose at senten": 15 semicolons in 978 words of running prose, more than 2 per 1000 words
```

Each flag under the rules:

- semicolons, lines 3, 13, 24, 28, 41, 48, 61, 64, 71, 75 (15 semicolons in 978 words of running prose): right. `grep -o ';' skills/writing/references/prose-standard.md | wc -l` prints 15; the page is over its own limit of 2 per 1000 words.
- filler, line 24 (8 flags, `just` twice), vague, line 26 (8), flagged, line 28 (25): right under the rules. The lines list the words section A bans or flags; the message asks a person to check them.
- flagged, line 39 (`realm`, `testament`): right; they sit inside the quoted openers `In the realm of` and `This serves as a testament to`.
- throat-clearing, line 39 (10), line 41 (2), line 43 (2): right; the page quotes each opener it bans.
- history, line 58 (`Previously`): right; the quoted example `Previously manual. Now automatic.`.
- No flag for non-ascii, dash-aside, section-words, equal-length, contrast (2 contrasts, lines 14 and 51, not more than 2) or colon-lists. No rule was loosened for any of these.

### Diff and status

```
$ git diff --stat
 docs/dev/building.md        | 1 +
 docs/dev/change-standard.md | 1 +
 2 files changed, 2 insertions(+)
$ git status --short
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? skills/writing/templates/
```

`skills/writing/templates/` holds `check_prose.py` and `check_prose.test.sh` only (`ls skills/writing/templates`). The report is this file.

## Files

| File | Lines |
|---|---|
| `skills/writing/templates/check_prose.py` (new) | 635 |
| `skills/writing/templates/check_prose.test.sh` (new) | 949 |
| `docs/dev/building.md` | +1 |
| `docs/dev/change-standard.md` | +1 |
| `.scratch/3-the-writing-base/agents/reviews/2-report.md` (this report) | new |

## Judgment calls the brief left open

- Sentences run on across paragraphs and across the lines left out (headings, list items, tables, code) for `equal-length`; a sentence ends at `.`, `!` or `?` before a space or at the end of its paragraph. Pinned by equal.md lines 37 and 45. (End state after repair round 1: a run of equal-length sentences ends at a heading and at `\end{abstract}`, and a line of removed display math continues its paragraph; see "Repair round 1".)
- `section-words` counts the words of the section's prose lines (paragraphs, list items, table rows) without the heading line and without code, comments or math. A word is a run of letters and digits joined across `'` and `-`.
- A `--limit` whose heading appears twice in a file checks each section; two `--limit`s for one heading each apply (sections.md lines 17 and 19).
- LaTeX: `tabular` (starred), `tabularx` and `longtable` rows are table rows, and `\item` entries of itemize, enumerate and description are list items, so the general rules (tables left out of semicolons, list items left out of equal-length) reach LaTeX. Command names and the arguments of `\label`, `\ref`, `\cite`, `\usepackage`, `\documentclass` and similar carry no words. A LaTeX line of comments or commands only is neutral between paragraphs; a line emptied by removed math or code content breaks them. (End state after repair round 1: a line of removed display math continues the paragraph or list item it stands in; a line emptied by removed code content still breaks them; see "Repair round 1".)
- A Markdown list item runs on over the lines after it with no blank line, or indented after one; consecutive list items, and consecutive LaTeX list environments, form one list for `colon-lists`.
- Markdown fences follow CommonMark: indent up to 3 spaces, a closing fence of the same character at least as long, a backtick fence whose info string holds no backtick, and a fence left open runs to the end of the file. Frontmatter is a first line `---` closed by `---` or `...`; left open, it is no frontmatter. (End state after repair round 1: a fence opens at any indentation and closes at a line of the same character, at least as long, at any indentation; see "Repair round 1".)
- Plain text keeps Markdown's fences, frontmatter, lists and tables, and has no headings.
- Filler, vague and flagged words match as whole words where a hyphenated word is one word (`easy-going` does not hold `easy`); phrases match across a line break.
- The `--`-between-digits range rule of ruling 3 is applied to ` -- ` in Markdown as well as to ` - ` (dash.md line 36, `3 -- 5`), since the ruling states it for a dash between two digits in both file forms.
- Output ties on one line are ordered by the brief's order of the checks; the message opens with the quoted text, at most 60 characters, whitespace runs collapsed to one space.
- The script uses two blank lines between top-level definitions, as `check_config.py`, `sync_rules.py`, `check_coverage.py` and `usage.py` do (`awk` count of double blank lines: 5, 4, 16, 11). Change standard rule 10's `no double blank lines` is read as the prose and comment rule; the tree's Python follows PEP 8.

## User-visible changes

- New command `python3 skills/writing/templates/check_prose.py [--limit '<heading>=<words>']... <file>...`. Before: no such script. After: one line per flag, exit 0, 1 or 64, as the docstring states.
- `docs/dev/building.md` and `docs/dev/change-standard.md` command blocks. Before: six tests and the ASCII check. After: the `check_prose.test.sh` line after the `check_coverage.test.sh` line in each.
- The plan's verify list in `orchestrator-state.md` is not changed by this step; the brief gives it to the orchestrator at the landing.

Sentences about the files as a whole, reread after the change (rule 14):

- `docs/dev/building.md` line 3, `Each test builds scratch repositories under $TMPDIR and removes them; none touches the installed skills.`: holds; the test builds its scratch folder with `mktemp -d "${TMPDIR:-/tmp}/check-prose-test.XXXXXX"` and removes it in its trap, as `verify.test.sh` and `sync_rules.test.sh` do without a git repository (`grep -c 'init -q'` prints 0 for both).
- `docs/dev/building.md` line 16, `A test passes when it exits 0 and its last line starts with PASS:`: holds (case 4).
- `docs/dev/building.md` line 28, `a new script under a skill's templates/ ... adds its test here and to the command block of docs/dev/change-standard.md`: holds, both added.
- `docs/dev/change-standard.md` line 63, `Each script under a skill's templates/ or under utils/ has a test beside it that runs on scratch repositories`: holds, `check_prose.test.sh` beside `check_prose.py`.
- `grep -rn 'check_prose' skills/ utils/ docs/ README.md` finds the two new files and the two command-block lines only.

## Wrong or impossible in the brief

- The `dash-aside` rule on Markdown table separator rows: ruled, see the first run above.
- The requirements line of `README.md` is line 47, not 46: `git show HEAD:README.md | grep -n 'PyYAML'` prints `47:- git, POSIX `sh`, and `python3` with PyYAML. ...`. Its content holds unchanged.

## Rule-13 table

The twelve checks, each turned off in a scratch copy (case 5):

| Check | Planted case | Near miss | Revert | Red line |
|---|---|---|---|---|
| non-ascii | sample.md line 6 and sample.tex line 6: U+2019 in code and in a comment | clean.md line 8: an accented name | `check_non_ascii` returns `[]` | `FAIL: sample.md non-ascii: flagged lines [], expected [6] (exit 1)` |
| dash-aside | sample.md line 9 (` - `), sample.tex line 8 (`---`) | clean.md lines 10-18 and clean.tex line 9: list markers, 3-5, 3--5, a hyphenated compound, code with dashes | `check_dash_aside` returns `[]` | `FAIL: sample.md dash-aside: flagged lines [], expected [9] (exit 1)` |
| history | line 11 / line 9: was changed | clean.md line 28: changed, stepwise, steps 3, 2026-9-28 | `check_history` returns `[]` | `FAIL: sample.md history: flagged lines [], expected [11] (exit 1)` |
| section-words | sample.md line 1 Methods=100 (230 words); sample.tex line 3 Abstract=10 (20 words) | clean.md ' limits =12' and clean.tex abstract=12, each at 12 words | `check_section_words` returns `[]` | `FAIL: sample.md section-words: flagged lines [], expected [1] (exit 1)` |
| semicolons | sample.md line 21 / sample.tex line 14: 1 in 230 words | clean.md and clean.tex: 2 in over 1000 words, and a table row with semicolons | `check_semicolons` returns `[]` | `FAIL: sample.md semicolons: flagged lines [], expected [21] (exit 1)` |
| throat-clearing | line 13 / line 10: In order to | clean.md line 30: The following section, in order of size | `check_throat_clearing` returns `[]` | `FAIL: sample.md throat-clearing: flagged lines [], expected [13] (exit 1)` |
| filler | line 15 / line 11: simply | clean.md line 32: Simplest, justify | `check_filler` returns `[]` | `FAIL: sample.md filler: flagged lines [], expected [15] (exit 1)` |
| vague | line 17 / line 12: often | clean.md line 34: most of the requests, near zero | `check_vague` returns `[]` | `FAIL: sample.md vague: flagged lines [], expected [17] (exit 1)` |
| flagged | line 19 / line 13: robust | clean.md line 32: navigation, landscapes | `check_flagged` returns `[]` | `FAIL: sample.md flagged: flagged lines [], expected [19] (exit 1)` |
| equal-length | line 29 / line 18: five 5-word sentences | clean.md line 51 and clean.tex: four equal sentences | `check_equal_length` returns `[]` | `FAIL: sample.md equal-length: flagged lines [], expected [29] (exit 1)` |
| contrast | lines 23 25 27 / 15 16 17: three contrasts | clean.md and clean.tex: two contrasts, plus continuation and five-word near misses | `check_contrast` returns `[]` | `FAIL: sample.md contrast: flagged lines [], expected [23 25 27] (exit 1)` |
| colon-lists | line 36 / line 25: the second colon paragraph before a list | clean.md line 40 and clean.tex line 33: a colon paragraph, a list, a plain paragraph | `check_colon_lists` returns `[]` | `FAIL: sample.md colon-lists: flagged lines [], expected [36] (exit 1)` |

Every other rule and branch the script states or adds, including each rule of the ruling. Each revert is one string replacement in a scratch copy of the script outside the worktree (`<scratchpad>/reverts.py`, lists `R` and `EXTRA`), and the red line is the first `FAIL:` line the test printed, exit 1 for every row:

| Rule or branch | Case | Near miss or control | Revert | Red line |
|---|---|---|---|---|
| letter passes (non-ascii) | clean.md line 8, the accented name Jose (U+00E9) Garcia (U+00ED) | nonascii.md line 3, U+00D7, flagged | `` if ord(char) > 0x7F and not category.startswith("L"): `` replaced by `` if ord(char) > 0x7F: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| combining mark after a letter or mark passes (ruling 5) | nonascii.md line 7, a decomposed name (e + U+0301, e + U+0301 + U+0308), passes | nonascii.md line 8, a lone U+0301 after a space, flagged | `` if not (category.startswith("M") and previous[:1] in ("L", "M")): `` replaced by `` if True: `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6 7 7 7 8], expected [3 4 5 6 8]` |
| combining mark after a mark passes (ruling 5) | nonascii.md line 7, U+0308 after U+0301, passes | nonascii.md line 8, flagged | `` previous[:1] in ("L", "M") `` replaced by `` previous[:1] in ("L",) `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6 7 8], expected [3 4 5 6 8]` |
| combining mark after anything else flagged (ruling 5) | nonascii.md line 8, U+0301 after a space, flagged | nonascii.md line 7, passes | `` previous[:1] in ("L", "M") `` replaced by `` previous[:1] in ("L", "M", "Z") `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6], expected [3 4 5 6 8]` |
| table separator row not read by dash-aside (ruling 1) | clean.md line 48 and dash.md line 10 (\|:---\|---:\|), not flagged | dash.md line 11, a data row with -- and - , flagged twice | `` elif SEPARATOR_ROW.match(line):\n `` replaced by `` elif False:\n `` | `FAIL: clean.md: exit 1, expected 0 []` |
| thematic break is no list and not read (ruling 2) | dash.md lines 24, 26, 28 (---, * * *, ___) not flagged; colon.md line 38 (* * *) is no list | dash.md line 30, -- inside a comment, flagged | `` if len(marks) >= 3 and not marks.strip("-*_"): `` replaced by `` if False: `` | `FAIL: colon.md colon-lists: flagged lines [9 14 36 40], expected [9 14]` |
| comment markers not read by dash-aside (ruling 2) | dash.md lines 30 and 32-34, the markers not flagged | dash.md lines 30 and 33, the -- aside inside each comment, flagged | `` dash_text = COMMENT_MARKER.sub(lambda m: " " * len(m.group(0)), text) `` replaced by `` dash_text = text `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 30 30 32 33 34 38 40 42], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| number range with one space each side passes (ruling 3) | dash.md line 36 (2023 - 2024, 3 -- 5) and dash.tex line 12 (2023 -- 31, 2023 - 2024), not flagged | dash.md lines 38, 40 and dash.tex lines 13, 14, a letter on one side, flagged | `` if core in ("-", "--") and re.search `` replaced by `` if False and re.search `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 36 36 38 40 42], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| LaTeX -- needs a space on a side | dash.tex lines 5, 6 and clean.tex line 9 (3--5, 10--12, Navier--Stokes), not flagged | dash.tex lines 3, 4, flagged | `` if doc.latex and core == "--" and not `` replaced by `` if False and not `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| spaced hyphen needs text before it (list marker) | every list item of sample.md and dash.md lines 13-18, markers not flagged | dash.md line 13, the inner spaced hyphen, flagged | `` \|(?<=\S)[ \t]+-(?=[ \t])")\nTEX_DASH `` replaced by `` \|[ \t]*-(?=[ \t])")\nTEX_DASH `` | `FAIL: sample.md dash-aside: flagged lines [9 33 34 38 39], expected [9]` |
| Markdown -- anywhere | dash.md lines 4, 5, 7, 11, flagged | dash.md line 22, -- in inline code, not flagged | `` MD_DASH = re.compile(r"[\u2013\u2014]\|-{2,}\| `` replaced by `` MD_DASH = re.compile(r"[\u2013\u2014]\| `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 11 13 38 40 42], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| LaTeX --- anywhere | sample.tex line 8, dash.tex lines 1, 2, flagged | clean.tex line 13, --- in an equation, not flagged | `` \|-{3,}\|(?<!-)--(?!-) `` replaced by `` \|(?<!-)--(?!-) `` | `FAIL: sample.tex dash-aside: flagged lines [], expected [8]` |
| em and en dash | dash.md lines 1, 2 and dash.tex line 8, flagged | dash.md lines 45, 49, in fences, not flagged by dash-aside | `` MD_DASH = re.compile(r"[\u2013\u2014]\| `` replaced by `` MD_DASH = re.compile(r"[\u2013]\| `` | `FAIL: dash.md dash-aside: flagged lines [2 3 4 5 7 11 11 13 30 33 38 40 42], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| frontmatter left out | clean.md lines 1-4, not flagged | frontopen.md line 2, an unclosed block, flagged | `` if count and self.raw[0].rstrip() == "---": `` replaced by `` if False: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| tilde fences | clean.md lines 24-26 and dash.md lines 48-50, not flagged | dash.md line 42, a line opening with a code span, flagged | `` FENCE_OPEN = re.compile(r" {0,3}(`{3,}\|~{3,})(.*)$") `` replaced by `` FENCE_OPEN = re.compile(r" {0,3}(`{3,})(.*)$") `` | `FAIL: clean.md: exit 1, expected 0 []` |
| closing fence at least as long | dash.md lines 52-55, a ``` line inside a ```` fence | dash.md line 42, flagged prose | `` len(closing.group(1)) >= len(fence) `` replaced by `` True `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 54 54 58 62], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| fence indented up to 3 spaces | dash.md lines 57-59 | dash.md line 42 | `` FENCE_OPEN = re.compile(r" {0,3}( `` replaced by `` FENCE_OPEN = re.compile(r"( `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 58], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| fence left open runs to the end | dash.md lines 61-62 | dash.md line 42 | `` fence = opening.group(1)\n `` replaced by `` fence = opening.group(1) if any(FENCE_CLOSE.match(l) for l in self.raw[i + 1:]) else None\n `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 62], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| backtick fence info holds no backtick | dash.md line 42, ```x``` opens a prose line, its aside flagged | dash.md lines 44-46, a real fence, not flagged | `` if opening and not (opening.group(1)[0] == "`" and "`" in opening.group(2)): `` replaced by `` if opening: `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 45 45 45 54 54], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42]` |
| inline code spans removed | clean.md line 18, `--limit`, `a - b`, `simply` | dash.md line 4, the same -- outside code, flagged | `` text = CODE_SPAN.sub(" ", line) `` replaced by `` text = line `` | `FAIL: clean.md: exit 1, expected 0 []` |
| Markdown headings # to ###### | sections.md, a heading of each level 1 to 6 | sections.md line 13, seven hashes, no heading | `` MD_HEADING = re.compile(r" {0,3}(#{1,6}) `` replaced by `` MD_HEADING = re.compile(r" {0,3}(#{1,5}) `` | `FAIL: sections.md section-words: flagged lines [1 1 1 5 9 17 19 19 21], expected [1 1 5 9 11 17 19 19 21]` |
| seven hashes make no heading | sections.md line 13 | sections.md line 11, six hashes, a heading | `` MD_HEADING = re.compile(r" {0,3}(#{1,6})(?=[ \t]\|$) `` replaced by `` MD_HEADING = re.compile(r" {0,3}(#{1,7})(?=[ \t]\|$) `` | `FAIL: sections.md section-words: flagged lines [1 1 5 9 17 19 19 21], expected [1 1 5 9 11 17 19 19 21]` |
| closing hashes dropped from a heading | sections.md line 19, ## dup ## | sections.md line 17, ## Dup | `` title = re.sub(r"(?:^\|[ \t]+)#+$", "", heading.group(2).strip()).strip() `` replaced by `` title = heading.group(2).strip() `` | `FAIL: sections.md section-words: flagged lines [1 1 5 9 11 17 21], expected [1 1 5 9 11 17 19 19 21]` |
| plain text has no headings | notes.txt, # Methods; Results is prose (semicolons at 3, limit at 1) | notes.md, the same text, a heading, exit 0 | `` self.parse_markdown(path.endswith(".md")) `` replaced by `` self.parse_markdown(True) `` | `FAIL: notes.txt: exit 0, expected 1 []` |
| LaTeX comment removed | sample.tex line 6, clean.tex line 10, dash.tex line 9 | dash.tex line 10, an escaped percent, flagged | `` \|(?P<comment>(?<!\\)%[^\n]*)" `` replaced by `` \|(?P<comment>(?!x)x)" `` | `FAIL: sample.tex semicolons: no line [sample.tex:14: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words] in [sample.tex:3: section-words: "Abstract": 20 words, over the limit of 10` |
| escaped percent is no comment | dash.tex line 10, flagged | dash.tex line 9, a comment, not flagged | `` \|(?P<comment>(?<!\\)%[^\n]*)" `` replaced by `` \|(?P<comment>%[^\n]*)" `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 13 14 15 16 17 18 19 20 21 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| verbatim left out | clean.tex lines 18-20, dash.tex lines 35-37 | dash.tex line 7, a spaced hyphen outside, flagged | `` (?P<verbatim>\\begin\{(verbatim\|lstlisting\|minted) `` replaced by `` (?P<verbatim>\\begin\{(lstlisting\|minted) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| lstlisting left out | clean.tex lines 21-23, dash.tex lines 41-43 | dash.tex line 7 | `` (?P<verbatim>\\begin\{(verbatim\|lstlisting\|minted) `` replaced by `` (?P<verbatim>\\begin\{(verbatim\|minted) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| minted left out | clean.tex lines 24-26, dash.tex lines 44-46 | dash.tex line 7 | `` (?P<verbatim>\\begin\{(verbatim\|lstlisting\|minted) `` replaced by `` (?P<verbatim>\\begin\{(verbatim\|lstlisting) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| starred verbatim | dash.tex lines 38-40 | dash.tex line 7 | `` minted)(\*?)\}.*?\\end\{\2\3\}) `` replaced by `` minted)()\}.*?\\end\{\2\3\}) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 39 39], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| equation left out | clean.tex lines 12-14, dash.tex lines 25-28 | dash.tex line 7 | `` (equation\|align\|gather\| `` replaced by `` (align\|gather\| `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| align left out | clean.tex lines 15-17, dash.tex lines 29-34 | dash.tex line 7 | `` (equation\|align\|gather\| `` replaced by `` (equation\|gather\| `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| gather left out (ruling 4) | dash.tex lines 17, 18, the hyphen inside not flagged | the same lines, the hyphen outside, flagged once | `` (equation\|align\|gather\| `` replaced by `` (equation\|align\| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 17 18 18 19 20 21 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| multline left out (ruling 4) | dash.tex lines 19, 20 | the hyphen outside on the same lines, flagged once | `` \|multline\| `` replaced by `` \| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 19 20 20 21 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| eqnarray left out (ruling 4) | dash.tex lines 21, 22 | the hyphen outside, flagged once | `` \|eqnarray\| `` replaced by `` \| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 21 22 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| displaymath left out (ruling 4) | dash.tex line 23 | the hyphen outside, flagged once | `` \|displaymath\|math) `` replaced by `` \|math) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| math environment left out (ruling 4) | dash.tex line 24 | the hyphen outside, flagged once | `` \|displaymath\|math) `` replaced by `` \|displaymath) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| starred math environments (ruling 4) | dash.tex lines 18, 20, 22, 28 and clean.tex lines 15-17 | the hyphen outside, flagged once | `` displaymath\|math)(\*?)\} `` replaced by `` displaymath\|math)()\} `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| $$...$$ left out (ruling 4) | dash.tex line 15, $$a - b$$ then inline $c$ | the hyphen outside, flagged once | `` r"\|(?<!\\)\$\$.*?(?<!\\)\$\$"\n `` replaced by (nothing) | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 16 17 18 19 20 21 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| \[...\] left out (ruling 4) | dash.tex line 16 | the hyphen outside, flagged once | `` r"\|(?<!\\)\\\[.*?\\\]"\n `` replaced by (nothing) | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 16 17 18 19 20 21 22 23 24], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24]` |
| \(...\) left out | dash.tex line 11, clean.tex line 11 | dash.tex line 7 | `` r"\|(?<!\\)\\\(.*?\\\)"\n `` replaced by (nothing) | `FAIL: clean.tex: exit 1, expected 0 []` |
| $...$ left out | dash.tex line 11, clean.tex line 11 | dash.tex line 7 | `` r"\|(?<!\\)\$(?:\\.\|(?!\n[ \t]*\n)[^$\\])+?\$",\n `` replaced by `` r"\|(?!x)x",\n `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| LaTeX starred and sub-sub headings | sections.tex lines 7 (\subsection*) and 9 (\subsubsection) | sections.tex line 9, deeper=1 at its limit, not flagged | `` TEX_HEADING = re.compile(r"\\(?:sub)?(?:sub)?section\*?\s*\{") `` replaced by `` TEX_HEADING = re.compile(r"\\(?:sub)?section\s*\{") `` | `FAIL: sections.tex section-words: flagged lines [1 1 1 1 5 14], expected [1 5 7 11 14]` |
| abstract ends at \end{abstract} | sections.tex, Abstract 3 words, line 4 outside it | sections.tex line 1 flagged with 3, not 10 | `` self.headings[abstract] = (self.headings[abstract][0], "Abstract", i)\n `` replaced by (nothing) | `FAIL: sections.tex section-words: no line [sections.tex:1: section-words: "Abstract": 3 words, over the limit of 2] in [sections.tex:1: section-words: "Abstract": 10 words, over the limit of 2` |
| tabular rows are table rows | clean.tex line 41, semitab.tex line 4, semicolons not counted | semitab.tex line 7, a list item, flagged | `` TEX_TABLE_BEGIN = re.compile(r"\\begin\{(?:tabular\*?\|tabularx\|longtable)\}") `` replaced by `` TEX_TABLE_BEGIN = re.compile(r"(?!x)x") `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| LaTeX list items | sample.tex lines 22-23, 27-28 | sample.tex line 25, flagged | `` self.kind[i] = "item" if TEX_ITEM.match(line) else "cont" `` replaced by `` self.kind[i] = "text" `` | `FAIL: sample.tex colon-lists: flagged lines [], expected [25]` |
| preamble commands carry no words | sample.tex line 1, \documentclass{article} | sample.tex word total 230 | `` bibliographystyle\|usepackage\|documentclass\| `` replaced by `` bibliographystyle\|usepackage\| `` | `FAIL: sample.tex semicolons: no line [sample.tex:14: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words] in [sample.tex:3: section-words: "Abstract": 20 words, over the limit of 10` |
| section words leave out the heading line | sample.md Methods, 230 words | the count with the heading, 231 | `` for i in range(line + 1, end) if doc.kind[i] in counted `` replaced by `` for i in range(line, end) if doc.kind[i] in counted + ("heading",) `` | `FAIL: sample.md section-words: no line [sample.md:1: section-words: "Methods": 230 words, over the limit of 100] in [sample.md:1: section-words: "Methods": 231 words, over the limit of 100` |
| heading match case-insensitive | clean.md --limit ' limits =12' against ## Limits | sections.md --limit 'code=1', no heading, flagged at line 1 | `` if title.strip().lower() != key.lower(): `` replaced by `` if title.strip() != key: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| limit heading whitespace ignored | clean.md --limit ' limits =12' | sections.md --limit '  three  =1', flagged | `` limits.append((key.strip(), int(number))) `` replaced by `` limits.append((key, int(number))) `` | `FAIL: clean.md: exit 1, expected 0 []` |
| limit split at the last = | sections.md --limit 'A=B=1' against ## A=B | usage --limit 'Abstract=', exit 64 | `` key, equals, number = value.rpartition("=") `` replaced by `` key, equals, number = value.partition("=") `` | `FAIL: sections.md: exit 64, expected 1 [check_prose.py: --limit 'A=B=1' is not <heading text>=<positive integer>` |
| unmatched limit flagged at line 1 | sample.md with --limit Abstract=10, sections.md code=1 | sections.md one=4, matched, flagged at its heading | `` flags.append((1, "%s: no heading matches this limit" % quote(key)))\n `` replaced by `` pass\n `` | `FAIL: two-files:       29 lines, expected 30 (the 14 of each file, plus the Methods section of sample.tex and the unmatched Abstract limit of sample.md)` |
| section over the limit only | sections.md TWO=6 (6 words), clean.md limits=12 (12 words), not flagged | sections.md one=4 (5 words), flagged | `` if total > limit: `` replaced by `` if total >= limit: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| semicolons: more than 2 per 1000 | semi500.md, 1 in 500 words, not flagged | semi499.md, 1 in 499 words, flagged | `` if total * 1000 <= 2 * total_words: `` replaced by `` if total * 1000 < 2 * total_words: `` | `FAIL: semi500.md: exit 1, expected 0 []` |
| semicolons leave out headings | clean.md line 6 and semitab.md line 5 | semitab.md line 15, a list item, flagged | `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text", "item", "cont")] `` replaced by `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text", "item", "cont", "heading")] `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| semicolons leave out table rows | clean.md line 49, semitab.md line 9 | semitab.md line 15, flagged | `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text", "item", "cont")] `` replaced by `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text", "item", "cont", "table")] `` | `FAIL: clean.md: exit 1, expected 0 []` |
| history: step <number> | history.md line 12 | history.md line 15, stepwise and steps 3, not flagged | `` patterns.append(re.compile(r"(?<!\w)step\s+\d+(?!\w)", re.I))\n `` replaced by (nothing) | `FAIL: history.md history: flagged lines [1 2 3 4 5 6 7 8 9 10 11 13], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| history: date | history.md line 13 | history.md line 15, 2026-9-28 and 20260928, not flagged | `` patterns.append(re.compile(r"(?<!\w)\d{4}-\d{2}-\d{2}(?!\w)"))\n `` replaced by (nothing) | `FAIL: history.md history: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| phrases case-insensitive | history.md lines 1, 2, 11 and throat.md line 2 | history.md line 17, reused, unmoved, as offered, not flagged | `` return re.compile(r"(?<!%s)%s(?!%s)" % (boundary, body, boundary), re.I) `` replaced by `` return re.compile(r"(?<!%s)%s(?!%s)" % (boundary, body, boundary)) `` | `FAIL: history.md history: flagged lines [3 4 5 6 7 8 9 10 12 13], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| whole words, hyphen included | words.md lines 1-40 | words.md line 42, easy-going, easily, simplest, not flagged | `` patterns = [phrase_pattern(w, r"[\w-]") for w in FILLER_WORDS] `` replaced by `` patterns = [phrase_pattern(w, r"\w") for w in FILLER_WORDS] `` | `FAIL: words.md filler: flagged lines [1 2 3 4 5 6 7 41 41 42], expected [1 2 3 4 5 6 7 41 41]` |
| equal-length band of 2 | equal.md line 1, counts 6, 5, 7, 5, 6 | equal.md line 5, counts 5, 6, 8, 5, 5, not flagged | `` if high - low > 2: `` replaced by `` if high - low > 3: `` | `FAIL: equal.md equal-length: flagged lines [1 5 37 45], expected [1 37 45]` |
| equal-length five sentences | sample.md line 29, five sentences | equal.md line 9 and clean.md line 51, four, not flagged | `` if end - start >= 5: `` replaced by `` if end - start >= 4: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| equal-length leaves out list items, headings, tables | equal.md lines 13-33, five equal items, headings, rows, code | equal.md line 1, flagged | `` if block.kind == "para":\n            sentences.extend `` replaced by `` if block.kind in ("para", "item", "heading", "table"):\n            sentences.extend `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast continuation words | contrast.md lines 8-16 and clean.md line 36, not counted | contrast.md lines 1-6, counted | `` if m.group(2).lower() not in CONTINUATIONS] `` replaced by `` ] `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast 1 to 4 words | contrast.md line 6, four words, counted | contrast.md lines 17, 18 and clean.md line 38, five words, not counted | `` CONTRAST_COMMA = re.compile(r"\bnot((?:\s+[^\s,.;:!?]+){1,4}) `` replaced by `` CONTRAST_COMMA = re.compile(r"\bnot((?:\s+[^\s,.;:!?]+){1,5}) `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast but form | sample.md line 25, contrast.md line 2 | contrast.md line 18, five words before but | `` matches.extend(CONTRAST_BUT.finditer(sentence))\n `` replaced by (nothing) | `FAIL: sample.md contrast: flagged lines [], expected [23 25 27]` |
| contrast a sentence counts once | contrast.md line 5, both forms in one sentence, flagged once | contrast.md line 1, one form | `` first = min(matches, key=lambda m: m.start())\n                found.append((doc.line_at(block, offset + first.start()), first.group(0))) `` replaced by `` for first in matches:\n                    found.append((doc.line_at(block, offset + first.start()), first.group(0))) `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 5 6], expected [1 2 3 4 5 6]` |
| contrast more than 2 | sample.md, 3 contrasts, all flagged | clean.md, 2 contrasts, not flagged | `` if len(found) <= 2: `` replaced by `` if len(found) <= 1: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| colon-lists nothing else between | colon.md lines 40-46, a heading between, not flagged | colon.md line 14, flagged | `` units.append(("para" if block.kind == "para" else "other", block)) `` replaced by `` if block.kind == "para":\n                units.append(("para", block)) `` | `FAIL: colon.md colon-lists: flagged lines [9 14 45], expected [9 14]` |
| colon-lists paragraph ends with a colon | colon.md lines 48-52, the first paragraph with no colon, not flagged | colon.md line 14, flagged | `` and doc.block_text(first[1]).rstrip().endswith(":") `` replaced by `` and True `` | `FAIL: colon.md colon-lists: flagged lines [9 14 51], expected [9 14]` |
| quote at most 60 characters | sample.md line 21 and semi499.md line 1, cut at 60 | sections.md short quotes, whole | `` QUOTE_LENGTH = 60 `` replaced by `` QUOTE_LENGTH = 61 `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| output sorted by file then line | sample.md, section-words at line 1 before non-ascii at line 6; two-files run | sort -c on every run | `` flags.sort(key=lambda f: (f[0], f[1], f[2], f[4]))\n `` replaced by (nothing) | `FAIL: sample.md: output not sorted by file then line` |
| usage: no file | no argument | empty.md, exit 0 | `` if not paths:\n        raise UsageError("no file given")\n `` replaced by (nothing) | `FAIL: usage no file: exit 0, expected 64` |
| usage: --limit needs a value | sample.md --limit | --limit Methods=100 sample.md, exit 1 | `` if i + 1 >= len(arguments):\n                raise UsageError("--limit needs a value")\n `` replaced by (nothing) | `FAIL: usage limit with no value: exit 1, expected 64` |
| usage: positive limit | --limit Abstract=0 | --limit Abstract=10, accepted | `` or int(number) == 0: `` replaced by `` : `` | `FAIL: usage limit of 0: exit 1, expected 64` |
| usage: whole-number limit | --limit Abstract=-2, =1.5, =ten | --limit Abstract=10, accepted | `` not re.fullmatch(r"[0-9]+", number) `` replaced by `` not re.fullmatch(r"-?[0-9]+", number) `` | `FAIL: usage negative limit: exit 1, expected 64` |
| usage: heading text | --limit =5 and ' =5' | --limit 'A=B=1', accepted | `` if not equals or not key.strip() or `` replaced by `` if not equals or `` | `FAIL: usage empty heading: exit 1, expected 64` |
| usage: unreadable file | missing.md, the directory sub, locked.md | sub/nested.md, read | `` except OSError as error:\n `` replaced by `` except KeyError as error:\n `` | `FAIL: usage missing file: exit 1, expected 64` |
| usage: not UTF-8 | latin1.md | sample.md | `` except UnicodeDecodeError:\n `` replaced by `` except KeyError:\n `` | `FAIL: usage non-UTF-8 file: exit 1, expected 64` |
| usage: nothing on stdout | sample.md missing.md, exit 64 with empty stdout | sample.md alone, flags printed | `` texts = [(path, read(path)) for path in paths]\n `` replaced by `` texts = []\n        for path in paths:\n            try:\n                texts.append((path, read(path)))\n            except UsageError:\n                sys.stdout.write("x\n")\n                raise\n `` | `FAIL: usage missing file: stdout is not empty [x]` |
| never writes to a file | cksum of every scratch file before and after all runs | the same files, unchanged | `` doc = Document(path, text)\n `` replaced by `` doc = Document(path, text)\n        open(path + ".out", "w").close()\n `` | `FAIL: a run wrote to a file` |
| list continuation, lazy | colon.md line 5, continued lazily | colon.md line 9, flagged | `` elif last in ("item", "cont") and (not blank_before or line[:1] in " \t"): `` replaced by `` elif last in ("item", "cont") and line[:1] in " \t": `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list continuation, indented after a blank | colon.md line 7 | colon.md line 9, flagged | `` elif last in ("item", "cont") and (not blank_before or line[:1] in " \t"): `` replaced by `` elif last in ("item", "cont") and not blank_before: `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list marker 1) | colon.md line 3, 1) one | colon.md line 9, flagged | `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\|\d{1,9}[.)]) `` replaced by `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\|\d{1,9}[.]) `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list markers * and + | colon.md lines 15, 16 | colon.md line 14, flagged | `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\| `` replaced by `` MD_ITEM = re.compile(r"[ \t]*(?:[-]\| `` | `FAIL: colon.md colon-lists: flagged lines [9], expected [9 14]` |
| LaTeX comment-only line is neutral | colon.tex line 18, a comment between the list and line 19 | colon.tex line 19, flagged | `` self.kind[i] = "code" if i in removed else "skip" `` replaced by `` self.kind[i] = "code" `` | `FAIL: colon.tex colon-lists: flagged lines [6], expected [6 19]` |
| LaTeX removed math or code is content | colon.tex lines 23-25, an equation between the list and line 26 | colon.tex line 26, not flagged | `` self.kind[i] = "code" if i in removed else "skip" `` replaced by `` self.kind[i] = "skip" `` | `FAIL: colon.tex colon-lists: flagged lines [6 19 26], expected [6 19]` |
| LaTeX heading with nested braces | sections.tex line 14, \section{The \emph{Nested} Part} | sections.tex line 5, \section{Intro} | `` title = " ".join(latex_plain(braced(line, heading.end())).split()) `` replaced by `` title = " ".join(latex_plain(line[heading.end():line.find("}", heading.end())]).split()) `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11], expected [1 5 7 11 14]` |
| LaTeX heading whitespace collapsed | sections.tex line 14, title The Nested Part | sections.tex line 7, Deep Part | `` title = " ".join(latex_plain(braced(line, heading.end())).split()) `` replaced by `` title = latex_plain(braced(line, heading.end())).strip() `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11], expected [1 5 7 11 14]` |
| phrase across a line break | throat.md lines 18-19, at the end / of the day, flagged at 18 | throat.md lines 1-14, one line each | `` body = r"\s+".join(re.escape(word) for word in phrase.split()) `` replaced by `` body = " ".join(re.escape(word) for word in phrase.split()) `` | `FAIL: throat.md throat-clearing: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 13 14], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 18]` |
| quote collapses a line break | throat.md line 18, quote at the end of the day | every one-line quote | `` re.sub(r"[ \t\r\n]+", " ", text).strip(" ")[:QUOTE_LENGTH] `` replaced by `` text.strip(" ")[:QUOTE_LENGTH] `` | `FAIL: throat.md: a line not in the form <file>:<line>: <check>: "<text>": <message> [throat.md:18: throat-clearing: "at the end` |
| equal-length runs across headings | equal.md line 37, two sentences, a heading, three | equal.md line 1, one paragraph | `` if block.kind == "para":\n            sentences.extend(doc.sentences(block))\n `` replaced by `` if block.kind == "para":\n            sentences.extend(doc.sentences(block))\n        elif block.kind == "heading":\n            sentences.append((0, "", 999, 0))\n `` | `FAIL: equal.md equal-length: flagged lines [0 1 45], expected [1 37 45]` |
| equal-length runs across paragraphs | equal.md line 45, two sentences, a blank line, three | equal.md line 1 | `` if block.kind == "para":\n            sentences.extend(doc.sentences(block))\n `` replaced by `` if block.kind == "para":\n            sentences.append((0, "", 999, 0))\n            sentences.extend(doc.sentences(block))\n `` | `FAIL: equal.md equal-length: flagged lines [1], expected [1 37 45]` |
| frontmatter closed by ... | frontdots.md, closed by ..., exit 0 | frontopen.md, never closed, line 2 flagged | `` if self.raw[j].rstrip() in ("---", "..."): `` replaced by `` if self.raw[j].rstrip() in ("---",): `` | `FAIL: frontdots.md: exit 1, expected 0 []` |
| frontmatter left open is none | frontopen.md line 2, flagged | frontdots.md, exit 0 | `` start = j + 1\n                    break\n `` replaced by `` start = j + 1\n                    break\n            else:\n                self.kind = ["code"] * count\n                start = count\n `` | `FAIL: frontopen.md: exit 0, expected 1 []` |
| section words count table rows | sections.md line 23, \| three \|, counted in A=B | sections.md A=B total 4 | `` counted = ("text", "item", "cont", "table") `` replaced by `` counted = ("text", "item", "cont") `` | `FAIL: sections.md section-words: no line [sections.md:21: section-words: "A=B": 4 words, over the limit of 1] in [sections.md:1: section-words: "One": 5 words, over the limit of 4` |
| section words count list items | sample.md Methods, list items counted in 230 | sections.md line 24, - four | `` counted = ("text", "item", "cont", "table") `` replaced by `` counted = ("text", "table") `` | `FAIL: sample.md section-words: no line [sample.md:1: section-words: "Methods": 230 words, over the limit of 100] in [sample.md:1: section-words: "Methods": 205 words, over the limit of 100` |
| semicolons count list items | semitab.md line 15, semitab.tex line 7, flagged | sample.md word total 230 with its list items | `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text", "item", "cont")] `` replaced by `` running = [i for i, kind in enumerate(doc.kind) if kind in ("text",)] `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 230 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| contrast reads list items and headings | contrast.md lines 3 (item) and 4 (heading), counted | contrast.md line 1, a paragraph | `` for block in doc.prose_blocks():\n        text = doc.block_text(block)\n        for line, sentence `` replaced by `` for block in [b for b in doc.blocks if b.kind == "para"]:\n        text = doc.block_text(block)\n        for line, sentence `` | `FAIL: contrast.md contrast: flagged lines [1 2 5 6], expected [1 2 3 4 5 6]` |
| word checks read list items, headings, tables | words.md, every word as a list item | words.md line 44, the word in code, not flagged | `` return [b for b in self.blocks if b.kind in ("para", "item", "heading", "table")] `` replaced by `` return [b for b in self.blocks if b.kind in ("para",)] `` | `FAIL: words.md: exit 0, expected 1 []` |

## Repair round 1

Brief `agents/briefs/2-round-1.md`, findings `agents/reviews/2-refuter.md`. This section states the worktree as it is now. Where a number, a line or a table above differs from this section, this section holds: the script is 775 lines with its imports at lines 118 to 120, the samples' semicolon word total is 194, and the rule-13 table at the end of this section replaces the one above. The double blank lines of `check_prose.py` are unchanged in kind, as the round says: `awk 'prev=="" && $0=="" {n++} {prev=$0} END {print n}' skills/writing/templates/check_prose.py` prints 30, since the new top-level definitions (`only_arguments`, `Piece`, `Block`, `subordinate`) follow the file's two-blank-line layout.

### The rulings

Each case is run by `sh skills/writing/templates/check_prose.test.sh`; the outputs quoted are from `python3 skills/writing/templates/check_prose.py <args> <file>` run on the files the test builds (a copy of the test with its cleanup trap removed, `TMPDIR` under the builder's scratchpad).

| Ruling | Script and test lines | Change | Command | Output |
|---|---|---|---|---|
| 1, the contrast window | `check_prose.py` 211 to 215 (`WINDOW`, `CONTRAST_COMMA`, `CONTRAST_BUT`, `CLAUSE_BREAK`, `SUBORDINATORS`), 675 (`subordinate`), 680 (`check_contrast`); test 717 to 759 (contrast.md), clean.md line 38 | The window is 1 to 10 words of letters, digits, `'` and `-`, so other punctuation ends it; a match is skipped when the clause holding "not" (the text after the last `,`, `;` or `:` before it) starts with if, when, unless, whether, because, although, since or while | `check_prose.py contrast.md` | 14 flags, at lines 1 2 3 4 5 6 21 22 25 26 27 29 30 40, among them `contrast.md:21: contrast: "not a limitation to apologise for, it"`, `contrast.md:22: contrast: "not an offer to do machine learning for your group, it"`, `contrast.md:25: contrast: "not found in the cache, the"`; no flag at 17 (eleven words), 23 (`not done), a`), 24 (If ...), 28 (`not, in`), 31 to 37 (the other subordinators), 39 (across cells), 41 (escaped pipe) |
| 2, the report | this section, "Wrong or impossible in the brief, added this round" | Recorded | `sed -n '372,378p' skills/writing/templates/check_prose.test.sh` | the em dash fences are at test lines 373 and 377 (dash.md lines 45 and 49) |
| 3, equal-length at headings | `check_prose.py` 647 to 653; test eq.md, eq.tex, eqabs.tex, eqpara.tex (from line 879), equal.md | A run ends at a heading and at `\end{abstract}`; it continues across a paragraph break and the lines left out | `check_prose.py eq.md`, `eq.tex`, `eqabs.tex`, `eqpara.tex`, `equal.md` | eq.md, eq.tex, eqabs.tex: no output, exit 0 each; `eqpara.tex:1: equal-length: "The first file is read.": 5 consecutive sentences of 5, 5, 5, 5, 5 words`; equal.md flags 1, 45, 51, 55 and no longer 37 (a heading between) |
| 4, rules with no case | test: equal.md 51 and 55, semitab.tex 9 to 17, dash.md 61 to 64, dash.tex 25, crlf.md (999), frontspace.md (1000), contrast.md 26, tie.md (998), throat.md 21, probe5.tex line 2 | A case for each revert the refuter listed | `check_prose.py tie.md` | `tie.md:1: dash-aside: "z -- a."`, then `tie.md:1: filler: "just"`, then `tie.md:1: filler: "very"`: check order first, then message. Every other case: its row in the rule-13 table below, each red under its revert |
| 5, LaTeX text beside structure commands | `check_prose.py` 421 to 486 (`scan_latex_line`); test probe5.tex (910) | Structure commands are read in order along the line; only the command is left out, the text beside it is prose of the place it stands in | `check_prose.py --limit Intro=4 --limit abstract=5 probe5.tex` | `probe5.tex:1: section-words: "Abstract": 15 words, over the limit of 5`, `probe5.tex:2: history: "was changed"`, `probe5.tex:2: filler: "simply"`, `probe5.tex:3: section-words: "Intro": 20 words, over the limit of 4`, filler at 3, 4, 7, 8, `probe5.tex:8: history: "was changed"`, exit 1 |
| 6, begin and end on one line | `check_prose.py` 439 to 480; test p2.tex, p4.tex (921) | Depth moves per command in order along the line | `check_prose.py p2.tex`, `p4.tex` | `p2.tex:2: semicolons: ... 3 semicolons in 40 words`, `p2.tex:3: equal-length: ... 5, 5, 5, 5, 5 words`; `p4.tex:2: equal-length: ... 5, 5, 5, 5, 5 words` |
| 7, `\section[Short]{Title}` | `check_prose.py` 188; test sections.tex 16 and 18 | Optional `[...]` before the title at all three levels, starred too | `check_prose.py --limit Methods=1 sections.tex` | `sections.tex:16: section-words: "Methods": 2 words, over the limit of 1` |
| 8, indented fences | `check_prose.py` 160, 161; test p7.md (932) | A fence opens and closes at any indentation | `check_prose.py p7.md`; `check_prose.py skills/repo-setup/SKILL.md \| grep -c ':59:'` | `p7.md:7: dash-aside: "a -- b"` only (line 4 inside the fence is not flagged); `0` |
| 9, table cells | `check_prose.py` 165, 372, 192, 431 to 437; test contrast.md 39 to 41, tabcells.tex (868) | Each Markdown cell (split at `\|` not preceded by a backslash) and each LaTeX cell (split at `&` not preceded by a backslash and at `\\`) is its own unit | `check_prose.py tabcells.tex`; `check_prose.py skills/spec/SKILL.md \| grep -c ':213:'` | contrast at 1, 2, 5 only (4, 6, 7 not counted); `0` |
| 10, blockquotes | `check_prose.py` 159, 342; test dash.md 66, 67, 71 | Leading `>` markers, nested too, stripped before any check | `check_prose.py dash.md \| tail -4` | `dash.md:67: dash-aside: "a -- b"` and `dash.md:69: dash-aside: "a - b"`; nothing at 66 or 71 |
| 11a, placeholder cells | `check_prose.py` 166, 374, 432; test dash.md 69, cellend.md (1001), dash.tex 27 | A cell holding only `-` is not read by dash-aside, Markdown and LaTeX | `check_prose.py cellend.md`; `check_prose.py dash.tex \| tail -3` | `cellend.md:2: dash-aside: "a - \|"` only; `dash.tex:27: dash-aside: "b - c"` once, the `& - &` cell not flagged |
| 11b, LaTeX code and references | `check_prose.py` 170 to 177; test code.tex (942) | The argument of `\verb`, `\lstinline`, `\mintinline`, and `\texttt`, `\url`, `\href`, `\label`, `\ref`, `\eqref`, `\pageref`, `\cref`, `\Cref`, `\autoref`, `\cite` and its variants, `\parencite`, `\textcite` with their first argument, removed | `check_prose.py code.tex` | `code.tex:17: dash-aside: "x -- y"` only (lines 2 to 16 hold the commands) |
| 11c, one-line data rows | `check_prose.py` 256 to 271, 316 to 322, 481 to 485; test semirow.md (963), semirow.tex | A one-line paragraph with no sentence end, a LaTeX line of one command with its arguments, and the argument-only lines after such a line, are left out of semicolons | `check_prose.py semirow.md`, `semirow.tex` | semirow.md flags 3, 5, 6, 8 (4 semicolons in 19 words), not line 1; semirow.tex flags 5, 17, 21 (3 in 26 words), not 1, 3, 7, 10, 12 to 14 |
| 11d, the parenthesis form | ruling 1 | `not done), a` is no contrast | as ruling 1 | contrast.md line 23 not flagged |
| 12, the report | this section | Appended | `head -1 .scratch/3-the-writing-base/agents/reviews/2-report.md` | the first line below |

### Other rules the script now holds

Found while giving every branch a case; each is in the head docstring and has rows in the rule-13 table.

- A line of removed LaTeX display math continues the paragraph or list item it stands in (eqmath.tex, mathitem.tex line 4); after a list it is its own unit for colon-lists (colon.tex lines 24 to 26).
- `\includegraphics[...]{...}` and `\newcommand{\x}[1]{...}` carry no words. The round-0 script read `\includegraphics` as `\include` followed by the text `graphics...`, and counted what follows `[1]` in `\newcommand`; the command list now requires the whole command name and takes `[...]` and `{...}` in any order with one level of nesting (preamble.tex).
- `~` and `\ ` right after `.` are read as nothing, so `Fig.~3` and `Dr.\ Smith` end no sentence; elsewhere `~`, `\\` outside a table, `\,`, `\;`, `\:`, `\!` and `\ ` are read as a space (latexspace.tex).
- An optional `[...]` after any `\begin{...}` and the `{...}` arguments after a table's `\begin` carry no words (tabsec.tex).
- CR LF line ends are read as LF in both file forms.
- `\item` starts a list item wherever it stands.
- Code with no observable effect was removed: the trimming of empty edge cells, a lookbehind inside the placeholder lookahead, the `\begin`, `\end`, `\item` and reference commands from the removal steps (the structure scan and the code removal consume them first), and a group count in the argument reader.

### Effects on the round-0 cases

- The samples' semicolon word total is 194, not 230: sample.md lines 31 and 36 and sample.tex lines 20 and 25 (17 and 19 words) are one-line paragraphs ending with a colon, so they are data rows under ruling 11. The Methods section still counts 230 words, since section-words reads data rows.
- clean.md line 38 and contrast.md lines 17 and 18 hold eleven-word windows, the near misses of the new window.
- notes.txt holds `# Methods; Results` followed by a sentence line, so the plain-text heading line sits in a two-line paragraph and is still counted; semi499.md and semi500.md end their one sentence with a period for the same reason; the semitab.tex rows of `tabular*`, `tabularx` and `longtable` end with a sentence end, so the revert of each table name is observable.

### Wrong or impossible in the brief, added this round

- The brief's clean-file near miss "code with an em dash in a fence" cannot pass under the brief's own `non-ascii` rule, which reads code. The case is in the forms file dash.md, lines 45 and 49 (test lines 373 and 377): the em dash in each fence is flagged by `non-ascii` and not by `dash-aside`.
- The brief's concept-note evidence claimed 3 contrasts, at lines 79, 85 and 87; the brief's 1-to-4-word rule gives 2 (79 and 87), since line 85 holds five words before the comma. Ruling 1 changed the window to 1 to 10 words; the concept note now gives 4 (69, 79, 85, 87), quoted below.

### Every check of the brief, rerun

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit 0
$ sh skills/writing/templates/check_prose.test.sh; echo "exit $?"
PASS: check_prose.py scratch tests
exit 0
```

The verify list does not hold the new test yet; the orchestrator adds it at landing.

- Case 1: `check_prose.py --limit 'Methods=100' sample.md` and `--limit 'Abstract=10' sample.tex`, exit 1 each. Against the round-0 output, `diff` shows one changed line per file, the semicolon word total: `sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words` and the same at `sample.tex:14`. Every other line is unchanged.
- Case 2: `check_prose.py --limit ' limits =12' clean.md` and `--limit 'abstract=12' clean.tex`: no output, exit 0 each.
- Case 3: no file, `--limit Abstract`, `--limit Abstract=0`, `missing.md`, `latin1.md`: exit 64 each, stdout 0 bytes, stderr `no file given`, `--limit 'Abstract' is not <heading text>=<positive integer>`, `--limit 'Abstract=0' is not <heading text>=<positive integer>`, `cannot read missing.md: No such file or directory`, `latin1.md is not UTF-8`.
- Case 4: `PASS: check_prose.py scratch tests`, exit 0; the test copied alone to a scratch folder prints `FAIL: sample.md: exit 2, expected 1 [... can't open file '.../check_prose.py' ...]`.
- Case 5, `sh <scratchpad>/case5.sh skills/writing/templates`:

```
non-ascii off: FAIL: sample.md non-ascii: flagged lines [], expected [6] (exit 1)
dash-aside off: FAIL: sample.md dash-aside: flagged lines [], expected [9] (exit 1)
history off: FAIL: sample.md history: flagged lines [], expected [11] (exit 1)
section-words off: FAIL: sample.md section-words: flagged lines [], expected [1] (exit 1)
semicolons off: FAIL: sample.md semicolons: flagged lines [], expected [21] (exit 1)
throat-clearing off: FAIL: sample.md throat-clearing: flagged lines [], expected [13] (exit 1)
filler off: FAIL: sample.md filler: flagged lines [], expected [15] (exit 1)
vague off: FAIL: sample.md vague: flagged lines [], expected [17] (exit 1)
flagged off: FAIL: sample.md flagged: flagged lines [], expected [19] (exit 1)
equal-length off: FAIL: sample.md equal-length: flagged lines [], expected [29] (exit 1)
contrast off: FAIL: sample.md contrast: flagged lines [], expected [23 25 27] (exit 1)
colon-lists off: FAIL: sample.md colon-lists: flagged lines [], expected [36] (exit 1)
```

- Case 6: `python3 skills/writing/templates/check_prose.py skills/writing/references/prose-standard.md`: exit 1, 68 lines; `diff` against the round-0 output prints nothing, so the block quoted under Case 6 above holds. `grep -o ';' skills/writing/references/prose-standard.md | wc -l` prints 15.

```
$ git diff --stat
 docs/dev/building.md        | 1 +
 docs/dev/change-standard.md | 1 +
 2 files changed, 2 insertions(+)
$ git status --short --untracked-files=all
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/3-the-writing-base/agents/reviews/2-report.md
?? skills/writing/templates/check_prose.py
?? skills/writing/templates/check_prose.test.sh
```

- `skills/writing/templates/__pycache__/` is removed (`rm -rf`), and the status above lists no `__pycache__`. Nothing in the test imports the script: `grep -n 'import' skills/writing/templates/check_prose.test.sh` prints nothing, and the test runs the script as `python3 <path>`, which writes no bytecode for it.
- `LC_ALL=C grep -n '[^ -~]' skills/writing/templates/check_prose.py skills/writing/templates/check_prose.test.sh docs/dev/building.md docs/dev/change-standard.md` prints nothing (exit 1).
- All tracked Markdown outside `.scratch` in one run, `git ls-files '*.md' | grep -v '^\.scratch/' | xargs python3 skills/writing/templates/check_prose.py`: 291 lines, 0 bytes on stderr, exit 1.

### The real-file probes

- `README.md`: no output, exit 0.
- `docs/dev/skill-layout.md`, exit 1:

```
docs/dev/skill-layout.md:17: semicolons: "is one paragraph: what the skill does, what it produces, the": 2 semicolons in 406 words of running prose, more than 2 per 1000 words
docs/dev/skill-layout.md:48: semicolons: "A table is used when three or more items share the same two ": 2 semicolons in 406 words of running prose, more than 2 per 1000 words
docs/dev/skill-layout.md:71: history: "added in": a word of history, to be checked
```

Lines 17 and 48 are list items holding a semicolon, running prose by the rules, and 2 in 406 words is over 2 per 1000. Line 71 is a table row quoting "added in" as an example of history; the check reads table rows and flags the phrase, as its rule says, and the message asks for it to be checked.

- `skills/writing/references/prose-standard.md` (case 6): 68 lines as quoted above; each flag is the standard's own list of banned words, phrases and semicolons, given by the rules.
- research-hub `veni2026.tex` (read only), exit 1:

```
veni2026.tex:34: dash-aside: "(ENW) - Computer": a dash used as an aside
veni2026.tex:38: semicolons: "Other fields of research, in order of relevance: 1.01.02 Mat": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:48: semicolons: "I lead, and I have the record to show it. I conceived and dr": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:77: semicolons: "Where my research line begins. I introduced block-term tenso": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:133: history: "previously": a word of history, to be checked
veni2026.tex:145: flagged: "Robust": a flagged word, to be checked against section A of the prose standard
veni2026.tex:164: semicolons: "Interpretability is assumed to cost accuracy, and privacy is": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:172: semicolons: "Third, and least explored, can the federation itself be expl": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:174: vague: "many": a vague qualifier, to be checked against section A of the prose standard
veni2026.tex:187: semicolons: "Date of PhD award: 26 May 2023 (defence; the date from which": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:192: semicolons: "University of Twente, Faculty of Behavioural, Management and": 8 semicolons in 1881 words of running prose, more than 2 per 1000 words
veni2026.tex:200: dash-aside: "Psychophysiology -- postdoctoral": a dash used as an aside
veni2026.tex:201: dash-aside: "BIOMED -- postdoctoral": a dash used as an aside
veni2026.tex:202: dash-aside: "2026 -- present": a dash used as an aside
veni2026.tex:202: dash-aside: "BMS -- postdoctoral": a dash used as an aside
```

Judged: 34 is ` - ` as a separator, a spaced hyphen by the rule. 38, 48, 77, 164, 172, 187 and 192 are lines of running prose holding a semicolon, 8 in 1881 words; 38 and 187 sit in multi-line paragraphs (38 with 37, 187 with 186 and 188), so they are not one-line data rows. The `\keyoutput{...}{...}` commands (lines 72 to 75 and the nine after them, the last at line 144) and the keywords line 159 after `\formfield{Key words ...}` are data rows under ruling 11 and the argument-line rule, and are not counted; the running word total is 1881, not the refuter's 2591, for that reason. 133 `previously`, 145 `Robust` (a word in a bibliographic title, inside a `\keyoutput` argument, still read by the word checks, which read data rows) and 174 `many` are given by the word lists. 200 to 202 are `--` with spaces in table cells (`Psychophysiology -- postdoctoral`, `2026 -- present`); `26 May 2023 -- 31 Dec 2023` on 200 passes as a number range.

- research-hub `concept-note.tex` (read only), exit 1:

```
concept-note.tex:69: contrast: "not rest on the model being correctly specified, only": a binary contrast, 4 in this file, more than 2
concept-note.tex:71: filler: "simply": a filler word, to be checked against section A of the prose standard
concept-note.tex:79: contrast: "not the waveforms but M": a binary contrast, 4 in this file, more than 2
concept-note.tex:81: vague: "typically": a vague qualifier, to be checked against section A of the prose standard
concept-note.tex:85: filler: "very": a filler word, to be checked against section A of the prose standard
concept-note.tex:85: vague: "many": a vague qualifier, to be checked against section A of the prose standard
concept-note.tex:85: contrast: "not a limitation to apologise for, it": a binary contrast, 4 in this file, more than 2
concept-note.tex:87: contrast: "not the physics but the regime, continuous": a binary contrast, 4 in this file, more than 2
concept-note.tex:98: vague: "many": a vague qualifier, to be checked against section A of the prose standard
```

Judged: 69 (`not rest on the model being correctly specified, only`, seven words), 79, 85 (five words) and 87 are contrasts under ruling 1's window of 1 to 10 words, 4 in the file, so each is flagged. Line 59 (`not a procedure you can repeat for the fourth hospital, or`) and line 93 (`not an offer to do machine learning for your group, which`) end in a continuation word and are not counted. 71 `simply`, 85 `very`, 81 `typically`, 85 and 98 `many` are given by the word lists.

### Rule-13 table after round 1

This table replaces the one above. The first twelve rows of that table (each check turned off, case 5) hold as rerun above. Each row below is one string replacement in a scratch copy of the script outside the worktree, run by `python3 <scratchpad>/run_r1.py skills/writing/templates <scratchpad>` (the round-0 lists `R` and `EXTRA`, with the rows whose code changed replaced by `FIXED` and the new rows in `NEW`, `<scratchpad>/reverts_r1.py`). 213 rows, each exit 1; the red line is the first `FAIL:` line the test printed. Where the red line names another file than the case, the case file was also run under the revert and loses its flag (checked for R5 text before a command, R5 text after the last command, R5 text after \item, R11 a data row ends without a sentence end, R11 a command line holds only arguments after the command, LaTeX list items).

| Rule or branch | Case | Near miss | Revert | Red line |
|---|---|---|---|---|
| letter passes (non-ascii) | clean.md line 8, the accented name Jose (U+00E9) Garcia (U+00ED) | nonascii.md line 3, U+00D7, flagged | `` if ord(char) > 0x7F and not category.startswith("L"): `` replaced by `` if ord(char) > 0x7F: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| combining mark after a letter or mark passes (ruling 5) | nonascii.md line 7, a decomposed name (e + U+0301, e + U+0301 + U+0308), passes | nonascii.md line 8, a lone U+0301 after a space, flagged | `` if not (category.startswith("M") and previous[:1] in ("L", "M")): `` replaced by `` if True: `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6 7 7 7 8], expected [3 4 5 6 8]` |
| combining mark after a mark passes (ruling 5) | nonascii.md line 7, U+0308 after U+0301, passes | nonascii.md line 8, flagged | `` previous[:1] in ("L", "M") `` replaced by `` previous[:1] in ("L",) `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6 7 8], expected [3 4 5 6 8]` |
| combining mark after anything else flagged (ruling 5) | nonascii.md line 8, U+0301 after a space, flagged | nonascii.md line 7, passes | `` previous[:1] in ("L", "M") `` replaced by `` previous[:1] in ("L", "M", "Z") `` | `FAIL: nonascii.md non-ascii: flagged lines [3 4 5 6], expected [3 4 5 6 8]` |
| table separator row not read by dash-aside (ruling 1) | clean.md line 48 and dash.md line 10 (\|:---\|---:\|), not flagged | dash.md line 11, a data row with -- and - , flagged twice | `` elif SEPARATOR_ROW.match(line): `` replaced by `` elif False: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| thematic break is no list and not read (ruling 2) | dash.md lines 24, 26, 28 (---, * * *, ___) not flagged; colon.md line 38 (* * *) is no list | dash.md line 30, -- inside a comment, flagged | `` if len(marks) >= 3 and not marks.strip("-*_"): `` replaced by `` if False: `` | `FAIL: colon.md colon-lists: flagged lines [9 14 36 40], expected [9 14]` |
| comment markers not read by dash-aside (ruling 2) | dash.md lines 30 and 32-34, the markers not flagged | dash.md lines 30 and 33, the -- aside inside each comment, flagged | `` dash_text = COMMENT_MARKER.sub(lambda m: " " * len(m.group(0)), text) `` replaced by `` dash_text = text `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 30 30 32 33 34 38 40 42 67 69], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| number range with one space each side passes (ruling 3) | dash.md line 36 (2023 - 2024, 3 -- 5) and dash.tex line 12 (2023 -- 31, 2023 - 2024), not flagged | dash.md lines 38, 40 and dash.tex lines 13, 14, a letter on one side, flagged | `` if core in ("-", "--") and re.search `` replaced by `` if False and re.search `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 36 36 38 40 42 67 69], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| LaTeX -- needs a space on a side | dash.tex lines 5, 6 and clean.tex line 9 (3--5, 10--12, Navier--Stokes), not flagged | dash.tex lines 3, 4, flagged | `` if doc.latex and core == "--" and not `` replaced by `` if False and not `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| spaced hyphen needs text before it (list marker) | every list item of sample.md and dash.md lines 13-18, markers not flagged | dash.md line 13, the inner spaced hyphen, flagged | `` \|(?<=\S)[ \t]+-(?=[ \t])")\nTEX_DASH `` replaced by `` \|[ \t]*-(?=[ \t])")\nTEX_DASH `` | `FAIL: sample.md dash-aside: flagged lines [9 33 34 38 39], expected [9]` |
| Markdown -- anywhere | dash.md lines 4, 5, 7, 11, flagged | dash.md line 22, -- in inline code, not flagged | `` MD_DASH = re.compile(r"[\u2013\u2014]\|-{2,}\| `` replaced by `` MD_DASH = re.compile(r"[\u2013\u2014]\| `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 11 13 38 40 42 69], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| LaTeX --- anywhere | sample.tex line 8, dash.tex lines 1, 2, flagged | clean.tex line 13, --- in an equation, not flagged | `` \|-{3,}\|(?<!-)--(?!-) `` replaced by `` \|(?<!-)--(?!-) `` | `FAIL: sample.tex dash-aside: flagged lines [], expected [8]` |
| em and en dash | dash.md lines 1, 2 and dash.tex line 8, flagged | dash.md lines 45, 49, in fences, not flagged by dash-aside | `` MD_DASH = re.compile(r"[\u2013\u2014]\| `` replaced by `` MD_DASH = re.compile(r"[\u2013]\| `` | `FAIL: dash.md dash-aside: flagged lines [2 3 4 5 7 11 11 13 30 33 38 40 42 67 69], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| frontmatter left out | clean.md lines 1-4, not flagged | frontopen.md line 2, an unclosed block, flagged | `` if count and self.raw[0].rstrip() == "---": `` replaced by `` if False: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| closing fence at least as long | dash.md lines 52-55, a ``` line inside a ```` fence | dash.md line 42, flagged prose | `` len(closing.group(1)) >= len(fence) `` replaced by `` True `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 54 54 58], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| fence left open runs to the end | dash.md lines 73-74 | dash.md line 42 | `` fence = opening.group(1) `` replaced by `` fence = opening.group(1) if any(FENCE_CLOSE.match(l) for l in self.raw[i + 1:]) else None `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69 74], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| backtick fence info holds no backtick | dash.md line 42, ```x``` opens a prose line, its aside flagged | dash.md lines 44-46, a real fence, not flagged | `` if opening and not (opening.group(1)[0] == "`" and "`" in opening.group(2)): `` replaced by `` if opening: `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 45 45 45 54 54], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| inline code spans removed | clean.md line 18, `--limit`, `a - b`, `simply` | dash.md line 4, the same -- outside code, flagged | `` text = CODE_SPAN.sub(" ", line) `` replaced by `` text = line `` | `FAIL: clean.md: exit 1, expected 0 []` |
| Markdown headings # to ###### | sections.md, a heading of each level 1 to 6 | sections.md line 13, seven hashes, no heading | `` MD_HEADING = re.compile(r" {0,3}(#{1,6}) `` replaced by `` MD_HEADING = re.compile(r" {0,3}(#{1,5}) `` | `FAIL: sections.md section-words: flagged lines [1 1 1 5 9 17 19 19 21], expected [1 1 5 9 11 17 19 19 21]` |
| seven hashes make no heading | sections.md line 13 | sections.md line 11, six hashes, a heading | `` MD_HEADING = re.compile(r" {0,3}(#{1,6})(?=[ \t]\|$) `` replaced by `` MD_HEADING = re.compile(r" {0,3}(#{1,7})(?=[ \t]\|$) `` | `FAIL: sections.md section-words: flagged lines [1 1 5 9 17 19 19 21], expected [1 1 5 9 11 17 19 19 21]` |
| closing hashes dropped from a heading | sections.md line 19, ## dup ## | sections.md line 17, ## Dup | `` title = re.sub(r"(?:^\|[ \t]+)#+$", "", heading.group(2).strip()).strip() `` replaced by `` title = heading.group(2).strip() `` | `FAIL: sections.md section-words: flagged lines [1 1 5 9 11 17 21], expected [1 1 5 9 11 17 19 19 21]` |
| plain text has no headings | notes.txt, # Methods; Results is prose (semicolons at 3, limit at 1) | notes.md, the same text, a heading, exit 0 | `` self.parse_markdown(path.endswith(".md")) `` replaced by `` self.parse_markdown(True) `` | `FAIL: notes.txt: exit 0, expected 1 []` |
| LaTeX comment removed | sample.tex line 6, clean.tex line 10, dash.tex line 9 | dash.tex line 10, an escaped percent, flagged | `` \|(?P<comment>(?<!\\)%[^\n]*)" `` replaced by `` \|(?P<comment>(?!x)x)" `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| escaped percent is no comment | dash.tex line 10, flagged | dash.tex line 9, a comment, not flagged | `` \|(?P<comment>(?<!\\)%[^\n]*)" `` replaced by `` \|(?P<comment>%[^\n]*)" `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 13 14 15 16 17 18 19 20 21 22 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| equation left out | clean.tex lines 12-14, dash.tex lines 29-32 | dash.tex line 7 | `` (equation\|align\|gather\| `` replaced by `` (align\|gather\| `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| align left out | clean.tex lines 15-17, dash.tex lines 33-38 | dash.tex line 7 | `` (equation\|align\|gather\| `` replaced by `` (equation\|gather\| `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| gather left out (ruling 4) | dash.tex lines 17, 18, the hyphen inside not flagged | the same lines, the hyphen outside, flagged once | `` (equation\|align\|gather\| `` replaced by `` (equation\|align\| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 17 18 18 19 20 21 22 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| multline left out (ruling 4) | dash.tex lines 19, 20 | the hyphen outside on the same lines, flagged once | `` \|multline\| `` replaced by `` \| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 19 20 20 21 22 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| eqnarray left out (ruling 4) | dash.tex lines 21, 22 | the hyphen outside, flagged once | `` \|eqnarray\| `` replaced by `` \| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 21 22 22 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| displaymath left out (ruling 4) | dash.tex line 23 | the hyphen outside, flagged once | `` \|displaymath\|math) `` replaced by `` \|math) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| math environment left out (ruling 4) | dash.tex line 24 | the hyphen outside, flagged once | `` \|displaymath\|math) `` replaced by `` \|displaymath) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| starred math environments (ruling 4) | dash.tex lines 18, 20, 22, 32 and clean.tex lines 15-17 | the hyphen outside, flagged once | `` displaymath\|math)(\*?)\} `` replaced by `` displaymath\|math)()\} `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| $$...$$ left out (ruling 4) | dash.tex line 15, $$a - b$$ then inline $c$ | the hyphen outside, flagged once | `` r"\|(?<!\\)\$\$.*?(?<!\\)\$\$" `` replaced by (nothing) | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| \[...\] left out (ruling 4) | dash.tex line 16 | the hyphen outside, flagged once | `` r"\|(?<!\\)\\\[.*?\\\]" `` replaced by (nothing) | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 16 17 18 19 20 21 22 23 24 25 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| \(...\) left out | dash.tex line 11, clean.tex line 11 | dash.tex line 7 | `` r"\|(?<!\\)\\\(.*?\\\)" `` replaced by (nothing) | `FAIL: clean.tex: exit 1, expected 0 []` |
| $...$ left out | dash.tex line 11, clean.tex line 11 | dash.tex line 7 | `` r"\|(?<!\\)\$(?:\\.\|(?!\n[ \t]*\n)[^$\\])+?\$", `` replaced by `` r"\|(?!x)x", `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| heading match case-insensitive | clean.md --limit ' limits =12' against ## Limits | sections.md --limit 'code=1', no heading, flagged at line 1 | `` if title.strip().lower() != key.lower(): `` replaced by `` if title.strip() != key: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| limit heading whitespace ignored | clean.md --limit ' limits =12' | sections.md --limit '  three  =1', flagged | `` limits.append((key.strip(), int(number))) `` replaced by `` limits.append((key, int(number))) `` | `FAIL: clean.md: exit 1, expected 0 []` |
| limit split at the last = | sections.md --limit 'A=B=1' against ## A=B | usage --limit 'Abstract=', exit 64 | `` key, equals, number = value.rpartition("=") `` replaced by `` key, equals, number = value.partition("=") `` | `FAIL: sections.md: exit 64, expected 1 [check_prose.py: --limit 'A=B=1' is not <heading text>=<positive integer>` |
| unmatched limit flagged at line 1 | sample.md with --limit Abstract=10, sections.md code=1 | sections.md one=4, matched, flagged at its heading | `` flags.append((1, "%s: no heading matches this limit" % quote(key))) `` replaced by `` pass `` | `FAIL: two-files:       29 lines, expected 30 (the 14 of each file, plus the Methods section of sample.tex and the unmatched Abstract limit of sample.md)` |
| section over the limit only | sections.md TWO=6 (6 words), clean.md limits=12 (12 words), not flagged | sections.md one=4 (5 words), flagged | `` if total > limit: `` replaced by `` if total >= limit: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| semicolons: more than 2 per 1000 | semi500.md, 1 in 500 words, not flagged | semi499.md, 1 in 499 words, flagged | `` if total * 1000 <= 2 * total_words: `` replaced by `` if total * 1000 < 2 * total_words: `` | `FAIL: semi500.md: exit 1, expected 0 []` |
| history: step <number> | history.md line 12 | history.md line 15, stepwise and steps 3, not flagged | `` patterns.append(re.compile(r"(?<!\w)step\s+\d+(?!\w)", re.I)) `` replaced by (nothing) | `FAIL: history.md history: flagged lines [1 2 3 4 5 6 7 8 9 10 11 13], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| history: date | history.md line 13 | history.md line 15, 2026-9-28 and 20260928, not flagged | `` patterns.append(re.compile(r"(?<!\w)\d{4}-\d{2}-\d{2}(?!\w)")) `` replaced by (nothing) | `FAIL: history.md history: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| phrases case-insensitive | history.md lines 1, 2, 11 and throat.md line 2 | history.md line 17, reused, unmoved, as offered, not flagged | `` return re.compile(r"(?<!%s)%s(?!%s)" % (boundary, body, boundary), re.I) `` replaced by `` return re.compile(r"(?<!%s)%s(?!%s)" % (boundary, body, boundary)) `` | `FAIL: history.md history: flagged lines [3 4 5 6 7 8 9 10 12 13], expected [1 2 3 4 5 6 7 8 9 10 11 12 13]` |
| whole words, hyphen included | words.md lines 1-40 | words.md line 42, easy-going, easily, simplest, not flagged | `` patterns = [phrase_pattern(w, r"[\w-]") for w in FILLER_WORDS] `` replaced by `` patterns = [phrase_pattern(w, r"\w") for w in FILLER_WORDS] `` | `FAIL: words.md filler: flagged lines [1 2 3 4 5 6 7 41 41 42], expected [1 2 3 4 5 6 7 41 41]` |
| equal-length band of 2 | equal.md line 1, counts 6, 5, 7, 5, 6 | equal.md line 5, counts 5, 6, 8, 5, 5, not flagged | `` if high - low > 2: `` replaced by `` if high - low > 3: `` | `FAIL: equal.md equal-length: flagged lines [1 5 45 51 55], expected [1 45 51 55]` |
| equal-length five sentences | sample.md line 29, five sentences | equal.md line 9 and clean.md line 51, four, not flagged | `` if end - start >= 5: `` replaced by `` if end - start >= 4: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast continuation words | contrast.md lines 8-16 and clean.md line 36, not counted | contrast.md lines 1-6, counted | `` if m.group(2).lower() not in CONTINUATIONS] `` replaced by `` ] `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast but form | sample.md line 25, contrast.md line 2 | contrast.md line 18, eleven words before but, not counted | `` matches.extend(CONTRAST_BUT.finditer(sentence)) `` replaced by (nothing) | `FAIL: sample.md contrast: flagged lines [], expected [23 25 27]` |
| contrast a sentence counts once | contrast.md line 5, both forms in one sentence, flagged once | contrast.md line 1, one form | `` first = min(matches, key=lambda m: m.start())\n                found.append((doc.line_at(block, offset + first.start()), first.group(0))) `` replaced by `` for first in matches:\n                    found.append((doc.line_at(block, offset + first.start()), first.group(0))) `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 5 6 21 22 25 26 27 29 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| contrast more than 2 | sample.md, 3 contrasts, all flagged | clean.md, 2 contrasts, not flagged | `` if len(found) <= 2: `` replaced by `` if len(found) <= 1: `` | `FAIL: clean.md: exit 1, expected 0 []` |
| colon-lists nothing else between | colon.md lines 40-46, a heading between, not flagged | colon.md line 14, flagged | `` units.append(("para" if block.kind == "para" else "other", block)) `` replaced by `` if block.kind == "para":\n                units.append(("para", block)) `` | `FAIL: colon.md colon-lists: flagged lines [9 14 45], expected [9 14]` |
| colon-lists paragraph ends with a colon | colon.md lines 48-52, the first paragraph with no colon, not flagged | colon.md line 14, flagged | `` and doc.block_text(first[1]).rstrip().endswith(":") `` replaced by `` and True `` | `FAIL: colon.md colon-lists: flagged lines [9 14 51], expected [9 14]` |
| quote at most 60 characters | sample.md line 21 and semi499.md line 1, cut at 60 | sections.md short quotes, whole | `` QUOTE_LENGTH = 60 `` replaced by `` QUOTE_LENGTH = 61 `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| output sorted by file then line | sample.md, section-words at line 1 before non-ascii at line 6; two-files run | sort -c on every run | `` flags.sort(key=lambda f: (f[0], f[1], f[2], f[4])) `` replaced by (nothing) | `FAIL: sample.md: output not sorted by file then line` |
| usage: no file | no argument | empty.md, exit 0 | `` if not paths:\n        raise UsageError("no file given") `` replaced by (nothing) | `FAIL: usage no file: exit 0, expected 64` |
| usage: --limit needs a value | sample.md --limit | --limit Methods=100 sample.md, exit 1 | `` if i + 1 >= len(arguments):\n                raise UsageError("--limit needs a value") `` replaced by (nothing) | `FAIL: usage limit with no value: exit 1, expected 64` |
| usage: positive limit | --limit Abstract=0 | --limit Abstract=10, accepted | `` or int(number) == 0: `` replaced by `` : `` | `FAIL: usage limit of 0: exit 1, expected 64` |
| usage: whole-number limit | --limit Abstract=-2, =1.5, =ten | --limit Abstract=10, accepted | `` not re.fullmatch(r"[0-9]+", number) `` replaced by `` not re.fullmatch(r"-?[0-9]+", number) `` | `FAIL: usage negative limit: exit 1, expected 64` |
| usage: heading text | --limit =5 and ' =5' | --limit 'A=B=1', accepted | `` if not equals or not key.strip() or `` replaced by `` if not equals or `` | `FAIL: usage empty heading: exit 1, expected 64` |
| usage: unreadable file | missing.md, the directory sub, locked.md | sub/nested.md, read | `` except OSError as error: `` replaced by `` except KeyError as error: `` | `FAIL: usage missing file: exit 1, expected 64` |
| usage: not UTF-8 | latin1.md | sample.md | `` except UnicodeDecodeError: `` replaced by `` except KeyError: `` | `FAIL: usage non-UTF-8 file: exit 1, expected 64` |
| usage: nothing on stdout | sample.md missing.md, exit 64 with empty stdout | sample.md alone, flags printed | `` texts = [(path, read(path)) for path in paths] `` replaced by `` texts = []\n        for path in paths:\n            try:\n                texts.append((path, read(path)))\n            except UsageError:\n                sys.stdout.write("x\n")\n                raise `` | `FAIL: usage missing file: stdout is not empty [x]` |
| never writes to a file | cksum of every scratch file before and after all runs | the same files, unchanged | `` doc = Document(path, text) `` replaced by `` doc = Document(path, text)\n        open(path + ".out", "w").close() `` | `FAIL: a run wrote to a file` |
| list continuation, lazy | colon.md line 5, continued lazily | colon.md line 9, flagged | `` elif last in ("item", "cont") and (not blank_before or line[:1] in " \t"): `` replaced by `` elif last in ("item", "cont") and line[:1] in " \t": `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list continuation, indented after a blank | colon.md line 7 | colon.md line 9, flagged | `` elif last in ("item", "cont") and (not blank_before or line[:1] in " \t"): `` replaced by `` elif last in ("item", "cont") and not blank_before: `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list marker 1) | colon.md line 3, 1) one | colon.md line 9, flagged | `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\|\d{1,9}[.)]) `` replaced by `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\|\d{1,9}[.]) `` | `FAIL: colon.md colon-lists: flagged lines [14], expected [9 14]` |
| list markers * and + | colon.md lines 15, 16 | colon.md line 14, flagged | `` MD_ITEM = re.compile(r"[ \t]*(?:[-*+]\| `` replaced by `` MD_ITEM = re.compile(r"[ \t]*(?:[-]\| `` | `FAIL: colon.md colon-lists: flagged lines [9], expected [9 14]` |
| phrase across a line break | throat.md lines 18-19, at the end / of the day, flagged at 18 | throat.md lines 1-14, one line each | `` body = r"\s+".join(re.escape(word) for word in phrase.split()) `` replaced by `` body = " ".join(re.escape(word) for word in phrase.split()) `` | `FAIL: throat.md throat-clearing: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 13 14], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 18 21]` |
| quote collapses a line break | throat.md line 18, quote at the end of the day | every one-line quote | `` re.sub(r"[ \t\r\n]+", " ", text).strip(" ")[:QUOTE_LENGTH] `` replaced by `` text.strip(" ")[:QUOTE_LENGTH] `` | `FAIL: throat.md: a line not in the form <file>:<line>: <check>: "<text>": <message> [throat.md:18: throat-clearing: "at the end` |
| frontmatter closed by ... | frontdots.md, closed by ..., exit 0 | frontopen.md, never closed, line 2 flagged | `` if self.raw[j].rstrip() in ("---", "..."): `` replaced by `` if self.raw[j].rstrip() in ("---",): `` | `FAIL: frontdots.md: exit 1, expected 0 []` |
| frontmatter left open is none | frontopen.md line 2, flagged | frontdots.md, exit 0 | `` start = j + 1\n                    break `` replaced by `` start = j + 1\n                    break\n            else:\n                self.kind = ["code"] * count\n                start = count `` | `FAIL: frontopen.md: exit 0, expected 1 []` |
| tilde fences | clean.md lines 24-26 and dash.md lines 48-50, not flagged | dash.md line 42, a line opening with a code span, flagged | `` FENCE_OPEN = re.compile(r"[ \t]*(`{3,}\|~{3,})(.*)$") `` replaced by `` FENCE_OPEN = re.compile(r"[ \t]*(`{3,})(.*)$") `` | `FAIL: clean.md: exit 1, expected 0 []` |
| fence indented up to 3 spaces | dash.md lines 57-59 (three spaces) and p7.md lines 3-5 (four spaces under a list item), not flagged | dash.md line 42 and p7.md line 7, flagged | `` FENCE_OPEN = re.compile(r"[ \t]*( `` replaced by `` FENCE_OPEN = re.compile(r" {0,3}( `` | `FAIL: p7.md dash-aside: flagged lines [4 7], expected [7]` |
| verbatim left out | clean.tex lines 18-20, dash.tex lines 39-41 | dash.tex line 7, a spaced hyphen outside, flagged | `` (?P<env>verbatim\|lstlisting\|minted) `` replaced by `` (?P<env>lstlisting\|minted) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| lstlisting left out | clean.tex lines 21-23, dash.tex lines 45-47 | dash.tex line 7 | `` (?P<env>verbatim\|lstlisting\|minted) `` replaced by `` (?P<env>verbatim\|minted) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| minted left out | clean.tex lines 24-26, dash.tex lines 48-50 | dash.tex line 7 | `` (?P<env>verbatim\|lstlisting\|minted) `` replaced by `` (?P<env>verbatim\|lstlisting) `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| starred verbatim | dash.tex lines 42-44 | dash.tex line 7 | `` (?P<star>\*?) `` replaced by `` (?P<star>) `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27 43 43], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| LaTeX starred and sub-sub headings | sections.tex lines 7 (\subsection*), 9 (\subsubsection) and 18 (\subsubsection*[S]{Last}) | sections.tex line 9, deeper=1 at its limit, not flagged | `` (?P<heading>\\(?:sub)?(?:sub)?section\*? `` replaced by `` (?P<heading>\\(?:sub)?section `` | `FAIL: sections.tex section-words: flagged lines [1 1 1 1 1 5 14 16], expected [1 5 7 11 14 16 18]` |
| abstract ends at \end{abstract} | sections.tex, Abstract 3 words, line 4 outside it | sections.tex line 1 flagged with 3, not 10 | `` self.headings[state["abstract"]][2] = len(self.pieces) `` replaced by `` pass `` | `FAIL: sections.tex section-words: no line [sections.tex:1: section-words: "Abstract": 3 words, over the limit of 2] in [sections.tex:1: section-words: "Abstract": 10 words, over the limit of 2` |
| tabular rows are table rows | clean.tex line 41, semitab.tex line 4, semicolons not counted | semitab.tex line 7, a list item, flagged | `` TEX_TABLES = ("tabular", "tabular*", "tabularx", "longtable") `` replaced by `` TEX_TABLES = ("tabular*", "tabularx", "longtable") `` | `FAIL: clean.tex: exit 1, expected 0 []` |
| LaTeX list items | sample.tex line 25 and colon.tex lines 6 and 19, colon paragraphs before LaTeX lists, flagged | colon.tex lines 11-13, a colon paragraph with no list after it | `` self.add(i, "item", latex_plain(match.group("label") or "")) `` replaced by `` self.add(i, "text", latex_plain(match.group("label") or "")) `` | `FAIL: sample.tex colon-lists: flagged lines [], expected [25]` |
| section words leave out the heading line | sections.md and sections.tex, each count without the heading's own words | sections.tex line 1, Abstract 3 words | `` for p in doc.pieces[start + 1:end] if p.kind in counted `` replaced by `` for p in doc.pieces[start:end] if p.kind in counted + ("heading",) `` | `FAIL: sample.md section-words: no line [sample.md:1: section-words: "Methods": 230 words, over the limit of 100] in [sample.md:1: section-words: "Methods": 231 words, over the limit of 100` |
| semicolons leave out headings | clean.md line 6 and semitab.md line 5 | semitab.md line 15, a list item, flagged | `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont") and `` replaced by `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont", "heading") and `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| semicolons leave out table rows | clean.md line 49, semitab.md line 9, semitab.tex lines 4, 10, 13, 16 | semitab.md line 15, flagged | `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont") and `` replaced by `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont", "cell") and `` | `FAIL: clean.md: exit 1, expected 0 []` |
| equal-length leaves out list items, headings, tables | equal.md lines 13-33, five equal items, headings, rows, code | equal.md line 1, flagged | `` if block.kind == "para":\n            sections[-1].extend `` replaced by `` if block.kind in ("para", "item", "heading", "cell"):\n            sections[-1].extend `` | `FAIL: clean.md: exit 1, expected 0 []` |
| contrast 1 to 4 words | contrast.md lines 21 (five words) and 22 (nine words), counted | contrast.md line 6, four words, counted either way | `` WINDOW = r"(?:\s+(?!but\b)(?:[^\W_]\|['-])+){1,10}" `` replaced by `` WINDOW = r"(?:\s+(?!but\b)(?:[^\W_]\|['-])+){1,4}" `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 25 26 29 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| LaTeX comment-only line is neutral | colon.tex line 19, a comment line between a list and a colon paragraph, still flagged at 20 | colon.tex lines 24-26, an equation between, not flagged | `` if i in removed:\n                    self.add(i, removed[i]) `` replaced by `` self.add(i, removed.get(i, "code")) `` | `FAIL: colon.tex colon-lists: flagged lines [6], expected [6 19]` |
| LaTeX removed math or code is content | colon.tex lines 24-26, an equation between a list and the next colon paragraph, not flagged | colon.tex line 20, flagged | `` if i in removed:\n                    self.add(i, removed[i]) `` replaced by `` pass `` | `FAIL: colon.tex colon-lists: flagged lines [6 19 26], expected [6 19]` |
| LaTeX heading with nested braces | sections.tex line 14, \section{The \emph{Nested} Part} | sections.tex line 5, \section{Intro} | `` title = " ".join(latex_plain(line[match.end():close - 1]).split()) `` replaced by `` title = " ".join(latex_plain(line[match.end():line.find("}", match.end())]).split()) `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11 16 18], expected [1 5 7 11 14 16 18]` |
| LaTeX heading whitespace collapsed | sections.tex line 14, title The Nested Part | sections.tex line 7, Deep Part | `` title = " ".join(latex_plain(line[match.end():close - 1]).split()) `` replaced by `` title = latex_plain(line[match.end():close - 1]).strip() `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11 16 18], expected [1 5 7 11 14 16 18]` |
| equal-length runs across headings | eq.md (two sentences, # Results, a code block, three sentences) and eq.tex (\section{B} between), exit 0 | eqpara.tex, a paragraph break only, flagged at 1 | `` elif block.kind in ("heading", "close"): `` replaced by `` elif block.kind in ("close",): `` | `FAIL: equal.md equal-length: flagged lines [1 37 45 51 55], expected [1 45 51 55]` |
| equal-length runs across paragraphs | equal.md line 45 and eqpara.tex line 1, two sentences, a blank line, three, flagged | eq.md, a heading between, exit 0 | `` if block.kind == "para":\n            sections[-1].extend `` replaced by `` if block.kind == "para":\n            sections.append([])\n            sections[-1].extend `` | `FAIL: equal.md equal-length: flagged lines [1 51 55], expected [1 45 51 55]` |
| section words count table rows | sections.md line 21, the A=B section with the table row \| three \|, 4 words | sections.md line 1 | `` counted = ("text", "item", "cont", "cell") `` replaced by `` counted = ("text", "item", "cont") `` | `FAIL: sections.md section-words: no line [sections.md:21: section-words: "A=B": 4 words, over the limit of 1] in [sections.md:1: section-words: "One": 5 words, over the limit of 4` |
| section words count list items | sample.md Methods, 230 words with its list items | sections.md line 21, 4 words | `` counted = ("text", "item", "cont", "cell") `` replaced by `` counted = ("text", "cell") `` | `FAIL: sample.md section-words: no line [sample.md:1: section-words: "Methods": 230 words, over the limit of 100] in [sample.md:1: section-words: "Methods": 205 words, over the limit of 100` |
| semicolons count list items | semitab.md line 15, semitab.tex line 7, flagged | sample.md word total 194 with its list items | `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont") and `` replaced by `` running = [p for p in doc.pieces if p.kind in ("text",) and `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| contrast reads list items and headings | contrast.md lines 3 (item) and 4 (heading), counted | contrast.md line 1, a paragraph | `` for block in doc.prose_blocks():\n        for line, sentence `` replaced by `` for block in [b for b in doc.blocks if b.kind == "para"]:\n        for line, sentence `` | `FAIL: contrast.md contrast: flagged lines [1 2 5 6 21 22 25 26 27 29 30], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| word checks read list items, headings, tables | words.md, every word as a list item | words.md line 44, the word in code, not flagged | `` return [b for b in self.blocks if b.kind in ("para", "item", "heading", "cell")] `` replaced by `` return [b for b in self.blocks if b.kind in ("para",)] `` | `FAIL: words.md: exit 0, expected 1 []` |
| R1 window up to 10 words (11 matches) | contrast.md line 17 and clean.md line 38, eleven words, not counted | contrast.md line 27, ten words, counted | `` ['-])+){1,10}" `` replaced by `` ['-])+){1,11}" `` | `FAIL: clean.md: exit 1, expected 0 []` |
| R1 window up to 10 words (9 misses) | contrast.md line 27, ten words, counted | contrast.md line 17, eleven words, not counted | `` ['-])+){1,10}" `` replaced by `` ['-])+){1,9}" `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 29 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 window at least 1 word | contrast.md line 28, not, in the end, the page: no match | contrast.md line 4, Not the page, the: counted | `` ['-])+){1,10}" `` replaced by `` ['-])+){0,10}" `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 28 29 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 window word holds ' and - | contrast.md line 29, not the file's well-kept copy, it: counted | contrast.md line 23, not done), a: not counted | `` WINDOW = r"(?:\s+(?!but\b)(?:[^\W_]\|['-])+){1,10}" `` replaced by `` WINDOW = r"(?:\s+(?!but\b)(?:[^\W_])+){1,10}" `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 other punctuation ends the window | contrast.md line 23, not done), a: not counted | contrast.md line 29, counted | `` WINDOW = r"(?:\s+(?!but\b)(?:[^\W_]\|['-])+){1,10}" `` replaced by `` WINDOW = r"(?:\s+(?!but\b)(?:[^\s,])+){1,10}" `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 23 25 26 27 29 30 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinate clause skipped | contrast.md line 24, If it is not found in the cache, the: not counted | contrast.md line 25, the same without If, counted | `` matches = [m for m in matches if not subordinate(sentence, m.start())] `` replaced by (nothing) | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 24 25 26 27 29 30 31 32 33 34 35 36 37 40 41], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 clause starts after , ; : | contrast.md line 30, If the file is read, it is not the page, it: counted | contrast.md line 24, not counted | `` CLAUSE_BREAK = re.compile(r"[,;:]") `` replaced by `` CLAUSE_BREAK = re.compile(r"(?!x)x") `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator if | contrast.md line 24 | contrast.md line 25 | `` SUBORDINATORS = ("if", "when", `` replaced by `` SUBORDINATORS = ("when", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 24 25 26 27 29 30 40 41], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator when | contrast.md line 31 | contrast.md line 25 | `` ("if", "when", "unless", `` replaced by `` ("if", "unless", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 31 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator unless | contrast.md line 32 | contrast.md line 25 | `` "when", "unless", "whether", `` replaced by `` "when", "whether", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 32 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator whether | contrast.md line 33 | contrast.md line 25 | `` "unless", "whether", "because", `` replaced by `` "unless", "because", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 33 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator because | contrast.md line 34 | contrast.md line 25 | `` "whether", "because", "although", `` replaced by `` "whether", "although", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 34 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator although | contrast.md line 35 | contrast.md line 25 | `` "because", "although", "since", `` replaced by `` "because", "since", `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 35 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator since | contrast.md line 36 | contrast.md line 25 | `` "although", "since", "while") `` replaced by `` "although", "while") `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 36 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R1 subordinator while | contrast.md line 37 | contrast.md line 25 | `` "since", "while") `` replaced by `` "since") `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 37 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R3 run ends at \end{abstract} | eqabs.tex, two sentences in the abstract, three after \end{abstract}, exit 0 | eqpara.tex, flagged | `` elif block.kind in ("heading", "close"): `` replaced by `` elif block.kind in ("heading",): `` | `FAIL: eqabs.tex: exit 1, expected 0 []` |
| R4 sentence ends at ! and ? | equal.md line 51, five sentences ending at ! and ?, flagged | equal.md line 45, a heading-free run, flagged | `` SENTENCE_END = re.compile(r"[.!?]+ `` replaced by `` SENTENCE_END = re.compile(r"[.]+ `` | `FAIL: equal.md equal-length: flagged lines [1 45 55], expected [1 45 51 55]` |
| R4 word joined across ' | equal.md line 55, It's the file's twin's owner's copy: 6 words | the same line's hyphenated sentence | `` WORD = re.compile(r"[^\W_]+(?:['-][^\W_]+)*") `` replaced by `` WORD = re.compile(r"[^\W_]+(?:[-][^\W_]+)*") `` | `FAIL: equal.md equal-length: flagged lines [1 45 51], expected [1 45 51 55]` |
| R4 word joined across - | equal.md line 55, The well-read, well-kept, well-made, well-used file: 6 words | the same line's apostrophe sentence | `` WORD = re.compile(r"[^\W_]+(?:['-][^\W_]+)*") `` replaced by `` WORD = re.compile(r"[^\W_]+(?:['][^\W_]+)*") `` | `FAIL: equal.md equal-length: flagged lines [1 45 51], expected [1 45 51 55]` |
| R4 tabular* rows | semitab.tex line 10, a tabular* row ending in a sentence end, not counted | semitab.tex line 7, a list item, counted | `` TEX_TABLES = ("tabular", "tabular*", "tabularx", "longtable") `` replaced by `` TEX_TABLES = ("tabular", "tabularx", "longtable") `` | `FAIL: semitab.tex semicolons: flagged lines [7 10], expected [7]` |
| R4 tabularx rows | semitab.tex line 13, a tabularx row, not counted | semitab.tex line 7 | `` TEX_TABLES = ("tabular", "tabular*", "tabularx", "longtable") `` replaced by `` TEX_TABLES = ("tabular", "tabular*", "longtable") `` | `FAIL: semitab.tex semicolons: flagged lines [7 13], expected [7]` |
| R4 longtable rows | semitab.tex line 16, a longtable row, not counted | semitab.tex line 7 | `` TEX_TABLES = ("tabular", "tabular*", "tabularx", "longtable") `` replaced by `` TEX_TABLES = ("tabular", "tabular*", "tabularx") `` | `FAIL: semitab.tex semicolons: flagged lines [7 16], expected [7]` |
| R4 closing fence of the same character | dash.md lines 61-64, a ~~~ line inside a backtick fence, line 63 not flagged | dash.md line 67, flagged | `` if closing and closing.group(1)[0] == fence[0] and `` replaced by `` if closing and `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 63 74], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| R4 escaped \$ opens no math | dash.tex line 25, It costs \$5 - and then $x$ more: flagged | dash.tex line 11, inline math, not flagged | `` r"\|(?<!\\)\$(?:\\.\| `` replaced by `` r"\|\$(?:\\.\| `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| R4 CR LF read as LF | crlf.md, a fence closed by a CR LF line, line 4 flagged | crlf.md lines 1-3, the fence, not flagged | `` text = text.replace("\r\n", "\n") `` replaced by (nothing) | `FAIL: crlf.md: exit 0, expected 1 []` |
| R4 frontmatter opener with trailing spaces | frontspace.md, an opener '---   ', exit 0 | frontopen.md line 2, flagged | `` if count and self.raw[0].rstrip() == "---": `` replaced by `` if count and self.raw[0] == "---": `` | `FAIL: frontspace.md: exit 1, expected 0 []` |
| R4 but form window holds no but | contrast.md line 26, quote not the page but the | contrast.md line 2, one but | `` WINDOW = r"(?:\s+(?!but\b) `` replaced by `` WINDOW = r"(?:\s+ `` | `FAIL: contrast.md contrast: no line [contrast.md:26: contrast: "not the page but the": a binary contrast, 14 in this file, more than 2] in [contrast.md:1: contrast: "not a style guide, it": a binary contrast, 14 in this file, more than 2` |
| R4 tie order: check order | tie.md line 1, dash-aside z -- a. before filler | tie.md, two filler flags | `` flags.sort(key=lambda f: (f[0], f[1], f[2], f[4])) `` replaced by `` flags.sort(key=lambda f: (f[0], f[1], f[4])) `` | `FAIL: tie.md: order [tie.md:1: filler: "just": a filler word, to be checked against section A of the prose standard` |
| R4 tie order: message | tie.md line 1, filler just before filler very | tie.md, the dash-aside flag first | `` flags.sort(key=lambda f: (f[0], f[1], f[2], f[4])) `` replaced by `` flags.sort(key=lambda f: (f[0], f[1], f[2])) `` | `FAIL: tie.md: order [tie.md:1: dash-aside: "z -- a.": a dash used as an aside` |
| R4 phrase across a tab | throat.md line 21, at the end<TAB>of the day, flagged | throat.md line 18, across a line break | `` body = r"\s+".join(re.escape(word) for word in phrase.split()) `` replaced by `` body = r"[ \n]+".join(re.escape(word) for word in phrase.split()) `` | `FAIL: throat.md throat-clearing: flagged lines [1 2 3 4 5 6 7 8 9 10 11 12 13 14 18], expected [1 2 3 4 5 6 7 8 9 10 11 12 13 14 18 21]` |
| R4 quote collapses a tab | throat.md line 21, quote at the end of the day | throat.md line 18 | `` re.sub(r"[ \t\r\n]+", " ", text) `` replaced by `` re.sub(r"[ \r\n]+", " ", text) `` | `FAIL: throat.md throat-clearing: no line [throat.md:21: throat-clearing: "at the end of the day": a throat-clearing opener, to be cut] in [throat.md:1: throat-clearing: "In the realm of": a throat-clearing opener, to be cut` |
| R5 text after a heading | probe5.tex line 3, \section{Intro} It is simply read here.: filler, and counted in Intro (20 words) | sections.tex, a title alone on its line | `` position = close `` replaced by `` position = len(line) `` | `FAIL: probe5.tex filler: flagged lines [2 4 7 8], expected [2 3 4 7 8]` |
| R5 text before a command | probe5.tex lines 2 and 4, text before \end{abstract} and before \begin{itemize}, filler lost under the revert; dash.tex line 27, the placeholder cell before an & | probe5.tex line 3 | `` segment(position, match.start()) `` replaced by (nothing) | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| R5 text after the last command | sample.tex line 9, a line with no command, and probe5.tex lines 1, 3, 7, 8, text after the last command | probe5.tex line 4 | `` segment(position, len(line)) `` replaced by (nothing) | `FAIL: sample.tex history: flagged lines [], expected [9]` |
| R5 text after \item | sample.tex list items and probe5.tex line 7, \begin{enumerate}\item It is simply the first.: filler | probe5.tex line 5, \item one | `` self.add(i, "item", latex_plain(match.group("label") or "")) `` replaced by `` self.add(i, "item", latex_plain(match.group("label") or ""))\n                position = len(line) `` | `FAIL: sample.tex semicolons: no line [sample.tex:14: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words] in [sample.tex:3: section-words: "Abstract": 20 words, over the limit of 10` |
| R5 text after \end of a list | probe5.tex line 8, \end{enumerate} It was changed simply.: history and filler | probe5.tex line 6, \end{itemize} alone | `` state["list"] = max(state["list"] - 1, 0) `` replaced by `` state["list"] = max(state["list"] - 1, 0)\n                    position = len(line) `` | `FAIL: probe5.tex history: flagged lines [2], expected [2 8]` |
| R5 text after \end{abstract} | probe5.tex line 2, It was changed after. after \end{abstract}: history at 2 | probe5.tex line 2's text before it, in Abstract (15 words) | `` self.add(i, "close") `` replaced by `` self.add(i, "close")\n                    position = len(line) `` | `FAIL: probe5.tex history: flagged lines [8], expected [2 8]` |
| R6 \end after \begin on one line | p2.tex (\begin{tabular}{c} a \end{tabular}) and p4.tex (\begin{itemize}\item one\end{itemize}), then semicolons and five equal sentences: flagged | semitab.tex, the three-line forms | `` elif match.group("end"): `` replaced by `` elif match.group("end") and not re.search(r"\\begin\{", line[:match.start()]): `` | `FAIL: p2.tex: exit 0, expected 1 []` |
| R7 heading optional argument | sections.tex line 16, \section[Short]{Methods} with Methods=1, flagged at 16 | sections.tex line 5, \section{Intro} | `` section\*?\s*(?:\[[^\]]*\]\s*)?\{)" `` replaced by `` section\*?\s*\{)" `` | `FAIL: sections.tex section-words: flagged lines [1 1 1 5 7 11 14], expected [1 5 7 11 14 16 18]` |
| R8 closing fence at any indentation | p7.md line 5, a closing fence indented four spaces, so line 7 is prose and flagged | p7.md line 4, inside the fence, not flagged | `` FENCE_CLOSE = re.compile(r"[ \t]*( `` replaced by `` FENCE_CLOSE = re.compile(r" {0,3}( `` | `FAIL: p7.md: exit 0, expected 1 []` |
| R9 Markdown cells are units | contrast.md line 39, \| a \| not guess \| The open item, booked \|: not counted | contrast.md line 40, a contrast in one cell, counted | `` for cell in CELL_SPLIT.split(text):\n                    self.add(i, "cell", cell) `` replaced by `` self.add(i, "cell", text.replace("\|", " ")) `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 39 40], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R9 escaped \| splits no cell | contrast.md line 41, \| If the \\| sign is not the page, it is the line. \|: one cell, subordinate, not counted | contrast.md line 40, counted | `` CELL_SPLIT = re.compile(r"(?<!\\)\\|") `` replaced by `` CELL_SPLIT = re.compile(r"\\|") `` | `FAIL: contrast.md contrast: flagged lines [1 2 3 4 5 6 21 22 25 26 27 29 30 40 41], expected [1 2 3 4 5 6 21 22 25 26 27 29 30 40]` |
| R9 LaTeX cell at & | tabcells.tex line 4, a & not guess & The open item, booked: not counted | tabcells.tex line 5, a contrast in one cell, counted | `` \|(?P<cell>(?<!\\)&\|\\\\(?:\[[^\]]*\])?)" `` replaced by `` \|(?P<cell>\\\\(?:\[[^\]]*\])?)" `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| R9 LaTeX cell at \\ | tabcells.tex line 6, not guess \\ The open item, booked: not counted | tabcells.tex line 5 | `` \|(?P<cell>(?<!\\)&\|\\\\(?:\[[^\]]*\])?)" `` replaced by `` \|(?P<cell>(?<!\\)&)" `` | `FAIL: tabcells.tex contrast: flagged lines [1 2 5 6], expected [1 2 5]` |
| R9 LaTeX \& splits no cell | tabcells.tex line 7, If R \& D is not the page, it: one cell, subordinate, not counted | tabcells.tex line 5 | `` \|(?P<cell>(?<!\\)&\| `` replaced by `` \|(?P<cell>&\| `` | `FAIL: tabcells.tex contrast: flagged lines [1 2 5 7], expected [1 2 5]` |
| R9 LaTeX \\[...] argument | tabsec.tex line 6, b \\[2pt]: T holds 3 words | tabsec.tex line 7, c \\ | `` \|(?P<cell>(?<!\\)&\|\\\\(?:\[[^\]]*\])?)" `` replaced by `` \|(?P<cell>(?<!\\)&\|\\\\)" `` | `FAIL: tabsec.tex: exit 1, expected 0 []` |
| R9 cells only inside a table | semirow.tex line 7, \keyoutput{a; b \\ c}{d.} outside a table: one data row, not counted | semirow.tex line 5, counted | `` if match.group("cell") and not state["table"]:\n                continue `` replaced by (nothing) | `FAIL: semirow.tex semicolons: flagged lines [5 7 17 21], expected [5 17 21]` |
| R10 blockquote markers stripped | dash.md line 66, > - a quoted list item: not flagged | dash.md line 67, > a -- b: flagged | `` line = BLOCKQUOTE.sub("", self.raw[i], count=1) if self.raw[i].lstrip().startswith(">") else self.raw[i] `` replaced by `` line = self.raw[i] `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 66 67 69 71], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| R10 nested blockquote markers | dash.md line 71, > > - a nested quoted list item: not flagged | dash.md line 67, flagged | `` BLOCKQUOTE = re.compile(r"(?:[ \t]*>[ \t]?)+") `` replaced by `` BLOCKQUOTE = re.compile(r"(?:[ \t]*>[ \t]?)") `` | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69 71], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| R11 Markdown placeholder cell | dash.md line 69, \| - \|: not flagged | dash.md line 69, \| a - b \|: flagged | `` dash_text = PLACEHOLDER_CELL.sub(lambda m: " " * len(m.group(0)), dash_text) `` replaced by (nothing) | `FAIL: dash.md dash-aside: flagged lines [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69 69], expected [1 2 3 4 5 7 11 11 13 30 33 38 40 42 67 69]` |
| R11 placeholder starts after \| | cellend.md line 2, \| a - \|: flagged | cellend.md line 1, \| - : not flagged | `` PLACEHOLDER_CELL = re.compile(r"(?<=\\|)[ \t]* `` replaced by `` PLACEHOLDER_CELL = re.compile(r"[ \t]* `` | `FAIL: cellend.md: exit 0, expected 1 []` |
| R11 placeholder in an unclosed last cell | cellend.md line 1, \| a \| - with no closing \|: not flagged | cellend.md line 2, flagged | `` [ \t]*(?=\\|\|$)") `` replaced by `` [ \t]*(?=\\|)") `` | `FAIL: cellend.md dash-aside: flagged lines [1 2], expected [2]` |
| R11 LaTeX placeholder cell | dash.tex line 27, a & - & b - c: the - cell not flagged | dash.tex line 27, b - c: flagged | `` if chunk.strip() == "-": `` replaced by `` if False: `` | `FAIL: dash.tex dash-aside: flagged lines [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27 27], expected [1 2 3 4 7 8 10 13 14 15 16 17 18 19 20 21 22 23 24 25 27]` |
| R11 \verb removed | code.tex lines 2, 3, \verb\|a -- b\| and \verb+c -- d+: not flagged | code.tex line 17, x -- y outside a command: flagged | `` (?P<inline>\\(?:verb\*?\| `` replaced by `` (?P<inline>\\(?: `` | `FAIL: code.tex dash-aside: flagged lines [2 3 17], expected [17]` |
| R11 \lstinline removed | code.tex line 15, both forms | code.tex line 17 | `` \|lstinline(?:\[[^\]]*\])?\| `` replaced by `` \| `` | `FAIL: code.tex dash-aside: flagged lines [15 15 17], expected [17]` |
| R11 \mintinline removed | code.tex line 16, both forms | code.tex line 17 | `` \|mintinline(?:\[[^\]]*\])?\{[^{}]*\})" `` replaced by `` )" `` | `FAIL: code.tex dash-aside: flagged lines [16 16 17], expected [17]` |
| R11 inline code with a delimiter | code.tex lines 2, 3, 15, 16, the delimiter forms | code.tex line 17 | `` (?:(?P<delim>[^A-Za-z\s{*])(?:(?!(?P=delim))[^\n])*(?P=delim)\|\{[^{}]*\}))" `` replaced by `` (?:\{[^{}]*\}))" `` | `FAIL: code.tex dash-aside: flagged lines [2 3 15 16 17], expected [17]` |
| R11 inline code in braces | code.tex lines 15, 16, the brace forms | code.tex line 17 | `` (?P=delim)\|\{[^{}]*\}))" `` replaced by `` (?P=delim)))" `` | `FAIL: code.tex dash-aside: flagged lines [15 16 17], expected [17]` |
| R11 \texttt removed | code.tex line 4 | code.tex line 17 | `` (?P<command>\\(?:texttt\| `` replaced by `` (?P<command>\\(?: `` | `FAIL: code.tex dash-aside: flagged lines [4 17], expected [17]` |
| R11 \url removed | code.tex line 5 | code.tex line 17 | `` texttt\|url\|href\| `` replaced by `` texttt\|href\| `` | `FAIL: code.tex dash-aside: flagged lines [5 17], expected [17]` |
| R11 \href removed | code.tex line 6 | code.tex line 17 | `` url\|href\|label\| `` replaced by `` url\|label\| `` | `FAIL: code.tex dash-aside: flagged lines [6 17], expected [17]` |
| R11 \label removed | code.tex line 7 | code.tex line 17 | `` href\|label\|ref\| `` replaced by `` href\|ref\| `` | `FAIL: code.tex dash-aside: flagged lines [7 17], expected [17]` |
| R11 \ref removed | code.tex line 8 | code.tex line 17 | `` label\|ref\|eqref\| `` replaced by `` label\|eqref\| `` | `FAIL: code.tex dash-aside: flagged lines [8 17], expected [17]` |
| R11 \eqref removed | code.tex line 9 | code.tex line 17 | `` ref\|eqref\|pageref\| `` replaced by `` ref\|pageref\| `` | `FAIL: code.tex dash-aside: flagged lines [9 17], expected [17]` |
| R11 \pageref removed | code.tex line 14 | code.tex line 17 | `` eqref\|pageref\|cref\| `` replaced by `` eqref\|cref\| `` | `FAIL: code.tex dash-aside: flagged lines [14 17], expected [17]` |
| R11 \cref removed | code.tex line 10 | code.tex line 17 | `` pageref\|cref\|Cref\| `` replaced by `` pageref\|Cref\| `` | `FAIL: code.tex dash-aside: flagged lines [10 17], expected [17]` |
| R11 \Cref removed | code.tex line 14 | code.tex line 17 | `` cref\|Cref\|autoref\| `` replaced by `` cref\|autoref\| `` | `FAIL: code.tex dash-aside: flagged lines [14 17], expected [17]` |
| R11 \autoref removed | code.tex line 11 | code.tex line 17 | `` Cref\|autoref\|cite `` replaced by `` Cref\|cite `` | `FAIL: code.tex dash-aside: flagged lines [11 17], expected [17]` |
| R11 \cite variants removed | code.tex line 12, \citep and \citet | code.tex line 17 | `` \|cite[a-zA-Z]*\| `` replaced by `` \|cite\| `` | `FAIL: code.tex dash-aside: flagged lines [12 12 17], expected [17]` |
| R11 \cite removed | code.tex line 12, \cite | code.tex line 17 | `` \|cite[a-zA-Z]*\| `` replaced by `` \|cite[a-zA-Z]+\| `` | `FAIL: code.tex dash-aside: flagged lines [12 17], expected [17]` |
| R11 \parencite removed | code.tex line 13 | code.tex line 17 | `` \|parencite" `` replaced by `` " `` | `FAIL: code.tex dash-aside: flagged lines [13 17], expected [17]` |
| R11 \textcite removed | code.tex line 13 | code.tex line 17 | `` r"\|textcite)\*? `` replaced by `` r")\*? `` | `FAIL: code.tex dash-aside: flagged lines [13 17], expected [17]` |
| R11 one-line data row left out of semicolons | semirow.md line 1, Keywords: a; b; c; d: not counted | semirow.md line 3, a one-line sentence, counted | `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont") and not p.data_row] `` replaced by `` running = [p for p in doc.pieces if p.kind in ("text", "item", "cont")] `` | `FAIL: sample.md semicolons: no line [sample.md:21: semicolons: "The script reads the page in one pass; it never writes to th": 1 semicolon in 194 words of running prose, more than 2 per 1000 words] in [sample.md:1: section-words: "Methods": 230 words, over the limit of 100` |
| R11 a data row is a paragraph of one line | semirow.md lines 5-6, two lines with no sentence end: counted | semirow.md line 1, not counted | `` len({p.line for p in rest}) == 1 `` replaced by `` True `` | `FAIL: semirow.md semicolons: flagged lines [3 8], expected [3 5 6 8]` |
| R11 a data row ends without a sentence end | sample.md line 21 and semirow.md line 3, one-line sentences, counted | semirow.md line 1, not counted | `` and not ENDS_SENTENCE.search("\n".join(p.text for p in rest))): `` replaced by `` and True): `` | `FAIL: sample.md semicolons: flagged lines [], expected [21]` |
| R11 a closing bracket may follow the sentence end | semirow.md line 8, (one; two.): counted | semirow.md line 1 | `` ENDS_SENTENCE = re.compile(r"[.!?][\"')\]]*\s*$") `` replaced by `` ENDS_SENTENCE = re.compile(r"[.!?]\s*$") `` | `FAIL: semirow.md semicolons: flagged lines [3 5 6], expected [3 5 6 8]` |
| R11 a LaTeX line of one command is a data row | semirow.tex line 1, \keyoutput{a; b}{c; d.}: not counted | semirow.tex line 5, counted | `` if len(added) == 1 and len(self.pieces) - first == 1 and state["command"]:\n            added[0].data_row = True `` replaced by (nothing) | `FAIL: semirow.tex semicolons: flagged lines [1 5 7 10 13 14 17 21], expected [5 17 21]` |
| display math continues a paragraph or item | eqmath.tex, a sentence around \[ x \]: five 5-word sentences, flagged; mathitem.tex line 4, not the value \[ x \] but the name in an item: counted | colon.tex lines 24-26, math after a list | `` elif kind == "math" and previous in ("text", "item", "cont"):\n                blocks[-1].pieces.append(piece)\n                continue `` replaced by (nothing) | `FAIL: eqmath.tex: exit 0, expected 1 []` |
| display math after a list is no paragraph | colon.tex lines 24-26, an equation between a list and the next colon paragraph: not flagged | colon.tex line 20, flagged | `` processed = TEX_MATH.sub(lambda m: blank_out(m, "math"), processed) `` replaced by `` processed = TEX_MATH.sub(lambda m: blank_out(m, None), processed) `` | `FAIL: colon.tex colon-lists: flagged lines [6 19 26], expected [6 19]` |
| [...] after any \begin left out | tabsec.tex line 2, \begin{itemize}[noitemsep]: T holds 3 words | tabsec.tex line 3, \item a | `` (line[position] == "[" or line[position] == "{" and env in TEX_TABLES) `` replaced by `` (line[position] in "[{" and env in TEX_TABLES) `` | `FAIL: tabsec.tex: exit 1, expected 0 []` |
| {...} after a table's \begin left out | tabsec.tex line 5, \begin{tabularx}{\textwidth}{lX}: T holds 3 words | tabsec.tex lines 6, 7 | `` (line[position] == "[" or line[position] == "{" and env in TEX_TABLES) `` replaced by `` (line[position] == "[") `` | `FAIL: tabsec.tex: exit 1, expected 0 []` |
| preamble commands carry no words | preamble.tex line 2, \documentclass[a4paper]{article}, no words in P | preamble.tex line 14, One two, counted: P=2 holds | `` \|usepackage\|documentclass" `` replaced by `` \|usepackage" `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: usepackage | preamble.tex line 3 | preamble.tex line 14 | `` \|bibliographystyle\|usepackage\| `` replaced by `` \|bibliographystyle\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: input | preamble.tex line 7 | preamble.tex line 14 | `` (?:input\|include\| `` replaced by `` (?:include\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: include | preamble.tex line 8 | preamble.tex line 14 | `` (?:input\|include\|includegraphics\| `` replaced by `` (?:input\|includegraphics\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: includegraphics | preamble.tex line 9 | preamble.tex line 14 | `` \|include\|includegraphics\| `` replaced by `` \|include\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: bibliography | preamble.tex line 13 | preamble.tex line 14 | `` \|includegraphics\|bibliography\| `` replaced by `` \|includegraphics\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: bibliographystyle | preamble.tex line 12 | preamble.tex line 14 | `` \|bibliography\|bibliographystyle\| `` replaced by `` \|bibliography\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: vspace | preamble.tex line 10 | preamble.tex line 14 | `` r"\|vspace\|hspace\| `` replaced by `` r"\|hspace\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: hspace | preamble.tex line 11, \hspace*{2em} | preamble.tex line 14 | `` \|vspace\|hspace\| `` replaced by `` \|vspace\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: newcommand | preamble.tex line 4, \newcommand{\foo}[1]{text #1 here} | preamble.tex line 14 | `` \|hspace\|newcommand\| `` replaced by `` \|hspace\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: renewcommand | preamble.tex line 5, a nested brace argument | preamble.tex line 14 | `` \|newcommand\|renewcommand\| `` replaced by `` \|newcommand\| `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: setlength | preamble.tex line 6 | preamble.tex line 14 | `` \|renewcommand\|setlength) `` replaced by `` \|renewcommand) `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: whole command name | preamble.tex line 9, \includegraphics not read as \include | preamble.tex line 8 | `` \|setlength)(?![A-Za-z@])\*? `` replaced by `` \|setlength)\*? `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| preamble: [...] and {...} in any order, one level nested | preamble.tex lines 4, 5, [1] after {...} and a nested {...} | preamble.tex line 2 | `` (?:\s*(?:\[[^\]]*\]\|\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}))*"), " "), `` replaced by `` (?:\[[^\]]*\])*(?:\{[^{}]*\})*"), " "), `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| plain: \\ is a space | preamble.tex line 14, One\\[2pt] two.: 2 words | tabsec.tex line 6, inside a table | `` (re.compile(r"\\\\(?:\[[^\]]*\])?"), " "), `` replaced by `` (re.compile(r"(?!x)x"), " "), `` | `FAIL: preamble.tex: exit 1, expected 0 []` |
| plain: accents | tabsec.tex line 3, Jos\'e M\"{u}ller read as 2 words, T=4 holds | tabsec.tex lines 6, 7 | `` (re.compile(r"\\['`^\"~=.]\{?([A-Za-z])\}?"), r"\1"), `` replaced by `` (re.compile(r"(?!x)(x)"), r"\1"), `` | `FAIL: tabsec.tex: exit 1, expected 0 []` |
| plain: accent in braces | tabsec.tex line 3, M\"{u}ller read as one word, T=4 holds | tabsec.tex lines 6, 7 | `` (re.compile(r"\\['`^\"~=.]\{?([A-Za-z])\}?"), r"\1"), `` replaced by `` (re.compile(r"\\['`^\"~=.]([A-Za-z])"), r"\1"), `` | `FAIL: tabsec.tex: exit 1, expected 0 []` |
| plain: escaped characters | semirow.tex line 5, 5\% quoted as 5% | semirow.tex line 17 | `` (re.compile(r"\\([%&$#_{}])"), r"\1"), `` replaced by `` (re.compile(r"(?!x)(x)"), r"\1"), `` | `FAIL: semirow.tex semicolons: no line [semirow.tex:5: semicolons: "The check reads 5% of one page; it writes none.": 3 semicolons in 26 words of running prose, more than 2 per 1000 words] in [semirow.tex:5: semicolons: "The check reads 5\% of one page; it writes none.": 3 semicolons in 26 words of running prose, more than 2 per 1000 words` |
| plain: spacing commands | latexspace.tex line 3 (5\;cm) and lines 5-8, each spacing command read as a space | semirow.tex line 5 | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"(?!x)x"), " "), `` | `FAIL: latexspace.tex semicolons: flagged lines [3], expected []` |
| plain: other commands | sections.tex line 14, \emph removed from the title | sections.tex line 5 | `` (re.compile(r"\\[A-Za-z@]+\*?"), " "), `` replaced by `` (re.compile(r"(?!x)x"), " "), `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11 16 18], expected [1 5 7 11 14 16 18]` |
| plain: braces | sections.tex line 14, braces removed from the title | sections.tex line 5 | `` (re.compile(r"[{}]"), ""), `` replaced by `` (re.compile(r"(?!x)x"), ""), `` | `FAIL: sections.tex section-words: flagged lines [1 1 5 7 11 16 18], expected [1 5 7 11 14 16 18]` |
| plain: tilde | latexspace.tex line 9, not a~style guide, it: counted | latexspace.tex line 5 | `` (re.compile(r"~"), " "), `` replaced by `` (re.compile(r"(?!x)x"), " "), `` | `FAIL: latexspace.tex contrast: flagged lines [5 6 7 8], expected [5 6 7 8 9]` |
| plain: ~ after . is nothing | latexspace.tex line 1, See Fig.~3 for the file.: one sentence, the run of five flagged | latexspace.tex line 9, a~style: a space | `` (re.compile(r"(?<=\.)(?:~\|\\ )"), ""), `` replaced by `` (re.compile(r"(?<=\.)(?:\\ )"), ""), `` | `FAIL: latexspace.tex equal-length: flagged lines [], expected [1]` |
| plain: control space after . is nothing | latexspace.tex line 1, Dr.\ Smith reads the file.: one sentence, flagged | latexspace.tex line 8, 8\ cm: a space | `` (re.compile(r"(?<=\.)(?:~\|\\ )"), ""), `` replaced by `` (re.compile(r"(?<=\.)(?:~)"), ""), `` | `FAIL: latexspace.tex equal-length: flagged lines [], expected [1]` |
| plain: \, is a space | latexspace.tex line 5, not 5\,cm, it: counted | latexspace.tex lines 6-9 | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"\\[;:! ]"), " "), `` | `FAIL: latexspace.tex contrast: flagged lines [6 7 8 9], expected [5 6 7 8 9]` |
| plain: \; is a space | latexspace.tex line 3, 5\;cm: no semicolon counted | semirow.tex line 5, counted | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"\\[,:! ]"), " "), `` | `FAIL: latexspace.tex semicolons: flagged lines [3], expected []` |
| plain: \: is a space | latexspace.tex line 6, not 6\:cm, it: counted | latexspace.tex line 5 | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"\\[,;! ]"), " "), `` | `FAIL: latexspace.tex contrast: flagged lines [5 7 8 9], expected [5 6 7 8 9]` |
| plain: \! is a space | latexspace.tex line 7, not 7\!cm, it: counted | latexspace.tex line 5 | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"\\[,;: ]"), " "), `` | `FAIL: latexspace.tex contrast: flagged lines [5 6 8 9], expected [5 6 7 8 9]` |
| plain: control space is a space | latexspace.tex line 8, not 8\ cm, it: counted | latexspace.tex line 5 | `` (re.compile(r"\\[,;:! ]"), " "), `` replaced by `` (re.compile(r"\\[,;:!]"), " "), `` | `FAIL: latexspace.tex contrast: flagged lines [5 6 7 9], expected [5 6 7 8 9]` |
| R11 argument lines after a command are its data row | semirow.tex lines 12-14, \keyoutput{1}{No} and two argument lines: not counted | semirow.tex line 17, text after \formfield{Title}, counted | `` state["command"] = one_command(line) or state["command"] and only_arguments(line.strip()) `` replaced by `` state["command"] = one_command(line) `` | `FAIL: semirow.tex semicolons: flagged lines [5 13 14 17 21], expected [5 17 21]` |
| R11 a blank line ends the command | semirow.tex line 21, an argument-only line after a blank line: counted | semirow.tex lines 13-14, not counted | `` self.add(i, "blank")\n                state["command"] = False `` replaced by `` self.add(i, "blank") `` | `FAIL: semirow.tex semicolons: flagged lines [5 17], expected [5 17 21]` |
| R11 paragraph lines counted without data rows | semirow.tex line 10, alpha; beta; gamma after \formfield{Key words}: not counted | semirow.tex line 17, a sentence, counted | `` rest = [p for p in block.pieces if not p.data_row] `` replaced by `` rest = list(block.pieces) `` | `FAIL: semirow.tex semicolons: flagged lines [5 10 17 21], expected [5 17 21]` |
| R11 a command line holds only arguments after the command | sample.tex line 14 and semirow.tex line 17, text on the line after a command line, counted | semirow.tex line 10, not counted | `` if text[position] not in "{[":\n            return False `` replaced by `` if False:\n            return False `` | `FAIL: sample.tex semicolons: flagged lines [], expected [14]` |

Everything in the brief is done

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

- Sentences run on across paragraphs and across the lines left out (headings, list items, tables, code) for `equal-length`; a sentence ends at `.`, `!` or `?` before a space or at the end of its paragraph. Pinned by equal.md lines 37 and 45.
- `section-words` counts the words of the section's prose lines (paragraphs, list items, table rows) without the heading line and without code, comments or math. A word is a run of letters and digits joined across `'` and `-`.
- A `--limit` whose heading appears twice in a file checks each section; two `--limit`s for one heading each apply (sections.md lines 17 and 19).
- LaTeX: `tabular` (starred), `tabularx` and `longtable` rows are table rows, and `\item` entries of itemize, enumerate and description are list items, so the general rules (tables left out of semicolons, list items left out of equal-length) reach LaTeX. Command names and the arguments of `\label`, `\ref`, `\cite`, `\usepackage`, `\documentclass` and similar carry no words. A LaTeX line of comments or commands only is neutral between paragraphs; a line emptied by removed math or code content breaks them.
- A Markdown list item runs on over the lines after it with no blank line, or indented after one; consecutive list items, and consecutive LaTeX list environments, form one list for `colon-lists`.
- Markdown fences follow CommonMark: indent up to 3 spaces, a closing fence of the same character at least as long, a backtick fence whose info string holds no backtick, and a fence left open runs to the end of the file. Frontmatter is a first line `---` closed by `---` or `...`; left open, it is no frontmatter.
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

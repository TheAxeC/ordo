# Step 2 refuter report (on .agents/worktrees/3-2, base 55e4eec)

Reviewer: a fresh claude:opus agent, read-only. Usage: 209,060 tokens, 44 tool uses, 891 s.

## Verification (rerun by the reviewer)

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
$ sh skills/writing/templates/check_prose.test.sh 2>&1 | tail -1
PASS: check_prose.py scratch tests
$ git diff 55e4eec --stat ; git status --short
 docs/dev/building.md        | 1 +
 docs/dev/change-standard.md | 1 +
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/3-the-writing-base/agents/reviews/2-report.md
?? skills/writing/templates/
```

Cases, run on the files the test builds (a copy of the test with its cleanup trap removed, in the reviewer's scratchpad):
- Case 1: `check_prose.py --limit 'Methods=100' sample.md` printed the 14 lines the report quotes (lines 1, 6, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 36), exit 1; `--limit 'Abstract=10' sample.tex` printed the 14 lines the report quotes (3, 6, 8 to 18, 25), exit 1.
- Case 2: clean.md with `--limit ' limits =12'` and clean.tex with `--limit 'abstract=12'`: no output, exit 0 each.
- Case 3: no file, `--limit Abstract`, `--limit Abstract=0`, `missing.md`, `latin1.md`: exit 64 each, stdout 0 bytes, stderr `no file given`, `--limit 'Abstract' is not <heading text>=<positive integer>`, `--limit 'Abstract=0' is not ...`, `cannot read missing.md: No such file or directory`, `latin1.md is not UTF-8`.
- Case 4: `PASS: check_prose.py scratch tests`, exit 0. The unchanged-tree red reproduced by running the test with no script beside it: `FAIL: sample.md: exit 2, expected 1 [... can't open file '.../check_prose.py': [Errno 2] No such file or directory]`.
- Case 5, each `check_<name>` given `return []` as its first line in a scratch copy: `FAIL: sample.md non-ascii: flagged lines [], expected [6] (exit 1)`, and the same for dash-aside [9], history [11], section-words [1], semicolons [21], throat-clearing [13], filler [15], vague [17], flagged [19], equal-length [29], contrast [23 25 27], colon-lists [36], each exit 1.
- Case 6: `python3 skills/writing/templates/check_prose.py skills/writing/references/prose-standard.md`: exit 1, 68 lines, identical to the report's block; `grep -o ';' ... | wc -l` prints 15.

Report claims rerun: `grep -n '^import'` prints `84:import re`, `85:import sys`, `86:import unicodedata`; `grep -n PyYAML README.md` prints line 47 on the worktree and on `55e4eec`; the separator-row count prints 42, in 16 files; the double-blank-line counts print 5, 4, 16, 11 for check_config.py, sync_rules.py, check_coverage.py, usage.py; `LC_ALL=C grep -n '[^ -~]'` over the four changed files prints nothing.

Sample of the report's "100 further reverts", 16 rerun, each gave the report's red line: table separator row, comment markers, number range, gather, combining mark after a mark, semicolons boundary, equal-length band of 2, contrast counts once per sentence, history date, colon-lists nothing else between, section words leave out the heading line, phrase across a line break, unmatched limit flagged at line 1, filler whole-word hyphen, LaTeX list items, starred verbatim.

Probes on real files:
- `README.md`: no output, exit 0.
- `docs/dev/skill-layout.md`: semicolons at 17 and 48 (2 in 406 words), history at 71 (`added in`, in a table row): given by the rules.
- research-hub `veni2026.tex`: dash-aside at 34, 200, 201, 202; 18 semicolon lines (25 in 2591 words); history 133 (`previously`); flagged 145 (`Robust`, in a bibliographic title); vague 174 (`many`). Each given by the brief and ruling 3. Semicolons at 75, 83, 91, 99, 107, 115, 123, 147 (`\keyoutput` lines) and 159 (the keywords line) are one-line data rows, which prose standard section B leaves out of running prose; the brief's LaTeX rule does not.
- research-hub `concept-note.tex`: filler 71 (`simply`), 85 (`very`); vague 81 (`typically`), 85 and 98 (`many`). No contrast flag: see Spec 1.
- All tracked Markdown outside `.scratch` in one run: 300 lines, no traceback, exit 1.

## 1. Spec

1. Brief `agents/briefs/2.md`, "Decisions" 4, concept-note bullet claims 3 contrasts at lines 79, 85 and 87. The script finds 2 (79 and 87) and flags none: line 85 holds five words between "not" and the comma, outside the brief's "not <1 to 4 words>, <word>". The same window misses line 59 (`It is not a procedure you can repeat ...`) and line 93 (`It is not an offer to do machine learning for your group, ...`). The brief's evidence contradicts its rule; the report does not mention it (change standard rule 7).
2. Brief "What to build" 4 lists "code with an em dash in a fence" among the clean file's near misses, which the brief's own `non-ascii` rule (reads code) makes impossible. The builder put it in the forms file (test lines 372 and 376). The report does not record the impossibility or where the case went (rule 7).
3. `check_prose.py` lines 63-66 and 515-519: equal-length sentences run on across paragraphs and sections. The brief does not settle whether sentences in different paragraphs or sections are consecutive. Probes `eq.md` (two sentences, `# Results`, a code block, three sentences) and `eq.tex` (two sentences, `\section{B}`, three sentences) each print `equal-length: ... 5 consecutive sentences of 5, 5, 5, 5, 5 words`. The builder settled it as a judgment call; the orchestrator rules.

## 2. Proof

Each revert below, one string replacement in a scratch copy, left the test at `PASS: check_prose.py scratch tests`, exit 0 (change standard rule 13).

1. `check_prose.py:32-33`, "A sentence ends at ".", "!" or "?"": `SENTENCE_END` reduced to `[.]+`: green. No input holds `!` or `?`.
2. `check_prose.py:32`, "A word is a run of letters and digits, joined across "'" and "-"": line 121 reduced to `(?:[-][^\W_]+)*`, or to `(?:['][^\W_]+)*`: green.
3. `check_prose.py:26-27`, "The rows of tabular (starred too), tabularx and longtable are table rows": line 148 reduced to `tabular`, or the star removed: green; no test input holds `tabularx`, `longtable` or `tabular*`.
4. Branches with no case, each removed or narrowed and green: line 255, the closing fence's character check; line 142, the escaped-dollar lookbehind; line 222, the CR strip; line 240, `.rstrip()` on the frontmatter opener; line 166, `(?!but\b)` in `CONTRAST_BUT`; line 628, the tie order cut to `(f[0], f[1])`; line 179, the whitespace collapse narrowed to `[\n]+`; line 331, the `\end{abstract}` line kind changed to `"skip"`.

## 3. Standards

1. `skills/writing/templates/check_prose.py`: 26 double blank lines. `docs/dev/change-standard.md` rule 10: "No history in code or comments. ... ASCII only, no em dashes, no double blank lines." The report reads the rule as covering prose and comments only and follows PEP 8, citing the tree's other scripts (5, 4, 16 and 11 double blank lines). The reading of the rules file is the orchestrator's (rule 4).

## 4. Behaviour

1. LaTeX text sharing a line with a heading, `\begin{abstract}`, `\end{abstract}`, or a list or table begin or end line is left out of every word check and of section-words (`check_prose.py:318-346`). Probes: `\section{Intro} It is simply read here.` gives no filler flag and Intro counts 2 words; `Its last sentence is simply here.\end{abstract}` is not counted and not flagged; `It is simply a list: \begin{itemize}`, `\begin{enumerate}\item It is simply the first.` and `\end{enumerate} It was changed simply.` give nothing.
2. A begin and end of `tabular` or of a list on one line leaves the depth raised to the end of the file (`elif` chain at lines 335-346). Probe p2.tex, `\begin{tabular}{c} a \end{tabular}`, then four semicolons and five 5-word sentences: nothing, exit 0; the same over three lines flags both. `\begin{itemize}\item one\end{itemize}` silences equal-length the same way.
3. `\section[Short]{Methods}` is not a heading (`TEX_HEADING`, line 145): `--limit 'Methods=1'` prints `no heading matches this limit`.
4. A fenced code block indented under a list item is read as prose (`FENCE_OPEN`, line 124, at most 3 spaces). On the tree: `skills/repo-setup/SKILL.md:59: dash-aside: "-q --no-index"`, printed twice. Probe p7.md flags `a -- b` and `simply` inside the code.
5. Table cells are joined into one sentence (line 278, `text.replace("|", " ")`). On the tree: `skills/spec/SKILL.md:213: contrast: "not guess The open item, booked"`, across two cells.
6. A list marker inside a blockquote is flagged: `> - a quoted list item` prints `dash-aside: "> - a"` (the lookbehind at lines 130-131).

Given by the brief's rules, possibly not intended by the prose standard (for the orchestrator):
- a `| - |` placeholder cell is flagged;
- LaTeX `\verb|a -- b|`, `\texttt{x -- y}`, `\url{...}` and `\label{sec:a---b}` are flagged, since the brief removes only Markdown code spans;
- one-line data rows in LaTeX are counted for semicolons;
- `roadmap.md:92` `not done), a` counts as a contrast, a token running through a closing parenthesis.

## Not checked

- The report's other 84 revert rows (16 rerun, named above).
- The first-run results on the unchanged tree for cases 1, 2, 3, 5 and 6; only case 4's red was reproduced.
- The test under a `sh` other than macOS `/bin/sh`.
- The `locked.md` case when run as root.
- A broken pipe on output.
- Run time on large files.

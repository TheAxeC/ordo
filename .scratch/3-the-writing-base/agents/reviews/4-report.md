Everything in the brief is done.

## Open items of the state file

- None.

## The cases' first run, on the unchanged tree

The cases are the script `cases.sh` in the session's scratchpad, run from the worktree root with `sh cases.sh base` before any file changed. No case was one the brief's rules get wrong, so there was no hand-back.

| Case | Result on the unchanged tree |
|---|---|
| 1. `python3 utils/check_coverage.py --built writing docs/academic-coverage.md <hub skills> academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok:`, exit 0 | Red, exit 1, the three lines the brief names: `docs/academic-coverage.md:82`, `:106`, `:107`, each "... (rebuild: writing) names no file of skills/writing/ in backticks" |
| 2. The same with `--built writing` on a scratch copy whose line 107 names only `skills/writing/references/none.md` exits 1 | Exit 1; line 107 printed as "names no file of skills/writing/ that exists: skills/writing/references/none.md", lines 82 and 106 printed as naming no file |
| 3. `python3 -B skills/writing/templates/check_prose.py skills/writing/SKILL.md` prints only allowed flags | Red, exit 64: `check_prose.py: cannot read skills/writing/SKILL.md: No such file or directory` |
| 4. `python3 -B skills/writing/templates/check_prose.py README.md docs/academic-coverage.md` gives no flag on an added or changed line | Base output saved: exit 1, 0 lines for `README.md`, 21 lines for `docs/academic-coverage.md` (lines 12, 16, 22, 30, 64, 96, 102, 124, 125, 163, 168 twice, 175, 190, 197, 198, 227, 229 twice, 235, 239); none on lines 7-43 of `README.md` or on lines 82, 106, 107 of the coverage list |
| 5. `head -6 skills/writing/SKILL.md` and `grep -n '^## ' skills/writing/SKILL.md` | Red: `head: skills/writing/SKILL.md: No such file or directory` (exit 1), and grep exit 2 |

The scratch copy of case 2: `utils/check_coverage.py` resolves `skills/<skill>/` from the git top folder of the coverage list (`repository()`, lines 192-199), and reads that repository's `docs/roadmap.md`. The copy therefore sits in a scratch git repository made with `git init` in the scratchpad, holding copies of `docs/academic-coverage.md`, `docs/roadmap.md` and `skills/writing/`. A Python edit replaces every backticked `skills/writing/...` path of line 107 with "the file" and appends "It is held at `skills/writing/references/none.md`."; `none.md does not exist` is printed by a `test -e` before the run.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. `skills/writing/SKILL.md` in the layout | DONE | `head -6 skills/writing/SKILL.md; grep -n '^## ' skills/writing/SKILL.md` | See "Verify 4" below |
| 2. Coverage lines 82, 106, 107 name the `skills/writing/` files | DONE | case 1 | `ok: docs/academic-coverage.md`, exit 0 |
| 3. README row, the `/writing` line and line 7 | DONE | `git diff -U0 README.md` | Line 7 changed, line 23 added, lines 45-46 added (a blank line and the `/writing` paragraph, ruling 3 of repair round 1) |
| Verify 1. The plan's verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md` | See below, exit 0 |
| Verify 2. Coverage `ok:` and the scratch-copy control | DONE | cases 1 and 2 | See below |
| Verify 3. `check_prose.py` before and after | DONE | cases 3 and 4 | See below |
| Verify 4. Frontmatter and section order | DONE | case 5 | See below |
| Verify 5. ASCII and status | DONE | `LC_ALL=C grep -n '[^ -~]' skills/writing/SKILL.md README.md docs/academic-coverage.md; git status --short --untracked-files=all` | See below |

Verify 1, the lines `verify.sh` printed, exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
```

Verify 2, case 1 after the change:

```text
ok: docs/academic-coverage.md
exit 0
```

Case 2 after the change, the control (line 107 of the copy names only `skills/writing/references/none.md`):

```text
none.md does not exist
<scratchpad>/ctl/docs/academic-coverage.md:107: the reason of 'references/writing_quality_check.md' (rebuild: writing) names no file of skills/writing/ that exists: skills/writing/references/none.md
exit 1
```

Only line 107 fails in the copy, so the control is red for the missing file alone.

Verify 3, case 3 after the change:

```text
skills/writing/SKILL.md:12: filler: "Quick": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:43: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:43: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:45: filler: "Quick": a filler word, to be checked against section A of the prose standard
exit 1
```

Each flag and its reason:

| Flag | Reason it is allowed |
|---|---|
| Line 12, "Quick" | The required heading `## Quick start` of `docs/dev/skill-layout.md`, section row 2 |
| Line 43, "just", twice | Quoted examples: the line names section A's exemptions for a temporal "just" and a "just" that states a genuine minimum, each in double quotes |
| Line 45, "Quick" | A quoted example: the heading "Quick start" named in double quotes as the example of a required heading, as the brief's Steps item 2 gives it |

Case 4 after the change: `python3 -B skills/writing/templates/check_prose.py README.md docs/academic-coverage.md` exits 1 with output identical to the base's (`diff prose-base.txt prose-after.txt` printed nothing, exit 0). The README still gives 0 flags (`check_prose.py README.md` exit 0), and no flag of the coverage list falls on lines 82, 106 or 107. The line numbers of the coverage list did not move, since the change adds text inside three rows.

Verify 4, case 5 after the change:

```text
---
name: writing
description: "Check a text file against the prose standard and the writing reference pages, and list each problem with its line and the rule it breaks, changing nothing. Triggers on: writing, check the prose, check this draft, prose check, style check, check the writing."
metadata:
  version: "1.0.0"
---
12:## Quick start
19:## Use instead
26:## What it reads
37:## Steps
60:## The problem list
85:## Stops
93:## Anti-patterns
102:## Rules
```

The order is the layout's, with the one reference section, "The problem list", between Steps and Stops.

Verify 5: `LC_ALL=C grep -n '[^ -~]'` over `skills/writing/SKILL.md`, `README.md`, `docs/academic-coverage.md`, `skills/writing/references/prose-standard.md`, `skills/writing/references/anti-patterns.md` and this report printed nothing, exit 1. `git status --short --untracked-files=all`:

```text
 M README.md
 M docs/academic-coverage.md
 M skills/writing/references/anti-patterns.md
 M skills/writing/references/prose-standard.md
?? .scratch/3-the-writing-base/agents/reviews/4-report.md
?? skills/writing/SKILL.md
```

These are the paths of "Paths this step writes" with the two pages repair round 1 adds. `git diff -U0` gives hunks at `docs/academic-coverage.md` lines 82 and 106-107, `README.md` lines 7, 23 and 45-46 (inside 7-48 of the base, as the round widens it), `anti-patterns.md` lines 34 and 43-45, and `prose-standard.md` line 21.

## Files changed

| File | Lines |
|---|---|
| `skills/writing/SKILL.md` | new, 105 lines (`wc -l`) |
| `docs/academic-coverage.md` | 3 changed (`git diff --numstat`: 3 3) |
| `README.md` | 3 added, 1 changed (`git diff --numstat`: 4 1) |
| `skills/writing/references/anti-patterns.md` | 3 added, 1 changed (`git diff --numstat`: 4 1) |
| `skills/writing/references/prose-standard.md` | 1 added (`git diff --numstat`: 1 0) |
| `.scratch/3-the-writing-base/agents/reviews/4-report.md` | this report |

## Carrying the change

`grep -rn "writing" skills utils docs README.md`, less the coverage list, `skills/writing/` and the words "writing_", "rewriting", "writing base", "writing skills" and "in writing", lists `skills/repo-setup/SKILL.md` lines 32, 111 and 148, `utils/check_coverage.*`, `docs/roadmap.md` line 23, `docs/dev/skill-layout.md` line 3, `docs/dev/change-standard.md` line 52, `docs/dev/building.md` line 12 and `README.md` lines 7, 23, 46 and 73. None of them is made false: the repo-setup lines name `references/prose-standard.md` of the `writing` skill, which they copy whole, and README line 73 already installs `writing`. A grep for skill counts (`ten skills`, `10 skills`, `every skill`) finds only `docs/roadmap.md` line 135, a record of entry 1's closing, and `docs/dev/skill-layout.md` line 3, "Every `skills/<name>/SKILL.md` follows this layout", which the new file holds (case 5).

Statements about the changed files as a whole, reread after the change:

- `docs/academic-coverage.md` line 14: "Once the skill is built, the reason also names in backticks the new skill's file that now holds the listed file's content." Lines 82, 106 and 107 now each name such a file (case 1).
- `README.md` line 7, the paragraph naming the skills around the loop, now also names `writing`.
- `README.md` line 25, "The order of use, shortened from what `/plan-help` prints:", holds again: the code block below it has no `/writing` line (`sed -n 27,42p README.md | grep -c writing` prints 0), and line 46 says `/writing <file>` is outside that sequence.
- The reference pages name the skill: `references/anti-patterns.md` line 3 ("consults the page when it weighs a report"), `references/academic-prose.md` line 3 ("read a manuscript's prose against this page"), `references/judgment.md` line 3 ("use these judgments when they read a draft"). The first two match Steps 2 and 3. For the third, see judgment call 8.

## Judgment calls the brief left open

1. **Use instead rows.** The layout's Use instead table holds "the situations where a neighbouring skill is the right one"; no rewriting skill exists, so the rewriting row is left out, as the brief says. The rows are a built plan step reviewed against its brief (`/refute <entry> <step>`) and the rules the reviews keep finding broken (`/plan-retro`).
2. **A flag of any other check.** Steps 2 also says how a flag of the checks it names no rule for (`dash-aside`, `semicolons`, `contrast`, `non-ascii`, `throat-clearing`, `colon-lists`) is judged: allowed only where the page that holds its rule exempts the instance, with the dash inside a quotation of `academic-prose.md` line 121 as the example. It serves the brief's "judge each flag against the rule it names". The `history` and `section-words` flags have their own bullets by ruling 2 of repair round 1.
3. **An empty list.** "The problem list" gives the line `<file>: no problem found` for a file with no problem and no allowed flag, so a clean file reads differently from a run that listed nothing.
4. **Stops.** A first row "No stop", in the form `skills/plan-help/SKILL.md` uses, says the skill never waits on the user and the other rows are refusals. The unusable-file refusal includes "no file is named", the script's `no file given`, exit 64.
5. **A fourth anti-pattern.** "Taking the script's exit 0 as a clean text", pointing at Steps 3, beside the three the brief requires.
6. **Rules.** Two bullets: the skill writes nothing, and every listed problem names its rule. The "every flag appears in the list" rule is stated once, in Steps 4 and its anti-pattern row, and is left out of Rules so it is written once.
7. **README line 7.** `writing` is added as a new sentence of 13 words: "`writing` checks a text file's prose and lists each problem with its line." The sentence before it has 17 words, so the same text added to it as a clause would have taken it over 20. Both counts are `printf '%s\n' '<sentence>' | wc -w`, which printed 13 and 17.
8. **`judgment.md` line 3 and decision 2.** The page says the skill uses its judgments "when they read a draft", and the skill reads it for an academic text only (brief decision 2). The page's judgments are stated per discipline and per paper section (lines 28-51), so the draft it names is an academic one, and the two statements are read as consistent. `judgment.md` is outside this step's paths.
9. **Coverage sentences.** Line 107's added text is two sentences, one per file, so each stays within the 35-word limit that prose standard, section E, gives a coverage reason. Line 107 says the script finds "the filler and flagged terms, dash asides, semicolons, throat-clearing openers, one-sentence binary contrasts and runs of equal-length sentences", the checks `filler`, `flagged`, `dash-aside`, `semicolons`, `throat-clearing`, `contrast` and `equal-length` of the script's docstring.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| `/writing <file>` | No `SKILL.md` in `skills/writing/`, so no `/writing` command | `/writing <file>` runs `templates/check_prose.py`, judges each flag, reads the text against the reference pages and lists each problem as `<file>:<line>: <source>: "<text>": <rule and fix>`, changing no file. A `history` flag is a problem in a text section 0 covers and allowed, with the reason, in a text or section whose subject is past events. A `section-words` flag is always a problem and cites its `--limit` |
| `prose-standard.md` section 0 | Eight hard rules, none on history | Nine: the added bullet "**No history in a rule or a comment.**" (line 21) says a rule, a spec, a skill, a rules page and a code comment state what holds and at most one clause of why, with the history in a log, and that a text whose subject is past events is outside the rule |
| `anti-patterns.md` "Patterns the script finds" | Seven entries, naming nine of the script's twelve checks; the introduction says each entry names a section of the prose standard | Ten entries, naming all twelve checks once; the introduction says each entry names where the rule is, a section of the prose standard or the user's `--limit` |
| `README.md` "The skills" | Ten rows, ending with `plan-retro` | Eleven rows, `writing` after `plan-retro` |
| `README.md` after the order of use | The code block, then "`/plan-help` prints the full sequence, including what to do when a command stops." | The same, then the paragraph "`/writing <file>` is not part of that sequence. It checks a file's prose at any time and lists each problem with its line." The code block is unchanged |
| `README.md` line 7 | Names `repo-setup`, `ordo-init`, `roadmap`, `plan-retro` | Adds "`writing` checks a text file's prose and lists each problem with its line." |
| Coverage check `--built writing` | Exit 1, three lines | `ok: docs/academic-coverage.md`, exit 0 |

## Rulings of the orchestrator

- **Section A's exemption in Steps 2 (ruling 1 of repair round 1).** The brief's Steps item 2 credits three cases to "prose standard section A's exemption": standard terminology, a quoted example and a required heading. Section A states neither of the last two: line 24 exempts a temporal "just" and genuine minimality claims from the filler ban, and line 28 exempts standard domain terminology from the flagged list. This was a rewrite of text the brief dictates, which change standard rule 4 makes a stop for the orchestrator, and it should have been raised as a stop. `skills/writing/SKILL.md` lines 43-45 hold three bullets in its place: section A's own exemptions, a quoted example, and a heading the text's layout requires. The orchestrator ratified the three bullets as written.

## Repair round 1

Every ruling of `agents/briefs/4-round-1.md` is done. The round's cases were run before any file changed and again after, from the scratchpad folder `r1` (the files `hist.md`, `hist.tex` and `paper.tex` there), and each run is quoted below.

### Rulings

| Ruling | File and line | Change | Command and output |
|---|---|---|---|
| 1. Section A's exemption | `skills/writing/SKILL.md` lines 43-45, unchanged; this report | The point moved from "Judgment calls" to "Rulings of the orchestrator", as a stop ratified by the ruling | `grep -n "Rulings of the orchestrator" 4-report.md` finds the section; the judgment calls list 9 items, none on section A |
| 2. The rule behind `history` and `section-words` | `prose-standard.md` line 21; `anti-patterns.md` lines 34, 43-45; `SKILL.md` lines 47, 48 and 105 | Section 0 gains the bullet "**No history in a rule or a comment.**"; the script-finds list gains `history`, `non-ascii` and `section-words` and its introduction names the `--limit`; Steps 2 says how a `history` and a `section-words` flag are judged; Rules names the `--limit` for a `section-words` problem | The cases under "Ruling 2's cases"; the per-check count below |
| 3. README `/writing` line | `README.md` lines 45-46, and the code block (lines 29-44) | The `/writing` line left the code block; the paragraph "`/writing <file>` is not part of that sequence. It checks a file's prose at any time and lists each problem with its line." follows the `/plan-help` line | `sed -n 27,42p README.md \| grep -c writing` prints 0; `grep -n "writing" README.md` prints lines 7, 23, 46 and 73 |
| 4. The example lines | `SKILL.md` lines 54, 70-71 and 77-82 | Steps 4 says each script flag stays one line; the `<text>` rule is split into a script-flag bullet (exactly what the script prints) and a reading bullet (at most 60 characters); the example is rebuilt from a real run | The run under "Ruling 4's run" |
| 5. The report's figures | This report, the case 4 row and judgment call 7 | 21 lines for the coverage list; 13 and 17 words, with the command | `python3 -B skills/writing/templates/check_prose.py docs/academic-coverage.md \| wc -l` on main printed 21; `printf '%s\n' '<sentence>' \| wc -w` printed 13 and 17. Every other figure was rerun: `wc -l` 105, `git diff --numstat`, `git status`, the headings of case 5 |
| 6. The paths | `git status --short --untracked-files=all` | Only the step's paths and the two pages this round adds | The status under Verify 5 above |
| 7. The report | This section | Rulings, the checks rerun, the user-visible table, carrying the change | This section |

Per-check count of the "Patterns the script finds" list, each check of `CHECKS` (`check_prose.py` line 144) counted as a backticked name after "The check" or "The checks" (`grep -o` over the section, base from `git show HEAD:`):

```text
base:
non-ascii=0 dash-aside=1 history=0 section-words=0 semicolons=1 throat-clearing=1 filler=1 vague=1 flagged=1 equal-length=1 contrast=1 colon-lists=1
now:
non-ascii=1 dash-aside=1 history=1 section-words=1 semicolons=1 throat-clearing=1 filler=1 vague=1 flagged=1 equal-length=1 contrast=1 colon-lists=1
```

### Ruling 2's cases

`hist.md` holds "# Notes", a blank line and "The check was added in step 3." `hist.tex` holds `\section{Related work}` and the reviewer's probe "Previously, Smith (2020) showed that the method no longer converges on large graphs." The script's output is the same before and after, since the round changes no script. What changes is the rule the skill applies to it.

```text
$ python3 -B check_prose.py hist.md
hist.md:3: history: "added in": a word of history, to be checked
hist.md:3: history: "step 3": a word of history, to be checked
hist.md:3: history: "was added": a word of history, to be checked
exit 1
$ python3 -B check_prose.py hist.tex
hist.tex:2: history: "Previously": a word of history, to be checked
hist.tex:2: history: "no longer": a word of history, to be checked
exit 1
```

- Before: `SKILL.md` had no rule for a `history` flag, and `grep -n -i "histor" skills/writing/references/prose-standard.md` found no rule on history words. Each flag fell to the "another check" bullet with no page to cite.
- After, `hist.md`: the text is a note about a check, a text section 0's new bullet covers, so by `SKILL.md` line 47 the three flags are problems, each cited as "prose standard, section 0", with the fix `anti-patterns.md` line 43 gives (move the history to the log or cut it).
- After, `hist.tex`: the sentence stands in a Related work section, whose subject is past events, so by `SKILL.md` line 47 the two flags are listed under "Script flags kept as allowed", with that reason, which `prose-standard.md` line 21 states ("A text whose subject is past events, such as a paper's related work, ... reports them, and this rule does not reach it").

`check_prose.py` on `prose-standard.md` and `anti-patterns.md`: before, 72 flag lines (base files from `git show HEAD:`); after, 72 flag lines. `diff` of the two runs differs only in the line numbers of `prose-standard.md` from line 22 on, shifted by one, and in the semicolon word total (978 to 1067 words). `grep -E "prose-standard.md:21:|anti-patterns.md:(34|43|44|45):"` over the after run prints nothing, exit 1: no flag on a line this round adds or changes.

### Ruling 4's run

`paper.tex`, the example draft, lines 1-9:

```latex
\documentclass{article}
\begin{document}
\section{Method}
A robust estimator is used for the variance.
The method --- unlike the baseline --- converges on every graph.
\section{Results}
A t-test was run on the two groups ($p < 0.01$).
The response rate appeared to be 78\%.
\end{document}
```

```text
$ python3 -B check_prose.py paper.tex
paper.tex:4: flagged: "robust": a flagged word, to be checked against section A of the prose standard
paper.tex:5: dash-aside: "baseline --- converges": a dash used as an aside
paper.tex:5: dash-aside: "method --- unlike": a dash used as an aside
exit 1
```

The example in `SKILL.md` lines 77-82 keeps `paper.tex:5: dash-aside: "baseline --- converges"`, `paper.tex:5: dash-aside: "method --- unlike"` and `paper.tex:4: flagged: "robust"` exactly as printed, with only the message rewritten. The reading lines cite lines 7 and 8 of the same file.

### Verify before you report, rerun after the round

1. The verify list, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md`, exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
```

2. Case 1: `ok: docs/academic-coverage.md`, exit 0. Case 2, the control: `.../ctl/docs/academic-coverage.md:107: the reason of 'references/writing_quality_check.md' (rebuild: writing) names no file of skills/writing/ that exists: skills/writing/references/none.md`, exit 1.
3. Case 3, `check_prose.py skills/writing/SKILL.md`, exit 1:

```text
skills/writing/SKILL.md:12: filler: "Quick": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:43: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:43: filler: "just": a filler word, to be checked against section A of the prose standard
skills/writing/SKILL.md:45: filler: "Quick": a filler word, to be checked against section A of the prose standard
```

The same four flags as before the round, allowed for the reasons in the table under Verify 3 above. Case 4: `check_prose.py README.md docs/academic-coverage.md` output is identical to the base run (`diff` printed nothing, exit 0), 21 lines, none on `README.md`.

4. Case 5: `head -6` shows `name: writing` and `version: "1.0.0"`; `grep -n '^## '` prints 12 Quick start, 19 Use instead, 26 What it reads, 37 Steps, 60 The problem list, 85 Stops, 93 Anti-patterns, 102 Rules.
5. The ASCII grep and `git status`, as quoted under Verify 5 above.

### Carrying the change

- `prose-standard.md` is read by every brief of the tree (`standards` in the state file) and copied whole by `repo-setup` into a new repository as `docs/dev/prose-standard.md` (`skills/repo-setup/SKILL.md` line 111). `grep -rn "prose-standard\|prose standard" skills/repo-setup docs/dev README.md` and `grep -rn -i "section 0\|hard rules\|history" skills/repo-setup docs/dev README.md` find no sentence the new bullet makes false. `skills/repo-setup/SKILL.md` line 156 ("Every file it writes follows the prose standard: ASCII, one paragraph per source line, no history.") now matches a rule the page states. `skills/repo-setup/templates/shared-rules.md` line 23, `docs/dev/change-standard.md` line 22 (rule 10) and `docs/dev/skill-layout.md` lines 18 and 71 state the same rule for their own scope and none says otherwise. `docs/dev/` holds no copy of the prose standard (`ls docs/dev/`: `building.md`, `change-standard.md`, `skill-layout.md`).
- `README.md` line 25, "The order of use, shortened from what `/plan-help` prints:", holds, as "Carrying the change" above shows.
- Line numbers: `grep -rn 'prose-standard.md`\{0,1\}, line\|anti-patterns.md`\{0,1\}, line' skills utils docs README.md` finds no line reference outside the ledger. In the ledger, `agents/reviews/3-rows.md` and `agents/reviews/3-report.md` cite `prose-standard.md` by line. The new bullet at line 21 moves every line from 21 on down by one, so their citations of lines 21 and later now point one line early. Those files are step 3's records and outside this round's paths. The changes to `anti-patterns.md` add lines after line 42 and change line 34 in place, so no cited line of that page moves.

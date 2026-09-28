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
| 4. `python3 -B skills/writing/templates/check_prose.py README.md docs/academic-coverage.md` gives no flag on an added or changed line | Base output saved: exit 1, 0 lines for `README.md`, 22 lines for `docs/academic-coverage.md` (lines 12, 16, 22, 30, 64, 96, 102, 124, 125, 163, 168 twice, 175, 190, 197, 198, 227, 229 twice, 235, 239); none on lines 7-43 of `README.md` or on lines 82, 106, 107 of the coverage list |
| 5. `head -6 skills/writing/SKILL.md` and `grep -n '^## ' skills/writing/SKILL.md` | Red: `head: skills/writing/SKILL.md: No such file or directory` (exit 1), and grep exit 2 |

The scratch copy of case 2: `utils/check_coverage.py` resolves `skills/<skill>/` from the git top folder of the coverage list (`repository()`, lines 192-199), and reads that repository's `docs/roadmap.md`. The copy therefore sits in a scratch git repository made with `git init` in the scratchpad, holding copies of `docs/academic-coverage.md`, `docs/roadmap.md` and `skills/writing/`. A Python edit replaces every backticked `skills/writing/...` path of line 107 with "the file" and appends "It is held at `skills/writing/references/none.md`."; `none.md does not exist` is printed by a `test -e` before the run.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. `skills/writing/SKILL.md` in the layout | DONE | `head -6 skills/writing/SKILL.md; grep -n '^## ' skills/writing/SKILL.md` | See "Verify 4" below |
| 2. Coverage lines 82, 106, 107 name the `skills/writing/` files | DONE | case 1 | `ok: docs/academic-coverage.md`, exit 0 |
| 3. README row, order-of-use line and line 7 | DONE | `git diff README.md` | Three lines added or changed: 7, 23, 42 |
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
57:## The problem list
80:## Stops
88:## Anti-patterns
97:## Rules
```

The order is the layout's, with the one reference section, "The problem list", between Steps and Stops.

Verify 5: `LC_ALL=C grep -n '[^ -~]'` over `skills/writing/SKILL.md`, `README.md` and `docs/academic-coverage.md` printed nothing, exit 1. `git status --short --untracked-files=all`:

```text
 M README.md
 M docs/academic-coverage.md
?? .scratch/3-the-writing-base/agents/reviews/4-report.md
?? skills/writing/SKILL.md
```

These are the paths of "Paths this step writes". The diff of `docs/academic-coverage.md` touches lines 82, 106 and 107 only, and that of `README.md` lines 7, 23 and 42, inside 7-43 of the base (`git diff`).

## Files changed

| File | Lines |
|---|---|
| `skills/writing/SKILL.md` | new, 100 lines (`wc -l`) |
| `docs/academic-coverage.md` | 3 changed (`git diff --numstat`: 3 3) |
| `README.md` | 2 added, 1 changed (`git diff --numstat`: 3 1) |
| `.scratch/3-the-writing-base/agents/reviews/4-report.md` | this report |

## Carrying the change

`grep -rn "writing" skills utils docs README.md`, less the coverage list, `skills/writing/` and the words "writing_", "rewriting", "writing base", "writing skills" and "in writing", lists `skills/repo-setup/SKILL.md` lines 32, 111 and 148, `utils/check_coverage.*`, `docs/roadmap.md` line 23, `docs/dev/skill-layout.md` line 3, `docs/dev/change-standard.md` line 52, `docs/dev/building.md` line 12 and `README.md` lines 7, 23, 42 and 72. None of them is made false: the repo-setup lines name `references/prose-standard.md` of the `writing` skill, which is unchanged, and README line 72 already installs `writing`. A grep for skill counts (`ten skills`, `10 skills`, `every skill`) finds only `docs/roadmap.md` line 135, a record of entry 1's closing, and `docs/dev/skill-layout.md` line 3, "Every `skills/<name>/SKILL.md` follows this layout", which the new file holds (case 5).

Statements about the changed files as a whole, reread after the change:

- `docs/academic-coverage.md` line 14: "Once the skill is built, the reason also names in backticks the new skill's file that now holds the listed file's content." Lines 82, 106 and 107 now each name such a file (case 1).
- `README.md` line 7, the paragraph naming the skills around the loop, now also names `writing`.
- The reference pages name the skill: `references/anti-patterns.md` line 3 ("consults the page when it weighs a report"), `references/academic-prose.md` line 3 ("read a manuscript's prose against this page"), `references/judgment.md` line 3 ("use these judgments when they read a draft"). The first two match Steps 2 and 3. For the third, see judgment call 9.

## Judgment calls the brief left open

1. **Use instead rows.** The layout's Use instead table holds "the situations where a neighbouring skill is the right one"; no rewriting skill exists, so the rewriting row is left out, as the brief says. The rows are a built plan step reviewed against its brief (`/refute <entry> <step>`) and the rules the reviews keep finding broken (`/plan-retro`).
2. **Section A's exemption in Steps 2.** The brief's parenthesis attributes three cases to section A's exemption: standard terminology, a quoted example and a required heading. Section A (`prose-standard.md` lines 24 and 28) states the exemption of standard domain terminology for a flagged word and of a temporal "just" and a genuine minimality claim for filler, and states nothing about a quoted example or a heading. Steps 2 therefore has three bullets: section A's own exemptions, a quoted example, and a heading the text's layout requires. All three cases the brief allows stay allowed. See also "What the brief got wrong".
3. **A flag of any other check.** Steps 2 also says how a flag of the other checks (`dash-aside`, `semicolons`, `contrast`, `history`, `non-ascii`, `throat-clearing`, `section-words`, `colon-lists`) is judged: allowed only where the page that holds its rule exempts the instance, with the dash inside a quotation of `academic-prose.md` line 121 as the example. It serves the brief's "judge each flag against the rule it names".
4. **An empty list.** "The problem list" gives the line `<file>: no problem found` for a file with no problem and no allowed flag, so a clean file reads differently from a run that listed nothing.
5. **Stops.** A first row "No stop", in the form `skills/plan-help/SKILL.md` uses, says the skill never waits on the user and the other rows are refusals. The unusable-file refusal includes "no file is named", the script's `no file given`, exit 64.
6. **A fourth anti-pattern.** "Taking the script's exit 0 as a clean text", pointing at Steps 3, beside the three the brief requires.
7. **Rules.** Two bullets: the skill writes nothing, and every listed problem names its rule. The "every flag appears in the list" rule is stated once, in Steps 4 and its anti-pattern row, and is left out of Rules so it is written once.
8. **README line 7.** `writing` is added as a new sentence of 12 words: "`writing` checks a text file's prose and lists each problem with its line." Adding it as a clause of the sentence before would have made that sentence 26 words.
9. **`judgment.md` line 3 and decision 2.** The page says the skill uses its judgments "when they read a draft", and the skill reads it for an academic text only (brief decision 2). The page's judgments are stated per discipline and per paper section (lines 28-51), so the draft it names is an academic one, and the two statements are read as consistent. `judgment.md` is outside this step's paths.
10. **Coverage sentences.** Line 107's added text is two sentences, one per file, so each stays within the 35-word limit that prose standard, section E, gives a coverage reason. Line 107 says the script finds "the filler and flagged terms, dash asides, semicolons, throat-clearing openers, one-sentence binary contrasts and runs of equal-length sentences", the checks `filler`, `flagged`, `dash-aside`, `semicolons`, `throat-clearing`, `contrast` and `equal-length` of the script's docstring.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| `/writing <file>` | No `SKILL.md` in `skills/writing/`, so no `/writing` command | `/writing <file>` runs `templates/check_prose.py`, judges each flag, reads the text against the reference pages and lists each problem as `<file>:<line>: <source>: "<text>": <rule and fix>`, changing no file |
| `README.md` "The skills" | Ten rows, ending with `plan-retro` | Eleven rows, `writing` after `plan-retro` |
| `README.md` order of use | Ends with `/plan-retro` | Ends with `/writing <file>               any time: checks the file's prose and lists each problem with its line, changing nothing` |
| `README.md` line 7 | Names `repo-setup`, `ordo-init`, `roadmap`, `plan-retro` | Adds "`writing` checks a text file's prose and lists each problem with its line." |
| Coverage check `--built writing` | Exit 1, three lines | `ok: docs/academic-coverage.md`, exit 0 |

## What the brief got wrong

- Steps item 2's parenthesis calls a quoted example and a required heading part of "prose standard section A's exemption". Section A does not state either: line 24 exempts a temporal "just" and genuine minimality claims from the filler ban, and line 28 exempts standard domain terminology from the flagged list. Writing the brief's sentence as it stands would put a false statement about section A in the skill, which change standard rule 19 forbids. The skill keeps all three allowed cases in separate bullets (judgment call 2), so the behaviour the brief asks for is unchanged.

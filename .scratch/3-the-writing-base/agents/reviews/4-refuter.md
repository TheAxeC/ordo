# Step 4 refuter report (on .agents/worktrees/3-4, base 934832e03193cc2db32b05a08e2166d0048b7816)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit=0

Case 1, in the worktree:
$ python3 utils/check_coverage.py --built writing docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
exit=0
Same command on main (the base text): exit 1, lines docs/academic-coverage.md:82, :106, :107 "... (rebuild: writing) names no file of skills/writing/ in backticks" (the brief's premise reproduces).

Case 2, the control. It uses a scratch git repository (git init) holding copies of docs/academic-coverage.md, docs/roadmap.md and skills/writing/. In the copy, every skills/writing/ path on line 107 is replaced and "It is held at `skills/writing/references/none.md`." is appended:
none.md does not exist
.../ctl/docs/academic-coverage.md:107: the reason of 'references/writing_quality_check.md' (rebuild: writing) names no file of skills/writing/ that exists: skills/writing/references/none.md
exit=1
The first run on the base text: :82 and :106 "names no file ... in backticks", and :107 "names no file of skills/writing/ that exists: skills/writing/references/none.md" (matches the report's row 2).
(A copy outside a git repository gives "usage error: ... not inside a git repository", exit 2. The report's scratch-repository method is needed, and it reproduces.)

Case 3:
$ python3 -B skills/writing/templates/check_prose.py skills/writing/SKILL.md
skills/writing/SKILL.md:12: filler: "Quick": ...
skills/writing/SKILL.md:43: filler: "just": ... (twice)
skills/writing/SKILL.md:45: filler: "Quick": ...
exit=1   (identical to the report's quote)

Case 4: check_prose.py README.md docs/academic-coverage.md, run on main (base) and in the worktree. `diff before.txt after.txt` printed nothing. README.md gives 0 flags. The coverage list gives 21 flag lines, none on 82, 106 or 107.

Case 5: `head -6` shows name: writing and version: "1.0.0". `grep -n '^## '` gives 12 Quick start, 19 Use instead, 26 What it reads, 37 Steps, 57 The problem list, 80 Stops, 88 Anti-patterns, 97 Rules (identical to the report).

Verify 5: `LC_ALL=C grep -n '[^ -~]'` over SKILL.md, README.md, docs/academic-coverage.md and the report printed nothing (exit 1). `git status --short --untracked-files=all` lists M README.md, M docs/academic-coverage.md, ?? .../4-report.md, ?? skills/writing/SKILL.md.

The report's own evidence: `wc -l skills/writing/SKILL.md` gives 100. `git diff <base> --numstat` gives 3 1 README.md and 3 3 docs/academic-coverage.md. The report's copy on main equals the worktree's (`cmp`).

Premises of "What is on the tree":
- `find skills/writing -type f` lists the six files.
- skill-layout.md has 72 lines.
- The versions run from 1.1.0 to 2.9.0.
- The rebuild: writing rows are 82, 106 and 107.
- README line 70 is the install loop with writing.
- Script counts: README.md 0, docs/roadmap.md 40 (3, 23 semicolons), skills/plan-retro/SKILL.md 1 (12 filler "Quick"), research-hub fwo main.tex 50 (82 semicolons, 86 contrast "not a gradual drift, with"), research-hub funding/2026-nwo-veni-self-explaining-hospital/preproposal/veni2026.tex 15 (34 dash-aside, 38 semicolons).
- All of these reproduce.
```

## 1. Spec

1. skills/writing/SKILL.md:43-45: "A `flagged`, `filler` or `vague` word is allowed where prose standard, section A, exempts it: ..." / "... where the text quotes it as an example ..." / "... in a heading that the layout the text follows requires". The builder's reading is correct against prose-standard.md. Section A exempts only standard domain terminology for a flagged word (line 28) and a temporal or minimality "just" (line 24), and says nothing of a quoted example or a required heading. So the brief's Steps item 2, which credits all three to section A's exemption, would have put a false sentence in the skill. However, change-standard.md rule 4 says a rewrite of text the brief dictates "stays as the brief has it and is reported as a stop; the report never decides it as a judgment call". The builder wrote the substitute text itself. It filed the substitute under judgment call 2 and "What the brief got wrong", and opened the report with "Everything in the brief is done" instead of reporting a stop. The substitute keeps the brief's behaviour, so the orchestrator can ratify it. Whether to ratify is the orchestrator's decision, not the builder's.
2. skills/writing/SKILL.md:47 and :100, with the script's `history` and `section-words` checks: "A flag of another check is allowed only where the page that holds its rule exempts the instance" (line 47), and "Every listed problem names the rule it breaks, by its page and section" (line 100). None of the four pages the skill reads states a rule on history words: `grep -n -i "histor\|previously" skills/writing/references/*.md` finds only the example "Previously manual. Now automatic." at prose-standard.md line 58. So no page holds the rule behind a `history` flag, and no page can exempt one. By line 47, every `history` flag must then be listed as a problem, and by line 100 that problem must cite a page and section that do not exist. A probe on hist.tex, a Related work sentence "Previously, Smith (2020) showed that the method no longer converges on large graphs.", gives two flags: `hist.tex:2: history: "Previously"` and `history: "no longer"`. academic-prose.md's tense table (line 112) asks for exactly this past-tense reporting in a literature review. `section-words` has the same gap: its rule is the user's `--limit`, not a page section. So the brief's instruction "judge each flag against the rule it names" cannot be carried out for these two checks. Line 47 is the builder's own addition (judgment call 3), and the report does not name this gap under "What the brief got wrong". The skill needs a stated rule for judging a `history` flag, and one for a `section-words` flag, or a pointer to where those rules live.

## 2. Proof

1. 4-report.md:16: "22 lines for `docs/academic-coverage.md` (lines 12, 16, ... 239)". `python3 -B skills/writing/templates/check_prose.py docs/academic-coverage.md | wc -l` on main gives 21, and the line list the report itself gives has 21 entries.
2. 4-report.md:144 (judgment call 8): the new README sentence is called "12 words", and a clause version "would have made that sentence 26 words". My count gives 13 words for "`writing` checks a text file's prose and lists each problem with its line." Adding the same text as a clause to the 17-word sentence before it gives about 30 words, not 26. Neither figure reproduces. The conclusion (over 20 words) still holds.

## 3. Standards

1. README.md:24, which the diff leaves as "The order of use, shortened from what `/plan-help` prints:", is now false. The diff adds `/writing <file>  any time: ...` at README.md:42 inside that block, and `skills/plan-help/SKILL.md` lines 55-83, the sequence it prints, has no `/writing` line. This breaks change-standard.md rule 14, which says a sentence the change makes false is a defect and a sentence about the changed file as a whole is reread. The report's "Carrying the change" rereads README line 7 but not line 24. The fix is either to reword line 24 (inside the step's README.md 7-43 range) or to add `/writing` to plan-help's printed sequence, which is outside the step's paths.
2. skills/writing/SKILL.md:67 says `<text>` is quoted "the way the script quotes it", but the examples at lines 73 and 77 quote text the script does not print, which breaks change-standard.md rule 19 (no two statements that contradict each other). I ran the script on a probe paper.tex with "We test the method --- unlike the baseline --- converges fast." and "A robust estimator is used." It prints two `dash-aside` flags, quoting "method --- unlike" and "baseline --- converges", and one `flagged` flag quoting "robust". The example shows one line quoting "the method --- unlike the baseline --- converges", and an allowed line quoting "robust estimator". The example also merges two script flags into one problem line, and Steps 4 (line 52) does not say whether that is allowed.

## 4. Behaviour

1. The `/writing` behaviour described in Spec 2: in academic text, every "previously", "no longer", "as of", "used to" and similar word is reported as a problem with no rule it can cite. The report's "User-visible changes" row for `/writing` does not state this.

## Not checked

- Whether `/writing` works end to end when a session invokes it (only the script and the text of SKILL.md were checked). This needs the installed skill, which step 5 exercises.

Points examined with no finding:
- The coverage sentences on lines 82, 106 and 107 are true of academic-prose.md, judgment.md, anti-patterns.md and check_prose.py, checked against their text and against 3-rows.md records 1-3. Record 3 sends 11 rows to prose-standard.md, which the brief's item 2 does not ask line 107 to name. The added sentences run 22, 21, 23 and 21 words, within the 35 words section E allows in a coverage reason.
- The section order and frontmatter follow skill-layout.md.
- The Quick start fence has no language tag, the same as all ten other skills.
- The README row text matches the brief verbatim, and the order-of-use column is aligned.
- The exit statuses, error forms, file types and `--limit` form that SKILL.md states match the script's docstring and probes: exit 64 for a bad `--limit`, no file, or a directory.
- The example headings "When not to hedge", 'The "so what" of each section', and prose standard sections 0 and A all exist.

Reviewer usage: 138,084 tokens, 38 tool uses, 491 s (from the runner's completion notification).

## Repair round 1, refuted (on .agents/worktrees/3-4, base 934832e)

### Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit=0

Case 1: ok: docs/academic-coverage.md, exit=0
Case 2 (scratch git repository, line 107 naming only skills/writing/references/none.md): the line-107 error, exit=1
Case 3: SKILL.md:12 filler "Quick", :43 filler "just" twice, :45 filler "Quick", exit=1 (identical to 4-report.md lines 260-263)
Case 4: check_prose.py README.md docs/academic-coverage.md, base against worktree: diff empty; 21 lines, 0 on README.md
Case 5: name: writing, version: "1.0.0"; sections 12 Quick start, 19 Use instead, 26 What it reads, 37 Steps, 60 The problem list, 85 Stops, 93 Anti-patterns, 102 Rules
Verify 5: the ASCII grep over the six changed files printed nothing; git status lists only the step's paths and the round's two pages

Round cases:
hist.md:3: history: "added in" / "step 3" / "was added", exit=1
hist.tex:2: history: "Previously" / "no longer", exit=1
paper.tex:4: flagged: "robust"; paper.tex:5: dash-aside: "baseline --- converges"; paper.tex:5: dash-aside: "method --- unlike"; exit=1 (SKILL.md lines 77, 78, 82 carry these prefixes exactly)
check_prose.py on prose-standard.md and anti-patterns.md, base against worktree: 72 and 72 lines; only 978 -> 1067 words differs after normalising line numbers; no flag on prose-standard.md:21 or anti-patterns.md:34, 43-45
```

Closures that reproduce: rulings 1, 3, 4, 5 and 6. Ruling 2 carries the findings below.

### 1. Spec

1. skills/writing/SKILL.md:47 rules on a `history` flag only for the texts prose-standard.md:21 covers and for text about past events. A README, a user page, or a paper's Introduction, Method or Results falls under neither, and SKILL.md:49 does not reach `history`. Probes: `res.tex` (Results, "The error rate no longer rises once the batch size passes 64.") gives `history: "no longer"`; `readme.md` ("The flag was added in version 2 of the tool.") gives `history: "added in"`, `"was added"`. No line of SKILL.md says whether these are problems or allowed.

### 2. Proof

1. 4-report.md:210 says `hist.md` ("# Notes") is a text section 0 covers; the bullet lists a rule, a spec, a skill, a rules page and a code comment, and the report gives no reading that places a note there.
2. 4-report.md:178 gives the code block as lines 29-44; the fence is at lines 27 and 42.
3. 4-report.md:27, :116 and :178 say README lines 45-46 added; `git diff -U0` prints `@@ -44,0 +46,2 @@`, the paragraph at line 46.

### 3. Standards

1. SKILL.md:48, SKILL.md:105 and anti-patterns.md:45 say a `section-words` flag exceeds a limit and is fixed by cutting the section. The script also flags line 1 when no heading matches a `--limit` (docstring lines 99-100, line 648): `--limit 'Summary=3' lim.md` prints `lim.md:1: section-words: "Summary": no heading matches this limit`. Change standard rule 14.
2. SKILL.md:48 and :105 state the same rule twice, against skill-layout.md line 41 and the anti-pattern at line 69.
3. prose-standard.md:21: the first sentence of the bullet runs to 39 words, against section E (line 65). SKILL.md:47 is one sentence of about 36 words.

### 4. Behaviour

1. SKILL.md:47 makes every `history` flag in a covered text a problem, with no allowance for a quoted example or a match that states no history. Over the skills, `docs/dev/` and the repo-setup templates the script prints 21 `history` flags, and none of those checked is history: `docs/dev/skill-layout.md:71` (a quoted "added in"), `prose-standard.md:59` (the page's example), `skills/land/SKILL.md:10` ("Step 0", a ledger section's name), `skills/plan-orchestration/SKILL.md:105` ("step 9", its own Steps item), `skills/refute/SKILL.md:134` ("no longer", a present condition). The report's "User-visible changes" does not state it.
2. The `section-words` behaviour of Standards 1 is not stated either.

### Ledger records that cite prose-standard.md by line

The new bullet at line 21 moves every later line down by one. `agents/reviews/3-rows.md` has 19 such citations (lines 17, 19, 30, 57, 59, 137-139, 144-147, 150, 155-160); `agents/reviews/3-report.md` has 91. `2-report.md` lines 147-212 and `3-refuter.md` lines 69, 73, 74 cite it as quoted output or past findings. No file under `skills/`, `utils/`, `docs/` or README.md cites the page by line.

### Not checked

- The round's delta is reconstructed from the round-0 text the first report quotes; other lines were read against the whole diff since the base and carry no finding.
- The round's cases ran on the current tree only; the script is unchanged since the base.
- Whether each 3-rows.md and 3-report.md citation was correct before the round.
- `/writing` run end to end as an invoked skill.

Reviewer usage: 155,647 tokens, 37 tool uses, 650 s (from the runner's completion notification).

## Closed

The first review:
- Spec 1 (the substitute text for section A's exemption): closed in repair round 1 (ruling 1); the orchestrator ratified SKILL.md's three bullets, and the report records the point as a stop the builder should have raised.
- Spec 2 and Behaviour 1 (no rule behind a `history` or `section-words` flag): closed in repair round 1 (ruling 2), with open item G ruled (a) by the user: prose standard section 0 carries the no-history rule, and `anti-patterns.md` names where the rule of `history`, `non-ascii` and `section-words` lives.
- Proof 1 and 2 (the 22 lines, the 12 and 26 words): closed in repair round 1 (ruling 5), 21 lines, 13 and 17 words.
- Standards 1 (README line 24 made false): closed in repair round 1 (ruling 3); the `/writing` line is a paragraph after the code block.
- Standards 2 (the example quoting text the script does not print): closed in repair round 1 (ruling 4); the example is taken from a real run.

The review over round 1:
- Spec 1 and Behaviour 1 (a `history` flag in a text section 0 does not cover, and flags that state no history): fixed at landing. SKILL.md Steps 2 makes a `history` flag a problem only where its words tell when a rule, a spec, a skill, a rules page or a code comment was made, what came before it, or which step or session wrote it; it is allowed, with the reason, in text about past events, in a text section 0 does not cover, in a quoted example, and where the words state no history. SKILL.md's own two `history` flags at line 48 are its quoted examples, allowed by that line.
- Proof 1 (hist.md called a covered text): closed by the fix above; a note is not a text section 0 covers, so its flags are allowed under the landed Steps 2. The report's claim stands as a record of the round and is not rewritten.
- Proof 2 and 3 (README lines 29-44 and 45-46 in the report): accepted as the report's miscount of blank lines; the code block is at lines 27-42 and the paragraph at line 46 (`grep -n`), and the content is as ruled.
- Standards 1 (the second `section-words` flag, no heading matching a `--limit`): fixed at landing. SKILL.md Steps 2 lists that flag under "Script flags kept as allowed" with the `--limit` to correct, and `anti-patterns.md` line 45 names both flags and both fixes. Probe: `--limit 'Summary=3' --limit 'Intro=3'` on a two-line file prints the over-limit flag and "no heading matches this limit".
- Standards 2 (the `--limit` rule written twice): fixed at landing; the Rules bullet points at Steps 2 and "The problem list" in place of restating the rule.
- Standards 3 (a 39-word sentence at prose-standard.md line 21, a 36-word sentence at SKILL.md line 47): fixed at landing; the bullet is five sentences of at most 20 words, and the `history` rule of Steps 2 is two bullets.
- Behaviour 2 (the `section-words` behaviour unstated): closed by the Standards 1 fix; the booking states it.
- The line citations shifted by the new bullet: the 19 citations of `prose-standard.md` line 21 or later in `agents/reviews/3-rows.md`, which step 6's gate reads, are moved down by one and each checked against the page (`sed -n <line>p`). `3-report.md`, `2-report.md` and `3-refuter.md` are reports of their own rounds and keep the line numbers of the page as it then was.

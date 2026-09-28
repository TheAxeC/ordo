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

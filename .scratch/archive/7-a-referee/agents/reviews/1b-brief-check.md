# Brief check: step 1b

Checked on main at b63b2b2 (`git rev-parse HEAD` printed `b63b2b2bdb8c4f1484bd48f85ccaa10435f3b01f`); the five files of `skills/academic/referee/` equal head (`git diff --quiet HEAD -- <file>` exit 0 for each). Nothing was written and no state-changing git command was run.

## Names

Commands: `grep -rIl -i 'referee' --exclude-dir=.git --exclude-dir=.scratch .`, then `grep -n -i referee <file>` per hit; `grep -rIn -i 'budget' --exclude-dir=.git --exclude-dir=.scratch .`; `grep -rIn -i 'selection\.md\|left-out\.md\|revision-check\.md\|selection_template\|referee_report_template\|second_round\.md\|referee_agent\|First-round points resolved\|new issue\|new point\|first-round point' ...`; `grep -rIn '1\.0\.0\|1\.1\.0' ... | grep -v 'skills/.*/SKILL.md'`.

Hits outside "Paths this step writes", each with whether the step makes it false:

1. `README.md:30`: "It asks the direction, the severity, the budget of points and words ... A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments". Not made false: a selection under a ceiling is within the budget. It says nothing on what a second round reports.
2. `README.md:32`, `:72`, `:127`, `:154`: the skill's group, its agents, the default agent, the install loop. Not touched by the step.
3. `README.md:80` (alt text) and `docs/figures/gen_figures.py:1918-1957`, `docs/figures/referee.svg`: the node "Referee: the selection and the left-out comments", the stop "You confirm the selection or move comments", and the note "The second round starts the field analyst and the EIC, which checks the revision against the authors' response ... Its selection, its stop and its report follow as in the first round." Not made false as a statement of order. Finding: item 15 lets the builder change the Stops row "The selection", and `docs/dev/building.md:37` says "A change to a skill's Stops table, its sequence, its agents, its cycles or its name changes the labels in the script that draws it". The figure's files are outside the paths, and Decision 3 names "`README.md`, the dev pages and the glossary" but not the figure. The brief should say that a change to the "What it shows" cell changes no label of the figure, or add the files.
4. `docs/dev/building.md:37`, `docs/dev/scripts.md:9`: list `referee.svg` only. Not made false.
5. `docs/glossary.md:156` (**referee review**) and `:159` (**round, of a referee review**: "its second round the review of the revision with the authors' response"). Not made false. The glossary has no entry for budget, major point, minor point, status or new point (`grep -n -i budget docs/glossary.md` prints nothing), so the step uses no glossary term in a new sense. `:153`, `:149`, `:157` only name the referee review as a neighbour.
6. `docs/roadmap.md:26-27`: the goal's "budget of points and words" and the gate's "within the budget given at the intake". Not made false.
7. `skills/academic/paper-review-panel/SKILL.md:38`: the "Use instead" row only. Says nothing on budget, selection or second round.
8. `skills/academic/paper-review-panel/references/re_review_mode_protocol.md:63-70`, "New Issue Detection": "EIC also scans for: Whether content added during revision introduces new problems; Whether newly added references are correct ...; Whether revisions cause inconsistencies". `references/second_round.md` item 4 tells the EIC to check "as that page gives it in 'Verification Logic' and 'New Issue Detection'". Finding: item 10 of the brief sets a narrower test for the EIC (the defect by itself makes a main claim fail) than the section the same item 4 sends the EIC to. The builder may not change the panel page, so the narrowing must be written in `second_round.md` item 4 as words the session gives the EIC. The brief does not say this, and rule 19 of the change standard ("A change leaves no two statements that contradict each other ... or reported as a stop when the brief does not cover it") then makes it a stop.
9. `skills/academic/paper/**` hits (`SKILL.md:23,69,115,433,445,447`, `agents/peer_reviewer_agent.md:603,605`, `references/mode_selection_guide.md`, `references/revision_patch_protocol.md:90`, `templates/apply_tex_patch.py:177`), `docs/figures/paper/*.svg`, ADR 0020 and 0043: "referee comments" on the author's side of `paper`. Not touched.
10. Skill versions listed on a page: none. The only hits are `README.md:236` (`utils/pin.sh v1.1.0`, a repository tag in an example), `utils/pin.sh:22` and `utils/pin.test.sh:7,209` (the tag `v1.0.0` of Ordo). No page lists a skill's `metadata.version`, so "1.1.0" makes no page false.
11. Finding on the version itself. `docs/dev/skill-layout.md`, "Frontmatter": "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed" and "The minor part when the skill ... adds to its output, and every run that worked before still works"; also "A plan that changes a skill raises one part of its `metadata.version` once". Items 10 to 14 change the output of a second-round run under the same inputs (new points withheld, another report form), which reads as the major part, and this plan already wrote "1.0.0" at step 1 (`git log --oneline -- skills/academic/referee/SKILL.md` prints only 0b4f269; `git tag --contains 0b4f269` prints `v9.1.0-rc.1`). The brief fixes "1.1.0" in item 15 and Verify 2 without naming it under "Decisions taken in this brief".

## The step line

Map of items to the parts of the line and the rulings:

- "grades and counts the points by what the manuscript's weaknesses are": items 1, 4.
- "before it reads the budget": no item. See finding 1.
- "the budget only cuts a list that is longer and is never a number to reach": items 3, 5; item 6 (length) rests on the ruling's "the budget only cuts", not on the line, which speaks of points only.
- "a point is major only when a main claim fails without it": item 2.
- "`SKILL.md` ... with the version raised": items 7, 15.
- "a second round reports on how the authors answered each first-round point and whether the answer is enough": items 8, 9, 14.
- "takes its recommendation from that": item 13.
- "adds a new point only for a grave defect the revision introduced, as an exception": items 10, 11.
- Item 12: see finding 3.

Findings:

1. A part of the line with no requirement: "before it reads the budget". Item 1 says "before it applies the budget". The referee is given `intake.md`, which holds the budget, in the same prompt as the reports (`SKILL.md`, first round item 5: "Give it `agents/referee_agent.md`, the manuscript, `intake.md`, every reviewer's report and `templates/selection_template.md`"), and the template opens with "## Budget". With "applies", a page on which the referee reads 7 first and grades afterwards meets item 1. The brief also says "Keep ... the roles started and how", so the only way left to meet the line is an order of reading written in the referee's page; the brief does not ask for it.
2. Item 13 is narrower than the line and the ruling. The line: "takes its recommendation from that" (how each first-round point was answered). The ruling: "how the authors responded to each of the referee's comments". Item 13: "rests on the statuses of the first-round major points and on whether a new point stands". The first-round minor points have no part.
3. A requirement that serves no part of the line or of the two rulings: item 12, first sentence ("a first-round minor point never becomes major"). Neither ruling nor the line says a grade is capped. Its second sentence serves "whether the answer is enough".
4. The line's check ("a reviewer reads the changed words against the rulings") is not stated in the brief; the brief's Verify list holds three builder checks. This is consistent with the check being the reviewer's.

## Premises

1. Line 11 holds. `wc -l skills/academic/referee/SKILL.md skills/academic/referee/*/*.md` printed 137, 64, 54, 31, 53 (total 339); `sed -n 1,6p skills/academic/referee/SKILL.md` shows `  version: "1.0.0"` on line 5.
2. Line 12 holds by reading `agents/referee_agent.md`, "The selection": item 3 "A point is major when it bears on whether the paper's main claims hold.", item 5 "Select within the budget of `intake.md`: no more major points and no more minor points than it gives."
3. Line 13 holds by reading `references/second_round.md`: item 4's Done line "with a status for each first-round point and the new issues of the revision"; the list after item 6, "each first-round point with its status and each new issue".
4. Line 14 is incomplete for the second round. `grep -n -i 'budget\|second round\|re-review' skills/academic/referee/SKILL.md` gives the budget on lines 3, 59, 81, 121 (as the brief says), and the second round on lines 16, 31, 32, 35, 43, 45, 51, 96, 109, 112, 128 and 132. The brief says "lines 16 and 96 to 101". It leaves out, among others, the Stops row "The selection" (112: "... and, in a second round, the first-round points resolved"), which item 15 itself points at, and Rules (132: "A second round also holds `revision-check.md`").
5. Line 14 also cites a skill's text by line number. `docs/dev/change-standard.md`, "Where the work happens": "A ledger file cites a page (the rules page, a standard, a skill's text) by its section, never by a line number".
6. Line 14 omits the budget lines of the referee's page, which items 5 and 6 change: `grep -n -i budget skills/academic/referee/agents/referee_agent.md` prints lines 16, 26, 29 ("such as minor against the budget"), 45, 49 and 60 ("Keep within the length of the budget and within the journal's limit, whichever is shorter").
7. Line 15 holds: the template's `##` sections are Budget, Selected points, Left-out comments, First-round points resolved, Count; `referee_report_template.md` line 18 holds the one second-round sentence.
8. Line 16 holds: `grep -n -i referee docs/adr/*.md` hits 0020 line 7 and 0043 lines 67 and 89 only, all on `paper`.
9. Line 17, first round, holds: `.agents/gate-7a/round1/referee-runs/round-1-2026-11-22/selection.md` has 7 `#### M` and 7 `#### m` headings and the count line "Comments in the reports: 167. Under a selected point: 143. Left out: 24."
10. Line 17, second round, is wrong in its description of the mechanism. The run's `selection.md` has 7 major and 5 minor points and its report recommends "major revision", as the brief says. But `grep -n '^- Status'` over it prints 10 points marked as first-round points (6 "resolved in part", 4 "not resolved") and 2 marked "a new point of the revision". The brief says "most of them points the first-round comments did not hold". What the run did: the EIC wrote 11 new issues (NEW-1 to NEW-11 of `revision-check.md`), and 9 of them were merged into first-round points, which were then retitled, for example "M1 ... Check, Major 2 ...; Check, NEW-2 ...; Check, NEW-3 ..." and "M4 ... Check, Major 4 ...; Check, NEW-4". Only NEW-5, NEW-6 and NEW-11 became new points. The first-round comments were given to the run (`intake.md`: "Source of the first-round points: the first-round comments"; `cmp` of the given file with the comments sent prints nothing, they are equal). The requirements are written against stand-alone new points and do not name the merge of a new issue into a first-round point (see Cases and checks 2 and The question 10).

## Cases and checks

1. No case is inconsistent with the rules file or the standards, and no case asks the builder to check or explain a place the step does not change: each concerns the five pages of the paths. C5 and C6 rest on what the EIC writes, which the panel's pages govern (Names 8).
2. Two items give one situation two results: item 4 against item 11. Item 4 (both rounds): "Comments are merged only when they are about the same weakness". Item 11: "Any other new observation of the EIC ... goes to the left-out comments with a reason". A new observation of the EIC about the same weakness as a first-round point resolved in part (the run's NEW-4 "Abstract and Discussion against Results" beside Major 4 "balanced comparison") is merged into that point under item 4 and left out under item 11. This is the route 9 of the run's 11 new issues took, and no case covers it: in C5 every first-round point is resolved.
3. Item 11 has two readings, and C5 comes out differently under each. Sentence 1: a weakness of the first version the revision did not touch "is not raised in a second round". Sentence 2: "Any other new observation ... goes to the left-out comments". If "other" excludes the weaknesses of sentence 1, C5's four weaknesses (none in changed material, so of sentence 1's kind) are listed nowhere, which breaks the referee's count rule "every comment of every report is listed once". If sentence 1 means "is no point", they are left out, as C5 expects. The item should say which.
4. Item 12 against item 2 and item 10. A first-round minor point whose answer shows that a main claim fails is major under item 2 and "never" major under item 12. A first-round minor point the revision made worse to that degree is a defect the revision introduced, a new point under item 10, and capped at minor under item 12. C7 covers only a minor point with no answer.
5. Item 12 has no result where the first-round points carry no grade. `references/second_round.md` item 4: "Where the first-round points are read from the response letter and carry no grade, each is checked as a Priority 1 item." "Keeps at most its first-round grade" gives nothing there.
6. Item 12's "never" against the stop the brief keeps. `SKILL.md`, first round item 6: "The user confirms, moves items between the two lists, or changes a point from major to minor or back." The item does not say the cap binds the referee and not the user.
7. Item 2 holds two sentences that pull apart: a point is major when a main claim "fails, or cannot be judged, unless the point is settled", and "a missing detail or ... a missing comparison that leaves the main claims standing is minor". A missing comparison is the usual reason a claim "cannot be judged". The run's major points "baseline breadth" and "alignment with scIB evaluation conventions" fit both sentences.
8. Item 14 does not say where the remaining first-round points stand in the journal's fields. "Opens its general comments with ..., then gives the remaining first-round points ..., then any new point" reads either as all inside the general comments or as the fields "Major points" and "Minor points" kept. It also meets `agents/referee_agent.md`, "The report": "Number the major points and the minor points", which the first-round numbering replaces for a second round; the brief does not say so. C7 and C8 ("with its first-round number", "a minor point") have a result under either reading, but two builders give two forms of the report.
9. Item 5 and C2: the template's "Left-out comments" table has one row per comment, so a major point cut by the budget loses its grade and its merged comments as a unit. C2's "three left out" and item 5's "stay visible to the user ..., who may move them in" need the cut points shown as points; item 1 gives the found count a place and item 5 gives the cut points none.
10. Each case's expected result otherwise follows from the items: C1 from 1, 2, 3; C2 from 1, 5; C3 from 3; C4 from 2, 4; C5 from 10, 11 (under the second reading), 13; C6 from 10; C7 from 12, 14, 5; C8 from 12.
11. Missing cases, by item: none for item 6 (length), for item 11's five reviewers in a second round, for item 13 with a result a reader can check, for item 14's form, and none for the situation of finding 2.
12. The brief's Verify 1 runs clean on the tree as it is (exit 0, no output) and Verify 2 prints `  version: "1.0.0"` now. Verify 1 leaves out the report `.scratch/7-a-referee/agents/reviews/1b-report.md`, which the step writes; rule 6 has the character-set check run "over those files".
13. The Report section does not ask for what rule 14 requires: the grep of each changed name "across `skills/`, `utils/`, `docs/` and `README.md`" quoted, and each sentence about a changed file as a whole reread (for example `selection_template.md` line 3, `second_round.md` line 3 "A second round reviews a revision against the authors' response letter", the description's "A second round checks a revision against the authors' response letter"). The rules file binds anyway; the report shape should carry it.
14. The description is 882 characters of 1,024 (`python3 -c 'import yaml; ...len(d)'` printed 882). Item 7 lets the builder add to it; 142 characters are left.

## The question

"Could this pass without the goal being reached?" The readings of the unchanged pages below are mine, by reading; no run was made.

1. The check on the step's line: yes. The words can match both rulings while the run's two mechanisms stay open: the referee reads 7 before it grades (The step line 1), and a new issue is merged into a first-round point (Cases 2). The plan leaves the proof to step 2's runs, which the state file says are made again after 1b.
2. C1: yes. The unchanged pages already give three major points for three such weaknesses; only the found count is new. The input holds no weakness that bears on a claim without making it fail, so "nothing is graded up" has nothing to bite on.
3. C2: yes. The unchanged pages already select seven and leave three out; only the found count and the reason's wording are new.
4. C3: yes. Nothing on the unchanged pages forbids a selection with no major point.
5. C4: yes. The unchanged item 2 already merges only "the comments about the same weakness", and the run still put 143 comments under 14 points. The case does not say what makes two comments the same weakness.
6. The case the first-round failure needs is absent: reports with, say, three weaknesses under which a main claim fails and ten that bear on the claims and leave them standing, budget 7; expected three major points. Without it C1 to C4 pass on a page that still lets the budget be filled.
7. C5: no for the new points (the unchanged pages allow them, the changed pages must not). Yes for "a recommendation that rests on the resolved points": any value passes, "major revision" included, which is what the run gave where the referee had accepted.
8. C6: yes. The unchanged pages already give a new point; only "naming what the revision changed" is new. It is the exception's side, so this costs little.
9. C7: no. C8: no for the grade, but "one sentence of wording" is the easy end; the run's points were first-round major points with a large remainder made larger by new issues.
10. Items. 1: yes (applies, not reads). 2: yes in part (Cases 7). 3: no. 4: yes in part ("the same weakness" has no test). 5: no. 6: no. 7: no. 8: yes in part: the run's points already carried first-round statuses while holding new content, so "built on the first-round points" passes with a retitled point; nothing says a remaining point holds only what the first-round point asked. 9: yes, it is on the tree already and the run failed with it. 10: no for a stand-alone new point; yes for a new issue merged into a first-round point. 11: two readings (Cases 3). 12: yes: five of the run's seven major points were first-round major points resolved in part or not resolved, which the cap leaves major, and "small" has no test. 13: yes, every value passes; no sentence says what the statuses must be for "major revision" or "reject" to be given. 14: no for the form. 15: not a part of the goal.

## ADRs

Read: the status line and the Decision section of each of the 42 records 0001 to 0043 (`awk '/^## Decision/{p=1;next}/^## /{p=0}p'` over each, and `grep -m1 -n -i '^Status'`), and `docs/adr/README.md`.

1. None touches the step. No record's decision governs `skills/academic/referee/`, `paper-review-panel`, the skill layout or a skill's version. 0020 and 0043 name "referee comments" for `paper` only. 0001, 0002, 0026 and 0030 place the prose standard for `writing` and `paper`; 0014, 0030 and 0035 set the default agent for `code-comments`, `paper` and `writing`. The brief's "No ADR touches this step" holds, and no part of the brief contradicts a record.

## Dictated text

Command: `grep -n '"1.1.0"\|says so\|The page says\|marked as new' .scratch/7-a-referee/agents/briefs/1b.md` (lines 36, 45, 48, 49, 50, 113), read with the whole brief.

1. Line 50 and line 113 dictate one line of a file: `  version: "1.1.0"` for line 5 of `SKILL.md`. Against `docs/dev/skill-layout.md`, "Frontmatter", see Names 11. The brief's sentence "nothing here is dictated text" (line 21) is false for this line.
2. No other line gives the words of a sentence or a heading. These lines fix the content of a sentence and are near enough to be copied: line 33 "The budget is a ceiling and never a number to reach. The page says so"; line 45 "The page says the expected number of new points is none"; line 49 "marked as new". Read against the standards: line 33's sentence, copied, is a binary contrast of the kind the prose standard allows "at most twice per page"; item 3's three forbidden ways are bare prohibitions, and `docs/dev/skill-layout.md`, "Writing for an agent", asks that "a rule written as a prohibition names the behaviour to do instead, in the same bullet", which items 2, 4 and 5 supply only if the builder joins them. Line 37 ("without repeating the referee's page") agrees with "A rule is written once. Another place that needs it names the section it is in."

## Declined to judge

1. Whether the two rulings improve the skill (rule 23 of the change standard): the user's, and only step 2's runs show it.
2. Which version part is right, and whether a second raise inside this plan is allowed: the layout's sentences are quoted under Names 11; the choice is the orchestrator's.
3. What a run of the changed skill gives: no run was made, by the terms of this check.
4. The ADRs' Context, Alternatives rejected and Consequences sections: not read; only the status lines and the Decision sections were.
5. `docs/glossary.md` was read with each line cut at 700 characters; the tail of the longer entries (lines 10, 15, 42, 44, 46, 72, 104, 110, 121, 124, 126, 149, 150, 157) was not read. The entries the step could touch (**referee review**, **round, of a referee review**, **case**, **stop**, **finding**) were read in the part shown.
6. The hits for "referee" under `.scratch/archive/5-paper/`: closed ledgers, not read one by one.
7. Whether the second-round run's points match or differ from the comments the user sent in round 2: the user's reading; only the run's own Status lines and merged comments were counted.

Agent usage: a209c45f6fbb2d894, claude-fable-5-2, 211641 tokens, 17 tool uses, 5.6 minutes.

## Closed

- Names 3, the figure: the brief says no label of the figure changes and that a change that would make one false is reported.
- Names 8, the panel's "New Issue Detection": item 11 has `references/second_round.md` give the EIC the test in the session's own words, with a separate heading for other observations.
- Names 11 and Dictated text 1, the version: it stays "1.0.0" (item 16, Decision 3, Verify 2), and the plan's step line no longer says the version is raised.
- The step line 1, "before it reads the budget": item 1 orders the referee's work with the budget last and says the budget plays no part in a grade; the plan's step line says "applies".
- The step line 2, the recommendation and the minor points: item 14 rests it on the statuses of the first-round points, the major ones first.
- The step line 3, the cap on a grade: item 13, named as Decision 4 with the ruling's words it follows.
- Premises 4 to 6: the premise names the places by section and adds the referee's page.
- Premises 10 and Cases 2, a new issue merged into a first-round point: items 8 and 12, and case C10.
- Cases 3, the two readings: item 12 lists each kind of other observation among the left-out comments.
- Cases 4 to 6, the cap: item 13 binds the referee and not the user, covers points without a grade, and item 10 takes a first-round point the revision made worse.
- Cases 7, the two sentences on a missing comparison: item 2.
- Cases 8, the form of a second-round report: item 15, Decision 5.
- Cases 9, cut points as points: item 5.
- Cases 11 and The question 2 to 8, the cases: C1 now holds weaknesses that leave the claims standing, C5 is the length, C6 and C11 give the recommendation a result, C10 is the merge.
- Cases 12 and 13: Verify 1 includes the report, and the report shape asks for the grep of changed names and the reread sentences.
- Cases 14: item 7 names the 1,024 characters.
- The question 1, that the words can match while a run still fails: left to step 2's runs, as the plan has it.


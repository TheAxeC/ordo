# Step 3 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-3, base 78cc139)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

Page under review: `/Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-3/.scratch/6-paper-review/agents/reviews/3-diff-reading.md` (called "the page" below). `S` is `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer`, `P` is the page.

## Verification (rerun by the reviewer)

```
git status --short
?? .scratch/6-paper-review/agents/reviews/3-diff-reading.md
?? .scratch/6-paper-review/agents/reviews/3-report.md
exit 0

git diff 78cc139 | wc -l
0

Check 1, the character-set command of the brief over the two files, as written:
(printed nothing)
exit 0

Check 2, for each file: command diff "$S/$f" "skills/academic/paper-review-panel/$f" | grep -c '^[0-9]'
agents/devils_advocate_reviewer_agent.md 42
agents/domain_reviewer_agent.md 22
agents/editorial_synthesizer_agent.md 53
agents/eic_agent.md 18
agents/field_analyst_agent.md 5
agents/methodology_reviewer_agent.md 17
agents/perspective_reviewer_agent.md 21
examples/hei_paper_review_example.md 19
examples/interdisciplinary_review_example.md 30
examples/subclaim_decomposition_example.md 21
references/calibration_mode_protocol.md 32
references/editorial_decision_standards.md 3
references/guided_mode_protocol.md 2
references/integration_guide.md 1
references/quality_rubrics.md 3
references/re_review_mode_protocol.md 17
references/review_criteria_framework.md 3
references/review_quality_thinking.md 5
references/sprint_contract_protocol.md 30
references/statistical_reporting_standards.md 6
references/top_journals_by_field.md 5
SKILL.md 54
templates/editorial_decision_template.md 9
templates/peer_review_report_template.md 2
templates/revision_response_template.md 6
sum 426
The page's line "`diff` prints N hunks for this file. This part names N" gives the same N for each of the 25 files, and the list items that open with a hunk id count the same N per file (awk per file part, grep -c).

Check 3, the loop of the brief that checks each hunk id stands in its file's part:
(printed nothing)
exit 0

Check 4: git status --short prints the two paths above only.

Check 5 (prose standard read): not rerun as a command; see "Declined to judge".

find skills/academic/paper-review-panel -type f | wc -l            -> 25
command diff -rq $S skills/academic/paper-review-panel | wc -l      -> 26 (25 end in "differ", 1 "Only in .../references: changelog.md")
command diff -r $S skills/academic/paper-review-panel | wc -l       -> 2673
wc -l $S/references/changelog.md                                    -> 9

Commands the builder's report quotes:
grep -o 'Verdict: [^.]*\.' "$P" | sort | uniq -c
 109 Verdict: edit 1.
  65 Verdict: edit 2.
   7 Verdict: edit 3.
 442 Verdict: edit 4.
   1 Verdict: edit 5.
  97 Verdict: none, ADR 0043, Decision 2.
  40 Verdict: none, nothing allows it.
   6 Verdict: none, ruling "Open item 2-call".
  10 Verdict: none, ruling "Open item 2-contracts".
   1 Verdict: none, ruling "Open item 2-questions".
  10 Verdict: none, ruling "The three things the source does not state".
same command | wc -l -> 788
Summary lists: 40, 27, 97 and 7 list items (grep -c per section). The 27 split 6 / 10 / 1 / 10 by ruling.
grep -n '"contract_id"' skills/academic/paper-review-panel/SKILL.md -> 294 and 379; grep -c 'contract_id' $S/SKILL.md -> 0
command diff $S/agents/eic_agent.md .../agents/eic_agent.md | grep -n '^21,23c21,23' -> 17:21,23c21,23
command diff $S/references/integration_guide.md .../references/integration_guide.md | grep '^[0-9]' -> 6,14c6,13
grep -n 'Generator-Evaluator' skills/academic/paper/SKILL.md -> a heading at line 814
grep -rn '\bSR\b' $S -> one line, references/sprint_contract_protocol.md:71
wc -l -> 2408 (page), 139 (report)
orchestrator-state.md, "Open items" -> "- none"
Each of these agrees with the builder's report.
Not rerun: `git diff --stat 6844dfd HEAD -- skills` (outside the git commands this review may run).
```

One more command of mine: for every hunk the page puts in a shared entry ("One replacement and nothing else", "One removal and nothing else"), in all 25 files, I printed the span between the first and the last differing token of each source line and its skill line. Every such hunk shows only the replacement its entry states (for example `[ <em dash>] => [:]`, `[<section sign>] => [section ]`, `[ (#215)] => []`). No shared entry holds a hunk with a second change.

## Verdicts

Items of the brief's "What to build", in the order of "What must hold":

- 1 (every hunk of the 25 files in the page under its file, by its line numbers; per-file counts stated and equal): holds, checks 2 and 3 above.
- 2 (each hunk has the source's text, the skill's text and a verdict; a line of 200 characters or fewer quoted in full): violated in one place, Spec 4. Holds in every other hunk I read.
- 3 (a hunk with several changes of different kinds names each with its own verdict): violated, Spec 1.
- 4 (each hunk named once in its file's part, in backticks): holds, check 3 and the per-file id counts.
- 5 (a shared entry only for hunks that make one and the same replacement and nothing else, each hunk listed with its changed words): holds, the span command above over every shared entry.
- 6 (a hunk that only adds or removes blank lines is named as that): holds for `SKILL.md` (`35a26`, `267a442`, both "none, ADR 0043, Decision 2"). In the 18 other files I read whole no hunk is blank lines alone.
- 7 (a verdict "none" is never softened; it names the ruling, Decision 2 or "nothing allows it"; Changelog left out is edit 4; a ruling that allows no difference is never given): violated, Spec 1 and Spec 2. The form holds everywhere (every "none" names one of the three), "A copy and nothing else" and "No calibration script" are given nowhere, and `## Changelog` left out has edit 4.
- 8 (`SKILL.md`: removed blocks paired with their place, words left out listed, words added listed, each with its verdict): holds at the hunks; the three tables are incomplete as lists, Spec 3.
- 9 (`references/changelog.md` has its own entry with its verdict): holds, "The file only in the source", edit 4.
- 10 (the summary: files, 426 hunks, changes per verdict, every "none" change in one line with those nothing allows first, then edit 3 and edit 6): holds; the counts 109 / 65 / 7 / 442 / 1 / 0 / 97 / 10 / 10 / 6 / 1 / 40 = 788 equal the grep counts, and I matched the 40 and the 27 summary lines one by one to the entries of the hunks.
- 11 (judged on what `diff` shows, no verdict taken from the reports of steps 1 and 2): not verifiable by a read of the page; nothing in the page cites those reports.

Cases of the brief's "Cases":

- `references/integration_guide.md`, `6,14c6,13`: met. One entry, both texts in full, the names edit 1, the line left out with the renumbering edit 2. Read against the diff.
- `agents/eic_agent.md`, `21,23c21,23`: met. The first line has four verdicts (directory words edit 1, the not-equal sign edit 4, the dash edit 4, the agent's name edit 1); the second and third lines have theirs. Read against the diff.
- `SKILL.md`, the two json contracts: met. Listed as added at `262a258,436` and as block A12, each "none, ruling Open item 2-contracts". `grep -c contract_id` on the source's `SKILL.md` prints 0.
- `references/changelog.md`: met. One entry after the 25 files, edit 4.
- Per-file hunk counts and their sum 426: met, check 2.

## 1. Spec

- 1. The page, `## SKILL.md`, hunks `243c209,214` and `251c236,241`: "Items 1 and 2 are added. The source's section has no steps: it points at `references/re_review_mode_protocol.md` for them. The items say when the agents start and that the EIC's agent is resumed. Verdict: none, ruling "The three things the source does not state"." and the same sentence for guided. What is wrong: each of these four items holds text of a second kind that the one verdict covers silently. Re-review item 1 says "in the phases `references/re_review_mode_protocol.md`, "How It Works", gives, each in one call, with no sprint contract"; item 2 says "Hold the Socratic guidance after the re-review, under the condition and within the number of rounds that [...] gives"; guided item 1 says "Run Phase 0 as full items 1 and 2 say, then start the five reviewers at once, each in one call, with no sprint contract, with what [...] "How It Works", changes"; guided item 2 says "Hold the dialogue of `references/guided_mode_protocol.md`, "Dialogue Flow"". These are steps that restate a row of the modes table or a reference page. The page gives the same kind of text "none, nothing allows it" at `246a218,231` ("The two items of `### quick` are added. They restate the row `quick` of the modes table as steps.") and at `259c249,254` (calibration items 1 and 2). The ruling's words in `plan.md` name three things only: each role its own agent, the reports in a run folder, the second call to the same agent. Only "The run's EIC agent is resumed" and the start of agents fall under them. The brief asks that a hunk with changes of different kinds names each with its own verdict. Failure scenario: the user reads the list "None, nothing allows it" as every added step no ruling names, finds quick, methodology-focus and calibration there, and does not find the added steps of re-review and guided, which stand under "None, a ruling allows it" as "the two items of `### re-review` are added" and "the two items of `### guided` are added". He rules on three modes' steps and never sees the other two as his to rule on. Verdict: makes items 3 and 7 violated.

- 2. The page, `## SKILL.md`, verdicts "none, ADR 0043, Decision 2" on words that are left out or added, not carried. The brief gives Decision 2 for a section carried into the layout's section and for Version Info left out. The page's own rule, under "How "none" is judged in this file", says "Words that stand nowhere in the source need a ruling." The entries:
  - `5,12c5`: "`status` is left out. The Frontmatter of the layout holds `name`, `description` and `metadata.version` only. Verdict: none, ADR 0043, Decision 2." and the same for `data_access_level`, `task_type` and `related_skills`. Four keys left out, none of them Version Info.
  - `237a123,203`: "The words `which starts from the user's request` are added to join them. Verdict: none, ADR 0043, Decision 2." The entry says the words are added and still gives Decision 2.
  - `49c45,48`: "Item 4 is the heading `## Reference Files` of block M22 as a sentence. Verdict: none, ADR 0043, Decision 2." The skill's line is "4. The reference pages, each read by the roles its row names."; "each read by the roles its row names" stands nowhere in the source and the entry does not say so. Item 3 opens "The plain request, matched on the Trigger Keywords.", where "The plain request, matched on" is added and not named either.
  - `43c34,37`, `72,208d80`, `306,374d476`, `395c508`: the headings `## Trigger Conditions`, `### Checkpoint Rules`, `## Phase-by-phase Invocation Contract (v3.9.2)`, `## Agent File References` with the column name `Definition File`, and `## Related Skills` "stand nowhere", each with Decision 2.
  - `397,402c510,518`: the column `#` with its seven numbers is left out, and "`(Checkpoint Rule #4)` became `(Rules, "IRON RULE: If the Devil's Advocate finds CRITICAL issues")`" with "`(Checkpoint Rule #6)`" likewise, each with Decision 2; the new reference words are not the source's.
  What is wrong: Decision 2 is given for words dropped and words added. Each is named in its entry except the two added clauses of `49c45,48`. Failure scenario: the user reads the summary's sentence "All 97 are in `SKILL.md`: the source's words carried into the layout's sections, a layout heading, a separator `---` removed, a blank line, or the section Version Info left out" and takes the 97 as moves with the same words, so he passes over four frontmatter keys dropped, five headings dropped, a table column dropped and three added clauses, none of which a ruling or an edit covers. Verdict: makes item 7 violated.

- 3. The page, `## SKILL.md`, "Blocks left out" (L1 to L17) and "Blocks added" (A1 to A14). What is wrong: the tables do not hold every word left out or added that the hunks give. Missing from "Blocks left out": the pointer of Phase 2.5 item 3, "(single-sourced under Layer 5 in deep-research/agents/socratic_mentor_agent.md <em dash> read the question text there)" (source lines 157 to 159, at `237a123,203`); "for Pipeline Stage 3'" of the re-review paragraph (source line 236; L9 names line 212 only); the headings `## Agent Team (7 Agents)`, `## Agent File References`, `## Related Skills`; the column `#` of Anti-Patterns; `Format` of `## Review Output Format`; `Hard Gate`; "keep pre-v3.6.2 behaviour until follow-up patch templates land". Missing from "Blocks added": "by a plain request," (`72,208d80`), `, "Sprint Contract Synthesizer Protocol"` (`262a258,436`), "have no contract and run without the two-call protocol", "which starts from the user's request", and the two references to `## Rules` in the Anti-patterns table. Each of these has its entry and verdict at its hunk, so the brief's item 8 holds there. Failure scenario: the user reads the table "Blocks left out" as the whole list of what the skill's `SKILL.md` lacks and concludes that 17 blocks are gone, and reads "Blocks added" as the whole list of new text. Verdict: none changed; item 8 holds at the hunks.

- 4. The page, `## SKILL.md`, hunk `287,288c458,459`: the block under "Source:" quotes one line, "deep-research --> academic-paper --> [integrity check] --> [...] --> finalize", and the skill's two lines. What is wrong: the source's second line, the labels line that opens "(research)       (writing)", is 193 characters (`sed -n '288p' $S/SKILL.md | awk '{print length($0)}'` prints 193) and is not quoted; the brief asks for a line of 200 characters or fewer in full. Failure scenario: the user cannot see from the page that the seven other labels are the source's and that only "(research)" was dropped; he has the page's sentence for it and no text. Verdict: makes item 2 violated in this hunk.

## 2. Proof

- none. Every command the builder's report quotes that I may run printed what the report says.

## 3. Standards

- none found in the parts read. The character-set check prints nothing and exits 0.

## 4. Behaviour

- none. `git diff 78cc139` prints nothing and `git status --short` shows the two files of the step; no file of the skill or of any other page changed.

## What I read

- `SKILL.md`: the source (430 lines) and the skill (534 lines, the json bodies of the two contracts not read line by line) read whole, then all 54 hunk entries and the three tables. Apart from Spec 1 to 4, each difference of each hunk is named and its verdict matches the diff. The 23 separators of block L17 add up over the hunks (source: 25 lines `---`, 2 of them the frontmatter; skill: 2).
- The 40 changes under "None, nothing allows it": each read at its hunk. All 40 verdicts are right: each is text that stands nowhere in the source and that no ruling's words name. The two outside `SKILL.md` are right: `Kong A1` dropped from the heading at `43c43` of `references/re_review_mode_protocol.md` while the body keeps "(Kong A1)", and `SR` dropped at `70,71c67,68` of `references/sprint_contract_protocol.md`.
- The 27 changes under "None, a ruling allows it": each read at its hunk and against the ruling's words in `plan.md`. The six of "Open item 2-call", the one of "Open item 2-questions" and the ten of "Open item 2-contracts" are allowed by their ruling's words (the six of the sprint contract page follow from the contracts standing in `SKILL.md`). Of the ten of "The three things the source does not state", eight are allowed; the two entries of re-review and guided are Spec 1.
- Files whose diff I read whole and compared hunk by hunk with the page: `SKILL.md`, `agents/eic_agent.md`, `agents/editorial_synthesizer_agent.md`, `agents/devils_advocate_reviewer_agent.md`, `agents/field_analyst_agent.md`, `references/sprint_contract_protocol.md`, `references/re_review_mode_protocol.md`, `references/calibration_mode_protocol.md`, `references/integration_guide.md`, `references/guided_mode_protocol.md`, `references/quality_rubrics.md`, `references/review_criteria_framework.md`, `references/editorial_decision_standards.md`, `references/review_quality_thinking.md`, `references/statistical_reporting_standards.md`, `references/top_journals_by_field.md`, `templates/editorial_decision_template.md`, `templates/peer_review_report_template.md`, `templates/revision_response_template.md`. That is 19 files, 274 of the 426 hunks. In the 18 files other than `SKILL.md` I found no difference an entry does not name and no verdict the diff contradicts.

## Declined to judge

- The non-shared entries of six files were not compared with their diff: `agents/domain_reviewer_agent.md`, `agents/methodology_reviewer_agent.md`, `agents/perspective_reviewer_agent.md`, `examples/hei_paper_review_example.md`, `examples/interdisciplinary_review_example.md`, `examples/subclaim_decomposition_example.md` (152 hunks). Their shared entries were checked by the span command; their per-file counts and hunk ids were checked by checks 2 and 3. The edit 3 entry of `examples/subclaim_decomposition_example.md`, `5c5`, was read in the summary only.
- Whether a sentence reworded after a version tag is removed is edit 4: the page gives edit 4 to "keep pre-v3.6.2 behaviour until follow-up patch templates land" becoming "have no contract and run without the two-call protocol" (`SKILL.md`, `262a258,436`), to `50c47`, `79,81c76,78` and `8c5` of the sprint contract page, to the "sprint contract status" paragraphs of three reference pages, and to `358c341` of the Devil's Advocate page, and edit 2 to "require a PR updating both" becoming "is added to both" (`122c119`). Each entry says the words were changed, and the builder's report lists the reading as a judgment call. The no-history rule can be read to cover them; it is the user's call.
- `SKILL.md`, `5,12c5`: `version: "1.10.0"` became `version: "1.0.0"` with edit 4. The entry names the new number; whether a new version value is "a version tag left out" is the user's call.
- Whether the source's `## Related Skills` table under `## Use instead` is "the section of the layout that holds its kind of text" (the layout gives that section a table with the columns When and Use): the user's call.
- Whether the two json contracts equal the files of the source's upstream repository: not read; that repository is not among the files of this step, and the page says so.
- Check 5 of the brief, the page read sentence by sentence against the prose standard: not done over 2408 lines. The departures the builder's report names match what I saw in the parts I read.
- The `[cut]` rule (a line of 200 characters or fewer quoted whole) was not checked mechanically across the page; one break was found by reading, Spec 4.
- `git diff --stat 6844dfd HEAD -- skills`, quoted in the builder's report: not rerun, since this review runs no git command beyond `git diff 78cc139`, `git status --short` and `git show 78cc139:<path>`.

Reviewer usage: a4244c99937ed072e, claude-fable-5-2, 276245 tokens, 28 tool uses, 5.8 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

Repair round 1 was sent to the builder with the four findings and was stopped on the user's word before it ended, since the user ruled on the differences the page found. The builder's unfinished changes to the page are not used; the page that lands is the one this review read.

- Spec 1 (the added steps of re-review and guided under a ruling's verdict): closed by the user's ruling "The parts the layout requires" (`plan.md`, Rulings): the steps of a mode, written from what the source says, are part of the copy, so the group these entries stand in no longer decides anything. The page's opening section names the ruling.
- Spec 2 (Decision 2 on words left out or added): closed by the same ruling for the frontmatter keys, the headings and the layout's parts, and named in the page's opening section.
- Spec 3 (the tables "Blocks left out" and "Blocks added" incomplete as lists): not changed. Each missing word has its entry and verdict at its hunk, as the review says, and the page's opening section says that the hunks, not the two tables, are the whole list.
- Spec 4 (the source's label line at `287,288c458,459` not quoted): no change needed. The page's entry of that hunk quotes both of the source's lines under "Source:", the label line among them (`sed -n '1118,1132p'` of the page).
- Declined to judge, the six files whose non-shared entries no reviewer compared with their diff (152 hunks): not done. The run over the round was to read them, and the round was stopped.

# Report: step 1b, the referee counts the points the paper has, and a second round reports on the first-round points

Everything in the brief is done.

## Open items of the state file

- none

## The cases' first read

Read on the unchanged pages at a7be82a, as a referee agent would follow them. No case came out wrong under the brief's own rules, so no hand-back was made.

| Case | What the unchanged pages give | Under the brief's rules |
|---|---|---|
| C1 | `agents/referee_agent.md`, "The selection", item 3 grades a point as major "when it bears on whether the paper's main claims hold", so all thirteen are major and item 5 selects seven. No found count exists. Not the expected result. | Item 2 gives three major and ten minor points; the found count says three. As expected. |
| C2 | Seven are selected. The other three are left-out comments with a one-clause reason; they are not shown as points, and no found count says ten. Not the expected result. | Items 1 and 5 give seven selected, three over the budget with a reason that names it, found count ten. As expected. |
| C3 | Nothing says a selection with no major point is complete, and item 3 makes every weakness that bears on a claim major. Not settled by the pages. | Item 3 makes it complete, and the report is written. As expected. |
| C4 | Item 2 merges "comments about the same weakness" and does not say what the same weakness is, so one point holding all twelve is allowed. Not the expected result. | Item 4 gives four points. As expected. |
| C5 | "The report" says "Keep within the length of the budget" and does not say the report may be far shorter. Not settled by the pages. | Item 6 gives about 500 words. As expected. |
| C6 | `references/second_round.md` item 4 has the EIC write "the new issues of the revision", and the referee lists each as a comment it may select. Nothing bounds the recommendation. Not the expected result. | Items 10 to 12 and 14 give no new point, four left-out comments, and accept or minor revision. As expected. |
| C7 | The new issue becomes a point whose Status line reads "a new point of the revision". Nothing asks it to name what the revision changed. Partly the expected result. | Items 10 and 15 give one new point, marked as new, naming what the revision changed. As expected. |
| C8 | The point is graded again by item 3 of "The selection", and nothing holds it at minor. Not settled by the pages. | Item 13 holds it at minor, or it is left out with a reason. As expected. |
| C9 | The point is not resolved in full, is selected, and is graded by item 3, which makes it major since it bears on a main claim. Not the expected result. | Item 13 makes it a minor point or a left-out comment. As expected. |
| C10 | The EIC's observation is a new issue, and item 2 of "The selection" lets the referee merge it into the first-round point. Not the expected result. | Items 8, 10 and 12 keep the point to what it asked and leave the observation out. As expected. |
| C11 | Two major points with a Status line. Their first-round numbers are not named. The recommendation is free. Partly the expected result. | Items 13 to 15 give two major points with their first-round numbers and a recommendation the referee judges. As expected. |

## DONE / NOT DONE

| Item | State | File and section |
|---|---|---|
| 1 | DONE | `agents/referee_agent.md`, "The selection", items 1 to 6 (list, merge, grade, found counts, rank, budget) and item 3 "The budget does not enter a grade"; `templates/selection_template.md`, "Points found", above "Budget" |
| 2 | DONE | `agents/referee_agent.md`, "The selection", item 3 and its five bullets; `templates/selection_template.md`, the line "Why it is major" |
| 3 | DONE | `agents/referee_agent.md`, "The budget", the opening paragraph and bullets 1 to 6 |
| 4 | DONE | `agents/referee_agent.md`, "The selection", item 2 with its four bullets, and item 10 |
| 5 | DONE | `agents/referee_agent.md`, "The budget", the last four bullets before the one on length, "The selection" items 7 to 9 and 11, "The user's changes" (the bullets on a point moved in from "Points over the budget"). A major point over the budget is written in full with a reason that names the budget; a minor one in one line under the heading "Minor points over the budget", by the ruling of repair round 1; `templates/selection_template.md`, "Points over the budget" and the count line |
| 6 | DONE | `agents/referee_agent.md`, "The report" ("Make the report as long as its points need ...") and "The budget", last bullet |
| 7 | DONE | `SKILL.md`, "first round" item 1 (the bullet after the budget question), item 5 Done line, item 6, the Stops row "The selection", the first row of Anti-patterns. The description is unchanged at 882 characters |
| 8 | DONE | `references/second_round.md`, the opening paragraph, and "The selection and the report", the bullets on a remaining first-round point |
| 9 | DONE | `references/second_round.md`, "The check of the revision", item 4 (the status bullets, the two bullets on what the revision did and what is still missing, the Done line) |
| 10 | DONE | `references/second_round.md`, "New points" |
| 11 | DONE | `references/second_round.md`, "The check of the revision", item 4 (the three bullets after "New Issue Detection") and its Done line |
| 12 | DONE | `references/second_round.md`, "New points", the last bullet with its five sub-bullets; "The selection and the report", the bullets on a reviewer's comment |
| 13 | DONE | `references/second_round.md`, "The selection and the report", the bullets from "The referee grades a remaining first-round point ..." to "A change the user makes ..." |
| 14 | DONE | `references/second_round.md`, "The recommendation"; `agents/referee_agent.md`, "The report", the bullet that names it |
| 15 | DONE | `agents/referee_agent.md`, "The report", the bullets that begin "In a second round"; `templates/referee_report_template.md`, the second block; `templates/selection_template.md`, the lines "First-round point", "Still missing", "What the revision added or changed" and the section "Points over the budget" |
| 16 | DONE | `SKILL.md` changed only at the places of item 7; `metadata.version` is "1.0.0". The sentences about a file or a round as a whole are listed under "Names and whole-file sentences" |

Check 1, the ASCII check over the six paths, run from the worktree's root:

```
(no output; exit status 0)
```

Check 2, `sed -n 5p skills/academic/referee/SKILL.md`:

```
  version: "1.0.0"
```

Check 3, the new and changed items read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, section E, sentence length. The departures, each with why it keeps its form:

- `agents/referee_agent.md`, "The selection", item 3, first bullet (24 words) and second bullet: each states its test whole, the second with the list of what is minor.
- `agents/referee_agent.md`, "The selection", item 5: three sentences as on the unchanged page, with the ranking now made per grade.
- `agents/referee_agent.md`, "The selection", item 6: two sentences, the second being the line the item fills once the budget is applied.
- `agents/referee_agent.md`, "The selection", item 10: two sentences, the second saying what a left-out comment is.
- `agents/referee_agent.md`, "The budget", the bullet on the reason of a cut major point (23 words): it carries the example reason.
- `agents/referee_agent.md`, "The report", the bullet on length: two sentences, the second a qualifier of the first.
- `agents/referee_agent.md`, "The report", the bullet on a new point (23 words): where it stands, how it is marked and what it names are one instruction for one point.
- `references/second_round.md`, "New points", the condition "Introduced by the revision" (29 words): its two ways of holding are one condition.
- `references/second_round.md`, "New points", the bullet "An observation is a left-out comment ..." (28 words): both tests are the condition of the rule.
- `references/second_round.md`, "The selection and the report", the bullet on where the referee reads what a point asked (23 words), the bullet on where every comment stands and the bullet on the Status line: each lists its sources or its values.
- `references/second_round.md`, "The recommendation", the third and fourth bullets (27 and 23 words): each states its condition whole.
- `SKILL.md`, "first round", item 5 Done line and item 6 (24 words each) and the Stops row "The selection": each lists what exists or what the stop shows.

## The terms

- **round, of a referee review**: used in the new sentences of all five files as its entry defines it, the first round on the submitted manuscript and the second round on the revision with the response.
- **stop**: "the selection stop" is the row "The selection" of the skill's Stops table, the second sense of the entry.
- **session, the**: `references/second_round.md` item 4 says "in the session's own words", the session that runs the skill, as the entry has it.
- **refusal**: unchanged uses only.
- The new sentences use none of the glossary terms "finding", "case", "place", "part", "gate", "kind", "step", "ruling" and "verdict" in another sense: `grep -n -i -w case` over `references/second_round.md` and `agents/referee_agent.md` prints nothing. "Found counts" is the verb, and "resolved in part" stood on the tree.

## The files with line counts

`wc -l` after the change:

```
     138 skills/academic/referee/SKILL.md
     104 skills/academic/referee/agents/referee_agent.md
     110 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      95 skills/academic/referee/templates/selection_template.md
     505 total
```

## Names and whole-file sentences

Each name the change adds, with `grep -rn` over `skills/`, `utils/`, `docs/` and `README.md`. Every hit is inside `skills/academic/referee/`.

```
$ grep -rn -- '"The budget"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:99:- "The budget" of `agents/referee_agent.md` holds for those points as in a first round.
skills/academic/referee/agents/referee_agent.md:36:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/SKILL.md:60:   - Say in the question that each number of the budget is a ceiling, as `agents/referee_agent.md`, "The budget", says.
skills/academic/referee/SKILL.md:82:   - Done when `selection.md` and `left-out.md` stand in the run folder, and `selection.md` holds the found counts and a selection as  ...
skills/academic/referee/SKILL.md:122:| Carrying every comment of the panel into the report | A report with too many points hides the ones the editor must act on | Select  ...
$ grep -rn -- 'Points found' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:34:4. Write the found counts in the section "Points found" of `selection.md`: how many major points and how many minor poi ...
skills/academic/referee/agents/referee_agent.md:36:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/agents/referee_agent.md:73:- The two found counts of the section "Points found" stay as you wrote them at the selection.
skills/academic/referee/templates/selection_template.md:14:## Points found
$ grep -rn -- 'Points over the budget' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:39:9. Write each point over the budget in the section "Points over the budget" of `selection.md`.
skills/academic/referee/agents/referee_agent.md:44:11. Write `left-out.md` with the sections "Points over the budget" and "Left-out comments" of `selection.md`, as they s ...
skills/academic/referee/agents/referee_agent.md:69:- A major point the user moves in from the section "Points over the budget" becomes a selected point as it stands there ...
skills/academic/referee/agents/referee_agent.md:74:- The line "Cut by the budget" of that section is rewritten to count what the section "Points over the budget" then hol ...
skills/academic/referee/templates/selection_template.md:3:The referee fills this template as `selection.md` at the selection. Text in `[brackets]` is replaced. The sectio ...
skills/academic/referee/templates/selection_template.md:5:- The section "Points over the budget" keeps its two headings in every run.
skills/academic/referee/templates/selection_template.md:59:## Points over the budget
$ grep -rn -- 'Major points over the budget' skills/ utils/ docs/ README.md
skills/academic/referee/templates/selection_template.md:61:### Major points over the budget
$ grep -rn -- 'Minor points over the budget' skills/ utils/ docs/ README.md
skills/academic/referee/templates/selection_template.md:76:### Minor points over the budget
$ grep -rn -- 'New points' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:3:A second round reviews a revision against the authors' response letter: how the authors answered each first-round poi ...
skills/academic/referee/references/second_round.md:29:   - Tell it the two conditions of "New points", in the session's own words.
skills/academic/referee/references/second_round.md:53:## New points
skills/academic/referee/references/second_round.md:86:- Text there that goes beyond what the point asked is an observation under "New points".
skills/academic/referee/references/second_round.md:90:- The referee applies "New points" to each entry of the new issues and to each reviewer's comment, whatever `revisio ...
skills/academic/referee/references/second_round.md:95:- Where the revision made a first-round point worse to the degree of "New points", the added defect is a new point.
skills/academic/referee/agents/referee_agent.md:14:- In a second round: `references/second_round.md`, whose sections "New points", "The selection and the report" and "The ...
$ grep -rn -- 'Introduced by the revision' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:58:  - **Introduced by the revision.** The defect stands in material the revision added or changed, or the revision mad ...
$ grep -rn -- 'A main claim fails' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:59:  - **A main claim fails.** The defect by itself makes a main claim of the revised paper fail, or impossible to judg ...
skills/academic/referee/references/second_round.md:61:- A new point is a major point: the condition "A main claim fails" is the test of `agents/referee_agent.md`, "The se ...
$ grep -rn -- '"The recommendation"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:14:- In a second round: `references/second_round.md`, whose sections "New points", "The selection and the report" and "The ...
skills/academic/referee/agents/referee_agent.md:101:- In a second round, choose the recommendation as `references/second_round.md`, "The recommendation", says.
$ grep -rn -- 'Other observations' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:32:   - It writes everything else it notices under a heading "Other observations" of `revision-check.md`, each with its ...
skills/academic/referee/references/second_round.md:65:  - An entry of "Other observations" of `revision-check.md` is such an observation.
$ grep -rn -- 'Still missing' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:88:- What is still missing of a remaining first-round point stands in its line "Still missing".
skills/academic/referee/templates/selection_template.md:8:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
skills/academic/referee/templates/selection_template.md:40:- Still missing: [a remaining first-round point only: what the first-round point asked that the revision does n ...
skills/academic/referee/templates/selection_template.md:55:- Still missing: [as above]
skills/academic/referee/templates/selection_template.md:71:- Still missing: [as above]
$ grep -rn -- 'First-round point"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:87:- A remaining first-round point keeps its first-round number and title, written in its line "First-round point".
skills/academic/referee/templates/selection_template.md:8:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
$ grep -rn -- 'What the revision added or changed' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:60:- Each new point names what the revision added or changed, in its line "What the revision added or changed" of `sele ...
skills/academic/referee/templates/referee_report_template.md:51:2. [New in the revision: the point, tied to its passage. What the revision added or changed, why a main cl ...
skills/academic/referee/templates/selection_template.md:8:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
skills/academic/referee/templates/selection_template.md:41:- What the revision added or changed: [a new point only: the material of the revision the defect stands in]
skills/academic/referee/templates/selection_template.md:72:- What the revision added or changed: [as above]
$ grep -rn -- 'found counts' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:98:- The found counts count the remaining first-round points and the new points.
skills/academic/referee/agents/referee_agent.md:34:4. Write the found counts in the section "Points found" of `selection.md`: how many major points and how many minor poi ...
skills/academic/referee/agents/referee_agent.md:73:- The two found counts of the section "Points found" stay as you wrote them at the selection.
skills/academic/referee/SKILL.md:82:   - Done when `selection.md` and `left-out.md` stand in the run folder, and `selection.md` holds the found counts and a selection as  ...
skills/academic/referee/SKILL.md:83:6. Show the user the found counts beside the budget, the selected points, the points over the budget and the left-out comments with th ...
skills/academic/referee/SKILL.md:113:| The selection | After the referee's selection, before the report is written (first round item 6) | The found counts beside the budg ...
$ grep -rn -- 'remaining first-round point' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:81:- A first-round point with any other status is a remaining first-round point.
skills/academic/referee/references/second_round.md:82:- The points of the selection are the remaining first-round points and the new points.
skills/academic/referee/references/second_round.md:83:- A remaining first-round point holds only what the first-round point asked and what of it is still missing.
skills/academic/referee/references/second_round.md:87:- A remaining first-round point keeps its first-round number and title, written in its line "First-round point".
skills/academic/referee/references/second_round.md:88:- What is still missing of a remaining first-round point stands in its line "Still missing".
skills/academic/referee/references/second_round.md:91:- The referee grades a remaining first-round point on what is still missing, by `agents/referee_agent.md`, "The sele ...
skills/academic/referee/references/second_round.md:98:- The found counts count the remaining first-round points and the new points.
skills/academic/referee/agents/referee_agent.md:95:- In a second round, put the remaining first-round points first under the major points and under the minor points.
skills/academic/referee/agents/referee_agent.md:96:- In a second round, each remaining first-round point names its first-round number and what is still missing.
skills/academic/referee/agents/referee_agent.md:97:- In a second round, put any new point after the remaining first-round points, marked as new, with what the revision ad ...
skills/academic/referee/templates/referee_report_template.md:48:[The remaining first-round points first, then any new point, or "None."]
skills/academic/referee/templates/referee_report_template.md:55:[The remaining first-round points, or "None."]
skills/academic/referee/templates/selection_template.md:39:- First-round point: [a remaining first-round point only: its first-round number and title]
skills/academic/referee/templates/selection_template.md:40:- Still missing: [a remaining first-round point only: what the first-round point asked that the revision does n ...
$ grep -rn -- 'Cut by the budget' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:36:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/agents/referee_agent.md:74:- The line "Cut by the budget" of that section is rewritten to count what the section "Points over the budget" then hol ...
skills/academic/referee/templates/selection_template.md:18:- Cut by the budget: [n] major points, [n] minor points
```

Sentences about a changed file or a round as a whole, reread after the change:

- `SKILL.md` description, "select the comments worth sending within a budget of major points, minor points and words" and "A second round checks a revision against the authors' response letter": both hold, and are unchanged.
- `SKILL.md`, the introduction, "It leaves behind `referee-report.md`, `selection.md` and `left-out.md`": holds, the file names are unchanged.
- `SKILL.md`, Stops, "The first four rows wait for the user ...": holds, no row was added.
- `SKILL.md`, Rules, "A second round also holds `revision-check.md`, the EIC's check of the revision": holds.
- `agents/referee_agent.md`, Role, "You choose which of their comments are worth sending, and then you write the one report": holds.
- `agents/referee_agent.md`, "What you are given", the second-round bullet: changed to name the three sections of `references/second_round.md` that add to the calls.
- `agents/referee_agent.md`, "The selection", closing paragraph, "every comment of every report is listed once": changed to name the three lists of a first round.
- `references/second_round.md`, the opening paragraph: changed to say what a second round is for.
- `references/second_round.md`, "Every listed comment stands once ...": changed from "one of the three lists" to the four lists.
- `templates/selection_template.md`, the introduction: changed, it now names both sections written to `left-out.md` and which sections and lines stand only in a second round.
- `templates/referee_report_template.md`, the introduction: changed, it now names the two blocks.
- `README.md` line 30: its sentence "which you move between the two lists" is false after the change, since the stop shows three lists. `README.md` is outside the step's paths; the replacement is under "Doc text".
- `docs/glossary.md` (**referee review**, **round, of a referee review**) and `docs/figures/gen_figures.py`, `referee()`: reread, each still holds, none changed. The label "You confirm the selection or move comments" holds.

## Judgment calls the brief left open

1. The ceiling rules stand in a new section "The budget" of `agents/referee_agent.md`, so that `SKILL.md` and `references/second_round.md` name one section.
2. `left-out.md` now holds the section "Points over the budget" beside "Left-out comments", so the cut points stay with the user after the run. Before, it held "Left-out comments" only.
3. A comment that names no weakness (praise, a matter of taste, a remark its passage does not bear out) becomes no point at the merge and is a left-out comment. The found counts therefore count weaknesses only. The example reason "outside the direction" was dropped, since the direction weights the ranking and leaves nothing out; "minor against the budget" was dropped, since such a point now stands in "Points over the budget".
4. The ranking is made per grade (major points among themselves, minor points among themselves), which the cut of the lowest-ranked points of a grade needs.
5. A point over the budget keeps the number its ranking gives it (M8 after M1 to M7), and each of the two headings of the section "Points over the budget" reads "None." when nothing of its grade was cut.
6. `references/second_round.md` says a new point is a major point, since the condition "A main claim fails" is the test of a major point.
7. Where the revision made a first-round point worse to the degree of the test, the added defect is a new point and the first-round point keeps its own grade. This is how item 10 and item 13 hold together.
8. The referee applies the two conditions itself to each new issue of the EIC and to each reviewer comment, so the test does not rest on the EIC alone.
9. In the recommendation, a first-round major point left out as small counts with "resolved" and "a minor point" toward accept or minor revision, since item 13 allows that outcome for a small remainder.
10. The recommendation reads the confirmed `selection.md`, so a change the user made at the selection stop counts.
11. The description of `SKILL.md` is unchanged: its words on the budget and on the second round stay true.
12. The Anti-patterns table got no new row; the first row's "Do instead" cell now names "The budget".
13. The templates show "None." under an empty heading of major or minor points, so a selection or a report with no major point has a stated form.
14. The second-round report form opens the general comments with the revision, in place of the summary of the paper a first round opens with.

## User-visible changes

| Where | Before | After |
|---|---|---|
| The intake's budget question | The most major points, the most minor points, the length | The same question and defaults, and it says each number is a ceiling |
| The grade of a point | Major when it bears on whether the main claims hold | Major only when a main claim fails or cannot be judged unless the point is settled; otherwise minor |
| `selection.md` | Budget, Selected points, Left-out comments, First-round points resolved, Count | Adds "Points found" (major, minor, cut by the budget) and "Points over the budget"; the count line adds "Under a point over the budget" |
| `left-out.md` | The left-out comments | The points over the budget and the left-out comments |
| The stop "The selection" | Selected points, left-out comments, and the resolved first-round points in a second round | Also the found counts beside the budget and the points over the budget, which the user may move in |
| The direction of the intake | A comment could be left out as "outside the direction" or "minor against the budget" | Every comment that names a weakness is a counted point. The direction weights the ranking, and a point the budget does not take stands under "Points over the budget". The left-out comments are the comments that name no weakness |
| A point over the budget in `selection.md` | No such entry | A major point in full, with why it is major and a reason that names the budget; a minor point in one line, its title and its merged comments, its passage read only when the user moves it in |
| An empty heading of `referee-report.md` | No form given | "None." under "Major points" or "Minor points" when the selection has none |
| The length of the report | "Keep within the length of the budget" | As long as its points need; the budget and the journal's limit are ceilings |
| `revision-check.md` | A status per first-round point and the new issues of the revision | Per first-round point its number, title, first-round grade, what it asked, its status, what the revision did and what is still missing; the new issues that meet both conditions; and "Other observations" |
| A second-round selection | Any new issue or reviewer comment could become or join a point | The points are the remaining first-round points, each with its first-round number and what is still missing, and a new point only under the two conditions; every other observation is left out |
| A second-round grade | Graded as in a first round | Never above the first-round grade; a small remainder is minor or left out |
| A second-round recommendation | The referee's choice | Accept or minor revision when no new point stands and no first-round major point remains as a major point; otherwise the referee's judgment |
| A second-round report | The first-round form, with the resolved points named in the general comments | General comments open with what the revision changed and resolved; remaining first-round points with their numbers, then any new point marked as new |

## Anything in the brief that was wrong or impossible

Nothing. One reading is stated here since the brief's words allow two: item 9 says the EIC's part "exists on the tree; keep it". The tree had the statuses; the sentences that each point says what the revision and the response did for it, and what is still missing, were not written there and are added.

## Repair round 1

Every one of the ten findings is done.

1. Spec 1.1. `references/second_round.md`, "The check of the revision", item 4: the EIC writes for each first-round point its first-round number and title, its first-round grade or that it carries none, and what it asked in one sentence, beside the status, what the revision and the response did and what is still missing. Two new bullets limit "what is still missing" to what the point asked and send anything else to the new issues or the other observations. "The selection and the report", item 6: the referee is given the response letter, and the first-round comments when the call gave them. The referee's bullets there say where it reads what a point asked, that it holds the "still missing" text against that, that text beyond it is an observation under "New points", and that `revision-check.md` gives the first-round grade.
2. Proof 2.1 and Standards 3.4. Each bullet quoted under 3.4 is one bullet per rule in `references/second_round.md`, "The selection and the report". The two conditions of "New points" are a bulleted set with the labels "Introduced by the revision" and "A main claim fails". Each sentence listed under 2.1 is shortened or split: `agents/referee_agent.md`, "The selection", item 2 (first and third bullets), items 9 and 10; "The budget", first bullet; "The user's changes", the bullets on a point moved in; "The report", the second-round bullets; `references/second_round.md`, item 4 (the two "Tell it" bullets and the Done line), the bullets of "The selection and the report", "The recommendation"; `templates/referee_report_template.md`, the second paragraph and the sentence before the second block; `templates/selection_template.md`, the introduction's bullets. The sentences that keep their length are listed, each with why, under check 3 above, which this round rewrote in place.
3. Proof 2.2. `references/second_round.md`, "The recommendation", last bullet reads "Otherwise the value is the referee's judgment."
4. Standards 3.1. Not written by the builder, as ruled; the line and its replacement are under "Doc text".
5. Standards 3.2. `references/second_round.md`: the test of a new point is stated in "New points", and "The selection and the report" says the referee applies "New points" to each new issue and each reviewer's comment; "never merged into a first-round point" stands in "New points" only; that a new point names what the revision added or changed, with its line of `selection.md`, stands in "New points" only; that a remaining first-round point keeps its first-round number and title, with its line, stands in "The selection and the report" only.
6. Standards 3.3. `references/second_round.md`, "New points": the bullet reads "An observation is a left-out comment with its reason when it is not about what is still missing of a first-round point and does not meet both conditions.", and the sub-bullet on the five reviewers holds their comments to the same two tests.
7. Standards 3.5. `templates/selection_template.md`, "Major points over the budget": the entry carries "Why it is major". `agents/referee_agent.md`, "The selection", item 9, first bullet, lists it.
8. Standards 3.6. `agents/referee_agent.md`, "The user's changes": the two found counts stay as written at the selection, and the line "Cut by the budget" is rewritten to count what the section "Points over the budget" then holds.
9. Behaviour 4.1. The found counts still count every weakness. `agents/referee_agent.md`, "The selection", item 7 ties only the selected points and the major points over the budget to a passage; item 9 writes a major point over the budget in full and a minor one in one line, and reads the passage of the minor one only when the user moves it in; "The user's changes" has the bullets for a minor point moved in. `templates/selection_template.md`, "Points over the budget", has the headings "Major points over the budget" and "Minor points over the budget". The direction still weights the ranking (item 5, unchanged). Both changes are rows of the table of user-visible changes.
10. Behaviour 4.2. Kept; the row "An empty heading of `referee-report.md`" is in the table of user-visible changes.

Lines of the report above corrected in place: check 3 (the list of departures), "The terms" (the last bullet), the line counts, the grep block (four names added), the bullet on `README.md` line 30, rows 3 and 5 of the DONE table, judgment call 5, and the table of user-visible changes (three rows added, the row of `revision-check.md` rewritten).

Checks after the round, run from the worktree's root. Check 1, the ASCII check over the six paths:

```
(no output; exit status 0)
```

Check 2, `sed -n 5p skills/academic/referee/SKILL.md`:

```
  version: "1.0.0"
```

`wc -l`:

```
     138 skills/academic/referee/SKILL.md
     104 skills/academic/referee/agents/referee_agent.md
     110 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      95 skills/academic/referee/templates/selection_template.md
     505 total
```

`python3 -c 'import yaml; ...'` over the description of `SKILL.md` prints 882.

## Doc text

`README.md` is outside the step's paths. The current line, as `grep -n 'two lists' README.md` prints it, is line 30, the row of `referee` in the table of skills. The sentence in it to replace:

```
30: ... A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments, which you move between the two lists. ...
```

Its replacement, the rest of the line unchanged:

```
A referee agent counts the major and the minor points the paper has, selects at most the budget of them, and shows you the selected points, the points over the budget and the left-out comments, which you move between the lists.
```

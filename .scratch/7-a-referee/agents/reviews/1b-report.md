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
| 3 | DONE | `agents/referee_agent.md`, "The budget", the opening paragraph and bullets 1 to 5 |
| 4 | DONE | `agents/referee_agent.md`, "The selection", item 2 with its three bullets, and item 10 |
| 5 | DONE | `agents/referee_agent.md`, "The budget", bullets 6 to 8, "The selection" items 7 to 9 and 11, "The user's changes" (the bullet on a point moved in from "Points over the budget"); `templates/selection_template.md`, "Points over the budget" and the count line |
| 6 | DONE | `agents/referee_agent.md`, "The report" ("Make the report as long as its points need ...") and "The budget", last bullet |
| 7 | DONE | `SKILL.md`, "first round" item 1 (the bullet after the budget question), item 5 Done line, item 6, the Stops row "The selection", the first row of Anti-patterns. The description is unchanged at 882 characters |
| 8 | DONE | `references/second_round.md`, the opening paragraph, and "The selection and the report", the bullets on a remaining first-round point |
| 9 | DONE | `references/second_round.md`, "The check of the revision", item 4 (the status bullets, the two bullets on what the revision did and what is still missing, the Done line) |
| 10 | DONE | `references/second_round.md`, "New points" |
| 11 | DONE | `references/second_round.md`, "The check of the revision", item 4 (the three bullets after "New Issue Detection") and its Done line |
| 12 | DONE | `references/second_round.md`, "New points", the last bullet with its three sub-bullets; "The selection and the report", the bullets on a reviewer's comment |
| 13 | DONE | `references/second_round.md`, "The selection and the report", the bullets from "The referee grades a remaining first-round point ..." to "A change the user makes ..." |
| 14 | DONE | `references/second_round.md`, "The recommendation"; `agents/referee_agent.md`, "The report", the bullet that names it |
| 15 | DONE | `agents/referee_agent.md`, "The report", the three bullets that begin "In a second round"; `templates/referee_report_template.md`, the second block; `templates/selection_template.md`, the lines "First-round point", "Still missing", "What the revision added or changed" and the section "Points over the budget" |
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

- `agents/referee_agent.md`, "The selection", item 2, third bullet, and item 10: over 20 words, since each lists the kinds of comment that become no point.
- `agents/referee_agent.md`, "The selection", item 3, second bullet: over 20 words, since the list of what is minor is the rule.
- `agents/referee_agent.md`, "The selection", item 5: three sentences as on the unchanged page, with the ranking now made per grade.
- `agents/referee_agent.md`, "The selection", item 6: two sentences, the second being the line the item fills once the budget is applied.
- `agents/referee_agent.md`, "The report", the bullet on length: two sentences, the second a qualifier of the first.
- `references/second_round.md`, "New points", condition 1 and the bullet "Every observation ...": over 20 words and, for the bullet, two sentences, since the conditions and the two things the observation never becomes are qualifiers of one rule.
- `references/second_round.md`, "The selection and the report", the bullets on the grade, on the points read from the response letter, on a point made worse and on where every comment stands: over 20 words, since each names the section or the condition it applies under.
- `references/second_round.md`, "The recommendation", second bullet: over 20 words, since it states the condition whole.
- `SKILL.md`, the Stops row "The selection": one long cell, since it lists what the stop shows.

## The terms

- **round, of a referee review**: used in the new sentences of all five files as its entry defines it, the first round on the submitted manuscript and the second round on the revision with the response.
- **stop**: "the selection stop" is the row "The selection" of the skill's Stops table, the second sense of the entry.
- **session, the**: `references/second_round.md` item 4 says "in the session's own words", the session that runs the skill, as the entry has it.
- **refusal**: unchanged uses only.
- The new sentences avoid the glossary terms "finding", "case", "place", "part", "gate", "kind", "step", "ruling" and "verdict" in any other sense. "Found counts" is the verb, and "resolved in part" stood on the tree.

## The files with line counts

`wc -l` after the change:

```
     138 skills/academic/referee/SKILL.md
      94 skills/academic/referee/agents/referee_agent.md
      92 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      88 skills/academic/referee/templates/selection_template.md
     470 total
```

## Names and whole-file sentences

Each name the change adds, with `grep -rn` over `skills/`, `utils/`, `docs/` and `README.md`. Every hit is inside `skills/academic/referee/`.

```
$ grep -rn -- '"The budget"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:81:- The found counts count the remaining first-round points and the new points, and "The budget" of `agents/referee_ag ...
skills/academic/referee/agents/referee_agent.md:35:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/SKILL.md:60:   - Say in the question that each number of the budget is a ceiling, as `agents/referee_agent.md`, "The budget", says.
skills/academic/referee/SKILL.md:82:   - Done when `selection.md` and `left-out.md` stand in the run folder, and `selection.md` holds the found counts and a selection as  ...
skills/academic/referee/SKILL.md:122:| Carrying every comment of the panel into the report | A report with too many points hides the ones the editor must act on | Select  ...
$ grep -rn -- 'Points found' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:33:4. Write the found counts in the section "Points found" of `selection.md`: how many major points and how many minor poi ...
skills/academic/referee/agents/referee_agent.md:35:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/agents/referee_agent.md:66:- The section "Points found" keeps the found counts as you wrote them at the selection.
skills/academic/referee/templates/selection_template.md:13:## Points found
$ grep -rn -- 'Points over the budget' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:38:9. Write each point over the budget in the section "Points over the budget" of `selection.md`, with its grade, its pass ...
skills/academic/referee/agents/referee_agent.md:40:11. Write `left-out.md` with the sections "Points over the budget" and "Left-out comments" of `selection.md`, as they s ...
skills/academic/referee/agents/referee_agent.md:64:- A point the user moves in from the section "Points over the budget" becomes a selected point, with its grade, its pas ...
skills/academic/referee/templates/selection_template.md:3:The referee fills this template as `selection.md` at the selection. Text in `[brackets]` is replaced. The sectio ...
skills/academic/referee/templates/selection_template.md:5:- The section "Points over the budget" keeps its heading in every run, and reads "None." when the budget cut no  ...
skills/academic/referee/templates/selection_template.md:58:## Points over the budget
$ grep -rn -- 'New points' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:3:A second round reviews a revision against the authors' response letter: how the authors answered each first-round poi ...
skills/academic/referee/references/second_round.md:29:   - Tell it the two conditions of "New points" in the session's own words, and that they narrow what "New Issue Det ...
skills/academic/referee/references/second_round.md:46:## New points
skills/academic/referee/references/second_round.md:75:- An entry of the new issues, or a reviewer's comment, becomes a new point only when the referee finds that it meets ...
skills/academic/referee/references/second_round.md:79:- Where the revision made a first-round point worse to the degree of "New points", the defect the revision added is  ...
skills/academic/referee/agents/referee_agent.md:14:- In a second round: `references/second_round.md`, whose sections "New points", "The selection and the report" and "The ...
$ grep -rn -- '"The recommendation"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:14:- In a second round: `references/second_round.md`, whose sections "New points", "The selection and the report" and "The ...
skills/academic/referee/agents/referee_agent.md:91:- In a second round, choose the recommendation as `references/second_round.md`, "The recommendation", says.
$ grep -rn -- 'Other observations' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:31:   - It writes everything else it notices under a heading "Other observations" of `revision-check.md`, each with its ...
skills/academic/referee/references/second_round.md:56:  - An entry of "Other observations" of `revision-check.md` is such an observation.
$ grep -rn -- 'Still missing' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:84:- Each remaining first-round point says, in its line "First-round point", its first-round number and title, and in i ...
skills/academic/referee/templates/selection_template.md:7:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
skills/academic/referee/templates/selection_template.md:39:- Still missing: [a remaining first-round point only: what the first-round point asked that the revision does n ...
skills/academic/referee/templates/selection_template.md:54:- Still missing: [as above]
skills/academic/referee/templates/selection_template.md:68:- Still missing: [as above]
$ grep -rn -- 'First-round point"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:84:- Each remaining first-round point says, in its line "First-round point", its first-round number and title, and in i ...
skills/academic/referee/templates/selection_template.md:7:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
$ grep -rn -- 'What the revision added or changed' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:85:- Each new point says, in its line "What the revision added or changed", the material of the revision the defect sta ...
skills/academic/referee/templates/referee_report_template.md:51:2. [New in the revision: the point, tied to its passage. What the revision added or changed, why a main cl ...
skills/academic/referee/templates/selection_template.md:7:- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in  ...
skills/academic/referee/templates/selection_template.md:40:- What the revision added or changed: [a new point only: the material of the revision the defect stands in]
skills/academic/referee/templates/selection_template.md:69:- What the revision added or changed: [as above]
$ grep -rn -- 'found counts' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:81:- The found counts count the remaining first-round points and the new points, and "The budget" of `agents/referee_ag ...
skills/academic/referee/agents/referee_agent.md:33:4. Write the found counts in the section "Points found" of `selection.md`: how many major points and how many minor poi ...
skills/academic/referee/agents/referee_agent.md:66:- The section "Points found" keeps the found counts as you wrote them at the selection.
skills/academic/referee/SKILL.md:82:   - Done when `selection.md` and `left-out.md` stand in the run folder, and `selection.md` holds the found counts and a selection as  ...
skills/academic/referee/SKILL.md:83:6. Show the user the found counts beside the budget, the selected points, the points over the budget and the left-out comments with th ...
skills/academic/referee/SKILL.md:113:| The selection | After the referee's selection, before the report is written (first round item 6) | The found counts beside the budg ...
$ grep -rn -- 'remaining first-round point' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:71:- A first-round point with any other status is a remaining first-round point, and the points of the selection are th ...
skills/academic/referee/references/second_round.md:72:- A remaining first-round point holds only what the first-round point asked and what of it is still missing.
skills/academic/referee/references/second_round.md:73:- A remaining first-round point keeps its first-round number and its first-round title, and no other observation is  ...
skills/academic/referee/references/second_round.md:76:- The referee grades a remaining first-round point on what is still missing, by `agents/referee_agent.md`, "The sele ...
skills/academic/referee/references/second_round.md:81:- The found counts count the remaining first-round points and the new points, and "The budget" of `agents/referee_ag ...
skills/academic/referee/references/second_round.md:84:- Each remaining first-round point says, in its line "First-round point", its first-round number and title, and in i ...
skills/academic/referee/agents/referee_agent.md:86:- In a second round, put the remaining first-round points first under the major points and under the minor points, each ...
skills/academic/referee/agents/referee_agent.md:87:- In a second round, put any new point after the remaining first-round points, marked as new, with what the revision ad ...
skills/academic/referee/templates/referee_report_template.md:48:[The remaining first-round points first, then any new point, or "None."]
skills/academic/referee/templates/referee_report_template.md:55:[The remaining first-round points, or "None."]
skills/academic/referee/templates/selection_template.md:38:- First-round point: [a remaining first-round point only: its first-round number and title]
skills/academic/referee/templates/selection_template.md:39:- Still missing: [a remaining first-round point only: what the first-round point asked that the revision does n ...
$ grep -rn -- 'Cut by the budget' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:35:6. Take up the budget of `intake.md`, as "The budget" says: select the points within it and cut the points over it. The ...
skills/academic/referee/templates/selection_template.md:17:- Cut by the budget: [n] major points, [n] minor points
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
- `README.md` line 30, `docs/glossary.md` (**referee review**, **round, of a referee review**) and `docs/figures/gen_figures.py`, `referee()`: reread, each still holds, none changed. The label "You confirm the selection or move comments" holds.

## Judgment calls the brief left open

1. The ceiling rules stand in a new section "The budget" of `agents/referee_agent.md`, so that `SKILL.md` and `references/second_round.md` name one section.
2. `left-out.md` now holds the section "Points over the budget" beside "Left-out comments", so the cut points stay with the user after the run. Before, it held "Left-out comments" only.
3. A comment that names no weakness (praise, a matter of taste, a remark its passage does not bear out) becomes no point at the merge and is a left-out comment. The found counts therefore count weaknesses only. The example reason "outside the direction" was dropped, since the direction weights the ranking and leaves nothing out; "minor against the budget" was dropped, since such a point now stands in "Points over the budget".
4. The ranking is made per grade (major points among themselves, minor points among themselves), which the cut of the lowest-ranked points of a grade needs.
5. A point over the budget keeps the number its ranking gives it (M8 after M1 to M7), and the section "Points over the budget" reads "None." when nothing was cut.
6. `references/second_round.md` says a new point is a major point, since condition 2 of its test is the test of a major point.
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
| The length of the report | "Keep within the length of the budget" | As long as its points need; the budget and the journal's limit are ceilings |
| `revision-check.md` | A status per first-round point and the new issues of the revision | A status per first-round point with what the revision did and what is still missing, the new issues that meet both conditions, and "Other observations" |
| A second-round selection | Any new issue or reviewer comment could become or join a point | The points are the remaining first-round points, each with its first-round number and what is still missing, and a new point only under the two conditions; every other observation is left out |
| A second-round grade | Graded as in a first round | Never above the first-round grade; a small remainder is minor or left out |
| A second-round recommendation | The referee's choice | Accept or minor revision when no new point stands and no first-round major point remains as a major point; otherwise the referee's judgment |
| A second-round report | The first-round form, with the resolved points named in the general comments | General comments open with what the revision changed and resolved; remaining first-round points with their numbers, then any new point marked as new |

## Anything in the brief that was wrong or impossible

Nothing. One reading is stated here since the brief's words allow two: item 9 says the EIC's part "exists on the tree; keep it". The tree had the statuses; the sentences that each point says what the revision and the response did for it, and what is still missing, were not written there and are added.

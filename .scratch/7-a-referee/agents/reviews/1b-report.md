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
| 1 | DONE | `agents/referee_agent.md`, "The selection", items 1 to 5 (list, merge, grade, found counts, rank). The budget is the session's and comes after the selection: `SKILL.md`, "first round" items 5 to 7, "The budget" and "The files of the selection". `templates/selection_template.md`, "Points found"; the session shows the found counts beside the budget at the stop "The selection" |
| 2 | DONE | `agents/referee_agent.md`, "The selection", item 3 and its bullets, with the test as repair round 2 item 7 tightened it; `templates/selection_template.md`, the line "Why it is major" |
| 3 | DONE | `SKILL.md`, "The budget", first bullet (each number is a ceiling, a selection with fewer points or no major point is complete); `agents/referee_agent.md`, "The selection", item 2 ("One weakness stays one point") and item 3 (the grade rests on the paper alone). The referee is given no budget to reach |
| 4 | DONE | `agents/referee_agent.md`, "The selection", item 2 with its bullets, and item 9 |
| 5 | DONE | `SKILL.md`, "The budget" (the cut, a move of whole entries in rank order), "The files of the selection" ("Points over the budget") and "The user's changes" (the user may move one in). A major point over the budget stands in full and a minor one in one line, as the referee wrote them. The reason of a cut point is the section it stands in; the numbers stand in `budget.md` and in the session's message at the stop |
| 6 | DONE | `SKILL.md`, "The budget" (the length is a ceiling; a report within the limit stands); `agents/referee_agent.md`, "The report" ("Say each point once, in the words it needs."), written with no length given |
| 7 | DONE | `SKILL.md`, "first round" item 1, items 5 to 10, "The budget", the Stops row "The selection", the first three rows of Anti-patterns, and the description, at 1,023 characters |
| 8 | DONE | `references/second_round.md`, the opening paragraph; `agents/referee_agent.md`, "The second round", the bullets on a remaining first-round point |
| 9 | DONE | `references/second_round.md`, "The check of the revision", item 4 |
| 10 | DONE | `agents/new_issue_agent.md`, "The two conditions" and "The judgment"; `references/second_round.md`, "New points" ("Most second rounds have no new point.") |
| 11 | DONE | `references/second_round.md`, "The check of the revision", item 4 (the bullets after "New Issue Detection": the two conditions told in the session's own words, "Other observations") |
| 12 | DONE | `agents/referee_agent.md`, "The second round", the bullet "An observation that is not about what is still missing ..." with its sub-bullets and the two bullets after it; `SKILL.md`, "The files of the selection" (the section "Left out of the check of the revision") |
| 13 | DONE | `agents/referee_agent.md`, "The second round", the bullets from "Grade a remaining first-round point ..." to "A first-round point the revision made worse keeps its own grade."; "The user's changes" keeps a regrade as the user made it. A remainder of wording is minor by the grade test |
| 14 | DONE | `agents/referee_agent.md`, "The second round", the last five bullets, and "The report", the bullet that names them |
| 15 | DONE | `agents/referee_agent.md`, "The report", the bullets that begin "In a second round"; `templates/referee_report_template.md`, the second block; `templates/selection_template.md`, the lines "First-round point", "Still missing" and "What the revision added or changed"; `SKILL.md`, "The files of the selection", for the points over the budget. A new point stands first under the major points, in the selection and in the report, since repair round 3 |
| 16 | DONE | `metadata.version` is "1.0.0". `SKILL.md` is the caller of the three agent pages; repair round 2 changed its steps, reference sections, Stops, Anti-patterns and Rules as that round's entries say |

Check 1, the ASCII check, as last run in repair round 2 over the files that round changed or added, from the worktree's root:

```
(no output; exit status 0)
```

Check 2, `sed -n 5p skills/academic/referee/SKILL.md`:

```
  version: "1.0.0"
```

Check 3, the new and changed items read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, section E, sentence length. The departures, each with why it keeps its form:

- `agents/referee_agent.md`, "The selection", item 3, first bullet (28 words) and the bullet on a weakness that leaves a claim standing: each states its test whole.
- `agents/referee_agent.md`, "The selection", item 5: three sentences as on the unchanged page, with the ranking made per grade.
- `agents/referee_agent.md`, "The selection", item 9: two sentences, the second saying what a left-out comment is.
- `agents/referee_agent.md`, "The user's changes", the bullets on a comment moved in (34 words) and on a point moved out of the resolved list (32 words): both stood on the tree before the step and keep their wording.
- `agents/referee_agent.md`, "The second round", the bullets on an unanswered point that stays major (26 words), on an observation left out (26 words) and on the recommendation (27 words): each states its condition whole.
- `agents/new_issue_agent.md`, "The two conditions", both conditions (29 and 26 words), and the Done line of "The judgment": each is one condition, or lists the three sections.
- `agents/rule_check_agent.md`, "What a break is", the first and fourth bullets (26 and 29 words), "The read", the bullet that lists the sections for `selection.md`, and "A file read again": each names what it applies to in full.
- `references/second_round.md`, item 4, the bullets on the two files (29 words) and on "unanswered" (25 words), and item 9 with its bullet on what the stop also shows: each lists its files, its condition or its parts.
- `SKILL.md`, "first round", the Done line of item 5 and the message bullet of item 13; "The budget", the bullets on the cut of the major points and on `budget.md`; "The files of the selection", first bullet; the opening sentence of "The rule check"; Rules, the bullet on the files of a second round: each lists what it names.
- `SKILL.md`, the Stops rows "The selection" and "The breaks left in the report": long cells, since each lists what the stop shows.

## The terms

- **round, of a referee review**: used in the new sentences of all five files as its entry defines it, the first round on the submitted manuscript and the second round on the revision with the response.
- **stop**: "the selection stop" is the row "The selection" of the skill's Stops table, the second sense of the entry.
- **session, the**: the three agent pages, `SKILL.md` and `references/second_round.md` say "the session" for the session that runs the skill, as the entry has it.
- **runner**, **refusal**, **stop**: unchanged uses only. "The stop "The breaks left in the report"" is a row of the skill's Stops table, the second sense of **stop**.
- The new sentences use none of the glossary terms "finding", "case", "place", "kind", "gate", "ruling" and "verdict": `grep -n -i -w 'case\|place\|finding\|kind\|verdict'` over the seven files of the skill prints two lines of `SKILL.md` that stood before the step ("at the place and under the name", "in its place"). "Break", "rule check", "grade test" and "objection" are words of the skill's own pages and no glossary term.

## The files with line counts

`wc -l` after repair round 3:

```
     259 skills/academic/referee/SKILL.md
      57 skills/academic/referee/agents/new_issue_agent.md
     178 skills/academic/referee/agents/referee_agent.md
      54 skills/academic/referee/agents/rule_check_agent.md
     101 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      98 skills/academic/referee/templates/selection_template.md
     805 total
```

## Names and whole-file sentences

Each name the step adds or changes, as it stands after repair round 3, with `grep -rn` over `skills/`, `utils/`, `docs/` and `README.md`. Every hit is inside `skills/academic/referee/` or in `README.md`. Lines over 150 characters are cut and marked "...". Names that earlier rounds added and a later round removed have no hit left: "Cut by the budget", the section "The recommendation", "The minor points in full", "The files of the selection".

```
$ grep -rn -- '"The budget"' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:61:   - Say in the question that each number of the budget is a ceiling, as "The budget" says.
skills/academic/referee/SKILL.md:66:   - Keep the budget, the journal's length limit and the panel in the session, as "The budget" says of the four nu ...
skills/academic/referee/SKILL.md:83:   - Give it none of the four numbers of "The budget", in the prompt or in a file the prompt names.
skills/academic/referee/SKILL.md:89:7. Apply the cut and write `selected-points.md`, as "The budget" and "The files of the selection" say.
skills/academic/referee/SKILL.md:113:12. Check the length of the report, as "The budget" says.
skills/academic/referee/SKILL.md:119:    - Write `budget.md`, as "The budget" says.
skills/academic/referee/SKILL.md:209:- Give it none of the four numbers of "The budget".
skills/academic/referee/SKILL.md:238:| Carrying every comment of the panel into the report | A report with too many points hides the ones the editor m ...
skills/academic/referee/SKILL.md:239:| Telling the referee a number of the budget or a length | A referee that knows a number grades and writes up to  ...
$ grep -rn -- 'Points over the budget' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:101:    - `left-out.md` holds the sections "Points over the budget", "Left-out comments", "Left out of the check of t ...
skills/academic/referee/SKILL.md:145:- When `selection.md` holds more major points than the most major points, the lowest-ranked major points over tha ...
skills/academic/referee/SKILL.md:167:- "Points over the budget" is a `##` section before "Left-out comments", with the headings "Major points over the ...
skills/academic/referee/SKILL.md:191:- The session moves a point between "Selected points" and "Points over the budget", as a whole entry.
$ grep -rn -- 'Points found' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:53:4. Write the found counts in the section "Points found" of `selection.md`: how many major points an ...
skills/academic/referee/templates/selection_template.md:16:## Points found
$ grep -rn -- 'found counts' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:53:4. Write the found counts in the section "Points found" of `selection.md`: how many major points an ...
skills/academic/referee/agents/referee_agent.md:170:- The found counts count the remaining first-round points.
skills/academic/referee/SKILL.md:86:   - Done when `selection.md` stands in the run folder with the found counts, every major point in full and every  ...
skills/academic/referee/SKILL.md:102:    - Show the found counts beside the budget.
skills/academic/referee/SKILL.md:158:- When the run ends, the session writes `budget.md`: the four numbers, the found counts, each point the cut moved ...
skills/academic/referee/SKILL.md:173:- The found counts the session shows beside the budget are the sums of "Count after the cut".
skills/academic/referee/SKILL.md:228:| The selection | After the selected points in full and their rule check, before the report is written (first rou ...
$ grep -rn -- 'remaining first-round point' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:91:   - A new point stands first among the major points, ahead of every remaining first-round point ...
skills/academic/referee/agents/referee_agent.md:124:- In a second round, each remaining first-round point names its first-round number and what is sti ...
skills/academic/referee/agents/referee_agent.md:149:- A first-round point with any other status is a remaining first-round point.
skills/academic/referee/agents/referee_agent.md:150:- The points of your selection are the remaining first-round points.
skills/academic/referee/agents/referee_agent.md:155:- A remaining first-round point holds only what the first-round point asked and what of it is stil ...
skills/academic/referee/agents/referee_agent.md:164:- A remaining first-round point keeps its first-round number and title, written in its line "First ...
skills/academic/referee/agents/referee_agent.md:165:- What is still missing of a remaining first-round point stands in its line "Still missing".
skills/academic/referee/agents/referee_agent.md:166:- Grade a remaining first-round point on what is still missing, by the grade test.
skills/academic/referee/agents/referee_agent.md:170:- The found counts count the remaining first-round points.
skills/academic/referee/templates/referee_report_template.md:48:[Any new point first, then the remaining first-round points, in the order of `selected ...
skills/academic/referee/templates/referee_report_template.md:55:[The remaining first-round points, or "None."]
skills/academic/referee/templates/selection_template.md:29:- First-round point: [a remaining first-round point only: its first-round number and title]
skills/academic/referee/templates/selection_template.md:30:- Still missing: [a remaining first-round point only: what the first-round point asked that ...
$ grep -rn -- '"The rules hold"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:42:   - For `selection.md` the rules are those of the referee's "The rules hold" and "The selection ...
skills/academic/referee/agents/rule_check_agent.md:43:   - For `selected-points.md` the rules are those of the referee's "The rules hold", "The select ...
skills/academic/referee/agents/rule_check_agent.md:44:   - For `referee-report.md` the rules are those of the referee's "The rules hold" and "The repo ...
skills/academic/referee/agents/rule_check_agent.md:45:   - For `new-points.md` the rules are those of the new-issue agent's "The rules hold", "The two ...
skills/academic/referee/SKILL.md:240:| An agent that argues its way past a rule | The exception it grants itself reaches the user as if the rule had h ...
skills/academic/referee/SKILL.md:253:- An agent that thinks a rule gives a wrong result follows the rule and writes its objection where its page's "Th ...
skills/academic/referee/templates/referee_report_template.md:3:The referee fills this template as `referee-report.md`. Text in `[brackets]` is replace ...
skills/academic/referee/templates/selection_template.md:3:This template holds the forms of two files. Text in `[brackets]` is replaced. Every rule of  ...
$ grep -rn -- 'A return from the rule check' skills/ utils/ docs/ README.md
skills/academic/referee/agents/new_issue_agent.md:51:## A return from the rule check
skills/academic/referee/agents/referee_agent.md:70:## A return from the rule check
skills/academic/referee/SKILL.md:212:- With a break named, resume the agent that wrote the file with the breaks, as "A return from the rule check" of  ...
$ grep -rn -- 'The selected points in full' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:43:   - For `selected-points.md` the rules are those of the referee's "The rules hold", "The select ...
skills/academic/referee/agents/referee_agent.md:78:## The selected points in full
skills/academic/referee/agents/referee_agent.md:96:- A minor point that stands in one line is written in full, as "The selected points in full" says.
skills/academic/referee/SKILL.md:93:   - It writes as `agents/referee_agent.md`, "The selected points in full", says.
$ grep -rn -- 'A report to shorten' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:134:## A report to shorten
skills/academic/referee/SKILL.md:154:- The referee shortens it as `agents/referee_agent.md`, "A report to shorten", says.
$ grep -rn -- '"The second round"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:88:   - The referee works as `agents/referee_agent.md`, "The second round", adds to "The selection" ...
skills/academic/referee/agents/rule_check_agent.md:42:   - For `selection.md` the rules are those of the referee's "The rules hold" and "The selection ...
skills/academic/referee/agents/rule_check_agent.md:43:   - For `selected-points.md` the rules are those of the referee's "The rules hold", "The select ...
skills/academic/referee/agents/rule_check_agent.md:44:   - For `referee-report.md` the rules are those of the referee's "The rules hold" and "The repo ...
skills/academic/referee/agents/referee_agent.md:127:- In a second round, choose the recommendation as "The second round" says.
$ grep -rn -- 'grade test' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:32:- A major point whose own lines describe a weakness the grade test calls minor is a break.
skills/academic/referee/agents/referee_agent.md:43:3. Grade each point by the grade test, on the paper alone.
skills/academic/referee/agents/referee_agent.md:148:- An unanswered first-round point is a remaining major point instead when, by the grade test, a ma ...
skills/academic/referee/agents/referee_agent.md:166:- Grade a remaining first-round point on what is still missing, by the grade test.
skills/academic/referee/agents/referee_agent.md:168:- A first-round point that carries no grade takes as its first-round grade the grade the grade tes ...
$ grep -rn -- '"Objections"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/new_issue_agent.md:10:- When you think a rule gives a wrong result here, follow the rule and write your objection in th ...
skills/academic/referee/agents/new_issue_agent.md:14:- Outside the section "Objections", write no sentence that argues for an exception to a rule.
skills/academic/referee/agents/new_issue_agent.md:49:Done when `new-points.md` holds three sections, "New points", "Left-out comments" and "Objections ...
skills/academic/referee/agents/new_issue_agent.md:57:- When you think a break is wrong, correct it all the same and write your objection in the sectio ...
skills/academic/referee/agents/rule_check_agent.md:10:- When you think a rule gives a wrong result here, follow the rule and write your objection in t ...
skills/academic/referee/agents/rule_check_agent.md:29:- A sentence of the file, outside a section "Objections", that argues for an exception to a rule ...
skills/academic/referee/agents/rule_check_agent.md:36:- An objection in a section "Objections" is no break while the file follows the rule it objects  ...
skills/academic/referee/agents/rule_check_agent.md:50:Done when your output file stands in the run folder under the name the session gives you. It hol ...
skills/academic/referee/agents/referee_agent.md:12:- When you think a rule gives a wrong result here, follow the rule and write your objection in the  ...
skills/academic/referee/agents/referee_agent.md:17:- Outside a section "Objections", write no sentence that argues for an exception to a rule.
skills/academic/referee/agents/referee_agent.md:76:- When you think a break is wrong, correct it all the same and write your objection in the section  ...
skills/academic/referee/agents/referee_agent.md:130:- An objection to a rule of this section goes in the section "Objections" of `selected-points.md`, ...
skills/academic/referee/SKILL.md:104:    - Show each section "Objections" an agent has written.
skills/academic/referee/SKILL.md:179:- An objection of `selected-points.md` is carried into the section "Objections" of `selection.md`.
skills/academic/referee/SKILL.md:228:| The selection | After the selected points in full and their rule check, before the report is written (first rou ...
$ grep -rn -- 'The files of the selection' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:90:9. Add to `selection.md` what the new-issue agent and the EIC wrote, as `SKILL.md`, "The files o ...
skills/academic/referee/SKILL.md:89:7. Apply the cut and write `selected-points.md`, as "The budget" and "The files of the selection" say.
skills/academic/referee/SKILL.md:100:    - Carry the text back as "The files of the selection" says.
skills/academic/referee/SKILL.md:160:What the referee can still work out: it wrote the selection, so it can see that `selected-points.md` holds fewer  ...
skills/academic/referee/SKILL.md:162:## The files of the selection
$ grep -rn -- '"The user.s changes"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:43:   - For `selected-points.md` the rules are those of the referee's "The rules hold", "The select ...
skills/academic/referee/SKILL.md:107:    - A change is made as "The user's changes" says, and the rewritten lists are shown again.
skills/academic/referee/SKILL.md:197:- When `selected-points.md` holds a minor point in one line or a section "Changes to write", resume the referee w ...
$ grep -rn -- '"The rule check"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:75:7. Run the rule check on `new-points.md`, as `SKILL.md`, "The rule check", says.
skills/academic/referee/SKILL.md:87:6. Run the rule check on `selection.md`, as "The rule check" says.
skills/academic/referee/SKILL.md:96:9. Run the rule check on `selected-points.md`, as "The rule check" says.
skills/academic/referee/SKILL.md:115:13. Run the rule check on `referee-report.md`, as "The rule check" says.
skills/academic/referee/SKILL.md:198:- After the referee's rewrite, the rule check of `selected-points.md` reads the file again, as "The rule check" s ...
$ grep -rn -- 'The breaks left in the report' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:116:    - A break it still names after its two returns is the stop "The breaks left in the report".
skills/academic/referee/SKILL.md:217:- A break of `referee-report.md` still named after the second return is the stop "The breaks left in the report".
skills/academic/referee/SKILL.md:229:| The breaks left in the report | The rule check still names a break of `referee-report.md` after its two returns ...
docs/figures/gen_figures.py:1940:        Node("B", "The breaks left in the report, only after 2 returns", "stop"),
docs/figures/referee.svg:1:<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1488.1 1513" width="1488.1" height="1513" role="img" aria-label="The f ...
docs/figures/referee.svg:2:<title>The first round of the referee skill. Boxes: You answer the intake (stop); Field analyst: the Reviewer Configuration ...
README.md:80:![The first round of the referee skill: You answer the intake, a stop; Field analyst: the Reviewer Configuration Card; You confirm the re ...
$ grep -rn -- 'Left out of the check of the revision' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:99:    - The selection stop also shows the list "First-round points resolved" and the section "Left ...
skills/academic/referee/SKILL.md:101:    - `left-out.md` holds the sections "Points over the budget", "Left-out comments", "Left out of the check of t ...
skills/academic/referee/SKILL.md:182:- In a second round, "Left out of the check of the revision" is a `##` section after "Left-out comments".
$ grep -rn -- 'Points the user moved out' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:101:    - `left-out.md` holds the sections "Points over the budget", "Left-out comments", "Left out of the check of t ...
skills/academic/referee/SKILL.md:192:- The session moves a point the user takes out, as a whole entry, to a `##` section "Points the user moved out" o ...
$ grep -rn -- 'Count after the cut' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:169:- "Count after the cut" is a `##` section at the end, which the session fills as the bullets below say.
skills/academic/referee/SKILL.md:173:- The found counts the session shows beside the budget are the sums of "Count after the cut".
$ grep -rn -- 'Changes to write' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:86:- Leave every major point as it stands, unless an entry of "Changes to write" names it.
skills/academic/referee/agents/referee_agent.md:90:When `selected-points.md` holds the section "Changes to write", carry out each entry of that sectio ...
skills/academic/referee/agents/referee_agent.md:99:- Leave the section "Changes to write" as it stands.
skills/academic/referee/SKILL.md:193:- Every other change is one entry of the section "Changes to write" of `selected-points.md`, in the session's wor ...
skills/academic/referee/SKILL.md:196:- After a change, the session writes `selected-points.md` again from `selection.md`, with the section "Changes to ...
skills/academic/referee/SKILL.md:197:- When `selected-points.md` holds a minor point in one line or a section "Changes to write", resume the referee w ...
skills/academic/referee/SKILL.md:199:- The session then carries the text back, removes the section "Changes to write" and writes `left-out.md` again.
skills/academic/referee/templates/selection_template.md:64:The session writes this block as `selected-points.md`, with each point as it stands in `sel ...
skills/academic/referee/templates/selection_template.md:91:## Changes to write
$ grep -rn -- '"The two conditions"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:39:   - Tell it the two conditions of `agents/new_issue_agent.md`, "The two conditions", in the ses ...
skills/academic/referee/agents/rule_check_agent.md:45:   - For `new-points.md` the rules are those of the new-issue agent's "The rules hold", "The two ...
$ grep -rn -- '"New points"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:3:A second round reviews a revision against the authors' response letter: how the authors answered  ...
skills/academic/referee/agents/new_issue_agent.md:49:Done when `new-points.md` holds three sections, "New points", "Left-out comments" and "Objections ...
$ grep -rn -- 'new_issue_agent' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:39:   - Tell it the two conditions of `agents/new_issue_agent.md`, "The two conditions", in the ses ...
skills/academic/referee/references/second_round.md:69:6. When the section "New issues" of `new-issues.md` holds one new issue or more, start the new-i ...
skills/academic/referee/SKILL.md:35:7. `agents/rule_check_agent.md`, read by the rule check, and `agents/new_issue_agent.md`, read by the new-issue ag ...
$ grep -rn -- 'rule_check_agent' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:35:7. `agents/rule_check_agent.md`, read by the rule check, and `agents/new_issue_agent.md`, read by the new-issue ag ...
skills/academic/referee/SKILL.md:206:- Start it from `agents/rule_check_agent.md`.
$ grep -rn -- 'selected-points.md' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:98:    - `selected-points.md` holds each new point first under "Major points", and the report keeps ...
skills/academic/referee/agents/rule_check_agent.md:22:| `selected-points.md` | The referee's page and the selection template | In a second round, `rev ...
skills/academic/referee/agents/rule_check_agent.md:23:| `referee-report.md` | The referee's page and the report template | The confirmed `selected-poi ...
skills/academic/referee/agents/rule_check_agent.md:34:- In `selected-points.md`, a point whose line "Why it is major" ends "graded major by the user"  ...
skills/academic/referee/agents/rule_check_agent.md:35:- In `selected-points.md`, a point whose Status line reads "a new point of the revision" was wri ...
skills/academic/referee/agents/rule_check_agent.md:43:   - For `selected-points.md` the rules are those of the referee's "The rules hold", "The select ...
skills/academic/referee/agents/referee_agent.md:13:- That file is `selection.md` at the selection, and `selected-points.md` at every later call, the r ...
skills/academic/referee/agents/referee_agent.md:23:- For the selected points in full, and for the user's changes: `selected-points.md`, which the sess ...
skills/academic/referee/agents/referee_agent.md:24:- For the report: the confirmed `selected-points.md` and `templates/referee_report_template.md`.
skills/academic/referee/agents/referee_agent.md:80:After the selection, the session gives you `selected-points.md`, in the form of the second block of ...
skills/academic/referee/agents/referee_agent.md:82:- Write in full each minor point of `selected-points.md` that stands in one line, in the form of th ...
skills/academic/referee/agents/referee_agent.md:90:When `selected-points.md` holds the section "Changes to write", carry out each entry of that sectio ...
skills/academic/referee/agents/referee_agent.md:105:Write `referee-report.md` in the run folder, in the form of `templates/referee_report_template.md` ...
skills/academic/referee/agents/referee_agent.md:108:- Write from the points under "Major points" and "Minor points" of `selected-points.md` only.
skills/academic/referee/agents/referee_agent.md:109:- Keep the order `selected-points.md` gives the points under each heading.
skills/academic/referee/agents/referee_agent.md:115:- Tie each point to its passage, as `selected-points.md` has it.
skills/academic/referee/agents/referee_agent.md:130:- An objection to a rule of this section goes in the section "Objections" of `selected-points.md`, ...
skills/academic/referee/agents/referee_agent.md:152:- A point of `selected-points.md` whose Status line reads "a new point of the revision" was writte ...
skills/academic/referee/agents/referee_agent.md:175:- Both are read from the confirmed `selected-points.md`.
skills/academic/referee/agents/referee_agent.md:178:- Otherwise you choose the value, on the major points of the confirmed `selected-points.md`.
skills/academic/referee/SKILL.md:89:7. Apply the cut and write `selected-points.md`, as "The budget" and "The files of the selection" say.
skills/academic/referee/SKILL.md:90:   - Done when `selection.md` holds the session's sections and `selected-points.md` stands in the run folder.
skills/academic/referee/SKILL.md:92:   - Give it `selected-points.md` and nothing else of the run folder.
skills/academic/referee/SKILL.md:94:   - With no minor point in `selected-points.md`, the referee is not resumed here.
skills/academic/referee/SKILL.md:95:   - Done when each minor point of `selected-points.md` stands in full.
skills/academic/referee/SKILL.md:96:9. Run the rule check on `selected-points.md`, as "The rule check" says.
skills/academic/referee/SKILL.md:97:   - With no minor point in `selected-points.md`, this rule check is not run.
skills/academic/referee/SKILL.md:108:    - Done when the user has confirmed, and `selection.md`, `selected-points.md` and `left-out.md` hold each chan ...
skills/academic/referee/SKILL.md:110:    - Give it the confirmed `selected-points.md` and `templates/referee_report_template.md`, and no length.
skills/academic/referee/SKILL.md:160:What the referee can still work out: it wrote the selection, so it can see that `selected-points.md` holds fewer  ...
skills/academic/referee/SKILL.md:174:- `selected-points.md` is written by the session in the form of the second block of `templates/selection_template ...
skills/academic/referee/SKILL.md:175:- `selected-points.md` holds the points under "Selected points", each as it stands in `selection.md`, and in a se ...
skills/academic/referee/SKILL.md:176:- `selected-points.md` holds no point over the budget, no found count, no count line and no left-out comment.
skills/academic/referee/SKILL.md:177:- The referee writes into `selected-points.md`, and the session carries its text back into `selection.md`.
skills/academic/referee/SKILL.md:179:- An objection of `selected-points.md` is carried into the section "Objections" of `selection.md`.
skills/academic/referee/SKILL.md:180:- A grade, a number or an order that differs in `selected-points.md` is carried back only where a change of the u ...
skills/academic/referee/SKILL.md:193:- Every other change is one entry of the section "Changes to write" of `selected-points.md`, in the session's wor ...
skills/academic/referee/SKILL.md:196:- After a change, the session writes `selected-points.md` again from `selection.md`, with the section "Changes to ...
skills/academic/referee/SKILL.md:197:- When `selected-points.md` holds a minor point in one line or a section "Changes to write", resume the referee w ...
skills/academic/referee/SKILL.md:198:- After the referee's rewrite, the rule check of `selected-points.md` reads the file again, as "The rule check" s ...
skills/academic/referee/SKILL.md:207:- One fresh agent reads `selection.md`, another `selected-points.md`, another `referee-report.md` and, in a secon ...
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:215:- Each rewrite of `selected-points.md` after a change of the user is a reading of its own, read by the same rule- ...
skills/academic/referee/SKILL.md:216:- A break of `selection.md`, `selected-points.md` or `new-points.md` still named after the second return is shown ...
skills/academic/referee/SKILL.md:250:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
skills/academic/referee/templates/referee_report_template.md:48:[Any new point first, then the remaining first-round points, in the order of `selected ...
skills/academic/referee/templates/selection_template.md:64:The session writes this block as `selected-points.md`, with each point as it stands in `sel ...
$ grep -rn -- 'new-issues.md' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:37:   - `new-issues.md` holds the sections "New issues" and "Other observations", and everything th ...
skills/academic/referee/references/second_round.md:63:   - Done when `revision-check.md` and `new-issues.md` stand in the run folder.
skills/academic/referee/references/second_round.md:69:6. When the section "New issues" of `new-issues.md` holds one new issue or more, start the new-i ...
skills/academic/referee/references/second_round.md:70:   - Give it its page, the revised manuscript, the response letter, `new-issues.md` and `templat ...
skills/academic/referee/references/second_round.md:86:   - Give the referee neither `new-issues.md` nor `new-points.md`.
skills/academic/referee/agents/new_issue_agent.md:20:- `new-issues.md`, whose section "New issues" you judge.
skills/academic/referee/agents/new_issue_agent.md:33:1. Read each entry of the section "New issues" of `new-issues.md`.
skills/academic/referee/agents/new_issue_agent.md:45:   - Its line of merged comments names the entry of `new-issues.md` and no other comment.
skills/academic/referee/agents/rule_check_agent.md:24:| `new-points.md` | The new-issue agent's page and the selection template | `new-issues.md` |
skills/academic/referee/SKILL.md:172:- In a second round it also gives the entries of the section "New issues" of `new-issues.md`, the new points and  ...
skills/academic/referee/SKILL.md:184:- That section also lists each entry of "Other observations" of `new-issues.md`, with the reason "an observation  ...
skills/academic/referee/SKILL.md:251:- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revi ...
$ grep -rn -- 'new-points.md' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:74:   - Done when `new-points.md` stands in the run folder, or the agent was not started.
skills/academic/referee/references/second_round.md:75:7. Run the rule check on `new-points.md`, as `SKILL.md`, "The rule check", says.
skills/academic/referee/references/second_round.md:77:   - With no `new-points.md`, this rule check is not run.
skills/academic/referee/references/second_round.md:86:   - Give the referee neither `new-issues.md` nor `new-points.md`.
skills/academic/referee/references/second_round.md:94:   - The session adds the entries as they stand in `new-points.md` and changes no text of them.
skills/academic/referee/agents/new_issue_agent.md:5:You judge the new issues that the check of a revision wrote, each against the two conditions below ...
skills/academic/referee/agents/new_issue_agent.md:10:- When you think a rule gives a wrong result here, follow the rule and write your objection in th ...
skills/academic/referee/agents/new_issue_agent.md:49:Done when `new-points.md` holds three sections, "New points", "Left-out comments" and "Objections ...
skills/academic/referee/agents/new_issue_agent.md:53:A fresh agent reads `new-points.md` against the rules of this page. The session returns each brea ...
skills/academic/referee/agents/rule_check_agent.md:24:| `new-points.md` | The new-issue agent's page and the selection template | `new-issues.md` |
skills/academic/referee/agents/rule_check_agent.md:45:   - For `new-points.md` the rules are those of the new-issue agent's "The rules hold", "The two ...
skills/academic/referee/SKILL.md:181:- In a second round, each new point of `new-points.md` goes first under "Major points", as it stands there.
skills/academic/referee/SKILL.md:183:- That section lists each left-out comment of `new-points.md` with its reason.
skills/academic/referee/SKILL.md:207:- One fresh agent reads `selection.md`, another `selected-points.md`, another `referee-report.md` and, in a secon ...
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:216:- A break of `selection.md`, `selected-points.md` or `new-points.md` still named after the second return is shown ...
skills/academic/referee/SKILL.md:251:- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revi ...
$ grep -rn -- 'rule-check-selection.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:250:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'rule-check-selected-points.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:250:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'rule-check-report.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:250:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'rule-check-new-points.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:210:- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `ru ...
skills/academic/referee/SKILL.md:251:- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revi ...
$ grep -rn -- 'budget.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:10:`/referee <manuscript>` is the referee review of the glossary: one referee report on someone else's paper, written ...
skills/academic/referee/SKILL.md:119:    - Write `budget.md`, as "The budget" says.
skills/academic/referee/SKILL.md:120:    - Send a message that names `referee-report.md`, `left-out.md` and `budget.md` by their paths.
skills/academic/referee/SKILL.md:158:- When the run ends, the session writes `budget.md`: the four numbers, the found counts, each point the cut moved ...
skills/academic/referee/SKILL.md:250:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'Still missing' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:165:- What is still missing of a remaining first-round point stands in its line "Still missing".
skills/academic/referee/templates/selection_template.md:5:- The lines Status, "First-round point", "Still missing" and "What the revision added or cha ...
skills/academic/referee/templates/selection_template.md:30:- Still missing: [a remaining first-round point only: what the first-round point asked that ...
skills/academic/referee/templates/selection_template.md:81:- Still missing: [as in the first block]
$ grep -rn -- 'What the revision added or changed' skills/ utils/ docs/ README.md
skills/academic/referee/agents/new_issue_agent.md:42:   - Its line "What the revision added or changed" names the material of the revision the defect  ...
skills/academic/referee/templates/referee_report_template.md:50:1. [New in the revision: the point, tied to its passage. What the revision added or ch ...
skills/academic/referee/templates/selection_template.md:5:- The lines Status, "First-round point", "Still missing" and "What the revision added or cha ...
skills/academic/referee/templates/selection_template.md:31:- What the revision added or changed: [a new point only: the material of the revision the d ...
$ grep -rn -- 'Introduced by the revision' skills/ utils/ docs/ README.md
skills/academic/referee/agents/new_issue_agent.md:28:- **Introduced by the revision.** The defect stands in material the revision added or changed, or ...
skills/academic/referee/agents/new_issue_agent.md:36:3. Judge the condition "Introduced by the revision" first, then the condition "A main claim fails ...
$ grep -rn -- 'A main claim fails' skills/ utils/ docs/ README.md
skills/academic/referee/agents/new_issue_agent.md:29:- **A main claim fails.** By this defect alone, a main claim of the revised paper fails on the ev ...
skills/academic/referee/agents/new_issue_agent.md:36:3. Judge the condition "Introduced by the revision" first, then the condition "A main claim fails ...
skills/academic/referee/agents/new_issue_agent.md:37:   - A claim worded too strongly for the evidence it has does not meet the condition "A main clai ...
```

Sentences about a changed file or a round as a whole, reread after the change:

- `SKILL.md` description: rewritten in repair round 2 (the referee grades and ranks, the budget keeps at most its number, a fresh agent checks); 1,023 characters.
- `SKILL.md`, the introduction: it now names `budget.md` among the files left behind.
- `SKILL.md`, Stops, the sentence before the table: "The first five rows wait for the user", since the row "The breaks left in the report" was added.
- `SKILL.md`, Rules, the two bullets on the files of the run folder: rewritten to list the files of both rounds as they are now.
- `SKILL.md`, "What it reads" 6 to 8: the two new agent pages added, and `references/second_round.md` said to be the session's.
- `agents/referee_agent.md`, Role: both paragraphs rewritten (the referee finds, grades and ranks, and is resumed for each later call).
- `agents/referee_agent.md`, "What you are given": one bullet per call, and `intake.md` described without the budget.
- `agents/referee_agent.md`, "The selection", opening and closing paragraphs: rewritten ("You select no point and leave no point out"; "with a point, or as left out").
- `references/second_round.md`, the opening paragraphs: the second says the page is the session's and no agent is given it.
- `templates/selection_template.md`, the introduction: rewritten for the two forms of a minor point and the session's sections.
- `templates/referee_report_template.md`, the introduction: names the two blocks, and that its rules hold.
- `README.md`, the row of `referee`, the sentence on the skills that launch agents and the alt text of the figure: rewritten in repair round 2.
- `docs/figures/gen_figures.py`, `referee()`: its docstring, nodes, edges and note rewritten; the head comment's line on `referee.svg` still holds.
- `docs/glossary.md` (**referee review**, **round, of a referee review**), `docs/dev/building.md` and `docs/dev/scripts.md`: reread, each sentence on the skill or its figure still holds, none changed.

## Judgment calls the brief left open

1. The ceiling rules stand in the section "The budget" of `SKILL.md`, the session's side, since repair round 2.
2. `left-out.md` holds the section "Left-out comments" and each section the session wrote, so the cut points stay with the user after the run.
3. A comment that names no weakness (praise, a matter of taste, a remark its passage does not bear out) becomes no point at the merge and is a left-out comment. The found counts therefore count weaknesses only.
4. The ranking is made per grade (major points among themselves, minor points among themselves), which the cut of the lowest-ranked points of a grade needs.
5. A point keeps the number its ranking gives it when the cut moves it, and each of the two headings of the section "Points over the budget" reads "None." when nothing of its grade was cut.
6. A new point is written in the form of a major point, since the condition "A main claim fails" is the test of a major point.
7. Where the revision made a first-round point worse to the degree of the conditions, the added defect is a new issue for the new-issue agent, and the first-round point keeps its own grade.
8. The recommendation reads the confirmed `selection.md`, so a change the user made at the selection stop counts.
9. The templates show "None." under an empty heading of major or minor points.
10. The second-round report form opens the general comments with the revision, in place of the summary of the paper a first round opens with.
11. The judgment calls of repair round 2 are listed in that section.

## User-visible changes

| Where | Before | After |
|---|---|---|
| The intake's budget question | The most major points, the most minor points, the length | The same question and defaults, and it says each number is a ceiling. The numbers stay with the session and are not written to `intake.md` |
| The grade of a point | Major when it bears on whether the main claims hold | Major only when a main claim fails on the evidence given or has no evidence at all, unless the point is settled; otherwise minor |
| `selection.md` | Budget, Selected points, Left-out comments, First-round points resolved, Count | "Points found", every point graded and ranked, "Left-out comments", "Objections", "Count", and the session's section "Points over the budget". No "Budget" section |
| `left-out.md` | The left-out comments, written by the referee | The points over the budget and the left-out comments, written by the session |
| The stop "The selection" | Selected points, left-out comments, and the resolved first-round points in a second round | Also the found counts beside the budget, the points over the budget, the objections and each break the rule check still names |
| The direction of the intake | A comment could be left out as "outside the direction" or "minor against the budget" | Every comment that names a weakness is a counted point. The direction weights the ranking |
| A point over the budget in `selection.md` | No such entry | A major point in full, a minor point in one line, moved by the session as the referee wrote them |
| An empty heading of `referee-report.md` | No form given | "None." under "Major points" or "Minor points" when the selection has none |
| The length of the report | "Keep within the length of the budget" | Written with no length given; the session counts the words and returns a report over the limit once |
| The check of the revision | One file, a status per first-round point and the new issues | `revision-check.md` with the first-round points (number, title, grade, what it asked, status, whether unanswered, what the revision did, what is still missing) and `new-issues.md` with the new issues and the other observations |
| A second-round selection | Any new issue or reviewer comment could become or join a point | The referee's points are the remaining first-round points; a new point comes only from the new-issue agent; every other observation is left out |
| A second-round grade | Graded as in a first round | Never above the first-round grade; an unanswered point is left out unless a main claim still fails without it |
| A second-round recommendation | The referee's choice | Accept or minor revision when no new point stands and no first-round major point remains as a major point; otherwise the referee's choice on the remaining major points and the new points |
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

Where repair round 2 moved a place this section names: the referee's second-round rules and the recommendation stand in `agents/referee_agent.md`, "The second round"; the two conditions stand in `agents/new_issue_agent.md`, "The two conditions"; the section "Points over the budget" is written by the session, as `SKILL.md`, "The files of the selection", says; the line "Cut by the budget" is gone, and its counts stand in `budget.md`. The checks and line counts below are those of round 1.

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

This section is the Doc text of repair round 1, applied at the landing. Repair round 2 writes `README.md` itself, and the row of `referee` now reads as that round's entry 13 says.

`README.md` was outside the step's paths. The line then, as `grep -n 'two lists' README.md` prints it, is line 30, the row of `referee` in the table of skills. The sentence in it to replace:

```
30: ... A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments, which you move between the two lists. ...
```

Its replacement, the rest of the line unchanged:

```
A referee agent counts the major and the minor points the paper has, selects at most the budget of them, and shows you the selected points, the points over the budget and the left-out comments, which you move between the lists.
```

## Repair round 2

Every item 1 to 14 is done.

Where repair round 3 changed what this section says: after the cut the referee is given `selected-points.md` and never `selection.md` (R3, items 3 and 4, judgment calls 2 and 3); the minor points in full, each rewrite after a change of the user and each new point are read by a rule check (item 12, judgment calls 1 and 10); a new point stands first in the report as in the selection (judgment call 5 no longer holds); in a second round the five reports go to the EIC of the check and not to the referee (item 9, R10, judgment call 4); the section "The files of the selection" of `SKILL.md` is now "The files of the selection", and "The minor points in full" of the referee's page is "The selected points in full"; the first-round items of `SKILL.md` after item 8 moved by one, so the stop "The selection" is item 10, the report item 11, its length item 12, its rule check item 13 and the end item 14. The checks, line counts and greps of this section are those of round 2.

### The first read of R1 to R13

Read on the pages as they stood in the worktree at main's head (ebc3dba), before any change of this round.

| Case | What the pages gave | After the round |
|---|---|---|
| R1 | `SKILL.md`, "first round" item 5 gave the referee `intake.md`, which held the budget and the journal's length limit (`agents/referee_agent.md`, "What you are given"). Not the expected result. | `intake.md` holds the direction, the severity, the fields and the recommendation values only; item 5 gives none of the four numbers. As expected. |
| R2 | Five selected, none moved, and the referee had read the 7 in `intake.md`. Not the expected result. | Five stay under "Selected points"; the cut moves nothing; no call before the report gives a number. As expected. |
| R3 | The referee itself cut ranks 8 and 9 into "Points over the budget". The result was the same, made by the referee. Not the expected result. | The session moves ranks 8 and 9, whole entries as written. As expected. |
| R4 | The report stood, and the referee had been told 1,200 through `intake.md`. Not the expected result. | The session counts 900 with `wc -w`; the report stands; no length was given. As expected. |
| R5 | No return: the referee was told to stay within the length, and nothing counted the words afterwards. Not the expected result. | One return with 1,200 named, "A report to shorten". As expected. |
| R6 | Minor by "wording", and major was open through "cannot be judged at all". Not settled by the pages. | "A claim worded too strongly for the evidence it has is minor." As expected. |
| R7 | Major, and "Why it is major" did not have to say that the claim has no evidence. Partly the expected result. | Major, and the line names the claim and says it has no evidence. As expected. |
| R8 | A remaining first-round point, held at minor, and so a minor point of the report. Not the expected result. | A left-out comment with the reason "the authors did not answer it"; the general comments do not name it. As expected. |
| R9 | A remaining major point. As expected. | The same, by the bullet on an unanswered point under which a main claim still fails. As expected. |
| R10 | `revision-check.md`, given to the referee, held the new issue, and the referee applied the two conditions itself. Not the expected result. | The new issue stands in `new-issues.md`, which the referee is never given; the new-issue agent returns it as a left-out comment; the session lists it under "Left out of the check of the revision". As expected. |
| R11 | The referee made it a new point; nothing ranked it first. Partly the expected result. | One new point from the new-issue agent, placed first under "Major points", with no other comment under it. As expected. |
| R12 | No rule check existed, and the file went to the user as written. Not the expected result. | The rule check names the sentence as a break, and the file goes back to the referee before the stop. As expected. |
| R13 | "A point you are unsure about is minor"; no rule said to follow a rule against one's own view, and no section took an objection. Not the expected result. | The point is minor, and the objection stands in "Objections" of `selection.md`, shown at the stop. As expected. |

### The items

1. `SKILL.md`, "first round" item 1 (what is written to `intake.md`, and what the session keeps), item 5 (none of the four numbers in the prompt or in a file it names), item 13 and "The budget" (`budget.md`, written when the run ends). `agents/referee_agent.md`, "What you are given", describes `intake.md` without a number.
2. `agents/referee_agent.md`, "The selection": items 1 to 9 find, grade, rank and write every point, and the opening says "You select no point and leave no point out." The section "The budget" is gone from that page; the session's side is `SKILL.md`, "The budget".
3. `SKILL.md`, "first round" item 7 and "The budget", the bullets on the cut: after the rule check, the lowest-ranked points over each number move to "Points over the budget" as whole entries in rank order, with no grade, rank or text changed. "The files of the selection" gives the section's form.
4. `agents/referee_agent.md`, "The selection", items 6 and 7 (every major point in full, every minor point in one line) and "The minor points in full". `SKILL.md`, "first round" item 8: the session names the points by their numbers and gives no count and no number.
5. `SKILL.md`, "first round" items 10 and 11 and "The budget", the bullets on the length: the report is written with no length, the session counts with `wc -w`, a report within the limit stands, and one over it goes back once with the limit named. `agents/referee_agent.md`, "A report to shorten".
6. `SKILL.md`, "first round" item 9 and the Stops row "The selection": the found counts beside the budget, the selected points, the points over the budget and the left-out comments. Item 1 asks the budget with the same defaults.
7. `agents/referee_agent.md`, "The selection", item 3: major only when a main claim fails on the evidence given or has no evidence at all; "Why it is major" names the claim and says which; a claim worded too strongly and a detail needed to repeat or check a result are minor. The same words stand in `templates/selection_template.md` ("Why it is major"), both blocks of `templates/referee_report_template.md` and the condition "A main claim fails" of `agents/new_issue_agent.md`.
8. `references/second_round.md`, item 4 (the EIC marks a point "unanswered") and item 9 (the user may move it in). `agents/referee_agent.md`, "The second round", the two bullets on an unanswered point, and "The report", the bullet that keeps such a point out of the general comments. `templates/referee_report_template.md`, the second block.
9. `references/second_round.md`, item 4: `revision-check.md` holds the first-round points and nothing else, `new-issues.md` the sections "New issues" and "Other observations". Item 7 gives the referee the first file and names neither `new-issues.md` nor `new-points.md` in its prompt. `grep -n 'new-issues\|new-points\|second_round' agents/referee_agent.md templates/*.md` prints nothing.
10. `agents/new_issue_agent.md`, whole. `references/second_round.md`, item 6 (started only with a new issue, given the revised manuscript, the response letter, `new-issues.md` and the template, and neither `revision-check.md` nor a file of the referee) and item 8 (a new point ranks first among the major points and stands under no other point). `SKILL.md`, "The files of the selection".
11. Each agent page has the section "The rules hold" near its top: `agents/referee_agent.md`, `agents/new_issue_agent.md`, `agents/rule_check_agent.md`. Each template names that section in its introduction. `references/second_round.md`, second paragraph, and `SKILL.md`, Rules (three bullets), say it for the session. The referee's objections go in "Objections" of `selection.md`, shown at the stop "The selection". The judgments the pages keep name who makes them and on what: the direction weights the referee's ranking; the referee chooses the recommendation on the remaining major points and the new points; the user decides on an objection.
12. `agents/rule_check_agent.md`, whole. `SKILL.md`, "The rule check", "first round" items 6 and 12, and the Stops row "The breaks left in the report". A break of `selection.md` left after two returns is shown at the stop "The selection".
13. `README.md`: the row of `referee`, the sentence on the skills that launch agents, and the alt text of the figure. `docs/figures/gen_figures.py`, `referee()`: docstring, nodes, edges and note. `docs/figures/referee.svg` written again by the script. `docs/glossary.md`, `docs/dev/building.md` and `docs/dev/scripts.md` were reread and no sentence of theirs became false, so none is changed. `skills/academic/paper-review-panel/` is not changed.
14. `metadata.version` is "1.0.0". The description is rewritten, at 1,023 of 1,024 characters. The sentences about a file, a round or a call as a whole are listed under "Names and whole-file sentences", rewritten in place.

### The checks

Check 1, the ASCII check over the ten files of the round and this report:

```
(no output; exit status 0)
```

Check 2, `sed -n 5p skills/academic/referee/SKILL.md`:

```
  version: "1.0.0"
```

Check 3, `python3 docs/figures/gen_figures.py` exits 0, and `git status --short docs/figures` then prints:

```
 M docs/figures/gen_figures.py
 M docs/figures/referee.svg
```

Check 4, `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`, run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`:

```
ok: the plan-terms block equals the template
```

Check 5, `grep -n -i 'budget\|words\|length' skills/academic/referee/agents/referee_agent.md`, whole:

```
105:- Say each point once, in the words it needs.
106:- In a first round, open the general comments with a summary of the paper in your own words: what it claims and on what evidence.
125:When the session returns the report with a number of words, rewrite `referee-report.md` to stay within that number.
```

Each line read: the first two are "the words it needs" and "in your own words", and give no number. The third is "A report to shorten", which the referee meets only after the report is written, when the session returns it with a number.

The description of `SKILL.md`, by the command of `docs/dev/skill-layout.md`, "Frontmatter": 1023 characters.

### Line counts

```
     219 skills/academic/referee/SKILL.md
      45 skills/academic/referee/agents/new_issue_agent.md
     165 skills/academic/referee/agents/referee_agent.md
      47 skills/academic/referee/agents/rule_check_agent.md
      88 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      72 skills/academic/referee/templates/selection_template.md
     694 total
```

### Names the round adds or changes

```
$ grep -rn -- '"The rules hold"' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:37:   - For `selection.md` the rules are those of "The rules hold", "The selection", "The minor poi ...
skills/academic/referee/agents/rule_check_agent.md:38:   - For `referee-report.md` the rules are those of "The rules hold", "The report" and, in a sec ...
skills/academic/referee/SKILL.md:200:| An agent that argues its way past a rule | The exception it grants itself reaches the user as if the rule had h ...
skills/academic/referee/SKILL.md:213:- An agent that thinks a rule gives a wrong result follows the rule and writes its objection where its page's "Th ...
skills/academic/referee/templates/referee_report_template.md:3:The referee fills this template as `referee-report.md`. Text in `[brackets]` is replace ...
skills/academic/referee/templates/selection_template.md:3:The referee fills this template as `selection.md` at the selection. Text in `[brackets]` is  ...
$ grep -rn -- 'A return from the rule check' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:60:## A return from the rule check
skills/academic/referee/SKILL.md:173:- With a break named, resume the referee with the breaks, as `agents/referee_agent.md`, "A return from the rule c ...
$ grep -rn -- 'The minor points in full' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:37:   - For `selection.md` the rules are those of "The rules hold", "The selection", "The minor poi ...
skills/academic/referee/agents/referee_agent.md:68:## The minor points in full
skills/academic/referee/SKILL.md:93:   - It writes as `agents/referee_agent.md`, "The minor points in full", says.
$ grep -rn -- 'A report to shorten' skills/ utils/ docs/ README.md
skills/academic/referee/agents/referee_agent.md:123:## A report to shorten
skills/academic/referee/SKILL.md:149:- The referee shortens it as `agents/referee_agent.md`, "A report to shorten", says.
$ grep -rn -- '"The second round"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:75:   - The referee works as `agents/referee_agent.md`, "The second round", adds to "The selection" ...
skills/academic/referee/agents/rule_check_agent.md:37:   - For `selection.md` the rules are those of "The rules hold", "The selection", "The minor poi ...
skills/academic/referee/agents/rule_check_agent.md:38:   - For `referee-report.md` the rules are those of "The rules hold", "The report" and, in a sec ...
skills/academic/referee/agents/referee_agent.md:117:- In a second round, choose the recommendation as "The second round" says.
$ grep -rn -- 'grade test' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:28:- A major point whose own lines describe a weakness the grade test calls minor is a break.
skills/academic/referee/agents/referee_agent.md:40:3. Grade each point by the grade test, on the paper alone.
skills/academic/referee/agents/referee_agent.md:137:- An unanswered first-round point is a remaining major point instead when, by the grade test, a ma ...
skills/academic/referee/agents/referee_agent.md:154:- Grade a remaining first-round point on what is still missing, by the grade test.
skills/academic/referee/agents/referee_agent.md:156:- A first-round point that carries no grade takes as its first-round grade the grade the grade tes ...
$ grep -rn -- 'The session.s sections of the selection' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:78:8. Add to `selection.md` what the new-issue agent and the EIC wrote, as `SKILL.md`, "The session ...
skills/academic/referee/SKILL.md:90:   - Done when the section "Points over the budget" stands in `selection.md`, as "The session's sections of the se ...
skills/academic/referee/SKILL.md:154:## The session's sections of the selection
skills/academic/referee/templates/selection_template.md:9:- The session writes the sections of `SKILL.md`, "The files of the selection",  ...
$ grep -rn -- '"The rule check"' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:87:6. Run the rule check on `selection.md`, as "The rule check" says.
skills/academic/referee/SKILL.md:114:12. Run the rule check on `referee-report.md`, as "The rule check" says.
$ grep -rn -- 'The breaks left in the report' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:115:    - A break it still names after its two returns is the stop "The breaks left in the report".
skills/academic/referee/SKILL.md:177:- A break of `referee-report.md` still named after the second return is the stop "The breaks left in the report".
skills/academic/referee/SKILL.md:189:| The breaks left in the report | The rule check still names a break of `referee-report.md` after its two returns ...
docs/figures/gen_figures.py:1939:        Node("B", "The breaks left in the report, only after 2 returns", "stop"),
docs/figures/referee.svg:1:<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1488.1 1421" width="1488.1" height="1421" role="img" aria-label="The f ...
docs/figures/referee.svg:2:<title>The first round of the referee skill. Boxes: You answer the intake (stop); Field analyst: the Reviewer Configuration ...
README.md:80:![The first round of the referee skill: You answer the intake, a stop; Field analyst: the Reviewer Configuration Card; You confirm the re ...
$ grep -rn -- 'Left out of the check of the revision' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:85:   - The selection stop also shows the list "First-round points resolved", the section "Left out ...
skills/academic/referee/SKILL.md:161:- In a second round, "Left out of the check of the revision" is a `##` section after "Left-out comments".
$ grep -rn -- '"The two conditions"' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:33:   - Tell it the two conditions of `agents/new_issue_agent.md`, "The two conditions", in the ses ...
$ grep -rn -- 'new_issue_agent' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:33:   - Tell it the two conditions of `agents/new_issue_agent.md`, "The two conditions", in the ses ...
skills/academic/referee/references/second_round.md:62:6. When the section "New issues" of `new-issues.md` holds one new issue or more, start the new-i ...
skills/academic/referee/SKILL.md:35:7. `agents/rule_check_agent.md`, read by the rule check, and `agents/new_issue_agent.md`, read by the new-issue ag ...
$ grep -rn -- 'rule_check_agent' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:35:7. `agents/rule_check_agent.md`, read by the rule check, and `agents/new_issue_agent.md`, read by the new-issue ag ...
skills/academic/referee/SKILL.md:170:- Start it from `agents/rule_check_agent.md`, one fresh agent for `selection.md` and another for `referee-report. ...
$ grep -rn -- 'new-issues.md' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:31:   - `new-issues.md` holds the sections "New issues" and "Other observations", and nothing about ...
skills/academic/referee/references/second_round.md:52:   - Done when `revision-check.md` and `new-issues.md` stand in the run folder.
skills/academic/referee/references/second_round.md:62:6. When the section "New issues" of `new-issues.md` holds one new issue or more, start the new-i ...
skills/academic/referee/references/second_round.md:63:   - Give it its page, the revised manuscript, the response letter, `new-issues.md` and `templat ...
skills/academic/referee/references/second_round.md:74:   - Give the referee neither `new-issues.md` nor `new-points.md`, and name neither file in its  ...
skills/academic/referee/agents/new_issue_agent.md:19:- `new-issues.md`, whose section "New issues" you judge.
skills/academic/referee/agents/new_issue_agent.md:31:1. Read each entry of the section "New issues" of `new-issues.md`. Judge no entry of its section  ...
skills/academic/referee/agents/new_issue_agent.md:41:   - Its line of merged comments names the entry of `new-issues.md` and no other comment.
skills/academic/referee/SKILL.md:211:- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revi ...
$ grep -rn -- 'new-points.md' skills/ utils/ docs/ README.md
skills/academic/referee/references/second_round.md:67:   - Done when `new-points.md` stands in the run folder, or the agent was not started.
skills/academic/referee/references/second_round.md:74:   - Give the referee neither `new-issues.md` nor `new-points.md`, and name neither file in its  ...
skills/academic/referee/references/second_round.md:81:   - The session adds the entries as they stand in `new-points.md` and changes no text of them.
skills/academic/referee/references/second_round.md:85:   - The selection stop also shows the list "First-round points resolved", the section "Left out ...
skills/academic/referee/agents/new_issue_agent.md:5:You judge the new issues that the check of a revision wrote, each against the two conditions below ...
skills/academic/referee/agents/new_issue_agent.md:10:- When you think a rule gives a wrong result here, follow the rule and write your objection in th ...
skills/academic/referee/agents/new_issue_agent.md:45:Done when `new-points.md` holds three sections: "New points", "Left-out comments" and "Objections ...
skills/academic/referee/SKILL.md:160:- In a second round, each new point of `new-points.md` goes first under "Major points" of "Selected points", as i ...
skills/academic/referee/SKILL.md:162:- That section lists each left-out comment of `new-points.md` with its reason, or "None.".
skills/academic/referee/SKILL.md:211:- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revi ...
$ grep -rn -- 'rule-check-selection.md' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:43:Done when your output file stands in the run folder: `rule-check-selection.md` for `selection.md ...
skills/academic/referee/SKILL.md:99:   - Show the section "Objections" of `selection.md` and of `rule-check-selection.md`.
skills/academic/referee/SKILL.md:210:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'rule-check-report.md' skills/ utils/ docs/ README.md
skills/academic/referee/agents/rule_check_agent.md:43:Done when your output file stands in the run folder: `rule-check-selection.md` for `selection.md ...
skills/academic/referee/SKILL.md:210:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
$ grep -rn -- 'budget.md' skills/ utils/ docs/ README.md
skills/academic/referee/SKILL.md:10:`/referee <manuscript>` is the referee review of the glossary: one referee report on someone else's paper, written ...
skills/academic/referee/SKILL.md:118:    - Write `budget.md`, as "The budget" says.
skills/academic/referee/SKILL.md:119:    - Send a message that names `referee-report.md`, `left-out.md` and `budget.md` by their paths, and says that  ...
skills/academic/referee/SKILL.md:151:- When the run ends, the session writes `budget.md`: the four numbers, the found counts, each point the cut moved ...
skills/academic/referee/SKILL.md:210:- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer ...
```

The full list of the step's names, with these, is under "Names and whole-file sentences".

### Judgment calls the round left open

1. The rule check reads `selection.md` before the cut, on the referee's full ranking. A return to the referee can change a grade, and a grade changed after the cut would change what the cut moved.
2. The cut stands in `selection.md` as the section "Points over the budget", with no number written. After the cut the referee can count the points left under "Selected points"; by then it changes a grade or a rank only where the user's change says so ("The user's changes").
3. The left-out new issues and the EIC's other observations go into a section of their own that the session writes, "Left out of the check of the revision", and it names no file. The referee meets them only after its selection, in a section its page tells it to leave as it stands.
4. In a second round a reviewer's comment that is not about what is still missing of a first-round point is a left-out comment. Only an entry the EIC wrote as a new issue reaches the new-issue agent.
5. A new point ranks first in `selection.md`, so the cut never moves it, and stands after the remaining first-round points in the report, as the brief's item 15 has it.
6. A first-round point resolved in part is graded on what is still missing and is then a minor point; the option "or is left out with its reason" for a small remainder is gone, since it left the choice to a judgment with no test.
7. An unanswered first-round minor point is always left out: the cap on the first-round grade keeps it from becoming major.
8. The length is checked before the rule check of the report, so the rule check reads the file that goes to the user. The session counts once more after the rule check and sends nothing back a second time; a report that ends over the limit is named in the end message.
9. The session counts words with `wc -w` over the whole of `referee-report.md`, headings included.
10. The rule check is one fresh agent per file, resumed for its second and third read of that file.
11. A break of `referee-report.md` left after two returns is a stop of its own, since no stop follows the report in a run. The user accepts the report or says what to change.
12. The session keeps the panel answer with the four numbers, since item 1 lists what `intake.md` holds.
13. The agent pages write their output to files of the run folder: `new-points.md`, `rule-check-selection.md`, `rule-check-report.md`.
14. The referee's rules for a second round moved from `references/second_round.md` to `agents/referee_agent.md`, "The second round", so that the referee is given no page that names `new-issues.md`.
15. The figure draws the two rule checks, the minor points in full, the report shortened and the new stop. The session's cut and its count of words are session steps, which the figures leave out, and the note says them.
16. `docs/glossary.md` gets no new entry: "rule check", "break", "grade test" and "objection" are used in the skill's pages only, each defined where it is used.

### User-visible changes of the round

| Where | Before | After |
|---|---|---|
| `intake.md` | Held the budget and the journal's length limit | Holds the direction, the severity, the journal's fields and the recommendation values |
| The selection | The referee selected within the budget and cut the points over it | The referee grades and ranks every point; the session cuts |
| A minor point | Selected minor points in full, cut ones in one line, written in one call | Every minor point in one line first; the selected ones in full in a second call |
| The grade test | "fails, or cannot be judged at all" | "fails on the evidence given or has no evidence at all"; over-strong wording and a detail needed to repeat a result are minor |
| The files of a run | `intake.md`, the card, the reports, `selection.md`, `left-out.md`, `referee-report.md` | Also `rule-check-selection.md`, `rule-check-report.md` and `budget.md`; in a second round `new-issues.md` and, when the agent ran, `new-points.md` |
| The agents of a run | The field analyst, the reviewers, the referee | Also the rule check, twice, and in a second round the new-issue agent |
| The stop "The selection" | Found counts, selected points, points over the budget, left-out comments | Also the objections and each break the rule check still names |
| The stops | Four that wait for the user | Five: "The breaks left in the report" is new |
| The length of the report | The referee was told the length | No length given; counted by the session; one return when over |
| An unanswered first-round point | A remaining point of the report | Left out, where the user may move it in, unless a main claim still fails without it |
| A new issue of the revision | Judged by the referee, which saw it | Judged by the new-issue agent; the referee never sees `new-issues.md` |
| The recommendation of a second round | "Otherwise the value is the referee's judgment" | "Otherwise you choose the value, on the remaining major points and the new points" |
| The README and the figure | A referee agent that selects at most the budget | The sequence above, with the two rule checks and the new stop drawn |

### Anything in the round's text that was wrong or impossible

Nothing was impossible. Two readings are stated, since the round's words allow more than one. Item 12 says breaks left after two returns are shown "at the stop, as a row of the Stops table": for `selection.md` they are shown at the stop "The selection", and for `referee-report.md`, which no stop follows, the row "The breaks left in the report" is new. Item 10 says the session adds what comes back to `selection.md`: the new points go under "Major points", and the left-out new issues into a section of their own, as judgment call 3 says.

## Repair round 3

Every item 1 to 10 is done.

### The first read of R14 to R17

Read on the worktree as round 2 left it, before any change of this round.

| Case | What the pages gave | After the round |
|---|---|---|
| R14 | `SKILL.md`, "first round" items 8 and 10 resumed the referee with `selection.md`, whose section "Points over the budget" then held the two cut points. The rule check of the report was given the same file. Not the expected result. | The referee and the rule checks after the cut are given `selected-points.md`, which holds the selected points only. No prompt says a cut was made. As expected, with the limit "The budget" states: the referee wrote the selection and can see that the file holds fewer points than it found. |
| R15 | The minor points in full were written after the one rule check of `selection.md`, and no agent read them. Not the expected result. | The rule check of `selected-points.md` reads them before the stop "The selection". As expected. |
| R16 | No agent read `new-points.md`, and the rule check's page exempted a new point. Not the expected result. | A rule check reads `new-points.md` against the new-issue agent's page before the session adds a new point. As expected. |
| R17 | `references/second_round.md`, item 7 gave the referee "any reviewer reports"; the comment was left out as "not about a first-round point" and judged against nothing. Not the expected result. | The five reports go to the EIC of the check alone; it writes the comment under "New issues", and the new-issue agent judges it against the two conditions. The referee is given no reviewer's report. As expected. |

R1 to R13 read again on the pages after the round: each gives the expected result. R3: the session moves ranks 8 and 9 within `selection.md`, which no agent is given again. R10: the new issue stands in `new-issues.md` and, left out, in the section "Left out of the check of the revision" of `selection.md`; neither file reaches the referee. R11: the new point stands first under "Major points" of `selection.md`, of `selected-points.md` and of the report. R12: the sentence is a break at whichever rule check reads the file it stands in.

### The items

1. `SKILL.md`, "The files of the selection" (after the rule check of `selection.md` no agent is given that file again; `selected-points.md` holds the selected points only, with no point over the budget, no found count, no count line and no left-out comment; the referee writes into it and the session carries the text back, whole entries by number), "first round" items 7, 8 and 11, and "The rule check" (the files each rule check is given). `SKILL.md`, "The budget": the bullet that no prompt and no file before the report says a cut was made, and the closing paragraph on what the referee can still work out and why it changes no grade and no length. `agents/referee_agent.md`, "The selected points in full" and "The report" (written from `selected-points.md`). `agents/rule_check_agent.md`, the table of "What you are given".
2. `SKILL.md`, "first round" item 9 (the rule check of `selected-points.md` before the stop), "The user's changes" (after the referee's rewrite the rule check reads the file again, before the lists are shown again) and "The rule check" (each rewrite is a reading of its own).
3. `references/second_round.md`, item 7; `SKILL.md`, "The rule check"; `agents/rule_check_agent.md`, the row of `new-points.md` and the rules it lists for that file; `agents/new_issue_agent.md`, "A return from the rule check".
4. `agents/referee_agent.md`, "The selection", opening paragraph: "Every weakness that the rules below make a point is written as a point: you drop none on account of how many points there are." The second round's rule that an unanswered point is a left-out comment is one of those rules, so both hold in both rounds.
5. A new point stands first among the major points in each of the four: `SKILL.md`, "The files of the selection"; `references/second_round.md`, items 9 and 10; `agents/referee_agent.md`, "The report" ("Keep the order `selected-points.md` gives the points under each heading") and "The second round"; `templates/referee_report_template.md`, the second block.
6. `references/second_round.md`, item 5: a defect the revision added to a first-round point it made worse is written as a new issue in `new-issues.md`, with the number of that point; `revision-check.md` says "made worse" beside the status and holds none of the added defect; `new-issues.md` holds "everything that is not about what a first-round point asked". This agrees with the condition "Introduced by the revision" of `agents/new_issue_agent.md`.
7. `references/second_round.md`, item 4 (the five reports go to the EIC of item 5 and to no other agent), item 5 (the EIC sorts every comment of the five reports: with a first-round point, under "New issues" whatever it finds of the two conditions, or under "Other observations") and item 8 (the referee is given no report of the five). `agents/referee_agent.md`, "What you are given" and "The second round".
8. `templates/selection_template.md` and `templates/referee_report_template.md` name no page by path; `agents/referee_agent.md` names the two templates and the files it is given; `agents/rule_check_agent.md` names the pages by role, as the session gives them. The sections the session writes stand in `selection.md`, which no agent is given after the cut, so no agent page needs them. `grep -n 'SKILL\|second_round' agents/*.md templates/*.md` prints nothing.
9. `agents/referee_agent.md`, "The second round": the found counts count the remaining first-round points, and the count line counts the entries of `revision-check.md`. `SKILL.md`, "The files of the selection": the session's section "Count after the cut" gives, for each grade, the referee's points, the new points, their sum, the selected points and the points over the budget, and the entries of "New issues" against the new points and the left-out new issues; the found counts shown at the stop are its sums.
10. `SKILL.md`: "first round" items 10 and 14, "The budget", "The files of the selection", "The user's changes" and "The rule check" hold one rule per bullet. `agents/referee_agent.md`: the items of "The selection" carry each second sentence as a bullet of its own, and "The report" splits the two bullets that held two sentences. `agents/new_issue_agent.md`, "The judgment", item 1. `references/second_round.md`, items 8 and 9.

The last read, as each agent with the files it is given: the referee (its page, the two templates, `intake.md`, the reports or `revision-check.md`, later `selected-points.md`), the rule check (its page and the row of its table), the new-issue agent (its page, the selection template, `new-issues.md`) and the session (`SKILL.md`, `references/second_round.md`). Closed in that read: "Leave every major point as it stands" against a regrade of the user, which now reads "unless an entry of "Changes to write" names it"; the rule check's exemption of a new point, now limited to `selected-points.md`; `left-out.md`, which now names its four sections; a left-out new issue the user moves in, which the session quotes whole since the referee has not read it.

### The checks

Check 1, the ASCII check over the ten files of the round and this report:

```
(no output; exit status 0)
```

Check 2, `sed -n 5p skills/academic/referee/SKILL.md`:

```
  version: "1.0.0"
```

Check 3, `python3 docs/figures/gen_figures.py` exits 0, and `git status --short docs/figures` then prints:

```
 M docs/figures/gen_figures.py
 M docs/figures/referee.svg
```

Check 4, `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`, run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`:

```
ok: the plan-terms block equals the template
```

Check 5, `grep -n -i 'budget\|words\|length' skills/academic/referee/agents/referee_agent.md`, whole:

```
25:- For a report to shorten: a number of words.
117:- Say each point once, in the words it needs.
118:- In a first round, open the general comments with a summary of the paper in your own words: what it claims and on what evidence.
136:When the session returns the report with a number of words, rewrite `referee-report.md` to stay within that number.
```

Each line read: line 25 and line 136 are the report to shorten, which comes after the report is written; lines 117 and 118 are "the words it needs" and "in your own words". None gives a number before the report is written.

The description of `SKILL.md`: 1023 characters, unchanged by this round.

Line counts:

```
     259 skills/academic/referee/SKILL.md
      57 skills/academic/referee/agents/new_issue_agent.md
     178 skills/academic/referee/agents/referee_agent.md
      54 skills/academic/referee/agents/rule_check_agent.md
     101 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      98 skills/academic/referee/templates/selection_template.md
     805 total
```

### Judgment calls the round left open

1. The referee stays the one resumed agent for the calls after the cut, as item 1 words it. It can therefore see that `selected-points.md` holds fewer points than it found; "The budget" says so and says why no grade and no length follows from it.
2. The referee's page tells it not to open `selection.md` again after the selection. The file stands in the run folder, so this is a rule of the page and no barrier.
3. The session makes every change of the user that is a move of a whole entry, and a point the user takes out goes whole to the section "Points the user moved out". Before, the referee put its comments among the left-out comments.
4. A point the user regrades to major carries "graded major by the user" in its line "Why it is major", and the rule check does not call that grade a break.
5. One fresh rule-check agent per file: `selection.md`, `selected-points.md`, `referee-report.md` and `new-points.md`. The one for `selected-points.md` is resumed for each rewrite after a change of the user.
6. The EIC of the check runs after the five reviewers and is the agent that reads their reports. A reviewer's comment on material the revision added or changed goes under "New issues" whatever the EIC finds of the two conditions, so the new-issue agent judges it.
7. `selection.md` gets the session's section "Count after the cut". It holds counts of points and none of the four numbers.
8. The figure draws the rule check of the selected points in full; the rule check of `new-points.md` and the cycle after a change of the user stand in its note.

### User-visible changes of the round

| Where | Before | After |
|---|---|---|
| The files of a run | `selection.md` read and written by the referee throughout | `selection.md` is the session's after its rule check; `selected-points.md` and `rule-check-selected-points.md` are new, and `rule-check-new-points.md` in a second round |
| The rule checks | Two: the selection and the report | Also the selected points in full, each rewrite after a change of yours, and the new points of a second round |
| A change at the stop "The selection" | Rewritten by the referee in `selection.md` | A move is made by the session; a change that needs new text is written by the referee in `selected-points.md`, read by the rule check, and shown again |
| A point taken out at the stop | Its comments went among the left-out comments | The whole point stands under "Points the user moved out" |
| `selection.md` | "Selected points" with major and minor points | The referee writes "Major points" and "Minor points"; the session adds "Selected points", "Points over the budget" and "Count after the cut" |
| A new point in the report of a second round | After the remaining first-round points | First under the major points, as in the selection |
| The five reviewers of a second round | Their reports went to the referee | Their reports go to the EIC of the check, which sorts each comment; the referee is given none |
| A first-round point the revision made worse | No file for the added defect | The added defect is a new issue of `new-issues.md`, with the number of the point |
| The figure and the README | Two rule checks drawn | The rule check of the selected points in full drawn, and the row of `referee` and the alt text say the same |

### Anything in the round's text that was wrong or impossible

One limit, stated in item 1's own words ("State in the page what the referee can still infer"): item 1 also says that no call lets an agent "read that a cut was made". No file and no prompt says so. The referee is the agent that wrote the selection, so it can compare what it found with what `selected-points.md` holds; only a fresh agent for the calls after the cut would end that, and the round keeps the referee.

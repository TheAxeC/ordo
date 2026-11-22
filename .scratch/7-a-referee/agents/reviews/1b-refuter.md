# Step 1b refuter report (on .agents/worktrees/7-a-referee-1b, base a7be82a)

## Verification (rerun by the reviewer)

```
$ git status --short
 M skills/academic/referee/SKILL.md
 M skills/academic/referee/agents/referee_agent.md
 M skills/academic/referee/references/second_round.md
 M skills/academic/referee/templates/referee_report_template.md
 M skills/academic/referee/templates/selection_template.md
?? .scratch/7-a-referee/agents/reviews/1b-report.md

$ git diff a7be82a --numstat
6<tab>5<tab>skills/academic/referee/SKILL.md
45<tab>15<tab>skills/academic/referee/agents/referee_agent.md
46<tab>8<tab>skills/academic/referee/references/second_round.md
29<tab>2<tab>skills/academic/referee/templates/referee_report_template.md
42<tab>7<tab>skills/academic/referee/templates/selection_template.md

$ printf '%s\0' skills/academic/referee/SKILL.md skills/academic/referee/agents/referee_agent.md skills/academic/referee/references/second_round.md skills/academic/referee/templates/selection_template.md skills/academic/referee/templates/referee_report_template.md .scratch/7-a-referee/agents/reviews/1b-report.md | xargs -0 perl -CSD -ne 'if (/[^\x20-\x7E\n]/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit=$?"
exit=0

$ sed -n 5p skills/academic/referee/SKILL.md
  version: "1.0.0"

$ wc -l (the five files, in the report's order)
     138 skills/academic/referee/SKILL.md
      94 skills/academic/referee/agents/referee_agent.md
      92 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      88 skills/academic/referee/templates/selection_template.md
     470 total

$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/academic/referee/SKILL.md").read().split("---")[1])["description"]))'
882

$ grep -rn -- '<name>' skills/ utils/ docs/ README.md   (each of the report's twelve names; my run piped each through cut -c1-90, so the hits are given here as file:line)
'"The budget"'                        second_round.md:81  SKILL.md:60,82,122  referee_agent.md:35
'Points found'                        referee_agent.md:33,35,66  selection_template.md:13
'Points over the budget'              selection_template.md:3,5,58  referee_agent.md:38,40,64
'New points'                          referee_agent.md:14  second_round.md:3,29,46,75,79
'"The recommendation"'                referee_agent.md:14,91
'Other observations'                  second_round.md:31,56
'Still missing'                       second_round.md:84  selection_template.md:7,39,54,68
'First-round point"'                  selection_template.md:7  second_round.md:84
'What the revision added or changed'  second_round.md:85  referee_report_template.md:51  selection_template.md:7,40,69
'found counts'                        second_round.md:81  SKILL.md:82,83,113  referee_agent.md:33,66
'remaining first-round point'         second_round.md:71,72,73,76,81,84  referee_report_template.md:48,55  selection_template.md:38,39  referee_agent.md:86,87
'Cut by the budget'                   selection_template.md:17  referee_agent.md:35
(the same hits as the report quotes, in another order; every hit is inside skills/academic/referee/)

$ grep -ln -i referee docs/adr/*.md
docs/adr/0020-a-paper-run-keeps-its-records-in-a-folder-beside-the-manuscript-s-folder.md
docs/adr/0043-paper-s-modes-are-academic-paper-s-copied-with-the-deviations-the-goal-and-the-rulings-keep.md

$ sed -n 30p README.md   (the sentence finding 3.1 is about)
... A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments, which you move between the two lists. ...

$ grep -n -i -w "case" over the lines the diff adds
- In every other case the value is the referee's judgment.

$ a word count of each sentence the diff adds (perl, split at full stops and colons): 25 sentences of more than 24 words; the ones the builder's check 3 does not name are listed in finding 2.1.

Double blank lines, spaced hyphens and semicolons in the added lines: none found.
```

Disclosure: for the two scans of the added lines I wrote one file, `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/added.txt` (the `+` lines of `git diff a7be82a -- skills`). It is outside the repository and the worktree, and it is still there. My task said to write no file anywhere; this one crosses that line. Nothing in the repository, the worktree or the ledger was written or edited.

## Verdicts

Items of "What to build":

1. holds. `agents/referee_agent.md`, "The selection", items 1 to 6 run list, merge, grade, found counts, rank, budget; item 3 says "The budget does not enter a grade."; the template has "Points found" directly above "Budget" with the line "Cut by the budget"; `SKILL.md` item 6 and the Stops row show the found counts at the stop.
2. holds. "The selection", item 3, bullets 1 to 4 carry each sentence of the item; the template's "Why it is major" asks for "the main claim that fails, or cannot be judged, unless the point is settled".
3. holds. "The budget": "A point keeps the grade item 3 of "The selection" gave it, whatever room the budget has left.", "One weakness stays one point, whatever room the budget has left.", "Room left under the budget stays empty.", "A selection with fewer points than the budget, or with no major point, is a complete selection."
4. holds. "The selection", item 2 with its three bullets, and item 10.
5. holds. "The budget", bullets 6 to 8; "The selection", items 7, 8, 9 and 11; "The user's changes", the bullet on a point moved in; the template's section "Points over the budget" and the count line with "Under a point over the budget". See finding 3.5 for a line the section lacks.
6. holds. "The report": "Make the report as long as its points need. The length of the budget and the journal's limit are ceilings: stay within the shorter one, and add no text to come near it."
7. holds. `SKILL.md`: the intake bullet, the Done line of item 5, item 6, the Stops row and the first Anti-patterns row each name `agents/referee_agent.md`, "The budget"; the description is unchanged at 882 characters.
8. holds, by the words of `references/second_round.md` (the opening paragraph; "A remaining first-round point holds only what the first-round point asked and what of it is still missing."; "keeps its first-round number and its first-round title, and no other observation is merged into it"). Finding 1.1 is about the input the referee lacks to follow them.
9. holds. Item 4 keeps the three statuses and adds what the revision and the response did and what is still missing.
10. holds. "New points": the two conditions, "Each new point names what the revision added or changed.", "Most second rounds have no new point."
11. holds. Item 4: "Tell it the two conditions of "New points" in the session's own words ...", "It writes as a new issue only what meets both conditions ...", "It writes everything else it notices under a heading "Other observations" ...", and the Done line.
12. holds. "New points", the last bullet with its three sub-bullets. See finding 3.3 for the scope words of that bullet.
13. holds, by the words ("... and never above its first-round grade", the bullet on a small remainder, the bullet on points read from the response letter, "A change the user makes at the selection stop is kept as the user made it, a regrade included."). Finding 1.1 is about how the referee learns the first-round grade.
14. holds. "The recommendation", three bullets; `agents/referee_agent.md`, "The report", names it.
15. holds. "The report", the three bullets that open "In a second round"; the second block of `templates/referee_report_template.md`; the lines "First-round point", "Still missing" and "What the revision added or changed" of `templates/selection_template.md`.
16. holds for the five files: `SKILL.md` changes at five places only, each named by item 7 or by the stop "The selection"; line 5 reads `  version: "1.0.0"`. A sentence outside the five files that the change makes false is finding 3.1.

Cases:

- C1. met. Item 3 makes the three major and the ten minor ("A weakness that bears on a main claim and leaves it standing is minor"); item 4 writes "3"; with a budget of 7 minor points, seven are selected and three stand under "Points over the budget".
- C2. met. Found count ten; "Select the major points from the top of their ranking, up to the budget's number"; three under "Points over the budget" with a reason "such as "ranked 8 of 10 major points, over the budget of 7"".
- C3. met. "A selection ... with no major point, is a complete selection."; both templates give "None." for the empty heading; nothing in `SKILL.md` items 5 to 7 holds the report back.
- C4. met. Item 2: the same weakness needs "the same claim or passage and the same action of the authors would settle both"; "Comments about different weaknesses stay different points, also where one title could cover them."
- C5. met. "Make the report as long as its points need ... add no text to come near it."
- C6. met. Condition 1 fails for all four, so the EIC writes them under "Other observations", which "New points" makes left-out comments without exception; "The recommendation", second bullet, then gives accept or minor revision.
- C7. met. Both conditions hold; the point carries the Status "a new point of the revision", the line "What the revision added or changed", and stands in the report after the remaining first-round points, "marked as new".
- C8. partial, finding 1.1. The cap "never above its first-round grade" is stated, and nothing on the pages puts the first-round grade of the point in front of the referee.
- C9. met. The remainder is graded "on what is still missing" by item 3, where wording is minor, and "A first-round point resolved in part whose remainder is small becomes a minor point, or is left out with its reason."
- C10. met. The EIC writes the observation under "Other observations" (condition 2 fails); such an entry "is never a point and is never merged into a first-round point"; the first-round point "holds only what the first-round point asked and what of it is still missing". Findings 1.1 and 3.3 name the two places where the words are looser than this result.
- C11. met. Two remaining first-round points graded major by item 3 on what is still missing, each with the line "First-round point"; "In every other case the value is the referee's judgment."

The three questions of the task, from the same reading:

- Reaching exactly the budget's number of major points. By grading up: closed (item 3, "The budget does not enter a grade."; "The budget", bullet 2; "A point you are unsure about is minor."). By splitting: closed ("One weakness stays one point, whatever room the budget has left."). By merging down to the budget: closed (item 2, second bullet, and "The budget comes in at item 6 and at no earlier item."). What is left is the referee's own reading of which claims are main claims, which no wording settles. Where the paper has more major points than the budget, the selection holds exactly the budget's number, as C2 expects, with the found count beside it.
- A new observation of the EIC inside a first-round point, or as a point without both conditions. As a point: closed (an entry of "Other observations" is left out without exception; an entry of the new issues "becomes a new point only when the referee finds that it meets both conditions"). Inside a first-round point: closed for the referee's own merging ("no other observation is merged into it"). One route stays open, the EIC's own text of "what is still missing", finding 1.1.
- "Major revision" with every first-round major point resolved. Not reachable without a new point: "The recommendation is accept or minor revision ... when no new point stands and no first-round major point remains as a major point". With a new point, which needs both conditions, the value is the referee's judgment, as the brief's item 14 has it.

## 1. Spec

1.1. `references/second_round.md`, "The selection and the report", item 6, with "The check of the revision", item 4. Quoted: "Give the referee this page, `revision-check.md` and any reviewer reports, beside what those items give it." and "Done when `revision-check.md` stands in the run folder, with a status for each first-round point, the new issues that meet both conditions or the sentence that there is none, and the other observations."
What is wrong: the new rules have the referee work from four facts about each first-round point: what it asked ("holds only what the first-round point asked"), its number and title ("keeps its first-round number and its first-round title"), its grade ("never above its first-round grade") and whether the points came graded or were read from the response letter ("Where the first-round points are read from the response letter and carry no grade ..."). The referee is given neither the first-round comments nor the response letter. Its only source is `revision-check.md`, and item 4 does not ask the EIC to write any of the four there. The EIC is also not told that "what is still missing" is limited to what the first-round point asked.
Failure scenario, C8: `revision-check.md` reads "point 5: not resolved" with no grade. The referee cannot apply the cap, grades the point by item 3 alone, and may make it major. Second scenario, the route of C10: the EIC writes the overstated abstract into the "still missing" text of the first-round point on the comparisons. The referee has no first-round comment to hold that text against, so the point carries content the first-round comment did not hold.
Names: C8 (partial). Touches items 8 and 13, which hold by their words.

## 2. Proof

2.1. The builder's report, "DONE / NOT DONE", check 3. Quoted: "The departures, each with why it keeps its form:" followed by nine entries.
What is wrong: the list is not complete. My word count finds these added sentences over 24 words that it does not name: `agents/referee_agent.md`, "The selection", item 2 first bullet (26) and item 9 (30); "The budget", first bullet (26); "The user's changes", the bullet on a point moved in (29); "The report", the first two second-round bullets (25, 29); `references/second_round.md`, item 4, "Tell it the two conditions ..." (28) and the Done line (33); "The selection and the report", the bullets that begin "The comments it lists" (29), "A first-round point whose status is resolved" (25), "A first-round point with any other status" (27), "An entry of the new issues" (27), "The found counts count" (25), "Each point says" (28), "Each remaining first-round point says" (25); "The recommendation", first bullet (27); `templates/referee_report_template.md`, the first sentence of the second paragraph (28). It also does not name the bullets that hold two rules, finding 3.4.
Failure scenario: the orchestrator reads check 3 as the full list of places that depart from `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, section E, and lands the rest as checked.

2.2. The builder's report, "The terms". Quoted: "The new sentences avoid the glossary terms "finding", "case", "place", "part", "gate", "kind", "step", "ruling" and "verdict" in any other sense."
What is wrong: `references/second_round.md`, "The recommendation", third bullet, adds "In every other case the value is the referee's judgment." The glossary defines "case" as an example under a brief's "Cases" and as an instance from the tree; this use is neither. `docs/dev/skill-layout.md`, "Writing for an agent": "A term that `docs/glossary.md` defines is used only in a sense it defines there."
Failure scenario: small. A reader takes no wrong action; the report's claim is false, and the page breaks the rule on one word ("Otherwise" says the same).

2.3. The builder's report, "Names and whole-file sentences". Quoted: "`README.md` line 30 ... reread, each still holds, none changed."
What is wrong: finding 3.1.

## 3. Standards

3.1. `README.md`, the row of `referee` in the table of skills; `docs/dev/change-standard.md`, rule 14. Quoted: "A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments, which you move between the two lists."
What is wrong: the stop now shows three lists (the selected points, the points over the budget, the left-out comments) and the user moves items among all three. The builder changed the same words in `SKILL.md`, "first round", item 6, from "moves items between the two lists" to "moves items between the lists", and left the README's sentence. The brief's decision 6 rests on the README's sentences staying true; this one does not. `README.md` is outside the step's paths, so the fix is one line for the orchestrator at landing.
Failure scenario: a user who reads the README expects two lists at the stop and does not look for the cut major points, which are the ones the stop exists to show.
Names: 2.3.

3.2. `references/second_round.md`, "New points" and "The selection and the report"; `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in."
Quoted pairs, each the same rule for the same reader on one page: "A new point is raised only when the two conditions below both hold." and "An entry of the new issues, or a reviewer's comment, becomes a new point only when the referee finds that it meets both conditions of "New points"."; "It is never a point and is never merged into a first-round point." and "no other observation is merged into it"; "Each new point names what the revision added or changed." and "Each new point says, in its line "What the revision added or changed", the material of the revision the defect stands in."; "keeps its first-round number and its first-round title" and "says, in its line "First-round point", its first-round number and title".
Failure scenario: a later change edits one copy (say, loosens the test in "New points") and leaves the other; the referee then has two tests and cannot tell which one holds.

3.3. `references/second_round.md`, "New points", last bullet; `docs/dev/change-standard.md`, rule 19. Quoted: "Every observation that is not about a first-round point and does not meet both conditions is a left-out comment with its reason." against its third sub-bullet, "A comment of the five reviewers is such an observation, unless it is about what is still missing of a first-round point."
What is wrong: the bullet excludes anything "about a first-round point"; the sub-bullet excludes only what is "about what is still missing of a first-round point". An entry of the EIC's new issues that fails the conditions and concerns the topic of a first-round point falls under neither sentence.
Failure scenario: the referee reads such an entry as "about" first-round point 3, concludes the left-out rule does not cover it, and lists it under point 3. The bullet "no other observation is merged into it" forbids that, so the reader has to pick between two sentences. The narrower words in the bullet itself would end it.

3.4. `references/second_round.md`, "The selection and the report"; `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets". Quoted: "A first-round point with any other status is a remaining first-round point, and the points of the selection are the remaining first-round points and the new points."; "A remaining first-round point keeps its first-round number and its first-round title, and no other observation is merged into it."; "The found counts count the remaining first-round points and the new points, and "The budget" of `agents/referee_agent.md` holds for them as in a first round."
Failure scenario: a reviewer of a later diff cannot tell where one rule ends; the second half of each bullet is the one a reader skims past, and in the second bullet it is the rule that keeps observations out of first-round points.
Also in "New points": the two conditions are an unordered set written as a numbered list "1." and "2." inside a page whose numbered items 1 to 6 are run "in order" ("A numbered list means order. An unordered set is a bulleted list."). A reader told "item 2" of this page can land on condition 2.

3.5. `templates/selection_template.md`, "Points over the budget", with `agents/referee_agent.md`, "The user's changes". Quoted: "A point the user moves in from the section "Points over the budget" becomes a selected point, with its grade, its passage and its merged comments as they stand."
What is wrong: a selected major point has the line "Why it is major: [the main claim that fails, or cannot be judged, unless the point is settled]"; a major point over the budget has no such line. Moved in "as they stand", it lacks the line.
Failure scenario: at the stop the user decides whether to move M8 in without seeing which main claim fails under it, and the referee then writes the report's "why it matters for the paper's claims" for that point from nothing in `selection.md`.

3.6. `agents/referee_agent.md`, "The user's changes". Quoted: "The section "Points found" keeps the found counts as you wrote them at the selection."
What is wrong: the section also holds the line "Cut by the budget", and the sentence does not say whether that line is a found count. After the user moves a cut point in, the line either stays ("3 major points") beside a section "Points over the budget" that lists two, or changes; both readings fit.
Failure scenario: the rewritten lists shown to the user at the stop disagree with each other, and the user cannot tell whether the move was applied.

Checked and not found: non-ASCII (the check exits 0); history in a page (no run, date, paper or earlier wording in the five files); text of the `paper-review-panel` skill copied (the new sentences name its sections and statuses and repeat none of its lines); a script; a change to `metadata.version`.

## 4. Behaviour

4.1. The builder's report, "User-visible changes". Not in the table, stated only under judgment call 3: the direction of the intake no longer leaves a comment out. Before: a comment could be left out as "outside the direction" or "minor against the budget". After: every comment that names a weakness is a point, counted in "Points found", and one the budget does not take stands under "Points over the budget"; the left-out comments are only those that name no weakness. A user who sets a narrow direction sees every out-of-direction weakness as a counted point.

4.2. Not in the table, stated only under judgment call 13: `referee-report.md`, the file the user sends, now reads "None." under "Major points" or "Minor points" when the selection has none. Before: the template gave no form for an empty heading.

## Declined to judge

- "Most second rounds have no new point." (`references/second_round.md`, "New points"). The prose standard, section A, lists "most requests" among the vague qualifiers to replace. The brief's item 10 asks for this sentence, so whether it stays is the orchestrator's call, not the builder's defect.
- "Tell it the two conditions of "New points" in the session's own words". The brief's item 11 asks for the session's own words. Whether a paraphrase by the session keeps "by itself" and "fail" each time is a matter for a run (step 2), not for a read.
- Whether a first-round major point the authors did not answer may be graded minor in the second round when item 3 finds the claim standing, which then gives accept or minor revision. The pages say so ("grades a remaining first-round point on what is still missing, by ... item 3"), and the brief's C11 implies it. Whether that is what the ruling "What a second round is" means is the user's call.
- How many points a strict merge leaves under "Points over the budget" on a real set of reports, and what that costs the referee (item 7 has it read the passage of each). Only a run shows it.
- Whether the copy of the builder's report in the main checkout and the one in the worktree are the same file content: I read the main checkout's copy, as the task named it; the comparison I ran printed no difference line, and I did not rerun it on its own.
- The state of the worktree's index and of any commit after a7be82a: `git log` and `git diff --cached` would give it, and neither is among the commands I may run.

Reviewer usage: a7fa4b89e49397c7e, claude-fable-5-2, 182225 tokens, 16 tool uses, 7.0 minutes.

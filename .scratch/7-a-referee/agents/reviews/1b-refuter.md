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

## Repair round 1, refuted

```
$ git status --short   (worktree)
 M skills/academic/referee/SKILL.md
 M skills/academic/referee/agents/referee_agent.md
 M skills/academic/referee/references/second_round.md
 M skills/academic/referee/templates/referee_report_template.md
 M skills/academic/referee/templates/selection_template.md
?? .scratch/7-a-referee/agents/briefs/1b-round-1.md
?? .scratch/7-a-referee/agents/reviews/1b-report.md

$ (ASCII check of the brief's check 1, over the six paths)
exit=0          (no line printed)

$ sed -n 5p skills/academic/referee/SKILL.md
  version: "1.0.0"

$ wc -l skills/academic/referee/SKILL.md skills/academic/referee/*/*.md
     138 skills/academic/referee/SKILL.md
     104 skills/academic/referee/agents/referee_agent.md
     110 skills/academic/referee/references/second_round.md
      58 skills/academic/referee/templates/referee_report_template.md
      95 skills/academic/referee/templates/selection_template.md
     505 total        (the builder's section quotes the same five counts)

$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/academic/referee/SKILL.md").read().split("---")[1])["description"]))'
882

$ git diff a7be82a --numstat
6<tab>5<tab>skills/academic/referee/SKILL.md
55<tab>15<tab>skills/academic/referee/agents/referee_agent.md
65<tab>9<tab>skills/academic/referee/references/second_round.md
29<tab>2<tab>skills/academic/referee/templates/referee_report_template.md
49<tab>7<tab>skills/academic/referee/templates/selection_template.md

$ grep -n 'two lists' README.md   (main checkout)
30:| `referee` | Referees someone else's paper ... A referee agent selects the comments worth sending within the budget and shows you the selected and the left-out comments, which you move between the two lists. The same agent then writes ... (one line)

$ grep -n -i -w case skills/academic/referee/references/second_round.md skills/academic/referee/agents/referee_agent.md
(no output)

$ diff -u <snapshot> <worktree> for each path of files.txt
SKILL.md: no difference. The other four files and the report differ as the builder's section says (read in full).
```

The worktree's `git status` also lists `.scratch/7-a-referee/agents/briefs/1b-round-1.md` as untracked. I ran no command that writes anything.

### Verdicts

The ten closures:

1. Closed. `references/second_round.md`, "The check of the revision", item 4, now has the EIC write number, title, first-round grade or "carries none", what the point asked, status, what the revision and response did, and what is still missing. "What is still missing holds only what the first-round point asked." Item 6 gives the referee the response letter and the first-round comments. The referee page says the grade is the one `revision-check.md` gives.
2. Closed for what the finding quoted. The bullets under 3.4 are split, the two conditions are a bulleted set with the labels "Introduced by the revision" and "A main claim fails", and every sentence my word count finds over 24 words is named in the builder's check 3, except one sentence of the report template's intro that was not changed by the round. Bullets that still hold two rules are finding 6.
3. Closed. "Otherwise the value is the referee's judgment."
4. Closed as ruled: `README.md` is not written, and a replacement is given under "Doc text". The quoted current line is abbreviated, which is finding 5.
5. Closed for the four pairs: the test and "never merged" stand in "New points" only, "names what the revision added or changed" with its line stands in "New points" only, and number and title stand in "The selection and the report" only. Rules still written more than once are finding 7.
6. Closed. The bullet reads "An observation is a left-out comment with its reason when it is not about what is still missing of a first-round point and does not meet both conditions."
7. Closed. The "Major points over the budget" entry in the selection template carries "Why it is major", and item 9 of the selection lists it.
8. Closed. "The two found counts ... stay as you wrote them" and "The line "Cut by the budget" of that section is rewritten to count what the section "Points over the budget" then holds."
9. Closed. Major points over the budget are in full, minor points in one line, and the passage of a minor one is read when it is moved in. The table of user-visible changes has the row "A point over the budget in `selection.md`". A consequence of the one-line form is finding 1.
10. Closed. The row "An empty heading of `referee-report.md`" is in the table.

Items of "What to build":

1. holds.
2. holds.
3. holds.
4. holds.
5. holds. The minor-point form (no passage, no per-point reason) is the round's ruling 9, a narrowing of the brief's "each with its grade, its passage and its merged comments, and a reason that names the budget". See finding 1 for what the one-line form leaves undefined.
6. holds.
7. holds.
8. holds.
9. holds.
10. holds.
11. holds.
12. holds.
13. holds.
14. holds.
15. holds.
16. holds. `SKILL.md` is unchanged by the round, and line 5 reads `  version: "1.0.0"`. Finding 3 is about a sentence of `SKILL.md` and the description that stay silent on a new content of `left-out.md`; they are not false.

Cases:

- C1. met.
- C2. met. Three major points stand under "Major points over the budget" in full, with a reason that names the budget. The found count says ten.
- C3. met.
- C4. met.
- C5. met.
- C6. met.
- C7. met.
- C8. met. The first-round grade now reaches the referee through `revision-check.md`, and "never above" has something to compare against.
- C9. met.
- C10. met. The EIC's still-missing text is limited to what the point asked. The referee holds that text against the first-round comment or the response letter, and text beyond it is an observation. The new abstract observation is left out.
- C11. met.

The questions after the round:

- Does the referee in a second round get each first-round point's number, grade and what it asked? Yes. `revision-check.md` carries all three per point, and the referee also reads what each point asked in the first-round comments or the response letter, as item 6 and "The selection and the report" give it.
- Can text beyond what a first-round point asked still end up inside that point? Not by the pages' own routes: the EIC's text is limited, the referee checks it, a reviewer's comment goes under a point only when it is about what is still missing, and "no other observation is merged". One route is the user's: "A comment the user moves in ... joins the selected point the user names", kept "as the user made it". That is the user's choice.
- Is any rule still written in two places on one page, or do two sentences contradict? Yes, see findings 2 and 7.
- Do `SKILL.md` and the two templates agree with the referee's page and the second-round page on the lists `selection.md` and `left-out.md` hold and on what the stop shows? On the stop and on `selection.md`, yes. On `left-out.md`, `SKILL.md` names the file but never says it now holds the points over the budget (finding 3).

### Findings

#### Spec

1. `agents/referee_agent.md`, "The user's changes" (with `templates/selection_template.md`, "Minor points over the budget"). Quoted: "A point the user regrades changes its section and nothing else." The minor entry is "- m8: [the point, as a phrase]. Comments: ...".
   What is wrong: a minor point over the budget has no passage, no weakness and no "Why it is major". Regraded to major it moves to "Major points over the budget" and, by "nothing else", stays a one-line entry. If the user then moves it in, "A major point the user moves in ... becomes a selected point as it stands there", and the selected major point lacks the passage, the weakness and "Why it is major" that the template and item 7 require. The same holds for a selected minor point regraded to major.
   Failure scenario: the user regrades m8 to major and moves it in at the selection stop. The referee writes the report from `selection.md` and has no passage or reason for that point. It either writes the point from nothing or ties it to a passage it never read.

2. `agents/referee_agent.md`, "The selection", item 2, with `references/second_round.md`, "New points". Quoted: item 2 "Merge the comments about the same weakness into one point" and "A comment that names no weakness of the paper becomes no point"; second-round page "Such an observation is never a point." and "A comment of the five reviewers is held to the same two tests as any other observation."
   What is wrong: item 2 says every comment that names a weakness is a point, which is also why the found counts are "how many ... the paper has". In a second round, observations that name a weakness are left out and never points. The second-round page adds this to each call, but item 2 does not say so, so two sentences give different answers for the same comment. Nothing says that in a second round the found counts exclude such observations.
   Failure scenario: in a second round the referee reads item 2 first, makes a point of a reviewer's weakness comment that fails both conditions, and counts it in "Points found".

3. `SKILL.md`, the description and the introduction ("It leaves behind `referee-report.md`, `selection.md` and `left-out.md`"), with the Anti-patterns row "keep the others in `left-out.md` with a reason each". `agents/referee_agent.md`, "The selection", item 11, has `left-out.md` hold the sections "Points over the budget" and "Left-out comments".
   What is wrong: the description says "the left-out comments, each with its reason", and no sentence of `SKILL.md` says that `left-out.md` also holds the cut points. A minor point over the budget has no reason line, only its heading.
   Failure scenario: a user told to look in `left-out.md` for what the report leaves out does not expect cut major points there. This is low.

#### Proof

4. The builder's report, "DONE / NOT DONE", rows 4, 12 and 15, and "Judgment calls", item 6. Quoted: row 4 "item 2 with its three bullets"; row 12 "the last bullet with its three sub-bullets"; row 15 "the three bullets that begin "In a second round""; item 6 "since condition 2 of its test is the test of a major point".
   What is wrong: item 2 of "The selection" now has four bullets. The last bullet of "New points" has five sub-bullets. "The report" has six bullets that begin "In a second round". "New points" no longer numbers its conditions. The round said it corrected rows 3 and 5 and the judgment call, and these stayed.
   Failure scenario: the orchestrator uses these rows to find where each item is carried, and a row names a count that is not on the page.

5. The builder's report, "Doc text". Quoted: "30: ... A referee agent selects the comments worth sending ... which you move between the two lists. ..."
   What is wrong: `docs/dev/change-standard.md`, "Where the work happens", says a "Doc text" entry quotes the current line with the number `grep -n` prints, "and the quoted text is what locates it". The report abbreviates the line with "...". The sentence it quotes is unique in the line (`grep -c` printed 1), so the place is found, and the replacement text is fine.
   Failure scenario: small. The orchestrator pastes from an abbreviated quote.

#### Standards

6. `agents/referee_agent.md`, "The report", two bullets; `references/second_round.md`, "The check of the revision", item 4. Quoted: "Make the report as long as its points need. The length of the budget and the journal's limit are ceilings: stay within the shorter one, and add no text to come near it."; "In a second round, put any new point after the remaining first-round points, marked as new, with what the revision added or changed."; "It writes as a new issue only what meets both conditions, and names for each what the revision added or changed."
   What is wrong: `docs/dev/skill-layout.md`, "Lists and tables": requirements that can each be broken while the other holds, joined by "and" or a second sentence, are two bullets. Each bullet holds two or three such requirements (stay within the shorter limit, add no padding; where the new point stands, that it is marked, that it names the change; what may be a new issue, that it names the change). The builder's check 3 names the first two as kept for being "a qualifier" and "one instruction for one point". Neither reason is a qualifier of the rule. Each is a second rule.
   Failure scenario: a later change drops "marked as new" and the bullet still reads as followed. A reviewer cannot tell which clause was meant.

7. `references/second_round.md`, "The check of the revision" item 4 and "The selection and the report". Quoted pairs: "It writes as a new issue only what meets both conditions ... It writes everything else it notices under a heading "Other observations"" and "Anything else the EIC notices about that passage or topic is a new issue or an other observation, by the two conditions."; "What is still missing holds only what the first-round point asked.", "A remaining first-round point holds only what the first-round point asked and what of it is still missing." and "Text there that goes beyond what the point asked is an observation under "New points"."
   What is wrong: `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in." The first pair is the same rule twice inside one item. The second is one limit on the content of a first-round point, stated three times, for the EIC and then twice for the referee.
   Failure scenario: someone loosens one copy and leaves the others, and the EIC and the referee then work to different limits on what a remaining point may hold.

#### Behaviour

None beyond finding 1.

### Declined to judge

- "Most second rounds have no new point." is a vague qualifier under the prose standard, section A, but the brief's item 10 asks for the sentence and the round's brief says not to change it. It is the orchestrator's call.
- Whether the paraphrase of the two conditions that the session gives the EIC keeps "by itself" and "fail" each time depends on a run, not on reading.
- Whether a first-round major point that was not answered at all can be graded minor in a second round, when item 3 finds the main claim standing and the recommendation is then accept or minor revision, matches what the user's ruling "What a second round is" means. That is the user's call.
- How many points a strict merge leaves under "Points over the budget" on real reports, and what reading the passages of the major ones costs, depends on a run.
- Whether a major point a user moves out and the recommendation rule "left out as small" fit together (a point left out with the reason "moved out by the user" is not "left out as small"): the page is silent and I did not settle it.
- The README replacement sentence's wording is the orchestrator's, as the round rules.
- Not reviewed: the figure `docs/figures/gen_figures.py`, `referee()`, which the brief says stays true. I did not rerun the plan's whole verify list, which runs once at landing.

Reviewer usage: ae590f6a0158cac61, claude-sonnet-5-5, 141449 tokens, 18 tool uses, 3.3 minutes.

## Closed

- First run, Spec 1.1, Proof 2.1 to 2.3, Standards 3.1 to 3.6 and Behaviour 4.1 and 4.2: each closed by the builder in repair round 1 under its ruling in `agents/briefs/1b-round-1.md`, and each confirmed closed by the run over the round; Standards 3.1, the README's sentence, fixed at landing with the builder's "Doc text".
- Round 1, finding 1, a point regraded to major lacks its passage and reason: fixed at landing in `skills/academic/referee/agents/referee_agent.md`, "The user's changes".
- Round 1, finding 2, item 2 of the selection against "New points": fixed at landing in `references/second_round.md`, "The selection and the report", which says such an observation becomes no point at item 2.
- Round 1, finding 3, `SKILL.md` silent on what `left-out.md` holds: fixed at landing in `SKILL.md`, "first round", item 8.
- Round 1, finding 4, counts in the builder's report: fixed at landing in the saved report `agents/reviews/1b-report.md`.
- Round 1, finding 5, the abbreviated quote of the README's line: the replacement was applied at landing on the full sentence, found once by its words.
- Round 1, finding 6, bullets that hold two rules: fixed at landing, the three quoted bullets split.
- Round 1, finding 7, a rule written twice: fixed at landing in `references/second_round.md`, item 4, which now names the section that states the limit and drops the second copy of the new-issue rule.

## Repair round 2, refuted

Read in the order given. `CLAUDE.md` does not exist at `/Users/axelfaes/workspace/ordo/CLAUDE.md` or in the worktree, so the standards I used are `docs/dev/skill-layout.md` and `docs/dev/change-standard.md`, both under the worktree's `docs/dev/`. I did not open `skills/ordo/repo-setup/templates/docs/dev/prose-standard.md` or `docs/dev/change-standard.md` in full.

## Commands rerun (worktree root)

1. ASCII check over the 7 skill files plus `README.md`, `docs/figures/gen_figures.py` and `1b-report.md`: no output, exit 0.
2. `sed -n 5p skills/academic/referee/SKILL.md`: `  version: "1.0.0"`.
3. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 docs/figures/gen_figures.py`: exit 0. Then `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/referee.svg` only.
4. `env -u ... python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.
5. `grep -n -i 'budget\|words\|length' skills/academic/referee/agents/referee_agent.md` printed three lines: 105 "in the words it needs", 106 "in your own words", and 125 "A report to shorten", which gives a number of words only after the report exists. None gives the referee a number before the report.
6. The description is 1,023 characters, counted from the line's string (1 under the limit, no headroom). This matches the report. The report's line count for `SKILL.md` (219) also matches the page.

The report's quoted checks match my reruns. I did not rerun the report's `grep -rn` name tables. Where I grepped the same names (`new-issues`, `new-points`, "budget"), nothing contradicted them. `README.md` and `gen_figures.py` carry the round's changes consistently with the figure's labels.

## Verdicts per item

| Item | Verdict | Finding |
|---|---|---|
| 1 | violated | Behaviour 1 |
| 2 | holds | Behaviour 2 is a contradiction in the same section |
| 3 | holds | |
| 4 | holds | |
| 5 | holds | |
| 6 | holds | |
| 7 | holds | |
| 8 | holds | Behaviour 2 |
| 9 | holds | Behaviour 4 |
| 10 | holds | Behaviour 3 |
| 11 | holds | Spec 1 |
| 12 | violated | Behaviour 3, Proof 1 |
| 13 | holds | `README.md`, `gen_figures.py`, the regenerated `referee.svg`, glossary, building and scripts pages checked; no sentence made false |
| 14 | holds | |

## Verdicts per case

| Case | Verdict | Finding |
|---|---|---|
| R1 | met | The prompt in `SKILL.md` first round item 5 and `intake.md` hold no number. |
| R2 | met | With five majors the section "Points over the budget" reads "None.". |
| R3 | partial | Behaviour 1 |
| R4 | met | |
| R5 | met | |
| R6 | met | `referee_agent.md` "The selection" item 3, "A claim worded too strongly ... is minor". |
| R7 | met | |
| R8 | met | |
| R9 | met | |
| R10 | partial | Behaviour 5 |
| R11 | partial | Behaviour 6 |
| R12 | met | The sentence is caught at the first rule check if it stands in the one-line selection; Behaviour 3 covers the case where it stands in a minor point written in full later. |
| R13 | met | |

## Findings

### Spec

1. `agents/referee_agent.md`, "The selection" opening, and `templates/selection_template.md` line 9. The text is "You select no point and leave no point out." and "The session writes the sections of `SKILL.md`, 'The session's sections of the selection'". The referee is never given `SKILL.md`, and no template holds "Points over the budget", "Left out of the check of the revision" or a new point's form.
   - Failure: the referee cannot tell which sections the session wrote. At "The user's changes" and "The report" it must leave "a section that the session wrote" alone and keep it out of the report, and it has only the headings it happens to see. After a user change it may rewrite or drop a session section.
   - The same rule check cannot confirm "an entry the rules give to the session".

### Proof

1. `SKILL.md`, "The rule check" and first round steps 6, 8, 9. The check reads `selection.md` at step 6, before the cut, the minor points in full and the session's sections. The stop at step 9 shows a file whose parts were all written after the check:
   - the minor points in full (step 8);
   - "Points over the budget" (step 7);
   - the new points and "Left out of the check of the revision" (second round item 8);
   - any user change (step 9).
   - Failure: an argument for an exception in a minor point written in full at step 8, or a comment listed under a wrong point there, reaches the user with no check. Item 12 asks for the check "before the stop".

### Standards

1. `SKILL.md` first round item 9 has 13 sub-bullets. Several join two requirements, against "One rule per bullet" in `skill-layout.md`:
   - "The user confirms, moves items between the lists, or changes a point from major to minor or back."
   - "The session counts the words again after that return and after the rule check, and sends the report back no second time." (The Budget section.)
   - Failure: a reader cannot tell which part a "Done when" tests.

### Behaviour

1. A count the referee can make, before the report.
   - Place: step 8 (minor points in full) and step 10 (report) of first round, and `second_round.md` item 9. The referee is resumed with `selection.md` after the session's cut. That file shows a non-empty "Points over the budget", and the number of entries under "Selected points" then equals the budget.
   - Quoted text: "Give it the confirmed `selection.md`", and "give no count of them" at step 8.
   - Failure: when the cut fires (R3), the referee can count the most major points and the most minor points at the step 8 call, which is before the report is written. It can also read that a budget exists. Item 1 says no file the referee is given may hold the numbers "at any call before the report is written". The same file goes to the rule check of the report.
   - It holds only in a run with no cut, where the section reads "None.".
2. A rule contradicts another within the referee page.
   - Place: `referee_agent.md`, "The selection" opening, "You select no point and leave no point out", against "The second round": "A first-round point that `revision-check.md` marks as unanswered is a left-out comment" and "The points of your selection are the remaining first-round points."
   - Failure: the agent that follows the opening rule cannot leave an unanswered point out, and the rule check reading both sentences has to pick one. The agent's own conflict is exactly what "The rules hold" tells it to object to in writing.
3. New points are never checked by the rule check, and no other agent judges them.
   - Place: `rule_check_agent.md` "What a break is": "a point whose Status line reads 'a new point of the revision'" is no break of the referee. The new-issue agent's output is the one place item 12's check ("a major point whose 'Why it is major' does not name a main claim ... is a break") is exempted.
   - Failure: one agent's reading puts a point first in the user's selection and into a report that recommends revision. The exempt point is also the one with the most weight (ranked first).
4. A contradiction between EIC files.
   - Place: `second_round.md` item 4, "`new-issues.md` holds ... nothing about a first-round point" and "A point the revision made worse says so beside its status" (in `revision-check.md`), against `new_issue_agent.md`, condition "Introduced by the revision": "or the revision made a first-round point worse".
   - Failure: the EIC that finds a worsened first-round point has no file where it may put the defect as a new issue. Either it breaks the rule that `new-issues.md` names no first-round point, or it drops the issue, and the new-issue agent never receives `revision-check.md` to judge a worsening.
5. A path by which an EIC observation reaches the referee before its selection.
   - Place: `second_round.md` item 5, "The five are fresh agents under the full contract, the EIC among them", and item 7, "Give the referee ... any reviewer reports".
   - Failure: when the user asks for all five, the EIC's own review of the revision, with new-issue comments, goes to the referee. It is left out as "not about a first-round point", so no point is made of it, but the referee reads the new issue before its selection is done. It holds for R10 only when the user did not ask for the five.
6. A rule contradiction between selection order and report order.
   - Place: `SKILL.md` "The session's sections of the selection" and `second_round.md` item 8 ("A new point ranks first among the major points") against `referee_agent.md`, "The report": "put the remaining first-round points first under the major points ... put any new point after the remaining first-round points", and the second-round template.
   - It also conflicts with "Take the confirmed selection as it stands". The rule check of the report reads both.
   - Failure: R11 expects the new point ranked first. The report puts it last, and a referee or checker that follows "as it stands" and one that follows the order bullet reach opposite results.
7. The found counts and the count line do not cover the second round's additions.
   - Place: `referee_agent.md` "The second round", "The found counts count the remaining first-round points", and the template's "Count" line.
   - Failure: new points and the session's left-out entries stand in `selection.md` but not in the counts. The stop shows found counts "beside the budget" that omit the new point the cut counts as major, and the count-line check ("the counts of the lists add up to the comments of the reports") fails for any second round with a new issue.

## Declined to judge

- `skills/academic/paper-review-panel/` pages, including the EIC page: not changed by this round, and the round's rule that every page an agent reads says "The rules hold" does not reach them. I did not verify the EIC's behaviour against the instruction in `second_round.md` item 4.
- `1b-report.md`: the sections outside "Repair round 2" and the "Names the round adds" greps were not reread against the tree, except as stated above.
- The `.svg` geometry: read only the labels (aria-label and title) and the `gen_figures.py` diff. A visual check of the layout was not made.
- `docs/glossary.md` terms used in new places (the report's "terms" section): not read against their entries beyond the grep for `referee`, `budget` and `round`.
- The first refuter report `1b-refuter.md` and the Rulings: read in part by grep; I did not check each first-round finding against the new pages.
- Whether `wc -w` on a markdown file is the right measure for a journal's length limit: a judgment for the user, not checked.

Usage: agent a3ca2ba385c8bda09, claude-sonnet-5-5, 114853 tokens, 12 tool uses, 2.6 minutes.

## Repair round 3, refuted

Standards read: `docs/dev/skill-layout.md` in full. I did not open `prose-standard.md` or `change-standard.md`.

## Commands rerun (worktree root)

1. ASCII check, `LC_ALL=C grep -n '[^ -~]'` over the 7 skill files, `README.md`, `docs/figures/gen_figures.py` and `1b-report.md`: no output.
2. `sed -n 5p skills/academic/referee/SKILL.md` printed `  version: "1.0.0"`.
3. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 docs/figures/gen_figures.py`: exit 0. `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/referee.svg` only.
4. `env -u ... python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
5. `grep -n -i 'budget\|words\|length' skills/academic/referee/agents/referee_agent.md` printed lines 25, 117, 118 and 136:
   - 25 and 136 are the report to shorten. They give no number before the report exists.
   - 117 and 118 read "the words it needs" and "your own words".
   - None gives a number before the report.
6. The description is 1,023 characters, from `yaml.safe_load`.

The page set matches the report's quoted checks. The snapshot-to-worktree delta I read was `files.txt`'s ten paths, in part. Sections of `1b-report.md` outside "Repair round 3" were checked only by grep.

## The ten earlier findings

| Earlier finding | State | Place that closes it |
|---|---|---|
| Spec 1, referee told about sections it is not given | Closed | The referee is given `selected-points.md` and the two templates. `grep -rn "SKILL\|second_round" agents templates` prints nothing. |
| Proof 1, parts of the selection reach the user unchecked | Closed | `SKILL.md` first round item 9, "The user's changes" (the rule check reads each rewrite). Residual: Behaviour 6 and 7 below. |
| Standards 1, joined rules in bullets | Closed in part | Some bullets are split. Joined bullets remain: Standards 1 below. |
| Behaviour 1, the referee can work out the budget | Closed in part | `selected-points.md` has no cut section, count or count line. Behaviour 1 below. |
| Behaviour 2, "select no point and leave no point out" | Closed | `referee_agent.md` line 32 now reads "Every weakness that the rules below make a point is written as a point". The sentence was reworded, not dropped. Residual: Behaviour 4. |
| Behaviour 3, a new point checked by nobody | Closed | `second_round.md` item 7, `rule_check_agent.md` row of `new-points.md`, `new_issue_agent.md` "A return from the rule check". |
| Behaviour 4, where a worsened first-round point's added defect goes | Closed | `second_round.md` item 5, lines 43 to 44, with `new_issue_agent.md` condition 1. |
| Behaviour 5, a new-issue comment reaches the referee | Closed in part | `second_round.md` items 4, 5 and 8 route the five reports to the EIC. Behaviour 3 below is a contradiction in that routing. |
| Behaviour 6, order of a new point | Closed | Four places agree: `SKILL.md` 181, `second_round.md` 91 and 98, `referee_agent.md` 152 and 109, and the template's second block. |
| Behaviour 7, counts in a second round | Closed in part | Behaviour 5 below. |

- No finding is closed by removing the rule it guarded. The rule check's exemption of a new point is replaced by a check of `new-points.md`.
- The round reaches beyond the findings in one place. A user's move of a whole entry is now the session's, and the referee no longer rewrites `selection.md` after a change. This adds the section "Points the user moved out" and the four-section `left-out.md`. It is needed to close finding 1, so I do not count it as a defect.

## Verdicts per item of round 3

| Item | Verdict | Finding |
|---|---|---|
| 1 | violated | Behaviour 1 |
| 2 | holds | Behaviour 6 and 7 are edge gaps |
| 3 | holds | |
| 4 | holds | Behaviour 4 is a different sentence |
| 5 | holds | |
| 6 | holds | |
| 7 | holds | Behaviour 3 |
| 8 | holds | Spec 1 is a different pointer |
| 9 | violated | Behaviour 5 |
| 10 | violated | Standards 1, Standards 2 |

## Verdicts per case

| Case | Verdict | Finding |
|---|---|---|
| R1 to R2, R4 to R13 | met | R12 is met by `rule_check_agent.md` line 29. R13 is met by the section "Objections" shown at the stop (`SKILL.md` line 104). |
| R3 | met | The referee can still count what remains: Behaviour 1. |
| R14 | partial | Behaviour 1 |
| R15 | met | `SKILL.md` first round item 9 reads the minor points in full before the stop. |
| R16 | met | `second_round.md` item 7 |
| R17 | partial | Behaviour 3 |

## The walk, agent by agent

The referee's first-round call is given `referee_agent.md`, the manuscript, `intake.md`, the reports and `selection_template.md`. Its resumed calls are given `selected-points.md`, and the report call also `referee_report_template.md`.

| Call | Files the agent is given | What shows a number or a cut |
|---|---|---|
| Field analyst, reviewers | Manuscript, direction | Nothing |
| EIC (second round) | Revised manuscript, response letter, first-round comments, card, protocol, and the five reports when asked | Nothing |
| Referee, selection | As listed above; in a second round `revision-check.md`, the response letter and first-round comments, no reports | See below |
| Rule check of `selection.md` | The referee's page, the selection template, in a second round `revision-check.md` | Nothing |
| Referee, minor points in full | `selected-points.md` | The file shows fewer points than the referee found |
| Rule check of `selected-points.md` | The same pages plus `revision-check.md` in a second round | Nothing |
| New-issue agent | `new-issues.md`, the revised manuscript, the response letter, the template | Nothing |
| Rule check of the report | `referee-report.md`, confirmed `selected-points.md` | Nothing |

- Before the report is written, the files in the run folder include `selection.md` with "Points over the budget" and "Count after the cut", and, from step 10, `left-out.md` with the cut points. No prompt names them, but the folder is the referee's working folder.
- No file or prompt holds the most major points, the most minor points or a length. The first-round page names "selected points ... which the session writes" and says "you drop none on account of how many points there are". This is a hint that a session selection exists.
- Paths of a new issue to the referee: the second round has none other than `revision-check.md`, if the EIC sorts a new-material comment under a first-round point (Behaviour 3).
- Text the user is shown or the report is written from, without a rule check:
  - the EIC's "Other observations" (shown as left-out entries);
  - a report corrected after the stop "The breaks left in the report" (Behaviour 7).
- Missing inputs: a rule check "resumed" for a rewrite after the user's change, where none was started (Behaviour 6).
- Contradictions of two rules: Behaviour 3 and 4.
- Pages that point at a page the agent is not given: none found for the referee, rule check or new-issue agent.
- `README.md` and the figure script: no sentence made false. The README row and alt text match `SKILL.md`.
- Stale lines in `1b-report.md`: Proof 1.

## Findings

### Spec

1. `SKILL.md` lines 253 and 240, "An agent that thinks a rule gives a wrong result follows the rule and writes its objection where its page's 'The rules hold' says".
   - The reviewers, the field analyst and the EIC run from `paper-review-panel` pages, which have no "The rules hold" section. The EIC is told session-written rules (`second_round.md` items 5 and 39 to 41).
   - Failure: the EIC that finds the two conditions wrong for a case has no place to put its objection. It decides alone, or the objection is lost.
   - Small: one sentence naming the file `revision-check.md` or `new-issues.md` as the place.
2. `SKILL.md` line 90, "Done when `selection.md` holds the session's sections".
   - "The session's sections" no longer names a heading; the section it named was removed. A builder or session cannot tell which sections are meant.
   - Small: name them (Selected points, Points over the budget, Count after the cut).

### Proof

1. `1b-report.md` lines 70, 507 and 514 still name "The session's sections of the selection", which no longer exists. The brief said to correct each earlier line the round makes out of date.
   - Failure: a reader checking the report against `SKILL.md` finds a heading that is not there.
   - Small.

### Standards

1. Bullets that join two rules, against "One rule per bullet" and "Steps: one action per item":
   - `SKILL.md` 140 ("keeps the four numbers and shows them to the user at the stops").
   - 155 ("counts the words again after that return, and again after the rule check of the report").
   - 199 ("carries the text back, removes the section ... and writes `left-out.md` again").
   - First-round items 10 and 14 each hold three or more actions in the item's first line.
   - `referee_agent.md` 63 ("counts with its point and never stands among the left-out comments") and 66 ("Fill the count line ... and check it").
   - `second_round.md` 38 ("as that page gives it ... and in no other section of it").
   - Failure: a reviewer testing "Done when" cannot tell which half failed.
   - Small each; about eight edits.
2. `SKILL.md` "The user's changes" (lines 187 to 200) is a `##` reference section, but only a run where the user changes the selection reads it.
   - Layout says a row-6 section holds "only material every run reads", and material needed in some runs goes in `references/<name>.md`, named by its path from the step.
   - Failure: the standard is not met.
   - Not small: a new `references/` page and the pointers in items 10 and 14.

### Behaviour

1. `agents/referee_agent.md` line 80 ("which you do not open again") against the run folder's contents.
   - After the cut, `selection.md` (with "Points over the budget" and "Count after the cut") and, from item 10, `left-out.md` stand in the folder the referee writes into.
   - The referee reads them if it chooses; only its own page's rule bars it. Round 3 item 1 asks that no call "lets it read that a cut was made or how many points it moved". The builder's report concedes the one inference from `selected-points.md`.
   - Failure: a referee that lists the folder reads "Points over the budget" and the count, and learns the cut and the number. The page's own "Rules are rules" holds only if the agent complies.
   - Also: `selected-points.md` with 7 majors shows the most major points to a referee that knows it found 9.
   - Not small. The cut files would be written outside the folder the referee is given, or the referee's later calls would go to a fresh agent. That is a judgment for Axel.
2. `referee_agent.md` line 32, "The selection finds every point the paper has", and line 53 ("how many major points the paper has") against the second round (lines 150 and 170: only remaining first-round points, observations left out).
   - Line 143 says the second-round rules "add to each call", but they restrict.
   - Failure: a second-round referee following line 32 raises a point for a baseline weakness.
   - Small: "every point the paper has" becomes "every point of the comments you are given".
3. `second_round.md` item 5, lines 39 to 41 against line 59.
   - Lines 40 to 41 tell the EIC that "the two conditions narrow what 'New Issue Detection' has it write as a new issue".
   - Line 59 says a reviewer's comment about changed material is a new issue "whatever the EIC finds of the two conditions".
   - Failure: an EIC following 40 to 41 puts a reviewer's comment on a defect the revision introduced under "Other observations". The new-issue agent never judges it (R17 partial). If it sorts the comment as "still missing" of a first-round point, it reaches the referee through `revision-check.md`.
   - Small: say that lines 40 to 41 bind the EIC's own findings, and line 59 binds reviewers' comments.
4. `second_round.md` item 5, line 44, and `new_issue_agent.md` line 28, "to the degree the other condition gives".
   - The phrase is circular, and the EIC can lean either way for a worsened first-round point.
   - Small.
5. The counts in a second round:
   - The referee writes "Points found" and "Count" (`entries of revision-check.md`). The session writes "Count after the cut" (`SKILL.md` 169 to 172).
   - "Count after the cut" counts new issues, new points and left-out new issues. It counts no entry of "Other observations", which is listed under "Left out of the check of the revision".
   - It is not updated when the user moves a point at the stop.
   - Failure: the user is shown a count that omits the observation entries and is stale after a move; the count line does not add up in a second round with observations.
   - Small: one bullet on who counts "Other observations", and when "Count after the cut" is refreshed.
6. `SKILL.md` line 215, "read by the same rule-check agent, resumed", where step 9 is skipped when no minor point stands in `selected-points.md`.
   - No rule-check agent for `selected-points.md` exists to resume. A user change then has no agent to read the referee's rewrite.
   - Small.
7. `SKILL.md` line 229, the stop "The breaks left in the report".
   - The referee's correction after the user's answer is never read by a rule check or counted for length.
   - Failure: the text the user sends under their name has no check.
   - Small: allow one further rule check, or state that it is unchecked.
8. `SKILL.md` line 228, the stop "The selection", lists the shown items but not "Left out of the check of the revision" or "Points the user moved out". Item 10 of `second_round.md` adds the first.
   - Failure: a session following the Stops row alone omits two sections.
   - Small.

## Declined to judge

- The `paper-review-panel` pages: not changed. Whether the EIC follows the sorting rule is not checked.
- The SVG layout: I read the labels and `gen_figures.py` only.
- `docs/glossary.md`, `building.md` and `scripts.md` beyond the grep for `referee`.
- Whether `wc -w` fits a journal's length limit: a judgment for Axel.
- The builder's `grep -rn` name tables: not rerun, except where I grepped the same names.

Usage: agent a8d9eb6c178218674, claude-sonnet-5-5.

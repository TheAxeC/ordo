---
name: referee
description: "Referee someone else's paper for a journal: run five reviewers on the manuscript, have a referee agent grade and rank every point their comments make, keep at most a budget of major and minor points, show the selected points, the points over the budget and the left-out comments for the user to move, and write one referee report in one reviewer's voice, in the journal's fields, each point tied to its passage. A fresh agent checks the selection and the report against the referee's rules. A second round checks a revision against the authors' response letter. It leaves behind the referee report, the selection and the left-out comments, each with its reason, in a run folder beside the manuscript. Triggers on: /referee, /referee re-review, referee this paper, write a referee report, referee report, review this paper as its referee, review a submission for a journal, I was asked to review this manuscript, referee the revision, second-round referee report, review the revised manuscript against the authors' response."
metadata:
  version: "1.0.0"
---

# Referee someone else's paper

`/referee <manuscript>` is the referee review of the glossary: one referee report on someone else's paper, written by one reviewer from the reviewer's side for the editor. It is neither a draft review nor a panel review. It leaves behind `referee-report.md`, `selection.md`, `left-out.md` and `budget.md` in the run folder (Rules).

## Quick start

```
/referee <manuscript>                                                                 referee the paper, a path or pasted text: the first round
/referee re-review <revised manuscript> <response letter> [<the first-round comments>]  referee the revision against the authors' response: the second round
Referee this paper: [paste paper or provide file]                                     a plain request, whose words give the round (Steps 1)
```

## Use instead

| When | Use |
|---|---|
| The author's own paper to review by a panel of reviewers and an editor | `/paper-review-panel` |
| The author's own draft to review | `/paper draft-review` |

## What it reads

1. The `paper-review-panel` skill's folder, which stands beside this skill's folder, with its `SKILL.md`. A folder that is missing, or that holds no `SKILL.md`, is the refusal "The panel skill is not installed".
2. The manuscript, as a file or as pasted text. A call that gives none is the refusal "A missing input".
3. In a second round, the authors' response letter. A second-round call that gives none is the refusal "A missing input".
4. In a second round, the referee's first-round comments, when the call gives them.
5. The pages of the `paper-review-panel` skill that the steps name, each read by the role the step starts.
6. `agents/referee_agent.md`, `templates/selection_template.md` and `templates/referee_report_template.md`, read by the referee.
7. `agents/rule_check_agent.md`, read by the rule check, and `agents/new_issue_agent.md`, read by the new-issue agent of a second round.
8. `references/second_round.md`, read by the session only, and only in a second round.
9. `references/user_changes.md`, read by the session only, and only when the user changes the selection at the stop "The selection".

## Steps

Steps 1 to 3 run in order, in both rounds.

1. Read the call and settle the round.
   - Check the folder of "What it reads" 1 first, before anything is written.
   - A call `/referee re-review ...` is a second round.
   - Every other call `/referee ...` is a first round, and takes all its arguments as the manuscript.
   - A plain request that says it is a revision, a second round or a re-review is a second round.
   - A plain request that does not say the round is the stop "The round", asked once.
   - Check the inputs of the round as "What it reads" 2 and 3 give them.
   - Done when the round and its inputs are known, or a refusal is raised.
2. Create the run folder before the intake, at the place and under the name the first three bullets of Rules give.
   - Done when the folder is there and holds no file.
3. Go on with the settled round: "first round" for a first round, "re-review" for a second round.
   - Done when that subsection's last item is done.

### first round

1. Ask the intake in one message, before any agent starts: the stop "The intake".
   - Ask the direction of the review, such as a methodological focus. With none given, the direction is "balanced".
   - Ask the severity of the review. With none given, the severity is "medium".
   - Ask the budget: the most major points, the most minor points and the length of the report in words. With none given, the budget is 7 major points, 7 minor points and 800 words.
   - Say in the question that each number of the budget is a ceiling, as "The budget" says.
   - Ask the journal's fields, the values of its recommendation and its length limit. With no fields named, the fields are the default ones of `templates/referee_report_template.md`.
   - Ask whether to shrink the panel, and to which reviewers. With no answer, all five reviewers run.
   - Write the direction and the severity in the user's own words.
   - Write to `intake.md` the direction, the severity, the journal's fields and the values of its recommendation, and nothing else.
   - Keep the budget, the journal's length limit and the panel in the session, as "The budget" says of the four numbers.
   - Done when `intake.md` stands in the run folder with those four answers, each as given or as its default.
2. Start the field analyst from the `paper-review-panel` skill's `agents/field_analyst_agent.md`, as that skill's "Steps", "full", item 1 says.
   - Give it the manuscript and the direction of `intake.md`, and ask that each reviewer's focus carries the direction.
   - Done when the Reviewer Configuration Card stands in the run folder.
3. Show the user the Reviewer Configuration Card, as the `paper-review-panel` skill's "Steps", "full", item 2 says: the stop "The Reviewer Configuration".
   - Done when the user has confirmed the card, which holds each identity the user adjusted.
4. Start the reviewers of the panel at once, each from its page of the `paper-review-panel` skill, as that skill's "Steps", "full", item 3 says.
   - The pages are that skill's `agents/eic_agent.md`, `agents/methodology_reviewer_agent.md`, `agents/domain_reviewer_agent.md`, `agents/perspective_reviewer_agent.md` and `agents/devils_advocate_reviewer_agent.md`.
   - A panel of all five runs under "The full contract" of that skill's `SKILL.md`, each reviewer in two calls.
   - A panel shrunk to the EIC and the methodology reviewer runs under "The methodology-focus contract" of that skill's `SKILL.md`, each in two calls.
   - Any other shrunk panel runs each of its reviewers in one call, with no contract.
   - A reviewer the intake left out is not started.
   - A reviewer marked unusable under a contract is the stop "`[PANEL-SHRUNK]`", as in that skill.
   - Done when the report of each reviewer of the panel stands in the run folder, or the stop "`[PANEL-SHRUNK]`" is raised.
5. Start the referee as a fresh agent for the selection.
   - Give it `agents/referee_agent.md`, the manuscript, `intake.md`, every reviewer's report and `templates/selection_template.md`.
   - Give it none of the four numbers of "The budget", in the prompt or in a file the prompt names.
   - It works as `agents/referee_agent.md`, "The selection", says.
   - Start no editorial synthesizer in its place.
   - Done when `selection.md` stands in the run folder with the found counts, every major point in full and every minor point in one line.
6. Run the rule check on `selection.md`, as "The rule check" says.
   - Done when the rule check names no break, or its two returns are used.
7. Apply the cut and write `selected-points.md`, as "The budget" and "The files of the selection" say.
   - Done when `selection.md` holds the sections "Selected points", "Points over the budget" and "Count after the cut", and `selected-points.md` stands in the run folder.
8. Resume the referee to write the selected points in full.
   - Give it `selected-points.md` and nothing else of the run folder.
   - It writes as `agents/referee_agent.md`, "The selected points in full", says.
   - With no minor point in `selected-points.md`, the referee is not resumed here.
   - Done when each minor point of `selected-points.md` stands in full.
9. Run the rule check on `selected-points.md`, as "The rule check" says.
   - With no minor point in `selected-points.md`, this rule check is not run.
   - Done when the rule check names no break, or its two returns are used.
10. Show the user the selection: the stop "The selection".
    - First carry the text of `selected-points.md` back, as "The files of the selection" says.
    - Then write `left-out.md`.
    - `left-out.md` holds the sections "Points over the budget", "Left-out comments", "Left out of the check of the revision" and "Points the user moved out", as they stand in `selection.md`.
    - Show the found counts beside the budget.
    - Show the selected points, the points over the budget and the left-out comments with their reasons.
    - Show each section "Objections" an agent has written.
    - Show each break a rule check still names after its two returns.
    - The user confirms, or changes the selection.
    - A change is made as `references/user_changes.md` says.
    - The rewritten lists are shown again after a change.
    - Done when the user has confirmed, and `selection.md`, `selected-points.md` and `left-out.md` hold each change the user made.
11. Resume the referee for the report.
    - Give it the confirmed `selected-points.md` and `templates/referee_report_template.md`, and no length.
    - It writes as `agents/referee_agent.md`, "The report", says.
    - Done when `referee-report.md` stands in the run folder.
12. Check the length of the report, as "The budget" says.
    - Done when the report is within the limit, or has gone back to the referee once.
13. Run the rule check on `referee-report.md`, as "The rule check" says.
    - A break it still names after its two returns is the stop "The breaks left in the report".
    - Done when the rule check names no break, or the user has answered that stop.
14. End the run.
    - Write `budget.md`, as "The budget" says.
    - Send a message that names `referee-report.md`, `left-out.md` and `budget.md` by their paths.
    - The message says that `left-out.md` holds the points over the budget and the left-out comments.
    - The message quotes each objection an agent wrote after the stop "The selection".
    - Write no Revision Roadmap and hold no coaching dialogue: the run ends here.
    - Done when the message is sent.

### re-review

1. Run the items of `references/second_round.md`, in its order.
   - Done when the rule check of `referee-report.md` is done, or a stop of the first round that ends a run is raised.
2. End the run as item 14 of the first round says.
   - Done when the message is sent.

## The budget

The budget is the most major points, the most minor points and the length of the report in words. With the journal's length limit, these are the four numbers of a run.

- Each of the four numbers is a ceiling.
- A selection with fewer points than the budget, or with no major point, is complete.
- A report shorter than the limit is complete.
- The session keeps the four numbers.
- The session shows the four numbers to the user at the stops.
- No prompt and no file given to an agent holds one of the four numbers.
- The one exception is the return of a report over the limit, below.
- No prompt and no file given to an agent before the report is written says that a cut was made, or how many points it moved.
- The cut is made after the rule check of `selection.md`, on the ranking as the referee wrote it.
- When `selection.md` holds more major points than the most major points, the lowest-ranked major points over that number move to "Points over the budget".
- The minor points are cut in the same way, against the most minor points.
- A move takes the whole entry as it stands, in rank order.
- The session changes no grade, no rank and no text of a point.
- A selection the user pushes past the budget at the stop "The selection" stays as the user made it.
- The limit of the length is the shorter of the budget's length and the journal's length limit.
- Once `referee-report.md` is written, the session counts its words with `wc -w`.
- A report within the limit stands.
- A report over the limit goes back to the referee once, with the limit as the number of words to stay within.
- The referee shortens it as `agents/referee_agent.md`, "A report to shorten", says.
- The session counts the words again after that return.
- The session counts the words once more after the rule check of the report.
- A report goes back for its length no second time.
- A report that ends over the limit is named in the end message with its count of words.
- When the run ends, the session writes `budget.md`: the four numbers, the found counts, each point the cut moved, each count of words, and whether the report went back for its length.

What the referee can still work out: it wrote the selection, so it can see that `selected-points.md` holds fewer points than it found. That changes no grade and no length. The grades and the ranks stand in `selection.md`, which the session holds and the rule check has read, and the session carries back from `selected-points.md` only what "The files of the selection" names. The referee is given no length before the report is written, and the number of points gives none.

## The files of the selection

After the rule check of `selection.md`, that file is the session's: no agent is given it again, and the session shows it to the user at the stop "The selection".

- The session moves the major points and the minor points the cut leaves under a `##` section "Selected points", each under its own heading, in rank order.
- "Points over the budget" is a `##` section before "Left-out comments", with the headings "Major points over the budget" and "Minor points over the budget".
- Each of those two headings holds the entries the cut moved, in rank order, or "None.".
- "Count after the cut" is a `##` section at the end, which the session fills as the bullets below say.
- For each grade it gives the points the referee found, the new points of a second round, their sum, the points under "Selected points" and the points over the budget.
- The points under "Selected points" and the points over the budget add up to that sum, for each grade.
- In a second round it also gives the entries of the section "New issues" of `new-issues.md`, the new points and the left-out new issues, which add up to those entries.
- In a second round it also gives the entries of "Other observations" of `new-issues.md`, each of which stands under "Left out of the check of the revision".
- The found counts the session shows beside the budget are the sums of "Count after the cut".
- The session fills "Count after the cut" again after each change of the user.
- `selected-points.md` is written by the session in the form of the second block of `templates/selection_template.md`.
- `selected-points.md` holds the points under "Selected points", each as it stands in `selection.md`, and in a second round the list "First-round points resolved".
- `selected-points.md` holds no point over the budget, no found count, no count line and no left-out comment.
- The referee writes into `selected-points.md`, and the session carries its text back into `selection.md`.
- An entry is carried back whole, into the place of the entry of the same number under "Selected points".
- A point of `selected-points.md` whose number stands nowhere in `selection.md` was written by the referee after the cut.
- The session moves such a point whole, last under the heading of its grade in "Points over the budget", and takes it out of `selected-points.md`.
- The session counts such a point in "Count after the cut", and shows it at the stop "The selection", where the user may move it in.
- An objection of `selected-points.md` is carried into the section "Objections" of `selection.md`.
- A grade, a number or an order that differs in `selected-points.md` is carried back only where a change of the user asked for it.
- In a second round, each new point of `new-points.md` goes first under "Major points", as it stands there.
- In a second round, "Left out of the check of the revision" is a `##` section after "Left-out comments".
- That section lists each left-out comment of `new-points.md` with its reason.
- That section also lists each entry of "Other observations" of `new-issues.md`, with the reason "an observation outside the first-round points".
- That section reads "None." when it has no entry.

## The rule check

The rule check is a fresh agent that reads a file an agent wrote against the rules of that agent's page. It reads the file before the user is shown it, and before the report is written from it.

- Start it from `agents/rule_check_agent.md`.
- One fresh agent reads `selection.md`, another `selected-points.md`, another `referee-report.md` and, in a second round, another `new-points.md`.
- Give it the files the table of its page lists for the file it reads, and no other file of the run folder.
- Give it none of the four numbers of "The budget".
- Name its output file: `rule-check-selection.md`, `rule-check-selected-points.md`, `rule-check-report.md` or `rule-check-new-points.md`.
- With no break named, the run goes on.
- With a break named, resume the agent that wrote the file with the breaks, as "A return from the rule check" of its page says.
- After the correction, resume the same rule-check agent to read the file again.
- A file goes back to the agent that wrote it at most 2 times for each reading the steps ask for.
- Each rewrite of `selected-points.md` after a change of the user is a reading of its own.
- That reading is made by the rule-check agent of `selected-points.md`, resumed, or by a fresh one when none was started.
- A break of `selection.md`, `selected-points.md` or `new-points.md` still named after the second return is shown at the stop "The selection".
- A break of `referee-report.md` still named after the second return is the stop "The breaks left in the report".

## Stops

The first five rows wait for the user. The row with a tag ends the run before its report, and the last two are refusals, which name their cause and leave nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The round | A plain request does not say whether it is a first or a second round (Steps 1) | The question which round it is, with the inputs each round takes | The user's answer; the run goes on under the subsection of that round |
| The intake | Before any agent starts (first round item 1; `references/second_round.md`, "The intake") | The questions of the intake, each with its default, in one message | The user's answers; an unanswered question takes its default |
| The Reviewer Configuration | After the field analyst ends (first round item 3) | The Reviewer Configuration Card | The user confirms it, or adjusts reviewer identities and then confirms |
| The selection | After the selected points in full and their rule check, before the report is written (first round item 10) | The found counts beside the budget, the selected points, major and minor, the points over the budget, the left-out comments with their reasons, the points the user moved out, each section "Objections", each break a rule check still names and, in a second round, the first-round points resolved and the section "Left out of the check of the revision" | The user confirms, or moves items and then confirms |
| The breaks left in the report | The rule check still names a break of `referee-report.md` after its two returns (first round item 13) | Each break with its rule and the sentence that breaks it, and the objections of the rule check | The user accepts the report as it stands, or says what to change, which the session returns to the referee once; the rule check then reads the report once more and the session counts its words, and what they find is named in the end message |
| `[PANEL-SHRUNK]` | A reviewer is marked unusable under a contract (first round item 4) | The tags the `paper-review-panel` skill's Stops table gives for this stop | Nothing: the run ends, and the review starts again with `/referee` |
| The panel skill is not installed | The `paper-review-panel` folder with its `SKILL.md` does not stand beside this skill's folder (Steps 1) | That `referee` runs the pages of the `paper-review-panel` skill, and that this skill is not installed beside it | The skill installed, then `/referee` again |
| A missing input | The call gives no manuscript, or a second-round call gives no response letter (Steps 1) | The round's line of Quick start | The call corrected, then `/referee` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Carrying every comment of the panel into the report | A report with too many points hides the ones the editor must act on | Cut as "The budget" says, and keep the others in `left-out.md` with a reason each |
| Telling the referee a number of the budget or a length | A referee that knows a number grades and writes up to it | Keep the four numbers in the session, as "The budget" says |
| An agent that argues its way past a rule | The exception it grants itself reaches the user as if the rule had held | The agent follows the rule and writes its objection for the user, as its page's "The rules hold" says |
| A report that shows the panel | The editor asked one reviewer, and a report that speaks of several is not one the user can send | Write in the first person singular of one reviewer, as `agents/referee_agent.md`, "The report", says |
| A copy of a page of `paper-review-panel` in this skill | The copy drifts from the page the panel runs | Name the page with its skill, and start the role from it |
| Writing a revision roadmap or coaching the author | The manuscript is someone else's, and the report goes to the editor | End the run at the report |

## Rules

- The run folder is `referee-runs/<round>-<date>/` in the manuscript's folder, with `<round>` being `round-1` for a first round and `round-2` for a second round, and `<date>` the local date, `date +%Y-%m-%d`.
- A manuscript given as pasted text has no folder of its own, and its run folder is made in the folder the session runs in.
- A second run of the same round on one day is `<round>-<date>-2`, and a third `<round>-<date>-3`.
- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer's report with the outputs of its calls, `selection.md`, `rule-check-selection.md`, `selected-points.md`, `rule-check-selected-points.md`, `left-out.md`, `referee-report.md`, `rule-check-report.md` and `budget.md`.
- A second round also holds `revision-check.md` and `new-issues.md`, the two files of the EIC's check of the revision, and `new-points.md` with `rule-check-new-points.md` when the new-issue agent ran.
- Every rule of this skill's pages holds whatever the reasons, for the session as for each agent.
- An agent that thinks a rule gives a wrong result follows the rule and writes its objection where its page's "The rules hold" says.
- The session, in the same position, follows the rule and states its objection in its next message to the user.
- An agent started from a page of the `paper-review-panel` skill is told the two bullets above in its prompt, and writes its objection under a heading "Objections" at the end of its output.
- Every agent of a run, the referee included, starts fresh on the runner's general-purpose agent, with the runner's defaults and with no model and no effort set in its prompt.
- An agent's prompt holds its role's page and the files of its task.
- A reviewer's second call under a contract goes to the same agent, as the last bullet of the `paper-review-panel` skill's Rules says.
- The rules "IRON RULE: READ-ONLY CONSTRAINT" and "IRON RULE: UNTRUSTED REVIEW MATERIALS" of the `paper-review-panel` skill's Rules hold for every agent of a run, the referee included.
- The manuscript is someone else's: every output is written for the user as its referee or for the editor, and none advises its author on the author's side.

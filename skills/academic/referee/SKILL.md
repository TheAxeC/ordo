---
name: referee
description: "Referee someone else's paper for a journal: run five reviewers on the manuscript, select the comments worth sending within a budget of major points, minor points and words, show the selected and the left-out comments for the user to move, and write one referee report in one reviewer's voice, in the journal's fields, each point tied to its passage. A second round checks a revision against the authors' response letter. It leaves behind the referee report, the selection and the left-out comments, each with its reason, in a run folder beside the manuscript. Triggers on: /referee, /referee re-review, referee this paper, write a referee report, referee report, review this paper as its referee, review a submission for a journal, I was asked to review this manuscript, referee the revision, second-round referee report, review the revised manuscript against the authors' response."
metadata:
  version: "1.0.0"
---

# Referee someone else's paper

`/referee <manuscript>` is the referee review of the glossary: one referee report on someone else's paper, written by one reviewer from the reviewer's side for the editor. It is neither a draft review nor a panel review. It leaves behind `referee-report.md`, `selection.md` and `left-out.md` in the run folder (Rules).

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
7. `references/second_round.md`, read only in a second round.

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
   - Ask the budget: the most major points, the most minor points and the length of the report in words. With none given, the budget is 7 major points, 7 minor points and 1,200 words.
   - Say in the question that each number of the budget is a ceiling, as `agents/referee_agent.md`, "The budget", says.
   - Ask the journal's fields, the values of its recommendation and its length limit. With no fields named, the fields are the default ones of `templates/referee_report_template.md`.
   - Ask whether to shrink the panel, and to which reviewers. With no answer, all five reviewers run.
   - Write the direction and the severity in the user's own words.
   - Done when `intake.md` stands in the run folder with each answer and each default taken.
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
   - It selects as `agents/referee_agent.md`, "The selection", says.
   - Start no editorial synthesizer in its place.
   - Done when `selection.md` and `left-out.md` stand in the run folder, and `selection.md` holds the found counts and a selection as `agents/referee_agent.md`, "The budget", says.
6. Show the user the found counts beside the budget, the selected points, the points over the budget and the left-out comments with their reasons: the stop "The selection".
   - The user confirms, moves items between the lists, or changes a point from major to minor or back.
   - When the user changes anything, resume the same referee agent with the user's changes. It rewrites `selection.md` and `left-out.md` as `agents/referee_agent.md`, "The user's changes", says.
   - Show the user the rewritten lists, which the user confirms or changes again.
   - With no change, the referee is not resumed here.
   - Done when the user has confirmed and, where the user changed anything, the referee has rewritten the two files.
7. Resume the same referee agent for the report.
   - Give it the confirmed `selection.md` and `templates/referee_report_template.md`.
   - It writes as `agents/referee_agent.md`, "The report", says.
   - Done when `referee-report.md` stands in the run folder.
8. End the run with a message that names `referee-report.md` and `left-out.md` by their paths, and says that `left-out.md` holds the points over the budget and the left-out comments.
   - Write no Revision Roadmap and hold no coaching dialogue: the run ends here.
   - Done when the message is sent.

### re-review

1. Run the items of `references/second_round.md`, in its order.
   - Done when `referee-report.md` stands in the run folder, or a stop of the first round that ends a run is raised.
2. End the run as item 8 of the first round says.
   - Done when the message is sent.

## Stops

The first four rows wait for the user. The row with a tag ends the run before its report, and the last two are refusals, which name their cause and leave nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The round | A plain request does not say whether it is a first or a second round (Steps 1) | The question which round it is, with the inputs each round takes | The user's answer; the run goes on under the subsection of that round |
| The intake | Before any agent starts (first round item 1; `references/second_round.md`, "The intake") | The questions of the intake, each with its default, in one message | The user's answers; an unanswered question takes its default |
| The Reviewer Configuration | After the field analyst ends (first round item 3) | The Reviewer Configuration Card | The user confirms it, or adjusts reviewer identities and then confirms |
| The selection | After the referee's selection, before the report is written (first round item 6) | The found counts beside the budget, the selected points, major and minor, the points over the budget, the left-out comments with their reasons and, in a second round, the first-round points resolved | The user confirms, or moves items and then confirms |
| `[PANEL-SHRUNK]` | A reviewer is marked unusable under a contract (first round item 4) | The tags the `paper-review-panel` skill's Stops table gives for this stop | Nothing: the run ends, and the review starts again with `/referee` |
| The panel skill is not installed | The `paper-review-panel` folder with its `SKILL.md` does not stand beside this skill's folder (Steps 1) | That `referee` runs the pages of the `paper-review-panel` skill, and that this skill is not installed beside it | The skill installed, then `/referee` again |
| A missing input | The call gives no manuscript, or a second-round call gives no response letter (Steps 1) | The round's line of Quick start | The call corrected, then `/referee` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Carrying every comment of the panel into the report | A report with too many points hides the ones the editor must act on | Select as `agents/referee_agent.md`, "The budget", says, and keep the others in `left-out.md` with a reason each |
| A report that shows the panel | The editor asked one reviewer, and a report that speaks of several is not one the user can send | Write in the first person singular of one reviewer, as `agents/referee_agent.md`, "The report", says |
| A copy of a page of `paper-review-panel` in this skill | The copy drifts from the page the panel runs | Name the page with its skill, and start the role from it |
| Writing a revision roadmap or coaching the author | The manuscript is someone else's, and the report goes to the editor | End the run at the report |

## Rules

- The run folder is `referee-runs/<round>-<date>/` in the manuscript's folder, with `<round>` being `round-1` for a first round and `round-2` for a second round, and `<date>` the local date, `date +%Y-%m-%d`.
- A manuscript given as pasted text has no folder of its own, and its run folder is made in the folder the session runs in.
- A second run of the same round on one day is `<round>-<date>-2`, and a third `<round>-<date>-3`.
- Each output is a file of its own in the run folder: `intake.md`, the Reviewer Configuration Card, each reviewer's report with the outputs of its calls, `selection.md`, `left-out.md` and `referee-report.md`.
- A second round also holds `revision-check.md`, the EIC's check of the revision.
- Every agent of a run, the referee included, starts fresh on the runner's general-purpose agent, with the runner's defaults and with no model and no effort set in its prompt.
- An agent's prompt holds its role's page and the files of its task.
- A reviewer's second call under a contract goes to the same agent, as the last bullet of the `paper-review-panel` skill's Rules says.
- The rules "IRON RULE: READ-ONLY CONSTRAINT" and "IRON RULE: UNTRUSTED REVIEW MATERIALS" of the `paper-review-panel` skill's Rules hold for every agent of a run, the referee included.
- The manuscript is someone else's: every output is written for the user as its referee or for the editor, and none advises its author on the author's side.

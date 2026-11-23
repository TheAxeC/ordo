# The second round

A second round reviews a revision against the authors' response letter: how the authors answered each first-round point, and whether each answer is enough. Its selection and its report are built on the first-round points. A new point is an exception ("New points"). `SKILL.md`, "re-review", runs the items below in order. An item that says "as in the first round" is run as the named item of `SKILL.md`, "first round", says.

This page is the session's. No agent is given it, and the rules of `SKILL.md`, Rules, hold for it whatever the reasons.

## The inputs

1. Take the revised manuscript and the authors' response letter, the two inputs a second round requires. A call that lacks one is the refusal "A missing input", raised at `SKILL.md`, Steps 1.
   - The referee's first-round comments are optional.
   - With them, the first-round points are the points of those comments.
   - Without them, the first-round points are read from the points the response letter quotes or answers.
   - Done when the source of the first-round points is known: the comments, or the response letter.

## The intake

2. Ask the intake as in the first round, item 1, with one question replaced.
   - The question on shrinking the panel is not asked.
   - Ask in its place whether all five reviewers review the revision again. With no answer, they do not.
   - Done when `intake.md` stands in the run folder as item 1 of the first round gives it.

## The check of the revision

3. Start the field analyst and show the Reviewer Configuration Card, as in the first round, items 2 and 3.
   - Give the field analyst the revised manuscript and the direction of `intake.md`.
   - Done when the user has confirmed the card.
4. When the user asked for all five at the intake, start the five reviewers on the revised manuscript, as in the first round, item 4.
   - The five are fresh agents under the full contract, the EIC among them.
   - Without that answer, start none of them.
   - The five reports go to the EIC of item 5 and to no other agent.
   - Done when the five reports stand in the run folder, or the stop "`[PANEL-SHRUNK]`" is raised, or the user did not ask for them.
5. Start the EIC that makes the check, a fresh agent from the `paper-review-panel` skill's `agents/eic_agent.md`, in one call, with no contract.
   - Give it the revised manuscript, the response letter, the first-round comments when the call gave them, its card and the `paper-review-panel` skill's `references/re_review_mode_protocol.md`.
   - Give it the five reports of item 4 when they were written.
   - Tell it that in this call its output is the check of the revision, written to the run folder as two files, in place of the EIC Review Card.
   - `revision-check.md` holds the first-round points, each with what the bullets below give it, and nothing else.
   - `new-issues.md` holds the sections "New issues" and "Other observations", and everything that is not about what a first-round point asked.
   - It checks each first-round point against the revised manuscript and the response, as that page gives it in "Verification Logic" and "New Issue Detection".
   - It follows no other section of that page.
   - Tell it the two conditions of `agents/new_issue_agent.md`, "The two conditions", in the session's own words.
   - Tell it that the two conditions narrow what "New Issue Detection" has it write as a new issue.
   - Of what it notices itself, it writes as a new issue what it finds to meet both conditions.
   - A comment of the five reports is sorted as the bullets on the five reports below say, and the two conditions are not applied to it here.
   - It names for each new issue what the revision added or changed.
   - A defect the revision added to a first-round point it made worse is written as a new issue, with the number of that first-round point.
   - In `revision-check.md` such a point says "made worse" beside its status, and holds none of the added defect.
   - It writes everything else it notices under "Other observations", each with its passage.
   - The first-round points stand where that page has the Revision Roadmap: a first-round major point is checked as a Priority 1 item, a first-round minor point as a Priority 2 item, and there is no Priority 3 item.
   - Where the first-round points are read from the response letter and carry no grade, each is checked as a Priority 1 item.
   - The check gives each first-round point one of three statuses: resolved, resolved in part, or not resolved.
   - That page's FULLY_ADDRESSED is resolved, its PARTIALLY_ADDRESSED is resolved in part, and its NOT_ADDRESSED and its MADE_WORSE are not resolved.
   - A first-round point is marked "unanswered" beside its status when the response letter gives no answer to it and the revision changed nothing for it.
   - For each first-round point it writes the point's first-round number and its title.
   - For each first-round point it writes the point's first-round grade, or that the point carries none.
   - For each first-round point it writes, in one sentence, what the point asked.
   - Beside its status, each first-round point says what the revision and the response did for it.
   - A first-round point whose status is not "resolved" also says what is still missing.
   - Tell it that what is still missing is limited to what the first-round point asked.
   - It sorts every comment of the five reports into one of three.
     - A comment about what is still missing of a first-round point is listed with that point in `revision-check.md`, with its report and its number.
     - A comment about material the revision added or changed is written under "New issues", whatever the EIC finds of the two conditions.
     - Every other comment is written under "Other observations".
   - The section "New issues" says so when there is none.
   - Start no editorial synthesizer, and hold none of the Socratic guidance of that page.
   - Done when `revision-check.md` and `new-issues.md` stand in the run folder.

## New points

A new point is a point of a second round that no first-round point holds. Most second rounds have no new point.

6. When the section "New issues" of `new-issues.md` holds one new issue or more, start the new-issue agent as a fresh agent from `agents/new_issue_agent.md`.
   - Give it its page, the revised manuscript, the response letter, `new-issues.md` and `templates/selection_template.md`.
   - Give it neither `revision-check.md` nor any file of the referee.
   - It judges each new issue against the two conditions of its page and against nothing else.
   - With no new issue, the agent is not started.
   - Done when `new-points.md` stands in the run folder, or the agent was not started.
7. Run the rule check on `new-points.md`, as `SKILL.md`, "The rule check", says.
   - A break goes back to the new-issue agent.
   - With no `new-points.md`, this rule check is not run.
   - Done when the rule check names no break, or its two returns are used.

## The selection and the report

8. Run the selection and its rule check, as in the first round, items 5 and 6.
   - Give the referee `revision-check.md` and the response letter, beside what item 5 of the first round gives it.
   - Give the referee the first-round comments when the call gave them.
   - Give the referee no report of the five reviewers.
   - Give the referee neither `new-issues.md` nor `new-points.md`.
   - Name neither of those two files in the referee's prompt.
   - The referee works as `agents/referee_agent.md`, "The second round", adds to "The selection".
   - Done when the rule check of `selection.md` names no break, or its two returns are used.
9. Add to `selection.md` what the new-issue agent and the EIC wrote, as `SKILL.md`, "The files of the selection", says.
   - A new point stands first among the major points, ahead of every remaining first-round point.
   - A new point is listed under no other point.
   - No comment is listed under a new point but its own new issue.
   - The session adds the entries as they stand in `new-points.md` and changes no text of them.
   - Done when each new point, each left-out new issue and each other observation of the EIC stands once in `selection.md`.
10. Run the rest of the round as in the first round, items 7 to 13.
    - The cut counts the new points among the major points.
    - `selected-points.md` holds each new point first under "Major points", and the report keeps that order.
    - The selection stop also shows the list "First-round points resolved" and the section "Left out of the check of the revision".
    - A first-round point left out because the authors did not answer it stands among the left-out comments, where the user may move it in.
    - Done when the rule check of `referee-report.md` is done.

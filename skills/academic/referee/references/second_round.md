# The second round

A second round reviews a revision against the authors' response letter. `SKILL.md`, "re-review", runs the items below in order. An item that says "as in the first round" is run as the named item of `SKILL.md`, "first round", says.

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
   - Done when `intake.md` stands in the run folder with each answer and each default taken.

## The check of the revision

3. Start the field analyst and show the Reviewer Configuration Card, as in the first round, items 2 and 3.
   - Give the field analyst the revised manuscript and the direction of `intake.md`.
   - Done when the user has confirmed the card.
4. Start the EIC from the `paper-review-panel` skill's `agents/eic_agent.md`, in one call, with no contract.
   - Give it the revised manuscript, the response letter, the first-round comments when the call gave them, its card and the `paper-review-panel` skill's `references/re_review_mode_protocol.md`.
   - Tell it that in this call its output is the check of the revision, written to the run folder as `revision-check.md`, in place of the EIC Review Card.
   - It checks each first-round point against the revised manuscript and the response, as that page gives it in "Verification Logic" and "New Issue Detection", and in no other section of it.
   - The first-round points stand where that page has the Revision Roadmap: a first-round major point is checked as a Priority 1 item, a first-round minor point as a Priority 2 item, and there is no Priority 3 item.
   - Where the first-round points are read from the response letter and carry no grade, each is checked as a Priority 1 item.
   - The check gives each first-round point one of three statuses: resolved, resolved in part, or not resolved.
   - That page's FULLY_ADDRESSED is resolved, its PARTIALLY_ADDRESSED is resolved in part, and its NOT_ADDRESSED and its MADE_WORSE are not resolved.
   - A point the revision made worse says so beside its status.
   - Start no editorial synthesizer, and hold none of the Socratic guidance of that page.
   - Done when `revision-check.md` stands in the run folder, with a status for each first-round point and the new issues of the revision.
5. When the user asked for all five at the intake, start the five reviewers on the revised manuscript, as in the first round, item 4.
   - The five are fresh agents under the full contract, the EIC among them, beside the EIC that made the check.
   - Without that answer, start none of them.
   - Done when the five reports stand in the run folder, or the stop "`[PANEL-SHRUNK]`" is raised, or the user did not ask for them.

## The selection and the report

6. Run the selection, the selection stop and the report, as in the first round, items 5 to 7.
   - Give the referee this page, `revision-check.md` and any reviewer reports, beside what those items give it.
   - The selection stop shows the user the list "First-round points resolved" beside the selected points and the left-out comments.
   - Done when `referee-report.md` stands in the run folder.

The referee adds this to each of its calls of `agents/referee_agent.md`:

- The comments it lists are the entries of `revision-check.md`, each first-round point with its status and each new issue, and every comment of any reviewer report.
- A first-round point whose status is resolved goes in a third list of `selection.md`, "First-round points resolved", with one clause on how the revision resolved it.
- Every listed comment stands once, in one of the three lists.
- Each selected point says, in its Status line, whether it is a first-round point not resolved, a first-round point resolved in part, or a new point of the revision.
- The report's general comments name the resolved points from the list "First-round points resolved".

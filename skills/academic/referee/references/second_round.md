# The second round

A second round reviews a revision against the authors' response letter: how the authors answered each first-round point, and whether each answer is enough. Its selection and its report are built on the first-round points. A new point is an exception ("New points"). `SKILL.md`, "re-review", runs the items below in order. An item that says "as in the first round" is run as the named item of `SKILL.md`, "first round", says.

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
   - Tell it the two conditions of "New points", in the session's own words.
   - Tell it that the two conditions narrow what "New Issue Detection" has it write as a new issue.
   - It writes as a new issue only what meets both conditions.
   - It names for each new issue what the revision added or changed.
   - It writes everything else it notices under a heading "Other observations" of `revision-check.md`, each with its passage.
   - The first-round points stand where that page has the Revision Roadmap: a first-round major point is checked as a Priority 1 item, a first-round minor point as a Priority 2 item, and there is no Priority 3 item.
   - Where the first-round points are read from the response letter and carry no grade, each is checked as a Priority 1 item.
   - The check gives each first-round point one of three statuses: resolved, resolved in part, or not resolved.
   - That page's FULLY_ADDRESSED is resolved, its PARTIALLY_ADDRESSED is resolved in part, and its NOT_ADDRESSED and its MADE_WORSE are not resolved.
   - A point the revision made worse says so beside its status.
   - For each first-round point it writes the point's first-round number and its title.
   - For each first-round point it writes the point's first-round grade, or that the point carries none.
   - For each first-round point it writes, in one sentence, what the point asked.
   - Beside its status, each first-round point says what the revision and the response did for it.
   - A first-round point whose status is not "resolved" also says what is still missing.
   - Tell it that what is still missing is limited to what the first-round point asked, as "The selection and the report" says of a remaining first-round point.
   - The section of the new issues says so when there is none.
   - Start no editorial synthesizer, and hold none of the Socratic guidance of that page.
   - Done when `revision-check.md` stands in the run folder with the first-round points, the new issues and the other observations.
5. When the user asked for all five at the intake, start the five reviewers on the revised manuscript, as in the first round, item 4.
   - The five are fresh agents under the full contract, the EIC among them, beside the EIC that made the check.
   - Without that answer, start none of them.
   - Done when the five reports stand in the run folder, or the stop "`[PANEL-SHRUNK]`" is raised, or the user did not ask for them.

## New points

A new point is a point of a second round that no first-round point holds. Most second rounds have no new point.

- A new point is raised only when the two conditions below both hold.
  - **Introduced by the revision.** The defect stands in material the revision added or changed, or the revision made a first-round point worse to the degree the other condition gives.
  - **A main claim fails.** The defect by itself makes a main claim of the revised paper fail, or impossible to judge.
- Each new point names what the revision added or changed, in its line "What the revision added or changed" of `selection.md`.
- A new point is a major point: the condition "A main claim fails" is the test of `agents/referee_agent.md`, "The selection", item 3.
- An observation is a left-out comment with its reason when it is not about what is still missing of a first-round point and does not meet both conditions.
  - Such an observation is never a point.
  - Such an observation is never merged into a first-round point.
  - An entry of "Other observations" of `revision-check.md` is such an observation.
  - A weakness that stood in the first version, and that the first-round comments did not raise, is such an observation.
  - A comment of the five reviewers is held to the same two tests as any other observation.

## The selection and the report

6. Run the selection, the selection stop and the report, as in the first round, items 5 to 7.
   - Give the referee this page, `revision-check.md`, the response letter and any reviewer reports, beside what those items give it.
   - Give the referee the first-round comments when the call gave them.
   - The selection stop shows the user the list "First-round points resolved" beside what the first round shows there.
   - Done when `referee-report.md` stands in the run folder.

The referee adds this to each of its calls of `agents/referee_agent.md`:

- The comments it lists are the entries of `revision-check.md` and every comment of any reviewer report.
- A resolved first-round point goes in the list "First-round points resolved" of `selection.md`, with one clause on how the revision resolved it.
- A first-round point with any other status is a remaining first-round point.
- The points of the selection are the remaining first-round points and the new points.
- A remaining first-round point holds only what the first-round point asked and what of it is still missing.
- The referee reads what each first-round point asked in the first-round comments, or in the response letter when the call gave no comments.
- The referee holds the "still missing" text of `revision-check.md` against what the point asked.
- Text there that goes beyond what the point asked is an observation under "New points".
- A remaining first-round point keeps its first-round number and title, written in its line "First-round point".
- What is still missing of a remaining first-round point stands in its line "Still missing".
- A reviewer's comment about what is still missing of a first-round point is listed under that point.
- The referee applies "New points" to each entry of the new issues and to each reviewer's comment, whatever `revision-check.md` calls it.
- The referee grades a remaining first-round point on what is still missing, by `agents/referee_agent.md`, "The selection", item 3.
- That grade is never above the point's first-round grade, which `revision-check.md` gives.
- A first-round point resolved in part whose remainder is small becomes a minor point, or is left out with its reason.
- A first-round point that carries no grade takes as its first-round grade the grade item 3 gives to what it asked.
- Where the revision made a first-round point worse to the degree of "New points", the added defect is a new point.
- A first-round point the revision made worse keeps its own grade.
- A change the user makes at the selection stop is kept as the user made it, a regrade included.
- At item 2 of `agents/referee_agent.md`, "The selection", an observation that "New points" leaves out becomes no point.
- The found counts count the remaining first-round points and the new points.
- "The budget" of `agents/referee_agent.md` holds for those points as in a first round.
- Every listed comment stands once: under a selected point, under a point over the budget, among the left-out comments, or as a resolved first-round point.
- The Status line of each point reads one of three: a first-round point not resolved, a first-round point resolved in part, or a new point of the revision.
- The report takes the form `agents/referee_agent.md`, "The report", gives for a second round.

## The recommendation

- The recommendation rests on the statuses of the first-round points, the major ones first, and on whether a new point stands.
- Both are read from the confirmed `selection.md`.
- With no new point and no first-round major point remaining as a major point, the recommendation is accept or minor revision, or the journal's value for either.
- A first-round major point no longer remains as a major point when it is resolved, a minor point, or left out as small.
- Otherwise the value is the referee's judgment.

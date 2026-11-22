# Round 1 of step 1: the findings of the review, each with its ruling

The brief `.scratch/6-paper-review/agents/briefs/1.md` stays in force. The review is `.scratch/6-paper-review/agents/reviews/1-refuter.md` in the main checkout; its findings are restated here in full. Each ruling says what to change. Nothing else on the pages changes.

## Paths this round writes

- `skills/academic/paper-review/references/calibration_mode_protocol.md`
- `skills/academic/paper-review/examples/interdisciplinary_review_example.md`
- `skills/academic/paper-review/agents/eic_agent.md`
- `skills/academic/paper-review/agents/methodology_reviewer_agent.md`
- `skills/academic/paper-review/agents/domain_reviewer_agent.md`
- `skills/academic/paper-review/agents/perspective_reviewer_agent.md`
- `skills/academic/paper-review/agents/devils_advocate_reviewer_agent.md`
- `skills/academic/paper-review/agents/editorial_synthesizer_agent.md`
- `.scratch/6-paper-review/agents/reviews/1-report.md`

## The findings

1. Spec 1. `references/calibration_mode_protocol.md`, "Same-family / rubric-aware judging", the bullet "Calibration mode is the exception". The source's parenthesis that points at the Phase 1 paragraph names no missing thing and was left out. Ruling: the parenthesis is put back. The clause reads: `calibration itself is opt-in (see "Cross-model verification" under Phase 1); at least one of the runs should use a different family when configured.`
2. Spec 2. `examples/interdisciplinary_review_example.md`, "Domain Review Report: R2 (Summary)", Strengths item 1. The comma that replaced the dash makes "five major dimensions" read as a sixth item of the list. Ruling: a colon stands there: `industry-academia collaboration: five major dimensions, more comprehensive than most similar studies`.
3. Spec 3. `references/calibration_mode_protocol.md`, the paragraph "Cross-model evaluation", its bullet on the other judge paths. The clause after the colon, "the citation-claim alignment judge already supports a non-default judge model, and the suite is designed to work single-model", is on a judge and a suite that do not exist in this repository (`grep -rln -i 'alignment judge' skills` prints only this page). Ruling: the clause is left out under edit 2, with its colon; the bullet ends after its bold words, with a full stop. The report lists it among what is left out.
4. Proof 1. The builder's report, "Per page, what is left out", quotes the left-out bullet as "where M >= 1". The source has the not-equal sign. Ruling: the report's quote reads `where M != 1`, and for the synthesizer's page `where M != 2`, in each place it quotes the bullet.
5. Standards 1. The six pages with "Phase Boundary", the first bullet under "You MUST NOT:". The bullet now holds only the source's parenthesis, itself a prohibition, so the list reads as forbidding it. Ruling: the bullet keeps the forbidden action with only the directory mechanism left out, and the source's parenthesis after it, as `paper`'s formatter page has its bullet. The bullets read:
   - `agents/methodology_reviewer_agent.md`, `agents/domain_reviewer_agent.md`, `agents/perspective_reviewer_agent.md`, `agents/devils_advocate_reviewer_agent.md`: `- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 synthesis)`
   - `agents/eic_agent.md`: `- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 editorial synthesis: that's the editorial synthesizer's work)`
   - `agents/editorial_synthesizer_agent.md`: `- WRITE files of a phase other than Phase 2 (no regress into Phase 1 reviewer territory: do not rewrite or augment reviewer cards; if a reviewer's card is incomplete, flag it, do not silently fix)`
   This ruling replaces the bullet of edit 2 in the brief on the `phase{M}_*/` bullet, and the EIC case's sentence on the first bullet reads accordingly.

## Verify before you report

From the worktree's root, checks 1 to 4 of the brief's "Verify before you report" again, and `diff` of each of the eight pages against its source read whole.

## Report

Append to `.scratch/6-paper-review/agents/reviews/1-report.md` in the worktree a section `## Round 1`: per finding, the change made, with the page and the line as it now reads; then the checks' output as printed. Correct the quotes of finding 4 in place.

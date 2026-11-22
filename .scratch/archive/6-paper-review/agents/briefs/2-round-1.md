# Round 1 of step 2: the findings of the review, each with its ruling

The brief `.scratch/6-paper-review/agents/briefs/2.md` stays in force. The review is `.scratch/6-paper-review/agents/reviews/2-refuter.md` in the main checkout; its findings are restated here in full. Each ruling says what to change. Nothing else changes.

## Paths this round writes

- `skills/academic/paper-review/SKILL.md`
- `docs/figures/gen_figures.py`
- `docs/figures/paper-review.svg`
- `docs/glossary.md`
- `.scratch/6-paper-review/agents/reviews/2-report.md`

## The findings

1. Spec 1. `SKILL.md`, Steps, "guided", item 1 runs Phase 1 "as full items 1 to 3 say", so under the full contract, while "Sprint Contract Protocol" and `references/guided_mode_protocol.md` say guided has no contract. Ruling: item 1 of "guided" says that Phase 0 runs as full items 1 and 2 say, and that the five reviewers then start at once, each in one call, with no sprint contract, with what `references/guided_mode_protocol.md`, "How It Works", changes. Its "Done when" line names the five reports in the run folder and no `[PANEL-SHRUNK]`. Read "re-review" and "calibration" the same way: where an item starts a reviewer in a mode without a contract, it says no sprint contract holds, in one clause, and names no stop of the contract.
2. Spec 2. `docs/figures/gen_figures.py`, the note of `paper_review()`: "Guided: all seven, with the EIC's dialogue." The steps of guided start the field analyst and the five reviewers and never the editorial synthesizer. Ruling: the note says for guided what the steps of "guided" start: the field analyst and the five reviewers, then the EIC's dialogue. Read the note's sentence for each other mode against that mode's steps and correct any that differs. `python3 docs/figures/gen_figures.py` is run again and writes `docs/figures/paper-review.svg`; no other figure changes.
3. Spec 3. `SKILL.md`, Steps 1: "A call with two arguments or more whose first is none of the six mode names is the refusal "Unknown mode"." This refuses pasted text and a path with a space, which name no mode. Ruling: the refusal "Unknown mode" is for a call whose first argument is one word that is neither one of the six mode names nor a path that exists, followed by a path that exists. Every other call whose first argument is no mode name takes all its arguments as the manuscript, a path or pasted text, and runs `full`. The bullets of Steps 1, the row "Unknown mode" of Stops and the Quick start comments agree with this.
4. Spec 4. `SKILL.md`, What it reads, item 1 refuses any call that gives no manuscript, and calibration's call gives none. Ruling: item 1 says the manuscript is read in every mode but calibration, and that a call of such a mode that gives none is the refusal "A missing input".
5. Spec 5. `SKILL.md`, Agent prompts: the sentence "Each reviewer's page states them under `## Phase Boundary` and `## Sprint Contract Protocol`, with the two calls under `### Phase 1: Paper-content-blind pre-commitment` and `### Phase 2: Paper-visible review`." is not in the source and the brief names no such addition. Ruling: the sentence is removed.
6. Declined to judge, the glossary entry **panel review**: "Agent prompts" holds the words only as the name of Phase 1. Ruling: the entry's "Stated in:" reads `` `skills/academic/paper-review/SKILL.md`, the opening paragraph ``, which states the review by the panel and the editor's decision with the Revision Roadmap. The definition's words stay.

## Verify before you report

From the worktree's root: the checks of the brief's "Verify before you report" and the commands of its "Cases" again.

## Report

Append to `.scratch/6-paper-review/agents/reviews/2-report.md` in the worktree a section `## Round 1`: per finding, the change made, with the text as it now reads; every sentence the round wrote, quoted; then the checks' output as printed.

# Landing of step 5 of roadmap entry 27

Roadmap entry 27, a newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill. Step 5 of 9, a figure for every skill, landed. Next: step 6, the README rewrite.

## Open items

- Open item I (2026-11-26), step 5's check: your reading of the figures against their skills. Step 5 is booked and on main. The sixteen new figures: `docs/figures/code/diagnose.svg`, `code/wizard.svg`, `code/handbook.svg`, `explain/wait-what.svg`, `explain/tutor.svg`, `orchestration/land.svg`, `orchestration/plan.svg`, `orchestration/plan-orchestration.svg`, `orchestration/plan-retro.svg`, `orchestration/refute.svg`, `orchestration/roadmap.svg`, `orchestration/spec.svg`, `ordo/ordo-help.svg`, `ordo/ordo-init.svg`, `ordo/session-retro.svg` and `academic/researcher/lifecycle.svg`. The figures that changed: `orchestration/grill.svg` and `orchestration/pipeline.svg` (the stop "Another entry's rulings file"), `academic/referee.svg`, `academic/submit.svg`, `academic/grant.svg`, `code/codebase-design.svg`, `academic/researcher/manuscript.svg`, `research.svg` and `revision.svg` (a stop that waits on you, added to each), and `academic/paper/disclosure.svg` (its two stops apart, and the selector of the call). Read each figure against its skill's Steps and Stops: each box a step, an agent or a stop of the skill; each orange box a stop where the run waits on you; no refusal drawn. The choices the builder made: in `plan`, "The plan exists" is drawn as a refusal; `ordo-init` has 17 boxes to hold its eleven stops; in `plan-orchestration`, `/spec`, `/refute` and `/land` are steps the session does itself; in the lifecycle figure, a research question cause in Compare is named in the note, not drawn.
  - (a) Approve the figures as they stand. Pro: step 6's README uses the figures as they are on main, and step 8's pin follows. Con: none known.
  - (b) Name the figures and what is wrong in each; they are redrawn on main before step 6 lands. Pro: a figure that misstates its skill is fixed before the README shows it. Con: step 6 waits for the redraw.
  - Recommendation: (a), since the first reviewer read each new figure against its skill's Steps and Stops and found no stop missing or misdrawn, and the run over the round read the twelve paper figures stop by stop; the figures' layout as a picture is read by no one but you; the lazy option is (a) taken without reading the figures.

## The check of Steps 1

ListAgents listed no agent of this session, only peer sessions; the builder and both reviewers had finished.

## NOT DONE

Nothing of the brief. The step's check holds the user's reading of the figures, Open item I.

## What landed

### Step 5, a figure for every skill (landed 2026-11-26)

- Landed: `docs/figures/gen_figures.py` draws fifteen new figures of a skill's steps (`code/diagnose`, `code/wizard`, `code/handbook`, `explain/wait-what`, `explain/tutor`, `orchestration/land`, `plan`, `plan-orchestration`, `plan-retro`, `refute`, `roadmap`, `spec`, `ordo/ordo-help`, `ordo-init`, `session-retro`) through a helper `_steps` and the kinds `step`, `judge` and `folder` in the style of the engine's rounded box, each with its own words in the text alternative, and `academic/researcher/lifecycle.svg` (D19); the stops that wait on the user added to `grill` ("Another entry's rulings file"), `pipeline`, `referee`, `submit`, `grant`, `codebase-design`, researcher's `manuscript`, `research` and `revision`, and `paper/disclosure` (its two stops apart), with their `README.md` alt texts; the researcher figures' text left by step 2; the head comment, `docs/dev/building.md` line 41 and `docs/dev/scripts.md` line 9. Every skill of `skills/` has a figure under `docs/figures/`.
- Premise corrections: none beyond the brief check's, closed under "Closed" in `agents/reviews/5-brief-check.md`.
- The plan's verify list is unchanged: the step changed only prose in `docs/dev/building.md`.
- Fixes at landing, the findings of the run over round 1 (`agents/reviews/5-refuter.md`, "Closed"): the disclosure figure's selector box with its arrows and its alt text; the lifecycle figure's README caption and the box of `full`; 18 calls the round had re-wrapped put back on one line; the head comment's sentence split; a comma in `scripts.md`; the import order.
- Raised: Open item I, the user's reading of the sixteen new figures and of the changed figures against their skills, the step's check.
- Verification on main: `checks: 16 commands passed`, by `land.sh` after the cherry-pick and again after the fixes at landing; both figure scripts exit 0, and a second run of both left every figure byte-identical.
- The builder's first report did not pass its bar: one repair round of five rulings (`agents/briefs/5-round-1.md`); the run over the round found ten findings, none against an item or a case, fixed or recorded at landing.
- Usage: brief check 183573 tokens, 57 tool uses, 9 min 17 s; builder 117388 tokens, 105 tool uses, 18 min 50 s, and round 1: 173483 tokens, 32 tool uses, 5 min 21 s; reviewer 219604 tokens, 57 tool uses, 7 min 51 s; reviewer over round 1: 184702 tokens, 36 tool uses, 5 min 4 s.

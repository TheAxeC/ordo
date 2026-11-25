# Step 2 landing

Entry 13 of `docs/roadmap.md`, researcher; step 2 of 7, the modes `integrity` and `manuscript`, landed on main; next, step 3, the modes `novelty` and `idea`, with `/spec 13 3`.

## Open items

- none.

## The check of Steps 1

The builder (a6dece389171399fc), the brief-check agent (a7ab1a8b91934c83b) and the two reviewers (a1e8b7527ba8e54f0, a09d805b7d405035c) had each ended with a completion notice before the landing.

## Not done

Nothing.

## What landed

- `skills/academic/researcher/SKILL.md`, version 1.0.0: `/researcher integrity <main.tex>`, `/researcher integrity pre-review <main.tex>`, `/researcher manuscript <project folder>`, `/researcher manuscript <main.tex>` and `/researcher manuscript <main.tex> <comments file>`.
- `README.md`: the row of `researcher`, its figure line, `academic/researcher` in the install loop, twenty-four skills.
- `docs/figures/researcher.svg`, the figure of the `manuscript` mode, and the academic-pipeline figure with the research stage on a target of its own, still drawn as not built.
- `skills/academic/paper-review-panel/`, version 1.1.0: the seven dimension scores and the Weighted Average in the Editorial Decision of the full mode and in the re-review report, written by the editorial synthesizer.
- `skills/academic/paper/SKILL.md`, version 5.0.1: the row that named `researcher` as not built.
- Ten copied pages of `researcher`, the two worked examples among them, brought in line with `SKILL.md` and ruling D5.
- `.scratch/13-researcher/deviations.md`, extended by each difference of `SKILL.md` from its source.

## What was found

- The brief check found that the brief disagreed with the pages landed in step 1 (a run of `integrity` alone corrects the manuscript, the entry with review comments in hand, the compliance agent, the README's install loop). Each point was closed in the brief before the build.
- The first review found that the run's passport was read and never written, that a final check ending with notes had no branch, that the entry with a comments file had no defined re-review, that a CONDITIONAL ethics verdict was dropped, and that the scores the revision loop compares did not exist in `paper-review-panel`. All were closed in one repair round of fourteen rulings; the scores under Open item E (the user) and Open item F (C148).
- The run over the round found three things, each fixed at landing.

## Fixes at landing

Fixes at landing, three, each a finding of the run over round 1: (1) `references/pipeline_state_machine.md`, its cycle summary and its diagram, and `references/two_stage_review_protocol.md` say that a Minor decision at Stage 3' goes to one `/paper revision` run before Stage 4.5, as `SKILL.md` and the page's own row do (Spec 1); (2) `agents/state_tracker_agent.md` gains the key `score_trajectory` with `baseline`, `re_review` and `deltas`, and `SKILL.md` names the three places (Spec 3); (3) the editorial synthesizer's page of `paper-review-panel` says that with every row of a dimension empty, Step 4a scores it on the rubric from the reviewers' reports (Spec 2). The difference of ruling 14 as built from its wording, the scores taken from the Reviewer Summary Matrix and not from the sprint contract's matrix, stands and is in `deviations.md`.

## Verification

`checks: 16 commands passed`, printed by `templates/checks.sh` on the state file, on main after the fixes at landing.

## Usage

builder a6dece389171399fc, 247020 tokens, 104 tool uses, 1244 s, and for round 1 100212 tokens, 109 tool uses, 492 s and, for its ruling 14, 127310 tokens, 10 tool uses, 110 s; brief check a7ab1a8b91934c83b, 219563 tokens, 57 tool uses, 558 s; reviewer a1e8b7527ba8e54f0, 257452 tokens, 58 tool uses, 502 s; reviewer over round 1 a09d805b7d405035c, 170715 tokens, 30 tool uses, 204 s. The builder's first report did not pass its bar.

## Next

Step 3, the modes `novelty` and `idea`.

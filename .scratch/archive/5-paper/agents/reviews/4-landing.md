# Landing of step 4 of plan 5

Roadmap entry 5, paper. Step 4 of 6, the new shape of paper (rebuilt to academic-paper 3.2.0), landed. Next: a new step for plan mode and format conversion (ruling AK) before step 5; step 5, the gate's comparisons, stays held by Axel's pause.

## Open items

None.

## The check of Steps 1

ListAgents lists no subagent of this session: the builder a8f782ee29dfe2e0a and the reviewers of the step had ended before the landing.

## Not done

Nothing inside the step. Proof 2 of the run over round 2 (the round-2 report shortens three commands with "..." and gives no old text) concerns the report, not the product, and is booked only.

## What landed

68 paths, 8912 insertions and 2454 deletions against the base 95aa872, the landing fixes included. `skills/paper/` follows academic-paper 3.2.0's design with the deviations the rulings make: six roles, three of them resumed in named cases (ADR 0025), the citation compliance agent in full, revision and citation-check, the cover letter and the anonymous copy, the policy anchors of the AI disclosure, the evidence profiles, and the manuscript prose standard of rulings AV6, AW and AX (ADR 0026). The paper figures and the comparison figures are drawn from their scripts.

## What was found

The first run found 6 Spec, 2 Proof, 6 Standards and 4 Behaviour findings, with 8 items violated and 6 partial; they went to repair round 1. The run over round 1 found 14 findings, which went with rulings AV1 to AV19 and AW to repair round 2. The run over round 2 found 5 Spec, 3 Proof, 3 Standards and 3 Behaviour findings. Ruling AX settled its Spec 1; the rest are fixed at landing or booked.

The builder's first report did not pass its bar: the first run found 18 findings, eight items violated among them.

## Fixes at landing (9)

1. Spec 1, ruling AX: `skills/writing/references/manuscript-prose-standard.md` lists only its differences from the prose standard; `/writing` and `paper` read the prose standard at the three places of ADR 0001 and apply the differences to a manuscript; ADR 0026 supersedes ADR 0002 in that part.
2. Spec 2: ADR 0025 renamed to "three of them resumed", with its title and its README line.
3. Spec 3: the literature strategist's page names four cases of resumption and the expanded revision's input and section; the planner's page names its resumption and its input.
4. Spec 4: a paper type that fits no row is IMRaD for empirical work and Literature Review for a synthesis.
5. Spec 5: the anonymous copy is `<main>-anonymous.tex` beside the main `.tex` the mode gives.
6. Proof 3: the six policy-anchor quotes take the source's lower-case first letter.
7. Standards 2: coverage row 249 in sentences of at most 35 words; row 111's wording and fallback.
8. Standards 3 and Behaviour 1: the figure layout routes every arrow before it places labels, keeps a return label on its outer side, grows a crowded row, and stops with an error when a label has no place; the citation-style stop carries its condition in its box and "a fresh start, once" on its return arrow; the draft review's return arrows say "no cap". The rendered figures were read: each label stands beside its own arrow.
9. Ruling AU: 314 sentences over 30 words on lines the rounds changed were read; 195 were rewritten, and the rest are figure alt texts, table rows, lists of stops, the trigger list, ADR titles and coverage cells within the 35-word exception.

## Before and after

- Compile engine: before, pdfLaTeX; after, the venue template's engine, and XeLaTeX otherwise.
- The manuscript's folder gains `cover-letter.tex` for a journal venue and `<main>-anonymous.tex` for a double-blind venue.
- Intake gains the rows Cover letter and Policy anchor.
- The stop "The citation style to confirm" is new; before, the agent corrected every entry itself.
- `/writing` on a manuscript: before, the prose standard as found; after, the prose standard as found with the listed differences.
- A paper type that fits no row: as round 2 built it, Conference Paper; after, IMRaD or Literature Review.
- `docs/figures/gen_figures.py`: before, a label with no free place was drawn over another arrow; after, the row grows, or the script stops.

## Verification on main

`sh ~/.claude/skills/land/templates/land.sh .scratch/5-paper/orchestrator-state.md 5-paper-4 95aa872916493c7b541aacd3f9f43e0a50b8f945` exited 0. After the fixes, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude/skills/land/templates/checks.sh .scratch/5-paper/orchestrator-state.md` printed a PASS line for each of the eight test scripts, `ok: the plan-terms block equals the template` and `checks: 11 commands passed`. `utils/check_coverage.py` printed `ok: docs/academic-coverage.md`. Both figure scripts exited 0, and `ruff format --check` and `ruff check` passed on both. The verify list gained the `calibration_counts.test.sh` line, as `docs/dev/building.md` has it.

A/B: none. Look: none configured.

## Usage

- Brief check acb39ad27aa1f1022, claude-opus-5-5: 304522 tokens, 64 tool uses, 15.4 min.
- Builder a8f782ee29dfe2e0a, claude-sonnet-5-5: 377481 tokens, 836 tool uses, 123.4 min (build); 351967 tokens, 535 tool uses, 114.5 min (round 1); 291845 tokens, 244 tool uses, 26.8 min (round 2).
- Reviewer a72eb77449241ae96, claude-opus-5-5: 275856 tokens, 122 tool uses, 16.0 min.
- Reviewer over round 1 a7e010f4ad8e61c21, claude-sonnet-5-5: 189463 tokens, 127 tool uses, 14.8 min.
- Reviewer over round 2 ac38ba3d94a7c1b49, claude-sonnet-5-5: 347954 tokens, 92 tool uses, 9.5 min.

## Next

The new step for plan mode and format conversion (ruling AK) is added to `plan.md` before step 5, then prepared with `/spec`.

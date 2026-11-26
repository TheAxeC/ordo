# Papers: one paper, and the deliverables of the August manuscript

The sections `## One paper, not two` and `## Deliverables` of the earlier README, kept whole. The venue and the authors were ruled later (D41 of `plan.md` and the rulings of 2026-10-19 in `next.md`): the paper targets IEEE TNNLS.

## One paper, not two

Recommendation, given that nothing is under review and both routes are open: fold everything into **one paper that replaces the preprint**, rather than splitting a v2 from a method paper.

Not under review is the best possible position to be in. It means a deep restructure costs nothing, no editor has to be told anything, and the arXiv entry can simply be replaced. Splitting, by contrast, would leave both halves thin: a v2 that cannot claim the method contribution and a method paper that cannot claim the estimand, at exactly the moment when MIST makes a thin paper on either side hard to place. One paper carrying the estimand, the two propositions, the exact-label generator, the invariance argument and a benchmark against MIST is a real paper. Two are not.

The one thing that stays separable is phase 3. If a block-term operator backbone wins on its own terms it is an ML-venue paper in Axel's own line, and it should not be forced into hers.

Authorship follows the contribution and is St<e acute>phanie's call to make, not something to assume. The estimand, Proposition 2.1 and Proposition 2.2 are hers regardless of how the order ends up.

Venue is a decision for after phase 2, but worth flagging early that the coauthor team is statisticians, so a computational-statistics journal is likely a better cultural fit than an ML venue, and it avoids meeting MIST head on. `registries/venues.yml` currently has no entry for that class; JCGS or CSDA would need adding when the time comes. The in-registry options are `jmlr`, `aistats` and `tmlr`, and TMLR is the weakest of the three here because MIST most likely sits there already.

## Deliverables

| what | where |
|---|---|
| August manuscript, frozen | `manuscript/archive/2026-08/main.pdf`, 33 pp |
| its source | `manuscript/archive/2026-08/main.tex`, `main.bib` |
| its per-cell tables | `manuscript/archive/2026-08/tables_generated.tex`, 768 cells |
| shipping model | `code/results/phase2_scaled.pt` |
| ablation model | `code/results/phase1_v2_equalised.pt` |
| figures | `code/results/changes_overview.png`, `engine_construction.png`, `engine_shapes.png`, `method_overview.png`, `concavity_shapes.png` |
| concavity classes | `code/results/concavity_check.md` |
| classical panel | `code/results/classical_bench.md`, `classical_validation.md` |
| note to send | `correspondence/mist-note.md` |
| answers to the 19 October collaborator meeting points (2 pages, archived by D29) | `manuscript/archive/2026-11-meeting-response/meeting-response.pdf`, source `meeting-response.tex` beside it |

Everything regenerates: `make_tables.py` rebuilds the tables from the scoring dump into `manuscript/tables_generated.tex` for the next manuscript (the archived copy is frozen), `make_engine_figure.py` and `make_changes_figure.py` rebuild the figures, and `run_phase2.py --from-rows` rebuilds the report without rescoring.

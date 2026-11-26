# Method: the phase plan of the project

The section `## Plan` of the earlier README, kept whole: the four phases with their gates and statuses. The README's `## Method` holds the approach in short and points to the paper.

## Plan

| phase | what it is | status |
|---|---|---|
| 1 | make the estimator invariant | done, both gates passed |
| 1b | equalise the last input gap | done, gap did not close |
| 2 | train on unlimited shapes | done; 8x scale-up trained and scored |
| 3 | operator backbone | gate CLOSED on the scaled model, not building it |

**Phase 1, invariance.** Rank input plus D4 symmetrisation, with the architecture and the training distribution otherwise left as the preprint has them. Two gates: a monotone marginal transform must leave the estimate bit-identical, against the 0.50 to 0.43 move v1 shows on the twin data, and negative dependence must perform like positive dependence. Both passed, see the phase 1 result below. The twin data was not needed for either.

**Phase 1b, the last input inequality.** Done. v1 also receives 54 conditional-moment features that v2 had no counterpart for, so the seen-grid comparison was not interpretable. v2 now gets the group-symmetrised rank version of them, and the gap did not close, which is what makes the seen-grid statement below a real one rather than an artefact of unequal inputs.

**Phase 2, train on unlimited shapes.** The tool is built and validated, see the label engine below, and the two figures in `code/results/` show what it makes. The retrain is done (Phase 2 result below): the estimator trains on draws from the generator, at randomised grid size, with sample sizes log-uniform over 50 to 2000 rather than four fixed values. The seen-grid gap did not close on its own: the published model stays ahead on Gaussian and Clayton (0.0462 and 0.0519 against 0.0583 and 0.0652).

**Phase 3, operator backbone. The gate has been run on the scaled model and it is closed: not building it.** The idea was that the estimator maps an empirical measure on the unit square to a scalar functional of the copula density, and a neural operator is discretisation-invariant by construction, which would give a third invariance to stack on the two the estimator already has.

The gate asks two things of the residual error. Is it systematic or is it scatter, since the two call for opposite work. And if systematic, does it concentrate on shapes with fine structure, which is the only regime where a fixed-resolution histogram stack could be losing something a discretisation-invariant model would keep. `code/experiments/studies/run_diagnostic.py` answers both by resampling each copula and binning by the engine's spectral decay parameter, which controls how rippled a drawn shape is.

Read on the 60000-example model it pointed one way; read on the 480000-example model it points the other.

| at n = 2000 | 60k model | 480k model |
|---|---|---|
| bias share of error | 0.57 | 0.30 |
| rms bias, finest bin | 0.0348 | 0.0177 |
| rms bias, broadest bin | 0.0164 | 0.0107 |
| fine to broad ratio | 2.13 | 1.65 |

More data halved the fine-structure bias and shrank the gradient, and the error went back to being scatter-dominated. The bias that looked structural on the smaller model was largely a data deficit. A residual gradient of 1.65 survives and is worth a sentence in the paper, but it does not carry an architecture programme when seventy percent of what is left is noise.

Two things worth keeping from this. The rising bias share with sample size is partly mechanical, since scatter falls with n and bias does not, so the share alone proves nothing; the load-bearing signal was always the gradient across structure bins. And the first version of the diagnostic pooled predictions across copulas to estimate variance, which measures the spread of the true labels rather than the estimator and reported a bias share of zero in every cell. The split has to be made per copula across independent resamples, then averaged.

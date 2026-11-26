# Results and how to reproduce: the earlier studies in detail

The sections of the earlier README on the label engine, the port of the published model, phase 1, phase 2 and the two test grids, kept whole. The README's `## Results and how to reproduce` holds one entry per result with a link here.

## The label engine

A label does not need a closed form, it needs to be exact. `code/core/copula_engine.py` draws a random smooth log-density field on the unit square from a tensor cosine basis with random spectral decay and a random boundary warp, then projects it onto the set of densities with uniform margins by Sinkhorn scaling in the log domain. The result is held as a fine checkerboard, a density constant on each cell of a $G \times G$ grid. For such a density with cell values $c_{ij}$ and uniform margins, $I = \text{mean}_{ij}\, c_{ij} \log c_{ij}$ is exact, and drawing a cell with probability $c_{ij}/G^2 $ then a uniform point inside it is an exact sample. Label and sampler are both free of discretisation error with respect to the distribution actually sampled from. Amplitude is searched by bracketing and bisection to hit a requested Linfoot value, which balances the label distribution; the label is always recomputed from the final grid, so a search that lands short still carries a correct label.

Two figures show it, regenerate with `python3 code/experiments/figures_tables/make_engine_figure.py`. `code/results/engine_construction.png` walks one draw through the four steps and plots the margins before and after the rescaling, which is what makes the shape a pure dependence object. `code/results/engine_shapes.png` puts the preprint's entire catalogue, two families, on the top row and 18 draws from the generator below it; 12 of the 18 fall rather than rise and 8 carry a label above 0.4 while a rank correlation reads under 0.25.

Validated in `code/results/engine_validation.md`, regenerate with `python3 code/experiments/engine_checks/run_engine_validation.py` (about five minutes, numpy and scipy only, no data needed).

| check | result |
|---|---|
| Gaussian label vs abs(rho), G=1024 | 3.71e-04 |
| Clayton label vs eq (5), G=1024 | 9.56e-04 |
| sampler total variation | 0.01683 |
| multinomial noise floor | 0.01694 |
| worst amplitude-search miss | 9.7e-05 |
| negative-dependence draws | 135 of 300 |
| rank-invisible dependence draws | 42 of 300 |

Both analytic families are recovered as the grid refines, which is the correctness test, and the Clayton agreement is an independent numerical confirmation of Proposition 2.2 and of the equation (5) closed form. Convergence is order $1/G$ and the Clayton case converges more slowly and from below, because the Clayton density is unbounded at the origin. That is the spike case the preprint puts outside its own scope, and it is why the random prior is built from smooth fields.

The last two rows are the point. Both preprint families are positively dependent and monotone, so neither can produce a draw with negative rank correlation, and neither can produce a draw a rank correlation misses while the Linfoot value is high. The prior produces both without being asked to.

Cost is 0.150 seconds per copula at $G = 256$ including 4000 samples, so 100000 training copulas is about four and a half hours on one core and well under an hour across the machine. Training does not need to store datasets: store the field coefficients and the label, and resample every epoch.

## Concavity classes of the engine

The engine's draws are not concave in any useful sense: a jointly concave copula is only $M(u,v) = \min(u,v)$, and the weaker classes in the literature (Durante and Papini 2009, componentwise concave and weakly Schur-concave; Dolati and Dehgan Nezhad 2014) hold for none of 150 engine draws (concave in each argument 0, Schur-concave 0, positive quadrant dependent 24). `code/core/concavity.py` holds the exact checkerboard checks (symmetric, TP2, concave in each argument, PQD, Schur-concave) and a generator whose log-density has a non-negative mixed derivative, which is TP2 and so concave in each argument, with an exact label; symmetric draws are also Schur-concave. A convex mix of two such draws is concave in each argument and no longer TP2, and the common-factor copula $d d^T / G$ of an engine draw is symmetric and Schur-concave but reaches labels only 0.17 to 0.47. The parabola and the tent (the copula of $(X, X^2)$) are in none of the classes: they are non-monotone, with Spearman near 0 and Linfoot near 0.95. Regenerate with `python3 code/experiments/engine_checks/run_concavity_check.py` (numpy only, the high-label bisection makes it slow, over ten minutes on one core), table in `code/results/concavity_check.md`, shapes with `code/experiments/figures_tables/make_concavity_figure.py` into `code/results/concavity_shapes.png`. The generator is not used for training, and the engine as shipped is unchanged.

`code/experiments/figures_tables/make_method_figure.py` draws the input, the layers and the D4 averaging for one real Clayton sample into `code/results/method_overview.png`.

## The v1 baseline runs here, so the twin data is not a blocker

Their released repository ships the trained Model 3 as `combined_model_2.keras` plus an R driver that builds its two inputs. `code/core/v1_features.py` is a Python port of that driver, so the published weights can be scored on any bivariate sample here, without R and without their data.

Validated in `code/results/v1_port_check.md`, regenerate with `python3 code/experiments/engine_checks/run_v1_port_check.py` (about 35 seconds; the last section needs tensorflow and the vendored model, the rest does not).

| check | result |
|---|---|
| KSG vs analytic Gaussian MI | 0.0076 nats |
| FNN feature vs published Table 1, worst of 24 cells | 0.0063 |
| input shapes and column order | pass |
| end-to-end error with released weights | 0.0364 |

The second row is the one that matters. The port reproduces the published FNN column of Table 1 across all six dependence levels and all four sample sizes, to within 0.007 on a scale where the estimator's own spread runs from 0.001 to 0.126. The end-to-end error of 0.0364 falls at $L = 0$, which is the positive bias at zero the paper reports for itself.

So the log-transform gate does not need their data. Marginal invariance under rank input is a theorem rather than an empirical question, and it can be demonstrated against v1 on any sample, including public non-Gaussian data. The twin data is public, so the Section 5 reproduction runs here through `code/experiments/studies/run_twin_application.py`.

Two details of the R are reproduced rather than corrected, because the published weights were trained against them. The bins are cut on `seq(0, 1, length.out = 18)`, which makes 17 intervals while the placeholder loop runs to 18, so the eighteenth bin is empty for every dataset and always contributes the constant triple (0.5, 0, 0). The paper says 18 bins and the code delivers 17, with three permanently constant network inputs. It changes nothing about the published results and is worth telling them. The other detail is that both inputs are binned on min-max scaled raw values, so a single extreme observation compresses the rest of the sample into a few bins. That is the concrete mechanism behind the log-transform instability, and it is what rank input removes.

## Phase 1 result

Run with `python3 code/experiments/studies/run_phase1.py --variant {plain,anchored,matched,equalised,full}`, about 30 minutes each on MPS. One report per variant in `code/results/`. Every variant trains on the preprint's own generating process, the same two families with positive dependence only, the same 32000 datasets and the same 50 epochs, so nothing here comes from more data or longer training.

| variant | what v2 gets | seen rmse | unseen rmse | shift |
|---|---|---|---|---|
| v1 | its own 56 features | 0.0492 | 0.6029 | 0.8268 |
| plain | histograms only | 0.0563 | 0.0565 | 0 |
| anchored | plus the 2 scalars | 0.0557 | 0.0560 | 0 |
| matched | plus normal scores, linear out | 0.0554 | 0.0553 | 0 |
| equalised | plus the 54 moments | 0.0554 | 0.0559 | 0 |
| full | equalised, linear out | 0.0550 | 0.0563 | 0 |

Seen is the preprint's own grid, Gaussian and Clayton with positive dependence. Unseen is the same grid with the association reversed, which no model saw in training. Shift is the largest movement under a strictly monotone marginal transform.

**Both gates pass, in every variant, and neither is a matter of degree.** Marginal invariance is exact: every transform moves v2 by zero to the last bit, before training as well as after, while v1 moves by up to 0.83 under a cube and 0.16 under a plain negation. The 0.50 to 0.43 log-transform move the paper reports in Section 5 is one instance. Negative dependence costs v2 nothing while v1 is off by half the scale, which retires the limitation the Discussion states as untested and expected to be worse. That limitation was never quantified in the preprint; 0.6029 is our measurement of the failure they predicted.

**On the seen grid v2 trails by about 12 percent, and the inputs are now equal, so that is attributable.** The `equalised` variant gives v2 the group-symmetrised rank counterpart of all 56 numbers v1 receives. The gap did not close: 0.0554 against 0.0492. It also did not close under any output convention, and the five variants span only 0.0550 to 0.0563. What remains different is the rank representation and the eight-fold weight sharing, and the honest reading is that exact invariance and D4 equivariance cost roughly 0.006 rmse on the two families the baseline was built for, in exchange for exact invariance everywhere and a tenfold improvement on reversed dependence.

**The gap lives at exact independence.** With inputs equalised, mean absolute bias by dependence level (the Gaussian and Clayton rows of section 1 in `code/results/phase1_equalised.md` and `code/results/phase1_full.md`, 8 cells per level):

| true L | v1 | v2 equalised | v2 full |
|---|---|---|---|
| 0.00 | 0.0351 | 0.0601 | 0.0524 |
| 0.20 | 0.0059 | 0.0146 | 0.0095 |
| 0.40 | 0.0126 | 0.0190 | 0.0139 |
| 0.60 | 0.0085 | 0.0220 | 0.0126 |
| 0.80 | 0.0076 | 0.0143 | 0.0101 |
| 0.99 | 0.0047 | 0.0101 | 0.0064 |

Six of the eight worst cells in the grid (largest absolute bias over the 48 Gaussian and Clayton cells, both v1 and v2 equalised) are the L=0 row. Away from it both estimators work at biases of 0.01 to 0.02, against their own random scatter of about 0.037.

**The output layer trades error between the two ends rather than reducing it.** A bounded output cannot emit zero, which puts a floor under the estimate at exact independence. A linear clipped output can, and `full` reaches v1's accuracy there at n=1000 (0.021 against 0.022), but it then saturates at the top: on Gaussian data at L=0.99 it returns exactly 1.000 with zero spread for every one of 200 replicates, asserting a perfect functional relationship where the truth is 0.99. The bounded variant reads 0.984 there instead.

**Keep the `equalised` variant, bounded.** `full` is 0.0004 better on rmse and pays with an estimator that claims certainty of a deterministic relationship. For something people apply to real data, a small honest under-read beats a confident wrong one.

**This is a phase-2 problem, not a phase-1 one.** Everything above is a model trained on two families, with the training label distribution inherited from the preprint: 90 percent of labels uniform on [0, 0.99] and 10 percent on [0, 0.01], oversampling near independence because early runs struggled there. That is ordinary importance weighting, documented and motivated in the paper, and it is not a flaw. It matters here for a different reason. For a supervised estimator of this kind the label distribution is the prior of the resulting Bayes estimator, so it sets the shrinkage directly rather than being a training detail, and reinforcement was applied only at the lower end. Phase 2 replaces both the copula prior and the label distribution, so endpoint behaviour should be designed there rather than tuned here. Do not spend more compute on phase 1.

## Phase 2 result

Trained locally on 60000 examples, then scaled on the cluster to 480000 examples from 160000 engine copulas (2 h 12 min on one GPU, SLURM 569434). Same architecture as the phase-1 equalised variant, fresh weights; only the training distribution changed. Reports in `code/results/phase2.md` and `code/results/phase2_scaled.md`.

Four estimators on every cell, all on Gaussian margins: `fnn` the nearest-neighbour estimator the preprint finds best among the classical options, `v1` the preprint's own Model 3, `p1` the phase-1 model trained on two families, `p2` the scaled model trained on the engine.

| family | fnn | v1 | p1 | p2 |
|---|---|---|---|---|
| gaussian | 0.0689 | **0.0462** | 0.0515 | 0.0583 |
| clayton | 0.0750 | **0.0519** | 0.0588 | 0.0652 |
| gaussian reversed | 0.0696 | 0.6029 | **0.0516** | 0.0588 |
| clayton reversed | 0.0789 | 0.6028 | **0.0599** | 0.0687 |
| frank, unseen | 0.0644 | **0.0489** | 0.0524 | 0.0587 |
| frank reversed, unseen | 0.0659 | 0.6029 | **0.0540** | 0.0590 |
| gumbel, unseen | 0.0726 | 0.0607 | **0.0561** | 0.0630 |
| arbitrary engine shapes | 0.1335 | 0.4777 | 0.2262 | **0.0734** |

**p2 beats fnn on all eight families**, by a small margin on the analytic ones and by 1.8 times on arbitrary shapes.

**The preprint's method holds where it was trained and its advantage decays with distance from there.** It is the best of the four on Gaussian (0.0462), Clayton (0.0519) and Frank (0.0489), which confirms the claim its Figures 1 and 2 make. On Gumbel the ordering has already flipped: 0.0607 against 0.0561 for the same architecture trained on only the two families. Gumbel is the analytic family furthest from the training pair in tail behaviour, so the advantage tracks proximity to training support. Reverse the association and it returns roughly 0.60, returning 0.000 with zero spread at L of 0.60, 0.80 and 0.99, while fnn handles reversal without noticing. On arbitrary shapes fnn beats it by 3.6 times. So the scope of the published claim is the two families it was trained on, in the positive direction, and that scope is one the preprint's own Discussion anticipates: it states negative dependence as untested and expects performance there to be worse. These numbers quantify a limitation its authors identified rather than one they missed.

**Scaling helped unevenly.** Going from 60000 to 480000 examples bought 12 percent on the narrow families (0.0712 to 0.0629) and a little under 2 percent on arbitrary shapes. That matches the diagnostic: more data cut the variance, which dominates the easy families, and barely touched the fine-structure bias that dominates the hard ones.

**A note on cost.** Scoring the Gumbel grid takes 126 seconds against 70 to 103 for the other families, so the nearest-neighbour estimator does cost somewhat more where dependence is strongest, but the margin is modest. An earlier run of the identical code reported 3113 seconds for the same grid; that figure does not reproduce and was machine contention, not a property of the estimator. Nothing here supports a claim that its neighbour search degrades badly on near-degenerate samples, and no such claim should go in the paper without a dedicated timing experiment.

**An invariance confirmation that came for free.** This run corrected an unequal condition: the engine and held-out samples had been left on uniform margins while the preprint's families were on Gaussian ones, which measured v1 and fnn on a scale they were not built for. Fixing it moved v1 by up to 0.0085, on the engine family, and by 0.0061 and 0.0036 on Frank and Gumbel; the five families already on Gaussian margins did not move at all. So the picture above is not an artefact of the correction. Meanwhile the two-family rank model is unchanged on all eight families to four decimals, 0.0000 in every case, which is what exact rank invariance predicts and an end-to-end check that it holds through encoding, symmetrisation and scoring. The engine-trained model cannot be compared across the two runs, since it is a different model in each.

## Two test grids

The original grid, 6 dependence levels by 4 sample sizes, is the preprint's own and is the comparison table. Every estimator in it was trained on sizes inside 100 to 1000, so it is like for like.

The wide grid, 8 levels by 6 sizes, adds 0.90 and 0.95 and adds sizes 50 and 2000. It fills two gaps: nothing between 0.80 and 0.99, and nothing outside 100 to 1000 although this estimator trains on 50 to 2000. The third, the generator family running 100 replicates against 200 elsewhere, is closed separately and on both grids. It is not neutral between estimators: the two added sizes are interpolation for ours and extrapolation for the published model, which trained on exactly 100, 200, 500 and 1000. So it characterises our estimator across the range it claims, and is not a head-to-head. Results in `code/results/phase2_wide_grid.md`, and at 200 replicates for every family in `code/results/phase2_wide_balanced.md`.

One ordering changes on it. On Gumbel the published model reads 0.0596 against 0.0597 for the two-family model, so the flip visible on the original grid (0.0607 against 0.0561) does not hold on the wider one. Its shortfall under reversed association grows from 0.60 to about 0.70 and on generator draws from 0.4777 to 0.5611, because the added cells are harder, which means the original grid was if anything generous to it.

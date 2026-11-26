# The README drafts

Stop "The README drafts" of `/researcher readme /Users/axelfaes/workspace/research-hub/projects/manuscripts/linfoot-estimator` (readme item 4), installed copy `/Users/axelfaes/.local/share/ordo-stable/skills/academic/researcher`.

Scratch folder (from `mktemp -d`, outside research-hub): `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/linfoot-readme.hLQp5w`. The drafts on disk are `README.md`, `code/README.md`, `code/.depositignore`, `notes/next.md` and `notes/one-paper-not-two.md` in that folder. Nothing was written in research-hub, and nothing was committed, pushed or submitted.

**Not shown inline: `notes/next.md` (106 lines, 93651 bytes).** Every other draft below is shown whole. That file is the line `# Next`, a blank line, and lines 212 to 315 of the current `README.md`, byte for byte. `diff <(sed -n 212,315p README.md) <(tail -n +3 notes/next.md)` printed nothing, and the run printed `NEXT_IDENTICAL`. Adding it inline would put this message over 250 KB. It can be sent as a separate message on request.

## The code folder

The code folder is `code/`. The old README names it throughout: `code/README.md`, `code/.depositignore` and `code/experiments/`. Answer 8 confirms it, and the draft's `### Where things live` names it.

## Where each answer of `answers.md` went

| Answer | Where it went |
|---|---|
| 1 `.depositignore` | Draft 3. `attic/` covers `/attic/` and `results/*` covers `/results/`, so no results line is added. The added lines stand above `!results/phase2_scaled.pt`. |
| 2 Research questions and claims | README `## Research questions and claims`: RQ1 to RQ3 as drafted, RQ4 added, and C1, C2 and C3 corrected (sections, fresh samples, $\hat L_{\mathrm G}^{(3)}$ against ParamPL). C4 stands and C5 is added. The sources line reads "Sections I-B, I-C, VIII-C and IX, with the results of Section VII". Scope is Section VIII-C in `### What is not claimed`. |
| 3 Good enough and setting | README `## Constraints and limits`, first two bullets. |
| 4 33 pages | README `## Papers`, `### The archived drafts`. |
| 5 Job output files | README `### Where things live`, the bullet `logs/`. |
| 6 Cluster facts | README `### Cluster facts`: the account, modules, partitions with time limits, and QOS bullets. |
| 7 Licence and citation | Draft 2, `## License and citation`. |
| 8 The code folder | README `### Where things live`, the bullet `code/`. |

## Draft 1: `README.md` (whole)

````markdown
# Pretrained Linfoot estimator

A pretrained, rank-based estimator of the Linfoot informational correlation, the successor to the preprint arXiv:2512.12358; the paper "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation" is drafted and formatted for IEEE Transactions on Neural Networks and Learning Systems (TNNLS), with its supplementary and a cover letter, in `manuscript/`.

## In short

The Linfoot informational correlation $L = \sqrt{1 - e^{-2I(X;Y)}}$ puts mutual information on the scale of a correlation coefficient. The preprint of van den Berg et al. (arXiv:2512.12358) estimates it with a network that reads a heatmap of the raw sample, trained on Gaussian and Clayton copulas at positive dependence. This project replaces that estimator with ParamPL0z, written $\hat L_{\mathrm G}$ in the paper: it reads only the ranks of a sample, is exactly invariant to strictly increasing maps of either variable and to the eight symmetries of the unit square, and combines four maximum pseudo-likelihood copula fits, the normal-scores correlation, its own direct estimate and a constant zero by softmax weights, followed by a logit-scale correction. It is trained on three simulated copula sets with exact labels, a tenth of each replaced by exact-independence examples labelled 0. On the two 240-dataset sets of the coauthors' 12-family benchmark its pooled root mean squared error (RMSE) is 0.0544 and 0.0539, against 0.0714 and 0.0708 for the published estimator, and on reflected and rotated versions of those families 0.0250 against 0.4487.

## What it is and why

### The problem

The Linfoot informational correlation is $L = \sqrt{1 - e^{-2I(X;Y)}}$, a rescaling of mutual information into $[0, 1)$ that satisfies the Renyi properties: zero under independence, one under a functional relationship, invariant to strictly monotone marginal transforms, and equal to the absolute Pearson correlation for bivariate Gaussians. It is worth estimating and hard to estimate, which is the premise of the paper.

The paper does two things. Proposition 2.2 gives the Linfoot correlation of any Archimedean copula as a functional of the inverse generator, and specialises it to a closed form for Clayton, which the authors believe is new. Then it trains a Keras model on simulated data: a 50-by-50 grey-scale heatmap of the raw sample through a small CNN, fused by concatenation with 56 handcrafted statistics (an FNN mutual-information estimate, the Pearson correlation, and the first three moments of one variable within each of 18 bins of the other). Training is 32000 datasets, 4000 per combination of four sample sizes (100, 200, 500, 1000) and two copulas (Gaussian, Clayton), all with Gaussian margins and all positively dependent, labels drawn on $[0, 0.99]$ with the bottom percent oversampled. It beats the FNN benchmark on bias and variance, and is applied to MZ against DZ twin BMI resemblance.

**The preprint's own route to richer training data cannot work.** The discussion proposes to widen the training set using invariance to continuous injective transformations, naming homeomorphic transformations of the Clayton copula. In two scalar dimensions an injective continuous map from the reals to the reals is strictly monotone, so the only admissible transforms are monotone marginal maps, and those leave the copula completely unchanged. What comes out is new margins and zero new dependence structure. BMI gets genuine richness from the same identity only because it operates in dimensions above one, where homeomorphisms actually reshape the joint. So the reason the synthetic data is still simple is not model capacity. It is that there are two labelled dependence structures available and no mechanism to make a third.

### Why it matters

**The estimator is not invariant to what the estimand is invariant to.** Mutual information depends only on the copula, so the bivariate rank vector is the maximal invariant statistic under monotone marginal transforms, and any invariant estimator must be a function of it. Feeding ranks therefore discards nothing and makes marginal invariance exact rather than learned. The v1 model instead reads a heatmap on the raw scale and asks the user to pre-transform margins towards normality, and the cost is visible in the paper's own application: a log transform moves the DZ estimate from 0.50 to 0.43 for an estimand that is invariant by definition. On the copula square the estimand is also invariant under transpose, under $u \mapsto 1-u$ and under $v \mapsto 1-v$, which generate the dihedral group of order eight. Enforcing that group makes negative dependence exactly as accurate as positive dependence with no extra training data, which retires the limitation the paper states as untested and expected to be worse.

The paper names three difficulties for any estimator of $L$ (`manuscript/main.tex`, Section I-B): a dependence measure computed from one fitted copula family is biased when the family is wrong; nearest-neighbour estimates lie above zero at independence; and the published estimator, trained at positive dependence only, has an RMSE of 0.6028 to 0.6029 on Gaussian, Frank and Clayton samples with negative association, because its estimate is close to zero there.

### What it does

ParamPL0z is a convolutional network on rank histograms whose features are averaged over the eight symmetries of the unit square. Its softmax weights combine the Linfoot-scale values of maximum pseudo-likelihood fits of the Gaussian, Clayton, Gumbel and Frank copulas, the normal-scores correlation, the network's direct estimate and a starting value fixed at 0, and a learned correction on the logit scale gives the estimate. It is trained by squared error against exact labels on three sets: the 12 VineCopula families of the coauthors' benchmark, copulas concave in each argument or Schur-concave, and Gaussian and Clayton copulas, each with a tenth of its examples replaced by exact-independence samples labelled 0. Three training runs were made; the reported network is the run with the lowest validation RMSE (seed 20260820). The paper describes it in Sections IV and V of `manuscript/main.tex`, and the released package of item 23 of `notes/next.md` ships its weights.

## Research questions and claims

Drafted from `manuscript/main.tex`, Sections I-B, I-C, VIII-C and IX, with the results of Section VII; the earlier README held no section of this form.

- RQ1. Can an estimator of the Linfoot correlation that is exactly invariant to strictly increasing marginal maps and to the eight symmetries of the square have a lower error than the published heatmap estimator on the 12-family benchmark?
- RQ2. Does the error stay low on copula families removed by name from training, and on training data equal to the published estimator's?
- RQ3. Can the positive error of nearest-neighbour and pretrained estimators at exact independence be lowered by exact-independence training examples and a starting value fixed at 0?
- RQ4. Does the estimator keep its error under the reflections and rotations of the unit square, where the heatmap estimator does not?

- C1. The estimator is exactly invariant to strictly increasing marginal maps and to the eight symmetries of the square. Shown by: the largest departure of the estimate on exact images, at most $2.38\times10^{-7}$ over 42000 pairs (`manuscript/main.tex`, Section VII-E, and the Conclusion, Section IX). Baseline: the heatmap estimator, 0.314 on average and 1.00 at most. Metric: the absolute change of the estimate under the map.
- C2. On the 12 families pooled its RMSE is lower than that of the heatmap estimator, of seven classical estimators and of padded MIST. Shown by: the paired difference of every other column minus ParamPL0z above zero on the test set and the validation set of the benchmark (`manuscript/main.tex`, contribution 3 of Section I-C); against the heatmap estimator alone, also on fresh samples of the test set, 0.0541 against 0.0699, a difference of $-0.0158$ $[-0.0194,-0.0124]$ (Section VII-A). Baseline: the heatmap estimator. Metric: pooled RMSE with a paired two-stage cluster bootstrap 95 percent interval (4000 resamples).
- C3. Its exact-independence examples and the starting value fixed at 0 together lower the error at independence: for $\hat L_{\mathrm G}^{(3)}$, the mean of three training runs, a paired difference of $-0.0041$ $[-0.0046,-0.0036]$ against ParamPL, the same model without them (`manuscript/main.tex`, Section VII-G, and the Conclusion, Section IX). Baseline: ParamPL. Metric: RMSE on the independent samples of the test set.
- C4. $L$ is a functional of the copula, and for an Archimedean copula an integral of its inverse generator, with the closed form for Clayton (`manuscript/main.tex`, contribution 4; supplementary Section S1).
- C5. On the reflected and rotated versions of the 12 families its RMSE is 0.0250 against 0.4487 for the heatmap estimator, a paired difference of $-0.4237$ $[-0.4549,-0.3919]$ (`manuscript/main.tex`, abstract and Section IX). Baseline: the heatmap estimator. Metric: pooled RMSE with a paired two-stage cluster bootstrap 95 percent interval.

No novelty page of `/researcher novelty` exists in `notes/`; the literature check of 2026-11-05 and 2026-11-06 is item 18 of `notes/next.md`, summarised under `## Related work`.

## Data

### The label engine

A label does not need a closed form, it needs to be exact. `code/core/copula_engine.py` draws a random smooth log-density field on the unit square from a tensor cosine basis with random spectral decay and a random boundary warp, then projects it onto the set of densities with uniform margins by Sinkhorn scaling in the log domain. The result is held as a fine checkerboard, a density constant on each cell of a $G \times G$ grid. For such a density with cell values $c_{ij}$ and uniform margins, $I = \text{mean}_{ij}\, c_{ij} \log c_{ij}$ is exact, and drawing a cell with probability $c_{ij}/G^2 $ then a uniform point inside it is an exact sample. Label and sampler are both free of discretisation error with respect to the distribution actually sampled from. Amplitude is searched by bracketing and bisection to hit a requested Linfoot value, which balances the label distribution; the label is always recomputed from the final grid, so a search that lands short still carries a correct label.

Two figures show it, regenerate with `python3 code/experiments/figures_tables/make_engine_figure.py`. `code/results/engine_construction.png` walks one draw through the four steps and plots the margins before and after the rescaling, which is what makes the shape a pure dependence object. `code/results/engine_shapes.png` puts the preprint's entire catalogue, two families, on the top row and 18 draws from the generator below it; 12 of the 18 fall rather than rise and 8 carry a label above 0.4 while a rank correlation reads under 0.25.

Cost is 0.150 seconds per copula at $G = 256$ including 4000 samples, so 100000 training copulas is about four and a half hours on one core and well under an hour across the machine. Training does not need to store datasets: store the field coefficients and the label, and resample every epoch.

### The three training sets of the paper

The paper's training data are three sets, each of 480000 examples at the engine's sample-size law, with exact labels (`manuscript/main.tex`, Section V): set B, the 12 families of the coauthors' benchmark from full parameter ranges (`code/core/family_prior.py`, `LINFOOT_COPULA_PRIOR=family`); set C, the class of copulas concave in each argument or Schur-concave (`code/core/class_prior.py`, `LINFOOT_COPULA_PRIOR=class`); and set D, Gaussian and Clayton copulas at positive dependence, the preprint's generating process at the engine's budget. ParamPL0z reads the shards with its starts, `data_set{b,c,d}_starts`, with the exact-independence shards `data_set{b,c,d}_zeros` in place of two of the 20 training shards of each set; they stand on the cluster under `~/projects/linfoot-estimator/` and are rebuilt by `bash code/hpc/run_all.sh`. The three sets were chosen by the rulings D2, D20 and D21 of `plan.md`, so that the training prior covers the 12 families, the target class and the preprint's own process. Items 6, 6c, 6e, 15 and 18 of `notes/next.md` give how each generator was built and checked.

### The coauthors' 12-family benchmark

The label engine generates its own copulas, and the only shipped-in artefact is the released weights at `code/vendor/combined_model_2.keras`; the benchmark and the MIST check read the external inputs below. Stephanie's own R-side artefacts sit at `~/data/linfoot/` (registry key `linfoot-sim`). They are not the preprint's two-family data: they belong to a later pipeline of hers, the Keras notebook `Training linfoot estimator_polynom.ipynb` (a 50 x 50 histogram of rank normal scores, bin statistics, a k-nearest-neighbour Linfoot estimate, rotations of 0, 90, 180 and 270 degrees). `testdata.zip` and `validationdata.zip` hold 240 `family_<code>_Linfoot_<level>_par1_<a>_par2_<b>_n_<N>.RData` files each (the 484 and 482 an earlier note gave counted macOS metadata entries), one `rawdata` list of raw samples per file (1000 samples in the test file opened, 50 in the validation file opened), over 12 VineCopula family codes (1 Gaussian, 2 t, 3 Clayton, 4 Gumbel, 5 Frank, 6 Joe, 7 BB1, 8 BB6, 9 BB7, 10 BB8, 104 and 204 Tawn), label levels 0 to 0.99 and n of 100, 200, 500 and 1000. `trainingdata.Rdata` is a list of 11000 records (`data`, `family`, `par1`, `par2`, `Linfoot`, `nsampSize`), 1000 per family for the 11 families other than Gaussian, 1000 rows each. `features_validationdata.csv` is the validation feature table, 48000 rows (240 files x 50 samples x 4 rotations) by 2654 columns. `code/experiments/family_benchmark/run_family_benchmark.py` scores on the two archives; it extracts them to `~/data/linfoot/extracted/{test,validation}` and writes numpy caches to `~/data/linfoot/cache/{test,validation}` (both registered under `linfoot-sim`, rebuilt from the archives when absent). The preprint's own published model is not what they were built for.

### The twin pairs

The public table `twinbmi` of the CRAN package mets 1.3.12. `code/experiments/studies/fetch_twinbmi.py` downloads it, checks the pinned SHA-256 of the tarball and writes its 4271 complete pairs (1483 MZ, 2788 DZ) to `~/data/linfoot-twinbmi/twinbmi_pairs.csv` (`LINFOOT_TWIN_DATA`); on the cluster the CSV is copied to the same path. It is the data of the application in Section S5 of the supplementary, chosen because it is the data of the preprint's own application and is public.

### The published model and the MIST weights

Their released repository ships the trained Model 3 as `combined_model_2.keras` plus an R driver that builds its two inputs. `code/core/v1_features.py` is a Python port of that driver, so the published weights can be scored on any bivariate sample here, without R and without their data.

The vendored model is fetched as `code/vendor/README.md` says. The published MIST weights come from Hugging Face (`grgera/MIST`) into `~/data/mist`, as `code/core/mist_padded.py` says, and on the cluster into the same path by `rsync -a ~/data/mist/ utwente:data/mist/`.

## Method

The paper is the canonical record of the method: `manuscript/main.tex` Sections III to VI (the estimand and its invariances, the estimator, the training prior and the experimental protocol) and the supplementary. This section holds what the paper does not: the earlier estimators of the project, the campaigns that led to ParamPL0z, and the cautions of the design.

### The approach

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

After the meeting with the coauthors of 2026-10-19 (`notes/2026-10-19-meeting-denmark.md`) the work ran as the steps of `plan.md`, with the specification of each step in `notes/next.md`:

- Cluster batch 1 (items 6e, 7, 13, 15, 15b and 17 of `notes/next.md`): sets A to E, A the engine prior (the shipped phase-2 model), B the family prior, C the class prior, D the two-family process at the engine's budget and sample-size law, E1 and E2 the preprint's architecture in its own design and at the common budget, and the arms 13 (normal scores in place of ranks), 7a (a set transformer) and 7b (the CNN with a set-transformer branch), three seeds each.
- Wave 3 (item 18): five models trained on sets B, C and D at once, Mix (the plain mixture), DRO (group DRO against the worst set), Switch (a learned gate over the models of B, C and D), Param (starts from tau inversion) and ParamPL (maximum pseudo-likelihood starts with the network's own estimate as one more start).
- Wave 4 (item 9b): ParamPL0 (ParamPL with a start fixed at 0) and ParamPL0z (the same with a tenth of exact-independence examples labelled 0); ParamPL0z is the estimator of the paper by ruling D27 of `plan.md`, the only one of the 16 models of batch 1 that the published model beats on no group.
- Wave 5 (item 21): ParamPL0z retrained with four folds of families held out by name, and on set D alone.
- Wave 6 (item 22): a fresh 12-family test, per-sample estimates of the margin study and the classical timing.

Design cautions:

- The training distribution is a checkerboard, not its smooth limit, so at very large sample sizes a network could in principle detect cell structure. Randomise $G$ per draw and keep it large relative to what the sample size can resolve.
- The prior over random fields is the prior of the resulting Bayes estimator. An estimator trained this way returns a posterior mean, so what the paper's tables read as bias at 0 and at 0.99 is prior shrinkage. That deserves saying out loud, along with a reported calibration curve, rather than being left for a reviewer to raise.
- Amplitude is drawn at random in the coverage diagnostic and by target search in training. The two give different label distributions; do not read the diagnostic as the training sampler.

### What is not claimed

- Every family, reflection and rotation scored is inside the training prior of ParamPL0z by name, and the 60 parameter settings of the benchmark lie inside its ranges; the held-out families and the equal-data comparison of Section VII-B are the tests outside that (`manuscript/main.tex`, Section VIII-C).
- The 12-family benchmark holds positive dependence only; every test is simulated, and the twin data have no known true value (Section VIII-C).
- The margins are continuous: the estimator is not valid for samples with few distinct values, and a constant column has no defined value (the ruling on ties in `notes/next.md`, and `manuscript/main.tex` Section VII-E).
- The intervals cover the test sampling and not the training seeds; a table of the supplementary (`tab:seedrange`) gives the range of the three training runs (Section VIII-C).
- At independence the published estimator has the lower RMSE, 0.0537 against 0.0566, a paired difference of $+0.0029$ $[+0.0006,+0.0049]$, and on five of the 12 families of the test set and on the Clayton, Frank and Gaussian families of the fixed-level test the interval holds zero (Section VII-A). No superiority claim is made on a row where another estimator is lower (paper design ruling D14, `notes/next.md`).
- Gumbel is not a clean hold-out: BB1 and BB6, left in training, reach it as limits (item 21 of `notes/next.md`).
- No claim that the nearest-neighbour estimator's neighbour search degrades badly on near-degenerate samples (Phase 2 result below).

## Constraints and limits

- Good enough: the presented estimator has a lower pooled RMSE than the heatmap estimator on both sets of the benchmark, with a paired interval below zero; every claim carries an honest interval (ruling D41 of `plan.md`); no superiority claim is made on a row where another estimator is lower (paper design ruling D14).
- Setting: manual, with no count of methods. Under ruling D33 of `plan.md` the session rules each decision itself on its recommendation, on Axel's behalf, and books it in `plan.md`.
- Compute, storage and access:

Local for everything up to and including the first phase-2 run: the engine is numpy, and the model is small enough that MPS trains it in under an hour. MPS is ten times faster than CPU here, 27 seconds against 275 per epoch on the phase-1 size, so the device order matters.

The cluster takes over at scale. `code/hpc/run_phase2.sh` submits the phase-2 scaling run as one dependency graph: a 21-task array generating 480000 training examples plus a validation shard, then a single GPU job training on all of them. Both stages follow the node-local scratch pattern the admins ask for, with the interpreter guard against the Ubuntu 24.04 nodes. Shards live in `~/projects/linfoot-estimator/data/` on the cluster, weights land in `~/models/linfoot-estimator/`.

The one prerequisite that cannot be shipped is the packed environment at `~/envs/linfoot_env.tar.gz`; the build commands are in the header of `run_phase2.sh` and the script fails loudly at the top if it is missing.

Scoring stays local, because it needs tensorflow for the published baseline and the cluster env is deliberately lean. Pull the weights back and run `run_phase2.py --score-only`.

The benchmark against FNN, KDE, KNN and MINE ran locally (the closed classical panel in `notes/next.md`, `code/results/classical_bench.md`). MINE trains a fresh network per dataset, so it ran at 50 replicates against 200 for the rest.

- Batch 1 has no GPU-hour limit; the measure is waiting time (ruling D14 of `plan.md`). The submit scripts of waves 3 to 6 stop when the home volume of the cluster has less than the space they estimate (29 GB, 4 GB, 63 GB and 4 GB) and when the tasks to submit and those in the queue would pass 100.
- The coauthors' benchmark archives are hers: their release in the public repository on acceptance waits on her agreement (`## Next`).
- The paper's main text is at most 12 pages; the supplementary has no page limit (rulings D41 and D52 of `plan.md`).

Question: no file of the project records a limit on time, such as a submission deadline. Is there one?

## Related work

The paper is the canonical record of the related work: `manuscript/main.tex` Section II and Section VIII-B. What it does not hold:

### The closest prior work

**The direction is partly occupied.** [MIST](https://arxiv.org/abs/2511.18945) (Gritsai, Richards, Meloux, Cho, Peyrard) appeared on arXiv on 24 November 2025, three weeks before this preprint, and has been revised through June 2026. It trains a SetTransformer on 625000 synthetic joint distributions with known mutual information drawn from the BMI benchmark library of [Czyz et al.](https://arxiv.org/abs/2306.11078), covering sample sizes 10 to 500 and dimensions 2 to 32, tests on held-out distribution families, and adds a pinball-loss quantile head whose intervals beat bootstrap. That is the preprint's stated future work, done by someone else and concurrently. Related and also recent: [VDC](https://arxiv.org/abs/2604.20568) trains one reusable amortized bivariate copula estimator and repairs its margins with IPFP, and [vector copulas](https://arxiv.org/abs/2510.20968) interpolate between Gaussian-copula and fully flexible neural models. Any v2 has to cite and benchmark against MIST, and the contribution has to be something MIST does not have.

Padded MIST, the MIST weights with one noise column per variable, is the comparison the paper runs (item 4 of `notes/next.md`, `code/results/mist_padded.md`). The literature check of 2026-11-05 and 2026-11-06, with the full texts read, is item 18 of `notes/next.md`: supervised amortised MI estimation is published (MIST, InfoNet, InfoAtlas, ALICE), group DRO, simulation-based stacking and after-training model averaging are partly anticipated, and the paper names InfoNet, InfoAtlas and ALICE without scoring them (ruling D45 of `plan.md`). No novelty page of `/researcher novelty` exists in `notes/`.

### What this project adds

The four contributions of `manuscript/main.tex` Section I-C: the estimator with exact invariance, the five copula fits, the direct estimate and the starting value fixed at 0 combined by softmax weights with a logit correction; a training prior that mixes three structurally different sets with exact labels, each passed in full every epoch, with a tenth of exact-independence examples; the measured comparison with the heatmap estimator, seven classical estimators and padded MIST with paired intervals; and the proofs that $L$ is a functional of the copula, with the Archimedean integral and the Clayton closed form. Not found in any text the literature check read: maximum pseudo-likelihood fits mapped to the target scale as starts, a jointly trained gate over the starts and the network's own estimate, a logit correction of the gated mean, exact invariance under the eight symmetries, and a mixture of structurally different priors each given its full budget (item 18 of `notes/next.md`).

## Results and how to reproduce

The baseline is the published (heatmap) estimator, `v1` in the code. Commands run from `code/` unless they start with `cd ~/projects/linfoot-estimator`; the cluster jobs are rebuilt by `bash code/hpc/run_all.sh` (waves 1 to 6) and their files copied back by `bash hpc/collect_batch1.sh`, as `code/README.md` says. Every result of the paper is a result of ParamPL0z, the reported network seed 20260820 unless a line says the mean of three runs.

### ParamPL0z against the published estimator on the 12-family benchmark

Pooled RMSE 0.0544 on the test set and 0.0539 on the validation set, against 0.0714 and 0.0708; paired difference $-0.0169$ $[-0.0206,-0.0133]$ and $-0.0169$ $[-0.0207,-0.0133]$. Per family the interval lies below zero on BB6, BB7, Gumbel, Joe, Student t, Tawn type 1 and Tawn type 2; at independence the published estimator is lower ($+0.0029$ $[+0.0006,+0.0049]$). File: `code/results/parampl0z_shipped_seed.md` (and `code/results/batch1_comparison.md` for the three-run mean). Command: `python3 experiments/figures_tables/make_batch1_figures.py`, from the rows of `code/results/batch1/rows/`. Beats the baseline: yes. Reaches what was set: yes.

### ParamPL0z on fresh samples

On the fresh test `fresh12` (240 cells, seed 20261109), which no design choice read: 0.0541 against 0.0699, $-0.0158$ $[-0.0194,-0.0124]$; the three-run mean 0.0543, $-0.0156$ $[-0.0192,-0.0121]$; below zero on eight of the 12 families; at level 0 $+0.0038$ $[+0.0003,+0.0071]$ for the reported network and $+0.0022$ $[-0.0012,+0.0053]$ for the three-run mean. File: `code/results/fresh_test.md`. Command: `python3 experiments/studies/run_fresh_test.py` (wave 6). Beats the baseline: yes. Reaches what was set: yes.

### Reflected and rotated copies

On the reflected and rotated versions of the 12 families: 0.0250 against 0.4487, $-0.4237$ $[-0.4549,-0.3919]$; on the three negatively dependent families of the fixed-level test the published estimator reads 0.6028 to 0.6029 and ParamPL0z 0.0489 to 0.0553. File: `code/results/parampl0z_shipped_seed.md`. Command: as the first result. Beats the baseline: yes. Reaches what was set: yes.

### Held-out families and equal training data

Held-out families, four folds of the 12 families removed by name from the training sets, three runs each: on the test set the pooled RMSE on the removed families is 0.0573, 0.0555, 0.0591 and 0.0567 (folds of Gaussian and Student t; Clayton, BB1 and BB7; Gumbel and Tawn types 1 and 2; Frank, Joe, BB6 and BB8), above ParamPL0z by $+0.0014$ to $+0.0044$ with intervals above zero, and against the published estimator $-0.0026$ $[-0.0059,+0.0009]$, $-0.0050$ $[-0.0103,-0.0002]$, $-0.0198$ $[-0.0258,-0.0140]$ and $-0.0230$ $[-0.0309,-0.0153]$; without the independent datasets the first two intervals hold zero (`manuscript/main.tex`, Section VII-B). Equal training data, ParamPL0z trained on set D alone: 0.0568 against 0.0714 for the published estimator, $-0.0146$ $[-0.0178,-0.0114]$, and against 0.0714 for E2, the published architecture retrained on the same data, $-0.0146$ $[-0.0202,-0.0098]$.

File: `code/results/holdout_comparison.md`. Command: `python3 experiments/studies/run_holdout_comparison.py` (wave 5). Beats the baseline: on set D alone, and on the folds with the interval below zero on three of the four pools as above, on two once the independent datasets are left out of the first two pools, as the Conclusion of the paper reports them. Reaches what was set: the line of `## Constraints and limits` is set for the presented estimator, not for these retrained models.

### The 12 families against the classical panel and padded MIST

Pooled ParamPL0z has the lowest RMSE of the ten columns on both sets, 0.0544 and 0.0539, against 0.0650 and 0.0651 for Kraskov on ranks, the next lowest; every other column minus ParamPL0z lies above zero on both sets, from $+0.0105$ $[+0.0057,+0.0159]$ (Kraskov on ranks) to $+0.2365$ $[+0.2172,+0.2561]$ (Kozachenko-Leonenko) on the test set. Padded MIST is higher on every family of both sets, 0.1003 against 0.0544 pooled; inside its trained sample sizes 0.1059 against 0.0612, $-0.0448$ $[-0.0523,-0.0371]$ (`manuscript/main.tex`, Section VII-C). Files: `code/results/family_benchmark_parampl0z.md`, `code/results/family_bootstrap_parampl0z.md`, `code/results/family_bootstrap_parampl0z_shipped.md`, `code/results/mist_trained_range.md`. Commands: `cd ~/projects/linfoot-estimator && bash code/hpc/submit_parampl0z_studies.sh` (the study `families`), and `python3 experiments/mist/run_mist_trained_range.py`. Beats the baseline: yes. Reaches what was set: yes.

### A change of margins

Under four strictly monotone transforms of both margins ParamPL0z reads 0.0506 four times; every estimator that reads raw values moves, by 0.0142 (KSG2) to 0.2246 (Kozachenko-Leonenko), the published estimator by 0.0944; the paired difference of each other column minus ParamPL0z lies above zero under all four margins (`manuscript/main.tex`, Section VII-D). Files: `code/results/classical_bench_parampl0z.md`, `code/results/classical_bench_intervals.md`. Commands: the study `classical` of `bash code/hpc/submit_parampl0z_studies.sh`, and `experiments/studies/run_classical_bench.py --per-sample-dir` in wave 6. Beats the baseline: yes. Reaches what was set: yes.

### Exact invariance, odd and even sample sizes and tied samples

Over 42000 pairs of a sample and its exact image the estimate changes by $1.55\times10^{-8}$ on average and $2.38\times10^{-7}$ at most, against 0.314 and 1.00 for the published estimator; under five random row orders of 22800 tied samples it changes by at most $3.58\times10^{-7}$; at odd and even $n$ on four families 0.0633 and 0.0635 against 0.0626 and 0.0629, intervals holding zero (`manuscript/main.tex`, Section VII-E). Files: `code/results/parampl0z_shipped_seed.md`, `code/results/tie_rules_parampl0z.md`, `code/results/parity_forward.md`, `code/results/training_mode_check.md`. Commands: `sbatch hpc/linfoot_tie_rules.slurm parampl0z`, `python3 experiments/studies/run_parity_forward.py`, `python3 experiments/engine_checks/run_training_mode_check.py`. Beats the baseline: yes on the images, not resolved at odd and even $n$. Reaches what was set: the invariance is exact.

### The two ends of the output range

At independence the mean estimate of ParamPL0z is 0.0683, 0.0465, 0.0292 and 0.0218 at $n$ = 100, 200, 500 and 1000, against 0.0574, 0.0426, 0.0293 and 0.0205 for the published estimator; at $L = 0.99$ it reads 0.9882 to 0.9897 with no estimate at one in 3200, while the published estimator returns exactly one in 50 to 123 of 800 samples (`manuscript/main.tex`, Section VII-F). File: `code/results/output_ends_parampl0z.md`. Command: the studies `ends-v1` and `ends` of `bash code/hpc/submit_parampl0z_studies.sh`. Beats the baseline: no at independence, yes at 0.99. Reaches what was set: not a pooled result.

### The components

Against the model without the exact-independence examples and the zero start (ParamPL) the three-run mean has $-0.0041$ $[-0.0046,-0.0036]$ at independence; the examples raise the pooled RMSE against ParamPL0 by $+0.0009$ $[+0.0004,+0.0014]$ on the test set; on the reflected and rotated versions $-0.0006$ $[-0.0008,-0.0004]$ against the network alone (`manuscript/main.tex`, Section VII-G). Files: `code/results/batch1_comparison.md`, `code/results/component_per_run.md`. Command: `sbatch hpc/linfoot_compare_batch1.slurm` (or `python3 experiments/studies/run_batch1_comparison.py` and `python3 experiments/studies/run_component_per_run.py` on the repository machine). Against the baseline: an ablation, compared with ParamPL0z's own components.

### Inference time

Median time of one estimate on one CPU thread: 29.13 ms at $n = 100$ and 48.45 ms at $n = 1000$ for ParamPL0z, of which the five copula fits take 6.82 and 11.97 ms; the published estimator's forward pass 47.62 to 47.82 ms; padded MIST 25.52 and 618.67 ms in its own job (`manuscript/main.tex`, Section VII-D). Files: `code/results/inference_time_parampl0z.md`, `code/results/inference_time_classical.md`. Commands: the study `families` of `bash code/hpc/submit_parampl0z_studies.sh`, and `experiments/family_benchmark/run_inference_time.py --classical` in wave 6. Against the baseline: a cost, not an error.

### The twin application

The Section 5 reproduction needs nothing from the SDU side: the twin data is public, the table `twinbmi` of the CRAN package mets 1.3.12, and `code/experiments/studies/fetch_twinbmi.py` writes its 4271 complete pairs (1483 MZ, 2788 DZ) to `~/data/linfoot-twinbmi/twinbmi_pairs.csv`. `code/experiments/studies/run_twin_application.py` scores every column of the 12-family table on those pairs under four strictly monotone transforms of both margins and a 1000-replicate percentile bootstrap resampling pairs, and writes `code/results/twin_application.md`, with the published estimator's raw and log values beside the preprint's numbers. On the cluster it is `code/hpc/linfoot_twin_application.slurm` followed by `code/hpc/linfoot_twin_mist.slurm`. Run at 1000 replicates on 2026-11-10 (jobs 713565 and 713566). The published estimator matches the preprint: raw 0.7369 MZ and 0.5035 DZ, log 0.7239 and 0.4309. ParamPL0z of seed 20260820 reads 0.7223 MZ and 0.4239 DZ under all four transforms, and padded MIST, outside its trained sample sizes, reads 0.7505 MZ and 0.2761 DZ. The percentile intervals of KSG1 k=4, KSG2, Kozachenko-Leonenko and the histogram are unusable, because resampled pairs duplicate about 63 percent of rows and the data is heavily tied; Kozachenko-Leonenko is 0 on the observed pairs too. It is Section S5 of the supplementary, with table `tab:twin`, stated as invariance and agreement between estimators and not accuracy, since the true value of the twin data is unknown.

File: `code/results/twin_application.md`. Command: `cd ~/projects/linfoot-estimator && sbatch code/hpc/linfoot_twin_application.slurm`, then `sbatch --dependency=afterok:<job> code/hpc/linfoot_twin_mist.slurm`. Against the baseline: no true value, so invariance and agreement between estimators only.

### The 16 models of batch 1

Pooled RMSE on the 12-family test: A 0.0607, B 0.0552, C 0.0573, D 0.0547, E1 0.0716, E2 0.0714, 13 0.0574, 7a 0.0570, 7b 0.0578 (item 17 of `notes/next.md`); Mix 0.0541, DRO 0.0565, Switch 0.0556, Param 0.0546, ParamPL 0.0543 (item 18); at independence ParamPL0 0.0604 and ParamPL0z 0.0551 against 0.0537 for the published model (item 9b). Files: `code/results/batch1_comparison.md`, `code/results/family_winners.md`, `code/results/batch1_results.pdf`. Commands: `sbatch hpc/linfoot_compare_batch1.slurm`, `sbatch hpc/linfoot_family_winners.slurm`, `python3 experiments/figures_tables/make_batch1_pdf.py`. Beats the baseline: every model but E1 (0.0716) and E2 (0.0714) is below the published model's 0.0714 pooled. Reaches what was set: ParamPL0z is the model presented.

### The thin-ridge resolution measurement

Pooled RMSE on the thin-ridge test set 0.1392 for the control stack (8/16/32) and 0.1289 for fine64 (8/16/32/64), three seeds each, at 60000 training examples (item 5 of `notes/next.md`). Files: `code/results/thin_ridge.md`, `code/results/thin_ridge.png`. Command: `cd ~/projects/linfoot-estimator && bash code/hpc/run_thin_ridge.sh`, then `bash hpc/collect_thin_ridge.sh`. Against the baseline: a comparison of two input stacks of this estimator.

### The released package and its saliency figures

The package `linfoot` (MIT, its own repository at `~/workspace/linfoot`) ships the weights of ParamPL0z seed 20260820 with `linfoot.estimate(x, y)`, `estimate_many` and a command-line script; on CPU its inputs and estimates equal `core/arms.py:predict_arm` bit for bit on the twin pairs and 200 simulated samples (MZ 0.7223, DZ 0.4239). Its zip for the coauthors is `admin/linfoot-estimator.zip`, rebuilt by `python3 code/experiments/release/make_package_zip.py`. The saliency figures, integrated gradients from the y-permuted sample, are `code/figures/release/saliency_*.png` with `code/results/release/saliency_summary.md`, written by `python3 code/experiments/release/make_saliency_figures.py` and zipped as `admin/linfoot-saliency.zip`; they stay out of the supplementary (item 23 of `notes/next.md`). Against the baseline: a release, not a comparison.

### Phase 1: invariance on the preprint's two families (August manuscript)

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

### Phase 2: the estimator trained on the label engine (August manuscript)

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

### The label engine validation

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

### Concavity classes of the engine

The engine's draws are not concave in any useful sense: a jointly concave copula is only $M(u,v) = \min(u,v)$, and the weaker classes in the literature (Durante and Papini 2009, componentwise concave and weakly Schur-concave; Dolati and Dehgan Nezhad 2014) hold for none of 150 engine draws (concave in each argument 0, Schur-concave 0, positive quadrant dependent 24). `code/core/concavity.py` holds the exact checkerboard checks (symmetric, TP2, concave in each argument, PQD, Schur-concave) and a generator whose log-density has a non-negative mixed derivative, which is TP2 and so concave in each argument, with an exact label; symmetric draws are also Schur-concave. A convex mix of two such draws is concave in each argument and no longer TP2, and the common-factor copula $d d^T / G$ of an engine draw is symmetric and Schur-concave but reaches labels only 0.17 to 0.47. The parabola and the tent (the copula of $(X, X^2)$) are in none of the classes: they are non-monotone, with Spearman near 0 and Linfoot near 0.95. Regenerate with `python3 code/experiments/engine_checks/run_concavity_check.py` (numpy only, the high-label bisection makes it slow, over ten minutes on one core), table in `code/results/concavity_check.md`, shapes with `code/experiments/figures_tables/make_concavity_figure.py` into `code/results/concavity_shapes.png`. The generator is not used for training, and the engine as shipped is unchanged.

`code/experiments/figures_tables/make_method_figure.py` draws the input, the layers and the D4 averaging for one real Clayton sample into `code/results/method_overview.png`.

### The port of the published model

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

### Two test grids

The original grid, 6 dependence levels by 4 sample sizes, is the preprint's own and is the comparison table. Every estimator in it was trained on sizes inside 100 to 1000, so it is like for like.

The wide grid, 8 levels by 6 sizes, adds 0.90 and 0.95 and adds sizes 50 and 2000. It fills two gaps: nothing between 0.80 and 0.99, and nothing outside 100 to 1000 although this estimator trains on 50 to 2000. The third, the generator family running 100 replicates against 200 elsewhere, is closed separately and on both grids. It is not neutral between estimators: the two added sizes are interpolation for ours and extrapolation for the published model, which trained on exactly 100, 200, 500 and 1000. So it characterises our estimator across the range it claims, and is not a head-to-head. Results in `code/results/phase2_wide_grid.md`, and at 200 replicates for every family in `code/results/phase2_wide_balanced.md`.

One ordering changes on it. On Gumbel the published model reads 0.0596 against 0.0597 for the two-family model, so the flip visible on the original grid (0.0607 against 0.0561) does not hold on the wider one. Its shortfall under reversed association grows from 0.60 to about 0.70 and on generator draws from 0.4777 to 0.5611, because the added cells are harder, which means the original grid was if anything generous to it.

### Further results

The closed studies of the August manuscript (the classical panel and the cost of a change of margins, every family at 200 replicates, the headroom correction, the cosine-basis input, the multiresolution cosine input) and the results of items 1 to 4, 6, 6d, 6f, 11, 12, 16, 16b and 16c are in `notes/next.md`, each with its file under `code/results/` and its command.

## Papers

### The paper

`manuscript/main.tex`, `manuscript/supplementary.tex` and `manuscript/main.bib`: "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation", IEEEtran, 12 and 21 pages, drafted and formatted for TNNLS. It reports every ParamPL0z result above, with the twin application as Section S5 of the supplementary. The review version keeps the byline "Anonymous Authors" (ruling D51 of `plan.md`); the named byline is a comment in both files. The cover letter is `manuscript/cover-letter.tex`. PDF copies of the manuscript, supplementary, concept note and cover letter are in `admin/draft/`.

### The internal document

`manuscript/concept-note/concept-note.tex`, 7 pages, "Sixteen Trained Estimators of the Linfoot Correlation and How They Compare with the Published Estimator" (rulings D29, D39, D40 and D48 of `plan.md`): every model of `code/results/batch1_results.pdf` in plain statistical language, for the coauthors. Two revision rounds are applied (`plan.md`, ledger).

### The preprint

St<e acute>phanie van den Berg leads this, with Ulrich Halekoh, S<o diaeresis>ren M<o diaeresis>ller and Jacob von Bornemann Hjelmborg at the University of Southern Denmark (SDU) and Andreas Kryger Jensen at the University of Copenhagen, as printed in the preprint; she is at the University of Twente. The preprint is [arXiv:2512.12358](https://arxiv.org/abs/2512.12358), posted 13 December 2025, and the released model is at `github.com/pingapang/Pretrained-Linfoot-estimator`. She asked Axel to look at it and see whether it can be improved. Nothing of ours is in the paper yet.

Four things settled with Axel on 2026-08-19. The preprint is **not under journal review**, arXiv only. We have **freedom to write either a v2 or a separate method paper**. St<e acute>phanie **did not know about MIST**. The twin data is public: the table `twinbmi` of the CRAN package mets.

The recommendation to write one paper that replaces the preprint, with its notes on authorship and venue, is in `notes/one-paper-not-two.md`.

### The archived drafts

The August manuscript is archived in `manuscript/archive/2026-08/`, 33 pages; the "32 pp" of the record of 2026-08-23 in `notes/next.md` was that day's build. The article-class draft is archived in `manuscript/archive/2026-11-article/` and the 2-page meeting answers in `manuscript/archive/2026-11-meeting-response/`.

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

## Dead ends (do not retry)

### The operator backbone

Folder in `code/attic/`: none, it was not built. Its gate is `code/experiments/studies/run_diagnostic.py`.

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

### Reshaping the label prior near independence

Folder in `code/attic/`: none; the priors are `LINFOOT_LABEL_PRIOR` in `code/core/phase2_gen.py`. Four label priors moved error from one band to another and left the total within 0.001 of 0.062: a zero-sum reallocation, as the headroom result predicts. Do not re-open it without a new idea. The record is "Closed: the independence floor" in `notes/next.md`, with `code/results/phase2_lowmass_grid.md`, `phase2_lowmass_wide.md`, `prior_ends.md` and `shaped_ends.md`.

### An output sharpness on the sigmoid

Folder in `code/attic/`: none; `floor_beta` in `code/core/v2_model.py`. Three arms at the matched budget left the independence floor where it was (0.0804 pooled for the sigmoid, 0.0881 at beta = 8, 0.0813 at beta = 20), so the floor is not an output-map artefact (`code/results/output_ends.md`; "Closed: the independence floor" in `notes/next.md`).

### A linear clipped output

Folder in `code/attic/`: none; the phase-1 variant `full`. It reaches the published estimator's accuracy at independence and then returns exactly 1.000 with zero spread at $L = 0.99$, a confident wrong reading; the bounded output is kept (Phase 1 result above).

### Five levers against the accuracy floor

Folder in `code/attic/`: none. More distinct shapes (0.0687 against 0.0661), double the trunk width (0.0663, overfits harder), the pinball objective, more examples and a cosine-basis input did not move the floor; the shipped model sits 5 to 8 percent above the floor its own uncertainty model implies ("Closed: six levers" and "Closed: the headroom figure" in `notes/next.md`, `code/results/resolution_test.md`, `basis_test.md`, `headroom.md`).

### The 64-cell input stack at the full budget

Folder in `code/attic/`: none. At 480000 examples 8/16/32/64 gave 0.0654 against 0.0661 at one seed each, weaker than the gain at the smaller budget, and was not adopted ("Closed: the finer histogram" in `notes/next.md`); the 64-cell model of wave 3 was cancelled before it started (ruling D22 of `plan.md`).

### The released MIST weights on scalar pairs

Folder in `code/attic/`: `code/attic/mist/` (`code/attic/README.md`). The weights read about 0.33 nats on a bivariate Gaussian whose true value is zero, because every training configuration of MIST has at least two columns for X and two for Y ("Closed: MIST cannot be benchmarked" in `notes/next.md`, `code/results/mist_integration.md`). The padded estimator of `code/core/mist_padded.py` replaced it.

## Next

1. Agree the order of authors with Stephanie van den Berg and the coauthors: Axel Faes, Stephanie M. van den Berg, Ulrich Halekoh, Soren Moller, Andreas Kryger Jensen, Jacob von Bornemann Hjelmborg.
2. Ask her agreement to release the two sets of the 12-family benchmark (`testdata.zip`, `validationdata.zip`) in the public repository on acceptance, which the Data Availability statement of the paper says.
3. Raise the 17-against-18 bin discrepancy between the preprint's text and its released R code with the authors.
4. Fill the CRediT roles (`% CREDIT` in `manuscript/main.tex`) and the authors' e-mail, department and city for the published byline.
5. Bring the figure text from 7 pt to IEEE's approximate 9 to 10 pt.
6. Run `python3 paper.py` end to end since its new step, and rerun the batch 1 comparison job with its edited script.
7. A later paper: the quantile head with coverage on ParamPL (item 9 of `notes/next.md`, ruling D24 of `plan.md`).

The specifications of each step, the rulings of 2026-10-19 and the dated record of the work that stood in this section are in `notes/next.md`; the step plan with its rulings and ledger is `plan.md`.

## Working state

### The stage and campaign that stand

No stage of `/researcher research` stands: `research` did not start this project, and the project's files record no stage of it. The work runs as the steps of `plan.md`, whose ledger lists each step with its state, and each step's specification is its item in `notes/next.md`. Jobs submitted and not yet read: none recorded; the last jobs on record, the twin application 713565 and 713566 of 2026-11-10, are read into `code/results/twin_application.md`. Briefs of the pieces of code: `notes/row21-brief.md` and `notes/row22-brief.md`, with no report beside them in `notes/`.

### Where things live

- `README.md`: this file. `plan.md`: the step plan, its rulings and its ledger.
- `code/`: the code folder and the public deposit, with its `README.md` and `.depositignore`.
- `code/run_all.sh`: none. `code/hpc/run_all.sh` submits cluster batch 1 (waves 1 to 6), and `code/paper.py` regenerates every figure and table from the committed results.
- `code/core/`, `code/experiments/` (six role folders and `release/`), `code/hpc/`: as the tree names them.
- `code/data/`: none. The raw inputs stand in `~/data/linfoot/` (the coauthors' archives and the caches our code builds), `~/data/linfoot-twinbmi/`, `~/data/mist/` and `code/vendor/` (the published model); on the cluster under `~/data/linfoot/cache/`, `~/data/linfoot-twinbmi/` and `~/data/mist/`, with the training shards under `~/projects/linfoot-estimator/`.
- `code/results/`: every result, the shipped weights and the paper's figures, which `manuscript/main.tex` includes through the links `manuscript/results` and `manuscript/archive/results`.
- `code/figures/`: `code/figures/release/`, the saliency figures of the released package.
- `code/attic/`: the dead ends, indexed in `code/attic/README.md`.
- `code/vendor/`: the published Model 3 and its environment `code/vendor/venv/`.
- `manuscript/`: the paper, the supplementary, the cover letter, `concept-note/` and `archive/`.
- `admin/`: PDF copies of the drafts (`admin/draft/`) and the zips for the coauthors (`admin/linfoot-estimator.zip`, `admin/linfoot-saliency.zip`).
- `notes/`: the meeting notes of 2026-10-19, the briefs of rows 21 and 22, and the sections moved out of this README (`notes/next.md`, `notes/one-paper-not-two.md`).
- `reviews/`: none.
- `logs/`: none in the project folder. The output files of the cluster jobs stand on the cluster in `~/projects/linfoot-estimator/logs/` (617 files, 5.7M), as each job's `#SBATCH --output` line names them; no job sets `--error`, so its errors go into the same file.
- Beside the tree: `correspondence/` (the MIST note to Stephanie, not sent), `present/` (files of another tool, not read), `.scratch/`, `project.yml` (a file of another tool, not read).
- On the cluster: the copy of the code in `~/projects/linfoot-estimator/code`, with its results in `~/projects/linfoot-estimator/code/results` (the rsync of the code folder excludes `results/`), the batch state and rows in `~/projects/linfoot-estimator/results_batch1/` and `results_holdout/`, the weights in `~/models/linfoot-estimator/`, the packed environments in `~/envs/`.
- The released package: its own repository at `~/workspace/linfoot` (item 23 of `notes/next.md`).

### Cluster facts

- The cluster of the University of Twente, reached as `utwente` (`ssh utwente`); the scheduler is SLURM, and every job goes through `sbatch`. The hub's guide is `docs/HPC-UTwente-howto.md` of the hub.
- Account: `bms-code` (`sacctmgr` printed `bms-code|`), set by no job file.
- Modules: none are loaded. The jobs run the packed environment of `code/hpc/batch_env.sh`: `~/envs/linfoot_env.tar.gz` (torch), `~/envs/linfoot_tf_env.tar.gz` (TensorFlow) and the overlay `~/envs/linfoot_mist_overlay.tar.gz` (MIST), built on the login node by `code/hpc/build_envs.sh`, the only machine with a route to the package index. The nodes run Python 3.12.3.
- Partitions: `main-cpu` and `main-gpu`, whose time limit `sinfo -h -o "%P %l"` prints as `infinite`, with a 24 h default walltime (`docs/HPC-UTwente-howto.md` of the hub, line 223).
- QOS: at most 100 submitted tasks and at most 8 running (`code/hpc/batch_lib.sh`, line 5).
- GPUs: the A100 node of `main-gpu` has 39.5 GiB and the A40 node 44.4 GiB; ctit088 has an 8 GB RTX 2080 and is left out of the group trainings.
- Scratch: the jobs follow the node-local scratch pattern the admins ask for, with the interpreter guard against the Ubuntu 24.04 nodes; nothing computes on the login node.
````

### Changes from the current `README.md`, and where each old fact went

A script (`python3`, comparing the lines of the old file with the new `README.md` and the two `notes/` files) found that every non-blank old line is carried verbatim except the lines listed below.

| Old section (line) | Where it went |
|---|---|
| Lines 3 and 5 (people, preprint, the four things settled on 2026-08-19) | `## Papers`, `### The preprint`, verbatim |
| `## What it is` (9, 11) | `### The problem`, verbatim |
| `## Where the improvement is` (17, 19, 21) | 17 to `### The closest prior work`, 19 to `### The problem`, 21 to `### Why it matters`, verbatim. Line 15, "Three findings shape the plan, in the order they matter.", is not carried, because its three findings are split across those sections. |
| `## One paper, not two` (25 to 33) | `notes/one-paper-not-two.md`, verbatim, linked from `### The preprint` |
| `## Plan` (37 to 50; 52 to 65) | 37 to 50 to `### The approach`, verbatim; 52 to 65 to `## Dead ends`, `### The operator backbone`, verbatim |
| `## The label engine` (69, 71, 89; 73 to 87) | 69, 71 and 89 to `## Data`, `### The label engine`; 73 to 87 to `### The label engine validation` |
| `## Concavity classes of the engine` (93, 95) | `### Concavity classes of the engine` |
| `## The v1 baseline runs here...` (99; 101 to 114) | 99 to `## Data`, `### The published model and the MIST weights`; 101 to 114 to `### The port of the published model` |
| `## Phase 1 result` (118 to 152) | `### Phase 1: invariance on the preprint's two families (August manuscript)` |
| `## Phase 2 result` (156 to 179) | `### Phase 2: the estimator trained on the label engine (August manuscript)` |
| `## Design cautions` (183 to 185) | `### The approach`, under "Design cautions:" |
| `## Compute` (189 to 197) | `## Constraints and limits`. In line 197, "under `## Next`" becomes "in `notes/next.md`", because the closed classical panel now stands there. |
| `## Data` (201) | `### The coauthors' 12-family benchmark`, verbatim |
| `## Open with Stephanie` (205 to 208) | Item 1 to `## Next` 1; item 3 to `## Next` 3, which adds "raise it with the authors" from old item 10; item 5 to `## Next` 2; item 4 to `### The twin application` without its "4. " number |
| `## Next` (212 to 315) | `notes/next.md`, verbatim. The new `## Next` is a list of seven next actions. Items 4, 5 and 6 come from old line 212, item 7 from old item 9. |
| `## Two test grids` (319 to 323) | `### Two test grids` |
| `## Deliverables` (327 to 340) | `## Papers`, `### The archived drafts` |
| Section headings | Replaced by the headings of the layout |

### Sources of the sentences the old README does not hold

- Title line and `## In short`: `manuscript/main.tex` (title, line 32; abstract, line 48; Section I-A, line 57).
- `### Why it matters`, second paragraph: `manuscript/main.tex`, Section I-B (line 63).
- `### What it does`: the abstract, line 48; `code/README.md`, the bullet of `make_parampl0z_figure.py` (old line 77, the five starts and the shipped seed); item 23 of the old `## Next`.
- `## Research questions and claims`: `manuscript/main.tex`, lines 48, 63, 71 to 74, 297, 388, 424 and 446; `main.aux` labels 167, 177, 185 and 187; `supplementary.aux` label 5 (S1); answer 2.
- `### The three training sets of the paper`: `manuscript/main.tex`, Section V; `code/README.md`, old lines 50, 51, 86 and 180; old README items 6e and 18c and line 246; `plan.md` D2, D20 and D21.
- `### The twin pairs`: `code/README.md`, old lines 114 and 115; `supplementary.aux` label 39 (S5); old README line 207.
- `### The published model and the MIST weights`, second paragraph: `code/vendor/README.md`; `code/README.md`, old lines 54 and 197.
- `## Method` intro and the campaign list: the section heads of `manuscript/main.tex`; old README lines 214, 246, 256, 258, 273 and 280; `plan.md` D27.
- `### What is not claimed`: `manuscript/main.tex`, lines 299 and 442; old README lines 177, 225, 226 and 256.
- `## Constraints and limits`, bullets: answer 3; `plan.md` D14, D33, D41 and D52; `code/README.md`, old lines 178, 185, 192 and 204; old README line 208.
- `## Related work`: `manuscript/main.tex`, Sections II, VIII-B and I-C (lines 71 to 74); old README lines 235 and 281; `plan.md` D45.
- `## Results and how to reproduce`, the new entries:
  - `manuscript/main.tex`, lines 297, 299, 304 to 307, Section VII-C (Table and text), Section VII-D, 388, 390, Section VII-F and 424.
  - `main.aux` labels 165 and 175.
  - Old README items 5, 9b, 17, 18, 21, 22 and 23.
  - The commands come from `code/README.md`, old lines 78, 82, 83, 85, 111, 112, 115, 150, 156, 212 to 217 and 223 to 226.
- `## Papers`, the new sentences:
  - `pdfinfo` on `manuscript/main.pdf` printed 12 pages and on `supplementary.pdf` 21.
  - `plan.md` D29, D39, D40, D48 and D51, and its ledger, lines 104 and 118.
  - `ls manuscript/archive admin/draft`.
  - Answer 4: `pdfinfo` on the archived PDF printed 33 pages, and `main.log:545` reads "Output written on main.pdf (33 pages, ...)".
- `## Dead ends`, the folder lines and summaries: `code/attic/README.md`; old README lines 291 to 307 (now in `notes/next.md`); `plan.md` D22.
- `## Next`: old README lines 205, 206, 208, 212, 244 and 247.
- `### The stage and campaign that stand`: `plan.md` (its ledger); old README line 207 (jobs 713565 and 713566); `ls notes`.
- `### Where things live`:
  - `ls` of the project, of `code/` and of `admin/draft`.
  - `ls -la manuscript/results` (the link to `../code/results`).
  - `code/README.md`, old lines 107, 158 and 164.
  - Old README lines 191, 251 and 260.
  - Answer 5.
- `### Cluster facts`: answer 6; `docs/HPC-UTwente-howto.md:223` of the hub; `code/hpc/batch_lib.sh:5` and `batch_env.sh:25-26`; `plan.md:124`; old README lines 191, 236 and 275; `code/README.md`, old lines 118 and 164.

## Draft 2: `code/README.md` (whole)

````markdown
# Pretrained Linfoot estimator: code

This folder is the code of the paper "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation": the estimator of the paper (ParamPL0z, `parampl0z` in the code), the generators of its training data with exact labels, the earlier estimators of the project, the benchmarks, the studies the paper reports, and the job scripts that run them on a SLURM cluster.

Training a supervised estimator of the Linfoot informational correlation needs bivariate distributions whose mutual information is known exactly. Closed forms exist for only a few copula families, which caps how varied the training set can be. This code removes that cap by generating copulas whose label is exact by construction rather than by formula.

The estimand is $L = \sqrt{1 - e^{-2 I(X;Y)}}$ and it depends only on the copula, so one training example is a copula density on $[0,1]^2$ with uniform margins together with its mutual information.

## What it computes

- The trained weights of ParamPL0z, three training runs, of which seed 20260820 is the reported network and the one this deposit ships (`results/batch1/weights/phase2_parampl0z_s20260820.pt`), and the earlier shipped model `results/phase2_scaled.pt`.
- The comparison of ParamPL0z with the published estimator on the 12-family benchmark of the coauthors, on fresh samples of it, on the reflected and rotated copies of its families, on a fixed-level grid and at odd and even sample sizes, each with paired two-stage cluster bootstrap intervals.
- The retrained models with families held out by name, and ParamPL0z trained on the published estimator's training process alone.
- The 12 families against seven classical estimators and padded MIST, the classical panel under four changes of margins, the two ends of the output range, tied samples, inference time and the twin application.
- The 16 models of cluster batch 1 and their comparison, from which ParamPL0z was chosen.
- The checks of the label engine, of the concavity classes, of the port of the published model and of the invariance of the input and the network.
- Every figure and table of the paper, from the results above.

### How the label engine works

A random smooth log-density field is drawn on the unit square from a tensor cosine basis, with a random spectral decay setting the smoothness and a random boundary warp pressing structure towards the edges. Sinkhorn scaling in the log domain projects it onto the set of densities with uniform margins. The result is kept as a checkerboard: a density constant on each cell of a $G \times G$ grid.

For a checkerboard density with cell values $c_{ij}$ and uniform margins,

    I = mean_ij c_ij * log(c_ij)

holds exactly, and drawing a cell with probability $c_{ij}/G^2$ followed by a uniform point inside that cell is an exact sample from the density. Both the label and the sampler are therefore free of discretisation error with respect to the distribution being sampled.

To balance the training labels, the field shape is drawn once and only its amplitude is searched, by bracketing then bisection, until the Linfoot value matches a requested target. The label is always recomputed from the final grid, so a search that lands short still carries a correct label.

Monotone marginal transforms are deliberately absent. In two scalar dimensions they are the only continuous injective maps available, and they leave the copula, the label and the rank statistic unchanged, so they generate no new dependence structure. Diversity comes from the field and the warp.

## Requirements

- `requirements.txt`, the pinned packages the code imports; the MIST package and its dependencies are in its comments.

Requires Python 3 with numpy and scipy. No data and no credentials, except that `run_family_classification.py` needs `~/data/linfoot/testdata.zip` for its parameter list, `run_family_prior_check.py` also needs `~/data/linfoot/trainingdata.Rdata` and Rscript, and both need `mpmath` (`pip install mpmath`) for the exact copula CDFs. `run_rotated_copies_check.py` needs `testdata.zip`, mpmath, torch and the weights at `results/phase2_scaled.pt` (`LINFOOT_WEIGHTS`), and for its Model 3 columns tensorflow, keras and `vendor/combined_model_2.keras` (`LINFOOT_V1_MODEL`); `run_engine_invariance_check.py` needs numpy, scipy and mpmath only. `run_feature_table_check.py` needs numpy, scipy, mpmath, torch, `~/data/linfoot/features_validationdata.csv` and `validationdata.zip`, and Rscript when the cache of the validation samples is not built yet; `--smoke` selects six datasets, prints the report and writes no file. `run_training_mode_check.py` needs numpy, scipy, mpmath, torch and the weights at `results/phase2_scaled.pt` (`LINFOOT_WEIGHTS`).

Hardware: device selection is cuda, then mps, then cpu. The trainings and the scorings of batch 1 run on one GPU each on the cluster; the label engine, the checks and the figures run on a CPU, and the scorings of the published model and of padded MIST run locally on MPS or on the cluster's CPUs, as the commands below say.

## Data

- The 12-family benchmark of the coauthors: `testdata.zip` and `validationdata.zip` in `~/data/linfoot/`, with `trainingdata.Rdata` and `features_validationdata.csv` beside them for the cross-checks. They are the coauthors' files, released in a public repository on acceptance of the paper. `core/vine_benchmark.py` extracts the two archives to `~/data/linfoot/extracted/` and converts every `.RData` file with `Rscript` to a numpy cache in `~/data/linfoot/cache/`; on the cluster the cache is copied to `~/data/linfoot/cache/` (see "Reproduce cluster batch 1").
- The twin pairs: the public table `twinbmi` of the CRAN package mets 1.3.12, written by `experiments/studies/fetch_twinbmi.py` to `~/data/linfoot-twinbmi/twinbmi_pairs.csv` (`LINFOOT_TWIN_DATA`).
- The published MIST weights: from Hugging Face into `~/data/mist` (`LINFOOT_MIST_DIR`), as the bullet of `core/mist_padded.py` says.
- The published Model 3: `vendor/combined_model_2.keras`, fetched as `vendor/README.md` says.
- Every training set is generated by the code from its seeds, so no training data is read.

## Run

There is no `run_all.sh` in this folder. `python3 paper.py` regenerates every figure and table from the committed results; `hpc/run_all.sh` rebuilds the trainings and scorings of cluster batch 1 on the cluster, and the sections below give the other runs with their times.

### The job scripts of `hpc/`

- `hpc/run_all.sh`, the one entry point of cluster batch 1: the guard, the dry run and the submission of wave 1, with `hpc/submit_wave2.sh` for the scoring, `hpc/submit_wave3.sh` and `hpc/submit_wave4.sh` for the models trained on sets B, C and D at once, `hpc/submit_wave5.sh` for the held-out-family models and the model on set D alone, `hpc/submit_wave6.sh` for the fresh test and the margins and timing studies, `hpc/batch_lib.sh` for their tables and the reader of `sacct`, `hpc/batch_env.sh` as the prelude of the jobs and `hpc/collect_batch1.sh` to copy the rows, the curves, the reports and the three ParamPL0z weights files into `results/batch1/` and `results/`; see below. The weights of the other models stay on the cluster, since nothing run here reads them. `hpc/test_run_all.sh` runs the six waves against fake `sbatch` and `sacct` and needs no cluster.
- `hpc/run_phase2.sh`, the phase-2 scaling run as one dependency graph, with the build commands of `~/envs/linfoot_env.tar.gz` in its header.
- `hpc/run_thin_ridge.sh`, the thin-ridge dependency graph: `hpc/linfoot_ridge_generate.slurm` (22 CPU tasks), `hpc/linfoot_ridge_tests.slurm` (25 CPU tasks), `hpc/linfoot_ridge_train.slurm` (6 GPU tasks) and `hpc/linfoot_ridge_score.slurm` (6 GPU tasks). `hpc/collect_thin_ridge.sh` copies the results back and builds the report.
- `hpc/build_envs.sh`, builds the two packed environments on the login node, the only machine with a route to the package index, and `hpc/linfoot_env_check.slurm` trains a small model on a GPU in each. `hpc/build_envs.sh mist` builds `~/envs/linfoot_mist_overlay.tar.gz`, `mist_statinf` and the packages it needs that the torch environment does not hold; only the job of the padded MIST timing and `hpc/linfoot_twin_mist.slurm` read it, behind the torch environment on `PYTHONPATH`, so no other job changes what it imports.

### Reproduce

    python3 experiments/engine_checks/run_engine_validation.py
    python3 experiments/engine_checks/run_v1_port_check.py

The first takes about five minutes on one core. Five checks: the checkerboard label against the analytic Gaussian value, the checkerboard label against the Clayton closed form, the sampler against its own cell probabilities, the accuracy of the amplitude search, and the coverage of the prior.

The second takes about 35 seconds. It checks the ported k-nearest-neighbour estimator against analytic Gaussian mutual information, checks the ported feature against the published Table 1 column of arXiv:2512.12358 across all six dependence levels and all four sample sizes, and checks the shapes and column order of the two model inputs. Its last section additionally scores the released weights end to end, and is skipped unless `vendor/combined_model_2.keras` is present and tensorflow is importable.

`run_rotated_copies_check.py` takes about 24 minutes on one MPS device (1431 s measured, the Model 3 and `ksg1_rank` contrast included) and `run_engine_invariance_check.py` about 14 minutes (846 s measured), both measured while the other ran; run them as

    vendor/venv/bin/python -u experiments/engine_checks/run_rotated_copies_check.py
    python3 experiments/engine_checks/run_engine_invariance_check.py

The phase-1 comparison needs torch as well, and tensorflow plus the vendored model for its v1 columns:

    python3 -m venv env
    ./env/bin/pip install numpy scipy torch tensorflow
    ./env/bin/python experiments/studies/run_phase1.py

It trains on the preprint's own generating process, the same two families with positive dependence only, the same 32000 datasets and the same 50 epochs, so the only differences from the published estimator are the input representation and the symmetry structure. Device selection is cuda, then mps, then cpu.

### Reproduce the thin-ridge resolution measurement

The question is whether copulas with thin ridges need a rank histogram finer than 32 by 32 cells. Two arms differ only in the resolution set (`LINFOOT_RESOLUTIONS` 8,16,32 | 8,16,32,64), each trained with three seeds on the same 60000 training examples (30 percent thin-ridge copulas), and scored on the same thin-ridge test set, and on the same eight-family grid. The whole measurement is rebuilt from nothing by one command on the cluster login node, after the code folder has been copied to `~/projects/linfoot-estimator/code`:

    cd ~/projects/linfoot-estimator && bash code/hpc/run_thin_ridge.sh

There is no raw data and no credential. The one prerequisite that cannot be shipped is the packed environment `~/envs/linfoot_env.tar.gz`, built once with the commands in the header of `hpc/run_phase2.sh`; `hpc/run_thin_ridge.sh` checks for it, and for every file the jobs read, before it submits anything, and stops with the missing path and the fix. The script submits four job arrays with dependencies (training data, test set, six training runs, six scoring runs), all on compute nodes through `sbatch`. There is no 128-cell arm: the 128-cell stack does not fit the GPU memory of the `main-gpu` partition at batch 512.

When the arrays have finished, on the machine that holds the repository:

    bash hpc/collect_thin_ridge.sh

which copies the scores, the learning curves, the training metadata, the test-set index and the job accounting into `results/thin_ridge/` and writes `results/thin_ridge.md`, `results/thin_ridge.png` and `results/thin_ridge_rows.json`. The test boards and scoring inputs are cached in `~/data/linfoot/ridges` (registered as `linfoot-ridges` in the data registry). `experiments/pipeline/check_thin_ridge_inputs.py` checks the inputs of the two arms against the existing encoder and needs no cluster.

### Reproduce cluster batch 1

Waves 1 and 2 are 24 trainings and 26 scoring jobs, one per model. Sets B, C, D, E1 and E2 and arms 13, 7a and 7b are three seeds each at `LINFOOT_RESOLUTIONS` 8,16,32, the arms on set C, which is generated with `--store-arms`. The existing `~/models/linfoot-estimator/phase2_scaled.pt` is scored and not retrained. Each of these models is scored on the 12 families, the eight-family grid, the thin-ridge set, the shapes, the copies and the parity cells. These prerequisites cannot be built by a job: the packed environments from `hpc/build_envs.sh`, the overlay and the MIST weights of the timing of wave 6 (see the commands of wave 6 below), the weights of the existing model, and the 12-family cache, copied from the repository machine because its archives are the coauthor's files and converting them needs R:

    rsync -a --include='test/***' --include='validation/***' --exclude='*' ~/data/linfoot/cache/ utwente:data/linfoot/cache/

Every other test input and all training data are rebuilt by the batch. After the code folder has been copied to `~/projects/linfoot-estimator/code`, on the login node:

    cd ~/projects/linfoot-estimator && bash code/hpc/run_all.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/run_all.sh --fresh

The script stops before any submission when an environment, a code file, the cache, disk space or the time limit of `main-gpu` is missing. Otherwise it submits and exits in seconds, and nothing stays on the login node. The QOS accepts 100 submitted tasks and runs 8, so the short CPU work is chunked, one array task doing several units. Wave 1 is 71 tasks: the test sets, the generation and the training, each training with `afterok` on its own generation, and a helper job with `afterany` on all of them. The helper runs `hpc/submit_wave2.sh`, which submits the 26 scoring tasks. It scores each model whose training task is COMPLETED in `sacct` and names any model it skips in `results_batch1/skipped.txt`; a test that failed to build is left out of every model and named there too. A failed set stops no other set. At its end the helper runs `hpc/submit_wave3.sh`, which submits wave 3 and then runs `hpc/submit_wave4.sh`, which submits wave 4. `--fresh` first removes the shards, rows and state of an earlier run and refuses while a job of that run is queued. The state is `results_batch1/job_ids.txt`: run the script again without `--fresh` to resume, which resubmits nothing listed there and removes nothing; to run one step again, delete its line first.

Wave 3 is five models trained on sets B, C and D only, three seeds each (20260819 to 20260821), 40 tasks: 10 generation, 15 training and 15 scoring. `mix` is the CNN on the plain mixture of the three sets and `dro` the same with group DRO (`--dro-eta 0.01`) against the best validation MSE of the one-set model trained on that set with the same seed; both pass all 480000 training examples of each set per epoch in the 938 steps of a one-set run (`--batch 1536 --per-group 480000`, 512 of each set per step, 60 epochs). `switch` is `arms.SwitchNet` over the frozen models of B, C and D of one seed, its gate fitted on a fresh switch set of 120000 training and 6000 validation examples per prior at indices from 40000000 on (`hpc/linfoot_generate_switch3.slurm`, `data_switch3/<prior>/`). `param` is `arms.ParamStartNet` on the tau-inversion and van der Waerden starts of `core/param_start.py`, and `parampl` the same model on the maximum pseudo-likelihood starts (`pl_starts`: Gaussian, Clayton, Gumbel and Frank fitted to the pseudo-observations, oriented by the sign of Kendall's tau, Clayton and Gumbel also as their 180-degree rotations, exactly invariant under the group of the square) with its own estimate as one more start; both train on the mixture with the budget of `mix`, from the shards of `hpc/linfoot_generate_starts.slurm` (`data_set{b,c,d}_starts`, the indices of sets B, C and D with the keys `starts` and `starts_pl`). Every model is scored on the tests that rank the models, the 12 families, the eight-family grid, the copies and the parity cells, less any that failed to build; its scoring waits task by task on its training (`aftercorr`). Once waves 1 and 2 have finished, wave 3 is submitted alone with:

    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave3.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave3.sh

A step of batch 1 that wave 3 waits on is resolved from `sacct`: one whose tasks are all COMPLETED is not named in `--dependency`, since Slurm refuses a dependency on a job it has forgotten; one with a task in another final state leaves out the steps on it, named in `results_batch1/skipped.txt`; one with a task `sacct` does not know stops the script before anything is submitted. The script also stops when the tasks to submit and the tasks of the user in the queue would pass 100, or when the home volume has less than the 29 GB estimated for the new shards. `sbatch hpc/linfoot_wave3_smoke.slurm` checks the code of wave 3 on a GPU first and writes `results/wave3_smoke.md`; it needs a copy of the code from before wave 3 in `~/projects/linfoot-estimator/code_baseline_redo`.

Wave 4 is two more models of the kind of `parampl`, trained like it (`--batch 1536 --per-group 480000`, 60 epochs, `LINFOOT_RESOLUTIONS` 8,16,32) with the same three seeds, 15 tasks: 3 generation, 6 training and 6 scoring. `parampl0` is `arms.ParamStartNet` with `zero_start`, on the shards of `data_set{b,c,d}_starts`. `parampl0z` is the same model on those shards with, for each of sets B, C and D, the training shards `train_018.npz` and `train_019.npz` replaced at staging time by the exact-independence shards of `sbatch hpc/linfoot_generate_zeros.slurm <setb|setc|setd>`, a tenth of the training data labelled 0; the validation shard is unchanged. The zeros shards are written with `gen_shard.py --label-zero --store-starts` into `data_set{b,c,d}_zeros`, from the prior of the set, at the index blocks from 80000000 (B), 81000000 (C) and 82000000 (D), which no other dataset of this code uses. `sbatch hpc/linfoot_train_groups.slurm parampl0` and `parampl0z` write `phase2_parampl0_s<seed>.pt` and `phase2_parampl0z_s<seed>.pt` to `~/models/linfoot-estimator/`; every mode of that job stops at its top unless each folder it reads holds exactly `train_000.npz` to `train_019.npz` and `valid_000.npz`, and `parampl0z` also both zeros shards of each set. `parampl0` waits on the generation of the starts of wave 3, `parampl0z` on that and on the three zeros jobs, and each scoring task on its training task (`aftercorr`), on the tests of wave 3. Once wave 3 is on record, wave 4 is submitted alone with:

    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave4.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave4.sh

Its steps outside wave 4 are resolved from `sacct` as those of wave 3 are, and it also stops when the tasks to submit and the tasks of the user in the queue would pass 100, or when the home volume has less than the 4 GB estimated for the zeros shards. `sbatch hpc/linfoot_wave4_smoke.slurm` checks the code of wave 4 on a GPU first and writes `results/wave4_smoke.md`: a saved `parampl` of the code from before wave 4 predicts the same with this code, a saved `parampl0` the same after a reload, all the weight on the zero start gives 0.001, small zeros shards of each prior through the checks of `experiments/engine_checks/run_wave4_smoke.py`, two epochs of `parampl0` and of `parampl0z` with a reload and predictions at odd n, and the scoring of both on a few cells of the four tests. It needs a copy of the code from before wave 4 in `~/projects/linfoot-estimator/code_baseline_wave4`.

Wave 5 is the held-out-family runs and the run on equal training data of item 21 of the project's `notes/next.md` (rulings D43 and D44), 68 tasks: 37 generation, 15 training, 15 scoring and the comparison. For each fold of `core/holdout.py` (`h1` Gaussian, Student t; `h2` Clayton, BB1, BB7; `h3` Gumbel, Tawn type 1, Tawn type 2; `h4` Frank, Joe, BB6, BB8) the starts shards of each set the fold changes are generated at the indices of `data_set{b,c,d}_starts` with the fold's families held out, by `sbatch hpc/linfoot_generate_starts.slurm <set>_<fold>` into `data_<set>_<fold>_starts`, and the zeros shards of set D under `h1` and `h2` by `sbatch hpc/linfoot_generate_zeros.slurm setd_<fold>` into `data_setd_<fold>_zeros`. A fold changes set B always, set C unless it holds out none of the eight Archimedean families (`h1`), set D only under `h1` (Clayton left) and `h2` (Gaussian left), and the zeros of sets B and C never, since they are the independence board before any family is drawn; a set a fold leaves unchanged is read from its folder of batch 1 (`python3 core/holdout.py folder <fold> <set> <starts|zeros>`). `sbatch hpc/linfoot_train_groups.slurm parampl0z_h<1-4>` trains the ParamPL0z recipe unchanged on the fold's folders and `parampl0z_setd` the same recipe on `data_setd_starts` with `data_setd_zeros` alone (938 steps of 512 examples, 60 epochs), three seeds each, into `~/models/linfoot-estimator/phase2_parampl0z_h<1-4>_s<seed>.pt` and `phase2_parampl0z_setd_s<seed>.pt`, curves into `results_holdout/curves/`; `hpc/linfoot_score_set.slurm` scores them on the tests of wave 4 into `results_holdout/rows/`, apart from `results_batch1/rows/` so that `run_batch1_comparison.py` does not read them as seeds of ParamPL0z; and `sbatch hpc/linfoot_compare_holdout.slurm` runs `experiments/studies/run_holdout_comparison.py` into `results_holdout/holdout_comparison.md` after every scoring it reads. Waves 2 to 4 hold 81 tasks, so wave 5 beside them would pass the QOS limit of 100: `hpc/submit_wave4.sh` submits at its end a helper job on main-cpu with `afterany` on every queued job of batch 1, which runs `hpc/submit_wave5.sh` once they have ended, so `bash code/hpc/run_all.sh` submits wave 5 too. Once wave 4 is on record, wave 5 is submitted alone with:

    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave5.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave5.sh

Its steps outside wave 5 are resolved from `sacct` as those of wave 3 are, and it also stops when the tasks to submit and the tasks of the user in the queue would pass 100, or when the home volume has less than the 63 GB estimated for the new shards. The table of its steps, with the limits and the figures they come from, is `WAVE5` in `hpc/batch_lib.sh`.

Wave 6 is the fresh 12-family test and the margins and timing studies of item 22 of the project's `notes/next.md`, 25 tasks: six tasks that build the 60 parameter combinations of `fresh12` (units 62 to 121), three scoring ParamPL0z on them and one scoring `v1` under the tag prefix `fresh12_`, the comparison `results/fresh_test.md`, one task per margin for the panel, for MINE and for `v1` (`experiments/studies/run_classical_bench.py --per-sample-dir`), the merge and `results/classical_bench_intervals.md`, and the classical timing `results/inference_time_classical.md`. It is the table `WAVE6` of `hpc/batch_lib.sh`. `hpc/submit_wave5.sh` submits a helper that runs it when the queue of batch 1 has drained; once its dependencies are on record it runs alone. The timing of padded MIST needs two prerequisites beside those of batch 1, which `hpc/run_all.sh`, `hpc/submit_wave6.sh` and the job check at their top: the overlay environment, built once on the login node, and the published MIST weights, copied from the repository machine:

    cd ~/projects/linfoot-estimator && bash code/hpc/build_envs.sh mist
    rsync -a ~/data/mist/ utwente:data/mist/

The first line runs on the login node, the second on the repository machine; `LINFOOT_MIST_DIR` set to another path under `~/data` replaces `~/data/mist`. Then, on the login node:

    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave6.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/submit_wave6.sh

Its steps outside wave 6 are resolved from `sacct` as those of wave 5 are; it stops when the tasks to submit and the tasks of the user in the queue would pass 100, or when the home volume has less than the 4 GB estimated for the cells of the fresh test.

When the six waves have ended, on the repository machine:

    bash hpc/collect_batch1.sh

The comparison and the leader study run on the cluster from the rows files, the tie study from the three ParamPL weights files of wave 3, and `hpc/collect_batch1.sh` copies their reports once they exist:

    sbatch hpc/linfoot_compare_batch1.slurm    # results/batch1_comparison.md, paired differences of chosen pairs, ParamPL0z against Mix among them, and results/component_per_run.md, the models of the components table run by run
    sbatch hpc/linfoot_compare_holdout.slurm   # results/holdout_comparison.md, wave 5 against ParamPL0z, v1 and E2; step w5-compare submits it
    sbatch hpc/linfoot_family_winners.slurm    # results/family_winners.md, the lowest-RMSE model of each group against every other model, and ParamPL0 and ParamPL0z against ParamPL
    sbatch hpc/linfoot_tie_rules.slurm parampl # results/tie_rules.md, the three ParamPL seeds on tied samples, 16 CPUs on main-cpu
    sbatch hpc/linfoot_label_mass.slurm        # results/label_mass.md, the training labels near Linfoot 0 per set
    python3 experiments/figures_tables/make_batch1_pdf.py

`experiments/studies/run_batch1_comparison.py` reads the rows files of `results/batch1/rows/` and needs numpy only, so it also runs on the repository machine: `python3 experiments/studies/run_batch1_comparison.py` wrote `results/batch1_comparison.md` with all 47 models and 4000 resamples in 376.2 s at 816 MB peak, measured. `python3 experiments/studies/run_holdout_comparison.py` likewise reads `results/batch1/rows/` and `results/holdout/rows/`, which `hpc/collect_batch1.sh` fills from `results_holdout/`, and writes `results/holdout_comparison.md`.

The model-specific studies of the paper for ParamPL0z run on the samples of the stored report of each study, so ParamPL0z is a paired column beside the baselines there. One script submits all ten jobs, the three family checks on main-gpu and the rest on main-cpu, with the limits and the measured figures they come from in its header:

    cd ~/projects/linfoot-estimator && bash code/hpc/submit_parampl0z_studies.sh --dry-run
    cd ~/projects/linfoot-estimator && bash code/hpc/submit_parampl0z_studies.sh

They are `hpc/linfoot_tie_rules.slurm parampl0z` (`tie_rules_parampl0z.md`) and `hpc/linfoot_model_studies.slurm <study> parampl0z` for the studies `ends-v1` and `ends` (`output_ends_parampl0z.md` and `.json`; `ends` waits on `ends-v1`), `classical` (`classical_bench_parampl0z.md` and `_rows.json`), `families` (`family_benchmark_parampl0z.md`, `_estimates.npz`, `family_bootstrap_parampl0z.md`, `family_bootstrap_parampl0z_shipped.md` and the inference time `inference_time_parampl0z.md`), `family-check` once per seed (`family_check_parampl0z_s<seed>.md` and `.json`), `families-merge` (the check parts folded into `family_benchmark_parampl0z.md`; it waits for the report to succeed and for the three checks to end) and `mist-grid` (`mist_grid_parampl0z.md` and `mist_grid_parampl0z_rows.npz`), all into `results_batch1/`. The limits are tie 2 hours and 8G, ends-v1 1 hour, 4 CPUs and 8G, ends 1 hour, classical 2 hours, families 1 hour, 4 CPUs and 8G, each family check 3 hours on main-gpu with one GPU and the `--constraint` of the GPU model its seed's rows were scored on, families-merge 30 minutes, 1 CPU and 2G, and mist-grid 1 hour, ends, classical, the checks and mist-grid at 16G; the header gives the cluster rates they come from (0.00329 s per sample and seed for the networks and 0.0447 CPU-s per sample for the inputs, both from the tie job 686400) and the sacct memory of each job. Each job checks its inputs before it stages the environment, and a job on record in `results_batch1/job_ids.txt` is not submitted again. `hpc/collect_batch1.sh` copies the reports into `results/`. A model name as the argument of the submit script runs the same studies for another named model.

### Use the label engine from Python

```python
import numpy as np
from copula_engine import copula_at_target_linfoot, sample_copula, pseudo_observations

rng = np.random.default_rng(0)
draw = copula_at_target_linfoot(rng, target=0.45, grid_size=256)
sample = sample_copula(draw["c"], n=1000, rng=rng)   # exact pseudo-observations
ranks = pseudo_observations(sample)                  # what an invariant estimator reads
label = draw["linfoot"]                              # exact
```

## What each result comes from

The scripts of `experiments/`, each with the files of `results/` it writes, and `paper.py`, which makes every figure and table of `figures_tables/`:

- `experiments/engine_checks/run_concavity_check.py`, which concavity classes the engine and the constructed generator reach; writes `results/concavity_check.md`. `experiments/figures_tables/make_concavity_figure.py` draws them into `results/concavity_shapes.png`.
- `experiments/studies/run_classical_bench.py`, scores the classical panel of `core/classical.py` (`ksg1_rank` included), optionally MINE and the published Model 3, beside this estimator on the shared test grid under four strictly monotone margin transforms of the same copulas, with the spread of each estimator's pooled RMSE over the four transforms, pooled over all eight families and, as the ranking tests pool them, over the seven copula families of the grid without the engine draws (`gaussian`, `clayton`, `gaussian-negative` the reversed Gaussian, `clayton-rotated` the rotated Clayton, `frank`, `frank-negative` the reversed Frank, `gumbel`), with the margins table of each of those seven alone; `--from-rows FILE` rebuilds the report from a rows file without scoring; `--validate` first checks every classical estimator against the bivariate Gaussian closed form (`results/classical_validation.md`); writes `results/classical_bench.md`. `--model NAME --merge-from results/classical_bench_rows.json` adds a named model of `core/named_models.py` as a column of the stored panel: it draws the samples again from the seed, grid and replicate count of that rows file, stops unless the column of `--verify` (default `hist`) computed again equals the stored one in every cell to 1e-9, copies the classical rows, scores each sample once (and again on a margin whose transform changes its doubled ranks), and writes `results/classical_bench_<name>.md` and `_rows.json` (`--out`) with the mean over the seeds and each seed, the stored shipped model relabelled "Set A, engine prior (shipped model)"; `--weights-dir`, `--workers`, `--batch-size` and `--device` set where and how the seeds run, and `--sizes` limits the grid of the original panel for a smoke test. The samples are drawn by `core/testsets.draw_test_cells`, which takes every random draw in the main process in the order of the serial calls of `make_test_samples` and runs the held-out checkerboards and the engine's amplitude searches in the pool, so the samples are those of the stored rows; the hist check, the inputs and the networks then run with a flushed progress line each, and the networks run in the main process on `--network-threads` threads (default `--workers`) while the workers keep one BLAS thread each. It runs on the cluster as `sbatch hpc/linfoot_model_studies.slurm classical parampl0z`. `--per-sample-dir DIR --columns panel|mine|v1 --margin NAME --merge-from results/classical_bench_parampl0z_rows.json` writes the estimate of every sample of the stored grid on one margin (MINE on its 50 samples), with the check of the column `hist` against the stored one to 1e-9; `--merge-parts DIR --per-sample FILE` joins the parts and `--intervals --per-sample FILE --out FILE` writes `results/classical_bench_intervals.md`, each column minus ParamPL0z of seed 20260820 per margin over the seven families of the grid, with the paired two-stage interval.
- `experiments/engine_checks/run_family_prior_check.py`, compares the family prior with her archives without feeding training: whether the records of `trainingdata.Rdata` and the 60 test parameter combinations lie inside the ranges of the prior, the grid label at 30 records per family against the label in her file, and which of the five classes the drawn boards fall in; needs `~/data/linfoot/trainingdata.Rdata` and `testdata.zip`; writes `results/family_prior_check.md`.
- `experiments/engine_checks/run_family_classification.py`, classifies the 12 benchmark families at their 60 parameter combinations, wider families, rotations and shapes against the five classes; reads only the member names of `~/data/linfoot/testdata.zip`; writes `results/family_classes.md` and `results/family_classes_detail.md`.
- `experiments/engine_checks/run_rotated_copies_check.py`, scores the 12 families at their 60 parameter combinations under the eight elements of the dihedral group of the square (`class_prior.dihedral`, rotations and reflections), at grid 128: the label of every image board against the board's, the coordinate map of a sample against the board map, the estimates of 50 samples at n = 1000 and 50 at n = 100 and of the same samples after the exact map (largest difference per family and element, for this estimator, for the published Model 3 and for `ksg1_rank`), and the estimates of 50 fresh samples from each image board with the difference of the mean estimate against element 0 and its standard error; needs `~/data/linfoot/testdata.zip` for the member names, mpmath, torch and `results/phase2_scaled.pt`, and for the Model 3 columns tensorflow, keras and `vendor/combined_model_2.keras`; writes `results/rotated_copies_check.md`.
- `experiments/engine_checks/run_engine_invariance_check.py`, decides whether the law of the engine prior (`copula_at_target_linfoot` under the training label law) is invariant under the dihedral group: the transposition, reflection and Sinkhorn properties of `random_log_field` measured on 50 fields, then 2000 draws on each of two independent sides at grid 128, the seven non-identity elements applied to side gE, and per element Kolmogorov-Smirnov tests and differences of means for the corner-block means, the Spearman correlation, the two diagonal bands, the asymmetry and the corner roughness, with a bootstrap and a permutation comparison of the mean board, Bonferroni-corrected over the 104 tests; the class prior (500 draws per side) is the positive control; needs numpy, scipy and mpmath; writes `results/engine_invariance_check.md`.
- `experiments/engine_checks/run_training_mode_check.py`, compares the network on a draw and on its images under the dihedral group, in training mode and in evaluation mode, on CPU and on MPS: the input of every n from 50 to 2000, with and without ties, against the image of the input (the histogram stack bit for bit, the 57 scalars and the coefficient inputs by their largest difference), a probe batch of 64 at n = 300 under each of the 7 non-identity elements and a random element per sample, 20 batches of 64 at the training law on the shipped weights and on 5 fresh networks, and 5 batches each of 256 and 512 on the shipped weights and 2 fresh networks, at the drawn n and at n lowered to even, with the output, the squared-error loss, the gradient of every parameter and the BatchNorm running statistics, against the same batch in another row order as the rounding control; needs numpy, scipy, mpmath, torch and `results/phase2_scaled.pt`; writes `results/training_mode_check.md`.
- `experiments/family_benchmark/run_family_benchmark.py`, scores the published Model 3, this estimator, padded MIST and the classical panel (with `ksg1_rank`, Kraskov algorithm 1 on the rank transform of the sample) on the 12 families of the coauthor's archives, per family, level and sample size, with checks that the parameter combinations equal the classification, that every estimate lies in [0, 1] and that a second scoring repeats exactly; with a check of the margins of the stored samples, writes `results/family_benchmark.md` and the estimates of every estimator on every sample to `results/family_benchmark_estimates.npz`. Run with the interpreter that has tensorflow, keras, torch and `mist_statinf` (for example `vendor/venv/bin/python -u experiments/family_benchmark/run_family_benchmark.py`), with Rscript on the PATH, the weights in `~/data/mist` and the vendored Model 3; it scores all 1000 samples of every test file and all 50 of every validation file by default, about 84 minutes on MPS on an 11-core machine (5013 s measured while other jobs ran). It stops at the top with the command that supplies any missing input. `--add-model NAME` (`parampl0z`) sets the three seeds of a named model of `core/named_models.py` beside the stored estimators on the same samples, read from the rows files of batch 1 (`--rows`, default `results/batch1/rows/`): it stops unless the published model's estimates there equal the stored `v1` column to 1e-4 and the truths are equal, and writes `results/family_benchmark_<name>.md` (mean over the seeds and each seed) and `results/family_benchmark_<name>_estimates.npz` (the stored arrays and one column per seed, `<name>_s<seed>`), leaving `--stored` unchanged; it needs numpy only. The report has a section "Agreement of the rows with a rescore", which `--merge-checks` fills from the check parts. `--add-model NAME --check SEED` checks one seed's rows file: it scores that seed again on the archive cache with `--weights-dir`, `--workers`, `--batch-size` and `--device`, with the settings of `experiments/pipeline/score_set.py`, and fails unless every estimate equals the rows file's to 1e-4, with a message naming the largest difference and its dataset and sample index. The rows were scored by `experiments/pipeline/score_set.py` on a GPU with torch's defaults, which allow TF32 for cuDNN convolutions, and cuDNN may choose another convolution algorithm on another GPU model, so the check compares like with like only with `--device cuda` on the GPU model that seed's rows were scored on (on CPU the first 20 samples of each test dataset differ from the rows by up to 2.8e-4). That GPU is read from the meta of the rows file (`score_set.py` writes it), else from `rows_<tag>.gpu` beside it (`hpc/linfoot_score_set.slurm` writes it), else from `hpc/rows_gpus.tsv`, which holds the GPUs of the ParamPL0z rows from the logs of their rows jobs; the check fails when this process's GPU is another model, or when the meta and `rows_<tag>.gpu` disagree. The part states the device, the GPU name, torch's version and the TF32 and cuDNN flags of the rescore and the device and GPU of the rows. After the rescore the first 20 samples of every rescored dataset of both archives are scored again with torch's defaults and with TF32 off for convolutions and matmul on the GPU, and on the CPU, and the section "Arithmetic of the rescore" gives the largest and the mean absolute difference of each against the rows and against the rescore, and of TF32 off against the defaults; without CUDA the two GPU rows are left out and the part says so, and nothing in the slice fails the check. `--limit K` and `--take J` restrict the rescoring to the first J samples of the first K datasets of each archive, for a smoke test. The rescoring prints a flushed progress line every 20 datasets with the seconds of the inputs and of the networks and the rate per sample and seed, and its networks run in the main process on `--network-threads` threads (default `--workers`) while the input workers keep one BLAS thread each. The check writes `results/family_check_<name>_s<seed>.md` and `.json`, also when it fails, and then exits non-zero with the reason. `--add-model NAME --merge-checks` folds the parts of the three seeds (`--checks-dir`, default `results/`) into that section of `results/family_benchmark_<name>.md`, replacing what is there and computing nothing again, and exits non-zero after writing when a part is missing or failed. On the cluster: `sbatch hpc/linfoot_model_studies.slurm families parampl0z` on main-cpu writes the report and runs the bootstrap below and the inference time on the node's CPU with the GPU hidden; `family-check parampl0z <seed>` runs one check on main-gpu, pinned by the submit script to the GPU model of that seed's rows with `--constraint`; `families-merge parampl0z` runs the merge.
- `experiments/family_benchmark/run_feature_table_check.py`, recomputes a seeded sample of 2880 rows of the coauthor's table `~/data/linfoot/features_validationdata.csv` (three of the 50 samples of each of the 240 validation datasets, all four rotations) from `validationdata.zip` with a numpy and scipy port of cell 22 of the coauthor's notebook, reports the largest difference per column group, compares each quantity with `core/encoding.py`, `core/v1_features.py` and `core/classical.py`, and matches the four rotations of the table to `class_prior.dihedral`, the sample point map and `v2_model.d4_transforms` by comparing arrays; `Linfoot_Correlation` comes from `infomeasure` and is compared with Kraskov algorithm 1, a different estimator; writes `results/feature_table_check.md`; 202 s measured.
- `experiments/family_benchmark/run_family_bootstrap.py`, paired cluster bootstrap intervals (datasets, then samples within a dataset, 4000 draws) for the RMSE difference between each estimator, `ksg1_rank` included, and `p2` on all datasets, each family, the independence rows and each level; reads `results/family_benchmark_estimates.npz` and writes `results/family_bootstrap.md`; numpy only, about five minutes (302 s measured while other jobs ran). `--reference NAME` with `--estimates results/family_benchmark_<name>_estimates.npz` takes a named model of several seeds as the reference: its RMSE on a resample is the mean over the seeds of each seed's RMSE on the same drawn samples, and the seed columns are not comparators; `--out` names the report (`results/family_bootstrap_<name>.md` on the cluster). `--reference NAME --shipped` takes the shipped seed of the named model alone as the reference, the seed `core/named_models.shipped_seed` chooses from the learning curves (`--curves-dir`, default `results/batch1/curves`), with no seed column of the model as a comparator, so each comparator is scored on the resamples of the report against the mean over the seeds (`results/family_bootstrap_<name>_shipped.md` on the cluster; 9.9 s and 434 MB for 100 draws measured locally). It prints a flushed line per comparator with the seconds since the draws began.
- `experiments/family_benchmark/run_inference_time.py`, the inference time per sample of the shipped seed of a named model (`--model parampl0z`) and of the published model (`--v1`) on the same samples of the test archive of the 12 families (5 samples of each of the 60 datasets of each n = 100, 200, 500 and 1000), each sample scored alone on one thread after untimed warm-up samples: for ParamPL0z the starts (the copula fits), the rank histograms and scalars, the network forward pass and the whole `arms.predict_arm` call, checked against the parts to 1e-6; for the published model its input and its forward pass. Each part writes a json with the node, the CPU model, the device and the library versions (the torch part also the samples, `--samples-out`, which the TensorFlow part reads with `--samples`), and `--merge` writes `results/inference_time_parampl0z.md`. On the cluster it runs at the end of `sbatch hpc/linfoot_model_studies.slurm families parampl0z`, both models on that node. `--classical --sizes 100 1000 --json-out FILE` times each column of the classical panel and padded MIST (`core/mist_padded.py`, on the CPU, so it needs `mist_statinf` and the weights in `~/data/mist` or `LINFOOT_MIST_DIR`) on the same samples and one thread and writes `results/inference_time_classical.md` beside the stored medians of ParamPL0z and of the published model; n = 1000 is outside the sample sizes MIST was trained on.
- `experiments/figures_tables/make_method_figure.py`, draws the input, layers and symmetrisation for one sample into `results/method_overview.png`.
- `experiments/figures_tables/make_parampl0z_figure.py [--weights DIR]`, draws ParamPL0z on one Clayton sample (n = 300, true value 0.60) through its shipped seed, the seed with the lowest best validation RMSE in the three curve files of `results/batch1/curves/` (`named_models.shipped_seed`, 20260820), into `results/parampl0z_overview.png` and `.pdf`, 7.16 by 5.90 in, two IEEE columns, fonts 7 to 8.5 pt, for both the paper and the internal document: the sample and its ranks, the input stack and the 57 numbers from the ranks, the network, the five starting values (the maximum pseudo-likelihood fits of the Gaussian, Clayton, Gumbel and Frank copulas and the normal-scores correlation), the network's direct estimate and the starting value fixed at 0 with their values on the sample, the softmax weights, the logit correction and the estimate against the true value. Every label is in plain words with no model key, set letter, seed number or code name. The figure has no footer: the caption, with the training data and the rule that picks the seed, is written in each document, and the script prints the seed, the three validation RMSEs and the parameter count. Every number is computed from the weights and the sample; the parts are checked against `arms.predict_arm` to 1e-6, and the script stops if a label is set below 7 pt or a text runs off the figure. `--weights` names the folder that holds the weights of the three seeds (default `results/batch1/weights/`). Needs torch.
- `experiments/figures_tables/make_batch1_figures.py`, from the rows of `results/batch1/rows/` through the functions of `experiments/studies/run_batch1_comparison.py` (4000 two-stage resamples, seed 20261104): `results/parampl0z_vs_published.png` and `.pdf` (3.50 by 6.50 in, one column, for the paper: the RMSE of the shipped seed of ParamPL0z alone and of the published model on the 26 groups of the four ranking tests under a heading per test, with the paired difference and its 95% interval; the text is that of `PAPER_NAMES`, in the paper's notation as matplotlib mathtext, and the note states the rule that picked the seed without its number), `results/parampl0z_vs_published_3seed.png` and `.pdf` (3.50 by 6.29 in, the same layout for the internal document on the 25 groups without the pooled validation archive: the mean over the three seeds of each seed's RMSE against the published model, with the intervals of the section "ParamPL0z against v1" of `results/batch1_comparison.md`; the text is that of `NOTE_NAMES`, the plain model and test names of the concept note), `results/parampl0z_shipped_seed.md` (for the shipped seed: every group with both RMSEs, the difference and its interval; the mean and standard deviation of the estimates of the seed and of the published model on each of the 168 cells of the grid of seven families; each seed's RMSE per group with the lowest and highest; the departures on exact images and the shift from even to odd n, for the seed and the published model) and `results/batch1_models.png` and `.pdf` (7.16 by 5.59 in: the 16 models of batch 1 and the published model on the five main groups, RMSE as the mean over the seeds with the range of the seeds, in the order of `make_batch1_pdf.py`, each model named by `PLAIN`, the plain names of the same naming table, on at most two lines, the panels titled with its test names, Okabe-Ito colours). No figure carries a model key, set letter, test key or seed number. It stops unless the RMSE of every model and the interval of the three-seed mean of ParamPL0z against the published model equal the matching numbers of `results/batch1_comparison.md`, and it stops if a label is set below 7 pt or a text runs off a figure. The 4000 resamples of all 26 groups run here: 89.9 s and 701 MB peak measured. Needs numpy and matplotlib, the rows and the curve files.
- `experiments/engine_checks/run_engine_validation.py`, six checks of the label engine and the input path: the Gaussian and Clayton labels against their closed forms, the sampler, the amplitude search, the prior's coverage, and the rank transform and rank histogram input on samples with ties; writes `results/engine_validation.md`.
- `experiments/studies/run_tie_rules.py`, scores the three seeds of a named model of `core/named_models.py` (`--model`, default `parampl`, `arms.ParamStartNet` on the maximum pseudo-likelihood starts with its own estimate; `parampl0z` is the estimator of the paper) on Gaussian pairs rounded to 2 to 100 levels and on a constant and a binary column, beside a row-order tie-break implemented only in that script, and reports the set of seeds (the mean over seeds of each seed's RMSE) and each seed; the starts and the encoding of a sample are computed once in a pool of `--workers` processes and shared by the seeds through `arms.predict_arm(..., inputs=...)`. Writes `results/tie_rules.md` for `parampl` and `results/tie_rules_<model>.md` for any other model (`--out`). Needs torch, `LINFOOT_RESOLUTIONS=8,16,32` and the weights `<stem>_s20260819.pt`, `_s20260820.pt` and `_s20260821.pt` of the model in `--weights-dir` (default `~/models/linfoot-estimator`, where `sbatch hpc/linfoot_train_groups.slurm <model>` writes them), or other weights files of `arms.load_arm` given with `--weights` and `--out`; `--sizes`, `--rhos` and `--batch-size` shrink the grid and the forward passes for a smoke test. The networks run in the main process on `--network-threads` threads (default `--workers`) while the input workers keep one BLAS thread each; the table "Run time" gives each section, the sum over the three sections and that sum split into the shared inputs and the networks. Section 3 scores every tied sample of sections 1 and 2 again under `--orders` random row orders (default 5, 0 leaves it out) and gives the largest absolute change of each seed's whole estimate and the number of samples that changed, at all and by more than 1e-6. It runs on the cluster as `sbatch hpc/linfoot_tie_rules.slurm <model>`.
- `experiments/studies/run_output_ends.py`, the bias at independence by sample size and the readings near 1 (the four forward analytic families at the levels of `core/testsets.py`, n = 100 to 1000, `--reps` samples per cell, seed 20260826), for histogram CNNs with an output sharpness (`tag:beta`, folder `--legacy-dir`), the published model (`v1`, alone, in the TensorFlow environment, `--v1-model`) and the seeds of named models of `core/named_models.py` (`--weights-dir`), every model on the same samples; each cell of the json holds the sha256 of its samples. `--check TAG=FILE:COLUMN` compares a column with a stored json per n to 1e-6, `--no-report` writes the json alone and `--merge A.json B.json` joins parts into one report after checking that their digests agree; for a named model the report gives each seed's bias at independence and each seed's mean, standard deviation and count at one at 0.99, the shipped seed (`core/named_models.shipped_seed`, learning curves in `--curves-dir`, default `results/batch1/curves`) marked; `--sizes`, `--batch-size`, `--workers`, `--network-threads` and `--device` as in the other studies, with a flushed line for the inputs and for each seed's networks; the checkerboards of the held-out families are built in `--workers` processes before the samples are drawn in order in the main process (`core/testsets.prefill_heldout`), so the samples do not depend on the worker count. Writes `results/output_ends.md` and its json (`--out`, `--json-out`). On the cluster `sbatch hpc/linfoot_model_studies.slurm ends-v1 parampl0z` and then `ends parampl0z` write `output_ends_parampl0z.md` and `.json`: the shipped model (checked against `results/prior_ends.json`), the published model, ParamPL and ParamPL0z.
- `experiments/studies/run_holdout_comparison.py`, the held-out-family comparison and the comparison on equal training data (item 21 of the project's `notes/next.md`): from the rows files of `v1`, E2 and ParamPL0z in `results/batch1/rows/` (`--batch1-rows`) and of the five models of wave 5 in `results/holdout/rows/` (`--rows`), each fold model's three-seed mean against ParamPL0z and against `v1` on the 12-family test and validation cells of each held-out family and on the pool of the fold, and ParamPL0z-D against `v1`, E2 and ParamPL0z on every group of `results/batch1_comparison.md`, with the paired two-stage cluster bootstrap of `run_batch1_comparison.py` called from there (`load_models`, `groups_of`, `group_squared`, `set_rmse`, `bootstrap`, `table`; 4000 resamples, seed 20261104, a group of `results/batch1_comparison.md` resampled as it is there). Its header names, per fold, the families left in training whose parameter range reaches a held-out family as a limit, each with the largest cell difference of the two boards at that limit computed by the script. Writes `results/holdout_comparison.md` (`--out`); numpy only.
- `experiments/studies/run_fresh_test.py`, ParamPL0z of seed 20260820 and the mean over its three seeds against `v1` on the fresh test `fresh12`, on the pool, each family, level 0 and the seed range, by the functions of `run_batch1_comparison.py`; reads `rows_fresh12_*.npz` and `rows_v1_published.npz` of `results/batch1/rows/` (`--rows`) and writes `results/fresh_test.md`.
- `experiments/studies/run_component_per_run.py [--rows DIR] [--out FILE] [--comparison FILE]`, the four models of the components table of the paper run by run, on its eight groups: the RMSE of each of the three training runs of ParamPL0z, ParamPL0, ParamPL and Mix and, for ParamPL0z minus each of the other three, the difference of the three-run means with the smallest and largest difference and the number below zero over the nine pairs of runs, by the functions of `run_batch1_comparison.py`. It stops unless the 24 means equal the `difference` column of `results/batch1_comparison.md` at four decimals, and writes `results/component_per_run.md`; numpy only. `hpc/linfoot_compare_batch1.slurm` and `paper.py` run it.
- `experiments/studies/run_parity_forward.py [--rows DIR]`, ParamPL0z of seed 20260820 and the three-seed mean against `v1` at odd and even n on Gaussian, Clayton, Frank and Gumbel, pooled and each alone, from the rows files; writes `results/parity_forward.md`. Needs numpy.
- `experiments/studies/run_label_mass.py`, reads the label key of every training shard of sets B, C and D (the `_starts` folders ParamPL trains on), E1 and E2 and reports per set, for the mixture of B, C and D weighted one third each, and for the closed form of the two-family label law: the share of labels exactly 0 and below 0.01, 0.02, 0.05 and 0.1, the mean, the 1, 5, 10, 25 and 50 percent quantiles and a histogram on [0, 0.2] in bins of 0.01, with checks that B, C and D equal their plain folders and E2 equals D as sorted label arrays (`--skip-checks` leaves the plain folders unread). Folders under `--root` (default `~/projects/linfoot-estimator`), each overridable with `--dir NAME=PATH`. Writes `results/label_mass.md` (`--out`). Needs numpy only; it runs on the cluster as `sbatch hpc/linfoot_label_mass.slurm`.
- `experiments/engine_checks/run_wave4_smoke.py`, the checks of the models of wave 4 and of their data, on the CPU here and inside `hpc/linfoot_wave4_smoke.slurm`: `save` and `compare` (a small untrained model saved with one copy of `core/` and reloaded and predicted by this one, equal bit for bit), `floor` (all the weight on the zero start of `parampl0` gives `START_FLOOR`), `zeros` (a `--label-zero` shard against a shard of the same prior written without it: the keys, dtypes and shapes, every label 0, its starts drawn again from the indices, and Kendall's tau of its samples against independence) and `labels` (the share of labels exactly 0 per shard folder). Needs numpy, scipy and torch.
- `experiments/engine_checks/run_v1_port_check.py`, writes `results/v1_port_check.md`.
- `experiments/engine_checks/run_v1_port_se.py`, reads the 24-cell table of `results/v1_port_check.md` and writes `results/v1_port_se.md`: per cell the gap between the two estimators, the Monte Carlo standard error of the difference and their ratio, the largest gap with its ratio and the count of cells with a ratio above 2.
- `experiments/engine_checks/run_constant_column_check.py [--weights-dir DIR]`, checks that `named_models.estimates` gives NaN on a sample with a constant column and, with the keyword off, the reading stored in `results/tie_rules_parampl0z.md`.
- `experiments/engine_checks/run_v1_arch_check.py`, compares `v1_arch.build_model` with `vendor/combined_model_2.keras`: layer list, settings, inputs, output shapes and parameter counts, then the outputs of the two with the published weights copied in; needs tensorflow, keras and the vendored model; writes `results/v1_arch_check.md`.
- `experiments/studies/run_phase1.py`, trains the phase-1 estimator and compares it against the published one; writes `results/phase1.md`.
- `experiments/studies/run_phase2.py`, trains on the generator and scores the four-way benchmark; `--score-only` reuses saved weights, `--wide-grid` scores the wider grid, `--engine-reps` sets the generator family's replicate count, and `--from-rows` rebuilds a report without rescoring.
- `experiments/studies/run_representation_grid.py`, scores the histogram and the cosine-basis models on identical samples, family by family; writes `results/representation_grid.md`.
- `experiments/pipeline/summarise_resolution_seeds.py`, pools the seeded runs of the two histogram stacks; writes `results/resolution_seeds.md`.
- `experiments/pipeline/gen_shard.py`, one shard of phase-2 training examples (a SLURM array task) from the prior named by `LINFOOT_COPULA_PRIOR`, every example seeded from its global index: `--kind train` or `valid`, `--shard`, `--copulas`, `--offset` added to the index so a new dataset cannot collide with an existing one, `--workers`, `--samples-per`; `--store-arms` adds the inputs of arms 13, 7a and 7b, `--store-starts` the keys `starts` and `starts_pl` of the start models, and `--label-zero` makes every example an exact-independence sample of the prior (`phase2_gen.make_examples(..., label_zero=True)`: the all-ones board for the family and class priors, the Gaussian copula at rho 0 or the Clayton copula at theta 0 for `twofamily`), labelled exactly 0, with the prior's law of n and the keys, dtypes and shapes of a shard written without it. `LINFOOT_HOLDOUT` (`core/holdout.py`) holds families out of the prior by name.
- `experiments/pipeline/train_scaled.py`, trains the phase-2 network on every shard of a folder; `--arm` picks a model of `core/arms.py` (`param`, `parampl` and `parampl0` read the keys of `--store-starts` shards); `--native` reads the shards of `gen_ridge_shard.py` and repeats each channel up to the model's grid batch by batch, `--eval-chunk` sets the validation examples per forward pass.
- `experiments/pipeline/gen_v1_shard.py`, one shard of set E (a SLURM array task): `--set e1` is the preprint's design (32000 training and 4000 validation examples, sample sizes 100, 200, 500 and 1000), `--set e2` set D read by the published architecture (20 training shards of 8000 pairs of family and label, three samples each at n log-uniform on 50 to 2000, and 2000 validation pairs, through `phase2_gen.draw_samples` from the seed of set D, so index i of E2 holds the samples of index i of D); Gaussian and Clayton copulas with Gaussian margins and positive dependence, read by `core/v1_features.py`. Needs numpy and scipy only, so it runs on the packed torch environment; `hpc/linfoot_generate_sete.slurm` runs all 23 tasks into `data_sete/e1` and `data_sete/e2`.
- `experiments/pipeline/train_v1_arch.py`, trains the architecture of `core/v1_arch.py` in Keras on the shards of one design; the settings the coauthor's notebook fixes are cited by cell in its docstring. `hpc/linfoot_train_sete.slurm` runs three seeds of E1 at 50 epochs and three of E2 at 60 epochs on the environment that `hpc/build_envs.sh` packs, and writes `v1arch_sete1_s<seed>.keras` and `v1arch_sete2_s<seed>.keras` with their `_curve.json`.
- `experiments/pipeline/gen_ridge_shard.py`, one shard of the thin-ridge training set (a SLURM array task): the native stacks, the 57 extra inputs and the labels, with a `meta_*.npz` per shard that records width, grid, label, mixing weight and margin error of every copula.
- `experiments/pipeline/build_ridge_tests.py`, one (shape, width) board of the held-out thin-ridge test set, at grid 1024, floor-mixed to the labels 0.4, 0.7 and 0.9, with its samples and inputs cached under `~/data/linfoot/ridges`.
- `experiments/pipeline/score_thin_ridge.py`, scores one trained model on the thin-ridge test set; `LINFOOT_RESOLUTIONS` must be the resolution set the weights were trained with.
- `experiments/pipeline/check_thin_ridge_inputs.py`, compares the inputs of the two arms with the existing encoder: the repeated native stack against `encoding.rank_histograms`, the numpy against the torch repeat, the engine-branch examples against `phase2_gen.make_examples`, the scoring path against `v2_model.predict`. Numpy, scipy and torch; about two minutes.
- `experiments/pipeline/make_thin_ridge_report.py`, builds `results/thin_ridge.md`, `results/thin_ridge.png` and `results/thin_ridge_rows.json` from the files in `results/thin_ridge/`.
- `experiments/pipeline/build_shape_tests.py`, one (shape, width) board of `core/shape_testset.py` with its samples and exact labels. `experiments/pipeline/build_score_tests.py`, one file of `core/score_testset.py`: task 0 the grid, task 1 the parity cells, tasks 2 to 61 the copies of one parameter combination. `build_score_tests.py --task 62` to `--task 121` build the 60 parameter combinations of `fresh12`, with `--reps` and `--sizes` for a reduced run.
- `experiments/pipeline/score_set.py`, scores any model of sets A to E and arms 13, 7a and 7b (`.pt` through `arms.load_arm` and `arms.predict_arm`, `.keras` through `v1_arch.predict`) on the 12 families with every sample, the eight-family grid, the thin-ridge set, the shapes, the copies and n = 63 to 1023 beside n = 62 to 1022 on the same draws, and writes `rows_<tag>.npz`: one row per cell and one estimate per sample, with a meta that records the device and, on a GPU, its name.
- `experiments/studies/run_headroom.py`, measures how much of the remaining error is reducible, under the training label distribution and under a flat one; writes `results/headroom.md`.
- `experiments/mist/run_mist_padded_check.py`, four checks of the padded MIST estimator: the Gaussian ladder against the earlier padded rows, the same ladder at negative rho (C1b), the eight-family benchmark grid against Kraskov, and the facts of arXiv:2511.18945 and the grgera/mist release; writes `results/mist_padded.md`. Run with the interpreter that has `mist_statinf`; takes about six minutes on one MPS device. `--add-model NAME` scores the seeds of a named model of `core/named_models.py` on the grid of section C2 (`--weights-dir`, `--workers`, `--batch-size`, `--device`) and needs no MIST: on the full grid it stops unless the Kraskov column computed again equals the stored one of `--stored` in every number, then sets the stored MIST columns beside the model and writes `results/mist_grid_<name>.md` (`--out`), with the tables by family, level and size over the eight families and, as the ranking tests pool them, a row and tables by level and by size over the seven families of the grid without the engine draws. The stored report pools MIST over the eight families only, so without `--with-mist` the MIST cells of the seven-family rows read "not stored"; `--with-mist` (with `--mist-model` and `--mist-device`, the interpreter that has `mist_statinf`) scores padded MIST again on the same samples with the noise seeds of the grid. The estimates of every sample go to `results/mist_grid_<name>_rows.npz` beside the report, and `--from-rows FILE` rebuilds the report from it without scoring. The held-out checkerboards (`core/testsets.prefill_heldout`) and Kraskov run in the pool of `--workers`, the samples are drawn in order in the main process, the networks in the main process on `--network-threads` threads (default `--workers`), with a flushed progress line each; `--sizes` and `--families` restrict the grid for a smoke test, and such a run compares nothing. On the cluster: `sbatch hpc/linfoot_model_studies.slurm mist-grid parampl0z`, in the torch environment, which has no `mist_statinf`, so the job runs without `--with-mist`.
- `experiments/mist/run_mist_trained_range.py [--npz FILE]`, padded MIST and ParamPL0z of seed 20260820 inside the sample sizes MIST was trained at (10 to 500), per n and pooled, and at n = 1000 apart, on the test and validation files, from `results/family_benchmark_parampl0z_estimates.npz`; writes `results/mist_trained_range.md`.
- `experiments/mist/run_mist_dim.py`, reads the published MIST weights at input widths from one to sixteen numbers per variable against Gaussian cases with a closed form; writes `results/mist_dimension.json`.
- `experiments/studies/fetch_twinbmi.py`, downloads the public table `twinbmi` of the CRAN package mets 1.3.12, checks the pinned SHA-256 of the tarball, reads the member `mets/data/twinbmi.txt.xz` from the archive in memory with the standard library and writes the complete pairs as `twinbmi_pairs.csv` (`bmi1,bmi2,zyg`) under `LINFOOT_TWIN_DATA` (default `~/data/linfoot-twinbmi`); it stops unless the table holds 11188 rows and 4271 complete pairs, 1483 MZ with Pearson correlation 0.684 and 2788 DZ with 0.368.
- `experiments/studies/run_twin_application.py`, the twin application on the CSV of `fetch_twinbmi.py`: every column of the 12-family table of the paper (ParamPL0z of seed 20260820 and the mean over its three training runs, the published model, padded MIST, which was trained on sample sizes 10 to 500 and is scored at the 1483 and 2788 pairs of the two groups with that range stated beside its row, and the seven classical estimators of `core/classical.py`, on the data as it is with no jitter) on MZ and DZ under four strictly monotone transforms of both margins (raw, log, square, negated) with the absolute movement from raw, and on 1000 percentile bootstrap replicates resampling pairs, seed 20261110, the same replicates for every column, for the value, for MZ minus DZ and for the paired difference reported network minus column, beside the share of tied values, the Pearson correlation and the preprint's numbers for the published model, printed side by side. Each environment is one `--part` (`networks` and `classical` in the torch environment, `published` in the TensorFlow environment, `mist` in the torch environment with the MIST overlay) writing `results/twin_application_parts/<part>.npz` from one set of replicates in `draws.npz`, and `--report` joins them into `results/twin_application.md`; `--seeds`, `--replicates` and `--report --partial` give a reduced trial. On the cluster, from `~/projects/linfoot-estimator`: `sbatch code/hpc/linfoot_twin_application.slurm` (the first three parts, 2 hours, 8 CPUs, on main-cpu; it stops at the top with the fix when `~/data/linfoot-twinbmi/twinbmi_pairs.csv` or a weights file is missing), then `sbatch --dependency=afterok:<job> code/hpc/linfoot_twin_mist.slurm` (the part `mist` and the report into `results_twin/`, 4 hours, 8 CPUs); the CSV is built on the repository machine and copied to `~/data/linfoot-twinbmi/` on the cluster.
- `paper.py`, the single entry point: runs the eight scripts of `experiments/figures_tables/` in order, `make_parampl0z_figure.py` and `make_batch1_figures.py` among them, then `experiments/studies/run_component_per_run.py`, and stops at the top with the fix when the weights (the ParamPL0z weights in `results/batch1/weights/` included), the scoring rows of batch 1, `results/batch1_comparison.md` or the vendored model are missing.

## Layout

### Flow

Every command in this folder runs from `code/`. The library in `core/` is imported by the scripts of `experiments/`, which write into `results/`.

    core/                          the library: engine, encoder, model, classical panel, loaders
      |
      +-- experiments/pipeline/          generate shards (gen_shard.py) -> train (train_scaled.py)       hpc/run_phase2.sh
      |                                  set E: gen_v1_shard.py -> train_v1_arch.py (Keras)      hpc/linfoot_generate_sete.slurm, hpc/linfoot_train_sete.slurm
      |                                  thin-ridge set: gen_ridge_shard.py, build_ridge_tests.py
      |                                  -> train_scaled.py -> score_thin_ridge.py -> make_thin_ridge_report.py   hpc/run_thin_ridge.sh
      |                                  summarise_resolution_seeds.py pools the seeded runs
      |                                  batch 1: generation -> training -> score_set.py, six waves     hpc/run_all.sh, hpc/collect_batch1.sh
      +-- experiments/studies/           score saved weights and run the studies of the estimator (run_phase2.py --score-only, ...)
      +-- experiments/engine_checks/     check the label engine, the concavity classes and the ported input path
      +-- experiments/family_benchmark/  run_family_benchmark.py -> run_family_bootstrap.py
      +-- experiments/mist/              the padded MIST comparison (run_mist_padded_check.py, run_mist_dim.py)
      +-- experiments/figures_tables/    results -> figures and LaTeX tables, all through paper.py
      |
      v
    results/                       reports (.md), row dumps (.json), weights (.pt), figures (.png), tables (.tex)

`python3 paper.py` regenerates every figure and table from the committed results. The scoring runs and the trainings are regenerated by the scripts of `hpc/`.

### The folders

- `core/copula_engine.py`, the generator: Sinkhorn projection, exact mutual information, exact sampling, the amplitude search, the analytic Gaussian and Clayton references, the rank transform, and `rank_cell_counts`, the rank histogram, which gives a point exactly on a cell edge half its mass on each side (a quarter on each of four cells when both coordinates are on an edge), deciding it in integers on doubled average ranks: `2 * r * res` divisible by `2 * (n + 1)`. Without ties that happens at odd n only, and it makes the histogram of a rotated or reflected sample the same rotation or reflection of the histogram, bit for bit, at every n. `copula_at_target_linfoot` is `draw_target_field` (every random draw of a field) followed by `solve_target_field` (the deterministic amplitude search), and `sample_copula` is `copula_uniforms` (the three uniform vectors of a sample) followed by `place_in_cells`, so a caller can take the draws in order in one process and run the searches elsewhere with the same result.
- `core/families.py`, the two copula families the published estimator was trained on (`TWO_FAMILY_KEYS`, their VineCopula numbers 1 and 3), their parameter-to-label inversion, and the axis reflections that turn them into negative-dependence test sets with unchanged labels.
- `core/concavity.py`, exact checks on a checkerboard copula for symmetric, TP2, concave in each argument, positive quadrant dependent and Schur-concave, plus a TP2 generator with exact labels, convex mixes and the common-factor copula.
- `core/family_grids.py`, checkerboards of the named copula families (Gaussian, Student t, Clayton, Gumbel, Frank, Joe, BB1, BB6, BB7, BB8, Tawn types 1 and 2, Plackett, FGM, Galambos, Husler-Reiss), their rotations and the non-monotone shapes; the closed-form-CDF families are built as the exact second difference of the CDF in mpmath, and `label_board` is the float64 board of the eight Archimedean families and the two Tawn types, written in logarithms so that no digit is lost, whose label equals the exact board's to about 1e-13.
- `core/class_prior.py`, the training prior of the concave class: a mixture of Archimedean copulas at positive dependence (Clayton, Gumbel, Frank, Joe, BB1, BB6, BB7, BB8, each reaching every target from 0.05 to 0.99 at the grids 128, 160 and 192, with the first parameter solved for the label on a float64 board whose cells equal the exact board's to about 1e-10 and the returned board the exact board of that parameter pair; BB7 at a delta of 3.5 or more has a label that falls from theta = 1 to a minimum and then rises, so `bb7_dip` gives its lowest label and `solve_bb7` solves either side of the minimum, drawing the side only for a target that has a root on each side), TP2 copulas, symmetric TP2 copulas, convex mixes of TP2 copulas and common-factor copulas, each drawn at a target label and then turned by a random element of the square's symmetry group; the component weights are renormalised over the components that reach the target at the grid, so the labels the TP2 generator cannot reach come from the Archimedean component. `LINFOOT_COPULA_PRIOR=class` makes `core/phase2_gen.py` draw its copulas from it, and the default `engine` leaves `make_examples` unchanged. `archimedean_copula` and `class_prior_copula` take `families`, the Archimedean families to draw from, all eight by default.
- `core/family_prior.py`, the training prior of set B: one of the 12 families of the coauthor's benchmark (Gaussian, Student t, Clayton, Gumbel, Frank, Joe, BB1, BB6, BB7, BB8, Tawn types 1 and 2) drawn uniformly, its second parameter drawn from the full range of the family (not from the 60 settings of the test archive) and its first parameter solved for the target label, then turned by a random element of the square's symmetry group, which gives the other rotations and negative dependence with the label unchanged. The Archimedean and Tawn families solve on the float64 label board and return the exact board, with BB7 solved by `class_prior.solve_bb7`, the same function the class prior uses; the Gaussian and Student t search rho by a secant on the midpoint-density board and return the board of the last step. `LINFOOT_COPULA_PRIOR=family` makes `core/phase2_gen.py` draw its copulas from it; `engine` stays the default and `class` is unchanged. `family_prior_copula` takes `families`, the families to draw from, all 12 by default.
- `core/holdout.py`, the families held out of the training priors by name (item 21 of the project's `notes/next.md`): `LINFOOT_HOLDOUT`, a comma-separated list of VineCopula numbers of the 12 families, read by `core/phase2_gen.py` at import beside `LINFOOT_COPULA_PRIOR`, makes the family prior of set B draw only from its 12 families less those held out, the Archimedean mixture of set C only from its eight less those, and the two-family process of set D only the one of Gaussian (1) and Clayton (3) left, with no draw for the family; unset or empty, every prior draws exactly as without it. A number outside the 12, a hold-out that removes every family of the prior and a hold-out with the `engine` prior stop the import with the reason. `FOLDS` holds the four folds of ruling D44 (`h1` 1,2; `h2` 3,7,9; `h3` 4,104,204; `h4` 5,6,8,10), `changes` whether a fold changes the starts or zeros shards of a set and `folder` the data folder a fold reads for a set; it is standard-library only, so the jobs call it with the node's `/usr/bin/python3`: `python3 core/holdout.py numbers h2` prints `3,7,9`, `python3 core/holdout.py folder h2 setb starts` prints `data_setb_h2_starts`.
- `core/classical.py`, the classical panel on the Linfoot scale: Kraskov algorithm 1 at k = n^{3/5} and at k = 4, Kraskov algorithm 2, Kozachenko-Leonenko, kernel density, the histogram with the Miller-Madow correction, and `ksg1_rank`, Kraskov algorithm 1 at k = n^{3/5} on the average ranks divided by n + 1 of the sample, which is the only member that reads ranks and so does not move under a strictly monotone change of either margin.
- `core/mist_padded.py`, the Linfoot correlation of a scalar pair read from the published MIST weights, with one independent noise column appended to each variable so the input lies inside the weights' training support. Needs the weights in `~/data/mist` (`python3 -c "from huggingface_hub import snapshot_download; snapshot_download('grgera/MIST', local_dir='~/data/mist')"`, with the path expanded) and the `mist_statinf` package (`pip install --no-deps mist-statinf` plus omegaconf, pandas, tqdm, typer, pytorch-lightning, jsonlines, seaborn, optuna, matplotlib, scikit-learn, pyyaml, huggingface_hub and safetensors); the module stops with these commands when either is missing.
- `core/vine_benchmark.py` and `core/convert_rdata.R`, the loader of the coauthor's two archives: extracts `~/data/linfoot/testdata.zip` and `validationdata.zip` to `~/data/linfoot/extracted/`, converts every `.RData` file with `Rscript` to a numpy cache in `~/data/linfoot/cache/`, and lists the parameter combinations. `core/convert_trainingdata.R` and `core/trainingdata.py` read her third file, `~/data/linfoot/trainingdata.Rdata`: the R script loads only its object `df` and writes the fields `family`, `par1`, `par2`, `Linfoot` and `nsampSize` of its 11000 records, without the samples, to `~/data/linfoot/cache/trainingdata_records.csv`, and `read_records` returns them as arrays.
- `core/v1_features.py`, a Python port of `Linfoot estimator.R` from the authors' repository, so their published weights can be scored on any sample without R.
- `core/v1_arch.py`, the architecture of the published Model 3 for set E: `build_model` (the published layers, compiled with Adam at 1e-3 and mean squared error), `model_inputs` (the two inputs of `core/v1_features.py`, with non-finite statistics set to 0) and `predict(samples, weights_path)`, the estimates of a saved `.keras` model on raw samples, clipped to [0, 1]. Keras is imported inside the functions, so importing the module needs numpy and scipy only.
- `core/ridges.py`, thin-ridge copulas: a random cosine-series curve with a Gaussian band of standard deviation 1/256 to 1/12, scaled to uniform margins by Newton's method on the dual of the margin conditions (Sinkhorn sweeps do not converge on a thin band), floor-mixed with the independence board to an exact label and turned by a random element of the square's symmetry group; `make_examples_native` is the training-example generator of the thin-ridge step, in which 30 percent of the copula indices are ridge copulas and every other index is drawn exactly as `phase2_gen.make_examples` draws it.
- `core/native_stack.py`, the rank-histogram stack at native size (8, 16, 32, 64 and 128 cells, 21824 numbers per example) built with `rank_cell_counts` like the encoder, and its repeat up to the grid of a model, so that one stored set serves every resolution set that is a prefix of the five.
- `core/ridge_testset.py`, the cells of the held-out thin-ridge test set (five shapes, five widths, three labels, three sample sizes, 200 replicates), its cache layout under `~/data/linfoot/ridges` and the cell naming.
- `core/shape_testset.py`, the cells of the held-out shapes outside the class (parabola, tent, ring, X and sine from `family_grids.shape_board` at widths 0.08, 0.04 and 0.02 on grid 256, pure and floor-mixed to labels 0.4, 0.7 and 0.9, sample sizes 200, 1000 and 2000, 200 replicates), its cache under `~/data/linfoot/shapes` and `in_class`, which marks the boards inside a class of the class prior.
- `core/score_testset.py`, the cached samples of the eight-family grid, the parity cells and the reflected and rotated copies under `~/data/linfoot/score_tests`, and `transform_points`, the map of a sample onto a dihedral image of its board. Tasks 62 to 121 are the fresh 12-family test `fresh12`: the 60 parameter combinations at n of 100, 200, 500 and 1000, 1000 samples per cell, from the seed `FRESH_SEED` (20261109), under `score_tests/fresh12`.
- `core/arms.py`, the models beside the plain histogram CNN and the one scoring call (`load_arm`, `predict_arm`): arms 13, 7a and 7b, `SwitchNet` and `ParamStartNet`. `param` is `ParamStartNet` on the starts of `core/param_start.py`, `parampl` the same model on the maximum pseudo-likelihood starts with its own estimate as one more start (`own_estimate`), and `parampl0` that model with one more start fixed at 0 (`zero_start`), a constant of the model with one more gate logit, appended after the other starts, so the stored shards are unchanged. The estimate of a start model is `sigmoid(logit(s) + correction)`, with s the gated mean of its starts clamped to [`START_FLOOR`, 1 - `START_FLOOR`] and `START_FLOOR` = 0.001, so all the weight on the zero start and no correction gives 0.001. A model built without `zero_start` has the head and state dict it had before, so saved `param` and `parampl` weights load and predict unchanged.
- `core/v2_model.py`, the phase-1 estimator: rank transform, multi-resolution copula histograms (`rank_histograms` in `core/encoding.py`, built with `rank_cell_counts`), and a CNN whose trunk features are averaged over the dihedral group of the square so the output is exactly invariant.
- `core/named_models.py`, the seeds of a named model of batch 1 (`MODELS`: name, stem of the weights files, label; `SEEDS` 20260819 to 20260821): `shipped_seed(name, curves_dir)` gives the seed whose training run has the lowest best validation RMSE in its curve file, the one seed that stands for the model wherever a report or figure gives one seed; `load_named(name, device, weights_dir)` loads the three seeds from `results/batch1/weights/` by default and stops with the fix when a file is missing, `estimates` returns one row per seed and averages nothing, `describe` names each file with its sha256, and `shared_inputs` computes the inputs of a `ParamStartNet` once per sample, in a worker pool when one is passed. `network_threads(count)` sets the threads of torch's CPU kernels in the main process once its pool has started, so the networks use the job's CPUs while the workers, started before with one BLAS thread each, keep it; `estimates(..., progress=True)` prints a flushed line per seed with the samples, the seconds, the seconds per sample and the threads. Every study that reads it states whether a number is per seed, the mean over the seeds of each seed's value, or one seed. `NamedModel.estimates` returns NaN for a sample with a constant column, whose copula and Linfoot correlation are undefined; `nan_on_constant=False` returns what the networks read.
- `vendor/`, where the fetched v1 model goes. See its README.
- `experiments/`, the scripts in six role folders (`pipeline/`, `studies/`, `engine_checks/`, `family_benchmark/`, `mist/`, `figures_tables/`) and `release/`, the scripts of the released package; see "What each result comes from".
- `hpc/`, one job script per job and the submit scripts; see "The job scripts of `hpc/`".
- `results/`, every report, row dump, weights file and figure; `figures/`, the figures written outside `results/` (`figures/release/`, the saliency figures).
- `attic/`, the dead ends, each runnable, indexed in `attic/README.md`.
- `.depositignore`, what stays out of the public deposit of this folder.

## License and citation

The deposit carries no `LICENSE`, as the project's ruling on the code layout says; the released package of the estimator is MIT (its `LICENSE`). Cite the paper "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation" (DOI on acceptance) and the preprint of van den Berg et al., arXiv:2512.12358, "Towards a pretrained deep learning estimator of the Linfoot informational correlation".
````

### Changes from the current `code/README.md`

A `python3` comparison of the lines found that every non-blank old line is carried verbatim, except these:

- The title `# Exact-label copula generator for supervised Linfoot estimation` becomes `# Pretrained Linfoot estimator: code`, followed by a new opening sentence that names the paper.
- The old headings `## Flow`, `## How it works`, `## Reproduce` and `## Use` become `### Flow` (under `## Layout`), `### How the label engine works` (under `## What it computes`), `### Reproduce` and `### Use the label engine from Python` (both under `## Run`).
- `## Reproduce the thin-ridge resolution measurement` and `## Reproduce cluster batch 1` drop one level to `###`, under `## Run`.
- Old lines 52, 82, 187 and 194 read "README item 21" or "README item 22". They now read "item 21 of the project's `notes/next.md`" or "item 22 of the project's `notes/next.md`", because those items move to that file.
- The old `## Layout` bullets are split across three sections:
  - `core/` (old lines 46 to 64), `core/named_models.py` (117) and `vendor/` (120) go to `## Layout`, `### The folders`.
  - The `experiments/` bullets and `paper.py` (65 to 106 and 110 to 116) go to `## What each result comes from`.
  - The `hpc/` bullets (107 to 109 and 118) go to `## Run`, `### The job scripts of hpc/`.
  - `requirements.txt` (119) goes to `## Requirements`.
- The old Reproduce paragraph on what each check needs (line 124) goes to `## Requirements`.
- New text, with its sources:
  - The intro sentence: `manuscript/main.tex:32`.
  - The bullets of `## What it computes`: the old README items 17 to 23 and the abstract.
  - The Hardware paragraph: old lines 144 and 152, and the batch 1 slurm partitions.
  - `## Data`: old lines 54, 55, 114 and 164, `code/vendor/README.md`, and the Data Availability of `main.tex`.
  - The opening paragraph of `## Run`: `ls code` (no `run_all.sh`) and old lines 28 and 107.
  - The five last bullets of `### The folders`: `ls code code/experiments code/figures`.
  - `## License and citation`: answer 7.

## Draft 3: `code/.depositignore` (whole)

```text
# Deposit-exclude list (NOT a hub .gitignore). oculus's Deposit writes these patterns into the
# deposit's .gitignore. The hub tracks results/ and attic/ in full.

# dead-end code
attic/

# generated outputs, except the shipped weights
results/*
# Left out of a public deposit
/data/
/figures/
*.pyc
.cache/
.pytest_cache/
.ipynb_checkpoints/
.env
.env.*
*.pem
*.key
secrets/
!results/phase2_scaled.pt
!results/batch1/
results/batch1/*
!results/batch1/weights/
results/batch1/weights/*
!results/batch1/weights/phase2_parampl0z_s20260820.pt

# fetched third-party model and the local environment
vendor/*.keras
vendor/venv/

# caches
__pycache__/
*.py[cod]

# OS
.DS_Store
```

- **Lines added**, under one comment line `# Left out of a public deposit`: `/data/`, `/figures/`, `*.pyc`, `.cache/`, `.pytest_cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem`, `*.key` and `secrets/`. They stand above `!results/phase2_scaled.pt`, the file's first line that starts with `!`, so no added line overrides a re-include. The shipped weights `results/phase2_scaled.pt` and `results/batch1/weights/phase2_parampl0z_s20260820.pt` stay in the deposit.
- **Lines of the list the file already has:**
  - `/attic/` is had by `attic/`.
  - `/results/` is had by `results/*`.
  - `__pycache__/` is had by `__pycache__/`.
- `*.pyc` is added because the file holds `*.py[cod]`, which is not that exact line.
- Every line of the current file is kept in its order. A `diff` of the draft, with the 12 added lines taken out, against the current file printed nothing, and the run printed `SAME_OLD_LINES`.

## The `notes/` files the drafts write

`ls notes` of the project lists `2026-10-19-meeting-denmark.md`, `row21-brief.md` and `row22-brief.md`. Neither name below exists, so neither file is written over one that does.

### `notes/one-paper-not-two.md` (whole)

This is lines 25 to 33 of the current README under their old heading. `diff` printed nothing, and the run printed `ONEPAPER_IDENTICAL`.

```markdown
# One paper, not two

Recommendation, given that nothing is under review and both routes are open: fold everything into **one paper that replaces the preprint**, rather than splitting a v2 from a method paper.

Not under review is the best possible position to be in. It means a deep restructure costs nothing, no editor has to be told anything, and the arXiv entry can simply be replaced. Splitting, by contrast, would leave both halves thin: a v2 that cannot claim the method contribution and a method paper that cannot claim the estimand, at exactly the moment when MIST makes a thin paper on either side hard to place. One paper carrying the estimand, the two propositions, the exact-label generator, the invariance argument and a benchmark against MIST is a real paper. Two are not.

The one thing that stays separable is phase 3. If a block-term operator backbone wins on its own terms it is an ML-venue paper in Axel's own line, and it should not be forced into hers.

Authorship follows the contribution and is St<e acute>phanie's call to make, not something to assume. The estimand, Proposition 2.1 and Proposition 2.2 are hers regardless of how the order ends up.

Venue is a decision for after phase 2, but worth flagging early that the coauthor team is statisticians, so a computational-statistics journal is likely a better cultural fit than an ML venue, and it avoids meeting MIST head on. `registries/venues.yml` currently has no entry for that class; JCGS or CSDA would need adding when the time comes. The in-registry options are `jmlr`, `aistats` and `tmlr`, and TMLR is the weakest of the three here because MIST most likely sits there already.
```

### `notes/next.md` (not inline; see the top of this message)

The file is `# Next`, a blank line, and lines 212 to 315 of the current `README.md` unchanged. It holds:
- The paragraph on the paper and the cover letter.
- "Picking this up cold".
- The plan-skill note and the rulings of 2026-10-19.
- Items 1 to 23 with their sub-items, including 6e, 6f, 9b, 15b, 16b, 16c, 17a, the parts of 18, and 19 to 23.
- The "Closed:" paragraphs and the record "Done 2026-08-23".
- The line on the twin application.

## Questions still open

1. Constraints and limits: no file of the project records a limit on time, such as a submission deadline. Is there one? The draft holds this question under `## Constraints and limits`.

`answers.md` settles every other question of the earlier run, and each answer stands in the section the table at the top names.

To go on: confirm or correct the code folder `code/`, answer the open question, and approve or correct each draft. Nothing is written in research-hub until the drafts are approved (readme item 5).
# Pretrained Linfoot estimator

A pretrained, rank-based estimator of the Linfoot informational correlation that succeeds the preprint of van den Berg et al. (arXiv:2512.12358); status: the paper and its supplementary are drafted and revised, in IEEEtran, formatted for IEEE Transactions on Neural Networks and Learning Systems (TNNLS), and not yet submitted.

## In short

St<e acute>phanie van den Berg asked Axel to see whether her pretrained Linfoot estimator can be improved. This project built a successor: an estimator that reads only the ranks of a sample, is exactly invariant to strictly increasing transformations of either variable and to the eight symmetries of the unit square, combines copula fits, its own estimate and a constant zero by softmax weights, and is trained on three simulated copula sets with exact labels. On the 12-family benchmark of her group its pooled root mean squared error is 0.0544 and 0.0539 on the two sets, against 0.0714 and 0.0708 for the published estimator. The paper that presents it is in `manuscript/`, and it includes the preprint instead of citing it.

## What it is and why

St<e acute>phanie van den Berg leads this, with Ulrich Halekoh, S<o diaeresis>ren M<o diaeresis>ller and Jacob von Bornemann Hjelmborg at the University of Southern Denmark (SDU) and Andreas Kryger Jensen at the University of Copenhagen, as printed in the preprint; she is at the University of Twente. The preprint is [arXiv:2512.12358](https://arxiv.org/abs/2512.12358), posted 13 December 2025, and the released model is at `github.com/pingapang/Pretrained-Linfoot-estimator`. The preprint itself carries none of this project's work.

Four things settled with Axel on 2026-08-19. The preprint is not under journal review, arXiv only. We have freedom to write either a v2 or a separate method paper. St<e acute>phanie did not know about MIST. The twin data is public: the table `twinbmi` of the CRAN package mets.

### The problem

The Linfoot informational correlation is $L = \sqrt{1 - e^{-2I(X;Y)}}$, a rescaling of mutual information into $[0, 1)$ that satisfies the Renyi properties: zero under independence, one under a functional relationship, invariant to strictly monotone marginal transforms, and equal to the absolute Pearson correlation for bivariate Gaussians. It is worth estimating and hard to estimate, which is the premise of the preprint.

The preprint does two things. Proposition 2.2 gives the Linfoot correlation of any Archimedean copula as a functional of the inverse generator, and specialises it to a closed form for Clayton, which the authors believe is new. Then it trains a Keras model on simulated data: a 50-by-50 grey-scale heatmap of the raw sample through a small CNN, fused by concatenation with 56 handcrafted statistics (an FNN mutual-information estimate, the Pearson correlation, and the first three moments of one variable within each of 18 bins of the other). Training is 32000 datasets, 4000 per combination of four sample sizes (100, 200, 500, 1000) and two copulas (Gaussian, Clayton), all with Gaussian margins and all positively dependent, labels drawn on $[0, 0.99]$ with the bottom percent oversampled. It beats the FNN benchmark on bias and variance, and is applied to MZ against DZ twin BMI resemblance.

### Why it matters

The published estimator is not invariant to what the estimand is invariant to. Mutual information depends only on the copula, so the bivariate rank vector is the maximal invariant statistic under monotone marginal transforms, and any invariant estimator must be a function of it. Feeding ranks therefore discards nothing and makes marginal invariance exact rather than learned. The published model reads a heatmap on the raw scale and asks the user to pre-transform margins towards normality, and the cost is visible in the preprint's own application: a log transform moves the DZ estimate from 0.50 to 0.43 for an estimand that is invariant by definition. On the copula square the estimand is also invariant under transpose, under $u \mapsto 1-u$ and under $v \mapsto 1-v$, which generate the dihedral group of order eight. The published model was trained at positive dependence only, and on negatively associated Gaussian, Frank and Clayton samples its root mean squared error is 0.6028 to 0.6029 (source: `manuscript/main.tex`, Section I-B).

The preprint's own route to richer training data cannot work. Its discussion proposes to widen the training set using invariance to continuous injective transformations, naming homeomorphic transformations of the Clayton copula. In two scalar dimensions an injective continuous map from the reals to the reals is strictly monotone, so the only admissible transforms are monotone marginal maps, and those leave the copula unchanged. What comes out is new margins and zero new dependence structure. BMI gets genuine richness from the same identity only because it operates in dimensions above one, where homeomorphisms actually reshape the joint. The synthetic data stays simple because two labelled dependence structures were available and no mechanism made a third.

### What it does

The project builds an estimator that reads only the ranks of a sample, averages its rank-histogram features over the eight symmetries of the square, combines the Linfoot values of four maximum pseudo-likelihood copula fits and the normal-scores correlation, its own direct estimate and a constant zero by softmax weights, and corrects the weighted mean on the logit scale. It trains with squared error against exact labels on three simulated copula sets (the 12 VineCopula families of the coauthors' benchmark; copulas concave in each argument or Schur-concave; Gaussian and Clayton copulas), a tenth of each replaced by exact-independence examples labelled 0. Internally the estimator is named ParamPL0z; the paper writes it $\LG$. An exact-label copula generator, the label engine of `code/core/copula_engine.py`, made the first training sets beyond the two families. The direction of the work after August was set on 2026-10-19 at a meeting with the coauthors (`notes/2026-10-19-meeting-denmark.md`): a training prior restricted to concave copulas, a much wider benchmark, a MIST comparison, and a new manuscript structured as a paper.

## Research questions and claims

Drafted from `manuscript/main.tex`, Sections I-B, I-C and VIII; the earlier README held no section of this form.

- RQ1. Can an estimator of the Linfoot correlation that is exactly invariant to strictly increasing marginal maps and to the eight symmetries of the square have a lower error than the published heatmap estimator on the 12-family benchmark?
- RQ2. Does the error stay low on copula families removed by name from training, and on training data equal to the published estimator's?
- RQ3. Can the positive error of nearest-neighbour and pretrained estimators at exact independence be lowered by exact-independence training examples and a starting value fixed at 0?

- C1. The estimator is exactly invariant to strictly increasing marginal maps and to the eight symmetries of the square. Shown by: the largest departure of the estimate on exact images, at most $2.38\times10^{-7}$ (`manuscript/main.tex`, Section VIII). Baseline: the published estimator. Metric: the largest change of the estimate under the map.
- C2. On the 12 families pooled its root mean squared error is lower than that of the published estimator, of seven classical estimators and of padded MIST. Shown by: paired intervals below zero on both benchmark sets and on fresh samples (results below). Baseline: the published estimator. Metric: pooled RMSE with a paired two-stage cluster bootstrap interval.
- C3. Its exact-independence examples and the starting value fixed at 0 together lower the error at independence: $-0.0041$ $[-0.0046, -0.0036]$ against the model without them (`manuscript/main.tex`, Section VIII). Baseline: the same model without them (ParamPL). Metric: RMSE on the independent samples of the test set.
- C4. $L$ is a functional of the copula, and for an Archimedean copula an integral of its inverse generator, with the closed form for Clayton (`manuscript/main.tex`, contribution 4; supplementary Section S1).

No novelty page of `researcher novelty` exists in `notes/`; the closest prior work is recorded under `## Related work`.

Question: are these the research questions and claims of the project, or do you correct them?

## Data

### The label engine and the training sets

Generated, no raw input. `code/core/copula_engine.py` draws exact-label copulas; the training sets of batch 1 (sets B, C and D, with E1 and E2 for the published architecture) are generated by `code/experiments/pipeline/gen_shard.py` and `gen_v1_shard.py` on the cluster. Shards live in `~/projects/linfoot-estimator/data/` on the cluster (the phase-2 shards) and in the `data_<set>...` folders of `~/projects/linfoot-estimator` named in `code/README.md`. Chosen because a label needs to be exact and closed forms exist for few families.

### The 12-family benchmark of the coauthors

St<e acute>phanie's own R-side artefacts sit at `~/data/linfoot/` (registry key `linfoot-sim`). They are not the preprint's two-family data: they belong to a later pipeline of hers, the Keras notebook `Training linfoot estimator_polynom.ipynb` (a 50 x 50 histogram of rank normal scores, bin statistics, a k-nearest-neighbour Linfoot estimate, rotations of 0, 90, 180 and 270 degrees). `testdata.zip` and `validationdata.zip` hold 240 `family_<code>_Linfoot_<level>_par1_<a>_par2_<b>_n_<N>.RData` files each (the 484 and 482 an earlier note gave counted macOS metadata entries), one `rawdata` list of raw samples per file (1000 samples in the test file opened, 50 in the validation file opened), over 12 VineCopula family codes (1 Gaussian, 2 t, 3 Clayton, 4 Gumbel, 5 Frank, 6 Joe, 7 BB1, 8 BB6, 9 BB7, 10 BB8, 104 and 204 Tawn), label levels 0 to 0.99 and n of 100, 200, 500 and 1000. `trainingdata.Rdata` is a list of 11000 records (`data`, `family`, `par1`, `par2`, `Linfoot`, `nsampSize`), 1000 per family for the 11 families other than Gaussian, 1000 rows each; it is a label cross-check of the family prior, never training data (D5 of `plan.md`). `features_validationdata.csv` is the validation feature table, 48000 rows (240 files x 50 samples x 4 rotations) by 2654 columns. `code/experiments/family_benchmark/run_family_benchmark.py` scores on the two archives; it extracts them to `~/data/linfoot/extracted/{test,validation}` and writes numpy caches to `~/data/linfoot/cache/{test,validation}` (both registered under `linfoot-sim`, rebuilt from the archives when absent). The preprint's own published model is not what they were built for. On the cluster the cache stands in `data/linfoot/cache/` of the account, copied from the repository machine. Chosen as the coauthors' benchmark; its release in the public repository on acceptance waits on her agreement (`## Next`).

### The twin pairs

The table `twinbmi` of the CRAN package mets 1.3.12. `code/experiments/studies/fetch_twinbmi.py` writes its 4271 complete pairs (1483 MZ, 2788 DZ) to `~/data/linfoot-twinbmi/twinbmi_pairs.csv` (`LINFOOT_TWIN_DATA`), and the CSV is copied to `~/data/linfoot-twinbmi/` on the cluster. Chosen because it is the preprint's Section 5 application, and it is public.

### The published model and the MIST weights

The only shipped-in artefact is the released weights of the published model at `code/vendor/combined_model_2.keras` (see `code/vendor/README.md`). The MIST weights are at `~/data/mist` locally and are copied to `data/mist/` on the cluster; `code/core/mist_padded.py` gives the download command.

## Method

The paper is the canonical record of the method: `manuscript/main.tex`, Sections III (the estimand and its invariances), IV (the estimator), V (the training prior) and VI (the experimental protocol), with the configuration and the training sets in the supplementary, Sections S3 and S4.

### The approach

What the paper does not hold, and where it stands:

- The phases of the project, with their gates and statuses (phase 1 invariance, phase 1b equal inputs, phase 2 the label engine, phase 3 the operator backbone): `notes/method.md`.
- The models compared before the presented one (sets A to E, arms 13, 7a and 7b, Mix, DRO, Switch, Param, ParamPL, ParamPL0) and how each works: the internal document `manuscript/concept-note/concept-note.tex`, and items 6 to 19 of `notes/next.md`.
- The rulings that fixed the design: `plan.md` (D1 to D52) and the rulings of 2026-10-19 in `notes/next.md`.

Design cautions:

- The training distribution is a checkerboard, not its smooth limit, so at very large sample sizes a network could in principle detect cell structure. Randomise $G$ per draw and keep it large relative to what the sample size can resolve.
- The prior over random fields is the prior of the resulting Bayes estimator. An estimator trained this way returns a posterior mean, so what the paper's tables read as bias at 0 and at 0.99 is prior shrinkage. That deserves saying out loud, along with a reported calibration curve, rather than being left for a reviewer to raise.
- Amplitude is drawn at random in the coverage diagnostic and by target search in training. The two give different label distributions; do not read the diagnostic as the training sampler.

### What is not claimed

From `manuscript/main.tex`, Section VII-C (Scope): every family, reflection and rotation scored is inside the training prior of the estimator by name; the 12-family benchmark holds positive dependence only; every test is simulated, and the twin data have no known true value; the margins are continuous, and a column with heavy ties carries a warning; the intervals cover the test sampling and not the training seeds. The estimator is not valid for samples with few distinct values, and a constant column returns NaN (`code/results/tie_rules.md`, item "Ties" of `notes/next.md`). No claim that the nearest-neighbour estimator's search degrades badly on near-degenerate samples goes in the paper without a dedicated timing experiment (`notes/results-and-how-to-reproduce.md`, "A note on cost").

## Constraints and limits

- What counts as good enough: not recorded in this form. The rulings say: every claim carries an honest interval (D41 of `plan.md`); no superiority claim on a row where another estimator is lower (D14 of the paper design, `notes/next.md`); step 6 aimed at a prior whose estimator is lowest on all 12 families (item 3 of `notes/next.md`).
- Storage: the home volume of the cluster bounds each wave (29 GB for wave 3, 4 GB for wave 4, 63 GB for wave 5, 4 GB for wave 6, `code/README.md`); the rows files of batch 1 are gitignored (42 MB).
- Compute: the QOS `research` accepts 100 submitted tasks and runs 8; batch 1 has no GPU-hour limit, the measure is waiting time (D14 of `plan.md`, voided); a 128-cell stack does not fit the GPU memory of `main-gpu` at batch 512.
- Time and access: the TNNLS page refuses automated fetches (D49 of `plan.md`); Google Scholar could not be queried and Semantic Scholar keyword search was rate-limited (literature check of item 18).
- The setting (manual or automatic) and its count of methods: not recorded.

Question: what counts as good enough for this project, and which setting, manual or automatic with its count of methods, holds?

## Related work

The paper is the canonical record of the related work: `manuscript/main.tex`, Section II, and Section VII-B on concurrent estimators.

### The closest prior work

No novelty page of `researcher novelty` exists in `notes/`. What the paper does not hold:

- [MIST](https://arxiv.org/abs/2511.18945) (Gritsai, Richards, Meloux, Cho, Peyrard) appeared on arXiv on 24 November 2025, three weeks before the preprint, and has been revised through June 2026. It trains a SetTransformer on 625000 synthetic joint distributions with known mutual information drawn from the BMI benchmark library of [Czyz et al.](https://arxiv.org/abs/2306.11078), covering sample sizes 10 to 500 and dimensions 2 to 32, tests on held-out distribution families, and adds a pinball-loss quantile head whose intervals beat bootstrap. That is the preprint's stated future work, done by someone else and concurrently. Related and also recent: [VDC](https://arxiv.org/abs/2604.20568) trains one reusable amortized bivariate copula estimator and repairs its margins with IPFP, and [vector copulas](https://arxiv.org/abs/2510.20968) interpolate between Gaussian-copula and fully flexible neural models. Any v2 has to cite and benchmark against MIST, and the contribution has to be something MIST does not have.
- The literature check of 2026-11-05 and the full texts read on 2026-11-06 (InfoNet, InfoAtlas, ALICE, CODINE, VCE, N-IFM, Andre, Wadsworth and Huser, Hybrid Summary Statistics, Chen, IGNIS, neural Bayes estimators, group DRO, DoReMi, simulation-based stacking): item 18, "Literature check", of `notes/next.md`.
- The Archimedean criterion cites Muller and Scarsini's working paper, Durante and Papini Example 2.4 and Dolati Proposition 3.7 (item 8 of `notes/next.md`).
- `correspondence/mist-note.md` is the draft note to St<e acute>phanie on MIST (not sent; Axel sends it); the rulings of 2026-10-19 record that the MIST note was sent to her long ago.

### What this project adds

From the literature check of item 18 of `notes/next.md`: not found in any text read are maximum pseudo-likelihood fits mapped to the target scale as starts, a jointly trained gate over the starts and the network's own estimate, a logit correction of the gated mean, exact invariance under the eight symmetries, and a mixture of structurally different priors each given its full budget. Rank input with exact D4 symmetrisation makes negative dependence as accurate as positive dependence with no extra training data, which answers the limitation the preprint states as untested and expected to be worse.

## Results and how to reproduce

Commands run from `code/` unless they start with `cd ~/projects/linfoot-estimator`, which runs on the cluster login node. The project has no `code/run_all.sh` that rebuilds every number from the raw inputs: `code/hpc/run_all.sh` submits cluster batch 1, and `python3 paper.py` regenerates the figures and tables from the committed results. The baseline is the published estimator (the heatmap estimator, internally `v1`); the metric is pooled RMSE with a paired two-stage cluster bootstrap interval (4000 resamples). Nothing beyond the claims of the paper was set as good enough (`## Constraints and limits`). The earlier studies in full: `notes/results-and-how-to-reproduce.md` and `notes/next.md`.

### ParamPL0z against the published estimator on the 12-family benchmark

Pooled RMSE of the reported training run (best of three by validation error) 0.0544 on the test set and 0.0539 on the validation set, against 0.0714 and 0.0708; paired difference $-0.0169$, intervals $[-0.0206, -0.0133]$ and $[-0.0207, -0.0133]$ (`manuscript/main.tex`, abstract). At independence the three-run mean reads 0.0551 against 0.0537, $+0.0014$ $[-0.0009, +0.0034]$, and it is the only one of the 16 models that the published model beats on no group (item 9b of `notes/next.md`). Files: `code/results/batch1_comparison.md`, `code/results/family_winners.md`, `code/results/parampl0z_shipped_seed.md`. Command: `sbatch hpc/linfoot_compare_batch1.slurm` and `sbatch hpc/linfoot_family_winners.slurm` on the cluster, or `python3 experiments/studies/run_batch1_comparison.py`. Beats the baseline: yes, pooled on both sets; at independence the interval includes zero.

### ParamPL0z on fresh samples of the benchmark

Seed 20260820 against the published model: 0.0541 against 0.0699, $-0.0158$ $[-0.0194, -0.0124]$ pooled; lower with the interval below zero on BB6, BB7, BB8, Gumbel, Joe, Student t, Tawn 1 and Tawn 2, not separated on BB1, Clayton, Frank and Gaussian, and $+0.0038$ $[+0.0003, +0.0071]$ at level 0 for that seed (three-seed mean $+0.0022$ $[-0.0012, +0.0053]$). File: `code/results/fresh_test.md`. Command: wave 6 (`bash code/hpc/submit_wave6.sh`), then `python3 experiments/studies/run_fresh_test.py`. Beats the baseline: yes, pooled; not separated on four families and at level 0.

### ParamPL0z on reflected and rotated copies

RMSE 0.0250 against 0.4487 for the published estimator, $-0.4237$ $[-0.4549, -0.3919]$ (`manuscript/main.tex`, abstract). File: `code/results/batch1_comparison.md`. Command: as the first result. Beats the baseline: yes.

### Held-out families and equal training data

The ParamPL0z recipe retrained without the families of each of four folds, against the published model on the held-out families: H1 (Gaussian, Student t) $-0.0026$ $[-0.0059, +0.0009]$; H2 (Clayton, BB1, BB7) $-0.0050$ $[-0.0103, -0.0002]$; H3 (Gumbel, Tawn 1, Tawn 2) $-0.0198$ $[-0.0258, -0.0140]$; H4 (Frank, Joe, BB6, BB8) $-0.0230$ $[-0.0309, -0.0153]$; against ParamPL0z $+0.0014$ to $+0.0044$. The recipe on set D alone: 0.0568 against 0.0714 for the published model, $-0.0146$ $[-0.0178, -0.0114]$. File: `code/results/holdout_comparison.md`. Command: wave 5 (`bash code/hpc/submit_wave5.sh`), then `python3 experiments/studies/run_holdout_comparison.py`. Beats the baseline: yes on H2, H3, H4 and on set D alone; not separated on H1. Detail: item 21 of `notes/next.md`.

### ParamPL0z against the classical panel and padded MIST

On the 12 families pooled, every classical column and padded MIST minus ParamPL0z lies above zero on both sets (`manuscript/main.tex`, contribution 3). On the four margin transforms every classical column, MINE and the published model have the interval above zero against ParamPL0z (item 22 of `notes/next.md`). Files: `code/results/family_benchmark_parampl0z.md`, `code/results/family_bootstrap_parampl0z.md`, `code/results/classical_bench_parampl0z.md`, `code/results/classical_bench_intervals.md`, `code/results/mist_grid_parampl0z.md`, `code/results/mist_trained_range.md`. Command: `bash code/hpc/submit_parampl0z_studies.sh` and wave 6. Beats the baseline: yes.

### Exact invariance and tied samples

The shipped weights give outputs equal to 1.19e-07 in training mode under the eight symmetries at every n from 50 to 2000 after the edge rule of item 6f (`code/results/training_mode_check.md`, `code/results/rotated_copies_check.md`). Under average ranks the RMSE of ParamPL is 0.0505 untied and 0.2269 at 5 levels (`code/results/tie_rules.md`, `code/results/tie_rules_parampl0z.md`). Command: `python3 experiments/engine_checks/run_training_mode_check.py`, `vendor/venv/bin/python -u experiments/engine_checks/run_rotated_copies_check.py`, `sbatch hpc/linfoot_tie_rules.slurm parampl0z`. Beats the baseline: yes on invariance; the published model differs by up to 1 on exact images.

### The twin application

The Section 5 reproduction of the preprint needs nothing from the SDU side. `code/experiments/studies/run_twin_application.py` scores every column of the 12-family table on the twin pairs under four strictly monotone transforms of both margins and a 1000-replicate percentile bootstrap resampling pairs, and writes `code/results/twin_application.md`, with the published estimator's raw and log values beside the preprint's numbers. Run at 1000 replicates on 2026-11-10 (jobs 713565 and 713566). The published estimator matches the preprint: raw 0.7369 MZ and 0.5035 DZ, log 0.7239 and 0.4309. ParamPL0z of seed 20260820 reads 0.7223 MZ and 0.4239 DZ under all four transforms, and padded MIST, outside its trained sample sizes, reads 0.7505 MZ and 0.2761 DZ. The percentile intervals of KSG1 k=4, KSG2, Kozachenko-Leonenko and the histogram are unusable, because resampled pairs duplicate about 63 percent of rows and the data is heavily tied; Kozachenko-Leonenko is 0 on the observed pairs too. It is Section S5 of the supplementary, with table `tab:twin`, stated as invariance and agreement between estimators and not accuracy, since the true value of the twin data is unknown. File: `code/results/twin_application.md`. Command: `sbatch code/hpc/linfoot_twin_application.slurm`, then `sbatch --dependency=afterok:<job> code/hpc/linfoot_twin_mist.slurm`. Beats the baseline: not applicable, no true value.

### Inference time

Median time at n = 100 and 1000: padded MIST 25.52 and 618.67 ms on ctit087; the stored ParamPL0z 29.13 and 48.45 ms ran on another CPU. Files: `code/results/inference_time_parampl0z.md`, `code/results/inference_time_classical.md`. Command: `experiments/family_benchmark/run_inference_time.py`, in wave 6 and in `submit_parampl0z_studies.sh`. Beats the baseline: not a comparison of error.

### The training-set comparison and the models of batch 1

Sets A to E, arms 13, 7a and 7b, Mix, DRO, Switch, Param, ParamPL, ParamPL0 and ParamPL0z, three seeds each where ruled. Pooled RMSE on the 12-family test: A 0.0607, B 0.0552, C 0.0573, D 0.0547, E1 0.0716, E2 0.0714, Mix 0.0541, ParamPL 0.0543, ParamPL0 0.0539, against 0.0714 for the published model. Files: `code/results/batch1_comparison.md`, `code/results/family_winners.md`, `code/results/batch1_results.pdf`, `code/results/component_per_run.md`. Command: `bash code/hpc/run_all.sh`, then `bash hpc/collect_batch1.sh`. Beats the baseline: B, C, D and the models of waves 3 and 4 pooled; E1 and E2 do not. Detail: items 17, 18 and 9b of `notes/next.md`.

### The thin-ridge resolution measurement

Pooled RMSE on the thin-ridge test set 0.1392 for the 8/16/32 stack against 0.1289 for 8/16/32/64, three seeds each. Files: `code/results/thin_ridge.md`, `code/results/thin_ridge.png`. Command: `cd ~/projects/linfoot-estimator && bash code/hpc/run_thin_ridge.sh`, then `bash hpc/collect_thin_ridge.sh`. Beats the baseline: a comparison of two input stacks. Detail: item 5 of `notes/next.md`.

### The engine-prior estimator on the 12-family benchmark

`p2`, the shipped engine-prior model (set A): pooled RMSE 0.0607 against 0.0714 for `v1`, `ksg1_rank` 0.0650 (paired $+0.0042$ $[-0.0001, +0.0088]$), at all 1000 samples per test file; at independence `v1` 0.0537 against `p2` 0.0873. Files: `code/results/family_benchmark.md`, `code/results/family_bootstrap.md`. Command: `vendor/venv/bin/python -u experiments/family_benchmark/run_family_benchmark.py`, then `python3 experiments/family_benchmark/run_family_bootstrap.py`. Beats the baseline: pooled yes; lowest on Gaussian, Clayton, Frank and BB1 is `v1`. Detail: items 3, 16 and 16b of `notes/next.md`.

### Phase 2: the estimator trained on the label engine

On the eight-family grid `p2` beats `fnn` on all eight families and reads 0.0734 on arbitrary engine shapes against 0.4777 for `v1`; on Gaussian and Clayton `v1` stays ahead (0.0462 and 0.0519 against 0.0583 and 0.0652). Files: `code/results/phase2.md`, `code/results/phase2_scaled.md`, `code/results/phase2_balanced.md`, `code/results/phase2_wide_balanced.md`. Command: `python3 experiments/studies/run_phase2.py --score-only`. Beats the baseline: on reversed and arbitrary shapes yes, on the two training families no. Detail: `notes/results-and-how-to-reproduce.md`.

### Phase 1: invariance

Rank input plus D4 symmetrisation: every monotone marginal transform moves the estimate by zero to the last bit, against up to 0.83 for `v1`; reversed dependence 0.0559 against 0.6029; on the seen grid 0.0554 against 0.0492. Files: `code/results/phase1.md`, `code/results/phase1_equalised.md`, `code/results/phase1_full.md`. Command: `python3 experiments/studies/run_phase1.py --variant equalised`. Beats the baseline: on invariance and reversed dependence yes; on the seen grid no. Detail: `notes/results-and-how-to-reproduce.md`.

### The classical panel on the eight-family grid

`p2` reads 0.0624 pooled against 0.0799 for the best classical option and is ahead of every classical column on all eight families; under four monotone transforms raw-value estimators move by 0.0142 to 0.2501, `v1` by 0.0947, `p2` not at all. Files: `code/results/classical_bench.md`, `code/results/classical_validation.md`. Command: `python3 experiments/studies/run_classical_bench.py --validate`. Beats the baseline: yes. Detail: "Closed: the classical panel" in `notes/next.md`.

### The label engine, the port of the published model and the family classes

Engine validation (Gaussian label within 3.71e-04, Clayton within 9.56e-04 at G=1024): `code/results/engine_validation.md`, `python3 experiments/engine_checks/run_engine_validation.py`. The Python port of the published R driver reproduces Table 1 of the preprint within 0.0063: `code/results/v1_port_check.md`, `python3 experiments/engine_checks/run_v1_port_check.py`. The 12 families classified against five concavity classes: `code/results/family_classes.md`, `python3 experiments/engine_checks/run_family_classification.py`. Padded MIST: `code/results/mist_padded.md`, `python3 experiments/mist/run_mist_padded_check.py`. Beats the baseline: validation checks, not comparisons. Detail: `notes/results-and-how-to-reproduce.md`, items 2 and 4 of `notes/next.md`.

### The released package and its saliency figures

The package is its own repository at `~/workspace/linfoot` (MIT), with its zip for the coauthors `admin/linfoot-estimator.zip` and the nine saliency figures as `admin/linfoot-saliency.zip`. Files: `code/figures/release/`, `code/results/release/saliency_summary.md`. Command: `python3 experiments/release/make_package_zip.py`, `python3 experiments/release/make_saliency_figures.py`. Beats the baseline: not a comparison. Detail: item 23 of `notes/next.md`.

## Papers

- `manuscript/`: the paper "A Pretrained Rank-Based Estimator of the Linfoot Informational Correlation", `main.tex` and `supplementary.tex` with `main.bib`, IEEEtran for TNNLS, 12 and 21 pages, and the one-page cover letter `cover-letter.tex`, which discloses the earlier arXiv version (TNNLS policy on preprints not verified). It reports the results of batch 1, wave 5 and wave 6 above, with ParamPL0z as the estimator, and includes the preprint: Proposition 1 with its proof, Section S1 (Archimedean and Clayton closed form, with proofs), the twin application as Section S5, and the preprint's estimator as "the heatmap estimator" $\hat L_{\mathrm{hm}}$; `vandenberg2025` is gone from `main.bib`. The review version keeps the byline "Anonymous Authors" (D51); the named byline is a comment in both files. PDF copies of the manuscript, supplementary, concept note and cover letter are in `admin/draft/`.
- `manuscript/concept-note/`: the internal document for the coauthors, "Sixteen Trained Estimators of the Linfoot Correlation and How They Compare with the Published Estimator", 7 pages, on the 16 models of batch 1.
- `manuscript/archive/2026-08/`: the August manuscript, frozen, with `tables_generated.tex` (768 cells); it reports the engine-prior estimator, phase 1, phase 2 and the classical panel.
- `manuscript/archive/2026-11-article/`: the article-class draft, archived when the IEEEtran draft started.
- `manuscript/archive/2026-11-meeting-response/`: the 2-page answers to the 19 October collaborator meeting points, archived by D29.
- `present/`: a presentation, `main.md`.

The decision for one paper and the deliverables of the August manuscript: `notes/papers.md`.

Question: the earlier README gives the August manuscript as 33 pages in item 1 and in its Deliverables table, and as 32 pp in its record of 2026-08-23. Which is right?

## Dead ends (do not retry)

### The operator backbone

Folder in `code/attic/`: none, it was not built. Diagnosis: the gate was run on the scaled model and the fine-structure bias gradient fell from 2.13 to 1.65 while the error returned to being scatter-dominated, so a discretisation-invariant backbone has little to gain (`notes/method.md`).

### Reshaping the label prior near independence

Folder in `code/attic/`: none; the four priors stay selectable by `LINFOOT_LABEL_PRIOR` in `code/core/phase2_gen.py`. Diagnosis: a zero-sum reallocation, mass moved to one band comes out of another and the total does not move; four arms were run. Do not re-open this without a new idea ("Closed: the independence floor" in `notes/next.md`).

### An output sharpness on the sigmoid

Folder in `code/attic/`: none; `floor_beta` stays in `code/core/v2_model.py`. Diagnosis: three arms at the matched budget left the independence floor where it was, 0.0804 for the sigmoid, 0.0881 at beta = 8, 0.0813 at beta = 20 (`code/results/output_ends.md`).

### A linear clipped output

Folder in `code/attic/`: none; the phase-1 variant `full`. Diagnosis: it saturates at the top, returning exactly 1.000 with zero spread at L = 0.99 (`notes/results-and-how-to-reproduce.md`, Phase 1 result).

### Five levers against the accuracy floor

Folder in `code/attic/`: none. More distinct shapes, double the trunk width, the pinball objective, more examples and a cosine-basis input in place of the histogram did not move the floor; the shipped model sits 5 to 8 percent above the floor its own uncertainty model implies (`code/results/headroom.md`, "Closed: six levers" in `notes/next.md`).

### The released MIST weights on scalar pairs

Folder in `code/attic/`: `mist/` (`code/attic/README.md`). Diagnosis: every training configuration of MIST has at least two columns for X and two for Y, so a pair of scalars lies below the whole training support; the padded estimator of `code/core/mist_padded.py` replaced it (`code/results/mist_integration.md`).

### Widening the training set by homeomorphic transforms

Folder in `code/attic/`: none, never built. Diagnosis: in two scalar dimensions the only admissible transforms are monotone marginal maps, which leave the copula unchanged (`## What it is and why`).

## Next

1. Agree the order of authors with St<e acute>phanie: Axel Faes, St<e acute>phanie M. van den Berg, Ulrich Halekoh, S<o diaeresis>ren M<o diaeresis>ller, Andreas Kryger Jensen, Jacob von Bornemann Hjelmborg.
2. Raise the 17-against-18 bin discrepancy between the paper text and the released code with the authors; the manuscript already states it as a defect of the released code (item 10 of `notes/next.md`).
3. Get her agreement to release the two sets of the 12-family benchmark (`testdata.zip`, `validationdata.zip`) in the public repository on acceptance, which the Data Availability statement of the paper now says.
4. Assign the CRediT roles (`% CREDIT` in `manuscript/main.tex`) and collect the authors' e-mail, department and city for the published byline.
5. Bring the figure text from 7 pt to IEEE's approximate 9 to 10 pt.
6. Run `python3 paper.py` end to end, which has not run since its new step, and rerun the batch 1 comparison job with its edited script.
7. Verify the TNNLS policy on preprints, which the cover letter assumes.

The step log, the specifications of each step and the rulings of 2026-10-19: `notes/next.md`. The step plan with statuses and the rulings D1 to D52: `plan.md`.

## Working state

### The stage and campaign that stand

No stage of `researcher research` is named: `research` did not start this project, and `/researcher research adopt` would name one. As the earlier README gives it: the paper, its supplementary, the cover letter and the concept note are drafted and revised (both revision rounds applied, 2026-11-09), the IEEEtran draft is formatted for TNNLS, and the final revision, citations, abstract and AI-use statement are done. The jobs of waves 1 to 6 and the twin application (jobs 713565 and 713566) have completed and been collected. The briefs of rows 21a and 22a are `notes/row21-brief.md` and `notes/row22-brief.md`. Each step ran as one builder agent in a worktree under `.agents/worktrees/`, read in full and landed by the orchestrator; the hub has no plan configuration (`.agents/plan.yaml`), so the ledger is `plan.md`.

### Where things live

- `README.md`: this file.
- `code/`: the code folder, the public deposit, with `code/README.md` and `code/.depositignore`.
- `code/run_all.sh`: none. `code/hpc/run_all.sh` submits cluster batch 1.
- `code/paper.py`: every figure and table from the committed results.
- `code/core/`: the library.
- `code/experiments/`: the scripts, in the role folders `pipeline/`, `studies/`, `engine_checks/`, `family_benchmark/`, `mist/`, `figures_tables/` and `release/`.
- `code/hpc/`: the job scripts and the submit scripts.
- `code/data/`: none. The raw inputs stand in `~/data/linfoot/`, `~/data/linfoot-twinbmi/` and `~/data/mist`; `code/vendor/` holds the published model.
- `code/results/`: every result, with the paper's figures and tables; the manuscript reaches it through the links `manuscript/results` and `manuscript/archive/results`.
- `code/figures/`: the release figures in `code/figures/release/`; the paper's figures stand in `code/results/`.
- `code/attic/`: the dead end `mist/`, indexed in `code/attic/README.md`.
- `manuscript/`: the paper, with `concept-note/` and `archive/`.
- `admin/`: the PDF copies in `admin/draft/` and the two zips for the coauthors.
- `notes/`: the meeting notes of 2026-10-19, the briefs of rows 21a and 22a, and the sections moved out of this README.
- `reviews/`: none.
- `logs/`: none in the project folder.
- Beside the tree: `plan.md`, the step plan and the rulings; `correspondence/`, the draft MIST note; `present/`, a presentation; `.scratch/`, agent briefs of the class-prior work.

Question: where do the output and error files of the cluster jobs stand?

### Cluster facts

- Local for everything up to and including the first phase-2 run: the engine is numpy, and the model is small enough that MPS trains it in under an hour. MPS is ten times faster than CPU here, 27 seconds against 275 per epoch on the phase-1 size, so the device order matters.
- Scheduler: SLURM. The host is reached as `utwente`; the code folder is copied to `~/projects/linfoot-estimator/code`, and the rsync of the code folder must exclude `results/`, since the cluster copy keeps its results in `~/projects/linfoot-estimator/code/results`.
- Partitions: `main-gpu` (A100 node 39.5 GiB, A40 node 44.4 GiB, L40 and L40S; ctit088 has an 8 GB RTX 2080 that does not hold a batch of 1536) and `main-cpu`. QOS `research`: at most 100 submitted tasks, 8 running.
- Environments: the packed environment `~/envs/linfoot_env.tar.gz`, built with the commands in the header of `code/hpc/run_phase2.sh` and by `code/hpc/build_envs.sh` on the login node, the only machine with a route to the package index; the MIST overlay `~/envs/linfoot_mist_overlay.tar.gz` (`bash code/hpc/build_envs.sh mist`). The scripts fail loudly at the top if one is missing.
- Storage: the jobs follow the node-local scratch pattern the admins ask for, with the interpreter guard against the Ubuntu 24.04 nodes. Shards live in `~/projects/linfoot-estimator/data/` and the `data_<set>...` folders, weights land in `~/models/linfoot-estimator/`.
- The cluster takes over at scale. `code/hpc/run_phase2.sh` submits the phase-2 scaling run as one dependency graph: a 21-task array generating 480000 training examples plus a validation shard, then a single GPU job training on all of them.
- Scoring of the published baseline stays local when it needs tensorflow, because the cluster env is deliberately lean; pull the weights back and run `run_phase2.py --score-only`. The benchmark against FNN, KDE, KNN and MINE ran locally; MINE trains a fresh network per dataset, so it ran at 50 replicates against 200 for the rest.

Question: what are the account, the modules and the time limits of the partitions?

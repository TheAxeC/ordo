# Phase 2: Paper outline

Produced by `structure_architect_agent` for the `full`-mode run of `academic-paper`. Inputs read in full: `paper/config.md` (C1 to C9), `paper/phase0/paper_configuration_record.md`, `paper/phase0/venue_profile.yaml`, all of `paper/phase1/`, `code/README.md`, `code/core/{bttn,config,cohort,cohort_accounting,bench,cnn,ssl_pretrain,preprocess}.py`, every script in `code/experiments/`, the ten admitted files of C1, and the images `clin_eval.png`, `pipeline_overview.png`, `bttn_architecture.png`, `bttr_vs_bttn.png` (viewed). Nothing was run (C6).

This is a plan: it gives section purposes, claims, evidence and word counts. It contains no manuscript prose.

## Rules the outline applies

- Result numbers come only from the ten admitted files of C1, copied exactly with file, line and column. Each is listed in the Evidence map below. No number comes from `RESULTS.md`, from any `*ecg*` file, from an undetermined-label file or from an external file.
- Method settings (window lengths, ranks, learning rates, caps) are design facts of the code and are cited to `file:line` in the code. They are not results.
- Comparisons are point estimates with 95% patient-bootstrap CIs. No sentence claims a statistically significant difference (C4). Paired-bootstrap deltas are a [GAP] (C4).
- Faithfulness results (C2) and external validation results (C3) are [GAP] placeholders in Results, each tied to the Methods subsection that describes the analysis.
- No dead end, provisional result, retracted analysis or `code/attic/` work is mentioned (C9). The architecture variants that exist only as code switches (attention head, GRU temporal mode, deep head, ACE warm start, multi-task head, competing-risks head) are not described.
- Structure pattern: IMRaD (Pattern 1), confirmed with original data. Adapted for a method paper in a clinical AI journal: the template's 25% Literature Review is reduced to a 700-word Related Work section, and Methods is enlarged to carry the model definition and the faithfulness protocol. Venue limits are all "not stated" (`paper/phase0/venue_profile.yaml`), so no venue constraint is checked.

## Title

An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead ECG and clinical risk factors

(Title from `code/README.md:3`, reduced to sentence case. Running title: "Interpretable block-term tensor network for incident AF".)

Authors, affiliations, ORCIDs, corresponding author: [GAP] (`paper/config.md:22`).

## Overview

The paper asks whether a model whose ECG evidence passes through readable frequency and lead block factors, fused with clinical risk factors, can predict incident AF from one sinus-rhythm ECG on gold ICD-10 labels, compared with a clinical risk-factor model and a CNN, and whether its signatures are faithful. The Introduction motivates incident-AF risk prediction and the gap between black-box AI-ECG models and interpretability that is measured. Related Work places BTTN against block-term tensor models and against interpretable-by-design and faithfulness literature. Methods defines the cohort, the spectral tensor, BTTN with its Cox loss and its clinical term, the comparators, the evaluation, the faithfulness analyses and the external analyses. Results reports the cohort, the one-year seven-model comparison (Table 2, the headline), discrimination at four horizons from one survival model, calibration and clinical utility, and holds [GAP] placeholders for paired deltas, faithfulness and external validation. Discussion interprets the comparison against prior AI-ECG and clinical models, states the interpretability argument, the clinical use, and the limitations.

## Detailed outline

### Abstract (250 words, not counted in the 6,500)

**Purpose**: Structured summary (Background, Methods, Results, Conclusions), English only.
**Content**:
- Background: incident AF prediction from a sinus-rhythm ECG; black-box models; interpretability seldom measured.
- Methods: MIMIC-IV-ECG, ICD-10 I48 (and ICD-9 427.31/427.32) dated outcomes, 30-day blanking, one AF-naive sinus index ECG per patient; BTTN with frequency and lead block factors, Cox partial-likelihood loss, linear clinical term that bypasses the block layer; comparators clinical model and CNN; repeated 5-fold CV; patient-bootstrap CIs.
- Results: cohort counts (E1, E2, E3); Table 2 headline values for BTTN + clinical, clinical model, CNN, ECG-only BTTN (E10, E11, E13, E14); one multi-horizon line (E22 or E26); one risk-strata line (E40, E41). No faithfulness or external number until the [GAP]s are filled.
- Conclusions: the interpretable fused model reached the highest point AUROC of the models compared at one year, with ECG evidence that is readable by construction; faithfulness [GAP].
- Keywords (6): atrial fibrillation; electrocardiogram; tensor decomposition; interpretable machine learning; survival analysis; MIMIC-IV.

### 1. Introduction (850 words)

**Purpose**: Establish the clinical need, the state of AI-ECG and clinical risk prediction, the interpretability gap, and the aim.

- 1.1 AF burden and the case for risk-targeted screening (200)
  - AF incidence rises with age; risk prediction supports targeted screening. Sources: kornej2020 (supports), noseworthy2022 (supports: AI-guided screening raised detection in high-risk patients), hindricks2021 (neutral; only the guideline's existence unless the citation agent checks full text).
- 1.2 Clinical risk scores and AI-ECG models for incident AF (250)
  - Clinical scores (schnabel2009, alonso2013) are strong baselines.
  - Deep models predict AF from sinus-rhythm ECGs: attia2019 (identification, not dated incidence), raghunath2021 (1-year new-onset), khurshid2022 and christopoulos2020 (ECG and clinical risk complementary), biton2021, jabbour2024 (MIMIC-IV only as external test set), yuan2023 (31-day window, distinguish task).
- 1.3 The interpretability gap (250)
  - These models are black boxes; explanations offered are post hoc (hughes2021 LIME, storas2023 Grad-CAM, matsuo2026 SHAP) and untested for faithfulness.
  - Post-hoc attributions can fail sanity checks (adebayo2018, hooker2019); the case for interpretable-by-design models in high-stakes use (rudin2019); the counter-position that explainability gives false reassurance and validation is needed (ghassemi2021, opposes in part), which this paper answers by measuring faithfulness.
- 1.4 Aim and contributions (150)
  - State the research question as confirmed (`paper/config.md:10`).
  - Contributions, stated without numbers: (i) BTTN, a block-term input factorisation trained end to end with a nonlinear head and a Cox partial-likelihood loss; (ii) a transparent clinical term added to the log-risk that bypasses the block layer (design fact, `code/core/bttn.py:128-135,176-177`); (iii) a comparison with a clinical model and a CNN on one gold-label MIMIC-IV-ECG cohort; (iv) a faithfulness protocol (control probes, intervention test, block-structure ablation, block-count sweep, substrate map), results [GAP].

**Transition to 2**: The contributions rest on two literatures (block-term tensor models; interpretable-by-design and faithfulness evaluation) that Section 2 reviews to show what BTTN adds.

### 2. Related work (700 words)

**Purpose**: Position BTTN against prior block-term and multilinear models and against interpretability and faithfulness work.

- 2.1 Block-term tensor models and tensor regression (350)
  - Definitions: delathauwer2008 (block terms), kolda2009 (notation).
  - Supervised multilinear regression lineage: zhao2013 (HOPLS), camarrone2019, faes2022 (eBTTR), faes2024 (BTTR with automatic component extraction; the vendored linear baseline).
  - Block terms as readable biosignal components in unsupervised decompositions: hunyadi2014 (EEG), goulart2020 (AF ECG source separation); supervised tensor factors on EHR: kim2017; supervised block-term discriminant features with a separate classifier: vandenkerchove2025.
  - Block terms inside networks used only to compress weights: ye2018, li2017btnets, ye2020 (name collision: state how BTTN differs: the input tensor is factorised into frequency and lead factors on the predictive path).
  - Multilinear interpretable networks on images: dooms2025.
- 2.2 Interpretable by design and faithfulness evaluation (350)
  - Interpretable intermediate layers: koh2020 (concept bottlenecks), bohle2022 (B-cos).
  - Leakage through a flexible head: mahinpei2021, havasi2022; this motivates probing the block scores, which exclude the head.
  - Faithfulness definitions and tests: jacovi2020 (graded faithfulness), adebayo2018, hooker2019 (removal-based tests), sundararajan2017 (representative attribution method).
  - Time-frequency ECG inputs used for detection, not incident prediction: jeong2021.

**Transition to 3**: With the gap located (no supervised, survival-trained block-term input factorisation with measured faithfulness for a clinical outcome), Section 3 defines the cohort, the model and the tests.

### 3. Methods (2,100 words)

**Purpose**: Define data, outcome, model, comparators, evaluation, faithfulness and external analyses in enough detail to reproduce. Reporting follows TRIPOD+AI (collins2024).

- 3.1 Study design, data sources and reporting (180)
  - Retrospective development and internal validation with repeated patient-level cross-validation. Data: MIMIC-IV-ECG version 1.0 (gow2023; version from the zip name at `code/core/config.py:35`), linked to the MIMIC-IV hospital module for diagnoses, admissions and patients (johnson2023), hosted on PhysioNet (goldberger2000). One ECG per patient (`code/core/cohort.py:103-104`).
  - TRIPOD+AI checklist as supplementary material (collins2024).
- 3.2 Cohort and outcome definition (280)
  - Index ECG: each patient's earliest ECG whose machine report reads sinus rhythm, not AF or flutter, and not paced, junctional, atrial tachycardia, SVT, wandering or ectopic atrial rhythm (`code/core/cohort.py:22-26,40-42,103-104`).
  - Outcome onset: first admission carrying ICD-10 I48 (AF and flutter) or ICD-9 427.31/427.32, dated by admission time (`code/core/cohort.py:50-64`, `code/core/config.py:52-53`).
  - Exclusion of prevalent or concurrent AF: onset at or before index + 30 days, or an AF-reading ECG at or before index + 30 days (`code/core/cohort.py:118-121`, `code/core/config.py:51`).
  - One-year binary cohort: positives with onset in (30, 365] days; controls with no onset and follow-up >= 365 days, where follow-up ends at the later of the last ECG and the date of death (`code/core/cohort.py:67-82,130-133`).
  - Survival cohort: event = any incident onset after the blanking window; controls censored at follow-up with a 365-day minimum (`code/core/cohort.py:125-129`, `code/core/config.py:72`).
  - Sampling caps for compute: up to 4,000 cases and 16,000 controls per cohort file (`code/core/config.py:69-70`); for the one-year comparison, controls subsampled at 4 per case (`code/core/bench.py:36-38`, invoked with `--neg_ratio 4`, `code/README.md` pipeline table).
  - Covariates: age (anchor_age), sex, RR interval, P-wave duration, QRS duration, QT, P, QRS and T axes from the machine measurements (`code/core/bench.py:30`, `code/core/cohort.py:35-46`). Methods must name all nine; the label "age/sex + ECG intervals" in `table1_cis.csv:2` is shorthand for this set. P-wave duration as an established AF predictor: nielsen2015.
  - Differential follow-up check: share of controls with a later ECG and with a documented AF-free later ECG (`code/core/cohort_accounting.py:48-60,99-104`); values in Results 4.1.
- 3.3 ECG preprocessing and spectral tensor (170)
  - Per lead: 0.5 Hz second-order Butterworth high-pass, 50 Hz notch, sym4 level-3 wavelet soft thresholding, decimation 500 to 250 Hz, per-lead max-abs normalisation (`code/core/preprocess.py:24-59`, `code/core/config.py:64`, `code/core/preprocess.py:108-114`).
  - Magnitude spectrogram, 128-sample window, 32-sample hop, frequencies up to 40 Hz, log1p, time axis resampled to 40 frames, per-sample standardisation, giving a frequency x time x lead tensor (`code/core/preprocess.py:83-105`). Rationale: shift-tolerant input that needs no beat alignment (`code/core/preprocess.py:84-90`). Precedent for time-frequency 12-lead inputs: jeong2021.
- 3.4 BTTN model and training (480)
  - Block-term layer: K = 12 blocks; block k projects the tensor onto a frequency factor A_k (F x 3) and a lead factor C_k (L x 2), giving K x 3 x 2 = 72 channels over time (`code/core/bttn.py:43,65-66,77-83`). No learned core tensor. Notation from kolda2009; block terms from delathauwer2008.
  - Temporal stage: grouped 1-D convolutions along time with kernel sizes 3, 7 and 15 and 6 filters per channel, batch normalisation and ReLU; pooling by a learned softmax attention over time concatenated with max pooling over time (`code/core/bttn.py:68-72,93-100`).
  - Head: batch norm, dropout 0.4, MLP 256 to 128 to 1 with ReLU, output = ECG log-risk (`code/core/bttn.py:123,152-156`).
  - Loss: negative Cox partial log-likelihood with within-batch risk sets (`code/core/bttn.py:181-187`); cox1972, katzman2018, kvamme2019 (sampled risk sets).
  - Training: Adam, learning rate 2e-3, weight decay 1e-4, cosine schedule, up to 120 epochs, batch 512, early stopping with patience 16 on validation AUROC at the horizon in an inner 85/15 split, best state restored; three-model ensemble per training fold, averaged (`code/core/bttn.py:33,203-221,224-285`).
  - Interpretable readouts: block scores = time-averaged pure multilinear projection, computed without the head (`code/core/bttn.py:85-86`); per-block frequency x lead signature A_k C_k^T (`code/core/bttn.py:108-116`).
  - Self-supervised pretraining (BTTN + SSL variants): the same block-term layer pretrained label-free with a SimCLR-style NT-Xent loss (temperature 0.2) on 30,000 ECGs, one per patient, with time masking, frequency masking, lead dropout, additive noise and small time roll; 60 epochs; weights transferred to the block layer before supervised training (`code/core/ssl_pretrain.py:33-36,54-91,94-117`, `code/README.md` pipeline table). Sources: chen2020simclr, kiyasseh2021, mehari2022.
- 3.5 Clinical fusion term (150)
  - Linear term w^T c on the standardised covariate vector c (the nine covariates of 3.2), no bias, added to the head log-risk (`code/core/bttn.py:133-135,176-177`; covariates passed at `code/core/bench.py:107-115`).
  - Standardised with training-fold statistics, missing values imputed with the training mean (`code/core/bttn.py:195-200`); weights warm-started from a class-balanced logistic regression on the training fold and excluded from weight decay (`code/core/bttn.py:240-253`).
  - Design consequence stated without a number: the clinical term does not enter the block layer or the block scores, so the block factors remain the only path for ECG evidence and the probes of 3.8 read the same quantities with or without fusion (`code/core/bttn.py:128-132`; C2 allows this design statement).
- 3.6 Comparators (200)
  - Clinical model, one-year comparison: logistic regression on the nine covariates with median imputation, standardisation and balanced class weights (`code/core/bench.py:82-88`). Rationale: schnabel2009, alonso2013, khurshid2022.
  - Clinical model, multi-horizon analysis: Cox model with penalty 0.1 on the same covariates, median imputation (`code/experiments/multihorizon.py:107-114`).
  - Linear block-term tensor regression (BTTR) on the spectral tensor, the vendored implementation (`code/core/bench.py:89-90`; faes2024, faes2022, camarrone2019).
  - CNN: three convolutional layers (32, 64, 64 filters; kernels 7, 5, 3) with batch norm, pooling and dropout, on the same spectral tensor with frequency and lead flattened into channels; class-weighted binary cross-entropy; early stopping on validation AUROC; three-model ensemble (`code/core/cnn.py:21-99`). Rationale: CNNs are the reference AI-ECG architecture (attia2019, raghunath2021).
  - All seven models share the same folds, tensor and cohort (`code/core/bench.py:143-155`).
- 3.7 Evaluation protocol and statistics (250)
  - One-year comparison: stratified 5-fold cross-validation repeated with 5 seeds; per-patient out-of-fold scores averaged over seeds (`code/core/bench.py:71-77,143-164`). AUROC reported as the mean over 2,000 patient-bootstrap resamples with percentile 95% CI (`code/experiments/compute_table1_cis.py:14-25`); hanley1982, carpenter2000. One ECG per patient, so the row bootstrap is a patient bootstrap.
  - Paired comparisons: paired patient-bootstrap distribution of AUROC differences (2,000 resamples) between each model and the clinical model and the CNN (`code/core/bench.py:131-140,163-174`). Results: [GAP-C4] in 4.2.
  - Multi-horizon: one survival BTTN and one survival BTTN + clinical trained on the survival cohort with 5-fold CV; horizon AUROC at 90 days after blanking (onset in (30, 120] days), 1, 2 and 5 years, cases = event by the horizon, controls = event-free beyond the horizon, censored-before-horizon excluded; percentile bootstrap CI for the BTTN models (`code/experiments/multihorizon.py:27-68,90-130`).
  - Calibration and clinical utility at one year from the multi-horizon scores: 2-fold cross-fitted Platt scaling; reliability curve and Brier score (vancalster2019); decision curve (vickers2006); operating points flagging the top 5, 10, 20 and 30% with sensitivity and specificity; PPV and number needed to monitor recomputed at the one-year incidence of the eligible cohort, 1,855 / (1,855 + 41,770) (`code/experiments/clin_eval.py:20-76`; counts E5, E6); risk deciles of the fused model (`code/experiments/clin_eval.py:79-83`).
- 3.8 Faithfulness analyses (250)
  - Definition: faithfulness as agreement between the readout and the model's computation, measured in degrees (jacovi2020).
  - Linear probe and control probes: a logistic readout of the block scores (head excluded, so no head leakage; mahinpei2021, havasi2022), against the same readout on (2) the raw flattened tensor, (3) the CNN's 64-d penultimate features, (4) a fixed random projection to the block-score dimension, (5) block scores of a label-blind block layer (SSL-pretrained); AUROC with bootstrap CI and recovery = probe AUROC / full-model AUROC (`code/experiments/faithfulness_controls.py:1-27,81-165`; adebayo2018 for randomisation-style controls). Results: [GAP-F1] in 4.5.
  - Intervention test: rank frequency bins and leads by single-axis occlusion importance on a held-out fold, then zero the top-n and, as control, the bottom-n axes cumulatively and record full-model AUROC (`code/experiments/intervention_curve.py:1-90`; hooker2019). Results: [GAP-F2] in 4.5.
  - Block-structure ablation: replace the block-term layer with CP rank-1 blocks or a full-rank frequency x lead projection of the same width, downstream identical; report full AUROC and probe recovery (`code/experiments/ablation_blockstructure.py:1-82`, `code/core/bttn.py:46-66`). Results: [GAP-F3] in 4.5.
  - Block-count sweep: K = 4, 8, 12, 16, 24, AUROC mean and SD over seeds (`code/experiments/ablation.py:20-52`). Results: [GAP-F4] in 4.5.
  - Substrate map: occlusion importance per frequency bin and per lead on a held-out 20% split with a three-model ensemble, plus the mean absolute block signature (`code/experiments/interpret_bttn.py:32-88`). Results: [GAP-F5] in 4.5.
  - All five analyses use the one-year comparison set (3.2) and the spectral tensor (3.3) of Table 2 (`load_cohort_tensor`, `code/core/bench.py:33-68`) and are to be run with `--source icd` (`code/README.md` pipeline table).
- 3.9 External analyses (150)
  - Purpose: method and signature transfer on independent datasets. These are AF identification and detection tasks without dated outcomes, a different task from incident prediction (`code/experiments/external_ptbxl.py:3-11`, `code/experiments/external_code15.py:5-12`).
  - CODE-15 (ribeiro2021code15, ribeiro2020): AF-in-sinus-rhythm identification (sinus exam of a patient with an AF exam elsewhere vs never-AF patients) and SR vs AF detection; one exam per patient; up to 6,000 per class (`code/experiments/external_code15.py:28-44`).
  - PTB-XL (wagner2020): SR vs AF detection, class-balanced, labels from scp_codes (`code/experiments/external_ptbxl.py:30-52`).
  - BTTN with a binary cross-entropy loss and the same architecture (`code/core/bttn.py:353-387`); 5-fold CV AUROC; occlusion importance by frequency and lead compared with the MIMIC substrate map. Results: [GAP-X1] in 4.6.
  - Note for the writer: the CV AUROC is printed by the scripts and not stored; the figure titles of the PTB-XL script show an in-sample AUROC of a model trained on all data (`code/experiments/external_ptbxl.py:86-97`), which must not be reported as validation.

**Transition to 4**: Results follow the order of Methods: cohort, one-year comparison, horizons, clinical utility, then the faithfulness and external analyses.

### 4. Results (1,250 words)

**Purpose**: Report what the admitted gold-label files show, in the order of Methods, with [GAP] placeholders where the gold-label run is awaited.

- 4.1 Cohort (180)
  - Eligible patients with a sinus index ECG, patients meeting each exclusion criterion, final one-year cohort, incident events at 1, 2 and 5 years, control follow-up, differential follow-up (E1 to E9, Table 1).
  - Note for the writer: the exclusion counts are not mutually exclusive, so they are not subtracted in a flow diagram. Arithmetic check: 151,941 - 14,469 - 88,945 - 7,481 = 41,046, which differs from the final 43,625 (`cohort_accounting.csv:2-8`); present them as "patients meeting each criterion".
  - Analysis sets: one-year comparison set = all 1,855 cases of `cohort_icd_h365.csv` (label column, value 1) plus controls at 4 per case (`code/core/bench.py:37`), 9,275 patients at prevalence 0.20 (derived; stated in `code/experiments/compute_table1_cis.py:29`); survival set = `cohort_icd_survival.csv`, 4,000 events and 16,000 censored (label column counts; E15).
  - Baseline characteristics (age, sex, covariate distributions by outcome): [GAP-T1]. Not computed: computing them requires running code on `cohort_icd_*.csv`, which C6 forbids.
- 4.2 One-year discrimination (360), the headline
  - Table 2, seven models, AUROC with 95% CI (E10 to E16).
  - Claims, as point estimates with CIs, no significance claim:
    - BTTN + clinical had the highest point AUROC of the seven models, 0.7776 [0.7664, 0.7888] (E15), with BTTN + SSL + clinical at 0.7775 [0.7664, 0.7885] (E16); the clinical model 0.7597 [0.7488, 0.7713] (E10); the CNN 0.735 [0.7226, 0.7469] (E12).
    - ECG-only BTTN 0.7397 [0.7275, 0.7517] (E13) and the CNN 0.735 [0.7226, 0.7469] (E12) reached similar discrimination from the same tensor, with BTTN's ECG evidence passing through the block factors.
    - SSL pretraining: BTTN + SSL 0.7414 [0.7292, 0.7536] (E14).
    - Linear BTTR on the same tensor 0.5967 [0.5824, 0.6115] (E11): the nonlinear, survival-trained block-term network raised AUROC from the linear block-term regressor's value to the CNN's range.
  - [GAP-C4]: paired patient-bootstrap AUROC differences (mean and 95% CI) for BTTN + clinical minus clinical, BTTN + clinical minus CNN, and BTTN minus CNN; source: rerun of `core.bench --source icd --horizon 365` (`code/core/bench.py:163-174`) with the printed deltas saved to a committed file. Placed after the Table 2 claims.
- 4.3 Multi-horizon discrimination from one survival model (190)
  - Table 3 (E20 to E35).
  - Claims: the BTTN + clinical survival model had a higher point AUROC than the clinical Cox model at each horizon: 90 days 0.723 [0.701, 0.745] vs 0.71; 1 year 0.727 [0.711, 0.743] vs 0.711; 2 years 0.74 [0.727, 0.753] vs 0.727; 5 years 0.745 [0.735, 0.755] vs 0.731. ECG-only BTTN 0.658 to 0.676 across horizons. One model gives risk at every horizon without retraining.
  - The file holds no CI for the clinical Cox model; report its values without a CI and say so in the table note.
  - Note for the writer: Table 2 and Table 3 use different analysis sets and clinical comparators (one-year case-control set with logistic regression vs full survival set with penalised Cox), so their one-year values differ (for example clinical 0.7597 in E10 vs 0.711 in E25). State this in the text and do not compare across the two tables.
  - C-index is printed by `code/experiments/multihorizon.py:131-134` and not stored: not reported (harrell1982 not cited).
- 4.4 Calibration, clinical utility and risk stratification (210)
  - Figure 2 (`clin_eval.png`), Table 4 (E36 to E39).
  - Claims: Brier scores 0.039 (BTTN + clinical), 0.0396 (BTTN), 0.0398 (clinical) (E36). At 10% flagged, BTTN + clinical had sensitivity 0.272, specificity 0.908, PPV at true incidence 0.1155, number needed to monitor 8.7, against clinical 0.24, 0.906, 0.1019, 9.8 (E37, E38); full grid in Table 4. Observed one-year AF rate rose from 0.005502751375687844 in the lowest decile to 0.11405702851425713 in the highest decile of the fused model (E40, E41; report as 0.55% and 11.4%, rounding stated in the table note).
  - Decision curve: describe from the viewed figure only qualitatively (the three curves lie above treat-all and treat-none at low thresholds and converge to zero above about 0.1); no number is read off the plot.
  - Note for the writer: the AUROCs in `clin_eval_operating_points.csv` (0.726, 0.666, 0.708) are bootstrap means on Platt-calibrated probabilities and differ slightly from Table 3; cite them only in Table 4.
- 4.5 Faithfulness of the block signatures (160)
  - [GAP-F1] Control probes: Table 5, AUROC with CI and recovery for the five probe sources; source: `faithfulness_controls.csv` from a run whose log shows the icd cohort (n = 9,275, `paper/phase0/paper_configuration_record.md` inventory). Methods 3.8.
  - [GAP-F2] Intervention curve: Figure 4, top-n vs bottom-n removal; source: `intervention_curve.csv` from a gold-label run. Methods 3.8.
  - [GAP-F3] Block-structure ablation: Table 6, block-term vs CP vs full-rank, full AUROC and recovery; source: `ablation_blockstructure.csv` from a gold-label run. Methods 3.8.
  - [GAP-F4] Block-count sweep: Table 6 second panel or supplementary table; source: `ablation_K.csv` from a gold-label run. Methods 3.8.
  - [GAP-F5] Substrate map: Figure 3, frequency and lead occlusion importance and mean block signature; source: `bttn_importance_freq.csv`, `bttn_importance_lead.csv`, `bttn_interpret.png` from a gold-label run. Methods 3.8.
  - Statement allowed now, without a number: the block scores that the probes read exclude the head and the clinical term by construction (`code/core/bttn.py:85-86,160-163,176-177`).
- 4.6 External analyses (150)
  - [GAP-X1] CODE-15 identification and detection AUROC, PTB-XL detection AUROC (5-fold CV values, saved to a committed file), and agreement of the external frequency and lead importances with the MIMIC substrate map; Table 7 and supplementary figure. Methods 3.9. Admission of these files is excluded under C1 until the values are stored and settled.

**Transition to 5**: Discussion interprets the comparison in 4.2 to 4.4 and frames the interpretability claim with the faithfulness results in 4.5.

### 5. Discussion (1,300 words)

**Purpose**: Interpret the findings against prior work, state the interpretability argument and clinical use, and set out the limitations.

- 5.1 Principal findings (200)
  - The fused interpretable model had the highest point AUROC at one year (E15 vs E10, E12); the ECG-only BTTN and the CNN reached similar AUROC from the same tensor (E13, E12); the survival model gave higher point AUROC than the clinical Cox model at every horizon (E22 to E35); calibration and risk gradient (E36, E40, E41). Faithfulness sentence: [GAP-F1 to GAP-F5].
- 5.2 Comparison with AI-ECG and clinical risk models (300)
  - ECG and clinical information are complementary, as in khurshid2022, christopoulos2020, biton2021; the clinical model is a strong comparator, as in alonso2013 and schnabel2009.
  - Place AUROCs beside published values with task differences named (raghunath2021 1-year new-onset; jabbour2024 5-year with MIMIC-IV external; yuan2023 31-day window; attia2019 identification), without claiming superiority across cohorts.
  - Label source: ICD-10 dated outcomes in this study vs report-derived labels in foundation models (nolinlapalme2026, ko2026); detection on MIMIC-IV-ECG near ceiling (mckeen2025) vs the harder incident task.
  - SSL effect small in this setting (E14 vs E13; E16 vs E15), consistent with the modest gains reported by mehari2022 and nolinlapalme2026.
- 5.3 Interpretability by design and its measurement (250)
  - BTTN's ECG evidence passes through A_k and C_k, unlike post-hoc explanations of black boxes (rudin2019, bohle2022, koh2020; contrast hughes2021, storas2023, matsuo2026).
  - The clinical term adds age, sex and ECG measurements without entering the block layer (design fact).
  - Faithfulness: interpretation of [GAP-F1 to GAP-F5] against the leakage concern (mahinpei2021, havasi2022) and the critique in ghassemi2021.
  - Physiological plausibility of frequency and lead signatures against P-wave duration (nielsen2015), P-terminal force in V1 (huang2020, wolder2023) and atrial fibrillatory rate (bollmann2006, platonov2014; no band values cited unless the citation agent checks full text): conditional on [GAP-F5].
  - Distinction from weight-compression block-term networks (ye2020) and from two-stage block-term features (vandenkerchove2025).
- 5.4 Clinical implications (200)
  - Risk-targeted monitoring: operating points and number needed to monitor (E37, E38) against the screening yields reported by noseworthy2022 and the simulated deployment in raghunath2021.
  - A single survival model gives horizon-specific risk (Table 3).
- 5.5 Limitations (350)
  - Single health system (MIMIC-IV, one academic centre, johnson2023); external analyses are identification and detection tasks, not incident prediction ([GAP-X1]); no external dated-outcome cohort.
  - Outcome ascertainment from hospital-admission ICD codes dated by admission time; outpatient diagnoses and undiagnosed AF are missed; I48 includes flutter.
  - Control follow-up is inferred from the last ECG or death; differential follow-up check E8 and E9 (0.981 with a later ECG, 0.965 with a documented AF-free later ECG).
  - Case-control sampling (caps and 4:1 controls) for the one-year comparison; PPV recalibrated to the cohort incidence (3.7) rather than measured.
  - Comparisons rest on point estimates and CIs; paired deltas [GAP-C4]; C-index not reported.
  - SSL pool sampled from all MIMIC-IV-ECG patients without labels (`code/core/ssl_pretrain.py:33-36`), so it may include ECGs of cohort patients; no outcome information enters pretraining.
  - Preprocessing uses a 50 Hz notch (`code/core/preprocess.py:29`) on recordings from a 60 Hz mains region; state as a design fact and its possible effect on high-frequency bins (judgment; settled only by a rerun).
  - Baseline characteristics table [GAP-T1].
  - Future work folded in here: external dated-outcome validation, prospective evaluation.

**Transition to 6**: The Conclusion restates the contribution in one paragraph.

### 6. Conclusion (300 words)

**Purpose**: Restate the answer to the research question from the admitted results: an interpretable block-term network, fused with clinical risk factors, reached the highest point AUROC of the models compared for one-year incident AF on gold ICD-10 labels (E15, E10, E12), gave horizon-specific risk from one survival model (Table 3), and exposes frequency and lead signatures whose faithfulness is measured ([GAP-F1 to GAP-F5]). No new claims.

### Back matter (not counted)

- Data availability: MIMIC-IV-ECG v1.0 (gow2023, doi:10.13026/4nqg-sb35) and the MIMIC-IV hospital module (johnson2023) under credentialed PhysioNet access (goldberger2000); CODE-15 (ribeiro2021code15) and PTB-XL (wagner2020) for the external analyses; no raw data redistributed (`code/README.md:62-64`). Code under the MIT license (`code/LICENSE`, `code/README.md:68`); repository URL or archive DOI: [GAP].
- Ethics: [GAP] (`paper/config.md:26`): approval, consent waiver, de-identification and data use agreement wording.
- Author contributions (CRediT): [GAP] (`paper/config.md:23`).
- Conflicts of interest: [GAP] (`paper/config.md:25`).
- Funding: [GAP] (`paper/config.md:24`).
- AI-use disclosure: written by the formatter (C7): AI agents of the `academic-paper` skill were used for literature search, outlining and drafting; authors' verification statement [GAP] until authors are named.
- Supplementary: TRIPOD+AI checklist (collins2024); Table S1 hyperparameters from the code lines cited in 3.3 to 3.6; supplementary figure for external importances [GAP-X1].

## Tables and figures

| Item | Content | Source | Status |
|---|---|---|---|
| Table 1 | Cohort derivation and follow-up, binary one-year and survival cohorts | `code/results/cohort_accounting.csv:2-40` (columns cohort, metric, value), `code/results/cohort_flow.txt:1-42` | Ready. Baseline characteristics rows [GAP-T1] |
| Table 2 | One-year AUROC with 95% CI, seven models | `code/results/table1_cis.csv:2-8` (columns model, auroc, ci_lo, ci_hi) | Ready; paired-delta column [GAP-C4] |
| Table 3 | Multi-horizon AUROC, BTTN, BTTN + clinical, clinical Cox | `code/results/multihorizon_icd_spectral.csv:2-5` (columns horizon, n_eval, n_pos, BTTN, BTTN_lo, BTTN_hi, BTTN_clin, BTTN_clin_lo, BTTN_clin_hi, clinical) | Ready |
| Table 4 | Operating points at 5, 10, 20, 30% flagged | `code/results/clin_eval_operating_points.csv:2-13` (columns model, auroc, ci, flagged_bal, sens, spec, ppv_true, nnm, brier) | Ready |
| Table 5 | Faithfulness control probes | `faithfulness_controls.csv` from a gold-label run | [GAP-F1] |
| Table 6 | Block-structure ablation and block-count sweep | `ablation_blockstructure.csv`, `ablation_K.csv` from gold-label runs | [GAP-F3], [GAP-F4] |
| Table 7 | External analyses | stored CV AUROCs and importances, CODE-15 and PTB-XL | [GAP-X1] |
| Table S1 | Hyperparameters | code lines cited in Methods 3.3 to 3.6 | Ready (design facts) |
| Figure 1 | Model schematic: spectral tensor, block factors A_k and C_k, temporal convolutions with attention and max pooling, MLP head, additive clinical term, Cox loss | New: `code/figures/pipeline_overview.py` corrected (see Schematic verdicts) and delivered as plotting code, not run (C6) | [GAP-FIG1]: rendering pending |
| Figure 2 | Calibration (1-yr), decision curve, observed AF by fused-model risk decile | `code/results/clin_eval.png` (admitted, viewed) | Ready |
| Figure 3 | Substrate map | `bttn_interpret.png` from a gold-label run | [GAP-F5] |
| Figure 4 | Intervention curve | plot of `intervention_curve.csv` from a gold-label run | [GAP-F2] |

## Schematic verdicts (viewed against `code/core/bttn.py`)

| File | What it shows | Mismatch with `code/core/bttn.py` | Verdict |
|---|---|---|---|
| `pipeline_overview.png` | Six stages: 12-lead ECG, F x T x L spectral tensor, block factors A_k and C_k with a box labelled G_k, multi-scale convolution and attention pooling, BTTN head eta_ECG plus w^T c on "age, sex, ECG intervals", Cox partial likelihood with risk at 1/2/5 yr; footer says fusion leaves the factors and the probe unchanged | (1) Draws a core tensor G_k; BTTN has no learned core, block k is the projection onto A_k and C_k only (`bttn.py:65-66,77-83`). (2) Pooling is attention concatenated with max pooling (`bttn.py:94-95,100`); only attention is drawn. (3) The covariate box omits the QT and the three axes (`bench.py:30`). (4) The footer says fusion leaves the factors unchanged; in joint training the factor values are learned with the clinical term present, what is unchanged is the structure: the clinical term does not enter the block layer or the block scores (`bttn.py:176-177`). (5) The "freq F x r_f" label overlaps the C_k factor drawing | Not used. Basis for Figure 1 after correcting the five points in `code/figures/pipeline_overview.py` (lines 85, 98, 107, 128 among them), delivered as code not run |
| `bttn_architecture.png` | Linear boxes: ECG, spectrogram, block-term layer, "per-block tokens + temporal attention pooling", "Transformer / MLP head", Cox survival; note "+ SSL pretraining, + optional multi-task"; a read-out box saying "faithful by construction" and naming 4-10 Hz f-wave and V1 | Per-block tokens and a Transformer head belong to a non-default head type that no reported model uses (`bttn.py:96-99,136-141`; `bench.py:103-119` uses the MLP head); multi-task head not used; no clinical term drawn; "faithful by construction" and the named band and lead are result claims with no admitted source; no script in `code/` writes this file; title contains an em dash | Not used |
| `bttr_vs_bttn.png` | Top: BTTR as sum of blocks with P factors, core G_k and score vectors, linear prediction. Bottom: BTTN blocks with A_k, C_k, a core G_k and multi-scale convolution, then "attention over blocks", nonlinear head, Cox risk | (1) Core G_k drawn in each BTTN block; none exists. (2) "Attention over blocks"; the code applies softmax attention over time (`bttn.py:72,94`), and pooling over blocks exists only in the unused transformer head. (3) Max pooling missing. (4) Top panel credits BTTR to "Faes 2022", while the vendored baseline is the BTTR of faes2024 (`paper/phase1/annotated_bibliography.md` entry 28) | Not used |

## Evidence map: result numbers

Every value is copied exactly from the admitted file. "Row" is the file line number (header = line 1).

| ID | Section | File | Row | Column (or metric) | Value |
|---|---|---|---|---|---|
| E1 | 4.1, Table 1 | `cohort_accounting.csv` | 2 | binary_h365 eligible_sinus_index_patients | 151941.0 |
| E2 | 4.1, Table 1 | `cohort_accounting.csv` | 3 | binary_h365 excluded_prevalent_concurrent_AF | 14469.0 |
| E3a | 4.1, Table 1 | `cohort_accounting.csv` | 4 | binary_h365 excluded_inadequate_followup_controls | 88945.0 |
| E3b | 4.1, Table 1 | `cohort_accounting.csv` | 5 | binary_h365 excluded_onset_beyond_horizon | 7481.0 |
| E4 | 4.1, Table 1 | `cohort_accounting.csv` | 6, 7, 8 | binary_h365 final_positives, final_controls, final_total | 1855.0, 41770.0, 43625.0 |
| E5 | 3.7, 4.1 | `cohort_accounting.csv` | 6 | binary_h365 final_positives | 1855.0 |
| E6 | 3.7, 4.1 | `cohort_accounting.csv` | 7 | binary_h365 final_controls | 41770.0 |
| E7 | 4.1, Table 1 | `cohort_accounting.csv` | 10, 11, 12 | incident_events_1yr, _2yr, _5yr | 1855.0, 2828.0, 5262.0 |
| E7b | 4.1, Table 1 | `cohort_accounting.csv` | 13, 14, 15 | control_median_followup_days, q25, q75 | 1601.0, 880.0, 2559.0 |
| E8 | 4.1, 5.5 | `cohort_accounting.csv` | 19 | binary_h365 controls_frac_with_later_ecg | 0.981 |
| E9 | 4.1, 5.5 | `cohort_accounting.csv` | 21 | binary_h365 controls_frac_documented_AFfree_later | 0.965 |
| E9b | Table 1 | `cohort_accounting.csv` | 25, 26, 27 | survival final_positives, final_controls, final_total | 8775.0, 41770.0, 50545.0 |
| E9c | 4.1 | `cohort_flow.txt` | 1, 23 | header source | source=icd |
| E9d | 4.1 | `cohort_icd_h365.csv` | 2-17856 | label (count of 1 / 0) | 1855 / 16000 |
| E9e | 4.1 | `cohort_icd_survival.csv` | 2-20001 | label (count of 1 / 0) | 4000 / 16000 |
| E9f | 3.2 | `cohort_icd_h1825.csv` | 2-20001 | label (count of 1 / 0) | 4000 / 16000 (five-year cohort file; no committed five-year result, so cited only in Methods if at all) |
| E10 | 4.2, Abstract | `table1_cis.csv` | 2 | clinical (age/sex + ECG intervals): auroc, ci_lo, ci_hi | 0.7597, 0.7488, 0.7713 |
| E11 | 4.2 | `table1_cis.csv` | 3 | plain BTTR (spectral) | 0.5967, 0.5824, 0.6115 |
| E12 | 4.2, Abstract | `table1_cis.csv` | 4 | CNN (black-box) | 0.735, 0.7226, 0.7469 |
| E13 | 4.2, Abstract | `table1_cis.csv` | 5 | conv-BTTN (ECG-only) | 0.7397, 0.7275, 0.7517 |
| E14 | 4.2, 5.2 | `table1_cis.csv` | 6 | conv-BTTN + SSL | 0.7414, 0.7292, 0.7536 |
| E15 | 4.2, Abstract, 5.1, 6 | `table1_cis.csv` | 7 | conv-BTTN + clinical | 0.7776, 0.7664, 0.7888 |
| E16 | 4.2, 5.2 | `table1_cis.csv` | 8 | conv-BTTN + SSL + clinical (full) | 0.7775, 0.7664, 0.7885 |
| E17 | 3.7 | `table1_cis.csv` | 2-8 | n_boot | 2000 |
| E20 | Table 3 | `multihorizon_icd_spectral.csv` | 2 | horizon, n_eval, n_pos | 90-day onset (post-blank), 20000, 410 |
| E21 | 4.3 | `multihorizon_icd_spectral.csv` | 2 | BTTN, BTTN_lo, BTTN_hi | 0.658, 0.632, 0.684 |
| E22 | 4.3 | `multihorizon_icd_spectral.csv` | 2 | BTTN_clin, BTTN_clin_lo, BTTN_clin_hi; clinical | 0.723, 0.701, 0.745; 0.71 |
| E23 | Table 3 | `multihorizon_icd_spectral.csv` | 3 | horizon, n_eval, n_pos | 1yr, 19986, 838 |
| E24 | 4.3 | `multihorizon_icd_spectral.csv` | 3 | BTTN, BTTN_lo, BTTN_hi | 0.666, 0.647, 0.684 |
| E25 | 4.3, Abstract | `multihorizon_icd_spectral.csv` | 3 | BTTN_clin, BTTN_clin_lo, BTTN_clin_hi; clinical | 0.727, 0.711, 0.743; 0.711 |
| E26 | Table 3 | `multihorizon_icd_spectral.csv` | 4 | horizon, n_eval, n_pos | 2yr, 16982, 1299 |
| E27 | 4.3 | `multihorizon_icd_spectral.csv` | 4 | BTTN, BTTN_lo, BTTN_hi | 0.674, 0.659, 0.688 |
| E28 | 4.3 | `multihorizon_icd_spectral.csv` | 4 | BTTN_clin, BTTN_clin_lo, BTTN_clin_hi; clinical | 0.74, 0.727, 0.753; 0.727 |
| E33 | Table 3 | `multihorizon_icd_spectral.csv` | 5 | horizon, n_eval, n_pos | 5yr, 11007, 2425 |
| E34 | 4.3 | `multihorizon_icd_spectral.csv` | 5 | BTTN, BTTN_lo, BTTN_hi | 0.676, 0.665, 0.687 |
| E35 | 4.3, Abstract | `multihorizon_icd_spectral.csv` | 5 | BTTN_clin, BTTN_clin_lo, BTTN_clin_hi; clinical | 0.745, 0.735, 0.755; 0.731 |
| E36 | 4.4 | `clin_eval_operating_points.csv` | 2, 6, 10 | brier (BTTN+clin, BTTN, clinical) | 0.039, 0.0396, 0.0398 |
| E37 | 4.4, 5.4 | `clin_eval_operating_points.csv` | 3 | BTTN+clin at flagged_bal 10%: sens, spec, ppv_true, nnm | 0.272, 0.908, 0.1155, 8.7 |
| E38 | 4.4, 5.4 | `clin_eval_operating_points.csv` | 11 | clinical at flagged_bal 10%: sens, spec, ppv_true, nnm | 0.24, 0.906, 0.1019, 9.8 |
| E39 | Table 4 | `clin_eval_operating_points.csv` | 2-13 | model, auroc, ci, flagged_bal, sens, spec, ppv_true, nnm, brier | all twelve rows as in the file |
| E40 | 4.4, Abstract | `risk_strata.csv` | 2 | decile 0: n, observed_rate | 1999, 0.005502751375687844 |
| E41 | 4.4, Abstract | `risk_strata.csv` | 11 | decile 9: n, observed_rate | 1999, 0.11405702851425713 |
| E42 | Figure 2 | `clin_eval.png` | n/a | viewed: three panels, legend Brier 0.039 / 0.040 / 0.040, dashed line "cohort prev 0.04" | figure used as is; numbers in text come from E36, E40, E41 |

Derived value (stated as derived, with its inputs): one-year comparison set 9,275 patients at prevalence 0.20 = 1,855 cases (E9d) + 4 x 1,855 controls (`code/core/bench.py:37`, `--neg_ratio 4`); matches `code/experiments/compute_table1_cis.py:29`.

## Evidence map: cited sources by section

Stance: S = supports, O = opposes in part, N = neutral.

| Section | Bib keys (stance) | Use |
|---|---|---|
| 1.1 | kornej2020 (N), noseworthy2022 (S), hindricks2021 (N, after full-text check) | Burden; screening use case |
| 1.2 | schnabel2009 (S), alonso2013 (S), attia2019 (S), raghunath2021 (S), khurshid2022 (S), christopoulos2020 (S), biton2021 (S), jabbour2024 (S), yuan2023 (N) | Clinical and AI-ECG state of the art |
| 1.3 | hughes2021 (N), storas2023 (S), matsuo2026 (S), adebayo2018 (S), hooker2019 (S), rudin2019 (S), ghassemi2021 (O) | Interpretability gap |
| 2.1 | delathauwer2008 (N), kolda2009 (N), zhao2013 (N), camarrone2019 (N), faes2022 (N), faes2024 (N), hunyadi2014 (N), goulart2020 (N), kim2017 (N), vandenkerchove2025 (N), ye2018 (N), li2017btnets (N), ye2020 (N), dooms2025 (N) | Block-term and multilinear prior art |
| 2.2 | koh2020 (S), bohle2022 (S), mahinpei2021 (S), havasi2022 (S), jacovi2020 (N), adebayo2018 (S), hooker2019 (S), sundararajan2017 (N), jeong2021 (N) | Interpretable design and faithfulness tests |
| 3.1 | gow2023 (N), johnson2023 (N), goldberger2000 (N), collins2024 (N) | Data, reporting |
| 3.2 | nielsen2015 (S), hindricks2021 (N, only if full text supports an ICD-based definition) | Covariates; outcome |
| 3.3 | jeong2021 (N) | Time-frequency input |
| 3.4 | kolda2009 (N), delathauwer2008 (N), cox1972 (N), katzman2018 (N), kvamme2019 (N), chen2020simclr (N), kiyasseh2021 (S), mehari2022 (S) | Model, loss, SSL |
| 3.6 | schnabel2009, alonso2013, khurshid2022 (S); faes2024, faes2022, camarrone2019 (N); yokota2014 (N, optional, only if the ACE rank-estimation step of the BTTR baseline is described); attia2019, raghunath2021 (S) | Comparators |
| 3.7 | hanley1982 (N), carpenter2000 (N), vancalster2019 (N), vickers2006 (N) | Statistics, calibration, utility |
| 3.8 | jacovi2020 (N), mahinpei2021 (S), havasi2022 (S), adebayo2018 (S), hooker2019 (S) | Faithfulness protocol |
| 3.9 | ribeiro2021code15 (N), ribeiro2020 (N), wagner2020 (N) | External datasets |
| 5.2 | khurshid2022, christopoulos2020, biton2021, alonso2013, schnabel2009, raghunath2021, jabbour2024, yuan2023, attia2019 (S); nolinlapalme2026, ko2026, mckeen2025 (N); mehari2022 (S); hammer2022 (S) | Comparison with prior work |
| 5.3 | rudin2019, bohle2022, koh2020 (S); hughes2021 (N); storas2023, matsuo2026 (S); mahinpei2021, havasi2022 (S); ghassemi2021 (O); nielsen2015, huang2020, wolder2023 (S); bollmann2006, platonov2014 (N, no band values without full-text check); ye2020, vandenkerchove2025 (N) | Interpretability argument, plausibility |
| 5.4 | noseworthy2022 (S), raghunath2021 (S) | Clinical use |
| 5.5 | johnson2023 (N) | Single-centre limitation |
| Back matter | gow2023, johnson2023, goldberger2000, ribeiro2021code15, wagner2020, collins2024 | Data availability, TRIPOD+AI |

Assignment check: 67 of the 68 keys in `paper/phase1/references.bib` are assigned. harrell1982 is not assigned, because no C-index is reported (`paper/phase1/annotated_bibliography.md` entry 54: "only where a C-index is reported").

## [GAP] list

| ID | Where in Results | Methods subsection | What fills it | Decision |
|---|---|---|---|---|
| GAP-C4 | 4.2, after Table 2 claims; Table 2 delta column | 3.7 | Paired patient-bootstrap AUROC deltas from a gold-label `core.bench` run, saved to a committed file | C4 |
| GAP-F1 | 4.5, Table 5 | 3.8 | `faithfulness_controls.csv` from a run established as icd | C2 |
| GAP-F2 | 4.5, Figure 4 | 3.8 | `intervention_curve.csv` from a gold-label run | C2 |
| GAP-F3 | 4.5, Table 6 | 3.8 | `ablation_blockstructure.csv` from a gold-label run | C2 |
| GAP-F4 | 4.5, Table 6 | 3.8 | `ablation_K.csv` from a gold-label run | C2 |
| GAP-F5 | 4.5, Figure 3; 5.3 plausibility paragraph | 3.8 | `bttn_importance_freq.csv`, `bttn_importance_lead.csv`, `bttn_interpret.png` from a gold-label run | C2 |
| GAP-X1 | 4.6, Table 7, supplementary figure; 5.5 | 3.9 | Stored 5-fold CV AUROCs and importances for CODE-15 and PTB-XL | C3 |
| GAP-T1 | 4.1, Table 1 characteristics rows | 3.2 | Descriptive statistics of `cohort_icd_h365.csv` and `cohort_icd_survival.csv` by outcome; requires running code (C6) | outline finding |
| GAP-FIG1 | Figure 1 | 3.4, 3.5 | Corrected `code/figures/pipeline_overview.py`, rendered | C6 |
| Back matter | Declarations | n/a | Authors and affiliations, ethics, CRediT, COI, funding, code repository URL, authors' AI-use verification | `paper/config.md:22-26` |

## Word count summary

| Section | Target words | Share |
|---|---|---|
| 1 Introduction | 850 | 13.1% |
| 2 Related work | 700 | 10.8% |
| 3 Methods | 2,100 | 32.3% |
| 4 Results | 1,250 | 19.2% |
| 5 Discussion (incl. 5.5 Limitations 350) | 1,300 | 20.0% |
| 6 Conclusion | 300 | 4.6% |
| Total body | 6,500 | 100% |
| Abstract (not counted) | 250 | |

Subsection sums: 1 = 200 + 250 + 250 + 150; 2 = 350 + 350; 3 = 180 + 280 + 170 + 480 + 150 + 200 + 250 + 240 + 150; 4 = 180 + 360 + 190 + 210 + 160 + 150; 5 = 200 + 300 + 250 + 200 + 350. Every lowest-level heading has at least 150 words. Methods exceeds the 15% template share because it carries the model definition and the faithfulness protocol; no section exceeds 35%.

## Points where the admitted files cannot support the research question

1. "More accurately than": the admitted files give point estimates and CIs only. BTTN + clinical has the highest point AUROC (E15) but its CI overlaps the clinical model's CI (E10); with no paired deltas (GAP-C4) the paper cannot claim the difference is beyond sampling variation. The plan states point estimates with CIs.
2. "Are those signatures faithful": no admitted file holds a faithfulness result. The whole second half of the question is [GAP-F1 to F5].
3. Horizons beyond one year: only the survival BTTN, BTTN + clinical and clinical Cox models are in an admitted file; the CNN and the SSL variants have no multi-horizon result, and the clinical Cox values have no CI. The five-year seven-model comparison is not committed.
4. Baseline characteristics cannot be reported without running code (GAP-T1).
5. External validation has no admitted file (GAP-X1), and even when filled it addresses identification and detection, not incident prediction.
6. No schematic in `code/results/` matches `code/core/bttn.py`; Figure 1 needs a corrected rendering (GAP-FIG1).

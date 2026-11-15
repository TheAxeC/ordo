## Paper outline

### Structure: IMRaD

### Overview

The paper type in `config.md` is IMRaD (original analysis of the project's own results), so the IMRaD skeleton applies, written for a journal paper in Artificial Intelligence in Medicine at 6,500 words. The paper moves from the clinical need (incident atrial fibrillation (AF) raises stroke risk, and the ECG models that predict it are black boxes explained after the fact) to the gap (no model places readable block-term frequency and lead factors on the predictive path of a survival network for incident AF, and few studies define incident AF from hospital ICD diagnoses in MIMIC-IV). The Method section defines the Block-Term Tensor Network (BTTN) and its separate linear clinical term, with a schematic of BTTN beside linear block-term regression (BTTR). The Experiments section defines the gold-label cohort, the protocol and the occlusion readout. The Results report, on ICD-coded labels only, the cohort, the one-year discrimination against a clinical model, a CNN and BTTR, the discrimination of one survival model at four horizons, calibration, risk stratification and operating points, and the beat-aligned occlusion profile of the ECG term. The Discussion places these results beside published incident-AF models and beside the cohort literature on the PR interval and P-wave indices, and states the scope of the work, including the measured accuracy of ICD-coded AF.

This version assigns the 15 sources the literature strategist found for the three items marked "needs literature" (4.3, 6.2, 6.3) and applies the six planner decisions recorded under Decisions in `config.md`: the narrowed research question, the Method figure `bttr_vs_bttn.png`, the exclusion counts against the eligible total, the one-year sample as a design count, age as `anchor_age` with a limitation, and a data availability statement without CODE-15 and PTB-XL.

Proposed title: "An interpretable block-term tensor network with a separate clinical term for predicting incident atrial fibrillation from one sinus-rhythm 12-lead ECG".

Research question as the paper answers it (planner decision 1 of `config.md`): "Can an interpretable block-term tensor network, whose ECG evidence passes through readable frequency-and-lead block factors and whose age, sex and ECG-interval risk factors enter through a separate linear term, predict incident AF from one sinus-rhythm 12-lead ECG in MIMIC-IV-ECG on ICD-coded labels more accurately than a clinical risk-factor model and a CNN, and where in the cardiac cycle does its ECG evidence lie?" The paper reports no faithfulness number.

### Structure check

Each indicator of the page was tested.

- Causal research question against a Literature Review structure: the question is predictive, and the structure is IMRaD. No mismatch.
- Materials without data or results against IMRaD: the Materials in hand row holds committed result files. No mismatch.
- One case studied in depth against a Policy Brief: not applicable. No mismatch.
- Length far below the type: 6,500 words is within the usual length of an IMRaD journal article. No mismatch.

Other mismatch found:

- **The faithfulness clause of the research question in `config.md` has no gold-label material.** The analyses that would answer it (the linear-probe recovery with its control probes, the removal of top-ranked against bottom-ranked factors, the block-structure ablation, the block-count sweep, and the frequency and lead occlusion map) are in files whose label source the committed files do not establish (see "Analyses left out", items 1 to 6). The structure stays IMRaD; the mismatch is between the question and the materials. Alternatives:
  1. Keep IMRaD with the question narrowed to the accuracy clause and the cardiac-cycle clause, which gold-label files answer. Readability of the factors is claimed by construction only.
  2. Produce the interpretability analyses again on the ICD cohort into files that name their source, and add a Results subsection "Faithfulness of the block factors" (about 250 words, taken from 5.2 and 6.2), which restores the question as `config.md` states it.
  - Ruling: alternative 1, recorded as planner decision 1 under Decisions in `config.md`, since the rerun of alternative 2 is excluded by the user's instruction that nothing is run. This outline is written to alternative 1.

### Detailed outline

#### Abstract (about 250 words, not counted in the total)
**Purpose**: State the problem, the model, the gold-label design and the main results with their intervals.
**Content**:
- Background: incident AF prediction from the sinus ECG with explanations that are post hoc; need for a model readable by design.
- Method: BTTN on a frequency by time by lead spectral tensor, Cox objective, separate linear clinical term; MIMIC-IV-ECG with incident AF from ICD-coded hospital diagnoses.
- Results: one-year AUROC of the fused model 0.7776 [0.7664, 0.7888] against 0.7597 [0.7488, 0.7713] for the clinical model and 0.7350 [0.7226, 0.7469] for the CNN; ECG-only BTTN 0.7397 [0.7275, 0.7517] beside the CNN; one survival model at 90 days to 5 years 0.723 to 0.745; top-decile observed one-year AF 11.4 percent against 0.55 percent in the bottom decile; occlusion response per unit energy highest in the PR window.
- Conclusion scoped to MIMIC-IV.
**Sources**: none (the abstract cites nothing).
**Key arguments**: the thesis in one sentence each for accuracy, horizons, clinical use and the cardiac-cycle readout.

#### 1. Introduction (about 975 words)
**Purpose**: Establish why incident AF prediction from one sinus ECG matters, why a readable model is needed, what is missing, and what this paper contributes.
**Content**:
- 1.1 Context and problem (about 350 words)
  - AF and stroke risk and the rising recorded burden [@Wolf_1991; @Schnabel_2015]; the guideline position that the clinical performance of AI tools for AF is not yet known [@Van_Gelder_2024].
  - Deep networks on the sinus ECG predict new-onset AF [@Raghunath_2021], and ECG and clinical risk factors are complementary [@Khurshid_2022]; clinical models such as CHARGE-AF are the comparator [@Alonso_2013].
  - Reported discrimination depends on the outcome window and on label quality [@Tsiartas_2025].
- 1.2 Research gap (about 300 words)
  - The models are black boxes explained after the fact, and commentary and reviews name interpretability as a barrier [@Kashou_2021; @Saiz_Vivo_2025]; ECG attribution methods disagree and are weakly tied to model weights [@Arends_2026]; the alternative is a model interpretable by design [@Rudin_2019].
  - No published model places readable block-term frequency and lead factors on the predictive path of a survival network for incident AF (gap 2 of the review).
- 1.3 Purpose, research question and contribution (about 325 words)
  - The research question as stated in the Overview.
  - Contributions, each stated once: (i) BTTN, a survival network whose ECG evidence passes through block-term frequency and lead factors, with a separate linear clinical term that leaves those factors unchanged; (ii) an incident-AF cohort in MIMIC-IV-ECG defined from ICD-coded hospital diagnoses with a 30-day blanking window, reported with its exclusion counts; (iii) one-year discrimination against a clinical model, a CNN and linear BTTR under one protocol, and discrimination at four horizons from one survival model; (iv) calibration, risk stratification and operating points; (v) a beat-aligned, energy-normalised occlusion profile of the ECG term.
**Sources**: Wolf_1991, Schnabel_2015, Van_Gelder_2024, Raghunath_2021, Khurshid_2022, Alonso_2013, Tsiartas_2025, Kashou_2021, Saiz_Vivo_2025, Arends_2026, Rudin_2019.
**Key arguments**: incident AF prediction is clinically useful; current models are not readable; a model readable by design that keeps accuracy is missing for this task.
**Transition to next**: The introduction ends on the contributions; Related work then sets out what each strand of prior work has shown, so the reader sees where each contribution sits. The connecting theme is prediction accuracy against readability.

#### 2. Related work (about 1,625 words)
**Purpose**: Review the four strands the paper builds on and close with the gap.
**Content**:
- 2.1 AI-ECG prediction of incident AF (about 500 words)
  - Identification of patients with prior or concurrent AF from a sinus ECG [@Attia_2019] and near-term 31-day windows [@Yuan_2023] are a different task from dated incidence; the review's window effect [@Tsiartas_2025].
  - Dated incidence: 1-year new-onset AF [@Raghunath_2021]; 5-year with external validation in MIMIC-IV [@Jabbour_2024]; survival-loss and image models on the hospital behind MIMIC-IV [@Sau_2026; @Zeidaabadi_2026]; Brazilian telehealth cohorts [@Habineza_2023; @Ribeiro_2020]; feature-based survival models [@Riek_2026].
  - Explanations in these studies are post-hoc saliency or feature importance, which pointed to the P-wave and PR interval [@Khurshid_2022; @Zeidaabadi_2026; @Riek_2026].
- 2.2 Clinical risk models and their combination with the ECG (about 350 words)
  - CHARGE-AF and the Framingham score, with the PR interval among the Framingham predictors [@Alonso_2013; @Schnabel_2009].
  - ECG intervals measured in sinus rhythm as AF predictors: each 20 ms of PR interval carried an adjusted hazard ratio of 1.12 for AF in Framingham [@Cheng_2009]; P-wave duration above 120 ms was associated with AF across Framingham and ARIC but added little discrimination beyond risk factors [@Magnani_2015]. This motivates the ECG intervals in the clinical term.
  - Comparable and complementary ECG and clinical information [@Khurshid_2022; @Christopoulos_2020; @Khurshid_2025]; fused deep features with clinical data [@Biton_2021]; ranking depends on the cohort [@Sau_2026].
- 2.3 Interpretable models and post-hoc explanation (about 450 words)
  - Post-hoc explanation limits: sanity checks [@arxiv_1810_03292], removal-based evaluation [@arxiv_1806_10758], ECG attribution [@Arends_2026]; the dataset-level counterweight [@Wagner_2024].
  - Interpretable by design: concept bottlenecks [@arxiv_2007_04612] and their leakage [@arxiv_2106_13314]; B-cos networks [@arxiv_2205_10268; @arxiv_2507_16761]; multilinear tensor-network structure [@arxiv_2504_02667]; the reported accuracy cost of intrinsic ECG interpretability [@Patlatzoglou_2025].
- 2.4 Block-term tensor models (about 325 words)
  - Block-term decomposition as compression in block-term tensor neural networks, whose factors are not read [@Ye_2020] (state here that BTTN is a different model despite the similar name); source separation of AF ECG [@Goulart_2020]; supervised block-term regression and discriminant analysis on brain signals [@Faes_2024; @arxiv_2511_04292]; linear block-term regression for AF identification on the median beat [@https://doi.org/10.5281/zenodo.22227432], cited for its model and task only, with none of its PTB-XL results (claim (c) of `config.md`).
  - Gap stated at the end of the section: no model trains readable block-term frequency and lead factors end to end with a survival objective for incident AF, with clinical factors kept outside the factor layer.
**Sources**: Attia_2019, Yuan_2023, Tsiartas_2025, Raghunath_2021, Jabbour_2024, Sau_2026, Zeidaabadi_2026, Habineza_2023, Ribeiro_2020, Riek_2026, Khurshid_2022, Alonso_2013, Schnabel_2009, Cheng_2009, Magnani_2015, Christopoulos_2020, Khurshid_2025, Biton_2021, arxiv_1810_03292, arxiv_1806_10758, Arends_2026, Wagner_2024, arxiv_2007_04612, arxiv_2106_13314, arxiv_2205_10268, arxiv_2507_16761, arxiv_2504_02667, Patlatzoglou_2025, Ye_2020, Goulart_2020, Faes_2024, arxiv_2511_04292, https://doi.org/10.5281/zenodo.22227432.
**Key arguments**: the ECG carries incident-AF information; ECG intervals are known AF predictors; ECG and clinical factors add to each other; post-hoc explanation is unreliable; block-term structure has been read in other tasks but not placed on a survival network's predictive path for incident AF.
**Transition to next**: The gap names a model; the Method section defines it, so the reader knows what is readable in BTTN and what the clinical term adds before the cohort and protocol are described. The connecting theme is where the readable factors sit in the model.

#### 3. Method (about 975 words)
**Purpose**: Define BTTN, its objective and its clinical term precisely enough to reproduce.
**Content**:
- 3.1 Spectral tensor and block-term layer (about 350 words)
  - Each 10-second ECG becomes a log-magnitude spectrogram per lead up to 40 Hz on 40 time frames, giving a frequency by time by lead tensor (read `core/preprocess.py`, `_spectral` and `build_spectral_tensor`, for the window, hop and resampling).
  - The block-term layer has K = 12 blocks; block k projects the tensor onto a frequency factor A_k (rank 3) and a lead factor C_k (rank 2) [@De_Lathauwer_2008; @Kolda_2009] (read `core/bttn.py`, `BlockTermLayer`, lines 36 to 100).
  - The relation to linear BTTR [@Faes_2024]: same block structure, trained end to end by gradient instead of deflation, with learned temporal kernels in place of a static score vector, a nonlinear head in place of a linear score, and a Cox objective in place of least squares. Figure `bttr-to-bttn` shows the two models one above the other.
- 3.2 Temporal convolution, pooling, head and survival objective (about 300 words)
  - Multi-scale temporal convolution per block (kernel sizes 3, 7, 15), then temporal attention pooling and max pooling along time, concatenated (`BlockTermLayer.forward`, lines 93 to 100), then a multilayer head (`head_type="mlp"`, the default of `bttn_fold` and `train_model`, used by every reported run); Cox partial likelihood [@Cox_1972] trained inside the network as in DeepSurv [@Katzman_2018], as other AF survival models do [@Sau_2026].
  - Training: Adam, cosine schedule, 85/15 internal validation split with early stopping on validation AUROC, three-member seed ensemble per fold (read `core/bttn.py`, `train_model`, `_bttn_train_one`, `bttn_fold`).
- 3.3 The clinical term and the readable factors (about 325 words)
  - The clinical term is a linear function of age, sex, RR interval, P-wave duration, QRS duration, QT interval and P, QRS and T axes, added to the head's log-risk after the block layer, initialised from a logistic fit and kept out of weight decay (read `core/bench.py`, `CLIN_COLS` line 30, and `core/bttn.py`, `cov`, lines 128 to 135 and 240 to 252). Age is the MIMIC-IV anchor age (planner decision 5). The PR interval is not among the factors.
  - Readability by construction: the per-block frequency factor and lead factor are parameters on the predictive path and are read directly; the clinical term does not pass through them. This is stated as a property of the architecture, with no claim of measured faithfulness.
**Sources**: De_Lathauwer_2008, Kolda_2009, Faes_2024, Cox_1972, Katzman_2018, Sau_2026.
**Key arguments**: BTTN keeps block-term factors on the predictive path and adds the capacity linear BTTR lacks; the clinical term leaves the factors unchanged.
**Transition to next**: With the model defined, the Experiments section states the data, the label source and the comparisons, so the reader can judge the results that follow. The connecting theme is the gold-label design.

#### 4. Experiments (about 575 words)
**Purpose**: Define the cohort, the gold labels, the baselines, the cross-validation protocol, the metrics and the occlusion readout.
**Content**:
- 4.1 Cohort and labels (about 225 words)
  - MIMIC-IV-ECG [@https://doi.org/10.13026/4nqg-sb35] linked to the MIMIC-IV hospital module [@Johnson_2023]. Incident AF is the first hospital admission with an AF or flutter diagnosis (ICD-10 I48, or ICD-9 427.31 or 427.32 for older admissions; `core/config.py` lines 52 to 53), dated by its admission time. AF and flutter codes are counted together, since a coded flutter diagnosis did not reliably separate flutter from AF in a registry validation [@Rix_2012]. The index ECG is each patient's earliest sinus-rhythm ECG with no AF before it. A 30-day blanking window excludes concurrent AF. Cases have onset in (index + 30 days, index + 365 days]; controls have no AF diagnosis ever and at least 365 days of follow-up, where follow-up ends at the later of the last ECG and death. The survival design keeps onset at any time after 30 days. State the reason for hospital diagnoses over machine-read ECG labels [@Valasakis_2026].
  - Modelling samples (planner decision 4): for the one-year comparison, the design count of all 1,855 cases with four controls per case drawn from the 16,000 controls of the modelling file (9,275 patients by design); for the survival model, 4,000 sampled events and 16,000 sampled controls (20,000 patients).
- 4.2 Baselines, protocol and metrics (about 200 words)
  - Baselines: logistic clinical model on the same risk factors as the clinical term; linear BTTR [@Faes_2024]; a three-layer 1D CNN on the same spectral tensor with frequency and lead flattened into channels, three-member ensemble (read `core/cnn.py`). The multi-horizon baseline is a penalised clinical Cox model on the same factors.
  - Protocol: stratified 5-fold patient-level cross-validation with one ECG per patient; one-year comparison over 5 cross-validation seeds with scores averaged per patient; survival model over one 5-fold split.
  - Metrics: AUROC with a 95 percent bootstrap interval (2,000 resamples, percentile; the one-year table reports the bootstrap mean, the horizon table the full-sample estimate); horizon AUROC with cases by the horizon and controls AF-free past it; Brier score after two-fold cross-fitted logistic recalibration; decision curves [@Vickers_2006]; operating points at the top 5, 10, 20 and 30 percent of risk, with positive predictive value and number needed to monitor recomputed at the cohort's one-year incidence of 1,855 / 43,625.
  - Reporting follows TRIPOD+AI [@Collins_2024].
- 4.3 Occlusion readout (about 150 words)
  - Occlusion sensitivity covers part of the input and records the change in the output [@Zeiler_2014], one of the perturbation-based explanation methods [@Ivanovs_2021].
  - Applied here: an ECG-only BTTN trained on the survival sample; for the 120 highest-risk ECGs of patients with an event, a 25 ms window at a fixed offset from each R peak is set to zero in every beat of one lead, the spectrogram is rebuilt and the drop in risk recorded; the drop is divided by the signal energy removed, since zeroing a high-energy part of the beat changes the spectrogram most (read `figures/beat_saliency.py`, lines 19 to 51).
  - The five windows are fixed offsets from the R peak (`SEG`, line 21): P, 230 to 130 ms before; PR, 130 to 50 ms before; QRS, 50 ms before to 50 ms after; ST, 50 to 150 ms after; T, 150 to 400 ms after. Name them "P window", "PR window" and so on, and state that they are not delineated per beat.
  - The replacement value and the window size shape an occlusion map [@arxiv_1702_04595; @_imi__2025]; state the zero replacement and the 25 ms window as choices of the readout. State that this is a perturbation readout of the fitted model on its training sample.
**Sources**: https://doi.org/10.13026/4nqg-sb35, Johnson_2023, Rix_2012, Valasakis_2026, Faes_2024, Vickers_2006, Collins_2024, Zeiler_2014, Ivanovs_2021, arxiv_1702_04595, _imi__2025.
**Key arguments**: the label source is ICD-coded hospital diagnoses; all methods share folds, samples and risk factors; the occlusion readout is a defined perturbation of the fitted ECG term.
**Transition to next**: The Results follow the order of the contributions, starting with the cohort that the design produced. The reader carries forward the two designs (one-year case-control and survival), which explain why one-year AUROCs differ between 5.2's two tables.

#### 5. Results (about 725 words)
**Purpose**: Report every gold-label result the paper claims, with its interval.
**Content**:
- 5.1 Study cohort (about 175 words)
  - Table "cohort": from `cohort_flow.txt`, binary and survival designs: 151,941 eligible patients with a sinus index ECG; 14,469 with prevalent or concurrent AF; 88,945 without AF and with under 365 days of follow-up; 7,481 with onset after one year (binary design only); 1,855 cases and 41,770 controls (binary); 8,775 events and 41,770 controls (survival); incident events 1,855, 2,828 and 5,262 by one, two and five years; control follow-up median 1,601 days (interquartile range 880 to 2,559); 40,960 controls (98.1 percent) with a later ECG and 40,306 (96.5 percent) with a documented later ECG without AF.
  - Planner decision 3: the exclusion categories are counted over all eligible patients and overlap (their sum with the final counts exceeds 151,941), so the table lists each count against the 151,941 eligible patients and is not drawn as a subtraction chain.
- 5.2 Discrimination at one year and across horizons (about 250 words)
  - Table "one-year" from `table1_cis.csv`: clinical 0.7597 [0.7488, 0.7713]; BTTR 0.5967 [0.5824, 0.6115]; CNN 0.7350 [0.7226, 0.7469]; BTTN ECG-only 0.7397 [0.7275, 0.7517]; BTTN with clinical term 0.7776 [0.7664, 0.7888].
  - Statements the numbers support: the fused model has the highest AUROC and its interval lies above the CNN's; its interval overlaps the clinical model's, and no paired interval is in the files, so the text reports the two estimates and intervals and does not state a difference as an effect; ECG-only BTTN and the CNN have overlapping intervals and the text calls them comparable, with no claim of superiority or equivalence; BTTN exceeds linear BTTR with non-overlapping intervals. The ECG-only models are below the clinical model at one year in this design, and the text says so in one sentence.
  - Table "horizons" from `multihorizon_icd_spectral.csv`: one survival model read at 90 days after the blanking window (onset in 31 to 120 days), 1, 2 and 5 years; fused model 0.723 [0.701, 0.745], 0.727 [0.711, 0.743], 0.740 [0.727, 0.753], 0.745 [0.735, 0.755]; clinical Cox 0.710, 0.711, 0.727, 0.731 (no interval in the file); ECG-only BTTN 0.658 to 0.676; evaluated patients and cases per horizon from `n_eval` and `n_pos` (20,000 and 410; 19,986 and 838; 16,982 and 1,299; 11,007 and 2,425).
  - Explain the lower one-year values in the survival design: its one-year controls include patients with AF after one year, while the one-year design's controls never have AF. Do not read the rise across horizons as rising risk toward onset (claim (b)).
- 5.3 Calibration, risk stratification and operating points (about 150 words)
  - From `clin_eval_operating_points.csv` (one-year, survival sample, 19,986 patients with 838 cases): Brier 0.039 for the fused model, 0.0398 for the clinical model, 0.0396 for ECG-only BTTN. At the top 10 percent of risk: sensitivity 0.272 against 0.240, specificity 0.908 against 0.906, PPV at the cohort incidence 0.1155 against 0.1019, number needed to monitor 8.7 against 9.8. Sensitivity and PPV of the fused model are higher at all four flagged fractions (rows 5, 20, 30 percent).
  - From `risk_strata.csv`: observed one-year AF rises from 0.55 percent in the lowest decile to 11.4 percent in the highest, with mean predicted 0.61 and 12.3 percent, and one inversion between the sixth (4.95 percent) and seventh (4.15 percent) deciles.
  - Figure `clinical-utility`: calibration, decision curve and risk deciles; describe the decision curve qualitatively from the figure (no net-benefit number is in a file).
- 5.4 Cardiac-cycle occlusion readout (about 150 words)
  - From `beat_saliency_segments.csv`: per unit energy removed, PR window 0.00216, ST 0.00157, P 0.00152, T 0.00127, QRS 0.00086; without energy normalisation QRS dominates (0.0232 against 0.0037 for PR). State that raw occlusion is dominated by the high-energy QRS complex and that the energy-normalised profile is highest in the PR window and lowest in the QRS window, with P and ST close to each other.
  - Figure `beat-saliency`: the 12-lead grid of the mean median beat with shading.
**Sources**: none needed (original analysis; the readout's method sources are in 4.3).
**Key arguments**: sub-arguments 1 to 4 of `arguments.md`, each with its numbers.
**Transition to next**: The Discussion takes the results in the order reported and places each beside the published models, the cohort literature and the scope of the design. The reader carries forward that the gains of the fused model over the clinical model are small and consistent, and that the occlusion profile is descriptive.

#### 6. Discussion (about 1,300 words)
**Purpose**: Interpret the results, compare them with the literature, state the implications, and state the scope boundaries.
**Content**:
- 6.1 The results beside published incident-AF models (about 375 words)
  - Summary of the four results in plain terms.
  - Published values on the same source hospital (C-index 0.750 [@Sau_2026]; 0.754 [@Zeidaabadi_2026]; external MIMIC-IV AUROC 0.77 at five years with an unstated label source [@Jabbour_2024]) and elsewhere [@Raghunath_2021; @Riek_2026] differ in design, horizon and label source, so they are context and not a ranking [@Tsiartas_2025]; identification studies are a different task [@Attia_2019; @Yuan_2023]; AF diagnosis on MIMIC-IV-ECG is a third task [@McKeen_2025].
  - The fused model adding to the clinical model agrees with reports that ECG and clinical information are complementary [@Khurshid_2022; @Christopoulos_2020].
  - Operating point context: one external validation flagged 9.7 percent with sensitivity 31 percent and specificity 92 percent [@Pfeifer_2026], in a different population.
  - Interpretable models and accuracy: ECG-only BTTN comparable to the CNN under one protocol, against the reported accuracy cost of intrinsic interpretability [@Patlatzoglou_2025].
- 6.2 Implications of a readable ECG term with a separate clinical term (about 400 words)
  - The clinical term keeps the ECG factors readable while the fused model gives the discrimination; a clinician reads the risk factors as a linear term and the ECG evidence through its factors.
  - The PR-window concentration of the occlusion profile is in line with saliency reports on the P-wave and PR interval in other incident-AF models [@Khurshid_2022; @Zeidaabadi_2026].
  - It is also in line with cohort studies that tie the PR interval measured in sinus rhythm to later AF: in Framingham [@Schnabel_2009; @Cheng_2009], in older black and white adults [@Magnani_2013], in an older Japanese population with first-degree atrioventricular block [@Tanaka_2021], and in Black adults of the Jackson Heart Study, where P-wave duration and P-wave terminal force were also associated with AF [@Yogeswaran_2025]. P-wave indices show the same direction [@Magnani_2015; @Emmanuela_2026], the latter at very low certainty in selected populations.
  - The association is not uniform: in a Swedish cohort of 70-year-olds the PR interval measured in lead V1 was not related to incident AF, while a short P-wave duration was [@Ostrowska_2022]. State this beside the cohorts above.
  - State the scope of the comparison: the cohort studies measure the PR interval (P onset to QRS onset), and the readout's PR window is a fixed window 130 to 50 ms before the R peak that holds the PR segment and, at short PR intervals, the end of the P wave. The text claims agreement in the location within the cardiac cycle only.
  - The clinical term holds P-wave duration and no PR interval (3.3); one reading of the fused model's gain is that the ECG term carries atrial-conduction information the clinical term does not measure, offered as a hypothesis.
  - The atrial cardiomyopathy concept [@Goette_2016], and the link of prolonged P-wave duration to left atrial fibrosis at autopsy in one community cohort [@Maezono_2025], are offered as one reading of an atrial focus, hedged as a hypothesis.
- 6.3 Limitations (about 375 words)
  - Single health system and one database; no external dated-outcome cohort.
  - Label source: ICD codes from hospital admissions are mostly correct but incomplete. A meta-analysis of 24 validation studies pooled a positive predictive value of 88 percent and a sensitivity of 80 percent for administrative AF definitions [@Yao_2019]; in a population study a hospital discharge diagnosis found 73.7 percent of record-verified AF, with a positive predictive value of 88.5 percent [@Malmo_2016]; a registry found a positive predictive value of 92.6 percent for the combined AF or flutter diagnosis [@Rix_2012]. Some controls may therefore have AF diagnosed only outside hospital, and onset is the admission date, not the first occurrence; follow-up to death counts patients without a hospital AF diagnosis as AF-free.
  - Age is the MIMIC-IV anchor age (planner decision 5; `cohort.py` reads `anchor_age` from `patients.csv.gz`), which is not the age at the index ECG [@Johnson_2023]. The clinical factors are a subset of those in CHARGE-AF [@Alonso_2013] and omit the PR interval, a known AF predictor [@Cheng_2009; @Magnani_2013], so the clinical comparator is narrower than a full clinical score.
  - The one-year design samples four controls per case and the survival design samples cases and controls; PPV is recomputed at the cohort incidence.
  - The occlusion readout is a perturbation explanation of the fitted model on 120 high-risk training ECGs, open to the critiques of post-hoc attribution [@arxiv_1810_03292; @arxiv_1806_10758; @Arends_2026]; its zero replacement, 25 ms window and fixed windows relative to the R peak shape the profile [@arxiv_1702_04595; @_imi__2025]; readable factors do not by themselves show that the nonlinear head routes its decision through them [@arxiv_2106_13314].
- 6.4 Future research (about 150 words)
  - A test of the block factors' faithfulness on gold labels with control probes and factor removal; external validation in a cohort with dated outcomes; temporal validation; a clinical comparator that includes the PR interval.
**Sources**: Sau_2026, Zeidaabadi_2026, Jabbour_2024, Raghunath_2021, Riek_2026, Tsiartas_2025, Attia_2019, Yuan_2023, McKeen_2025, Khurshid_2022, Christopoulos_2020, Pfeifer_2026, Patlatzoglou_2025, Schnabel_2009, Cheng_2009, Magnani_2013, Magnani_2015, Tanaka_2021, Ostrowska_2022, Maezono_2025, Yogeswaran_2025, Emmanuela_2026, Goette_2016, Yao_2019, Malmo_2016, Rix_2012, Johnson_2023, Alonso_2013, arxiv_1810_03292, arxiv_1806_10758, Arends_2026, arxiv_1702_04595, _imi__2025, arxiv_2106_13314.
**Key arguments**: the counter-arguments of `arguments.md` with their rebuttals.
**Transition to next**: The Conclusion restates the answer to the research question in the scope the limitations set.

#### 7. Conclusion (about 325 words)
**Purpose**: Answer the research question and state the implication.
**Content**:
- 7.1 Answer and implication (about 325 words): on ICD-coded labels in MIMIC-IV-ECG, BTTN with a separate clinical term had the highest one-year discrimination of the methods compared and stayed above the clinical model at four horizons from one survival model; its ECG term alone was comparable to a CNN while its factors stay readable; per unit energy, the occlusion profile is highest in the PR window; validation outside one health system is the next requirement.
**Sources**: none.
**Key arguments**: the thesis restated.
**Transition to next**: none (last section). The statements follow. Data availability (planner decision 6): MIMIC-IV-ECG and the MIMIC-IV hospital module under the PhysioNet credentialed data use agreement, and the code under the MIT licence at [GAP: repository URL or DOI]; CODE-15 and PTB-XL are not named, since the paper reports no result on them. Then ethics, AI disclosure and the reproducibility statement.

### Evidence map

Literature sources assigned to sections: 68 in `review.md` and `refs.bib`; 64 assigned, 4 removed below. Stance tags are those of `review.md`; Ostrowska_2022, which the review tags "contrasting on the PR interval", is tagged opposes.

| Section | Assigned sources | Evidence type |
|---|---|---|
| 1.1 | Wolf_1991 (neutral), Schnabel_2015 (neutral), Van_Gelder_2024 (neutral), Raghunath_2021 (supports), Khurshid_2022 (supports), Alonso_2013 (neutral), Tsiartas_2025 (neutral) | Context, clinical burden, problem framing |
| 1.2 | Kashou_2021 (supports), Saiz_Vivo_2025 (supports), Arends_2026 (supports), Rudin_2019 (supports) | Need for readable models |
| 2.1 | Attia_2019 (supports), Yuan_2023 (neutral), Tsiartas_2025 (neutral), Raghunath_2021 (supports), Jabbour_2024 (supports), Sau_2026 (supports), Zeidaabadi_2026 (supports), Habineza_2023 (supports), Ribeiro_2020 (neutral), Riek_2026 (supports), Khurshid_2022 (supports) | Prior AI-ECG results, task definitions |
| 2.2 | Alonso_2013 (neutral), Schnabel_2009 (neutral), Cheng_2009 (supports), Magnani_2015 (supports), Khurshid_2022 (supports), Christopoulos_2020 (supports), Khurshid_2025 (supports), Biton_2021 (supports), Sau_2026 (supports) | Clinical comparators, ECG intervals as predictors, ECG and clinical fusion |
| 2.3 | arxiv_1810_03292 (supports), arxiv_1806_10758 (supports), Arends_2026 (supports), Wagner_2024 (neutral), arxiv_2007_04612 (supports), arxiv_2106_13314 (opposes), arxiv_2205_10268 (supports), arxiv_2507_16761 (supports), arxiv_2504_02667 (neutral), Patlatzoglou_2025 (opposes) | Interpretability by design against post-hoc explanation |
| 2.4 | Ye_2020 (neutral), Goulart_2020 (neutral), Faes_2024 (neutral), arxiv_2511_04292 (supports), https://doi.org/10.5281/zenodo.22227432 (supports) | Block-term prior art, gap |
| 3.1 | De_Lathauwer_2008 (neutral), Kolda_2009 (neutral), Faes_2024 (neutral) | Model definition |
| 3.2 | Cox_1972 (neutral), Katzman_2018 (neutral), Sau_2026 (supports) | Survival objective |
| 4.1 | https://doi.org/10.13026/4nqg-sb35 (neutral), Johnson_2023 (neutral), Rix_2012 (supports), Valasakis_2026 (supports) | Data and label source |
| 4.2 | Faes_2024 (neutral), Vickers_2006 (neutral), Collins_2024 (neutral) | Baselines, decision curves, reporting standard |
| 4.3 | Zeiler_2014 (neutral), Ivanovs_2021 (neutral), arxiv_1702_04595 (neutral), _imi__2025 (neutral) | Occlusion method and its parameters |
| 6.1 | Sau_2026 (supports), Zeidaabadi_2026 (supports), Jabbour_2024 (supports), Raghunath_2021 (supports), Riek_2026 (supports), Tsiartas_2025 (neutral), Attia_2019 (supports), Yuan_2023 (neutral), McKeen_2025 (neutral), Khurshid_2022 (supports), Christopoulos_2020 (supports), Pfeifer_2026 (supports), Patlatzoglou_2025 (opposes) | Comparison with the literature |
| 6.2 | Khurshid_2022 (supports), Zeidaabadi_2026 (supports), Schnabel_2009 (neutral), Cheng_2009 (supports), Magnani_2013 (supports), Tanaka_2021 (supports), Yogeswaran_2025 (supports), Magnani_2015 (supports), Emmanuela_2026 (supports), Ostrowska_2022 (opposes), Goette_2016 (neutral), Maezono_2025 (supports) | Interpretation of the occlusion profile against the PR-interval and P-wave cohort literature |
| 6.3 | Yao_2019 (supports), Malmo_2016 (supports), Rix_2012 (supports), Johnson_2023 (neutral), Alonso_2013 (neutral), Cheng_2009 (supports), Magnani_2013 (supports), arxiv_1810_03292 (supports), arxiv_1806_10758 (supports), Arends_2026 (supports), arxiv_1702_04595 (neutral), _imi__2025 (neutral), arxiv_2106_13314 (opposes) | Scope boundaries: label accuracy, age, comparator, readout |

Sources removed, with the reason:

- Mehari_2022 and arxiv_2005_13249 (CLOCS): both support self-supervised pretraining of an ECG encoder. The paper reports no pretrained variant (item 13 of "Analyses left out"), so no section uses them.
- Wagner_2020 (PTB-XL) and https://doi.org/10.5281/zenodo.4916206 (CODE-15%): the datasets of the external analyses, which the paper does not report (item 11 of "Analyses left out"); planner decision 6 also drops both from the data availability statement.

The literature matrix has 5 themes, within the 3 to 6 the page asks for.

#### Project results: every number the paper reports

Label source rule applied: a file counts as gold when its name or a column names the ICD source, when its producing script can read only ICD-labelled inputs, or when its producing script's default source is `icd` and no committed runner passes it another source. A pipeline script's intended argument alone does not establish the source of a committed file whose name records no source, because `code/run_all.sh` and `code/hpc/analyses_jobs.slurm` give different source arguments for the same analyses.

| Numbers | Section | File, row and column | How the file establishes gold |
|---|---|---|---|
| 151,941 eligible; 14,469 prevalent or concurrent AF; 88,945 short follow-up; 7,481 onset after one year; 1,855 cases and 41,770 controls (43,625); 8,775 events (50,545); events 1,855, 2,828, 5,262 at 1, 2, 5 years; follow-up median 1,601, IQR 880 to 2,559; 40,960 (0.981) with a later ECG; 40,306 (0.965) with a documented later ECG without AF | 4.1, 5.1 | `code/results/cohort_flow.txt`, both blocks, one line per metric; the same values in `code/results/cohort_accounting.csv`, columns `cohort`, `metric`, `value` | Each block header reads "(source=icd)" (lines 1 and 23 of `cohort_flow.txt`); `core/cohort_accounting.py` writes both files in one run (lines 150 to 154) |
| 1,855 cases and 16,000 controls in the one-year modelling file; 4,000 events and 16,000 controls in the survival file | 4.1 | `code/results/cohort_icd_h365.csv` and `cohort_icd_survival.csv`, column `label` (counts of 1 and 0) | `icd` in the file name; `core/cohort.py` line 161 writes `cohort_{source}_...` |
| One-year sample by design: 1,855 cases with four controls each, 9,275 patients | 4.1 | Design count (planner decision 4): `core/bench.py` lines 36 to 38 draw `neg_ratio` times the cases from the controls, and `run_all.sh` line 124 passes `--neg_ratio 4`; `experiments/compute_table1_cis.py` line 29 states n = 9,275 for the gold ladder | The cases and controls come from the gold file above; the text states the count as the design count |
| One-year AUROC and 95 percent interval of clinical, BTTR, CNN, BTTN ECG-only, BTTN with clinical term | 5.2, abstract | `code/results/table1_cis.csv`, rows "clinical (age/sex + ECG intervals)", "plain BTTR (spectral)", "CNN (black-box)", "conv-BTTN (ECG-only)", "conv-BTTN + clinical"; columns `auroc`, `ci_lo`, `ci_hi` | Column `source_artifact` = `bench_spectral_icd_h365.npz` in every row; 2,000 resamples in `n_boot` |
| Horizon AUROCs, intervals, evaluated patients and cases at 90 days, 1, 2, 5 years | 5.2, abstract | `code/results/multihorizon_icd_spectral.csv`, all four rows; columns `n_eval`, `n_pos`, `BTTN`, `BTTN_lo`, `BTTN_hi`, `BTTN_clin`, `BTTN_clin_lo`, `BTTN_clin_hi`, `clinical` | `icd` in the file name; `experiments/multihorizon.py` line 135 writes `multihorizon_{source}_{tensor}.csv` and reads `cohort_{source}_survival.csv` (line 72) |
| Brier scores; sensitivity, specificity, PPV at cohort incidence, number needed to monitor at 5, 10, 20, 30 percent flagged; one-year AUROC with interval in the survival sample (0.726 [0.710, 0.742] fused, 0.708 [0.692, 0.725] clinical, 0.666 [0.647, 0.683] ECG-only) | 4.2, 5.3 | `code/results/clin_eval_operating_points.csv`, rows by `model` and `flagged_bal`; columns `auroc`, `ci`, `sens`, `spec`, `ppv_true`, `nnm`, `brier` | `experiments/clin_eval.py` reads only `multihorizon_icd_spectral.npz` (line 21) and sets the incidence from the gold cohort, 1,855 / (1,855 + 41,770) (line 33); its 1-year ECG-only AUROC (0.666) equals the gold horizon file's |
| Observed and mean predicted one-year AF per decile of the fused model (0.0055 and 0.0061 lowest; 0.1141 and 0.1226 highest; 0.0495 and 0.0415 in the sixth and seventh) | 5.3, abstract | `code/results/risk_strata.csv`, rows `decile` 0, 5, 6, 9; columns `n`, `observed_rate`, `mean_pred` | Written by `experiments/clin_eval.py` from the same gold scores (line 83); decile sizes sum to 19,986, the gold one-year `n_eval` |
| Energy-normalised and raw occlusion by window (P, PR, QRS, ST, T) | 4.3, 5.4 | `code/results/beat_saliency_segments.csv`, the single row; columns `*_norm` and `*_raw` | `figures/beat_saliency.py` defaults to `--source icd` (line 118), reads `cohort_{source}_survival.csv` (line 55) and selects cases by that file's `label`; `run_all.sh` line 151 passes `--source icd`; no committed runner passes `ecg` |
| 120 ECGs, 25 ms windows, window offsets from the R peak | 4.3 | `figures/beat_saliency.py` lines 19 to 21 (`WIN_MS = 25`, `N_ECG = 120`, `SEG`) and the title of `code/results/beat_saliency.png` ("mean of 120") | As above |

Numbers the draft writer must not present: a difference between two AUROCs as an effect estimate (no paired interval is in the files); a C-index (printed by `multihorizon.py`, not saved); any five-year ladder value (`bench_spectral_icd_h1825.npz` is not committed and has no CSV); any faithfulness number (planner decision 1); any number from `RESULTS.md`.

#### Analyses left out, with the reason

1. Faithfulness control probes, `faithfulness_controls.csv`: the file names no source; `experiments/faithfulness_controls.py` defaults to `--source ecg` (line 170); `run_all.sh` line 135 passes `--source icd` while `hpc/analyses_jobs.slurm` line 60 passes `--source ecg`. Label source not established.
2. Factor-removal curve, `intervention_curve.csv`: same; default `ecg` (line 95), `run_all.sh` line 136 `icd`, `analyses_jobs.slurm` line 64 `ecg`.
3. Block-structure ablation, `ablation_blockstructure.csv`: same; default `ecg` (line 87), `run_all.sh` line 137 `icd`, `analyses_jobs.slurm` line 56 `ecg`. Claim (d) of `config.md` also applies.
4. Block-count sweep, `ablation_K.csv`: the file names no source and `experiments/ablation.py` defaults to `ecg` (line 58); the only `icd` argument is the intended one in `run_all.sh` line 138.
5. Architecture sweep, `arch_sweep.csv`: `figures/arch_sweep.py` defaults to `ecg` (line 60) and no committed runner passes `icd`.
6. Frequency and lead occlusion map, `bttn_importance_freq.csv`, `bttn_importance_lead.csv`, `bttn_interpret.png`: `experiments/interpret_bttn.py` defaults to `ecg` (line 94); the files name no source; the only `icd` argument is in `run_all.sh` line 139.
7. Longitudinal cardiac-phase saliency, `beat_saliency_long_heatmap.png` and `beat_saliency_long_examples.png`: even under `--source icd`, `figures/beat_saliency_long.py` takes AF onset and the case patients from the first ECG whose report reads AF (line 45), which is the provisional ECG-report label (claim (a)); it is also a trajectory toward onset (claim (b)).
8. Single-ECG saliency, `saliency_ecg.png`: `figures/saliency.py` reads `cohort_ecg_survival.csv` (line 65).
9. Longitudinal risk trajectory, `longitudinal.csv`, `longitudinal_trajectory.png`, `longitudinal_trajectory_v2.png`: produced by `attic/` code on ECG-report labels; claim (b).
10. Files on ECG-report labels by name: `cohort_ecg_h365.csv`, `cohort_ecg_h730.csv`, `cohort_ecg_h1825.csv`, `cohort_ecg_survival.csv`, `multihorizon_ecg_spectral.csv`, `scores_ecg_h365.csv`.
11. External analyses, `external_code15_*` and `external_ptbxl_*`: their labels are the datasets' AF annotations, not ICD-10 diagnoses (claim (f)); the CSVs hold occlusion importances only, with AUROCs only in image titles; the tasks are identification and detection (claim (e)), and the PTB-XL AF-in-sinus-rhythm files fall under claim (c).
12. `bttn_architecture.png`: no committed script produces it, and its text names components the model does not use in the reported runs (a transformer head, self-supervised pretraining) and calls the read-outs "faithful by construction". `pipeline_overview.png` is not used either (planner decision 2), since its footer names a faithfulness probe the paper does not report.
13. Self-supervised pretraining rows of `table1_cis.csv` ("conv-BTTN + SSL" 0.7414 and "conv-BTTN + SSL + clinical (full)" 0.7775): gold labels, but the variant does not improve on its base model (0.7397 and 0.7776), so the paper neither describes nor reports it.

#### Planned figures

| Label | Section | What it shows | Data |
|---|---|---|---|
| bttr-to-bttn | Method 3.1 | Linear BTTR (top row) beside BTTN (bottom row): the same frequency and lead factors per block, with the static score vector replaced by learned multi-scale temporal kernels, the linear score by pooling and a nonlinear head, and least squares by a Cox survival objective | `code/results/bttr_vs_bttn.png` (committed schematic, no labelled result; added by planner decision 2; drawn by `figures/arch_diagram.py`, which reads no data) |
| clinical-utility | Results 5.3 | One-year calibration of the fused model, the ECG-only BTTN and the clinical model after cross-fitted recalibration; decision curves with treat-all and treat-none; observed one-year AF by decile of the fused model | `code/results/clin_eval.png` (committed image; gold scores from `multihorizon_icd_spectral.npz` per `experiments/clin_eval.py` line 21) |
| beat-saliency | Results 5.4 | Mean median beat of each of the 12 leads with shading for the energy-normalised risk drop per 25 ms window, over 120 high-risk ECGs of patients with an event | `code/results/beat_saliency.png` (committed image; gold by the default `--source icd` of `figures/beat_saliency.py`) |

Caption requirements for `bttr-to-bttn`, since the committed image is placed as it is and no script runs:

- The image names BTTR "Faes 2022", the online year of the article the reference list holds as [@Faes_2024]; the caption cites [@Faes_2024].
- The image labels the pooling box "attention over blocks". In every reported run the block layer pools each channel along time by attention and by maximum (`core/bttn.py` lines 93 to 100, `head_type="mlp"`); pooling over blocks belongs to the transformer head (`head_type="attn"`, line 168), which no reported result uses. The caption states the pooling of the reported model.
- The image does not draw the clinical term; the caption says that the clinical term (3.3) is added to the head's log-risk and bypasses the block layer.
- The image reads "Cox survival risk 1 / 2 / 5 yr"; the caption does not list horizons, and the text gives the four horizons of 5.2.

### Word count summary

| Section | Target words |
|---|---|
| 1. Introduction | 975 |
| 2. Related work | 1,625 |
| 3. Method | 975 |
| 4. Experiments | 575 |
| 5. Results | 725 |
| 6. Discussion | 1,300 |
| 7. Conclusion | 325 |
| Total | 6,500 words |

The abstract (about 250 words) is a planning figure outside the total. Introduction 15 percent, Related work 25 percent, Method 15 percent, Experiments and Results together 20 percent (575 and 725, with the occlusion protocol moved to its own subsection 4.3), Discussion 20 percent, Conclusion 5 percent.

Needs literature: none. The three items of the previous version now have sources: 4.3 (occlusion attribution) Zeiler_2014, Ivanovs_2021, arxiv_1702_04595, _imi__2025; 6.2 (PR-interval and P-wave cohorts) Cheng_2009, Magnani_2013, Magnani_2015, Tanaka_2021, Ostrowska_2022, Maezono_2025, Yogeswaran_2025, Emmanuela_2026; 6.3 (accuracy of ICD-coded AF) Yao_2019, Malmo_2016, Rix_2012. The Copenhagen ECG Study papers (Nielsen et al. 2013 and 2015) are not in the set, because the strategist could retrieve no text of either (`review.md`, section 3); 6.2 rests on the eight cohort and meta-analysis sources above.

Sources pending: none.

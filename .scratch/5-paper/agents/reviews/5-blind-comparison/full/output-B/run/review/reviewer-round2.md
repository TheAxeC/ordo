# the reviewer's scoring stage: Evaluator scoring, in-pair round 2

Artefact under review: `run/draft/draft_v2.md`. Contract: `run/review/contracts/evaluator_full.json`. Scoring plan: `run/review/reviewer-plan.md`. Further inputs: `run/draft/writer-draft-round1.md` (writer self-scores), `run/draft/revision_log_round1.md`, `run/arguments/argument_blueprint.md`, `run/settings.md` (rulings C11 and C12). No code was run and the draft was not edited. The checks below used `grep`, `sed`, `awk`, `comm` and `bc` on the draft, the bibliography and the admitted C1 files.

## Dimension Scores

### D1 originality: pass

Neither the block trigger "no stated contribution over prior work" nor the warn trigger "contribution stated but not positioned against cited prior work" applies. Section 1.4 states four contributions. Section 2.1 positions the block-term input factorisation against weight-compression uses of block terms [ye2018][li2017btnets][ye2020], against linear tensor regression [zhao2013][camarrone2019][faes2024][faes2022] and against [dooms2025], and 2.2 positions the faithfulness protocol against [adebayo2018][hooker2019][jacovi2020]. Section 1.4 now also states the limited sense of the name tensor network (draft_v2.md:43).

### D2 methodological_rigor: pass

Neither the block trigger "method not reproducible from the text" nor the warn trigger "method detail missing for a reported result" applies. Every method statement in 3.2 to 3.9 that changed since draft v1 was checked against the code:
- Index ECG and controls: 3.2 "contained the word sinus", "An AF-reading ECG after the blanking window did not exclude a control" match `code/core/cohort.py:110-133`.
- Covariates: anchor age (`cohort.py:73-74,108`), durations from fiducial points with no recoding (`cohort.py:35-46`), NaN-only imputation (`bench.py:82-88`, `bttn.py:195-200`), absent sex coded as not male (`bench.py:35`, `multihorizon.py:73`).
- Readouts: "two of the six channels" and the six rank-one maps match `bttn.py:77-86,108-116`; CP width 12 and full-rank width 72 match `bttn.py:55-63`; weight-decay exclusion matches `bttn.py:240-253`.
- Comparators and Table S1: all 19 rows match the code (`config.py:64,77-80`, `cnn.py:21,29-35,45-55`, `ssl_pretrain.py:58-101`, `run_all.sh:118`, `bttr_model.py:22-37`, `bench.py:86-87`, `multihorizon.py:112`, `bttn.py:33,43,123`). The BTTR row "signal-to-noise grid 20 to 40 dB in steps of 5, ratios 95, 97 and 99" matches `config.py:79-80` (`range(20, 41, 5)`, `(95.0, 97.0, 99.0)`) and the dB scale of `bttrlib/ace.py:62` (`10**(-snr/10)`).
- Multi-horizon protocol (3.7) matches `multihorizon.py:92-112`; same-fold intervention without retraining (3.8) matches `intervention_curve.py:44-78`; record-level folds and in-sample occlusion (3.9) match `external_code15.py:57-59,87-90` and `external_ptbxl.py:40-43,62-65,83-97`.

The one remaining imprecision is the singular "missing code 29999" in 3.2, where the next sentence correctly names both codes; it is new item 1 (Minor) and does not leave a reported result without its method.

### D3 evidence_sufficiency: pass

None of the block triggers ("number not in an admitted C1 file; citation outside references.bib; significance claimed for a model difference; outcome stated around a [GAP]; negative or null framing; dead end or attic work mentioned") applies, and neither warn trigger ("claim supported but evidence thinly stated; citation used beyond its annotation in a minor way") applies.
- New and changed numbers: 819 of 17,855 rows with P-wave duration 29,547 to 29,838 ms, 2 absent age and 2 absent sex, and 37 axis values (29 P axis of 29999, 1 QRS axis of 29999, 1 T axis of 29999, 6 T axis of 32767) were recounted with `awk` on `code/results/cohort_icd_h365.csv`. 4.6% = 819/17,855 (4.587). 40,960, 40,306 and 41,770 are in `cohort_accounting.csv:7,17,20` and `cohort_flow.txt:7,17,20`; 654 = 40,960 minus 40,306; 98.1%, 96.5% and 1.6% are 98.06, 96.49 and 1.57 by `bc`. 3.1 Hz and 0.78 Hz are 400/128 and 100/128. Every unchanged result number is identical to draft v1, which round 1 verified.
- Citations: 65 distinct `<!--ref:-->` keys, all in `run/search/references.bib` (`comm -23` empty); every visible key matches its hidden key; harrell1982, hindricks2021 and yokota2014 are uncited. bollmann2006 and platonov2014 are now cited for the atrial fibrillatory rate during AF only (draft_v2.md:294; annotations at lines 384 and 390). The 1.3 faithfulness-gap sentence is attributed to matsuo2026 and storas2023 and the wider absence to this study's search. The 3.8 sentence "As in randomisation checks [adebayo2018], the same probe was fitted to four controls" is within the annotation, which states that the paper "motivates control comparisons" and lists "Methods (control-probe rationale)" as its use (annotated_bibliography.md:292-293). nolinlapalme2026 is named against "its supervised counterpart" as its annotation states.
- Project rules: "pre-specified", "significan", "outperform", "superior", "equivalen", "rose from", "across deciles", "saved" and "stored" occur 0 times. Faithfulness and external results stay at [GAP-FT1 to GAP-FT5] and [GAP-X1] with no outcome in either direction, and the in-sample external sentences of 4.6 are gone. No dead end or attic work is mentioned. The 5.5 statement on 60 Hz mains is the design fact that blueprint K8 (argument_blueprint.md:132) concedes as a limitation.

### D4 argument_coherence: pass

Neither the block trigger "conclusion claims more than the results show; claims contradict across sections" nor the warn trigger "counter-argument left unaddressed; section departs from outline without a recorded reason" applies. Section 6 now separates the CNN comparison (non-overlapping CIs) from the clinical-model comparison (overlapping CIs, completed by [GAP-C4]). Section 4.2 "holds the covariate set fixed" and adds the loss-and-fitting caveat for both the clinical-model and the linear-BTTR comparison (blueprint K9). The compact CNN is named "the CNN of this study" in 4.2, 5.1 and 6 and is a limitation in 5.5 (blueprint K14). The 26 subsection headings match the outline in order (`grep` of both files).

### D5 writing_quality: pass

Neither the block trigger "register unfit for the venue throughout" nor any warn trigger ("filler vocabulary or em dashes present; term undefined on first use; body outside 5850 to 7150 words") applies.
- Body: 7,005 words (Sections 1 to 6 prose with comments, headings, tables, notes, captions and display equations removed; the same pipeline gives 6,960 for draft v1, the round-1 figure).
- `LC_ALL=C grep -c '[^ -~]'` gives 0; no spaced-hyphen or double-hyphen dash outside table rules; semicolons only in the keyword line and the Table 2 note.
- The 25 flagged terms of the writing-quality checklist and its throat-clearing phrases give 0 hits.
- ECG, ICD, CNN, AUROC, AI, LIME, Grad-CAM, SHAP and SSL are expanded at first use, "multilayer perceptron" is written out, and "C statistic" is used throughout.
- The future tense in 4.6 and 5.3 is new item 2 (Minor).

## Failure Condition Checks

### FC1

Did not fire. No mandatory dimension (D2, D3, D4) scores block.

### FC2

Did not fire. No cited key lies outside references.bib, no citation is used beyond its annotation, and every new or changed number matches its admitted file or is a labelled derivation of admitted numbers.

### FC3

Did not fire. No Critical issue remains; round-1 item 1 ("pre-specified") is fixed and the new items are Minor.

### FC6

Did not fire. The section and subsection structure matches the outline, and Table S1 and the [GAP-TRIPOD] placeholder are additions the round-1 review requested.

### FC4

Did not fire. D1 and D5 both pass. The writer's D7 register_consistency is pass, which agrees with my D5 pass; the writer has no originality dimension, so there is no self-score to disagree with on D1.

### FC5

Did not fire. No mandatory dimension blocks in round 2, so no mandatory block recurs.

### FC0

Fired. None of FC1, FC2, FC3, FC6, FC4 or FC5 fired.

## Review Body

### Status of the round-1 items in draft_v2

| Item | Severity | Status | Evidence in draft_v2.md |
|---|---|---|---|
| 1 | Critical | Fixed | "pre-specified" occurs 0 times; Abstract line 11 "Five faithfulness analyses of the block signatures are described."; lines 15, 278, 330 "assessed by five analyses" (C12). |
| 2 | Major | Fixed | Line 294: markers are P-wave duration and PTFV1; bollmann2006 and platonov2014 cited for the atrial fibrillatory rate during AF. |
| 3 | Major | Fixed (C11: description plus limitation) | Line 75: durations from onset and end points, missing code not recoded, 819 of 17,855 rows, 37 axis values; line 105: imputation restricted to absent values; line 310: limitation and rerun named. Wording of the code is new item 1. |
| 4 | Major | Fixed (C11: description plus limitation) | Line 75 "the MIMIC-IV anchor age, not adjusted to the date of the index ECG"; line 310 limitation. |
| 5 | Major | Fixed | Line 73 "An AF-reading ECG after the blanking window did not exclude a control"; line 308: 654 controls (1.6%, derived) with a latest ECG reading AF and no hospital code. The writer's wording, which does not call these controls misclassified, is accurate because a later AF ECG can fall after day 365. |
| 6 | Major | Fixed | Line 111 "a compact network of three convolutional layers, used as a black-box comparator on the same input"; "the CNN of this study" in 4.2, 5.1 and 6; line 312 limitation. |
| 7 | Major | Fixed | Table S1 (lines 348 to 370) written out; all rows match the code (D2). |
| 8 | Major | Fixed | "saved" and "stored" occur 0 times; every fill names "a run ... that writes them to a committed results file" (lines 182, 196, 268, 272). |
| 9 | Major | Fixed | Line 137 record-level folds and in-sample occlusion importances; line 304 limitation. |
| 10 | Major | Fixed | Line 93 "It summarises two of the six channels of each block, and the complete readout of block $k$ is the set of six rank-one maps"; line 290. |
| 11 | Major | Fixed | Line 172 "holds the covariate set fixed. The two models also differ in loss and fitting". |
| 12 | Major | Fixed | Lines 67 and 346 [GAP-TRIPOD] with its fill. |
| 13 | Minor | Fixed | Line 35: no faithfulness test attributed to matsuo2026, physician finding to storas2023, wider absence to this study's search. |
| 14 | Minor | Fixed | Line 71 "contained the word sinus (including sinus tachycardia, bradycardia and arrhythmia)"; Abstract states the 30-day exclusion. |
| 15 | Minor | Fixed | Line 117 "single five-fold run stratified by event ... each fold a three-model ensemble with early stopping on validation AUROC for an event within one year". "Trained once" in 4.3 and 6 now reads against this description as one model for all horizons. |
| 16 | Minor | Fixed | Line 93 "multilinear in the factors"; line 105 "so that weight decay does not shrink them". |
| 17 | Minor | Fixed | Line 129 "12 rank-one CP blocks (12 channels) ... the same 72 channels". |
| 18 | Minor | Fixed | Line 127 "on the same fold without retraining, unlike the remove-and-retrain benchmark [hooker2019]". |
| 19 | Minor | Fixed | In-sample sentences of 4.6 removed; line 316 "without a concordance index". |
| 20 | Minor | Fixed | Abbreviations expanded at first use; "multilayer perceptron" at lines 89 and 97; tensor network defined at line 43. |
| 21 | Minor | Fixed | "C-statistic" 0 hits; line 123 "graded rather than binary"; "rose from" and "across deciles" 0 hits. |
| 22 | Minor | Fixed | Line 109 "using the bttrlib implementation released with the analysis code". |
| 23 | Minor | Fixed | Line 328 "Against the CNN these point estimates have non-overlapping CIs. Against the clinical model the CIs overlap, and the comparison is completed by the paired differences at [GAP-C4]". |

Correction to the round-1 review. Item 3 of `run/review/reviewer-round1.md` gave the one-year cohort file as having "7 a T axis of 29999", and the survival file 8 T-axis values of the same code. A recount with `awk` on exact values shows that the one-year file has 1 T axis of 29999 and 6 of 32767, and the survival file has 8 T axes of 32767 and none of 29999. The P-axis (29 and 26) and QRS-axis (1 and 0) counts stand. The draft's statement "37 axis values are 29999 or 32767" is correct and does not depend on the round-1 figure.

### New revision items

1. **Minor.** Location: 3.2, "The machine-measurement missing code 29999 was not recoded before these differences were formed or the axes entered the models"; 3.5, "values carrying the missing code enter as numbers"; 5.5, "the unrecoded missing code leaves 819 rows". Problem: the one-year cohort file carries two missing codes, 29999 (in the fiducial points behind the durations and in 31 axis values) and 32767 (in 6 T-axis values), and the next sentence of 3.2 names both, so the singular code reads as inconsistent with it. Evidence: `awk` on `code/results/cohort_icd_h365.csv` gives p_axis 29999 x29, qrs_axis 29999 x1, t_axis 29999 x1 and 32767 x6; `code/core/cohort.py:35-46` recodes neither value. Fix: in 3.2 write "The machine-measurement missing codes 29999 and 32767 were not recoded before these differences were formed or the axes entered the models"; in 3.5 and 5.5 write "the missing codes" and "the unrecoded missing codes".

2. **Minor.** Location: 4.6, "Table 7 will list the task, dataset, patients, cases and cross-validated AUROC of each analysis."; 5.3, "The substrate map will be compared with established sinus-rhythm markers of AF risk". Problem: these are the only future-tense sentences in a Results section and a Discussion otherwise written in the past and present tense, and the Table 7 caption already defines its columns. Evidence: `grep -n -i "will list\|will be" draft_v2.md` gives lines 270 and 294 only. Fix: in 4.6 write "Table 7 lists the task, dataset, patients, cases and cross-validated AUROC of each analysis ([GAP-X1])."; in 5.3 write "The substrate map is read against established sinus-rhythm markers of AF risk".

## Evaluator Decision

evaluator_decision=accept

Derivation: no failure condition of severity 1 to 6 fired (FC1, FC2, FC3, FC6, FC4 and FC5 all did not fire), so FC0 applies and the decision is accept. All 23 round-1 items are fixed in draft_v2, items 3 and 4 by description plus limitation as ruling C11 accepts for this run. The two new items are Minor wording changes and are passed to the reviewer stage with the draft.

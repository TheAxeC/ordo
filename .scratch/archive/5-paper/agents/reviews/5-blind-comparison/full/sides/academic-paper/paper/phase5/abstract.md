# Phase 5b: Abstract, keywords and highlights

Source: accepted draft `paper/phase4/draft_v3.md`. Language: English only (`paper/config.md`, Abstract row). Venue: Artificial Intelligence in Medicine. The venue abstract limit is not stated (`paper/phase0/venue_profile.yaml:9`, `abstract_limit: null`), so the skill's English range of 150 to 300 words applies. The venue highlight limit is also not stated, so each highlight follows the common Elsevier convention of at most 85 characters including spaces.

## Abstract

**Background:** Deep learning models predict incident atrial fibrillation (AF) from a sinus-rhythm 12-lead electrocardiogram (ECG), but their evidence is not designed to be read and their explanations are seldom tested for faithfulness.

**Methods:** This retrospective study used each patient's earliest sinus-rhythm ECG in MIMIC-IV-ECG, with the first hospital-coded AF or flutter after a 30-day blanking window as the outcome. A block-term tensor network (BTTN) projects a log-spectrogram tensor onto 12 learned frequency-by-lead blocks before a nonlinear stage trained under a Cox loss, and BTTN + clinical adds age, sex and seven ECG measurements as a linear term outside the block layer. Models were compared by the area under the receiver operating characteristic curve (AUROC), with patient-bootstrap 95% confidence intervals (CIs), in repeated five-fold cross-validation. Five faithfulness analyses of the block signatures are described.

**Results:** Of 151,941 eligible patients, 1,855 were one-year cases and 41,770 were controls. BTTN + clinical had the highest point AUROC of seven models, 0.7776 (95% CI 0.7664 to 0.7888), against 0.7597 (0.7488 to 0.7713) for a clinical model and 0.735 (0.7226 to 0.7469) for a convolutional neural network (CNN). ECG-only BTTN reached 0.7397 (0.7275 to 0.7517). The BTTN + clinical survival model had a higher point AUROC than a clinical Cox model at all four horizons, reaching 0.745 against 0.731 at five years. Observed one-year AF was 0.55% in the lowest decile of BTTN + clinical risk and 11.4% in the highest.

**Conclusions:** BTTN + clinical reached the highest point AUROC while all ECG evidence passed through readable frequency-by-lead block projections, and one survival model covered horizons from 90 days to five years. Faithfulness results are held at [GAP-F1 to GAP-F5].

**Keywords:** tensor decomposition; deep learning; survival analysis; faithfulness evaluation; risk stratification; MIMIC-IV

## Word count

| Section | Words |
|---|---|
| Background | 31 |
| Methods | 100 |
| Results | 102 |
| Conclusions | 38 |
| Total, section labels excluded | 271 |
| Total, section labels included | 275 |

Counting method: `wc -w` on the four section paragraphs, with the bold labels removed by `sed -E 's/^\*\*[A-Za-z]+:\*\* //'` for the first total. `wc -w` splits on whitespace, so a number, a bracketed CI bound such as "(95%" and "[GAP-F1" each count as one word, and a hyphenated compound such as "frequency-by-lead" counts as one word. The total lies inside the 150 to 300 word range.

Keywords: six, none repeating a title phrase verbatim (title: "An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead electrocardiogram and clinical risk factors").

## Highlights

The venue highlight limit is not stated; each highlight is held to at most 85 characters including spaces, the common Elsevier convention. Characters were counted with `awk '{print length($0)}'`.

| # | Highlight | Characters |
|---|---|---|
| 1 | A block-term tensor network reads the ECG through 12 learned frequency-by-lead blocks | 85 |
| 2 | Age, sex and seven ECG measurements enter as a linear term outside the block layer | 82 |
| 3 | With clinical fusion, one-year AF point AUROC was 0.7776, highest of seven models | 81 |
| 4 | ECG-only network reached AUROC 0.7397 against 0.735 for a CNN on the same tensor | 80 |
| 5 | The fused survival model exceeded the clinical Cox point AUROC at all four horizons | 83 |
| 6 | Observed one-year AF was 0.55% in the lowest risk decile and 11.4% in the highest | 81 |
| 7 | Five faithfulness analyses test whether the block signatures track the model | 76 |

## Number map

Result numbers are checked against the admitted gold-label files of C1 (`paper/config.md:37`). Design settings (blanking window, block count, covariate count, fold count, number of faithfulness analyses) are not results; each is mapped to its draft line and to the code or cohort file that fixes it.

| Number in abstract or highlights | Draft line(s) in `draft_v3.md` | Admitted file and row | File value |
|---|---|---|---|
| 151,941 eligible patients | 13, 143, 151 | `cohort_accounting.csv` row 2; `cohort_flow.txt` line 2 (source=icd, line 1) | 151941.0 |
| 1,855 one-year cases | 13, 143, 155 | `cohort_accounting.csv` row 6 | 1855.0 |
| 41,770 controls | 13, 143, 156 | `cohort_accounting.csv` row 7 | 41770.0 |
| seven models | 170, 184, 278 | `table1_cis.csv` rows 2 to 8 (seven model rows) | 7 rows |
| 95% CI (patient bootstrap) | 115, 196 | `table1_cis.csv` column n_boot | 2000 resamples |
| BTTN + clinical 0.7776 (0.7664 to 0.7888) | 13, 170, 193 | `table1_cis.csv` row 7, conv-BTTN + clinical | 0.7776, 0.7664, 0.7888 |
| Clinical model 0.7597 (0.7488 to 0.7713) | 13, 170, 188 | `table1_cis.csv` row 2, clinical (age/sex + ECG intervals) | 0.7597, 0.7488, 0.7713 |
| CNN 0.735 (0.7226 to 0.7469) | 13, 170, 190 | `table1_cis.csv` row 4, CNN (black-box) | 0.735, 0.7226, 0.7469 |
| ECG-only BTTN 0.7397 (0.7275 to 0.7517) | 13, 174, 191 | `table1_cis.csv` row 5, conv-BTTN (ECG-only) | 0.7397, 0.7275, 0.7517 |
| four horizons; 90 days to five years | 117, 200, 206 to 211 | `multihorizon_icd_spectral.csv` rows 2 to 5 (90-day onset (post-blank), 1yr, 2yr, 5yr) | 4 rows |
| higher point AUROC at all four horizons | 200, 208 to 211 | `multihorizon_icd_spectral.csv` rows 2 to 5, BTTN_clin against clinical | 0.723 / 0.71, 0.727 / 0.711, 0.74 / 0.727, 0.745 / 0.731 |
| 0.745 against 0.731 at five years | 13, 200, 211 | `multihorizon_icd_spectral.csv` row 5, BTTN_clin and clinical | 0.745, 0.731 |
| 0.55% lowest decile | 13, 221, 244 | `risk_strata.csv` row 2, decile 0, observed_rate | 0.005502751375687844 (0.55%) |
| 11.4% highest decile | 13, 221, 244 | `risk_strata.csv` row 11, decile 9, observed_rate | 0.11405702851425713 (11.4%) |
| 30-day blanking window (design) | 11, 71 | `code/core/config.py:51` | BLANKING_DAYS = 30 |
| 12 learned blocks (design) | 83, 87, 357 | `code/core/bttn.py:43` | K=12 |
| age, sex and seven ECG measurements (design) | 75, 196 | `cohort_icd_h365.csv` line 1 header | anchor_age, gender, rr_interval, p_dur, qrs_dur, qt, p_axis, qrs_axis, t_axis |
| repeated five-fold cross-validation (design) | 115, 369 | `table1_cis.csv` source_artifact bench_spectral_icd_h365.npz; setting stated in draft Table S1 | not a file value |
| five faithfulness analyses (design) | 11, 123, 248 to 254 | none; results held at [GAP-F1 to GAP-F5] under C2 | not a file value |
| 12-lead (recording type) | 9, 67 | not a result | not a file value |

## Rule checks

- No significance claim: every comparison is stated as a point AUROC or with marginal CIs (C4).
- No faithfulness or external outcome: faithfulness is described in Methods and its results are held at [GAP-F1 to GAP-F5] (C2); external analyses are not mentioned (C3).
- No analysis is described as specified in advance (C12). No provisional-label number, dead-end or retracted result appears (C9), and no result is framed as negative or null.
- Every abbreviation (AF, ECG, BTTN, AUROC, CI, CNN) is defined at first use in the abstract. Highlights use the same abbreviations.
- Bilingual Abstract Quality rules 6 and 7, and the zh-TW parts of rules 8 and 9, do not apply because the abstract is English only.

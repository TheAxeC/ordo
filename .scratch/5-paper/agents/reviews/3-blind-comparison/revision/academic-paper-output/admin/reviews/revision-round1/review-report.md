# Peer Review Report and Revision Instructions, revision round 1

Manuscript: BSPC-D-26-11935, "Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure" (`manuscript/main.tex`). Mode: `academic-paper` revision, step 1 (peer_reviewer_agent). Input review: `admin/reviews/reviewer-comments.md` (Biomedical Signal Processing and Control, major revision). All line numbers refer to `manuscript/main.tex` as it stands at commit 03b7915. Section numbers are the compiled elsarticle numbers (1 Introduction, 2 Related work, 3 Methods with 3.1 Data and cohorts, 3.2 Representations, 3.3 Clustering and evaluation, 3.4 Federated robustness, 4 Results with 4.1 to 4.6, 5 Discussion, 6 Limitations, 7 Conclusion).

Compiled figure numbering differs from the figure file names, and the referees use the compiled numbers: Figure 1 is `fig1_ari_heatmap.pdf` (line 264), Figure 2 is `fig3_sep_vs_clust.pdf` (line 305, separability versus clusterability), Figure 3 is `fig2_silhouette_trap.pdf` (line 325), Figure 4 is `fig4_federated.pdf` (line 409). This report uses the compiled numbers.

Referee quotes are reproduced verbatim from `admin/reviews/reviewer-comments.md`, including their non-ASCII characters (the "<less-than or equal to>" in R1.1 and the dash in "Figures 2<en dash>4" in R3.10).

## 1. Reviewer Summary

| Metric | Value |
|--------|-------|
| Paper Title | Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure |
| Review Round | 1 |
| Verdict | Major Revision |
| Overall Score | 5.3/10 |
| Body length | about 3,200 words (Introduction to Conclusion), abstract about 240 words |

## 2. Initial Impression

The manuscript asks a clear question and answers it with a controlled design: chance-corrected external indices, majority and random baselines, a supervised ceiling per representation, ten seeds, a conditioner sweep, a second dataset and two stressors. The results are presented compactly and the paper is candid about what it does not claim. The main weaknesses are a conclusion about federation that Table 3 contradicts, missing implementation and input details (which leads, which sampling rate, which hyperparameters, how HDBSCAN noise enters the ARI), uncertainty reported only as seed SD, and several numbers in the text that cannot be reproduced from the tables. Initial impression score: 5.5/10.

## 3. Dimension Scores

| Dimension | Weight | Score | Weighted |
|-----------|--------|-------|----------|
| Originality | 20% | 5/10 | 1.00 |
| Methodological Rigor | 25% | 5/10 | 1.25 |
| Evidence Sufficiency | 25% | 5/10 | 1.25 |
| Argument Coherence | 15% | 6/10 | 0.90 |
| Writing Quality | 15% | 6/10 | 0.90 |
| **Overall** | **100%** | | **5.30/10** |

Key evidence per dimension:

- Originality 5: the paper is a benchmark of existing representations with existing clusterers (lines 435-438 "We claim no methodological novelty"; lines 110-111 "We do not propose a new method"). It fills two gaps stated against the closest benchmark (hand-crafted baseline and MIT-BIH, lines 87-93 and 142-148) and adds a supervised ceiling and two stressors. The contribution is real but currently framed only negatively (what it is not), which invites R3.1.
- Methodological Rigor 5: strong controls (majority baseline 0.504 at line 161, random ARI, supervised ceilings in Table 1, linear and random-forest probes at lines 206-209, conditioner sweep at lines 211-213, AMI for K = 2 to 8 at lines 213-215). Weaknesses: the lead and sampling-rate of each representation are not stated and appear inconsistent (line 162 versus lines 176-178); HDBSCAN is said to have its cluster count set to the number of classes (lines 199-201), which HDBSCAN does not accept, and its noise handling is unstated; uncertainty is seed SD only, which measures initialization stability and not sampling variability; hyperparameters, convergence criteria, the Dirichlet concentration and the federated rounds are absent.
- Evidence Sufficiency 5: core balanced-data results are supported by Table 1. Unsupported or contradicted: the claim that hand-crafted features overtake ECGFounder under federation (lines 107-109, 421-422, 463-465) against Table 3 (0.591 versus 0.612); the hand-crafted mean ARI of 0.61 under power scaling (line 335), which Table 1 does not reproduce; Delta = 0.242 (line 272) where Table 1 gives 0.885 - 0.644 = 0.241; methods promise metrics and random-forest ceilings that are never printed (lines 203-209); the claim that the foundation models cannot embed 2-lead beats "at all" (lines 423-425), which the cited ECGFounder preprint's abstract contradicts (it describes an extension to arbitrary single-lead ECGs).
- Argument Coherence 6: Introduction, Results and Conclusion follow one line of argument, and the decision rule in the Discussion (lines 417-427) follows from the results. The federation contradiction runs through the Introduction, Discussion and Conclusion, and the Limitations argument about upsampling (lines 445-450) is contradicted by its own numbers (upsampled 0.909 above native 0.896).
- Writing Quality 6: prose is clear and compact. Several abbreviations are never defined (HDBSCAN, GMM, AMI, SDNN, RMSSD, pNN50, RR, SCP-ECG, AFIB, AFLT, FedAvg, SD), terminology varies for the same thing (clients/sites, hand-crafted/beat-morphology, kmean/k-means), British and American spellings are mixed, and text values are rounded differently from table values.

## 4. Strengths

1. The chance-corrected design is explicit and sound. The paper states the majority baseline (0.504, line 161), uses ARI and AMI as headline metrics with the justification that purity rewards the majority assignment (lines 134-140), and shows the silhouette collapse concretely (silhouette 0.81 at ARI 0.000 with largest-cluster fraction 1.00, lines 313-316). This directly corrects the failure mode it set out to explain (lines 69-76).
2. The supervised ceiling per representation (Table 1 last column; Figure 2) separates informational from geometric failure, and the random-forest check on raw features (accuracy 0.71 against a linear ceiling of 0.52, lines 299-301) addresses the obvious objection that a linear probe is too weak.
3. Claims about foundation models are scoped to the two named models (lines 111-112, 279-282, 440-441, 450-453), and the separability-versus-clusterability effect is credited to prior work (lines 82-83, 297-298). The conditioner sweep (Section 4.4) reports a large, practically relevant effect (ECGFounder mean ARI 0.87 under standard scaling against 0.09 under robust scaling, lines 337-338) that most applied clustering papers omit.

## 5. Cross-Section Checks

| Check | Status | Notes |
|-------|--------|-------|
| Title matches content | Pass | |
| Abstract reflects findings | Partial | Lines 46-49 state the federation result correctly (the embedding's advantage "erodes"), but line 47 calls simulated sites "ten heterogeneous sites" without "simulated". |
| Introduction to Conclusion alignment | Fail | Contribution (iii) (lines 107-109) and Conclusion (lines 463-465) say hand-crafted features overtake ECGFounder under federation; Table 3 shows 0.591 against 0.612. |
| Research question answered | Pass | |
| All tables and figures referenced in text | Pass | Table 1 (lines 174, 232, 289), Table 2 (346), Table 3 (382), Figures 1 to 4 (232, 289, 317, 382). |
| Citation format consistent | Partial | elsarticle-num used (line 493); bib entries have mixed arXiv/medRxiv handling and two uncited entries (see R3.14). |
| Word count within target | Not verified | No journal word limit is stated in this repository. |
| Mandatory inclusions | Pass | Data availability (470-473), ethics (475-477), CRediT (479-482), funding (484-485), competing interests (487-488), AI disclosure (490-491), Limitations (443-456). |

## 6. Issues table

Evidence classes: A text-only from what the manuscript states; B number exactly derivable from printed numbers; C needs results, timings, figures, data or implementation facts not in this repository (C-run needs new computation; C-info needs facts from the code or the authors, without new runs); D candidate for a reasoned REVIEWER_DISAGREE or partial response.

| ID | Topic | Section (main.tex lines) | Severity | Class | Cross-reference |
|----|-------|--------------------------|----------|-------|-----------------|
| R1.1 | Confidence intervals instead of SD | Table 1 caption (242-247); 4.1 (269-271); 3.3 (209-210) | Major | C | R3.3, R3.12, R1.5 |
| R1.2 | Effect sizes alongside p-values | Table 1 caption (245-246); 4.1 (271-274) | Minor | B | R3.3 |
| R1.3 | HDBSCAN noise handling | 3.3 (199-201); 4.1 (282-285); Table 1 HDBSCAN column (253-257) | Major | C | R3.7, F6 |
| R1.4 | Computational cost table | 5 Discussion (417-427); 4.6 (387-388); new table | Major | C | R3.6 |
| R1.5 | Expand Figure 2 | Figure 2 (303-309); 4.2 (289-301) | Minor | C | R3.12, R1.1, F13 |
| R2.1a | Input data type from WFDB | 3.1 (154-163); 6 Limitations (445-447) | Minor | C | R2.2a, R2.2b, R3.7 |
| R2.1b | Justify Lead II only | 3.1 (161-162) | Major | A | R2.2a |
| R2.2a | Lead II versus all leads concatenated | 3.1 (161-162); 3.2 (176-179, 188-195) | Major | C | R2.1b, R2.1a |
| R2.2b | Data type and principle per representation | 3.2 (174-195) | Minor | C | R2.1a, R2.2a, R3.7 |
| R2.3 | Metric definitions, formulas, ranges | 3.3 (197-216); 2 Related work (134-140) | Minor | A | F7 |
| R2.4 | Explain comparative performance | 4.1 (230-285) | Major | A | R2.5 |
| R2.5 | HuBERT-ECG "sharpest" with ARI 0.195 | 4.2 (293-295) | Minor | D | R2.4, F13 |
| R3.1 | Methodological novelty | 1 Introduction (95-112); 2 (142-148); 5 Discussion (435-441) | Major | D | R3.8 |
| R3.2 | Multi-class datasets | 3.1 (152-170); 6 Limitations (453-454) | Major | C | R3.8 |
| R3.3 | Effect sizes and confidence intervals | Table 1 caption (242-247); 4.1 (269-277) | Major | C | R1.1, R1.2, R3.12 |
| R3.4 | More foundation models | 2 (126-129); 5 Discussion (440-441); 6 Limitations (450-453) | Minor | A | R3.8 |
| R3.5 | Real multi-institution federation | 3.4 (218-226); 4.6 (380-388); 6 Limitations (455-456) | Major | C | R3.8, F1 |
| R3.6 | Computational cost, memory, dimensionality | 5 Discussion (417-427); 3.2 (174-195) | Major | C | R1.4 |
| R3.7 | Implementation detail for reproducibility | 3.2 (172-195); 3.3 (197-216); 3.4 (218-226); 6 Limitations (445-450) | Major | C | R1.3, R2.1a, R2.2a, R2.2b, F6, F11 |
| R3.8 | Limit claims to evaluated settings | Abstract (46-50); 1 (100-112); 4.6 (372-388); 5 (417-441); 7 (460-468); highlights.txt (4, 8) | Critical | A | F1, F9, R3.4, R3.5, R3.2 |
| R3.9 | Abbreviations and terminology | throughout (instances listed) | Minor | A | R3.13 |
| R3.10 | Figure font size and contrast | Figures 2, 3, 4 (303-330, 407-413) | Minor | C | R1.5, R3.12 |
| R3.11 | Sample sizes in captions | Captions at 265, 306-307, 326-328, 410-411, 242-247, 355-357, 392-393 | Minor | A | R3.10 |
| R3.12 | Confidence intervals or error bars in figures | Figures 1 to 4 | Minor | C | R1.1, R1.5, R3.3 |
| R3.13 | Standardize decimal precision in tables | Tables 1 to 3 (240-260, 353-368, 390-405) | Minor | A | R3.9, F2, F14 |
| R3.14 | Reference formatting | refs.bib; line 493 | Minor | A | R1.3, R2.1b |

Severity totals: Critical 1, Major 12, Minor 13 (26 issues).

## 7. Per-issue detail

### R1.1 Confidence intervals instead of SD

- Referee quote: "**1. Confidence intervals would be preferable to SD** The reported seed standard deviations are extremely small (<less-than or equal to>0.001). Confidence intervals or bootstrap intervals would communicate uncertainty more clearly."
- Location: Table 1 caption, lines 244-245 ("Partitional solutions are seed-stable (SD $\le 0.001$ except ECGFounder, 0.001)"); Section 4.1 lines 269-271; Section 3.3 lines 209-210 (ten seeds).
- Severity: Major. The only uncertainty reported is the spread over random initializations of the clusterer on one fixed cohort. It says nothing about how the ARI would vary with a different sample of patients, which is the uncertainty a reader needs to judge a 0.241 gap or the 9:1 and federated results.
- Class: C (C-run).
- What is and is not derivable: per-cell means are printed (Table 1, 3 decimals); per-cell SDs are not printed, only the bound SD <= 0.001. A t-based 95% CI needs each cell's SD, so the CI is not exactly derivable. An upper bound on the half-width of a seed-level CI is derivable: t(0.975, 9) x 0.001 / sqrt(10) = 2.262 x 0.000316 = 0.0007. This bound is not a CI and must not be printed as one; it only shows that a seed-level CI would be visually the same as the SD and would not answer the referee's point.
- Suggested fix: (1) Run a patient-level (PTB-XL) and record-level (MIT-BIH) bootstrap of the full pipeline for each cell (representation x clusterer, Table 1; clusterer x representation, Table 2; centralized, IID and non-IID, Table 3) and report the 95% percentile interval of ARI, and a bootstrap interval of each adjacent difference (see R1.2, R3.3). (2) Print the intervals either in the tables as "mean [low, high]" or in a supplementary table with the same layout, and state the number of bootstrap resamples and the resampling unit in Section 3.3 (after line 210). (3) Keep the seed SD statement but reword it as a statement about initialization stability, and fix the caption contradiction (F4). (4) Rewrite lines 269-271 ("so the gaps are essentially deterministic") to say the gaps are stable over initializations, and to quote the bootstrap intervals for data-sampling uncertainty.

### R1.2 Effect sizes alongside p-values

- Referee quote: "**2. Add effect sizes alongside p-values** Wilcoxon p-values hit the minimum possible value with ten seeds (p=0.002). Reporting effect sizes such as Cliff's delta would improve interpretation."
- Location: Table 1 caption lines 245-246; Section 4.1 lines 271-274.
- Severity: Minor.
- Class: B.
- Derivation (i), matched-pairs rank-biserial correlation. For n = 10 paired differences with no zero differences, the exact two-sided Wilcoxon signed-rank p-value is 2 x P(T- <= t) under 2^10 = 1024 equally likely sign patterns. T- = 0 occurs in one pattern, so p = 2/1024 = 0.00195, printed as 0.002. The next attainable value, T- = 1, gives p = 2 x 2/1024 = 0.0039. So p = 0.002 implies T- = 0: all ten paired differences have the same sign (first-named representation higher) and none is zero (with a zero difference n drops to 9 and the minimum becomes 2/512 = 0.0039). The normal approximation at T- = 0 gives z = 27.5 / sqrt(96.25) = 2.80, p = 0.005, which is not 0.002, so the printed p also implies the exact test. The matched-pairs rank-biserial correlation is r = (T+ - T-) / (n(n+1)/2) = (55 - 0) / 55 = 1 for each of the three contrasts at lines 272-273.
- Derivation (ii), Cliff's delta. Cliff's delta is unpaired: it needs the 10 x 10 cross-comparisons, which the paired signs do not give. It is still derivable here from the printed SD bound. By Samuelson's inequality, with sample SD s over n = 10 values, no value lies more than s(n-1)/sqrt(n) = 2.846 s from its mean. With s <= 0.001 (caption, line 244) no seed lies more than 0.0029 from its printed mean; allowing for the SD itself being rounded (s < 0.0015) and the means being rounded to 0.0005, no seed lies more than 0.0048 from the printed mean. The smallest gap is ECGFounder over hand-crafted, 0.885 - 0.644 = 0.241, far more than 2 x 0.0048. So every ECGFounder seed exceeds every hand-crafted seed, and likewise for hand-crafted over HuBERT-ECG (0.470) and HuBERT-ECG over raw (0.174): Cliff's delta = 1 for all three. This rests on the caption's SD bound applying to the k-means ARI of each of the four representations; lines 269-270 state it only for hand-crafted, HuBERT-ECG and raw, and the caption gives ECGFounder as 0.001. The writer reports delta = 1 only if the authors confirm the bound covers ECGFounder k-means (F4).
- Suggested fix: in Section 4.1 after line 274, add that all ten paired differences favoured the first-named representation in each contrast (matched-pairs rank-biserial r = 1) and that the seed distributions do not overlap (Cliff's delta = 1); state that both effect sizes are at their maximum and therefore carry the same information as the p-value floor, and that the informative effect size is the ARI difference itself (Delta, already printed) with its bootstrap interval from R1.1. Add one sentence to the Table 1 caption. A citation for the matched-pairs rank-biserial formula is needed; candidate: Kerby (2014), Comprehensive Psychology 3, "The simple difference formula: an approach to teaching nonparametric correlation". It is not in refs.bib and must be verified by citation_compliance_agent before use. Correct Delta = 0.242 to 0.241 or obtain the unrounded value (F2).

### R1.3 HDBSCAN noise handling

- Referee quote: "**3. Clarify HDBSCAN's handling of noise labels** Was noise treated as the following:" / "an additional cluster," / "ignored observations," / "Reassigned to the nearest cluster?" / "This affects ARI interpretation."
- Location: Section 3.3 lines 199-201; Section 4.1 lines 282-285 ("HDBSCAN labels most points as noise"); Table 1 HDBSCAN column.
- Severity: Major. The HDBSCAN column (0.000 to 0.137) cannot be interpreted without it, and lines 199-201 also state that every clusterer had its cluster count set to the number of classes, which HDBSCAN does not accept (F6).
- Class: C (C-info for the handling and parameters; C-run for the noise fraction if it was not logged).
- Suggested fix: state in Section 3.3 which of the three treatments the code uses (the ARI value depends on it; scikit-learn's adjusted_rand_score treats the label -1 as one more cluster unless points are dropped), the HDBSCAN parameters (min_cluster_size, min_samples), and that HDBSCAN chooses its own number of clusters. In Section 4.1 report the noise fraction per representation (line 282 says "most" without a number). If the code counts noise as one cluster, add one sentence that this penalizes HDBSCAN when most points are noise; if the authors also have ARI on non-noise points, report it with its coverage. Cite hdbscan2013 (in refs.bib, currently uncited) at line 200.

### R1.4 Computational cost table

- Referee quote: "**4. Include computational costs** An additional table reporting:" / "embedding time," / "inference memory," / "feature extraction time," / "would reinforce the deployment argument."
- Location: Discussion lines 417-427; Section 4.6 lines 387-388; new table after Table 3 or in Discussion.
- Severity: Major. Deployability is contribution (iii) (lines 107-109) and the basis of the decision rule (lines 417-422), and no cost is measured.
- Class: C (C-run). No timing or memory value is printed anywhere in the manuscript.
- Suggested fix: measure per representation on PTB-XL: feature extraction or embedding time per record (NeuroKit2 features; conv-AE encoder; HuBERT-ECG; ECGFounder including the upsampling), peak inference memory (GPU and host), model parameter count, embedding dimensionality (already printed: ~2000, 32, 16, 768, 1024), and clustering time per clusterer; report hardware, batch size and precision. Add a Table 4 with these columns and one or two sentences in the Discussion paragraph at lines 417-427 tying the costs to the decision rule. The writer must not fill any cell from memory or from the model papers; parameter counts from the model papers may be quoted only with a verified citation. Same request as R3.6.

### R1.5 Expand Figure 2

- Referee quote: "**5. Figure 2 could be expanded** The separability-vs-clusterability plot is compelling but contains only five points. Confidence intervals or multiple seeds per representation could make the figure more informative."
- Location: Figure 2 (`fig3_sep_vs_clust.pdf`, lines 303-309); Section 4.2 lines 289-301.
- Severity: Minor.
- Class: C (C-run for intervals; figure regeneration needs the plotting code, which is not in this repository).
- Suggested fix: regenerate Figure 2 with (a) all five clusterers per representation (values printed in Table 1) or the best ARI with a bootstrap interval (R1.1); (b) the horizontal interval of the supervised ceiling across the five folds (per-fold accuracies are not printed, C-run); (c) the three MIT-BIH representations as a second marker shape (ceilings 0.925, 0.927, 0.741 in the Table 2 caption, ARIs in Table 2), which gives eight representation points from printed values; (d) the random-forest ceiling as a second marker if R3.7/F7 makes those values available. Note in the caption that seed SDs (<= 0.001) are smaller than the markers. Fix the parity line (F13) at the same time. Same request as R3.12.

### R2.1a Input data type from WFDB

- Referee quote: "a. Since ECG signals in the PTB-XL dataset are stored in WFDB format. However, it is unclear what data type was used as input to the model and whether the original data were converted prior to processing."
- Location: Section 3.1 lines 154-163; the only statement of sampling rate is in Limitations lines 445-447 (main benchmark uses the 100 Hz records; ECGFounder receives them upsampled).
- Severity: Minor.
- Class: C (C-info).
- What the manuscript states: PTB-XL version 1.0.3 (line 471); 10 s strips (line 155); the main benchmark uses the 100 Hz records (lines 446-447); ECGFounder input is the 100 Hz signal upsampled to its expected length (447); MIT-BIH beats are windows of [-300, +250] ms around the R-peak over both leads (166-167). What it does not state: the reader used to load the WFDB files, the physical unit (mV) and numeric type of the arrays, any filtering, baseline-wander removal or per-lead normalization, the downsampling method and factor for raw flattening, the resampling method for ECGFounder, the sampling rate fed to HuBERT-ECG and to the conv-AE, and whether the MIT-BIH beats (360 Hz in the database) were resampled.
- Suggested fix: add a "Signal input and preprocessing" paragraph to Section 3.1 stating, from the code: WFDB records read into floating-point arrays in mV (or whatever the code does), sampling rate per representation, filters, normalization, and the resampling method. Move the 100 Hz statement from Limitations into this paragraph and keep the Limitations sentence as the consequence. The public repository (https://github.com/TheAxeC/ecg-representation-clustering, publicly listed today with `core/`, `experiments/`, `paper.py`) is where these facts are; none may be written from assumption.

### R2.1b Justify Lead II only

- Referee quote: "b. The author should provide a clear justification for using only Lead II for rhythm and morphology analysis. Explain why the other ECG leads were not utilized and discuss the implications of this choice."
- Location: Section 3.1 lines 161-162 ("Lead II is used for rhythm and morphology.").
- Severity: Major. Together with R2.2a it bears on whether the hand-crafted versus foundation comparison is between equal inputs.
- Class: A (justification and implications are text; the factual premise of which representation uses which lead depends on R2.2a).
- Suggested fix: in Section 3.1, replace line 161-162 with a sentence that names the representation(s) computed from Lead II (per R2.2a, the hand-crafted features) and justifies it: the RR-interval features that define SR versus AF (lines 97-99, 117-118) are lead-independent because R-peak timing is the same in every lead, and Lead II is the conventional rhythm lead in which the P wave is usually most visible, which matters for the P-wave presence and amplitude features (line 186). Single-lead AF detection is established; clifford2017af (in refs.bib, currently uncited) can support that sentence. A citation for the Lead II P-wave convention is needed and must be verified by citation_compliance_agent; none is in refs.bib. Then state the implications in Section 3.2 or the Discussion: the hand-crafted representation uses one lead while the foundation models receive the full strip (lines 194, 423-424), so the comparison is conservative against the hand-crafted features; morphology features from one lead cannot capture lead-specific morphology; and the single-lead choice is what makes the hand-crafted features usable on 1- or 2-lead devices (lines 420-425, scoped per R3.8). No multi-lead hand-crafted experiment is needed to answer the request.

### R2.2a Lead II versus all leads concatenated

- Referee quote: "a. There appears to be an inconsistency in the manuscript. Subsection 3.1 states that only Lead II is used for rhythm and morphology analysis, whereas the description of raw flattening indicates that all ECG leads are concatenated into one vector. Clarify this discrepancy and justify the use of different input representations in the methodology."
- Location: Section 3.1 lines 161-162; Section 3.2 lines 176-179 (raw), 180-183 (conv-AE), 184-187 (hand-crafted), 188-190 (foundation models), 192-195 (MIT-BIH).
- Severity: Major.
- Class: C (C-info).
- What the text states, representation by representation: Raw flattening (PTB-XL): "each lead is moving-average downsampled and all leads are concatenated" (176-177) and it "reproduces the original pipeline" (176), which "clustered whole 12-lead recordings" (69-70); the text therefore implies all 12 leads, but never says 12, and ~2000 dimensions is not reconcilable without the downsampling factor (12 leads x 1000 samples at 100 Hz is 12,000). Conv-AE (PTB-XL): leads not stated. Hand-crafted (PTB-XL): implied Lead II from "Lead II is used for rhythm and morphology" (161-162), since the hand-crafted features are the rhythm and morphology features; not stated explicitly. HuBERT-ECG and ECGFounder (PTB-XL): implied 12 leads ("The 12-lead foundation models", 194; "tied to the 12-lead strip format", 423-424); not stated as the input. MIT-BIH raw beat: both leads (167); the ~400 dimensions agrees with 0.55 s x 360 Hz = 198 samples per lead x 2 = 396 (360 Hz is the database rate, not printed in the manuscript). MIT-BIH 21-d beat-morphology features and MIT-BIH conv-AE: leads not stated.
- What the manuscript does not state: the leads and sampling rate of each PTB-XL representation; the raw-flattening downsampling factor; the conv-AE input shape on both datasets; the lead(s) of the MIT-BIH 21 features.
- Suggested fix: add a short table (or a column in a new Table "Representations") to Section 3.2 with, per representation and dataset: input leads, sampling rate, input length in samples, output dimensionality, and trained/frozen status. Replace line 161-162 with the scoped sentence from R2.1b. Add one sentence explaining that the inputs differ by design: raw flattening and the conv-AE reproduce the original multi-lead pipeline, the foundation models receive the input format they were pretrained on, and the hand-crafted features use the rhythm lead; and that this is a comparison of representations as they are deployed, not under equal input. All values come from the code (C-info).

### R2.2b Data type and principle per representation

- Referee quote: "b. The manuscript does not clearly describe the data type used in each representation. Specify the data type employed in all representations and explain the underlying principle for each representation."
- Location: Section 3.2 lines 174-195.
- Severity: Minor.
- Class: C (the principle is A; the data types are C-info).
- Suggested fix: for each representation, one sentence on principle and one on data type. Principles available from the manuscript and its references (A): raw flattening keeps amplitude and energy without temporal alignment across recordings (178-179); the conv-AE learns a 32-d code by minimizing reconstruction error, which rewards signal energy, not class structure (121-122, 180-183); the hand-crafted features encode the clinical definitions of rhythm irregularity and beat morphology (117-118, 184-187); HuBERT-ECG is self-supervised (refs.bib title "a self-supervised foundation model"); ECGFounder is described in its preprint abstract as trained on expert annotations from the Harvard-Emory ECG Database (over 10 million ECGs, 150 label categories), that is, label-supervised pretraining. The ECGFounder statement must be checked against ecgfounder2024 by citation_compliance_agent before it enters the text; it matters for R2.4. Data types (C-info): input array type and unit; output: real-valued vectors of the stated dimension; for the hand-crafted features, which are continuous and which are binary or counts (for example "P-wave presence", line 186), and how failed detections or missing values were handled. The 16 features must be listed in full (F11).

### R2.3 Metric definitions, formulas, ranges

- Referee quote: "The description of the performance metrics is insufficient. Explain the physical meaning of each metric, provide its mathematical formulation, and its range."
- Location: Section 3.3 lines 201-209; Related work lines 134-140.
- Severity: Minor.
- Class: A.
- Suggested fix: add a compact paragraph or table in Section 3.3 giving, for each metric actually reported: ARI (Hubert and Arabie, hubertarabie1985): pair-counting agreement between partition and labels, corrected so that its expected value under random labelling is 0; maximum 1; can be negative. AMI (vinh2010): mutual information between partition and labels minus its expected value under random labelling, normalized; expected 0, maximum 1. Silhouette (rousseeuw1987): s(i) = (b(i) - a(i)) / max(a(i), b(i)) averaged over points, range [-1, 1], measured in the clustered space without labels. Largest-cluster fraction: size of the largest cluster divided by n, range [1/K, 1]. Purity: fraction of points in the majority class of their cluster, range up to 1, with the majority-class proportion attainable by a single cluster (0.504 here). Supervised ceiling: cross-validated accuracy of the probe, range [0, 1], majority baseline 0.504. Give formulas in LaTeX with the contingency-table notation. Only metrics that the paper prints need full definitions; NMI, V-measure and Fowlkes-Mallows are named at lines 203-204 but no value is printed anywhere (F7): either print them (C-run or C-info if already computed) and then define and cite them (V-measure: Rosenberg and Hirschberg 2007; Fowlkes-Mallows: Fowlkes and Mallows 1983; both not in refs.bib and to be verified by citation_compliance_agent), or remove them from line 203-204. The second option needs no new citations.

### R2.4 Explain comparative performance

- Referee quote: "Justify the comparative performance of the different feature representations. Explain why the ECG Foundation Cluster achieves the best performance, why the hand-crafted features remain competitive, why HuBERT-ECG exhibits relatively weak performance, and why the Raw and Conv-AE pipelines perform similarly to a majority-class assignment."
- Location: Section 4.1 lines 230-285 (add a paragraph after line 285, or a new subsection before 4.2).
- Severity: Major.
- Class: A (the explanations below are supported by content in the manuscript or its existing references; the HuBERT-ECG mechanism can be stated only as a hypothesis without C-run analysis).
- Supported by the manuscript (A): Hand-crafted competitive: SR and AF differ by definition in rhythm regularity (lines 43-44, 97-99), and the RR-interval features measure exactly that (117-118, 184-185); the ceiling is 0.942. Raw and conv-AE at the majority assignment: raw flattening has no temporal alignment across recordings (178-179), so Euclidean distance between flattened strips is driven by beat phase and amplitude; its linear ceiling is 0.519, barely above 0.504 (290-291), and its agglomerative solution collapses to one cluster (largest-cluster fraction 1.00, 313-316). The conv-AE objective rewards reconstruction of signal energy (121-122) and carries the label weakly (ceiling 0.678) without organizing it (292-294). HuBERT-ECG weak: its ceiling is 0.899, so the label is present but not along the dominant directions that k-means and GMM partition (295-298), consistent with lookingbeyond2026's report that some foundation embeddings organize by dataset rather than clinical label (279-281). ECGFounder best: highest ceiling (0.983) and the label is aligned with its dominant variation; if citation_compliance_agent confirms from ecgfounder2024 that ECGFounder was pretrained with supervised expert labels that include AF (see R2.2b), this is the direct explanation, contrasted with HuBERT-ECG's self-supervised objective.
- Needs new analysis (C-run, optional, listed under C-9): evidence for the HuBERT-ECG mechanism, for example the share of embedding variance in the leading principal components and the ARI of clustering restricted to those components, or which recording attributes (for example age, sex, device) its k-means clusters align with. Without it the text must call the mechanism a hypothesis.
- Suggested fix: add one paragraph per representation family as above, each citing the manuscript's own numbers; label the HuBERT-ECG pretraining-objective explanation as a hypothesis unless C-9 is run. Note that the referee writes "ECG Foundation Cluster"; the response letter should name ECGFounder.

### R2.5 HuBERT-ECG "sharpest" with ARI 0.195

- Referee quote: "Explain why the HuBERT-ECG representation exhibits the sharpest clustering, with a reported ceiling of 0.899, while achieving a relatively low ARI of only 0.195. Discuss the reasons for this apparent discrepancy and clarify how these results should be interpreted."
- Location: Section 4.2 lines 293-295 ("HuBERT-ECG is the sharpest case, with a ceiling of 0.899 but an ARI of only 0.195").
- Severity: Minor.
- Class: D (partial: the manuscript does not claim HuBERT-ECG clusters sharply; the referee's reading is caused by ambiguous wording, which is then fixed as A).
- Evidence for the partial response: "sharpest case" at line 294 refers to the sharpest case of the separability-versus-clusterability gap introduced at line 290, not to clustering quality; Table 1 shows HuBERT-ECG clustering is weak (best 0.195). The ceiling (accuracy, chance 0.504) and ARI (chance 0) are on different scales, so the "discrepancy" is the paper's point: the label is linearly recoverable but not along the axes a partitional clusterer splits.
- Suggested fix: the response letter clarifies the reading respectfully. In the manuscript, reword line 293-295 to "HuBERT-ECG shows the largest gap between separability and clusterability: a linear probe reaches 0.899 accuracy, yet the best clustering reaches ARI 0.195 (GMM)", and add one sentence on interpretation: a high ceiling with a low ARI means the information is present and a supervised or semi-supervised use of the embedding would recover it, while label-free clustering of the raw embedding would not. State that accuracy and ARI have different chance levels and are compared ordinally. The reasons for the gap are the R2.4 HuBERT-ECG paragraph; cross-reference it.

### R3.1 Methodological novelty

- Referee quote: "**1.** The manuscript primarily benchmarks existing ECG representations using established clustering algorithms and evaluation metrics. The authors should clearly articulate the methodological novelty beyond benchmarking and explain how this work advances the current state-of-the-art relative to recent ECG foundation-model benchmark studies."
- Location: Introduction lines 95-112 (contributions; "We do not propose a new method" at 110-111); Related work lines 142-148; Discussion lines 435-441 ("We claim no methodological novelty").
- Severity: Major.
- Class: D (partial: the paper is a benchmark by design and introducing a new algorithm would be scope creep; the request to articulate what is methodologically new is met with text, A).
- What the manuscript can truthfully claim relative to lookingbeyond2026, from its own text: lookingbeyond2026 compares foundation models with one another, including ARI cluster-separability on PTB-XL, and by its own statement has no hand-crafted comparison and omits MIT-BIH (87-91, 142-147). This paper (1) places non-foundation representations (raw, a properly trained reconstruction autoencoder, 16 hand-crafted features) and two foundation models in one chance-corrected, patient-grouped, ten-seed protocol; (2) bounds every clustering score by a linear and a non-linear supervised ceiling computed under the same grouping, which turns a low ARI into a diagnosable geometric versus informational failure; (3) adds cluster-size checks that expose the silhouette collapse and a conditioner sweep that shows the scaler changing ECGFounder's mean ARI from 0.87 to 0.09; (4) tests clusterability under two deployment stressors (9:1 imbalance, non-IID federation); (5) replicates on a morphology task. Items (1), (2) and (3) together are an evaluation methodology for unsupervised ECG representations; that is a methodological contribution at the protocol level, and it is what the paper should call it. It is not a new representation, clustering algorithm or federated method, and the separability-versus-clusterability effect is prior work (sslclustering2025).
- What must not be claimed: that lookingbeyond2026 lacks ceilings, conditioner sweeps or stressors, unless citation_compliance_agent confirms it from that paper (the manuscript states only the hand-crafted and MIT-BIH gaps); that the protocol is the first of its kind; any novelty for the separability-versus-clusterability effect or for federated k-means.
- Suggested fix: (a) replace "We claim no methodological novelty." (line 435) with a sentence that names the contribution positively as an evaluation protocol for unsupervised ECG representations (items 1 to 3 above) and then keeps the existing credit to prior work (435-437); (b) replace "We do not propose a new method" (110-111) with "We do not propose a new representation or clustering algorithm" and move the protocol statement to the front of the contribution list; (c) in Related work after line 148 add two sentences on how the protocol advances the closest benchmark (hand-crafted and reconstruction baselines in the same protocol, ceilings, MIT-BIH, stressors), restricted to what is verified about lookingbeyond2026; (d) the response letter explains why a new algorithm is outside the scope of a benchmark study. Contribution (iii) must be corrected at the same time (F1, R3.8). Open item for the authors, not for the writer: whether to add a genuine algorithmic component in a later study; this revision answers the referee by articulation.

### R3.2 Multi-class datasets

- Referee quote: "**2.** The study evaluates only binary SR-versus-AF clustering and a binary MIT-BIH morphology task. The conclusions would be considerably stronger if validated on additional clinically relevant multi-class arrhythmia datasets to demonstrate broader applicability."
- Location: Section 3.1 lines 152-170; Limitations lines 453-454 ("a heterogeneous multi-class setting is harder and out of scope").
- Severity: Major.
- Class: C (C-run).
- What a text-only response could legitimately say: that the binary tasks were chosen because they have an unambiguous ground-truth partition for chance-corrected evaluation, and that all claims are limited to binary SR-versus-AF and N-versus-V (R3.8). What it could not legitimately say: that the ranking, the stressor results or the decision rule hold for multi-class arrhythmia data, or that multi-class is merely "harder" in a way that would preserve the ordering; there is no evidence either way.
- Content route: multi-class tasks are available on the data the pipeline already loads: MIT-BIH beat classes beyond N and V (for example the AAMI groupings N, S, V, F) with the same beat window and feature set, and PTB-XL rhythm statements beyond SR and AF. A third, independent multi-class rhythm dataset (for example a public 12-lead database with multiple rhythm labels) would answer "additional ... datasets" fully; the dataset choice and its citation must be verified by citation_compliance_agent. Report ARI and AMI with K equal to the number of classes and the supervised ceiling, as in Table 1, in a new subsection of Section 4 with its own table, and update the abstract, Limitations line 453-454 and the scope statements.

### R3.3 Effect sizes and confidence intervals

- Referee quote: "**3.** Although Wilcoxon tests are reported, effect sizes and confidence intervals are missing. Including these statistics would provide a more comprehensive assessment of the practical significance of the observed performance differences."
- Location: Table 1 caption lines 242-247; Section 4.1 lines 269-277.
- Severity: Major.
- Class: C (the effect-size part is B, derived in R1.2; the confidence-interval part needs the bootstrap of R1.1).
- Cross-reference: R1.1 (intervals), R1.2 (effect sizes). One combined revision of Section 4.1 lines 269-277 answers all three; the response letter answers each point separately and points to the same passage.
- Suggested fix: as R1.1 plus R1.2. For "practical significance", report each adjacent contrast as Delta ARI with its bootstrap 95% interval (C-run), the rank-biserial r = 1 and Cliff's delta = 1 (B), and one sentence on what the size of Delta means (for example the 0.241 gap between ECGFounder and hand-crafted on balanced data against the 0.172 reversal under 9:1 imbalance, 0.232 versus 0.060 at lines 376-377). Add the same intervals for the Table 3 and 9:1 results, where the differences are smaller (0.612 versus 0.591) and the interval decides whether "nearly tied" (line 386) is the right description.

### R3.4 More foundation models

- Referee quote: "**4.** Only HuBERT-ECG and ECGFounder are evaluated. Given the rapid development of ECG foundation models, the rationale for excluding other publicly available models should be discussed, together with the potential impact on the reported conclusions."
- Location: Related work lines 126-129; Discussion lines 440-441; Limitations lines 450-453 ("We evaluate one model per foundation family").
- Severity: Minor. The referee asks for a discussion of rationale and impact, which is text.
- Class: A (adding further models would be C-run and is optional, see C-10).
- What a text-only response can say: the selection criteria (publicly released weights, use as frozen feature extractors, input format matching PTB-XL 12-lead strips, and two different pretraining regimes: self-supervised HuBERT-ECG and label-supervised ECGFounder, the latter pending verification per R2.2b), and the impact: every foundation-model statement is about these two models; the hand-crafted versus foundation comparison is a comparison with ECGFounder only; a model that clusters better than ECGFounder under imbalance or federation would change the decision rule at lines 417-422. What it cannot say: that other models would behave like either of the two, or that the two represent the field. The actual reasons for choosing these two must come from the authors; "one model per foundation family" (line 450-451) needs the families named or the phrase removed.
- Suggested fix: add a short paragraph to the Discussion after line 441 with the criteria and impact above, define or drop "family" at line 450-451, and make sure the Conclusion (line 464-465, "a foundation embedding") names ECGFounder (R3.8).

### R3.5 Real multi-institution federation

- Referee quote: "**5.** The federated experiments rely on simulated client partitions from a single dataset. Validation using real multi-institutional datasets or more realistic heterogeneous federated settings would substantially strengthen the deployment claims."
- Location: Section 3.4 lines 218-226; Section 4.6 lines 380-388; Table 3; Figure 4; Limitations lines 455-456.
- Severity: Major.
- Class: C (C-run).
- What a text-only response could legitimately say: that the study is a simulation (already at lines 222 and 455-456), and that the deployment wording is reduced to match (R3.8): "simulated sites", not "realistic site heterogeneity" (line 385) or "multi-site phenotyping" (388). What it could not say: anything about real multi-institution performance.
- Content route: (a) a natural partition within PTB-XL by its recording-site or device metadata (the authors should confirm the field in the PTB-XL 1.0.3 metadata file), which replaces Dirichlet sampling with real acquisition heterogeneity at no new data cost; (b) a federation across separate public 12-lead databases, each database as one client, which is real multi-institution data. Report Table 3 and Figure 4 columns for the new setting and update Section 4.6 and Limitations. Also report the Dirichlet concentration and the number of federated rounds for the existing simulation (R3.7).

### R3.6 Computational cost, memory, dimensionality

- Referee quote: "**6.** The manuscript emphasizes deployability but provides no comparison of computational cost, inference time, memory consumption, or embedding dimensionality. Such analysis is important for evaluating practical clinical deployment."
- Location: Discussion lines 417-427; Section 3.2 lines 174-195.
- Severity: Major.
- Class: C (C-run). Embedding dimensionality is the one part already printed (raw ~2000, conv-AE 32, hand-crafted 16, HuBERT-ECG 768, ECGFounder 1024; MIT-BIH 21, 32, ~400); it goes into the new table as A content.
- Cross-reference: same request as R1.4; one Table 4 answers both, and the response letter answers each.
- Suggested fix: as R1.4, with an embedding-dimensionality column taken from the printed values.

### R3.7 Implementation detail for reproducibility

- Referee quote: "**7.** Several implementation choices, including clustering hyperparameter selection, convergence criteria, preprocessing settings, and foundation-model inference configurations, should be described in greater detail to facilitate full reproducibility."
- Location: Section 3.2 lines 172-195; Section 3.3 lines 197-216; Section 3.4 lines 218-226; Limitations lines 445-450.
- Severity: Major.
- Class: C (C-info: the values exist in the code, not in this repository; no new runs are needed for this item).
- Missing items, each to be stated from the code: clustering: k-means initialization, n_init, max_iter and tolerance; agglomerative linkage (Ward is named at line 199) and metric; spectral affinity and number of neighbours (line 284 mentions a nearest-neighbour graph); GMM covariance type, n_init, tolerance, regularization; HDBSCAN min_cluster_size, min_samples and noise handling (R1.3); how hyperparameters were chosen (fixed defaults or tuned, and on what). Seeds: what a seed changes (clusterer initialization only, or also cohort sampling, the 9:1 subsample and the federated partition); agglomerative Ward is deterministic, so its seed SD is zero by construction. Preprocessing: filters, baseline removal, normalization, raw-flattening downsampling factor, the four conditioners' settings (211-213). Conv-AE: layers, kernels, strides, optimizer, learning rate, batch size, epochs, early-stopping rule and validation fraction ("trained to convergence with a validation split", 181). Hand-crafted: the full list of 16 features (F11), NeuroKit2 version and functions or methods used, handling of failed detections. Foundation models: checkpoints (refs.bib notes give the Hugging Face repositories), input length, sampling rate, lead order, which layer is pooled for HuBERT-ECG ("mean-pooled hidden states", 188) and what "pooled features" means for ECGFounder (189), the upsampling method (447), precision and batch size. Probes: logistic regression regularization and class weighting, and whether the ceiling is accuracy or balanced accuracy (Table 1 caption says accuracy, line 243; Methods says balanced logistic regression, line 207); random-forest settings. 9:1 subsample: its size and how it was drawn (the subsample n is not printed). Federation: Dirichlet concentration, number of rounds, local iterations, weighting of centroid aggregation, per-site sizes. Software versions.
- Suggested fix: add these to Section 3 in compact form, with the bulk in a supplementary table "Implementation settings"; cite the repository commit or release that reproduces the paper in Code and data availability (lines 470-473).

### R3.8 Limit claims to evaluated settings

- Referee quote: "**8.** Discussion should better distinguish empirical observations from general conclusions. Several conclusions are presented broadly despite evaluation on only two datasets and two foundation models. The discussion should more explicitly limit claims to the evaluated experimental settings."
- Location and instances: (1) Introduction lines 107-109, Discussion lines 421-422, Conclusion lines 463-465: hand-crafted features "overtake" ECGFounder under federation; Table 3 shows non-IID 0.612 for ECGFounder and 0.591 for hand-crafted, so this is contradicted, not only too broad (F1). (2) Abstract lines 49-50, Conclusion lines 460-462 and 467-468, highlights.txt line 4, Section 4.1 title line 230: "The representation, not the algorithm, governs label-free ECG structure" stated without task or dataset scope. (3) Discussion lines 425-427: raw and reconstruction pipelines "are not viable for label-free arrhythmia structure" (evaluated: one rhythm task and one beat task). (4) Discussion lines 423-426: the foundation models "cannot embed the 2-lead MIT-BIH beats at all" and the hand-crafted features "transfer across lead sets"; the models were not applied (line 194), the ECGFounder preprint abstract describes an extension to arbitrary single-lead ECGs (F9), and MIT-BIH used a different 21-feature set, not the 16 PTB-XL features (346-347, 361). (5) Abstract line 47 "federation across ten heterogeneous sites", Section 4.6 line 385 "realistic site heterogeneity", line 388 "privacy-preserving, multi-site phenotyping": the sites are simulated by Dirichlet sampling. (6) Conclusion line 464-465 "a foundation embedding trained on ten million recordings": one named model.
- Severity: Critical. Instance (1) is a main conclusion that the paper's own Table 3 contradicts; it is in the contribution list, the Discussion's decision rule and the Conclusion.
- Class: A.
- Suggested fix: (1) rewrite contribution (iii), the decision-rule sentence at 421-422 and the Conclusion sentence at 463-465 to what Table 3 shows: hand-crafted features overtake ECGFounder under 9:1 imbalance (ARI 0.232 versus 0.060) and retain the largest share of their centralized ARI under simulated non-IID federation (0.92 versus 0.69), where the two are close (0.591 versus 0.612) and ECGFounder remains ahead. The abstract (46-49) already states this correctly and is the model wording. (2) Scope the headline sentence to "for the SR-versus-AF and N-versus-V tasks and the representations evaluated here" in abstract, Section 4.1 title or first sentence, Conclusion and highlight 4 (highlights.txt must stay within 85 characters per bullet). (3) Replace "not viable" with what was observed (ARI near zero on both tasks with these configurations). (4) Replace the lead-set sentences with: the foundation models were not applied to 550 ms 2-lead beats because their input is a fixed-length strip; hand-crafted beat features were applicable to that format; remove "at all" and "transfer across lead sets", or state precisely which features were used on each dataset. (5) Insert "simulated" for the sites in the abstract, line 385 and 388. (6) Name ECGFounder at 464-465. Add one sentence at the start of the Discussion that separates the observations (Tables 1 to 3) from the decision rule, which is a recommendation conditional on these settings.

### R3.9 Abbreviations and terminology

- Referee quote: "**9.** Define all abbreviations at their first occurrence and maintain consistent terminology throughout the manuscript."
- Location: throughout; instances below.
- Severity: Minor.
- Class: A.
- Abbreviations not defined, or used before their definition in the body (the abstract and body are treated separately, as Elsevier requires): SR and AF are defined only in the abstract (31-32); first body use line 95 "SR-versus-AF" is undefined. ARI: first body use line 143 "(ARI)" in Related work as if defined; the body definition is at 201-202; define at line 136 where "adjusted Rand index" first appears. AMI: never defined; "adjusted mutual information" is spelled out at 137, 202 and 214, abbreviation first used at 376; define at 137. GMM: first used in the Table 1 header (251) and Table 2 (365); Section 3.3 line 200 says "Gaussian mixture" without "(GMM)". HDBSCAN: never expanded (first at 200) and never cited (hdbscan2013 is in refs.bib). SCP-ECG (156): not expanded. AFIB and AFLT (157): PTB-XL statement codes, not explained; AFLT is atrial flutter, see F10. RR (first 117): not expanded (interval between successive R peaks). SDNN, RMSSD, pNN50 (185): not expanded. QRS (186): standard but can be written "QRS complex". FedAvg (221): not expanded (federated averaging). SD (Table 1 caption, 244): "standard deviation" first spelled out later at 269. "-d" for dimensions (189, 190, 253-257, 361) and "1-D" (181): define once or write "dimensions". Table abbreviations "agglom." and "sup. ceiling" (251), "N/A" (402); Figure 1 axis labels "kmean, agglo, spect, gmm, hdbsc"; Figure 2 axis "acc". Optional: expand MIT-BIH (Massachusetts Institute of Technology and Beth Israel Hospital) at line 166.
- Terminology to make consistent: "sites" (text, Table 3 caption) and "clients" (Figure 4 title "10 clients"); MIT-BIH features called "hand-crafted" (347) and "beat-morphology" (Table 2 header 361 and caption 356); "raw flattening" (176), "raw-flatten" (tables, figures), "raw pipeline" (277) and "raw features" (300); "agglomerative", "Ward agglomerative" (199), "agglom." and "agglo"; "supervised ceiling", "linear ceiling" (300) and "sup. ceiling"; "scaler", "conditioner", "scaling" and "conditioning" for one concept (211-213, 334-341); "foundation embedding" and "foundation model" for ECGFounder (378, 385-386, 465). Spelling: British forms optimise (121), maximised (140), summarise (232), organise (281), generalise (282), organising (293), maximises (318), generalising (453), artefact (299, 319, 431) alongside American forms centralized (49, 225, 381, 384, 393, 397), generalization (109, 165, 343), normalized (203), organization (24-25). Pick one (Elsevier accepts either if consistent) and apply it everywhere.
- Suggested fix: define each abbreviation once at its first body occurrence, use one name per concept as above, and relabel figure axes when the figures are regenerated (R3.10).

### R3.10 Figure font size and contrast

- Referee quote: "**10.** Improve the readability of Figures 2<en dash>4 by increasing font sizes and enhancing contrast."
- Location: Figure 2 (`fig3_sep_vs_clust.pdf`, 303-309), Figure 3 (`fig2_silhouette_trap.pdf`, 323-330), Figure 4 (`fig4_federated.pdf`, 407-413).
- Severity: Minor.
- Class: C (figure regeneration; the plotting code and data are not in this repository).
- Observations from the PDFs: Figure 3's legend text is markedly smaller than the axis labels, and overlapping semi-transparent markers of similar hues (raw-flatten and conv-AE in orange tones) are hard to separate; Figure 4's legend is small and the raw-flatten bars are zero-height, so that group is empty; Figure 2's point labels are small and its title uses a symbol (not-equal sign) rather than words. All three are included at 0.60 to 0.78 of the line width (305, 325, 409), which shrinks the fonts further.
- Suggested fix: regenerate at the final print width with axis labels and legend at the journal body size or not much smaller, use a colour-blind-safe palette with distinct marker shapes per representation, opaque markers or outlines, label the zero raw-flatten bars in Figure 4 with "0.000", and relabel axes per R3.9. Update the `\includegraphics` widths if needed.

### R3.11 Sample sizes in captions

- Referee quote: "**11.** Report sample sizes directly in figure captions for easier interpretation."
- Location: Figure captions at 265, 306-307, 326-328, 410-411; table captions at 242-247, 355-357, 392-393.
- Severity: Minor.
- Class: A (the sizes are printed in the text), except the 9:1 subsample size, which is not printed (C-info, R3.7).
- Suggested fix: Figure 1: "n = 2,542 PTB-XL records (1,282 SR, 1,260 AF)". Figure 2: the same n, five representations, ceiling from patient-grouped five-fold cross-validation. Figure 3: the same n, and state what each point is (representation x clusterer, and whether conditioners are included; the PDF shows more than five points per representation, which the caption does not explain; C-info). Figure 4: "2,542 records over ten simulated sites, ten seeds". Table 2 caption: "3,000 beats (1,500 per class) from 47 records". The same for the table captions where missing.

### R3.12 Confidence intervals or error bars in figures

- Referee quote: "**12.** Include confidence intervals or error bars in all performance figures where appropriate."
- Location: Figures 1 to 4.
- Severity: Minor.
- Class: C (C-run for the intervals, figure regeneration).
- Cross-reference: R1.5 (Figure 2), R1.1 and R3.3 (intervals).
- Suggested fix: after the bootstrap in R1.1, add 95% intervals as error bars to Figure 4 bars and Figure 2 points, and as interval text or a companion panel for the Figure 1 heatmap (a heatmap cannot carry error bars; printing "mean [low, high]" in cells or adding a supplementary table is the appropriate form). For Figure 3 (silhouette against ARI) intervals are optional; state in the response which figures received intervals and why Figure 3 did not, if it does not.

### R3.13 Standardize decimal precision in tables

- Referee quote: "**13.** Standardize decimal precision across all tables."
- Location: Tables 1 to 3 (240-260, 353-368, 390-405).
- Severity: Minor.
- Class: A.
- Instances: Table 1: all cells and the ceiling at 3 decimals; caption SD and p at 3 decimals; consistent. Table 2: all cells and caption ceilings at 3 decimals; consistent. Table 3: ARI cells at 3 decimals, retention column at 2 decimals (0.69, 0.92, 0.61) and "N/A". This is the only within-table inconsistency. Related, outside tables: Figure 1 cell annotations at 2 decimals against Table 1's 3; text values rounded differently from the tables (F14).
- Suggested fix: retention cannot be recomputed exactly to 3 decimals from the printed 3-decimal ARIs (for hand-crafted 0.591/0.644 lies between 0.916 and 0.919 given rounding), so either print retention as a percentage (69%, 92%, 61%, matching "92%" at line 384) and say so in the caption, or obtain unrounded values (C-info) and print 3 decimals. Replace "N/A" with "undefined (centralized ARI 0.000)" in the caption or a footnote. Use 3 decimals for ARI and accuracy everywhere in the text that quotes a table cell (F14), or state once that text values are rounded to 2 decimals.

### R3.14 Reference formatting

- Referee quote: "**14.** Verify that all references follow the journal's formatting guidelines and ensure consistent citation style."
- Location: `manuscript/refs.bib`; `\bibliographystyle{elsarticle-num}` at line 493.
- Severity: Minor.
- Class: A.
- Instances: arXiv preprints typed `@article` with `journal = {arXiv preprint arXiv:...}` and a duplicate `note = {arXiv:...}` (lookingbeyond2026 lines 22-27, sslclustering2025 64-69, ecgfounder2024 37-42), which prints the identifier twice; medRxiv preprint as `@article` with `journal = {medRxiv}` (hubertecg2024 29-35); model-weight URLs in `note` (hubertecg2024, ecgfounder2024), which belong in the text or Code and data availability rather than the reference; proceedings entries without publisher, series or volume (fedavg2017 105-109, clocs2021 111-115, threekg2021 117-121, all published in PMLR); key `wavelettensorecg2018` holds a 2019 entry (harmless, but the writer should not rely on the key for the year); two entries never cited (hdbscan2013, clifford2017af), which R1.3 and R2.1b will use. Preprints should be checked for published versions (ecgfounder2024, hubertecg2024, sslclustering2025, lookingbeyond2026) by citation_compliance_agent; none is asserted here.
- Suggested fix: use `@misc` with `eprint`/`archivePrefix` or a consistent `journal = {arXiv}` plus identifier once; add PMLR volume and publisher for the three proceedings; move weight URLs to Code and data availability; replace preprints with published versions where citation_compliance_agent finds and verifies them; keep elsarticle-num, which matches Elsevier's numbered style for this journal.

## 8. Revision Instructions for draft_writer_agent

Order of work:

1. Critical first: R3.8 instance (1) with F1 (federation claim in lines 107-109, 421-422, 463-465), then the rest of R3.8.
2. Text items that need nothing external (class A, B and the A parts of C and D items): R3.1, R2.5, R2.1b, R2.3, R2.4 (hypothesis wording for HuBERT-ECG), R3.4, R3.9, R3.11, R3.13, R3.14, R1.2, the principle sentences of R2.2b, the dimensionality column of R3.6, and the "found during review" items F2 to F17 that are text-only.
3. Class C items are not to be written until the authors supply the values. Where the writer has to touch a passage that a C item feeds, it inserts a clearly marked placeholder for the author (for example `\textcolor{red}{[AUTHOR: noise fraction per representation]}`) and lists it in the revision log as open. No number, timing, setting or citation may be filled from memory or inferred.
4. Every new citation named in this report (Kerby 2014; Rosenberg and Hirschberg 2007; Fowlkes and Mallows 1983; a source for the Lead II convention; any multi-class or multi-institution dataset; any published version of a preprint; the ECGFounder pretraining description) goes to citation_compliance_agent for verification before it stays in the text.
5. Sections needing rewriting rather than editing: Section 3.2 (representation table and principles), Section 3.3 (metric definitions, HDBSCAN, uncertainty), Section 4.1 paragraph at 269-277 (effect sizes and intervals), Discussion lines 417-441 (decision rule scope, novelty statement, foundation-model rationale). The rest is editing.

Estimated effort: text-only items Significant (30-60 min each for R3.1, R3.8, R2.4, Section 3.2); C items depend on author runs (bootstrap, timing, multi-class, federation) and are Major Rework in total.

## 9. Class C items grouped by the experiment or data they need

C-1. Patient-level bootstrap of the full pipeline (C-run). For each cell of Table 1 (5 representations x 5 clusterers and the ceiling), Table 2 (3 x 3 and ceilings), Table 3 (4 x 3) and the 9:1 result: 95% percentile intervals of ARI and of each adjacent difference; resampling unit patient (PTB-XL) or record (MIT-BIH); state the number of resamples. Feeds: Table 1, 2, 3 cells or a supplementary table; Table 1 caption 244-247; Section 4.1 lines 269-277; Section 4.6 lines 376-386; Section 3.3 after line 210; error bars in Figures 2 and 4. Issues: R1.1, R3.3, R3.12, R1.5.

C-2. Unrounded per-seed values (C-info, from the existing run logs). Per-cell seed SD for every representation; unrounded means for Delta (F2) and retention (R3.13); ECGFounder k-means SD to confirm the Cliff's delta derivation (R1.2, F4). Feeds: Table 1 caption 244-245, lines 269-273, Table 3 retention column.

C-3. Computational cost measurements (C-run). Per representation: extraction or embedding time per record, peak inference memory, parameter count, clustering time per clusterer, hardware. Feeds: new Table 4; Discussion lines 417-427; Section 4.6 lines 387-388. Issues: R1.4, R3.6.

C-4. HDBSCAN facts (C-info; C-run only if not logged). Noise handling in the ARI computation, min_cluster_size and min_samples, noise fraction per representation, optional ARI on non-noise points with coverage. Feeds: Section 3.3 lines 199-201; Section 4.1 lines 282-285; Table 1 caption. Issues: R1.3, R3.7, F6.

C-5. Input and preprocessing facts (C-info). Reader and array type of WFDB data, units, filters, normalization, sampling rate and leads per representation on both datasets, raw-flattening downsampling factor, conv-AE input shape, ECGFounder resampling method, MIT-BIH resampling, leads of the 21 MIT-BIH features, the full 16 hand-crafted features and their types, missing-value handling. Feeds: new preprocessing paragraph in Section 3.1; representation table in Section 3.2; lines 161-162, 176-190. Issues: R2.1a, R2.2a, R2.2b, R3.7, F11.

C-6. Implementation settings (C-info). Clusterer hyperparameters and their selection, convergence criteria, what a seed varies, conv-AE architecture and training, NeuroKit2 version and methods, foundation-model checkpoints, layers, input lengths, precision, probe settings (accuracy or balanced accuracy), random-forest settings, 9:1 subsample size and draw, Dirichlet concentration, federated rounds and aggregation weighting, software versions, repository release. Feeds: Sections 3.2 to 3.4 and a supplementary settings table; Code and data availability lines 470-473; caption of Figure 3 (what each point is). Issues: R3.7, R3.11, F7.

C-7. Multi-class evaluation (C-run). MIT-BIH beat classes beyond N and V with the existing pipeline; PTB-XL rhythm classes beyond SR and AF; optionally a further public multi-class rhythm dataset (citation to verify). Feeds: new results subsection and table; abstract; Limitations lines 453-454; scope statements in R3.8. Issue: R3.2.

C-8. Realistic federation (C-run). PTB-XL partitioned by its recording-site or device metadata (authors to confirm the field), and/or one client per separate public 12-lead database. Feeds: Table 3, Figure 4, Section 4.6, Section 3.4, Limitations lines 455-456. Issue: R3.5.

C-9. HuBERT-ECG mechanism analysis (C-run, optional). Variance share of leading principal components and ARI when clustering on them, or alignment of HuBERT-ECG clusters with recording attributes. Feeds: the HuBERT-ECG paragraph added for R2.4 and the interpretation sentence for R2.5. Without it, that paragraph states a hypothesis.

C-10. Further foundation models (C-run, optional). Additional publicly released ECG foundation models run through the same protocol; citations to verify. Feeds: Table 1, Section 4.1, Discussion. R3.4 is answerable with text; this run would strengthen it.

C-11. Figure regeneration (needs the plotting code). Figures 2 to 4 with larger fonts, higher contrast, distinct markers, error bars from C-1, Figure 2 with MIT-BIH points and a corrected chance-aligned reference line (F13), relabelled axes (R3.9), and Figure 1 if its labels change. Issues: R3.10, R1.5, R3.12, R3.9, F13.

C-12. Missing promised outputs (C-info or C-run). Random-forest ceilings for all representations (promised at lines 206-209, printed only for raw); NMI, V-measure, Fowlkes-Mallows and purity (promised at 203-204, not printed). Either supply them or remove the promise. Issues: F7, R2.3.

## 10. Found during review (not raised by the referees)

F1. Federation claim contradicted by Table 3 (Critical; part of R3.8). Lines 107-109 ("the 16 hand-crafted features are the most robust and overtake the foundation embedding" under imbalance and federation), 421-422 ("overtake it under both class imbalance and site heterogeneity") and 463-465 ("with class imbalance and with site heterogeneity, 16 interpretable hand-crafted features overtake a foundation embedding"). Table 3 line 399-400: non-IID ECGFounder 0.612, hand-crafted 0.591; Section 4.6 line 385-386 itself says "nearly tied". Fix per R3.8.

F2. Delta mismatch. Line 272: "ECGFounder over hand-crafted ($\Delta = 0.242$)"; Table 1 k-means cells give 0.885 - 0.644 = 0.241. The other two Deltas match (0.644 - 0.174 = 0.470; 0.174 - 0.000 = 0.174). Print 0.241, or the unrounded difference from C-2 with a note that Deltas are computed before rounding.

F3. "Adjacent contrast" skips conv-AE. Lines 245 and 271-273 call HuBERT-ECG over raw an adjacent contrast, but conv-AE k-means (0.004, line 254) lies between HuBERT-ECG (0.174) and raw (0.000). Either report HuBERT-ECG over conv-AE and conv-AE over raw, or describe the three tested contrasts without the word "adjacent".

F4. Self-contradictory SD statement. Table 1 caption lines 244-245: "SD $\le 0.001$ except ECGFounder, 0.001"; 0.001 satisfies <= 0.001. Lines 269-270 list only hand-crafted, HuBERT-ECG and raw, omitting conv-AE and ECGFounder. State the SD range for all five representations (C-2).

F5. Conditioning mean not reproducible. Line 335: hand-crafted "mean ARI over clusterers ... 0.61 under power scaling". Table 1 (power scaling) gives (0.644 + 0.711 + 0.672 + 0.544 + 0.060)/5 = 0.526 over all five clusterers and 0.643 over the four without HDBSCAN; neither is 0.61. State which clusterers the mean covers and correct the value (C-2), and do the same check for 0.63, 0.36, 0.23, 0.87 and 0.09 (lines 335-338), which cannot be checked from printed values because only power scaling is tabulated.

F6. HDBSCAN cluster count and citation. Lines 199-201 say each clusterer is run "with the number of clusters set to the number of classes", which does not apply to HDBSCAN; HDBSCAN is not cited although hdbscan2013 is in refs.bib. Fix with R1.3.

F7. Promised outputs not printed. Lines 203-204 promise NMI, V-measure, Fowlkes-Mallows and purity "reported alongside"; no value appears. Lines 204-205 say "Every metric is computed against a majority and a random baseline"; only the majority accuracy (0.504) and random ARI are printed. Lines 206-209 promise linear and random-forest ceilings; only the raw random-forest value (0.71, line 300) is printed. Supply (C-12) or remove the promises.

F8. Limitations argument contradicted by its own numbers. Lines 448-450: native 500 Hz ARI 0.896, upsampled 100 Hz ARI 0.909, so on the subset the upsampled input scored 0.013 higher, and "since upsampling can only discard information it cannot inflate the foundation model's lead" does not follow (clustering ARI is not monotone in information content). Rewrite to report the observed difference in both directions and drop the "cannot inflate" inference; the 300-record subset's selection should be stated (C-6).

F9. Single-lead claim about ECGFounder. Lines 193-195, 423-425 and 454-455 say the foundation models are tied to the 12-lead strip format and "cannot embed the 2-lead MIT-BIH beats at all". The ECGFounder preprint abstract (arXiv:2410.04133, ecgfounder2024) states the model was extended to lower-rank ECGs and arbitrary single-lead ECGs. The defensible reason for not applying the models is the 550 ms beat window against a 10 s strip input, not the lead count. citation_compliance_agent should confirm from the preprint; HuBERT-ECG's input format was not checked here. Fix with R3.8 instance (4).

F10. AF class includes atrial flutter. Line 157: positives are records "carrying an AF statement (AFIB or AFLT)"; AFLT is atrial flutter. The abstract (31-32) and the whole paper call the class atrial fibrillation. State that the positive class is AF or atrial flutter and give the number of AFLT records (C-info), or rename the class; the definitional argument at lines 97-99 (irregular rhythm) is weaker for flutter, which is often regular.

F11. Feature count. Lines 184-187 name 11 features (SDNN, RMSSD, pNN50, coefficient of variation, RR entropy, mean heart rate, P-wave presence, P-wave amplitude, QRS width, QRS amplitude, beat-template consistency) for "16 features". List all 16 (C-5). The 21 MIT-BIH features (193) are not listed at all.

F12. MIT-BIH record count and grouping unit. Line 169: "from 47 records, with the record as the grouping unit". The MIT-BIH Arrhythmia Database has 48 records from 47 subjects, and records 201 and 202 come from the same subject, so grouping by record can place one subject in two folds. State which record was excluded (or correct the count) and whether 201 and 202 are grouped together (C-info).

F13. Parity line in Figure 2. `fig3_sep_vs_clust.pdf` draws y = x from (0.5, 0.5) to (1, 1), comparing accuracy (chance 0.504) with ARI (chance 0); a representation at chance accuracy would need ARI 0.5 to sit on "parity". The caption (306-307) relies on it ("points far below parity"). Replace with a chance-aligned reference (from (0.504, 0) to (1, 1)) or drop the line and describe the gap in words; fix when regenerating (C-11).

F14. Text values rounded differently from tables. Line 293 conv-AE "ARI 0.01" (table 0.004 to 0.008); line 300 linear ceiling "0.52" (table 0.519); line 347 "ARI 0.78" (table 0.783); line 348 raw beat "ARI $\approx 0.05$" (table best 0.049, k-means 0.018); lines 349-350 MIT-BIH conv-AE "ceiling of 0.93 but an ARI of only 0.11" (caption 0.927; table best is GMM 0.127, 0.110 is k-means). State which clusterer each quoted value is from and use table precision (R3.13).

F15. Figure file names do not match compiled numbers. `fig2_silhouette_trap.pdf` is compiled Figure 3 and `fig3_sep_vs_clust.pdf` is compiled Figure 2 (lines 305, 325). Rename the files or swap the order when figures are regenerated, so that the response letter, the referees' numbering and the files agree.

F16. Figure 3 points not explained. The silhouette-trap PDF shows many more points than five representations x five clusterers (for example about a dozen raw-flatten points between silhouette 0.35 and 0.81); the caption (326-328) does not say what a point is (clusterer, conditioner, seed). State it (C-6).

F17. Ceiling metric naming. Table 1 caption line 243 says "logistic-regression accuracy"; Section 3.3 line 207 says "balanced logistic regression". State whether the ceiling is plain or balanced accuracy and whether the logistic regression uses class weighting (C-6); under the 9:1 subsample the two differ materially.

## 11. Reviewer Confidence

Medium-High. Every finding above is anchored to a line of `main.tex`, a printed value or a derivation shown in full. Confidence is lower on items that depend on the code (which leads, HDBSCAN handling, what the seeds vary), which this repository does not contain, and on F9 and F12, which rest on the ECGFounder preprint abstract and on the MIT-BIH database composition and should be confirmed by citation_compliance_agent and the authors.

# Peer Review Report, revision round 2 (re-review)

Manuscript: BSPC-D-26-11935, "Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure". Mode: `academic-paper` revision, peer_reviewer_agent, Round 2 (re-review of revised sections and of new problems). Line numbers refer to `manuscript/main.tex` in the working tree (1016 lines); "base" means commit 03b7915.

Inputs read in full: `.claude/skills/academic-paper/agents/peer_reviewer_agent.md`, `admin/reviews/reviewer-comments.md`, `admin/reviews/revision-round1/review-report.md`, `manuscript/main.tex`, `manuscript/refs.bib`, `manuscript/highlights.txt`, the base `main.tex` (`git show 03b7915:manuscript/main.tex`), `git diff 03b7915 -- manuscript/`, `revision-log.md`, `citation-audit.md`, `response-to-reviewers.md`, `code-facts.md`, `.claude/skills/academic-paper/references/writing_quality_check.md`. From `code/`: `results/results_federated.csv` (all rows), `results/results_compare_strong.csv` rows 256-290, `results/results_mitbih.csv` rows 1-33, 129-161, 257-289, `results/summary.csv` rows 1-8, `results/results_raw.csv` rows 23-33, `experiments/fed_cluster.py` (all), grep of `code/**/*.py` for batch-norm flags and of `experiments/run_analyses.py` for the Wilcoxon call. The four figure PDFs in `manuscript/figures/` were viewed. The elsarticle class read is `/usr/local/texlive/2025/texmf-dist/tex/latex/elsarticle/elsarticle.cls`. Nothing was run, compiled or downloaded; only Read, Grep, git and grep were used, and all arithmetic is shown below.

## 1. Reviewer Summary

| Metric | Value |
|--------|-------|
| Paper Title | Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure |
| Review Round | 2 |
| Verdict | Minor Revision (overall 6.55); not ready to resubmit until the Critical item (author placeholders) and the five Major items below are closed |
| Overall Score | 6.55/10 (Round 1: 5.30/10) |
| Referee points (26) | Adequate 14, Partially adequate 5, Pending 7, Not addressed 0 |
| Found-during-review items (17) | Adequate 13, Partially adequate 0, Pending 3, Not addressed 1 |

## 2. Initial Impression

The revision is substantial and mostly sound. The federation contradiction (F1) is gone from every place it occurred, the methods now state leads, sampling rates, preprocessing, clusterer settings, seeds and HDBSCAN noise handling from the code, every ten-seed cell has a seed SD and a correctly scoped interval, and the numbers I re-derived from `code/results` all reproduce. What remains is of three kinds: author data that is correctly marked as missing (cost table, bootstrap, five settings), a small number of new errors the revision introduced or exposed (appendix table numbering in the letter, MIT-BIH clusterers omitted from Table 3, one unsupported clause in the Discussion, a p-value that depends on tie handling), and layout and style debts (one table likely too wide, semicolon density). Initial impression score: 6.5/10.

## 3. Dimension Scores

| Dimension | Weight | Round 1 | Round 2 | Weighted (Round 2) | Key evidence for the Round 2 score |
|-----------|--------|---------|---------|--------------------|-------------------------------------|
| Originality | 20% | 5/10 | 6/10 | 1.20 | The contribution is now stated positively and specifically as an evaluation protocol (lines 103-109, 741-751) with a bounded comparison to the closest benchmark (lines 153-163, 748-751); it remains a benchmark with no new algorithm, which the text says plainly. |
| Methodological Rigor | 25% | 5/10 | 7/10 | 1.75 | Table 1 (lines 279-300), Section 3.3 (lines 304-389), Section 3.4 (lines 393-408) and Table A1 (lines 845-902) give the settings from the code; seeds and determinism are stated correctly (lines 361-365). Open: no patient-level resampling (lines 787-790), pooled initialisation and pooled conditioner in the federated simulation (lines 400-405) not named as a limitation, MIT-BIH spectral and HDBSCAN runs not reported, foundation-model preprocessing not checked against the models' own pretraining (Major 5). |
| Evidence Sufficiency | 25% | 5/10 | 6/10 | 1.50 | All re-derived numbers reproduce (Section 8). Open: Table 5 has no measured value (lines 726-730), the p = 0.002 claim depends on how ties were handled (Major 4), line 598 "at most 0.049" is exceeded by a stored HDBSCAN run (Major 2), and lines 689-691 claim a result for non-12-lead input that was not tested (Major 3). |
| Argument Coherence | 15% | 6/10 | 7/10 | 1.05 | Abstract, Introduction, Results, Discussion, Conclusion and highlights now agree on the federation and imbalance results (Section 9). The one internal inconsistency left is lines 689-691 against lines 696-702. |
| Writing Quality | 15% | 6/10 | 7/10 | 1.05 | Abbreviations defined at first body use, one name per concept, British spelling throughout (grep in Section 11). Open: semicolons rose from 20 to 102, three very dense paragraphs, a notation clash in the Metrics paragraph, Table 1 likely too wide. |
| **Overall** | **100%** | **5.30** | | **6.55/10** | 1.20 + 1.75 + 1.50 + 1.05 + 1.05 = 6.55 |

Verdict mapping: 6.55 lies in 6.5 to 7.9, Minor Revision. The difference between initial impression (6.5) and overall (6.55) is under 2 points, so no recalibration is triggered.

## 4. Strengths

1. The federation claim now matches Table 4 everywhere. Lines 115-118: "ECGFounder keeps the higher mean ARI (0.612 against 0.591), while the hand-crafted features keep a larger share of their centralised ARI (0.918 against 0.692) and vary less across site partitions"; the same statement appears in the abstract (lines 47-49), Section 4.6 (lines 639-647), the Discussion (lines 693-696), the Conclusion (lines 798-800) and the Figure 4 caption (lines 677-678), and the federated intervals are used to decide the comparison (lines 645-647, "The two intervals overlap, so these intervals do not separate the two representations on mean ARI").
2. Uncertainty is reported for what it is. Lines 368-370 state that the seed intervals "describe the variation due to clusterer initialisation on a fixed cohort; they do not describe how the ARI would vary with a different sample of patients", the Table A2 caption (lines 909-911) separates centralised from federated cells, and Limitations (lines 787-790) repeats it. Every interval I re-derived reproduces (Section 8).
3. The HDBSCAN answer to R1.3 is exact and traceable: noise is one extra cluster in the ARI (lines 312-314, matching `code/core/cluster_eval.py` line 86 per code-facts C6), the cluster count is no longer said to be fixed for HDBSCAN (lines 307-308), and the noise-fraction bounds at lines 487-489 follow correctly from the stored purity and largest-cluster fraction (Section 8).
4. The methods now let a reader rebuild the pipeline: lead use per representation (lines 183-191), input arrays (Table 1), all 16 and all 21 features (lines 243-254, 268-275), the cohort draw (lines 180-183), and every clusterer, probe and network setting (Table A1).

## 5. Issues by Severity

### 5.1 Critical

| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---------|-------|----------|---------------|--------|
| C1 | 3.1, 5, Table 5, Code and data availability, Table A1 | Twenty red author placeholders remain on 14 lines, and Table 5, the answer to R1.4 and R3.6, contains no measured value. The manuscript cannot be resubmitted in this state. This is author data, correctly marked, not a drafting failure. | `grep -c AUTHOR main.tex` gives 14 lines: 176, 710, 720, 726, 727, 728, 729, 730, 757, 810, 889, 890, 894, 899; lines 726-730 carry two placeholders each. | Authors supply: AFLT count (line 176), time and peak memory per representation with hardware, batch size and precision (lines 710-712, 720, 726-730), selection reasons for the two foundation models (757-758), tagged release or DOI (810-811), ECGFounder batch size (889), checkpoint revisions (890), per-site sizes (894), software versions (899). Then remove `\textcolor{red}` and decide whether `xcolor` is still needed. | Major Rework (measurements) |

### 5.2 Major

| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---------|-------|----------|---------------|--------|
| M1 | Appendix A (line 835); response letter | Appendix tables will not compile as "Table A1, A2, A3". elsarticle's `\appendix` (elsarticle.cls lines 1343-1353) redefines `\thetable` as `\@Alph\c@section.\arabic{table}` and resets section, subsection and equation counters, but not the table counter. The body has five tables (`\begin{table}` at lines 279, 423, 605, 651, 714), so the appendix tables compile as Table A.6, A.7 and A.8. The letter (lines 7, 21, 47, 73, 153, 185, 187, 221, 229) and the revision log call them A1 to A3. | elsarticle.cls lines 1343-1353 read; `\begin{table}` order from the Read of main.tex. | Add `\setcounter{table}{0}` immediately after `\appendix` (line 835) so the tables compile as A.1, A.2, A.3, and write "Table A.1" (with the period, as elsarticle prints it) in the letter. | Quick Fix |
| M2 | 3.3 (lines 304-311), 4.5 (line 598), Table 3 (lines 605-623), Table A2, Table A3 | MIT-BIH was clustered with all five clusterers, but Table 3 reports three. The stored spectral and HDBSCAN runs exist, and one of them contradicts new text: line 598 says the raw beat window reaches "ARI at most 0.049", while raw-beat HDBSCAN has ARI 0.107. Section 3.3 now states the MIT-BIH HDBSCAN minimum cluster size (60), which makes the omission visible. | `results_mitbih.csv` row 33: raw_beat, power, hdbscan, ARI 0.10736776; row 161: beat_morph HDBSCAN 0.07418011 (6 clusters); row 289: deep_ae HDBSCAN 0.03625067 (8 clusters). Spectral means by hand: beat-morphology (6 x 0.0006251 + 0.0020861 + 3 x 0.0004135) / 10 = (0.0037506 + 0.0020861 + 0.0012404) / 10 = 0.0007077 (rows 141-150); conv-AE (0.0001209 + 0.0030998 + 0.0044906 + 0.0008803 + 0.0008803 + 0.0013694 + 0.0041402 + 0.0028099 + 0.0028099 + 0.0006589) / 10 = 0.0212602 / 10 = 0.0021260 (rows 269-278); raw-beat (2 x 0.0000809 + 2 x 0.0007910 + 0.0005922 + 4 x 0.0001689 + 0.0000011) / 10 = 0.0030128 / 10 = 0.0003013 (rows 13-22). | Add spectral and HDBSCAN rows to Table 3 (0.001, 0.002, 0.000 spectral; 0.074, 0.036, 0.107 HDBSCAN, single runs) and the matching rows to Tables A2 and A3 from the same CSV, or state in the Table 3 caption that they were run and give the values. Change line 598 to "ARI at most 0.049 with the three partitional and hierarchical clusterers, 0.107 with HDBSCAN", and note that on MIT-BIH HDBSCAN is the best clusterer for the raw beat window, unlike on PTB-XL (line 484). No new run is needed. | Moderate |
| M3 | 5 Discussion (lines 689-691) | Residual R3.8 overreach. "If the data are imbalanced, if interpretability or low dimensionality matters, or if the input is not a 12-lead strip, the 16 hand-crafted features were the better choice in these experiments". No experiment compared the 16 features with a foundation model on non-12-lead input: on MIT-BIH the 21 features were used and the foundation models were not applied, which lines 696-702 of the same paragraph say. | Lines 689-691 against lines 696-702 and 266-277. | Drop "or if the input is not a 12-lead strip" from that sentence and keep the input-format point in the sentences at lines 696-702, adding that the 16 PTB-XL features are computed from lead II alone (line 184) and can therefore be computed wherever lead II is available, which was not evaluated. | Quick Fix |
| M4 | 3.3 (lines 370-371), Table 2 caption (lines 433-434), 4.1 (lines 467-471) | The p = 0.002 statement, "the smallest value attainable with ten seeds", assumes the exact signed-rank distribution without ties. All three contrasts have tied paired differences (code-facts section 13 item 5): ECGFounder minus hand-crafted has three groups of three equal differences (seeds 0, 1, 9; 2, 4, 7; 3, 5, 6), hand-crafted minus HuBERT-ECG has ten equal differences, HuBERT-ECG minus raw has a group of three (seeds 1, 7, 8) and a group of two (5, 9). `code/experiments/run_analyses.py` line 57 calls `wilcoxon(va[:n], vb[:n])` with defaults, and the p-values are not stored. If the installed scipy used the normal approximation for tied data, the printed values would differ. The revision log (open item 13) says two of the three contrasts have ties; the stored values show all three. | Normal approximation with tie correction, T- = 0, mean n(n+1)/4 = 27.5, variance 10 x 11 x 21 / 24 = 96.25 minus sum(t^3 - t)/48. ECGFounder over hand-crafted: 96.25 - 3 x 24 / 48 = 94.75, z = 27.5 / 9.734 = 2.825, two-sided p about 0.005. Hand-crafted over HuBERT-ECG: 96.25 - 990 / 48 = 75.625, z = 27.5 / 8.696 = 3.162, p about 0.0016. HuBERT-ECG over raw: 96.25 - (24 + 6) / 48 = 95.625, z = 27.5 / 9.779 = 2.812, p about 0.005. | Authors rerun `run_analyses.py`, record the scipy version and the three printed p-values, store them in `code/results/`, and print what was obtained. If the values are 0.005, 0.002, 0.005, remove "the smallest value attainable" and state that the normal approximation with tie correction was used. The effect sizes (r = 1, Cliff's delta = 1) are unaffected. | Moderate (author run) |
| M5 | 3.2 (lines 223-226, 255-264), Table 1 (lines 293-294), Table A1 (lines 885-889), 5 (lines 753-756) | Whether the foundation models received the preprocessing their pretraining used is not established in the manuscript. HuBERT-ECG receives unfiltered, unnormalised physical values (line 258, "without normalisation"; Table 1 "none"), and ECGFounder is run with batch normalisation disabled (line 887, "built with batch normalisation and dropout disabled"; `code/experiments/arm_ecgfounder.py` line 47 `use_bn=False`). The text says the models receive "the 12-lead strip their pretrained weights are built for" (lines 224-225). If either model's published pipeline differs, every number for that model is affected and the HuBERT-ECG explanation at lines 531-538 lacks the most direct candidate. I could not check the model papers or repositories here (no web access). | Lines cited; grep of `code/**/*.py` for `use_bn`. Revision log open item 15. | Authors state, with a citation or the model card, the preprocessing each model's authors use (filtering, amplitude scaling, sampling rate, segment length, batch-norm mode) and confirm that this study matches it; if it does not, say so in Section 3.2 and Limitations and add the mismatch as a third HuBERT-ECG hypothesis at line 532. | Moderate (author check) |

### 5.3 Minor

| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---------|-------|----------|---------------|--------|
| m1 | Table 1 (lines 279-300) | Likely too wide. Under `preprint,11pt` elsarticle loads no geometry (jtype 0, elsarticle.cls lines 71-73 and 1252-1300), so the text width is article's 360pt. Seven left-aligned columns at `\footnotesize` (9pt) with widest cells "beat-morphology", "MIT-BIH", "Leads", "$6000$ (first 5\,s at 100\,Hz)", "z-score per channel", "Training", "Output" come to roughly 64 + 38 + 24 + 106 + 80 + 38 + 30 = 380pt of text plus 7 x 12pt = 84pt of column separation, about 464pt. | Estimate with about 4.5pt per character at 9pt; not compiled. | Shorten the Input column (move "first 5 s" to a table note), merge Data into a group row as in Table A2, or use `p{}` columns with `\raggedright`. | Quick Fix |
| m2 | Table 5 (lines 722-731), Table A1 (line 851) | Table 5 is plausibly too wide (headers "Peak inference memory", "Time per record" and the cell "trained on the cohort", about 356pt of text plus 60pt separation). Table A1 is overfull by exact arithmetic: 0.22 + 0.72 = 0.94 of 360pt = 338.4pt plus 4 x 6pt = 24pt gives 362.4pt, 2.4pt over. | Arithmetic shown. | Table A1: use `p{0.22\linewidth}p{0.70\linewidth}`. Table 5: shorten headers ("Time/record", "Peak memory") and write "trained" with a note. | Quick Fix |
| m3 | 3.3 Metrics (lines 319-320, 339-341) | Notation clash: $a_i$ and $b_j$ are cluster and class sizes, then $a(i)$ and $b(i)$ are silhouette distances in the same paragraph. | Lines cited. | Rename the silhouette quantities, for example $\bar d_{\mathrm{in}}(i)$ and $\bar d_{\mathrm{out}}(i)$. | Quick Fix |
| m4 | 3.3 (lines 312-313 against 337) | Line 312-313 says the noise label is "passed unchanged to the external indices"; line 337 says purity counts noise "as misassigned", which is what the code does (code-facts C6) but is not passing the label unchanged. | Lines cited. | Restrict line 312-313 to "ARI, AMI, NMI and the Fowlkes-Mallows index" and keep the purity statement. | Quick Fix |
| m5 | 3.3 (line 370), Table 2 caption (lines 432-434), letter R1.2 | "Three contrasts of the $k$-means ARI are tested": the code tests four pairs (code-facts C12: ecgfounder vs rhythm_morph, rhythm_morph vs hubert_ecg, rhythm_morph vs raw_flatten, hubert_ecg vs raw_flatten). | Code-facts C12. | Report all four or say "four contrasts were tested; three are reported because ...". | Quick Fix |
| m6 | 3.3 (lines 356-359) | The random-forest probe "is applied to the raw-flatten representation"; the code applies it to four representations (code-facts D3) and only the raw-flatten value is reported. | Code-facts D3, D4. | Say it was run on four representations and give all four values once the authors recover them (revision log open item 17), or say why only raw-flatten is reported. | Quick Fix |
| m7 | Figure 2 caption (lines 547-548), Table 2 caption (line 431) | "the seed SDs of the other three are at most 0.013" while Table A2 prints raw-flatten GMM SD 0.0133 (line 921); the Table 2 caption mixes four decimals (0.0013) and three (0.013, 0.012) in one sentence. | Lines cited. | Write "at most 0.0133" in the Figure 2 caption, and give 0.0012, 0.0133, 0.0116 in the Table 2 caption, matching Table A2. | Quick Fix |
| m8 | Abstract (lines 45-46), Introduction (lines 113-115), highlight line 8 | The 9:1 result is one $k$-means run on one subsample (lines 633-634) but is stated without that qualifier in the abstract, the contribution list and the highlight. | Lines cited. | Add "on one 9:1 subsample" in the abstract and Introduction; the highlight can stay if the abstract carries it. | Quick Fix |
| m9 | 3.4 (lines 400-405), 6 (lines 784-787) | The simulated federation initialises centroids from the pooled matrix and fits the power conditioner on all records before partitioning, neither of which a real federation can do. Both are disclosed in Methods but not in Limitations, which R3.5 asks about. | `fed_cluster.py` lines 72 and 100 read. | Add one sentence to Limitations naming both. | Quick Fix |
| m10 | 4.2 (lines 518-520, 527-529) | "eight of the 16 features measure the RR intervals directly" includes the beat count, which is not an RR-interval measure; "the label is then a function of a few dominant feature axes" and "its label information lies along its dominant variation" are stated as facts though no axis analysis was done; "all four partitional clusterers" counts Ward agglomerative, which is hierarchical. | Lines cited; feature list lines 243-248. | "eight are computed from the detected R peaks"; hedge the two axis statements ("consistent with"); "the four clusterers other than HDBSCAN". | Quick Fix |
| m11 | 1 (lines 103-104) | "applied to five representations on two tasks": MIT-BIH uses three. | Lines 266-268. | "applied to five representations on PTB-XL and three on MIT-BIH". | Quick Fix |
| m12 | Table 1 (lines 282, 288, 292) | The caption defines Leads as a number, and the hand-crafted row gives "II"; the Normalisation column holds "NeuroKit2 cleaning", which is a filter. | Lines cited. | Header "Leads (count or name)" and "Filtering / normalisation". | Quick Fix |
| m13 | 2 (lines 158-159) | "We fill both gaps and add a supervised ceiling" reads as a gap in the closest benchmark; the citation audit (claim h5) records that it trains lightweight classifiers on the embeddings. | Citation audit row h5. | "and pair each clustering score with a supervised ceiling computed on the same features and patient grouping". | Quick Fix |
| m14 | 3.1 (line 196) | R2.1a asked what data type was used; "in the units declared in each record header" does not name the unit. | Code-facts A2. | Authors confirm and write "in millivolts" if the headers say so. | Quick Fix |
| m15 | Whole text | Semicolons rose from 20 to 102 (`git show 03b7915:manuscript/main.tex` piped to `grep -o ';'`, then `grep -o ';' manuscript/main.tex`), far above the writing-quality guide's 2 per 1000 words. The densest new paragraphs are Section 3.1 PTB-XL (lines 169-192), Metrics (lines 318-348) and the first Discussion paragraph (lines 684-706). | Counts shown. | Split the three paragraphs and replace most semicolons in prose with full stops. | Moderate |
| m16 | 1 (line 93), 5 (line 735) | Self-description "a careful, honest benchmark" and "reframes ... honestly" (base text, kept). | Lines cited. | Remove "careful, honest" and "honestly". | Quick Fix |

### 5.4 Suggestions (phrasings that are negative-sounding but can be stated more precisely)

| # | Line | Current | More precise statement |
|---|------|---------|------------------------|
| s1 | 484-485 | "HDBSCAN underperforms throughout." | "HDBSCAN gives the lowest or joint-lowest ARI of the five clusterers for every PTB-XL representation (at most 0.137)." Checked against Table 2: 0.000, 0.000, 0.060, 0.000, 0.137 are each the row minimum or tied with it. |
| s2 | 487-489 | "the noise fraction was not recorded, but the observed purity and cluster sizes bound it to" | "the stored purity and cluster sizes place the noise fraction between" |
| s3 | 633-634 | "so no interval is available for them" | "so they are single-run values" |
| s4 | 778-780 | "multi-class arrhythmia tasks and further datasets were not evaluated, and every result in this paper is limited to these two tasks" | "The results apply to these two binary tasks." |
| s5 | 787-790 | "a resampling of patients or records ... was not performed" | "the intervals describe initialisation and partition variability on the cohorts used" |

## 6. Cross-Section Checks

| Check | Status | Notes |
|-------|--------|-------|
| Title matches content | Pass | |
| Abstract reflects findings | Pass with m8 | Lines 45-49 state imbalance and federation as Table 4 and Section 4.6 do; the 9:1 single-run qualifier is missing. |
| Introduction to Conclusion alignment | Pass | Contribution (iii) (lines 112-118) and Conclusion (lines 797-800) agree with Table 4. |
| Research question answered | Pass | Scoped to the two binary tasks (lines 49, 794-796). |
| All tables and figures referenced | Pass | Every `\ref` has a `\label` (grep listing: 16 distinct refs, 24 labels; `app:impl` and the section labels are unreferenced, which is harmless). |
| Citation format consistent | Pass | 24 cited keys equal the 24 bib keys (grep of `\cite{...}` keys against `@type{key` lines, no difference). |
| Word count within target | Not verified | No journal limit stated in the repository; abstract 241 words per the revision log, not re-counted here. |
| Mandatory inclusions | Pass | Data availability, ethics, CRediT, funding, competing interests, AI disclosure, Limitations present (lines 766-833). |

## 7. Status per item

Status values: Adequate; Partially adequate; Not addressed; Pending (needs author data or runs, correctly marked in the manuscript and letter).

### 7.1 Referee points

| ID | Status | main.tex evidence | Judgement |
|----|--------|-------------------|-----------|
| R1.1 | Partially adequate; bootstrap Pending | Lines 366-370: "For every ten-seed cell we report the seed standard deviation (SD) and a 95\% interval ... These intervals describe the variation due to clusterer initialisation on a fixed cohort; they do not describe how the ARI would vary with a different sample of patients." Table A2 lines 904-958; Limitations lines 787-790. | Seed intervals for all 33 ten-seed cells, correctly scoped, and informative for the federated cells. The referee's "bootstrap intervals" (sampling of patients) are not computed; the letter marks this Pending. |
| R1.2 | Adequate | Lines 372-376 define $\Delta$, $r=(T_+-T_-)/(m(m+1)/2)$ and Cliff's delta; lines 471-475: "In each contrast all ten paired differences are positive, so the matched-pairs rank-biserial correlation is $r=1$, and every seed of the first representation exceeds every seed of the second, so Cliff's delta is 1." | Confirmed against the per-seed values in code-facts item 5 (all differences positive, distributions disjoint). See M4 on the p-value and m5 on the fourth contrast. |
| R1.3 | Adequate | Lines 312-314: "The noise label is passed unchanged to the external indices, so all noise points together form one additional cluster in the ARI and AMI; noise points are neither discarded nor reassigned." Lines 485-489 give noise fraction 1 for three representations and bounds for two. | Answers the referee's three-way question directly and matches code-facts C6. Bounds re-derived in Section 8. |
| R1.4 | Pending | Lines 708-712 and Table 5 lines 722-731, every time and memory cell `\textcolor{red}{[AUTHOR]}`. | Correctly marked; see C1. |
| R1.5 | Pending | Caption lines 543-551 rewritten; `fig3_sep_vs_clust.pdf` still shows five points and the parity line from (0.5, 0.5) to (1, 1). | Caption is accurate; figure regeneration is marked Pending in the letter. |
| R2.1a | Adequate | Lines 194-198: "read with the \texttt{wfdb} Python package into 32-bit floating-point arrays of the physical signal values in the units declared in each record header, without unit conversion. The main benchmark uses the 100\,Hz versions of the records (1\,000 samples per lead)." | Answers both halves of the question; m14 asks for the unit by name. |
| R2.1b | Adequate | Lines 183-191: "the hand-crafted features are computed from lead II alone ... One lead suffices for the RR-interval features, because R-peak timing is common to all leads, and AF detection from a single lead is an established task \cite{clifford2017af}. ... the comparison does not favour it in input." | Justification and implications both given; citation supported per citation audit (d). |
| R2.2a | Adequate | Lines 223-227: "The inputs differ by design ... The comparison is therefore between representations as they would be deployed, not under equal input." Table 1 lines 290-297. | Discrepancy resolved; values match code-facts A3 to A11. Layout issue m1. |
| R2.2b | Adequate | Lines 221-222: "All inputs are 32-bit floating-point arrays, and every representation outputs a real-valued vector"; principles at lines 229-264; feature lists at 243-254 and 268-275. | Complete. 16 = 8 + 8 and 21 = 5 + 2 x 8 checked against the lists. |
| R2.3 | Adequate | Lines 318-348 (ARI equation, AMI, NMI, FMI, purity, silhouette, largest-cluster fraction, each with range) and 350-354 (ceiling range). | Formulas correct (ARI denominator and expectation term; AMI and NMI with arithmetic-mean normalisation). Minor m3, m4. |
| R2.4 | Adequate | Lines 516-538, one explanation per representation; HuBERT-ECG explanations labelled "two hypotheses, neither tested here" (line 532-533). | Answers all four sub-questions. Minor hedges m10; M5 may add a third hypothesis. |
| R2.5 | Adequate | Lines 502-508: "HuBERT-ECG shows the largest gap between separability and clusterability: a linear probe reaches an accuracy of 0.899, yet the best clustering reaches an ARI of 0.195 (GMM). Accuracy (chance level 0.504 here) and ARI (chance level 0) are on different scales, so the two are compared ordinally." | Ambiguity removed and interpretation given; the letter's partial disagreement is courteous and correct. |
| R3.1 | Adequate (reasoned partial disagreement) | Lines 103-104: "The contribution is an evaluation protocol for unsupervised ECG representations"; lines 160-163; lines 741-751: "It introduces no new representation, clustering algorithm or federated method." | The novelty is articulated positively and the advance over the closest benchmark is limited to verified differences. The referee may still want more; m13 tidies the one ambiguous gap claim. |
| R3.2 | Partially adequate | Lines 49, 602-603, 778-780 ("multi-class arrhythmia tasks and further datasets were not evaluated, and every result in this paper is limited to these two tasks"), 794-795. | Claims are scoped correctly, but the requested validation is not done. The letter labels it "Pending" while also saying it is "not part of this revision"; see letter issue L6. The round-1 report listed routes that need no new data (MIT-BIH AAMI classes, PTB-XL rhythm statements beyond SR and AF). |
| R3.3 | Partially adequate; bootstrap Pending | As R1.1 and R1.2; lines 645-647. | Effect sizes adequate; intervals are initialisation-level only. |
| R3.4 | Pending (author reasons) | Lines 753-764, placeholder at 757-758; Limitations lines 775-777. | Properties and impact on conclusions are stated adequately; the actual selection reasons are an author placeholder, correctly marked. |
| R3.5 | Partially adequate | Lines 395-399 ("ten simulated sites drawn from the single PTB-XL cohort"), 648-649, 784-787 ("it does not model differences in devices, acquisition protocols or populations between institutions, and real multi-institution data were not evaluated"). | Deployment wording reduced correctly; no realistic federation run; pooled initialisation and conditioner not in Limitations (m9). Same letter labelling issue as R3.2. |
| R3.6 | Pending | Table 5 dimensionality and training columns filled (lines 726-730); time and memory empty. | Correctly marked. |
| R3.7 | Pending (five author values) | Table A1 lines 855-899; Section 3.3 lines 315-316 "no setting was tuned, and every setting not listed is the scikit-learn default". Placeholders at 810, 889, 890, 894, 899. | Every setting available in `code/` is stated and matches code-facts. Because library versions are lower bounds only, "default" is version-dependent until line 899 is filled. |
| R3.8 | Partially adequate | Fixed: abstract 45-49, Introduction 112-118, 4.1 418-421, 4.6 636-649, Discussion 684-706, Conclusion 794-804, highlights 4 and 8. Residual: lines 689-691 "or if the input is not a 12-lead strip, the 16 hand-crafted features were the better choice in these experiments". | The Critical contradiction is resolved everywhere. One clause still claims an untested result (M3); 9:1 qualifier missing in abstract and Introduction (m8). |
| R3.9 | Adequate | Definitions at first body use: MIT-BIH 91-92, SR and AF 98, ARI 114, RR 127, AMI 148, SCP-ECG and AFIB/AFLT 171-174, FFT 236, SDNN, RMSSD, pNN50 244-246, GMM and HDBSCAN 305-306, NMI 334, SD 366, FedAvg 394, IID and non-IID 397-399; FMI and LCF in the Table A3 caption. Figure-internal labels decoded in captions (455-456, 545, 674). | Grep for -ize, -yze, labeled, favor, neighbor, artifact returns only LaTeX keys, "size" words and the CRediT term. Figure-internal "clients" and "centralized" remain until regeneration. |
| R3.10 | Pending | No figure file changed. | Correctly marked in the letter. |
| R3.11 | Adequate | Captions at 425, 453-454, 543, 570-575, 607-608, 653, 674-675 carry n and class counts; Figure 3 caption explains a point. | Complete. "bottom right" confirmed by viewing `fig2_silhouette_trap.pdf`. |
| R3.12 | Pending | Caption 674-676: "mean ARI over ten seeds, without error bars". | Correctly marked. |
| R3.13 | Adequate | Table 4 retention 0.692, 0.918, 0.611 (lines 663-665), caption 655-657; Table A2 caption 911-912. | Decimal precision consistent within tables; retention re-derived (Section 8). |
| R3.14 | Adequate | `refs.bib` 24 entries, all cited; preprints as `@misc` with DOI; PMLR and LNCS fields added; published versions for ECGFounder and Weng et al. | Matches the citation audit. |

### 7.2 Found-during-review items

| ID | Status | main.tex evidence | Judgement |
|----|--------|-------------------|-----------|
| F1 | Adequate | See Strength 1. | Removed everywhere it occurred. |
| F2 | Adequate | Lines 468-471: "$\Delta = 0.242$ ... ($\Delta$ is the difference of the unrounded seed means)". | 0.88542012 - 0.64389583 = 0.24152429, rounds to 0.242. |
| F3 | Adequate | Lines 370, 432-433, 467: "three contrasts", no "adjacent". | See m5 on the fourth contrast in the code. |
| F4 | Adequate | Lines 431, 460-462. | Matches Table A2; m7 on precision. |
| F5 | Adequate | Lines 584-585: "mean ARI over all 32 runs per conditioner (ten seeds each of $k$-means, spectral and GMM, one run each of Ward agglomerative and HDBSCAN)". | Hand-crafted power: (10 x (0.6438958 + 0.6719890 + 0.5444728) + 0.7112614 + 0.0599756) / 32 = 19.3748130 / 32 = 0.6055, prints 0.61. |
| F6 | Adequate | Lines 307-308: "For the first four the number of clusters is set to the number of classes, $K=2$. HDBSCAN chooses its own number of clusters". | Cited hdbscan2013. |
| F7 | Adequate | Lines 345-348; Table A3 lines 960-1012; V-measure no longer named. | m6 on the random-forest wording. |
| F8 | Adequate | Lines 772-775: "the ARI was 0.896 at 500\,Hz and 0.909 after upsampling, a difference of 0.013 in favour of the upsampled input. The check covers one subset and one run". | "cannot inflate" removed; subset selection stated (lines 770-771). |
| F9 | Adequate | Lines 275-277, 696-702: "Whether the foundation models can embed shorter or fewer-lead inputs was not tested here; the ECGFounder authors describe an extension of their model to single-lead ECGs \cite{ecgfounder2024}." | Supported per citation audit (a2). |
| F10 | Pending (AFLT count) | Lines 32, 173-177, 780-781; placeholder at 176. | Class definition corrected; count needs the cohort file. |
| F11 | Adequate | Lines 243-254, 268-275. | 16 and 21 features listed and counted. |
| F12 | Pending (record count) | Lines 213-215: "from 47 records. The record identifier is the grouping unit for cross-validation; records are not mapped to subjects." | Grouping stated as the code does it; "47" not verifiable from `code/` (code-facts B5); the revision log carries it as an open item. |
| F13 | Pending (figure) | Lines 548-551: "The dashed line labelled ``parity'' joins (0.5, 0.5) and (1, 1); ... it is a visual guide only". | Caption accurate; the line itself changes only with regeneration. |
| F14 | Adequate | Lines 416-418, 500-501, 513-514, 597-601. | Values at table precision with the clusterer named. Line 598 is wrong for a different reason (M2). |
| F15 | Not addressed | `fig2_silhouette_trap.pdf` still compiles as Figure 3 (line 569) and `fig3_sep_vs_clust.pdf` as Figure 2 (line 542). | No effect on compiled output; rename at regeneration as the revision log's open item 12(f) states. |
| F16 | Adequate | Lines 572-576: "Each point is one clustering run of one representation ... 160 runs in total, of which 157 are drawn". | 5 x 32 = 160; 160 - 3 = 157. |
| F17 | Adequate | Lines 350-352: "the accuracy, averaged over five folds, of a logistic-regression probe with balanced class weights". | Matches code-facts D1, D2. |

## 8. Numbers re-derived from the source rows

Every new number I checked traces to `code/results`, `code/` source, the base manuscript or arithmetic in the revision log. Sample re-derived by hand from the rows I read:

| Number (main.tex line) | Source rows read | Arithmetic | Result |
|---|---|---|---|
| Table A2 ECGFounder GMM SD 0.0116, [0.843, 0.859] (line 933) | `results_compare_strong.csv` rows 279-288: nine at 0.8473249922, one (seed 4) at 0.8839391144 | mean (9 x 0.8473249922 + 0.8839391144) / 10 = 0.8509864044; two values a, b with m = 9: SD = 0.0366141222 x sqrt(0.1) = 0.0366141222 x 0.3162278 = 0.0115784; h = 2.262 x 0.0115784 / 3.16228 = 0.0261904 / 3.16228 = 0.0082821; 0.8509864 -/+ 0.0082821 = [0.8427043, 0.8592685] | Reproduces |
| Table A2 ECGFounder federated non-IID SD 0.3691, [0.348, 0.876] (line 946) | `results_federated.csv` row 12: mean 0.6123351013, ARI_std 0.3501750223 (np.std, ddof 0, `fed_cluster.py` line 108) | sample SD = 0.3501750 x sqrt(10/9) = 0.3501750 x 1.0540926 = 0.3501750 + 0.0189419 = 0.3691169; h = 2.262 x 0.3691169 / 3.16228 = 0.8349424 / 3.16228 = 0.2640330; [0.3483021, 0.8763681] | Reproduces |
| Table A2 hand-crafted federated non-IID SD 0.0705, [0.541, 0.642] (line 949) | row 6: mean 0.5910520739, ARI_std 0.0669117247 | 0.0669117 x 1.0540926 = 0.0705311; h = 2.262 x 0.0705311 / 3.16228 = 0.1595413 / 3.16228 = 0.0504513; [0.5406008, 0.6415034] | Reproduces |
| Table A2 HuBERT-ECG federated non-IID [0.076, 0.136] (line 952) | row 9: mean 0.1061222031, ARI_std 0.0394587197 | 0.0394587 x 1.0540926 = 0.0415931; h = 2.262 x 0.0415931 / 3.16228 = 0.0940836 / 3.16228 = 0.0297518; [0.0763704, 0.1358740] | Reproduces |
| Table A2 ECGFounder k-means SD 0.0012, [0.885, 0.886] (line 931) | row 13: ARI_std 0.0011474009 (ddof 0) | 0.0011474 x 1.0540926 = 0.0012095; h = 2.262 x 0.0012095 / 3.16228 = 0.0008652; 0.8854201 -/+ 0.0008652 = [0.8845549, 0.8862853] | Reproduces |
| Table A2 raw-flatten GMM SD 0.0133, [0.003, 0.022] (line 921) | `summary.csv` row 5: mean 0.0125952397, `_ci95` 0.0082273274 (1.96 x SD / sqrt(10)) | SD = 0.0082273 x 3.16228 / 1.96 = 0.0260173 / 1.96 = 0.0132741; h = 2.262 x 0.0132741 / 3.16228 = 0.0094950; [0.0031002, 0.0220902] | Reproduces |
| Table A2 MIT-BIH conv-AE GMM SD 0.1505, [0.019, 0.234] (line 939) | `results_mitbih.csv` rows 279-288: 0.0388904 (seeds 0, 1, 5, 6, 8, 9), 0.1100112 (2, 4), 0.4068542 (3), 0.4068543 (7) | mean (0.2333421 + 0.2200225 + 0.4068542 + 0.4068543) / 10 = 0.1267073; squared deviations 6 x 0.0077118 + 2 x 0.0002788 + 2 x 0.0784823 = 0.2037930; / 9 = 0.0226437; SD 0.150478; h = 2.262 x 0.150478 / 3.16228 = 0.107638; [0.019069, 0.234345] | Reproduces |
| Table A2 MIT-BIH beat-morphology k-means SD 0.0610, [0.706, 0.793] (line 936) | rows 130-139: 0.7967860 (0, 4, 5), 0.7955958 (2), 0.7979771 (6, 7), 0.6788696 (1, 3, 8, 9) | mean 7.4973863 / 10 = 0.7497386; squared deviations 3 x 0.0022135 + 0.0021029 + 2 x 0.0023269 + 4 x 0.0050224 = 0.0334869; / 9 = 0.0037208; SD 0.0609980; h = 2.262 x 0.0609980 / 3.16228 = 0.0436326; [0.7061060, 0.7933712] | Reproduces |
| Table A3 ECGFounder k-means NMI 0.825, FMI 0.943, purity 0.970, LCF 0.529 (line 994) | `results_compare_strong.csv` rows 258-267 | NMI (3 x 0.8251006 + 3 x 0.8267622 + 3 x 0.8234470 + 0.8237999) / 10 = 8.2497293 / 10 = 0.8249729; FMI (3 x 0.9427877 + 3 x 0.9435251 + 3 x 0.9420511 + 0.9427824) / 10 = 0.9427874; purity (3 x 0.9704957 + 3 x 0.9708891 + 3 x 0.9701023 + 0.9704957) / 10 = 0.9704957; LCF (3 x 0.5291109 + 3 x 0.5287175 + 3 x 0.5295043 + 0.5283242) / 10 = 0.5290323 | Reproduces |
| Table A3 MIT-BIH conv-AE k-means purity 0.666, LCF 0.708 (line 1004) | `results_mitbih.csv` rows 258-267 | purity (6 x 0.673 + 2 x 0.6713333 + 0.6383333 + 0.6386667) / 10 = 6.6576667 / 10 = 0.6657667; LCF (6 x 0.7516667 + 2 x 0.7533333 + 0.5296667 + 0.53) / 10 = 7.0763333 / 10 = 0.7076333 | Reproduces |
| Table A3 ECGFounder HDBSCAN 0.261, 0.626, 0.226, 0.202 (line 998) | `results_compare_strong.csv` row 289 | NMI 0.2607077, FMI 0.6258583, purity 0.2261998, LCF 0.2022030 | Reproduces |
| Retention 0.692, 0.918, 0.611; raw ratio 1.505 (lines 663-665, 656-657) | `results_federated.csv` rows 3-13 | 0.6123351 / 0.8854201: 0.8854201 x 0.6916 = 0.6123566, remainder -0.0000215 / 0.8854201 = -0.0000243, 0.6915757; 0.5910521 / 0.6438958: 0.6438958 x 0.918 = 0.5910964, remainder -0.0000443 / 0.6438958 = -0.0000688, 0.9179312; 0.1061222 / 0.1735647: 0.1735647 x 0.611 = 0.1060480, remainder 0.0000742 / 0.1735647 = 0.0004275, 0.6114275; 0.0000895002 / 0.0000594774 = 1.5048 | Reproduces |
| "shrinks from 0.242 to 0.021" (line 641) | rows 13, 7, 12, 6 | 0.8854201 - 0.6438958 = 0.2415243; 0.6123351 - 0.5910521 = 0.0212830 | Reproduces |
| HDBSCAN noise bounds 0.720 to 0.833 and 0.595 to 0.774 (lines 487-489) | hand-crafted: purity 0.1679780, LCF 0.1396538, 2 clusters (code-facts item 6 and 7, `summary.csv` row 26); ECGFounder: `results_compare_strong.csv` row 289, purity 0.2261998, LCF 0.2022030, 2 clusters | Purity counts majority members of non-noise clusters over all n (code-facts C6), so non-noise share >= purity and noise <= 1 - purity. With two non-noise clusters, each no larger than the largest, non-noise share <= 2 x LCF and noise >= 1 - 2 x LCF. A second check, non-noise >= LCF + 50/2542 (minimum cluster size), gives 0.1593 and 0.2219, both weaker than the purity bound. Hand-crafted: 1 - 2 x 0.1396538 = 0.7206924 to 1 - 0.1679780 = 0.8320220; ECGFounder: 1 - 2 x 0.2022030 = 0.5955940 to 1 - 0.2261998 = 0.7738002. Rounded outward: [0.720, 0.833] and [0.595, 0.774]. | Reproduces; the derivation is valid |
| "0.174 below (0.711 against 0.885)" (line 691) | Table 2 | 0.8854201 - 0.7112614 = 0.1741587 | Reproduces |
| 1 992, 166, 198, 396, 6 000, 50, 60, 142, 160, 157 | code-facts A7, A11, A10, C5, B4, H1 | 1000 // 6 = 166, 12 x 166 = 1992; 108 + 90 = 198, x 2 = 396; 12 x 500 = 6000; 2542 // 50 = 50, 3000 // 50 = 60; 1282 // 9 = 142 (9 x 142 = 1278); 5 x 32 = 160, 160 - 3 = 157 | Reproduce (142 is derived from the code rule, not stored) |

Numbers that did not re-derive or cannot be re-derived:

- Line 598, "the raw beat window does not (ARI at most 0.049)": false for the runs actually made, because raw-beat HDBSCAN has ARI 0.1073678 (`results_mitbih.csv` row 33). True only over the three clusterers in Table 3 (M2).
- Lines 433-434 and 469-471, p = 0.002 for all three contrasts: not stored (stdout only) and, given ties in all three contrasts, not derivable as "the smallest value attainable"; under scipy's normal approximation two of the three would be about 0.005 (M4).
- Figure 2 caption line 548, "at most 0.013": the raw-flatten GMM SD is 0.0133 at four decimals (Table A2 line 921) (m7).
- Pre-existing and not introduced by the revision, listed for completeness: ECGFounder ceiling 0.983 (only a constant in `code/experiments/figures.py` line 35), the 9:1 values, the K = 2 to 8 AMI values, the random-forest 0.71 and the 500 Hz check values are stdout-only (code-facts section 0).

## 9. Consistency across the paper and the letter

Federation statement: identical in substance in the abstract (lines 47-49), contribution (iii) (lines 115-118), Section 4.6 (lines 639-647), Discussion (lines 693-696), Conclusion (lines 798-800) and Figure 4 caption (lines 677-678). Highlights no longer mention federation (highlights.txt lines 4-8). Consistent.

Imbalance statement: 0.232 against 0.060 in the abstract (line 46), Introduction (lines 114-115), Section 4.6 (lines 631-632), Discussion (line 692), Conclusion (lines 797-798), highlight line 8. Consistent; the single-run qualifier appears only in Section 4.6 (m8).

Scope sentences: abstract line 49, Section 4.1 line 418 ("On this task"), Section 4.5 lines 602-603, Discussion lines 684-687, Limitations lines 778-780, Conclusion lines 794-796, highlight line 4. Consistent with each other; Discussion lines 689-691 is the exception (M3).

Table and figure numbering in compiled order: `\begin{table}` at lines 279 (Table 1, tab:repr), 423 (Table 2, tab:main), 605 (Table 3, tab:mitbih), 651 (Table 4, tab:fed), 714 (Table 5, tab:cost), then after `\appendix` lines 845, 904, 960, which elsarticle numbers A.6, A.7, A.8 because the table counter is not reset (M1). `\begin{figure}` at lines 450 (Figure 1, heatmap), 540 (Figure 2, separability), 567 (Figure 3, silhouette trap), 671 (Figure 4, federated). The letter's body-table and figure numbers match; its appendix numbers do not.

Section references in the letter: 3.1 to 3.4, 4.1 to 4.6, 5, 6, 7 match the compiled section order (subsections at lines 167, 218, 302, 391, 412, 495, 555, 581, 594, 625).

Statements in the response letter that are false or inaccurate about main.tex or refs.bib:

| # | Letter location | Statement | What main.tex shows |
|---|-----------------|-----------|---------------------|
| L1 | Lines 7, 21, 47, 73, 153, 185, 187, 221, 229 | "Table A1", "Table A2", "Table A3" | Compiles as Table A.6, A.7, A.8 (M1). |
| L2 | R3.8, line 193 | The corrected federated statement "is used consistently in the abstract, Introduction, Sections 4.6 and 5, Conclusion and highlights." | highlights.txt has no federated statement (lines 4-8). |
| L3 | R3.2, line 145 | "the abstract, the title and first paragraph of Section 4.1 ... now say 'on these two binary tasks' or equivalent" | The Section 4.1 title (line 412) is "PTB-XL benchmark: representation and clustering algorithm", with no scope phrase; the first paragraph says "On this task" (line 418), which is acceptable. |
| L4 | R1.3, line 47 | "The Metrics paragraph states how noise enters each further index (one cluster in NMI and the Fowlkes-Mallows index, ...)" | The Metrics paragraph (lines 318-348) states the purity, silhouette and largest-cluster-fraction handling; the NMI and FMI handling is in the Table A3 caption (lines 966-967) and only implied by lines 312-313. |
| L5 | R1.2, line 33 and R3.3, line 153 | "the three tested k-means contrasts" | The code tests four (code-facts C12); main.tex line 370 repeats "three" (m5). |
| L6 | R3.2 line 147, R3.5 line 171 | "Pending: ... requires new experiments, which are not part of this revision." | Not false about main.tex, but inconsistent with the letter's own definition at line 5 ("this letter will be completed when they are filled"): these two are declined for this round, not pending. State plainly that they were not done and why, or do them. |
| L7 | R3.8, line 193 | Lists "Section 4.1 states that the two foundation models are not treated as one category" among the changes. | That sentence is unchanged from the base (03b7915 line 279). Misleading rather than false. |

All other letter statements about changes were checked against main.tex and refs.bib and are true.

## 10. LaTeX soundness (by reading)

Environments balanced: `\begin` and `\end` counts match per environment (grep: abstract 1/1, document 1/1, equation 1/1, figure 4/4, frontmatter 1/1, itemize 1/1, keyword 1/1, table 8/8, tabular 8/8). Braces in the changed math (lines 322-327, 331-334, 339, 367, 373, 861-862, 873) are balanced by reading.

Every `\ref` has a `\label` (Section 6). Every `\cite` key exists in refs.bib (24 = 24).

Packages: `\binom` needs amsmath (loaded, line 5); `\textcolor` needs xcolor (line 7); `p{}` columns and `\multicolumn` are core LaTeX; `\url` (line 9); `\lfloor`, `\rfloor`, `\mathrm`, `\sqrt`, `\bar` are core math. `\textcolor` inside a caption (line 720) is robust in xcolor.

Column counts: Table 1 seven columns, every row seven cells; Table 5 five; Table A1 two; Table A2 five with `\multicolumn{5}`; Table A3 six with `\multicolumn{6}`. Underscores in `\texttt` are escaped (lines 814, 880-881).

Width: Table 1 likely too wide, Table 5 plausibly too wide, Table A1 overfull by 2.4pt (m1, m2). Table 2 (lines 437-447) is set at body size with seven columns; it was the same in the base and is not a revision issue, but it should be looked at in the compiled PDF.

Placeholders render in red and must go before submission (C1).

## 11. Writing quality (changed passages)

Non-ASCII in main.tex, refs.bib and highlights.txt: none (`Grep` for `[^ -~]` over `manuscript/` returns nothing). Em dashes, en dashes, curly quotes and ellipsis characters: none. The only `--` in main.tex are the CRediT role names at lines 822-823 (base text). LaTeX quotes (` `` '' `) produce typographic quotes in output, which is standard.

Flagged terms from the writing-quality list: "robust" appears only as the scaler name and the subsection title "Federated robustness", both technical uses. No throat-clearing openers found.

Semicolons: 102 against 20 in the base (m15). Paragraph density: Section 3.1 PTB-XL paragraph (lines 169-192), Metrics (lines 318-348) and the first Discussion paragraph (lines 684-706) each carry a long chain of clauses; splitting them would help a reader.

Spelling: British throughout; grep for American forms returns only LaTeX keys, "size" words and the CRediT term "conceptualization". Highlights: longest bullet is line 8 at 83 characters by hand count, within 85.

## 12. Revision Instructions for draft_writer_agent and the authors

Text work that needs no new data (draft_writer_agent): M1 (add `\setcounter{table}{0}` after `\appendix`, fix the letter to "Table A.1" to "A.3"); M2 (add MIT-BIH spectral and HDBSCAN rows from `results_mitbih.csv` to Tables 3, A2 and A3 with means shown by hand, and correct line 598); M3 (delete the non-12-lead clause at lines 689-691 and move the lead-II point to lines 696-702); m1 to m16 as listed; letter items L1 to L7.

Author work: C1 (fill the 20 placeholders, with the cost measurements first); M4 (rerun `run_analyses.py`, store and report the actual p-values and the scipy version); M5 (confirm each foundation model's preprocessing and batch-norm mode against its authors' pipeline and state it). The two referee requests answered by scoping only, R3.2 and R3.5, can be met with data the pipeline already loads (MIT-BIH beat classes beyond N and V; PTB-XL rhythm statements beyond SR and AF; a PTB-XL site or device partition), as the round-1 report described; the letter must otherwise state plainly that they were not done in this revision.

Effort: text items Moderate in total (about two hours); author items depend on runs (cost measurements and the p-value rerun are short; the preprocessing check is reading).

## 13. Reviewer Confidence

Medium-High. Every verdict above quotes the main.tex line it rests on, and every re-derived number is shown with its source row. Confidence is lower on the table-width estimates (no compilation allowed), on M4 (the p-values depend on the scipy version installed when the authors ran the script, which is not recorded) and on M5 (the foundation models' own preprocessing could not be read without web access).

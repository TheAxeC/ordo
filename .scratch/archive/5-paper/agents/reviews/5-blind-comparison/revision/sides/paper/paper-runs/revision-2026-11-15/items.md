# Revision items

Manuscript BSPC-D-26-11935, "Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure". Source of the items: the referee comments file named in the row Instructions of `config.md`. Each comment is quoted as the file gives it, with its characters unchanged.

## Overview

- 24 numbered comments: Reviewer 1 gives 5, Reviewer 2 gives 5, Reviewer 3 gives 14. Reviewer 2 letters the parts of comments 1 and 2, so they are four items, and the list holds 26 items.
- Ids: R1-1, R1-2, R1-3, R1-4, R1-5, R2-1a, R2-1b, R2-2a, R2-2b, R2-3, R2-4, R2-5, R3-1, R3-2, R3-3, R3-4, R3-5, R3-6, R3-7, R3-8, R3-9, R3-10, R3-11, R3-12, R3-13, R3-14.
- Severity is this review's reading. Reviewer 1 heads all five of its comments "Minor comments", and Reviewer 3 heads comments 9 to 14 "Minor Comments". Where the severity here differs from the referee's heading, the item says why.
- Permissions of this run (`config.md`, Decisions): new references are allowed; figure changes are not; no number is computed from saved results; nothing in `code/` is run; no download and no experiment. A value that stands in a code file or in a row of a results file may be stated as it stands, with the file and line named in the draft writer's report. A figure caption is manuscript text and may change.
- Items that need a permission the run lacks: R1-1, R1-2, R1-4, R1-5, R3-2, R3-3, R3-4, R3-5, R3-6, R3-10, R3-12, and in part R3-13. Each says what the manuscript can still truthfully change.
- Comments that ask for the same change: R1-1, R3-3 and R3-12 (intervals); R1-2 and R3-3 (effect sizes); R1-4 and R3-6 (computational cost); R1-5 and R3-12 (figure uncertainty); R1-3, R2-1a, R2-2b and R3-7 (implementation detail); R3-2, R3-4, R3-5 and R3-8 (scope of the claims). The draft writer can resolve each group with one change and name every id it answers.
- Figure numbers. The printed numbers follow the order of the figure environments in the source: Figure 1 is the ARI heatmap (main.tex line 262), Figure 2 the separability-versus-clusterability plot (line 303), Figure 3 the silhouette trap (line 323), Figure 4 the federated bars (line 407). The figure files are named in a different order (the separability plot is the file numbered 3 and the silhouette trap the file numbered 2). The referees use the printed numbers: R1-5's "Figure 2" is the separability plot.
- Code locations below are given as `code/<path>:<line>`, read only. They are for the draft writer's report. The manuscript names no file, script or code identifier; each suggested fix is written in the manuscript's terms.

## Reviewer 1

### R1-1

> **1. Confidence intervals would be preferable to SD**
>
> The reported seed standard deviations are extremely small (<less-than or equal to>0.001). Confidence intervals or bootstrap intervals would communicate uncertainty more clearly.

- **What it asks**: report confidence or bootstrap intervals in place of, or next to, the seed standard deviations.
- **Section**: 4.1, Table 1 caption (main.tex lines 242-247) and the paragraph after Figure 1 (lines 269-271); 3.3 (lines 208-210).
- **Severity**: Minor (referee's heading). The caption sentence it points at also holds a factual problem, listed under the facts below.
- **Resolved when**: the manuscript states what the ten seeds vary and what they hold fixed, so the reader knows what the seed spread measures; every interval it gives is one that stands in the study's saved results; and the stability sentence of the caption and the text is true for every column it covers.
- **Suggested fix**: In 3.3, state that the cohort, the features, the foundation embeddings and the trained autoencoder are fixed across seeds, that the seeds change only the random initialisation of k-means, spectral clustering and the Gaussian mixture, and that Ward agglomerative clustering and HDBSCAN are deterministic and fitted once. State that the seed spread therefore measures the stability of the clustering step, not the sampling uncertainty of the cohort. Restrict the sentence "standard deviation <= 0.001" to the k-means solutions it was measured on, and rewrite the caption phrase "SD <= 0.001 except ECGFounder, 0.001", which contradicts itself. Where a 95% interval or a standard deviation stands in the saved results (the raw and hand-crafted rows of the benchmark sweep, and every row of the federated study), state it as it stands.
- **Facts in the code**:
  - The seed list is `code/core/config.py:23`. The seed enters only the clusterers: `code/core/cluster_eval.py:47` (k-means, also `n_init=10`), `:51-52` (spectral), `:57-58` (Gaussian mixture). Ward and HDBSCAN take no seed (`:49`, `:61`), and the sweep stops after the first seed for both (`code/experiments/benchmark.py:148`, `code/experiments/arm_learned.py:48`, `code/experiments/mitbih_bench.py:143`).
  - The representations are built once: the cohort is drawn once with a fixed random state (`code/experiments/benchmark.py:46`), features are cached (`:91-106`), the autoencoder is trained once with seed 0 (`code/experiments/arm_learned.py:64`), and the foundation embeddings are frozen forward passes, cached (`code/experiments/arm_foundation.py:91-98`, `code/experiments/arm_ecgfounder.py:94-99`).
  - The seed standard deviations in the text are k-means only (`code/experiments/run_analyses.py:41-46`), and were printed, not saved.
  - Saved 95% half-widths (1.96 x SD / sqrt(n), `code/experiments/benchmark.py:112-114`, `:156-157`) stand in `code/results/summary.csv` for the raw and hand-crafted rows only (lines 4-8 and 24-28 at power scaling). There is none for the autoencoder, HuBERT-ECG or ECGFounder.
  - The raw-flatten Gaussian-mixture row has a saved half-width of 0.0082 (`code/results/summary.csv:5`). A half-width of that size requires a standard deviation above 0.001, so the caption's "Partitional solutions are seed-stable (SD <= 0.001)" does not hold for that column.
  - The federated study saves a standard deviation over seeds for every row (`code/results/results_federated.csv:2-13`, column ARI_std).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: yes, for a bootstrap interval or for a confidence interval of the autoencoder, HuBERT-ECG and ECGFounder rows.
- **Permission**: the run lacks the computed number. A bootstrap over records, or an interval for the rows without a saved one, cannot be given. The manuscript can still state what the seeds vary, correct the stability sentence, and state the saved half-widths and standard deviations as they stand.

### R1-2

> **2. Add effect sizes alongside p-values**
>
> Wilcoxon p-values hit the minimum possible value with ten seeds (p=0.002). Reporting effect sizes such as Cliff's delta would improve interpretation.

- **What it asks**: report an effect size, such as Cliff's delta, next to each Wilcoxon p-value.
- **Section**: 4.1, paragraph after Figure 1 (main.tex lines 271-274); Table 1 caption (lines 245-246); 3.3 (line 210).
- **Severity**: Minor (referee's heading).
- **Resolved when**: each tested contrast is reported with an effect size the reader can interpret, and the text says that p = 0.002 is the smallest value ten paired seeds allow, so that the p-value carries no information about the size of the gap.
- **Suggested fix**: Name the mean differences in ARI already reported (0.242, 0.470, 0.174) as the effect sizes of the contrasts, on the chance-corrected ARI scale, and say so in the Table 1 caption. State that the p-value is at its floor for ten paired samples and that the Wilcoxon test here tests the stability of the clustering step across initialisations (R1-1), not a difference between populations. Do not introduce Cliff's delta unless its value can be given.
- **Facts in the code**: the test is the paired, two-sided Wilcoxon signed-rank test of the library defaults on the per-seed k-means ARI at power scaling (`code/experiments/run_analyses.py:35-60`). The per-seed values stand in `code/results/results_raw.csv`, `code/results/results_learned.csv` and `code/results/results_compare_strong.csv` (read at `code/experiments/run_analyses.py:37-43`). No effect size other than the mean difference is printed or saved.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: yes, for Cliff's delta.
- **Permission**: the run lacks the computed number, so Cliff's delta cannot be given. The manuscript can name the mean differences as the effect sizes and explain what the p-value floor means.

### R1-3

> **3. Clarify HDBSCAN's handling of noise labels**
>
> Was noise treated as the following:
>
> an additional cluster,
> ignored observations,
> Reassigned to the nearest cluster?
>
> This affects ARI interpretation.

- **What it asks**: state how HDBSCAN's noise points enter ARI and the other metrics.
- **Section**: 3.3 (main.tex lines 199-201); 4.1 (lines 282-285).
- **Severity**: Major. The referee heads it Minor, but the Methods sentence it concerns states that every clusterer is given the number of classes as its cluster count, which is not true of HDBSCAN.
- **Resolved when**: 3.3 states that noise points keep their own label and count as one additional cluster in ARI and AMI, how each other metric treats them, that HDBSCAN is not given a cluster count, and its minimum cluster size; and the sentence that sets the cluster count names only the clusterers it applies to.
- **Suggested fix**: In 3.3, add: HDBSCAN assigns no cluster count and labels low-density points as noise; for ARI, AMI, NMI, V-measure and Fowlkes-Mallows the noise points form one additional cluster, so a solution that labels most points as noise scores near zero; purity counts noise points as misassigned; the silhouette is computed on non-noise points; the largest-cluster fraction counts only non-noise clusters over all records. Give the minimum cluster size (the larger of 10 and one fiftieth of the number of records, other settings at the library defaults). Change "with the number of clusters set to the number of classes" (line 200) to apply to k-means, Ward, spectral clustering and the Gaussian mixture, and cite HDBSCAN's source. In 4.1, the sentence "HDBSCAN labels most points as noise" can state, from the saved rows, that for raw flattening and HuBERT-ECG it formed no cluster at all.
- **Facts in the code**: HDBSCAN call `code/core/cluster_eval.py:59-61` (only `min_cluster_size=max(10, n // 50)` is set, no cluster count). The predicted labels, noise label -1 included, go unchanged into ARI, AMI, NMI, V-measure and FMI (`:86-91`), so noise is one additional cluster; nothing reassigns noise to a cluster. Purity skips the noise label in the numerator and keeps all records in the denominator (`:68-76`). The silhouette excludes noise (`:80-82`). The largest-cluster fraction and the count of non-empty clusters exclude noise (`:83`, `:94-95`). Saved rows: raw flattening and HuBERT-ECG have zero non-noise clusters under HDBSCAN (`code/results/results_raw.csv:33`, `code/results/results_compare_strong.csv:161`, column n_nonempty_clusters); the hand-crafted features have a largest-cluster fraction of 0.140 (`code/results/results_compare_strong.csv:33`) and ECGFounder 0.202 (`:289`). The `.bib` holds an entry for the HDBSCAN paper (key hdbscan2013) that the manuscript does not cite.
- **Calls for**: new reference: no new one; the uncited `.bib` entry for HDBSCAN is cited, and its passage is read in the run. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R1-4

> **4. Include computational costs**
>
> An additional table reporting:
>
> embedding time,
> inference memory,
> feature extraction time,
>
> would reinforce the deployment argument.

- **What it asks**: a table of embedding time, inference memory and feature extraction time per representation.
- **Section**: the deployment argument: abstract (main.tex lines 45-49), introduction (lines 91-93, 99-100), 4.6 (lines 372-373, 387-388), Discussion (lines 417-427), Conclusion (lines 462-466).
- **Severity**: Minor (referee's heading).
- **Resolved when**: the deployment argument rests only on properties the manuscript shows or cites, and the manuscript gives the cost-related properties that need no measurement in one place.
- **Suggested fix**: Add a table of representation properties that need no new measurement: dimension of the representation, leads, duration and sampling rate of the input, whether pretrained weights and a neural-network forward pass are needed, and, for the two foundation models, the parameter count and the size of the pretraining corpus as their papers report them. Reword "cheap", "inexpensive" and "more deployable" (lines 45-46, 92, 373) so that each rests on these properties or on the robustness results, and give no time or memory figure.
- **Facts in the code**: no time and no memory use is measured or saved anywhere in `code/` (no timing or memory call in `code/core/` or `code/experiments/`). Dimensions: 16 hand-crafted features (`code/core/features.py:53-59`), 32-unit autoencoder code (`code/experiments/arm_learned.py:64`), 768 for HuBERT-ECG (`code/experiments/arm_foundation.py:78-79`), 1024 for ECGFounder (`code/core/ecgfounder_net1d.py:389`, `code/experiments/arm_ecgfounder.py:5`). Inputs: see R2-2b. A code comment gives HuBERT-ECG about 90 million parameters and 9.1 million pretraining recordings (`code/experiments/arm_foundation.py:4-5`); the manuscript takes such figures from the cited model papers, read in the run.
- **Calls for**: new reference: no (the model papers are cited). Figure change: no. Number computed from saved results: no. New experiment: yes, for the times and the memory.
- **Permission**: the run lacks the experiment that measures time and memory, so the requested table cannot be given. The manuscript can still add the table of properties above and scope the deployment wording to what is shown.

### R1-5

> **5. Figure 2 could be expanded**
>
> The separability-vs-clusterability plot is compelling but contains only five points. Confidence intervals or multiple seeds per representation could make the figure more informative.

- **What it asks**: add intervals or per-seed points to the separability-versus-clusterability figure (printed Figure 2).
- **Section**: 4.2, Figure 2 and its caption (main.tex lines 303-309).
- **Severity**: Minor (referee's heading).
- **Resolved when**: the caption says what each point is and how many recordings and fits stand behind it, and the reader is pointed to where the per-fit spread is shown.
- **Suggested fix**: In the caption of Figure 2, state that each point is one representation, that the horizontal value is the patient-grouped five-fold accuracy of a linear probe on all 2542 recordings, and that the vertical value is the mean ARI of the best clusterer for that representation (a mean over ten seeds, or one fit for the deterministic clusterers). Point to Table 1 for every clusterer and to Figure 3, which shows one marker per fit. State the seed stability of R1-1 in the caption.
- **Facts in the code**: the figure draws one point per representation, the best clusterer's mean ARI against a fixed ceiling value (`code/experiments/figures.py:34-35`, `:85-99`). The silhouette-trap figure plots every fit at power scaling (`code/experiments/figures.py:71-77`).
- **Calls for**: new reference: no. Figure change: yes. Number computed from saved results: yes, for intervals per point.
- **Permission**: the run lacks the figure change and the computed numbers, so the figure cannot gain intervals or points. The manuscript can still rewrite the caption as above.

## Reviewer 2

### R2-1a

> **1. [Subsection 3.1]**
>
> a. Since ECG signals in the PTB-XL dataset are stored in WFDB format. However, it is unclear what data type was used as input to the model and whether the original data were converted prior to processing.

- **What it asks**: state the data type of the input and whether the WFDB records were converted before processing.
- **Section**: 3.1 (main.tex lines 154-170).
- **Severity**: Major. Without it the data path cannot be reproduced.
- **Resolved when**: 3.1 states the PTB-XL release and sampling-rate version used, how the WFDB records become numerical arrays (type, unit, shape), and that the representation-specific steps of 3.2 are the only further processing; and the same for MIT-BIH.
- **Suggested fix**: In 3.1, state that the benchmark uses the 100 Hz version of PTB-XL 1.0.3, that each WFDB record is read into a floating-point array of the physical signal (unit as the record header gives it, which the PTB-XL descriptor states), 1000 samples by 12 leads for a 10 s strip, and that no other conversion precedes the steps of 3.2. For MIT-BIH, state the 360 Hz rate and the two leads read the same way. The unit and the 100 Hz version are confirmed from the passage of the PTB-XL paper.
- **Facts in the code**: the cohort uses the 100 Hz record files (`code/experiments/benchmark.py:52` with the default resolution "lr" at `:171`; `code/core/config.py:16`). Each record is read with the WFDB reader into the physical signal and stored as 32-bit floating point (`code/experiments/benchmark.py:58-65`). The 500 Hz loader in `code/core/data.py:52-77` is not used by any experiment. MIT-BIH beats are read as the physical signal, 32-bit, two leads (`code/experiments/mitbih_bench.py:36-40`).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-1b

> b. The author should provide a clear justification for using only Lead II for rhythm and morphology analysis. Explain why the other ECG leads were not utilized and discuss the implications of this choice.

- **What it asks**: justify the use of Lead II alone, explain why the other leads are not used, and discuss what the choice implies.
- **Section**: 3.1 (main.tex lines 161-162); 3.2, hand-crafted features (lines 184-187).
- **Severity**: Major.
- **Resolved when**: the manuscript gives a cited reason for Lead II, says which representation it applies to (R2-2a), and states what information the single-lead feature set leaves out and what it gains.
- **Suggested fix**: State that the hand-crafted features are computed from Lead II because it is the conventional rhythm lead, in which the P wave and the RR intervals are read, and that the defining signs of AF (irregular RR intervals, absent organised P waves) are visible in a single lead, with a citation for each. State the implications: the feature set does not use inter-lead information such as the electrical axis or lead-specific morphology, which other diagnoses need; the features can be computed from a single-lead recording; and in this benchmark the single-lead features are compared against representations that see all 12 leads. Make no claim about the effect of adding leads, which was not tested.
- **Facts in the code**: the rhythm lead is set to II (`code/core/config.py:32`, comment "clinical convention") and used only by the hand-crafted features (`code/core/features.py:124-125`, `:130`). The `.bib` holds an uncited entry for the 2017 PhysioNet/Computing in Cardiology challenge on AF classification from a short single-lead recording (key clifford2017af), a candidate source for the single-lead point.
- **Calls for**: new reference: yes (the rhythm-lead convention; the uncited single-lead AF entry may serve for the second point after its passage is read). Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-2a

> **2. [subsection 3.2]**
>
> a. There appears to be an inconsistency in the manuscript. Subsection 3.1 states that only Lead II is used for rhythm and morphology analysis, whereas the description of raw flattening indicates that all ECG leads are concatenated into one vector. Clarify this discrepancy and justify the use of different input representations in the methodology.

- **What it asks**: resolve the conflict between "Lead II is used" in 3.1 and the 12-lead raw flattening of 3.2, and justify why the representations take different inputs.
- **Section**: 3.1 (main.tex lines 161-162); 3.2 (lines 176-190).
- **Severity**: Major. The two sentences, read as written, describe different inputs for the same study.
- **Resolved when**: the manuscript states, for each representation, which leads it takes, and the sentence of 3.1 no longer reads as applying to all representations; and the different inputs are justified.
- **Suggested fix**: Replace "Lead II is used for rhythm and morphology" with a statement that only the hand-crafted features use Lead II, while raw flattening, the convolutional autoencoder and both foundation models take all 12 leads. Justify each: raw flattening reproduces the original 12-lead pipeline; the foundation models were pretrained on 12-lead input and are used with the input they expect; the autoencoder is given the same 12-lead strip; the hand-crafted features follow the rhythm-lead convention of R2-1b. State that HuBERT-ECG receives only the first 5 s of each lead (R2-2b).
- **Facts in the code**: hand-crafted, Lead II only (`code/core/features.py:124-125`); raw flattening, all leads downsampled and concatenated (`code/core/features.py:39-47`); autoencoder, all 12 leads as input channels (`code/core/deep_repr.py:22-29`, `:41`, `:48`); HuBERT-ECG, 12 leads, first 500 samples (5 s) of each, concatenated lead after lead (`code/experiments/arm_foundation.py:31-32`, `:63-70`); ECGFounder, 12 leads (`code/experiments/arm_ecgfounder.py:68-76`).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-2b

> b. The manuscript does not clearly describe the data type used in each representation. Specify the data type employed in all representations and explain the underlying principle for each representation.

- **What it asks**: for each representation, its data type and the principle behind it.
- **Section**: 3.2 (main.tex lines 172-195).
- **Severity**: Major.
- **Resolved when**: for each of the five PTB-XL representations and the three MIT-BIH representations, 3.2 gives the input (leads, duration, rate), the transformation, the output (a real-valued vector and its dimension) and the principle it encodes; and the list of the 16 hand-crafted features is complete.
- **Suggested fix**: Give, per representation, in prose or a table:
  - raw flattening: each lead averaged over non-overlapping windows of 6 samples and the 12 leads concatenated into one real-valued vector of about 2000 values; it keeps amplitude and waveform energy at fixed sample positions, with no alignment of beats across recordings.
  - convolutional autoencoder: the 12-lead strip resampled to 2500 samples per lead and z-scored per lead; three strided convolution layers, global average pooling and a linear layer to a 32-value code, trained to reconstruct its input under mean squared error; the code keeps what reconstruction needs.
  - hand-crafted features: 16 real values from Lead II after cleaning, R-peak detection and wave delineation. All 16 are named, including the five the current list omits: mean RR interval, beat count, standard deviation of P-wave amplitude, standard deviation of QRS amplitude, and standard deviation of the template correlation. They encode the clinical criteria of rhythm regularity, P-wave presence and QRS shape, and missing values from failed delineation are replaced by the column median.
  - HuBERT-ECG: the first 5 s of the 12 leads at 100 Hz concatenated into one sequence of 6000 samples, with no amplitude normalisation; the last hidden layer averaged over time to 768 values; a self-supervised encoder used frozen.
  - ECGFounder: the 10 s 12-lead strip resampled from 100 Hz to the 500 Hz input the model expects (5000 samples per lead) and z-scored over the whole recording; the 1024 time-averaged features of the last convolutional stage, with the classification layer removed; a model pretrained on labelled diagnoses, used frozen.
  - MIT-BIH: the raw beat window (both leads, the [-300, +250] ms window, concatenated), the 21 beat features (five RR-context values and eight morphology values per lead), and the autoencoder on the beat window.
  - State that every representation is then transformed by the conditioner of 3.3 before clustering.
- **Facts in the code**: raw flattening `code/core/features.py:32-47` with window 6 at `code/core/config.py:62` (the target-length constant at `code/core/config.py:61` is not used); autoencoder `code/core/deep_repr.py:22-102`; hand-crafted names `code/core/features.py:53-59`, computation `:62-149` (cleaning, peaks, delineation by the discrete wavelet method at `:133-139`; median imputation `:145-148` and `code/experiments/benchmark.py:103-104`); HuBERT-ECG `code/experiments/arm_foundation.py:15-18`, `:63-82`; ECGFounder `code/experiments/arm_ecgfounder.py:37-86`, `code/core/ecgfounder_net1d.py:389`; MIT-BIH `code/experiments/mitbih_bench.py:66-98`; conditioners `code/core/cluster_eval.py:28-39`. The manuscript's "about 2000" dimensions for raw flattening is kept; no exact count stands in the saved results.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-3

> **3. [Subsection 3.3]**
>
> The description of the performance metrics is insufficient. Explain the physical meaning of each metric, provide its mathematical formulation, and its range.

- **What it asks**: for each metric, its meaning, its formula and its range.
- **Section**: 3.3 (main.tex lines 201-210).
- **Severity**: Major.
- **Resolved when**: every metric the paper reports (ARI, AMI, NMI, V-measure, Fowlkes-Mallows index, purity, silhouette, largest-cluster fraction, and the supervised ceiling) has a stated meaning, a formula, a range and its value under chance or under the trivial one-cluster solution, with a source.
- **Suggested fix**: Add a paragraph or a table to 3.3: ARI from the pair counts of the contingency table, adjusted so that random labelling has expectation 0 and identical partitions score 1, with negative values possible; AMI, mutual information adjusted for its expectation under chance, same range behaviour; NMI with the arithmetic-mean normalisation, in [0, 1]; V-measure, the harmonic mean of homogeneity and completeness, in [0, 1]; Fowlkes-Mallows, the geometric mean of pairwise precision and recall, in [0, 1]; purity, the fraction of records that belong to the majority class of their cluster, in (0, 1] and equal to the majority-class proportion when all records form one cluster; silhouette, the mean over points of (b - a) / max(a, b) with Euclidean distance on the conditioned representation, in [-1, 1]; largest-cluster fraction, in (0, 1]; the supervised ceiling, a patient-grouped five-fold accuracy with chance level equal to the majority proportion. State that NMI with arithmetic normalisation equals the V-measure, so the two coincide in every result, and either report one or say why both are kept.
- **Facts in the code**: the metric suite is `code/core/cluster_eval.py:79-96`, using the library functions imported at `:13-15` with their default normalisation; purity `:68-76`; supervised ceiling `:116-125` (balanced logistic regression, up to 2000 iterations, stratified group five-fold). NMI and V-measure are equal in the saved rows, for example `code/results/results_raw.csv:2` (both 2.5321628906769046e-05).
- **Calls for**: new reference: yes (sources for NMI, V-measure and the Fowlkes-Mallows index; ARI, AMI and the silhouette are already cited). Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-4

> **4. [Subsection 4.1]**
>
> Justify the comparative performance of the different feature representations. Explain why the ECG Foundation Cluster achieves the best performance, why the hand-crafted features remain competitive, why HuBERT-ECG exhibits relatively weak performance, and why the Raw and Conv-AE pipelines perform similarly to a majority-class assignment.

- **What it asks**: an explanation of the ranking: why ECGFounder clusters best, why the hand-crafted features are competitive, why HuBERT-ECG is weak, and why raw flattening and the autoencoder match a majority-class assignment.
- **Section**: 4.1 (main.tex lines 232-238, 279-285); Discussion (lines 417-427).
- **Severity**: Major.
- **Resolved when**: 4.1 or the Discussion gives, for each of the four, an explanation tied to evidence in the paper (supervised ceiling, cluster sizes, silhouette) or to a cited source, and marks each mechanism the study did not test as an interpretation.
- **Suggested fix**: Add one paragraph per representation:
  - ECGFounder: pretrained with supervision on a large set of labelled diagnostic statements, so its feature space is organised by diagnosis, and it sees the full 10 s, 12-lead strip; cite the model paper for the training labels and the closest benchmark for its clustering by clinical label.
  - hand-crafted: the features measure the criteria by which SR and AF are defined (RR regularity, P-wave presence), so the class difference lies along the features' own axes; cite a source for the AF criteria; the high ceiling (0.942) and ARI agree.
  - HuBERT-ECG: self-supervised pretraining with no diagnostic labels, input limited to the first 5 s at 100 Hz, and time-averaged hidden states; the ceiling of 0.899 shows the label is present, so the weakness is in the geometry (R2-5); state these as interpretations.
  - raw flattening and the autoencoder: an ARI near 0 with one cluster holding nearly all records, which is what assigning every record to the majority class gives; raw flattening compares samples at fixed positions with no beat alignment, and the autoencoder is trained to reconstruct amplitude, so neither places the rhythm difference along its dominant axes; the ceilings (0.519 and 0.678) show how much label information each carries.
- **Facts in the code**: ECGFounder's checkpoint carries a 150-class output layer, removed before embedding (`code/experiments/arm_ecgfounder.py:43`, `:47`). HuBERT-ECG's input is the first 5 s at 100 Hz (`code/experiments/arm_foundation.py:15-18`, `:31-32`). Raw flattening has no temporal alignment (`code/core/features.py:5-8`, `:39-47`). The autoencoder's loss is mean squared reconstruction error (`code/core/deep_repr.py:77`, `:85`). The raw-flatten k-means mean largest-cluster fraction is 0.967 (`code/results/summary.csv:7`), a value that may be stated as it stands.
- **Calls for**: new reference: yes (the diagnostic criteria of AF; the training objectives come from the cited model papers, read in the run). Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R2-5

> **5. [Subsection 4.2]**
>
> Explain why the HuBERT-ECG representation exhibits the sharpest clustering, with a reported ceiling of 0.899, while achieving a relatively low ARI of only 0.195. Discuss the reasons for this apparent discrepancy and clarify how these results should be interpreted.

- **What it asks**: explain why HuBERT-ECG has a high supervised ceiling (0.899) and a low ARI (0.195), and how to read the two together.
- **Section**: 4.2 (main.tex lines 289-301).
- **Severity**: Major. The referee reads "the sharpest case" (line 294) as "the sharpest clustering", so the sentence misleads.
- **Resolved when**: the sentence at line 294 cannot be read as saying that HuBERT-ECG clusters sharply; the text states that the ceiling and ARI are on different scales; and it gives the reason for the gap and the reading it implies.
- **Suggested fix**: Rewrite "HuBERT-ECG is the sharpest case" as "HuBERT-ECG shows the largest gap between separability and clusterability". State that the ceiling is an accuracy whose chance level is the majority proportion (0.504), while ARI is chance-corrected with chance level 0, so the two numbers are not compared directly. Explain the gap: a linear probe can use a direction of small variance that separates the classes, whereas k-means and the Gaussian mixture partition along the directions of largest variance, and in this embedding those directions do not follow the rhythm class (an interpretation, consistent with the cited report that some foundation embeddings organise by dataset). State the reading: the embedding contains the SR-versus-AF information, but recovering it needs labels, so it does not serve label-free analysis in this setting.
- **Facts in the code**: the ceiling is the patient-grouped five-fold accuracy of balanced logistic regression (`code/core/cluster_eval.py:116-125`); the majority proportion is 0.504 (`code/results/baselines.csv:2`); the HuBERT-ECG ceiling is 0.8985 (`code/results/baselines_foundation.csv:2`).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

## Reviewer 3

### R3-1

> **1.** The manuscript primarily benchmarks existing ECG representations using established clustering algorithms and evaluation metrics. The authors should clearly articulate the methodological novelty beyond benchmarking and explain how this work advances the current state-of-the-art relative to recent ECG foundation-model benchmark studies.

- **What it asks**: state the methodological contribution beyond benchmarking, and how the work advances on recent ECG foundation-model benchmark studies.
- **Section**: abstract (main.tex lines 43-46); introduction (lines 95-112); related work, closest benchmark (lines 142-148); Discussion (lines 435-441).
- **Severity**: Major.
- **Resolved when**: the introduction states a specific, checkable contribution of the evaluation design, and the related work compares it with the recent ECG foundation-model benchmark studies by name; and the sentences that deny any contribution or describe the work by self-assessment are replaced.
- **Suggested fix**: Replace "Our contributions are modest and empirical" (line 100), "We claim no methodological novelty" (line 435) and "a careful, honest benchmark" (lines 91, 437-438) with the specific contribution of the protocol: each clustering score paired with a supervised ceiling under the same patient grouping, which tells a failure of information apart from a failure of geometry; chance-corrected metrics read with cluster-size checks; the conditioner sweep; the two deployment stress tests; and the hand-crafted baseline and MIT-BIH task that the closest benchmark omits. In the related work, compare this protocol with each recent ECG foundation-model benchmark study the literature search finds, saying what each measures and what it does not. Claim no new algorithm.
- **Facts in the code**: none needed.
- **Calls for**: new reference: yes (recent ECG foundation-model benchmark studies). Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking for the text change. A contribution in the form of a new algorithm would need new experiments, which this run does not have.

### R3-2

> **2.** The study evaluates only binary SR-versus-AF clustering and a binary MIT-BIH morphology task. The conclusions would be considerably stronger if validated on additional clinically relevant multi-class arrhythmia datasets to demonstrate broader applicability.

- **What it asks**: validation on further multi-class arrhythmia datasets.
- **Section**: 3.1; Limitations (main.tex lines 453-454); abstract; Conclusion.
- **Severity**: Major.
- **Resolved when**: the manuscript states the two binary tasks as the scope of every conclusion, justifies the binary design, and makes no claim about multi-class structure.
- **Suggested fix**: In 3.1, justify the binary design: each task is defined by one clinical criterion (rhythm regularity for SR versus AF, beat morphology for N versus V), which makes the supervised ceiling and the chance-corrected score interpretable. Replace "a heterogeneous multi-class setting is harder and out of scope" (lines 453-454), whose "harder" the study does not show, with a statement of scope. Scope the abstract and the Conclusion to the two tasks (R3-8). Present no multi-class result.
- **Facts in the code**: a three-class label (SR, AF, other rhythms) is defined but switched off (`code/core/config.py:34-41`); no multi-class result is saved in `code/results/`.
- **Calls for**: new reference: optional (to name multi-class datasets in the statement of scope). Figure change: no. Number computed from saved results: no. New experiment and download: yes, for the validation asked.
- **Permission**: the run lacks the new experiment and the download of further datasets, so the validation cannot be given. The manuscript can still justify the binary design and scope its conclusions to the two tasks.

### R3-3

> **3.** Although Wilcoxon tests are reported, effect sizes and confidence intervals are missing. Including these statistics would provide a more comprehensive assessment of the practical significance of the observed performance differences.

- **What it asks**: effect sizes and confidence intervals for the tested differences.
- **Section**: 4.1 (main.tex lines 242-247, 269-277); 3.3 (line 210).
- **Severity**: Major.
- **Resolved when**: as R1-1 and R1-2; in addition, the text says what the differences mean in practice on the ARI scale.
- **Suggested fix**: The change of R1-1 and R1-2 answers this item. In addition, state the practical size of each contrast on the ARI scale, for example that the hand-crafted features over HuBERT-ECG is a difference of 0.470 in ARI.
- **Facts in the code**: as R1-1 and R1-2.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: yes, for Cliff's delta, a bootstrap interval, or an interval for the rows without a saved one.
- **Permission**: the run lacks the computed numbers. The manuscript can still name the mean differences as effect sizes, state what the seeds vary, and state the saved intervals and standard deviations as they stand.

### R3-4

> **4.** Only HuBERT-ECG and ECGFounder are evaluated. Given the rapid development of ECG foundation models, the rationale for excluding other publicly available models should be discussed, together with the potential impact on the reported conclusions.

- **What it asks**: the reason other public ECG foundation models are not evaluated, and what including them could change.
- **Section**: 3.2, foundation embeddings (main.tex lines 188-190); 4.1 (lines 279-282); Discussion (lines 440-441); Limitations (lines 450-453).
- **Severity**: Major.
- **Resolved when**: Methods states the criteria by which the two models were chosen; the Discussion names other public ECG foundation models with citations and says how the conclusions depend on the two models tested; and "one model per foundation family" (line 451) defines what a family is.
- **Suggested fix**: In 3.2, state the selection criteria: public weights, 12-lead input, and one model from each of two training paradigms (a self-supervised transformer, a supervised convolutional network), with ECGFounder chosen as a model the closest benchmark reports to cluster by clinical label. In the Discussion, name the other public ECG foundation models the literature search finds, and state that every foundation-model conclusion holds for these two models, that the comparison against the hand-crafted features is made against a model reported to cluster well, and that a model trained differently could rank differently.
- **Facts in the code**: two models are loaded (`code/experiments/arm_foundation.py:29`, `code/experiments/arm_ecgfounder.py:40`). Code comments state that ECGFounder was added because the closest benchmark reports it to cluster by clinical label (`code/experiments/arm_ecgfounder.py:3-4`, `code/experiments/compare_strong.py:7-8`); that report is confirmed from the cited paper's passage before the manuscript states it.
- **Calls for**: new reference: yes (other public ECG foundation models). Figure change: no. Number computed from saved results: no. New experiment and download: yes, if further models were to be evaluated.
- **Permission**: the run lacks the experiment and the download of further model weights, so no further model can be evaluated. The manuscript can still give the selection criteria and scope its conclusions to the two models.

### R3-5

> **5.** The federated experiments rely on simulated client partitions from a single dataset. Validation using real multi-institutional datasets or more realistic heterogeneous federated settings would substantially strengthen the deployment claims.

- **What it asks**: federated validation on real multi-institutional data or in more realistic heterogeneous settings.
- **Section**: 3.4 (main.tex lines 218-226); 4.6 (lines 380-388); Table 2 (lines 390-405); abstract (lines 46-49); Discussion (lines 419-422); Limitations (lines 455-456).
- **Severity**: Major.
- **Resolved when**: 3.4 describes the simulation in full, including the steps that use the pooled data; the text calls the heterogeneity what it is (simulated class-proportion skew across ten partitions of one dataset); and the deployment claims are scoped to that setting.
- **Suggested fix**: In 3.4, state: ten clients; patients assigned at random (IID) or, per class, by proportions drawn from a Dirichlet distribution with concentration 0.3 (non-IID); clients with fewer than two records dropped; 15 rounds of 3 local k-means iterations, the server averaging centroids weighted by cluster counts; ten seeds, each a new partition and initialisation. State the two steps that use the pooled data: the power transform is fitted on all records, and the initial centroids are drawn from all records. Replace "federation across ten heterogeneous sites" (abstract), "under realistic site heterogeneity" (line 385) and "privacy-preserving, multi-site phenotyping" (line 388) with wording for simulated class-proportion skew. Add the seed standard deviations of the federated rows to Table 2 as they stand in the saved results.
- **Facts in the code**: settings `code/experiments/fed_cluster.py:22-26`; partition `:43-65` (IID `:51-53`, Dirichlet 0.3 `:54-60`, small clients dropped `:65`); aggregation `:68-88`; initial centroids drawn from the pooled data `:72`; power transform fitted on the pooled data `:100`. Saved standard deviations, non-IID: ECGFounder 0.350 (`code/results/results_federated.csv:12`), hand-crafted 0.067 (`:6`), HuBERT-ECG 0.039 (`:9`); the other rows `:2-13`.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no. New experiment and new data: yes, for real multi-institutional validation or a different partition.
- **Permission**: the run lacks the experiment and the data, so no further federated setting can be evaluated. The manuscript can still describe the simulation fully, disclose the pooled-data steps, add the saved standard deviations and scope the deployment claims.

### R3-6

> **6.** The manuscript emphasizes deployability but provides no comparison of computational cost, inference time, memory consumption, or embedding dimensionality. Such analysis is important for evaluating practical clinical deployment.

- **What it asks**: a comparison of computational cost, inference time, memory use and embedding dimensionality.
- **Section**: as R1-4.
- **Severity**: Major.
- **Resolved when**: as R1-4, with the embedding dimensionality of every representation in one table and discussed.
- **Suggested fix**: The table of R1-4 answers the dimensionality part and gives the cost-related properties that need no measurement. Discuss what the dimensions imply for distance-based clustering and storage, as a judgment, and scope "deployability" as in R1-4.
- **Facts in the code**: as R1-4. No time or memory use is recorded anywhere in `code/`.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no. New experiment: yes, for time and memory.
- **Permission**: the run lacks the experiment that measures time and memory, so those cannot be given. The manuscript can still give the dimensionality and the properties of R1-4 and scope the deployment wording.

### R3-7

> **7.** Several implementation choices, including clustering hyperparameter selection, convergence criteria, preprocessing settings, and foundation-model inference configurations, should be described in greater detail to facilitate full reproducibility.

- **What it asks**: detail on clustering hyperparameters and how they were chosen, convergence criteria, preprocessing settings and the inference configuration of the foundation models.
- **Section**: 3.2 (main.tex lines 172-195); 3.3 (lines 197-216); 3.4 (lines 218-226); Code and data availability (lines 470-473).
- **Severity**: Major.
- **Resolved when**: Methods, or an appendix table, gives every setting below, says that no clustering hyperparameter was tuned on the labels, and names the library defaults that apply where the study set nothing.
- **Suggested fix**: Add a table or paragraph with:
  - clustering: number of clusters equal to the number of classes for k-means, Ward, spectral clustering and the Gaussian mixture; k-means with 10 initialisations per seed; Ward linkage; spectral clustering with a nearest-neighbour affinity and k-means label assignment; Gaussian mixture with diagonal covariance and a covariance regularisation of 1e-4; HDBSCAN as in R1-3; no tuning against labels; all other settings and the convergence criteria at the scikit-learn defaults, with the library version.
  - conditioners: Yeo-Johnson power transform, standard scaling, quantile transform to a normal output, robust scaling, each fitted on the whole cohort.
  - preprocessing: as R2-1a and R2-2b; the hand-crafted features from NeuroKit2 cleaning, R-peak detection and wavelet delineation at their defaults; the RR entropy from a 16-bin histogram over 200 to 2000 ms; the template window of +/-250 ms.
  - autoencoder: Adam with learning rate 1e-3, batch 64, at most 50 epochs (40 on MIT-BIH), early stopping after 8 epochs without a validation-loss improvement of 1e-5 on a random 10% split, trained once.
  - foundation models: HuBERT-ECG base weights without the pretraining heads, frozen, evaluation mode, inputs as R2-2b, mean of the last hidden layer; ECGFounder 12-lead checkpoint without its classification layer, frozen, inputs as R2-2b, time-averaged final features; no fine-tuning.
  - supervised ceiling: balanced logistic regression, at most 2000 iterations, stratified group five-fold; random forest of 200 trees with balanced class weights.
  - cohort: one record per patient; the 9:1 imbalance analysis and the K sweep each use one subsample or seed.
  - MIT-BIH: at most 400 beats per record and class, then 1500 beats per class drawn at random; non-beat annotations excluded.
- **Facts in the code**: clusterers `code/core/cluster_eval.py:45-62`; conditioners `:28-39`, fitted on the whole cohort `code/experiments/benchmark.py:134`, `code/experiments/arm_learned.py:38`; library minimum versions only in `code/requirements.txt` (scikit-learn >= 1.3), with no exact version pinned; NeuroKit2 calls `code/core/features.py:133-139`; RR entropy `:70`; template window `:110`; autoencoder `code/core/deep_repr.py:32`, `:72-96`, MIT-BIH epochs `code/experiments/mitbih_bench.py:97`; HuBERT-ECG `code/experiments/arm_foundation.py:29`, `:35-82`; ECGFounder `code/experiments/arm_ecgfounder.py:37-86`; ceiling `code/core/cluster_eval.py:116-125`; random forest `code/experiments/run_analyses.py:81`; one record per patient `code/experiments/benchmark.py:49-51`; imbalance subsample and single fit `code/experiments/run_analyses.py:86-97`; K sweep single seed `:71`; MIT-BIH caps and subsample `code/experiments/mitbih_bench.py:27-28`, `:43`, `:106-116`. The convergence defaults (k-means iteration limit and tolerance, Gaussian-mixture iteration limit, tolerance and number of initialisations, spectral neighbour count, HDBSCAN minimum samples) are not set in the code; their values are taken from the scikit-learn documentation of the version used, and the exact version is not recorded in `code/`.
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking. The exact library versions are not recorded in the materials; the manuscript can state the minimum versions and point to the dependency list of the code repository.

### R3-8

> **8.** Discussion should better distinguish empirical observations from general conclusions. Several conclusions are presented broadly despite evaluation on only two datasets and two foundation models. The discussion should more explicitly limit claims to the evaluated experimental settings.

- **What it asks**: separate observations from conclusions and limit each claim to the settings evaluated.
- **Section**: abstract (main.tex lines 46, 49-50); 3.2 (lines 194-195); 4.1 (lines 236-238); 4.6 (lines 387-388); Discussion (lines 417-433); Conclusion (lines 460-468).
- **Severity**: Major.
- **Resolved when**: each general sentence below is either scoped to two datasets, two tasks, five clusterers, two named foundation models and a simulated federation, or supported by evidence the paper gives.
- **Suggested fix**: Rewrite these sentences, each stating the observation and its setting:
  - "The representation, not the algorithm, governs label-free ECG structure." (lines 49-50, repeated at 460-461 and 467-468).
  - "such models are tied to the 12-lead strip format" (lines 194-195) and "cannot embed the 2-lead MIT-BIH beats at all" (lines 424-425): the foundation models were not applied to the beats, so the text states that they were not applied because their input is a 12-lead strip, and does not say what they would do.
  - "the compact interpretable representation is the more dependable choice for privacy-preserving, multi-site phenotyping" (lines 387-388).
  - the decision rule (lines 417-422), in particular "if the leads on hand are not the standard twelve", which the study tested only on the MIT-BIH task without the foundation models.
  - "are not viable for label-free arrhythmia structure" (line 426).
  - "both recur often enough in applied clustering to be worth stating plainly" (line 433), which has no source.
  - "regardless of the clustering method" (line 466), which holds for the five clusterers tested.
- **Facts in the code**: the MIT-BIH arm leaves out the foundation models by design (`code/experiments/mitbih_bench.py:15-17`).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

### R3-9

> **9.** Define all abbreviations at their first occurrence and maintain consistent terminology throughout the manuscript.

- **What it asks**: define each abbreviation at first use, and use one term per concept.
- **Section**: whole manuscript.
- **Severity**: Minor (referee's heading).
- **Resolved when**: each abbreviation below is spelled out at its first use in the body, and each concept below has one term throughout.
- **Suggested fix**:
  - Abbreviations not defined: AMI, used at lines 376-377 while line 202 spells the metric out without the abbreviation; HDBSCAN (line 200); GMM (Table 1 header line 251, Table 3 line 365), while line 200 says "Gaussian mixture"; SD (line 244); SCP-ECG (line 156); AFIB and AFLT (line 157); SDNN, RMSSD, pNN50 (line 185); FedAvg (line 221); HuBERT; the table headers "agglom." and "sup. ceiling" (line 251).
  - Terms in variation: hand-crafted features, "cheap features" (line 373), "compact interpretable representation" (line 387); raw flattening, "raw-flatten" (tables), "the raw pipeline", "the raw features" (line 300, which reads as a different representation); conv-AE, convolutional autoencoder, "reconstruction autoencoder", "properly trained reconstruction autoencoder"; sites and clients (lines 222, 382); agglomerative, Ward agglomerative, "agglom."; supervised ceiling, "linear ceiling", separability; SR-versus-AF and SR-vs-AF; foundation embedding and foundation model.
  - Choose one term for each, define it once, and use it everywhere, tables and captions included.
- **Facts in the code**: none needed.
- **Calls for**: new reference: no. Figure change: no (the figure labels are part of the figure files and stay; the captions follow the chosen terms). Number computed from saved results: no.
- **Permission**: none lacking for the text. The labels inside the figures (for example "raw-flatten", "conv-AE") cannot change, so the chosen terms keep these forms or the captions state the correspondence.

### R3-10

> **10.** Improve the readability of Figures 2<en dash>4 by increasing font sizes and enhancing contrast.

- **What it asks**: larger fonts and higher contrast in Figures 2 to 4.
- **Section**: Figures 2, 3 and 4 (main.tex lines 303-309, 323-330, 407-413).
- **Severity**: Minor (referee's heading).
- **Resolved when**: the figure text is legible at print size and the colours are distinguishable.
- **Suggested fix**: The figure files stay as they are. In the source, Figure 2 is included at 0.60 and Figure 3 at 0.62 of the line width; raising the include width enlarges the printed text without changing the figure files. Whether that counts as a figure change under this run's decision is for the session to rule. Contrast cannot change without new figure files.
- **Facts in the code**: base font 9 pt (`code/experiments/figures.py:24`), heatmap labels 8 pt (`:64`), legends 6.5 and 7 pt (`:81`, `:98`, `:115`), point labels 7.5 pt (`:92`); colour-blind-safe palette (`:26-27`). Include widths: main.tex lines 264 (0.78), 305 (0.60), 325 (0.62), 409 (0.78).
- **Calls for**: new reference: no. Figure change: yes. Number computed from saved results: no.
- **Permission**: the run lacks the figure change, so fonts and contrast inside the figures cannot change. The manuscript can still enlarge the include width if the session rules that this is not a figure change.

### R3-11

> **11.** Report sample sizes directly in figure captions for easier interpretation.

- **What it asks**: the sample size in each figure caption.
- **Section**: captions of Figures 1 to 4 (main.tex lines 265, 306-307, 326-328, 410-411); the table captions may follow.
- **Severity**: Minor (referee's heading).
- **Resolved when**: each figure caption states the number of recordings (or beats) and the number of seeds or fits behind each plotted value.
- **Suggested fix**:
  - Figure 1: 2542 PTB-XL recordings (1282 SR, 1260 AF); each cell the mean over ten seeds for k-means, spectral clustering and the Gaussian mixture, one deterministic fit for Ward and HDBSCAN.
  - Figure 2: five representations of the same 2542 recordings; ceiling from patient-grouped five-fold cross-validation; ARI of the best clusterer as in Figure 1.
  - Figure 3: one marker per clustering fit at power scaling (ten seeds for the seeded clusterers, one fit for Ward and HDBSCAN), on 2542 recordings.
  - Figure 4: 2542 recordings split over ten simulated sites, mean over ten seeds.
  - The captions of Tables 1 to 3 can carry the same counts (Table 3: 3000 beats, 1500 per class).
- **Facts in the code**: Figure 1 `code/experiments/figures.py:50-55` with single fits per `code/experiments/benchmark.py:148`; Figure 2 `code/experiments/figures.py:85-99`; Figure 3 `:71-77`; Figure 4 `:102-116` and `code/experiments/fed_cluster.py:22-25`; MIT-BIH 1500 per class `code/experiments/mitbih_bench.py:106`. The number of markers in Figure 3 is not stated; counting them from the saved rows would be a computed number, so the caption describes the markers per fit.
- **Calls for**: new reference: no. Figure change: no (captions only). Number computed from saved results: no.
- **Permission**: none lacking.

### R3-12

> **12.** Include confidence intervals or error bars in all performance figures where appropriate.

- **What it asks**: intervals or error bars in every performance figure.
- **Section**: Figures 1, 2 and 4 (main.tex lines 262-267, 303-309, 407-413).
- **Severity**: Minor (referee's heading).
- **Resolved when**: each performance figure's caption states the spread behind its values, from the saved results, and says what the seeds vary (R1-1).
- **Suggested fix**: In the captions, state what the seeds vary and the spread that stands in the saved results: the k-means seed stability for Figures 1 and 2, and for Figure 4 the seed standard deviations of the federated rows, which Table 2 also gains (R3-5). Point to Table 2 for the federated spread.
- **Facts in the code**: Figure 4 draws the means only (`code/experiments/figures.py:110-112`), while the standard deviations stand in `code/results/results_federated.csv:2-13`. Saved half-widths for Figures 1 and 2 exist only for the raw and hand-crafted rows (`code/results/summary.csv:4-8`, `:24-28`).
- **Calls for**: new reference: no. Figure change: yes. Number computed from saved results: yes, for intervals of the rows without a saved value.
- **Permission**: the run lacks the figure change and the computed numbers, so no figure gains error bars. The manuscript can still state the saved spread in the captions and in Table 2.

### R3-13

> **13.** Standardize decimal precision across all tables.

- **What it asks**: one decimal precision across the tables.
- **Section**: Tables 1 to 3 (main.tex lines 240-260, 353-368, 390-405); the text values that quote them.
- **Severity**: Minor (referee's heading).
- **Resolved when**: every ARI, AMI and ceiling value in the tables and captions has the same number of decimals, a column with a different precision is explained in its caption, and a text value that quotes a table value has the table's precision.
- **Suggested fix**: Keep three decimals for every ARI, AMI and ceiling value in the tables and captions (they are already three). The retention column of Table 2 is at two decimals and holds "N/A": either keep two decimals with the caption saying that the ratio is given to two decimals, or give it as a percentage. Match the text to the tables where it quotes a table value: "ARI 0.78" (line 347) to 0.783, "ARI ~0.05" (line 348) to 0.049, "0.11" (line 350) to 0.110, "ARI 0.01" for the autoencoder (line 293) to the table's best value, "0.93" (line 349) to 0.927. Values that appear only in the text at two decimals (the K-sweep AMI values, the conditioner means, the random-forest accuracy) stay as given.
- **Facts in the code**: the retention ratios are printed and not saved (`code/experiments/fed_cluster.py:117-118`); the K-sweep, conditioner and random-forest values are printed only (`code/experiments/run_analyses.py:63-83`, `code/experiments/figures.py:137-140`).
- **Calls for**: new reference: no. Figure change: no. Number computed from saved results: yes, only for retention at three decimals or for the text-only values at three decimals.
- **Permission**: the run lacks the computed numbers for retention at three decimals and for the text-only values. The rest of the item needs no permission.

### R3-14

> **14.** Verify that all references follow the journal's formatting guidelines and ensure consistent citation style.

- **What it asks**: references formatted to the journal's guidelines, with a consistent citation style.
- **Section**: bibliography (main.tex lines 493-494, `.bib`); citations in the text.
- **Severity**: Minor (referee's heading).
- **Resolved when**: every cited entry is complete and in one form under the numbered Elsevier style, every `.bib` entry is cited or removed, preprints that have since appeared in a journal or proceedings cite that version, and citations used as nouns name their authors.
- **Suggested fix**: The citation compliance agent checks each entry. Points found on reading: two `.bib` entries are not cited (the HDBSCAN paper, cited under R1-3, and the 2017 single-lead AF challenge, a candidate under R2-1b); three preprints are typed as journal articles with "arXiv preprint" as the journal and the identifier repeated in a note (the closest benchmark, ECGFounder, the self-supervised clustering paper); the HuBERT-ECG entry is a medRxiv preprint with a weights URL in its note; five entries have no DOI (the AMI paper, scikit-learn, FedAvg, CLOCS, 3KG); a citation stands as a noun at lines 130 and 142-143 ("the pipeline of [n]", "the benchmark of [n]"), which reads better with the authors' names. The journal's guide for authors is not among the materials (config, Materials in hand), so the check applies the conventions of the numbered Elsevier style the manuscript uses.
- **Facts in the code**: none needed.
- **Calls for**: new reference: possibly (the published versions of preprints, if they exist). Figure change: no. Number computed from saved results: no.
- **Permission**: none lacking.

## Reading 1

Reading of the patched manuscript after the draft writer's patches (02 main.tex, 03 refs.bib, 04 highlights.txt), the literature strategist's patch 01 and the citation compliance patch 06. Line numbers are those of the patched `manuscript/main.tex`. Each apply report gives `result: applied`; the base hashes chain 01 to 03 to 06 for refs.bib; patch 02 carries 3 structural flags, acknowledged under the Decisions; and the three patched outputs compare equal (`cmp`) with `manuscript/main.tex`, `manuscript/refs.bib` and `manuscript/highlights.txt`. Every value the draft writer's report takes from the code and the saved results was read at the file and line it names, and each stands there as the text states it (the checks are listed under "Values read in the code" below).

### Count

- Resolved: 23 (R1-1, R1-2, R1-3, R1-4, R1-5, R2-1a, R2-2a, R2-3, R2-4, R2-5, R3-1, R3-2, R3-3, R3-4, R3-5, R3-6, R3-7, R3-8, R3-10, R3-11, R3-12, R3-13, R3-14). Of these, R1-1, R1-2, R1-4, R1-5, R3-2, R3-3, R3-4, R3-5, R3-6, R3-10, R3-12 and R3-13 are resolved within the permissions: the manuscript makes every change this file says it can still truthfully make, and the remaining part needs a permission the run lacks.
- Partly resolved: 3 (R2-1b, R2-2b, R3-9).
- Not resolved: 0.
- New issues: V1 to V35. V1 to V11 (link lines of the reference check), V22 (source of the master's project) and the placeholder of R3-7 need the user and are not sent back to the draft writer; V12 to V21, V23 to V35 and the remaining parts of R2-1b, R2-2b and R3-9 go to the draft writer.

### Reviewer 1

#### R1-1
- **Reading**: resolved within the permissions.
- **Evidence**: line 148: "The cohort, the raw and hand-crafted features, the two foundation-model embeddings and the trained conv-AE are fixed across seeds. The seeds change only the random initialisation of $k$-means, spectral clustering and the GMM. Ward and HDBSCAN are deterministic and are fitted once. The seed spread therefore measures the stability of the clustering step on a fixed cohort, and it does not measure the sampling uncertainty of the cohort." Line 216 (Table 1 caption): "The seed standard deviation of the $k$-means ARI is 0.000 for raw flattening, the hand-crafted features and HuBERT-ECG, and 0.001 for ECGFounder. The 95\% half-width over seeds is 0.008 for raw flattening with the GMM and below 0.001 for the other seeded entries of raw flattening and the hand-crafted features." The self-contradicting caption phrase is gone, and line 238 limits the stability sentence to the $k$-means solutions. Table 2 (lines 314 to 317) gives the federated standard deviations.
- **What remains**: a bootstrap interval, and intervals for the conv-AE, HuBERT-ECG and ECGFounder rows, need numbers computed from saved results, which the run lacks.

#### R1-2
- **Reading**: resolved within the permissions.
- **Evidence**: line 148: "With ten paired seeds the smallest attainable p-value is 0.002. A p-value at this floor gives the direction of a contrast and says nothing about its size. The difference in mean ARI is therefore reported as the effect size of each contrast." Line 216 and line 238 give the three differences (0.242, 0.470, 0.174) as the effect sizes "on the chance-corrected scale".
- **What remains**: Cliff's delta needs a computed number, which the run lacks.

#### R1-3
- **Reading**: resolved.
- **Evidence**: line 142: "For $k$-means, Ward, spectral clustering and the GMM the number of clusters is set to the number of classes. HDBSCAN is given no cluster count. It labels low-density points as noise and uses a minimum cluster size of the larger of 10 and one fiftieth of the number of records. The noise points keep their own label and are never reassigned to a cluster." The same paragraph states the treatment under the ARI, AMI, NMI, V-measure, FMI, purity, silhouette and largest-cluster fraction, and cites `hdbscan2013`. Line 240: "HDBSCAN labelled every record as noise for raw flattening, the conv-AE and HuBERT-ECG, so these solutions form one cluster and score an ARI of 0."

#### R1-4
- **Reading**: resolved within the permissions.
- **Evidence**: the representation table, first in the source order (lines 115 to 138, `tab:repr`), gives input, dimension, network, parameter count and pretraining corpus of every representation, with the caption "Run time and memory were not measured." "cheap", "inexpensive" and "more deployable" no longer occur in main.tex or highlights.txt (grep). Line 331: "Run time and memory were not measured, so these properties indicate cost without quantifying it."
- **What remains**: the times and the memory need a new experiment, which the run lacks.

#### R1-5
- **Reading**: resolved within the permissions.
- **Evidence**: line 255 (caption of the separability figure): "Each point is one representation. The horizontal value is its supervised ceiling, the patient-grouped five-fold accuracy of a balanced logistic regression, with chance level 0.504. The vertical value is the mean ARI of its best clusterer, a mean over ten seeds or one fit for Ward and HDBSCAN, with chance level 0. ... Table~\ref{tab:main} gives every clusterer and the seed spread, and Fig.~\ref{fig:trap} shows one marker per fit."
- **What remains**: intervals or per-seed points in the figure need a figure change and computed numbers, which the run lacks. The caption's reading of the dashed line is raised as V27.

### Reviewer 2

#### R2-1a
- **Reading**: resolved.
- **Evidence**: line 91: "The benchmark uses the 100\,Hz version of release 1.0.3. Each record was read with the WFDB reader, which applies the conversion to physical units given in the record header. The signal was stored as a 32-bit floating-point array of 1000 samples by 12 leads. No other conversion precedes the representation steps of Section~\ref{sec:repr}." Line 95 gives the same for MIT-BIH at 360 Hz with two leads. The unit is stated as the physical unit of the header at a resolution of 1 microvolt per least significant bit, from the descriptor's passage; no passage read in the run names the unit itself, so the text names none.

#### R2-1b
- **Reading**: partly resolved.
- **Evidence**: line 109 gives the single-lead reason with sources ("The guideline accepts as diagnostic a single-lead tracing of at least 30\,s that shows them \cite{Van_Gelder_2024}"), what the single-lead set leaves out and gains, and "The effect of adding leads to the hand-crafted set was not tested." The reason for lead II itself is a placeholder: "We used lead II as that lead [GAP: source for lead II as the rhythm lead]."
- **What the draft writer must change**: give lead II a reason that rests on a source read in the run. New references are allowed, so a source that states lead II as the conventional rhythm lead is searched for and its passage read. If no such passage is read, the sentence states lead II as the study's choice of rhythm lead without claiming a convention, and the placeholder is removed. The citation `Hannun_2019` in the same paragraph is removed (V15).

#### R2-2a
- **Reading**: resolved.
- **Evidence**: line 109: "Only the hand-crafted features use a single lead. Raw flattening reproduces the 12-lead representation of the original project, and the conv-AE is given the same 12-lead strip. Both foundation models were pretrained on 12-lead input and are given the input they expect." The sentence "Lead II is used for rhythm and morphology" is gone from 3.1. Line 104 states that HuBERT-ECG receives the first 5 s.

#### R2-2b
- **Reading**: partly resolved.
- **Evidence**: lines 101 to 105 give, for each of the five PTB-XL representations, the input, the transformation, the output dimension and the principle, and line 103 names all 16 features, which agree with the feature list of the code. Line 107: "Every representation is then transformed by the conditioner". Line 113 and the MIT-BIH rows of `tab:repr` give inputs and dimensions of the three beat representations.
- **What the draft writer must change**: complete the three MIT-BIH representations. (1) The conv-AE on the beats: state that the 550 ms two-lead window is resampled to 2500 samples per lead and z-scored per lead before the same network, as for PTB-XL (line 113 says only "The conv-AE is applied to the beat window", and the `tab:repr` row gives "2 leads, 550\,ms"). (2) The correlation feature: line 113 says "the correlation with the median beat", which reads as the record's own median beat as on PTB-XL; the beat features correlate each beat with the median of all beats of the 3000-beat set, and the sentence says so. (3) One clause each on what the beat representations encode: the raw window keeps amplitude at fixed positions around the R peak, the beat features measure prematurity (RR context) and QRS shape, and the conv-AE keeps what reconstruction needs.

#### R2-3
- **Reading**: resolved.
- **Evidence**: line 144 and `tab:metrics` (lines 152 to 173) give meaning, formula, range, the value under random labelling and the one-cluster value of the ARI, AMI, NMI, V-measure, FMI, purity, silhouette, largest-cluster fraction and supervised ceiling, with sources for the six published metrics. Line 144: "With the arithmetic-mean normalisation used here, the NMI equals the V-measure, so the two coincide in every result." The formulas agree with the library calls of the code (default arithmetic normalisation; purity without noise; silhouette on non-noise points).

#### R2-4
- **Reading**: resolved.
- **Evidence**: lines 246 to 250 give one explanation per representation tied to a source or to the paper's evidence, opened by "Each result has a likely explanation, and the study did not test these mechanisms directly." Line 250: "With $k$-means, raw flattening places on average 0.967 of the records in one cluster, close to a majority-class assignment. The conv-AE forms two clusters of similar size (the larger holds 0.541 of the records at seed 0) that do not follow the rhythm class."

#### R2-5
- **Reading**: resolved.
- **Evidence**: line 244: "The ceiling is an accuracy whose chance level is the majority-class proportion (0.504). The ARI is corrected for chance, with chance level 0. The two numbers are therefore read against their own chance levels and are not compared directly. ... HuBERT-ECG shows the largest gap between separability and clusterability, with a ceiling of 0.899 and a best ARI of 0.195." Line 248 gives the reason and the reading ("The embedding thus holds the SR-versus-AF information, but recovering it in this setting needs labels."). The sentence "the sharpest case" is gone.

### Reviewer 3

#### R3-1
- **Reading**: resolved.
- **Evidence**: line 62: "The contribution of the study is an evaluation protocol for label-free ECG structure, applied to these representations. It has four parts:" followed by the list at lines 63 to 68. Line 83 compares BenchECG, Al-Masud et al., Xu et al., Berger et al. and the review of Han et al. Line 69: "We propose no new algorithm". "modest and empirical", "We claim no methodological novelty" and "a careful, honest benchmark" are gone. The Discussion's account of the protocol contradicts the Introduction on one point, raised as V26.

#### R3-2
- **Reading**: resolved within the permissions.
- **Evidence**: line 93: "We study the binary SR-versus-AF task because one clinical criterion defines it." Line 341: "Both tasks are binary, and the study makes no claim about multi-class rhythm structure." with multi-class databases cited; "harder" is gone. Line 28 and line 345 scope the conclusions to "two binary tasks".
- **What remains**: validation on further datasets needs an experiment and a download, which the run lacks.

#### R3-3
- **Reading**: resolved within the permissions.
- **Evidence**: as R1-1 and R1-2; line 238: "The effect sizes are the differences in mean ARI on the chance-corrected scale. ECGFounder exceeds the hand-crafted features by 0.242, the hand-crafted features exceed HuBERT-ECG by 0.470, and HuBERT-ECG exceeds raw flattening by 0.174."
- **What remains**: Cliff's delta and bootstrap intervals need computed numbers, which the run lacks.

#### R3-4
- **Reading**: resolved within the permissions.
- **Evidence**: line 111: "We chose the two foundation models by three criteria." with the criteria and "We included ECGFounder for that report". Line 335 names ST-MEM, ECG-JEPA, MERL, ECGFM-KED, ECG-FM and ECG-CPC with citations, and "Every foundation-model statement here holds for HuBERT-ECG and ECGFounder. ... a model trained with another objective could rank differently." "one model per foundation family" is gone; line 339: "The foundation-model results cover two models with different pretraining."
- **What remains**: evaluation of further models needs an experiment and a download, which the run lacks. The citations of line 335 need the changes of V16 and V21.

#### R3-5
- **Reading**: resolved within the permissions.
- **Evidence**: line 206 describes the ten sites, the IID and Dirichlet (0.3) partitions, the dropped sites, the 15 rounds of three local Lloyd iterations, the count-weighted averaging and the seeds, and: "Two steps use the pooled records: the power transform is fitted on all records, and the initial centroids are drawn from all records. The heterogeneity is therefore a simulated class-proportion skew across ten partitions of one dataset." Table 2 (lines 306 to 320) gives mean (standard deviation) for every row. "heterogeneous sites", "realistic site heterogeneity" and "privacy-preserving, multi-site phenotyping" are gone; line 341 states the pooled steps as a limitation.
- **What remains**: real multi-site data or another partition needs an experiment and new data, which the run lacks.

#### R3-6
- **Reading**: resolved within the permissions.
- **Evidence**: `tab:repr` gives the dimension of every representation (lines 126 to 135). Line 331: "The hand-crafted features are also the lowest-dimensional representation (16 values against 768 and 1024, Table~\ref{tab:repr}) ... We judge that the low dimension may also suit distance-based clustering, which this study did not test."
- **What remains**: time and memory need a new experiment, which the run lacks.

#### R3-7
- **Reading**: resolved.
- **Evidence**: `tab:settings` (lines 175 to 202) gives the settings of every clusterer, the conditioners, the feature extraction, the conv-AE training, both foundation models, the ceiling, the random forest, the cohort, the analyses and the MIT-BIH sampling, each agreeing with the code. Line 142: "No clustering setting was tuned against the labels". The caption names the scikit-learn defaults for everything not listed, and line 348 points to the dependency list with minimum versions.
- **Note**: the caption's "[GAP: exact library versions used for the reported results]" marks a fact only the user holds (the exact version is not recorded in `code/`), so it needs the user and is not sent back. The settings cell for the hand-crafted features changes under V19, and the sentence on tuning is reconciled with the labelled pilot under V30.

#### R3-8
- **Reading**: resolved.
- **Evidence**: each sentence this item lists is rewritten. Line 28: "These findings hold for two binary tasks, five clustering algorithms, two named foundation models and a simulated federation." Line 113: "The foundation models were not applied to the two-lead beats, because their input is a 12-lead strip." Line 331: "The practical reading holds for the settings tested" and "so the study makes no comparison on other lead sets". Line 345: "Raw flattening and the conv-AE scored at chance on PTB-XL with every clusterer tested." The decision rule, "not viable", "worth stating plainly" and "regardless of the clustering method" are gone. Two sentences outside this item's list still state more than the evidence, raised as V26 and V28.

#### R3-9
- **Reading**: partly resolved.
- **Evidence**: AMI, HDBSCAN, GMM, NMI and FMI are defined at line 142, SCP-ECG, AFIB and AFLT at line 93, SDNN, RMSSD and pNN50 at line 103, FedAvg and IID at line 206; "SD" no longer occurs; the table headers read "Ward" and "ceiling"; tables and text use "raw flattening", "hand-crafted features", "conv-AE", "Ward" and "sites", and the captions state that the figure labels raw-flatten, kmean, agglo, spect, gmm, hdbsc and clients stand for the chosen terms.
- **What the draft writer must change**: (1) line 244 "above its linear ceiling of 0.519" uses "linear ceiling" for the supervised ceiling; use "supervised ceiling". (2) Line 240 "some ECG foundation embeddings" and line 148 "the two foundation-model embeddings" name one thing two ways; use one form. (3) HuBERT, which this item lists, is not spelled out; spell it out once at line 73 or line 104 if the HuBERT-ECG paper read in the run gives the expansion, and otherwise write it as the model's name, which is how the field writes it.

#### R3-10
- **Reading**: resolved within the permissions.
- **Evidence**: line 254 and line 265: `\includegraphics[width=0.85\linewidth]` for the separability and silhouette-trap figures (0.60 and 0.62 before), as the Decisions allow.
- **What remains**: fonts and contrast inside the figure files need a figure change, which the run lacks.

#### R3-11
- **Reading**: resolved.
- **Evidence**: line 234: "on 2\,542 recordings (1\,282 SR, 1\,260 AF). Each $k$-means, spectral and GMM cell is the mean over ten seeds, and each Ward and HDBSCAN cell is one deterministic fit." Line 255: "on the same 2\,542 recordings". Line 266: "Each marker is one clustering fit: ten seeds for $k$-means, spectral clustering and the GMM, and one fit for Ward and HDBSCAN." Line 325: "on the 2\,542 PTB-XL recordings split over ten sites ... Each bar is the mean $k$-means ARI over ten seeds." The table captions carry the counts (lines 216, 287, 308).

#### R3-12
- **Reading**: resolved within the permissions.
- **Evidence**: line 234: "The seed spread is given in Table~\ref{tab:main}." Line 255 points to the same table. Line 325: "The seed standard deviations are given in Table~\ref{tab:fed} and reach 0.350 for ECGFounder under the non-IID split." Line 308 states what the federated seeds vary.
- **What remains**: error bars in the figures need a figure change and computed numbers, which the run lacks.

#### R3-13
- **Reading**: resolved within the permissions.
- **Evidence**: every ARI, AMI and ceiling value in the tables and captions has three decimals. Line 308: "Retention is the ratio of the non-IID to the centralized mean ARI, given to two decimals. It is not given (n/a) for raw flattening, whose centralized ARI is 0.000." Line 283: "(ARI up to 0.783)", "(ARI at most 0.049)", "its supervised ceiling is 0.927, but its ARI is at most 0.127"; line 244: "(best ARI 0.008)".
- **What remains**: retention at three decimals and the text-only values at three decimals need computed numbers, which the run lacks.

#### R3-14
- **Reading**: resolved.
- **Evidence**: `cite-keys` printed nothing at the last check (every cited key has an entry and every entry is cited). The preprints are `@misc` entries with an eprint, the Xu entry is `@inproceedings`, and the citations used as nouns now name their authors (line 73 "He et al.", line 85 "Filice et al.", line 240 "the report of Filice et al.").
- **Note**: the incomplete or uncertain fields that `citation-report.md` flags (C25 Kim_2027 year, C27 missing volumes and pages of in-press and proceedings entries, C28 the family name of an ECGFounder author written two ways, C29 proceedings years and pages) have no record the run can read, so they need the user. The failing link lines of `check-urls` are V1 to V11.

### New issues

#### Failures of the reference checks (last `check-urls`, after the second start of the citation compliance agent)

Each line below is printed by `check-urls` and fails the status rules ("DOI and URL"). `citation-report.md` ("DOI and URL lines of check-urls" and "Second start") confirms each identifier against a record of its own work, or shows that no DOI exists, so no text or `.bib` change has one right answer. Each needs the user (open the DOI link in a browser before submission, C38; no DOI to add, C37) and is not sent back to the draft writer. Severity: Minor.

- **V1**: `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH`. Needs the user.
- **V2**: `ecgfounder2024: 403 https://doi.org/10.1056/AIoa2401033, ratio 1.00 against Crossref`. Needs the user.
- **V3**: `vinh2010: no identifier`. Needs the user (no registered DOI exists, C37).
- **V4**: `Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref`. Needs the user.
- **V5**: `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH`. Needs the user.
- **V6**: `sklearn2011: no identifier`. Needs the user (no registered DOI exists, C37).
- **V7**: `Danon_2005: failed, no answer (InvalidURL) https://doi.org/10.1088/1742-5468/2005/09/P09008, ratio 1.00 against Crossref`. Needs the user.
- **V8**: `rosenberg2007vmeasure: no identifier`. Needs the user (no DOI in any record, C37).
- **V9**: `Fowlkes_1983: 403 https://doi.org/10.1080/01621459.1983.10478008, ratio 1.00 against Crossref`. Needs the user.
- **V10**: `McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref`. Needs the user.
- **V11**: `Perez_Alday_2020: failed, no answer (InvalidURL) https://doi.org/10.1088/1361-6579/abc960, ratio 1.00 against Crossref`. Needs the user.

#### Citation-report issues the Decisions send to this reading

- **V12** (C4, Critical, 3.1, line 91): "a public 12-lead database (21\,799 records, 18\,869 patients, 10\,s strips)" cites the data descriptor, whose passage gives "21837 records from 18885 patients". Change, as the Decisions rule: either cite a record of release 1.0.3 whose text, read in the run, states 21,799 records and 18,869 patients, or give the descriptor's figures (21,837 records from 18,885 patients) attributed to the descriptor and keep the separate statement that release 1.0.3 at 100 Hz is used.
- **V13** (C6 claim 37, Major, 3.2, line 113): "The 21 hand-crafted beat features are five RR-context values and eight morphology values per lead \cite{dechazal2004}." Change: attribute to the source only the use of RR-interval and morphology feature groups for beat classification, and state the 21 features and their list as the study's own, without the citation on the list.
- **V14** (C8 and C19, Major, Related work, line 73): "ECGFounder \cite{ecgfounder2024}, learn general representations from millions of recordings and are now evaluated as frozen feature extractors" rests on a claim read only in the arXiv version. Change: cite `arxiv_2410_04133` beside `ecgfounder2024` at line 73. Line 105 already cites both.
- **V15** (C14, Minor, 3.2, line 109): "AF and other rhythm classes have also been classified from single-lead recordings \cite{clifford2017af,Hannun_2019}." Change: remove `Hannun_2019` from the sentence, which `clifford2017af` supports alone, and remove its entry from refs.bib so that every entry stays cited.
- **V16** (C18, Minor, Discussion, line 335): "ECGFM-KED \cite{Tian_2024}" is named among models with public weights on a source read only as an abstract. Change: cite `arxiv_2509_25095` beside `Tian_2024` for ECGFM-KED, since its passage names the model among the models with public weights.
- **V17** (C20, Major, Introduction line 56 and 4.2 line 244): line 56 states "This distinction is established in the self-supervised learning literature \cite{sslclustering2025}" after a mechanism (lines 52 to 54, "a representation may place the discriminative direction far from its dominant axes of variation") that the source does not state, and turns one paper into a literature; line 244 calls the same mechanism "the separability-versus-clusterability effect of earlier work \cite{sslclustering2025}". Change: state what the source shows, that in self-supervised image models representations with nearly the same linear-probe accuracy can differ in clustering quality, and give the dominant-axes mechanism as this paper's reading, not as the source's (the wordings of C20).
- **V18** (C21, Minor, Related work, line 73): "and they established the pretraining recipes that later foundation models scaled up" is stated by none of the three cited papers. Change: replace it with what two later model papers state, that ECG-FM adopts the multi-segment contrastive objective of CLOCS \cite{McKeen_2025} and ECG-CPC is pretrained with contrastive predictive coding \cite{arxiv_2509_25095}.
- **V19** (C22, Minor, 3.2 line 103 and `tab:settings` line 191): "the waves are delineated with the discrete wavelet method of NeuroKit2 \cite{neurokit2021}" and "NeuroKit2 \cite{neurokit2021} cleaning, R-peak detection and discrete wavelet delineation at their defaults" attach to the toolbox paper a method and defaults the paper does not name. Change: cite NeuroKit2 for the toolbox only, and state the procedure as the study's setting: the toolbox's cleaning and R-peak detection, and its discrete wavelet delineation, selected by the study.
- **V20** (C23, Minor, 3.4 line 206 and Discussion line 335): "we use standard federated $k$-means" and "the federated procedure is standard \cite{fedavg2017}" claim a standard the source does not state; the source defines federated averaging of model weights. Change: line 335 "the centroid averaging follows federated averaging \cite{fedavg2017}", and line 206 drops "standard" or rests it on a source read in the run.
- **V21** (C24, Minor, Related work, line 85): "HuBERT-ECG in three sizes and ECG-JEPA as frozen feature extractors" names the model of Weimann and Conrad, while line 335 cites another model of the same name (`Kim_2027`). Change: line 85 names "the ECG-JEPA of Weimann and Conrad", so the reader does not take the two for one model.
- **V22** (C30, Minor, Introduction, lines 42 to 49): the master's project's "high cluster purity and a silhouette score near 0.89" are reported without a source. Change: cite the master's thesis or state that it is unpublished. The run holds neither fact, so this needs the user. The field statements of line 40 stay as the authors' framing.
- **V23** (C32, Minor, Introduction, line 60): "Hand-crafted features remain the interpretable default in clinical signal processing and need no trained network." has no source for "the interpretable default in clinical signal processing". Change: cite a source read in the run for it, or state the motivation without the claim about the field ("Hand-crafted features are interpretable and need no trained network").
- **V24** (C35, Minor, 4.1, line 240): "We attribute the low spectral scores, such as 0.016 for HuBERT-ECG, to a poorly connected nearest-neighbour affinity graph, which was not checked." attributes a cause the study did not check. Change: state it as a possible cause ("A possible cause, not checked here, is ...").

C31 (six citations in one sentence, one per model named), C33 (line 73, the reconstruction objective uses no class labels, which holds by definition), C34 (line 93, the authors' rationale for the binary task, which R3-2 asks for) and C36 (line 331, a judgment marked as untested, which R3-6 asks for) need no text change.

#### Errors the revision introduced or kept in text it rewrote

- **V25** (Major, Introduction line 64 and Related work line 85): line 85 "with a supervised ceiling on the same patient-grouped folds as the clustering score" and line 64 "read against a supervised ceiling on the same representation and folds" say that the clustering score uses folds. The clusterers are fitted on the whole cohort without folds (the clustering loop of the benchmark fits every clusterer on all 2542 conditioned records); only the ceiling uses the patient-grouped five folds. Change: state that the ceiling is computed with patient-grouped five-fold cross-validation on the same records and representation as the clustering score.
- **V26** (Major, Discussion, line 335): "It also compares a hand-crafted baseline with two foundation models on two datasets and adds two stress tests." contradicts line 66 and line 113: the foundation models were compared on PTB-XL only and were not applied to MIT-BIH. Change: "It compares a hand-crafted baseline with two foundation models on PTB-XL, and with learned and raw representations on a MIT-BIH beat task, and adds two stress tests."
- **V27** (Major, caption of the separability figure, line 255): "Points far below the dashed parity line are separable but do not cluster by class." reads the two axes on one scale, which line 244 rules out ("The two numbers are therefore read against their own chance levels and are not compared directly"). The dashed line is the line of equal values from 0.5 to 1, so at the ceiling's chance level (0.504) it lies at an ARI of 0.5, not at the ARI's chance level of 0. Change: state that the dashed line marks equal values on the two axes and is drawn for orientation, and that a point's position is read against each axis's own chance level (0.504 and 0).
- **V28** (Major, 4.6, line 302): "Two stressors closer to deployment separate the representations more sharply than the balanced benchmark." is contradicted two sentences later for the federation: "Under this skew ECGFounder (0.612) and the hand-crafted features (0.591) come close." (on balanced data they are 0.885 and 0.644). Change: state what the two stressors do in this setting, that they change the order of ECGFounder and the hand-crafted features (imbalance) or bring them close (federation).
- **V29** (Minor, 4.2, line 244): "Raw flattening carries almost no label information (ceiling 0.519)" is followed in the same paragraph by "A random forest on raw flattening reaches an accuracy of 0.71, above its linear ceiling of 0.519", so raw flattening carries label information that a non-linear probe recovers; "A non-linear probe gives the same reading" then has no clear referent. Change: "Raw flattening carries almost no linearly decodable label information (ceiling 0.519)", and say which reading the random forest confirms: label information present that clustering does not recover.
- **V30** (Minor, 3.3, lines 142 and 150): "No clustering setting was tuned against the labels" stands beside "We adopted it after a pilot run on a smaller SR-versus-AF set ... The pilot used the labels". Change: state that no clusterer setting was tuned against the labels and that the default conditioner was chosen on a labelled pilot, which is why all four conditioners are reported.
- **V31** (Minor, 3.1, line 93): "The positives are all records carrying an AF statement" is not what the cohort holds: the cohort keeps one record per patient, 1260 AF records out of the AF records of PTB-XL (the label settings of the code state 1570 AF records under the presence rule). Change: "The positives are drawn from the records carrying an AF statement ..., and the controls from the sinus-rhythm records without one."
- **V32** (Minor, 4.1 line 238 and Table 1 caption line 216): "for every adjacent contrast" and "the three adjacent $k$-means contrasts" call HuBERT-ECG against raw flattening adjacent, while the conv-AE (0.004) lies between them in the $k$-means column of Table 1. Change: name the three contrasts tested, or say "adjacent among the four representations tested" and that the conv-AE was not tested.
- **V33** (Minor, abstract line 28 and 3.3 line 148): "repeats each fit over ten seeds" and "Each configuration is repeated over ten seeds" contradict line 148's "Ward and HDBSCAN are deterministic and are fitted once" and the single fits of the $K$ sweep and the imbalance analysis (line 150). Change: "repeats each seeded clustering fit over ten seeds".
- **V34** (Major, software wording, 3.3 line 150 and Limitations line 339): "after a pilot run on a smaller SR-versus-AF set" (new text), and in the Limitations paragraph the revision rewrote, "Because bulk streaming of the 500\,Hz records was rate-limited at the source" and "rather than a full re-run", describe software operations of the project's own work. Change: state them in the study's terms, such as "after a pilot analysis on a smaller SR-versus-AF set", "Because the 500\,Hz records could not be obtained in bulk from the source" and "rather than the full cohort".
- **V35** (Minor, declaration of generative AI, line 366): the revision turned the authors' complete wording "(Claude)" into "(Claude [GAP: model version used for software implementation and language editing])". The run holds no record of that version. Change: restore "(Claude)" for the preparation of the first submission and keep the new revision sentence, unless the user supplies the version; the placeholder is not left in the submitted text.

### Values read in the code

Each value below stands at the place named, read without running anything:

- Table 1 entries and ceilings: `code/results/summary.csv:4-8`, `:24-28` (raw flattening and hand-crafted means and half-widths, 0.0082 for raw flattening with the GMM, the others below 0.001), `code/results/baselines.csv:2-6` (0.504, random ARI 0.000106, 0.519, 0.942), `baselines_learned.csv:2` (0.678), `baselines_foundation.csv:2` (0.8985), `figures.py:35` (0.983).
- Seed standard deviations of the $k$-means ARI: `results_federated.csv:4,7,10,13` (0.00019, 0.0, 0.0, 0.00115); the centralized $k$-means there uses the same power transform, ten initialisations and seeds as the benchmark (`fed_cluster.py:91-101`), and the per-seed ECGFounder values of `results_compare_strong.csv:258-267` (0.8839 to 0.8869) agree.
- Table 2 means and standard deviations: `results_federated.csv:2-13`, each rounded as printed; retentions 0.69, 0.92 and 0.61 from the printed means.
- HDBSCAN: `results_raw.csv:33`, `results_learned.csv:33`, `results_compare_strong.csv:161` (zero non-noise clusters), `:33` (0.140), `:289` (0.202); noise handling `core/cluster_eval.py:61,68-96`.
- Purity 0.901 and 0.506, largest-cluster fraction 0.967 and 1.00, silhouette 0.81 and 0.28: `summary.csv:4,7,24,27`; conv-AE largest cluster 0.541 at seed 0: `results_learned.csv:2`.
- Inputs and settings: `core/config.py:16,23,24,32,62,64-65`; `experiments/benchmark.py:46,49-52,62-63,134-136,148`; `core/features.py:42,53-59,70,110,124-125,133-139,146-148`; `core/deep_repr.py:22,32,40,47-51,72,77,91,95`; `experiments/arm_learned.py:64`; `experiments/arm_foundation.py:29,31-32,59,63-79`; `experiments/arm_ecgfounder.py:40,43,47,52,68-75`; `core/ecgfounder_net1d.py:389`; `experiments/mitbih_bench.py:27-28,40,43,66-79,88,96-97,106`; `experiments/run_analyses.py:47-48,71,81,88-96`; `experiments/fed_cluster.py:22-26,57,65,72,93,100`; `requirements.txt` (scikit-learn >= 1.3); `README.md:19` (PTB-XL 1.0.3 at 100 Hz).
- MIT-BIH ceilings and majority: `baselines_mitbih.csv:2-5`.

## Reading 2

This reading covers the patched manuscript after the draft writer's second pass, which is revision item 8: patch 09 on main.tex and patch 10 on refs.bib. No highlights patch was written. Line numbers are those of the current `manuscript/main.tex`. Both apply reports give `result: applied`, and neither has a structural flag. The bases chain correctly: the sha256 of the patch 02 output equals the base of patch 09 (532d0e5b...), and the sha256 of the patch 06 output equals the base of patch 10 (54f98823...). The outputs of patches 09, 10 and 04 compare equal (`cmp`) with `manuscript/main.tex`, `manuscript/refs.bib` and `manuscript/highlights.txt`. The second pass changed 27 blocks of main.tex, and each change was read in a word diff against the output of patch 02. Every value the second pass takes from the code was read at the file and line it names, and each stands there as the text states it (see "Values read in the code" below). Each new passage the second pass cites was read in the fetched texts.

### Count

- Items resolved: all 26. R1-1, R1-2, R1-4, R1-5, R3-2, R3-3, R3-4, R3-5, R3-6, R3-10, R3-12 and R3-13 are resolved within the permissions: the manuscript makes every change this file says it can still make, and the remaining part needs a permission the run lacks. R1-3, R2-1a, R2-1b, R2-2a, R2-2b, R2-3, R2-4, R2-5, R3-1, R3-7, R3-8, R3-9, R3-11 and R3-14 are resolved in full. R3-7 still carries a placeholder that needs the user.
- Items partly resolved: 0.
- Items not resolved: 0.
- Issues V12 to V21 and V23 to V35: all 23 resolved, none partly resolved, none not resolved.
- Issues V1 to V11 and V22: these stay with the user and are listed unchanged below.
- New issues: V36, V37 and V38. V36 is a link line of the last `check-urls` and needs the user. V37 and V38 are Minor issues in text the second pass rewrote. No writer pass follows this reading, so V36, V37 and V38 go to the final message as acknowledged limitations.

### Reviewer 1

#### R1-1
- **Reading**: resolved within the permissions.
- **Evidence**: line 141: "The cohort, the raw and hand-crafted features, the two foundation-model embeddings and the trained conv-AE are fixed across seeds. The seeds change only the random initialisation of $k$-means, spectral clustering and the GMM. Ward and HDBSCAN are deterministic and are fitted once." Line 209 (Table 1 caption): "The seed standard deviation of the $k$-means ARI is 0.000 for raw flattening, the hand-crafted features and HuBERT-ECG, and 0.001 for ECGFounder. The 95\% half-width over seeds is 0.008 for raw flattening with the GMM and below 0.001 for the other seeded entries of raw flattening and the hand-crafted features." Line 231 limits the stability sentence to "the $k$-means solutions". Table 2 (lines 307 to 310) gives the mean (standard deviation) of every federated row.
- **What remains**: a bootstrap interval, and intervals for the conv-AE, HuBERT-ECG and ECGFounder rows, need numbers computed from saved results. The run lacks that permission.

#### R1-2
- **Reading**: resolved within the permissions.
- **Evidence**: line 141: "With ten paired seeds the smallest attainable p-value is 0.002. A p-value at this floor gives the direction of a contrast and says nothing about its size. The difference in mean ARI is therefore reported as the effect size of each contrast." Line 209: "with effect sizes, the differences in mean ARI, of 0.242, 0.470 and 0.174". Line 231: "The effect sizes are the differences in mean ARI on the chance-corrected scale."
- **What remains**: Cliff's delta needs a computed number. The run lacks that permission.

#### R1-3
- **Reading**: resolved.
- **Evidence**: line 135: "HDBSCAN is given no cluster count. It labels low-density points as noise and uses a minimum cluster size of the larger of 10 and one fiftieth of the number of records. The noise points keep their own label and are never reassigned to a cluster." The same paragraph states how the ARI, AMI, NMI, V-measure, FMI, purity, silhouette and largest-cluster fraction treat the noise points, and it cites `hdbscan2013`. Line 233: "HDBSCAN labelled every record as noise for raw flattening, the conv-AE and HuBERT-ECG, so these solutions form one cluster and score an ARI of 0."

#### R1-4
- **Reading**: resolved within the permissions.
- **Evidence**: `tab:repr` (lines 108 to 131) gives the input, dimension, network, parameter count and pretraining corpus of each representation. Its caption, line 112, states: "Run time and memory were not measured." Line 324: "Run time and memory were not measured, so these properties indicate cost without quantifying it." A case-insensitive grep for "cheap", "inexpensive" and "deployable" finds no occurrence in main.tex or in highlights.txt.
- **What remains**: the times and the memory need a new experiment. The run lacks that permission.

#### R1-5
- **Reading**: resolved within the permissions.
- **Evidence**: line 248 (caption of the separability figure): "Each point is one representation. The horizontal value is its supervised ceiling, the patient-grouped five-fold accuracy of a balanced logistic regression, with chance level 0.504. The vertical value is the mean ARI of its best clusterer, a mean over ten seeds or one fit for Ward and HDBSCAN, with chance level 0. ... Table~\ref{tab:main} gives every clusterer and the seed spread, and Fig.~\ref{fig:trap} shows one marker per fit."
- **What remains**: intervals or per-seed points in the figure need a figure change and computed numbers. The run lacks both permissions.

### Reviewer 2

#### R2-1a
- **Reading**: resolved.
- **Evidence**: line 84: "The benchmark uses the 100\,Hz version of release 1.0.3 \cite{ptbxl103}. Each record was read with the WFDB reader, which applies the conversion to physical units given in the record header. The signal was stored as a 32-bit floating-point array of 1000 samples by 12 leads. No other conversion precedes the representation steps of Section~\ref{sec:repr}." Line 88 states the same for MIT-BIH, with two leads at 360 Hz.

#### R2-1b
- **Reading**: resolved.
- **Evidence**: line 102 gives the reason for a single lead, with sources: "We computed the hand-crafted features from a single lead because the defining signs of AF can be read in one lead. The guideline accepts as diagnostic a single-lead tracing of at least 30\,s that shows them \cite{Van_Gelder_2024}." It then states lead II as the study's choice, with a cited precedent: "We chose lead II as that lead. Zheng et al.~\cite{Zheng_2020} likewise extracted features such as the atrial rate and the mean and variance of the RR interval from lead II." It also states what the single-lead set leaves out and gains, and that "The effect of adding leads to the hand-crafted set was not tested." The placeholder for lead II is gone. A grep for `[GAP` finds only the placeholder of R3-7 at line 172. The Zheng passage stands in the fetched text, `Zheng_2020.txt` line 894: "Features extracted from lead II include ventricular rate in beats per minute (BPM), atrial rate in BPM, ... mean of RR interval, Variance of RR interval, RR interval count."
- **Note**: no source read in the run calls lead II the conventional rhythm lead. The text therefore makes the change Reading 1 set for that case: lead II is stated as the study's choice, with no claim of a convention.

#### R2-2a
- **Reading**: resolved.
- **Evidence**: line 102: "Only the hand-crafted features use a single lead. Raw flattening reproduces the 12-lead representation of the original project, and the conv-AE is given the same 12-lead strip. Both foundation models were pretrained on 12-lead input and are given the input they expect." Line 97 states that HuBERT-ECG "receives the first 5\,s of the 12 leads at 100\,Hz".

#### R2-2b
- **Reading**: resolved.
- **Evidence**: lines 94 to 98 give the input, the transformation, the output dimension and the principle of each of the five PTB-XL representations. Line 100: "Every representation is then transformed by the conditioner". Line 106 completes the three MIT-BIH representations:
  - raw beat window: "It keeps the amplitude at fixed positions around the R peak."
  - beat features: the RR-context values "measure the prematurity of a beat", and "The eighth is the correlation of the window with the median of all 3\,000 beats of the task. They describe the shape of the beat."
  - conv-AE on the beats: "The 550\,ms two-lead window is resampled to 2500 samples per lead and z-scored per lead before the same network, and the code again keeps what reconstruction needs."
  - The `tab:repr` row for the beat conv-AE, line 128, reads "2 leads, 550\,ms, resampled to 2500 samples per lead".
  - Each statement agrees with the code, as listed below.

#### R2-3
- **Reading**: resolved.
- **Evidence**: line 137 and `tab:metrics` (lines 145 to 166) give the meaning, formula and range of each metric, with its value under random labelling and its value when all records form one cluster. This covers the ARI, AMI, NMI, V-measure, FMI, purity, silhouette, largest-cluster fraction and supervised ceiling. Line 137: "With the arithmetic-mean normalisation used here, the NMI equals the V-measure, so the two coincide in every result."

#### R2-4
- **Reading**: resolved.
- **Evidence**: line 239: "Each result has a likely explanation, and the study did not test these mechanisms directly." Line 239 then gives the explanations for ECGFounder and the hand-crafted features, line 241 for HuBERT-ECG, and line 243 for raw flattening and the conv-AE: "With $k$-means, raw flattening places on average 0.967 of the records in one cluster, close to a majority-class assignment. The conv-AE forms two clusters of similar size (the larger holds 0.541 of the records at seed 0) that do not follow the rhythm class."

#### R2-5
- **Reading**: resolved.
- **Evidence**: line 237: "The ceiling is an accuracy whose chance level is the majority-class proportion (0.504). The ARI is corrected for chance, with chance level 0. The two numbers are therefore read against their own chance levels and are not compared directly." The same line states: "HuBERT-ECG shows the largest gap between separability and clusterability, with a ceiling of 0.899 and a best ARI of 0.195." Line 241 gives the reason and how to read it: "The embedding thus holds the SR-versus-AF information, but recovering it in this setting needs labels."

### Reviewer 3

#### R3-1
- **Reading**: resolved.
- **Evidence**: line 55: "The contribution of the study is an evaluation protocol for label-free ECG structure, applied to these representations. It has four parts:", followed by the list at lines 56 to 61. Line 62: "We propose no new algorithm". Line 76 compares the work with BenchECG, Al-Masud et al., Xu et al., Berger et al. and the review of Han et al. Line 328 now gives the protocol as the Introduction does: "It compares a hand-crafted baseline with two foundation models on PTB-XL, and with learned and raw representations on a MIT-BIH beat task, and adds two stress tests."

#### R3-2
- **Reading**: resolved within the permissions.
- **Evidence**: line 86: "We study the binary SR-versus-AF task because one clinical criterion defines it." Line 334: "Both tasks are binary, and the study makes no claim about multi-class rhythm structure." Line 28 and line 338 scope the findings to "two binary tasks".
- **What remains**: validation on further datasets needs an experiment and a download. The run lacks both permissions.

#### R3-3
- **Reading**: resolved within the permissions.
- **Evidence**: the changes of R1-1 and R1-2. Line 231 also states the practical size of each contrast: "ECGFounder exceeds the hand-crafted features by 0.242, the hand-crafted features exceed HuBERT-ECG by 0.470, and HuBERT-ECG exceeds raw flattening by 0.174."
- **What remains**: Cliff's delta and bootstrap intervals need computed numbers. The run lacks that permission.

#### R3-4
- **Reading**: resolved within the permissions.
- **Evidence**: line 104: "We chose the two foundation models by three criteria." Line 328 names ST-MEM, ECG-JEPA, MERL, ECGFM-KED, ECG-FM and ECG-CPC with citations, ECGFM-KED now cited as "\cite{Tian_2024,arxiv_2509_25095}". The same line states: "Every foundation-model statement here holds for HuBERT-ECG and ECGFounder. ... a model trained with another objective could rank differently." Line 332: "The foundation-model results cover two models with different pretraining."
- **What remains**: evaluation of further models needs an experiment and a download. The run lacks both permissions.

#### R3-5
- **Reading**: resolved within the permissions.
- **Evidence**: line 199 describes the simulation in full, including: "Two steps use the pooled records: the power transform is fitted on all records, and the initial centroids are drawn from all records. The heterogeneity is therefore a simulated class-proportion skew across ten partitions of one dataset." Table 2 (lines 307 to 310) gives the mean (standard deviation) of every row. Line 334: "It fits the conditioner and draws the initial centroids on the pooled records, which a real multi-site deployment could not do."
- **What remains**: real multi-site data or another partition needs an experiment and new data. The run lacks both permissions.

#### R3-6
- **Reading**: resolved within the permissions.
- **Evidence**: the Dimension column of `tab:repr` (lines 119 to 128) gives the dimension of every representation. Line 324: "The hand-crafted features are also the lowest-dimensional representation (16 values against 768 and 1024, Table~\ref{tab:repr}) ... We judge that the low dimension may also suit distance-based clustering, which this study did not test."
- **What remains**: time and memory need a new experiment. The run lacks that permission.

#### R3-7
- **Reading**: resolved.
- **Evidence**: `tab:settings` (lines 168 to 195) gives the settings of each step: every clusterer, the conditioners, the feature extraction, the conv-AE training, both foundation models, the ceiling, the random forest, the cohort, the analyses and the MIT-BIH sampling. Line 135: "No clusterer setting was tuned against the labels". Line 341 points to "the list of software dependencies with their minimum versions".
- **Note**: the caption at line 172 still holds "[GAP: exact library versions used for the reported results]". The exact versions are not recorded in `code/`, so the placeholder needs the user before submission. Config.md, Decisions, sends it to the final message.

#### R3-8
- **Reading**: resolved.
- **Evidence**:
  - line 28: "These findings hold for two binary tasks, five clustering algorithms, two named foundation models and a simulated federation."
  - line 106: "The foundation models were not applied to the two-lead beats, because their input is a 12-lead strip."
  - line 205: "In this setting, the choice of representation changed the result more than the choice of clusterer."
  - line 324: "The practical reading holds for the settings tested".
  - line 338: "These conclusions hold for two binary tasks, two named foundation models and a simulated federation."
  - The two sentences Reading 1 raised beside this item are corrected: V26 at line 328 and V28 at line 295.

#### R3-9
- **Reading**: resolved.
- **Evidence**: the three parts Reading 1 left are changed:
  - "linear ceiling" is gone. Line 237 now reads "above its supervised ceiling of 0.519".
  - The foundation models' vectors are called "foundation-model embeddings" at line 141 ("the two foundation-model embeddings") and at line 233 ("some ECG foundation-model embeddings"). A grep finds no "foundation embedding".
  - HuBERT is written as the model's name, with its origin stated at line 97: "a self-supervised transformer modelled on the HuBERT model for speech representation learning". The HuBERT-ECG paper gives no expansion of the name (`hubertecg2024.txt` lines 130 to 131: "we draw inspiration from HuBERT24, a powerful self-supervised foundation model for speech representation learning").
  - The abbreviations and terms that Reading 1 found defined stay defined.

#### R3-10
- **Reading**: resolved within the permissions.
- **Evidence**: line 247 and line 258 read `\includegraphics[width=0.85\linewidth]` for the separability figure and the silhouette-trap figure.
- **What remains**: fonts and contrast inside the figure files need a figure change. The run lacks that permission.

#### R3-11
- **Reading**: resolved.
- **Evidence**: each figure caption states its sample size:
  - line 227: "on 2\,542 recordings (1\,282 SR, 1\,260 AF). Each $k$-means, spectral and GMM cell is the mean over ten seeds, and each Ward and HDBSCAN cell is one deterministic fit."
  - line 248: "on the same 2\,542 recordings".
  - line 259: "Each marker is one clustering fit: ten seeds for $k$-means, spectral clustering and the GMM, and one fit for Ward and HDBSCAN."
  - line 318: "on the 2\,542 PTB-XL recordings split over ten sites ... Each bar is the mean $k$-means ARI over ten seeds."
  - The table captions also carry the counts (lines 209, 280 and 301).

#### R3-12
- **Reading**: resolved within the permissions.
- **Evidence**: line 227: "The seed spread is given in Table~\ref{tab:main}." Line 248 points to the same table. Line 318: "The seed standard deviations are given in Table~\ref{tab:fed} and reach 0.350 for ECGFounder under the non-IID split."
- **What remains**: error bars in the figures need a figure change and computed numbers. The run lacks both permissions.

#### R3-13
- **Reading**: resolved within the permissions.
- **Evidence**: every ARI, AMI and ceiling value in the tables and captions has three decimals. Line 301: "Retention is the ratio of the non-IID to the centralized mean ARI, given to two decimals." Line 276: "(ARI up to 0.783)", "(ARI at most 0.049)" and "its supervised ceiling is 0.927, but its ARI is at most 0.127". Line 237: "(best ARI 0.008)".
- **What remains**: retention at three decimals, and the text-only values at three decimals, need computed numbers. The run lacks that permission.

#### R3-14
- **Reading**: resolved.
- **Evidence**:
  - The last `cite-keys` printed nothing and exited with status 0, so every cited key has an entry and every entry is cited.
  - `Hannun_2019` is removed from line 102 and from refs.bib.
  - The new entry `ptbxl103` is an `@misc` record with author, title, howpublished, note, year and DOI, in the same form as the other non-article entries.
  - Citations used as nouns name their authors: line 66 "He et al.", line 78 "Filice et al.", line 102 "Zheng et al.".
- **Note**: the uncertain fields C25, C27, C28 and C29 of `citation-report.md` have no record the run can read, so they stay with the user, as Reading 1 states.

### Issues V1 to V11 and V22 (with the user, unchanged)

- **V1**: `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH`. Needs the user.
- **V2**: `ecgfounder2024: 403 https://doi.org/10.1056/AIoa2401033, ratio 1.00 against Crossref`. Needs the user.
- **V3**: `vinh2010: no identifier`. Needs the user.
- **V4**: `Van_Gelder_2024: 403 https://doi.org/10.1093/eurheartj/ehae176, ratio 1.00 against Crossref`. Needs the user.
- **V5**: `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH`. Needs the user.
- **V6**: `sklearn2011: no identifier`. Needs the user.
- **V7**: `Danon_2005: failed, no answer (InvalidURL) https://doi.org/10.1088/1742-5468/2005/09/P09008, ratio 1.00 against Crossref`. Needs the user. The last `check-urls` (checks.md, "Steps 11 after revision item 8") prints this key as "Danon_2005: 200 https://doi.org/10.1088/1742-5468/2005/09/P09008, ratio 1.00 against Crossref", so the link answered in that check.
- **V8**: `rosenberg2007vmeasure: no identifier`. Needs the user.
- **V9**: `Fowlkes_1983: 403 https://doi.org/10.1080/01621459.1983.10478008, ratio 1.00 against Crossref`. Needs the user.
- **V10**: `McKeen_2025: 403 https://doi.org/10.1093/jamiaopen/ooaf122, ratio 1.00 against Crossref`. Needs the user.
- **V11**: `Perez_Alday_2020: failed, no answer (InvalidURL) https://doi.org/10.1088/1361-6579/abc960, ratio 1.00 against Crossref`. Needs the user.
- **V22**: the master's project's "high cluster purity and a silhouette score near 0.89" (lines 44 to 45) are still reported without a source. Needs the user: cite the master's thesis, or state that it is unpublished.

### Issues V12 to V21 and V23 to V35

- **V12**: resolved. Line 84: "We use PTB-XL, a public database of 10\,s 12-lead recordings, whose data descriptor reports 21\,837 records from 18\,885 patients \cite{ptbxl2020}." and "The benchmark uses the 100\,Hz version of release 1.0.3 \cite{ptbxl103}." The descriptor's figures stand in `ptbxl2020.txt` line 14: "21837 records from 18885 patients of 10 seconds length". `check-urls` prints `ptbxl103: 200 https://doi.org/10.13026/KFZX-AW45, ratio 1.00 against OpenAlex`. Line 341 cites both entries for version 1.0.3.
- **V13**: resolved. Line 106: "Heartbeats of the MIT-BIH database have been classified from two-lead feature sets of morphology and RR intervals \cite{dechazal2004}. We defined 21 hand-crafted beat features in these two groups". The list carries no citation. The abstract read in the run (`dechazal2004.abstract.txt`) holds "Twelve configurations processing feature sets derived from two ECG leads were compared. Feature sets were based on ECG morphology, heartbeat intervals, and RR-intervals."
- **V14**: resolved. Line 66: "ECGFounder \cite{ecgfounder2024,arxiv_2410_04133}".
- **V15**: resolved. Line 102: "AF and other rhythm classes have also been classified from single-lead recordings \cite{clifford2017af}." The `Hannun_2019` entry is deleted from refs.bib (patch 10, OP002), and `cite-keys` prints nothing.
- **V16**: resolved. Line 328: "ECGFM-KED \cite{Tian_2024,arxiv_2509_25095}". The passage stands in `arxiv_2509_25095.txt` line 139: "only FMs with publicly available pretrained weights are included".
- **V17**: resolved. Line 51: "in self-supervised image models, representations with nearly the same linear-probe accuracy can differ in clustering quality \cite{sslclustering2025}. We read such a gap as a representation placing the discriminative direction away from its dominant axes of variation. ... This reading is ours". The claim of a literature is gone. Line 237: "This reading is consistent with the gap between linear-probe accuracy and clustering quality reported for self-supervised image models \cite{sslclustering2025}." Line 328 uses the same wording. The source passage (`sslclustering2025.txt` line 119) compares the projector outputs and the encodings of the same models at "nearly the same linear evaluation accuracy".
- **V18**: resolved. Line 66: "Later foundation models reuse some of these objectives: ECG-FM adopts the multi-segment contrastive objective of CLOCS \cite{McKeen_2025}, and ECG-CPC is pretrained with contrastive predictive coding \cite{arxiv_2509_25095}." The passages stand in `McKeen_2025.txt` line 113 ("the contrastive CMSC objective originally introduced by CLOCS") and `arxiv_2509_25095.txt` line 140.
- **V19**: resolved. Line 96: "the waves are delineated with the NeuroKit2 toolbox \cite{neurokit2021}, and we selected its discrete wavelet method for the delineation." Line 184: "NeuroKit2 toolbox \cite{neurokit2021}: signal cleaning, R-peak detection, and wave delineation by its discrete wavelet method, selected by the study". "at their defaults" is gone.
- **V20**: resolved. Line 199: "we use federated $k$-means, with centroid aggregation in the manner of federated averaging (FedAvg) \cite{fedavg2017}". "standard" is gone. Line 328: "the centroid averaging follows federated averaging \cite{fedavg2017}".
- **V21**: resolved. Line 78: "the ECG-JEPA of Weimann and Conrad".
- **V23**: resolved. Line 53: "Hand-crafted features measure named physiological quantities, such as RR intervals and P-wave presence, and need no trained network." The claim about the field is gone. The next sentence of the same block is raised as V37.
- **V24**: resolved. Line 233: "A possible cause of the low spectral scores, such as 0.016 for HuBERT-ECG, is a poorly connected nearest-neighbour affinity graph, which was not checked here."
- **V25**: resolved. Lines 28, 57 and 78 now attach the patient grouping to the ceiling alone ("a supervised ceiling, computed with patient-grouped five-fold cross-validation on the same records and representation"), and so does line 328 ("a patient-grouped supervised ceiling"). Line 86: "No patient appears in both classes, and the supervised ceiling uses patient-grouped folds." A grep for "patient-grouped" finds it only beside the ceiling or its cross-validation.
- **V26**: resolved. Line 328: "It compares a hand-crafted baseline with two foundation models on PTB-XL, and with learned and raw representations on a MIT-BIH beat task, and adds two stress tests."
- **V27**: resolved. Line 248: "The dashed line, labelled parity, joins equal values on the two axes and is drawn for orientation. Each coordinate is read against its own chance level, 0.504 for the ceiling and 0 for the ARI."
- **V28**: resolved. Line 295: "Two stressors closer to deployment change the comparison between ECGFounder and the hand-crafted features. Under class imbalance the hand-crafted features exceed ECGFounder, and under the simulated federation the two come close."
- **V29**: resolved. Line 237: "Raw flattening carries almost no linearly decodable label information (ceiling 0.519)" and "A non-linear probe confirms that label information can be present where clustering does not recover it. A random forest on raw flattening reaches an accuracy of 0.71, above its supervised ceiling of 0.519, while its clustering ARI is 0."
- **V30**: resolved. Line 135: "No clusterer setting was tuned against the labels, and Table~\ref{tab:settings} gives the settings of every step. The default conditioner was chosen on a labelled pilot analysis, described below." Line 143: "Because this choice used the labels, all four conditioners are reported in the Results."
- **V31**: resolved. Line 86: "The positives are drawn from the records carrying an AF statement, atrial fibrillation (AFIB) or atrial flutter (AFLT), and the controls from the sinus-rhythm records without one." and "The records are taken in random order with one record per patient. The sinus-rhythm records come first, as many as there are patients with an AF record, followed by the AF records of patients not yet included." This matches the cohort code (below).
- **V32**: resolved. Line 209: "Paired Wilcoxon tests compare the representations adjacent in the $k$-means ranking of ECGFounder, the hand-crafted features, HuBERT-ECG and raw flattening. ... The conv-AE was not tested." Line 231 says the same.
- **V33**: resolved. Line 28: "repeats each seeded clustering fit over ten seeds". Line 141: "In the main benchmark each fit of $k$-means, spectral clustering and the GMM is repeated over ten seeds."
- **V34**: resolved. Line 143: "after a pilot analysis on a smaller, labelled SR-versus-AF set". Line 332: "Because the 500\,Hz records could not be obtained in bulk from the source" and "rather than the full cohort". A whole-word grep of main.tex for "run", "runs", "re-run", "pipeline", "streaming", "rate-limited" and "script" gives four hits, and none is software wording about the project's own work. Line 43, "That pipeline flattened each strip", describes the master's project in the authors' unchanged text. Lines 112 and 324 use "Run time", the field's term. Line 199, "every site runs three local Lloyd iterations", describes the algorithm.
- **V35**: resolved. Line 359: "the authors used a generative AI assistant (Claude) to support software implementation and to edit and improve the language of the manuscript." The placeholder is gone, and the revision sentence stays.

### New issues

- **V36** (Minor, link line of the last `check-urls`): `hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref`. The entry is unchanged by patch 10. The check after the second start of the citation compliance agent printed this key at 200, and the last check prints it at 403. `citation-report.md`, "DOI and URL lines of check-urls", explains this case: with a ratio of 0.98 the DOI is right and the publisher page refused the request. No text or `.bib` change has one right answer. Needs the user: open the DOI link in a browser before submission, as for V2, V4, V9 and V10.
- **V37** (Minor, Introduction, line 53, in text the second pass rewrote): "MIT-BIH is the canonical morphology benchmark." This claim about the field has no source, the same kind of claim that V23 removed from the sentence before it. The draft writer's report names it and leaves it unchanged. What must change: cite a source read in the run for the claim, or state what MIT-BIH offers this study without the claim, for example "MIT-BIH carries beat-level annotations and has been used for heartbeat classification \cite{dechazal2004}." The de Chazal abstract read in the run supports the second form. Not resolved; it goes to the final message.
- **V38** (Minor, writing, lines 28, 57 and 78, introduced by the V25 change): the clause "a supervised ceiling, computed with patient-grouped (five-fold) cross-validation on the same records and representation" now stands verbatim in the abstract (line 28), in the protocol list of the Introduction (line 57) and in the paragraph on the closest benchmark (line 78). It is followed at line 57 by "A high ceiling with a low score then marks a failure of geometry, and a low ceiling marks missing information", which line 139 repeats almost word for word. The prose standard rules out a sentence shape repeated across sections. What must change: keep the full clause in the abstract, in the protocol list (line 57) and where the method is defined (line 139). At line 78, refer to that definition in place of restating it, for example "It also reads each clustering score against the supervised ceiling of Section~\ref{sec:clust}, so that a low score can be attributed to geometry or to missing information." Not resolved; it goes to the final message.

### Notes for the user (no text change has one right answer)

- **Fourth Wilcoxon contrast**: the code tests four pairs (`experiments/run_analyses.py:47-48`), and the fourth is the hand-crafted features against raw flattening. Its result is printed only, not saved, so under the Decisions the text cannot state it. Lines 209 and 231 describe the three contrasts they report, and they say so correctly. Whether to mention the fourth test is for the user.
- **README DOI**: `code/README.md:19` gives DOI 10.13026/x4td-x982 for PTB-XL 1.0.3. The draft writer reports that this DOI resolves to release 1.0.1. The manuscript cites the 1.0.3 record (10.13026/KFZX-AW45). The README lies outside the manuscript and is read only in this run.
- **Paragraph length**: line 106, the paragraph on the three MIT-BIH representations, holds 228 words by `wc -w`, slightly above the range of 120 to 200 words. It covers one idea, so it is not raised as an issue.

### Values read in the code (second pass)

Each value below stands at the place named. Nothing was run to read it.
- **Cohort draw (V31)**: `experiments/benchmark.py:42-55`.
  - `n = af.patient_id.nunique()`.
  - Each class is shuffled with `config.RANDOM_STATE`, SR first and then AF.
  - A patient already used is skipped, and each class stops at `n`.
  - The result is 1282 SR (the number of AF patients) and 1260 AF.
- **Release used (V12)**: `PN_DIR = "ptb-xl/1.0.3"` (`experiments/benchmark.py:25`).
- **Clustering and ceiling (V25)**: the clusterers are fitted on all conditioned records (`experiments/benchmark.py:139-142`). The ceiling is computed once per representation on the first conditioner of the sweep, which is power (`:135-136`; `core/config.py:64-65`). It uses `StratifiedGroupKFold(n_splits=5)` with patient groups (`core/cluster_eval.py:120-122`).
- **MIT-BIH beat representations (R2-2b, V13)**: in `experiments/mitbih_bench.py`.
  - RR context: previous, next, their ratio, previous over local mean, local mean over up to six intervals (`:58-59`, `:68-69`).
  - Per lead: R amplitude, energy, QRS width, maximum, minimum, skewness, kurtosis and the correlation with the global median beat (`:70-78`, `:88`).
  - The median is taken over the subsampled beats, since `subsample` precedes `features` (`:120`, `:128`) with 1500 per class (`:106`).
  - Raw beat flattened (`:84-86`).
  - Conv-AE on the beat window (`:93-97`), resampled to 2500 samples (`core/deep_repr.py:22-29`) and z-scored per lead (`core/deep_repr.py:40`).
- **NeuroKit2 (V19)**: `nk.ecg_clean`, `nk.ecg_peaks` and `nk.ecg_delineate(..., method="dwt")` (`core/features.py:133-139`).
- **Parity line (V27)**: `ax.plot([0.5, 1], [0.5, 1], ls="--", ..., label="parity")` (`experiments/figures.py:93`).
- **Wilcoxon pairs (V32)**: `experiments/run_analyses.py:47-48`.
- **Lead II (R2-1b)**: `RHYTHM_LEAD = "II"` (`core/config.py:32`).

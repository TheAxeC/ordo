# Response to reviewers, BSPC-D-26-11935 (provisional)

Manuscript: "Which representation clusters? A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure". Journal: Biomedical Signal Processing and Control.

Status of this letter: provisional. It describes the revised manuscript as it stands. Points marked "Pending" need measurements, runs, figure regeneration or author information that are not yet in the manuscript; where a value is missing from the manuscript, its place carries a red author placeholder, and this letter will be completed when they are filled. Requests that need new experiments, which the authors did not run for this revision, are stated as not carried out in this revision. The full record of changes is `admin/reviews/revision-round1/revision-log.md`.

Numbering in the revised manuscript. Section numbers are unchanged: 3.1 Data and cohorts, 3.2 Representations, 3.3 Clustering and evaluation, 3.4 Federated robustness, 4.1 to 4.6 Results, 5 Discussion, 6 Limitations, 7 Conclusion. Tables are renumbered: Table 1 is new (input of each representation, Section 3.2); the former Tables 1, 2 and 3 are now Tables 2, 3 and 4 (PTB-XL benchmark, MIT-BIH benchmark, federated k-means); Table 5 is new (cost, Section 5). Table 3 (MIT-BIH) now reports all five clusterers. A new Appendix A holds Table A.1 (implementation settings), Table A.2 (seed SD and 95% interval of every ten-seed cell) and Table A.3 (further external indices). Figure numbers are unchanged. Spelling is British throughout.

We thank the three reviewers for their reports. Our responses follow, numbered as in the reports, with each comment quoted as received.

---

## Reviewer 1

### R1.1

> **1. Confidence intervals would be preferable to SD**
>
> The reported seed standard deviations are extremely small (<less-than or equal to>0.001). Confidence intervals or bootstrap intervals would communicate uncertainty more clearly.

Response. We now report, for every ten-seed cell of Tables 2, 3 and 4 (36 cells), the seed standard deviation and a 95% interval, mean plus or minus t(0.975, 9) x SD / sqrt(10) with t = 2.262 (new Table A.2). The definition and its scope are in Section 3.3, paragraph "Seeds, uncertainty and tests". The text states exactly what these intervals cover: for the centralised cells, the seed changes only the initialisation of k-means, spectral clustering and the Gaussian mixture model, on a fixed cohort; for the federated cells it changes the site partition and the initialisation. Section 3.3, Section 4.1 and the Table A.2 caption state that they do not describe variation over samples of patients, and Section 6 states that they describe initialisation and partition variability on the cohorts used.

In checking this point we also corrected the statement of the seed SDs. They are not all at most 0.001: thirteen of the fifteen ten-seed PTB-XL cells have SD at most 0.0013, and the raw-flatten GMM and ECGFounder GMM cells have SD 0.0133 and 0.0116 (Table 2 caption, Section 4.1). For the federated study the intervals are informative: under non-IID partitions the hand-crafted features have SD 0.071 and interval [0.541, 0.642], and ECGFounder SD 0.369 and interval [0.348, 0.876] (Section 4.6). Ward agglomerative clustering and HDBSCAN are deterministic and are run once, which the captions of Tables 2 and 3 now state.

Pending: a patient-level bootstrap (resampling patients on PTB-XL and records on MIT-BIH and rerunning the pipeline per resample) has not been run. When it is, its percentile intervals will be added to Table A.2 or a new table and to Sections 4.1 and 4.6.

### R1.2

> **2. Add effect sizes alongside p-values**
>
> Wilcoxon p-values hit the minimum possible value with ten seeds (p=0.002). Reporting effect sizes such as Cliff's delta would improve interpretation.

Response. Section 3.3 now defines three effect sizes for the tested k-means contrasts: the difference of seed means (Delta), the matched-pairs rank-biserial correlation r, with its formula, and Cliff's delta, defined in words. Four contrasts were tested, and all four are now reported in Section 4.1 and the Table 2 caption: ECGFounder over hand-crafted features, hand-crafted features over HuBERT-ECG, hand-crafted features over raw flattening, and HuBERT-ECG over raw flattening. In each contrast all ten paired differences are positive, so r = 1, and every seed of the first representation exceeds every seed of the second, so Cliff's delta = 1. Section 3.3 now also states how the p-value is obtained. Under the null hypothesis of the signed-rank test each of the 2^10 sign assignments of the observed absolute differences is equally likely, with tied absolute differences given their mean rank. When all ten differences are positive, the observed assignment and its mirror image are the only two that reach the most extreme value of the statistic, so the exact two-sided p-value is 2/2^10 = 1/512, about 0.002, for each contrast, with or without ties. This is the smallest value the exact test can give with ten pairs. The p-value and both effect sizes are therefore at their extreme values, and the text says that the informative effect size is the ARI difference itself: 0.242 (ECGFounder over hand-crafted), 0.470 (hand-crafted over HuBERT-ECG), 0.644 (hand-crafted over raw flattening) and 0.174 (HuBERT-ECG over raw flattening).

### R1.3

> **3. Clarify HDBSCAN's handling of noise labels**
>
> Was noise treated as the following:
>
> an additional cluster,
> ignored observations,
> Reassigned to the nearest cluster?
>
> This affects ARI interpretation.

Response. Noise was treated as an additional cluster. Section 3.3 now states that the noise label is passed unchanged to the ARI, the adjusted mutual information (AMI), the normalised mutual information (NMI) and the Fowlkes-Mallows index, so all noise points together form one extra cluster in these indices, and that noise points are neither discarded nor reassigned. The same paragraph gives the HDBSCAN settings (minimum cluster size max(10, floor(n/50)), which is 50 on PTB-XL and 60 on MIT-BIH; other parameters at library defaults) and cites the method. The Metrics paragraph states that noise points count as misassigned in purity and are excluded from the silhouette and the largest-cluster fraction, the Table A.3 caption repeats the handling for each further index, and Table A.3 lists those indices for every HDBSCAN cell on both datasets. Section 4.1 reports that HDBSCAN labels every record as noise for raw flattening, the convolutional autoencoder and HuBERT-ECG, and that for the hand-crafted features and ECGFounder the noise fraction lies between 0.720 and 0.833 and between 0.595 and 0.774. Those two ranges are bounds derived from the stored purity and cluster sizes.

Pending: the exact noise fraction for the hand-crafted and ECGFounder cells was not stored and needs a rerun; it will replace the bounds.

### R1.4

> **4. Include computational costs**
>
> An additional table reporting:
>
> embedding time,
> inference memory,
> feature extraction time,
>
> would reinforce the deployment argument.

Response. A new Table 5 (Section 5) lists, for each PTB-XL representation, its dimensionality, whether it is trained, frozen or computed without training, the time per record (feature extraction for raw flattening and hand-crafted features; embedding, including resampling, for the autoencoder and the two foundation models) and the peak inference memory. The dimensionality and training columns are filled.

Pending: the time and memory columns, the hardware, batch size and numeric precision of the timing runs, and the sentences relating cost to the decision rule in Section 5 require measurements that have not yet been made. They are marked as placeholders in the manuscript and will be filled before resubmission.

### R1.5

> **5. Figure 2 could be expanded**
>
> The separability-vs-clusterability plot is compelling but contains only five points. Confidence intervals or multiple seeds per representation could make the figure more informative.

Response. The Figure 2 caption now states what each point is, the number of records, that the plotted conv-AE and hand-crafted values are single runs of the deterministic Ward agglomerative clustering, and that the seed SDs of the other three plotted values are at most 0.0133, with all SDs and intervals in Table A.2. The caption also describes the dashed reference line exactly and explains that it is a visual guide only, because accuracy and ARI have different chance levels.

Pending: regenerating Figure 2 with the three MIT-BIH representations as additional points, error bars and a chance-aligned reference line requires rerunning the figure script and is not yet done.

---

## Reviewer 2

### R2.1a

> a. Since ECG signals in the PTB-XL dataset are stored in WFDB format. However, it is unclear what data type was used as input to the model and whether the original data were converted prior to processing.

Response. A new paragraph "Signal input and preprocessing" in Section 3.1 states that PTB-XL (version 1.0.3) records are read with the `wfdb` Python package into 32-bit floating-point arrays of the physical signal values in the units of each record header, without unit conversion; that the main benchmark uses the 100 Hz records (1,000 samples per lead); that MIT-BIH records are read the same way at their native 360 Hz; which representations receive filtering (only the hand-crafted features, through the default NeuroKit2 cleaning step); and that every representation then passes through the feature conditioner. Resampling and normalisation per representation are in the new Table 1.

### R2.1b

> b. The author should provide a clear justification for using only Lead II for rhythm and morphology analysis. Explain why the other ECG leads were not utilized and discuss the implications of this choice.

Response. Section 3.1 now states that only the hand-crafted features use lead II; raw flattening, the convolutional autoencoder and both foundation models receive all twelve leads. The justification given is that the RR-interval features need only R-peak timing, which is common to all leads, and that AF detection from a single lead is an established task (Clifford et al., 2017, now cited). The implications are stated: the P-wave and QRS-complex features are read from lead II only, so lead-specific morphology in the other eleven leads is not used; the effect of choosing another lead was not evaluated; and the hand-crafted representation receives less input than the others, so the comparison does not favour it in input. Section 6 repeats the restriction.

### R2.2a

> a. There appears to be an inconsistency in the manuscript. Subsection 3.1 states that only Lead II is used for rhythm and morphology analysis, whereas the description of raw flattening indicates that all ECG leads are concatenated into one vector. Clarify this discrepancy and justify the use of different input representations in the methodology.

Response. The lead II statement in Section 3.1 applied to the hand-crafted features only, and the earlier wording did not make that clear. Section 3.1 now states the lead use of every representation, and the new Table 1 gives, for each representation and dataset, the leads, input array, sampling rate, normalisation, training status and output dimensionality. Section 3.2 explains why the inputs differ: raw flattening and the convolutional autoencoder reproduce the multi-lead input of the original pipeline, the foundation models receive 12-lead input of the length, sampling rate and layout used in their pretraining, and the hand-crafted features use one lead. Section 3.2 also states where the foundation-model input differs from the preprocessing of the models' authors: this study applies none of their filters and, for HuBERT-ECG, not their per-lead scaling to [-1, 1]. Section 6 repeats this. The text states that the comparison is between representations as they would be deployed, not under equal input.

### R2.2b

> b. The manuscript does not clearly describe the data type used in each representation. Specify the data type employed in all representations and explain the underlying principle for each representation.

Response. Section 3.2 now states that every input is a 32-bit floating-point array and every representation outputs a real-valued vector, and gives the principle of each representation: raw flattening (moving-average downsampling and concatenation, carrying amplitude and energy without temporal alignment across recordings); the convolutional autoencoder (minimisation of reconstruction error, which need not organise class structure); the hand-crafted features (clinical definitions of rhythm irregularity and beat morphology), now listed in full, all 16 PTB-XL and all 21 MIT-BIH features, with which are continuous and how missing values are handled; and the two foundation models (input format, pooling, embedding size, and pretraining: HuBERT-ECG self-supervised, ECGFounder trained on expert-annotated diagnostic labels), together with the preprocessing their authors use and how this study's input compares with it. Table 1 summarises the input and output of each.

### R2.3

> The description of the performance metrics is insufficient. Explain the physical meaning of each metric, provide its mathematical formulation, and its range.

Response. A new paragraph "Metrics" in Section 3.3 defines each metric with its meaning, formula and range: the adjusted Rand index (equation with contingency counts; expected value 0 under random labelling, maximum 1, can be negative), adjusted mutual information (formula; expected value 0, maximum 1), normalised mutual information (formula; range [0, 1], not chance-corrected), the Fowlkes-Mallows index (geometric mean of pair precision and pair recall; [0, 1]; cited), purity (formula; [0, 1]; equal to the majority-class proportion for a single cluster), the silhouette (formula; [-1, 1]; computed without labels) and the largest-cluster fraction ([1/K, 1] without noise). A paragraph "Supervised ceiling" defines the ceiling as the five-fold patient-grouped accuracy of a logistic-regression probe, with range [0, 1] and the majority baseline as its chance level. The handling of HDBSCAN noise in each metric is stated.

### R2.4

> Justify the comparative performance of the different feature representations. Explain why the ECG Foundation Cluster achieves the best performance, why the hand-crafted features remain competitive, why HuBERT-ECG exhibits relatively weak performance, and why the Raw and Conv-AE pipelines perform similarly to a majority-class assignment.

Response. A new paragraph in Section 4.2 gives one explanation per representation, each tied to the reported numbers. The hand-crafted features are competitive because SR and AF differ by definition in rhythm regularity and eight of the 16 features are computed from the detected R peaks (ceiling 0.942). Raw flattening matches the majority assignment because the flattened strips are not aligned in time across recordings, so Euclidean distance reflects beat position and amplitude rather than rhythm; its linear ceiling is 0.519 and its Ward solution places all records but one in one cluster. The convolutional autoencoder minimises reconstruction error, which rewards signal energy and waveform shape; it carries the label weakly (ceiling 0.678) and does not organise it into clusters. ECGFounder has the highest ceiling (0.983) and the four clusterers other than HDBSCAN recover its label structure (ARI 0.709 to 0.885); a plausible reason, stated as such, is that it was trained on expert diagnostic labels. For HuBERT-ECG the label is present (ceiling 0.899) but not along the directions that k-means and GMM partition; we state three hypotheses, marked as untested: its self-supervised objective does not use diagnostic labels; in this study it receives only the first 5 s of each record; and its input here is neither band-pass filtered nor scaled to [-1, 1] per lead, as its authors' preprocessing does. Section 4.1 points to this paragraph.

The three hypotheses were not tested in this revision; testing them needs new runs (for example, embedding the full 10 s strip, or applying the authors' filter and scaling), which the authors did not carry out for this revision.

### R2.5

> Explain why the HuBERT-ECG representation exhibits the sharpest clustering, with a reported ceiling of 0.899, while achieving a relatively low ARI of only 0.195. Discuss the reasons for this apparent discrepancy and clarify how these results should be interpreted.

Response. We agree that the original sentence was open to this reading and have rewritten it, but we respectfully note that the manuscript did not claim that HuBERT-ECG clusters sharply. The original sentence (Section 4.2) read "HuBERT-ECG is the sharpest case, with a ceiling of 0.899 but an ARI of only 0.195", in a paragraph about the gap between separability and clusterability; "sharpest case" referred to the size of that gap. HuBERT-ECG's clustering is weak: its best ARI is 0.195 (Table 2), against 0.885 for ECGFounder and 0.711 for the hand-crafted features.

The revised Section 4.2 says "HuBERT-ECG shows the largest gap between separability and clusterability: a linear probe reaches an accuracy of 0.899, yet the best clustering reaches an ARI of 0.195 (GMM)". It then explains how to interpret the two numbers. They are on different scales (accuracy has chance level 0.504 here, ARI has chance level 0), so they are compared ordinally. A high ceiling with a low ARI means that the label is present in the embedding and can be recovered when labels are available for training, while label-free clustering does not recover it. The reasons proposed for HuBERT-ECG are in the new paragraph described under R2.4.

---

## Reviewer 3

### R3.1

> **1.** The manuscript primarily benchmarks existing ECG representations using established clustering algorithms and evaluation metrics. The authors should clearly articulate the methodological novelty beyond benchmarking and explain how this work advances the current state-of-the-art relative to recent ECG foundation-model benchmark studies.

Response. We agree that the contribution needed to be stated more clearly, and we have rewritten it in the Introduction, Section 2 and Section 5. We partly disagree with the premise that the paper should offer novelty beyond benchmarking: the paper is a benchmark by design, and we have not added a new algorithm to it. Our reasons and the changes are as follows.

The contribution is an evaluation protocol for unsupervised ECG representations (Introduction, contribution list; Section 5). It combines chance-corrected external indices with majority and random baselines, a supervised ceiling per representation computed under the same patient grouping, so that a low clustering score can be attributed to geometry or to missing information, cluster-size checks, a sweep over feature conditioners, and two simulated deployment stressors (9:1 class imbalance and non-IID federation). The protocol produces results that a ranking alone does not. The silhouette score rewards a degenerate one-cluster solution (0.81 at ARI 0.000), which explains the misleading numbers of the pipeline this study re-examines. The choice of conditioner moves ECGFounder's mean ARI from 0.87 to 0.09. The ranking on balanced data reverses on one 9:1 class-imbalanced subsample (hand-crafted 0.232 against ECGFounder 0.060, one k-means run).

Relative to the closest foundation-model benchmark (Filice et al., 2026), Sections 1, 2 and 5 state what this study adds: a hand-crafted baseline and the MIT-BIH dataset, which that study does not include, and the application of the same controls to non-foundation and foundation representations alike. The manuscript states that it introduces no new representation, clustering algorithm or federated method, and it credits the separability-versus-clusterability phenomenon and the federated procedure to prior work.

### R3.2

> **2.** The study evaluates only binary SR-versus-AF clustering and a binary MIT-BIH morphology task. The conclusions would be considerably stronger if validated on additional clinically relevant multi-class arrhythmia datasets to demonstrate broader applicability.

Response. We have limited every conclusion to the two binary tasks evaluated. The abstract and Section 7 say "on these two binary tasks" or "for the two binary tasks evaluated here", the first paragraph of Section 4.1 says "On this task", Section 4.5 says "for these two tasks", Section 5 opens by stating that its observations come from two binary tasks, and Section 6 states that the study evaluates two binary tasks and that the results apply to these two tasks. The manuscript makes no statement about whether the ranking would hold on multi-class tasks.

A multi-class evaluation was not carried out in this revision. It needs new experiments, and the authors did not run new experiments for this revision.

### R3.3

> **3.** Although Wilcoxon tests are reported, effect sizes and confidence intervals are missing. Including these statistics would provide a more comprehensive assessment of the practical significance of the observed performance differences.

Response. Effect sizes and intervals are now reported; the changes are those described under R1.1 and R1.2. In short: every ten-seed cell of Tables 2, 3 and 4 has a seed SD and a 95% interval (Table A.2), with their scope stated; the four Wilcoxon contrasts report the exact p-value, Delta, the rank-biserial r and Cliff's delta (Section 4.1, Table 2 caption). The federated intervals changed one statement: under non-IID federation the intervals for ECGFounder and the hand-crafted features overlap, so Section 4.6 now says that they do not separate the two representations on mean ARI. The 9:1 imbalance result comes from one k-means run on one subsample, and the abstract, Section 1, Section 4.6 and Section 7 now describe it as a result on one 9:1 subsample, with Section 4.6 stating that the values are single-run values.

Pending: the patient-level bootstrap described under R1.1.

### R3.4

> **4.** Only HuBERT-ECG and ECGFounder are evaluated. Given the rapid development of ECG foundation models, the rationale for excluding other publicly available models should be discussed, together with the potential impact on the reported conclusions.

Response. A new paragraph in Section 5 states the properties the two models share (publicly released weights, use as frozen feature extractors, 12-lead input in the PTB-XL format) and how they differ (HuBERT-ECG self-supervised, ECGFounder trained on expert diagnostic labels). It states the impact of the restriction: every foundation-model statement concerns these two models only; the comparison between hand-crafted features and a foundation model is a comparison with ECGFounder; and a foundation model that clusters better than ECGFounder under imbalance or simulated federation would change the decision rule. It notes that other models, including some reported to cluster well, were not evaluated. Section 6 repeats the restriction.

Pending: the sentence giving the authors' reasons for selecting these two models is a placeholder in Section 5. Further foundation models were not evaluated in this revision, because that needs new runs, and the authors did not run new experiments for this revision.

### R3.5

> **5.** The federated experiments rely on simulated client partitions from a single dataset. Validation using real multi-institutional datasets or more realistic heterogeneous federated settings would substantially strengthen the deployment claims.

Response. We have reduced the deployment claims to what the simulation shows. The word "simulated" now appears wherever the federated study is mentioned (abstract, Sections 1, 3.4, 4.6, 5 and 7, Figure 4 caption), and the phrases "realistic site heterogeneity" and "privacy-preserving, multi-site phenotyping" have been removed. Section 3.4 now reports the simulation in full (ten sites drawn from the single PTB-XL cohort, Dirichlet concentration 0.3 per class for the non-IID partitions, 15 rounds of three local Lloyd iterations, weighted centroid averaging). Section 6 states that the federation is a simulation on one dataset, that it does not model differences in devices, acquisition protocols or populations between institutions, and that real multi-institution data were not evaluated. Section 6 now also states that the simulation initialises the global centroids from the pooled data and fits the feature conditioner on all records before partitioning, which a real federation could not do without sharing data between sites. The federated conclusion is now stated as Table 4 shows it: ECGFounder keeps the higher mean ARI (0.612 against 0.591), and the hand-crafted features keep a larger share of their centralised ARI (0.918 against 0.692) and vary less across partitions.

Validation on real multi-institution data, or on a more heterogeneous simulated federation, was not carried out in this revision. It needs new experiments, and the authors did not run new experiments for this revision. The manuscript states the federated results as results of the simulation described in Section 3.4.

### R3.6

> **6.** The manuscript emphasizes deployability but provides no comparison of computational cost, inference time, memory consumption, or embedding dimensionality. Such analysis is important for evaluating practical clinical deployment.

Response. The embedding dimensionality of every representation is now in Table 1 (input and output), Tables 2 and 3 (in parentheses) and the new cost Table 5. Table 5 also has columns for time per record and peak inference memory, as described under R1.4.

Pending: the time and memory measurements, as under R1.4.

### R3.7

> **7.** Several implementation choices, including clustering hyperparameter selection, convergence criteria, preprocessing settings, and foundation-model inference configurations, should be described in greater detail to facilitate full reproducibility.

Response. A new Table A.1 lists the settings of every step: each clusterer (with the statement that no setting was tuned and unlisted settings are library defaults), the four conditioners, the linear and random-forest probes, the autoencoder architecture and training (optimiser, learning rate, batch size, epochs, early-stopping criterion), the NeuroKit2 calls, the HuBERT-ECG and ECGFounder inference configuration (checkpoint, backbone, pooling, precision), the federation, the 9:1 subsample and the minimum software versions. Sections 3.1 to 3.4 now give the preprocessing, the HDBSCAN settings, the seeds and what they change, and the convergence settings of the federated procedure. Section 3.2 compares the foundation-model input with the preprocessing of each model's authors (filters, scaling, sampling rate, segment length and, for ECGFounder, the disabled batch normalisation of the authors' model definition). The Code and data availability statement gives the repository commit, the URLs of the pretrained weights and the URLs of the two models' code repositories from which that preprocessing was read.

Pending: the ECGFounder batch size, the Hugging Face revision of each checkpoint, the range of per-site sizes in the federated partitions, the exact software versions used, and a tagged release or archived DOI of the code are placeholders in Table A.1 and in the Code and data availability statement.

### R3.8

> **8.** Discussion should better distinguish empirical observations from general conclusions. Several conclusions are presented broadly despite evaluation on only two datasets and two foundation models. The discussion should more explicitly limit claims to the evaluated experimental settings.

Response. Section 5 now opens by separating the observations (the values in Tables 2 to 4, on two binary tasks, with five representations, two foundation models and a simulated federation) from the decision rule that follows from them, which is stated as a recommendation conditional on these settings. Claims were narrowed throughout. The headline is scoped to "these two binary tasks" in the abstract and the first highlight, to "the two binary tasks evaluated here" in Section 7, and to "this task" in the first paragraph of Section 4.1. A sentence calling raw and autoencoder pipelines "not viable" was replaced by the observed maxima (ARI at most 0.013 on PTB-XL and at most 0.127 on MIT-BIH, with the configurations tested). Statements about input formats were limited to what was tested: the decision rule in Section 5 no longer recommends the hand-crafted features for input that is not a 12-lead strip, and instead states that the 16 PTB-XL features are computed from lead II alone and can be computed wherever lead II is recorded, while their comparison with the foundation models on such input was not evaluated. The 9:1 imbalance result is described as a result on one subsample with one k-means run in the abstract, Section 1, Section 4.6 and Section 7. Results previously attributed to "a foundation embedding" now name ECGFounder; Section 4.1 keeps its statement that the two foundation models are not treated as one category. In checking this point we also corrected a statement about the federated results: the earlier text said that the hand-crafted features overtake ECGFounder under federation, which Table 4 does not show. The corrected statement is the one quoted under R3.5, and it is used consistently in the abstract, Introduction, Sections 4.6 and 5 and the Conclusion; the highlights no longer mention federation.

### R3.9

> Minor Comments
>
> **9.** Define all abbreviations at their first occurrence and maintain consistent terminology throughout the manuscript.

Response. Abbreviations are now defined at first use in the body, including SR, AF, ARI, AMI, NMI, RR, MIT-BIH, SCP-ECG, AFIB, AFLT, FFT, SDNN, RMSSD, pNN50, GMM, HDBSCAN, SD, FedAvg, IID and non-IID, and those used in tables and figures are defined in the captions (including the Figure 1 axis labels and the "acc" axis label of Figure 2). One name is now used per concept: "sites" for federated participants, "raw flattening" in prose and "raw-flatten" as a label, "beat-morphology features" on MIT-BIH, "Ward agglomerative", "conditioner", and "ECGFounder" in place of "foundation embedding" where only ECGFounder is meant. Spelling is British throughout.

Pending: some figure-internal labels (the abbreviated axis labels of Figure 1 and the word "clients" in the Figure 4 title) can be changed only by regenerating the figures; until then the captions explain them.

### R3.10

> **10.** Improve the readability of Figures 2<en dash>4 by increasing font sizes and enhancing contrast.

Response. Pending. This requires regenerating the figures from the figure script. The planned changes are larger fonts and figure sizes set to the final print width, a colour-blind-safe palette with a distinct marker shape per representation, and opaque or outlined markers in Figure 3, where two representations currently share a colour. The revised figures will be supplied with the final revision.

### R3.11

> **11.** Report sample sizes directly in figure captions for easier interpretation.

Response. The number of records or beats, and the class counts where relevant, are now in the captions of Figures 1 to 4 and Tables 2 to 4. The Figure 3 caption also states what a point is (one clustering run of one representation; 160 runs, of which 157 are drawn because three HDBSCAN runs have no silhouette). In checking this caption we corrected the position of the degenerate solutions from "top-left" to "bottom right", where the figure shows them. The 9:1 subsample size (1,282 SR and 142 AF records) is stated in Sections 3.3 and 4.6.

### R3.12

> **12.** Include confidence intervals or error bars in all performance figures where appropriate.

Response. The captions of Figures 2 and 4 now state which plotted values are single runs and point to Table A.2 for the seed SDs and 95% intervals of every ten-seed value; the Figure 4 caption states that the bars currently have no error bars.

Pending: adding error bars to Figures 2 and 4 requires regenerating them, together with the changes under R3.10.

### R3.13

> **13.** Standardize decimal precision across all tables.

Response. All ARI, index and ceiling values in Tables 2, 3, 4 and A.3 are given to three decimals. The retention column of Table 4 is now printed to three decimals from the unrounded means (0.692, 0.918, 0.611), and the raw-flatten entry, previously unexplained, is marked N/A with its reason in the caption. Values quoted in the text now match the table precision and name the clusterer. The seed SDs in Table A.2 are given to four decimals, because most are below 0.001 and would otherwise print as zero; the caption states this.

### R3.14

> **14.** Verify that all references follow the journal's formatting guidelines and ensure consistent citation style.

Response. All in-text citations use the numbered style of the journal template. Two existing references that were listed but not cited are now cited where they apply (the HDBSCAN method in Section 3.3, single-lead AF detection in Section 3.1), one reference was added for the Fowlkes-Mallows index, the PhysioNet dataset records of PTB-XL (version 1.0.3) and of the MIT-BIH Arrhythmia Database (version 1.0.0) are now cited next to the original publications, as PhysioNet requests, and the URLs of the pretrained model weights were moved into the Code and data availability statement.

Every bibliography entry was checked against its DOI record or publisher page and formatted for the journal's numbered style. Preprints now use one entry type with the server name and the DOI, so each identifier is printed once. The three PMLR proceedings papers now carry the volume, series and publisher, and the HDBSCAN paper its Lecture Notes in Computer Science volume. Two preprints have been replaced by their published versions: ECGFounder (now NEJM AI, 2025) and the self-supervised clustering study of Weng et al. (now Proceedings of ICML 2025, PMLR volume 267). The author names of the wavelet-tensor clustering reference (He et al., 2019) were corrected. HuBERT-ECG (medRxiv) and the benchmark of Filice et al. (arXiv, 2026) have no published version that we could find and remain cited as preprints.

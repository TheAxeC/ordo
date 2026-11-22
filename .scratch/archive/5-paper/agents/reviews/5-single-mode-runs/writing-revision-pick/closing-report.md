The revision of `manuscript/main.tex` is finished. Its last step, the `/writing` review of the revised text, ran through four agents, all served as claude-opus-5-5: a sentence agent, a section agent, a whole-draft agent and a checking agent. The checking agent's report follows in full. It is also saved in `paper-runs/revision-2026-11-15/final.md`.

# Review report: main.tex

## Fix first

**Prose standard, D. Structure: No synonym cycling**

1. One concept is called by several names. The rule asks for one term per concept, repeated.
   - main.tex:84: "includes a cluster-separability analysis pooled over 12-lead datasets". The unsupervised property is called "clusterability" at main.tex:79 and 267, and "cluster-separability" here and at main.tex:116 and 403. Meanwhile "separable" and "separability" name the supervised ceiling, as at main.tex:267: "The conv-AE was more separable (0.678)".
     Also breaks references/rules.md, Precision / Term defined at first use: "cluster-separability" is not defined here. It is first glossed, as "(ARI)", at main.tex:116.
   - main.tex:138: "The raw arm therefore received more input than the hand-crafted arm". The same representation is also called "raw flattening" (main.tex:106, 132, 257), "raw-flatten" (main.tex:221, 257), "the raw representation" (main.tex:259, 263) and "the raw vector" (main.tex:138).
   - main.tex:263: "The raw and conv-AE representations both sat at a majority-class assignment under all five clusterers". The same outcome is also written as:
     - "clustered at chance" (main.tex:267)
     - "stayed at chance" (main.tex:331)
     - "sit at chance" (main.tex:443)
     - "chance-level clustering" (main.tex:138, 267)
     - "indistinguishable from predicting the majority class" (main.tex:401)

     The draft keeps a majority baseline and a random baseline as two separate references (main.tex:156 and the caption of Table 2), so these names point the reader at two different baselines.
   - main.tex:416: "The foundation-model axis is bounded to two models by selection rather than by survey." The same set is also called "the foundation arm" (main.tex:421), "Foundation embeddings" (main.tex:135) and "foundation-model embeddings" (main.tex:106). The hand-crafted representation is both the "hand-crafted axis" (main.tex:406) and the "hand-crafted arm" (main.tex:138). "Axis" also names the "dominant axes of variation" (main.tex:80, 267).

**references/rules.md, Precision / Term defined at first use**

2. Technical terms appear without a definition at first use. The rule asks that a technical term be defined where it first appears.
   - main.tex:81: "supervised probe recovers the label while an unsupervised partition does not". "Probe" first appears here, and again in "linear-probe accuracy" on the same line. It is defined only at main.tex:169: "a linear probe (balanced logistic regression)".
   - main.tex:134: "RR-interval statistics and irregularity, P-wave presence and amplitude, QRS width and amplitude, and beat-template consistency". "Beat-template consistency" is not defined anywhere in the draft.
     Also breaks references/registers.md, Engineering and CS / What the reader looks for: the Methods should let a reader reproduce the work. The passage names feature groups and six RR statistics, but it does not name each of the 16 features.
   - main.tex:138: "a 21-dimensional beat-morphology and RR-context feature set". "RR-context" is not defined.
     Also breaks references/registers.md, Engineering and CS / What the reader looks for: none of the 21 beat-level features is named anywhere in the draft.

**references/rules.md, Precision / Pronoun with a clear antecedent**

3. The rule asks that a pronoun such as "this" or "it" have a clear antecedent.
   - main.tex:83: "this axis under proper chance-corrected metrics". The only axes named before it are the "dominant axes of variation" at main.tex:80. The intended meaning is the distinction between separability and clusterability.
   - main.tex:263: "The conv-AE ceiling of 0.678 is what a bottleneck optimised to reconstruct signal energy retains of a class it was never asked about, and it recovered 0.008." The second "it" can refer to the bottleneck, the class or the conv-AE.

**references/rules.md, Objectivity / Claims rest on evidence**

4. The rule asks that a claim rest on evidence, not on opinion.
   - main.tex:62: "The same ordering of the representations held on a MIT-BIH beat-morphology task." The evidence does not support "the same ordering":
     - Neither foundation model was applied to MIT-BIH (main.tex:138), so the MIT-BIH table holds three of the five representations.
     - On PTB-XL the raw and conv-AE intervals overlap (caption of Table 2), so those two were not separated. On MIT-BIH the conv-AE (0.127) ranks above the raw beat window (0.049).
   - main.tex:133: "This is a properly specified reconstruction model, in contrast to the original collapsed dense autoencoder." "Properly specified" and "collapsed" are asserted without the evidence for either.
   - main.tex:307: "The ordering of the representations replicated on a different dataset and a different task type (Table~\ref{tab:mitbih})." This is the same overclaim as at main.tex:62, on the same evidence.

**references/rules.md, Objectivity / Limitations and alternative interpretations**

5. Two results are explained without acknowledging an alternative interpretation. The rule asks that the text acknowledge alternative interpretations of its results.
   - main.tex:263: "a likely cause of this linear failure is that no fixed offset falls on the same part of the cardiac cycle in two records". The near-majority linear ceiling of the 1992-dimensional raw vector is explained by misalignment only. The draft does not mention the alternative that the dimensionality, relative to the number of training records, explains why the probe failed. Dimensionality is raised at main.tex:138, but only for Euclidean clustering.
   - main.tex:303: "Robust scaling leaves heavy arrhythmic tails unbounded, so a few outliers may dominate Euclidean distance and collapse the partition." This one untested cause is offered for both drops, including ECGFounder's fall from 0.866 to 0.093. ECGFounder's embedding coordinates are not arrhythmic quantities.
     Also breaks references/rules.md, Paragraphs / Claim with evidence or citation: the claim is followed by no data and no citation.

6. main.tex:401: "The raw and conv-AE representations, including the original project's design, are not viable for label-free arrhythmia structure on these tasks." The conclusion on the conv-AE rests on one architecture with one 32-unit bottleneck (main.tex:133). Neither the Discussion nor the Limitations says that only one autoencoder configuration was tested. The rule asks that the text acknowledge the limitations of the study.

**references/rules.md, Hedging / Hedge where a claim is uncertain**

7. Generalizations from a limited sample are stated without a hedge. The rule asks that such a generalization be hedged.
   - main.tex:90: "Internal validity indices, which score a partition from the data alone without labels, reward the degenerate one-cluster solution." The silhouette is the only internal index the draft measures.
   - main.tex:274: "No single direction estimated from other patients separates the classes in it, and whatever the non-linear probe recovers from it is not of that form." Only one direction was tested: the fitted linear discriminant.
   - main.tex:285: "Internal indices misled here in a specific, reproducible way." The evidence that follows covers the silhouette only.
   - main.tex:399: "The 16 hand-crafted features are the better choice if the data are imbalanced or siloed across sites". The evidence is one 9:1 ratio and one simulated Dirichlet partitioning. At main.tex:331 the draft itself calls the reversal "a result for that setting".
   - main.tex:443: "Under class imbalance 16 interpretable hand-crafted features overtake it." The claim is stated in general form from one tested ratio.

**references/rules.md, Paragraphs / Claim with evidence or citation**

8. Claims are made without the data, citation or example that supports them, which the rule asks for.
   - main.tex:76: "Its report gave a high cluster purity, the share of the majority class inside the clusters, and a silhouette score near 0.89, an index of cluster compactness computed without labels." The master's project and the numbers it reported are not cited.
   - main.tex:103: "Reconstruction autoencoders are trained to reproduce the signal, an objective that rewards signal energy and does not ask the bottleneck to separate classes, so such a bottleneck may encode a class without arranging it into clusters." No citation or data follows.
   - main.tex:134: "Lead II is the standard rhythm lead, the one on which RR regularity and P-wave presence are read." This claim about clinical convention has no citation. The citation in the next sentence is about single-lead AF detection.
   - main.tex:138: "The twelve-lead input also made the raw vector 1992-dimensional, however, and that dimensionality may itself bear on Euclidean clustering." No citation or data follows.
   - main.tex:331: "possibly in part because a 10\% minority cluster is hard to isolate with a partitional method." No citation or data follows.
   - main.tex:437: "Flutter need not show the irregular rhythm on which the reading of Section~\ref{sec:intro} rests". This clinical claim has no citation.

**references/rules.md, Reader's path / Clarity test**

9. These paragraphs repeat content stated elsewhere in the draft. The rule asks that a paragraph whose removal loses nothing be deleted.
   - main.tex:116: "The ECG foundation-model benchmark of \cite{lookingbeyond2026} reported the cluster-separability (ARI) of foundation-model embeddings pooled over 12-lead datasets". The paragraph's content is already given elsewhere:
     - the benchmark and its omission of hand-crafted features and MIT-BIH at main.tex:84
     - the finding that some models cluster by label and others by dataset at main.tex:261 and 433
     - the supervised ceiling at main.tex:89
   - main.tex:267: "The supervised ceilings (last column of Table~\ref{tab:main} and Fig.~\ref{fig:sep}) exposed a gap between separability and clusterability." The paragraph repeats the figures and readings of main.tex:261 to 263:
     - raw 0.519 against 0.504
     - conv-AE 0.678 against 0.008, with the class held "without arranging it into clusters"
     - HuBERT-ECG 0.899 against 0.195
     - ECGFounder and the hand-crafted features high on both

     It also repeats the citation of main.tex:81.
   - main.tex:414: "The components themselves are existing tools: the separability-versus-clusterability phenomenon is known \cite{sslclustering2025}, and the centroid aggregation follows the weighted averaging of FedAvg \cite{fedavg2017}." This repeats main.tex:95 and main.tex:205.
     Also breaks Manuscript prose standard, Rules replaced, Section D, Paragraphs: the paragraph is one sentence, far outside about 120 to 200 words.

**references/registers.md, Engineering and CS / What the reader looks for**

10. Methods details needed to reproduce the work are missing. The rule asks that a methods section give the reader reproducibility.
    - main.tex:133: "a 1-D convolutional autoencoder with a 32-unit bottleneck, trained to convergence with a validation split, on all twelve leads resampled to 12 by 2500 and z-scored per lead." The encoder and decoder are described only by the bottleneck size. Layers, channels and kernels are not stated here or anywhere else in the Methods.
    - main.tex:147: "Spectral clustering, with a nearest-neighbour affinity and $k$-means label assignment." The number of neighbours for the affinity is not stated. The library-defaults sentence at main.tex:152 covers only tolerances and iteration caps.

## Style

**Prose standard, 0. Hard rules: Plain prose only**

11. The rule bans punchy one-line summaries and asks that the text state the fact and stop.
    - main.tex:76: "That conclusion is correct, and we make it precise."
    - main.tex:401: "The lead constraint is concrete."
      Also breaks references/rules.md, Paragraphs / First sentence states the point: the first sentence should state the paragraph's main point, and this one does not.
      Also breaks Manuscript prose standard, Rules replaced, Section D, Paragraphs: the paragraph covers two ideas, the lead constraint and the claim that "The raw and conv-AE representations, including the original project's design, are not viable for label-free arrhythmia structure on these tasks."

**Prose standard, 0. Hard rules: No repeated construction**

12. A sentence of the form "[subject] thus [consequence]" follows a run of numbers in several sections. The rule asks that a sentence shape that recurs across sections be rewritten.
    - main.tex:259: "HuBERT-ECG and raw flattening thus stayed low at every cluster count"
    - main.tex:261: "The two foundation models thus did not behave as one category"
    - main.tex:263: "A non-linear readout thus recovered label information that the linear probe missed"
    - main.tex:307: "A supervised probe thus found label information in the raw beat window that its clustering did not recover."
    - main.tex:331: "Its partition thus agreed with the classes on record pairs about as well as that of ECGFounder"
    - main.tex:433: "The MIT-BIH results thus compare the hand-crafted, conv-AE and raw representations only."

**Prose standard, D. Structure: No rule of three**

13. main.tex:74: "which patients group together, what subtypes exist, and whether structure can be found where labels are expensive or unavailable". The first two items ask the same question: which patients form groups. The rule asks that a list not be padded to three items.

**Prose standard, D. Structure: Three or more list-shaped items in paragraph form become a list**

14. Series of three or more items are run into a sentence. The rule asks that they become a list introduced with a colon.
    - main.tex:134: "The RR statistics were SDNN (the standard deviation of the RR intervals), RMSSD (the root mean square of successive RR differences), pNN50 (the proportion of successive RR differences above \mbox{50\,ms}), the coefficient of variation, RR entropy and mean heart rate."
    - main.tex:167: "The first five are dimensionless indices of agreement between the true partition and the recovered one, purity is the majority-class share inside the clusters, the silhouette is a dimensionless index of cluster compactness computed without labels, and the largest-cluster fraction is a proportion of the cohort."
      Also breaks Prose standard, E. Sentence shapes, Sentence length: the rule asks for sentences under roughly 20 words unless the mechanism needs more, and this sentence chains four statements that do not depend on each other.
    - main.tex:211: "ECGFounder clustered best (ARI up to 0.885 with $k$-means), the hand-crafted features were competitive (0.711 with agglomerative clustering), HuBERT-ECG was weak (0.195), and the raw and conv-AE representations were indistinguishable from a majority-class assignment (ARI $\approx 0$)."
    - main.tex:272: "the mean ARI rose from 0.160 to 0.549 for HuBERT-ECG, from 0.003 to 0.121 for the conv-AE, from 0.646 to 0.758 for the hand-crafted features and from 0.893 to 0.923 for ECGFounder."
      Also breaks references/rules.md, Paragraphs / Evidence followed by what it means: the rule asks that evidence be followed, in the same paragraph, by an interpretation that connects it to the paragraph's claim. The paragraph ends on "The largest difference is 0.013, on HuBERT-ECG." without that interpretation. It comes in the next paragraph, at main.tex:274.

**Manuscript prose standard, Rules replaced: Section D, Paragraphs**

15. Paragraphs cover two ideas. The rule asks that a paragraph cover one idea and that a paragraph covering two be split.
    - main.tex:78: "A representation can carry information about a label and still fail to cluster by it." The paragraph covers the difference between separability and clusterability. It then covers what the closest benchmark leaves out, from main.tex:84: "It adds no hand-crafted features, and its datasets do not include the MIT-BIH database."
    - main.tex:99: "Hand-crafted features built from RR-interval irregularity and beat morphology encode the defining signatures of common arrhythmias". This paragraph has 13 sentences and 228 words. It covers a survey of prior representations, then this study's own grouping of four families, which starts at main.tex:106 with "This study compares four representation families".
    - main.tex:138: "The two lead sets of the PTB-XL arms answer to different constraints." The paragraph opens on the MIT-BIH representation set. From this sentence on it covers the lead sets of the PTB-XL arms.

16. Paragraphs are far outside the expected length. The rule asks for paragraphs of about 120 to 200 words, and a paragraph far outside that length is split or joined with its neighbour.
    - main.tex:95: "We propose no new method, and we credit the separability-versus-clusterability phenomenon to prior work." The paragraph has two sentences.
    - main.tex:152: "Tolerances and iteration caps were the library defaults, and no early stopping was imposed on the clusterers." The paragraph has two sentences.
    - main.tex:167: "None of the eight metrics carries a physical unit." The paragraph has two sentences.

**Prose standard, E. Sentence shapes: Restating closes**

17. Paragraphs end on a sentence that says the paragraph again in shorter words. The rule asks that such a sentence be cut.
    - main.tex:263: "The raw representation therefore lacks linearly recoverable label information, while the conv-AE holds label information without arranging it into clusters, and changing the clustering algorithm addresses neither."
    - main.tex:307: "The same pattern appeared for rhythm on PTB-XL and for morphology on MIT-BIH, which supports the representation-level reading of the PTB-XL results." The paragraph opens with "The ordering of the representations replicated on a different dataset and a different task type".
    - main.tex:399: "Choosing the hand-crafted features for their behaviour under imbalance or federation therefore costs neither compute nor interpretability." The sentence before it already says this.

**Prose standard, E. Sentence shapes: Sentence length**

18. Sentences run well past 20 words without the mechanism needing it. The rule asks for sentences under roughly 20 words unless the mechanism needs more.
    - main.tex:110: "External, chance-corrected indices, the adjusted Rand index \cite{hubertarabie1985} and adjusted mutual information \cite{vinh2010}, \rev{are zero for a one-cluster solution, since its Rand index equals its expectation and its mutual information with the classes is zero,} and are the appropriate headline metrics." This is 41 words. An independent claim, that these are the right headline metrics, is attached after the reason clause.
    - main.tex:222: "Seed variation is the smaller of the two quantities: across the ten seeds the $k$-means solutions move by less than 0.002 in ARI and are identical for the hand-crafted and HuBERT-ECG matrices, the Gaussian mixture is the one seed-sensitive clusterer (seed standard deviation 0.013 on raw-flatten and 0.012 on ECGFounder), and the agglomerative and HDBSCAN columns have no seed interval." This is 60 words. It chains statements about three groups of clusterers, and the last statement does not bear on the opening claim.
    - main.tex:417: "HuBERT-ECG and ECGFounder both publish weights that load into a frozen feature extractor without fine-tuning, which is what a benchmark of frozen embeddings requires, and they differ in pretraining objective and architecture, a self-supervised transformer \cite{hubertecg2024} against a convolutional model pretrained on more than ten million recordings \cite{ecgfounder2024}." This is 48 words, carrying two reasons that do not depend on each other.

**references/rules.md, Concision / One idea per sentence**

19. main.tex:205: "In each round the server replaced each centroid by the mean of the site centroids, weighted by the number of records each site assigned to it, and the centroids were initialised globally from two randomly drawn records." The aggregation rule and the initialisation are separate steps, and the initialisation is placed inside "In each round". The rule asks that a sentence carry one idea, or clearly connected ideas.

**references/rules.md, Formality / No colloquial words**

20. main.tex:195: "This treatment is why HDBSCAN sat at the bottom for every representation." "Sat at the bottom" is colloquial. The rule asks for formal, academic vocabulary.

**references/rules.md, Paragraphs / First sentence states the point**

21. Opening sentences do not state the paragraph's main point, which the rule asks for.
    - main.tex:331: "The two stressors changed the comparison in different ways." The paragraph reports the class-imbalance result. Federation is the subject of the next paragraph.
    - main.tex:369: "Table~\ref{tab:cost} gives the cost of computing each representation, which bears on deployment alongside the ARI." The sentence points to the table and does not state the cost comparison the paragraph makes.

**references/rules.md, Common style errors / Vague phrase**

22. Vague phrases stand where a specific claim belongs. The rule asks that a vague phrase be replaced with the specific claim.
    - main.tex:62: "Under heavy class imbalance the hand-crafted features overtook ECGFounder." The setting tested is the single 9:1 SR:AF ratio.
    - main.tex:81: "can differ notably in clustering quality"
    - main.tex:90: "changes the result by a wide margin"
    - main.tex:91: "heavy class imbalance, and federation across sites that differ sharply in arrhythmia prevalence"
    - main.tex:138: "The versions used take a 12-lead strip of several seconds". The input lengths are given elsewhere: 5 s for HuBERT-ECG and 10 s for ECGFounder.
    - main.tex:211: "Spectral clustering fell on some representations, such as HuBERT-ECG"
    - main.tex:399: "On the PTB-XL cohort they come within reach of ECGFounder on balanced data". The values are 0.711 against 0.885.
    - main.tex:439: "the choice of scaling changed the centralized results by a wide margin"

**references/rules.md, Common style errors / Tense per section**

23. Sentences are in the present tense where their section reports in the past. The rule asks that Methodology and Results report in the past tense.
    - main.tex:125: "The second task therefore tests whether the ordering of the representations depends on the kind of class difference." (Methodology)
    - main.tex:135: "This arm asks whether a feature space fixed by large-scale pretraining places the rhythm classes in separate regions." (Methodology)
    - main.tex:171: "we swept four feature-scaling methods (Yeo-Johnson power, standard, quantile, robust) and report power scaling as the default unless stated otherwise." (Methodology)
    - main.tex:205: "We report the global ARI relative to centralized clustering of the same representation." (Methodology)
    - main.tex:333: "This study takes the worst site draw as its deployment criterion, because a deployment meets a single site partition, and the mean over ten draws does not show how low that partition can fall." (Results)
      Also breaks references/registers.md, Engineering and CS / Voice: the authors' decisions take "we", and the authors never refer to themselves in the third person. Here the decision is assigned to "This study".

**references/registers.md, Engineering and CS / Voice**

24. The authors' decisions, contributions and results are written in the passive or assigned to "this study". The rule asks that they take "we", and that the authors never refer to themselves in the third person.
    - main.tex:89: "The ordering is shown stable across the assumed number of clusters." This result is in the passive.
    - main.tex:106: "A tensor arm is left to future work." This decision is in the passive.
    - main.tex:123: "The lead set was chosen per representation and is stated with each representation below." This decision is in the passive.
    - main.tex:267: "This study reads the gap of the weaker embeddings as one of geometry". The interpretation is assigned to "This study".
    - main.tex:433: "Others were not included, among them ECG-FM". This decision is in the passive.

Tokens: sentence agent 98,538, section agent 85,043, whole-draft agent 77,376, checking agent 114,760; sum 375,717.

## Next step

Reply with one line naming the findings to apply: `all`, `all but 3, 7`, `2, 5` or `none`. That starts the draft writer on those findings, then the compile runs again.

You can instead ask for an autonomous writer pass over the findings.

## Run folder

`paper-runs/revision-2026-11-15/` holds:
- `config.md`, `items.md`, `intended-claims.md`, `citation-report.md`, `checks.md`, `compile-1-overfull.txt` and `final.md`
- `patches/`: patches 01, 07 and 11 for main.tex and 04 and 08 for refs.bib, each with its block manifest, patch, patched file and apply report

The temporary folder used for fetched texts and the compile has been removed.

## Open issues

**Facts only you can supply**
- **W20, beat-template consistency:** the manuscript does not define it, and the definition was not invented. Finding 2 above reports the same gap.
- **W23, the clusterer behind the imbalance results:** the manuscript does not say which clusterer produced them. The imbalance claim is worded without naming one.
- **ORCIDs:** still [GAP] for both authors.
- **AI use:** the categories, tools and versions you marked uncertain are recorded as uncertain. Only this run's own use of claude-opus-5-5 is recorded as known.

**Minor items from reading 2, not resolved**
- **V29:** on MIT-BIH the raw beat window reaches a supervised ceiling of 0.741, which does not fit the PTB-XL reading that the raw representation lacks label information (main.tex:307).
- **V30:** the closest benchmark is described twice, at main.tex:84 and 116. Finding 9 above reports the same repetition.
- **V31:** the flutter rule is stated in the Methods at main.tex:123 and again in the Limitations at main.tex:437.

**Outside what this run was allowed to change**
- `manuscript/highlights.txt` was not changed. It repeats the phrasing that items W18, W31 and W34 flagged in the manuscript.
- The titles drawn inside the figures (W15, W27, W29) need a figure change, which was not allowed.
- W20 (the passage at main.tex:106) and W22 need new citations, which were not allowed.
- W22 (at main.tex:470) and W48 need numbers from saved results, which were not allowed. For the same reason, V1 and V4 keep "several" rather than "four".

**Citation checks**
- Not checked against their full text: C6 to C11 (hrvstandards1996, dechazal2004, hubertarabie1985, vinh2010, rousseeuw1987, hdbscan2013).
- Venue fields not confirmed: C12 to C15 (clocs2021, threekg2021, sklearn2011, fedavg2017).
- Citation flags C28 to C32 are still open, and claims C33 to C60 are not on the intended-claims list.
- Failed lookups, marked only, because DOI checking is set to mark-only:
  - hrvstandards1996 and physionet2000 return 403 with DOI_MISMATCH. Each DOI is registered to the right work, but Crossref's title field holds only the short title.
  - hubertecg2024 returns 403.
  - vinh2010 has no registered identifier.

No anonymous copy was made, because the venue's blind-review model is not stated.
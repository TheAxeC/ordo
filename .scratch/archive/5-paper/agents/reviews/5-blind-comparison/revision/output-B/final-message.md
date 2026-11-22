# The revision of BSPC-D-26-11935 is finished

The revised files are `manuscript/main.tex`, `manuscript/refs.bib` and `manuscript/highlights.txt`. All changes were made by patches applied by script.

**Checks on the result:**
- **Compile:** the last compile (pdfLaTeX, `latexmk -pdf`) exits 0 and gives 28 pages. It has no overfull line and no undefined reference or citation (check-log.md, compile 4).
- **Citation keys:** `lookup cite-keys` prints nothing, so every cited key has an entry and every entry is cited.
- **File hashes:** the sha256 of main.tex is fce463fa<horizontal ellipsis>, which is the `output_sha256` of patch 18.

**What the run did not do:**
- Nothing is committed: `git status` shows the three manuscript files modified and `run/` untracked.
- The response letter is not written. That is separate work.
- No anonymous copy is written, because no blind-review model is stated for the venue.

**Correction to what I told you at intake:** the repository does hold saved results, in `code/results/*.csv`. The run read them as text and computed nothing from them.

## Run folder

`run/` holds:
- `settings.md`: the parameters and every decision of the run.
- `issues.md`: the 26 referee items, issues V1 to V38, and readings 1 and 2.
- `review.md`, `refs.bib`, `intended-claims.md`, `draft-report.md`, `citation-report.md`.
- `check-log.md`: every check and the four compiles.
- `compile-1-overfull.txt`, `compile-3-overfull.txt`.
- `final.md`: this message.
- `patches/`: patches 01, 02, 03, 04, 06, 09, 10, 14, 15 and 18, each with its manifest, patch file, patched file and apply report (40 files).

## The prose review review

The review ran through the prose review's four agents (sentence, section, whole-draft and checking), all served `claude-opus-5-5`. It differed from the procedure in two ways, both recorded in `settings.md`:
- Each agent read its prompt from one file built by shell commands, not from a pasted prompt.
- The checking agent's file carried the rule blocks of all three finding agents, not only the rules the findings name.

The checking agent's report follows, whole.

## Fix first

### Prose standard: 0. Hard rules / No repeated construction

1. main.tex:28, 57, 78, 139. The sentences about the supervised ceiling recur across the abstract, the Introduction, Related work and Methods:
   - main.tex:28: "computed with patient-grouped cross-validation on the same records and representation"
   - main.tex:57: "computed with patient-grouped five-fold cross-validation on the same records and representation. A high ceiling with a low score then marks a failure of geometry, and a low ceiling marks missing information."
   - main.tex:78: "computed with patient-grouped five-fold cross-validation on the same records and representation. A low clustering score can then be attributed to geometry or to missing information."
   - main.tex:139: "A high ceiling with a low ARI then marks a failure of geometry, and a low ceiling marks missing information."

   The rule asks that a sentence shape that recurs across sections be rewritten.
   - Also references/rules.md, Precision / Term defined at first use: "failure of geometry" at main.tex:57 is not defined there or anywhere later.
   - Also references/rules.md, Hedging / Hedge where a claim is uncertain: at main.tex:57 and 139 this interpretation is stated as fact, although the draft's own results allow other explanations. The conditioner alone moves ECGFounder's mean ARI from 0.87 to 0.09 (main.tex:270). A random forest reaches 0.71 on raw flattening, whose linear ceiling is 0.519 (main.tex:239).

2. main.tex:28, 328, 342. The same scope sentence ends the abstract, opens the Discussion and ends the Conclusion:
   - main.tex:28: "These findings hold for two binary tasks, five clustering algorithms, two named foundation models and a simulated federation."
   - main.tex:328: "The practical reading holds for the settings tested: two binary tasks, five clusterers, two named foundation models and a simulated federation."
   - main.tex:342: "These conclusions hold for two binary tasks, two named foundation models and a simulated federation."

   The rule asks that the recurring shape be rewritten.
   - Also Prose standard, E. Sentence shapes / Cold opens: at main.tex:328 the sentence opens the Discussion, and "The practical reading" has no antecedent.

3. main.tex:53, 78. The gap and the claim to fill it are written twice:
   - main.tex:53: "Their benchmark includes no hand-crafted features and does not use the MIT-BIH database. <horizontal ellipsis> This study adds both."
   - main.tex:78: "It includes no hand-crafted baseline and does not use MIT-BIH. This study adds both."

   The rule asks that the recurring shape be rewritten.

4. main.tex:62, 199, 235, 332, 336. The statements of contribution and scope at main.tex:62 recur:
   - main.tex:62: "We propose no new algorithm, we scope every foundation-model statement to the two models tested, and we credit the separability-versus-clusterability effect to prior work." and "This protocol adds a label-free reading against a hand-crafted baseline."
   - main.tex:199: "We do not propose a new federated method."
   - main.tex:235: "We therefore name each model and do not generalise to foundation models as a class."
   - main.tex:332: "We propose no new algorithm.", "The gap between linear-probe accuracy and clustering quality has been reported for self-supervised image models", "The protocol here adds a label-free reading against a hand-crafted baseline." and "Every foundation-model statement here holds for HuBERT-ECG and ECGFounder."
   - main.tex:336: "which is why we name the two we test"

   The rule asks that the recurring shape be rewritten.
   - Also references/rules.md, Paragraphs / First sentence states the point: at main.tex:332 the first sentence, "We propose no new algorithm.", says what the study does not do. The paragraph's point is that the contribution is the evaluation protocol.

5. main.tex:104, 235, 241, 243, 332. The report of Filice et al. that some embeddings are organised by label and others by dataset is restated in the same "reported / consistent with the report" shape:
   - main.tex:104: "which reports ECGFounder's embedding as organised by clinical label and HuBERT-ECG's as organised by dataset"
   - main.tex:235: "This matches the report of Filice et al."
   - main.tex:241: "Filice et al. report its embedding as aligned with the clinical label"
   - main.tex:243: "consistent with the report that HuBERT-ECG's embedding is organised by dataset"
   - main.tex:332: "a model reported to cluster by label"

   The rule asks that the recurring shape be rewritten.

6. main.tex:106, 282, 328, 338. The reason the foundation models were left out of the MIT-BIH task is stated four times:
   - main.tex:106: "The foundation models were not applied to the two-lead beats, because their input is a 12-lead strip."
   - main.tex:282 (Table 5 caption): "The foundation models were not applied to the two-lead beats."
   - main.tex:328: "The foundation models were not applied to the two-lead MIT-BIH beats, because their input is a 12-lead strip, so the study makes no comparison on other lead sets."
   - main.tex:338: "The MIT-BIH arm omits the foundation models because their input is a 12-lead strip."

   The rule asks that the recurring shape be rewritten.
   - Also references/registers.md, Engineering and CS / Voice: at main.tex:106 and 328, "were not applied" is the authors' decision, and the rule asks that it take "we".

7. main.tex:141, 209, 233. The paragraph at main.tex:233 repeats the caption of Table 4 (main.tex:209) item by item: the seed standard deviations 0.000 and 0.001, the Wilcoxon contrasts, the floor of p = 0.002, the effect sizes 0.242, 0.470 and 0.174, and "the conv-AE was not tested". Its sentence "this spread measures the stability of the clustering step on a fixed cohort" (main.tex:233) repeats main.tex:141, "The seed spread therefore measures the stability of the clustering step on a fixed cohort". The rule asks that the recurring shape be rewritten.
   - Also references/registers.md, Engineering and CS / Voice: "The conv-AE was not tested." (main.tex:209) is the authors' decision, and the rule asks that it take "we".

### Prose standard: D. Structure / No synonym cycling

8. main.tex:28, 143, 183, 199, 265, 267, 268, 269. The conditioner has several names:
   - "the feature conditioner" (main.tex:28)
   - "The feature scaler changes the outcome materially." (main.tex:267)
   - "Conditioning matters" (main.tex:265)

   The default conditioner is "Yeo-Johnson power transform" (main.tex:143, 183), "power scaling" (main.tex:143, 268) and "the power transform" (main.tex:199). The quantile conditioner is "a quantile transform to a normal output" (main.tex:143) and "quantile scaling" (main.tex:28, 269). The rule asks for one term per concept, repeated.
   - Also references/rules.md, Common style errors / Tense per section: "The feature scaler changes the outcome materially." (main.tex:267) reports a result in the present tense, and the rule asks that Results be in the past.

9. main.tex:28, 86, 137, 139, 209, 239, 282. The value 0.504 is the "majority-class proportion" at main.tex:28, 137, 139 and 239, and the "majority-class baseline" at main.tex:86 ("so the majority-class baseline is 0.504"), 209 and 282. The rule asks for one term per concept.

10. main.tex:28, 135, 205, 328, 342. The five methods are "clustering algorithms" (main.tex:28; "the choice among the clustering algorithms tested", main.tex:342), "algorithms" (main.tex:135) and "clusterers" (main.tex:205, 328, and "every clusterer tested" at main.tex:342). The rule asks for one term per concept.

11. main.tex:51, 239, 243. The measure the draft calls the "supervised ceiling" is also "A supervised probe" (main.tex:51) and "A linear probe can use a direction of small variance that separates the classes" (main.tex:243), and the random forest is "A non-linear probe" (main.tex:239). The rule asks for one term per concept. As written, the reader cannot tell whether "linear probe" means the ceiling.

12. main.tex:86, 135, 199, 209, 229, 245, 250, 261, 303, 322. The 2 542 items are "records" in the text (main.tex:86, 135, 199, 245) and "recordings" in the captions, for example "on 2\,542 recordings" (main.tex:229), and also at main.tex:209, 250, 261, 303 and 322. The rule asks for one term per concept.

### references/rules.md: Precision / Most specific term

13. main.tex:86, "The positives are drawn from the records carrying an AF statement, atrial fibrillation (AFIB) or atrial flutter (AFLT)". Throughout the paper the positive class is called atrial fibrillation (AF), but it includes atrial flutter, which is a different rhythm. The rule asks for the most specific term the field has.

14. main.tex:239, "We read the weaker representations as holding label information that does not lie along their dominant axes of variation." "The weaker representations" includes raw flattening, which the same paragraph says carries almost no linearly decodable label information (ceiling 0.519). The rule asks that the representations meant be named.

15. main.tex:336, "Because the 500\,Hz records could not be obtained in bulk from the source". "The source" is not named. The rule asks for the most specific term.

### references/rules.md: Precision / Pronoun with a clear antecedent

16. main.tex:51, "is how the common representation families compare on this axis under chance-corrected metrics." The nearest axes in the paragraph are the "dominant axes of variation", not the distinction between separability and clusterability that "this axis" is meant to name. The rule asks for a clear antecedent.

17. main.tex:58, "which explains the original project's numbers." "Which" could refer to the testing, to the silhouette or to the conditioner. Line 330 attributes the original numbers only to purity and the silhouette. The rule asks for a clear antecedent.

18. main.tex:96, "They encode the clinical criteria of rhythm regularity, P-wave presence and QRS shape." The nearest antecedent is "The other four" morphology features, but rhythm regularity points to all 16 features. The rule asks for a clear antecedent.

19. main.tex:241, "Each result has a likely explanation, and the study did not test these mechanisms directly." "These mechanisms" points forward to explanations that have not yet been stated. The rule asks for a clear antecedent.
   - Also references/registers.md, Engineering and CS / Voice: "the study did not test" gives the authors' decision to "the study", and the rule asks that it take "we".
   - Also references/rules.md, Paragraphs / First sentence states the point: the paragraph's point is why ECGFounder and the hand-crafted features both separate and cluster. The first sentence does not state it.

### references/rules.md: Precision / Term defined at first use

20. main.tex:28, "It also sweeps the feature conditioner and repeats each seeded clustering fit over ten seeds." "Conditioner" is used at main.tex:28, 58, 100 and 135, and its meaning (four scalers or transforms) is first given at main.tex:143. The rule asks that a technical term be defined where it first appears.

21. main.tex:53, "Its representation-wise evaluation includes the adjusted Rand index (ARI) of Gaussian-mixture clusters of the frozen embeddings." "Representation-wise evaluation" is used twice in the paragraph and is never defined. The rule asks for a definition at first use.

22. main.tex:199, "In each of 15 rounds every site runs three local Lloyd iterations from the shared centroids." "Lloyd iterations" is not defined. The rule asks for a definition at first use.

### references/rules.md: Objectivity / Claims rest on evidence

23. main.tex:40, "Most machine-learning work on the electrocardiogram (ECG) is supervised." No source supports the claim. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / First sentence states the point: the paragraph's point, that the representation may matter more than the algorithm, comes only in its last sentence.

24. main.tex:40, "Whether that attempt succeeds is usually attributed to the clustering algorithm." The sentence names no source and no one who makes this attribution. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / Claim with evidence or citation: no citation follows the claim.

25. main.tex:53, "MIT-BIH is the canonical morphology benchmark." The claim has no source. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / Claim with evidence or citation.

26. main.tex:95, "This is a properly specified reconstruction model". "Properly specified" is asserted with no criterion and no evidence. The rule asks that a claim rest on evidence.

27. main.tex:102, "Both foundation models were pretrained on 12-lead input and are given the input they expect." The draft itself contradicts this. ECGFounder receives upsampled 100 Hz input, and neither model's input was filtered as its pretraining data were (main.tex:336). HuBERT-ECG receives no amplitude normalisation (main.tex:97), although it was pretrained on input rescaled to [-1, 1]. The rule asks that a claim rest on evidence.

28. main.tex:241, "The class difference therefore lies along the features' own axes, and their ceiling (0.942) and ARI (0.711) agree." Line 239 says the ceiling and the ARI "are not compared directly". Here they are compared and said to agree, with no basis given. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Hedging / Hedge where a claim is uncertain: the paragraph's first sentence says these mechanisms were not tested, yet this one is stated without a hedge, while the ECGFounder sentence before it is hedged ("likely organised").

29. main.tex:256, "Internal indices mislead here in a specific, reproducible way." No reproduction is reported. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / Claim with evidence or citation.

30. main.tex:271, "Robust scaling, a common default for physiological signals, leaves heavy arrhythmic tails unbounded so that a few outliers dominate Euclidean distance and the partition collapses." The claim that robust scaling is a common default has no source. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / Claim with evidence or citation: no citation follows.
   - Also references/rules.md, Hedging / Hedge where a claim is uncertain: the causal mechanism was not tested and is stated as fact.
   - Also references/rules.md, Objectivity / Limitations and alternative interpretations: unlike main.tex:241, this paragraph does not say that the mechanism was untested.

31. main.tex:299, "In both stress tests the hand-crafted features give the more stable result, within this simulation on one dataset." The imbalance analysis "has no seed spread" (main.tex:297), so stability was not measured in that test. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Paragraphs / Claim with evidence or citation.

32. main.tex:328, "Raw flattening and the conv-AE, including the original project's design, scored at chance". The original design used a dense autoencoder. Line 95 describes the conv-AE as "in contrast to" that autoencoder, and the dense autoencoder was not evaluated. The rule asks that a claim rest on evidence.

33. main.tex:336, "ECGFounder clusters almost identically in both (ARI 0.896 versus 0.909, a difference of 0.013). Upsampling adds no information, so it cannot inflate the foundation model's lead." In the order the sentence gives, the upsampled input scored the higher ARI. The text states without qualification that upsampling cannot inflate the lead. The rule asks that a claim rest on evidence.
   - Also references/rules.md, Objectivity / Limitations and alternative interpretations: the text does not acknowledge that its own check points the other way.

### references/rules.md: Objectivity / Limitations and alternative interpretations

34. main.tex:28, 328, 342. The imbalance result "rests on one random subsample and one $k$-means fit" (main.tex:297), but it is restated without that limitation at:
   - main.tex:28: "At a 9:1 SR:AF ratio the hand-crafted features reached an ARI of 0.232, against 0.060 for ECGFounder."
   - main.tex:328: "Under 9:1 class imbalance the hand-crafted features exceeded it"
   - main.tex:342: "With 9:1 class imbalance the 16 hand-crafted features exceeded it, and under simulated class-proportion skew they came close (0.591 against 0.612)."

   The Limitations section (main.tex:336<en dash>338) does not list it either. The rule asks that the text acknowledge the limitations of the study.

### references/rules.md: Hedging / Hedge where a claim is uncertain

35. main.tex:245, "Neither therefore places the rhythm difference along its dominant axes." This is an untested mechanism stated as fact. The rule asks that an interpretation with alternative explanations be hedged.

36. main.tex:278, "The ordering replicates on a different dataset and a different task type". This generalizes from a limited sample: MIT-BIH has three of the five representations, no foundation model and one task. The rule asks that such a generalization be hedged.
   - Also references/rules.md, Common style errors / Tense per section: the Results are reported in the present ("replicates", "cluster", "does not", "separates"), and the rule asks for the past.

37. main.tex:297, "ECGFounder's lead on balanced data does not hold under this imbalance." This is a result that needs replication: the paragraph says it rests on one subsample and one $k$-means fit. The rule asks that it be hedged.

### references/rules.md: Paragraphs / Claim with evidence or citation

38. main.tex:44, "It reported high cluster purity and a silhouette score near 0.89, but the purity simply equalled the majority-class proportion in every setting, and the silhouette was measured on a degenerate solution in which almost all points fell into a single cluster." The results of the master's project are given with no citation and no source, here or anywhere in the draft. The rule asks that a claim be followed by its data, its citation or an example.
   - Also Prose standard, E. Sentence shapes / Sentence length: the sentence has 41 words (facts: main.tex:42 s3) and chains three independent ideas.
   - Also Prose standard, A. Vocabulary / Banned as filler: "the purity simply equalled" (main.tex:45).
   - Also references/rules.md, Hedging / No hedge on facts: "a silhouette score near 0.89" (main.tex:45) hedges reported data, which main.tex:256 states as "silhouette of 0.89".

39. main.tex:86, "PTB-XL encodes rhythm statements at a likelihood of zero meaning ``present''". No citation follows this claim about how the database encodes its labels. The rule asks for the citation that supports it.

### references/rules.md: Reader's path / Clarity test

40. main.tex:330, "The result also reframes the original master's project. Its conclusion that the bottleneck is the representation rather than the clustering algorithm holds in this benchmark, and we have quantified it. Its headline metrics were the artefacts of two avoidable choices, purity without a baseline and silhouette on a collapsed embedding. Both are corrected here." Every point here is already made: the purity and silhouette artefacts and the representation conclusion at main.tex:42<en dash>49, and the silhouette artefact again at main.tex:256. The rule asks that a paragraph whose removal loses nothing be deleted.
   - Also Prose standard, E. Sentence shapes / Cold opens: "The result" has no antecedent, because the previous paragraph reports several results.
   - Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: the paragraph has 54 words, far below about 120 to 200.

## Style

### Prose standard: 0. Hard rules / Plain prose only

41. main.tex:49, 273. Two paragraphs close on a punchy one-line summary:
   - main.tex:49: "We make it precise."
   - main.tex:273: "Conditioning should be reported and swept, not assumed."

   The rule asks to state the fact and stop.
   - Also Prose standard, E. Sentence shapes / Restating closes: main.tex:273 says again, as a prescription, what the paragraph's opening sentence ("The feature scaler changes the outcome materially.") says.
   - Also Prose standard, D. Structure / Binary contrast ("not X, Y") at most twice per page: at main.tex:273 the contrast is not the paragraph's point. The point is the measured drop in ARI.

42. main.tex:237, 254, 265. Three headings editorialise:
   - main.tex:237: "\subsection{Separability is not clusterability}"
   - main.tex:254: "\subsection{The silhouette trap}"
   - main.tex:265: "\subsection{Conditioning matters}"

   The rule asks for no headline-style headings that editorialise.
   - Also Prose standard, 0. Hard rules / Headings are labels, not sentences: main.tex:237 and 265 are sentences.
   - Also Prose standard, 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles: "trap" at main.tex:254 is a figurative title.

### Prose standard: A. Vocabulary / Vague qualifiers

43. main.tex:28, 71, 233, 297. "Near zero" stands where the draft has the number:
   - main.tex:28: "Raw flattening and the autoencoder scored at chance (ARI near 0)"
   - main.tex:71: "are near zero for such trivial solutions" (Table 2 gives 0 for the one-cluster solution)
   - main.tex:233: "HuBERT-ECG and raw flattening stay low (below 0.14 and near 0)."
   - main.tex:297: "with HuBERT-ECG and raw flattening near zero."

   The rule asks for the number or the specific claim.

44. main.tex:76, "Berger et al.~\cite{arxiv_2602_17531} report that a randomly initialised encoder with linear evaluation matches pretrained encoders on many tasks." "Many" is a vague qualifier, and the rule asks for the number or the specific claim.
   - Also references/rules.md, Common style errors / Tense per section: a literature review reports results in the past, and this result is reported in the present.

### Prose standard: D. Structure / Three or more list-shaped items in paragraph form become a list

45. main.tex:96, 104, 106. Items shaped like a list are given in running sentences:
   - main.tex:96: the 16 hand-crafted features, "Eight features describe the RR intervals \cite{hrvstandards1996}. They are the mean RR interval, <horizontal ellipsis> The other four are <horizontal ellipsis> Eight features describe the morphology \cite{dechazal2004}. They are <horizontal ellipsis>"
   - main.tex:104: the selection criteria, "We chose the two foundation models by three criteria. Both have public weights and take 12-lead input. They differ in pretraining and architecture <horizontal ellipsis> Both are evaluated in the closest benchmark"
   - main.tex:106: the 21 beat features, "The RR-context values are the previous and next RR intervals, their ratio, <horizontal ellipsis> The morphology values are the R amplitude, the energy, the QRS width, the maximum, the minimum, the skewness and the kurtosis"

   The rule asks that such items become a list introduced with a colon.

### Manuscript prose standard: Rules replaced / Section D, Paragraphs

46. main.tex:40, 62, 100, 104, 139. These paragraphs fall far below the length of about 120 to 200 words:
   - the paragraph beginning "Most machine-learning work on the electrocardiogram (ECG) is supervised." (main.tex:40), 71 words
   - the paragraph beginning "Recent ECG foundation-model benchmarks compare models with one another" (main.tex:62), 51 words
   - the paragraph beginning "Both foundation models are used frozen, in evaluation mode" (main.tex:100), 25 words
   - the paragraph beginning "We chose the two foundation models by three criteria." (main.tex:104), 78 words
   - the paragraph beginning "A supervised ceiling measures how much of the label a classifier recovers" (main.tex:139), 75 words

   The rule asks that a paragraph far outside that length be split or joined with its neighbour.

47. main.tex:86, 143, 233, 235, 328, 332. These paragraphs each cover more than one idea:
   - the paragraph beginning "Rhythm labels are taken from the statements" (main.tex:86): how the cohort is built, and why the binary SR-versus-AF task was chosen
   - the paragraph beginning "Because heavy-tailed features can dominate Euclidean distance" (main.tex:143): the conditioner sweep with the choice of default, the $K$ sweep, and the 9:1 subsample
   - the paragraph beginning "Across ten seeds the $k$-means solutions are stable." (main.tex:233): seed stability, the Wilcoxon contrasts with their effect sizes, purity, and the $K$ sweep
   - the paragraph beginning "The two foundation models do not behave as one category." (main.tex:235): the difference between the two foundation models, the HDBSCAN noise solutions, and the low spectral scores
   - the paragraph beginning "The practical reading holds for the settings tested" (main.tex:328): the ranking under each condition, the dimension and cost of the representations, the scope of the MIT-BIH comparison, and the chance-level results
   - the paragraph beginning "We propose no new algorithm." (main.tex:332): the contribution, and the list of other public foundation models with their objectives

   The rule asks that a paragraph covering two ideas be split.

### Prose standard: E. Sentence shapes / Restating closes

48. main.tex:278, "The same pattern appears for rhythm on PTB-XL and for morphology on MIT-BIH, which supports the representation-level reading for these two tasks." This says again what the paragraph's first sentence says ("The ordering replicates on a different dataset and a different task type"). The rule asks that such a final sentence be cut.

### references/rules.md: Formality / No colloquial words

49. main.tex:256, "Raw flattening with Ward attains a silhouette of 0.81 while all but a handful of points fall into one cluster". "A handful" belongs to informal writing. The rule asks for formal, academic vocabulary.
   - Also references/rules.md, Common style errors / Vague phrase: "all but a handful of points" stands where the count belongs.
   - Also references/rules.md, Common style errors / Tense per section: the Results are reported in the present ("attains", "fall", "have"), and the rule asks for the past.

### references/rules.md: Paragraphs / First sentence states the point

50. main.tex:53, 137, 205, 243. In these paragraphs the first sentence does not state the point:
   - main.tex:53: "The most directly related work, by Filice et al.~\cite{lookingbeyond2026}, benchmarks ECG foundation models against one another on four 12-lead datasets, PTB-XL among them." The point is what that benchmark omits and that this study adds it.
   - main.tex:137: "Table~\ref{tab:metrics} gives the meaning, formula and range of each metric." The point is which metrics are the headline metrics and what each is compared with.
   - main.tex:205: "Table~\ref{tab:main} and Fig.~\ref{fig:heatmap} summarise the PTB-XL benchmark." The point, that the representation changed the result more than the clusterer, comes only in the last sentence.
   - main.tex:243: "HuBERT-ECG was pretrained by self-supervision without diagnostic labels \cite{hubertecg2024}, and here it saw only the first 5\,s at 100\,Hz, averaged over time." The point, that the label is present but not along the dominant axes, comes near the end.

   The rule asks that a paragraph's first sentence state its main point.

### references/rules.md: Paragraphs / Evidence followed by what it means

51. main.tex:233, 235, 328. Evidence is left without an interpretation:
   - main.tex:233: "The hand-crafted $k$-means partition has a purity of 0.901, against 0.506 for raw flattening and a majority-class proportion of 0.504."
   - main.tex:235: "For the hand-crafted features and ECGFounder, its largest cluster held 0.140 and 0.202 of the records."
   - main.tex:328: "On MIT-BIH their ARI was at most 0.127." This ends the paragraph.

   The rule asks that evidence be followed by an interpretation that connects it to the paragraph's claim.

### references/rules.md: Common style errors / Vague phrase

52. main.tex:66, "learn general representations from millions of recordings". Table 1 gives 9.1 million and 10 771 552. The rule asks for the specific claim.

53. main.tex:94, 106. Approximate dimensions stand where the method fixes the exact value:
   - main.tex:94: "the 12 leads are concatenated into one real-valued vector of about 2000 values"
   - main.tex:106: "into one vector of about 400 values"

   The rule asks for the specific claim.
   - Also references/rules.md, Common style errors / Tense per section: at main.tex:94 ("Each lead is averaged <horizontal ellipsis> and the 12 leads are concatenated") the method is described in the present, and the rule asks Methodology for the past.

54. main.tex:172, "version 1.3 or later [GAP: exact library versions used for the reported results]". The exact version used is not given. The rule asks for the specific claim.
   - Also references/registers.md, Engineering and CS / What the reader looks for: the reader looks for reproducibility of results, which the methods section gives, and the library versions behind the reported results are missing.

55. main.tex:336, "including some reported to cluster well \cite{lookingbeyond2026}". The models are not named. The rule asks for the specific claim.

### references/rules.md: Common style errors / Tense per section

56. main.tex:78, 84, 86, 88, 106, 135, 141, 143, 199, 205, 233, 235, 239, 245, 297, 299. These sections report in the present where the rule asks for the past.

   Literature review, reporting results:
   - main.tex:78: "They find that ECGFounder and ECG-FM separate their embeddings more by clinical label than by dataset"

   Methodology:
   - main.tex:84: "We use PTB-XL, a public database of 10\,s 12-lead recordings"
   - main.tex:86: "Rhythm labels are taken from the statements of the Standard Communication Protocol"
   - main.tex:88: "Each annotated beat is segmented into a window of $[-300, +250]$\,ms"
   - main.tex:106: "On MIT-BIH the rhythm features do not apply to single beats, so three beat representations are compared."
   - main.tex:135: "Each representation is clustered with five algorithms \cite{sklearn2011}"
   - main.tex:141: "In the main benchmark each fit of $k$-means, spectral clustering and the GMM is repeated over ten seeds."
   - main.tex:143: "Because heavy-tailed features can dominate Euclidean distance, four conditioners are swept"
   - main.tex:199: "To probe deployment under data siloing we use federated $k$-means"

   Results:
   - main.tex:205: "ECGFounder clusters best (ARI up to 0.885 with $k$-means), and the hand-crafted features reach 0.711 with Ward."
   - main.tex:233: "Across ten seeds the $k$-means solutions are stable."
   - main.tex:235: "The two foundation models do not behave as one category."
   - main.tex:239: "Raw flattening carries almost no linearly decodable label information (ceiling 0.519)"
   - main.tex:245: "With $k$-means, raw flattening places on average 0.967 of the records in one cluster"
   - main.tex:297: "At a 9:1 SR:AF ratio (majority 0.90), every representation's ARI falls."
   - main.tex:299: "Under the IID split across ten sites, every representation keeps essentially its centralized ARI"

   The rule asks the literature review to report results in the past, and the Methodology and the Results to be in the past.

### references/registers.md: Engineering and CS / Voice

57. main.tex:102, 112, 135, 184, 235, 243, 328, 336. The authors' decisions are written in the passive or given to "the study":
   - main.tex:102: "The effect of adding leads to the hand-crafted set was not tested."
   - main.tex:112 (Table 1 caption): "Run time and memory were not measured."
   - main.tex:135: "The default conditioner was chosen on a labelled pilot analysis, described below."
   - main.tex:184: "and wave delineation by its discrete wavelet method, selected by the study"
   - main.tex:235: "which was not checked here"
   - main.tex:243: "Whether the shorter, unfiltered input adds to the gap was not tested."
   - main.tex:328: "Run time and memory were not measured"
   - main.tex:336: "The effect of matching this preprocessing was not tested."

   The rule asks that the authors' decisions take "we", and that the authors never refer to themselves in the third person.

Tokens of the four agents: sentence 106898, section 87136, whole-draft 84626, checking 148511; sum 427171.

A one-line reply starts the draft writer for those findings and the compile again, in the forms `all`, `all but 3, 7`, `2, 5` or `none`.

You can instead ask for an autonomous writer pass, in which the draft writer judges each finding, applies the ones it accepts and lists the rest with its reason.

### The autonomous pass has already run

Under your standing instruction, the autonomous pass has already run on all 57 findings. Patch 15 has 53 operations, and patch 18 then fixed two overfull lines. Before applying patch 15 I read its whole diff and checked the values it takes from `code/`. It applied every finding except two:
- **K54, library versions:** `code/requirements.txt` gives only minimum versions, so `[GAP: exact library versions used for the reported results]` stays.
- **K43, two of its four places:** "near 0" stays in the K-sweep sentence and "near zero" in the 9:1 subsample sentence. Those values are printed by `code/experiments/run_analyses.py` but are not saved in any file.

The draft writer's brief forbade running its own commands. Its report says it ran one read-only `python3 -c` that printed a manifest and changed no file.

## Needs you

- **ORCIDs:** `[GAP: ORCID of Dongho Chun]` and `[GAP: ORCID of Axel Faes]`.
- **Library versions:** `[GAP: exact library versions used for the reported results]` in the caption of the settings table.
- **Master's project source (V22, K38):** `[GAP: source of the master's project results]` in the first Introduction paragraph. Either cite the thesis or state that it is unpublished.
- **AI-use statement:** every category other than revision assistance is still "uncertain", and the tools and versions are not known.
- **PTB-XL DOI in the README:** `code/README.md:19` gives 10.13026/x4td-x982 for PTB-XL 1.0.3. `lookup bibtex` resolves that DOI to `physionet.org/content/ptb-xl/1.0.1/`, so it belongs to release 1.0.1. The DOI that refs.bib cites, 10.13026/kfzx-aw45, resolves to `.../1.0.3/`.
- **Fourth Wilcoxon contrast:** the code also tests hand-crafted against raw flattening (`code/experiments/run_analyses.py:48-49`). That result is printed but not saved, so the manuscript reports only three contrasts.

## Reference checks left failing (mark-only)

The last `check-urls` run exits 1. Each identifier below agrees with its record (`citation-report.md`, C37 and C38).
- **403 at the publisher's page:**
  - hrvstandards1996 (ratio 0.38, DOI_MISMATCH)
  - physionet2000 (ratio 0.52, DOI_MISMATCH)
  - McKeen_2025
  - hubertecg2024
  - ecgfounder2024
  - Van_Gelder_2024
  - Fowlkes_1983
- **No answer (InvalidURL):** Perez_Alday_2020.
- **No identifier:** vinh2010, sklearn2011 and rosenberg2007vmeasure. No registered DOI exists for any of them.
- **202 (request accepted, not a 200):** mitbih2001 and dechazal2004.

Open the 403 and InvalidURL links in a browser before you submit.

## Citations not checked against a passage

For these claims the run could not read the cited text (paywalled, or no text available). Each citation was kept by override, and each reference is verified by its record:
- C5: hrvstandards1996
- C6: dechazal2004, claims 4 and 29
- C7: wavelettensorecg2018
- C9: hubertarabie1985
- C10: vinh2010
- C11: rousseeuw1987
- C12: mitbih2001
- C13: physionet2000
- C15: hdbscan2013
- C16: rosenberg2007vmeasure
- C17: Fowlkes_1983

No source was matched only by a preprint server or by no index.

## Reference entries flagged for you

- **C25:** Kim_2027 is dated 2027 by Crossref and 2026 by OpenAlex. Its venue, Neural Networks, was not screened.
- **C27:** these entries are incomplete: Lunelli_2026, Han_2026, McKeen_2025, Zheng_2020, ecgfounder2024, Xu_2025 and rosenberg2007vmeasure. BibTeX warns of empty pages in Xu_2025 and rosenberg2007vmeasure.
- **C28:** the author "Moura Junior, Valdery" is written two different ways across two entries.
- **C29:** the year and pages of fedavg2017, clocs2021 and threekg2021 come from no index record.
- **hubertecg2024:** the title is the posted version's (ratio 0.98).

## Referee items resolved within the permissions

All 26 items are resolved (issues.md, Reading 2). For the items below, the part that remains needs a permission this run did not have. The response letter has to say so.
- R1-1 and R3-3: bootstrap intervals and Cliff's delta.
- R1-2: Cliff's delta.
- R1-4 and R3-6: time and memory.
- R1-5 and R3-12: intervals or error bars in the figures.
- R3-2: further datasets.
- R3-4: further foundation models.
- R3-5: real multi-site federation.
- R3-10: fonts and contrast inside the figure files. The include width of Figures 2 and 3 was raised.
- R3-13: three decimals for retention and the values given only in the text.

## Acknowledged limitations from reading 2

- **V36** is the hubertecg2024 403 line listed above.
- **V37** is now gone: `grep -c canonical main.tex` gives 0.
- **V38** is now gone: the repeated clause stands once, and `grep -c 'computed with patient-grouped' main.tex` gives 1.

Patch 15 removed both V37 and V38. No peer-reviewer reading followed patch 15, so these two are confirmed only by the two greps and by my reading of the diff.

The same message is written to `run/final.md`. Both temporary folders are removed (`ls` reports "No such file or directory" for each).

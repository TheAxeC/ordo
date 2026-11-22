# `/writing` review of main.tex (Steps 13 of the revision run)

The report of the checking agent, as it gave it. Line numbers are those of main.tex after patch 11.

## Fix first

### Prose standard, D. Structure / No synonym cycling

1. The compared representations are called by three names: main.tex:410 "across the five PTB-XL representations", main.tex:289 "The arms use different lead sets", main.tex:73 "far ahead of the raw and \rev{conv-AE} pipelines". The rule asks for one term per concept, repeated.
   Also under Manuscript prose standard, G. The project's own software / No software wording (main.tex:73): "pipelines" is software wording about the study's own representations.
   Also under references/rules.md, Common style errors / Tense per section (main.tex:289-290): "The arms use different lead sets, and each choice answers a different constraint. The hand-crafted arm is single-lead by clinical convention" reports the method in the present. Methodology reports in the past.

2. One representation has five names: main.tex:247 "Raw flattening", main.tex:471 and 486 "raw-flatten", main.tex:291 "The raw arm", main.tex:525 "the raw pipeline never exceeded 0.005", main.tex:556 "the raw vector". The master's project's method is "the original pipeline" at main.tex:247 and "the originating pipeline" at main.tex:254. The rule asks for one term per concept.
   Also under Manuscript prose standard, G. The project's own software / No software wording (main.tex:525): "the raw pipeline".

3. The data sources are called both datasets and databases: main.tex:661 "on a different dataset", main.tex:669 "on two databases with different lead sets", main.tex:212 "a public database", main.tex:128-129 "four 12-lead datasets". The rule asks for one term per concept.

4. One concept, how the classes are distributed across sites, has four names: main.tex:84 "differ in class prevalence", main.tex:156-157 "federation across sites that differ in class proportions (non-IID)", main.tex:438 "differ sharply in arrhythmia prevalence", main.tex:722 "each real site has one class mix". The rule asks for one term per concept.
   Also under references/rules.md, Precision / Term defined at first use (main.tex:157): "non-IID" is spelled out only at lines 436-437.

5. One object, a redrawn partition of the cohort into sites, has two names: main.tex:696 "their spread over site draws", main.tex:718 "the ten redrawn site partitions", main.tex:721 "the worst site draw". The rule asks for one term per concept.
   Also under references/rules.md, Paragraphs / First sentence states the point (main.tex:694-697): the first sentence, "The two stressors closer to deployment changed the comparison in different ways: ... non-IID federation brought the means of the two closer while their spread over site draws differed", covers both stressors. The paragraph (lines 694-707) covers class imbalance only.

6. An ARI of about zero has two names. One is "indistinguishable from a majority-class assignment (ARI $\approx 0$)" at main.tex:460-461 and main.tex:813-814. The other is "chance": main.tex:565 "clustered at chance", main.tex:705-706 "stayed at chance", main.tex:904 "sit at chance". The draft also reports a majority baseline and a random baseline as separate things (line 334). The rule asks for one term per concept.
   Also under Manuscript prose standard, G. The project's own software / No software wording (main.tex:460, 705, 813, 904): "the raw and conv-AE pipelines".
   Also under references/rules.md, Formality / No colloquial words (main.tex:904): "sit at chance".

### Prose standard, D. Structure / No mirror structure

7. main.tex:823: "Six elements separate this study from the closest ECG foundation-model clustering benchmark". The bulleted list at lines 826-839 repeats, as a second list, the content of the Introduction's contributions list (lines 142-163): the hand-crafted comparison, the supervised ceiling, MIT-BIH, the two cautions and the deployment stressors. The same content also appears at lines 126-132 and 199-206. The rule asks that each section take the shape its content needs.

### Prose standard, E. Sentence shapes / Restating closes

8. main.tex:525-527: "Because the lowest hand-crafted value, 0.329, stayed above the highest HuBERT-ECG value, 0.132, ECGFounder, the hand-crafted features and HuBERT-ECG kept that order at every $K$." This final sentence repeats values already given at line 524 and the paragraph's opening point at line 521. The rule asks that such a closing sentence be cut.

### references/rules.md, Precision / Term defined at first use

9. Each of these technical terms has no definition where it first appears:
   - main.tex:69: "patient-grouped". The definition comes only at lines 146-147.
   - main.tex:77: "the silhouette score rewards the degenerate one-cluster solution". The definition comes only at lines 109-110.
   - main.tex:121: "linear-evaluation accuracy". It is never defined.
   - main.tex:153: "Yeo-Johnson power". It is undefined here and again at line 364.
   - main.tex:265-267: "beat-template consistency\rev{, [GAP: one-clause definition of beat-template consistency, from the study's feature extraction]}". It is defined nowhere in the text.
   - main.tex:442: "three local Lloyd iterations per site". It is not defined.

   The rule asks that a technical term be defined where it first appears.
   Also under Prose standard, E. Sentence shapes / Sentence length: the sentence at main.tex:76-80 is 46 words and the sentence at main.tex:441-445 is 49 words.
   Also under references/registers.md, Engineering and CS / What the reader looks for (main.tex:265-267): one of the 16 features is undefined, so the methods section does not give what is needed to reproduce the representation.

### references/rules.md, Precision / Pronoun with a clear antecedent

10. main.tex:534-535: "Both are reported with the settings of Section~\ref{sec:clustering}, without further tuning." "Both" can refer to HDBSCAN and spectral clustering, or to the conv-AE and raw flattening named just before it. The rule asks that a pronoun have a clear antecedent.

### references/rules.md, Objectivity / Claims rest on evidence

11. Two passages assert that the conv-AE was well built and give no evidence for it, such as a reported reconstruction error or a convergence result:
    - main.tex:256-257: "This is a properly specified reconstruction model, in contrast to the original collapsed dense autoencoder."
    - main.tex:566: "Although properly trained as a reconstruction model".

    The rule asks that a claim rest on evidence.
    Also under references/rules.md, Objectivity / Limitations and alternative interpretations (main.tex:255-257): the conclusions on the conv-AE (line 558, and the decision rule at lines 820-821) rest on one architecture with one 32-unit bottleneck. The Limitations section (lines 858-891) does not acknowledge this.

12. main.tex:761-762: "Cost and clustering quality were ordered against each other". The two tables do not show this order:
    - HuBERT-ECG costs 37.530 ms per record against 28.296 ms for the hand-crafted features (Table~\ref{tab:cost}), yet its best ARI is 0.195 against 0.711 (Table~\ref{tab:main}).
    - The conv-AE costs 1.441 ms against 0.058 ms for raw flattening, with a best ARI of 0.008 against 0.013.

    The rule asks that a claim rest on evidence.
    Also under Prose standard, E. Sentence shapes / Sentence length: the sentence at main.tex:761-765 is 49 words.
    Also under references/rules.md, Concision / One idea per sentence: that sentence joins time per record, resident memory and parameter count.
    Also under references/rules.md, Precision / Most specific term (main.tex:765): "the hand-crafted path".

### references/rules.md, Objectivity / Limitations and alternative interpretations

13. main.tex:700-701: "The hand-crafted features retained the most structure (ARI 0.265 [0.250, 0.280], ...) and \emph{overtook} ECGFounder". The text reads the reversal at 9:1 only as behaviour of the representations. It does not consider that a clusterer fixed to two clusters on a 9:1 cohort may account for part of the drop. Line 706-707 limits the result's scope to this setting, but neither this paragraph nor the Limitations section discusses this other reading. The rule asks that the text acknowledge alternative interpretations of its results.

### references/rules.md, Hedging / Hedge where a claim is uncertain

14. These claims are interpretations or generalizations, and each is stated without a hedge:
    - main.tex:544-545: "so the rhythm split is one of the larger sources of variation in its 1024 dimensions". This is inferred from clustering results, not measured.
    - main.tex:549-550: "The conv-AE ceiling of 0.678 is what a bottleneck optimised to reconstruct signal energy retains of a class it was never asked about". This is a causal interpretation stated as fact.
    - main.tex:569-570: "The discriminative information exists in the weaker embeddings but does not lie along their dominant axes of variation". The draft itself raises an alternative explanation for HuBERT-ECG at lines 601-603: its 5 s input.
    - main.tex:905: "Internal indices and feature scaling are not neutral and must be reported." This generalizes beyond the two tasks that line 898 says the results cover.

    The rule asks that an interpretation with alternative explanations, and a generalization from a limited sample, be hedged.
    Also under Prose standard, 0. Hard rules / No repeated construction (main.tex:544): this clause is one instance of the ", so" shape listed in finding 21.

### references/rules.md, Hedging / No hedge on facts

15. main.tex:862-863: "The upsampled input may therefore raise ECGFounder's ARI by about 0.013 on that subset". On that subset the difference was measured: 0.909 against 0.896. The rule asks that reported data be stated without a hedge.

### references/rules.md, Paragraphs / Claim with evidence or citation

16. main.tex:270-271: "Lead II is the standard rhythm lead, on which RR regularity and P-wave presence are read." No citation or data follows this claim. The rule asks that a claim be followed by the data, the citation or the example that supports it.

17. Two explanations have no data, citation or example after them:
    - main.tex:552-554: "A likely reason is that its coordinates are amplitudes at fixed sample offsets, and no fixed offset falls on the same part of the cardiac cycle in two records."
    - main.tex:654-656: "A likely reason is that robust scaling leaves heavy arrhythmic tails unbounded, so that a few outliers may dominate Euclidean distance."

    The rule asks that each claim be followed by its support.
    Also under Prose standard, 0. Hard rules / No repeated construction: the two Results subsections give their explanation with the same opener, "A likely reason is that".

### references/rules.md, Reader's path / Clarity test

18. main.tex:562-572: "The supervised ceilings (last column of Table~\ref{tab:main} and Fig.~\ref{fig:sep}) exposed the gap between separability and clusterability. ..." Lines 538-558 already give the same values: raw 0.519 at chance, conv-AE 0.678 against 0.008, HuBERT-ECG 0.899 against 0.195, and both high for ECGFounder and the hand-crafted features. The paragraph's citation is already given at line 122. The rule says a paragraph whose removal loses nothing is deleted.

19. main.tex:351-355: "None of the eight metrics carries a physical unit. The first five are dimensionless indices of agreement ..." This restates what Table~\ref{tab:metrics} gives in its Range and Reading columns. The rule says a paragraph whose removal loses nothing is deleted.
    Also under Manuscript prose standard, D. Paragraphs: the paragraph is 41 words, far outside about 120 to 200.

## Style

### Prose standard, 0. Hard rules / Plain prose only

20. These sentences are punchy one-line summaries, editorialising lines or cute contrasts:
    - main.tex:81: "The chance-corrected controls locate where naive pipelines fail."
    - main.tex:139-141: "The ordering of the representations is therefore not the contribution. What the benchmark adds is what the controls reveal and how the representations behave under deployment stress."
    - main.tex:558: "Changing the clustering algorithm addresses neither."
    - main.tex:809: "The lead constraint is concrete."
    - main.tex:837-838: "and under these stressors the balanced-data ordering stops being the useful answer."

    The rule asks for no punchy one-line summaries, no cute contrasts and no editorialising: state the fact and stop.
    Also under references/rules.md, Precision / Most specific term (main.tex:81): "naive pipelines" does not name the representations it means.
    Also under Manuscript prose standard, G. The project's own software / No software wording (main.tex:81): "pipelines".

### Prose standard, 0. Hard rules / No repeated construction

21. Across the Results paragraphs on ceilings and the discriminant test, the same sentence shape recurs: a value, then ", so" and an interpretation. It appears at:
    - main.tex:551 "so a linear probe found little label information"
    - main.tex:554-555 "so some label information remains"
    - main.tex:575-576 "so even a non-linear decoder recovers a label that clustering does not"
    - main.tex:579-580 "so their label information is already linearly accessible"
    - main.tex:581 "so probe linearity does not account for that gap either"
    - main.tex:586 "so its class information is present"
    - main.tex:605-606 "so its class structure is both off-axis and diffuse"

    Line 544 is a further instance, reported in finding 14. The rule says a recurring sentence shape is a template and is rewritten.

### Manuscript prose standard, D. Paragraphs

22. Each of these paragraphs covers two ideas:
    - main.tex:98-115: the study's thesis and the need for unsupervised questions (lines 98-104), then the account of the master's project, from "This study began as a re-examination of an unpublished master's project that did so." (line 105).
    - main.tex:170-188: a survey of prior representation work, then this study's scope: "This study focuses on four families, ... A tensor arm is left to future work." (lines 185-188).
    - main.tex:529-535: the two foundation models behaving differently, then "HDBSCAN labelled most records as noise and underperformed throughout, and spectral clustering reached an ARI of 0.016 on HuBERT-ECG, against 0.174 with $k$-means on the same matrix, and 0.001 and 0.000 on the conv-AE and raw flattening" (lines 532-534).

    The rule asks that a paragraph covering two ideas be split.
    Also under Prose standard, E. Sentence shapes / Passive voice (main.tex:188): "A tensor arm is left to future work."
    Also under references/registers.md, Engineering and CS / Voice (main.tex:185 "This study focuses on four families", and main.tex:188): the authors' decisions take "we".
    Also under Prose standard, E. Sentence shapes / Sentence length (main.tex:532-534): the sentence is 39 words.
    Also under references/rules.md, Concision / One idea per sentence (main.tex:532-534): the sentence joins two unrelated results.

23. main.tex:318-320: "Tolerances and iteration caps were the library defaults, and no early stopping was imposed on the clusterers. ..." The paragraph is 2 sentences and 25 words. The rule asks that a paragraph far outside about 120 to 200 words be split or joined with its neighbour.

### Prose standard, D. Structure (list-shaped items become a list)

24. main.tex:357-371: "Each result was read against controls on the representation and on the clustering set-up." The five controls run as prose: the supervised ceiling, ten seeds with the Wilcoxon test, the four scalers, $K$ from 2 to 8, and the 9:1 subsample. The rule asks that three or more list-shaped items in paragraph form become a list introduced with a colon.

### Prose standard, E. Sentence shapes / Passive voice

25. Each of these passages uses the passive for the authors' own expectation, contribution or decision:
    - main.tex:137: "it is expected that compact hand-crafted features and a large foundation model both recover the split"
    - main.tex:148: "the comparison is shown stable across the assumed number of clusters"
    - main.tex:165-166: "the separability-versus-clusterability phenomenon is credited to prior work"
    - main.tex:226-227: "The lead set and any further preprocessing were chosen per representation rather than once for the whole study"
    - main.tex:872-873: "No multi-class arrhythmia cohort is evaluated"

    The rule asks for a rewrite unless the actor is irrelevant.
    Also under references/registers.md, Engineering and CS / Voice (each place above): the authors' decisions, contributions and results take "we".

### Prose standard, E. Sentence shapes / Sentence length

26. These sentences run well past roughly 20 words:
    - main.tex:472-476: "Seed variation is the smaller of the two quantities: across the ten seeds the $k$-means solutions move by less than 0.002 ... and the agglomerative and HDBSCAN columns have no seed interval." (60 words)
    - main.tex:516-519: "Moving only the seed left the $k$-means partitions almost unchanged, so the spread reported with the results is the patient-grouped bootstrap ..." (39 words)
    - main.tex:843-847: "HuBERT-ECG and ECGFounder both publish weights that load into a frozen feature extractor without fine-tuning, ..." (48 words)
    - main.tex:881-885: "Its only control on heterogeneity is the Dirichlet concentration, which moves class prevalence across sites and nothing else, and the spread that alone produces is already wide: ..." (44 words)
    - main.tex:900-904: "At a 9:1 SR:AF ratio, 16 interpretable hand-crafted features overtake it, and under simulated federation across ten heterogeneous sites they are the more predictable of the two, ..." (45 words)

    The rule asks for sentences under roughly 20 words unless the mechanism needs more.
    Also under references/rules.md, Concision / One idea per sentence (main.tex:472-476): the sentence joins three separate facts about different clusterers.

### Manuscript prose standard, G. The project's own software / No software wording

27. These passages use software wording about the study's own work:
    - main.tex:75: "the raw pipeline with a ceiling of 0.519"
    - main.tex:563: "The raw pipeline's linear ceiling of 0.519"
    - main.tex:816: "these two pipelines recovered far less"
    - main.tex:223-224: "converted once to a single-precision floating-point array"
    - main.tex:268: "reduced to a 16-dimensional single-precision vector"

    The rule asks for no wording of software operations about the project's own work, "the pipeline" included.

### references/rules.md, Formality / No colloquial words

28. These passages use colloquial verbs for results:
    - main.tex:402: "This is why HDBSCAN sat at the bottom of every representation"
    - main.tex:425: "the two-sided p-value is pinned at its floor of 0.002"
    - main.tex:555: "Both rows sat at a majority-class assignment"
    - main.tex:580: "the random forest sat below the linear ceiling"
    - main.tex:605: "The conv-AE rose off chance"

    The rule asks for formal, academic vocabulary.
    Also under references/rules.md, Reader's path / Reader's four questions (main.tex:402): this paragraph of the Methods section reports a result.

### references/rules.md, Transitions / Transition that states the relation

29. main.tex:820-821: "The decision rule above therefore chooses only between ECGFounder and the hand-crafted features." The sentence before it is about the original project's conclusion, and the restriction does not follow from that sentence. The rule asks that a transition state the relation its sentence has to the sentence before it.

### references/rules.md, Paragraphs / First sentence states the point

30. main.tex:760-761: "Table~\ref{tab:cost} states what each representation costs to compute, since the choice between representations depends on cost as well as on clustering quality." The paragraph's point is in its second sentence. The rule asks that a paragraph's first sentence state its main point.

### references/rules.md, Paragraphs / Evidence followed by what it means

31. main.tex:596-598: "These are held-out values, so the native column does not equal the full-cohort $k$-means ARIs of Table~\ref{tab:main}. The largest difference is 0.013, on HuBERT-ECG." The paragraph ends on the 0.013 figure, and no sentence connects it to the paragraph's claim. The rule asks that evidence be followed by an interpretation that connects it to the claim.

### references/rules.md, Common style errors / Vague phrase

32. Each of these phrases stands where the specific claim is needed:
    - main.tex:154: "changes the result by a wide margin"
    - main.tex:172: "underpin decades of automatic analysis"
    - main.tex:181-182: "learn general representations from millions of recordings"
    - main.tex:201-202: "In that analysis some models clustered by clinical label while others clustered by dataset."
    - main.tex:531: "some ECG foundation embeddings organise by clinical label and others by dataset"

    The rule asks that a vague phrase be replaced with the specific claim.

### references/rules.md, Common style errors / Tense per section

33. These passages report in the present where their section's tense is the past:
    - main.tex:245, in Methods: "We compare four families on PTB-XL (Table~\ref{tab:main})"
    - main.tex:600, in Results: "HuBERT-ECG is where the native and projected values separate furthest"

    The rule asks that Methodology and Results report in the past tense. Line 289 is reported in finding 1.

### references/rules.md, Reader's path / Reader's four questions

34. main.tex:292-293: "The raw arm therefore receives more input than the hand-crafted arm, so missing input does not explain its chance-level clustering." This Methods paragraph interprets a result that the Results section has not yet given. The rule asks that the section structure answer the reader's question "Where am I?".

35. main.tex:322-328: "The conv-AE was trained with Adam at a learning rate of \mbox{$10^{-3}$}, ..." The conv-AE training and the use of the foundation models sit under "Clustering and evaluation", not under "Representations". The rule asks that the section structure answer the reader's question "Where am I?".

### references/rules.md, Reader's path / So what per section

36. main.tex:98-100: "On the two arrhythmia tasks this study evaluates, whether clustering of the electrocardiogram (ECG) recovers a clinical label depends on the representation fed to the clustering algorithm and on how the result is evaluated." The Introduction opens with the study's finding. The rule asks that it open with a real-world consequence or a gap in knowledge.
    Also under references/registers.md, Engineering and CS / Voice: "this study evaluates" names the authors' work in the third person, and the authors' decisions take "we".

37. main.tex:280-283: "ECGFounder received the full \mbox{10\,s} record resampled to 12 by 5000 for its \mbox{500\,Hz} input". The Methods section does not say here that ECGFounder was fed upsampled 100 Hz data instead of native 500 Hz data. That limitation is stated only at line 859. The rule asks that Methodology acknowledge limitations upfront.

### references/registers.md, Engineering and CS / Voice

38. In these passages "this study" is the actor of the authors' contributions and results:
    - main.tex:115: "and this study makes it precise"
    - main.tex:130: "This study adds both"
    - main.tex:205: "this study adds a supervised ceiling"
    - main.tex:657: "this study reports power scaling unless stated otherwise"

    The rule asks that the authors' decisions, contributions and results take "we".

### references/registers.md, Engineering and CS / What the reader looks for

39. Each of these passages leaves out a setting needed to reproduce the result:
    - main.tex:308-309: "Spectral clustering, with a nearest-neighbour affinity and $k$-means label assignment." The number of neighbours is not stated, and line 318 names only tolerances and iteration caps as library defaults.
    - main.tex:359-360: "We report both a linear probe (balanced logistic regression) and a non-linear probe (random forest)". No setting of the random forest is given.
    - main.tex:370-371: "we additionally evaluated on a 9:1 SR:AF subsample." The size of the subsample and how it was drawn are not stated.
    - main.tex:698-699: "These results used power scaling and [GAP: the clusterer of the 9:1 results, which the manuscript does not name], over the ten seeds." The clusterer is not named.

    The rule asks that a methods or results section give what reproducibility needs.

Tokens: sentence agent 102,903; section agent 92,652; whole-draft agent 85,233; checking agent 144,549; total 425,337.

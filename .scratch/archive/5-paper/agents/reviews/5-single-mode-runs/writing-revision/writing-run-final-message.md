The review of `manuscript/main.tex` is finished. Three finding agents and one checking agent ran as `ordo-high`, each served `claude-opus-5-5`, which matches the configured model. No file was written or changed. The checking agent's report follows in full.

## Fix first

### prose standard / 0. Hard rules / No repeated construction

1. The draft says in three places that the ranking is not the contribution. The rule says a sentence shape that comes back across sections is a template and should be rewritten.
   - main.tex:78, "The ranking is largely expected, since SR and AF differ by definition in rhythm regularity; the contribution is the chance-corrected controls"
   - main.tex:132, "The resulting ranking is not the contribution."
   - main.tex:752, "None of these is a new method, and the ordering of the representations is not itself the result."
   Also, at 78, 132 and 753: prose standard / D. Structure / No synonym cycling. These passages call the concept "ranking", while finding 9 calls it "ordering".
   Also, at 752: prose standard / E. Sentence shapes / Restating closes. This last sentence of the paragraph says again what the paragraph opens with, "We claim no methodological novelty." (main.tex:740).

2. main.tex:721, "overtake it under class imbalance, and hold far more of their clustering ARI under site heterogeneity". This repeats the contributions sentence at main.tex:145, "overtaking the foundation embedding under imbalance and holding far more of their clustering ARI under site heterogeneity". The rule asks for the repeated shape to be rewritten.

3. The statement that the study proposes no new method comes back in several places. The rule asks for the repeated shape to be rewritten.
   - main.tex:147, "We do not propose a new method"
   - main.tex:381, "we do not propose a new federated method"
   - main.tex:740, "We claim no methodological novelty."
     Also: references/rules.md / Paragraphs / First sentence states the point. The rule asks the first sentence to state the paragraph's main point. Most of this paragraph sets out what separates this study from the closest benchmark.
   - main.tex:752, "None of these is a new method". This sentence is given in finding 1.

4. The sentence that limits the claims to the two models tested comes back in four places. The rule asks for the repeated shape to be rewritten.
   - main.tex:148, "we scope every foundation-model statement to the two models we test"
   - main.tex:468, "We therefore name each model and do not generalise to foundation models as a class"
   - main.tex:764, "none of it extends to ECG foundation models as a class"
   - main.tex:778, "which is why we name the two we test rather than generalising"

5. The statement that the foundation models are tied to the 12-lead format appears three times. The rule asks for the repeated shape to be rewritten.
   - main.tex:261, "such models are tied to the 12-lead strip format"
   - main.tex:727, "are tied to the 12-lead strip format and cannot embed the 2-lead MIT-BIH beats"
   - main.tex:786, "The MIT-BIH arm omits the foundation models because they are tied to the 12-lead strip format."

6. main.tex:455, "That floor is reached by any contrast in which all ten seeds move the same way, so the p-value orders none of the three". This repeats the Methods sentence at main.tex:371, "the two-sided p-value is pinned at its floor of 0.002 as soon as every seed moves the same way, so it separates none of the contrasts". The rule asks for the repeated shape to be rewritten.

7. main.tex:723, "The hand-crafted extraction is fifteen times cheaper per record than ECGFounder, holds about a third of the resident memory and loads no learned parameters at all". This repeats main.tex:678, "fifteen times the hand-crafted extraction ... which carries no learned parameters at all". The rule asks for the repeated shape to be rewritten.

8. main.tex:802, "on the two tasks evaluated here: SR-versus-AF rhythm separation in PTB-XL and N-vs-V beat morphology in MIT-BIH". This repeats main.tex:714, "it is a rule for the two tasks evaluated here: SR-versus-AF rhythm separation on PTB-XL and N-vs-V beat morphology on MIT-BIH". The rule asks for the repeated shape to be rewritten.

### prose standard / D. Structure / No synonym cycling

9. One concept is called both "ordering" and "ranking". The rule asks for one term per concept, used every time.
   - main.tex:75, "The same ordering holds on a MIT-BIH beat-morphology task."
   - "ordering" also appears at 422, 460, 753 and 785. "ranking" appears at 78 and 132. The passages at 78, 132 and 753 are given in finding 1.
   - main.tex:587, "The ordering replicates on a different dataset and a different task type"
     Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.

10. One operation is called "conditioning", "conditioners", "scaling", "feature scaler" and "scaler dependence". The rule asks for one term per concept.
    - main.tex:77, "the feature scaler materially changes the outcome"
      Also: references/rules.md / Common style errors / Vague phrase. The rule asks for the specific claim, here the numbers given at 576 to 580, in place of "materially".
    - main.tex:142, "feature conditioning changes the result by a wide margin"
      Also: references/rules.md / Precision / Term defined at first use. "Conditioning" is never defined. What it means first becomes clear at 313.
    - main.tex:289, "Conditioning is fitted on the full representation matrix"
    - main.tex:313, "we sweep four conditioners (Yeo-Johnson power, standard, quantile, robust) and report power scaling as the default"
    - main.tex:576, "The feature scaler changes the outcome materially." The heading above it, at 574, calls the same thing "Conditioning". That heading is given in finding 27.
      Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
    - "scaler dependence" appears at 750 (given in finding 39) and "feature conditioning" at 809.

11. The property the hand-crafted features show under deployment stress has four names. The rule asks for one term per concept.
    - main.tex:80, "the cheap interpretable representation is the more deployable one"
      Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
    - main.tex:632, "The hand-crafted features are the most robust"
      Also: prose standard / A. Vocabulary / flagged term "robust". The rule asks for the most precise word. The sentence itself gives the measure, which is retaining 92% of centralized ARI.
    - main.tex:639, "the 16 hand-crafted features are the more predictable of the two under site heterogeneity"
    - main.tex:640, "Across both stressors the compact interpretable representation is the more dependable choice for privacy-preserving, multi-site phenotyping."
      Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says main.tex:639 again in shorter words.
      Also: references/rules.md / Precision / Term defined at first use. "phenotyping" appears here for the first time and is not defined.
      Also: references/rules.md / Hedging / Hedge where a claim is uncertain. The sentence generalizes from a simulation on one dataset without a hedge.

12. ECGFounder is called "the foundation embedding", "the embedding" and "the foundation model". The abstract introduces two foundation-model embeddings (main.tex:68), and main.tex:468 says each model is named. The rule asks for one term per concept.
    - main.tex:83, "overtaking the foundation embedding under imbalance while the embedding's centralized advantage erodes under federation"
    - main.tex:617, "Under imbalance the cheap features overtake the foundation embedding; under simulated federation the two means are close and the cheap features retain". The hand-crafted features are also renamed here, as "the cheap features".
      Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
    - main.tex:626, "The foundation embedding's balanced-data lead does not survive imbalance."
      Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says the paragraph's second sentence again (main.tex:617).
    - main.tex:663, "Non-IID heterogeneity erodes the foundation model's lead"

13. main.tex:104, "clustered whole 12-lead recordings. That pipeline flattened each strip into a long vector". One ECG is called a "recording" and a "strip" in adjacent sentences, and a "record" from main.tex:192 onward. The rule asks for one term per concept.
    Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence, "This study began as a re-examination of a master's project that clustered whole 12-lead recordings.", gives background. The paragraph's point comes later: the project's numbers were misleading, and its conclusion is the starting point here.

14. The arm defined as "conv-AE" at main.tex:227 is called "reconstruction-autoencoder" at main.tex:138, at main.tex:729 ("The raw and reconstruction-autoencoder pipelines, including the original project's design") and at main.tex:808. The rule asks for one term per concept.

15. The units of the federation are called "clients" in two places and "sites" everywhere else. The rule asks for one term per concept.
    - main.tex:144, "and with federated non-independent client splits"
      Also: references/rules.md / Precision / Term defined at first use. The non-IID split is first defined at main.tex:383 to 385.
    - main.tex:631, "Non-IID client heterogeneity degrades all representations, but unequally."
      Also: references/rules.md / Objectivity / Claims rest on evidence. The federated results table (main.tex:655) gives raw-flatten 0.000 in every setting, so not every representation degrades.

16. main.tex:588, "the 21-dimensional hand-crafted features cluster well". The same MIT-BIH arm is called "a 21-dimensional beat-morphology and RR-context feature set" at main.tex:259, and "beat-morphology" in the MIT-BIH table and its caption (main.tex:600, 605). Everywhere else, "hand-crafted features" names the 16 PTB-XL features. The rule asks for one term per concept.

17. The patient-grouped interval has three names. It is "a patient-grouped percentile bootstrap over the evaluation cohort" at main.tex:361, "Patient-bootstrap intervals" at main.tex:413 and "patient-grouped cohort bootstrap" at main.tex:450. The rule asks for one term per concept.

### prose standard / E. Sentence shapes / Restating closes

18. The final sentences of two paragraphs say the paragraph again in shorter words. The rule asks for them to be cut.
    - main.tex:84, "The representation, not the algorithm, governs label-free ECG structure." This repeats the abstract's opening, "whether clustering succeeds depends less on the algorithm than on how the signal is represented" (main.tex:62 to 64).
      Also: references/rules.md / Hedging / Hedge where a claim is uncertain. This is a generalization from two binary tasks, and main.tex:714 and 802 limit the same claim to those tasks.
      Also: prose standard / 0. Hard rules / Plain prose only. It is a punchy one-line summary built on a "not X, Y" contrast.
      Also: prose standard / 0. Hard rules / No repeated construction. The same "representation, not the algorithm" shape appears at 397 and 800 (finding 31).
    - main.tex:810, "Across the settings tested, the deciding choices were the representation and the evaluation protocol rather than the clustering algorithm". This repeats the paragraph's opening at main.tex:800 to 801.

### references/rules.md / Precision / Most specific term

19. main.tex:633, "ECGFounder's centralized advantage erodes from 0.885 to 0.612." The two numbers are ECGFounder's ARI, not its advantage. Its advantage over the hand-crafted features goes from 0.241 to 0.021. The rule asks for each thing to be named with the most specific term.

### references/rules.md / Precision / Term defined at first use

20. These technical terms are used before they are defined, or are never defined. The rule asks for a term to be defined where it first appears.
    - main.tex:106, "It reported high cluster purity and a silhouette score near 0.89". Purity is first defined at main.tex:171, and the silhouette is first explained at main.tex:175.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No citation is given for the master's project or its numbers.
    - main.tex:137, "patient-grouped". It is first defined at main.tex:204 to 205.
    - main.tex:139, "each bounded by a supervised ceiling". It is first defined at main.tex:307 to 311, and is also used before that at main.tex:184.
    - main.tex:141, "internal validity indices reward the degenerate collapse". Internal indices are first explained at main.tex:175.
    - main.tex:168, "which span the energy-only to definition-encoding spectrum". This is defined nowhere.
    - main.tex:194, "all records carrying an AF statement (AFIB or AFLT) as positives". AFIB and AFLT are not expanded, and nothing says that atrial flutter is counted as AF.
      Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The draft's reading rests on SR and AF differing "by definition in the regularity of the rhythm" (main.tex:133). The Limitations section does not say that flutter positives may not fit that definition.
    - main.tex:237, "and beat-template consistency". This feature is defined nowhere.
    - main.tex:776, "We evaluate one model per foundation family". "Foundation family" is not defined. Elsewhere the draft treats the foundation embeddings as one family that holds two models (main.tex:247, 755).

### references/rules.md / Objectivity / Claims rest on evidence

21. These claims are contradicted by the draft's own results. The rule asks for a claim to rest on evidence.
    - main.tex:74, "match a majority-class assignment despite supervised ceilings well above chance." The raw-flattening ceiling is 0.519 against a majority of 0.504, which main.tex:497 calls "barely above the 0.504 majority".
    - main.tex:264, "so that the same features transfer to the two-lead beats", and main.tex:728, "whereas the hand-crafted features transfer across lead sets". Main.tex:258 says "the rhythm features do not transfer to single beats", and MIT-BIH uses a different 21-dimensional set.
    - main.tex:488, "they do so for different reasons, one for want of label information in the space", and main.tex:496, "The raw pipeline carries almost no label information". A random forest on the raw features reaches 0.714 (main.tex:506).
      Also, at 496: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
    - main.tex:616, "Two stressors closer to deployment separate the representations more sharply than the balanced benchmark." Under non-IID federation, ECGFounder and the hand-crafted features are at 0.612 and 0.591, closer together than their centralized 0.885 and 0.644. Under imbalance, ECGFounder and HuBERT-ECG are at 0.063 and 0.061.
      Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
    - main.tex:730, "are not viable for label-free arrhythmia structure on either task: they are indistinguishable from predicting the majority class under all five clusterers". MIT-BIH is evaluated with three clusterers, and there the conv-AE reaches ARI 0.127 and the raw beat reaches 0.049 (main.tex:607 to 609).
    - main.tex:760, "They also sit at opposite ends of the clustering range measured here, 0.885 against 0.195". The measured range goes down to 0.000 (main.tex:428).
    - main.tex:775, "since upsampling can only discard information it cannot inflate the foundation model's lead". The same sentence reports a higher ARI after upsampling from 100 Hz (0.909) than at the native 500 Hz (0.896).
      Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The text rules out inflation instead of acknowledging what its own numbers show.

22. These claims are given without support, or rest on opinion. The rule asks for a claim to rest on evidence.
    - main.tex:97, "Most machine-learning work on the electrocardiogram (ECG) is supervised, but the clinically interesting questions are often unsupervised". No source is given.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No data, citation or example follows.
      Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point, that the representation dominates, comes only in its last sentence.
      Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" (main.tex:98) to be replaced with the number or the specific claim.
      Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 68 words, against about 120 to 200.
    - main.tex:101, "Whether that attempt succeeds is usually attributed to the clustering algorithm". No source is given.
      Also: prose standard / E. Sentence shapes / Passive voice. The people who make the attribution are relevant to the claim.
    - main.tex:125, "Those two gaps are exactly where a careful, honest benchmark adds value, because hand-crafted features remain the interpretable and inexpensive default in clinical signal processing, and MIT-BIH is the canonical morphology benchmark." This is opinion, and nothing supports "default" or "canonical".
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
      Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "a careful, honest benchmark" (main.tex:126) is a self-assessment.
    - main.tex:157, "Reconstruction autoencoders optimise signal energy rather than class structure, which makes them strong compressors but weak organisers of class geometry." No source is given.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
    - main.tex:470, "spectral clustering collapses where the nearest-neighbour affinity graph is poorly connected". The draft reports no measure of how well the graph is connected.
    - main.tex:580, "Robust scaling, a common default for physiological signals,". No source is given.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
    - main.tex:621, "isolating a 10\% minority cluster with a partitional method is intrinsically hard". No support is given.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
    - main.tex:637, "A deployment claim rests on the worst site draw rather than on the average one". This is opinion, given without support.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
    - main.tex:738, "both recur often enough in applied clustering to be worth stating plainly". No source is given.
      Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
      Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" to be replaced with the number or the specific claim.
      Also: prose standard / 0. Hard rules / No performative asides. "to be worth stating plainly" is a variant of "worth noting".

### references/rules.md / Objectivity / Limitations and alternative interpretations

23. The text does not acknowledge these limitations or alternative readings. The rule asks for them to be acknowledged.
    - main.tex:250, "HuBERT-ECG receives the first \mbox{5\,s} at \mbox{100\,Hz}". HuBERT-ECG sees half of each 10 s strip, and so fewer RR intervals, while every other arm sees the full strip. Its weak clustering is explained only as off-axis geometry (main.tex:526 to 529) or as organisation by dataset (main.tex:466 to 468). The shorter input window is not given as an alternative explanation.
    - main.tex:362, "the partitions are held fixed and the cohort is resampled with replacement at the patient level". The intervals do not refit the clustering on each resample. The text does not say what this leaves out of the uncertainty that every interval in the Results carries.
    - main.tex:386, "Conditioning is fitted once on the full representation matrix before partitioning, so the federation concerns the clustering step alone." In the federated simulation, conditioning uses statistics pooled across all sites. The draft shows that the scaler changes the results by a wide margin (main.tex:576 to 580), and the Limitations section (main.tex:787 to 796) does not raise this.
    - main.tex:619, "At the natural-like 9:1 SR:AF ratio (majority 0.90), every representation's ARI falls". The reversal is shown for one ratio and one scaler, and the clusterer is not named. It is then stated in general terms at main.tex:626.
      Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words and chains a general fall, its cause, a retention result and an overtaking result.

### references/rules.md / Hedging / Hedge where a claim is uncertain

24. These interpretations have alternative explanations and are stated without a hedge. The rule asks for a hedge.
    - main.tex:266, "so the lead set cannot account for the raw arm's chance-level clustering". The larger twelve-lead input also makes the raw vector 1992-dimensional, which is a way the lead set could still bear on Euclidean clustering.
    - main.tex:486, "no fixed offset falls on the same part of the cardiac cycle in two recordings". This is given as the cause of the raw arm's failure. In the same section, a random forest on the same features reaches 0.714 (main.tex:506).

### references/rules.md / Paragraphs / Evidence followed by what it means

25. This evidence is not followed by an interpretation that connects it to the paragraph's claim. The rule asks for that interpretation.
    - main.tex:508, "The same probe gives 0.951 on the hand-crafted features, 0.983 on ECGFounder and 0.825 on HuBERT-ECG. On ECGFounder the two probes agree to three decimals". Only the HuBERT-ECG value is interpreted.
    - main.tex:624, "HuBERT-ECG reaches the same ARI as ECGFounder (0.061 [0.053, 0.069]) at a lower AMI (0.044 [0.037, 0.050])". No interpretation follows.

### references/rules.md / Reader's path / Clarity test

26. main.tex:734, the paragraph that opens "The result also reframes the original master's project honestly." Its content is already in the draft. The original conclusion is called correct at main.tex:109 to 111. Purity without a baseline and silhouette on a collapsed solution are identified as the artefacts at main.tex:107 to 109 and 555 to 556. The only new content is the unsupported claim in finding 22. The rule asks for a paragraph whose removal loses nothing to be deleted.
    Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "reframes ... honestly" is a self-assessment.
    Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 66 words, against about 120 to 200.

## Style

### prose standard / 0. Hard rules / Plain prose only

27. These headings editorialise. The rule asks for no headline-style headings that editorialise.
    - main.tex:397, "Representation, not algorithm, governs clusterability". This is also a "not X, Y" contrast.
      Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.
      Also: prose standard / 0. Hard rules / No repeated construction. It has the same shape as main.tex:84 and 800 (finding 31).
    - main.tex:548, "The silhouette trap"
      Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. This is a cutesy section title.
    - main.tex:574, "Conditioning matters"
      Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.

28. main.tex:582, "Conditioning should be reported and swept, not assumed." This is a punchy one-line summary built on a "not X, Y" contrast. The rule asks for the fact to be stated without it.

### prose standard / 0. Hard rules / Headings are labels, not sentences

29. These headings are sentences, not labels. The rule asks for a label.
    - main.tex:51, "Which representation clusters? A chance-corrected benchmark of ECG". The title opens with a question.
    - main.tex:493, "Separability is not clusterability"

### prose standard / 0. Hard rules / No repeated construction

30. All four representation entries close on the same sentence opening, "The principle is that". The rule asks for a shape that recurs across entries to be rewritten.
    - main.tex:224, "The principle is that the sample amplitudes are themselves the features"
      Also: references/rules.md / Concision / One idea per sentence. The same sentence also gives the separate reason for the lead set, "all twelve leads enter because this arm reproduces the originating pipeline".
    - main.tex:231, "The principle is that a reconstruction objective compresses whatever carries signal energy"
    - main.tex:245, "The principle is that the AF signature is RR irregularity together with P-wave absence"
    - main.tex:254, "The principle is that large-scale pretraining has already fixed an ECG feature space"

31. main.tex:800, "the representation, not the clustering algorithm, decides whether clustering works". The same "representation, not the algorithm" shape appears at main.tex:84 (finding 18) and main.tex:397 (finding 27). The rule asks for the repeated shape to be rewritten.

### prose standard / A. Vocabulary / banned filler

32. "simply" is used as filler at main.tex:107, "but the purity simply equalled the majority-class", and at main.tex:504, "simply does not lie along their dominant axes of variation". The rule asks for the word to be cut or replaced with the concrete fact.

### prose standard / A. Vocabulary / vague qualifiers

33. main.tex:174, "are near zero for such trivial solutions". The rule asks for the number or the specific claim. For the one-cluster solution, ARI and AMI are exactly zero.

### prose standard / A. Vocabulary / flagged terms

34. "robust" is used where the draft has a more precise measure, which is the share of centralized ARI retained. It appears at main.tex:82, "the hand-crafted features are the most robust", and at main.tex:144, "the 16 hand-crafted features are the most robust". The rule asks for the most precise word.

### prose standard / B. Punctuation / Semicolons

35. Running prose, with table rows excluded, has 33 semicolons in 6766 words. That is 4.9 per 1000 words, spread over 24 paragraphs, against a limit of 2. One example is main.tex:197, "so a presence-based rule is required; a confidence threshold would discard every SR record".

### prose standard / C. Throat-clearing and meta-commentary

36. These sentences describe what the text is about to do. The rule asks for such sentences to be cut.
    - main.tex:216, "Each entry states the leads it consumes, the array it receives, and the principle it encodes."
      Also: prose standard / D. Structure / Lists are introduced with a colon. The list at main.tex:218 follows a sentence that ends in a full stop.
    - main.tex:490, "Which of the two accounts for HuBERT-ECG is what the next subsection measures."

### prose standard / D. Structure / Vary paragraph length

37. The Results paragraphs at main.tex:550 ("Internal indices mislead here in a specific, reproducible way."), main.tex:576 and main.tex:587 come one after another at 94, 91 and 90 words. Only figure captions stand between them. The rule says uniform blocks are a template and asks for varied paragraph length.

### prose standard / D. Structure / Binary contrast ("not X, Y") at most twice per page

38. The Limitations section, one paragraph of 335 words, holds four binary contrasts. The first two are at main.tex:773, "rather than a full re-run", and main.tex:778, "rather than generalising". The other two go over the limit:
    - main.tex:780, "each chosen so that the class definition is unambiguous and a clustering failure can be charged to the representation rather than to label noise"
    - main.tex:787, "The federated study is a simulation on a single physical dataset, not a multi-institution deployment."
    The rule allows at most two per page.

### prose standard / D. Structure / Three or more list-shaped items in paragraph form become a list

39. These passages run three or more list-shaped items in paragraph form. The rule asks for them to become a list.
    - main.tex:137, "(i) A chance-corrected, patient-grouped, significance-tested clustering benchmark ... (ii) ... (iii) ... (iv)". These are four contributions.
    - main.tex:274, "The implementations are those of scikit-learn, run with ten $k$-means restarts per seed, Ward linkage on Euclidean distance, ... and a minimum cluster size of $n/50$ ... for HDBSCAN". These are five clusterer settings.
      Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words.
    - main.tex:297, "There $U$ is the partition by true class and $V$ the partition by cluster, $n$ is the number of records ...". These are the notation definitions.
    - main.tex:742, "Six things separate this study from the closest ECG foundation-model clustering benchmark". The six items follow in paragraph form.
      Also: prose standard / E. Sentence shapes / Stop-start fragments. Each item is a sentence fragment: main.tex:743, 745, 747, 748, 749 and 750.

### manuscript prose standard / Section D, Paragraphs

40. These paragraphs are far below the length of about 120 to 200 words. The rule asks for a paragraph that far outside that length to be split, or joined with its neighbour. The paragraphs at main.tex:97 and 734 are given in findings 22 and 26.
    - main.tex:122, "The most directly related work benchmarks several ECG foundation models": 72 words.
    - main.tex:207, "For generalization we use the MIT-BIH Arrhythmia Database": 63 words.
    - main.tex:258, "On MIT-BIH the rhythm features do not transfer to single beats": 54 words.
    - main.tex:263, "The two lead sets are deliberate and answer to different constraints.": 55 words.
    - main.tex:399, "Table~\ref{tab:main} and Fig.~\ref{fig:heatmap} summarise the PTB-XL benchmark.": 67 words.
      Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence points to a table and a figure. The main point, that the representation decides the outcome, comes later.

41. These paragraphs cover more than one idea, or run far past 200 words. The rule asks for them to be split.
    - main.tex:271, "Each representation is clustered with $k$-means": 583 words. It covers the clusterer settings, conv-AE training, foundation-model inference, the metric notation, the supervised ceiling, the seeds, the conditioner sweep, the K sweep and the imbalanced subsample.
      Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Methodology.
    - main.tex:448, "Uncertainty enters at two levels and they are of different size." The paragraph covers the significance of the contrasts and, separately, the ordering across K (main.tex:460).
      Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph is mainly about the Wilcoxon contrasts, their effect sizes and the ordering across K.
    - main.tex:714, "The practical reading is a decision rule": 236 words. It covers the decision rule, the cost comparison, the lead constraint and the non-viability of the raw and autoencoder pipelines.
    - main.tex:771, "ECGFounder expects 500\,Hz input": 335 words. It covers the 500 Hz upsampling, the choice of foundation models, the binary tasks, the MIT-BIH omission and the federated simulation.

### prose standard / E. Sentence shapes / Stop-start fragments

42. These fragments are labels that depend on the sentence after them. The rule asks for them to be joined to it.
    - main.tex:619, "First, class imbalance."
    - main.tex:629, "Second, federation."
      Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point is that non-IID federation degrades the representations unequally, and it comes later.

### prose standard / E. Sentence shapes / Cold opens

43. main.tex:515, "That reading is testable and we test it out of fold." "That reading" has no clear antecedent, because the previous paragraph ends on probe linearity. The rule asks for the prior subject to be carried forward.
    Also: references/rules.md / Paragraphs / First sentence states the point. The point, that the class information is present but lies off the dominant axes, comes later.

### prose standard / E. Sentence shapes / Sentence length

44. main.tex:240, "Lead II is the standard rhythm lead, ... where a twelve-lead definition would not apply." The sentence has 55 words and chains three reasons that do not depend on each other. The rule asks for sentences under roughly 20 words unless the mechanism needs more.

### manuscript prose standard / G. The project's own software / No software wording

45. These passages name code identifiers. The rule asks for the text to name none.
    - main.tex:199, "Records are read from the \mbox{100\,Hz} distribution of the database with \texttt{wfdb.rdsamp} and cast once to a \texttt{float32} array"
    - main.tex:222, "Input: all twelve leads, \texttt{float32}, 1000 by 12."
    - main.tex:230, "Input: all twelve leads, \texttt{float32}, resampled to 12 by 2500"
    - main.tex:239, "Input: lead II alone, \texttt{float32}, 1000 samples, reduced to a 16-dimensional \texttt{float32} vector."
    - main.tex:250, "Input: all twelve leads, \texttt{float32}."

46. These passages use the wording of software operations, or name a run or a process, about the project's own work. The rule asks for none.
    - main.tex:201, "No filtering, resampling or rescaling is applied at load time"
    - main.tex:285, "The two foundation models are used in evaluation mode with gradients disabled"
    - main.tex:388, "A run is fifteen aggregation rounds of three local Lloyd iterations per site"
    - main.tex:689, "the process that ran the inference, each representation measured in its own process". The finding placed this at 688.
    - main.tex:771, "because bulk streaming of the 500\,Hz records was rate-limited at the source"
    - main.tex:773, "A consistency check on a 300-record subset, rather than a full re-run,"
    - main.tex:785, "cached embeddings"

### references/rules.md / Formality / No colloquial words

47. main.tex:471, "rather than tune them away". The rule asks for formal, academic vocabulary.

### references/rules.md / Common style errors / Vague phrase

48. main.tex:551, "while every point but a handful". The rule asks for the specific claim, here the number of points outside the large cluster.

### references/rules.md / Common style errors / Tense per section

49. These passages report in the present tense where the section's row asks for the past tense.
    - main.tex:180, "reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL and finds that some models cluster by clinical label". This is a literature review reporting results.
    - main.tex:191, "We use PTB-XL \cite{ptbxl2020}, a public 12-lead database". Methodology.
    - main.tex:380, "To probe deployment under data siloing we use standard federated $k$-means". Methodology.
    - main.tex:400, "ECGFounder clusters best (ARI up to 0.885 with $k$-means), the hand-crafted features are competitive". Results.
    - main.tex:550, "Raw flattening with agglomerative clustering attains a silhouette of 0.81". Results.
    - main.tex:629, "every representation retains essentially its centralized ARI". Results.
    - main.tex:677, "The two are ordered against each other: ECGFounder, which clusters best, is the most expensive per record". Results.

---

Tokens: sentence agent 102,480; section agent 79,640; whole-draft agent 93,441; checking agent 172,131; total 447,692.
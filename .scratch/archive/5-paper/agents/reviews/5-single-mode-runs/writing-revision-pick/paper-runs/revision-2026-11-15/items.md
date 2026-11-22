# Items

Source: the `/writing` report named in the row Instructions of `config.md`, findings 1 to 49, turned into items W1 to W49, one item per finding, none merged or dropped. The manuscript is `main.tex` as it stands at the start of this run; it inputs no other file.

How each item reads:

- **Comment**: the finding quoted as the report gives it.
- **Places**: each place the finding names, checked against `main.tex` as it stands. "Stands" means the quoted words are at that line; where the quote continues onto the next line or lines, the range is given. A line that has moved or a quote that does not stand is said so.
- **Section**: the section of the manuscript the item concerns.
- **What the rule asks**: from the prose standard (`docs/dev/prose-standard.md`), the manuscript prose standard, or the academic writing rules the report cites as `references/rules.md`.
- **Severity**: Critical, Major, Minor or Suggestion, as the peer reviewer page defines them.
- **Suggested fix**: the approach, in the manuscript's own terms. The draft writer decides whether to apply the item and states in its report each item it leaves unchanged and why.
- **Calls for**: what the item needs beyond a text change: a new reference, a figure change, a number computed from saved results, or none. `config.md` allows none of the three (rows New references, Numbers from saved results and Figure changes: no). Where an item would need one, the item says so and gives the part of it a text change can meet. A fact the manuscript does not hold and only the authors can give is marked "needs the user".

## Summary

| Item | Rule | Section | Severity | Calls for |
|---|---|---|---|---|
| W1 | No repeated construction | Abstract, 1, 5 | Minor | none |
| W2 | No repeated construction | 1, 5 | Minor | none |
| W3 | No repeated construction | 1, 3.4, 5 | Minor | none |
| W4 | No repeated construction | 1, 4.1, 5, 6 | Minor | none |
| W5 | No repeated construction | 3.2, 5, 6 | Minor | none |
| W6 | No repeated construction | 3.3, 4.1 | Minor | none |
| W7 | No repeated construction | 4.7, 5 | Minor | none |
| W8 | No repeated construction | 5, 7 | Minor | none |
| W9 | No synonym cycling | Abstract, 1, 4, 5, 6 | Minor | none |
| W10 | No synonym cycling | Abstract, 1, 3.3, 4.4, 5, 7 | Minor | none |
| W11 | No synonym cycling | Abstract, 4.6 | Major | none |
| W12 | No synonym cycling | Abstract, 4.6 | Major | none |
| W13 | No synonym cycling | 1 | Minor | none |
| W14 | No synonym cycling | 1, 5, 7 | Minor | none |
| W15 | No synonym cycling | 1, 4.6 | Major | figure change for the figure's own wording (not allowed); the text change needs none |
| W16 | No synonym cycling | 3.2, 4.5 | Minor | none |
| W17 | No synonym cycling | 3.3, 4.1 | Minor | none, if the text takes the figure's term |
| W18 | Restating closes | Abstract, 7 | Major | none |
| W19 | Most specific term | 4.6 | Major | none |
| W20 | Term defined at first use | 1, 2, 3.1, 3.2, 6 | Major | new reference at 106 if met by a citation (not allowed); needs the user for one definition |
| W21 | Claims rest on evidence | Abstract, 3.2, 4.1, 4.2, 4.6, 5, 6 | Major | none |
| W22 | Claims rest on evidence | 1, 2, 4.1, 4.4, 4.6, 5 | Major | new references if met by citations (not allowed); a number from saved results at 470 (not allowed) |
| W23 | Limitations and alternative interpretations | 3.2, 3.3, 3.4, 4.6, 6 | Major | none for the acknowledgment; needs the user for the clusterer at 619 |
| W24 | Hedge where a claim is uncertain | 3.2, 4.1 | Minor | none |
| W25 | Evidence followed by what it means | 4.2, 4.6 | Minor | none |
| W26 | Clarity test | 5 | Minor | none |
| W27 | Plain prose only (headings) | 4.1, 4.3, 4.4 | Minor | figure change for the figure title at 4.3 (not allowed); the headings need none |
| W28 | Plain prose only | 4.4 | Minor | none |
| W29 | Headings are labels | Title, 4.2 | Minor | figure change for the figure title at 4.2 (not allowed); the headings need none |
| W30 | No repeated construction | 3.2 | Minor | none |
| W31 | No repeated construction | 7 | Minor | none |
| W32 | Banned filler | 1, 4.2 | Minor | none |
| W33 | Vague qualifiers | 2 | Minor | none |
| W34 | Flagged terms | Abstract, 1 | Minor | none |
| W35 | Semicolons | whole text | Minor | none |
| W36 | Throat-clearing and meta-commentary | 3.2, 4.1 | Minor | none |
| W37 | Vary paragraph length | 4.3, 4.4, 4.5 | Minor | none |
| W38 | Binary contrast at most twice per page | 6 | Minor | none |
| W39 | List-shaped items become a list | 1, 3.3, 5 | Minor | none |
| W40 | Paragraph length (manuscript) | 1, 3.1, 3.2, 4.1 | Minor | none |
| W41 | Paragraph covers one idea (manuscript) | 3.3, 4.1, 5, 6 | Minor | none |
| W42 | Stop-start fragments | 4.6 | Minor | none |
| W43 | Cold opens | 4.2 | Minor | none |
| W44 | Sentence length | 3.2 | Minor | none |
| W45 | No software wording | 3.1, 3.2 | Major | none |
| W46 | No software wording | 3.1, 3.3, 3.4, 4.7, 6 | Major | none |
| W47 | No colloquial words | 4.1 | Minor | none |
| W48 | Vague phrase | 4.3 | Minor | a number from saved results if met by the count (not allowed) |
| W49 | Tense per section | 2, 3.1, 3.4, 4.1, 4.3, 4.6, 4.7 | Minor | none |

Section numbers follow the order of `main.tex`: 1 Introduction (95-149), 2 Related work (151-185), 3 Methods with 3.1 Data and cohorts (189-212), 3.2 Representations (214-267), 3.3 Clustering and evaluation (269-376), 3.4 Federated robustness (378-393), 4 Results with 4.1 Representation, not algorithm, governs clusterability (397-491), 4.2 Separability is not clusterability (493-546), 4.3 The silhouette trap (548-572), 4.4 Conditioning matters (574-583), 4.5 Generalization to MIT-BIH beat morphology (585-612), 4.6 Robustness under deployment stress (614-671), 4.7 Deployment cost (674-710), 5 Discussion (712-767), 6 Limitations (769-796), 7 Conclusion (798-813).

## Quote check

Every passage the report quotes stands in `main.tex` as it is. These places differ from the report's account:

- W1: the synonym-cycling sub-point says the passages at 78, 132 and 753 call the concept "ranking". Line 753 says "ordering"; the word "ranking" in that paragraph is at 752 ("balanced-data ranking").
- W9: "ranking" also stands at 752 ("balanced-data ranking") and "higher-ranked" at 459; the finding lists neither.
- W18: the quoted opening of the abstract is on lines 63 to 64; the abstract begins at 62.
- W20: "patient-grouped" first appears at 69 and "supervised ceiling" at 71, both in the abstract, before the places the finding gives as first uses (137 and 139).
- W37: between the three paragraphs stand a figure with its caption and two subsection headings (574 and 585), not only figure captions.
- W38: "rather than generalising" is on line 779; the report gives 778, where the sentence that holds it runs (776 to 779).
- W46: the report's own correction holds: the passage it places at 689 starts on 689, not 688.

## Items

### W1

- **Comment**:
  > 1. The draft says in three places that the ranking is not the contribution. The rule says a sentence shape that comes back across sections is a template and should be rewritten.
  >    - main.tex:78, "The ranking is largely expected, since SR and AF differ by definition in rhythm regularity; the contribution is the chance-corrected controls"
  >    - main.tex:132, "The resulting ranking is not the contribution."
  >    - main.tex:752, "None of these is a new method, and the ordering of the representations is not itself the result."
  >    Also, at 78, 132 and 753: prose standard / D. Structure / No synonym cycling. These passages call the concept "ranking", while finding 9 calls it "ordering".
  >    Also, at 752: prose standard / E. Sentence shapes / Restating closes. This last sentence of the paragraph says again what the paragraph opens with, "We claim no methodological novelty." (main.tex:740).
- **Rule**: prose standard / 0. Hard rules / No repeated construction. Also D. Structure / No synonym cycling, and E. Sentence shapes / Restating closes.
- **Places**: 78 stands (78 to 79). 132 stands (132 to 133). 752 stands (752 to 753). The synonym sub-point: 78 and 132 say "ranking"; 753 says "ordering", and "ranking" is at 752 (see Quote check). 740 stands; the paragraph runs 740 to 753 and 752 to 753 is its last sentence.
- **Section**: Abstract; 1 Introduction; 5 Discussion.
- **What the rule asks**: a sentence shape that recurs across sections is rewritten; one term per concept, repeated; a final sentence that says the paragraph again in shorter words is cut.
- **Severity**: Minor.
- **Suggested fix**: say once, in the Introduction (132 to 136), that the order of the representations follows from the class definitions and is not the contribution. In the abstract (78 to 81) state the contribution directly without the disclaimer. Cut the closing sentence of the Discussion paragraph at 752 to 753. Use the one term chosen under W9.
- **Calls for**: none.

### W2

- **Comment**:
  > 2. main.tex:721, "overtake it under class imbalance, and hold far more of their clustering ARI under site heterogeneity". This repeats the contributions sentence at main.tex:145, "overtaking the foundation embedding under imbalance and holding far more of their clustering ARI under site heterogeneity". The rule asks for the repeated shape to be rewritten.
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 721 stands (721 to 722). 145 stands (145 to 146).
- **Section**: 1 Introduction; 5 Discussion.
- **What the rule asks**: a sentence shape that recurs across sections is rewritten.
- **Severity**: Minor.
- **Suggested fix**: keep the full statement in one of the two places and, in the other, state the result in a different form, for example by the retention values of the federated results table (0.92 against 0.69) and the imbalance ARIs (0.265 against 0.063), which the Results already give.
- **Calls for**: none.

### W3

- **Comment**:
  > 3. The statement that the study proposes no new method comes back in several places. The rule asks for the repeated shape to be rewritten.
  >    - main.tex:147, "We do not propose a new method"
  >    - main.tex:381, "we do not propose a new federated method"
  >    - main.tex:740, "We claim no methodological novelty."
  >      Also: references/rules.md / Paragraphs / First sentence states the point. The rule asks the first sentence to state the paragraph's main point. Most of this paragraph sets out what separates this study from the closest benchmark.
  >    - main.tex:752, "None of these is a new method". This sentence is given in finding 1.
- **Rule**: prose standard / 0. Hard rules / No repeated construction. Also academic writing rules / Paragraphs / First sentence states the point.
- **Places**: 147 stands (147 to 148). 381 stands (381 to 382). 740 stands; its paragraph runs 740 to 753 and from 742 sets out the six differences from the closest benchmark. 752 stands (752 to 753).
- **Section**: 1 Introduction; 3.4 Federated robustness; 5 Discussion.
- **What the rule asks**: a recurring sentence shape is rewritten; a paragraph's first sentence states its main point.
- **Severity**: Minor.
- **Suggested fix**: state once that the study proposes no new method, in the Introduction (147 to 149) or in the Discussion. At 381 keep the citation of the standard federated procedure without the disclaimer. Open the Discussion paragraph at 740 with its main point, what separates this study from the closest benchmark; place the statement that the components are existing tools after it or drop it if the Introduction keeps it. 752 is handled under W1.
- **Calls for**: none.

### W4

- **Comment**:
  > 4. The sentence that limits the claims to the two models tested comes back in four places. The rule asks for the repeated shape to be rewritten.
  >    - main.tex:148, "we scope every foundation-model statement to the two models we test"
  >    - main.tex:468, "We therefore name each model and do not generalise to foundation models as a class"
  >    - main.tex:764, "none of it extends to ECG foundation models as a class"
  >    - main.tex:778, "which is why we name the two we test rather than generalising"
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 148 stands (148 to 149). 468 stands (468 to 469). 764 stands (764 to 765). 778 stands (778 to 779).
- **Section**: 1 Introduction; 4.1; 5 Discussion; 6 Limitations.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: give the scope to the two models in full once, in the Discussion paragraph at 755 to 767, which states the reasons for the choice. At 148, 468 and 778 remove the restatement or reduce it to a reference to that paragraph.
- **Calls for**: none.

### W5

- **Comment**:
  > 5. The statement that the foundation models are tied to the 12-lead format appears three times. The rule asks for the repeated shape to be rewritten.
  >    - main.tex:261, "such models are tied to the 12-lead strip format"
  >    - main.tex:727, "are tied to the 12-lead strip format and cannot embed the 2-lead MIT-BIH beats"
  >    - main.tex:786, "The MIT-BIH arm omits the foundation models because they are tied to the 12-lead strip format."
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 261 stands. 727 stands (727 to 728). 786 stands (786 to 787).
- **Section**: 3.2 Representations; 5 Discussion; 6 Limitations.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: give the reason once, in 3.2 (258 to 261), and in the Discussion and Limitations state the consequence (no foundation-model arm on MIT-BIH) without repeating the sentence.
- **Calls for**: none.

### W6

- **Comment**:
  > 6. main.tex:455, "That floor is reached by any contrast in which all ten seeds move the same way, so the p-value orders none of the three". This repeats the Methods sentence at main.tex:371, "the two-sided p-value is pinned at its floor of 0.002 as soon as every seed moves the same way, so it separates none of the contrasts". The rule asks for the repeated shape to be rewritten.
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 455 stands (455 to 457). 371 stands (371 to 372).
- **Section**: 3.3 Clustering and evaluation; 4.1.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: keep the explanation of the p-value floor in the Methods (370 to 376). In the Results give the p-value and the two effect sizes and refer to the Methods for why the p-value does not separate the contrasts.
- **Calls for**: none.

### W7

- **Comment**:
  > 7. main.tex:723, "The hand-crafted extraction is fifteen times cheaper per record than ECGFounder, holds about a third of the resident memory and loads no learned parameters at all". This repeats main.tex:678, "fifteen times the hand-crafted extraction ... which carries no learned parameters at all". The rule asks for the repeated shape to be rewritten.
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 723 stands (723 to 724). 678 stands; the elided quote runs 678 to 681.
- **Section**: 4.7 Deployment cost; 5 Discussion.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: give the cost comparison in full once, in 4.7 with the cost table. In the Discussion state what the cost means for the decision rule and refer to the table, without repeating the three measures.
- **Calls for**: none.

### W8

- **Comment**:
  > 8. main.tex:802, "on the two tasks evaluated here: SR-versus-AF rhythm separation in PTB-XL and N-vs-V beat morphology in MIT-BIH". This repeats main.tex:714, "it is a rule for the two tasks evaluated here: SR-versus-AF rhythm separation on PTB-XL and N-vs-V beat morphology on MIT-BIH". The rule asks for the repeated shape to be rewritten.
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 802 stands (802 to 803). 714 stands (714 to 715).
- **Section**: 5 Discussion; 7 Conclusion.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: name the two tasks in full in one of the two places; in the other, scope the statement to "the two tasks" or to the datasets without repeating the colon list.
- **Calls for**: none.

### W9

- **Comment**:
  > 9. One concept is called both "ordering" and "ranking". The rule asks for one term per concept, used every time.
  >    - main.tex:75, "The same ordering holds on a MIT-BIH beat-morphology task."
  >    - "ordering" also appears at 422, 460, 753 and 785. "ranking" appears at 78 and 132. The passages at 78, 132 and 753 are given in finding 1.
  >    - main.tex:587, "The ordering replicates on a different dataset and a different task type"
  >      Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
- **Rule**: prose standard / D. Structure / No synonym cycling. Also academic writing rules / Common style errors / Tense per section.
- **Places**: 75 stands. "ordering" stands at 422, 460, 753 and 785. "ranking" stands at 78 and 132; a search of `main.tex` also finds "ranking" at 752 and "higher-ranked" at 459, which the finding does not list. 587 stands.
- **Section**: Abstract; 1 Introduction; 4.1; 4.5; 5 Discussion; 6 Limitations.
- **What the rule asks**: one term per concept, used every time; past tense in Results.
- **Severity**: Minor.
- **Suggested fix**: choose one term for the order of the representations by clustering ARI and use it at 75, 78, 132, 422, 459, 460, 587, 752, 753 and 785. Put the sentence at 587 in the past tense.
- **Calls for**: none.

### W10

- **Comment**:
  > 10. One operation is called "conditioning", "conditioners", "scaling", "feature scaler" and "scaler dependence". The rule asks for one term per concept.
  >     - main.tex:77, "the feature scaler materially changes the outcome"
  >       Also: references/rules.md / Common style errors / Vague phrase. The rule asks for the specific claim, here the numbers given at 576 to 580, in place of "materially".
  >     - main.tex:142, "feature conditioning changes the result by a wide margin"
  >       Also: references/rules.md / Precision / Term defined at first use. "Conditioning" is never defined. What it means first becomes clear at 313.
  >     - main.tex:289, "Conditioning is fitted on the full representation matrix"
  >     - main.tex:313, "we sweep four conditioners (Yeo-Johnson power, standard, quantile, robust) and report power scaling as the default"
  >     - main.tex:576, "The feature scaler changes the outcome materially." The heading above it, at 574, calls the same thing "Conditioning". That heading is given in finding 27.
  >       Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  >     - "scaler dependence" appears at 750 (given in finding 39) and "feature conditioning" at 809.
- **Rule**: prose standard / D. Structure / No synonym cycling. Also academic writing rules / Common style errors / Vague phrase; Precision / Term defined at first use; Common style errors / Tense per section.
- **Places**: 77 stands (77 to 78). 142 stands. 289 stands. 313 stands (313 to 314). 576 stands; the heading at 574 stands. 750 and 809 stand. A search of `main.tex` finds the same concept also at 291 ("before conditioning"), 386 (W23) and 582 (W28).
- **Section**: Abstract; 1 Introduction; 3.3; 4.4; 5 Discussion; 7 Conclusion.
- **What the rule asks**: one term per concept; the specific claim in place of a vague phrase; a term defined at first use; past tense in Results.
- **Severity**: Minor.
- **Suggested fix**: choose one term for the per-feature transformation applied before clustering, define it at its first use in the Introduction (142), and use it at 77, 142, 289, 291, 313, 386, 574, 576, 582, 750 and 809. Replace "materially" at 77 and 576 with the ARI values at 577 to 580 or a statement of their size. Put 576 in the past tense.
- **Calls for**: none.

### W11

- **Comment**:
  > 11. The property the hand-crafted features show under deployment stress has four names. The rule asks for one term per concept.
  >     - main.tex:80, "the cheap interpretable representation is the more deployable one"
  >       Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
  >     - main.tex:632, "The hand-crafted features are the most robust"
  >       Also: prose standard / A. Vocabulary / flagged term "robust". The rule asks for the most precise word. The sentence itself gives the measure, which is retaining 92% of centralized ARI.
  >     - main.tex:639, "the 16 hand-crafted features are the more predictable of the two under site heterogeneity"
  >     - main.tex:640, "Across both stressors the compact interpretable representation is the more dependable choice for privacy-preserving, multi-site phenotyping."
  >       Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says main.tex:639 again in shorter words.
  >       Also: references/rules.md / Precision / Term defined at first use. "phenotyping" appears here for the first time and is not defined.
  >       Also: references/rules.md / Hedging / Hedge where a claim is uncertain. The sentence generalizes from a simulation on one dataset without a hedge.
- **Rule**: prose standard / D. Structure / No synonym cycling. Also: No colloquial words; A. Vocabulary / flagged terms; E. Restating closes; Term defined at first use; Hedge where a claim is uncertain.
- **Places**: 80 stands (80 to 81). 632 stands; the 92% is at 633. 639 stands (639 to 640). 640 stands (640 to 641). A search of `main.tex` finds "phenotyping" only at 641.
- **Section**: Abstract; 4.6.
- **What the rule asks**: one term per concept; formal vocabulary; the most precise word in place of "robust"; a restating close cut; a term defined at first use; a hedge on a generalization from a limited sample.
- **Severity**: Major, because the closing sentence at 640 to 641 generalizes from a simulation on one dataset without a hedge.
- **Suggested fix**: name the property by what was measured (the share of centralized ARI retained, and the worst site partition) and use that one term at 80, 632 and 639. Replace "cheap" by the cost the cost table measures. Cut the sentence at 640 to 641; if a closing statement is kept, scope it to the simulated setting on PTB-XL and drop or define "phenotyping".
- **Calls for**: none.

### W12

- **Comment**:
  > 12. ECGFounder is called "the foundation embedding", "the embedding" and "the foundation model". The abstract introduces two foundation-model embeddings (main.tex:68), and main.tex:468 says each model is named. The rule asks for one term per concept.
  >     - main.tex:83, "overtaking the foundation embedding under imbalance while the embedding's centralized advantage erodes under federation"
  >     - main.tex:617, "Under imbalance the cheap features overtake the foundation embedding; under simulated federation the two means are close and the cheap features retain". The hand-crafted features are also renamed here, as "the cheap features".
  >       Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
  >     - main.tex:626, "The foundation embedding's balanced-data lead does not survive imbalance."
  >       Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says the paragraph's second sentence again (main.tex:617).
  >     - main.tex:663, "Non-IID heterogeneity erodes the foundation model's lead"
- **Rule**: prose standard / D. Structure / No synonym cycling. Also No colloquial words; E. Restating closes.
- **Places**: 68 stands. 468 stands (468 to 469). 83 stands (83 to 84). 617 stands (617 to 618). 626 stands (626 to 627); the paragraph runs 616 to 627 and its second sentence starts at 617. 663 stands (663 to 664), in the caption of the federated figure.
- **Section**: Abstract; 4.6.
- **What the rule asks**: one term per concept; formal vocabulary; a restating close cut.
- **Severity**: Major, because with two foundation models in the study "the foundation embedding" and "the foundation model" leave the reader unsure which model is meant.
- **Suggested fix**: write "ECGFounder" at 83, 617, 626 and 663. Use one name for the hand-crafted features at 617 to 618 in place of "the cheap features". Cut the closing sentence at 626 to 627.
- **Calls for**: none. The caption at 663 is text in `main.tex`.

### W13

- **Comment**:
  > 13. main.tex:104, "clustered whole 12-lead recordings. That pipeline flattened each strip into a long vector". One ECG is called a "recording" and a "strip" in adjacent sentences, and a "record" from main.tex:192 onward. The rule asks for one term per concept.
  >     Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence, "This study began as a re-examination of a master's project that clustered whole 12-lead recordings.", gives background. The paragraph's point comes later: the project's numbers were misleading, and its conclusion is the starting point here.
- **Rule**: prose standard / D. Structure / No synonym cycling. Also Paragraphs / First sentence states the point.
- **Places**: 104 stands (104 to 105). "records" stands at 192. The first sentence stands (104 to 105). "recordings" for an ECG of the study's own cohorts also stands at 100 and 487; at 165, 760 and 804 it names the pretraining corpora of the foundation models.
- **Section**: 1 Introduction.
- **What the rule asks**: one term per concept; the first sentence states the paragraph's main point.
- **Severity**: Minor.
- **Suggested fix**: use "record", the term of the Methods and Results, for one ECG of the cohorts, at 100, 104 to 105 and 487; keep "strip" only if it is defined once as the 10 s signal of a record. Open the paragraph at 104 with its point: the original project's numbers were misleading and its conclusion is the starting point of this study.
- **Calls for**: none.

### W14

- **Comment**:
  > 14. The arm defined as "conv-AE" at main.tex:227 is called "reconstruction-autoencoder" at main.tex:138, at main.tex:729 ("The raw and reconstruction-autoencoder pipelines, including the original project's design") and at main.tex:808. The rule asks for one term per concept.
- **Rule**: prose standard / D. Structure / No synonym cycling.
- **Places**: 227 stands. 138 stands. 729 stands (729 to 730). 808 stands. The abstract (66 to 67) names the arm "a convolutional reconstruction autoencoder".
- **Section**: 1 Introduction; 5 Discussion; 7 Conclusion.
- **What the rule asks**: one term per concept.
- **Severity**: Minor.
- **Suggested fix**: use "conv-AE" at 138, 729 and 808, with the full name and the abbreviation at its first use in the Introduction. The figure legends already read "conv-AE".
- **Calls for**: none.

### W15

- **Comment**:
  > 15. The units of the federation are called "clients" in two places and "sites" everywhere else. The rule asks for one term per concept.
  >     - main.tex:144, "and with federated non-independent client splits"
  >       Also: references/rules.md / Precision / Term defined at first use. The non-IID split is first defined at main.tex:383 to 385.
  >     - main.tex:631, "Non-IID client heterogeneity degrades all representations, but unequally."
  >       Also: references/rules.md / Objectivity / Claims rest on evidence. The federated results table (main.tex:655) gives raw-flatten 0.000 in every setting, so not every representation degrades.
- **Rule**: prose standard / D. Structure / No synonym cycling. Also Term defined at first use; Claims rest on evidence.
- **Places**: 144 stands. The definition stands at 383 to 385. 631 stands (631 to 632). 655 stands. A search of `main.tex` finds "client" only at 144 and 631. The federated figure carries the title "Federated robustness, 10 clients, 10 seeds" in the figure itself.
- **Section**: 1 Introduction; 4.6.
- **What the rule asks**: one term per concept; a term defined at first use; a claim that rests on evidence.
- **Severity**: Major, because the claim at 631 is contradicted by the federated results table.
- **Suggested fix**: write "sites" at 144 and 631. At 144 describe the non-IID split in words or point to 3.4. At 631 limit the degradation to the representations whose centralized ARI is above zero, since raw-flatten is 0.000 in every column of the federated table.
- **Calls for**: the text change needs none. The word "clients" in the federated figure's own title would need a figure change to match, which `config.md` does not allow; the item's text places are met without it.

### W16

- **Comment**:
  > 16. main.tex:588, "the 21-dimensional hand-crafted features cluster well". The same MIT-BIH arm is called "a 21-dimensional beat-morphology and RR-context feature set" at main.tex:259, and "beat-morphology" in the MIT-BIH table and its caption (main.tex:600, 605). Everywhere else, "hand-crafted features" names the 16 PTB-XL features. The rule asks for one term per concept.
- **Rule**: prose standard / D. Structure / No synonym cycling.
- **Places**: 588 stands (588 to 589). 259 stands. 600 and 605 stand.
- **Section**: 3.2 Representations; 4.5.
- **What the rule asks**: one term per concept.
- **Severity**: Minor.
- **Suggested fix**: name the 21-dimensional MIT-BIH set at 588 by the term of 259, 600 and 605. The same naming bears on the claim at 728 that the hand-crafted features transfer across lead sets (W21).
- **Calls for**: none.

### W17

- **Comment**:
  > 17. The patient-grouped interval has three names. It is "a patient-grouped percentile bootstrap over the evaluation cohort" at main.tex:361, "Patient-bootstrap intervals" at main.tex:413 and "patient-grouped cohort bootstrap" at main.tex:450. The rule asks for one term per concept.
- **Rule**: prose standard / D. Structure / No synonym cycling.
- **Places**: 361 stands (361 to 362). 413 stands. 450 stands. The captions at 444 and 542 call it "patient-grouped bootstrap interval", and the separability figure's own title reads "95% patient-bootstrap interval".
- **Section**: 3.3 Clustering and evaluation; 4.1.
- **What the rule asks**: one term per concept.
- **Severity**: Minor.
- **Suggested fix**: define the interval once at 361 to 364 under one name and use that name at 413, 444, 450 and 542. Choosing the name the separability figure already prints ("patient-bootstrap interval") keeps the figure consistent without changing it.
- **Calls for**: none if the text takes the figure's term; another term would leave the figure's title out of line, and changing it is a figure change, which `config.md` does not allow.

### W18

- **Comment**:
  > 18. The final sentences of two paragraphs say the paragraph again in shorter words. The rule asks for them to be cut.
  >     - main.tex:84, "The representation, not the algorithm, governs label-free ECG structure." This repeats the abstract's opening, "whether clustering succeeds depends less on the algorithm than on how the signal is represented" (main.tex:62 to 64).
  >       Also: references/rules.md / Hedging / Hedge where a claim is uncertain. This is a generalization from two binary tasks, and main.tex:714 and 802 limit the same claim to those tasks.
  >       Also: prose standard / 0. Hard rules / Plain prose only. It is a punchy one-line summary built on a "not X, Y" contrast.
  >       Also: prose standard / 0. Hard rules / No repeated construction. The same "representation, not the algorithm" shape appears at 397 and 800 (finding 31).
  >     - main.tex:810, "Across the settings tested, the deciding choices were the representation and the evaluation protocol rather than the clustering algorithm". This repeats the paragraph's opening at main.tex:800 to 801.
- **Rule**: prose standard / E. Sentence shapes / Restating closes. Also Hedge where a claim is uncertain; 0. Plain prose only; 0. No repeated construction.
- **Places**: 84 stands (84 to 85). The abstract quote stands on 63 to 64. 714 and 802 stand. 397 and 800 stand. 810 stands (810 to 811). The sentence at 810 continues after its semicolon (811 to 813) with what remains open: multi-class cohorts, other foundation models and a real multi-institution federation. That part is not a restatement.
- **Section**: Abstract; 7 Conclusion.
- **What the rule asks**: a restating final sentence is cut; a generalization from a limited sample is hedged; no punchy one-line summary or "not X, Y" contrast; a recurring shape is rewritten.
- **Severity**: Major, because the abstract's last sentence states the result beyond the two tasks it was measured on.
- **Suggested fix**: cut the last sentence of the abstract (84 to 85). At 810 to 811 cut the restating clause and keep the statement of what is open (811 to 813) as its own sentence.
- **Calls for**: none. The file `highlights.txt` beside `main.tex` carries the same shape in its first highlight; it is not part of `main.tex` and not part of this report.

### W19

- **Comment**:
  > 19. main.tex:633, "ECGFounder's centralized advantage erodes from 0.885 to 0.612." The two numbers are ECGFounder's ARI, not its advantage. Its advantage over the hand-crafted features goes from 0.241 to 0.021. The rule asks for each thing to be named with the most specific term.
- **Rule**: academic writing rules / Precision / Most specific term.
- **Places**: 633 stands (633 to 634). The values are in the federated table (652 to 653): ECGFounder 0.885 and 0.612, hand-crafted 0.644 and 0.591.
- **Section**: 4.6.
- **What the rule asks**: each thing named with the most specific term.
- **Severity**: Major, because the sentence attributes ECGFounder's ARI values to its advantage.
- **Suggested fix**: say that ECGFounder's ARI falls from 0.885 to 0.612. If the advantage itself is stated, 4.1 already reports the paired centralized difference as 0.242 (453), which differs from the 0.241 the comment derives from rounded table values; for the non-IID setting give the two means as the text already does (0.612 against 0.591) rather than a newly subtracted value.
- **Calls for**: none.

### W20

- **Comment**:
  > 20. These technical terms are used before they are defined, or are never defined. The rule asks for a term to be defined where it first appears.
  >     - main.tex:106, "It reported high cluster purity and a silhouette score near 0.89". Purity is first defined at main.tex:171, and the silhouette is first explained at main.tex:175.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No citation is given for the master's project or its numbers.
  >     - main.tex:137, "patient-grouped". It is first defined at main.tex:204 to 205.
  >     - main.tex:139, "each bounded by a supervised ceiling". It is first defined at main.tex:307 to 311, and is also used before that at main.tex:184.
  >     - main.tex:141, "internal validity indices reward the degenerate collapse". Internal indices are first explained at main.tex:175.
  >     - main.tex:168, "which span the energy-only to definition-encoding spectrum". This is defined nowhere.
  >     - main.tex:194, "all records carrying an AF statement (AFIB or AFLT) as positives". AFIB and AFLT are not expanded, and nothing says that atrial flutter is counted as AF.
  >       Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The draft's reading rests on SR and AF differing "by definition in the regularity of the rhythm" (main.tex:133). The Limitations section does not say that flutter positives may not fit that definition.
  >     - main.tex:237, "and beat-template consistency". This feature is defined nowhere.
  >     - main.tex:776, "We evaluate one model per foundation family". "Foundation family" is not defined. Elsewhere the draft treats the foundation embeddings as one family that holds two models (main.tex:247, 755).
- **Rule**: academic writing rules / Precision / Term defined at first use. Also Paragraphs / Claim with evidence or citation; Objectivity / Limitations and alternative interpretations.
- **Places**: 106 stands (106 to 107); 171 and 175 stand. 137 stands, but "patient-grouped" first appears at 69 in the abstract; the definition stands at 204 to 205. 139 stands, but "supervised ceiling" first appears at 71 in the abstract (and 74); 184 and 307 to 311 stand. 141 stands (141 to 142). 168 stands (168 to 169). 194 stands (194 to 195); 133 stands (133 to 134). A search of `main.tex` finds no "flutter" and "AFLT" only at 195. 237 stands; the search finds "template" nowhere else. 776 stands (776 to 777); 247 and 755 stand.
- **Section**: 1 Introduction; 2 Related work; 3.1 Data and cohorts; 3.2 Representations; 6 Limitations.
- **What the rule asks**: a technical term defined where it first appears; a claim followed by its data, citation or example; the limitations and alternative readings acknowledged.
- **Severity**: Major, because the cohort counts atrial flutter as AF without saying so, while the paper's reading rests on AF being defined by rhythm irregularity.
- **Suggested fix**: give a short definition at the first use of purity and silhouette (106), patient-grouped (69 or 137), supervised ceiling (71 or 139) and internal validity indices (141), or move the account of the original project after the definitions. Say what the two ends of the spectrum at 168 are or drop the phrase. Expand AFIB and AFLT at 195, state that atrial flutter records are counted as AF positives, and add to the Limitations that flutter records need not show the irregular rhythm the reading at 133 rests on. Define beat-template consistency at 237. At 776 drop "foundation family" and say that two foundation models are evaluated.
- **Calls for**: the citation the comment asks for at 106 would be a new reference, which `config.md` does not allow; the text can say in words what the source of those numbers is. The definition of beat-template consistency is not in `main.tex` and needs the user.

### W21

- **Comment**:
  > 21. These claims are contradicted by the draft's own results. The rule asks for a claim to rest on evidence.
  >     - main.tex:74, "match a majority-class assignment despite supervised ceilings well above chance." The raw-flattening ceiling is 0.519 against a majority of 0.504, which main.tex:497 calls "barely above the 0.504 majority".
  >     - main.tex:264, "so that the same features transfer to the two-lead beats", and main.tex:728, "whereas the hand-crafted features transfer across lead sets". Main.tex:258 says "the rhythm features do not transfer to single beats", and MIT-BIH uses a different 21-dimensional set.
  >     - main.tex:488, "they do so for different reasons, one for want of label information in the space", and main.tex:496, "The raw pipeline carries almost no label information". A random forest on the raw features reaches 0.714 (main.tex:506).
  >       Also, at 496: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  >     - main.tex:616, "Two stressors closer to deployment separate the representations more sharply than the balanced benchmark." Under non-IID federation, ECGFounder and the hand-crafted features are at 0.612 and 0.591, closer together than their centralized 0.885 and 0.644. Under imbalance, ECGFounder and HuBERT-ECG are at 0.063 and 0.061.
  >       Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  >     - main.tex:730, "are not viable for label-free arrhythmia structure on either task: they are indistinguishable from predicting the majority class under all five clusterers". MIT-BIH is evaluated with three clusterers, and there the conv-AE reaches ARI 0.127 and the raw beat reaches 0.049 (main.tex:607 to 609).
  >     - main.tex:760, "They also sit at opposite ends of the clustering range measured here, 0.885 against 0.195". The measured range goes down to 0.000 (main.tex:428).
  >     - main.tex:775, "since upsampling can only discard information it cannot inflate the foundation model's lead". The same sentence reports a higher ARI after upsampling from 100 Hz (0.909) than at the native 500 Hz (0.896).
  >       Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The text rules out inflation instead of acknowledging what its own numbers show.
- **Rule**: academic writing rules / Objectivity / Claims rest on evidence. Also Tense per section; Limitations and alternative interpretations.
- **Places**: 74 stands; 497 stands. 264 stands (264 to 265). 728 stands (728 to 729). 258 stands. 488 stands (488 to 489). 496 stands; 506 stands. 616 stands (616 to 617); the values stand at 634, 652 to 653, 623 and 625. 730 stands (730 to 732); 607 to 609 stand. 760 stands (760 to 761); 428 stands. 775 stands (775 to 776); the values stand at 774 to 775. Related passages the finding does not list: 243 to 245 makes the same transfer claim ("allows the same feature logic to be carried to the two-lead MIT-BIH beats"), and 808 repeats "under all five clusterers" in the Conclusion.
- **Section**: Abstract; 3.2; 4.1; 4.2; 4.6; 5 Discussion; 6 Limitations.
- **What the rule asks**: a claim rests on evidence; past tense in Results; the limitations and alternative readings acknowledged.
- **Severity**: Major.
- **Suggested fix**: at 74, limit "supervised ceilings well above chance" to the conv-AE (0.678) and say the raw ceiling is 0.519 against 0.504. At 264 to 265, 728 to 729 and 243 to 245, say that a separate 21-dimensional beat-level feature set of the same kind is used on MIT-BIH, not the same features. At 488 to 489 and 496, limit the statement to linearly recoverable information, since the random forest reaches 0.714. At 616 to 617, state what the stressors showed by the numbers: under imbalance the hand-crafted features overtake ECGFounder; under non-IID federation the means come closer while the spread over site draws differs. At 730 to 732, scope the statement to PTB-XL or give the MIT-BIH values (conv-AE 0.127, raw beat 0.049); check 808 the same way. At 760 to 761, say the two models sit far apart, or give the range among the foundation models. At 775 to 776, drop the argument that upsampling cannot inflate the lead and report that the upsampled ARI on the subset was 0.013 higher than the native one. Put 496 and 616 in the past tense.
- **Calls for**: none; every value the fix needs is in `main.tex`.

### W22

- **Comment**:
  > 22. These claims are given without support, or rest on opinion. The rule asks for a claim to rest on evidence.
  >     - main.tex:97, "Most machine-learning work on the electrocardiogram (ECG) is supervised, but the clinically interesting questions are often unsupervised". No source is given.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No data, citation or example follows.
  >       Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point, that the representation dominates, comes only in its last sentence.
  >       Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" (main.tex:98) to be replaced with the number or the specific claim.
  >       Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 68 words, against about 120 to 200.
  >     - main.tex:101, "Whether that attempt succeeds is usually attributed to the clustering algorithm". No source is given.
  >       Also: prose standard / E. Sentence shapes / Passive voice. The people who make the attribution are relevant to the claim.
  >     - main.tex:125, "Those two gaps are exactly where a careful, honest benchmark adds value, because hand-crafted features remain the interpretable and inexpensive default in clinical signal processing, and MIT-BIH is the canonical morphology benchmark." This is opinion, and nothing supports "default" or "canonical".
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >       Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "a careful, honest benchmark" (main.tex:126) is a self-assessment.
  >     - main.tex:157, "Reconstruction autoencoders optimise signal energy rather than class structure, which makes them strong compressors but weak organisers of class geometry." No source is given.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >     - main.tex:470, "spectral clustering collapses where the nearest-neighbour affinity graph is poorly connected". The draft reports no measure of how well the graph is connected.
  >     - main.tex:580, "Robust scaling, a common default for physiological signals,". No source is given.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >     - main.tex:621, "isolating a 10\% minority cluster with a partitional method is intrinsically hard". No support is given.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >     - main.tex:637, "A deployment claim rests on the worst site draw rather than on the average one". This is opinion, given without support.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >     - main.tex:738, "both recur often enough in applied clustering to be worth stating plainly". No source is given.
  >       Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  >       Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" to be replaced with the number or the specific claim.
  >       Also: prose standard / 0. Hard rules / No performative asides. "to be worth stating plainly" is a variant of "worth noting".
- **Rule**: academic writing rules / Objectivity / Claims rest on evidence. Also Paragraphs / Claim with evidence or citation; First sentence states the point; A. vague qualifiers; manuscript prose standard / Section D, Paragraphs; E. Passive voice; 0. No grandiose self-assessment; 0. No performative asides.
- **Places**: 97 stands (97 to 98); "often" stands at 98; the paragraph runs 97 to 102 and holds 68 words by a count read from the text. 101 stands (101 to 102). 125 stands (125 to 128); "a careful, honest benchmark" stands at 126. 157 stands (157 to 159). 470 stands (470 to 471). 580 stands. 621 stands. 637 stands (637 to 638). 738 stands.
- **Section**: 1 Introduction; 2 Related work; 4.1; 4.4; 4.6; 5 Discussion.
- **What the rule asks**: a claim rests on evidence and is followed by its data, citation or example; a paragraph's first sentence states its point; "often" replaced with the specific claim; a paragraph of about 120 to 200 words; the active voice where the actor matters; no self-assessment; no performative aside.
- **Severity**: Major.
- **Suggested fix**: for each claim, either rest it on what this study itself shows or remove or hedge it. At 157 to 159 the study's own conv-AE values (ceiling 0.678, best ARI 0.008) can carry the point as an observation of this study. At 470 to 471 report that spectral clustering falls on some representations (the main table) without the unmeasured cause, or hedge the cause as a possible one. At 125 to 128 drop "careful, honest" and the unsupported "default" and "canonical", or hedge them. At 580 and 621 drop or hedge the general statements. At 637 to 638 state the worst site draw as the criterion this study uses and why it matters for the deployment reading. Cut the clause at 738. Rework the opening paragraph (97 to 102) so its first sentence states its point, replace "often", say who attributes success to the algorithm, and join it with its neighbour or extend it toward the paragraph length the standard gives.
- **Calls for**: the citations the comment asks for at 97, 101, 125, 157, 580, 621 and 738 would be new references, which `config.md` does not allow; the text-only fix above meets the rule without them. A measure of graph connectivity at 470 would be a number computed from saved results, which `config.md` does not allow; the hedge or removal meets the rule without it.

### W23

- **Comment**:
  > 23. The text does not acknowledge these limitations or alternative readings. The rule asks for them to be acknowledged.
  >     - main.tex:250, "HuBERT-ECG receives the first \mbox{5\,s} at \mbox{100\,Hz}". HuBERT-ECG sees half of each 10 s strip, and so fewer RR intervals, while every other arm sees the full strip. Its weak clustering is explained only as off-axis geometry (main.tex:526 to 529) or as organisation by dataset (main.tex:466 to 468). The shorter input window is not given as an alternative explanation.
  >     - main.tex:362, "the partitions are held fixed and the cohort is resampled with replacement at the patient level". The intervals do not refit the clustering on each resample. The text does not say what this leaves out of the uncertainty that every interval in the Results carries.
  >     - main.tex:386, "Conditioning is fitted once on the full representation matrix before partitioning, so the federation concerns the clustering step alone." In the federated simulation, conditioning uses statistics pooled across all sites. The draft shows that the scaler changes the results by a wide margin (main.tex:576 to 580), and the Limitations section (main.tex:787 to 796) does not raise this.
  >     - main.tex:619, "At the natural-like 9:1 SR:AF ratio (majority 0.90), every representation's ARI falls". The reversal is shown for one ratio and one scaler, and the clusterer is not named. It is then stated in general terms at main.tex:626.
  >       Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words and chains a general fall, its cause, a retention result and an overtaking result.
- **Rule**: academic writing rules / Objectivity / Limitations and alternative interpretations. Also E. Sentence length.
- **Places**: 250 stands (250 to 251); 526 to 529 and 466 to 468 stand. 362 stands (362 to 364). 386 stands (386 to 388); 576 to 580 stand; the federated part of the Limitations (787 to 796) does not mention the pooled scaling, read in this start. 619 stands (619 to 620); 626 stands (626 to 627). A search of `main.tex` for the imbalance setting (318, 619 to 627) finds no clusterer named for it. The word count of the sentence (619 to 624) is the report's and was not recounted.
- **Section**: 3.2 Representations; 3.3; 3.4; 4.6; 6 Limitations.
- **What the rule asks**: the limitations and alternative interpretations acknowledged; a sentence under roughly 20 words unless the mechanism needs more.
- **Severity**: Major.
- **Suggested fix**: acknowledge each in the Limitations or at the passage. HuBERT-ECG receives 5 s of each 10 s record, so the shorter window is an alternative explanation for its weak clustering. The intervals hold the partitions fixed, so they leave out the variation from refitting the clusterer on a resampled cohort. In the federated simulation the scaling uses statistics pooled over all sites, which separate sites would not share, and scaling changes the results (576 to 580). The reversal under imbalance is shown at one ratio and one scaling with one clusterer; name the clusterer and scope 626 to 627 to that setting. Split the sentence at 619 to 624.
- **Calls for**: none for the acknowledgments; quantifying any of them would need new results, which `config.md` does not allow and the rule does not ask. The name of the clusterer used for the imbalance results is not in `main.tex` and needs the user.

### W24

- **Comment**:
  > 24. These interpretations have alternative explanations and are stated without a hedge. The rule asks for a hedge.
  >     - main.tex:266, "so the lead set cannot account for the raw arm's chance-level clustering". The larger twelve-lead input also makes the raw vector 1992-dimensional, which is a way the lead set could still bear on Euclidean clustering.
  >     - main.tex:486, "no fixed offset falls on the same part of the cardiac cycle in two recordings". This is given as the cause of the raw arm's failure. In the same section, a random forest on the same features reaches 0.714 (main.tex:506).
- **Rule**: academic writing rules / Hedging / Hedge where a claim is uncertain.
- **Places**: 266 stands (266 to 267); the 1992 dimensions stand at 224. 486 stands (486 to 487). 506 stands; it is in 4.2, the subsection after 486's.
- **Section**: 3.2 Representations; 4.1.
- **What the rule asks**: an interpretation with alternative explanations is hedged.
- **Severity**: Minor.
- **Suggested fix**: hedge both statements and name the alternative: at 266 to 267, that the twelve-lead input makes the vector 1992-dimensional, which may itself affect Euclidean clustering; at 486 to 487, that the misalignment is a likely cause of the linear failure, given that a non-linear probe recovers more (0.714).
- **Calls for**: none.

### W25

- **Comment**:
  > 25. This evidence is not followed by an interpretation that connects it to the paragraph's claim. The rule asks for that interpretation.
  >     - main.tex:508, "The same probe gives 0.951 on the hand-crafted features, 0.983 on ECGFounder and 0.825 on HuBERT-ECG. On ECGFounder the two probes agree to three decimals". Only the HuBERT-ECG value is interpreted.
  >     - main.tex:624, "HuBERT-ECG reaches the same ARI as ECGFounder (0.061 [0.053, 0.069]) at a lower AMI (0.044 [0.037, 0.050])". No interpretation follows.
- **Rule**: academic writing rules / Paragraphs / Evidence followed by what it means.
- **Places**: 508 stands (508 to 510). 624 stands (624 to 625). At 624 to 625 "the same ARI" sets HuBERT-ECG's 0.061 against ECGFounder's 0.063 (623); the two intervals overlap. The finding does not raise this; it bears on the wording the fix writes.
- **Section**: 4.2; 4.6.
- **What the rule asks**: evidence followed by an interpretation that connects it to the paragraph's claim.
- **Severity**: Minor.
- **Suggested fix**: after 508 to 510, say what the hand-crafted and ECGFounder values show for the paragraph's claim (on the representations that cluster, the non-linear probe adds little over the linear ceiling). After 624 to 625, say what a similar ARI at a lower AMI means for HuBERT-ECG under imbalance, and write "a similar ARI" or give both values in place of "the same ARI".
- **Calls for**: none.

### W26

- **Comment**:
  > 26. main.tex:734, the paragraph that opens "The result also reframes the original master's project honestly." Its content is already in the draft. The original conclusion is called correct at main.tex:109 to 111. Purity without a baseline and silhouette on a collapsed solution are identified as the artefacts at main.tex:107 to 109 and 555 to 556. The only new content is the unsupported claim in finding 22. The rule asks for a paragraph whose removal loses nothing to be deleted.
  >     Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "reframes ... honestly" is a self-assessment.
  >     Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 66 words, against about 120 to 200.
- **Rule**: academic writing rules / Reader's path / Clarity test. Also 0. No grandiose self-assessment; manuscript prose standard / Section D, Paragraphs.
- **Places**: 734 stands; the paragraph runs 734 to 738 and holds 66 words by a count read from the text. 109 to 111, 107 to 109 and 555 to 556 stand. "honest" also stands at 109 and 126 (the latter is in W22).
- **Section**: 5 Discussion.
- **What the rule asks**: a paragraph whose removal loses nothing is deleted; no self-assessment; a paragraph of about 120 to 200 words.
- **Severity**: Minor.
- **Suggested fix**: delete the paragraph at 734 to 738; its content stands at 107 to 111 and 555 to 556, and its one new claim is the unsupported one of W22.
- **Calls for**: none.

### W27

- **Comment**:
  > 27. These headings editorialise. The rule asks for no headline-style headings that editorialise.
  >     - main.tex:397, "Representation, not algorithm, governs clusterability". This is also a "not X, Y" contrast.
  >       Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.
  >       Also: prose standard / 0. Hard rules / No repeated construction. It has the same shape as main.tex:84 and 800 (finding 31).
  >     - main.tex:548, "The silhouette trap"
  >       Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. This is a cutesy section title.
  >     - main.tex:574, "Conditioning matters"
  >       Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.
- **Rule**: prose standard / 0. Hard rules / Plain prose only. Also Headings are labels, not sentences; No repeated construction; no cutesy section titles.
- **Places**: 397, 548 and 574 stand. The caption at 563 also opens with "The silhouette trap.", and the silhouette figure carries "The silhouette trap" as its own title in the figure.
- **Section**: 4.1; 4.3; 4.4.
- **What the rule asks**: headings are labels that do not editorialise; no "not X, Y" heading; no cutesy title.
- **Severity**: Minor.
- **Suggested fix**: replace each heading with a label of its subject: 397 the comparison of representations and clustering algorithms on PTB-XL; 548 internal indices on degenerate solutions; 574 the effect of feature scaling (with the term chosen under W10). Open the caption at 563 with a description of the plot.
- **Calls for**: the headings and the caption are text and need none. The title printed inside the silhouette figure would need a figure change to match, which `config.md` does not allow.

### W28

- **Comment**:
  > 28. main.tex:582, "Conditioning should be reported and swept, not assumed." This is a punchy one-line summary built on a "not X, Y" contrast. The rule asks for the fact to be stated without it.
- **Rule**: prose standard / 0. Hard rules / Plain prose only.
- **Places**: 582 stands (582 to 583).
- **Section**: 4.4.
- **What the rule asks**: no punchy one-line summary and no cute contrast; state the fact and stop.
- **Severity**: Minor.
- **Suggested fix**: cut the sentence, or state the recommendation directly without the contrast, using the term chosen under W10.
- **Calls for**: none.

### W29

- **Comment**:
  > 29. These headings are sentences, not labels. The rule asks for a label.
  >     - main.tex:51, "Which representation clusters? A chance-corrected benchmark of ECG". The title opens with a question.
  >     - main.tex:493, "Separability is not clusterability"
- **Rule**: prose standard / 0. Hard rules / Headings are labels, not sentences.
- **Places**: 51 stands; the title runs 51 to 52. 493 stands. The caption at 538 also opens with "Separability is not clusterability.", and the separability figure carries it as its own title in the figure.
- **Section**: Title; 4.2.
- **What the rule asks**: a heading is a label, not a sentence.
- **Severity**: Minor.
- **Suggested fix**: drop the opening question from the title and keep the label that follows it. Replace the heading at 493 with a label of its subject (supervised separability against clustering). Open the caption at 538 with a description of the plot.
- **Calls for**: the title, heading and caption are text and need none. The title printed inside the separability figure would need a figure change to match, which `config.md` does not allow.

### W30

- **Comment**:
  > 30. All four representation entries close on the same sentence opening, "The principle is that". The rule asks for a shape that recurs across entries to be rewritten.
  >     - main.tex:224, "The principle is that the sample amplitudes are themselves the features"
  >       Also: references/rules.md / Concision / One idea per sentence. The same sentence also gives the separate reason for the lead set, "all twelve leads enter because this arm reproduces the originating pipeline".
  >     - main.tex:231, "The principle is that a reconstruction objective compresses whatever carries signal energy"
  >     - main.tex:245, "The principle is that the AF signature is RR irregularity together with P-wave absence"
  >     - main.tex:254, "The principle is that large-scale pretraining has already fixed an ECG feature space"
- **Rule**: prose standard / 0. Hard rules / No repeated construction. Also Concision / One idea per sentence.
- **Places**: 224 stands (224 to 225); the lead-set clause stands at 225 to 226. 231 stands (231 to 232). 245 stands (245 to 246). 254 stands (254 to 255). Each is the last sentence of its entry. The revised part of each entry also opens with "Input:" (222, 230, 239, 250), the places of W45.
- **Section**: 3.2 Representations.
- **What the rule asks**: a shape that recurs across entries is rewritten; one idea per sentence.
- **Severity**: Minor.
- **Suggested fix**: state each entry's principle in a form that fits its content, for instance within the entry's opening description, so the four entries no longer share a closing sentence shape. Split 224 to 226 into the principle and the reason all twelve leads enter.
- **Calls for**: none.

### W31

- **Comment**:
  > 31. main.tex:800, "the representation, not the clustering algorithm, decides whether clustering works". The same "representation, not the algorithm" shape appears at main.tex:84 (finding 18) and main.tex:397 (finding 27). The rule asks for the repeated shape to be rewritten.
- **Rule**: prose standard / 0. Hard rules / No repeated construction.
- **Places**: 800 stands (800 to 801). 84 and 397 stand.
- **Section**: 7 Conclusion.
- **What the rule asks**: a recurring sentence shape is rewritten.
- **Severity**: Minor.
- **Suggested fix**: state the Conclusion's finding without the "not X, Y" shape, for example by what the evidence shows (the spread across representations exceeded the spread across clusterers on both tasks), together with the fixes of W18 and W27.
- **Calls for**: none. The first highlight in `highlights.txt` has the same shape; that file is not part of `main.tex` or of this report.

### W32

- **Comment**:
  > 32. "simply" is used as filler at main.tex:107, "but the purity simply equalled the majority-class", and at main.tex:504, "simply does not lie along their dominant axes of variation". The rule asks for the word to be cut or replaced with the concrete fact.
- **Rule**: prose standard / A. Vocabulary / banned filler.
- **Places**: 107 stands. 504 stands.
- **Section**: 1 Introduction; 4.2.
- **What the rule asks**: banned filler is cut or replaced with the concrete fact.
- **Severity**: Minor.
- **Suggested fix**: cut "simply" at 107 and 504.
- **Calls for**: none.

### W33

- **Comment**:
  > 33. main.tex:174, "are near zero for such trivial solutions". The rule asks for the number or the specific claim. For the one-cluster solution, ARI and AMI are exactly zero.
- **Rule**: prose standard / A. Vocabulary / vague qualifiers.
- **Places**: 174 stands.
- **Section**: 2 Related work.
- **What the rule asks**: a vague qualifier is replaced with the number or the specific claim.
- **Severity**: Minor.
- **Suggested fix**: say that both indices are zero for a one-cluster solution. This follows from the definitions in the metrics table: with one cluster the Rand index equals its expectation and the mutual information is zero.
- **Calls for**: none.

### W34

- **Comment**:
  > 34. "robust" is used where the draft has a more precise measure, which is the share of centralized ARI retained. It appears at main.tex:82, "the hand-crafted features are the most robust", and at main.tex:144, "the 16 hand-crafted features are the most robust". The rule asks for the most precise word.
- **Rule**: prose standard / A. Vocabulary / flagged terms.
- **Places**: 82 stands (82 to 83). 144 stands (144 to 145). A search of `main.tex` also finds "most robust" at 632 (W11) and the noun "robustness" at 378 and 614 (headings), 645 and 663 (captions) and 723; "robust" at 314, 578 and 580 is the name of a scaler and is a term of the field.
- **Section**: Abstract; 1 Introduction.
- **What the rule asks**: a flagged term is used only where it is the most precise word.
- **Severity**: Minor.
- **Suggested fix**: at 82 to 83 and 144 to 145 state the measure in place of "most robust": the share of centralized ARI retained under non-IID federation, and overtaking ECGFounder under imbalance. The finding does not list the noun at 378, 614, 645, 663 and 723; the draft writer may treat it the same way.
- **Calls for**: none.

### W35

- **Comment**:
  > 35. Running prose, with table rows excluded, has 33 semicolons in 6766 words. That is 4.9 per 1000 words, spread over 24 paragraphs, against a limit of 2. One example is main.tex:197, "so a presence-based rule is required; a confidence threshold would discard every SR record".
- **Rule**: prose standard / B. Punctuation / Semicolons.
- **Places**: 197 stands (197 to 198). A search of `main.tex` for ";" finds 39 lines with one semicolon each. Leaving out the preamble comment (15) and the table cells (332 to 334) leaves 35; of these, 411, 413, 539, 542, 563, 598 and 693 are in captions, and 192, 234 to 236, 495 and 631 separate items inside parentheses. The report's 33 depends on which of these it counted; its word count of 6766 was not recounted.
- **Section**: whole text.
- **What the rule asks**: at most 2 semicolons per 1000 words of running prose.
- **Severity**: Minor.
- **Suggested fix**: replace the semicolons of the running prose with full stops or restructure the sentences, starting with the paragraphs that hold several; many fall in sentences other items already rewrite.
- **Calls for**: none.

### W36

- **Comment**:
  > 36. These sentences describe what the text is about to do. The rule asks for such sentences to be cut.
  >     - main.tex:216, "Each entry states the leads it consumes, the array it receives, and the principle it encodes."
  >       Also: prose standard / D. Structure / Lists are introduced with a colon. The list at main.tex:218 follows a sentence that ends in a full stop.
  >     - main.tex:490, "Which of the two accounts for HuBERT-ECG is what the next subsection measures."
- **Rule**: prose standard / C. Throat-clearing and meta-commentary. Also D. Lists are introduced with a colon.
- **Places**: 216 stands (216 to 217); the list begins at 218. 490 stands (490 to 491).
- **Section**: 3.2 Representations; 4.1.
- **What the rule asks**: a sentence that describes what the text is about to do is cut; a list is introduced with a colon.
- **Severity**: Minor.
- **Suggested fix**: cut both sentences; end the sentence before the list at 216 with a colon.
- **Calls for**: none.

### W37

- **Comment**:
  > 37. The Results paragraphs at main.tex:550 ("Internal indices mislead here in a specific, reproducible way."), main.tex:576 and main.tex:587 come one after another at 94, 91 and 90 words. Only figure captions stand between them. The rule says uniform blocks are a template and asks for varied paragraph length.
- **Rule**: prose standard / D. Structure / Vary paragraph length.
- **Places**: 550, 576 and 587 stand. Between 558 and 576 stand the silhouette figure (560 to 572) and the heading at 574; between 583 and 587 stands the heading at 585 (see Quote check). The word counts are the report's and were not recounted.
- **Section**: 4.3; 4.4; 4.5.
- **What the rule asks**: varied paragraph length.
- **Severity**: Minor.
- **Suggested fix**: let the paragraph lengths follow their content once W10, W28 and W9 change 576 to 583 and 587; check after those changes that the three no longer run to the same length.
- **Calls for**: none.

### W38

- **Comment**:
  > 38. The Limitations section, one paragraph of 335 words, holds four binary contrasts. The first two are at main.tex:773, "rather than a full re-run", and main.tex:778, "rather than generalising". The other two go over the limit:
  >     - main.tex:780, "each chosen so that the class definition is unambiguous and a clustering failure can be charged to the representation rather than to label noise"
  >     - main.tex:787, "The federated study is a simulation on a single physical dataset, not a multi-institution deployment."
  >     The rule allows at most two per page.
- **Rule**: prose standard / D. Structure / Binary contrast ("not X, Y") at most twice per page.
- **Places**: the Limitations section is one paragraph (771 to 796). 773 stands. "rather than generalising" stands on 779 (see Quote check). 780 stands (780 to 781). 787 stands (787 to 788). The word count is the report's and was not recounted.
- **Section**: 6 Limitations.
- **What the rule asks**: at most two binary contrasts per page, and only where the contrast is the point.
- **Severity**: Minor.
- **Suggested fix**: keep at most two contrasts where the contrast is the point and state the others directly. 773 is also rewritten under W46 and 779 under W4.
- **Calls for**: none.

### W39

- **Comment**:
  > 39. These passages run three or more list-shaped items in paragraph form. The rule asks for them to become a list.
  >     - main.tex:137, "(i) A chance-corrected, patient-grouped, significance-tested clustering benchmark ... (ii) ... (iii) ... (iv)". These are four contributions.
  >     - main.tex:274, "The implementations are those of scikit-learn, run with ten $k$-means restarts per seed, Ward linkage on Euclidean distance, ... and a minimum cluster size of $n/50$ ... for HDBSCAN". These are five clusterer settings.
  >       Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words.
  >     - main.tex:297, "There $U$ is the partition by true class and $V$ the partition by cluster, $n$ is the number of records ...". These are the notation definitions.
  >     - main.tex:742, "Six things separate this study from the closest ECG foundation-model clustering benchmark". The six items follow in paragraph form.
  >       Also: prose standard / E. Sentence shapes / Stop-start fragments. Each item is a sentence fragment: main.tex:743, 745, 747, 748, 749 and 750.
- **Rule**: prose standard / D. Structure / Three or more list-shaped items in paragraph form become a list. Also E. Sentence length; E. Stop-start fragments.
- **Places**: 137 stands; the four contributions run 137 to 147. 274 stands; the sentence runs 274 to 280. 297 stands; the notation runs 297 to 303. 742 stands (742 to 743); the six items open at 743, 745, 747, 748, 749 and 750 and each is a noun phrase without a main verb. The sentence's word count at 274 is the report's and was not recounted.
- **Section**: 1 Introduction; 3.3; 5 Discussion.
- **What the rule asks**: three or more list-shaped items become a list introduced with a colon; sentences under roughly 20 words unless the mechanism needs more; fragments joined.
- **Severity**: Minor.
- **Suggested fix**: set the four contributions (137 to 147), the five clusterer settings (274 to 280) and the six differences (742 to 753) as lists, each introduced by a sentence ending in a colon; give the notation (297 to 303) as a list or move it beside the metrics table. Write each of the six differences as a full list item.
- **Calls for**: none.

### W40

- **Comment**:
  > 40. These paragraphs are far below the length of about 120 to 200 words. The rule asks for a paragraph that far outside that length to be split, or joined with its neighbour. The paragraphs at main.tex:97 and 734 are given in findings 22 and 26.
  >     - main.tex:122, "The most directly related work benchmarks several ECG foundation models": 72 words.
  >     - main.tex:207, "For generalization we use the MIT-BIH Arrhythmia Database": 63 words.
  >     - main.tex:258, "On MIT-BIH the rhythm features do not transfer to single beats": 54 words.
  >     - main.tex:263, "The two lead sets are deliberate and answer to different constraints.": 55 words.
  >     - main.tex:399, "Table~\ref{tab:main} and Fig.~\ref{fig:heatmap} summarise the PTB-XL benchmark.": 67 words.
  >       Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence points to a table and a figure. The main point, that the representation decides the outcome, comes later.
- **Rule**: manuscript prose standard / Section D, Paragraphs. Also Paragraphs / First sentence states the point.
- **Places**: 122 stands; the paragraph (122 to 128) holds 71 words and one citation by a count read from the text. 207 stands (207 to 212). 258 stands (258 to 261). 263 stands (263 to 267). 399 stands (399 to 405). The other word counts are the report's and were not recounted.
- **Section**: 1 Introduction; 3.1; 3.2; 4.1.
- **What the rule asks**: a paragraph of about 120 to 200 words; one far outside that is split or joined with its neighbour; the first sentence states the point.
- **Severity**: Minor.
- **Suggested fix**: join 258 to 261 with 263 to 267, which both concern the lead sets and the MIT-BIH arms. Join 122 to 128 with its neighbour on the closest benchmark or with 130 to 149 once W22 and W39 change them. Extend or join 207 to 212 with the PTB-XL paragraph of 3.1. Open 399 to 405 with its point, that the spread across representations exceeds the spread across clusterers, and join it with the paragraph that follows the table.
- **Calls for**: none.

### W41

- **Comment**:
  > 41. These paragraphs cover more than one idea, or run far past 200 words. The rule asks for them to be split.
  >     - main.tex:271, "Each representation is clustered with $k$-means": 583 words. It covers the clusterer settings, conv-AE training, foundation-model inference, the metric notation, the supervised ceiling, the seeds, the conditioner sweep, the K sweep and the imbalanced subsample.
  >       Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Methodology.
  >     - main.tex:448, "Uncertainty enters at two levels and they are of different size." The paragraph covers the significance of the contrasts and, separately, the ordering across K (main.tex:460).
  >       Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph is mainly about the Wilcoxon contrasts, their effect sizes and the ordering across K.
  >     - main.tex:714, "The practical reading is a decision rule": 236 words. It covers the decision rule, the cost comparison, the lead constraint and the non-viability of the raw and autoencoder pipelines.
  >     - main.tex:771, "ECGFounder expects 500\,Hz input": 335 words. It covers the 500 Hz upsampling, the choice of foundation models, the binary tasks, the MIT-BIH omission and the federated simulation.
- **Rule**: manuscript prose standard / Section D, Paragraphs. Also Tense per section; Paragraphs / First sentence states the point.
- **Places**: 271 stands; the paragraph runs 271 to 318 and covers the topics the finding lists. 448 stands; the paragraph runs 448 to 464 and turns to K at 460. 714 stands; the paragraph runs 714 to 732. 771 stands; the paragraph runs 771 to 796. The word counts are the report's and were not recounted.
- **Section**: 3.3; 4.1; 5 Discussion; 6 Limitations.
- **What the rule asks**: a paragraph covers one idea and runs about 120 to 200 words; past tense in the Methods; the first sentence states the point.
- **Severity**: Minor.
- **Suggested fix**: split 271 to 318 by idea (clusterers and their settings; conv-AE training and foundation-model inference; metrics and notation; supervised ceiling and seeds; scaling sweep, K sweep and imbalanced subsample) and put it in the past tense. Split 448 to 464 into the contrasts with their effect sizes and the check across K, each opening with its point. Split 714 to 732 into the decision rule, the cost, and the lead constraint with the raw and conv-AE result. Split 771 to 796 into one paragraph per limitation.
- **Calls for**: none.

### W42

- **Comment**:
  > 42. These fragments are labels that depend on the sentence after them. The rule asks for them to be joined to it.
  >     - main.tex:619, "First, class imbalance."
  >     - main.tex:629, "Second, federation."
  >       Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point is that non-IID federation degrades the representations unequally, and it comes later.
- **Rule**: prose standard / E. Sentence shapes / Stop-start fragments. Also Paragraphs / First sentence states the point.
- **Places**: 619 stands. 629 stands; the point stands at 631 to 632.
- **Section**: 4.6.
- **What the rule asks**: fragments are joined to the sentence they depend on; the first sentence states the point.
- **Severity**: Minor.
- **Suggested fix**: join each label to the sentence after it, and open the paragraph at 629 with the non-IID result as W15 corrects it.
- **Calls for**: none.

### W43

- **Comment**:
  > 43. main.tex:515, "That reading is testable and we test it out of fold." "That reading" has no clear antecedent, because the previous paragraph ends on probe linearity. The rule asks for the prior subject to be carried forward.
  >     Also: references/rules.md / Paragraphs / First sentence states the point. The point, that the class information is present but lies off the dominant axes, comes later.
- **Rule**: prose standard / E. Sentence shapes / Cold opens. Also Paragraphs / First sentence states the point.
- **Places**: 515 stands. The previous paragraph ends at 511 to 512 on probe linearity.
- **Section**: 4.2.
- **What the rule asks**: the prior subject is carried forward; the first sentence states the point.
- **Severity**: Minor.
- **Suggested fix**: open the paragraph by naming the reading it tests (that the class information is present in the weaker embeddings but lies off their dominant axes), followed by the out-of-fold result.
- **Calls for**: none.

### W44

- **Comment**:
  > 44. main.tex:240, "Lead II is the standard rhythm lead, ... where a twelve-lead definition would not apply." The sentence has 55 words and chains three reasons that do not depend on each other. The rule asks for sentences under roughly 20 words unless the mechanism needs more.
- **Rule**: prose standard / E. Sentence shapes / Sentence length.
- **Places**: 240 stands; the sentence runs 240 to 245. The word count is the report's and was not recounted. Its third reason makes the transfer claim W21 contests.
- **Section**: 3.2 Representations.
- **What the rule asks**: sentences under roughly 20 words unless the mechanism needs more.
- **Severity**: Minor.
- **Suggested fix**: give the three reasons as separate sentences, and word the third in line with the correction of W21.
- **Calls for**: none.

### W45

- **Comment**:
  > 45. These passages name code identifiers. The rule asks for the text to name none.
  >     - main.tex:199, "Records are read from the \mbox{100\,Hz} distribution of the database with \texttt{wfdb.rdsamp} and cast once to a \texttt{float32} array"
  >     - main.tex:222, "Input: all twelve leads, \texttt{float32}, 1000 by 12."
  >     - main.tex:230, "Input: all twelve leads, \texttt{float32}, resampled to 12 by 2500"
  >     - main.tex:239, "Input: lead II alone, \texttt{float32}, 1000 samples, reduced to a 16-dimensional \texttt{float32} vector."
  >     - main.tex:250, "Input: all twelve leads, \texttt{float32}."
- **Rule**: manuscript prose standard / G. The project's own software / No software wording.
- **Places**: 199 stands (199 to 201). 222 stands. 230 stands. 239 stands (239 to 240). 250 stands.
- **Section**: 3.1 Data and cohorts; 3.2 Representations.
- **What the rule asks**: the text names no file, script, path or code identifier of the project's own work.
- **Severity**: Major, as the peer reviewer page rates software wording.
- **Suggested fix**: describe the data in the field's terms: the 100 Hz release of PTB-XL, 1000 samples by 12 leads, and, if precision matters to the result, single-precision values. Drop the reader function and the numeric type name from 199 to 201 and from each entry's input sentence.
- **Calls for**: none.

### W46

- **Comment**:
  > 46. These passages use the wording of software operations, or name a run or a process, about the project's own work. The rule asks for none.
  >     - main.tex:201, "No filtering, resampling or rescaling is applied at load time"
  >     - main.tex:285, "The two foundation models are used in evaluation mode with gradients disabled"
  >     - main.tex:388, "A run is fifteen aggregation rounds of three local Lloyd iterations per site"
  >     - main.tex:689, "the process that ran the inference, each representation measured in its own process". The finding placed this at 688.
  >     - main.tex:771, "because bulk streaming of the 500\,Hz records was rate-limited at the source"
  >     - main.tex:773, "A consistency check on a 300-record subset, rather than a full re-run,"
  >     - main.tex:785, "cached embeddings"
- **Rule**: manuscript prose standard / G. The project's own software / No software wording.
- **Places**: 201 stands (201 to 202). 285 stands (285 to 286). 388 stands (388 to 389). 689 stands (689 to 690), in the caption of the cost table. 771 stands (771 to 772). 773 stands. 785 stands.
- **Section**: 3.1; 3.3; 3.4; 4.7; 6 Limitations.
- **What the rule asks**: no wording of software operations about the project's own work, and no run or process named.
- **Severity**: Major, as the peer reviewer page rates software wording.
- **Suggested fix**: state each as a fact of the study: no filtering, resampling or rescaling before each representation's own preprocessing; the foundation models were used as frozen feature extractors with their published weights; federated clustering consisted of fifteen aggregation rounds of three local Lloyd iterations per site; peak memory was measured for each representation separately; the main benchmark used the 100 Hz records upsampled for ECGFounder, with the reason stated as a fact about data access or left out; the check at 500 Hz used a 300-record subset in place of the full cohort; a multi-class cohort could use the same embeddings.
- **Calls for**: none.

### W47

- **Comment**:
  > 47. main.tex:471, "rather than tune them away". The rule asks for formal, academic vocabulary.
- **Rule**: academic writing rules / Formality / No colloquial words.
- **Places**: 471 stands (471 to 472).
- **Section**: 4.1.
- **What the rule asks**: formal, academic vocabulary.
- **Severity**: Minor.
- **Suggested fix**: say that both are reported with the settings given in the Methods and that their parameters were not adjusted to the outcome.
- **Calls for**: none.

### W48

- **Comment**:
  > 48. main.tex:551, "while every point but a handful". The rule asks for the specific claim, here the number of points outside the large cluster.
- **Rule**: academic writing rules / Common style errors / Vague phrase.
- **Places**: 551 stands. The number of points outside the large cluster appears nowhere in `main.tex`; the text gives the largest-cluster fraction as 1.00 at 552.
- **Section**: 4.3.
- **What the rule asks**: a vague phrase is replaced with the specific claim.
- **Severity**: Minor.
- **Suggested fix**: replace "every point but a handful" with the specific figure the text already reports, the largest-cluster fraction of 1.00.
- **Calls for**: the number of points outside the large cluster, as the comment asks, would be a number computed from saved results, which `config.md` does not allow; the fix above meets the rule with the reported fraction.

### W49

- **Comment**:
  > 49. These passages report in the present tense where the section's row asks for the past tense.
  >     - main.tex:180, "reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL and finds that some models cluster by clinical label". This is a literature review reporting results.
  >     - main.tex:191, "We use PTB-XL \cite{ptbxl2020}, a public 12-lead database". Methodology.
  >     - main.tex:380, "To probe deployment under data siloing we use standard federated $k$-means". Methodology.
  >     - main.tex:400, "ECGFounder clusters best (ARI up to 0.885 with $k$-means), the hand-crafted features are competitive". Results.
  >     - main.tex:550, "Raw flattening with agglomerative clustering attains a silhouette of 0.81". Results.
  >     - main.tex:629, "every representation retains essentially its centralized ARI". Results.
  >     - main.tex:677, "The two are ordered against each other: ECGFounder, which clusters best, is the most expensive per record". Results.
- **Rule**: academic writing rules / Common style errors / Tense per section.
- **Places**: 180 stands (180 to 181). 191 stands. 380 stands. 400 stands (400 to 401). 550 stands (550 to 551). 629 stands (629 to 630). 677 stands (677 to 678). The present tense also runs through the rest of the Methods and Results, including passages other items list (W9 at 587, W10 at 576, W21 at 496 and 616, W41 at 271).
- **Section**: 2 Related work; 3.1; 3.4; 4.1; 4.3; 4.6; 4.7.
- **What the rule asks**: past tense for a literature review reporting results, for the methodology and for the results.
- **Severity**: Minor.
- **Suggested fix**: put the reported results of the closest benchmark (180 to 181), the description of what was done in the Methods, and the reported findings in the Results in the past tense, across those sections and not only at the listed lines; keep the present tense for what a table or figure shows and for interpretation in the Discussion.
- **Calls for**: none.

## Reading 1

What was read: `main.tex` and `refs.bib` as patched, against the text before the run (`git show HEAD:manuscript/main.tex`, `git diff -- manuscript/main.tex manuscript/refs.bib`); both apply reports; `intended-claims.md`; `citation-report.md` with its second start; `checks.md`, Run 3; the Decisions of `config.md`. Every block the main patch touched (51 of 81) was read in full, and every block it deleted was checked for where its content went.

Line numbers in this reading are those of `main.tex` after the patch (474 lines). Each revised paragraph now stands on one source line, so a line number names a paragraph and the quote locates the passage in it. The citation report's line numbers are of the same patched file.

Checks made for this reading:

- Revision marking: every added line of `git diff -U0 -- manuscript/main.tex` that carries no `\rev` is an item of a list inside a `revblock`, a continuation line of a multi-line `\rev{...}` span, or a blank line. No changed passage stands unmarked.
- Cross-references: a search of `main.tex` for `\ref{...}` and `\label{...}` finds a label for each of the 14 keys referred to (sec:intro, sec:methods, sec:results, sec:discussion, sec:limitations, tab:main, tab:metrics, tab:mitbih, tab:fed, tab:cost, fig:heatmap, fig:sep, fig:trap, fig:fed).
- Semicolons: a search for ";" finds line 15 (a preamble comment) and lines 194 to 196 (cells of the metrics table) only.
- Terms: a search finds no "ranking", "ranked", "conditioning", "conditioner", "scaler", "materially", "cheap", "client", "reconstruction-autoencoder", "simply", "phenotyp", "family", "float32", "wfdb", "patient-grouped bootstrap", "cohort bootstrap", "honest", "often" or "deployab" in the text. "robust" stands only as the name of a scaling method (180, 309). "recording" stands at 114, 427 and 447 (the pretraining corpora), 143 (single-lead recordings in general) and 443 (recordings held at institutions).
- `refs.bib`: the diff holds the three corrections C1 to C3 and nothing else.
- Numbers: every value the patch moved or restated (abstract, 96, 263, 265, 269, 275, 291, 309, 313, 336, 338, 373, 403, 407, 427, 437, 447) agrees with the tables and with the text before the run.

### Summary of reading 1

| Item | Status | Item | Status | Item | Status |
|---|---|---|---|---|---|
| W1 | resolved | W18 | resolved | W35 | resolved |
| W2 | resolved | W19 | resolved | W36 | resolved |
| W3 | resolved | W20 | partly resolved | W37 | not resolved |
| W4 | resolved | W21 | partly resolved | W38 | resolved |
| W5 | resolved | W22 | resolved | W39 | resolved |
| W6 | resolved | W23 | partly resolved | W40 | resolved |
| W7 | resolved | W24 | partly resolved | W41 | partly resolved |
| W8 | resolved | W25 | resolved | W42 | resolved |
| W9 | resolved | W26 | resolved | W43 | resolved |
| W10 | resolved | W27 | resolved | W44 | resolved |
| W11 | resolved | W28 | resolved | W45 | resolved |
| W12 | resolved | W29 | resolved | W46 | resolved |
| W13 | resolved | W30 | resolved | W47 | resolved |
| W14 | resolved | W31 | resolved | W48 | partly resolved |
| W15 | resolved | W32 | resolved | W49 | resolved |
| W16 | resolved | W33 | resolved | | |
| W17 | resolved | W34 | resolved | | |

Resolved 42, partly resolved 6 (W20, W21, W23, W24, W41, W48), not resolved 1 (W37). New items V1 to V28: V1 to V14 from the citation report, V15 to V22 from the reference checks, V23 to V28 introduced by the revision.

### The items W1 to W49

- **W1**: resolved. Introduction 91: "The ordering of the representations follows from the class definitions and is not the contribution." The abstract (62) states the contribution without the disclaimer: "These chance-corrected controls, which locate where the raw and conv-AE representations fail, are the contribution, together with the measurement of each representation under deployment stress." The Discussion's closing sentence "None of these is a new method..." is gone, and "ranking" stands nowhere.
- **W2**: resolved. Introduction 96: "Across the federated sites they keep a larger share of the adjusted Rand index (ARI) they reach without federation than either foundation model does." Discussion 403 takes another form: "overtake it under the 9:1 imbalance (ARI 0.265 against 0.063), and vary far less over the site draws of non-IID federation."
- **W3**: resolved. The statement stands once, at 100: "We propose no new method". The disclaimer in the federated subsection is gone (214). The Discussion paragraph opens with its point (409, "Six things separate this study from...") and places "The components themselves are existing tools" after the list (420).
- **W4**: resolved. The full scope stays in the Discussion (431: "none of it extends to ECG foundation models as a class"). 100 is reduced to a reference: "Every statement about a foundation model is scoped to the two models tested, for the reasons given in Section~\ref{sec:discussion}." The Results restatement is gone (267), and the Limitations say "We evaluated two foundation models" (439).
- **W5**: resolved for the three places the comment names. The reason stands in 3.2 (147, "because both are tied to the 12-lead strip format"). The Discussion (407) and the Limitations (441, "No foundation model was evaluated on MIT-BIH, so the MIT-BIH results compare the hand-crafted, conv-AE and raw representations only") give the consequence. 144 also gives a reason ("a lead set fixed by the published models"); both sentences are reworded under V7, which gives the reason once.
- **W6**: resolved. 263: "confirmed every adjacent contrast at $p = 0.002$, the floor for ten paired samples (Section~\ref{sec:methods})." The explanation of the floor stays in the Methods (210).
- **W7**: resolved. The full comparison stands in 4.7 (373). The Discussion (405) refers to it: "The cost comparison of Table~\ref{tab:cost} supports the same rule."
- **W8**: resolved. The task names stand in full at 403; the Conclusion (447) says "on the two tasks evaluated".
- **W9**: resolved. "ordering" is the one term (62, 91, 94, 134, 263 "placed higher in the ordering", 265, 313, 415, 417, 441). 313 is in the past tense: "The ordering of the representations replicated on a different dataset".
- **W10**: resolved. "feature scaling" is the one term, defined at its first use in the Introduction (95): "Feature scaling, the per-feature transformation applied before clustering, changes the result by a wide margin." "materially" is replaced by the values (62: "fell from 0.629 under standard scaling to 0.229 under quantile scaling"; 309). The heading is "Effect of feature scaling" (307), and 309 is in the past tense.
- **W11**: resolved. The property is named by what was measured (62; 338: "the hand-crafted features retained 92\% of their centralized ARI"). The close of 338 is scoped: "On that criterion the hand-crafted features retained more of their clustering ARI than ECGFounder under simulated site heterogeneity on PTB-XL." "cheap", "deployable", "most robust" and "phenotyping" stand nowhere.
- **W12**: resolved. ECGFounder is named at 62, 336, 338 and in the figure caption (360 to 361: "Under non-IID heterogeneity the ARI of ECGFounder falls"). The restating close is replaced by the scope of the result (336): "The reversal was observed at this one ratio and under power scaling".
- **W13**: resolved. "record" names one ECG (74, 76, 269), and the strip is defined once (132): "Each record holds one 10\,s signal of twelve leads, called a strip below." 76 opens with its point: "A master's project that clustered whole 12-lead records reported misleading numbers, and its conclusion is the starting point of this study."
- **W14**: resolved. 94 gives "convolutional autoencoder (conv-AE)"; 407 and 447 say "conv-AE".
- **W15**: resolved. "client" stands nowhere. 96 describes the split in words ("federation across sites that differ sharply in arrhythmia prevalence"). 338: "Non-IID site heterogeneity reduced the ARI of every representation whose centralized ARI is above zero". The word "clients" printed inside the federated figure needs a figure change, which `config.md` does not allow; it goes to the final message.
- **W16**: resolved. 313: "the 21-dimensional beat-morphology feature set clustered well".
- **W17**: resolved. The interval is named once (208: "the patient-bootstrap interval: a patient-grouped percentile bootstrap over the evaluation cohort") and so in 210, 228, 259, 263 and 285. "seed bootstrap interval" at 338 names the other level, the bootstrap over the ten seeds.
- **W18**: resolved. The abstract's last sentence is gone; it now ends "and their extraction cost fifteen times less per record." The Conclusion keeps what is open as its own sentence (447): "Whether these results hold for multi-class arrhythmia cohorts, for other foundation models and for a real multi-institution federation is open."
- **W19**: resolved. 338: "while the ARI of ECGFounder fell from 0.885 to 0.612."
- **W20**: partly resolved. Defined at first use: purity and silhouette (76, "the share of the majority class inside the clusters", "an index of cluster compactness computed without labels"); patient-grouped (62, "so that no patient appeared in more than one fold"); supervised ceiling (62, "the accuracy a supervised classifier reaches on the same features"); internal validity indices (95, "which score a partition from the data alone without labels"). The spectrum is spelled out (115). AFIB and AFLT are expanded and flutter is stated as AF (132: "so atrial flutter records were counted as AF positives"), with the limitation at 441. "foundation family" is gone (439). The source of the project's numbers is named in words (76, "Its report gave..."). Still needed: "beat-template consistency" (143) is defined nowhere. Needs the user: the definition is not in the manuscript or the run, and Decisions leaves it to the final message.
- **W21**: partly resolved. Corrected: the ceilings (62: "although the conv-AE reached a supervised ceiling of 0.678 against a majority baseline of 0.504. The raw ceiling was 0.519, barely above that baseline."); the MIT-BIH set (147: "a separate beat-level feature set of the same kind as the 16 PTB-XL features, not the same features"); the raw label information limited to what is linearly recoverable (269, 273); the stressors stated by their numbers (336); the five-clusterer claim scoped to PTB-XL with the MIT-BIH values (407, 447); the two foundation models "far apart" (427); the upsampling result reported (437: "a difference of 0.013 in favour of the upsampled input"); 496 and 616 in the past tense. Still needed: two passages keep the claim that the single-lead design is what reached the two-lead beats. 143: "A single-lead definition further suited the two-lead MIT-BIH beats, where a twelve-lead definition would not apply." 407: "whereas the single-lead hand-crafted design carried over to them through a separate beat-level feature set of the same kind." The text never says from which lead the 21-dimensional set is computed, and the beat windows are taken "across both leads" (134). Drop "single-lead" from 407 and the MIT-BIH reason from 143, or state the lead set of the 21-dimensional features where the authors give it.
- **W22**: resolved. 74 opens with its point ("The representation fed to a clustering algorithm may decide more of the outcome of clustering the electrocardiogram (ECG) than the algorithm itself."), drops the claims about most work and about the attribution, drops "often", and runs to about 140 words. 89 replaces the self-assessment and "default" and "canonical": "A comparison with hand-crafted features matters because they are interpretable and need no training". 108 hedges the autoencoder claim as a consequence of the objective ("so such a bottleneck may encode a class without arranging it into clusters"). 220: "possibly because the nearest-neighbour affinity graph was poorly connected there. The connectivity of the graph was not measured." 309 drops "a common default" and hedges ("may dominate"). 336: "possibly in part because a 10\% minority cluster is hard to isolate". 338 states the criterion as the study's own: "This study takes the worst site draw as its deployment criterion, because a deployment meets a single site partition". The paragraph with 738 is deleted.
- **W23**: partly resolved. Acknowledged: the HuBERT-ECG window (439: "The shorter window is therefore an alternative explanation for its weak clustering"); the fixed partitions (208: "the patient-bootstrap interval leaves out the variation that refitting the clusterer on a resampled cohort would add"); the pooled scaling (214 and 443: "Feature scaling in the simulation also used statistics pooled over all sites, which separate institutions would not share"); the imbalance result scoped to one ratio and one scaling (336), with the 65-word sentence split. Still needed: the clusterer of the imbalance results is not named (336). Needs the user, as Decisions records.
- **W24**: partly resolved. 147 hedges the lead-set reading: "that dimensionality may itself bear on Euclidean clustering." 269 hedges the cause, "a likely cause of this linear failure is that no fixed offset falls on the same part of the cardiac cycle in two records", but its next sentence states the cause as shown: "A random forest on the same vector reached 0.714, so the misalignment limits what a linear readout can find." The random forest shows that a non-linear readout recovers the label; it does not show that misalignment is the reason (the citation report's C46 reads the sentence the same way). Still needed: state only that the random forest recovered what the linear probe did not, or hedge the link to misalignment ("which is consistent with").
- **W25**: resolved. 275: "On the two representations that cluster well the non-linear probe therefore added little over the linear ceiling (0.951 against 0.942 for the hand-crafted features), so their clustering is not held back by information that only a non-linear readout reaches." 336: "HuBERT-ECG reached an ARI similar to that of ECGFounder... Its partition thus agreed with the classes on record pairs about as well as that of ECGFounder, beyond chance, but carried less information about them."
- **W26**: resolved. The Discussion paragraph "The result also reframes the original master's project honestly." is deleted; its content stands at 76 and 291.
- **W27**: resolved. Headings 218 "Comparison of representations and clustering algorithms on PTB-XL", 289 "Internal indices on degenerate solutions", 307 "Effect of feature scaling". The caption (296) opens "Internal silhouette score against chance-corrected ARI". The title printed inside the silhouette figure needs a figure change and goes to the final message.
- **W28**: resolved. 309: "Feature scaling should therefore be reported in ECG clustering, together with a sweep over scaling methods."
- **W29**: resolved. Title (51): "A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure". Heading 271: "Supervised separability and clustering". The caption (285) opens "Supervised ceiling against clustering ARI per representation". The title inside the figure goes to the final message.
- **W30**: resolved. The four entries close in four shapes (141 "It carries amplitude and energy...", 142 "Because its objective is reconstruction...", 143 "The representation measures directly...", 144 "This arm asks whether..."), and the raw entry gives the lead-set reason in its first sentence.
- **W31**: resolved. 447: "the choice of representation moved clustering ARI further than the choice of clustering algorithm on the two tasks evaluated".
- **W32**: resolved. 76: "The purity equalled the majority-class proportion"; 273: "exists but does not lie along their dominant axes".
- **W33**: resolved. 120: "are zero for a one-cluster solution, since its Rand index equals its expectation and its mutual information with the classes is zero".
- **W34**: resolved. The abstract and 96 state the measure; the headings (212 "Federated clustering", 334 "Class imbalance and federation") and captions (342, 360) no longer use "robustness".
- **W35**: resolved. No semicolon stands in running prose (search above).
- **W36**: resolved. 138 ends in a colon before the list; the sentence announcing the next subsection is gone.
- **W37**: not resolved. The three paragraphs still run to nearly the same length, by a count read from the text: 291 about 91 words, 309 about 97, 313 about 99, with only the figure, two headings and nothing else between them. Still needed: let the lengths follow different content. The values that already stand in the captions can carry it: 291 can take the count of the silhouette panel (157 points over 22 of the 25 cells, 300 to 301), and 313 can take the MIT-BIH ceilings now given only in the caption (beat-morphology 0.925, raw beat 0.741, 320) with what the raw-beat ceiling means.
- **W38**: resolved. The Limitations hold one binary contrast, 441 "rather than to label noise". 443 states the other directly: "The federated study is a simulation on a single physical dataset, and no multi-institution deployment was evaluated."
- **W39**: resolved. The contributions (93 to 98), the clusterer settings (153 to 159), the notation (167 to 174) and the six differences (411 to 418) are lists introduced by a colon, and each of the six differences is a full sentence.
- **W40**: resolved. 78 to 89 joins the closest-benchmark paragraph to its neighbour; 134 is extended to about 115 words; 147 joins the MIT-BIH and lead-set paragraphs; 220 opens with its point ("On PTB-XL the spread of ARI across representations was larger than the spread across clustering algorithms").
- **W41**: partly resolved. 271 to 318 is split by idea and in the past tense (151, 161, 163, 165, 176, 178, 180); 448 to 464 is split into 263 and 265; 714 to 732 into 403, 405 and 407; 771 to 796 into 437, 439, 441 and 443. Still needed: 441 holds three limitations, the binary tasks, the flutter positives ("Within the binary rhythm task the AF class also counted atrial flutter records as positives.") and the missing foundation-model arm on MIT-BIH ("No foundation model was evaluated on MIT-BIH"). Give the flutter positives their own paragraph and move the MIT-BIH sentence to 439, which concerns the coverage of the foundation-model arm.
- **W42**: resolved. 336 opens "The two stressors changed the comparison in different ways."; 338 opens with the non-IID result.
- **W43**: resolved. 278: "The reading that the class information of the weaker embeddings lies off their dominant axes was tested out of fold."
- **W44**: resolved. The three reasons stand as separate sentences (143). The wording of the third is W21's open point.
- **W45**: resolved. 132: "Records were taken from the \mbox{100\,Hz} release of the database as signals of 1000 samples by 12 leads." No numeric type or reader function stands.
- **W46**: resolved. 132 "No filtering, resampling or rescaling was applied before each representation's own preprocessing"; 163 "used as frozen feature extractors with their published weights unchanged"; 214 "Federated clustering consisted of fifteen aggregation rounds"; 379 "measured for each representation separately"; 437 "because bulk access to the \mbox{500\,Hz} records was limited" and "A check at \mbox{500\,Hz} used a 300-record subset in place of the full cohort"; 441 "over the same embeddings".
- **W47**: resolved. 220: "their parameters were not adjusted to the outcome."
- **W48**: partly resolved. 291: "while its largest cluster held a fraction of 1.00 of the cohort". The metrics table reads a fraction of 1 as "one cluster holds every record" (199), and with every record in one cluster the silhouette is undefined, since it needs a nearest other cluster (173; the silhouette caption leaves such fits out, 301 to 302). The text before the run said a few records lay outside. Still needed: say the fraction is rounded and bound the count from it, which the text allows without new results: a fraction of 1.00 to two decimals leaves at most 12 of the 2\,542 records outside the largest cluster.
- **W49**: resolved. The closest benchmark is reported in the past tense (125), and the Methods and Results are in the past tense; the present stays for definitions, interpretation, captions and the Discussion.

### Issues of the citation report the text must still answer

- **V1** (C4, Critical). Introduction, 86 to 89, unchanged by the patch: "including a cluster-separability analysis on PTB-XL \cite{lookingbeyond2026}. By its own statement it does not include a representation-wise comparison against hand-crafted features, and it omits the MIT-BIH database." The source says of earlier benchmarks that they lack a representation-wise evaluation and says nothing of hand-crafted features; its separability analysis pools four 12-lead datasets, PTB-XL among them. Needed, as Decisions says: state only what the source says of earlier benchmarks, for example "...benchmarks four ECG foundation models against one another and includes a cluster-separability analysis over four 12-lead datasets, PTB-XL among them \cite{lookingbeyond2026}. It adds no hand-crafted features, and its datasets do not include the MIT-BIH database.", marked with `\rev{...}`. Calls for: none.
- **V2** (C5, Critical). Methods 3.1, 132: "We used PTB-XL \cite{ptbxl2020}, a public 12-lead database of 21\,799 records from 18\,869 patients." The cited descriptor gives 21\,837 records from 18\,885 patients. Needed, as Decisions says: attribute 21\,799 records from 18\,869 patients to release 1.0.3 of the database (the release the availability statement names, 450) and give the descriptor's 21\,837 and 18\,885 as what the cited paper describes. Calls for: none.
- **V3** (C16, Minor). Introduction, 79 to 83: "a representation may place the discriminative direction far from its dominant axes of variation... This distinction is established in the self-supervised learning literature \cite{sslclustering2025}". The source shows, in self-supervised image models, two layers with nearly the same linear-probe accuracy and different clustering quality; it does not discuss dominant axes, and one study does not establish a literature. Needed: the report's wording ("In self-supervised image models, two layers with nearly the same linear-probe accuracy can differ markedly in clustering quality \cite{sslclustering2025}"), with the dominant-axes sentence kept as the authors' own statement without the citation.
- **V4** (C17, Minor). Related work, 125: "reported the cluster-separability (ARI) of foundation-model embeddings on PTB-XL". Needed: "pooled over four 12-lead datasets, PTB-XL among them", as the report words it.
- **V5** (C18, Minor). Related work, 108 to 112: "Contrastive self-supervised methods built on physiologically motivated augmentations and patient- or lead-level invariances, including CLOCS..., 3KG..., and contrastive predictive coding for 12-lead ECG \cite{mehari2022ssl}, established the pretraining recipes that later foundation models scaled up." None of the three sources says the last clause, and contrastive predictive coding is not built on those augmentations or invariances. Needed: the report's wording, which says the methods preceded the foundation models and describes CLOCS and 3KG apart from contrastive predictive coding.
- **V6** (C19, Minor). Methods 3.2, 143: "Single-lead recordings are also the established setting for automated AF detection \cite{clifford2017af}." Needed: "Automated AF detection from a single short ECG lead was the task of the PhysioNet/Computing in Cardiology Challenge 2017 \cite{clifford2017af}."
- **V7** (C20, Major). 144: "Both took all twelve leads, a lead set fixed by the published models."; 147: "because both are tied to the 12-lead strip format"; 407: "Neither foundation model tested could embed the 2-lead MIT-BIH beats". ECGFounder's authors also publish a single-lead model. The same reading stands in the MIT-BIH table caption (320 to 321, "Foundation models are not applicable to 2-lead beats") and carries the lead clause of the decision rule (403, "or if the leads on hand are not the standard twelve"). Needed: scope each to the versions used, as the report words it (144 "the input of the 12-lead versions of the published models"; 147 "because the versions used take a 12-lead strip of several seconds"; 407 "Neither foundation model version tested"), word the caption and the clause of 403 the same way, and give the reason once in 3.2 (W5).
- **V8** (C21, Minor). Methods 3.4, 214: "we used standard federated $k$-means with FedAvg-style centroid aggregation \cite{fedavg2017}." The source defines FedAvg for gradient-trained models. Needed: "we used federated $k$-means, in which the server aggregates the site centroids by a weighted average, as FedAvg aggregates client models \cite{fedavg2017}", with "site models" or similar if "client" is to stay out of the text (W15).
- **V9** (C22, Minor). Results, 273: "In the weaker embeddings the discriminative information exists but does not lie along their dominant axes of variation, the established separability-versus-clusterability effect \cite{sslclustering2025}." Needed: the off-axis reading as this study's own (tested at 278), and the citation for a comparable gap in self-supervised image models, as the report words it.
- **V10** (C23, Minor). Discussion, 409: "the closest ECG foundation-model clustering benchmark \cite{lookingbeyond2026}". Needed: "the closest benchmark of ECG foundation models, which includes a cluster-separability analysis \cite{lookingbeyond2026}".
- **V11** (C24, Minor). Discussion, 420: "and the federated procedure is standard \cite{fedavg2017}." Needed: "and the centroid aggregation follows the weighted averaging of FedAvg \cite{fedavg2017}."
- **V12** (C25, Minor). Limitations, 439: "other foundation models, including some reported to cluster well \cite{lookingbeyond2026}, were not included." Of the models not included, the source reports good label-level separability for one, ECG-FM. Needed: name ECG-FM, as the report words it.
- **V13** (C26, Minor). Methods 3.1, 134: "the MIT-BIH Arrhythmia Database \cite{mitbih2001,physionet2000}". Needed: "the MIT-BIH Arrhythmia Database \cite{mitbih2001}, distributed through PhysioNet \cite{physionet2000}".
- **V14** (C27, Minor). Code and data availability, 450 to 451: "the MIT-BIH Arrhythmia Database (version 1.0.0) \cite{mitbih2001} are public on PhysioNet." Needed: cite PhysioNet for the access route, "are public on PhysioNet \cite{physionet2000}".

### Lines of the reference checks (`checks.md`, Run 3)

`cite-keys` printed no line. `check-urls` printed these lines that the status rules do not pass:

- **V15**: `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH`. The second start found the DOI registered to the entry's work (OpenAlex W2285072859 and the Crossref BibTeX record give the entry's full title, author, year and venue). Needed: no change to the text or the entry; the line goes to the final message with that reason.
- **V16**: `hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref`. DOI registered to the entry's work; the ratio is the title of a later posting (C28). Needed: no change to the identifier; the line goes to the final message.
- **V17**: `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH`. DOI registered to the entry's work (OpenAlex W2162800060 and the Crossref BibTeX record). Needed: no change; the line goes to the final message.
- **V18**: `clocs2021: no identifier`. Needed: none required; an `eprint` field with arXiv 2005.13249 would give a working link (C31).
- **V19**: `threekg2021: no identifier`. Needed: none required; an `eprint` field with arXiv 2106.04452 (C31).
- **V20**: `vinh2010: no identifier`. Needed: none possible; the only identifier found, 10.5555/1756006.1953024, is not registered in Crossref (C31).
- **V21**: `sklearn2011: no identifier`. Needed: none required; an `eprint` field with arXiv 1201.0490 (C31).
- **V22**: `fedavg2017: no identifier`. Needed: none required; an `eprint` field with arXiv 1602.05629 (C31).

### Issues the revision introduced

- **V23** (Major, Abstract, 62). The patch's new opening states the gap more broadly than the paper's own account of prior work: "but which representation of the signal lets clustering recover clinical classes has not been measured under chance-corrected metrics." Related work (125) and Results (267) report that the closest benchmark measured the ARI, a chance-corrected metric, of foundation-model embeddings, and the Introduction scopes the gap correctly (83 to 85: "What has not been measured, for ECG, is how the common representation families compare on this axis under proper chance-corrected metrics."). Needed: scope the abstract's gap to the comparison across representation families, hand-crafted features among them, as 83 to 85 does. Calls for: none.
- **V24** (Minor, Abstract, 62). The abstract gives the hand-crafted features' ARI as 0.711 ("16 interpretable hand-crafted features were competitive (0.711)") and then as 0.644 ("their ARI fell from 0.644 to 0.591") without naming the clusterer of either; 0.711 is agglomerative clustering and 0.644 is $k$-means (Table~\ref{tab:main}, Table~\ref{tab:fed}). Needed: name $k$-means for the federated values, or say the federated values are for $k$-means.
- **V25** (Minor, Abstract 62 and Introduction 94; prose standard / 0. Hard rules / No repeated construction). The patch copies its definitions from the abstract into the first contribution word for word: 62 "Each representation was bounded by a supervised ceiling, the accuracy a supervised classifier reaches on the same features." and "patient-grouped, so that no patient appeared in more than one fold"; 94 "Each representation is bounded by a supervised ceiling, the accuracy a supervised classifier reaches on the same features" and "patient-grouped, so that no patient appears in more than one fold". 132 states the patient-grouped rule a third time. Needed: keep the definitions in the abstract and give them in the Introduction in a form of their own, or define them in the contribution list and let 132 state the rule as the cohort's procedure.
- **V26** (Minor, Related work, 115; academic writing rules / Precision / Pronoun with a clear antecedent, and prose standard / E. Sentence length). "This study covers the four families above, which range from representations that encode signal energy alone, raw amplitudes and a reconstruction objective, to hand-crafted features that encode the class definition, and it leaves a tensor arm to future work." The paragraph above names hand-crafted features, tensor and wavelet decompositions, reconstruction autoencoders, contrastive methods and foundation models, and not raw flattening, so "the four families above" does not name the four arms of the study; the range leaves out the foundation models. The sentence runs to 41 words with two ideas. Needed: name the four families of the study, place the foundation models in the range or drop the range, and give the tensor arm its own sentence.
- **V27** (Minor, Discussion, 405; manuscript prose standard / Section D, Paragraphs). The split of the Discussion paragraph left 405 at about 61 words by a count read from the text: "The cost comparison of Table~\ref{tab:cost} supports the same rule..." Its content is support for the decision rule of 403. Needed: join 405 with 403, which then covers the rule and its cost, at about 165 words.
- **V28** (Minor; academic writing rules / Concision / One idea per sentence). Two sentences the patch wrote join separate results. 62: "Under federation across ten heterogeneous sites their ARI fell from 0.644 to 0.591 while that of ECGFounder fell from 0.885 to 0.612, and their extraction cost fifteen times less per record." 373: "Both foundation models needed a gigabyte or more of resident memory against \mbox{364\,MB} for the hand-crafted features, about a third of the memory of ECGFounder, and the hand-crafted features carry no learned parameters at all." Needed: give the cost and the parameters each its own sentence.

## Reading 2

What was read: `main.tex` and `refs.bib` as they stand after patches 07 and 08, whole, against the state at reading 1 (`patches/01-main.tex.patched` and `patches/04-refs.bib.patched`, compared by `git diff --no-index --word-diff=plain`) and, where the history of a wording mattered, against the text before the run (`git show HEAD:manuscript/main.tex`); patches 07 and 08 with their apply reports; `intended-claims.md`, claims 28 to 42 for this pass; `citation-report.md`, its passage lines read against each cited sentence the pass changed; `checks.md`, Run 4; the Decisions of `config.md`. Every block patch 07 changed (22 of 91, OP001 to OP022, with the deleted block B0074 traced to where its text went) and every block patch 08 changed (4 of 21) was read in full.

Line numbers in this reading are those of `main.tex` as it now stands (465 lines). Each revised paragraph stands on one source line, so a line number names a paragraph and the quote locates the passage in it.

Checks made for this reading:

- Files: `cmp` finds `manuscript/main.tex` identical to `patches/07-main.tex.patched` and `manuscript/refs.bib` identical to `patches/08-refs.bib.patched`. `shasum -a 256` gives 052812cc... for `01-main.tex.patched` and 77e06786... for `04-refs.bib.patched`, the base hashes the apply reports of 07 and 08 name, so both patches were applied to the state of reading 1.
- Revision marking: every passage the word diff shows changed lies inside `\rev{...}` or a `revblock`. The MIT-BIH table caption (311 to 312) carries `\rev{The 12-lead foundation-model versions used were not applied to the 2-lead beats.}`, and the availability statement (442) carries `\rev{on PhysioNet \cite{physionet2000}.}`. The Limitations paragraph at 430 is the first part of the paragraph that stood at 441 in reading 1, moved without a change, and 432 is the flutter limitation in a paragraph of its own; both are marked.
- Cross-references: a search for `\ref{...}` finds 14 keys referred to, each with its `\label`; the references the pass added (282 fig:trap, 394 tab:cost, 428 and 432 sec:methods, 432 sec:intro) all resolve.
- Semicolons: ";" stands only at 15 (a preamble comment) and 185 to 187 (cells of the metrics table).
- Characters: `LC_ALL=C grep -n '[^ -~]'` finds nothing. A search for spaced dashes finds only `--` in the CRediT roles (450, 451), text from before the run that neither patch touched.
- Terms: the search list of reading 1 finds none of "ranking", "conditioning", "conditioner", "scaler", "materially", "cheap", "client", "reconstruction-autoencoder", "simply", "phenotyp", "float32", "wfdb", "honest", "often" or "deployab", and the pass's own targets "established", "standard federated" and "twelve-lead definition" stand nowhere. "robust" stands only as the name of a scaling method (171, 300). "recording" stands only for the pretraining corpora and for recordings held at institutions (105, 416, 434, 438). "family" stands once, at 62 ("each common family of signal representation"), in the sense of the paper's "representation families", and not as the undefined "foundation family" of W20. "single-lead" stands once, at 138, for the hand-crafted arm on PTB-XL.
- Numbers the pass wrote: the bound at 282 ("at most 12 of the 2\,542 records") is 2\,542 x 0.005 = 12.71, rounded down, the most records a largest-cluster fraction that rounds to 1.00 can leave outside; the fraction cannot be exactly 1, since a silhouette of 0.81 was computed and the silhouette needs a nearest other cluster (164). The 157 solutions over 22 of 25 cells (282) are the silhouette caption's (291 to 293) and equal 3 seeded clusterers x 10 seeds x 5 representations, plus 5 Ward fits, plus the 2 HDBSCAN fits that assigned records. The ceilings 0.741 and 0.925 (304) are the MIT-BIH caption's (311). "about a third" (364) is 364.0 against 1037.6 MB in Table~\ref{tab:cost}. The PTB-XL counts at 123 are those of the text before the run (21\,799 records, 18\,869 patients, HEAD line 192) and of the descriptor's passage line (21837 records, 18885 patients). No other number of the pass is new to the manuscript.
- `refs.bib`: the diff against reading 1 holds the four `eprint` fields of patch 08 and nothing else. `kpsewhich elsarticle-num.bst` finds the style, whose lines 65, 1066 to 1069 and 1094 to 1095 print an `eprint` field as an arXiv link, so the four identifiers reach the printed reference list.
- Reference checks, Run 4: `cite-keys` printed no line. `check-urls` printed four lines the status rules do not pass, the same four lines as items V15, V16, V17 and V20 (read below), so no new item is numbered for them.

### Summary of reading 2

| Item | Status | Item | Status | Item | Status |
|---|---|---|---|---|---|
| W20 | partly resolved | V5 | resolved | V17 | no change needed |
| W21 | resolved | V6 | resolved | V18 | resolved |
| W23 | partly resolved | V7 | resolved | V19 | resolved |
| W24 | resolved | V8 | resolved | V20 | no change needed |
| W37 | resolved | V9 | resolved | V21 | resolved |
| W41 | resolved | V10 | resolved | V22 | resolved |
| W48 | resolved | V11 | resolved | V23 | resolved |
| V1 | resolved | V12 | resolved | V24 | resolved |
| V2 | resolved | V13 | resolved | V25 | resolved |
| V3 | resolved | V14 | resolved | V26 | resolved |
| V4 | resolved | V15 | no change needed | V27 | resolved |
| | | V16 | no change needed | V28 | resolved |

Of the 35 items read: resolved 29, partly resolved 2 (W20 and W23, each for one fact that needs the user), no change needed 4 (V15, V16, V17, V20), not resolved 0. New items V29 to V31, all Minor, introduced by patch 07. None of the 42 items reading 1 marked resolved was undone.

### The items reading 1 left open

- **W20**: partly resolved. The definitions reading 1 confirmed stand unchanged: purity and silhouette (76), patient-grouped (62, and 89 "every record of a patient stays in one fold"), supervised ceiling (62, 89), internal validity indices (90), AFIB and AFLT (123). Still needed: "beat-template consistency" (134, "QRS width and amplitude, and beat-template consistency \cite{hrvstandards1996,dechazal2004}") is defined nowhere; a search finds "template" only there. Needs the user: the definition is in neither the manuscript nor the run, as Decisions records, and it goes to the final message.
- **W21**: resolved. The two passages reading 1 left open no longer claim that the single-lead design is what reached the two-lead beats. 134 drops the MIT-BIH reason; its third sentence now reads "Automated AF detection from a single short ECG lead was also the task of the PhysioNet/Computing in Cardiology Challenge 2017 \cite{clifford2017af}." 396: "whereas the hand-crafted design carried over to them through a separate beat-level feature set of the same kind." The corrections reading 1 confirmed stand (62, 138, 260, 264, 327, 396, 416, 426).
- **W23**: partly resolved. The acknowledgments reading 1 confirmed stand (199, 205, 327, 428, 434). Still needed: the clusterer of the imbalance results is not named; 327 reads "At the natural-like 9:1 SR:AF ratio (majority 0.90) the ARI of every representation above chance fell, possibly in part because a 10\% minority cluster is hard to isolate with a partitional method", and the abstract's "Under heavy class imbalance the hand-crafted features overtook ECGFounder" names none either. Needs the user, as Decisions records.
- **W24**: resolved. 260: "A random forest on the same vector reached 0.714. A non-linear readout thus recovered label information that the linear probe missed, which is consistent with misalignment as the cause." The misalignment is now hedged in both sentences that carry it ("a likely cause", "consistent with"), and claim 37 of `intended-claims.md` holds it at that strength. 138 keeps its hedge ("that dimensionality may itself bear on Euclidean clustering").
- **W37**: resolved. By a count read from the text the three paragraphs now run to about 159 words (282), 97 (300) and 138 (304). 282 takes the count of the silhouette panel ("Fig.~\ref{fig:trap} plots 157 clustering solutions, which cover 22 of the 25 representation-by-clusterer cells"), and 304 takes the MIT-BIH ceilings ("The supervised ceiling of the raw beat window was 0.741 on this balanced task, against 0.925 for the beat-morphology features."). The new sentence of 304 raises V29.
- **W41**: resolved. The flutter positives have their own paragraph (432, "The AF class of the rhythm task also counted atrial flutter records as positives."), and the missing foundation-model arm on MIT-BIH stands with the coverage of that arm (428, "Neither of the two was evaluated on MIT-BIH, for the reason given in Section~\ref{sec:methods}."). 430 keeps the binary tasks alone. The Limitations now hold one paragraph per limitation (426, 428, 430, 432, 434). The flutter paragraph raises V31.
- **W48**: resolved. 282: "That fraction is rounded to two decimals, so at most 12 of the 2\,542 records lay outside the largest cluster." The bound is correct (checks above), and the text states it as a bound and not as a count, as claim 39 of `intended-claims.md` says.

### The items V1 to V28

- **V1**: resolved. 84: "The most directly related work benchmarks several ECG foundation models against one another and includes a cluster-separability analysis pooled over 12-lead datasets, PTB-XL among them \cite{lookingbeyond2026}. It adds no hand-crafted features, and its datasets do not include the MIT-BIH database." The source's passage lines carry each part (sec. 3.2, four foundation models; sec. 3.1, the four 12-lead datasets GEO, C15, PTX and CHN; sec. 3.4, label-level and dataset-level separability). "By its own statement" is gone. This sentence and 116 raise V30.
- **V2**: resolved. 123: "We used PTB-XL, a public 12-lead database, in its version 1.0.3, which holds 21\,799 records from 18\,869 patients. The paper that describes the database \cite{ptbxl2020} reports 21\,837 records from 18\,885 patients." The cited paper is now cited only for the counts its passage line gives. The counts of release 1.0.3 are the authors' own, given before the run, and rest on no passage read in the run, as Decisions records; they go to the final message with C5.
- **V3**: resolved. 81: "In self-supervised image models, two layers with nearly the same linear-probe accuracy can differ notably in clustering quality \cite{sslclustering2025}, and we treat this distinction as background rather than as a finding." The source's passage line (sec. 3) gives the two layers, "nearly the same linear evaluation accuracy" and "notable differences" in the clustering metrics. The dominant-axes sentence (78 to 81) stands without the citation as the authors' statement, and "established in the self-supervised learning literature" is gone.
- **V4**: resolved. 116: "reported the cluster-separability (ARI) of foundation-model embeddings pooled over 12-lead datasets, PTB-XL among them, and found that some models clustered by clinical label while others clustered by dataset."
- **V5**: resolved. 103: "Contrastive self-supervised methods for the ECG preceded the foundation models below. CLOCS \cite{clocs2021} builds on patient- and lead-level invariances, and 3KG \cite{threekg2021} on physiologically motivated augmentations. Contrastive predictive coding for 12-lead ECG adapts a self-supervised method from other domains \cite{mehari2022ssl}." Each source is now cited for what its passage line holds (CLOCS: patient-specific contrast over temporal and spatial information; 3KG: physiologically inspired contrastive learning; mehari2022ssl: "we adapt state-of-the-art self-supervised methods ... to the ECG domain"), and "established the pretraining recipes that later foundation models scaled up" is gone. "preceded" agrees with the years of the entries (2021, 2021, 2022 against 2024).
- **V6**: resolved. 134, quoted under W21, takes the wording the citation report gives for C19, which the source's sec. 1 carries.
- **V7**: resolved. 135: "Both took all twelve leads, the input of the 12-lead versions of the published models." 138 gives the reason once: "Neither foundation model was applied to the 2-lead beats. The versions used take a 12-lead strip of several seconds, and each MIT-BIH input is a 2-lead window around one R-peak." The caption (311 to 312): "The 12-lead foundation-model versions used were not applied to the 2-lead beats." The decision rule (394): "the 12-lead format that the tested version of ECGFounder takes" and "the leads on hand are not the twelve that the tested foundation-model versions take". 396: "Neither foundation model version tested could embed the 2-lead MIT-BIH beats". 428 points to the Methods for the reason. W5 still holds: the reason stands once, at 138.
- **V8**: resolved. 205: "we used federated $k$-means, in which the server averages the site centroids with weights, as FedAvg averages locally trained models \cite{fedavg2017}." The source's sec. 2 line ("the server then takes a weighted average of the resulting models") carries the comparison; "standard" and "client" are gone.
- **V9**: resolved. 264: "This study reads the gap of the weaker embeddings as one of geometry: their discriminative information exists but does not lie along their dominant axes of variation. A comparable gap between linear-probe accuracy and clustering quality has been reported for self-supervised image models \cite{sslclustering2025}."
- **V10**: resolved. 398: "Six things separate this study from the closest benchmark of ECG foundation models, which includes a cluster-separability analysis \cite{lookingbeyond2026}:"
- **V11**: resolved. 409: "and the centroid aggregation follows the weighted averaging of FedAvg \cite{fedavg2017}."
- **V12**: resolved. 428: "Others were not included, among them ECG-FM, whose embeddings the benchmark of \cite{lookingbeyond2026} reported to separate clinical labels." The source's sec. 5 and sec. 6 lines name ECG-FM with ECGFounder as the embeddings with the better label-level separability.
- **V13**: resolved. 125: "the MIT-BIH Arrhythmia Database \cite{mitbih2001}, distributed through PhysioNet \cite{physionet2000}."
- **V14**: resolved. 441 to 442: "are public \rev{on PhysioNet \cite{physionet2000}.}"
- **V15**: no change needed. Run 4 prints the same line, `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH`. The second start of the citation report found the DOI registered to the entry's work; the line goes to the final message with that reason.
- **V16**: no change needed. Run 4: `hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref`. The DOI is registered to the entry's work, and the ratio is the title of a later posting (C28, which needs the user); the line goes to the final message.
- **V17**: no change needed. Run 4: `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH`. DOI registered to the entry's work; the line goes to the final message.
- **V18**: resolved. Run 4: `clocs2021: 200 https://arxiv.org/abs/2005.13249`. `refs.bib` holds `eprint = {2005.13249}, archivePrefix = {arXiv}`, the identifier the citation report's second start matched by arXiv.
- **V19**: resolved. Run 4: `threekg2021: 200 https://arxiv.org/abs/2106.04452`; `eprint = {2106.04452}`.
- **V20**: no change needed. Run 4: `vinh2010: no identifier`. No identifier is possible: the only one found is not registered in Crossref (C31), and arXiv found nothing. The line goes to the final message.
- **V21**: resolved. Run 4: `sklearn2011: 200 https://arxiv.org/abs/1201.0490`; `eprint = {1201.0490}`.
- **V22**: resolved. Run 4: `fedavg2017: 200 https://arxiv.org/abs/1602.05629`; `eprint = {1602.05629}`. The venue and year of C12 to C15 remain unconfirmed and go to the final message, as Decisions records; the identifiers do not bear on them.
- **V23**: resolved. 62: "How well clustering recovers clinical classes from each common family of signal representation, hand-crafted features among them, has not been compared under chance-corrected metrics." The gap is now the comparison across families, as the Introduction (82 to 83) and Related work (116) give it, and no longer contradicts the closest benchmark's ARI analysis.
- **V24**: resolved. 62: "ECGFounder clustered best (ARI up to 0.885 with $k$-means), and 16 interpretable hand-crafted features were competitive (0.711 with agglomerative clustering)" and "Under federation across ten heterogeneous sites the $k$-means ARI of the hand-crafted features fell from 0.644 to 0.591". The values agree with Table~\ref{tab:main} and Table~\ref{tab:fed}.
- **V25**: resolved. 89 now gives the rules in a form of its own: "it is patient-grouped: every record of a patient stays in one fold. A supervised classifier trained on each representation sets its supervised ceiling, against which its clustering is read." 123 states the rule as the cohort's procedure: "Every fold of the evaluation was drawn by patient, and no patient contributed records to both classes." The abstract keeps its definitions (62). No sentence is copied between the three.
- **V26**: resolved. 106: "This study compares four representation families: raw flattening, the conv-AE, hand-crafted features and frozen foundation-model embeddings. Raw flattening and the conv-AE encode signal energy, through the sample amplitudes and the reconstruction objective. The foundation-model embeddings place each record in a feature space fixed by large-scale pretraining, and the hand-crafted features encode the quantities that define the classes. A tensor arm is left to future work." The four families are named, the foundation models are placed, and the tensor arm has its own sentence.
- **V27**: resolved. The cost paragraph is joined to the decision rule (394, ending "The cost comparison of Table~\ref{tab:cost} supports the same rule. ... therefore costs neither compute nor interpretability."), its text unchanged, and 394 runs to about 185 words by a count read from the text.
- **V28**: resolved. 62: "...while that of ECGFounder fell from 0.885 to 0.612. The extraction of the hand-crafted features cost fifteen times less per record than that of ECGFounder." 364: "...about a third of the memory of ECGFounder. The hand-crafted features also carry no learned parameters."

### The items reading 1 marked resolved

None was undone. The blocks patch 07 changed hold the passages of these items, read again:

- W1, W10, W11, W12, W18: the abstract (62) still states the contribution without the disclaimer, gives the scaling values, names the measured property, names ECGFounder, and ends on a result and not on a restating close.
- W2, W7, W8: 394 keeps "overtake it under the 9:1 imbalance (ARI 0.265 against 0.063), and vary far less over the site draws of non-IID federation", the reference to the cost table without the three measures, and the two task names in full; the Conclusion (438) keeps "on the two tasks evaluated".
- W3: 409 still places "The components themselves are existing tools" after the list of six differences.
- W5: the reason for the missing foundation-model arm on MIT-BIH stands once, at 138 (see V7).
- W13, W14, W15, W16: "record", "conv-AE" (106 "the conv-AE"), "sites" (205 "the site centroids", with "locally trained models" in place of "client models") and "beat-morphology feature set" (304) are kept in the passages the pass rewrote.
- W22: 84 keeps "A comparison with hand-crafted features matters because they are interpretable and need no training"; 103 keeps the hedged autoencoder sentence.
- W30, W44: the hand-crafted entry (134) keeps its closing "The representation measures directly the two quantities that make up the AF signature", and its reasons stand as separate sentences.
- W35, W38: no semicolon in running prose (checks above); the Limitations keep one binary contrast, "rather than to label noise" (430).
- W40: 84, 125 and 138 keep the joined paragraphs.
- W49: the sentences the pass wrote keep the tenses of their sections (304 "was 0.741", 432 "was computed", 123 "holds" and "reports" for the database and its paper).

### Issues the second pass introduced

- **V29** (Minor, Results 4.5, 304; academic writing rules / Paragraphs / Evidence followed by what it means, and Objectivity / Claims rest on evidence). The sentences patch 07 added show that the raw beat window on MIT-BIH holds label information that a supervised probe finds: "The supervised ceiling of the raw beat window was 0.741 on this balanced task, against 0.925 for the beat-morphology features. A supervised probe thus found label information in the raw beat window that its clustering did not recover." On PTB-XL the paper reads the raw failure as a lack of label information (260: "The raw representation therefore lacks linearly recoverable label information"; 264: ceiling 0.519 against 0.504). The raw arm thus fails in a different way on the two tasks, and the paragraph does not say so; its close, "The same pattern appeared for rhythm on PTB-XL and for morphology on MIT-BIH, which supports the representation-level reading of the PTB-XL results", now reads as covering the raw arm too. The reader is left unsure whether the raw beat window confirms or departs from the PTB-XL reading. Needed: say that on MIT-BIH, where the beats are R-peak aligned (304), the raw beat window held label information a supervised probe found (0.741) but did not cluster it, unlike raw flattening on PTB-XL, which is consistent with the misalignment reading of 260; and scope "the same pattern" to the ordering of the representations and the gap of the conv-AE. Calls for: none; every value is in the manuscript.
- **V30** (Minor, Introduction 84 and Related work 116; prose standard / 0. Hard rules / No repeated construction). Patch 07 gave the Introduction and the paragraph "Closest benchmark" the same account of the closest benchmark, with a phrase repeated word for word. 84: "includes a cluster-separability analysis pooled over 12-lead datasets, PTB-XL among them \cite{lookingbeyond2026}. It adds no hand-crafted features, and its datasets do not include the MIT-BIH database." 116: "reported the cluster-separability (ARI) of foundation-model embeddings pooled over 12-lead datasets, PTB-XL among them, ... It did not add a hand-crafted baseline, and it did not include MIT-BIH." Needed: keep the full account in 116, where the paragraph on the closest benchmark stands, and in 84 name the benchmark and the two gaps in a form of its own (for example, that it compares foundation models with one another and leaves out hand-crafted features and MIT-BIH), without the repeated phrase. Calls for: none.
- **V31** (Minor, Limitations 432; prose standard / E. Sentence shapes / Restating closes, applied to a restating sentence, and academic writing rules / Reader's path / Clarity test). The first two sentences of the new flutter paragraph state the same rule: "The AF class of the rhythm task also counted atrial flutter records as positives. The cohort took every record with an AFIB or AFLT statement as AF (Section~\ref{sec:methods})." The Methods already state it (123, "so atrial flutter records were counted as AF positives"), so the rule now stands three times, twice in adjacent sentences. Needed: state it once in 432, in one sentence with the pointer to the Methods, and keep the rest of the paragraph as it stands. Calls for: none.

# Items

Source: the comments file `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/single-5/writing-report.md`, a `/writing` report with 49 numbered findings. Each finding is one item `W<k>`, with `<k>` the report's number: W1 to W49, 49 items. No finding is dropped, merged or narrowed. Lettered parts such as W1(a) are the places and "Also:" sub-points of one finding, not separate items.

Manuscript: `manuscript/main.tex` (840 lines, inputs no other file). Every line number below is main.tex as it stands in this run. Every quoted passage of the report was checked against main.tex; all of them stand. Where the current line differs from the line the report gives, the item says so.

Calls beyond a text change: config.md sets New references: No, Numbers from saved results: No, Figure changes: No. Each item states whether it would need any of them. Where a finding asks for support that only a new reference or a saved result could give, the item says so and gives a fix that stays within the manuscript's own material.

config.md Notes: a passage this run adds or changes keeps the `\rev{...}` or `revblock` marking.

Sections of main.tex by line: title 51-52; Abstract 61-86; 1 Introduction 95-149; 2 Related work 151-185; 3 Methods 187-393 (3.1 Data and cohorts 189, 3.2 Representations 214, 3.3 Clustering and evaluation 269, Table metrics 320-340, 3.4 Federated robustness 378); 4 Results 395-710 (4.1 at 397 with Table main 407-435 and Fig. heatmap 437-446, 4.2 at 493 with Fig. sep 535-546, 4.3 at 548 with Fig. trap 560-572, 4.4 at 574, 4.5 at 585 with Table mitbih 595-612, 4.6 at 614 with Table fed 643-658 and Fig. fed 660-671, 4.7 at 674 with Table cost 684-710); 5 Discussion 712-767; 6 Limitations 769-796; 7 Conclusion 798-813.

---

## W1

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 1. The draft says in three places that the ranking is not the contribution. The rule says a sentence shape that comes back across sections is a template and should be rewritten.
  > - main.tex:78, "The ranking is largely expected, since SR and AF differ by definition in rhythm regularity; the contribution is the chance-corrected controls"
  > - main.tex:132, "The resulting ranking is not the contribution."
  > - main.tex:752, "None of these is a new method, and the ordering of the representations is not itself the result."
  > Also, at 78, 132 and 753: prose standard / D. Structure / No synonym cycling. These passages call the concept "ranking", while finding 9 calls it "ordering".
  > Also, at 752: prose standard / E. Sentence shapes / Restating closes. This last sentence of the paragraph says again what the paragraph opens with, "We claim no methodological novelty." (main.tex:740).
- What it asks: state once that the ordering of the representations is expected and is not the contribution, and rewrite the other two places; use one term for the concept; cut the restating close of the Discussion paragraph.
- Sections: Abstract; 1 Introduction; 5 Discussion.
- Places checked:
  - W1(a) "The ranking is largely expected, ... the chance-corrected controls": stands, lines 78-79.
  - W1(b) "The resulting ranking is not the contribution.": stands, lines 132-133.
  - W1(c) "None of these is a new method, and the ordering of the representations is not itself the result.": stands, lines 752-753.
  - W1(d) Also, synonym cycling at 78, 132 and 753: "ranking" stands at 78 and 132, "ordering" at 753 (see W9).
  - W1(e) Also, restating close at 752: the opening "We claim no methodological novelty." stands at line 740.
- Severity: Minor.
- Suggested fix: keep the statement where its reason is given, in the Introduction (132-135, "Because SR and AF differ by definition in the regularity of the rhythm ..."). In the Abstract (78-79) state the contribution directly (the chance-corrected controls and the behaviour under imbalance and federation) without the "the ranking is ... ; the contribution is" shape. Cut the last sentence of the Discussion paragraph (752-753), which repeats line 740. Use the one term chosen under W9 in every place that remains.
- Calls for: new reference no; figure change no; number from saved results no.

## W2

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 2. main.tex:721, "overtake it under class imbalance, and hold far more of their clustering ARI under site heterogeneity". This repeats the contributions sentence at main.tex:145, "overtaking the foundation embedding under imbalance and holding far more of their clustering ARI under site heterogeneity". The rule asks for the repeated shape to be rewritten.
- What it asks: rewrite one of the two sentences so that the Discussion does not repeat the Introduction's wording.
- Sections: 5 Discussion; 1 Introduction.
- Places checked:
  - W2(a) "overtake it under class imbalance, and hold far more of their clustering ARI under site heterogeneity": stands, lines 721-722.
  - W2(b) "overtaking the foundation embedding under imbalance and holding far more of their clustering ARI under site heterogeneity": stands, lines 145-146.
- Severity: Minor.
- Suggested fix: in the Discussion (721-722) give the comparison through the results it rests on, which the text already reports: ARI 0.265 against 0.063 at the 9:1 ratio (622-623) and retention 0.92 against 0.69 under non-IID federation (Table fed, 652-653), in place of the Introduction's phrase.
- Calls for: new reference no; figure change no; number from saved results no.

## W3

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 3. The statement that the study proposes no new method comes back in several places. The rule asks for the repeated shape to be rewritten.
  > - main.tex:147, "We do not propose a new method"
  > - main.tex:381, "we do not propose a new federated method"
  > - main.tex:740, "We claim no methodological novelty."
  > Also: references/rules.md / Paragraphs / First sentence states the point. The rule asks the first sentence to state the paragraph's main point. Most of this paragraph sets out what separates this study from the closest benchmark.
  > - main.tex:752, "None of these is a new method". This sentence is given in finding 1.
- What it asks: state once that no new method is proposed and rewrite the other places; open the Discussion paragraph at 740 with its main point.
- Sections: 1 Introduction; 3.4 Federated robustness; 5 Discussion.
- Places checked:
  - W3(a) "We do not propose a new method": stands, lines 147-148.
  - W3(b) "we do not propose a new federated method": stands, lines 381-382.
  - W3(c) "We claim no methodological novelty.": stands, line 740.
  - W3(d) Also, first sentence states the point, for the paragraph at 740-753: stands; the paragraph sets out the six differences from the closest benchmark from line 742.
  - W3(e) "None of these is a new method": stands, line 752 (also W1(c)).
- Severity: Minor.
- Suggested fix: keep the statement in the Introduction (147-148). At 381-382 the sentence already says the federated k-means is standard; cut the clause "we do not propose a new federated method". Open the Discussion paragraph with what separates this study from the closest benchmark (now at 742-743), and fold the sentence on known components (740-742) after it or cut it; cut 752 with W1.
- Calls for: new reference no; figure change no; number from saved results no.

## W4

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 4. The sentence that limits the claims to the two models tested comes back in four places. The rule asks for the repeated shape to be rewritten.
  > - main.tex:148, "we scope every foundation-model statement to the two models we test"
  > - main.tex:468, "We therefore name each model and do not generalise to foundation models as a class"
  > - main.tex:764, "none of it extends to ECG foundation models as a class"
  > - main.tex:778, "which is why we name the two we test rather than generalising"
- What it asks: state the scope limit once and rewrite or cut the other three.
- Sections: 1 Introduction; 4.1; 5 Discussion; 6 Limitations.
- Places checked:
  - W4(a) "we scope every foundation-model statement to the two models we test": stands, lines 148-149.
  - W4(b) "We therefore name each model and do not generalise to foundation models as a class": stands, lines 468-469.
  - W4(c) "none of it extends to ECG foundation models as a class": stands, lines 764-765.
  - W4(d) "which is why we name the two we test rather than generalising": stands, lines 778-779.
- Severity: Minor.
- Suggested fix: keep the full statement of scope in the Discussion paragraph that argues it (755-767). In the Introduction keep one clause that the claims concern HuBERT-ECG and ECGFounder, worded differently from 764-765. Cut the sentence at 468-469 (the paragraph already names each model) and the clause at 778-779.
- Calls for: new reference no; figure change no; number from saved results no.

## W5

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 5. The statement that the foundation models are tied to the 12-lead format appears three times. The rule asks for the repeated shape to be rewritten.
  > - main.tex:261, "such models are tied to the 12-lead strip format"
  > - main.tex:727, "are tied to the 12-lead strip format and cannot embed the 2-lead MIT-BIH beats"
  > - main.tex:786, "The MIT-BIH arm omits the foundation models because they are tied to the 12-lead strip format."
- What it asks: state the lead constraint once and rewrite the other two.
- Sections: 3.2 Representations; 5 Discussion; 6 Limitations.
- Places checked:
  - W5(a) "such models are tied to the 12-lead strip format": stands, line 261.
  - W5(b) "are tied to the 12-lead strip format and cannot embed the 2-lead MIT-BIH beats": stands, lines 727-728.
  - W5(c) "The MIT-BIH arm omits the foundation models because they are tied to the 12-lead strip format.": stands, lines 786-787.
- Severity: Minor.
- Suggested fix: keep the statement in Methods (260-261). In the Discussion (727-728) give only its consequence for the decision rule, that the two models could not be applied to the 2-lead MIT-BIH beats. In the Limitations (786-787) cut the sentence, or say only that the MIT-BIH arm has no foundation-model row, with a reference to Section 3.2.
- Calls for: new reference no; figure change no; number from saved results no.

## W6

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 6. main.tex:455, "That floor is reached by any contrast in which all ten seeds move the same way, so the p-value orders none of the three". This repeats the Methods sentence at main.tex:371, "the two-sided p-value is pinned at its floor of 0.002 as soon as every seed moves the same way, so it separates none of the contrasts". The rule asks for the repeated shape to be rewritten.
- What it asks: rewrite the Results sentence so it does not repeat the Methods sentence.
- Sections: 4.1; 3.3 Clustering and evaluation.
- Places checked:
  - W6(a) "That floor is reached by any contrast ... so the p-value orders none of the three": stands, lines 455-457.
  - W6(b) "the two-sided p-value is pinned at its floor of 0.002 as soon as every seed moves the same way, so it separates none of the contrasts": stands, lines 371-372.
- Severity: Minor.
- Suggested fix: keep the explanation in Methods (370-372). In Results (455-457) refer to it (Section 3.3) and go straight to the effect sizes, Cliff's delta and the rank-biserial correlation at 1.00 on all three contrasts.
- Calls for: new reference no; figure change no; number from saved results no.

## W7

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 7. main.tex:723, "The hand-crafted extraction is fifteen times cheaper per record than ECGFounder, holds about a third of the resident memory and loads no learned parameters at all". This repeats main.tex:678, "fifteen times the hand-crafted extraction ... which carries no learned parameters at all". The rule asks for the repeated shape to be rewritten.
- What it asks: rewrite the Discussion sentence so it does not repeat the cost subsection.
- Sections: 5 Discussion; 4.7 Deployment cost.
- Places checked:
  - W7(a) "The hand-crafted extraction is fifteen times cheaper per record than ECGFounder, holds about a third of the resident memory and loads no learned parameters at all": stands, lines 723-724.
  - W7(b) "fifteen times the hand-crafted extraction ... which carries no learned parameters at all": stands, lines 678-681 (the elided passage runs over 678-680).
- Severity: Minor.
- Suggested fix: in the Discussion (722-726) refer to Table cost and state only what the cost adds to the decision rule, that the representation with the higher retention under both stressors is also the lower-cost one, without restating the factor of fifteen and the parameter clause.
- Calls for: new reference no; figure change no; number from saved results no.

## W8

- Report group: Fix first. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 8. main.tex:802, "on the two tasks evaluated here: SR-versus-AF rhythm separation in PTB-XL and N-vs-V beat morphology in MIT-BIH". This repeats main.tex:714, "it is a rule for the two tasks evaluated here: SR-versus-AF rhythm separation on PTB-XL and N-vs-V beat morphology on MIT-BIH". The rule asks for the repeated shape to be rewritten.
- What it asks: rewrite one of the two scope statements.
- Sections: 7 Conclusion; 5 Discussion.
- Places checked:
  - W8(a) "on the two tasks evaluated here: SR-versus-AF rhythm separation in PTB-XL and N-vs-V beat morphology in MIT-BIH": stands, lines 802-803.
  - W8(b) "it is a rule for the two tasks evaluated here: SR-versus-AF rhythm separation on PTB-XL and N-vs-V beat morphology on MIT-BIH": stands, lines 714-715.
- Severity: Minor.
- Suggested fix: keep the full scope statement in the Conclusion's first sentence (800-803), and in the Discussion (714-715) name the two tasks briefly (the PTB-XL rhythm task and the MIT-BIH morphology task) in a different sentence shape, or the reverse.
- Calls for: new reference no; figure change no; number from saved results no.

## W9

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 9. One concept is called both "ordering" and "ranking". The rule asks for one term per concept, used every time.
  > - main.tex:75, "The same ordering holds on a MIT-BIH beat-morphology task."
  > - "ordering" also appears at 422, 460, 753 and 785. "ranking" appears at 78 and 132. The passages at 78, 132 and 753 are given in finding 1.
  > - main.tex:587, "The ordering replicates on a different dataset and a different task type"
  > Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
- What it asks: one term for the order of the representations, used every time; past tense at 587.
- Sections: Abstract; 1 Introduction; 4.1; 4.5; 5 Discussion; 6 Limitations.
- Places checked:
  - W9(a) "The same ordering holds on a MIT-BIH beat-morphology task.": stands, line 75.
  - W9(b) "ordering" at 422, 460, 753 and 785: stands at each. "ranking" at 78 and 132: stands at each.
  - W9(c) "The ordering replicates on a different dataset and a different task type": stands, line 587.
  - W9(d) Also, tense at 587: present tense stands.
  - Not named by the finding, for the draft writer: "ranking" also stands at line 752, "the balanced-data ranking stops being the useful answer".
- Severity: Minor.
- Suggested fix: use "ordering", the term at 75, 422, 460, 587, 753 and 785, and replace "ranking" at 78, 132 and 752. At 587 write "The ordering replicated on a different dataset and a different task type".
- Calls for: new reference no; figure change no; number from saved results no.

## W10

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 10. One operation is called "conditioning", "conditioners", "scaling", "feature scaler" and "scaler dependence". The rule asks for one term per concept.
  > - main.tex:77, "the feature scaler materially changes the outcome"
  > Also: references/rules.md / Common style errors / Vague phrase. The rule asks for the specific claim, here the numbers given at 576 to 580, in place of "materially".
  > - main.tex:142, "feature conditioning changes the result by a wide margin"
  > Also: references/rules.md / Precision / Term defined at first use. "Conditioning" is never defined. What it means first becomes clear at 313.
  > - main.tex:289, "Conditioning is fitted on the full representation matrix"
  > - main.tex:313, "we sweep four conditioners (Yeo-Johnson power, standard, quantile, robust) and report power scaling as the default"
  > - main.tex:576, "The feature scaler changes the outcome materially." The heading above it, at 574, calls the same thing "Conditioning". That heading is given in finding 27.
  > Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  > - "scaler dependence" appears at 750 (given in finding 39) and "feature conditioning" at 809.
- What it asks: one term for the per-feature transformation before clustering, defined at first use; the numbers in place of "materially"; past tense in Results.
- Sections: Abstract; 1 Introduction; 3.3; 3.4; 4.4; 5 Discussion; 7 Conclusion.
- Places checked:
  - W10(a) "the feature scaler materially changes the outcome": stands, lines 77-78.
  - W10(b) Also, vague phrase "materially" at 77: stands; the numbers stand at 577-580.
  - W10(c) "feature conditioning changes the result by a wide margin": stands, line 142.
  - W10(d) Also, term defined at first use: "conditioning" has no definition in main.tex; the four methods are first named at 313-314.
  - W10(e) "Conditioning is fitted on the full representation matrix": stands, line 289.
  - W10(f) "we sweep four conditioners (Yeo-Johnson power, standard, quantile, robust) and report power scaling as the default": stands, lines 313-314.
  - W10(g) "The feature scaler changes the outcome materially.": stands, line 576; heading "Conditioning matters" stands at 574.
  - W10(h) Also, tense at 576: present tense stands.
  - W10(i) "scaler dependence" stands at 750; "feature conditioning" stands at 809.
  - Not named by the finding, for the draft writer: "conditioning" also stands at 291 ("before conditioning") and 386; "materially" also stands at 774 ("does not materially change the result").
- Severity: Minor.
- Suggested fix: choose one term, for example "feature scaling", with "scaler" only for one of the four methods. Define it where it first appears in the body (142): the per-feature transformation applied to a representation before clustering, with the four methods named. Use it at 77, 142, 289, 291, 313, 386, 574, 576, 582, 750 and 809. Replace "materially" at 77 and 576 with the figures at 577-580 (hand-crafted mean ARI 0.629 standard, 0.606 power, 0.360 robust, 0.229 quantile; ECGFounder 0.866 standard, 0.093 robust). Write 576 in the past tense.
- Calls for: new reference no; figure change no; number from saved results no.

## W11

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 11. The property the hand-crafted features show under deployment stress has four names. The rule asks for one term per concept.
  > - main.tex:80, "the cheap interpretable representation is the more deployable one"
  > Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
  > - main.tex:632, "The hand-crafted features are the most robust"
  > Also: prose standard / A. Vocabulary / flagged term "robust". The rule asks for the most precise word. The sentence itself gives the measure, which is retaining 92% of centralized ARI.
  > - main.tex:639, "the 16 hand-crafted features are the more predictable of the two under site heterogeneity"
  > - main.tex:640, "Across both stressors the compact interpretable representation is the more dependable choice for privacy-preserving, multi-site phenotyping."
  > Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says main.tex:639 again in shorter words.
  > Also: references/rules.md / Precision / Term defined at first use. "phenotyping" appears here for the first time and is not defined.
  > Also: references/rules.md / Hedging / Hedge where a claim is uncertain. The sentence generalizes from a simulation on one dataset without a hedge.
- What it asks: one term (or the measure itself) for the property; formal vocabulary in place of "cheap"; the measure in place of "robust"; cut the restating close at 640, or if any of it stays, define "phenotyping" and hedge the generalization.
- Sections: Abstract; 4.6.
- Places checked:
  - W11(a) "the cheap interpretable representation is the more deployable one": stands, lines 80-81.
  - W11(b) Also, "cheap" at 80: stands.
  - W11(c) "The hand-crafted features are the most robust": stands, line 632; "retaining 92\% of their centralized ARI" stands at 632-633.
  - W11(d) "the 16 hand-crafted features are the more predictable of the two under site heterogeneity": stands, lines 639-640.
  - W11(e) "Across both stressors the compact interpretable representation is the more dependable choice for privacy-preserving, multi-site phenotyping.": stands, lines 640-641.
  - W11(f) Also, "phenotyping": stands, and its only occurrence in main.tex is line 641 (the report gives 640, where the sentence starts).
- Severity: Major (an unhedged generalization from one simulated dataset).
- Suggested fix: name the property by its measures, the ARI retained at the 9:1 ratio and the share of centralized ARI retained under non-IID federation (0.92 against 0.69), and use the same words at 80-81, 632 and 639-640. Replace "cheap" at 80 with the cost the text measures (Table cost) or with "low-cost". Cut the sentence at 640-641. If a closing sentence is kept, restrict it to the simulated ten-site split of the PTB-XL cohort and drop "phenotyping", or define it.
- Calls for: new reference no; figure change no; number from saved results no.

## W12

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 12. ECGFounder is called "the foundation embedding", "the embedding" and "the foundation model". The abstract introduces two foundation-model embeddings (main.tex:68), and main.tex:468 says each model is named. The rule asks for one term per concept.
  > - main.tex:83, "overtaking the foundation embedding under imbalance while the embedding's centralized advantage erodes under federation"
  > - main.tex:617, "Under imbalance the cheap features overtake the foundation embedding; under simulated federation the two means are close and the cheap features retain". The hand-crafted features are also renamed here, as "the cheap features".
  > Also: references/rules.md / Formality / No colloquial words. "cheap" is informal vocabulary.
  > - main.tex:626, "The foundation embedding's balanced-data lead does not survive imbalance."
  > Also: prose standard / E. Sentence shapes / Restating closes. This final sentence says the paragraph's second sentence again (main.tex:617).
  > - main.tex:663, "Non-IID heterogeneity erodes the foundation model's lead"
- What it asks: call ECGFounder by its name wherever a statement concerns it; call the hand-crafted features by that name; formal vocabulary in place of "cheap"; cut the restating close at 626.
- Sections: Abstract; 4.6; Fig. fed caption.
- Places checked:
  - W12(a) "two frozen foundation-model embeddings (HuBERT-ECG and ECGFounder)" stands at 68; "We therefore name each model" stands at 468.
  - W12(b) "overtaking the foundation embedding under imbalance while the embedding's centralized advantage erodes under federation": stands, lines 83-84.
  - W12(c) "Under imbalance the cheap features overtake the foundation embedding; under simulated federation the two means are close and the cheap features retain": stands, lines 617-618; "the cheap features" stands twice, at 617 and 618.
  - W12(d) "The foundation embedding's balanced-data lead does not survive imbalance.": stands, lines 626-627.
  - W12(e) "Non-IID heterogeneity erodes the foundation model's lead": stands, lines 663-664, in the caption of Fig. fed.
- Severity: Minor.
- Suggested fix: write "ECGFounder" at 83-84, 617, 626 and 663-664, and "the hand-crafted features" at 617 and 618. Cut the sentence at 626-627. The caption change is a change of caption text only.
- Calls for: new reference no; figure change no (caption text only); number from saved results no.

## W13

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 13. main.tex:104, "clustered whole 12-lead recordings. That pipeline flattened each strip into a long vector". One ECG is called a "recording" and a "strip" in adjacent sentences, and a "record" from main.tex:192 onward. The rule asks for one term per concept.
  > Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence, "This study began as a re-examination of a master's project that clustered whole 12-lead recordings.", gives background. The paragraph's point comes later: the project's numbers were misleading, and its conclusion is the starting point here.
- What it asks: one term for one ECG; the paragraph at 104 opens with its point.
- Sections: 1 Introduction.
- Places checked:
  - W13(a) "clustered whole 12-lead recordings. That pipeline flattened each strip into a long vector": stands, lines 104-105.
  - W13(b) "records" from 192: stands ("21\,799 records" at 192).
  - W13(c) Also, first sentence "This study began as a re-examination of a master's project that clustered whole 12-lead recordings.": stands, lines 104-105.
  - Not named by the finding, for the draft writer: "recording(s)" also stands at 66, 100, 165, 221, 242, 487, 760, 794 and 804, and "strip" at 192, 252, 254, 261, 686, 727 and 787. Some of these name an input format ("12-lead strip format") or other collections ("millions of recordings"), which the writer judges.
- Severity: Minor.
- Suggested fix: use "record" for one ECG of a cohort, as from 192, at 100 and 104-105, and keep "strip" only where it names the 10 s input format, if at all. Open the paragraph at 104 with its point: the earlier project's reported purity and silhouette were misleading, while its conclusion is the starting point of this study; the history follows.
- Calls for: new reference no; figure change no; number from saved results no.

## W14

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 14. The arm defined as "conv-AE" at main.tex:227 is called "reconstruction-autoencoder" at main.tex:138, at main.tex:729 ("The raw and reconstruction-autoencoder pipelines, including the original project's design") and at main.tex:808. The rule asks for one term per concept.
- What it asks: one name for the convolutional autoencoder arm.
- Sections: 1 Introduction; 5 Discussion; 7 Conclusion.
- Places checked:
  - W14(a) "(conv-AE)" defined at 227: stands.
  - W14(b) "reconstruction-autoencoder" at 138: stands.
  - W14(c) "The raw and reconstruction-autoencoder pipelines, including the original project's design": stands, lines 729-730.
  - W14(d) "reconstruction-autoencoder" at 808: stands.
- Severity: Minor.
- Suggested fix: write "convolutional autoencoder (conv-AE)" at 138, its first use in the body, and "conv-AE" at 729 and 808. At 729-730 the phrase also covers the original dense autoencoder; name it separately ("the raw and conv-AE pipelines, and the original project's dense autoencoder").
- Calls for: new reference no; figure change no; number from saved results no.

## W15

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 15. The units of the federation are called "clients" in two places and "sites" everywhere else. The rule asks for one term per concept.
  > - main.tex:144, "and with federated non-independent client splits"
  > Also: references/rules.md / Precision / Term defined at first use. The non-IID split is first defined at main.tex:383 to 385.
  > - main.tex:631, "Non-IID client heterogeneity degrades all representations, but unequally."
  > Also: references/rules.md / Objectivity / Claims rest on evidence. The federated results table (main.tex:655) gives raw-flatten 0.000 in every setting, so not every representation degrades.
- What it asks: "sites" throughout; the non-IID split defined at first use; the claim at 631 matched to the table.
- Sections: 1 Introduction; 4.6.
- Places checked:
  - W15(a) "and with federated non-independent client splits": stands, line 144.
  - W15(b) Also, non-IID definition at 383-385: stands.
  - W15(c) "Non-IID client heterogeneity degrades all representations, but unequally.": stands, lines 631-632.
  - W15(d) Also, Table fed row "raw-flatten & 0.000 & 0.000 & 0.000 & N/A": stands, line 655.
- Severity: Major (a claim the draft's own table contradicts).
- Suggested fix: at 144 write "with sites that differ in class proportions (non-IID)", or define the split there in one clause. At 631-632 write "sites" and restrict the claim to the three representations that cluster above chance (ECGFounder 0.885 to 0.612, hand-crafted 0.644 to 0.591, HuBERT-ECG 0.174 to 0.106), with raw flattening at 0.000 in every setting.
- Calls for: new reference no; figure change no; number from saved results no.

## W16

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 16. main.tex:588, "the 21-dimensional hand-crafted features cluster well". The same MIT-BIH arm is called "a 21-dimensional beat-morphology and RR-context feature set" at main.tex:259, and "beat-morphology" in the MIT-BIH table and its caption (main.tex:600, 605). Everywhere else, "hand-crafted features" names the 16 PTB-XL features. The rule asks for one term per concept.
- What it asks: one name for the 21-dimensional MIT-BIH feature set, distinct from the 16 PTB-XL hand-crafted features.
- Sections: 4.5; 3.2; Table mitbih.
- Places checked:
  - W16(a) "the 21-dimensional hand-crafted features cluster well": stands, lines 588-589.
  - W16(b) "a 21-dimensional beat-morphology and RR-context feature set": stands, line 259.
  - W16(c) "beat-morphology" in the caption (600) and the column head (605): stands at both.
- Severity: Major (one name for two different feature sets).
- Suggested fix: write "the 21-dimensional beat-morphology features" at 588-589, matching 259, 600 and 605, and keep "hand-crafted features" for the 16 PTB-XL features only. See W21(c) for the related claim at 264-265 and 728-729.
- Calls for: new reference no; figure change no; number from saved results no.

## W17

- Report group: Fix first. Rule: prose standard / D. Structure / No synonym cycling.
- Finding as the report gives it:
  > 17. The patient-grouped interval has three names. It is "a patient-grouped percentile bootstrap over the evaluation cohort" at main.tex:361, "Patient-bootstrap intervals" at main.tex:413 and "patient-grouped cohort bootstrap" at main.tex:450. The rule asks for one term per concept.
- What it asks: one name for the patient-grouped bootstrap interval.
- Sections: 3.3; Table main caption; 4.1.
- Places checked:
  - W17(a) "a patient-grouped percentile bootstrap over the evaluation cohort": stands, lines 361-362.
  - W17(b) "Patient-bootstrap intervals": stands, line 413.
  - W17(c) "patient-grouped cohort bootstrap": stands, line 450.
- Severity: Minor.
- Suggested fix: define it once at 361-362 as "the patient-grouped bootstrap" and use that name at 413 and 450, the name already used at 376, 444 and 543.
- Calls for: new reference no; figure change no; number from saved results no.

## W18

- Report group: Fix first. Rule: prose standard / E. Sentence shapes / Restating closes.
- Finding as the report gives it:
  > 18. The final sentences of two paragraphs say the paragraph again in shorter words. The rule asks for them to be cut.
  > - main.tex:84, "The representation, not the algorithm, governs label-free ECG structure." This repeats the abstract's opening, "whether clustering succeeds depends less on the algorithm than on how the signal is represented" (main.tex:62 to 64).
  > Also: references/rules.md / Hedging / Hedge where a claim is uncertain. This is a generalization from two binary tasks, and main.tex:714 and 802 limit the same claim to those tasks.
  > Also: prose standard / 0. Hard rules / Plain prose only. It is a punchy one-line summary built on a "not X, Y" contrast.
  > Also: prose standard / 0. Hard rules / No repeated construction. The same "representation, not the algorithm" shape appears at 397 and 800 (finding 31).
  > - main.tex:810, "Across the settings tested, the deciding choices were the representation and the evaluation protocol rather than the clustering algorithm". This repeats the paragraph's opening at main.tex:800 to 801.
- What it asks: cut the two restating closes; no unhedged generalization; no punchy "not X, Y" summary.
- Sections: Abstract; 7 Conclusion.
- Places checked:
  - W18(a) "The representation, not the algorithm, governs label-free ECG structure.": stands, lines 84-85.
  - W18(b) "whether clustering succeeds depends less on the algorithm than on how the signal is represented": stands, lines 63-64.
  - W18(c) Also, hedging: the limits at 714-715 and 802-803 stand.
  - W18(d) Also, plain prose and repeated construction: the shape stands at 397 and 800-801.
  - W18(e) "Across the settings tested, the deciding choices were the representation and the evaluation protocol rather than the clustering algorithm": stands, lines 810-811; the opening it repeats stands at 800-801.
- Severity: Major (the Abstract's last sentence states the claim beyond the two tasks the paper tests).
- Suggested fix: cut the Abstract's last sentence (84-85). In the Conclusion cut the first clause of 810-811 and keep its second clause, the open questions on multi-class cohorts, other foundation models and real federation, as a sentence of its own.
- Calls for: new reference no; figure change no; number from saved results no.

## W19

- Report group: Fix first. Rule: references/rules.md / Precision / Most specific term.
- Finding as the report gives it:
  > 19. main.tex:633, "ECGFounder's centralized advantage erodes from 0.885 to 0.612." The two numbers are ECGFounder's ARI, not its advantage. Its advantage over the hand-crafted features goes from 0.241 to 0.021. The rule asks for each thing to be named with the most specific term.
- What it asks: name the quantity the numbers measure.
- Sections: 4.6.
- Places checked:
  - W19(a) "ECGFounder's centralized advantage erodes from 0.885 to 0.612.": stands, lines 633-634.
  - The advantage figures follow from Table fed (652-653): 0.885 minus 0.644 is 0.241, and 0.612 minus 0.591 is 0.021.
- Severity: Major (the sentence misnames the quantity its numbers give).
- Suggested fix: write "ECGFounder's ARI fell from 0.885 to 0.612, and its lead over the hand-crafted features from 0.241 to 0.021". Both differences come from values the table already gives.
- Calls for: new reference no; figure change no; number from saved results no (the two differences are arithmetic on numbers printed in Table fed).

## W20

- Report group: Fix first. Rule: references/rules.md / Precision / Term defined at first use.
- Finding as the report gives it:
  > 20. These technical terms are used before they are defined, or are never defined. The rule asks for a term to be defined where it first appears.
  > - main.tex:106, "It reported high cluster purity and a silhouette score near 0.89". Purity is first defined at main.tex:171, and the silhouette is first explained at main.tex:175.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No citation is given for the master's project or its numbers.
  > - main.tex:137, "patient-grouped". It is first defined at main.tex:204 to 205.
  > - main.tex:139, "each bounded by a supervised ceiling". It is first defined at main.tex:307 to 311, and is also used before that at main.tex:184.
  > - main.tex:141, "internal validity indices reward the degenerate collapse". Internal indices are first explained at main.tex:175.
  > - main.tex:168, "which span the energy-only to definition-encoding spectrum". This is defined nowhere.
  > - main.tex:194, "all records carrying an AF statement (AFIB or AFLT) as positives". AFIB and AFLT are not expanded, and nothing says that atrial flutter is counted as AF.
  > Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The draft's reading rests on SR and AF differing "by definition in the regularity of the rhythm" (main.tex:133). The Limitations section does not say that flutter positives may not fit that definition.
  > - main.tex:237, "and beat-template consistency". This feature is defined nowhere.
  > - main.tex:776, "We evaluate one model per foundation family". "Foundation family" is not defined. Elsewhere the draft treats the foundation embeddings as one family that holds two models (main.tex:247, 755).
- What it asks: define each term where it first appears; give support for the master's project and its numbers; expand AFIB and AFLT and say flutter counts as AF; add the flutter limitation; define beat-template consistency; replace or define "foundation family".
- Sections: 1 Introduction; 2 Related work; 3.1; 3.2; 6 Limitations.
- Places checked:
  - W20(a) "It reported high cluster purity and a silhouette score near 0.89": stands, lines 106-107; purity is defined at 171-172, the silhouette explained at 175-177.
  - W20(b) Also, no citation for the master's project: none stands in 104-111.
  - W20(c) "patient-grouped" at 137: stands; defined at 204-205.
  - W20(d) "each bounded by a supervised ceiling": stands, line 139; defined at 307-311; used at 184. Not named by the finding: the Abstract also uses it, "bounded by a supervised ceiling", at 70-71.
  - W20(e) "internal validity indices reward the degenerate collapse": stands, lines 141-142; internal indices explained at 175-177.
  - W20(f) "which span the energy-only to definition-encoding spectrum": stands, lines 168-169.
  - W20(g) "all records carrying an AF statement (AFIB or AFLT) as positives": stands, lines 194-195.
  - W20(h) Also, "by definition in the regularity of the rhythm": stands, lines 133-134; Limitations (769-796) holds no sentence on flutter.
  - W20(i) "and beat-template consistency": stands, line 237.
  - W20(j) "We evaluate one model per foundation family": stands, lines 776-777; "Foundation embeddings" stands at 247 and "bounded to two models" at 755.
- Severity: Major (terms in the contributions sentence and a limitation of the cohort definition).
- Suggested fix: at 106-107 add a short gloss of purity (the majority-class share inside the clusters) and of the silhouette (a label-free index of cluster compactness), or point to Section 2. At 137, 139 and 141 add one defining clause each (patient-grouped: no patient in more than one fold; supervised ceiling: the accuracy a supervised probe reaches on the same features; internal validity indices: indices computed without labels, such as the silhouette); add the same clause for the ceiling in the Abstract (70-71). At 168-169 replace the phrase with what it means, from representations shaped only by signal energy to features built from the defining signatures of the classes, or cut it. At 194-195 write "atrial fibrillation (AFIB) or atrial flutter (AFLT)" and say both count as AF positives. Add to the Limitations that flutter can conduct with a regular ventricular rhythm, so flutter positives may not fit the regularity reading at 133-134. At 237 define beat-template consistency in one clause; the definition needs the study's description of how the feature is computed, which main.tex does not hold, so the session or the user supplies it. At 776-777 write "We evaluate two foundation models". For the master's project: a citation would be a new reference, which config.md excludes; describe it as the authors' earlier unpublished work, or the user supplies the reference.
- Calls for: new reference: only for a citation of the master's project, excluded by config.md (the fix above avoids it; needs the user if a citation is wanted); figure change no; number from saved results no. Needs a fact outside main.tex: the definition of beat-template consistency.

## W21

- Report group: Fix first. Rule: references/rules.md / Objectivity / Claims rest on evidence.
- Finding as the report gives it:
  > 21. These claims are contradicted by the draft's own results. The rule asks for a claim to rest on evidence.
  > - main.tex:74, "match a majority-class assignment despite supervised ceilings well above chance." The raw-flattening ceiling is 0.519 against a majority of 0.504, which main.tex:497 calls "barely above the 0.504 majority".
  > - main.tex:264, "so that the same features transfer to the two-lead beats", and main.tex:728, "whereas the hand-crafted features transfer across lead sets". Main.tex:258 says "the rhythm features do not transfer to single beats", and MIT-BIH uses a different 21-dimensional set.
  > - main.tex:488, "they do so for different reasons, one for want of label information in the space", and main.tex:496, "The raw pipeline carries almost no label information". A random forest on the raw features reaches 0.714 (main.tex:506).
  > Also, at 496: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  > - main.tex:616, "Two stressors closer to deployment separate the representations more sharply than the balanced benchmark." Under non-IID federation, ECGFounder and the hand-crafted features are at 0.612 and 0.591, closer together than their centralized 0.885 and 0.644. Under imbalance, ECGFounder and HuBERT-ECG are at 0.063 and 0.061.
  > Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Results.
  > - main.tex:730, "are not viable for label-free arrhythmia structure on either task: they are indistinguishable from predicting the majority class under all five clusterers". MIT-BIH is evaluated with three clusterers, and there the conv-AE reaches ARI 0.127 and the raw beat reaches 0.049 (main.tex:607 to 609).
  > - main.tex:760, "They also sit at opposite ends of the clustering range measured here, 0.885 against 0.195". The measured range goes down to 0.000 (main.tex:428).
  > - main.tex:775, "since upsampling can only discard information it cannot inflate the foundation model's lead". The same sentence reports a higher ARI after upsampling from 100 Hz (0.909) than at the native 500 Hz (0.896).
  > Also: references/rules.md / Objectivity / Limitations and alternative interpretations. The text rules out inflation instead of acknowledging what its own numbers show.
- What it asks: rewrite each claim so that it agrees with the results the draft reports; past tense in Results; acknowledge what the upsampling numbers show.
- Sections: Abstract; 3.2; 4.1; 4.2; 4.6; 5 Discussion; 6 Limitations.
- Places checked:
  - W21(a) "match a majority-class assignment despite supervised ceilings well above chance.": stands, line 74; "barely above the 0.504 majority" stands at 497; the ceilings 0.519 and 0.678 stand at 428-429.
  - W21(b) "so that the same features transfer to the two-lead beats": stands, lines 264-265. "whereas the hand-crafted features transfer across lead sets": stands, lines 728-729. "the rhythm features do not transfer to single beats": stands, line 258.
  - W21(c) "they do so for different reasons, one for want of label information in the space": stands, lines 488-489. "The raw pipeline carries almost no label information": stands, line 496. Random forest 0.714: stands, line 506.
  - W21(d) Also, tense at 496: present tense stands.
  - W21(e) "Two stressors closer to deployment separate the representations more sharply than the balanced benchmark.": stands, lines 616-617. The values 0.612 and 0.591 (Table fed, 652-653), 0.885 and 0.644 (652-653), 0.063 (623) and 0.061 (625) stand.
  - W21(f) Also, tense at 616: present tense stands.
  - W21(g) "are not viable for label-free arrhythmia structure on either task: they are indistinguishable from predicting the majority class under all five clusterers": stands, lines 730-732 (with `\rev{...}` marking around "on either task" and "under all five clusterers"). Table mitbih has three clusterers (607-609); conv-AE 0.127 (609) and raw beat 0.049 (608) stand.
  - W21(h) "They also sit at opposite ends of the clustering range measured here, 0.885 against 0.195": stands, lines 760-761; 0.000 stands at 428.
  - W21(i) "since upsampling can only discard information it cannot inflate the foundation model's lead": stands, lines 775-776; "ARI 0.896 versus 0.909" stands at 775.
  - W21(j) Also, limitations: stands as quoted.
- Severity: Major (seven claims the draft's own numbers contradict, two of them in the Abstract and the Discussion's decision rule).
- Suggested fix: (a) at 74 attach "supervised ceilings well above chance" to the conv-AE only (0.678) and say the raw ceiling is 0.519 against a majority of 0.504. (b) At 264-265 and 728-729 say that the single-lead feature logic, RR timing and beat morphology measured on one lead, carries to the 2-lead beats as the 21-dimensional beat-morphology set (W16), not that the same features transfer. (c) At 488-489 and 496 say the raw space holds little label information that a linear probe recovers (0.519) while a random forest recovers more (0.714); write 496 in the past tense. (e) At 616-617 state what each stressor did, in the past tense: at the 9:1 ratio the hand-crafted features moved ahead of ECGFounder (0.265 against 0.063) while ECGFounder and HuBERT-ECG fell to the same ARI; under non-IID federation the means of ECGFounder and the hand-crafted features came closer (0.612 against 0.591) while their spread over site draws differed. (g) At 730-732 restrict "under all five clusterers" to PTB-XL and give the MIT-BIH values (conv-AE up to 0.127, raw beat up to 0.049 over three clusterers), and replace "not viable on either task" with what those values show. (h) At 760-761 say the two models' best ARIs are 0.885 and 0.195, without calling them the ends of the measured range. (i) At 775-776 cut the clause on inflation and state the subset result: the upsampled 100 Hz input gave 0.909 and the native 500 Hz input 0.896 on 300 records, so the upsampled input may raise ECGFounder's ARI by about 0.013 on that subset.
- Calls for: new reference no; figure change no; number from saved results no.

## W22

- Report group: Fix first. Rule: references/rules.md / Objectivity / Claims rest on evidence.
- Finding as the report gives it:
  > 22. These claims are given without support, or rest on opinion. The rule asks for a claim to rest on evidence.
  > - main.tex:97, "Most machine-learning work on the electrocardiogram (ECG) is supervised, but the clinically interesting questions are often unsupervised". No source is given.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No data, citation or example follows.
  > Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point, that the representation dominates, comes only in its last sentence.
  > Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" (main.tex:98) to be replaced with the number or the specific claim.
  > Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 68 words, against about 120 to 200.
  > - main.tex:101, "Whether that attempt succeeds is usually attributed to the clustering algorithm". No source is given.
  > Also: prose standard / E. Sentence shapes / Passive voice. The people who make the attribution are relevant to the claim.
  > - main.tex:125, "Those two gaps are exactly where a careful, honest benchmark adds value, because hand-crafted features remain the interpretable and inexpensive default in clinical signal processing, and MIT-BIH is the canonical morphology benchmark." This is opinion, and nothing supports "default" or "canonical".
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "a careful, honest benchmark" (main.tex:126) is a self-assessment.
  > - main.tex:157, "Reconstruction autoencoders optimise signal energy rather than class structure, which makes them strong compressors but weak organisers of class geometry." No source is given.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > - main.tex:470, "spectral clustering collapses where the nearest-neighbour affinity graph is poorly connected". The draft reports no measure of how well the graph is connected.
  > - main.tex:580, "Robust scaling, a common default for physiological signals,". No source is given.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > - main.tex:621, "isolating a 10\% minority cluster with a partitional method is intrinsically hard". No support is given.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > - main.tex:637, "A deployment claim rests on the worst site draw rather than on the average one". This is opinion, given without support.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > - main.tex:738, "both recur often enough in applied clustering to be worth stating plainly". No source is given.
  > Also: references/rules.md / Paragraphs / Claim with evidence or citation. No support follows.
  > Also: prose standard / A. Vocabulary / vague qualifiers. The rule asks for "often" to be replaced with the number or the specific claim.
  > Also: prose standard / 0. Hard rules / No performative asides. "to be worth stating plainly" is a variant of "worth noting".
- What it asks: support each claim or remove it; open the paragraph at 97 with its point and bring it to paragraph length; replace "often"; name the actor at 101; drop the self-assessment at 126 and the aside at 738.
- Sections: 1 Introduction; 2 Related work; 4.1; 4.4; 4.6; 5 Discussion.
- Places checked:
  - W22(a) "Most machine-learning work on the electrocardiogram (ECG) is supervised, but the clinically interesting questions are often unsupervised": stands, lines 97-98; "often" stands at 98. The paragraph runs 97-102 and its last sentence (101-102) states the representation point. The word count of 68 is the report's.
  - W22(b) "Whether that attempt succeeds is usually attributed to the clustering algorithm": stands, lines 101-102.
  - W22(c) "Those two gaps are exactly where a careful, honest benchmark adds value, ... MIT-BIH is the canonical morphology benchmark.": stands, lines 125-128; "a careful, honest benchmark" stands at 126.
  - W22(d) "Reconstruction autoencoders optimise signal energy rather than class structure, which makes them strong compressors but weak organisers of class geometry.": stands, lines 157-159.
  - W22(e) "spectral clustering collapses where the nearest-neighbour affinity graph is poorly connected": stands, lines 470-471.
  - W22(f) "Robust scaling, a common default for physiological signals,": stands, line 580.
  - W22(g) "isolating a 10\% minority cluster with a partitional method is intrinsically hard": stands, line 621.
  - W22(h) "A deployment claim rests on the worst site draw rather than on the average one": stands, lines 637-638.
  - W22(i) "both recur often enough in applied clustering to be worth stating plainly": stands, line 738.
- Severity: Major (unsupported claims in the Introduction's argument and in the Results).
- Suggested fix: config.md excludes new references, so each claim is cut, narrowed to what the draft itself shows, or hedged; an entry already in refs.bib is cited only where the citation compliance check confirms it supports the claim. (a) Open the paragraph at 97 with its point, that the representation fed to a clustering algorithm decides whether clustering recovers the label; cut or narrow the claim about most ECG work; replace "often" with the specific unsupervised questions listed at 98-100; join the paragraph with the next (104-111) or extend it to paragraph length. (b) At 101-102 cut the attribution or name who makes it; without a source, cut it. (c) At 125-128 cut "exactly where a careful, honest benchmark adds value" and state the two gaps and what this study adds for each, without "default" and "canonical" unless a held reference supports them (hrvstandards1996 and dechazal2004 are already cited for hand-crafted features at 155, and mitbih2001 for MIT-BIH; the citation check decides). (d) At 157-159 hedge the sentence, or move it to the Results as what this study observed for the conv-AE (ceiling 0.678, ARI 0.008). (e) At 470-471 cut the causal clause and state the observed values (spectral ARI 0.016 on HuBERT-ECG, 0.001 on conv-AE, 0.000 on raw flattening, Table main). (f) At 580 cut "a common default for physiological signals". (g) At 621 cut "intrinsically hard" and state the measured fall. (h) At 637-638 state the worst site draw as the criterion this study applies and why, in the authors' voice. (i) Cut 738 with the paragraph (W26).
- Calls for: new reference: would be the direct answer for (a), (b), (c), (d), (f) and (g); config.md excludes it, and the fix above needs none. Figure change no. Number from saved results no (a connectivity measure for (e) would need one; the fix above needs none).

## W23

- Report group: Fix first. Rule: references/rules.md / Objectivity / Limitations and alternative interpretations.
- Finding as the report gives it:
  > 23. The text does not acknowledge these limitations or alternative readings. The rule asks for them to be acknowledged.
  > - main.tex:250, "HuBERT-ECG receives the first \mbox{5\,s} at \mbox{100\,Hz}". HuBERT-ECG sees half of each 10 s strip, and so fewer RR intervals, while every other arm sees the full strip. Its weak clustering is explained only as off-axis geometry (main.tex:526 to 529) or as organisation by dataset (main.tex:466 to 468). The shorter input window is not given as an alternative explanation.
  > - main.tex:362, "the partitions are held fixed and the cohort is resampled with replacement at the patient level". The intervals do not refit the clustering on each resample. The text does not say what this leaves out of the uncertainty that every interval in the Results carries.
  > - main.tex:386, "Conditioning is fitted once on the full representation matrix before partitioning, so the federation concerns the clustering step alone." In the federated simulation, conditioning uses statistics pooled across all sites. The draft shows that the scaler changes the results by a wide margin (main.tex:576 to 580), and the Limitations section (main.tex:787 to 796) does not raise this.
  > - main.tex:619, "At the natural-like 9:1 SR:AF ratio (majority 0.90), every representation's ARI falls". The reversal is shown for one ratio and one scaler, and the clusterer is not named. It is then stated in general terms at main.tex:626.
  > Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words and chains a general fall, its cause, a retention result and an overtaking result.
- What it asks: acknowledge each limitation or alternative reading; name the clusterer and scaler of the imbalance result and limit its statement; split the 65-word sentence.
- Sections: 3.2; 3.3; 3.4; 4.2; 4.6; 6 Limitations.
- Places checked:
  - W23(a) "HuBERT-ECG receives the first \mbox{5\,s} at \mbox{100\,Hz}": stands, lines 250-251; the readings it is set against stand at 526-529 and 466-468.
  - W23(b) "the partitions are held fixed and the cohort is resampled with replacement at the patient level": stands, lines 362-364.
  - W23(c) "Conditioning is fitted once on the full representation matrix before partitioning, so the federation concerns the clustering step alone.": stands, lines 386-388; the scaler results stand at 576-580; the federated part of the Limitations stands at 787-796 and holds nothing on pooled scaling statistics.
  - W23(d) "At the natural-like 9:1 SR:AF ratio (majority 0.90), every representation's ARI falls": stands, lines 619-620; the general statement stands at 626-627.
  - W23(e) Also, sentence length: the sentence runs 619-626 ("At the natural-like ... (0.000 and 0.004)."). The count of 65 words is the report's.
- Severity: Major (alternative explanations for headline results left unstated).
- Suggested fix: (a) in 4.2, or in the Limitations, say that HuBERT-ECG receives 5 s of each 10 s record, so it sees about half the RR intervals the other arms see, and that this may contribute to its low ARI alongside the off-axis reading. (b) In 3.3 say that the intervals hold the partitions fixed and so do not include the variation that refitting the clustering on each resample would add. (c) In the Limitations say that in the federated simulation the scaling statistics are pooled over all sites, which a real federation would not have, and that scaling changes the results by a wide margin (576-580). (d) Split 619-626 into separate sentences for the general fall, the hand-crafted retention and the overtaking; name the scaler and the clusterer of the 9:1 results; restrict the sentence at 626-627 (cut under W12) or any remaining general statement to that ratio, scaler and clusterer. The scaler follows from 314-315 ("power scaling as the default unless stated otherwise"); the clusterer is not stated in main.tex ("over the ten seeds" at 622 says only that it is seeded), so the session or the user supplies it.
- Calls for: new reference no; figure change no; number from saved results no. Needs a fact outside main.tex: which clusterer produced the 9:1 results.

## W24

- Report group: Fix first. Rule: references/rules.md / Hedging / Hedge where a claim is uncertain.
- Finding as the report gives it:
  > 24. These interpretations have alternative explanations and are stated without a hedge. The rule asks for a hedge.
  > - main.tex:266, "so the lead set cannot account for the raw arm's chance-level clustering". The larger twelve-lead input also makes the raw vector 1992-dimensional, which is a way the lead set could still bear on Euclidean clustering.
  > - main.tex:486, "no fixed offset falls on the same part of the cardiac cycle in two recordings". This is given as the cause of the raw arm's failure. In the same section, a random forest on the same features reaches 0.714 (main.tex:506).
- What it asks: hedge the two interpretations and name the alternative.
- Sections: 3.2; 4.1.
- Places checked:
  - W24(a) "so the lead set cannot account for the raw arm's chance-level clustering": stands, lines 266-267; "1992-dimensional" stands at 224.
  - W24(b) "no fixed offset falls on the same part of the cardiac cycle in two recordings": stands, lines 486-487; 0.714 stands at 506.
- Severity: Major (causal readings stated as certain where the draft's own data allow another).
- Suggested fix: (a) at 266-267 say that the raw arm receives more input than the hand-crafted arm, so missing input does not explain its chance-level clustering, and that the twelve-lead input also gives it 1992 dimensions, which may itself weaken Euclidean clustering. (b) At 486-487 give the misalignment of fixed sample offsets as a likely reason why a linear probe finds little label information, and note that a random forest on the same vector reaches 0.714.
- Calls for: new reference no; figure change no; number from saved results no.

## W25

- Report group: Fix first. Rule: references/rules.md / Paragraphs / Evidence followed by what it means.
- Finding as the report gives it:
  > 25. This evidence is not followed by an interpretation that connects it to the paragraph's claim. The rule asks for that interpretation.
  > - main.tex:508, "The same probe gives 0.951 on the hand-crafted features, 0.983 on ECGFounder and 0.825 on HuBERT-ECG. On ECGFounder the two probes agree to three decimals". Only the HuBERT-ECG value is interpreted.
  > - main.tex:624, "HuBERT-ECG reaches the same ARI as ECGFounder (0.061 [0.053, 0.069]) at a lower AMI (0.044 [0.037, 0.050])". No interpretation follows.
- What it asks: follow each piece of evidence with what it means for the paragraph's claim.
- Sections: 4.2; 4.6.
- Places checked:
  - W25(a) "The same probe gives 0.951 on the hand-crafted features, 0.983 on ECGFounder and 0.825 on HuBERT-ECG. On ECGFounder the two probes agree to three decimals": stands, lines 508-510.
  - W25(b) "HuBERT-ECG reaches the same ARI as ECGFounder (0.061 [0.053, 0.069]) at a lower AMI (0.044 [0.037, 0.050])": stands, lines 624-625.
- Severity: Minor.
- Suggested fix: (a) after 508-510 add a sentence on what the hand-crafted and ECGFounder values show for the claim, for example that on the two representations that cluster well the non-linear probe adds little over the linear ceiling (0.951 against 0.942, 0.9835 against 0.9831), so their label information is already linearly accessible. (b) After 624-625 say what the equal ARI with lower AMI means: at the 9:1 ratio HuBERT-ECG's partition agrees with the classes on record pairs as often as ECGFounder's but shares less information with them.
- Calls for: new reference no; figure change no; number from saved results no.

## W26

- Report group: Fix first. Rule: references/rules.md / Reader's path / Clarity test.
- Finding as the report gives it:
  > 26. main.tex:734, the paragraph that opens "The result also reframes the original master's project honestly." Its content is already in the draft. The original conclusion is called correct at main.tex:109 to 111. Purity without a baseline and silhouette on a collapsed solution are identified as the artefacts at main.tex:107 to 109 and 555 to 556. The only new content is the unsupported claim in finding 22. The rule asks for a paragraph whose removal loses nothing to be deleted.
  > Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. "reframes ... honestly" is a self-assessment.
  > Also: manuscript prose standard / Section D, Paragraphs. The paragraph has 66 words, against about 120 to 200.
- What it asks: delete the paragraph.
- Sections: 5 Discussion.
- Places checked:
  - W26(a) "The result also reframes the original master's project honestly.": stands, line 734; the paragraph runs 734-738.
  - W26(b) The passages it repeats stand at 109-111, 107-109 and 555-556.
  - W26(c) Also, self-assessment "reframes ... honestly": stands, line 734.
  - W26(d) Also, paragraph length: the count of 66 words is the report's.
- Severity: Minor.
- Suggested fix: delete the paragraph at 734-738. Its content stays at 107-111 and 555-556, and the unsupported claim at 738 (W22(i)) goes with it.
- Calls for: new reference no; figure change no; number from saved results no.

## W27

- Report group: Style. Rule: prose standard / 0. Hard rules / Plain prose only.
- Finding as the report gives it:
  > 27. These headings editorialise. The rule asks for no headline-style headings that editorialise.
  > - main.tex:397, "Representation, not algorithm, governs clusterability". This is also a "not X, Y" contrast.
  > Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.
  > Also: prose standard / 0. Hard rules / No repeated construction. It has the same shape as main.tex:84 and 800 (finding 31).
  > - main.tex:548, "The silhouette trap"
  > Also: prose standard / 0. Hard rules / No dramatic bolded closers, no grandiose self-assessment, no cutesy section titles. This is a cutesy section title.
  > - main.tex:574, "Conditioning matters"
  > Also: prose standard / 0. Hard rules / Headings are labels, not sentences. The heading is a sentence.
- What it asks: replace the three headings with labels.
- Sections: 4.1; 4.3; 4.4.
- Places checked:
  - W27(a) "Representation, not algorithm, governs clusterability": stands, line 397.
  - W27(b) "The silhouette trap": stands, line 548. Not named by the finding: the caption of Fig. trap opens with the same phrase, "The silhouette trap.", at 563.
  - W27(c) "Conditioning matters": stands, line 574.
- Severity: Minor.
- Suggested fix: label headings, for example "PTB-XL benchmark" at 397, "Internal validity indices" at 548 and "Feature scaling" at 574 (the term chosen under W10). The caption opening at 563 may follow the same change; that is a change of caption text only.
- Calls for: new reference no; figure change no; number from saved results no.

## W28

- Report group: Style. Rule: prose standard / 0. Hard rules / Plain prose only.
- Finding as the report gives it:
  > 28. main.tex:582, "Conditioning should be reported and swept, not assumed." This is a punchy one-line summary built on a "not X, Y" contrast. The rule asks for the fact to be stated without it.
- What it asks: state the fact without the punchy contrast.
- Sections: 4.4.
- Places checked:
  - W28(a) "Conditioning should be reported and swept, not assumed.": stands, lines 582-583.
- Severity: Minor.
- Suggested fix: cut the sentence, or replace it with a plain statement of what follows from 576-582, for example that a clustering result on these representations is reported with the scaler used, since the four scalers give mean ARIs from 0.229 to 0.629 on the hand-crafted features.
- Calls for: new reference no; figure change no; number from saved results no.

## W29

- Report group: Style. Rule: prose standard / 0. Hard rules / Headings are labels, not sentences.
- Finding as the report gives it:
  > 29. These headings are sentences, not labels. The rule asks for a label.
  > - main.tex:51, "Which representation clusters? A chance-corrected benchmark of ECG". The title opens with a question.
  > - main.tex:493, "Separability is not clusterability"
- What it asks: a title and a heading that are labels.
- Sections: title; 4.2.
- Places checked:
  - W29(a) "Which representation clusters? A chance-corrected benchmark of ECG": stands, line 51 (the title continues at 52).
  - W29(b) "Separability is not clusterability": stands, line 493. Not named by the finding: the caption of Fig. sep opens with the same sentence at 538.
- Severity: Minor.
- Suggested fix: title "A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure" (51-52 without the opening question). Heading at 493, for example "Supervised ceiling and clusterability". The caption opening at 538 may follow; caption text only.
- Calls for: new reference no; figure change no; number from saved results no.

## W30

- Report group: Style. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 30. All four representation entries close on the same sentence opening, "The principle is that". The rule asks for a shape that recurs across entries to be rewritten.
  > - main.tex:224, "The principle is that the sample amplitudes are themselves the features"
  > Also: references/rules.md / Concision / One idea per sentence. The same sentence also gives the separate reason for the lead set, "all twelve leads enter because this arm reproduces the originating pipeline".
  > - main.tex:231, "The principle is that a reconstruction objective compresses whatever carries signal energy"
  > - main.tex:245, "The principle is that the AF signature is RR irregularity together with P-wave absence"
  > - main.tex:254, "The principle is that large-scale pretraining has already fixed an ECG feature space"
- What it asks: rewrite the four entries so they do not share the sentence opening; split the sentence at 224.
- Sections: 3.2 Representations.
- Places checked:
  - W30(a) "The principle is that the sample amplitudes are themselves the features": stands, lines 224-225.
  - W30(b) Also, "all twelve leads enter because this arm reproduces the originating pipeline": stands, lines 225-226.
  - W30(c) "The principle is that a reconstruction objective compresses whatever carries signal energy": stands, lines 231-232.
  - W30(d) "The principle is that the AF signature is RR irregularity together with P-wave absence": stands, lines 245-246.
  - W30(e) "The principle is that large-scale pretraining has already fixed an ECG feature space": stands, lines 254-255.
- Severity: Minor.
- Suggested fix: state each entry's assumption in a sentence shaped by its content, for example "This arm treats the sample amplitudes as the features" (224), "A reconstruction objective compresses whatever carries signal energy" (231), "The arm measures the two quantities that define AF, RR irregularity and P-wave absence" (245), "The pretrained models supply a fixed feature space, and the question is ..." (254). At 224-226 give the lead-set reason as a sentence of its own. This interacts with the sentence at 216-217 (W36), which announces the "principle" of each entry.
- Calls for: new reference no; figure change no; number from saved results no.

## W31

- Report group: Style. Rule: prose standard / 0. Hard rules / No repeated construction.
- Finding as the report gives it:
  > 31. main.tex:800, "the representation, not the clustering algorithm, decides whether clustering works". The same "representation, not the algorithm" shape appears at main.tex:84 (finding 18) and main.tex:397 (finding 27). The rule asks for the repeated shape to be rewritten.
- What it asks: rewrite the shape at 800.
- Sections: 7 Conclusion.
- Places checked:
  - W31(a) "the representation, not the clustering algorithm, decides whether clustering works": stands, lines 800-801; the same shape stands at 84-85 and 397.
- Severity: Minor.
- Suggested fix: once 84-85 is cut (W18) and 397 is relabelled (W27), restate 800-801 as a direct statement with its evidence, for example that the spread of ARI across representations exceeded the spread across clustering algorithms within each strong representation, as 403-405 reports, on the two tasks tested.
- Calls for: new reference no; figure change no; number from saved results no.

## W32

- Report group: Style. Rule: prose standard / A. Vocabulary / banned filler.
- Finding as the report gives it:
  > 32. "simply" is used as filler at main.tex:107, "but the purity simply equalled the majority-class", and at main.tex:504, "simply does not lie along their dominant axes of variation". The rule asks for the word to be cut or replaced with the concrete fact.
- What it asks: cut "simply" or replace it with the fact.
- Sections: 1 Introduction; 4.2.
- Places checked:
  - W32(a) "but the purity simply equalled the majority-class": stands, line 107.
  - W32(b) "simply does not lie along their dominant axes of variation": stands, line 504.
- Severity: Minor.
- Suggested fix: cut "simply" at 107 and 504.
- Calls for: new reference no; figure change no; number from saved results no.

## W33

- Report group: Style. Rule: prose standard / A. Vocabulary / vague qualifiers.
- Finding as the report gives it:
  > 33. main.tex:174, "are near zero for such trivial solutions". The rule asks for the number or the specific claim. For the one-cluster solution, ARI and AMI are exactly zero.
- What it asks: the specific claim in place of "near zero".
- Sections: 2 Related work.
- Places checked:
  - W33(a) "are near zero for such trivial solutions": stands, line 174.
- Severity: Minor.
- Suggested fix: write that ARI and AMI are exactly zero for the one-cluster solution and have expected value zero under random assignment.
- Calls for: new reference no; figure change no; number from saved results no.

## W34

- Report group: Style. Rule: prose standard / A. Vocabulary / flagged terms.
- Finding as the report gives it:
  > 34. "robust" is used where the draft has a more precise measure, which is the share of centralized ARI retained. It appears at main.tex:82, "the hand-crafted features are the most robust", and at main.tex:144, "the 16 hand-crafted features are the most robust". The rule asks for the most precise word.
- What it asks: the measure in place of "robust".
- Sections: Abstract; 1 Introduction.
- Places checked:
  - W34(a) "the hand-crafted features are the most robust": stands, lines 82-83.
  - W34(b) "the 16 hand-crafted features are the most robust": stands, lines 144-145.
  - The third use, at 632, is W11(c).
- Severity: Minor.
- Suggested fix: at 82-83 and 144-145 name what was measured: the highest ARI at the 9:1 ratio and the largest share of centralized ARI retained under non-IID federation (0.92). Use the same wording as W11.
- Calls for: new reference no; figure change no; number from saved results no.

## W35

- Report group: Style. Rule: prose standard / B. Punctuation / Semicolons.
- Finding as the report gives it:
  > 35. Running prose, with table rows excluded, has 33 semicolons in 6766 words. That is 4.9 per 1000 words, spread over 24 paragraphs, against a limit of 2. One example is main.tex:197, "so a presence-based rule is required; a confidence threshold would discard every SR record".
- What it asks: bring semicolons in running prose to at most 2 per 1000 words.
- Sections: whole manuscript.
- Places checked:
  - W35(a) "so a presence-based rule is required; a confidence threshold would discard every SR record": stands, lines 197-198.
  - The counts (33 semicolons, 6766 words, 24 paragraphs) are the report's and were not recounted here. For the draft writer, semicolons stand in the text and captions of main.tex on lines 79, 135, 168, 183, 192, 197, 234, 235, 236, 251, 260, 265, 292, 309, 381, 411, 413, 462, 463, 471, 478, 495, 503, 517, 525, 539, 542, 563, 598, 617, 631, 693, 777, 804 and 811; line 15 is a source comment and lines 332-334 are table rows, outside running prose. Some of these separate items inside parentheses (192, 234-236) or references (495, 631), which the writer judges.
- Severity: Minor.
- Suggested fix: replace most semicolons in running prose with full stops or restructured sentences, keeping at most about 2 per 1000 words; many fall away with the rewrites of W1, W10, W12, W22, W23 and W39.
- Calls for: new reference no; figure change no; number from saved results no.

## W36

- Report group: Style. Rule: prose standard / C. Throat-clearing and meta-commentary.
- Finding as the report gives it:
  > 36. These sentences describe what the text is about to do. The rule asks for such sentences to be cut.
  > - main.tex:216, "Each entry states the leads it consumes, the array it receives, and the principle it encodes."
  > Also: prose standard / D. Structure / Lists are introduced with a colon. The list at main.tex:218 follows a sentence that ends in a full stop.
  > - main.tex:490, "Which of the two accounts for HuBERT-ECG is what the next subsection measures."
- What it asks: cut the two sentences; introduce the list at 218 with a colon.
- Sections: 3.2; 4.1.
- Places checked:
  - W36(a) "Each entry states the leads it consumes, the array it receives, and the principle it encodes.": stands, lines 216-217.
  - W36(b) Also, the list opens at 218 after a full stop: stands.
  - W36(c) "Which of the two accounts for HuBERT-ECG is what the next subsection measures.": stands, lines 490-491.
- Severity: Minor.
- Suggested fix: cut 216-217 and end the sentence at 216 with a colon that introduces the list ("We compare four families on PTB-XL (Table main):"). Cut 490-491.
- Calls for: new reference no; figure change no; number from saved results no.

## W37

- Report group: Style. Rule: prose standard / D. Structure / Vary paragraph length.
- Finding as the report gives it:
  > 37. The Results paragraphs at main.tex:550 ("Internal indices mislead here in a specific, reproducible way."), main.tex:576 and main.tex:587 come one after another at 94, 91 and 90 words. Only figure captions stand between them. The rule says uniform blocks are a template and asks for varied paragraph length.
- What it asks: vary the length of the three paragraphs.
- Sections: 4.3; 4.4; 4.5.
- Places checked:
  - W37(a) "Internal indices mislead here in a specific, reproducible way.": stands, line 550; the paragraph runs 550-558.
  - W37(b) The paragraphs at 576-583 and 587-593: stand. Between them stand Fig. trap (560-572) and the headings at 574 and 585. The word counts are the report's.
- Severity: Minor.
- Suggested fix: let the rewrites of W10 and W28 (576-583) and W9 and W16 (587-593) change these paragraphs to the length their content needs, for example by joining the MIT-BIH paragraph's interpretation with its evidence or by expanding the scaling paragraph with the per-representation figures.
- Calls for: new reference no; figure change no; number from saved results no.

## W38

- Report group: Style. Rule: prose standard / D. Structure / Binary contrast ("not X, Y") at most twice per page.
- Finding as the report gives it:
  > 38. The Limitations section, one paragraph of 335 words, holds four binary contrasts. The first two are at main.tex:773, "rather than a full re-run", and main.tex:778, "rather than generalising". The other two go over the limit:
  > - main.tex:780, "each chosen so that the class definition is unambiguous and a clustering failure can be charged to the representation rather than to label noise"
  > - main.tex:787, "The federated study is a simulation on a single physical dataset, not a multi-institution deployment."
  > The rule allows at most two per page.
- What it asks: at most two binary contrasts in the Limitations.
- Sections: 6 Limitations.
- Places checked:
  - W38(a) "rather than a full re-run": stands, line 773.
  - W38(b) "rather than generalising": stands, line 779 (the report gives 778, where the clause starts).
  - W38(c) "each chosen so that the class definition is unambiguous and a clustering failure can be charged to the representation rather than to label noise": stands, lines 780-781.
  - W38(d) "The federated study is a simulation on a single physical dataset, not a multi-institution deployment.": stands, lines 787-788.
- Severity: Minor.
- Suggested fix: the contrasts at 773 and 779 go with W46 and W4. At 787-788 state the fact directly ("The federated study simulates ten sites within one dataset"). Keep the contrast at 780-781 if it is the point of that sentence.
- Calls for: new reference no; figure change no; number from saved results no.

## W39

- Report group: Style. Rule: prose standard / D. Structure / Three or more list-shaped items in paragraph form become a list.
- Finding as the report gives it:
  > 39. These passages run three or more list-shaped items in paragraph form. The rule asks for them to become a list.
  > - main.tex:137, "(i) A chance-corrected, patient-grouped, significance-tested clustering benchmark ... (ii) ... (iii) ... (iv)". These are four contributions.
  > - main.tex:274, "The implementations are those of scikit-learn, run with ten $k$-means restarts per seed, Ward linkage on Euclidean distance, ... and a minimum cluster size of $n/50$ ... for HDBSCAN". These are five clusterer settings.
  > Also: prose standard / E. Sentence shapes / Sentence length. The sentence has 65 words.
  > - main.tex:297, "There $U$ is the partition by true class and $V$ the partition by cluster, $n$ is the number of records ...". These are the notation definitions.
  > - main.tex:742, "Six things separate this study from the closest ECG foundation-model clustering benchmark". The six items follow in paragraph form.
  > Also: prose standard / E. Sentence shapes / Stop-start fragments. Each item is a sentence fragment: main.tex:743, 745, 747, 748, 749 and 750.
- What it asks: turn the four passages into lists introduced with a colon; split the long sentence; make the six Discussion items list items in place of fragments.
- Sections: 1 Introduction; 3.3; 5 Discussion.
- Places checked:
  - W39(a) "(i) A chance-corrected, patient-grouped, significance-tested clustering benchmark ... (ii) ... (iii) ... (iv)": stands, lines 137-147.
  - W39(b) "The implementations are those of scikit-learn, run with ten $k$-means restarts per seed, Ward linkage on Euclidean distance, ... and a minimum cluster size of $n/50$ ... for HDBSCAN": stands, lines 274-279 (the sentence ends at 280).
  - W39(c) Also, sentence length: the count of 65 words is the report's.
  - W39(d) "There $U$ is the partition by true class and $V$ the partition by cluster, $n$ is the number of records ...": stands, lines 297-298 (the definitions run to 303).
  - W39(e) "Six things separate this study from the closest ECG foundation-model clustering benchmark": stands, lines 742-743.
  - W39(f) Also, the fragments open at 743 ("A hand-crafted axis"), 745 ("A supervised ceiling"), 747 ("An out-of-fold test"), 748 ("A second dataset"), 749 ("Two cautions") and 750 ("And two deployment stressors"): stand.
- Severity: Minor.
- Suggested fix: set the four contributions (137-147) as an enumerated list introduced with a colon. Set the five clusterer settings (274-280) as a list, one clusterer per item. Set the notation (297-303) as a list or move it into Table metrics. Set the six differences (742-752) as a list introduced with a colon, each item a full sentence or a labelled item. Keep the `\rev` or `revblock` marking on each changed passage (an itemize inside a revised passage goes in `revblock`).
- Calls for: new reference no; figure change no; number from saved results no.

## W40

- Report group: Style. Rule: manuscript prose standard / Section D, Paragraphs.
- Finding as the report gives it:
  > 40. These paragraphs are far below the length of about 120 to 200 words. The rule asks for a paragraph that far outside that length to be split, or joined with its neighbour. The paragraphs at main.tex:97 and 734 are given in findings 22 and 26.
  > - main.tex:122, "The most directly related work benchmarks several ECG foundation models": 72 words.
  > - main.tex:207, "For generalization we use the MIT-BIH Arrhythmia Database": 63 words.
  > - main.tex:258, "On MIT-BIH the rhythm features do not transfer to single beats": 54 words.
  > - main.tex:263, "The two lead sets are deliberate and answer to different constraints.": 55 words.
  > - main.tex:399, "Table~\ref{tab:main} and Fig.~\ref{fig:heatmap} summarise the PTB-XL benchmark.": 67 words.
  > Also: references/rules.md / Paragraphs / First sentence states the point. The first sentence points to a table and a figure. The main point, that the representation decides the outcome, comes later.
- What it asks: join each short paragraph with its neighbour or develop it to paragraph length; open the paragraph at 399 with its point.
- Sections: 1 Introduction; 3.1; 3.2; 4.1.
- Places checked:
  - W40(a) "The most directly related work benchmarks several ECG foundation models": stands, line 122 (paragraph 122-128).
  - W40(b) "For generalization we use the MIT-BIH Arrhythmia Database": stands, line 207 (paragraph 207-212).
  - W40(c) "On MIT-BIH the rhythm features do not transfer to single beats": stands, line 258 (paragraph 258-261).
  - W40(d) "The two lead sets are deliberate and answer to different constraints.": stands, line 263 (paragraph 263-267).
  - W40(e) "Table~\ref{tab:main} and Fig.~\ref{fig:heatmap} summarise the PTB-XL benchmark.": stands, line 399 (paragraph 399-405).
  - W40(f) Also, first sentence of 399: stands; the point comes at 403-405.
  - The word counts are the report's. The paragraphs at 97 and 734 are W22(a) and W26.
- Severity: Minor.
- Suggested fix: join 122-128 with 113-120 or 130-149 (it introduces the gap the contributions answer); join 258-261 with 263-267, which both concern the lead sets; extend 207-212 with the MIT-BIH cohort details or join it with the PTB-XL paragraph; open 399-405 with the point at 403-405 and follow it with the values, joining it with the paragraph at 448 if the rewrites of W41 allow.
- Calls for: new reference no; figure change no; number from saved results no.

## W41

- Report group: Style. Rule: manuscript prose standard / Section D, Paragraphs.
- Finding as the report gives it:
  > 41. These paragraphs cover more than one idea, or run far past 200 words. The rule asks for them to be split.
  > - main.tex:271, "Each representation is clustered with $k$-means": 583 words. It covers the clusterer settings, conv-AE training, foundation-model inference, the metric notation, the supervised ceiling, the seeds, the conditioner sweep, the K sweep and the imbalanced subsample.
  > Also: references/rules.md / Common style errors / Tense per section. The rule asks for the past tense in Methodology.
  > - main.tex:448, "Uncertainty enters at two levels and they are of different size." The paragraph covers the significance of the contrasts and, separately, the ordering across K (main.tex:460).
  > Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph is mainly about the Wilcoxon contrasts, their effect sizes and the ordering across K.
  > - main.tex:714, "The practical reading is a decision rule": 236 words. It covers the decision rule, the cost comparison, the lead constraint and the non-viability of the raw and autoencoder pipelines.
  > - main.tex:771, "ECGFounder expects 500\,Hz input": 335 words. It covers the 500 Hz upsampling, the choice of foundation models, the binary tasks, the MIT-BIH omission and the federated simulation.
- What it asks: split each paragraph by idea; past tense in Methodology; open the paragraph at 448 with its point.
- Sections: 3.3; 4.1; 5 Discussion; 6 Limitations.
- Places checked:
  - W41(a) "Each representation is clustered with $k$-means": stands, line 271 (paragraph 271-318).
  - W41(b) Also, tense: present tense stands throughout 271-318.
  - W41(c) "Uncertainty enters at two levels and they are of different size.": stands, line 448 (paragraph 448-464); the K sweep opens at 460.
  - W41(d) Also, first sentence of 448: stands.
  - W41(e) "The practical reading is a decision rule": stands, line 714 (paragraph 714-732).
  - W41(f) "ECGFounder expects 500\,Hz input": stands, line 771 (paragraph 771-796).
  - The word counts are the report's.
- Severity: Minor.
- Suggested fix: split 271-318 into paragraphs for the clusterers and their settings, the conv-AE training and foundation-model inference, the metrics (with the notation, W39), the supervised ceiling and seeds, and the scaler, K and imbalance sweeps, in the past tense. Split 448-464 into the significance of the contrasts, opened by that point, and the K sweep (460-464). Split 714-732 into the decision rule, the cost, the lead constraint and the raw and conv-AE pipelines, or as many as the content needs. Split 771-796 into upsampling, foundation-model choice, binary tasks, the MIT-BIH omission (W5) and the federated simulation.
- Calls for: new reference no; figure change no; number from saved results no.

## W42

- Report group: Style. Rule: prose standard / E. Sentence shapes / Stop-start fragments.
- Finding as the report gives it:
  > 42. These fragments are labels that depend on the sentence after them. The rule asks for them to be joined to it.
  > - main.tex:619, "First, class imbalance."
  > - main.tex:629, "Second, federation."
  > Also: references/rules.md / Paragraphs / First sentence states the point. The paragraph's point is that non-IID federation degrades the representations unequally, and it comes later.
- What it asks: join each fragment to the sentence after it; open the paragraph at 629 with its point.
- Sections: 4.6.
- Places checked:
  - W42(a) "First, class imbalance.": stands, line 619.
  - W42(b) "Second, federation.": stands, line 629.
  - W42(c) Also, the point of the paragraph at 629 stands at 631-632.
- Severity: Minor.
- Suggested fix: write "Under class imbalance, at the 9:1 SR:AF ratio, ..." at 619, and open the paragraph at 629 with the non-IID result (the three representations above chance lost unequal shares of their centralized ARI), followed by the IID check.
- Calls for: new reference no; figure change no; number from saved results no.

## W43

- Report group: Style. Rule: prose standard / E. Sentence shapes / Cold opens.
- Finding as the report gives it:
  > 43. main.tex:515, "That reading is testable and we test it out of fold." "That reading" has no clear antecedent, because the previous paragraph ends on probe linearity. The rule asks for the prior subject to be carried forward.
  > Also: references/rules.md / Paragraphs / First sentence states the point. The point, that the class information is present but lies off the dominant axes, comes later.
- What it asks: name the reading at 515; open the paragraph with its point.
- Sections: 4.2.
- Places checked:
  - W43(a) "That reading is testable and we test it out of fold.": stands, line 515; the previous paragraph ends on probe linearity at 511-512.
  - W43(b) Also, the point stands at 526-529.
- Severity: Minor.
- Suggested fix: open the paragraph with its result, that a single discriminant direction fitted on other patients raises held-out ARI from 0.160 to 0.549 for HuBERT-ECG, so its class information is present and lies off its dominant axes (the reading at 503-505), and follow with the procedure (515-521).
- Calls for: new reference no; figure change no; number from saved results no.

## W44

- Report group: Style. Rule: prose standard / E. Sentence shapes / Sentence length.
- Finding as the report gives it:
  > 44. main.tex:240, "Lead II is the standard rhythm lead, ... where a twelve-lead definition would not apply." The sentence has 55 words and chains three reasons that do not depend on each other. The rule asks for sentences under roughly 20 words unless the mechanism needs more.
- What it asks: split the sentence into its three reasons.
- Sections: 3.2.
- Places checked:
  - W44(a) "Lead II is the standard rhythm lead, ... where a twelve-lead definition would not apply.": stands, lines 240-245. The count of 55 words is the report's.
- Severity: Minor.
- Suggested fix: three sentences: lead II is the standard rhythm lead, on which RR regularity and P-wave presence are read; single-lead recordings are the established setting for automated AF detection, with the citation kept; a single-lead definition allows the feature logic to be carried to the 2-lead MIT-BIH beats (worded to agree with W21(b)).
- Calls for: new reference no; figure change no; number from saved results no.

## W45

- Report group: Style. Rule: manuscript prose standard / G. The project's own software / No software wording.
- Finding as the report gives it:
  > 45. These passages name code identifiers. The rule asks for the text to name none.
  > - main.tex:199, "Records are read from the \mbox{100\,Hz} distribution of the database with \texttt{wfdb.rdsamp} and cast once to a \texttt{float32} array"
  > - main.tex:222, "Input: all twelve leads, \texttt{float32}, 1000 by 12."
  > - main.tex:230, "Input: all twelve leads, \texttt{float32}, resampled to 12 by 2500"
  > - main.tex:239, "Input: lead II alone, \texttt{float32}, 1000 samples, reduced to a 16-dimensional \texttt{float32} vector."
  > - main.tex:250, "Input: all twelve leads, \texttt{float32}."
- What it asks: remove the code identifiers and state the facts in the study's terms.
- Sections: 3.1; 3.2.
- Places checked:
  - W45(a) "Records are read from the \mbox{100\,Hz} distribution of the database with \texttt{wfdb.rdsamp} and cast once to a \texttt{float32} array": stands, lines 199-201.
  - W45(b) "Input: all twelve leads, \texttt{float32}, 1000 by 12.": stands, line 222.
  - W45(c) "Input: all twelve leads, \texttt{float32}, resampled to 12 by 2500": stands, line 230.
  - W45(d) "Input: lead II alone, \texttt{float32}, 1000 samples, reduced to a 16-dimensional \texttt{float32} vector.": stands, lines 239-240.
  - W45(e) "Input: all twelve leads, \texttt{float32}.": stands, line 250.
- Severity: Major (software wording, as the peer reviewer page grades it).
- Suggested fix: at 199-201 say that the study uses the 100 Hz release of PTB-XL, each record as 1000 samples by 12 leads, without the function name and the data type. At 222, 230, 239-240 and 250 drop the data type and keep the leads and dimensions ("Input: all twelve leads, 1000 samples by 12."; "Input: lead II alone, 1000 samples, reduced to 16 features."). If numeric precision matters, write "single-precision" once in 3.1.
- Calls for: new reference no; figure change no; number from saved results no.

## W46

- Report group: Style. Rule: manuscript prose standard / G. The project's own software / No software wording.
- Finding as the report gives it:
  > 46. These passages use the wording of software operations, or name a run or a process, about the project's own work. The rule asks for none.
  > - main.tex:201, "No filtering, resampling or rescaling is applied at load time"
  > - main.tex:285, "The two foundation models are used in evaluation mode with gradients disabled"
  > - main.tex:388, "A run is fifteen aggregation rounds of three local Lloyd iterations per site"
  > - main.tex:689, "the process that ran the inference, each representation measured in its own process". The finding placed this at 688.
  > - main.tex:771, "because bulk streaming of the 500\,Hz records was rate-limited at the source"
  > - main.tex:773, "A consistency check on a 300-record subset, rather than a full re-run,"
  > - main.tex:785, "cached embeddings"
- What it asks: reword each passage as a statement about the study.
- Sections: 3.1; 3.3; 3.4; Table cost caption; 6 Limitations.
- Places checked:
  - W46(a) "No filtering, resampling or rescaling is applied at load time": stands, lines 201-202.
  - W46(b) "The two foundation models are used in evaluation mode with gradients disabled": stands, lines 285-286.
  - W46(c) "A run is fifteen aggregation rounds of three local Lloyd iterations per site": stands, lines 388-389.
  - W46(d) "the process that ran the inference, each representation measured in its own process": stands, lines 689-690, in the caption of Table cost.
  - W46(e) "because bulk streaming of the 500\,Hz records was rate-limited at the source": stands, lines 771-772.
  - W46(f) "A consistency check on a 300-record subset, rather than a full re-run,": stands, line 773.
  - W46(g) "cached embeddings": stands, line 785.
- Severity: Major (software wording, as the peer reviewer page grades it).
- Suggested fix: (a) "No filtering, resampling or rescaling precedes each representation's own preprocessing". (b) "The two foundation models are applied with their published weights frozen". (c) "Each federated clustering consists of fifteen aggregation rounds of three local Lloyd iterations per site". (d) "Peak memory is the peak resident memory of the inference, measured separately for each representation". (e) "because the 500 Hz release could not be obtained in full for this study". (f) "A comparison on a 300-record subset" (this also removes a contrast, W38). (g) "the same embeddings".
- Calls for: new reference no; figure change no; number from saved results no.

## W47

- Report group: Style. Rule: references/rules.md / Formality / No colloquial words.
- Finding as the report gives it:
  > 47. main.tex:471, "rather than tune them away". The rule asks for formal, academic vocabulary.
- What it asks: formal wording.
- Sections: 4.1.
- Places checked:
  - W47(a) "rather than tune them away": stands, lines 471-472.
- Severity: Minor.
- Suggested fix: "and report both with the settings of Section 3.3, without further tuning".
- Calls for: new reference no; figure change no; number from saved results no.

## W48

- Report group: Style. Rule: references/rules.md / Common style errors / Vague phrase.
- Finding as the report gives it:
  > 48. main.tex:551, "while every point but a handful". The rule asks for the specific claim, here the number of points outside the large cluster.
- What it asks: the number of records outside the large cluster in place of "a handful".
- Sections: 4.3.
- Places checked:
  - W48(a) "while every point but a handful": stands, line 551.
- Severity: Minor.
- Suggested fix: main.tex does not give the exact count, and finding it would take a number from saved results, which config.md excludes. State what the text holds: the largest cluster holds the cohort to two decimals (largest-cluster fraction 1.00), which on 2542 records leaves at most 12 records outside it (a fraction that rounds to 1.00 is at least 0.995). If the exact count is wanted, it needs the saved results, which config.md excludes.
- Calls for: new reference no; figure change no; number from saved results: the exact count would need one, excluded by config.md; the fix above uses only numbers in the text.

## W49

- Report group: Style. Rule: references/rules.md / Common style errors / Tense per section.
- Finding as the report gives it:
  > 49. These passages report in the present tense where the section's row asks for the past tense.
  > - main.tex:180, "reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL and finds that some models cluster by clinical label". This is a literature review reporting results.
  > - main.tex:191, "We use PTB-XL \cite{ptbxl2020}, a public 12-lead database". Methodology.
  > - main.tex:380, "To probe deployment under data siloing we use standard federated $k$-means". Methodology.
  > - main.tex:400, "ECGFounder clusters best (ARI up to 0.885 with $k$-means), the hand-crafted features are competitive". Results.
  > - main.tex:550, "Raw flattening with agglomerative clustering attains a silhouette of 0.81". Results.
  > - main.tex:629, "every representation retains essentially its centralized ARI". Results.
  > - main.tex:677, "The two are ordered against each other: ECGFounder, which clusters best, is the most expensive per record". Results.
- What it asks: past tense in the literature review's report of results, in Methods and in Results.
- Sections: 2 Related work; 3.1; 3.4; 4.1; 4.3; 4.6; 4.7.
- Places checked:
  - W49(a) "reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL and finds that some models cluster by clinical label": stands, lines 180-181.
  - W49(b) "We use PTB-XL \cite{ptbxl2020}, a public 12-lead database": stands, line 191.
  - W49(c) "To probe deployment under data siloing we use standard federated $k$-means": stands, line 380.
  - W49(d) "ECGFounder clusters best (ARI up to 0.885 with $k$-means), the hand-crafted features are competitive": stands, lines 400-401.
  - W49(e) "Raw flattening with agglomerative clustering attains a silhouette of 0.81": stands, lines 550-551.
  - W49(f) "every representation retains essentially its centralized ARI": stands, lines 629-630.
  - W49(g) "The two are ordered against each other: ECGFounder, which clusters best, is the most expensive per record": stands, lines 677-678.
- Severity: Minor.
- Suggested fix: past tense at each place ("reported ... and found", "We used", "we used", "ECGFounder clustered best", "attained", "retained", "ECGFounder ... was the most expensive"), and the same tense through the rest of each section where the rewrites touch it (W9, W10, W21, W41).
- Calls for: new reference no; figure change no; number from saved results no.

---

## Reading 1

What was read: `manuscript/main.tex` as patched (928 lines), against `git show HEAD:manuscript/main.tex` (840 lines); `manuscript/refs.bib` as patched; the apply reports of patch 01 (47 ops, items W1 to W49, structural flag "section count changes from 24 to 20", acknowledged) and patch 04 (OP001 for C1, OP002 for C2); `intended-claims.md`; `citation-report.md`; the last section of `checks.md`; the comments file. `cmp` shows that `manuscript/main.tex` is byte-identical to `patches/01-main.tex.patched` and `manuscript/refs.bib` to `patches/04-refs.bib.patched`. `git diff HEAD -- manuscript/refs.bib` changes only the author field of wavelettensorecg2018 (C1) and the doi field of hdbscan2013 (C2), both as the citation report gives them. Every line number in this reading is the patched main.tex. Every `\ref` in the text has its `\label` (grep of both lists). The set of numbers printed in the text is the same before and after the patch (diff of the two sorted number lists printed nothing), so no number was changed or added. The text has no semicolon in running prose; the only three stand in table cells of Table metrics (384-386). The manuscript was not compiled in this reading, since the reading writes no file but `items.md`; whether it builds is not verified.

Counts: 42 items resolved, 7 partly resolved (W11, W14, W16, W20, W23, W37, W48), 0 not resolved. New items V1 to V30 follow the per-item reading.

### W1

Resolved. The Abstract states the contribution without the "ranking ... ; the contribution is" shape: "The chance-corrected controls locate where naive pipelines fail." (81). The one statement that the ordering is expected stands in the Introduction with its reason: "Because SR and AF differ by definition in the regularity of the rhythm, it is expected that compact hand-crafted features and a large foundation model both recover the split. The ordering of the representations is therefore not the contribution." (135-138). The Discussion close "None of these is a new method, and the ordering of the representations is not itself the result." and the opening "We claim no methodological novelty." are cut; the list of six elements ends at 832-833. "ranking" and "ranked" appear nowhere in the text (grep); "ordering" stands at 76, 138, 478, 505, 513, 519, 660, 832 and 870.

### W2

Resolved. The Discussion gives the comparison through its results: "they are within reach of ECGFounder on balanced data (0.711 against 0.885), lead it at the 9:1 ratio (0.265 against 0.063) and retain 0.92 of their centralized ARI under non-IID federation against its 0.69, all on the PTB-XL cohort" (801-803). The Introduction's contribution (iii) now reads "The 16 hand-crafted features keep the highest adjusted Rand index (ARI) at a 9:1 SR:AF ratio and the largest share of their centralized ARI under non-IID federation." (156-158), a different shape. The new Discussion wording repeats the Conclusion's at 897 (V19), and "keep the highest" misstates the result (V8).

### W3

Resolved. "We do not propose a new method." stays once, at 163. The clause "we do not propose a new federated method" is cut: "To probe deployment under data siloing we used standard federated $k$-means with FedAvg-style centroid aggregation \cite{fedavg2017}." (433-434). The Discussion paragraph opens with its point, "Six elements separate this study from the closest ECG foundation-model clustering benchmark \cite{lookingbeyond2026}:" (817-818), and the sentence on known components and "None of these is a new method" are cut.

### W4

Resolved. The Introduction keeps one clause in its own words: "The statements about foundation models concern HuBERT-ECG and ECGFounder, the two evaluated here" (163-164). The sentence "We therefore name each model and do not generalise to foundation models as a class" is cut from 4.1 (525-531). The full scope statement stands in the Discussion (843-846). The Limitations clause is cut: "We evaluate two foundation models. Other foundation models, including some reported to cluster well \cite{lookingbeyond2026}, are not included, and Section~\ref{sec:discussion} sets out how this bounds the conclusions." (858-861).

### W5

Resolved. The statement stands once, in Methods: "The two foundation models were not applied to the 2-lead beats, because both are tied to the 12-lead input format." (295-296). The Discussion gives only its consequence: "The two foundation models we test could not be applied to the 2-lead MIT-BIH beats" (806-807). The Limitations say "The MIT-BIH arm has no foundation-model row, for the lead reason given in Section~\ref{sec:methods}." (861-862); the reference points at Section 3 as a whole (V21).

### W6

Resolved. The Results refer to the Methods for the floor and go to the effect sizes: "That value is the floor for ten paired seeds described in Section~\ref{sec:methods}, so each contrast also carries two effect sizes. Cliff's delta and the matched-pairs rank-biserial correlation were both 1.00 on all three" (509-512). The explanation stands once, at 424-425. The reference is to Section 3 rather than 3.3 (V21).

### W7

Resolved. "The cost comparison of Table~\ref{tab:cost} points the same way: the representation that held up better under both stressors is also the lower-cost one to compute." (803-805). The factor of fifteen and the parameter clause stand only in 4.7 (759-762).

### W8

Resolved. The Discussion opens "For the PTB-XL rhythm task and the MIT-BIH morphology task, the results support a decision rule." (796-797); the full scope statement stands in the Conclusion (892-893).

### W9

Resolved, including the tense sub-point. "The ordering replicated on a different dataset and a different task type" (660). "ranking" at the Abstract, the Introduction and the Discussion list is gone (grep); "higher-ranked" became "higher in the ordering" (505, 513).

### W10

Resolved, including the vague-phrase, definition and tense sub-points. The term is "feature scaling", defined at first use in the body: "Feature scaling, the per-feature transformation applied to a representation before clustering (Yeo-Johnson power, standard, quantile or robust scaling), changes the result by a wide margin." (151-153), and in the Abstract with the figures in place of "materially": "feature scaling, the per-feature transformation applied before clustering, moves the mean ARI of the hand-crafted features from 0.229 to 0.629 across four scalers" (78-80). "scaler" names one of the four methods (80, 362, 364, 655, 704). Methods: "we swept four scalers for feature scaling" (362-363), "before scaling" (366), "Feature scaling was fitted once" (439). Heading "Feature scaling" (647); "Feature scaling changed the outcome by a wide margin." (649), past tense, with the figures in the next two sentences. "the dependence of the result on feature scaling" (830); "feature scaling are not neutral" (899). "conditioning", "conditioner" and "materially" appear nowhere (grep).

### W11

Partly resolved. Resolved: "cheap" is gone (grep); the Abstract gives the measures, "the hand-crafted features keep the highest ARI and overtake ECGFounder. Under federation across ten sites that differ in class prevalence they retain the largest share of their centralized ARI, 0.92 against 0.69 for ECGFounder, at about one fifteenth of its inference time per record." (82-86); "The hand-crafted features retained 92\% of their centralized ARI, the largest share." (712-713) in place of "the most robust"; the closing sentence with "more dependable choice" and "phenotyping" is cut. "the more predictable of the two" (721, 896) is now tied to its stated criterion, the worst site draw (719-720). Not resolved: one of the four names stays, "The deployability claim concerns cost as well as accuracy, so Table~\ref{tab:cost} states what each representation costs to compute." (757). With "the cheap interpretable representation is the more deployable one" cut from the Abstract, no deployability claim stands anywhere in the text, so the sentence refers to a claim the paper no longer makes. Suggested fix: state what the cost table adds without the name, for example "Table~\ref{tab:cost} states what each representation costs to compute, since the choice between representations depends on cost as well as on clustering quality."

### W12

Resolved, including the colloquial and restating-close sub-points. "overtake ECGFounder" (83); "class imbalance moved the hand-crafted features ahead of ECGFounder, and non-IID federation brought the means of the two closer" (692-694); the close "The foundation embedding's balanced-data lead does not survive imbalance." is cut; the caption reads "Non-IID heterogeneity erodes ECGFounder's lead while the hand-crafted representation retains 0.92 of its centralized ARI." (744-746). "foundation embedding" stands only for the class at 187 and 527.

### W13

Resolved. "record" names one ECG of a cohort throughout: "That project flattened each 12-lead record into a long vector" (106), "almost all records fell into a single cluster" (113), "cross-record temporal alignment" (247), "the full \mbox{10\,s} record" (280), "two records" (550). "strip" appears nowhere (grep); "recording(s)" stands only for collections and the setting of other work (181, 269, 841, 894). The first paragraph was joined with the next (W22, W40) and opens with its point: "On the two arrhythmia tasks this study evaluates, whether clustering of the electrocardiogram (ECG) recovers a clinical label depends on the representation fed to the clustering algorithm and on how the result is evaluated." (98-100); the master's project then serves as the evidence for both parts of that point.

### W14

Partly resolved. Resolved at the three places the finding names: "convolutional autoencoder (conv-AE)" (144), "the raw and conv-AE pipelines" (810, 898), and the Discussion names the raw arm and the original project apart, "these two pipelines, including the raw arm that reproduces the input of the original project's design" (813-814). Not resolved: the patched Related work names this study's conv-AE arm "a reconstruction autoencoder" in new text, "This study focuses on four families, which range from representations shaped only by signal energy, raw flattening and a reconstruction autoencoder, to features built from the defining signatures of the classes" (184-186), and 4.2 keeps "a properly trained reconstruction autoencoder encodes the class without organising it into clusters" (563-565) for the same arm. Suggested fix: "raw flattening and the conv-AE" at 185-186, and "the conv-AE, a properly trained reconstruction model, encodes the class ..." at 563-565. The generic sentence at 173-175 ("A reconstruction autoencoder is trained to reproduce its input ...") names the class of model and stays.

### W15

Resolved, including both sub-points. "federation across sites that differ in class proportions (non-IID)" (155-156) defines the split at first use; "Under non-IID federation the three representations that cluster above chance lost unequal shares of their centralized ARI (Table~\ref{tab:fed} and Fig.~\ref{fig:fed}). ECGFounder fell from 0.885 to 0.612, the hand-crafted features from 0.644 to 0.591 and HuBERT-ECG from 0.174 to 0.106, while raw flattening stayed at 0.000 in every setting." (707-710). "client" appears nowhere (grep).

### W16

Partly resolved. Resolved at the place named: "the 21-dimensional beat-morphology features clustered well (ARI 0.783)" (661-662), matching "a 21-dimensional beat-morphology and RR-context feature set" (294-295) and Table mitbih. Not resolved: new Discussion text puts the 21-dimensional set back under the PTB-XL name, "On both tasks these two pipelines ... recovered far less of the class structure than the hand-crafted representations." (813-815), where on MIT-BIH the comparison is with the beat-morphology features. Suggested fix: "than the hand-crafted features on PTB-XL and the beat-morphology features on MIT-BIH".

### W17

Resolved. "the patient-grouped bootstrap, a percentile bootstrap over the evaluation cohort with \mbox{5\,000} resamples" (413-415); "Patient-grouped bootstrap intervals" (469); "the patient-grouped bootstrap given in the caption of Table~\ref{tab:main}" (515-516).

### W18

Resolved, including the hedging, plain-prose and repeated-construction sub-points. The Abstract's last sentence is cut; the Abstract ends "at about one fifteenth of its inference time per record." (86). In the Conclusion the restating clause is cut and the open questions stand alone: "Whether these results hold for multi-class arrhythmia cohorts, for other foundation models and for a real multi-institution federation is open." (900-901).

### W19

Resolved. "ECGFounder fell from 0.885 to 0.612" (709) names its ARI, and "ECGFounder's lead over them narrowed accordingly, from 0.885 against 0.644 centralized to 0.612 against 0.591 under non-IID federation." (713-715) names the lead by the two pairs of values.

### W20

Partly resolved. Resolved: purity and the silhouette are glossed where first used, "high cluster purity, the share of the majority class inside each cluster, and a silhouette score near 0.89, the silhouette being a label-free index of cluster compactness" (108-110); the master's project is described as "an unpublished master's project" (105) in place of a citation (the fact itself is V16); "Patient-grouped means that no patient appears in more than one fold." (145-146); the ceiling is defined in the Introduction (146-147) and the Abstract (71); "Internal validity indices such as the silhouette, which are computed without labels" (150-151); the spectrum phrase is replaced (184-187); "atrial fibrillation (AFIB) or atrial flutter (AFLT), so that both count as AF" (215-216); the flutter limitation is added (870-873); "We evaluate two foundation models." (858). Not resolved: beat-template consistency stays undefined, with a placeholder in the text, "and beat-template consistency\rev{, [GAP: one-clause definition of beat-template consistency, from the study's feature extraction]}" (263-265). Needs the user: the definition rests on how the study computed the feature, which neither the manuscript nor the run's materials hold (grep of `admin/reviews/` finds no definition). Recorded as V6.

### W21

Resolved, including the tense and limitation sub-points. (a) "Both match a majority-class assignment, the conv-AE despite a supervised ceiling of 0.678 and the raw pipeline with a ceiling of 0.519 against a majority of 0.504." (73-75). (b) "A single-lead definition also lets the feature logic, RR timing and beat morphology, be carried to the two-lead MIT-BIH beats as the 21-dimensional beat-morphology set" (270-272), "so that its feature logic carries to the two-lead MIT-BIH beats" (288-289), "the hand-crafted feature logic carried to them as the 21-dimensional beat-morphology set" (807-808). (c) "the raw vector because it holds little label information that a linear probe recovers" (552-553); "The raw pipeline carried little label information that a linear probe recovers" (560-561), past tense. (e) "The two stressors closer to deployment changed the comparison in different ways" (692-695), past tense. (g) "On PTB-XL the raw and conv-AE pipelines were indistinguishable from a majority-class assignment under all five clusterers. On MIT-BIH, evaluated with three clusterers, the conv-AE reached at most 0.127 and the raw beat window at most 0.049, against 0.783 for the beat-morphology features." (810-813). (h) "Their best ARIs here are 0.885 and 0.195, so the foundation arm is not a single point." (841-842). (i) "The upsampled input may therefore raise ECGFounder's ARI by about 0.013 on that subset, which is small against its $k$-means lead of 0.242 over the hand-crafted features." (856-858).

### W22

Resolved, including every sub-point. (a) The paragraph opens with its point (98-100), the claim about most ECG work is cut, "often" is replaced by the questions themselves (101-103), and the paragraph is joined with the next (98-115, 193 words by `wc -w`, markup included). (b) The attribution sentence is cut. (c) "Those two gaps are exactly where a careful, honest benchmark adds value" and "default" and "canonical" are cut; "This study adds both: a hand-crafted arm built from RR-interval and beat-morphology features \cite{hrvstandards1996,dechazal2004}, and a beat-morphology task on the MIT-BIH Arrhythmia Database \cite{mitbih2001}." (129-131). (d) "A reconstruction autoencoder is trained to reproduce its input and receives no class information, so nothing in its objective arranges its code by class." (173-175), definitional. (e) "spectral clustering reached an ARI of 0.016 on HuBERT-ECG, against 0.174 with $k$-means on the same matrix, and 0.001 and 0.000 on the conv-AE and raw flattening" (528-530). (f) "a common default for physiological signals" is cut (653). (g) "intrinsically hard" is cut (695-696). (h) "We judge a deployment by the worst site draw as well as by the average one, because each real site has one class mix, which may be an unfavourable one." (719-720). (i) Cut with the paragraph of W26. The passage that W22(c) rewrote still carries C3 and C4 (V1, V2).

### W23

Partly resolved. Resolved: (a) "HuBERT-ECG also receives only the first \mbox{5\,s} of each \mbox{10\,s} record, about half the RR intervals the other arms see, which may contribute to its low native ARI alongside this off-axis reading." (598-600); (b) "Because the partitions are held fixed, these intervals do not include the variation that refitting the clustering on each resample would add." (416-418); (c) "Feature scaling in the simulation is fitted on statistics pooled over all sites, which a real federation would not have" (879-881); (d) the 65-word sentence is split (695-703), the scaler is named, and the result is limited, "The reversal holds for this ratio, scaler and clusterer, the only imbalanced setting evaluated." (704-705). Not resolved: the clusterer is a placeholder, "These results used power scaling and [GAP: the clusterer of the 9:1 results, which the manuscript does not name], over the ten seeds." (696-697); needs the user, since the manuscript and the run's materials do not name it (grep of `admin/reviews/` finds only the ten-seed values); recorded as V7. A general statement also remains in the Conclusion, "Under class imbalance 16 interpretable hand-crafted features overtake it" (894-895), which the item asks to restrict to the ratio evaluated. Suggested fix for the draft writer: "At a 9:1 SR:AF ratio 16 interpretable hand-crafted features overtake it".

### W24

Resolved. (a) "The raw arm therefore receives more input than the hand-crafted arm, so missing input does not explain its chance-level clustering. The twelve-lead input also makes the raw vector 1992-dimensional, which may itself weaken Euclidean clustering." (290-292). (b) "A likely reason is that its coordinates are amplitudes at fixed sample offsets, and no fixed offset falls on the same part of the cardiac cycle in two records. A random forest on the same vector reached 0.714, so some label information remains that a linear probe does not reach." (548-551). The added random-forest sentence repeats 4.2 (V17).

### W25

Resolved. (a) "On the two representations that clustered well it added little over the linear ceiling, 0.951 against 0.942 for the hand-crafted features and 0.9835 against 0.9831 for ECGFounder, so their label information is already linearly accessible." (575-578). (b) "At this ratio its partition therefore agreed with the classes on record pairs as often as ECGFounder's but shared less information with them." (701-703).

### W26

Resolved. The paragraph "The result also reframes the original master's project honestly." is deleted; "reframes" and "honest" appear nowhere (grep). Its content stands at 111-115 and 627-631.

### W27

Resolved, including all three sub-points. Headings "PTB-XL benchmark" (450), "Internal validity indices" (621), "Feature scaling" (647); the caption of Fig. trap no longer opens with "The silhouette trap." (636).

### W28

Resolved. "A clustering result on these representations therefore needs its scaler stated, and this study reports power scaling unless stated otherwise." (655-656).

### W29

Resolved. Title "A chance-corrected benchmark of ECG representations for unsupervised arrhythmia structure" (51-52); heading "Supervised ceiling and clusterability" (557); the caption of Fig. sep no longer opens with the sentence (611).

### W30

Resolved, including the one-idea sub-point. "This arm treats the sample amplitudes as the features and imposes no clinical model on the signal. All twelve leads entered because the arm reproduces the originating pipeline, which concatenated every lead." (250-252); "A reconstruction objective compresses whatever carries signal energy, which need not be what separates the classes." (257-258); "The arm measures directly the AF signature, RR irregularity together with P-wave absence." (273-274); "The pretrained models supply a fixed ECG feature space, and the question is whether that space places the rhythm classes in separate regions." (282-284).

### W31

Resolved. "For unsupervised arrhythmia structure in the ECG, the spread of ARI across representations exceeded the spread across clustering algorithms within each representation that clustered well, and chance-corrected external evaluation was required to see it." (889-892). Read against Table main and Table mitbih, the statement holds with all five clusterers: across representations 0.008 to 0.885 on PTB-XL against 0.137 to 0.885 (ECGFounder) and 0.060 to 0.711 (hand-crafted), and 0.049 to 0.783 on MIT-BIH against 0.679 to 0.783 (beat-morphology). The comparative shape stays at 63-64 and 452-453 (V18).

### W32

Resolved. "simply" appears nowhere (grep).

### W33

Resolved. "are exactly zero for the one-cluster solution, have expected value zero under random assignment," (192-193).

### W34

Resolved. Abstract (82-86) and contribution (iii) (156-158) name the measures; "robust" stands only as the name of a scaler (153, 363, 651, 653) and in the headings and captions "Federated robustness" and "Robustness under deployment stress", which no finding names.

### W35

Resolved. `grep -n ';'` over the body finds no semicolon in running prose; the three that remain are table cells (384-386).

### W36

Resolved, including the colon sub-point. "We compare four families on PTB-XL (Table~\ref{tab:main})\rev{:}" (243) introduces the list; "Which of the two accounts for HuBERT-ECG is what the next subsection measures." is cut.

### W37

Partly resolved. By `wc -w` (markup included) the three paragraphs went from 93, 91 and 89 words to 95 (623-631), 100 (649-656) and 122 (660-669). The MIT-BIH paragraph now differs; the 4.3 and 4.4 paragraphs remain about the same length and still stand one after the other with only a caption and a heading between them. Suggested fix: cut from 4.3 the two closing sentences that restate the Related work point at 194-196 ("A degenerate one-cluster solution maximises compactness while carrying no class information. This is the artefact behind the original project's silhouette of 0.89, and it is why chance-corrected external metrics, read together with cluster-size sanity checks, are necessary.", 627-631), keeping the reference to the original project's 0.89 in a shorter clause, which leaves 4.3 clearly shorter than 4.4.

### W38

Resolved. In the Limitations the contrasts "rather than a full re-run" and "rather than generalising" are gone with W46 and W4, and the federated sentence states the fact: "The federated study simulates ten sites within one dataset." (875). One binary contrast remains, "rather than to label noise" (866), which the item keeps as the point of its sentence.

### W39

Resolved, including both sub-points. The four contributions are an enumerated list introduced with a colon (140-162); the five clusterer settings are a list, one per item, with the 65-word sentence gone (300-315); the notation is a list (335-348); the six differences are a list of full sentences introduced with a colon (817-834). Each list stands in `revblock`.

### W40

Resolved, including the first-sentence sub-point. Word counts by `wc -w`, markup included: the closest-benchmark paragraph is joined with the gap paragraph (117-131, 156 words); the MIT-BIH paragraph is developed (229-239, 129); the two lead-set paragraphs are joined (287-296, 133); 4.1 opens with its point, "On PTB-XL the representation decided the clustering outcome more than the algorithm did" (452-461, 116).

### W41

Resolved, including the tense and first-sentence sub-points. 3.3 is split into the clusterers (300-318), the conv-AE training and foundation-model inference (320-326), the metrics with the notation (328-353), the ceiling and seeds (355-360), and the scaling, K and imbalance sweeps (362-370), in the past tense ("was clustered", "was trained", "were reported", "we swept"). The contrasts paragraph opens with its point, "Each adjacent contrast between representations under $k$-means favoured the representation higher in the ordering in every seed, and its paired bootstrap interval excluded zero." (504-506), and the K sweep stands apart (519-523). The Discussion paragraph is split into the decision rule with its cost and lead consequences (796-808) and the raw and conv-AE pipelines (810-815). The Limitations paragraph is split into the foundation-model arm (852-862), the task definition (864-873) and the federated simulation (875-885). The splits leave three paragraphs well below the standard's length (V22).

### W42

Resolved, including the first-sentence sub-point. "Under class imbalance, at the natural-like 9:1 SR:AF ratio (majority 0.90), every representation's ARI fell." (695-696); the federation paragraph opens with the non-IID result (707-708). "First, class imbalance." and "Second, federation." are gone.

### W43

Resolved, including the sub-point. "A single discriminant direction estimated from other patients more than tripled HuBERT-ECG's held-out ARI, so its class information is present and lies off its dominant axes of variation. In this out-of-fold test, ..." (582-584); 0.160 to 0.549 is more than a threefold rise.

### W44

Resolved. Three sentences: "Lead II is the standard rhythm lead, on which RR regularity and P-wave presence are read. Single-lead recordings are the established setting for automated AF detection \cite{clifford2017af}. A single-lead definition also lets the feature logic ... be carried to the two-lead MIT-BIH beats ..." (268-272). The middle sentence carries the drift C21 (V10).

### W45

Resolved. `\texttt`, `float32` and `wfdb` appear nowhere (grep). "Records were read from the WFDB-format files of the \mbox{100\,Hz} release of the database and converted once to a single-precision floating-point array of 1000 samples by 12 leads." (220-222); "Input: all twelve leads, 1000 samples by 12 leads." (248); "Input: lead II alone, 1000 samples, reduced to a 16-dimensional single-precision vector." (266-267). WFDB is the format's name in the field.

### W46

Resolved. (a) "No filtering, resampling or rescaling was applied before each representation's own preprocessing" (222-223); (b) "applied with their published weights frozen" (323-324); (c) "Each federated clustering consisted of fifteen aggregation rounds" (440-441); (d) "Peak memory is the peak resident memory of the inference, measured separately for each representation." (771-772); (e) "because the 500\,Hz release could not be obtained in full for this study" (853-854); (f) "A comparison on a 300-record subset" (855); (g) "over the same embeddings" (869). "cached" appears nowhere (grep).

### W47

Resolved. "Both are reported with the settings of Section~\ref{sec:methods}, without further tuning." (530-531); the reference is to Section 3 rather than 3.3 (V21).

### W48

Partly resolved. "a handful" is gone: "Raw flattening with agglomerative clustering attained a silhouette of 0.81 while the largest cluster held the cohort to two decimals (largest-cluster fraction 1.00) and the ARI was 0.000." (624-626). The item asks for the number of records outside the large cluster; the text gives no count or bound, and "held the cohort to two decimals" does not tell the reader how many records lie outside. The bound follows from numbers the text prints: a fraction that rounds to 1.00 is at least 0.995, which on 2\,542 records leaves at most 12 outside. Suggested fix: "while its largest cluster held all but at most 12 of the 2\,542 records (largest-cluster fraction 1.00 to two decimals)".

### W49

Resolved. "reported ... and found that some models clustered by clinical label" (199-200); "We used PTB-XL" (211); "we used standard federated $k$-means" (433); "ECGFounder clustered best" (458); "attained a silhouette of 0.81" (624); "every representation retained essentially its centralized ARI" (711-712); "Cost and clustering quality were ordered against each other: ECGFounder, which clustered best, was the most expensive per record" (758-759). The rewritten Results passages report in the past tense; the present tense left stands for interpretation and for properties of the method.

### The claims against the list (C35 to C61)

Each of the 27 claims was read with the text before the patch. None is a claim the text did not make before: each is the earlier text moved, put in the past tense or reworded (C35 from 109-111, C36 from 132-135, C37 from 184-185, C38 to C41 from 3.3 and 4.1, C42 to C49 from 4.1 to 4.3, C50 from 4.4, C51 from 4.5, C52 to C54 from 4.6, C55 from 4.7, C56 to C58 from the Discussion, C59 and C60 from the Limitations, C61 from the Conclusion). The numbers each gives agree with the tables (Table main, Table mitbih, Table fed, Table cost) and with the earlier text. Two of them matter for the argument: C50's causal sentence on robust scaling states an unmeasured mechanism as fact (V15), and the wording of intended claim 4 that the text carries at 82-83 and 156-157 misstates the result (V8). The others are right and in place, and get no item.

### New items

#### V1

- Source: citation-report.md, C3 (Critical, MAJOR_DISTORTION), with the Decision in config.md: "Stop 'A claim the run cannot support', C3, C4, C5 and C7 ... taken with the recommendation ...: revise the passage to the wording `citation-report.md` gives as supported by the source."
- Passage: main.tex 125-126, "The most directly related work benchmarks several ECG foundation models against one another, including a cluster-separability analysis on PTB-XL \cite{lookingbeyond2026}."
- What it asks: the source computes ARI on embeddings of four 12-lead datasets together, PTB-XL one of them; the passage says the analysis is on PTB-XL.
- Section: 1 Introduction.
- Severity: Critical.
- Suggested fix, the wording the report gives as supported: "including a cluster-separability analysis (adjusted Rand index) of embeddings drawn from four 12-lead datasets, PTB-XL among them \cite{lookingbeyond2026}". Keep the `\rev` marking.
- Calls for: new reference no; figure change no; number from saved results no.

#### V2

- Source: citation-report.md, C4 (Critical, MAJOR_DISTORTION), with the same Decision as V1.
- Passage: main.tex 127-128, "By its own statement it does not include a representation-wise comparison against hand-crafted features, and it omits the MIT-BIH database."
- What it asks: the source makes no statement about hand-crafted features; its own statement is that earlier benchmarks lack a representation-wise evaluation, which it adds. The omission of MIT-BIH holds by its dataset list, not by a statement.
- Section: 1 Introduction.
- Severity: Critical.
- Suggested fix, the wording the report gives as supported: "It compares four foundation models with one another and with no hand-crafted baseline, and its four datasets do not include the MIT-BIH database." The next sentence, "This study adds both: ..." (129-131), still follows. Keep the `\rev` marking.
- Calls for: new reference no; figure change no; number from saved results no.

#### V3

- Source: citation-report.md, C5 (Critical, MAJOR_DISTORTION), with the same Decision as V1.
- Passage: main.tex 198-200, "The ECG foundation-model benchmark of \cite{lookingbeyond2026} reported cluster-separability (ARI) of foundation-model embeddings on PTB-XL and found that some models clustered by clinical label while others clustered by dataset."
- What it asks: as V1; the ARI is computed on embeddings pooled over four datasets.
- Section: 2 Related work, Closest benchmark.
- Severity: Critical.
- Suggested fix, the wording the report gives as supported: "reported cluster-separability (ARI) of foundation-model embeddings pooled over four 12-lead datasets, PTB-XL among them, and found that some models clustered by clinical label while others clustered by dataset". The other sub-claims of the paragraph (201-203) hold by the report's claim 13 and stay.
- Calls for: new reference no; figure change no; number from saved results no.

#### V4

- Source: citation-report.md, C6 (Critical, MAJOR_DISTORTION), with the Decision in config.md: "revise the passage so that the counts are given as those of the release the study used (version 1.0.3, named at the data availability statement) and are not attributed to the cited paper, keeping the study's own counts, since New references is No. The counts then rest on the authors' record of the download, and the final message says so." The same release is named at 904, which citation-report.md flags as C25 (drift, AMBIGUOUS).
- Passages: main.tex 211-212, "We used PTB-XL \cite{ptbxl2020}, a public 12-lead database of 21\,799 records from 18\,869 patients, each record 10\,s long."; main.tex 904, "PTB-XL (version 1.0.3) \cite{ptbxl2020}".
- What it asks: the cited paper gives 21837 records from 18885 patients; the text's counts are attributed to it. The paper also cannot name the version 1.0.3 release.
- Section: 3.1 Data and cohorts; Code and data availability.
- Severity: Critical.
- Suggested fix, within the Decision's terms: cite the paper for the database and give the counts as those of the release, for example "We used PTB-XL \cite{ptbxl2020}, a public database of 10\,s 12-lead records, in its version 1.0.3 release, which holds 21\,799 records from 18\,869 patients." At 904, the wording C25 gives: "PTB-XL \cite{ptbxl2020}, used in its version 1.0.3 release". Keep the `\rev` marking at 211-212; the availability statement carries no marking before this run and the changed passage takes `\rev`.
- Calls for: new reference no (the Decision keeps the study's counts without a new entry); figure change no; number from saved results no.

#### V5

- Source: citation-report.md, C7 (Critical, UNVERIFIABLE), with the same Decision as V1.
- Passage: main.tex 175-179, "Contrastive self-supervised methods built on physiologically motivated augmentations and patient- or lead-level invariances, including CLOCS \cite{clocs2021}, 3KG \cite{threekg2021}, and contrastive predictive coding for 12-lead ECG \cite{mehari2022ssl}, established the pretraining recipes that later foundation models scaled up."
- What it asks: none of the three sources can hold a statement about later models; of the two models evaluated, HuBERT-ECG pretrains by masked prediction and ECGFounder by supervised multi-label classification.
- Section: 2 Related work.
- Severity: Critical.
- Suggested fix, the wording the report gives as supported: "Contrastive self-supervised methods built on physiologically motivated augmentations and patient- or lead-level invariances, including CLOCS \cite{clocs2021}, 3KG \cite{threekg2021} and contrastive predictive coding for 12-lead ECG \cite{mehari2022ssl}, learn ECG representations without labels." The passage carries no marking before this run; the changed sentence takes `\rev`.
- Calls for: new reference no; figure change no; number from saved results no.

#### V6

- Source: this reading, from the change to W20(i) (op OP013).
- Passage: main.tex 263-265, "and beat-template consistency\rev{, [GAP: one-clause definition of beat-template consistency, from the study's feature extraction]}".
- What it asks: a placeholder stands in the Methods; the feature needs a one-clause definition of how it was computed.
- Section: 3.2 Representations.
- Severity: Major.
- Suggested fix: replace the placeholder with the definition the user gives, for example the measure of similarity between each beat and the record's mean beat template, as the study computed it.
- Needs the user: the definition of the feature as the study computed it. Neither main.tex nor the run's materials hold it.
- Calls for: new reference no; figure change no; number from saved results no; a fact from the user.

#### V7

- Source: this reading, from the change to W23(d) (op OP037).
- Passage: main.tex 696-697, "These results used power scaling and [GAP: the clusterer of the 9:1 results, which the manuscript does not name], over the ten seeds."
- What it asks: a placeholder stands in the Results; the clusterer of the 9:1 results is not named.
- Section: 4.6.
- Severity: Major.
- Suggested fix: replace the placeholder with the clusterer the user names, for example "power scaling and $k$-means", and use the same name in the restriction at 704-705.
- Needs the user: which clusterer produced the 9:1 results. Neither main.tex nor the run's materials name it (the review materials give only the ten-seed values).
- Calls for: new reference no; figure change no; number from saved results no; a fact from the user.

#### V8

- Source: this reading, from the changes to W11 and W34 (ops OP002, OP007); the same wording is intended claim 4.
- Passages: main.tex 82-83, "Under heavy class imbalance, at a 9:1 SR:AF ratio, the hand-crafted features keep the highest ARI and overtake ECGFounder."; main.tex 156-157, "The 16 hand-crafted features keep the highest adjusted Rand index (ARI) at a 9:1 SR:AF ratio".
- What it asks: "keep the highest ARI" says the hand-crafted features already had the highest ARI. On balanced data ECGFounder had it (0.885 against 0.711, Table main); at the 9:1 ratio the hand-crafted features moved ahead (0.265 against 0.063). The Abstract's own "overtake" contradicts "keep".
- Section: Abstract; 1 Introduction.
- Severity: Major (the Abstract and the contributions misstate the direction of the result).
- Suggested fix: "at a 9:1 SR:AF ratio the hand-crafted features have the highest ARI, ahead of ECGFounder (0.265 against 0.063)" in the Abstract, and "The 16 hand-crafted features have the highest adjusted Rand index (ARI) at a 9:1 SR:AF ratio and retain the largest share of their centralized ARI under non-IID federation" in (iii).
- Calls for: new reference no; figure change no; number from saved results no.

#### V9

- Source: citation-report.md, C20 (drift, MINOR_DISTORTION).
- Passages: main.tex 120-122, "This distinction is established in the self-supervised learning literature \cite{sslclustering2025}, and we treat it as background rather than as a finding."; main.tex 568-569, "the established separability-versus-clusterability effect \cite{sslclustering2025}".
- What it asks: the source is one study of image encoders that reports, in passing, that representations with nearly the same linear-evaluation accuracy differ in clustering; it does not state the dominant-axes mechanism and is not a literature. The paper rests its statement of no novelty for this distinction on that citation, so the overstatement bears on the argument.
- Section: 1 Introduction; 4.2.
- Severity: Minor.
- Suggested fix, the wording the report gives: Introduction, "Representations with nearly the same linear-evaluation accuracy can differ in how well they cluster, as reported for self-supervised image encoders \cite{sslclustering2025}." Results, "does not lie along their dominant axes of variation, consistent with the separability-versus-clusterability gap reported for self-supervised image encoders \cite{sslclustering2025}."
- Calls for: new reference no; figure change no; number from saved results no.

#### V10

- Source: citation-report.md, C21 (drift, AMBIGUOUS). The sentence was rewritten in this run under W44.
- Passage: main.tex 269-270, "Single-lead recordings are the established setting for automated AF detection \cite{clifford2017af}."
- What it asks: the source is a single-lead AF classification challenge that 75 teams entered, and it calls single-lead AF detection challenging; it does not say single-lead is the established setting. The sentence is one of the three reasons for the hand-crafted arm's lead set.
- Section: 3.2 Representations.
- Severity: Minor.
- Suggested fix, the wording the report gives: "Automated AF detection from a single lead has been benchmarked at scale, in a challenge that 75 teams entered \cite{clifford2017af}."
- Calls for: new reference no; figure change no; number from saved results no.

#### V11

- Source: citation-report.md, C22 (drift, MINOR_DISTORTION).
- Passage: main.tex 433-434, "we used standard federated $k$-means with FedAvg-style centroid aggregation \cite{fedavg2017}".
- What it asks: the source defines FedAvg as a server average of client models weighted by client data size and does not describe federated $k$-means, so "standard federated $k$-means" rests on a source that does not hold it. With the Discussion's "the federated procedure is standard" cut, this sentence is the one place the paper says the procedure is not new.
- Section: 3.4 Federated robustness.
- Severity: Minor.
- Suggested fix, the wording the report gives: "federated $k$-means in which the server replaces each centroid by a weighted average of the site centroids, in the manner of federated averaging (FedAvg) \cite{fedavg2017}". The weighting is already given at 442-444.
- Calls for: new reference no; figure change no; number from saved results no.

#### V12

- Source: citation-report.md, C23 (drift, MINOR_DISTORTION).
- Passage: main.tex 859, "Other foundation models, including some reported to cluster well \cite{lookingbeyond2026}, are not included".
- What it asks: the source reports one model outside this study, ECG-FM, to separate by clinical label; "some" overstates it.
- Section: 6 Limitations.
- Severity: Minor.
- Suggested fix, the wording the report gives: "including ECG-FM, which that benchmark reports to separate by clinical label rather than by dataset \cite{lookingbeyond2026}". If the contrast "rather than by dataset" is kept, the Limitations then hold two binary contrasts with 866, the limit of W38.
- Calls for: new reference no; figure change no; number from saved results no.

#### V13

- Source: citation-report.md, C34.
- Passage: main.tex 217-218, "PTB-XL encodes rhythm statements at a likelihood of zero meaning ``present''".
- What it asks: a factual statement about the database with no citation; the cited paper holds it ("For form and rhythm statements or in cases where no likelihood information was available, the corresponding likelihood was set to zero.").
- Section: 3.1 Data and cohorts.
- Severity: Minor.
- Suggested fix: add `\cite{ptbxl2020}` to the sentence, with `\rev` marking.
- Calls for: new reference no (the entry is in the .bib); figure change no; number from saved results no.

#### V14

- Source: citation-report.md, C33; the passage was added in this run under W20(h).
- Passage: main.tex 870-873, "The AF class also includes atrial flutter, which can conduct with a regular ventricular rhythm, so the flutter records among the AF positives may not fit the reading that SR and AF differ in rhythm regularity."
- What it asks: a clinical statement with no citation, and no entry of the .bib holds it.
- Section: 6 Limitations.
- Severity: Minor.
- Suggested fix: none for the draft writer; the sentence already hedges its consequence ("may not fit"). A citation would be a new reference, which config.md excludes.
- Needs the user: whether a source for the conduction of atrial flutter is wanted; without one the sentence stands as the authors' statement.
- Calls for: new reference only if the user wants one (excluded by config.md); figure change no; number from saved results no.

#### V15

- Source: citation-report.md, "Claims against the list", C50, read against the text.
- Passage: main.tex 653-655, "Robust scaling leaves heavy arrhythmic tails unbounded, so that a few outliers dominate Euclidean distance and the partition collapses."
- What it asks: the text reports the fall in mean ARI under robust scaling (0.866 to 0.093 for ECGFounder) but no measure of outlier influence or of a collapsed partition (no largest-cluster fraction for that setting), so the mechanism is stated as fact without its evidence. This is the kind of causal clause W22(e) removed for spectral clustering. The sentence explains one of the paper's two cautions.
- Section: 4.4.
- Severity: Minor.
- Suggested fix: hedge it as the likely reason, for example "Robust scaling leaves heavy arrhythmic tails unbounded, so a few outliers may dominate Euclidean distance, a likely reason for the fall." Numbers from saved results are excluded by config.md, so the largest-cluster fraction cannot be added.
- Calls for: new reference no; figure change no; number from saved results no (a measure would need one, excluded).

#### V16

- Source: this reading, from the change to W20(b) (op OP003).
- Passage: main.tex 105, "This study began as a re-examination of an unpublished master's project that did so."
- What it asks: "unpublished" is a fact the text did not state before, and the run holds no record of whether the master's project was published; a master's thesis is often held in a university repository, in which case the word is wrong and the project would be cited.
- Section: 1 Introduction.
- Severity: Minor.
- Suggested fix: none for the draft writer until the fact is given.
- Needs the user: whether the master's project is unpublished; if it was published, its reference (a new reference, excluded by config.md).
- Calls for: new reference only if the project was published (excluded by config.md); figure change no; number from saved results no.

#### V17

- Source: this reading, from the changes to W21(c) and W24(b) (op OP025).
- Passages: 4.1, "Raw flattening reached 0.519 against a majority of 0.504, so a linear probe found little label information in the 1992-dimensional vector." (546-548), "A random forest on the same vector reached 0.714, so some label information remains that a linear probe does not reach." (550-551) and "the raw vector because it holds little label information that a linear probe recovers" (552-553); 4.2, "The raw pipeline carried little label information that a linear probe recovers (ceiling 0.519, barely above the 0.504 majority)" (560-562) and "A random forest on the raw features reached accuracy 0.714, well above its linear ceiling of 0.519" (571-573).
- What it asks: the patch added the random-forest value to 4.1, so the raw arm's linear ceiling against the majority, its random-forest value and the phrase "little label information that a linear probe recovers" now each stand twice within about twenty lines. The prose standard's rule against a repeated construction applies.
- Section: 4.1; 4.2.
- Severity: Minor.
- Suggested fix: keep the raw arm's numbers and their reading once. Since W24(b) places the random forest in 4.1, open the 4.2 sentences on the raw arm by reference to it (for example "The raw pipeline's linear ceiling, 0.519, was consistent with its chance-level clustering, and its random-forest value of 0.714 shows that a non-linear decoder recovers a label that clustering does not.") without restating the phrase.
- Calls for: new reference no; figure change no; number from saved results no.

#### V18

- Source: this reading, from the changes to W22(a) and W40(e) (ops OP003, OP021).
- Passages: Abstract 63-64, "whether clustering succeeds depends less on the algorithm than on how the signal is represented"; Introduction 98-100, "whether clustering of the electrocardiogram (ECG) recovers a clinical label depends on the representation fed to the clustering algorithm and on how the result is evaluated"; 4.1 452-453, "On PTB-XL the representation decided the clustering outcome more than the algorithm did".
- What it asks: the comparison of representation against algorithm now opens the Abstract, the Introduction and 4.1 in one sentence shape, the recurrence that W18, W27 and W31 removed from 84, 397 and 800. The prose standard's rule against a repeated construction applies.
- Section: Abstract; 1 Introduction; 4.1.
- Severity: Minor.
- Suggested fix: open 4.1 with the measured spread, as the Conclusion does, for example "On PTB-XL the best ARI ranged from 0.008 to 0.885 across representations (Table~\ref{tab:main} and Fig.~\ref{fig:heatmap}), a wider range than the four clusterers other than HDBSCAN gave within either representation that clustered well." The Introduction's sentence adds the evaluation and may stay.
- Calls for: new reference no; figure change no; number from saved results no.

#### V19

- Source: this reading, from the change to W2 (op OP042).
- Passages: Discussion 802-803, "retain 0.92 of their centralized ARI under non-IID federation against its 0.69"; Conclusion 896-897, "retaining 0.92 of their centralized ARI against 0.69".
- What it asks: the Discussion's new wording repeats the Conclusion's phrase, the kind of repetition W8 removed between the same two sections.
- Section: 5 Discussion; 7 Conclusion.
- Severity: Minor.
- Suggested fix: give the Discussion's value through its table, for example "and keep a retention of 0.92 against 0.69 under non-IID federation (Table~\ref{tab:fed})".
- Calls for: new reference no; figure change no; number from saved results no.

#### V20

- Source: this reading, from the changes to W40(e) and W2 (ops OP021, OP042).
- Passages: 4.1 452-458, "Within each of the two representations that clustered well, the four clusterers other than HDBSCAN stayed closer together, from 0.709 to 0.885 for ECGFounder and from 0.544 to 0.711 for the hand-crafted features, and HDBSCAN, which labels most records as noise, lay below them at 0.137 and 0.060." (48 words); Discussion 799-803, "If the data are imbalanced or siloed across sites, ... the 16 hand-crafted features are the better choice: they are within reach of ECGFounder on balanced data (0.711 against 0.885), lead it at the 9:1 ratio (0.265 against 0.063) and retain 0.92 of their centralized ARI under non-IID federation against its 0.69, all on the PTB-XL cohort." (73 words, longer than before the patch).
- What it asks: prose standard E, sentence length: under roughly 20 words unless the mechanism needs more. Both sentences were written in this patch and chain separate facts.
- Section: 4.1; 5 Discussion.
- Severity: Minor.
- Suggested fix: in 4.1 give the non-HDBSCAN range and the HDBSCAN values as two sentences. In the Discussion end the conditional sentence at "the better choice" and give the three comparisons in a sentence of their own (this can absorb V19).
- Calls for: new reference no; figure change no; number from saved results no.

#### V21

- Source: this reading, from the changes to W5, W6, W23(c) and W47 (ops OP023, OP024, OP046).
- Passages: "That value is the floor for ten paired seeds described in Section~\ref{sec:methods}" (509-510); "Both are reported with the settings of Section~\ref{sec:methods}, without further tuning." (530-531); "for the lead reason given in Section~\ref{sec:methods}" (862); "Section~\ref{sec:results} shows that feature scaling changes the results by a wide margin" (881).
- What it asks: each new reference points at a whole section where the passage meant is one subsection (3.3 at 510 and 531, 3.2 at 862, 4.4 at 881), so the reader has to search Section 3 or Section 4 for it. The items asked for "Section 3.3" and "Section 3.2". The subsections carry no `\label`.
- Section: 4.1; 6 Limitations.
- Severity: Minor.
- Suggested fix: add labels to the subsections Representations, Clustering and evaluation and Feature scaling, and refer to them at the four places.
- Calls for: new reference no; figure change no; number from saved results no.

#### V22

- Source: this reading, from the paragraph splits of W41 (ops OP015, OP023, OP042).
- Passages: 355-360 ("A supervised ceiling bounds how much of the label a probe recovers ...", 75 words by `wc -w`, markup included); 519-523 ("The ordering does not depend on fixing the cluster count to the number of classes. ...", 67 words); 810-815 ("On PTB-XL the raw and conv-AE pipelines were indistinguishable ...", 73 words).
- What it asks: the manuscript prose standard, section D: a paragraph runs about 120 to 200 words, and one far outside that is split or joined. The splits W41 lays out leave these three at about half the lower bound, the size W40 flagged (54 to 72 words).
- Section: 3.3; 4.1; 5 Discussion.
- Severity: Minor.
- Suggested fix: develop each within its one idea rather than rejoining what W41 split: 519-523 closes with what the sweep shows for the comparison (that the order of the four representations held at every K from 2 to 8); 810-815 closes with what the two pipelines' result means for the decision rule above it; 355-360 can join 362-370, since both state the controls the evaluation applies.
- Calls for: new reference no; figure change no; number from saved results no.

#### V23

- Source: the last check-urls output in checks.md ("Steps 12, after the second citation compliance start").
- Line as printed: `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH`
- What it asks: a status outside 2xx and a title mismatch. citation-report.md, "Checks after the patches", confirms the DOI in Crossref, OpenAlex and Semantic Scholar, explains the ratio by Crossref's short title and the 403 as the publisher refusing the automated request; DOI checking is mark-only.
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: the line stands in the final message as printed; no text change follows.
- Calls for: none.

#### V24

- Source: as V23.
- Line as printed: `clocs2021: no identifier`
- What it asks: the entry has no DOI, eprint or url; citation-report.md finds that the source has no DOI (PMLR registers none) and marks it "DOI not available" (C30). The year and pages are not settled by a record (C17).
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: whether to add the proceedings URL (C30) and to confirm the year and pages (C17).
- Calls for: none.

#### V25

- Source: as V23.
- Line as printed: `threekg2021: no identifier`
- What it asks: as V24; no DOI exists (C30); the pages are not confirmed by a record (C18).
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: whether to add the proceedings URL (C30) and to confirm the pages (C18).
- Calls for: none.

#### V26

- Source: as V23.
- Line as printed: `hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref`
- What it asks: a status outside 2xx (200 at the first check). citation-report.md confirms the DOI in three indexes, fetched medRxiv's copy with HTTP 200, and judges the 403 a refusal of the automated request; the ratio is the title difference of C28. DOI checking is mark-only.
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: the line stands in the final message as printed; the title version to cite is C28.
- Calls for: none.

#### V27

- Source: as V23.
- Line as printed: `vinh2010: no identifier`
- What it asks: as V24; no DOI exists (C30); volume 11 and pages 2837-2854 are not confirmed by a record (C31).
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: whether to add the journal URL (C30) and to confirm volume and pages (C31).
- Calls for: none.

#### V28

- Source: as V23.
- Line as printed: `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH`
- What it asks: as V23. citation-report.md confirms the DOI by the publisher's BibTeX record (all ten authors, full title, volume 101, issue 23) and OpenAlex, and explains the ratio by Crossref's short title; the pages e215-e220 are not confirmed by any record. DOI checking is mark-only.
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: the line stands in the final message as printed.
- Calls for: none.

#### V29

- Source: as V23.
- Line as printed: `sklearn2011: no identifier`
- What it asks: as V24; no DOI exists (JMLR registers none, C30); the reference was matched only by arXiv (C32).
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: whether to add the journal URL (C30).
- Calls for: none.

#### V30

- Source: as V23.
- Line as printed: `fedavg2017: no identifier`
- What it asks: as V24; no DOI exists (C30). The reference itself is not confirmed (C19): only arXiv matched, and venue, year and pages are confirmed by no record. config.md's Decision takes C19 with an override under DOI checking mark-only and lists it in the final message as not confirmed.
- Section: References.
- Severity: Minor.
- Suggested fix: none in the manuscript.
- Needs the user: whether to add the proceedings URL (C30); the reference stays listed as not confirmed (C19).
- Calls for: none.

### Items marked "needs the user"

- W20, its remaining part (V6): the definition of beat-template consistency.
- W23, its remaining part (V7): the clusterer of the 9:1 results. The Conclusion's general statement at 894-895 goes to the draft writer.
- V14: whether a citation for the conduction of atrial flutter is wanted.
- V16: whether the master's project is unpublished, or its reference.
- V23 to V30: the eight failing lines of check-urls, which need no text change.

The cite-keys output of the last section of checks.md printed no line (exit status 0), so it gives no item. Decisions C8 to C16 and C19 of config.md are taken with an override and give no item beyond V30.

## Reading 2

What was read: `manuscript/main.tex` as it stands (930 lines), whole; the apply report of patch 07 (29 ops on 29 of 89 blocks, all applied, no structural flag, base sha256 d4b27a57... equal to `patches/01-main.tex.patched`, output sha256 66c02cb9...); the ops, ids and rationales of `patches/07-main.tex.patch.json`; a word diff of `patches/01-main.tex.patched` against `patches/07-main.tex.patched`; `intended-claims.md` with its claims 26 to 38 of patch 07; `citation-report.md` for C3 to C7, C20 to C25, C33 and C34; the section "Item 8, reference checks after the draft writer's pass on reading 1" of `checks.md`; the comments file through the items above; the prose standard with the manuscript prose standard. `cmp` shows `manuscript/main.tex` byte-identical to `patches/07-main.tex.patched` and `manuscript/refs.bib` byte-identical to `patches/04-refs.bib.patched`, so the `.bib` is unchanged since reading 1. Every line number in this reading is main.tex as it stands. Every `\ref` has its `\label` (grep of both lists; the new labels are `sec:representations` at 243, `sec:clustering` at 300 and `sec:scaling` at 646, and `sec:methods` and `sec:results` are now referred to nowhere). The counts of `{` and `}` in main.tex are equal (398 each). The manuscript was not compiled in this reading; whether it builds is not verified. Word counts are by `sed -n | wc -w` with markup included.

Patch 07 left unchanged the passages of V6, V7, V14, V16 and V23 to V30, which its ops do not name (the apply report's list of items covered holds none of them).

Counts for the 37 items Reading 1 left open (W11, W14, W16, W20, W23, W37, W48, V1 to V30): 23 resolved, 2 partly resolved (W20, W23), 12 not resolved (V6, V7, V14, V16, V23 to V30). One item Reading 1 recorded resolved was undone in part by patch 07 (W26, now partly resolved). New items: V31 to V36. No failure in the check outputs is new: the item-8 check-urls output is identical line for line to the output V23 to V30 were recorded from (`diff` of checks.md 122-143 against 164-185 printed nothing), and its eight failing lines are V23 to V30. After this reading, of W1 to W49: 46 resolved, 3 partly resolved (W20, W23, W26), 0 not resolved.

### W11

Resolved. The fourth name is gone: "Table~\ref{tab:cost} states what each representation costs to compute, since the choice between representations depends on cost as well as on clustering quality." (756-757). "deployab", "cheap", "dependable" and "phenotyp" appear nowhere (grep). "the more predictable of the two" (720, 898) stays tied to the worst-site-draw criterion stated at 718-719.

### W14

Resolved. "This study focuses on four families, which range from representations shaped only by signal energy, raw flattening and the conv-AE, to features built from the defining signatures of the classes" (185-187); "The conv-AE was more separable (0.678) yet still clustered at chance (best ARI 0.008, from Ward agglomerative). Although properly trained as a reconstruction model, it encoded the class without organising it into clusters." (562-565). The remaining uses of "reconstruction" name the class of model (174), the objective (259, 324) or the conv-AE's specification (257), not a second name for the arm.

### W16

Resolved. "On both tasks these two pipelines recovered far less of the class structure than the hand-crafted features on PTB-XL and the beat-morphology features on MIT-BIH." (812-814). Every other mention of the 21-dimensional set calls it the beat-morphology set or features (273-274, 296-297, 660-661, 806-807, Table mitbih).

### W20

Partly resolved. Unchanged since reading 1: the placeholder "and beat-template consistency\rev{, [GAP: one-clause definition of beat-template consistency, from the study's feature extraction]}" stands at 265-267. Left: the one-clause definition of beat-template consistency. Needs the user: how the study computed the feature, which neither main.tex nor the run's materials hold (V6). Every other part stays resolved as reading 1 gives it.

### W23

Partly resolved. Resolved in patch 07: the Conclusion is restricted to the ratio evaluated, "At a 9:1 SR:AF ratio, 16 interpretable hand-crafted features overtake it" (896-897), and the Discussion's evidence is restricted, "They led it at the 9:1 ratio (0.265 against 0.063), the one imbalanced setting evaluated." (801-802). Not resolved: the placeholder "These results used power scaling and [GAP: the clusterer of the 9:1 results, which the manuscript does not name], over the ten seeds." (695-696) stands, so the restriction "The reversal holds for this ratio, scaler and clusterer" (703-704) names a clusterer the text does not give. The condition of the decision rule also stays general, "If the data are imbalanced or siloed across sites, ... the 16 hand-crafted features are the better choice" (798-800); its evidence sentence now restricts it to the one ratio, which tells the reader the scope, and the condition itself could read "If the data are as imbalanced as 9:1 or siloed across sites". Left: the clusterer, and the condition at 798. Needs the user: which clusterer produced the 9:1 results (V7).

### W37

Resolved. The two closing sentences of 4.3 are cut and the reference to the original project's 0.89 is kept in one sentence, "The original project's silhouette of 0.89 arose from the same artefact." (629-630). The three paragraphs now run 76 (624-630), 102 (648-655) and 122 (659-668) words, so their lengths differ. The 4.3 paragraph is now far below the length of the manuscript prose standard (V36).

### W48

Resolved. "Raw flattening with agglomerative clustering attained a silhouette of 0.81 while its largest cluster held all but at most 12 of the 2\,542 records (largest-cluster fraction 1.00 to two decimals) and the ARI was 0.000." (624-627). The bound is right: a fraction that rounds to 1.00 is at least 0.995, and 0.995 of 2\,542 is 2\,529.3, so the largest cluster holds at least 2\,530 records and at most 12 lie outside.

### V1

Resolved. "The most directly related work compares four ECG foundation models with one another and with no hand-crafted baseline \cite{lookingbeyond2026}. It includes a cluster-separability analysis (adjusted Rand index) of embeddings drawn from four 12-lead datasets, PTB-XL among them." (126-129), the wording C3 gives as supported, with `\rev` marking.

### V2

Resolved. The statement attributed to the source is gone. The hand-crafted gap is stated as the source's design (126-127, as C4 gives it), and "Those datasets do not include the MIT-BIH database." (129) rests on the dataset list. "This study adds both: ..." (130-132) still follows and refers to the two gaps.

### V3

Resolved. "reported cluster-separability (ARI) of foundation-model embeddings pooled over four 12-lead datasets, PTB-XL among them. In that analysis some models clustered by clinical label while others clustered by dataset." (199-202), the wording C5 gives.

### V4

Resolved within the Decision on C6. "We used PTB-XL \cite{ptbxl2020}, a public database of 10\,s 12-lead records, in its version 1.0.3 release, which holds 21\,799 records from 18\,869 patients." (212-214): the citation stands for the database and the record length, which the source holds, and the counts are given as the release's. The availability statement reads "\rev{PTB-XL \cite{ptbxl2020}, used in its version 1.0.3 release,}" (906), the wording C25 gives. The counts and the version rest on the authors' record of the release (intended claim 29), which the final message states.

### V5

Resolved. "\rev{Contrastive self-supervised methods ... including CLOCS \cite{clocs2021}, 3KG \cite{threekg2021} and contrastive predictive coding for 12-lead ECG \cite{mehari2022ssl}, learn ECG representations without labels.}" (176-180), the wording C7 gives, with `\rev` marking.

### V6

Not resolved. The placeholder at 265-267 stands unchanged. Left: the definition of beat-template consistency. Needs the user: how the study computed the feature.

### V7

Not resolved. The placeholder at 695-696 stands unchanged. Left: the name of the clusterer of the 9:1 results, and the same name in the restriction at 703-704. Needs the user: which clusterer produced the 9:1 results.

### V8

Resolved. "Under heavy class imbalance, at a 9:1 SR:AF ratio, the hand-crafted features have the highest ARI, ahead of ECGFounder (0.265 against 0.063)." (82-83); "The 16 hand-crafted features have the highest adjusted Rand index (ARI) at a 9:1 SR:AF ratio and retain the largest share of their centralized ARI under non-IID federation." (157-159). Both agree with 4.6 (0.265 against 0.063, 0.061, 0.004 and 0.000, 697-703) and Table fed (retention 0.92 against 0.69 and 0.61).

### V9

Resolved. "Representations with nearly the same linear-evaluation accuracy can differ in how well they cluster, as reported for self-supervised image encoders \cite{sslclustering2025}." (121-122) and "consistent with the separability-versus-clusterability gap reported for self-supervised image encoders \cite{sslclustering2025}" (568-570), the wordings C20 gives. The dominant-axes sentence at 118-120 carries no citation and stands as the paper's own framing.

### V10

Resolved. "Automated AF detection from a single short lead has been benchmarked in a dedicated classification challenge \cite{clifford2017af}." (271-272). The sentence states what the source is; the team count of C21's wording is left out, which leaves the sentence supported.

### V11

Resolved. "we used federated $k$-means, with the centroids aggregated in the manner of federated averaging (FedAvg) \cite{fedavg2017}" (434-435); "standard" is gone and the weighting stands at 443-445.

### V12

Resolved. "Other foundation models, including ECG-FM, which the closest benchmark reports to separate by clinical label \cite{lookingbeyond2026}, are not included" (861-862), without the contrast "rather than by dataset". The Limitations hold one binary contrast, "rather than to label noise" (868), by grep of 852-887.

### V13

Resolved. "PTB-XL encodes rhythm statements at a likelihood of zero meaning ``present'' \rev{\cite{ptbxl2020}}," (219).

### V14

Not resolved. The flutter sentence (872-875) stands without a citation, as reading 1 expected, since a source would be a new reference. Left: a source for the conduction of atrial flutter, or the sentence kept as the authors' statement. Needs the user: whether a source is wanted (New references is No).

### V15

Resolved. "A likely reason is that robust scaling leaves heavy arrhythmic tails unbounded, so that a few outliers may dominate Euclidean distance." (652-654); the unmeasured partition collapse is cut. The new sentence repeats the opening of 550 (V34).

### V16

Not resolved. "This study began as a re-examination of an unpublished master's project that did so." (105) stands unchanged. Left: confirmation that the master's project is unpublished. Needs the user: whether it was published and, if so, its reference (a new reference, which config.md excludes).

### V17

Resolved. The phrase "little label information that a linear probe recovers" stands once, at 549-550 ("a linear probe found little label information"); the closing sentence of 4.1 refers to it in short, "the raw vector for want of linearly accessible label information" (554-555), as one half of its contrast with the conv-AE. 4.2 refers to the raw arm's values in the role the suggested fix gave them: "The raw pipeline's linear ceiling of 0.519 was consistent with its chance-level clustering." (561-562) and "On the raw features the random forest reached 0.714 against a clustering ARI of 0.000, so even a non-linear decoder recovers a label that clustering does not." (572-574).

### V18

Resolved. 4.1 opens with the measured spread, "On PTB-XL the choice of representation moved the best ARI from 0.008 for the conv-AE to 0.885 for ECGFounder (Table~\ref{tab:main} and Fig.~\ref{fig:heatmap})." (453-454), and the comparative shape of the Abstract (63-64) and the Introduction (98-100) is not repeated. The values agree with Table main (best per row 0.013, 0.008, 0.711, 0.195, 0.885). The next sentence's "moved it far less" has a wrong referent (V31).

### V19

Resolved. "Under non-IID federation their retention was 0.92 against 0.69 for ECGFounder (Table~\ref{tab:fed})." (802-803), a shape that differs from the Conclusion's "retaining 0.92 of their centralized ARI against 0.69" (899).

### V20

Resolved. In 4.1 the HDBSCAN values are a sentence of their own, "HDBSCAN, which labels most records as noise, lay below them at 0.137 and 0.060." (457-458). In the Discussion the conditional sentence ends at "the better choice" (800) and its evidence follows in three sentences of 16, 15 and 12 words (800-803).

### V21

Resolved. The four references point at the subsection meant: "the floor for ten paired seeds described in Section~\ref{sec:clustering}" (510), "the settings of Section~\ref{sec:clustering}" (533), "the lead reason given in Section~\ref{sec:representations}" (864) and "Section~\ref{sec:scaling} shows that feature scaling changes the results by a wide margin" (883). Each passage stands in the subsection its label marks: the floor at 424-426 and the clusterer settings at 302-320 in 3.3, the lead reason at 297-298 in 3.2, the scaling results at 648-655 in 4.4. The heading texts are unchanged.

### V22

Resolved. The ceiling-and-seeds paragraph is joined with the sweeps paragraph, 195 words (357-371); its opening sentence misdescribes one of its parts (V33). The K-sweep paragraph closes with what its values show, 92 words (519-525), no longer far below the range; its new sentence is hard to parse (V32). The Discussion paragraph on the raw and conv-AE pipelines closes with what their result means for the decision rule, 112 words (809-817); one of its new sentences brings back content W26 removed (V35).

### V23 to V30

Not resolved, and no text change can resolve them. The item-8 check-urls output prints the same eight lines, each as V23 to V30 record it: `hrvstandards1996: 403 https://doi.org/10.1161/01.CIR.93.5.1043, ratio 0.38 against Crossref, DOI_MISMATCH` (V23), `clocs2021: no identifier` (V24), `threekg2021: no identifier` (V25), `hubertecg2024: 403 https://doi.org/10.1101/2024.11.14.24317328, ratio 0.98 against Crossref` (V26), `vinh2010: no identifier` (V27), `physionet2000: 403 https://doi.org/10.1161/01.CIR.101.23.e215, ratio 0.52 against Crossref, DOI_MISMATCH` (V28), `sklearn2011: no identifier` (V29), `fedavg2017: no identifier` (V30). Left and needs the user, item by item as reading 1 gives it: the four lines V23, V26 and V28 stand in the final message as printed (DOI checking is mark-only, and the citation report confirms each DOI in other records); for V24, V25, V27, V29 and V30, whether to add the proceedings or journal URL, with the year and pages of clocs2021 (C17), the pages of threekg2021 (C18) and the volume and pages of vinh2010 (C31) still unconfirmed, and fedavg2017 still listed as not confirmed (C19).

### The blocks patch 07 changed, read again for the items reading 1 recorded resolved

Each of the 29 ops was read against the items whose passages its block holds:

- OP001 (Abstract, 61-86): W1, W10, W11, W12, W18, W20(d), W21(a) and W34 still hold; "overtake ECGFounder" became "ahead of ECGFounder (0.265 against 0.063)", which keeps the name W12 asks for.
- OP002 (Introduction, 117-132, 167 words): W22(c) and W40(a) still hold.
- OP003 (contributions, 142-163): W2, W10(c), W14(b), W15(a), W20(c), W20(d), W20(e), W34(b) and W39(a) still hold.
- OP004 (Related work, 170-188): W20(f) and W22(d) still hold.
- OP005 (Closest benchmark, 199-206): W49(a) still holds.
- OP006 (PTB-XL, 212-229): W20(g), W35, W45(a), W46(a) and W49(b) still hold.
- OP007, OP009, OP021 (headings of 3.2, 3.3 and 4.4): heading texts unchanged; W27(c) still holds.
- OP008 (hand-crafted entry, 261-276): W21(b), W30, W44 (three sentences) and W45(d) still hold.
- OP010 and OP011 (3.3, 357-371): W10(f) and the past tense of W41(b) still hold. The join merges two of the five paragraphs W41 laid out, as V22's suggested fix proposed; the joined paragraph covers the controls of the evaluation in 195 words, so W41 is not undone. Its opening sentence is V33.
- OP012 (3.4, 434-447): W3(b), W10, W46(c) and W49(c) still hold.
- OP013 (4.1, 453-461): W40(e), W40(f) and W49(d) still hold.
- OP014, OP016 (4.1): W6, W17(c), W41(c), W41(d) and W47 still hold.
- OP015 (K sweep, 519-525): W41(c) still holds.
- OP017 (4.1, 546-556): W21(c), W24(b) and W13 still hold.
- OP018 (4.2, 560-570): W21(c), W21(d) and W32(b) still hold.
- OP019 (4.2, 572-580): W25(a) still holds.
- OP020 (4.3, 624-630): W26's content stands at 111-113 and 629-630, W27(b) and W49(e) still hold.
- OP022 (4.4, 648-655): W10(g), W10(h), W22(f) and W28 still hold.
- OP023 (4.7, 756-763): W7 (the factor of fifteen stands only here) and W49(g) still hold.
- OP024 (Discussion, 795-807): W2, W5(b), W7, W8, W21(b) and W41(e) still hold.
- OP025 (Discussion, 809-817): W14(c), W21(g) and W41(e) still hold. W26 is undone in part, below.
- OP026 (Limitations, 854-864): W4(d), W5(c), W20(j), W21(i), W38, W41(f), W46(e) and W46(f) still hold.
- OP027 (Limitations, 877-887): W23(c) and W38 still hold.
- OP028 (Conclusion, 891-903): W8, W11(d), W18(e) and W31 still hold.
- OP029 (availability statement, 906): no W item concerns it.

#### W26, undone in part by OP025

Now partly resolved. The Discussion paragraph "The result also reframes the original master's project honestly." stays deleted, and "reframes" and "honest" appear nowhere (grep). Its main claim, "Its conclusion that the bottleneck is the representation rather than the clustering algorithm is correct, and we have quantified it." (HEAD, Discussion), is back in the Discussion: "The raw arm reproduces the input of the original project's design. Its PTB-XL result therefore gives that project's conclusion, that the difficulty lies in processing the raw signal, in chance-corrected terms." (814-816). The item asked for the deletion because that content stands already in the Introduction, "The project's conclusion, that the difficulty lies in processing the raw signal rather than in the clustering step, is correct, and this study makes it precise." (114-115). Left: cut the two sentences at 814-816 and keep the decision-rule close (V35).

### New items

#### V31

- Source: this reading, from the change to V18 and V20 (op OP013).
- Passage: 4.1 453-457, "On PTB-XL the choice of representation moved the best ARI from 0.008 for the conv-AE to 0.885 for ECGFounder (...). Within each of the two representations that clustered well, the four clusterers other than HDBSCAN moved it far less, from 0.709 to 0.885 for ECGFounder and from 0.544 to 0.711 for the hand-crafted features."
- What it asks: "it" takes "the best ARI" as its antecedent, but a representation has one best ARI; the values 0.709 to 0.885 and 0.544 to 0.711 are the ARI of each clusterer within a representation. The sentence names a quantity its numbers do not measure, the kind of slip W19 corrected. Rule: references/rules.md, Precision, Most specific term. Intended claim 36 carries the same wording.
- Section: 4.1.
- Severity: Minor.
- Suggested fix: "Within each of the two representations that clustered well, the ARI of the four clusterers other than HDBSCAN spanned far less, from 0.709 to 0.885 for ECGFounder and from 0.544 to 0.711 for the hand-crafted features."
- Calls for: new reference no; figure change no; number from saved results no.

#### V32

- Source: this reading, from the change to V22 (op OP015).
- Passage: 4.1 523-525, "Because the lowest hand-crafted value, 0.329, stayed above the highest HuBERT-ECG value, 0.132, ECGFounder, the hand-crafted features and HuBERT-ECG kept that order at every $K$."
- What it asks: the subordinate clause ends on a number in commas and the main subject follows after one more comma, so "0.132, ECGFounder, the hand-crafted features and HuBERT-ECG" reads first as one list; the reader has to go back to find where the clause ends. "that order" also has no order named before it in the sentence. Rule: prose standard E, Sentence length (25 words with two appositives and a list of three). The inference itself holds: the hand-crafted minimum of 0.329 exceeds the HuBERT-ECG maximum of 0.132, and ECGFounder "led at every $K$" (520).
- Section: 4.1.
- Severity: Minor.
- Suggested fix: two sentences, "The lowest hand-crafted value, 0.329, stayed above the highest HuBERT-ECG value, 0.132. ECGFounder, the hand-crafted features and HuBERT-ECG therefore kept the same order at every $K$."
- Calls for: new reference no; figure change no; number from saved results no.

#### V33

- Source: this reading, from the change to V22 (ops OP010, OP011).
- Passage: 3.3 357-371, opened by "Each result was read against controls on the representation and on the clustering set-up." and closed by "Because the natural SR-to-AF prevalence is imbalanced, we additionally evaluated on a 9:1 SR:AF subsample." (370-371).
- What it asks: the opening sentence calls every part of the paragraph a control on the representation or on the clustering set-up. The supervised ceiling, the seeds, the scaler sweep and the K sweep are; the 9:1 subsample is neither, and the paper names it one of the two deployment stressors (155-156, 691-694, 833-834). The sentence is a claim of the text not on the list of intended claims. Rule: references/rules.md, Objectivity, Claims rest on evidence, read against the paper's own description of the subsample.
- Section: 3.3 Clustering and evaluation.
- Severity: Minor.
- Suggested fix: "Each result was read against controls on the representation and on the clustering set-up, and under one deployment stressor, class imbalance." Or move the 9:1 sentence to 3.4, which describes the other stressor.
- Calls for: new reference no; figure change no; number from saved results no.

#### V34

- Source: this reading, from the change to V15 (op OP022).
- Passages: 4.4 652-654, "A likely reason is that robust scaling leaves heavy arrhythmic tails unbounded, so that a few outliers may dominate Euclidean distance."; 4.1 550-552, "A likely reason is that its coordinates are amplitudes at fixed sample offsets, and no fixed offset falls on the same part of the cardiac cycle in two records."
- What it asks: the two Results subsections now give an explanation in the same sentence opening, "A likely reason is that" (grep: two occurrences, none before this run). Rule: prose standard 0, No repeated construction. The 4.4 sentence also hedges its one claim twice, with "A likely reason" and "may"; one hedge states the uncertainty.
- Section: 4.4; 4.1.
- Severity: Minor.
- Suggested fix: at 652-654, "Robust scaling leaves heavy arrhythmic tails unbounded, so a few outliers may dominate Euclidean distance, which would explain the fall."
- Calls for: new reference no; figure change no; number from saved results no.

#### V35

- Source: this reading, from the change to W16 and V22 (op OP025); it undoes W26 in part.
- Passage: Discussion 814-817, "The raw arm reproduces the input of the original project's design. Its PTB-XL result therefore gives that project's conclusion, that the difficulty lies in processing the raw signal, in chance-corrected terms. The decision rule above therefore chooses only between ECGFounder and the hand-crafted features."
- What it asks: the second sentence restates the Introduction's "The project's conclusion, that the difficulty lies in processing the raw signal rather than in the clustering step, is correct, and this study makes it precise." (114-115), the content whose repetition in the Discussion W26 removed. The third sentence's "therefore" follows from the pipelines' result at 812-814, not from the sentence before it about the project's conclusion. Rules: prose standard 0, No repeated construction (as W26 applies it); references/rules.md, Transitions, Transition that states the relation.
- Section: 5 Discussion.
- Severity: Minor.
- Suggested fix: cut "The raw arm reproduces ... in chance-corrected terms." and close the paragraph with "The decision rule above therefore chooses only between ECGFounder and the hand-crafted features." directly after 812-814. The paragraph then runs about 90 words and can keep the clause "including the raw arm that reproduces the input of the original project's design" in the sentence at 812-814, as patch 01 had it.
- Calls for: new reference no; figure change no; number from saved results no.

#### V36

- Source: this reading, from the change to W37 and W48 (op OP020).
- Passage: 4.3 624-630, the whole subsection paragraph, now 76 words.
- What it asks: the manuscript prose standard, section D: a paragraph runs about 120 to 200 words, and one far outside that is split or joined. With its two closing sentences cut, the only paragraph of 4.3 is in the band V22 recorded as far below (67 to 75 words). W37's variation and this length pull against each other, and the cut was the fix reading 1 suggested. The subsection has no neighbouring paragraph to join.
- Section: 4.3 Internal validity indices.
- Severity: Minor.
- Suggested fix: develop the paragraph with what it does not yet say, without the Related work point at 194-197: that the largest-cluster fraction the paper reports beside each ARI (Table metrics, 390) is the check that exposes the degenerate solution here, and that Fig. trap shows the high-silhouette, zero-ARI points across the cells it plots (635-642).
- Calls for: new reference no; figure change no; number from saved results no.

### Items left after reading 2, for the final message as acknowledged limitations

- W20 and V6: the definition of beat-template consistency; placeholder at 265-267. Needs the user: how the study computed the feature.
- W23 and V7: the clusterer of the 9:1 results; placeholder at 695-696, and the restriction at 703-704 names it. Needs the user: which clusterer produced the 9:1 results. Also left in W23: the condition "If the data are imbalanced" of the decision rule (798) reads general, with its evidence restricted to the one ratio at 801-802.
- W26 and V35: the Discussion restates the original project's conclusion at 814-816, which the Introduction gives at 114-115; the two sentences are to be cut.
- V14: the flutter sentence (872-875) has no citation. Needs the user: whether a source is wanted, which would be a new reference.
- V16: "an unpublished master's project" (105). Needs the user: whether the project was published and, if so, its reference.
- V23 to V30: the eight failing lines of check-urls, quoted above, which need no text change. Needs the user for V24, V25, V27, V29 and V30: whether to add the URLs, and the unconfirmed fields C17, C18, C31 and C19.
- V31 to V34 and V36: the prose and precision items above, each with its suggested fix; no writer pass follows reading 2.

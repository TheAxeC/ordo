Manuscript marker 1: agent a8f3e0b981dc00ca4, served claude-opus-5-5 as ordo-high, 285965 tokens, 43 tool uses, 21.0 min. The marks below are the agent's final message, verbatim apart from character names.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/8-run/manuscript-report.md

I read the report, the prose standard, SKILL.md, rules.md, registers.md and all 33 draft files in full with the file-reading tool. I ran grep only to confirm line numbers, naming each file:
- AUPRC and AUROC first appear at sections/4_experiments/c_evaluation.tex:1.
- "projection head" is never defined. It appears only at tables/hyperparams.tex:28 and in 3_hyperparams.tex:3.
- The title at main.tex:45 already uses "CNN" and "MRI".
- Report search: `grep -n -i "still" manuscript-report.md` finds no line saying a finding still breaks a rule.

Register (condition 3): the report applies Medicine and Health. That matches the draft: the journal is Intelligent Medicine (main.tex:38), and the study is a clinical prediction study on a hospital cohort. Condition 3 holds for groups 4 and 7 and for every Voice ground below.

Tally from the marks below: 228 rows, 181 right, 47 wrong.

=== 1. Hedging ===
- **1.1 abstract.tex:3, "Our results show that HCCNet substantially..."**: wrong (condition 4).
  - Stands at its place. The unhedged claim from one cohort and "substantially" are real breaks.
  - The "suggest" and "could" devices fit, and 48.9%/106.6% (d_results:15) and 12.1%/56.0% (d_results:21) stand in the draft.
  - It brings AUPRC and "expected calibration error" into the abstract. The draft defines them only at c_evaluation.tex:1 and :6, and the replacement gives no definition or bracket (Terms defined at first use).
  - "improves ... reliability" is checked only against ECE. In Table tab:reliability_results, MCE rises for 11 of 15 models (e.g. T1 DCE-MRI HCCNet-N 0.612 to 0.834), and the Brier score rises for HCCNet-F on T1 IOP & T2 (0.170 to 0.174). The bracket names only the ECE case.
- **1.2 abstract.tex:3, "We demonstrate the effectiveness..."**: wrong (4).
  - Stands. "demonstrate" is too strong for one cohort, and "indicates" is the right strength.
  - The rewrite drops "we" from the authors' finding. registers.md "Voice" (Medicine and Health) has findings take "we", and that new break is left unnamed.
  - It also makes the act of applying, not the results, the evidence.
- **1.3 abstract.tex:5, "The methodological approach presented..."**: right. Stands. It generalizes beyond the HCC test with no hedge. "may be versatile and adaptable" is a weak device fitting no evidence beyond HCC. It keeps the claim and matches 1.7 and 1.8 on the same claim.
- **1.4 abstract.tex:5, "Its ability to handle varying..."**: right. Stands. "establishes" is a strong device for an untested generalization, and "invaluable" is grandiose self-assessment (section 0). "may serve as a framework" ends both and keeps the prognosis clause.
- **1.5 introduction.tex:13, "By fine-tuning the pre-trained model..."**: right. Stands. "we demonstrate" rests on one cohort. "obtain results that indicate" is moderate, keeps "we", the claim and the citation.
- **1.6 introduction.tex:13, "This application not only demonstrates..."**: right. Stands. "indicates" ends the strong device. "considerably" is cut, with a bracket for the measured effect (a specific-claim bracket). Same text as in 13.2.
- **1.7 introduction.tex:13, "Thus, HCCNet provides a flexible..."**: right. Stands. An untested generalization to other tasks. "may provide" is weak and the claim is kept. Same text as in 13.3.
- **1.8 conclusion.tex:1, "The methodology is versatile..."**: right. Stands. The same untested generalization. Weak "may" twice, consistent with 1.3. Same text as in 13.21.
- **1.9 discussion.tex:10, "Inspection of the models' reliability diagrams..."**: wrong (4). Stands, and "suggested" ends the strong device. The replacement keeps the unqualified relation "aligned the models closer to the target distribution". That relation fails for HCCNet-F on T1 IOP & T2-MRI (ECE 0.182 to 0.204), and MCE rises for 11 of 15 models. No limit is bracketed in this sentence.
- **1.10 discussion.tex:10, "Thus, even for imaging modalities..."**: wrong (4).
  - Stands. "suggests" and the ECE bracket (0.182 to 0.204) are correct.
  - "on average more reliable" for the two modality groups with moderate gains fails on MCE. My averages from Table tab:reliability_results: T1 DCE-MRI about 0.616 to 0.737, T1 IOP & T2-MRI about 0.730 to 0.744. The bracket names neither.
  - It also keeps "moderate improvements", a size word (section A), where d_results.tex:15 gives 48.9% and 52.3%. This is unnamed.
- **1.11 discussion.tex:12, "Our augmentation strategy exposes..."**: right.
  - Stands. The explanation of DWI's gains is unhedged and unsupported. The draft measures no variation per modality, so the Evidence line holds.
  - "may be richest" plus an evidence bracket ends both. The bracket's counterpoint (T1 DCE-MRI has four series) stands in the table notes.
  - The hedge is the one the Hedging finding asks for, so the Evidence rule's no-added-hedge clause is met.
- **1.12 discussion.tex:12, "We attribute this to..."**: wrong (4).
  - Stands. "may reflect" and naming the noun end the Hedging and antecedent breaks.
  - The noun phrase it brings in, "These at most marginal improvements", puts a section A size word into the passage, where Table tab:results_fusion gives the numbers.
  - The sentence keeps two ideas that each stand alone (the cause, and the future-work view). That is a rules.md "Formality" break, unnamed.
- **1.13 discussion.tex:16, "Additionally, while HCCNet demonstrates..."**: right. Stands. A strong device on one cohort. "the results suggest" is moderate and the claim is kept.

=== 2. Limitations and alternative interpretations ===
- **2.1 d_results.tex:21, "More interestingly, the comparison..."**: wrong (4).
  - Stands. The ECE claim reads as covering every model. The added limit (0.182 to 0.204) and "average" hold: the ECE averages fall in all three groups. The past tense is named and ends the tense break.
  - The replacement keeps "More interestingly", a performative aside (prose standard section 0, a variant of "worth noting"). It is not named.

=== 3. Evidence for claims ===
- **3.1 a_longitudinal_analysis.tex:1, "To date, deep learning applications..."**: wrong (4). Stands, with no source anywhere in the draft, so the bracket is due. It keeps "predominately", a vague qualifier of the "mostly" kind (SKILL, "A finding"), unnamed.
- **3.2 a_longitudinal_analysis.tex:1, "However,  physicians usually assess..."**: right. Stands, double space included. No source. "usually" becomes a share bracket with citation, so the claim does not read as universal.
- **3.3 a_longitudinal_analysis.tex:1, "As a result, longitudinal imaging has long..."**: wrong (2). Stands. The Evidence break and section A "many" hold, and the brackets end them. The Also line "Vague language ('recent')" fails: that row's phrase is "in recent years", and "recent studies" is not a phrase of its left column.
- **3.4 discussion.tex:6, "Despite being long established..."**: right. Stands. No source in the draft, and "many" is vague. The brackets end both, consistent with 3.3.
- **3.5 a_longitudinal_analysis.tex:5, "To mitigate this shortcoming, our study uses..."**: wrong (4). Stands. The bracket ends the missing source. The kept "our study uses a hybrid model architecture" gives an authors' decision to the study. That is the Voice break the report fixes in 7.1 and 7.2, left unnamed.
- **3.6 b_pretraining.tex:3, "Among them, contrastive learning approaches..."**: right. Stands. No source or count. The bracket ends it.
- **3.7 b_pretraining.tex:1, "As a result, many deep learning studies..."**: wrong (2). Stands. The draft gives a source for this claim: introduction.tex:5 says approaches extract 2D slices and use CNNs pre-trained on natural images, citing kumar2024improving. Evidence anywhere counts, so the named rule is not broken.
- **3.8 introduction.tex:7, "Likewise, most deep learning applications..."**: right. Stands. No source, and "most" is vague. A share-plus-citation bracket ends both.
- **3.9 d_pretraining.tex:1, "When training neural networks, task agnostic..."**: wrong (4). Stands, and the citation bracket ends the missing source. It keeps "repeatedly", a frequency word of the "often/frequently" kind, unnamed.
- **3.10 c_variants.tex:10, "Deviating from the head dimension of 128..."**: right. Stands. "which we found to have no adverse effect" has no evidence in the draft. The evidence bracket ends it.

=== 4. registers.md, "What the reader looks for" ===
- **4.1 a_data.tex:1, "We evaluate HCCNet on data that is retrospectively..."**: right. Stands. The methods name no reporting guideline, which the Medicine and Health register requires. The bracketed sentence ends it, and the named past tense ends the tense break.

=== 5. Prose standard, section A, vague qualifiers ===
- **5.1 abstract.tex:1, "Longitudinal MRI analysis is important..."**: wrong (2, 4). Stands, and the "considerably" bracket is fine. The Also line calls abstract.tex:1 MRI's first use. MRI first appears in the title, main.tex:45, so defining it at abstract.tex:1 leaves an earlier undefined use.
- **5.2 introduction.tex:1, "This is especially relevant..."**: wrong (4). Stands, and the "considerably" bracket is fine. The Clear antecedents replacement is an instruction ("begin the sentence with ..."), and the written replacement still opens "This is especially relevant", so that named break is not ended.
- **5.3 introduction.tex:1, "However, despite its potential..."**: right. Stands. "significant" becomes a specific-obstacle bracket with citation, a form the SKILL allows.
- **5.4 introduction.tex:5, "Traditional approaches often simplify..."**: wrong (4). Stands, and the share bracket fits "often". The replacement drops "Traditional", the word that sets which approaches the claim covers.
- **5.5 introduction.tex:5, "However, this method has limitations..."**: wrong (4). Stands, and the "considerably" bracket is fine. "often small" becomes "small [the dataset sizes...]", which cuts the qualifier so medical datasets read as small in every case. The bracket asks for sizes, not for the share of datasets.
- **5.6 introduction.tex:7, "However, many existing approaches..."**: wrong (2). Stands, and the bracket fits section A. The Also line "Vague language ('many studies')" does not apply: the phrase is "many existing approaches", which is not that row.
- **5.7 a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end..."**: right. Stands. "typically" becomes a share-with-citations bracket. Same text as in 13.5.
- **5.8 a_longitudinal_analysis.tex:7, "Likewise, many of them disregard..."**: right. Stands. "many" becomes a number-with-citations bracket.
- **5.9 b_pretraining.tex:1, "Using the potential abundance of unlabeled data..."**: wrong (2). Stands, and the bracket ends "some". The Also line "Vague language ('some researchers')" does not apply: the phrase is "some ... studies", which is not that row.
- **5.10 a_problem_formulation.tex:1, "Since the frequency of liver screenings..."**: right. Stands. "typically" becomes a share-of-patients bracket.
- **5.11 b_architecture.tex:5, "Additionally, we reimplement the patchify layer..."**: wrong (4). Stands. The tense change and the patchify-layer definition bracket are fine. "typically encountered in volumetric data" becomes "the lower input size of volumetric data [the input sizes...]", which reads as true of all volumetric data. The bracket asks for sizes, not a share.
- **5.12 b_implementation.tex:9, "Owing to the limited number of positive cases..."**: wrong (4). Stands. The range replaces "only negligibly", 0.329 and 0.628 stand in Table tab:finetuned_results, and the tense is named. It brings AUPRC and AUROC into b_implementation.tex:9, before c_evaluation.tex:1 defines them, with no definition or bracket.
- **5.13 d_results.tex:11, "This corresponds with the results..."**: right. Stands. The range replaces "only negligibly", the numbers stand, "This" gets its noun, and the tense is past. Compatible with 5.12 and 5.14.
- **5.14 d_results.tex:11, "At least on the data evaluated..."**: right. Stands. "not considerably" becomes a bracket for the measured range (MAE is defined at c_evaluation:1), in the past tense.
- **5.15 d_results.tex:15, "That is, although baseline model results vary only gradually..."**: right. Stands. "only gradually" becomes a range bracket. "still substantial" is cut, since the numbers follow in the same parentheses. "image modalities" becomes "imaging modalities" (named), and the past tense ends the tense break.
- **5.16 discussion.tex:8, "Overall, fine-tuned model results varied substantially..."**: right. Stands. "substantially" becomes 0.614, 0.520 and 0.429, which stand in d_results.tex:5. The names were defined at d_pretraining:8.
- **5.17 discussion.tex:8, "Our proposed pre-training approach improved..."**: right. Stands. "substantial" becomes 48.9% and 52.3%, which stand in d_results.tex:15.
- **5.18 c_evaluation.tex:8, "Since all metrics are obtained..."**: wrong (4). Stands. The brackets for "the majority" and "slightly", the cut of "we note that" and the tense change are fine. "consecutive folds" becomes "any two folds" outside any bracket, a claim the draft does not make.
- **5.19 1_baseline.tex:3, "Overall differences between imaging modalities are however far..."**: wrong (4). Stands. The cut of "generally" holds (every baseline AUROC is 0.592 to 0.724), SSL is defined, and the tense is past. It keeps "far less pronounced", a size word, unnamed, although the tables give the numbers.
- **5.20 2_reliability.tex:3, "As for the comparison across performance metrics..."**: wrong (4). Stands. The bracket's second alternative, "or the ECE range across modalities against the range across model variants", leaves "driven by imaging modality rather than model complexity" universal once supplied, which the SKILL forbids.
- **5.21 3_hyperparams.tex:3, "Consequently, we drastically reduced..."**: right. Stands. "drastically" becomes a from-to with a bracket for Caron's value.

=== 6. Terms defined at first use ===
- **6.1 abstract.tex:1, "To address this, we propose HCCNet..."**: wrong (2, 4). Stands, and the "this" fix is fine. CNN first appears in the title, main.tex:45, so abstract.tex:1 is not the first use the finding must name, and defining CNN there leaves the earlier use undefined.
- **6.2 introduction.tex:11, "The CNN backbone is pre-trained using an extended version of the DINO..."**: right. Stands. This is DINO's first use, and DINO is never defined. A definition bracket with citation ends it.
- **6.3 b_architecture.tex:14, "The Transformer encoder is based on the Pre-LN..."**: right. Stands. Pre-LN is never defined. The bracket ends it.
- **6.4 b_implementation.tex:3, "While MRI scans are assumed to be i.i.d...."**: right. Stands. This is the only, undefined use of i.i.d. The expansion ends it, and the past tense is named.

=== 7. registers.md, "Voice" ===
- **7.1 a_problem_formulation.tex:1, "This study aims to define..."**: wrong (4). Stands, and "We" ends the Voice break. "aims" becomes "aimed", a Methodology tense change. The finding does not name it in a line of its own (7.2 to 7.4 do), and it is not in the tense list.
- **7.2 d_pretraining.tex:3, "For the CNN backbone, this study extends..."**: right. Stands. "we extended" ends Voice and the named tense break.
- **7.3 d_pretraining.tex:8, "Besides that, our implementation also proposes..."**: right. Stands. "we also proposed" ends Voice, the personified artifact and the tense break, all named.
- **7.4 d_pretraining.tex:10, "To improve the encoder's understanding..., this study employs a simple..."**: right. Stands. "we employed" with "simple" cut ends Voice, the filler and the tense break, all named.
- **7.5 discussion.tex:6, "Therefore, this study developed HCCNet..."**: right. Stands. "we developed" ends the Voice break.
- **7.6 discussion.tex:6, "To support HCCNet's capability..., a step-wise model training approach was adopted."**: right. Stands. The passive hides the authors' decision, and "we adopted" ends it.

=== 8. Clear antecedents ===
- **8.1 d_pretraining.tex:8, "This teaches the model..."**: right. Stands. "This" points to a three-part sampling sentence. "This augmentation strategy" names it.
- **8.2 d_pretraining.tex:15, "This transfers the pre-trained representation..."**: right. Stands. "This stem expansion" names the stem expansion of the sentence before. "stem" is used in that sentence.
- **8.3 3_hyperparams.tex:3, "This is due to convergence issues..."**: right. Stands. "This deviation" names the antecedent and is compatible with 10.4.
- **8.4 2_reliability.tex:3, "That is despite that baseline models..."**: right. Stands. "That ranking held even though" names the noun, and the past tense is named. Same text as in 13.23.

=== 9. Tense per section, tense list ===
For each "right" below: the quoted phrase stands at the line given, and its verb is in the present where the section's row (Methodology or Results) is past. Where marked "(lit)", the entry is from section 2 and reports a cited study's finding, a row that is also past. The past-tense replacement ends the break and changes nothing else in the phrase.

Two general notes:
- The first two entries are from section 2 (literature review) but are filed under the "Methodology" heading.
- Entries also quoted by a split finding carry the same text there.

Methodology heading:
1. a_longitudinal_analysis.tex:3 "it has been shown to not fully explore": right (lit). Reports dammu2023's finding, and "was shown" ends it. Also given by 11.1 and 13.4.
2. a_longitudinal_analysis.tex:5 "they have been successfully employed": right (lit). Reports the cited applications, and "were" ends it.
3. b_architecture.tex:3 "We use the CNN backbone": right. Use of the backbone in this study.
4. b_architecture.tex:5 "we adapt the ConvNeXt architecture": right. The authors' adaptation step.
5. b_architecture.tex:5 "we replace the 2-dimensional depthwise...": right. A layer replacement done.
6. b_architecture.tex:5 "and reduce the proposed kernel size": right. A kernel change done.
7. b_architecture.tex:14 "we concatenate ... and prepend": right. Sequence construction; both verbs fixed.
8. b_architecture.tex:21 "we embed the input's positional information": right. An encoding step.
9. b_architecture.tex:21 "we replace the conventional sequence position": right. A design step.
10. b_architecture.tex:21 "we compute the vector of intervals": right. A computation step.
11. b_architecture.tex:26 "prepend": right. Same subject "we", a cls-interval step.
12. b_architecture.tex:26 "and, finally, obtain positional encodings": right. Last encoding step.
13. b_architecture.tex:34 "we add the positional encodings": right. Input assembly.
14. b_architecture.tex:39 "We feed the input sequence ... and select": right. Both verbs fixed.
15. b_architecture.tex:44 "we feed it through a pooling layer": right. Head step.
16. c_variants.tex:1 "we introduce four variants of HCCNet": right. Variants built.
17. c_variants.tex:10 "we additionally introduce HCCNet-C (compact)": right. Custom variant built.
18. d_pretraining.tex:1 "we therefore design two (self-)supervised...": right. Task design.
19. d_pretraining.tex:3 "we define a student $F_s$": right. Network setup.
20. d_pretraining.tex:3 "we learn to match": right. Training objective applied.
21. d_pretraining.tex:8 "we exploit the abundance of natural variation": right. Augmentation choice.
22. d_pretraining.tex:8 "we treat different series": right. Also in 13.9.
23. d_pretraining.tex:8 "we randomly sample one series": right. DW sampling; also in 13.9.
24. d_pretraining.tex:8 "we sample among the pre- and post-contrast phases": right. DCE sampling.
25. d_pretraining.tex:8 "we sample within a single contrast family": right. IOP/T2 sampling.
26. d_pretraining.tex:10 "we randomly shuffle 50% of the input sequences": right. SOP setup.
27. d_pretraining.tex:10 "we actually randomly shuffle 66% of sequences": right. Footnote count of the same step.
28. d_pretraining.tex:10 "and task the model": right. SOP objective.
29. d_pretraining.tex:10 "we keep the parameters ... fixed and initialize them": right. Both verbs fixed.
30. d_pretraining.tex:10 "We apply the sigmoid function": right. Also in 13.10.
31. d_pretraining.tex:10 "and learn to identify shuffled sequences": right. Also in 13.10.
32. d_pretraining.tex:15 "we concatenate the different series": right. Input construction.
33. d_pretraining.tex:15 "we reconcile the differing input dimensionality": right. Also in 13.11.
34. d_pretraining.tex:15 "the learned stem filters are replicated": right. Passive procedure; also in 13.11.
35. e_finetuning.tex:1 "we initialize the parameters of HCCNet": right. Fine-tuning setup.
36. e_finetuning.tex:1 "we append ... and fine-tune the model": right. Both verbs fixed.
37. a_data.tex:1 "All examinations included in the study comprise": right. Cohort property reported in methods; also in 13.12.
38. a_data.tex:1 "modality groups are available for every patient": right. Same; also in 13.12.
39. a_data.tex:3 "we include all available data": right. Pre-training data choice.
40. a_data.tex:3 "we additionally exclude all patients": right. Exclusion step; also in 13.13.
41. a_data.tex:3 "of which 37 develop HCC": right. Cohort outcome; also in 13.13.
42. a_data.tex:3 "we evaluate HCCNet using stratified 5-fold cross-validation": right. Also in 11.4 and 13.13.
43. a_data.tex:3 "We partition the patient cohort": right. Fold construction.
44. a_data.tex:3 "The folds are stratified by HCC outcome": right. Passive procedure.
45. a_data.tex:3 "Each fold serves as the held-out test set": right. Also in 13.14.
46. a_data.tex:3 "the remaining four folds form ... that is used": right. Both verbs fixed; also in 13.14.
47. a_data.tex:3 "is repeated independently for each fold": right. Also in 13.14.
48. a_data.tex:3 "we only fine-tune ... that are also included": right. Also in 13.15.
49. b_implementation.tex:1 "we pre-train both the CNN backbone": right. Training step.
50. b_implementation.tex:1 "We train the CNN over 32000 training steps": right. Schedule.
51. b_implementation.tex:1 "we linearly increase the learning rate": right. Warm-up.
52. b_implementation.tex:1 "we decay the learning rate": right. Also in 13.16.
53. b_implementation.tex:1 "We employ the same cosine decay": right. Also in 13.16.
54. b_implementation.tex:1 "but only apply it to the weights": right. Also in 13.16.
55. b_implementation.tex:1 "we also limit the temperature": right. DINO setting.
56. b_implementation.tex:3 "'pre-training of the Transformer encoder considers' is given in finding 6.4.": wrong. The entry has no passage-and-replacement pair, only a reference to another finding. The place is already given by 6.4 and should have been left out.
57. b_implementation.tex:3 "we train the Transformer encoder ... of just 8000 training steps": wrong (2). The tense change is fine, but the Also break fails. "just 8000 training steps" says only 8000 steps, matching "abbreviated", which is a minimality claim section A keeps. The replacement cuts a word the standard keeps.
58. b_implementation.tex:3 "We set ..., apply dropout ..., and employ": right. Settings applied; "set" was already past.
59. b_implementation.tex:5 "we update HCCNet": right. Fine-tuning step.
60. b_implementation.tex:5 "We fine-tune the model over 400 training steps": right. Schedule.
61. b_implementation.tex:5 "but decrease the weight decay": right. Setting.
62. b_implementation.tex:5 "we select the batch size": right. Tuning step.
63. b_implementation.tex:5 "we then train HCCNet": right. Per-fold training.
64. b_implementation.tex:7 "we establish a baseline": right. Baseline built.
65. b_implementation.tex:7 "we equally train the baseline": right. Baseline training.
66. b_implementation.tex:7 "We employ the same optimizer": right. Settings.
67. b_implementation.tex:7 "but slightly increase the learning rate warm-up": wrong (4). The tense change and the cut of "slightly" on the sentence's own 20-to-40 numbers are right. The section A vague-qualifier rule it applies is not named by page and section, since the parenthetical names no rule. The passage also belongs in group 5, the first group that reaches it.
68. b_implementation.tex:9 "we additionally evaluate a set of exploratory...": right. Fusion runs.
69. b_implementation.tex:9 "we naively concatenate the series": right. Fusion input.
70. b_implementation.tex:9 "we evaluate the full fusion": right. Configurations run.
71. b_implementation.tex:9 "augmentation views are sampled": right. Passive procedure.
72. b_implementation.tex:11 "we further disentangle the contributions": right. Ablation.
73. b_implementation.tex:11 "we evaluate two intermediate configurations": right. Ablation runs.
74. b_implementation.tex:11 "We conduct this ablation": right. Ablation run.
75. c_evaluation.tex:1 "we evaluate HCCNet's baseline": right. Evaluation step.
76. c_evaluation.tex:1 "we train ten independently seeded models ... and average": right. Both verbs fixed.
77. c_evaluation.tex:1 "Every reported metric is computed": right. Passive procedure; also in 13.17.
78. c_evaluation.tex:1 "we employ the following performance metrics": right. Also in 13.17.
79. c_evaluation.tex:1 "we also explore the robustness of the model": right. Analysis step.
80. c_evaluation.tex:6 "we evaluate the models' respective calibration": right. Calibration analysis.
81. 1_conv_layer.tex:3 "we inflate ... and reduce": right. Block changes made.
82. 2_augmentations.tex:1 "we randomly crop two global views": right. Crop step.
83. 2_augmentations.tex:1 "we randomly crop a multi-channel sub-volume": right. Encoder crop.
84. 2_augmentations.tex:1 "further augmentations remain consistent": right. Setting held across stages.
85. 2_augmentations.tex:1 "we randomly shift and scale ..., apply ..., and randomly flip": right. All three verbs fixed.
86. 2_augmentations.tex:1 "we use the same data augmentation strategy": right. Fine-tuning setting.

Results heading:
1. d_results.tex:5 "shows excellent predictive capability": right. Reported result.
2. d_results.tex:5 "appear to display less expressive characteristics": right. Also in 13.18.
3. d_results.tex:5 "still maintain a stronger average predictive capability": right. Also in 13.18.
4. d_results.tex:5 "are also evaluated in their own right": right. Also in 13.18.
5. d_results.tex:5 "is markedly stronger on AUROC": wrong (4). Tense fixed, but "markedly" is a size word of the "significantly" kind, kept although the numbers are in the same sentence. Unnamed.
6. d_results.tex:5 "while on AUPRC the two are comparable": right. Result.
7. d_results.tex:5 "The combined T1 IOP & T2-MRI modality reaches": right. Result.
8. d_results.tex:5 "so the T2-MRI model alone exceeds it": right. Result.
9. d_results.tex:5 "the combined modality nonetheless remains the weakest": right. Result.
10. d_results.tex:9 "the per-fold ensemble closely follows the diagonal line": wrong (4). "closely" is a size word for the deviation, which the figure's MAE quantifies. Kept and unnamed.
11. d_results.tex:9 "This robustness is tightest on AUROC": right. Result.
12. d_results.tex:9 "No model variant falls consistently below": right. Result.
13. d_results.tex:11 "the models are thus robust": right. Result.
14. d_results.tex:11 "the plots reveal no consistent differences across model architecture...": right. The tense break and the synonym cycling (named) both end.
15. d_results.tex:15 "Across imaging modalities, the magnitude ... varies.": right. Result.
16. d_results.tex:19 "the plots largely align with the results": wrong (4). "largely" is a vague qualifier of the "mostly" kind. Kept and unnamed (also in 13.19).
17. d_results.tex:19 "the expected calibration error does not display": right. Result.
18. d_results.tex:19 "consistently show the lowest expected calibration error": right. "consistently" holds: T1 IOP & T2 has the lowest baseline ECE in all five variants.
19. d_results.tex:19 "display the highest expected calibration error": right. Result.
20. d_results.tex:21 "This reduction is largest ..., reaches 37.0%": right. Both verbs fixed.
21. d_results.tex:21 "and is smallest at 12.1%": right. Result.
22. d_results.tex:25 "None of the fused configurations exceeds...": right. Result.
23. d_results.tex:25 "Adding T1 DCE-MRI to DW-MRI lowers performance": right. Result.
24. d_results.tex:25 "leaves performance essentially equal": wrong (4). "essentially" is an approximation qualifier. Kept and unnamed.
25. d_results.tex:25 "matches DW-MRI alone on AUROC": right. Result.
26. d_results.tex:29 "pre-training only the CNN backbone recovers essentially all": wrong (4). "essentially all" is kept and unnamed. The table even has CNN-only at 0.672, above both stages at 0.588.
27. d_results.tex:29 "yields AUPRC = 0.310": right. Result.
28. d_results.tex:29 "The CNN-backbone dominance also holds": right. Result.
29. d_results.tex:29 "clearly exceeds the Transformer encoder alone": wrong (4). "clearly" is a size word for the gap (0.524 vs 0.361). Kept and unnamed.
30. d_results.tex:29 "the two stages contribute comparably": right. Result.
31. d_results.tex:29 "These results indicate that": right. Result.
32. 1_baseline.tex:3 "consistently display the highest detection rate": right. DW recall is highest in every variant.
33. 2_reliability.tex:3 "consistently display the lowest average reliability scores": right. Result.
34. 2_reliability.tex:3 "preceding pre-training establishes a negative relationship": right. Also in 13.23.
35. 2_reliability.tex:3 "HCCNet fine-tuned using diffusion weighted MRIs display the lowest": right. Result.
36. 2_reliability.tex:3 "exhibit the highest average reliability metrics": right. Result.

=== 10. Prose standard, section C ===
- **10.1 d_results.tex:3, "We report HCCNet's fine-tuned performance..."**: right. Stands. It announces what the section does, which section C cuts. "delete" ends it.
- **10.2 d_pretraining.tex:8, "Note that in our implementation..."**: right. Stands. "Note that" is in the class of "It should be noted that", and its cut ends that break. The tense break is named and ends. Same text as in 13.8.
- **10.3 d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder..."**: right. Stands. The opener is cut and the named tense break ends. Same text as in 13.10.
- **10.4 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training we slightly deviate..."**: wrong (4). Stands. The opener cut, the specific claim drawn from the paragraph in place of "slightly", and the tense change are fine. It brings in "projection head", which the draft never defines (only the table row tables/hyperparams.tex:28 and a later sentence use it), with no definition or bracket.

=== 11. Prose standard, section A, banned filler and flagged terms ===
- **11.1 a_longitudinal_analysis.tex:3, "While the approach is relatively simple to implement..."**: right. Stands. "simple" carries a claim, so section A asks for the concrete fact, and the bracket asks for it. The tense break (literature review, past) is named and ends. The tense list (group 9) gives the same place.
- **11.2 b_pretraining.tex:3, "Instead of simply comparing..."**: right. Stands. "simply" here means "only", and "only" keeps that meaning without the filler.
- **11.3 b_pretraining.tex:5, "adopts a simple sequence-order-prediction task inspired by"**: right. Stands. "simple" is filler with no fact. Cutting it ends the break.
- **11.4 a_data.tex:3, "To obtain robust performance estimates..."**: wrong (2).
  - Stands. "robust" is the most precise word here: it is the draft's own term for insensitivity to the data partition (c_evaluation.tex:1, d_results.tex:9 and :11), and it is the statistical sense rules.md exempts.
  - "reliable" is the draft's term for calibration (reliability diagrams and scores), so the change gives one word two concepts.
  - Its note "(This place is not repeated in the tense list.)" is false: the tense list carries this passage, at the entry quoted as "we evaluate HCCNet using stratified 5-fold cross-validation".

=== 12. Prose standard, section D, "No synonym cycling" ===
All nine entries are right. Each passage stands at its place and names the five HCCNet sizes by a second term ("variation" or "architecture"). The draft calls them "variants" in c_variants.tex:1 and :10, so "variant" ends each break.
- c_variants.tex:1 "The five model variations are:": right. The itemize list of the five sizes.
- c_evaluation.tex:1 "For the comparison across model variations": right. The MAE comparison across sizes.
- d_results.tex:9 "\textbf{Comparison across Model Variations.}": right. Paragraph label.
- d_results.tex:5 "stratified by imaging modality and model architecture": right. Table rows are the sizes.
- d_results.tex:5 "across model architectures": right. The average across the sizes.
- d_results.tex:15 "stratified by image modality and model variation": right. Also ends "image" for "imaging".
- 1_baseline.tex:3 "stratified by image modality and model variation": right. Same, for the baseline table.
- 2_reliability.tex:3 "stratified by imaging modality and model architecture": right. Reliability table rows.
- tables/hyperparams.tex:36 "for model variations HCCNet-F, -C, and -P": right. Table note.

=== 13. Prose standard, section D, paragraphs ===
- **13.1 abstract.tex:3, "The CNN backbone is pre-trained..."**: wrong (4). Stands. Five sentences split 2/3, one idea each. Its second sentence is 1.2's text, so it carries the same unnamed Voice break.
- **13.2 introduction.tex:13, "This application not only demonstrates..."**: right. Stands. Six sentences split 3/2/1 together with 13.3, one idea each. Text agrees with 1.6.
- **13.3 introduction.tex:13, "Thus, HCCNet provides a flexible framework..."**: right. Stands. The code sentence stands alone. Text agrees with 1.7.
- **13.4 a_longitudinal_analysis.tex:3, "While the approach is relatively simple..."**: wrong (4). Stands. Seven sentences split 3/4. Its second sentence keeps "have therefore increasingly employed": a present perfect reporting cited studies (the break the report fixes at lines 3 and 5) and the vague trend word "increasingly". Neither is named.
- **13.5 a_longitudinal_analysis.tex:5, "Hybrid models can be trained..."**: right. Stands. Six sentences split 3/3. Text agrees with 5.7.
- **13.6 b_pretraining.tex:3, "As such, they randomly derive..."**: right. Stands. Six sentences split 3/3: the general approach, then the examples.
- **13.7 a_problem_formulation.tex:1, "As such, the data of each patient..."**: right. Stands. Five sentences split 3/2, and the tense changes are named.
- **13.8 d_pretraining.tex:8, "Note that in our implementation..."**: right. Stands. The where-clause plus seven sentences split 2/3/3 together with 13.9. Text agrees with 10.2 and 7.3.
- **13.9 d_pretraining.tex:8, "Specifically, we treat different series..."**: wrong (4). Stands, and the split is sound. The second sentence's three semicolon-separated per-modality items are list-shaped items in paragraph form (section D). Not named.
- **13.10 d_pretraining.tex:10 and :15, "We apply the sigmoid function..."**: right. Stands. The line-10 paragraph ends with the equation's where-clause, at four sentences. Text agrees with the tense entries and 10.3.
- **13.11 d_pretraining.tex:15, "Provided a sequence of DW-MRI's..."**: wrong (4). Stands. The split is 3/2. It changes "is pre-trained" to "was pre-trained" and "is then fine-tuned" to "was then fine-tuned". Neither is in the tense list, and the finding names no Tense line.
- **13.12 a_data.tex:1, "Prior to pre-training and fine-tuning..."**: wrong (4). Stands. The first part holds four draft sentences plus the sentence 4.1 adds, five in all. The SKILL counts added sentences, and no further split is given.
- **13.13 a_data.tex:3, "During fine-tuning we additionally exclude..."**: wrong (4). Stands. Ten sentences split 2/4/3/1 with 13.14 and 13.15. It carries 11.4's change of "robust" to "reliable", which I mark as not called for.
- **13.14 a_data.tex:3, "Each fold serves as the held-out test set..."**: right. Stands. Fold design, then leakage control. Text agrees with the tense entries.
- **13.15 a_data.tex:3, "As before, to avoid leakage..."**: right. Stands. The reporting sentence stands alone.
- **13.16 b_implementation.tex:1, "After reaching its maximum value..."**: right. Stands. Six sentences split 4/2: the learning-rate schedule, then the weight decay and DINO settings.
- **13.17 c_evaluation.tex:1, "Every reported metric is computed..."**: wrong (4). Stands. Five sentences split 3/2. The second sentence keeps six metrics after a colon in paragraph form, which section D's list rule turns into a list. Not named.
- **13.18 d_results.tex:5, "Contrast enhanced T1 weighted..."**: right. Stands. Seven sentences split 3/4: group comparison, then the standalone contrasts.
- **13.19 d_results.tex:19, "Extended reliability metrics are presented..."**: wrong (4). Stands. Seven sentences split 3/4. It keeps "largely", unnamed.
- **13.20 discussion.tex:12, "An ablation that pre-trains only the CNN backbone..."**: wrong (4). Stands. Five sentences split 3/2. It keeps "comparatively little" and "at most marginal improvements", size words, unnamed.
- **13.21 conclusion.tex:1, "Exploratory experiments further showed..."**: wrong (4). Stands. Eight sentences split 3/2/3 with 13.22. It keeps "at most marginal gains", unnamed. The second sentence agrees with 1.8.
- **13.22 conclusion.tex:1, "Yet, each condition presents its own unique challenges..."**: wrong (4). Stands, and the split is sound. The second sentence joins two ideas that each stand alone (multi-modal integration; external validation) with "while". That is a rules.md "Formality" break, not named.
- **13.23 2_reliability.tex:3, "That is despite that baseline models..."**: right. Stands. Six sentences split 4/2. Text agrees with 8.4 and the tense entry.

=== 14. Prose standard, section 0, "Em dash: zero" ===
- **main.tex:47 "Longitudinal 3D MRI Images: -- A Case Study..."**: right. Stands in a commented-out title. "--" standing for an em dash is banned. ", with a Case Study" ends it and matches the live title at main.tex:45.
- **main.tex:49 "Longitudinal 3D MRI Images -- A Case Study..."**: right. Same construction in another old title. The comma form ends it.
- **main.tex:51 "Longitudinal 3D MRI Images -- A Case Study..."**: right. Same in another old title. The comma form ends it.
- **main.tex:53 "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma"**: right. Same. The comma form ends it.
- **main.tex:57 "Longitudinal Medical Images -- Application to..."**: right. Same. ", with an Application" ends it.
- **discussion.tex:1 "This study therefore developed HCCNet - a spatio-temporal..."**: wrong (4). Stands in a comment, and the commas end the spaced-hyphen asides. It keeps "This study therefore developed", the Voice break 7.5 fixes in the live sentence at discussion.tex:6. Not named.

=== Groups with no line under the heading ===
None.

=== Group lines that do not meet "How you group them" whole ===
- **Group 6**: the line says terms are met undefined "at their first use, as with 'CNN' in the first paragraph of the abstract". CNN (and MRI) first appear in the title, main.tex:45, so the example's first-use claim does not hold in the draft.
- **Group 11**: the line says the reader "gets a softener with no fact in it, as in 'Instead of simply comparing'". The group's own finding 11.2 replaces "simply" with "only", which shows the word carried a fact. 11.1 ("relatively simple to implement") and 11.4 (a flagged term) are not fact-free softeners either.
- **Group 14**: the line gives the cost as "the aside construction the standard bans in every comment". That restates the rule and names no cost to the reader.
- **Group 9 (heading, not the line)**: the list's first two entries come from section 2 (the literature review) but sit under the "Methodology" heading.

=== Findings with no quoted passage, no replacement, or a replacement that is an instruction or a reference ===
- Tense list, b_implementation.tex:3: the entry "'pre-training of the Transformer encoder considers' is given in finding 6.4." is a reference to another finding and has no replacement.
- 5.2: the replacement for its Clear antecedents break is an instruction ("begin the sentence with 'Outcome prediction from longitudinal MRI is especially relevant ...'"), and the written replacement keeps "This".

=== Passages or places the report gives twice ===
Given twice against "No later group gives it again":
- a_longitudinal_analysis.tex:3 "it has been shown to not fully explore": in the tense list (group 9), in 11.1 (group 11), and quoted again in 13.4.
- a_data.tex:3 "we evaluate HCCNet using stratified 5-fold cross-validation": in the tense list, in 11.4 (which wrongly says the tense list does not repeat it), and quoted again in 13.13.
- b_implementation.tex:3 "pre-training of the Transformer encoder considers": in 6.4, and again in the tense list as a reference.

Given twice because a paragraph split quotes the sentence (the texts agree in every case):
- abstract.tex:3 "We demonstrate..." (1.2, 13.1).
- introduction.tex:13 "This application not only demonstrates..." (1.6, 13.2) and "Thus, HCCNet provides..." (1.7, 13.3).
- a_longitudinal_analysis.tex:5 "Hybrid models can be trained..." (5.7, 13.5).
- d_pretraining.tex:8 "Note that in our implementation..." (10.2, 13.8), "Besides that, our implementation also proposes..." (7.3, 13.8), and the four tense entries on "Specifically, we treat..." and "For a view cropped..." (13.9).
- d_pretraining.tex:10/15 "We apply the sigmoid function", "and learn to identify" (tense list, 13.10) and "Note that during pre-training of the Transformer encoder..." (10.3, 13.10).
- d_pretraining.tex:15 "we reconcile", "are replicated" (tense list, 13.11).
- a_data.tex:1 "comprise", "are available" (tense list, 13.12).
- a_data.tex:3 "we additionally exclude", "of which 37 develop" (tense list, 13.13), "Each fold serves", "form ... is used", "is repeated" (tense list, 13.14), and "we only fine-tune ... are also included" (tense list, 13.15).
- b_implementation.tex:1 "we decay", "We employ the same cosine decay", "but only apply it" (tense list, 13.16).
- c_evaluation.tex:1 "Every reported metric is computed", "we employ the following performance metrics" (tense list, 13.17).
- d_results.tex:5 "appear to display", "still maintain", "are also evaluated" (tense list, 13.18).
- d_results.tex:19 "the plots largely align" (tense list, 13.19).
- conclusion.tex:1 "The methodology is versatile..." (1.8, 13.21).
- 2_reliability.tex:3 "That is despite that..." (8.4, 13.23) and "preceding pre-training establishes" (tense list, 13.23).

Two sentences carry two findings on different phrases (the texts agree):
- c_evaluation.tex:1, sentence 5 (group 12 "For the comparison across model variations" and tense list "we also explore the robustness").
- d_results.tex:5, sentence 2 (tense list "shows excellent predictive capability" and group 12 "across model architectures").

=== Findings carrying a line saying they still break a rule ===
None. The grep for "still" over the report finds no such line.

One scope note: I applied section D's list rule only where items are enumerated after a colon or between semicolons (13.17, 13.9). I did not apply it to short noun series inside a clause, such as "RNN, LSTM or Transformer".

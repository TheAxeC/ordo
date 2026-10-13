# Manuscript marks 1

Marker a06df53aba5d3a063, ordo-high, served claude-opus-5-5. Usage: 244143 tokens, 32 tool uses, 14.3 min.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/4-run/manuscript-report.md

Read in full: the prose standard, rules.md, registers.md, SKILL.md, 3-cases.md, the report (all 516 lines) and all 33 draft files. I checked each place against the file at that line. I ran grep -n -F over the 33 files for these terms: Pico, feature extractor, stem, first convolutional, AUC, SSL, Brier, DINO, Pre-LN, patchify, Magnetic, TRIPOD/CLAIM/STARD/guideline, " -- " and " - ".

How I applied the form rule. A replacement is accepted when it is written-out text, or when it is a pointer to a replacement written out verbatim in another finding for the same sentence (for example "replacement as in finding 34"). A replacement that describes the edit counts as an instruction in place of text and fails condition 4. Examples: "the same two sentences with an empty line between them", "the same sentence, followed by", "X unchanged, an empty line, then". SKILL.md says the finding "gives the changed text" and that a replacement is never an instruction such as "split before ...".

== rules.md, "Limitations and alternative interpretations"
1. sections/4_experiments/d_results.tex:11 "This corresponds with the results..." WRONG (4). The limit it states ("except on AUPRC for T1 DCE-MRI ... and for DW-MRI") does not hold in the draft's data. It leaves the "negligible" claim standing for T1 IOP & T2-MRI AUPRC (0.373 to 0.519, a spread larger than its 0.091 gap to T1 DCE-MRI) and for T1 DCE-MRI AUROC (0.734 to 0.857).
2. sections/4_experiments/b_implementation.tex:9 "Owing to the limited number..." WRONG (4). This is the same claim with the same incomplete limit ("outside the AUPRC of T1 DCE-MRI and DW-MRI").
3. sections/5_discussion/discussion.tex:12 "An ablation that pre-trains only..." RIGHT. The limit and the numbers 0.457 and 0.447 match d_results.tex:29 and the ablation table.
4. sections/6_conclusion/conclusion.tex:1 "Beyond the original framework..." RIGHT. It states the same modality limit, and the data hold it.
5. sections/1_introduction/introduction.tex:11 "Additionally, the Transformer encoder is pre-trained..." WRONG (4, form). The added sentence's numbers are right (0.457/0.307, 0.310/0.308, 0.361/0.350), but the replacement is "the same sentence, followed by ..." and does not write the sentence out.

== rules.md, "Hedging"
6. abstract.tex:3 "We demonstrate the effectiveness..." RIGHT. "demonstrate" becomes the moderate "indicate" for a single-cohort result.
7. abstract.tex:3 "Our results show that HCCNet substantially..." RIGHT. The clinical-tool claim is hedged and the reported result is kept.
8. abstract.tex:5 "The methodological approach presented..." RIGHT. An untested generalization takes "may/could".
9. abstract.tex:5 "Its ability to handle..." RIGHT. It hedges the claim and drops "invaluable", which section 0 allows. "it" has a clear antecedent.
10. introduction.tex:9 "Unlike previous approaches..." RIGHT. The comparative claim is hedged, and the three specifics are ones the draft states.
11. introduction.tex:13 "By fine-tuning the pre-trained model..." RIGHT. The device is moderate and the claim is kept.
12. introduction.tex:13 "Thus, HCCNet provides a flexible framework..." RIGHT. The generalization is hedged, and the text matches finding 64's second break.
13. discussion.tex:10 "Inspection of the models' reliability diagrams..." RIGHT. The unmeasured mechanism takes "may".
14. discussion.tex:10 "Thus, even for imaging modalities..." RIGHT. "demonstrating" becomes "suggests".
15. discussion.tex:12 "We attribute this to..." RIGHT. The attribution takes "may be due to", "this" is named, and the two ideas are split.
16. sections/appendix/b_additional_results/2_reliability.tex:3 "Contrarily, for the fine-tuned models..." RIGHT. The causal "establishes" becomes "appeared to establish".
17. conclusion.tex:1 "The methodology is versatile..." RIGHT. The untested generalization is hedged.

== rules.md, "Evidence for claims"
18. a_longitudinal_analysis.tex:1 "To date, deep learning applications..." RIGHT. The claim is unsourced, and a bracketed citation is added.
19. a_longitudinal_analysis.tex:1 "As a result, longitudinal imaging..." RIGHT. Citations, the named branches and the split are added, and the causal relation is kept.
20. a_longitudinal_analysis.tex:5 "To mitigate this shortcoming..." RIGHT. The "third most common" ranking has no source.
21. b_pretraining.tex:1 "While the temporal relationship..." RIGHT. The claim of scarcity has no source.
22. b_pretraining.tex:1 "Using the potential abundance..." WRONG (2). The draft gives the evidence in its next paragraph (b_pretraining.tex:3 names jamaludin2017 and rivail2019 as such studies), so "Evidence for claims" does not report it. The replacement would fit "Vague language" instead.
23. b_pretraining.tex:3 "Among them, contrastive learning..." RIGHT. The "most commonly applied" claim has no source.
24. d_pretraining.tex:1 "When training neural networks..." RIGHT. "repeatedly shown" has no citation.
25. introduction.tex:7 "Likewise, most deep learning applications..." RIGHT. A bracketed share and citation are added, and the claim is kept.
26. discussion.tex:12 "Our augmentation strategy exposes..." WRONG (4). The replacement both asks for evidence and hedges the factual claim ("may be richest"). Once the author supplies the evidence, that hedge on a factual claim is itself a "Hedging" break, and the interpretive link to the gains is left as it was.

== rules.md, "Most specific term"
27. discussion.tex:8 "while combined T1 in- and out-of-phase..." WRONG (2). "Accuracy" is a reported metric, and the stated ranking holds on it: group mean accuracy, computed from tables/results_finetune.tex, is 0.854, 0.811 and 0.799. So "accuracy" is the right term for what it names. This also makes the group line's reason false.
28. discussion.tex:8 "Our proposed pre-training approach improved model performance by up to 147.1%..." RIGHT. 147.1% is the AUPRC relative change in tables/results_base_vs_pre.tex:17.
29. sections/3_methodology/e_finetuning.tex:1 "Additionally, we append the final pooling layer..." RIGHT. "our initial task" becomes the named task, and the past tense is correct for Methodology.

== registers.md, "What the reader looks for" and "Voice" (Medicine and Health fits: the journal is Intelligent Medicine, main.tex:38, and the study is a clinical prognostic cohort)
30. sections/4_experiments/a_data.tex:1 "We evaluate HCCNet on data..." RIGHT. grep finds no reporting guideline in the draft, and the guideline is added as a bracketed fact.
31. discussion.tex:6 "To support HCCNet's capability..." RIGHT. The authors' decision moves from the passive to "we".
32. discussion.tex:16 "Despite these successes, several challenges..." RIGHT. The authors' finding moves from the passive to "we".

== rules.md, "Terms defined at first use"
33. main.tex:45 "\title{HCCNet: A Self-Supervised CNN-Transformer..." RIGHT. CNN and MRI are used here before any definition. The note "never spelled out anywhere" is wrong for CNN, which introduction.tex:5 defines.
34. abstract.tex:1 "To address this, we propose HCCNet..." RIGHT. This is the first use of ConvNeXt, a definition is named for the author to supply, and "this" is named.
35. introduction.tex:11 "The CNN backbone is pre-trained using an extended version of the DINO framework..." RIGHT. This is DINO's first use. The definition matches d_pretraining.tex:3.
36. b_architecture.tex:14 "The Transformer encoder is based on the Pre-LN implementation..." RIGHT. Pre-LN is never defined, and the added definition is accurate.
37. b_architecture.tex:5 "Additionally, we reimplement the patchify layer..." WRONG (4). The definition is sound, but the replacement cuts "typically" ("the lower input size of volumetric data"), so the claim reads as universal, which SKILL.md forbids.
38. sections/appendix/b_additional_results/1_baseline.tex:3 "Overall differences between imaging modalities..." WRONG (4). SSL is correctly defined, but cutting "generally" turns "poor" into a claim about all baseline models. That includes AUROC 0.724, which the draft never calls poor.
39. c_evaluation.tex:6 "Likewise, for the comparison against..." RIGHT. This is the Brier score's first use, and the definition is correct.

== Prose standard, D, "No synonym cycling"
40. HCCNet-Pico / HCCNet-P. grep shows 11 uses, and all 11 are listed.
- c_variants.tex:1 "In addition to our base model, called HCCNet-Pico..." RIGHT.
- c_variants.tex:10 "scales only the channel..." RIGHT.
- b_implementation.tex:9 "(replacement as in finding 2)" WRONG (4). It carries finding 2's limit, which the data do not hold.
- b_implementation.tex:11 "We conduct this ablation..." RIGHT.
- d_results.tex:5 "At HCCNet-Pico, the standalone T2-MRI..." RIGHT.
- d_results.tex:25 "reports the fine-tuned HCCNet-Pico performance" RIGHT.
- d_results.tex:29 "the contribution of the two pre-training stages..." RIGHT.
- tables/results_fusion.tex:3 "(HCCNet-Pico)}" RIGHT.
- tables/results_fusion.tex:21 "All configurations use the HCCNet-Pico variant" RIGHT.
- tables/results_pretrain_ablation.tex:3 "(HCCNet-Pico)}" RIGHT.
- tables/results_pretrain_ablation.tex:27 "All configurations use the HCCNet-Pico variant." RIGHT.
41. CNN feature extractor / CNN backbone.
- b_architecture.tex:5 "\textbf{CNN Feature Extractor.}" RIGHT.
- b_architecture.tex:7 "The CNN feature extractor takes..." RIGHT.
- b_architecture.tex:14 "we concatenate the image embeddings..." RIGHT.
- d_pretraining.tex:3 "\textbf{CNN Feature Extractor.}" RIGHT.
- d_pretraining.tex:10 "we keep the parameters of the CNN feature extractor..." RIGHT.
- 2_augmentations.tex:1 "During pre-training of the CNN feature extractor..." RIGHT.
- tables/results_pretrain_ablation.tex:27 "pre-trains the CNN feature extractor..." RIGHT.
- Missing place: a_longitudinal_analysis.tex:5 "using a pre-trained CNN feature extractor". It sits in the same paragraph as "CNN backbone", is not listed, and finding 57 keeps it.
42. Patchify layer / stem / first convolutional layer.
- d_pretraining.tex:15 "Since the backbone is pre-trained on single-channel views..." RIGHT. Both names now read "patchify layer".
- d_pretraining.tex:15 "This transfers the pre-trained representation..." RIGHT.
43. a_longitudinal_analysis.tex:5 "area under the receiver operating characteristic curve (AUC)..." RIGHT. AUROC is the draft's name for this metric (c_evaluation.tex:1).

== rules.md, "Clear antecedents"
44. abstract.tex:1 "To address this..." RIGHT. It points to finding 34.
45. d_pretraining.tex:8 "This teaches the model..." RIGHT. "Sampling series in this way" names the noun.
46. d_pretraining.tex:15 "This transfers..." RIGHT. It points to finding 42.
47. d_results.tex:11 "This corresponds with..." WRONG (4). Its shared replacement (finding 1) states a limit the data do not hold.
48. discussion.tex:12 "We attribute this to..." RIGHT. It points to finding 15.
49. 2_reliability.tex:3 "That is despite that baseline models..." RIGHT. "These lowest scores" names the antecedent.
50. 3_hyperparams.tex:3 "This is due to convergence issues..." RIGHT. "The deviation" names the antecedent.

== rules.md, "Reader's question per section"
51. introduction.tex:1 "Predicting disease outcomes based on longitudinal MRI scans is important..." WRONG (2). The section opens with a real-world consequence ("improving patient management"), and its next sentence makes that consequence concrete. The replacement also reverses the logic with "therefore" and drops "especially".
52. d_results.tex:5 "Table \ref{tab:finetuned_results} presents fine-tuned model results..." RIGHT. The section now leads with the finding, which the table holds (DW-MRI highest of the three groups on AUPRC and AUROC).

== Prose standard, A (vague qualifiers) and rules.md, "Vague language"
53. introduction.tex:1 "remains a significant challenge" RIGHT. "Significant" is cut, and "open problem" keeps the claim.
54. introduction.tex:5 "Traditional approaches often simplify this task" WRONG (4). "often" becomes "usually", which is a stronger claim.
55. introduction.tex:5 "However, this method has limitations..." WRONG (4). The same "often" to "usually" strengthening.
56. introduction.tex:7 "However, many existing approaches..." WRONG (4). "existing approaches such as [...]" cuts "many", so the claim reads as covering all existing approaches.
57. a_longitudinal_analysis.tex:5 "Hybrid models can be trained end-to-end..." RIGHT. "typically" becomes "usually" with a bracketed count, and the split is sound.
58. a_longitudinal_analysis.tex:7 "Likewise, many of them disregard" RIGHT. The studies are named in brackets.
59. b_pretraining.tex:1 "As a result, many deep learning studies..." WRONG (4). "studies ..., such as [...]" cuts "many", so the claim reads as universal.
60. a_problem_formulation.tex:1 "Since the frequency of liver screenings is typically..." RIGHT. "usually" keeps the claim as usual.
61. figures/cumulative_gain.tex:10 "Generally, lower MAE values..." RIGHT. The claim holds by MAE's definition, so cutting "Generally" overstates nothing.
62. discussion.tex:6 "Despite being long established..." WRONG (4). The replacement cuts "notoriously" instead of giving the formal word the Formality rule asks for, which weakens the claim.

== rules.md, "Tense per section"
Every "as in finding N" entry was checked against that finding's text for the same sentence.

Methodology:
- a_problem_formulation.tex:1 "This study aims to define" RIGHT.
- a_problem_formulation.tex:1 "patient records are subset" RIGHT.
- a_problem_formulation.tex:1 "...D^{(p,t)}$ is set to:" RIGHT.
- b_architecture.tex:3 "We use the CNN backbone" RIGHT.
- b_architecture.tex:5 "we adapt the ConvNeXt architecture" RIGHT.
- b_architecture.tex:5 "we replace the 2-dimensional..." RIGHT.
- b_architecture.tex:5 the reimplement sentence as in finding 37: WRONG (4). It carries 37's cut of "typically".
- b_architecture.tex:14 as in finding 41: RIGHT.
- b_architecture.tex:21 "we embed the input's positional information" RIGHT.
- b_architecture.tex:21 "we replace the conventional sequence position" RIGHT.
- b_architecture.tex:21 "The reference point is determined solely" RIGHT.
- b_architecture.tex:21 "and never uses the outcome itself" RIGHT.
- b_architecture.tex:21 "we compute the vector of intervals" RIGHT.
- b_architecture.tex:26 "prepend" RIGHT.
- b_architecture.tex:26 "obtain positional encodings" RIGHT.
- b_architecture.tex:34 "we add the positional encodings" RIGHT.
- b_architecture.tex:39 "We feed the input sequence..." RIGHT.
- b_architecture.tex:44 "we feed it through a pooling layer" RIGHT.
- c_variants.tex:1 as in finding 40: RIGHT.
- c_variants.tex:10 "we additionally introduce HCCNet-C" RIGHT.
- d_pretraining.tex:1 "we therefore design two" RIGHT.
- d_pretraining.tex:3 "this study extends the self-supervised DINO..." RIGHT.
- d_pretraining.tex:3 "we define a student" RIGHT.
- d_pretraining.tex:3 "the teacher is built as" RIGHT.
- d_pretraining.tex:3 "we learn to match" RIGHT.
- d_pretraining.tex:8 "we exploit the abundance" RIGHT.
- d_pretraining.tex:8 "we treat different series" RIGHT.
- d_pretraining.tex:8 the "Note that" and "For a view" sentences as in finding 70: RIGHT.
- d_pretraining.tex:10 "this study employs a simple binary..." RIGHT.
- d_pretraining.tex:10 "we randomly shuffle 50%..." RIGHT.
- d_pretraining.tex:10 "and task the model" RIGHT.
- d_pretraining.tex:10 footnote "we actually randomly shuffle 66%..." RIGHT.
- d_pretraining.tex:10 the CNN-parameters sentence as in finding 41: RIGHT.
- d_pretraining.tex:10 "We apply the sigmoid function" RIGHT.
- d_pretraining.tex:10 "and learn to identify shuffled sequences" RIGHT.
- d_pretraining.tex:15 "we do not randomly crop multiple views..." RIGHT.
- d_pretraining.tex:15 "we concatenate the different series" RIGHT.
- d_pretraining.tex:15 the remaining sentences as in findings 42 and 71: RIGHT.
- e_finetuning.tex:1 "we initialize the parameters of HCCNet" RIGHT.
- e_finetuning.tex:1 second sentence as in finding 29: RIGHT.
- a_data.tex:1 first sentence as in finding 30: RIGHT.
- a_data.tex:1 "This complete co-availability allows us" RIGHT.
- a_data.tex:1 the "All examinations" sentence as in finding 72: RIGHT. The sentence's own text is sound; 72's defect is the part length.
- a_data.tex:3 "we include all available data..." RIGHT.
- a_data.tex:3 "We partition the patient cohort" RIGHT.
- a_data.tex:3 "The folds are stratified..." RIGHT.
- a_data.tex:3 "Because pre-training is re-run..." RIGHT.
- a_data.tex:3 "we only fine-tune HCCNet on longitudinal MRIs..." RIGHT.
- a_data.tex:3 the remaining sentences as in finding 73: RIGHT.
- b_implementation.tex:1 "we pre-train both the CNN backbone" RIGHT.
- b_implementation.tex:1 "We train the CNN over 32000..." RIGHT.
- b_implementation.tex:1 "we decay the learning rate" RIGHT.
- b_implementation.tex:1 "We employ the same cosine decay... only apply it" RIGHT.
- b_implementation.tex:1 "we also limit the temperature" RIGHT.
- b_implementation.tex:1 "and increase the initial ... momentum" RIGHT.
- b_implementation.tex:1 the warm-up sentence as in finding 74: RIGHT.
- b_implementation.tex:3 "While MRI scans are assumed..." RIGHT.
- b_implementation.tex:3 "we train the Transformer encoder" RIGHT.
- b_implementation.tex:3 "We set the maximal sequence length..." RIGHT.
- b_implementation.tex:5 "we update HCCNet" RIGHT.
- b_implementation.tex:5 "We fine-tune the model over 400..." RIGHT.
- b_implementation.tex:5 "but decrease the weight decay" RIGHT.
- b_implementation.tex:5 "we select the batch size" RIGHT.
- b_implementation.tex:5 "and apply no further hyperparameter tuning" RIGHT.
- b_implementation.tex:5 "we then train HCCNet" RIGHT.
- b_implementation.tex:5 "and evaluate it on the corresponding held-out fold" RIGHT.
- b_implementation.tex:7 "we establish a baseline" RIGHT.
- b_implementation.tex:7 "we equally train the baseline" RIGHT.
- b_implementation.tex:7 "We employ the same optimizer" RIGHT.
- b_implementation.tex:7 "but slightly increase the learning rate warm-up" RIGHT.
- b_implementation.tex:9 "we additionally evaluate a set..." RIGHT.
- b_implementation.tex:9 "we naively concatenate" RIGHT.
- b_implementation.tex:9 "Concretely, we evaluate the full fusion" RIGHT.
- b_implementation.tex:9 "augmentation views are sampled..." RIGHT.
- b_implementation.tex:9 the last sentence as in finding 2: WRONG (4). It carries finding 2's limit, which the data do not hold.
- b_implementation.tex:11 "we further disentangle" RIGHT.
- b_implementation.tex:11 "we evaluate two intermediate configurations" RIGHT.
- b_implementation.tex:11 the last sentence as in finding 40: RIGHT.
- c_evaluation.tex:1 "we evaluate HCCNet's baseline" RIGHT.
- c_evaluation.tex:1 "we train ten independently seeded models... and average" RIGHT.
- c_evaluation.tex:1 "we also explore the robustness of the model" RIGHT.
- c_evaluation.tex:1 the remaining sentences as in findings 39 and 75: RIGHT.
- c_evaluation.tex:8 as in finding 81: RIGHT.
- 1_conv_layer.tex:3 "we inflate the 2D depthwise..." RIGHT.
- 2_augmentations.tex:1 first sentence as in finding 41: RIGHT.
- 2_augmentations.tex:1 "we randomly crop a multi-channel sub-volume" RIGHT.
- 2_augmentations.tex:1 "further augmentations remain consistent" RIGHT.
- 2_augmentations.tex:1 "we randomly shift and scale the intensity" RIGHT.
- 2_augmentations.tex:1 "apply random 90 degree rotations" RIGHT.
- 2_augmentations.tex:1 "and randomly flip the cropped view" RIGHT.
- 2_augmentations.tex:1 "we use the same data augmentation strategy" RIGHT.
- 3_hyperparams.tex:3 "we slightly deviate from" RIGHT.
- 3_hyperparams.tex:3 the next sentence as in finding 50: RIGHT.

Results:
- d_results.tex:5 "HCCNet trained using diffusion weighted MR images shows excellent..." RIGHT. It also cuts "excellent", which section 0 allows.
- d_results.tex:5 the contrast-enhanced T1 sentence as in finding 76: RIGHT.
- d_results.tex:5 "At HCCNet-Pico" as in finding 40: RIGHT.
- d_results.tex:5 "The combined T1 IOP & T2-MRI modality reaches..." RIGHT.
- d_results.tex:5 "the combined modality nonetheless remains the weakest" RIGHT.
- d_results.tex:9 "we explore the impact of varying model complexity" RIGHT.
- d_results.tex:9 "the per-fold ensemble closely follows..." RIGHT.
- d_results.tex:9 "This robustness is tightest on AUROC" RIGHT.
- d_results.tex:9 "No model variant falls consistently below..." RIGHT.
- d_results.tex:11 "the models are thus robust" RIGHT.
- d_results.tex:11 "the plots reveal no consistent differences..." RIGHT.
- d_results.tex:11 the third sentence as in finding 1: WRONG (4). It carries finding 1's incomplete limit.
- d_results.tex:15 first sentence as in finding 86: RIGHT.
- d_results.tex:15 "the magnitude of the improvement ... varies" RIGHT.
- d_results.tex:15 the "That is" sentence as in finding 77: RIGHT.
- d_results.tex:19 "we compare the reliability" RIGHT.
- d_results.tex:19 "the plots largely align" as in finding 78: RIGHT.
- d_results.tex:19 "the expected calibration error does not display" RIGHT.
- d_results.tex:19 "consistently show the lowest expected calibration error..." RIGHT.
- d_results.tex:21 first sentence as in finding 84: RIGHT.
- d_results.tex:21 "This reduction is largest ... reaches 37.0%" RIGHT.
- d_results.tex:21 "and is smallest at 12.1%" RIGHT.
- d_results.tex:25 "we evaluate whether naively fusing" RIGHT.
- d_results.tex:25 "None of the fused configurations exceeds" RIGHT.
- d_results.tex:25 the "Adding" sentence as in finding 79: RIGHT.
- d_results.tex:25 "As all differences fall within..." RIGHT.
- d_results.tex:29 the CNN-backbone-only sentence as in finding 80: RIGHT.
- d_results.tex:29 "The CNN-backbone dominance also holds" RIGHT.
- d_results.tex:29 "clearly exceeds the Transformer encoder alone" RIGHT.
- d_results.tex:29 "the two stages contribute comparably" RIGHT.
- 1_baseline.tex:3 "consistently display the highest detection rate" RIGHT.
- 1_baseline.tex:3 the last sentence as in finding 38: WRONG (4). It carries 38's cut of "generally".
- 2_reliability.tex:3 "variations in reliability scores are predominantly driven" RIGHT.
- 2_reliability.tex:3 "consistently display the lowest average reliability scores" RIGHT.
- 2_reliability.tex:3 the "That is despite" sentence as in finding 49: RIGHT.
- 2_reliability.tex:3 the "Contrarily" sentence as in finding 16: RIGHT.
- 2_reliability.tex:3 "display the lowest ... exhibit the highest" RIGHT.

Place form: after each file's first entry, the tense list drops the path from the main file's folder (for example "b_architecture.tex:5" for sections/3_methodology/b_architecture.tex:5). SKILL.md's place form requires that path.

== Prose standard, D, "Paragraphs cover one idea and stay under roughly four sentences"
63. abstract.tex:3 "The CNN backbone is pre-trained... / We demonstrate the effectiveness..." RIGHT. The paragraph has 5 sentences, splits into 2 and 3, and the text is written out.
64. introduction.tex:13, 6 sentences.
- First break, "This application not only demonstrates... / The methodological approach..." WRONG (4, form). The replacement is "the same two sentences with an empty line between them".
- Second break, "Thus, HCCNet provides... / All code..." RIGHT.
65. a_longitudinal_analysis.tex:3 "While the approach is relatively simple... / Studies investigating treatment effects..." RIGHT. The paragraph has 7 sentences and splits into 3 and 4. "simple" and the passive with a cited actor are fixed.
66. a_longitudinal_analysis.tex:5 "Hybrid models can be trained... / Compared to the aforementioned..." WRONG (4, form). The replacement is "the two sentences of finding 57, an empty line, then ...".
67. b_pretraining.tex:3 "As such, they randomly derive... / \cite{jamaludin...}, for example..." WRONG (4, form). The replacement is "the same two sentences with an empty line between them".
68. discussion.tex:12 (the ablation sentence of finding 3 / "Finally, our exploratory...") WRONG (4). The replacement is a description, not text. After findings 26 and 3, the part before the break also holds 5 sentences, and no further split is given.
69. discussion.tex:18 "Incorporating these data sources... / In addition, the study's focus..." WRONG (4, form). The replacement is "the same two sentences with an empty line between them".
70. d_pretraining.tex:8, 8 sentences.
- First break, "Note that in our implementation... / Besides that, our implementation..." RIGHT.
- Second break, "For a view cropped from a Diffusion-Weighted MRI... / This teaches the model..." RIGHT.
71. d_pretraining.tex:15 "Provided a sequence of DW-MRI's... / Since the backbone is pre-trained..." WRONG (4, form). The replacement is "..., an empty line, then the first sentence of finding 42".
72. a_data.tex:1 "Prior to pre-training and fine-tuning... / All examinations included..." WRONG (4). Finding 30 adds a sentence to the part before the break, which then holds 5 sentences, and no further split is given. The report itself treats 5 sentences as a break (63, 68).
73. a_data.tex:3, 10 sentences.
- First break, "During fine-tuning we additionally exclude... / To obtain robust performance estimates..." RIGHT. The parts are 2, 4 and 4, and "robust" here is not the statistical term.
- Second break, "Each fold serves as the held-out test set... / The full modeling pipeline..." RIGHT.
74. b_implementation.tex:1 "During the first 5% of training steps... / After reaching its maximum value..." RIGHT. The paragraph has 6 sentences and splits into 3 and 3.
75. c_evaluation.tex:1 "Every reported metric is computed... / For evaluation, we employ..." RIGHT. The paragraph has 6 sentences and splits into 3 and 3.
76. d_results.tex:5 "Contrast enhanced T1 weighted and the combination... / The two contrasts that make up this combined group..." RIGHT. The paragraph has 7 sentences, and the parts are 4 and 4 after the other findings.
77. d_results.tex:15 "That is, although baseline model results vary only gradually..." RIGHT under "Formality", the rule the finding itself names. It is filed under the paragraph group but gives no paragraph split; the paragraph has 5 sentences.
78. d_results.tex:19 "Extended reliability metrics are presented... / For the fine-tuned models, the plots largely align..." RIGHT. The paragraph has 7 sentences and splits into 3 and 4.
82. conclusion.tex:1, 8 sentences.
- First break, "Exploratory experiments further showed... / The methodology is versatile..." WRONG (4, form). The replacement is "the first sentence unchanged, an empty line, then the replacement of finding 17".
- Second break, "Yet, each condition presents... / Additionally, exploring the integration..." RIGHT.
83. 2_reliability.tex:3 WRONG (1 and 4). Neither sentence is quoted (the report gives "the 'That is despite' sentence" and "the 'Contrarily' sentence"), and the replacement is a description ("the replacement of finding 49, an empty line, then ...").

== rules.md, "Formality"
79. d_results.tex:25 "Adding T1 DCE-MRI to DW-MRI lowers performance..." RIGHT. A three-part run-on is split, and the claims and numbers are kept.
80. d_results.tex:29 "For diffusion-weighted imaging, pre-training only the CNN backbone recovers..." RIGHT. The long sentence is split at "whereas", and the claims are kept.
81. c_evaluation.tex:8 "Since all metrics are obtained through cross-validation..." RIGHT. It splits at "so" and keeps the relation with "therefore".
85. b_pretraining.tex:1 "However, the usefulness of transfer learning..." WRONG (4). The split of the two unrelated ideas is right, but "fiercely" is cut rather than given the formal academic word, which weakens the claim.

== Prose standard, section 0
84. d_results.tex:21 "More interestingly, the comparison..." RIGHT. A performative aside is cut, and the tense is past.
Dash-as-aside places (all are LaTeX comments, which the prose standard covers as internal comments; grep finds no further " -- " in the draft besides the number range "7--8"):
- main.tex:47 "Longitudinal 3D MRI Images: -- A Case Study..." RIGHT.
- main.tex:49 "...Images -- A Case Study..." RIGHT.
- main.tex:51 "...Images -- A Case Study..." RIGHT.
- main.tex:53 "...Images -- A Case Study on Hepatocellular Carcinoma" RIGHT.
- main.tex:57 "...Medical Images -- Application to..." RIGHT.
- discussion.tex:1 "HCCNet - a spatio-temporal neural network ... - to predict" RIGHT.

== rules.md, "Transitions"
86. d_results.tex:15 "Finally, we evaluate the impact..." RIGHT. Two more subsections follow, so "Finally" states a relation the text does not have, and the replacement cuts it.

== Prose standard, C and E
87. d_results.tex:3 "We report HCCNet's fine-tuned performance (i)..." RIGHT. Section C says to cut such a sentence, so "delete" is allowed (3-cases.md 2).
88. d_results.tex:11 "At least on the data evaluated in this study..." RIGHT. It is a restating close, which section E says to cut, so "delete" is allowed.

== Prose standard, E, "Spec-sheet voice"
89. introduction.tex:9 "HCCNet integrates a 3D adaptation of the ConvNeXt architecture..." RIGHT. "allowing it to" becomes what each part does, as b_architecture.tex:3 states.
90. introduction.tex:11 "This self-supervised learning approach allows the model..." RIGHT.

== Prose standard, A, banned filler
91. b_pretraining.tex:3 "Instead of simply comparing..." RIGHT. "only" keeps the meaning.
92. b_pretraining.tex:5 "adopts a simple sequence-order-prediction task" RIGHT. The rule allows the cut.

== Prose standard, F, hard wrapping
93. sections/6_conclusion/ack.tex:2-3 "... MRI-radiomics" / "Primair leverkanker ..." RIGHT.
94. sections/6_conclusion/ack.tex:6-8
- "... (OpenAI ChatGPT) to help" / "refine the English language ..." RIGHT.
- "... reviewed and edited the" / "content as needed ..." RIGHT.

Group lines
- Every group has a line under its heading.
- "Reader's question per section": the line ("The Introduction does not open with a consequence or a gap, and the Results section does not open with a finding.") describes the breaks and does not name what the reader loses.
- "Most specific term": the line names a misreading that the data contradict. It says the ranking does not hold on accuracy, but it does: 0.854, 0.811 and 0.799, computed from tables/results_finetune.tex.
- "Prose standard, section 0": the line names a loss only for the evaluative words. It names none for the six dash entries in LaTeX comments that the group also holds.

Findings with no quoted passage, no replacement, or a replacement given as an instruction
- No quoted passage: 83.
- Replacement given as an instruction (a description of the edit): 5; 64 first break; 66; 67; 68; 69; 71; 82 first break; 83.
- No finding lacks a replacement.

Tally
- Numbered findings and their places: 112 marks. 84 are right and 28 are wrong.
- The wrong ones: 1; 2; 5; 22; 26; 27; 37; 38; 40 at b_implementation.tex:9; 47; 51; 54; 55; 56; 59; 62; 64 first break; 66; 67; 68; 69; 71; 72; 82 first break; 83; 85.
- Section 0 dash places: 6 marks, all right.
- Tense list: 133 sentences. 129 are right and 4 are wrong, each because it carries a defective replacement: the b_architecture.tex:5 entry from 37, the b_implementation.tex:9 entry from 2, the d_results.tex:11 entry from 1 and the 1_baseline.tex:3 entry from 38.

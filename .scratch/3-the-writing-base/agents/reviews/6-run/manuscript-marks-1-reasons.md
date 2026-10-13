# Reasons of manuscript marker 1, given on its resume

Agent af9e18c06b5359637, resumed once by the session (repair round 1 of step 6, ruling 3) for the marks its first message gave without a reason of their own. Resume usage: 231078 tokens in total after the resume, 1 tool use (the hand-back), 0.7 min (44215 ms). It changed no mark. The text below is its final message, verbatim apart from character names.

Section C
- Finding 5, d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder...": right. The sentence opens with "Note that", an opener section C cuts, and the replacement removes only that opener and puts the verbs in the Methodology past tense ("did not randomly crop", "cropped").
- Finding 6, 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training...": right. The sentence opens with the same "Note that" opener, and the replacement cuts it and keeps the claim, with "deviated" in the past tense of an appendix that describes the method.

Section D, "No synonym cycling"
- Term 1, b_architecture.tex:7, "The CNN feature extractor takes the MR images as inputs": right. The line names the component that the same section calls "CNN backbone" (b_architecture.tex:3 and :12), and the replacement uses that one name.
- Term 1, d_pretraining.tex:3, "\textbf{CNN Feature Extractor.}": right. The run-in heading at line 3 names the component whose paragraph begins "For the CNN backbone", and the replacement heading uses "CNN Backbone".
- Term 1, d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed and initialize them": right. The phrase stands at line 10 and names the backbone, and the replacement uses "CNN backbone" with the Methodology past tense.
- Term 1, 2_augmentations.tex:1, "During pre-training of the CNN feature extractor, we randomly crop two global views": right. The appendix sentence names the backbone by the second name, and the replacement uses "CNN backbone" with "cropped".
- Term 2, c_variants.tex:1, "The five model variations are:": right. The line introduces the five configurations that the same sentence calls "variants", and the replacement uses "model variants".
- Term 2, c_evaluation.tex:1, "For the comparison across model variations, we also explore the robustness of the model": right. "Model variations" names the HCCNet-F to -T configurations, and the replacement uses "model variants" with "explored".
- Term 2, the second entry at d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent predictive capability ... across model architectures.": right. "Model architectures" here means the five variants whose results are averaged in tables/results_finetune.tex, and the replacement uses "model variants" with "showed".
- Term 2, d_results.tex:9, "\textbf{Comparison across Model Variations.}": right. The run-in heading names the variant comparison, and the replacement uses "Model Variants".
- Term 2, d_results.tex:15, "stratified by image modality and model variation": right. The phrase stands in the second sentence of line 15, and the replacement uses "model variant" and also "imaging modality", the name that term 3 sets.
- Term 2, 1_baseline.tex:3, "stratified by image modality and model variation": right. The phrase stands in the first sentence of line 3, and the replacement uses both terms the group sets.
- Term 2, 2_reliability.tex:3, "stratified by imaging modality and model architecture": right. "Model architecture" here means the variants of tables/results_reliability.tex, and the replacement uses "model variant".
- Term 3, figures/cumulative_gain.tex:10, "across three MRI types": right. "MRI types" names the three modality groups listed after it in parentheses, and the replacement uses "imaging modalities".
- Term 3, figures/calibration.tex:10, "across three MRI modalities": right. The caption note names the same three groups by a third name, and the replacement uses "imaging modalities".

Section D, paragraphs
- Finding 8, d_pretraining.tex:8 (second break), "Specifically, we treat different series...": right. The two quoted sentences stand whole in the 8-sentence paragraph, and with the first break the parts hold 2, 3 and 3 sentences, which separates the augmentation strategy from its per-modality sampling details.
- Finding 12, a_data.tex:3 (second break), "The folds are stratified by HCC outcome...": right. The quoted sentences 5 and 6 of the 10-sentence paragraph stand whole, and with the other two breaks the parts hold 2, 3, 3 and 2 sentences, with past-tense replacements.
- Finding 13, a_data.tex:3 (third break), "Because pre-training is re-run within every fold...": right. Sentences 8 and 9 are quoted whole, and the last part (sentences 9 and 10) stays on the one subject of the cross-validation protocol in 2 sentences.
- Finding 37, tables/results_reliability.tex:32 (second break), "Second best results are underlined. DW-MRI comprises...": right. Sentences 5 and 6 of the 8-sentence note are quoted whole, and with the first break the parts hold 2, 3 and 3 sentences: the metric definitions, the presentation conventions and the modality definitions.

Section A, filler and flagged terms
- Finding 3, d_pretraining.tex:10, "this study employs a simple binary sequence-order-prediction (SOP) task": right. "Simple" is on section A's filler list, and the replacement cuts it while keeping "binary", the concrete fact, with the Methodology tense "employed".

Tense per section (Methodology and Results take the past tense)
1. b_architecture.tex:3, "We use the CNN backbone": right. A present-tense action in Methodology, put in the past as "We used".
2. b_architecture.tex:5, "we adapt the ConvNeXt architecture": right. The authors' adaptation is in the present, and "adapted" puts it in the past.
3. b_architecture.tex:5, "we replace the 2-dimensional depthwise ... and reduce the proposed kernel size": right. Both verbs describe what was done and become "replaced" and "reduced".
4. b_architecture.tex:21, "we embed the input's positional information": right. A Methodology action, now "embedded".
5. b_architecture.tex:21, "we replace the conventional sequence position": right. A Methodology action, now "replaced".
6. b_architecture.tex:21, "we compute the vector of intervals": right. A Methodology action, now "computed".
7. b_architecture.tex:26, "prepend" and "and, finally, obtain positional encodings": right. Both verbs at the start of line 26 continue the procedure and become "prepended" and "obtained".
8. b_architecture.tex:34, "we add the positional encodings": right. A Methodology action, now "added".
9. b_architecture.tex:39, "We feed the input sequence through the encoder $G$ and select the last hidden state": right. Both verbs become past ("fed", "selected").
10. b_architecture.tex:44, "we feed it through a pooling layer": right. A Methodology action, now "fed".
11. c_variants.tex:1, "we introduce four variants of HCCNet": right. The authors' introduction of the variants is a Methodology action, now "introduced".
12. c_variants.tex:10, "we additionally introduce HCCNet-C (compact)": right. Same verb, same section, now "introduced".
13. d_pretraining.tex:1, "we therefore design two (self-)supervised pre-training tasks": right. A design step of the method, now "designed".
14. d_pretraining.tex:3, "this study extends the self-supervised DINO pre-training framework": right. What the study did is in the present, and "extended" puts it in the past.
15. d_pretraining.tex:8, "which are cropped from the original image and used as input": right. A procedure in the passive present, now "were cropped".
16. d_pretraining.tex:8, "we exploit the abundance of natural variation": right. A Methodology action, now "exploited".
17. d_pretraining.tex:10, "we randomly shuffle 50\% of the input sequences": right. A procedure step, now "shuffled".
18. d_pretraining.tex:10, "we actually randomly shuffle 66\% of sequences": right. The footnote at line 10 describes the same procedure and becomes "shuffled".
19. d_pretraining.tex:10, "We apply the sigmoid function ... and learn to identify": right. Both verbs become "applied" and "learned".
20. d_pretraining.tex:15, "we reconcile", "are replicated", "is then fine-tuned": right. All three verbs of the stem expansion describe what was done and become past.
21. e_finetuning.tex:1, "we initialize the parameters of HCCNet": right. A Methodology action, now "initialized".
22. e_finetuning.tex:1, "we append the final pooling layer ... and fine-tune the model": right. Both verbs become past.
23. a_data.tex:1, "This complete co-availability allows us": right. This describes what the data allowed in this study, now "allowed".
24. a_data.tex:3, "we include all available data": right. A data-handling step, now "included".
25. a_data.tex:3, "We partition the patient cohort": right. A procedure step, now "partitioned".
26. a_data.tex:3, "is repeated independently for each fold": right. A procedure in the passive present, now "was repeated".
27. b_implementation.tex:1, "We train the CNN over 32000 training steps": right. An implementation step, now "trained".
28. b_implementation.tex:1, "We employ the same cosine decay ... but only apply it": right. Both verbs become past.
29. b_implementation.tex:1, "we also limit the temperature ... and increase": right. Both verbs become "limited" and "increased".
30. b_implementation.tex:3, "While MRI scans are assumed ..., pre-training of the Transformer encoder considers": right. Both clauses describe the procedure and become past.
31. b_implementation.tex:3, "apply dropout ..., and employ the same optimizer": right. Both verbs become "applied" and "employed".
32. b_implementation.tex:5, "we update HCCNet": right. A fine-tuning step, now "updated".
33. b_implementation.tex:5, "We fine-tune the model over 400 training steps" and "but decrease the weight decay": right. Both verbs become past.
34. b_implementation.tex:5, "we select the batch size" and "and apply no further hyperparameter tuning": right. Both verbs become past.
35. b_implementation.tex:5, "we then train HCCNet" and "and evaluate it on the corresponding held-out fold": right. Both verbs become past.
36. b_implementation.tex:7, "we establish a baseline": right. A Methodology action, now "established".
37. b_implementation.tex:7, "we equally train the baseline": right. A Methodology action, now "trained".
38. b_implementation.tex:7, "We employ the same optimizer" and "but slightly increase the learning rate warm-up": right. Both verbs become past.
39. b_implementation.tex:9, "we additionally evaluate a set of exploratory multi-modal configurations": right. A Methodology action, now "evaluated".
40. b_implementation.tex:9, "we naively concatenate the series": right. A procedure step, now "concatenated".
41. b_implementation.tex:9, "we restrict the fusion experiments": right. A design decision of the study, now "restricted".
42. b_implementation.tex:11, "we further disentangle": right. A Methodology action, now "disentangled".
43. b_implementation.tex:11, "we evaluate two intermediate configurations": right. A Methodology action, now "evaluated".
44. b_implementation.tex:11, "We conduct this ablation": right. A Methodology action, now "conducted".
45. c_evaluation.tex:1, "we evaluate HCCNet's baseline": right. An evaluation-protocol step, now "evaluated".
46. c_evaluation.tex:1, "we train ten independently seeded models ... and average their predicted probabilities": right. Both verbs become past.
47. c_evaluation.tex:6, "we evaluate the models' respective calibration": right. An evaluation-protocol step, now "evaluated".
48. c_evaluation.tex:8, "we therefore refrain from drawing conclusions" and "and treat such cases as performance ties": right. Both describe the protocol the study applied and become past.
49. d_results.tex:5, "is markedly stronger on AUROC" and "the two are comparable": right. Both report measured results and become "was" and "were".
50. d_results.tex:5, "the combined modality nonetheless remains the weakest": right. A reported result, now "remained".
51. d_results.tex:9, "we explore the impact of varying model complexity": right. An action reported in Results, now "explored".
52. d_results.tex:9, "This robustness is tightest on AUROC": right. A measured result, now "was".
53. d_results.tex:9, "No model variant falls consistently below the diagonal line.": right. A reported result, now "fell".
54. d_results.tex:15, "the magnitude of the improvement from our proposed approach varies": right. A reported result, now "varied".
55. d_results.tex:19, "we compare the reliability": right. An action reported in Results, now "compared".
56. d_results.tex:19, "consistently show the lowest expected calibration error" and "display the highest expected calibration error": right. Both report results and become past.
57. d_results.tex:21, "This reduction is largest", "reaches 37.0\%", "and is smallest at 12.1\%": right. All three verbs report measured reductions and become past.
58. d_results.tex:25, "we evaluate whether naively fusing": right. An action reported in Results, now "evaluated".
59. d_results.tex:25, "which reaches AUPRC = 0.588": right. A measured result, now "reached".
60. d_results.tex:25, "As all differences fall within one standard deviation": right. A measured result, now "fell".
61. d_results.tex:29, "pre-training only the CNN backbone recovers essentially all" and "pre-training only the Transformer encoder yields AUPRC = 0.310": right. Both report ablation results and become past.
62. 1_conv_layer.tex:3, "we inflate the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduce": right. This is the method appendix, and both verbs become past.
63. 2_augmentations.tex:1, "we randomly shift and scale the intensity", "apply random 90 degree rotations", "and randomly flip the cropped view": right. All three describe the augmentation procedure and become past.
64. 2_augmentations.tex:1, "we use the same data augmentation strategy": right. A procedure in the method appendix, now "used".
65. 1_baseline.tex:3, "consistently display the highest detection rate": right. A result in appendix B (Additional Results), now "displayed".
66. 2_reliability.tex:3, "consistently display the lowest average reliability scores": right. A result in appendix B, now "displayed".
67. 2_reliability.tex:3, "HCCNet fine-tuned using diffusion weighted MRIs display the lowest ... while models ... exhibit the highest": right. Both verbs report results in appendix B and become "displayed" and "exhibited".

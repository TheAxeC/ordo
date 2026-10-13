# Marks of manuscript marker 2

Agent a497a69fded97a0ab, ordo-high, served claude-opus-5-5: 214918 tokens, 41 tool uses, 11.0 min (657755 ms). The text below is its final message, verbatim apart from character names.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/6-run/manuscript-report.md

I read the report, the prose standard, SKILL.md, rules.md, registers.md and all 33 draft files, each one whole. The only command I ran on the draft was a grep that prints line numbers and matched words for SSL, DINO, patchify and stem. It shows that "SSL" appears only at 1_baseline.tex:3 and "stem" appears only at d_pretraining.tex:15, where the draft never defines it.

Totals: 197 findings, entries and splits marked; 179 are right and 18 are wrong.

== Limitations and alternative interpretations ==
1. abstract.tex:3, "Our results show that HCCNet substantially improves...": wrong (4). The hedge rewrites "providing a reliable tool for" as "could support", which drops the claim "reliable tool" instead of changing only the device, and it stacks two devices ("suggests ... could").
2. d_results.tex:21, "More interestingly, the comparison...": right. "More interestingly" is cut, "average" is added, the HCCNet-F exception (0.182 to 0.204) is taken from Table results_reliability, and the verbs are put in the Results past.
3. d_results.tex:19, "Figure \ref{fig:calibration} shows consistently lower...": right. On per-variant ECE the order fails (0.146 against 0.131 and 0.145), and the replacement states the average and brackets that limit.
4. discussion.tex:10, "Thus, even for imaging modalities...": wrong (4). The "which suggests the value..." clause now follows the although-clause, so the replacement says that the ECE rise suggests the framework's value, a relation the draft does not make.
5. discussion.tex:12, "An ablation that pre-trains only...": right. Table results_pretrain_ablation holds the claim only for DW-MRI and T1 DCE-MRI, and the replacement states that limit.
6. conclusion.tex:1, "Beyond the original framework, an ablation...": right. It is the same claim with the same limit, and it fits with the replacement in finding 5.
7. introduction.tex:11, "Additionally, the Transformer encoder is pre-trained...": right. The bracketed limit (0.307 to 0.457, and 0.308 to 0.310) stands in the ablation table.

== Hedging ==
1. abstract.tex:5, "The methodological approach presented...": right. This is an untested generalization, and weak devices fit it.
2. abstract.tex:5, "Its ability to handle varying...": wrong (4). It gives a moderate device ("suggests") for a generalization to chronic diseases that the group line itself says was never tested, while findings 1, 3 and 4 use weak devices for the same generalization.
3. introduction.tex:13, "Thus, HCCNet provides a flexible framework...": right. Weak devices fit the untested adaptability claim.
4. conclusion.tex:1, "The methodology is versatile and offers...": right. It is weak, and it matches section D finding 25.
5. d_results.tex:5, "The combined T1 IOP \& T2-MRI modality reaches...": wrong (4). It swaps "indicating" for "which suggests", which the Hedging table places at the same moderate strength, so the reported break is not ended.
6. discussion.tex:10, "Inspection of the models' reliability diagrams...": right. The strong device becomes moderate, the unmeasured mechanism gets "may" and an evidence bracket.
7. discussion.tex:12, "We attribute this to the limited number...": right. The replacement hedges the attribution, names what "this" refers to, and splits the two ideas, and it fits section D finding 23.

== Evidence for claims ==
1. a_longitudinal_analysis.tex:1, "To date, deep learning applications...": right. The claim has no citation, and the bracket replaces "predominately" with the share and its citation.
2. a_longitudinal_analysis.tex:1, "However,  physicians usually assess...": wrong (4). It cuts "usually" and offers "the clinical guideline that prescribes it" as an alternative to the share, and with that alternative the claim reads as universal.
3. a_longitudinal_analysis.tex:5, "To mitigate this shortcoming, our study uses...": right. The ranking claim has no citation.
4. b_pretraining.tex:1, "While the temporal relationship...": right. "Scarcely explored" has no citation or count.
5. b_pretraining.tex:3, "Among them, contrastive learning approaches...": right. The examples that follow do not support "most commonly applied".
6. introduction.tex:7, "Likewise, most deep learning applications...": right. The claim has no citation, and "most" becomes a share bracket.
7. c_variants.tex:10, "Deviating from the head dimension of 128...": right. The draft shows no data for "no adverse effect on convergence".
8. discussion.tex:12, "Our augmentation strategy exposes the backbone...": right. "Richest for diffusion-weighted imaging" has no evidence, and the bracket asks for an alternative explanation.

== registers.md, What the reader looks for (Medicine and Health) ==
1. a_data.tex:1, "We evaluate HCCNet on data that is retrospectively...": right. The methods name no reporting guideline, and Medicine and Health is a defensible register for a clinical prediction study in Intelligent Medicine with clinical co-authors.

== Vague language ==
1. b_pretraining.tex:1, "Using the potential abundance of unlabeled data, some...": right. It is the "some researchers" row, and the studies are named from the draft's own citations.
2. b_pretraining.tex:1, "As a result, many deep learning studies...": right. It is the "many studies" row.
3. introduction.tex:7, "However, many existing approaches...": right. It is the "many studies" row.
4. a_longitudinal_analysis.tex:7, "Likewise, many of them disregard...": right. It is the "many studies" row.
5. a_longitudinal_analysis.tex:1, "As a result, longitudinal imaging has long been...": right. "many" and "recent studies" become brackets for named branches and studies with their citations and dated span.

== Prose standard, section A, vague qualifiers ==
1. abstract.tex:1, "where early detection can considerably influence...": right. "considerably" becomes a bracket for the measured amount.
2. introduction.tex:1, "However, despite its potential, the development...": right. "significant" becomes a bracket for the specific obstacle, and the citation is kept.
3. introduction.tex:5, "Traditional approaches often simplify...": right. "often" becomes a share bracket.
4. introduction.tex:5, "However, this method has limitations...": wrong (4). It cuts "often" and offers "the dataset sizes" as an alternative to the share, and with that alternative "datasets are small" reads as universal.
5. discussion.tex:8, "Overall, fine-tuned model results varied substantially...": wrong (4). The stated range of 0.429 to 0.614 does not hold for the T1 IOP-MRI and T2-MRI modalities that Table finetuned_results reports (values 0.315 to 0.494 and 0.351 to 0.573, averages below 0.429), and the replacement does not bracket that limit.
6. discussion.tex:6, "Despite being long established as the gold standard...": right. "many branches" becomes a bracket, and the missing citation is added.
7. 2_reliability.tex:3, "As for the comparison across performance metrics...": right. "predominantly" becomes an extent bracket in the Results past.
8. figures/cumulative_gain.tex:10, "Generally, lower MAE values indicate...": right. By the MAE definition in c_evaluation.tex the claim holds in every case, and the finding names that definition.

== Most specific term ==
1. discussion.tex:8, "Our proposed pre-training approach improved model performance by up to 147.1\%...": right. 147.1%, 48.9% and 52.3% are AUPRC figures in the draft, and "substantial" becomes those numbers.

== Terms defined at first use ==
1. introduction.tex:11, "The CNN backbone is pre-trained using an extended version of the DINO framework...": right. This is the first use, the draft never expands DINO, and the replacement adds the expansion.
2. b_architecture.tex:5, "Additionally, we reimplement the patchify layer...": wrong (4). The definition brings in "stem convolution", and the draft never defines "stem" (it appears only at d_pretraining.tex:15).
3. 1_baseline.tex:3, "Overall differences between imaging modalities are however...": right. This is the only use of SSL, and it is replaced by "self-supervised". The ranges 0.228 to 0.375 and 0.592 to 0.724 stand in Table results_base.

== Prose standard, section D, No synonym cycling ==
1. CNN backbone:
 - b_architecture.tex:5, "\textbf{CNN Feature Extractor.}": right.
 - b_architecture.tex:7, "The CNN feature extractor takes the MR images": right.
 - b_architecture.tex:14, "we concatenate the image embeddings obtained from the CNN feature extractor": right.
 - d_pretraining.tex:3, "\textbf{CNN Feature Extractor.}": right.
 - d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed": right.
 - 2_augmentations.tex:1, "During pre-training of the CNN feature extractor": right.
 - tables/results_pretrain_ablation.tex:27, "pre-trains the CNN feature extractor using DINO": right. It fits section D finding 35.
2. model variant:
 - c_variants.tex:1, "The five model variations are:": right.
 - c_evaluation.tex:1, "For the comparison across model variations": right.
 - d_results.tex:5, "stratified by imaging modality and model architecture": right.
 - d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent...": right.
 - d_results.tex:9, "\textbf{Comparison across Model Variations.}": right.
 - d_results.tex:15, "stratified by image modality and model variation": right.
 - 1_baseline.tex:3, "stratified by image modality and model variation": right.
 - 2_reliability.tex:3, "stratified by imaging modality and model architecture": right.
3. imaging modality:
 - d_results.tex:15, "That is, although baseline model results vary only gradually...": right.
 - "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change": wrong (1, 4). The entry quotes no passage, and its replacement is a reference to other entries.
 - figures/cumulative_gain.tex:10, "across three MRI types": right.
 - figures/calibration.tex:10, "across three MRI modalities": right.

== Transitions ==
1. d_results.tex:15, "Finally, we evaluate the impact...": right. Two result subsections follow, so the sequence relation "finally" claims does not hold, and the replacement cuts it.

== Clear antecedents ==
1. abstract.tex:1, "To address this, we propose HCCNet...": wrong (4). The finding names the sentence-length rule, but the first sentence it writes runs to 28 words, and the description of the architecture could stand as its own sentence.
2. introduction.tex:1, "This is especially relevant in conditions like hepatocellular carcinoma...": right. It names the subject of the sentence before and replaces "considerably" with a bracket.
3. d_pretraining.tex:8, "This teaches the model to identify the same patient...": right.
4. d_pretraining.tex:15, "This transfers the pre-trained representation...": right.
5. 3_hyperparams.tex:3, "This is due to convergence issues...": right. It fits section D finding 27.
6. 2_reliability.tex:3, "That is despite that baseline models...": right. It fits section D finding 28.

== registers.md, Voice ==
1. discussion.tex:6, "To support HCCNet's capability...": right. This is a decision of the authors.
2. a_data.tex:1, "In total, 963 MRI examinations were included in the study": right. Inclusion is a decision of the authors.
3. discussion.tex:16, "Despite these successes, several challenges and limitations were identified.": wrong (4). It cuts "several" without giving the number, although the draft lists the challenges in the sentences that follow, and without a bracket.

== Formality (a sentence with two ideas) ==
1. conclusion.tex:1, "Additionally, exploring the integration of multi-modal data...": right. The sentence joins two claims with a contrast, and the parts left after section D finding 25 hold three sentences each.

== Prose standard, section C ==
1. d_results.tex:3, "We report HCCNet's fine-tuned performance (i)...": right. The sentence announces what the section does, and the replacement is "delete".
2. d_results.tex:11, "Across imaging modalities, the models are thus robust...": right. The recapping opener is cut, and the result fits section E finding 1.
3. b_implementation.tex:1, "As aforementioned, we pre-train both...": right.
4. d_pretraining.tex:8, "Note that in our implementation, we use a 3D crop...": right. It fits section D finding 7.
5. d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder...": right.
6. 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training...": right.

== Prose standard, section E ==
1. d_results.tex:11, "At least on the data evaluated in this study...": right. It is a restating close, and the replacement is "delete".
2. c_evaluation.tex:8, "Since all metrics are obtained through cross-validation, we note...": wrong (4). The third sentence it writes ("The reported standard deviations should therefore...") runs to 28 words, outside the sentence-length rule the finding names.
3. d_pretraining.tex:3, "Accordingly, we define a student $F_s$...": wrong (4). The sentences it writes run to about 24 and 29 words, and the parenthetical "(i.e., ... respectively)" need not stay in the second one, so the rule the finding names is still broken.

== Prose standard, section D, paragraphs ==
1. abstract.tex:3, "The CNN backbone is pre-trained... / We demonstrate the effectiveness...": right.
2. introduction.tex:13, "This application not only demonstrates... / The methodological approach...": right.
3. a_longitudinal_analysis.tex:3, "While the approach is relatively simple... / Studies investigating treatment effects...": right. The second part has four sentences on one idea.
4. a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end... / Compared to the aforementioned approaches...": right.
5. b_pretraining.tex:3, "As such, they randomly derive... / \cite{jamaludin...}, for example...": right.
6. a_problem_formulation.tex:1, "Since the frequency of liver screenings... / As such, the data of each patient...": right.
7. d_pretraining.tex:8 (first break), "Note that in our implementation... / Besides that...": right.
8. d_pretraining.tex:8 (second break), "Specifically, we treat different series... / For a view cropped...": right.
9. d_pretraining.tex:15, "Likewise, we concatenate the different series... / Provided a sequence of DW-MRI's...": right.
10. a_data.tex:1, "Prior to pre-training and fine-tuning... / All examinations included...": wrong (4). The first part holds four sentences plus the guideline sentence that the registers finding adds, five in all, and no further split is given.
11. a_data.tex:3 (first break), "During fine-tuning we additionally exclude... / To obtain robust performance estimates...": right.
12. a_data.tex:3 (second break), "The folds are stratified by HCC outcome... / Each fold serves...": right.
13. a_data.tex:3 (third break), "Because pre-training is re-run... / As before, to avoid leakage...": right.
14. b_implementation.tex:1, "During the first 5\% of training steps... / After reaching its maximum value...": right.
15. b_implementation.tex:9, "Concretely, we evaluate the full fusion... / As during single-modality pre-training...": right.
16. c_evaluation.tex:1, "Every reported metric is computed... / For evaluation, we employ...": right.
17. d_results.tex:5, "Contrast enhanced T1 weighted and the combination... / The two contrasts that make up...": right.
18. d_results.tex:9, "As such, Figure \ref{fig:cumulative_gain} plots... / Across model variants and imaging modalities...": right.
19. d_results.tex:19 (first break), "Extended reliability metrics are presented... / For the fine-tuned models, the plots largely align...": right.
20. d_results.tex:19 (second break), "Figure \ref{fig:calibration} shows consistently lower... / For the randomly initialized baseline...": right. It fits Limitations finding 3.
21. d_results.tex:25, "None of the fused configurations exceeds... / Adding T1 DCE-MRI to DW-MRI...": right.
22. d_results.tex:29, "The CNN-backbone dominance also holds... / For the combined T1 in- and out-of-phase...": right.
23. discussion.tex:12, "An ablation that pre-trains only... / Finally, our exploratory multi-modal experiments...": right. It fits Limitations finding 5 and Hedging finding 7.
24. discussion.tex:18, "Incorporating these data sources... / In addition, the study's focus on a single cohort...": right.
25. conclusion.tex:1 (first break), "Exploratory experiments further showed... / The methodology is versatile...": right. It fits Hedging finding 4.
26. 2_augmentations.tex:1, "Contrarily, during pre-training of the Transformer encoder... / Apart from the alternating cropping approach...": right.
27. 3_hyperparams.tex:3, "This is due to convergence issues... / Consequently, we drastically reduced...": right.
28. 2_reliability.tex:3, "That is despite that baseline models... / Contrarily, for the fine-tuned models...": right.
29. figures/cumulative_gain.tex:10, "Optimal robustness is presented... / The Mean Absolute Error (MAE) quantifies...": right.
30. figures/calibration.tex:10, "The x-axis represents confidence levels... / Optimal calibration, where predicted confidence...": right.
31. tables/results_finetune.tex:42, "Second best results are underlined. / DW-MRI comprises...": right.
32. tables/results_base_vs_pre.tex:42, "Second best results are underlined. / DW-MRI comprises...": right.
33. tables/results_baseline.tex:42, "Second best results are underlined. / DW-MRI comprises...": right.
34. tables/results_fusion.tex:21, "The within-contrast augmentation restriction... / Performance metrics range...": right.
35. tables/results_pretrain_ablation.tex:27, "``CNN backbone only'' pre-trains... / AUPRC and AUROC values range...": right.
36. tables/results_reliability.tex:32 (first break), "ECE represents the expected... / All metrics are presented...": right.
37. tables/results_reliability.tex:32 (second break), "Second best results are underlined. / DW-MRI comprises...": right.

== Prose standard, section A, filler and flagged terms ==
1. b_pretraining.tex:3, "Instead of simply comparing view pairs...": right. "simply" is banned as filler.
2. b_pretraining.tex:5, "adopts a simple sequence-order-prediction task": right. "simple" is banned as filler.
3. d_pretraining.tex:10, "this study employs a simple binary sequence-order-prediction (SOP) task": right.
4. b_implementation.tex:3, "...an abbreviated pre-training protocol of just 8000 training steps": wrong (2). This "just" is a genuine claim that the protocol is minimal (only 8000 steps, against 32000), which section A says stays.
5. a_data.tex:3, "robust performance estimates": right. "reliable" comes from the rules table, and it fits section D finding 11.

== Tense per section (each entry right unless stated) ==
1. b_architecture.tex:3, "We use the CNN backbone": right.
2. b_architecture.tex:5, "we adapt the ConvNeXt architecture": right.
3. b_architecture.tex:5, "we replace the 2-dimensional depthwise...": right.
4. b_architecture.tex:21, "we embed the input's positional information": right.
5. b_architecture.tex:21, "we replace the conventional sequence position": right.
6. b_architecture.tex:21, "we compute the vector of intervals": right.
7. b_architecture.tex:26, "prepend"; "and, finally, obtain positional encodings": right.
8. b_architecture.tex:34, "we add the positional encodings": right.
9. b_architecture.tex:39, "We feed the input sequence through the encoder $G$...": right.
10. b_architecture.tex:44, "we feed it through a pooling layer": right.
11. c_variants.tex:1, "we introduce four variants of HCCNet": right.
12. c_variants.tex:10, "we additionally introduce HCCNet-C (compact)": right.
13. d_pretraining.tex:1, "we therefore design two (self-)supervised...": right.
14. d_pretraining.tex:3, "this study extends the self-supervised DINO...": right.
15. d_pretraining.tex:8, "which are cropped from the original image...": right.
16. d_pretraining.tex:8, "we exploit the abundance of natural variation": right.
17. d_pretraining.tex:10, "we randomly shuffle 50\% of the input sequences": right.
18. d_pretraining.tex:10, "we actually randomly shuffle 66\% of sequences": right.
19. d_pretraining.tex:10, "We apply the sigmoid function...": right.
20. d_pretraining.tex:15, "we reconcile the differing input dimensionality"; "the learned stem filters are replicated"; "which is then fine-tuned end to end": right.
21. e_finetuning.tex:1, "we initialize the parameters of HCCNet": right.
22. e_finetuning.tex:1, "we append the final pooling layer...": right.
23. a_data.tex:1, "This complete co-availability allows us": right.
24. a_data.tex:3, "we include all available data": right.
25. a_data.tex:3, "We partition the patient cohort": right.
26. a_data.tex:3, "is repeated independently for each fold": right.
27. b_implementation.tex:1, "We train the CNN over 32000 training steps": right.
28. b_implementation.tex:1, "We employ the same cosine decay...": right.
29. b_implementation.tex:1, "we also limit the temperature of the teacher network...": right.
30. b_implementation.tex:3, "While MRI scans are assumed to be i.i.d....": right.
31. b_implementation.tex:3, "apply dropout with probability $p = 0.2$...": right.
32. b_implementation.tex:5, "we update HCCNet": right.
33. b_implementation.tex:5, "We fine-tune the model over 400 training steps"; "but decrease the weight decay": right.
34. b_implementation.tex:5, "we select the batch size"; "and apply no further hyperparameter tuning": right.
35. b_implementation.tex:5, "we then train HCCNet"; "and evaluate it on the corresponding held-out fold": right.
36. b_implementation.tex:7, "we establish a baseline": right.
37. b_implementation.tex:7, "we equally train the baseline": right.
38. b_implementation.tex:7, "We employ the same optimizer"; "but slightly increase the learning rate warm-up": right.
39. b_implementation.tex:9, "we additionally evaluate a set of exploratory...": right.
40. b_implementation.tex:9, "we naively concatenate the series": right.
41. b_implementation.tex:9, "we restrict the fusion experiments": right.
42. b_implementation.tex:11, "we further disentangle": right.
43. b_implementation.tex:11, "we evaluate two intermediate configurations": right.
44. b_implementation.tex:11, "We conduct this ablation": right.
45. c_evaluation.tex:1, "we evaluate HCCNet's baseline": right.
46. c_evaluation.tex:1, "we train ten independently seeded models...": right.
47. c_evaluation.tex:6, "we evaluate the models' respective calibration": right.
48. c_evaluation.tex:8, "we therefore refrain from drawing conclusions"; "and treat such cases as performance ties": right.
49. d_results.tex:5, "is markedly stronger on AUROC"; "the two are comparable": right.
50. d_results.tex:5, "the combined modality nonetheless remains the weakest": right.
51. d_results.tex:9, "we explore the impact of varying model complexity": right.
52. d_results.tex:9, "This robustness is tightest on AUROC": right.
53. d_results.tex:9, "No model variant falls consistently below the diagonal line.": right.
54. d_results.tex:15, "the magnitude of the improvement from our proposed approach varies": right.
55. d_results.tex:19, "we compare the reliability": right.
56. d_results.tex:19, "consistently show the lowest expected calibration error"; "display the highest...": right.
57. d_results.tex:21, "This reduction is largest"; "reaches 37.0\%"; "and is smallest at 12.1\%": right.
58. d_results.tex:25, "we evaluate whether naively fusing": right.
59. d_results.tex:25, "which reaches AUPRC = 0.588": right.
60. d_results.tex:25, "As all differences fall within one standard deviation": right.
61. d_results.tex:29, "pre-training only the CNN backbone recovers essentially all"; "...yields AUPRC = 0.310": right.
62. 1_conv_layer.tex:3, "we inflate the 2D depthwise and pointwise...": right.
63. 2_augmentations.tex:1, "we randomly shift and scale the intensity"; "apply random 90 degree rotations"; "and randomly flip the cropped view": right.
64. 2_augmentations.tex:1, "we use the same data augmentation strategy": right.
65. 1_baseline.tex:3, "consistently display the highest detection rate": right.
66. 2_reliability.tex:3, "consistently display the lowest average reliability scores": right.
67. 2_reliability.tex:3, "HCCNet fine-tuned using diffusion weighted MRIs display...": right.

== Prose standard, section F, source formatting ==
1. ack.tex:2, "... op basis van MRI-radiomics" / "Primair leverkanker (hepatocellulair ...": wrong (4). The replacement leaves out "(hepatocellulair", one of the quoted words it must write on one line.
2. ack.tex:6, "... (OpenAI ChatGPT) to help" / "refine the English language ...": wrong (4). The replacement leaves out "(OpenAI ChatGPT)", one of the quoted words it must write on one line.
3. ack.tex:7, "... reviewed and edited the" / "content as needed ...": right.

Groups with no line, or whose line does not name what the reader of this draft loses:
- references/rules.md, "Formality": the line says where the external-validation clause sits in the sentence but does not say what the reader misreads or misses because of that.
- Prose standard, section C: the line describes the breaks ("a sentence that announces or recaps ... a 'Note that' that adds nothing") rather than naming a cost to the reader.
- Prose standard, section A, filler and flagged terms: the line restates the rule ("a word that adds nothing"), names no loss, and calls only "simple" and "just" softeners although the group also holds "simply" and "robust".

Findings with no quoted passage, no replacement, or a replacement given as an instruction or a reference:
- Synonym cycling, item 3, the entry "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change": it has no quoted passage, and its replacement is a reference to item 2.

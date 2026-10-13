# Reasons of manuscript marker 2, given on its resume

Agent a497a69fded97a0ab, resumed once by the session (repair round 1 of step 6, ruling 3) for the marks its first message gave without a reason. Resume usage: 276105 tokens in total after the resume, 31 tool uses (30 Read and the hand-back), 1.9 min (112218 ms). It changed no mark. The text below is its final message, verbatim apart from character names.

Clear antecedents
- 3, d_pretraining.tex:8, "This teaches the model...": right. "This" stands alone after the sentence on sampling series, and the replacement names that sampling with a determiner and its noun ("Sampling among these series"), which the rule allows.
- 4, d_pretraining.tex:15, "This transfers the pre-trained representation...": right. "This" stands alone after the sentence on replicating the stem filters, and the replacement names that act ("Replicating the stem filters") in words the draft uses, not with another pronoun.

Section C
- 3, b_implementation.tex:1, "As aforementioned, we pre-train both...": right. "As aforementioned" opens the paragraph by pointing back to a_data.tex:3, which already said the development set is used for pre-training, and the replacement deletes that opener and keeps the claim, as section C says.
- 5, d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder...": right. "Note that" is a variant of the openers section C deletes ("It should be noted that"), and the replacement cuts it, keeps the whole claim and puts it in the Methodology past.
- 6, 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training...": right. The replacement cuts the "Note that" opener and keeps the claim and its citation, and it does not conflict with Clear antecedents finding 5 or section D finding 27 on the next sentence.

Section D, "No synonym cycling"
- Term 1, b_architecture.tex:5, "\textbf{CNN Feature Extractor.}": right. The heading names the part that the paragraph under it calls "the CNN backbone", and the replacement uses that one term.
- Term 1, b_architecture.tex:7, "The CNN feature extractor takes the MR images as inputs": right. The equation note at line 12 calls the same F "the CNN backbone", and the replacement uses that term.
- Term 1, b_architecture.tex:14, "we concatenate the image embeddings obtained from the CNN feature extractor and prepend": right. The phrase stands at line 14, the replacement uses "CNN backbone", and its Methodology past stands in for the tense entry the Tense list leaves out.
- Term 1, d_pretraining.tex:3, "\textbf{CNN Feature Extractor.}": right. The paragraph under the heading opens "For the CNN backbone", and the replacement makes the heading match it.
- Term 1, d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed and initialize them": right. The phrase stands at line 10, and the replacement uses "CNN backbone" and the Methodology past.
- Term 1, 2_augmentations.tex:1, "During pre-training of the CNN feature extractor, we randomly crop two global views": right. The phrase stands at line 1, and the replacement uses "CNN backbone" and the Methodology past without touching the rest of the sentence.
- Term 2, c_variants.tex:1, "The five model variations are:": right. The same sentence calls the four non-base models "variants", and the replacement uses "variants" for all five.
- Term 2, c_evaluation.tex:1, "For the comparison across model variations, we also explore...": right. The phrase stands at line 1, and the replacement uses "model variants" and the Methodology past.
- Term 2, d_results.tex:5, "stratified by imaging modality and model architecture": right. "model architecture" here names the HCCNet variants shown in Table finetuned_results, and the replacement uses "model variant".
- Term 2, d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent...": right. The sentence stands whole at line 5, and the replacement changes only "model architectures" to "model variants" and the verb to the Results past.
- Term 2, d_results.tex:9, "\textbf{Comparison across Model Variations.}": right. The paragraph under the heading says "model variant", and the replacement makes the heading match it.
- Term 2, d_results.tex:15, "stratified by image modality and model variation": right. The phrase stands at line 15, and the replacement ends both term-2 and term-3 cycling ("imaging modality", "model variant").
- Term 2, 1_baseline.tex:3, "stratified by image modality and model variation": right. The phrase stands at line 3, and the replacement uses both chosen terms.
- Term 2, 2_reliability.tex:3, "stratified by imaging modality and model architecture": right. The phrase stands at line 3, and the replacement uses "model variant".
- Term 3, d_results.tex:15, "That is, although baseline model results vary only gradually across image modalities...": right. The sentence stands whole at line 15, and the replacement changes "image modalities" to "imaging modalities" and puts the verbs in the Results past, with every number kept.
- Term 3, figures/cumulative_gain.tex:10, "across three MRI types": right. "MRI types" names the three imaging modalities listed in the brackets, and the replacement uses the draft's term.
- Term 3, figures/calibration.tex:10, "across three MRI modalities": right. The phrase names the same three groups, and the replacement uses "imaging modalities".

Section D, paragraphs
- 1, abstract.tex:3, "The CNN backbone is pre-trained... / We demonstrate the effectiveness...": right. The paragraph has five sentences, and the split leaves two (the method) and three (the application and results).
- 2, introduction.tex:13, "This application not only demonstrates... / The methodological approach...": right. The paragraph has six sentences, the split leaves three and three, and the cut "considerably" becomes a bracket for the measured amount.
- 4, a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end... / Compared to the aforementioned approaches...": right. The paragraph has six sentences, the split leaves three and three, and "typically" becomes a share bracket, so no universal claim is added.
- 5, b_pretraining.tex:3, "As such, they randomly derive different views... / \cite{jamaludin...}, for example...": right. The paragraph has six sentences, and the split leaves three on contrastive learning in general and three on the two cited studies.
- 6, a_problem_formulation.tex:1, "Since the frequency of liver screenings... / As such, the data of each patient...": right. The paragraph has five sentences, the split leaves two and three, and "typically" becomes a share bracket.
- 7, d_pretraining.tex:8 (first break), "Note that in our implementation... / Besides that...": right. The paragraph has eight sentences, the first part keeps two, and the first sentence's text matches Section C finding 4.
- 8, d_pretraining.tex:8 (second break), "Specifically, we treat different series... / For a view cropped...": right. Together with finding 7, the split leaves parts of two, three and three sentences, both sentences are written out whole, and only the tense changes.
- 9, d_pretraining.tex:15, "Likewise, we concatenate the different series... / Provided a sequence of DW-MRI's...": right. Counting the "where" clause carried over from the equation, the paragraph has six sentences, and the split leaves three and three.
- 11, a_data.tex:3 (first break), "During fine-tuning we additionally exclude... / To obtain robust performance estimates...": right. Together with findings 12 and 13, the ten-sentence paragraph splits into parts of two, three, three and two, and "reliable" matches filler finding 5.
- 12, a_data.tex:3 (second break), "The folds are stratified by HCC outcome... / Each fold serves...": right. Both sentences stand at line 3 and are written out whole in the Methodology past, and the parts they leave keep three sentences or fewer.
- 13, a_data.tex:3 (third break), "Because pre-training is re-run... / As before, to avoid leakage...": right. Both sentences are written out whole in the past, and the last part holds two sentences.
- 14, b_implementation.tex:1, "During the first 5\% of training steps... / After reaching its maximum value...": right. The paragraph has six sentences, and the split leaves three and three, with the definition of b kept in the present.
- 15, b_implementation.tex:9, "Concretely, we evaluate the full fusion... / As during single-modality pre-training...": right. The paragraph has five sentences, and the split leaves three and two.
- 16, c_evaluation.tex:1, "Every reported metric is computed... / For evaluation, we employ...": right. Up to the equation the paragraph has five sentences, and the split leaves three and two.
- 17, d_results.tex:5, "Contrast enhanced T1 weighted and the combination... / The two contrasts that make up...": right. The seven-sentence paragraph splits into three and four, and the second part keeps to one idea, the constituent contrasts, so it stays within roughly four sentences.
- 18, d_results.tex:9, "As such, Figure \ref{fig:cumulative_gain} plots... / Across model variants...": right. The paragraph has five sentences, and the split leaves two and three.
- 19, d_results.tex:19 (first break), "Extended reliability metrics are presented... / For the fine-tuned models, the plots largely align...": right. Together with finding 20, the seven-sentence paragraph splits into three, two and two, and the cut "largely" becomes a bracket for the extent.
- 21, d_results.tex:25, "None of the fused configurations exceeds... / Adding T1 DCE-MRI to DW-MRI...": right. The paragraph has five sentences, the split leaves three and two, and every number is kept.
- 22, d_results.tex:29, "The CNN-backbone dominance also holds... / For the combined T1 in- and out-of-phase...": right. The paragraph has five sentences, the split leaves three and two, and every number is kept.
- 24, discussion.tex:18, "Incorporating these data sources... / In addition, the study's focus on a single cohort...": right. The paragraph holds two ideas, the extra clinical data and the single-cohort limit, and the split separates them.
- 26, 2_augmentations.tex:1, "Contrarily, during pre-training of the Transformer encoder... / Apart from the alternating cropping approach...": right. The paragraph has five sentences, and the split leaves two and three.
- 27, 3_hyperparams.tex:3, "This is due to convergence issues... / Consequently, we drastically reduced...": right. The paragraph has five sentences, the split leaves three and two, and the first sentence matches Clear antecedents finding 5.
- 28, 2_reliability.tex:3, "That is despite that baseline models... / Contrarily, for the fine-tuned models...": right. The six-sentence paragraph splits into four (with no sentence added) and two, and the first sentence matches Clear antecedents finding 6.
- 29, figures/cumulative_gain.tex:10, "Optimal robustness is presented... / The Mean Absolute Error (MAE) quantifies...": right. The figure note has five sentences, and the split leaves three and two.
- 30, figures/calibration.tex:10, "The x-axis represents confidence levels... / Optimal calibration, where predicted confidence...": right. The figure note has five sentences, and the split leaves two and three.
- 31, tables/results_finetune.tex:42, "Second best results are underlined. / DW-MRI comprises...": right. The table note has eight sentences, and the split leaves four on metrics and four on modality definitions.
- 32, tables/results_base_vs_pre.tex:42, "Second best results are underlined. / DW-MRI comprises...": right. The table note has seven sentences, and the split leaves four and three.
- 33, tables/results_baseline.tex:42, "Second best results are underlined. / DW-MRI comprises...": right. The table note has eight sentences, and the split leaves four and four.
- 34, tables/results_fusion.tex:21, "The within-contrast augmentation restriction... / Performance metrics range...": right. The table note has six sentences, and the split leaves two on configuration and four on metrics.
- 35, tables/results_pretrain_ablation.tex:27, "``CNN backbone only'' pre-trains... / AUPRC and AUROC values range...": right. The table note has five sentences, the split leaves three and two, and the first sentence carries synonym term 1's "CNN backbone".
- 36, tables/results_reliability.tex:32 (first break), "ECE represents the expected... / All metrics are presented...": right. Together with finding 37, the eight-sentence note splits into two, three and three.
- 37, tables/results_reliability.tex:32 (second break), "Second best results are underlined. / DW-MRI comprises...": right. Both sentences stand at line 32 and are written out whole with an empty line between them.

Section A, filler and flagged terms
- 3, d_pretraining.tex:10, "this study employs a simple binary sequence-order-prediction (SOP) task": right. Section A bans "simple" with no exception, and the replacement cuts it, keeping "binary" and the SOP definition.

Tense per section
- 1, b_architecture.tex:3, "We use the CNN backbone": right. This is a Methodology sentence on what the authors did, put in the past.
- 2, b_architecture.tex:5, "we adapt the ConvNeXt architecture": right. This is a Methodology action, put in the past.
- 3, b_architecture.tex:5, "we replace the 2-dimensional depthwise...": right. Both verbs of this Methodology action are put in the past.
- 4, b_architecture.tex:21, "we embed the input's positional information": right. This is a Methodology action, put in the past.
- 5, b_architecture.tex:21, "we replace the conventional sequence position": right. This is a Methodology action, put in the past.
- 6, b_architecture.tex:21, "we compute the vector of intervals": right. This is a Methodology action, put in the past.
- 7, b_architecture.tex:26, "prepend"; "and, finally, obtain positional encodings": right. Both verbs carry on the past-tense "we computed" from line 21 and are put in the past.
- 8, b_architecture.tex:34, "we add the positional encodings": right. This is a Methodology action, put in the past.
- 9, b_architecture.tex:39, "We feed the input sequence through the encoder $G$...": right. Both verbs are put in the past.
- 10, b_architecture.tex:44, "we feed it through a pooling layer": right. This is a Methodology action, put in the past.
- 11, c_variants.tex:1, "we introduce four variants of HCCNet": right. This is a Methodology action, put in the past.
- 12, c_variants.tex:10, "we additionally introduce HCCNet-C (compact)": right. This is a Methodology action, put in the past.
- 13, d_pretraining.tex:1, "we therefore design two (self-)supervised...": right. This is a Methodology action, put in the past.
- 14, d_pretraining.tex:3, "this study extends the self-supervised DINO...": right. This is a Methodology action, put in the past.
- 15, d_pretraining.tex:8, "which are cropped from the original image and used as input": right. This is a procedure in the Methodology, put in the past.
- 16, d_pretraining.tex:8, "we exploit the abundance of natural variation": right. This is a Methodology action, put in the past.
- 17, d_pretraining.tex:10, "we randomly shuffle 50\% of the input sequences": right. This is a Methodology action, put in the past.
- 18, d_pretraining.tex:10, "we actually randomly shuffle 66\% of sequences": right. This Methodology action is in the footnote at line 10 and is put in the past.
- 19, d_pretraining.tex:10, "We apply the sigmoid function...": right. Both verbs are put in the past.
- 20, d_pretraining.tex:15, "we reconcile the differing input dimensionality"; "the learned stem filters are replicated"; "which is then fine-tuned end to end": right. All three clauses of this sentence describe the procedure and are put in the past.
- 21, e_finetuning.tex:1, "we initialize the parameters of HCCNet": right. This is a Methodology action, put in the past.
- 22, e_finetuning.tex:1, "we append the final pooling layer... and fine-tune the model": right. Both verbs are put in the past.
- 23, a_data.tex:1, "This complete co-availability allows us": right. This is the Methodology data description, put in the past.
- 24, a_data.tex:3, "we include all available data": right. This is a Methodology action, put in the past.
- 25, a_data.tex:3, "We partition the patient cohort": right. This is a Methodology action, put in the past.
- 26, a_data.tex:3, "is repeated independently for each fold": right. This is a procedure, put in the past.
- 27, b_implementation.tex:1, "We train the CNN over 32000 training steps": right. This is a Methodology action, put in the past.
- 28, b_implementation.tex:1, "We employ the same cosine decay... but only apply it": right. Both verbs are put in the past.
- 29, b_implementation.tex:1, "we also limit the temperature... and increase": right. Both verbs are put in the past.
- 30, b_implementation.tex:3, "While MRI scans are assumed to be i.i.d....": right. Both clauses describe what the procedure did and are put in the past.
- 31, b_implementation.tex:3, "apply dropout with probability $p = 0.2$, and employ the same optimizer": right. Both verbs carry on "We set" and are put in the past.
- 32, b_implementation.tex:5, "we update HCCNet": right. This is a Methodology action, put in the past.
- 33, b_implementation.tex:5, "We fine-tune the model over 400 training steps"; "but decrease the weight decay": right. Both verbs of one sentence are put in the past.
- 34, b_implementation.tex:5, "we select the batch size"; "and apply no further hyperparameter tuning": right. Both verbs are put in the past.
- 35, b_implementation.tex:5, "we then train HCCNet"; "and evaluate it on the corresponding held-out fold": right. Both verbs are put in the past.
- 36, b_implementation.tex:7, "we establish a baseline": right. This is a Methodology action, put in the past.
- 37, b_implementation.tex:7, "we equally train the baseline": right. This is a Methodology action, put in the past.
- 38, b_implementation.tex:7, "We employ the same optimizer"; "but slightly increase the learning rate warm-up": right. Both verbs are put in the past.
- 39, b_implementation.tex:9, "we additionally evaluate a set of exploratory multi-modal configurations": right. This is a Methodology action, put in the past.
- 40, b_implementation.tex:9, "we naively concatenate the series": right. This is a Methodology action, put in the past.
- 41, b_implementation.tex:9, "we restrict the fusion experiments": right. This is a Methodology action, put in the past.
- 42, b_implementation.tex:11, "we further disentangle": right. This is a Methodology action, put in the past.
- 43, b_implementation.tex:11, "we evaluate two intermediate configurations": right. This is a Methodology action, put in the past.
- 44, b_implementation.tex:11, "We conduct this ablation": right. This is a Methodology action, put in the past.
- 45, c_evaluation.tex:1, "we evaluate HCCNet's baseline": right. This is a Methodology action, put in the past.
- 46, c_evaluation.tex:1, "we train ten independently seeded models... and average their predicted probabilities": right. Both verbs are put in the past.
- 47, c_evaluation.tex:6, "we evaluate the models' respective calibration": right. This is a Methodology action, put in the past.
- 48, c_evaluation.tex:8, "we therefore refrain from drawing conclusions"; "and treat such cases as performance ties": right. Both verbs describe the analysis rule that was applied and are put in the past.
- 49, d_results.tex:5, "is markedly stronger on AUROC"; "the two are comparable": right. This is a Results finding, put in the past.
- 50, d_results.tex:5, "the combined modality nonetheless remains the weakest": right. This is a Results finding, put in the past.
- 51, d_results.tex:9, "we explore the impact of varying model complexity": right. This is a Results sentence on what was done, put in the past.
- 52, d_results.tex:9, "This robustness is tightest on AUROC": right. This is a Results finding, put in the past.
- 53, d_results.tex:9, "No model variant falls consistently below the diagonal line.": right. This is a Results finding, put in the past.
- 54, d_results.tex:15, "the magnitude of the improvement from our proposed approach varies": right. This is a Results finding, put in the past.
- 55, d_results.tex:19, "we compare the reliability": right. This is a Results action, put in the past.
- 56, d_results.tex:19, "consistently show the lowest expected calibration error"; "display the highest expected calibration error": right. Both verbs of this Results sentence are put in the past.
- 57, d_results.tex:21, "This reduction is largest"; "reaches 37.0\%"; "and is smallest at 12.1\%": right. All three verbs of this Results sentence are put in the past, with the numbers kept.
- 58, d_results.tex:25, "we evaluate whether naively fusing": right. This is a Results action, put in the past.
- 59, d_results.tex:25, "which reaches AUPRC = 0.588": right. This is a Results finding, put in the past.
- 60, d_results.tex:25, "As all differences fall within one standard deviation": right. This is a Results finding, put in the past.
- 61, d_results.tex:29, "pre-training only the CNN backbone recovers essentially all"; "...yields AUPRC = 0.310": right. Both Results verbs are put in the past.
- 62, 1_conv_layer.tex:3, "we inflate the 2D depthwise and pointwise... and reduce": right. These are the appendix implementation (Methodology) verbs, put in the past.
- 63, 2_augmentations.tex:1, "we randomly shift and scale the intensity"; "apply random 90 degree rotations"; "and randomly flip the cropped view": right. All verbs of this Methodology sentence are put in the past.
- 64, 2_augmentations.tex:1, "we use the same data augmentation strategy": right. This is a Methodology action, put in the past.
- 65, 1_baseline.tex:3, "consistently display the highest detection rate": right. This is an appendix Results finding, put in the past.
- 66, 2_reliability.tex:3, "consistently display the lowest average reliability scores": right. This is an appendix Results finding, put in the past.
- 67, 2_reliability.tex:3, "HCCNet fine-tuned using diffusion weighted MRIs display...": right. Both verbs of this appendix Results sentence are put in the past.

Section F
- 3, ack.tex:7, "... reviewed and edited the" / "content as needed ...": right. Line 7 ends with "reviewed and edited the" and line 8 starts with "content as needed", and the replacement writes all the quoted words on one line with a space where the line broke.

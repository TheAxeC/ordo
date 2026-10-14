Manuscript marker 1, reply to its resume in repair round 1: agent a8f3e0b981dc00ca4, served claude-opus-5-5 as ordo-high, 333087 tokens in total, 18 tool uses, 2.6 min. The resume named the group 9 entries it marked right, by their position in the Methodology and Results lists, and held no words of the report. The reasons below are the agent's final message, verbatim apart from character names.

These are the reasons for every group 9 entry I marked right. All marks stay as they were.

To check them, I re-read with the file-reading tool, this turn, the report's lines 300-426 and the 13 draft files the entries cite: a_longitudinal_analysis, b_architecture, c_variants, d_pretraining, e_finetuning, a_data, b_implementation, c_evaluation, 1_conv_layer, 2_augmentations, d_results, 1_baseline and 2_reliability. I also re-read the rows of tables results_reliability, results_baseline and results_fusion where a reason rests on a number.

The rows of rules.md "Tense per section" that apply:
- **Literature review, reporting findings:** past.
- **Methodology:** past. This covers sections 3 and 4.1 to 4.3 and appendix A.
- **Results:** past. This covers section 4.4 and appendix B.

The rows not covered here are the ones I marked wrong: Methodology 56, 57 and 67, and Results 5, 10, 16, 24, 26 and 29.

=== Methodology list ===

**Methodology 1.** a_longitudinal_analysis.tex:3, "it has been shown to not fully explore".
- The phrase stands at line 3, in the sentence citing dammuDeepLearningPrediction2023. Section 2 is the literature review, and the sentence reports a cited study's finding. The row that applies is "Literature review, reporting findings", which is past. The present perfect "has been shown" is not that tense.
- "it was shown not to fully explore" ends the break. Moving "not" before "to" changes no claim, and nothing else in the phrase breaks a rule.
- The entry sits under the report's "Methodology" heading, but the row that applies is also past.

**Methodology 2.** a_longitudinal_analysis.tex:5, "they have been successfully employed".
- The phrase stands at line 5. It reports what the cited studies did (leeDeepLearningDriven2022 through dadsetanDeepLearningLongitudinal2022): the literature review row for reporting findings, which is past. The present perfect is out of that row.
- "they were successfully employed" ends it. "successfully" is not a size word, and no other rule breaks.

**Methodology 3.** b_architecture.tex:3, "We use the CNN backbone".
- The phrase stands at line 3, section 3.2. It says how this study's model was built: the Methodology row, which is past. "use" is present.
- "We used the CNN backbone" ends it. The phrase holds no other break.

**Methodology 4.** b_architecture.tex:5, "we adapt the ConvNeXt architecture".
- The phrase stands at line 5. It describes the authors' adaptation step in section 3.2, under the Methodology row (past), so "adapt" is out of tense.
- "we adapted" ends it, with nothing else changed.

**Methodology 5.** b_architecture.tex:5, "we replace the 2-dimensional depthwise convolutional layers".
- The phrase stands at line 5. It is a change the authors made to ConvNeXt, a Methodology step (past), so "replace" is out of tense.
- "we replaced" ends it, and the phrase holds no other break.

**Methodology 6.** b_architecture.tex:5, "and reduce the proposed kernel size".
- The phrase stands at line 5. It is a kernel-size change made in the study, Methodology (past), so "reduce" is present.
- "and reduced" ends it, with nothing else changed.

**Methodology 7.** b_architecture.tex:14, "we concatenate the image embeddings obtained from the CNN feature extractor and prepend".
- The phrase stands at line 14. It is the sequence-construction step of section 3.2, Methodology (past). Both "concatenate" and "prepend" are present.
- "concatenated ... and prepended" ends both, with no other change.

**Methodology 8.** b_architecture.tex:21, "we embed the input's positional information".
- The phrase stands at line 21. It is an encoding step done in the study, Methodology (past), so "embed" is present.
- "we embedded" ends it, and the phrase holds no other break.

**Methodology 9.** b_architecture.tex:21, "we replace the conventional sequence position".
- The phrase stands at line 21. It is the authors' design step for the irregular intervals, Methodology (past), so "replace" is present.
- "we replaced" ends it.

**Methodology 10.** b_architecture.tex:21, "we compute the vector of intervals".
- The phrase stands at line 21, before the equation at lines 22-24. It is a computation the study performed, Methodology (past), so "compute" is present.
- "we computed" ends it.

**Methodology 11.** b_architecture.tex:26, "prepend".
- The verb stands at line 26 ("\noindent prepend ..."). It continues the line-21 sentence whose subject is "we": the cls-interval step, Methodology (past). "prepend" is present.
- "prepended" ends it and keeps the clause's grammar with "computed".

**Methodology 12.** b_architecture.tex:26, "and, finally, obtain positional encodings".
- The phrase stands at line 26. It is the last step of the same "we" sentence, Methodology (past), so "obtain" is present.
- "obtained" ends it, and "finally" is a sequence transition that fits.

**Methodology 13.** b_architecture.tex:34, "we add the positional encodings".
- The phrase stands at line 34. It is the input-assembly step, Methodology (past), so "add" is present.
- "we added" ends it.

**Methodology 14.** b_architecture.tex:39, "We feed the input sequence through the encoder $G$ and select".
- The phrase stands at line 39. These are the forward-pass steps the authors describe for their model, Methodology (past). "feed" and "select" are present.
- "fed ... and selected" ends both. $G$ is kept.

**Methodology 15.** b_architecture.tex:44, "we feed it through a pooling layer".
- The phrase stands at line 44. It is the head step of the model the study built, Methodology (past), so "feed" is present.
- "we fed it" ends it. "it" has its antecedent, the [cls] token's final hidden state, in the same sentence.

**Methodology 16.** c_variants.tex:1, "we introduce four variants of HCCNet".
- The phrase stands at line 1, section 3.3. It says what the authors built, Methodology (past), so "introduce" is present.
- "we introduced" ends it, and the phrase holds no other break.

**Methodology 17.** c_variants.tex:10, "we additionally introduce HCCNet-C (compact)".
- The phrase stands at line 10. It is the custom variant the authors added, Methodology (past), so "introduce" is present.
- "we additionally introduced" ends it. This sentence is a different one from finding 3.10's.

**Methodology 18.** d_pretraining.tex:1, "we therefore design two (self-)supervised pre-training tasks".
- The phrase stands at line 1, section 3.4. It is the authors' task design, Methodology (past), so "design" is present.
- "we therefore designed" ends it. "therefore" keeps its cause relation to the two sentences before.

**Methodology 19.** d_pretraining.tex:3, "we define a student $F_s$".
- The phrase stands at line 3. It is the network setup of this study's pre-training, Methodology (past), so "define" is present.
- "we defined" ends it.

**Methodology 20.** d_pretraining.tex:3, "we learn to match".
- The phrase stands at line 3. It is the training objective applied in the study, Methodology (past), so "learn" is present.
- "we learned to match" ends it. This sentence is a different one from finding 7.2's.

**Methodology 21.** d_pretraining.tex:8, "we exploit the abundance of natural variation".
- The phrase stands at line 8. It is the augmentation choice made in the study, Methodology (past), so "exploit" is present.
- "we exploited" ends it.

**Methodology 22.** d_pretraining.tex:8, "we treat different series".
- The phrase stands at line 8. It is how the study used series as augmentations, Methodology (past), so "treat" is present.
- "we treated" ends it. Finding 13.9 gives the same verb change, so the two can be applied together.

**Methodology 23.** d_pretraining.tex:8, "we randomly sample one series".
- The phrase stands at line 8, in the DW-MRI clause. It is a sampling step performed, Methodology (past), so "sample" is present.
- "we randomly sampled" ends it, and agrees with 13.9.

**Methodology 24.** d_pretraining.tex:8, "we sample among the pre- and post-contrast phases".
- The phrase stands at line 8, in the T1 DCE-MRI clause. It is a sampling step performed, Methodology (past), so "sample" is present.
- "we sampled" ends it, and agrees with 13.9.

**Methodology 25.** d_pretraining.tex:8, "we sample within a single contrast family".
- The phrase stands at line 8, in the T1 IOP & T2-MRI clause. It is the same kind of procedure step, Methodology (past), and "sample" is present.
- "we sampled" ends it, and agrees with 13.9.

**Methodology 26.** d_pretraining.tex:10, "we randomly shuffle 50\% of the input sequences".
- The phrase stands at line 10. It is the SOP setup done in the study, Methodology (past), so "shuffle" is present.
- "we randomly shuffled" ends it, and the 50% is kept.

**Methodology 27.** d_pretraining.tex:10, "we actually randomly shuffle 66\% of sequences".
- The phrase stands in the footnote at line 10. It gives the effective share of the same procedure step, Methodology (past), so "shuffle" is present.
- "we actually randomly shuffled" ends it. "actually" contrasts 66% with the nominal 50%, so it carries a fact, and it is not a filler word that section A lists.

**Methodology 28.** d_pretraining.tex:10, "and task the model".
- The phrase stands at line 10. It is the SOP objective set in the study, Methodology (past), so "task" is present.
- "and tasked the model" ends it.

**Methodology 29.** d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed and initialize them".
- The phrase stands at line 10. These are the SOP training settings, Methodology (past). "keep" and "initialize" are present.
- "kept ... initialized" ends both.

**Methodology 30.** d_pretraining.tex:10, "We apply the sigmoid function".
- The phrase stands at line 10. It is a step of the SOP training, Methodology (past), so "apply" is present.
- "We applied" ends it, and agrees with 13.10.

**Methodology 31.** d_pretraining.tex:10, "and learn to identify shuffled sequences".
- The phrase stands at line 10. It is the SOP learning step, Methodology (past), so "learn" is present.
- "and learned" ends it, and agrees with 13.10.

**Methodology 32.** d_pretraining.tex:15, "we concatenate the different series".
- The phrase stands at line 15. It is the encoder-input construction, Methodology (past), so "concatenate" is present.
- "we concatenated" ends it.

**Methodology 33.** d_pretraining.tex:15, "we reconcile the differing input dimensionality".
- The phrase stands at line 15. It is a step the authors took, Methodology (past), so "reconcile" is present.
- "we reconciled" ends it, and agrees with 13.11. 13.11's own unnamed tense changes are outside this phrase.

**Methodology 34.** d_pretraining.tex:15, "the learned stem filters are replicated".
- The phrase stands at line 15. It is a passive procedure step, Methodology (past, as in the row's example "Data were collected"), so "are replicated" is present.
- "were replicated" ends it. The passive is kept, which fits: the actor is the authors' procedure, and "Voice" gives a procedure the passive.

**Methodology 35.** e_finetuning.tex:1, "we initialize the parameters of HCCNet".
- The phrase stands at line 1, section 3.5. It is the fine-tuning setup, Methodology (past), so "initialize" is present.
- "we initialized" ends it.

**Methodology 36.** e_finetuning.tex:1, "we append the final pooling layer as discussed in \ref{sec:architecture} and fine-tune the model".
- The phrase stands at line 1. These are procedure steps, Methodology (past). "append" and "fine-tune" are present.
- "appended ... fine-tuned" ends both, and the \ref is kept.

**Methodology 37.** a_data.tex:1, "All examinations included in the study comprise".
- The phrase stands at line 1, section 4.1. It describes the data the study collected, Methodology (past, as in "Data were collected"), so "comprise" is present.
- "comprised" ends it, and agrees with 13.12.

**Methodology 38.** a_data.tex:1, "modality groups are available for every patient".
- The phrase stands at line 1. It describes the collected data, Methodology (past), so "are" is present.
- "were available" ends it, and agrees with 13.12.

**Methodology 39.** a_data.tex:3, "we include all available data".
- The phrase stands at line 3. It is a data-selection step, Methodology (past), so "include" is present.
- "we included" ends it.

**Methodology 40.** a_data.tex:3, "we additionally exclude all patients".
- The phrase stands at line 3. It is an exclusion step, Methodology (past), so "exclude" is present.
- "we additionally excluded" ends it, and agrees with 13.13.

**Methodology 41.** a_data.tex:3, "of which 37 develop HCC".
- The phrase stands at line 3. It reports an outcome observed in the cohort within the study period, part of the method's data description (Methodology, past). "develop" is present.
- "developed" ends it, keeps the 37, and agrees with 13.13.

**Methodology 42.** a_data.tex:3, "we evaluate HCCNet using stratified 5-fold cross-validation".
- The phrase stands at line 3. It is the evaluation design used, Methodology (past), so "evaluate" is present.
- "we evaluated" ends it. 11.4 and 13.13 carry the same verb change. The duplication and 11.4's "robust" change lie outside this phrase.

**Methodology 43.** a_data.tex:3, "We partition the patient cohort".
- The phrase stands at line 3. It is the fold construction, Methodology (past), so "partition" is present.
- "We partitioned" ends it.

**Methodology 44.** a_data.tex:3, "The folds are stratified by HCC outcome".
- The phrase stands at line 3. It is a passive procedure step, Methodology (past), so "are stratified" is present.
- "were stratified" ends it, and the passive fits a procedure.

**Methodology 45.** a_data.tex:3, "Each fold serves as the held-out test set".
- The phrase stands at line 3. It describes how the folds were used, Methodology (past), so "serves" is present.
- "served" ends it, and agrees with 13.14.

**Methodology 46.** a_data.tex:3, "the remaining four folds form the development set $D^{\text{dev}}_p$ that is used".
- The phrase stands at line 3. It is the same fold design, Methodology (past). "form" and "is used" are present.
- "formed ... was used" ends both, and agrees with 13.14.

**Methodology 47.** a_data.tex:3, "is repeated independently for each fold".
- The phrase stands at line 3. It describes the pipeline's execution, Methodology (past), so "is repeated" is present.
- "was repeated" ends it, and agrees with 13.14.

**Methodology 48.** a_data.tex:3, "we only fine-tune HCCNet on longitudinal MRIs that are also included".
- The phrase stands at line 3. It is a leakage-control step, Methodology (past). "fine-tune" and "are included" are present.
- "fine-tuned ... were also included" ends both, and agrees with 13.15.

**Methodology 49.** b_implementation.tex:1, "we pre-train both the CNN backbone".
- The phrase stands at line 1, section 4.2. It is a training step, Methodology (past), so "pre-train" is present.
- "we pre-trained" ends it.

**Methodology 50.** b_implementation.tex:1, "We train the CNN over 32000 training steps".
- The phrase stands at line 1. It gives the training schedule run, Methodology (past), so "train" is present.
- "We trained" ends it, and the 32000 is kept.

**Methodology 51.** b_implementation.tex:1, "we linearly increase the learning rate".
- The phrase stands at line 1. It is the warm-up applied, Methodology (past), so "increase" is present.
- "we linearly increased" ends it.

**Methodology 52.** b_implementation.tex:1, "we decay the learning rate".
- The phrase stands at line 1. It is the schedule applied, Methodology (past), so "decay" is present.
- "we decayed" ends it, and agrees with 13.16.

**Methodology 53.** b_implementation.tex:1, "We employ the same cosine decay without warm-up".
- The phrase stands at line 1. It is a setting used, Methodology (past), so "employ" is present.
- "We employed" ends it, and agrees with 13.16.

**Methodology 54.** b_implementation.tex:1, "but only apply it to the weights".
- The phrase stands at line 1. It is the weight-decay setting, Methodology (past), so "apply" is present.
- "but only applied" ends it, and agrees with 13.16. "only" is a scope word that is kept.

**Methodology 55.** b_implementation.tex:1, "we also limit the temperature".
- The phrase stands at line 1. It is a DINO setting changed in the study, Methodology (past), so "limit" is present.
- "we also limited" ends it.

**Methodology 58.** b_implementation.tex:3, "We set the maximal sequence length to $s = 8$, apply dropout with probability $p = 0.2$, and employ".
- The phrase stands at line 3. These are encoder pre-training settings, Methodology (past). "apply" and "employ" are present, and "set" has the same form in both tenses.
- "applied ... employed" ends the break and leaves "set" reading as past. The values are kept.

**Methodology 59.** b_implementation.tex:5, "we update HCCNet".
- The phrase stands at line 5. It is the fine-tuning step, Methodology (past), so "update" is present.
- "we updated" ends it.

**Methodology 60.** b_implementation.tex:5, "We fine-tune the model over 400 training steps".
- The phrase stands at line 5. It is the fine-tuning schedule, Methodology (past), so "fine-tune" is present.
- "We fine-tuned" ends it, and the 400 is kept.

**Methodology 61.** b_implementation.tex:5, "but decrease the weight decay".
- The phrase stands at line 5. It is a setting change, Methodology (past), so "decrease" is present.
- "but decreased" ends it.

**Methodology 62.** b_implementation.tex:5, "we select the batch size".
- The phrase stands at line 5. It is a tuning step, Methodology (past), so "select" is present.
- "we selected" ends it.
- The same sentence's "and apply no further hyperparameter tuning" lies outside the quoted phrase. It is a place the list leaves out, not a defect of this row.

**Methodology 63.** b_implementation.tex:5, "we then train HCCNet".
- The phrase stands at line 5. It is the per-fold training, Methodology (past), so "train" is present.
- "we then trained" ends it.
- The sentence's later "and evaluate it" lies outside the quoted phrase. It is a place the list leaves out, not a defect of this row.

**Methodology 64.** b_implementation.tex:7, "we establish a baseline".
- The phrase stands at line 7. It describes how the baseline was built, Methodology (past), so "establish" is present.
- "we established" ends it.

**Methodology 65.** b_implementation.tex:7, "we equally train the baseline".
- The phrase stands at line 7. It is the baseline training, Methodology (past), so "train" is present.
- "we equally trained" ends it.

**Methodology 66.** b_implementation.tex:7, "We employ the same optimizer".
- The phrase stands at line 7. It is a setting used for the baseline, Methodology (past), so "employ" is present.
- "We employed" ends it.

**Methodology 68.** b_implementation.tex:9, "we additionally evaluate a set of exploratory multi-modal configurations".
- The phrase stands at line 9. It describes the fusion runs, Methodology (past), so "evaluate" is present.
- "we additionally evaluated" ends it.

**Methodology 69.** b_implementation.tex:9, "we naively concatenate the series".
- The phrase stands at line 9. It is the fusion input step, Methodology (past), so "concatenate" is present.
- "we naively concatenated" ends it. "naively" names the method; it is not a size word.

**Methodology 70.** b_implementation.tex:9, "we evaluate the full fusion".
- The phrase stands at line 9. It covers the configurations run, Methodology (past), so "evaluate" is present.
- "we evaluated" ends it.

**Methodology 71.** b_implementation.tex:9, "augmentation views are sampled".
- The phrase stands at line 9. It is a passive procedure, Methodology (past), so "are sampled" is present.
- "were sampled" ends it, and the passive fits a procedure.

**Methodology 72.** b_implementation.tex:11, "we further disentangle the contributions".
- The phrase stands at line 11. It is the ablation design, Methodology (past), so "disentangle" is present.
- "we further disentangled" ends it.

**Methodology 73.** b_implementation.tex:11, "we evaluate two intermediate configurations".
- The phrase stands at line 11. It covers the ablation runs, Methodology (past), so "evaluate" is present.
- "we evaluated" ends it.

**Methodology 74.** b_implementation.tex:11, "We conduct this ablation".
- The phrase stands at line 11. It is the ablation that was run, Methodology (past), so "conduct" is present.
- "We conducted" ends it. "this ablation" is a determiner with its noun.

**Methodology 75.** c_evaluation.tex:1, "we evaluate HCCNet's baseline".
- The phrase stands at line 1, section 4.3. It is the evaluation step, Methodology (past), so "evaluate" is present.
- "we evaluated" ends it.

**Methodology 76.** c_evaluation.tex:1, "we train ten independently seeded models (fifty models in total) and average".
- The phrase stands at line 1. These are the ensemble procedure steps, Methodology (past). "train" and "average" are present.
- "trained ... averaged" ends both, and the counts are kept.

**Methodology 77.** c_evaluation.tex:1, "Every reported metric is computed".
- The phrase stands at line 1. It is a passive procedure, Methodology (past), so "is computed" is present.
- "was computed" ends it, and agrees with 13.17.

**Methodology 78.** c_evaluation.tex:1, "we employ the following performance metrics".
- The phrase stands at line 1. It is the metrics used, Methodology (past), so "employ" is present.
- "we employed" ends it. The list of six metrics after the colon (the issue I raised for 13.17) lies outside this quoted phrase. Agrees with 13.17.

**Methodology 79.** c_evaluation.tex:1, "we also explore the robustness of the model".
- The phrase stands at line 1. It is an analysis step, Methodology (past), so "explore" is present.
- "we also explored" ends it. "robustness" is the draft's own defined term (measured by MAE), so it is not a flagged-term break.

**Methodology 80.** c_evaluation.tex:6, "we evaluate the models' respective calibration".
- The phrase stands at line 6. It is the calibration analysis, Methodology (past), so "evaluate" is present.
- "we evaluated" ends it.

**Methodology 81.** 1_conv_layer.tex:3, "we inflate the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduce".
- The phrase stands at line 3, appendix A. These are block changes made in the study, Methodology (past). "inflate" and "reduce" are present.
- "inflated ... reduced" ends both.

**Methodology 82.** 2_augmentations.tex:1, "we randomly crop two global views".
- The phrase stands at line 1, appendix A. It is the crop procedure, Methodology (past), so "crop" is present.
- "we randomly cropped" ends it.

**Methodology 83.** 2_augmentations.tex:1, "we randomly crop a multi-channel sub-volume".
- The phrase stands at line 1. It is the encoder-stage crop, Methodology (past), so "crop" is present.
- "we randomly cropped" ends it.

**Methodology 84.** 2_augmentations.tex:1, "further augmentations remain consistent across pre-training".
- The phrase stands at line 1. It describes a setting held during the study's procedure, Methodology (past), so "remain" is present.
- "remained" ends it.

**Methodology 85.** 2_augmentations.tex:1, "we randomly shift and scale the intensity by a constant $v$ using probability $p = 1.0$, apply random 90 degree rotations with probability $p = 0.5$, and randomly flip".
- The phrase stands at line 1. These are three augmentation steps, Methodology (past). "shift and scale", "apply" and "flip" are present.
- "shifted and scaled ... applied ... flipped" ends all of them, and the probabilities are kept.

**Methodology 86.** 2_augmentations.tex:1, "we use the same data augmentation strategy".
- The phrase stands at line 1. It is the fine-tuning and baseline setting, Methodology (past), so "use" is present.
- "we used" ends it.

=== Results list ===

**Results 1.** d_results.tex:5, "shows excellent predictive capability".
- The phrase stands at line 5, sentence 2, section 4.4. It reports a finding, Results (past), so "shows" is present.
- "showed" ends it. "excellent" is a quality judgment backed by the numbers in the same sentence, not a size word of section A's kind, and not a flagged term.

**Results 2.** d_results.tex:5, "appear to display less expressive characteristics".
- The phrase stands at line 5. It reports a finding, Results (past), so "appear" is present.
- "appeared to display" ends it. The hedge sits on an interpretation (expressiveness), not on reported data, so Hedging does not cut it. Agrees with 13.18.

**Results 3.** d_results.tex:5, "still maintain a stronger average predictive capability".
- The phrase stands at line 5. It reports a result backed by 0.520/0.805 versus 0.429/0.759, Results (past), so "maintain" is present.
- "still maintained" ends it, and agrees with 13.18.

**Results 4.** d_results.tex:5, "are also evaluated in their own right".
- The phrase stands at line 5. It is a statement in section 4.4 of what was done, Results (past), so "are evaluated" is present.
- "were also evaluated" ends it, and agrees with 13.18.

**Results 6.** d_results.tex:5, "while on AUPRC the two are comparable".
- The phrase stands at line 5. It reports a result (0.419 versus 0.406), Results (past), so "are" is present.
- "were comparable" ends it. "comparable" is the claim itself, not a qualifier on one.

**Results 7.** d_results.tex:5, "The combined T1 IOP \& T2-MRI modality reaches".
- The phrase stands at line 5. It reports a result, Results (past), so "reaches" is present.
- "reached" ends it.

**Results 8.** d_results.tex:5, "so the T2-MRI model alone exceeds it".
- The phrase stands at line 5. It reports a comparison (0.873 versus 0.736), Results (past), so "exceeds" is present.
- "exceeded" ends it. "it" refers to the combined modality, named in the same sentence.

**Results 9.** d_results.tex:5, "the combined modality nonetheless remains the weakest".
- The phrase stands at line 5. It reports a group-level result, Results (past), so "remains" is present.
- "remained" ends it.

**Results 11.** d_results.tex:9, "This robustness is tightest on AUROC".
- The phrase stands at line 9. It reports a finding, Results (past), so "is" is present.
- "was tightest" ends it. "This robustness" is a determiner with its noun. The sentence's "slightly looser" lies outside the quoted phrase.

**Results 12.** d_results.tex:9, "No model variant falls consistently below".
- The phrase stands at line 9. It reports a finding, Results (past), so "falls" is present.
- "fell" ends it. "consistently" here states that no variant was below the line across folds, a precise universal, not a size word.

**Results 13.** d_results.tex:11, "the models are thus robust".
- The phrase stands at line 11. It reports a finding, Results (past), so "are" is present.
- "were thus robust" ends it. "robust" is the draft's defined term (c_evaluation.tex:1), and its statistical sense is exempt.

**Results 14.** d_results.tex:11, "the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating".
- The phrase stands at line 11. It reports a finding, Results (past). "reveal" and "is deviating" are present.
- "revealed ... deviated persistently" ends both. The named synonym-cycling break ("model architecture" for "model variant") also ends. "persistently" states the across-fold claim; it is not a size word.

**Results 15.** d_results.tex:15, "Across imaging modalities, the magnitude of the improvement from our proposed approach varies."
- The sentence stands at line 15. It reports a finding, Results (past), so "varies" is present.
- "varied" ends it, and the sentence holds no other break.

**Results 17.** d_results.tex:19, "the expected calibration error does not display the same negative relationship".
- The phrase stands at line 19. It reports a finding, Results (past), so "does not display" is present.
- "did not display" ends it.

**Results 18.** d_results.tex:19, "consistently show the lowest expected calibration error".
- The phrase stands at line 19. It reports a finding, Results (past), so "show" is present.
- "consistently showed" ends it. "consistently" holds in every case: in tables/results_reliability.tex lines 13-27, the T1 IOP & T2-MRI baseline ECE (0.182-0.206) is the lowest for all five variants. It is therefore a precise universal.

**Results 19.** d_results.tex:19, "display the highest expected calibration error".
- The phrase stands at line 19. It reports a finding, Results (past), so "display" is present.
- "displayed" ends it.

**Results 20.** d_results.tex:21, "This reduction is largest for diffusion weighted MR images at 56.0\%, reaches 37.0\%".
- The phrase stands at line 21. It reports measured reductions, Results (past). "is" and "reaches" are present.
- "was ... reached" ends both, and the numbers are kept.

**Results 21.** d_results.tex:21, "and is smallest at 12.1\%".
- The phrase stands at line 21. It reports a measured reduction, Results (past), so "is" is present.
- "was smallest" ends it, and the 12.1% is kept.

**Results 22.** d_results.tex:25, "None of the fused configurations exceeds this best single modality."
- The sentence stands at line 25. It reports a finding, Results (past), so "exceeds" is present.
- "exceeded" ends it. The claim holds in tables/results_fusion.tex lines 13-16: no fused AUPRC above 0.588, and no fused AUROC above 0.894.

**Results 23.** d_results.tex:25, "Adding T1 DCE-MRI to DW-MRI lowers performance".
- The phrase stands at line 25. It reports a finding (0.535/0.873), Results (past), so "lowers" is present.
- "lowered" ends it.

**Results 25.** d_results.tex:25, "matches DW-MRI alone on AUROC".
- The phrase stands at line 25. It reports a finding (0.894), Results (past), so "matches" is present.
- "matched" ends it.

**Results 27.** d_results.tex:29, "yields AUPRC = 0.310".
- The phrase stands at line 29. It reports a measured value, Results (past), so "yields" is present.
- "yielded" ends it, and the 0.310 is kept.

**Results 28.** d_results.tex:29, "The CNN-backbone dominance also holds".
- The phrase stands at line 29. It reports a finding, Results (past), so "holds" is present.
- "also held" ends it.

**Results 30.** d_results.tex:29, "the two stages contribute comparably".
- The phrase stands at line 29. It reports a finding (0.457 versus 0.447), Results (past), so "contribute" is present.
- "contributed comparably" ends it. "comparably" is the claim itself, not a qualifier on one.

**Results 31.** d_results.tex:29, "These results indicate that".
- The phrase stands at line 29, in section 4.4. The Discussion row (interpreting, present) applies only to the Discussion section, so the Results row (past) applies, and "indicate" is present.
- "These results indicated that" ends it.

**Results 32.** 1_baseline.tex:3, "consistently display the highest detection rate".
- The phrase stands at line 3, appendix B. It reports a finding, Results (past), so "display" is present.
- "consistently displayed" ends it. "consistently" holds: in tables/results_baseline.tex lines 13-37, DW-MRI baseline recall (0.675-0.725) is the highest in every variant.

**Results 33.** 2_reliability.tex:3, "consistently display the lowest average reliability scores".
- The phrase stands at line 3, appendix B. It reports a finding, Results (past), so "display" is present.
- "consistently displayed" ends it. "consistently" is a universal: the T1 IOP & T2-MRI baseline ECE and Brier score are the lowest for all five variants (tables/results_reliability.tex lines 13-27). Its MCE is not the lowest, but that is a content question that no rule of the review covers ("Evidence for claims", last bullet).

**Results 34.** 2_reliability.tex:3, "preceding pre-training establishes a negative relationship".
- The phrase stands at line 3. It reports a finding, Results (past), so "establishes" is present.
- "established" ends it, and agrees with 13.23.

**Results 35.** 2_reliability.tex:3, "HCCNet fine-tuned using diffusion weighted MRIs display the lowest".
- The phrase stands at line 3. It reports a finding, Results (past), so "display" is present.
- "displayed" ends it, and also removes the number disagreement between "HCCNet" and "display".

**Results 36.** 2_reliability.tex:3, "exhibit the highest average reliability metrics".
- The phrase stands at line 3. It reports a finding, Results (past), so "exhibit" is present.
- "exhibited" ends it.

Manuscript marker 2: agent aa83277990558acd9, served claude-opus-5-5 as ordo-high, 213568 tokens, 40 tool uses, 29.4 min. The marks below are the agent's final message, verbatim apart from character names.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/8-run/manuscript-report.md

How I worked: I read the report (lines 1-633), the prose standard, SKILL.md, references/rules.md, references/registers.md and all 33 draft files, each whole, with the file-reading tool. I ran no other command. All draft paths below are given from the manuscript folder. Where a row is marked wrong, the reason names the condition (1-4 of the brief) that fails. For the discipline I accept Medicine and Health (main.tex:38 names the journal Intelligent Medicine; the study is a clinical prediction study), so condition 3 holds wherever a register applies.

=== Group 1, rules.md "Hedging" ===
1.1 abstract:3 "Our results show that HCCNet substantially improves..." WRONG (condition 4). The passage stands. "show" on a single-cohort result needs a hedge, and "substantially" is a vague qualifier. Its range figures, 48.9-106.6% and 12.1-56.0%, are in d_results:15/21. Two problems remain in the replacement:
 (a) It brings the term AUPRC into the abstract in plain prose, not inside a bracket. The draft defines AUPRC only at c_eval:1, so the term is used before its definition, against "Terms defined at first use".
 (b) It states "improves ... reliability" with a limit for one ECE case only. The draft's reliability table (tables/results_reliability.tex) also gives MCE, and MCE rises after fine-tuning for all five T1 DCE-MRI variants (for example 0.679 to 0.748, 0.612 to 0.834) and for most of the others. That limit is not named.
1.2 abstract:3 "We demonstrate the effectiveness of HCCNet..." RIGHT. The passage stands. The strong device on a single-cohort result is replaced by the moderate "indicates", the claim is kept, and the text matches the second sentence of 13.1.
1.3 abstract:5 "The methodological approach presented in this paper is versatile..." RIGHT. The passage stands. This is a generalization the draft never tests. "may be versatile and adaptable" is a weak device that keeps the claim, and it has the same strength as 1.4, 1.7 and 1.8.
1.4 abstract:5 "Its ability to handle varying patient record lengths..." RIGHT. The passage stands. "establishes" becomes "may serve", which hedges the untested generalization to chronic diseases, and the cut of "invaluable" ends the grandiose self-assessment that section 0 bans.
1.5 introduction:13 "By fine-tuning the pre-trained model on this dataset, we demonstrate..." RIGHT. The passage stands. "demonstrate" becomes "obtain results that indicate", a moderate device, the same strength as 1.2 for the same claim.
1.6 introduction:13 "This application not only demonstrates HCCNet's capabilities..." RIGHT. The passage stands. "indicates" hedges the result. "considerably" is cut and replaced by a bracket that names the specific effect. The text matches the first sentence of 13.2.
1.7 introduction:13 "Thus, HCCNet provides a flexible framework..." RIGHT. The passage stands. "may provide" hedges the untested generalization at weak strength, consistent with 1.3, and the text matches 13.3.
1.8 conclusion:1 "The methodology is versatile and offers a framework..." RIGHT. The passage stands. "may be ... may offer" ends the unhedged generalization, and the text matches 13.21.
1.9 discussion:10 "Inspection of the models' reliability diagrams further demonstrated..." WRONG (condition 4). The passage stands, and "suggested" ends the strong device. However, the passage also claims, without a limit, that pre-training "aligned the models closer to the target distribution". The draft's own data hold this only in part: for HCCNet-F on T1 IOP & T2-MRI, ECE goes from 0.182 to 0.204 (tables/results_reliability.tex:23). That is a break of "Limitations and alternative interpretations", which the finding neither names nor fixes.
1.10 discussion:10 "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements..." WRONG (condition 4). The passage stands, and "suggests" plus a limit is the right kind of change. But the limit "on average more reliable" is checked only against ECE. The draft's MCE rises for every T1 DCE-MRI variant, which is one of the modalities the sentence names ("only moderate improvements"). That number does not hold under the stated limit, and it is not named in a bracket.
1.11 discussion:12 "Our augmentation strategy exposes the backbone..." RIGHT. The passage stands. The claim that the variation is richest for DWI has no evidence and is used as an interpretation. "may be" together with the evidence bracket ends both breaks. The fact in the bracket, that T1 DCE-MRI also has four series, comes from the table notes in tables/results_base_vs_pre.tex.
1.12 discussion:12 "We attribute this to the limited number of positive cases..." RIGHT. The passage stands. The causal attribution, which has other possible explanations, becomes "may reflect". The bare "this" becomes "These at most marginal improvements", which names its noun.
1.13 discussion:16 "Additionally, while HCCNet demonstrates strong predictive capabilities..." RIGHT. The passage stands. "the results suggest" is a moderate device, the same strength as 1.5 for the same claim.

=== Group 2, rules.md "Limitations and alternative interpretations" ===
2.1 d_results:21 "More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicates..." RIGHT. The passage stands. The claim is about ECE, and the replacement names the one case where ECE rises (0.182 to 0.204, tables/results_reliability.tex:23). The average ECE does fall in all three groups. The past tense satisfies the Results row.

=== Group 3, rules.md "Evidence for claims" ===
3.1 a_longitudinal_analysis:1 "To date, deep learning applications to medical imaging still predominately consider..." WRONG (condition 4). The passage stands, and the [citation] ends the evidence break. But "predominately" is a vague qualifier of the "mostly" kind. The report itself treats "predominantly" that way in 5.20. The replacement keeps the word, and the finding does not name the qualifier rule.
3.2 a_longitudinal_analysis:1 "However,  physicians usually assess..." RIGHT. The passage stands, double space included. The bracket for the share of assessments, with its citation, replaces "usually" in the allowed form and supplies the source.
3.3 a_longitudinal_analysis:1 "As a result, longitudinal imaging has long been established as the gold standard..." RIGHT. The passage stands. The brackets name the branches of oncology and the dated studies with their citations, which ends the missing evidence, "many" and "recent". I read the "in recent years" row of "Vague language" as covering "recent studies"; a strictly literal reading of that row would fail condition 2. The brackets match 3.4 for the same claim.
3.4 discussion:6 "Despite being long established as the gold standard in many branches of oncology..." RIGHT. The passage stands. It is a second place of the 3.3 claim and gets the same brackets, plus a citation for "understudied".
3.5 a_longitudinal_analysis:5 "To mitigate this shortcoming, our study uses a hybrid model architecture..." RIGHT. The passage stands. The ranking "third most common" has no source, and the bracket supplies one.
3.6 b_pretraining:3 "Among them, contrastive learning approaches remain the most commonly applied..." RIGHT. The passage stands. The ranking claim has no citation, and the bracket supplies one.
3.7 b_pretraining:1 "As a result, many deep learning studies analyzing medical images over time..." RIGHT. The passage stands. The bracket follows the "many studies" row and supplies the evidence.
3.8 introduction:7 "Likewise, most deep learning applications are aimed at detecting a malignancy..." RIGHT. The passage stands. "most" becomes a bracket for the share with its citation, which also supplies the evidence.
3.9 d_pretraining:1 "When training neural networks, task agnostic pre-training has been repeatedly shown..." RIGHT. The passage stands. The claim has no citation, and [citations] at the sentence end supplies them.
3.10 c_variants:10 "Deviating from the head dimension of 128..." RIGHT. The passage stands. "We found ... no adverse effect" has no evidence in the draft, and the bracket names it.

=== Group 4, registers.md "What the reader looks for" ===
4.1 a_data:1 "We evaluate HCCNet on data that is retrospectively collected..." RIGHT. The passage stands. No methods file in the draft names a reporting guideline, which is a break in Medicine and Health. The added bracket sentence ends it, and the past tense ends the Methodology tense break that the finding names.

=== Group 5, prose standard section A, vague qualifiers ===
5.1 abstract:1 "Longitudinal MRI analysis is important..." RIGHT. The passage stands. "considerably" becomes the measured-effect bracket. MRI is used here first and never defined anywhere in the draft, and the replacement defines it.
5.2 introduction:1 "This is especially relevant in conditions like hepatocellular carcinoma..." WRONG (condition 4). The passage stands, and the bracket ends "considerably". But the replacement still opens with the bare "This is". The fix for the antecedent rule is given as an instruction ending in "..." ("begin the sentence with ..."), not as text, so the single replacement does not end every break it names.
5.3 introduction:1 "However, despite its potential, the development of effective predictive models..." RIGHT. The passage stands. "significant", which section A lists, becomes the specific-obstacle bracket with its citation.
5.4 introduction:5 "Traditional approaches often simplify this task..." WRONG (condition 4). The passage stands. The replacement drops "Traditional", a word that sets the scope of the class and that the qualifier rule does not cut, so "[The share of approaches...]" changes the claim's scope.
5.5 introduction:5 "However, this method has limitations, particularly in the medical domain where datasets are often small..." WRONG (condition 4). The passage stands. "often" is cut to "datasets are small [the dataset sizes, with a citation]". That bracket names sizes, not the share of cases, so the claim now reads as true of every medical dataset, which SKILL.md forbids. The "considerably" bracket is correct.
5.6 introduction:7 "However, many existing approaches have not fully explored..." RIGHT. The passage stands. The bracket follows the "many studies" row (the studies with their citations, or their count), and neither option leaves the claim universal.
5.7 a_longitudinal_analysis:5 "Hybrid models can be trained end-to-end, consecutively..." RIGHT. The passage stands. "typically" becomes a bracket for the share of hybrid models. The text matches 13.5.
5.8 a_longitudinal_analysis:7 "Likewise, many of them disregard the irregular time intervals..." RIGHT. The passage stands. "many" becomes a bracket for the number of studies with their citations.
5.9 b_pretraining:1 "Using the potential abundance of unlabeled data, some longitudinal medical imaging studies..." RIGHT. The passage stands. "some" becomes the named studies with their citations, as the "some researchers" row gives.
5.10 a_problem_formulation:1 "Since the frequency of liver screenings is typically determined..." RIGHT. The passage stands. "typically" becomes a bracket for the share of patients, one of the allowed forms.
5.11 b_architecture:5 "Additionally, we reimplement the patchify layer..." WRONG (condition 4). The passage stands. The tense and patchify-definition parts are fine. But "typically encountered in volumetric data" becomes "of volumetric data [the input sizes, with a citation]". The qualifier is cut so that the claim reads as universal, and the bracket names sizes rather than a share.
5.12 b_implementation:9 "Owing to the limited number of positive cases and our finding that model capacity only negligibly affects..." RIGHT. The passage stands. "only negligibly" becomes a range bracket. The T1 DCE-MRI AUPRC range of 0.329 to 0.628 matches tables/results_finetune.tex:18-22. "restricted" ends the Methodology tense break.
5.13 d_results:11 "This corresponds with the results presented in Table..." RIGHT. The passage stands. "only negligibly" becomes the range bracket, the bare "This" becomes "This absence of consistent differences", and the past tense satisfies the Results row.
5.14 d_results:11 "At least on the data evaluated in this study, variations in model complexity do thus not considerably influence..." RIGHT. The passage stands. "considerably" becomes a range bracket, and the tense becomes past.
5.15 d_results:15 "That is, although baseline model results vary only gradually across image modalities..." RIGHT. The passage stands. "only gradually" becomes a range bracket. "still substantial" is cut where the sentence itself gives the figures. "image" becomes "imaging", and the tense becomes past. The percentages match the draft.
5.16 discussion:8 "Overall, fine-tuned model results varied substantially across imaging modalities." RIGHT. The passage stands. "substantially" becomes the draft's averages, 0.614, 0.520 and 0.429 from d_results:5, under the names the draft uses.
5.17 discussion:8 "Our proposed pre-training approach improved model performance by up to 147.1%..." RIGHT. The passage stands. "substantial improvements" becomes 48.9% and 52.3% from d_results:15.
5.18 c_evaluation:8 "Since all metrics are obtained through cross-validation, we note that..." WRONG (condition 4). The passage stands, and the cuts of "we note that", "the majority" and "slightly" are correct. But "consecutive folds share" becomes "any two folds share". That changes a scope word that none of the named rules asks to change.
5.19 1_baseline:3 "Overall differences between imaging modalities are however far less pronounced..." RIGHT. The passage stands. "generally" is cut on the strength of tables/results_baseline.tex, where every baseline AUROC is between 0.592 and 0.724, and the finding names those data. SSL is defined, and the tense becomes past.
5.20 2_reliability:3 "As for the comparison across performance metrics depicted in Table..." WRONG (condition 4). The passage stands. The bracket offers an alternative joined by "or" (the ECE range across modalities against the range across variants). Once the author supplies it, "were driven by imaging modality rather than model complexity" stands with no share, so the claim reads as universal.
5.21 3_hyperparams:3 "Consequently, we drastically reduced the projection head's output dimensionality..." RIGHT. The passage stands. "drastically" becomes a bracket for the starting dimensionality, which is the size of the change.

=== Group 6, rules.md "Terms defined at first use" ===
6.1 abstract:1 "To address this, we propose HCCNet..." WRONG (condition 4). The passage stands, and CNN and "this" are fixed. But the passage also holds "ConvNeXt" at its first use, and ConvNeXt is never defined anywhere in the draft; b_architecture:3 only cites it. By the standard the report applies to DINO (6.2) and Pre-LN (6.3), that is a further break, and the finding does not name it.
6.2 introduction:11 "The CNN backbone is pre-trained using an extended version of the DINO framework..." RIGHT. The passage stands. This is the first use of DINO, it is undefined, and the definition bracket ends the break.
6.3 b_architecture:14 "The Transformer encoder is based on the Pre-LN implementation..." RIGHT. The passage stands. This is the first use of Pre-LN, it is undefined, and the bracket ends the break.
6.4 b_implementation:3 "While MRI scans are assumed to be i.i.d. during CNN pre-training..." RIGHT. The passage stands. i.i.d. is undefined and is spelled out, and the past tense ends the Methodology break.

=== Group 7, registers.md "Voice" ===
7.1 a_problem_formulation:1 "This study aims to define a mapping function $f$" WRONG (condition 4). The passage stands, and "We" ends the third-person break. But the replacement also changes the tense ("aimed") and has no "Also breaks: Tense per section" line, whereas 7.2-7.4 name that rule for the same change.
7.2 d_pretraining:3 "For the CNN backbone, this study extends..." RIGHT. The passage stands. "we extended" ends both the third-person actor and the Methodology present tense, which the finding names.
7.3 d_pretraining:8 "Besides that, our implementation also proposes..." RIGHT. The passage stands. "we also proposed" ends the personified artifact, the voice break and the tense break. The text matches 13.8.
7.4 d_pretraining:10 "To improve the encoder's understanding of disease progression, this study employs a simple..." RIGHT. The passage stands. "we employed" plus the cut of "simple" ends all three named breaks, and the SOP definition is kept.
7.5 discussion:6 "Therefore, this study developed HCCNet..." RIGHT. The passage stands. "we developed" ends the third-person actor.
7.6 discussion:6 "To support HCCNet's capability..., a step-wise model training approach was adopted." RIGHT. The passage stands. The authors' decision now takes "we adopted".

=== Group 8, rules.md "Clear antecedents" ===
8.1 d_pretraining:8 "This teaches the model to identify the same patient..." RIGHT. The passage stands. "This augmentation strategy" names the noun.
8.2 d_pretraining:15 "This transfers the pre-trained representation..." RIGHT. The passage stands. "This stem expansion" names the operation of the sentence before ("expanding the pre-trained single-channel stem").
8.3 3_hyperparams:3 "This is due to convergence issues..." RIGHT. The passage stands. "This deviation" names the antecedent.
8.4 2_reliability:3 "That is despite that baseline models..." RIGHT. The passage stands. "That ranking" names the ranking in the sentence before, the past tense satisfies Results, and the text matches 13.23.

=== Group 9, rules.md "Tense per section" (each entry: the passage stands at the line given unless stated) ===
Methodology list:
- a_longitudinal_analysis:3 "it has been shown to not fully explore" RIGHT on the four conditions. This is a literature finding, whose row is past, so "was shown" ends the break, even though the list files it under a "Methodology" heading. The same passage is given again in 11.1 (see the duplicates list).
- a_longitudinal_analysis:5 "they have been successfully employed" RIGHT. It reports other studies' findings, the row is past, and "were" ends the break. The heading is mislabelled, as above.
- b_architecture:3 "We use the CNN backbone" RIGHT. A procedure in the present; "used" ends it.
- b_architecture:5 "we adapt the ConvNeXt architecture" RIGHT. The procedure is in the present; "adapted" ends it.
- b_architecture:5 "we replace the 2-dimensional depthwise convolutional layers" RIGHT. The present procedure becomes "replaced".
- b_architecture:5 "and reduce the proposed kernel size" RIGHT. "reduced" ends the break.
- b_architecture:14 "we concatenate ... and prepend" RIGHT. Both verbs become past.
- b_architecture:21 "we embed the input's positional information" RIGHT. "embedded" ends the break.
- b_architecture:21 "we replace the conventional sequence position" RIGHT. "replaced" ends the break.
- b_architecture:21 "we compute the vector of intervals" RIGHT. "computed" ends the break.
- b_architecture:26 "prepend" RIGHT. The single verb after \noindent stands; "prepended" ends the break.
- b_architecture:26 "and, finally, obtain positional encodings" RIGHT. "obtained" ends the break.
- b_architecture:34 "we add the positional encodings" RIGHT. "added" ends the break.
- b_architecture:39 "We feed the input sequence through the encoder $G$ and select" RIGHT. Both verbs become past.
- b_architecture:44 "we feed it through a pooling layer" RIGHT. "fed" ends the break.
- c_variants:1 "we introduce four variants of HCCNet" RIGHT. "introduced" ends the break.
- c_variants:10 "we additionally introduce HCCNet-C (compact)" RIGHT. "introduced" ends the break.
- d_pretraining:1 "we therefore design two (self-)supervised pre-training tasks" RIGHT. "designed" ends the break.
- d_pretraining:3 "we define a student $F_s$" RIGHT. "defined" ends the break.
- d_pretraining:3 "we learn to match" RIGHT. "learned" ends the break.
- d_pretraining:8 "we exploit the abundance of natural variation" RIGHT. "exploited" ends the break.
- d_pretraining:8 "we treat different series" RIGHT. "treated" ends the break, consistent with 13.9.
- d_pretraining:8 "we randomly sample one series" RIGHT. "sampled" ends the break, consistent with 13.9.
- d_pretraining:8 "we sample among the pre- and post-contrast phases" RIGHT. Past, consistent with 13.9.
- d_pretraining:8 "we sample within a single contrast family" RIGHT. Past, consistent with 13.9.
- d_pretraining:10 "we randomly shuffle 50% of the input sequences" RIGHT. "shuffled" ends the break.
- d_pretraining:10 "we actually randomly shuffle 66% of sequences" RIGHT. This is the footnote on that line; "shuffled" ends the break.
- d_pretraining:10 "and task the model" RIGHT. "tasked" ends the break.
- d_pretraining:10 "we keep the parameters ... fixed and initialize them" RIGHT. Both verbs become past.
- d_pretraining:10 "We apply the sigmoid function" RIGHT. "applied" ends the break, consistent with 13.10.
- d_pretraining:10 "and learn to identify shuffled sequences" RIGHT. "learned" ends the break, consistent with 13.10.
- d_pretraining:15 "we concatenate the different series" RIGHT. "concatenated" ends the break.
- d_pretraining:15 "we reconcile the differing input dimensionality" RIGHT. "reconciled" ends the break, consistent with 13.11.
- d_pretraining:15 "the learned stem filters are replicated" RIGHT. "were replicated" ends the break, consistent with 13.11.
- e_finetuning:1 "we initialize the parameters of HCCNet" RIGHT. "initialized" ends the break.
- e_finetuning:1 "we append the final pooling layer ... and fine-tune the model" RIGHT. Both verbs become past.
- a_data:1 "All examinations included in the study comprise" RIGHT. "comprised" ends the break, consistent with 13.12.
- a_data:1 "modality groups are available for every patient" RIGHT. "were available" ends the break, consistent with 13.12.
- a_data:3 "we include all available data" RIGHT. "included" ends the break.
- a_data:3 "we additionally exclude all patients" RIGHT. "excluded" ends the break, consistent with 13.13.
- a_data:3 "of which 37 develop HCC" RIGHT. "developed" ends the break, consistent with 13.13.
- a_data:3 "we evaluate HCCNet using stratified 5-fold cross-validation" RIGHT on the conditions. "evaluated" ends the break. The same place is given again in 11.4, whose note says it is not in this list; that note is false (see the duplicates list).
- a_data:3 "We partition the patient cohort" RIGHT. "partitioned" ends the break.
- a_data:3 "The folds are stratified by HCC outcome" RIGHT. "were stratified" ends the break.
- a_data:3 "Each fold serves as the held-out test set" RIGHT. "served" ends the break, consistent with 13.14.
- a_data:3 "the remaining four folds form the development set ... that is used" RIGHT. Both verbs become past, consistent with 13.14.
- a_data:3 "is repeated independently for each fold" RIGHT. "was repeated" ends the break, consistent with 13.14.
- a_data:3 "we only fine-tune HCCNet on longitudinal MRIs that are also included" RIGHT. Both verbs become past, consistent with 13.15.
- b_implementation:1 "we pre-train both the CNN backbone" RIGHT. "pre-trained" ends the break.
- b_implementation:1 "We train the CNN over 32000 training steps" RIGHT. "trained" ends the break.
- b_implementation:1 "we linearly increase the learning rate" RIGHT. "increased" ends the break.
- b_implementation:1 "we decay the learning rate" RIGHT. "decayed" ends the break, consistent with 13.16.
- b_implementation:1 "We employ the same cosine decay without warm-up" RIGHT. "employed" ends the break, consistent with 13.16.
- b_implementation:1 "but only apply it to the weights" RIGHT. "applied" ends the break, consistent with 13.16.
- b_implementation:1 "we also limit the temperature" RIGHT. "limited" ends the break.
- b_implementation:3 "pre-training of the Transformer encoder considers" is given in finding 6.4. WRONG (condition 4). This entry has no replacement and refers to another finding, which SKILL.md forbids; the place should have been left out of the list.
- b_implementation:3 "we train the Transformer encoder using an abbreviated pre-training protocol of just 8000 training steps" WRONG (condition 2, on its added rule). "trained" ends the tense break. But in "an abbreviated ... protocol of just 8000 steps", "just" states that the protocol is short, a genuine minimality claim, and section A keeps such uses. So the named filler break is not a break.
- b_implementation:3 "We set ..., apply dropout ..., and employ" RIGHT. "applied" and "employed" end the break.
- b_implementation:5 "we update HCCNet" RIGHT. "updated" ends the break.
- b_implementation:5 "We fine-tune the model over 400 training steps" RIGHT. "fine-tuned" ends the break.
- b_implementation:5 "but decrease the weight decay" RIGHT. "decreased" ends the break.
- b_implementation:5 "we select the batch size" RIGHT. "selected" ends the break.
- b_implementation:5 "we then train HCCNet" RIGHT. "trained" ends the break.
- b_implementation:7 "we establish a baseline" RIGHT. "established" ends the break.
- b_implementation:7 "we equally train the baseline" RIGHT. "trained" ends the break.
- b_implementation:7 "We employ the same optimizer" RIGHT. "employed" ends the break.
- b_implementation:7 "but slightly increase the learning rate warm-up" WRONG (condition 4). The past tense and the cut of "slightly" are justified by "from 20 to 40 training steps". But the cut answers section A's vague-qualifier rule, and the entry does not name that rule; it gives only a note on why the cut is allowed.
- b_implementation:9 "we additionally evaluate a set of exploratory multi-modal configurations" RIGHT. "evaluated" ends the break.
- b_implementation:9 "we naively concatenate the series" RIGHT. "concatenated" ends the break.
- b_implementation:9 "we evaluate the full fusion" RIGHT. "evaluated" ends the break.
- b_implementation:9 "augmentation views are sampled" RIGHT. "were sampled" ends the break.
- b_implementation:11 "we further disentangle the contributions" RIGHT. "disentangled" ends the break.
- b_implementation:11 "we evaluate two intermediate configurations" RIGHT. "evaluated" ends the break.
- b_implementation:11 "We conduct this ablation" RIGHT. "conducted" ends the break.
- c_evaluation:1 "we evaluate HCCNet's baseline" RIGHT. "evaluated" ends the break.
- c_evaluation:1 "we train ten independently seeded models (fifty models in total) and average" RIGHT. Both verbs become past.
- c_evaluation:1 "Every reported metric is computed" RIGHT. "was computed" ends the break, consistent with 13.17.
- c_evaluation:1 "we employ the following performance metrics" RIGHT. "employed" ends the break, consistent with 13.17.
- c_evaluation:1 "we also explore the robustness of the model" RIGHT. "explored" ends the break.
- c_evaluation:6 "we evaluate the models' respective calibration" RIGHT. "evaluated" ends the break.
- 1_conv_layer:3 "we inflate ... and reduce" RIGHT. This is appendix A, a method, and both verbs become past.
- 2_augmentations:1 "we randomly crop two global views" RIGHT. "cropped" ends the break.
- 2_augmentations:1 "we randomly crop a multi-channel sub-volume" RIGHT. "cropped" ends the break.
- 2_augmentations:1 "further augmentations remain consistent across pre-training" RIGHT. "remained" ends the break.
- 2_augmentations:1 "we randomly shift and scale ..., apply ..., and randomly flip" RIGHT. All three verbs become past.
- 2_augmentations:1 "we use the same data augmentation strategy" RIGHT. "used" ends the break.
Results list:
- d_results:5 "shows excellent predictive capability" RIGHT. "showed" ends the break.
- d_results:5 "appear to display less expressive characteristics" RIGHT. "appeared" ends the break, consistent with 13.18.
- d_results:5 "still maintain a stronger average predictive capability" RIGHT. "maintained" ends the break, consistent with 13.18.
- d_results:5 "are also evaluated in their own right" RIGHT. "were" ends the break, consistent with 13.18.
- d_results:5 "is markedly stronger on AUROC" WRONG (condition 4). "was" ends the tense break, but the replacement keeps "markedly", a degree qualifier of the kind section A replaces with a number (the report itself replaces "slightly", "substantially" and "considerably"). That break is not named.
- d_results:5 "while on AUPRC the two are comparable" RIGHT. "were" ends the break.
- d_results:5 "The combined T1 IOP & T2-MRI modality reaches" RIGHT. "reached" ends the break.
- d_results:5 "so the T2-MRI model alone exceeds it" RIGHT. "exceeded" ends the break.
- d_results:5 "the combined modality nonetheless remains the weakest" RIGHT. "remained" ends the break.
- d_results:9 "the per-fold ensemble closely follows the diagonal line" WRONG (condition 4). "followed" ends the tense break, but "closely" is kept: a degree qualifier standing in for the MAE figures, not named.
- d_results:9 "This robustness is tightest on AUROC" RIGHT. "was" ends the break, and the quoted words hold no other break.
- d_results:9 "No model variant falls consistently below" RIGHT. "fell" ends the break.
- d_results:11 "the models are thus robust" RIGHT. "were" ends the break.
- d_results:11 "the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating" RIGHT. The past tense ends the tense break, and "model variants" ends the synonym cycling, which the entry names.
- d_results:15 "Across imaging modalities, the magnitude ... varies." RIGHT. "varied" ends the break.
- d_results:19 "the plots largely align with the results" WRONG (condition 4). "aligned" ends the tense break, but "largely", a qualifier of the "mostly" kind, stays and is not named.
- d_results:19 "the expected calibration error does not display the same negative relationship" RIGHT. "did not display" ends the break.
- d_results:19 "consistently show the lowest expected calibration error" RIGHT. "showed" ends the break.
- d_results:19 "display the highest expected calibration error" RIGHT. "displayed" ends the break.
- d_results:21 "This reduction is largest ... at 56.0%, reaches 37.0%" RIGHT. Both verbs become past.
- d_results:21 "and is smallest at 12.1%" RIGHT. "was" ends the break.
- d_results:25 "None of the fused configurations exceeds this best single modality." RIGHT. "exceeded" ends the break.
- d_results:25 "Adding T1 DCE-MRI to DW-MRI lowers performance" RIGHT. "lowered" ends the break.
- d_results:25 "leaves performance essentially equal" WRONG (condition 4). "left" ends the tense break, but "essentially", an approximating qualifier, stays unnamed.
- d_results:25 "matches DW-MRI alone on AUROC" RIGHT. "matched" ends the break.
- d_results:29 "pre-training only the CNN backbone recovers essentially all" WRONG (condition 4). "recovered" ends the tense break, but "essentially all" stays, an approximating qualifier, unnamed.
- d_results:29 "yields AUPRC = 0.310" RIGHT. "yielded" ends the break.
- d_results:29 "The CNN-backbone dominance also holds" RIGHT. "held" ends the break.
- d_results:29 "clearly exceeds the Transformer encoder alone" RIGHT. "exceeded" ends the break.
- d_results:29 "the two stages contribute comparably" RIGHT. "contributed" ends the break; the sentence gives the figures.
- d_results:29 "These results indicate that" RIGHT. "indicated" ends the break.
- 1_baseline:3 "consistently display the highest detection rate" RIGHT. This is appendix B results; "displayed" ends the break.
- 2_reliability:3 "consistently display the lowest average reliability scores" RIGHT. "displayed" ends the break.
- 2_reliability:3 "preceding pre-training establishes a negative relationship" RIGHT. "established" ends the break, consistent with 13.23.
- 2_reliability:3 "HCCNet fine-tuned using diffusion weighted MRIs display the lowest" RIGHT. "displayed" ends the break.
- 2_reliability:3 "exhibit the highest average reliability metrics" RIGHT. "exhibited" ends the break.

=== Group 10, prose standard section C ===
10.1 d_results:3 "We report HCCNet's fine-tuned performance (i) across imaging modalities..." RIGHT. The passage stands. The sentence describes what the section is about to do, which section C cuts, so "delete" is the right replacement.
10.2 d_pretraining:8 "Note that in our implementation, we use a 3D crop..." RIGHT. The passage stands. "Note that" belongs to the class of "It should be noted that" and is cut. "used" ends the tense break. The text matches 13.8.
10.3 d_pretraining:15 "Note that during pre-training of the Transformer encoder..." RIGHT. The passage stands. The opener is cut, the tense becomes past, and the text matches 13.10.
10.4 3_hyperparams:3 "Note that during CNN-backbone pre-training we slightly deviate..." RIGHT. The passage stands. The opener is cut. "slightly" becomes the specific claim (two deviations), which the next two sentences of the paragraph support, and the tense becomes past. The text fits 8.3's "This deviation".

=== Group 11, prose standard section A, banned filler and flagged terms ===
11.1 a_longitudinal_analysis:3 "While the approach is relatively simple to implement, it has been shown..." WRONG (condition 4). The passage stands. The replacement "While the approach [the concrete implementation cost, such as the number of components], it was shown..." has no verb in its subordinate clause, so it does not read as a sentence in place of the passage. It also gives the tense change on a place that group 9 already lists.
11.2 b_pretraining:3 "Instead of simply comparing view pairs from different patients..." RIGHT. The passage stands. "simply" is cut, and "only" keeps the meaning of "merely" without adding a claim.
11.3 b_pretraining:5 "adopts a simple sequence-order-prediction task inspired by" RIGHT. The phrase stands, and the cut of "simple" ends the filler.
11.4 a_data:3 "To obtain robust performance estimates..." RIGHT on the four conditions. Here "robust" is not the statistical term (robust estimator), "reliable" comes from the table of replacements, and the tense becomes past. However, its note "(This place is not repeated in the tense list.)" is false: the tense list gives a_data:3 "we evaluate HCCNet using stratified 5-fold cross-validation".

=== Group 12, prose standard section D, "No synonym cycling" ===
- c_variants:1 "The five model variations are:" RIGHT. c_variants:1 defines "variants", and "variants" ends the cycling.
- c_evaluation:1 "For the comparison across model variations" RIGHT. It now reads "model variants".
- d_results:9 "\textbf{Comparison across Model Variations.}" RIGHT. The heading stands; "Variants" ends the cycling.
- d_results:5 "stratified by imaging modality and model architecture" RIGHT. "model variant" names the same rows as the table.
- d_results:5 "across model architectures" RIGHT. "model variants" ends the cycling.
- d_results:15 "stratified by image modality and model variation" RIGHT. Both synonyms are replaced with the draft's terms.
- 1_baseline:3 "stratified by image modality and model variation" RIGHT. The same fix as the d_results:15 entry.
- 2_reliability:3 "stratified by imaging modality and model architecture" RIGHT. "model variant" ends the cycling.
- tables/hyperparams.tex:36 "for model variations HCCNet-F, -C, and -P" RIGHT. The table note stands at line 36; "variants" ends the cycling.

=== Group 13, prose standard section D, paragraphs ===
13.1 abstract:3 split after "...over time." RIGHT. The paragraph has five sentences on two ideas (method, then evaluation). The parts have 2 and 3 sentences, and the text matches 1.2.
13.2 introduction:13 split after "...clinical outcomes." RIGHT. The paragraph has six sentences. With 13.3 the parts have 3, 2 and 1 sentences (application, generalization, code), and the text matches 1.6.
13.3 introduction:13 split before "All code..." RIGHT. The code sentence becomes its own paragraph, and the text matches 1.7.
13.4 a_longitudinal_analysis:3 split after the Dammu sentence WRONG (condition 4). It carries 11.1's replacement, which does not read as a sentence. Its second quoted sentence also keeps "Studies ... have therefore increasingly employed Siamese networks". That is a present perfect for a literature finding, which the report treats as a break at a_longitudinal_analysis:5, and "increasingly" is a vague trend word; neither is named.
13.5 a_longitudinal_analysis:5 split after the "typically employ" sentence RIGHT. The paragraph has six sentences; the parts have 3 and 3 (what hybrid models are; their use). The text matches 5.7.
13.6 b_pretraining:3 split after the momentum-encoder sentence RIGHT. The paragraph has six sentences; the parts have 3 and 3 (the principle; the examples). The quoted sentences hold no other break.
13.7 a_problem_formulation:1 split after the $D^p$ sentence RIGHT. The paragraph has five sentences; the parts have 3 and 2. The finding names the tense change ("were subset", "had").
13.8 d_pretraining:8 split after the crop sentence RIGHT. The paragraph has eight sentences. With 13.9 the parts have 2, 3 and 3. The text matches 10.2 and 7.3.
13.9 d_pretraining:8 split after "Specifically, we treat..." WRONG (condition 4). The sentence counts are fine, but its second quoted sentence gives three list-shaped items in paragraph form: one sampling clause per modality group, separated by semicolons. Section D turns that into a list, and the finding does not name it.
13.10 d_pretraining:10 and d_pretraining:15 split before "Note that during pre-training..." RIGHT. The paragraph runs from line 10 to 15 with nine sentences. With 13.11 the parts have 4, 3 and 2. The text matches 10.3 and the tense entries.
13.11 d_pretraining:15 split before "Since the backbone..." RIGHT. The parts are input construction and stem expansion, and the past tenses match the tense list.
13.12 a_data:1 split after the resampling sentence WRONG (condition 4). Finding 4.1 adds a bracket sentence to the first sentence of this paragraph. Counted with it, as SKILL.md requires, the first part has five sentences, and no further split is given.
13.13 a_data:3 split after the exclusion sentence RIGHT. The paragraph has ten sentences. With 13.14 and 13.15 the parts have 2, 4, 3 and 1 sentences (selection, folds, leakage, reporting). The text matches 11.4 and the tense entries.
13.14 a_data:3 split after "Each fold served..." RIGHT. The text is consistent with the tense list, and the parts each hold one idea.
13.15 a_data:3 split before "All results are reported..." RIGHT. The text is consistent with the tense list. The reporting sentence describes the paper itself and stays present.
13.16 b_implementation:1 split after "we decayed..." RIGHT. The paragraph has six sentences; the parts have 4 and 2, and the text matches the tense entries.
13.17 c_evaluation:1 split after the ensemble sentence WRONG (condition 4). The parts have 3 and 3 sentences. But the second quoted sentence holds six metrics after "the following performance metrics:", list-shaped items in paragraph form that section D turns into a list. That is not named.
13.18 d_results:5 split after the T1 DCE-MRI sentence RIGHT. The paragraph has seven sentences; the parts have 3 and 4 (group comparison; standalone contrasts). The text matches the tense entries.
13.19 d_results:19 split after the extended-metrics sentence WRONG (condition 4). The counts (3 and 4) are fine, but "the plots largely aligned" keeps the qualifier "largely" unnamed.
13.20 discussion:12 split after the ablation sentence WRONG (condition 4). Its first quoted sentence states, without a limit, that pre-training the CNN backbone is the dominant driver and that the sequence-order task "contributes comparatively little". The draft's own ablation table (tables/results_pretrain_ablation.tex:20-21) has the Transformer encoder alone above the CNN backbone alone for T1 IOP & T2-MRI (0.457 against 0.447), and d_results:29 limits the claim to DW-MRI and T1 DCE-MRI. That is a "Limitations" break, not named.
13.21 conclusion:1 split after the fusion sentence RIGHT. The paragraph has eight sentences. With 13.22 the parts have 3, 2 and 3. The text matches 1.8.
13.22 conclusion:1 split after "Yet, each condition..." RIGHT. The parts are generalizability and future work. EHR is defined earlier, at discussion:18.
13.23 2_reliability:3 split after "That is despite..." RIGHT. The paragraph has six sentences; the parts have 4 and 2 (baseline; fine-tuned). The text matches 8.4 and the tense entries.

=== Group 14, prose standard section 0, "Em dash: zero" ===
- main.tex:47 "Longitudinal 3D MRI Images: -- A Case Study..." RIGHT. The commented title stands, and its " -- " is an em dash respelled as a title separator. ", with a" ends it and matches the live title at main.tex:45.
- main.tex:49 "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma Prediction" RIGHT. Same reason; the comment stands at line 49.
- main.tex:51 same text RIGHT. The comment stands at line 51, with the same fix.
- main.tex:53 "...Images -- A Case Study on Hepatocellular Carcinoma" RIGHT. The comment stands at line 53, with the same fix.
- main.tex:57 "Longitudinal Medical Images -- Application to Hepatocellular Carcinoma" RIGHT. The comment stands at line 57, and ", with an Application" ends the dash.
- discussion:1 "This study therefore developed HCCNet - a spatio-temporal neural network..." WRONG (condition 4). The commented sentence stands, and the commas end the spaced-hyphen aside. But the replacement keeps "This study therefore developed", the same third-person actor that 7.5 reports as a Voice break, and the entry does not name it.

=== Lists asked for ===
Groups with no line under the heading: none.

Group lines that do not meet "How you group them": none. Each line names a reader's loss or cost that one of its own findings shows and that holds in the draft:
- G1: 243 patients, 37 with HCC, one cohort (a_data:3).
- G5: the AUPRC range of 0.329 to 0.628 (tables/results_finetune.tex).
- G13: a_data:3 does have ten sentences.
- G9, G10, G11, G13 and G14 each say their breaks change no claim and name a cost.
- G11's line ("a softener with no fact in it") fits 11.2 and 11.3 but not 11.1 ("relatively simple to implement" is a claim) or 11.4 (a flagged term). The line is still shown by one of its own findings, so it passes.

Findings with no quoted passage, no replacement, or a replacement given as an instruction or a reference:
- 5.2: the replacement for its "Clear antecedents" break is an instruction ("begin the sentence with 'Outcome prediction from longitudinal MRI is especially relevant ...'"), not text.
- Tense list entry b_implementation:3 "'pre-training of the Transformer encoder considers' is given in finding 6.4.": no replacement, and a reference to another finding.

Passages or places the report gives twice:
- a_longitudinal_analysis:3 "it has been shown to not fully explore": in the tense list (group 9), then again in 11.1 with its tense line, and inside 13.4.
- a_data:3 "we evaluate HCCNet using stratified 5-fold cross-validation": in the tense list (group 9), then again in 11.4 (whose note wrongly says it is not in the list), and inside 13.13.
- b_implementation:3 "considers": given in 6.4 and referred to again from the tense list.
- Overlaps between sentence-level findings and the paragraph-split findings that quote the same sentences, with consistent text: 1.2/13.1, 1.6/13.2, 1.7/13.3, 5.7/13.5, 7.1/13.7, 7.3 and 10.2/13.8, 8.1/13.9 paragraph, 10.3/13.10, 1.8/13.21, 8.4/13.23, and the tense entries inside 13.9-13.19 and 13.23. SKILL.md provides for these overlaps ("the replacement gives the text at that place as it reads after every finding on it"), and every pair can be applied together, so I do not count them as defects.
- 3.3/3.4 are two places of one claim with consistent brackets, which is allowed.

Findings that carry a line saying they still break a rule: none.

Totals: of the rows marked above, 41 are wrong:
- 1.1, 1.9, 1.10
- 3.1
- 5.2, 5.4, 5.5, 5.11, 5.18, 5.20
- 6.1
- 7.1
- tense entries: b_implementation:3 (the reference to 6.4), b_implementation:3 "just", b_implementation:7 "slightly", d_results:5 "markedly", d_results:9 "closely", d_results:19 "largely", d_results:25 "essentially", d_results:29 "essentially"
- 11.1
- 13.4, 13.9, 13.12, 13.17, 13.19, 13.20
- 14: discussion:1
All other rows are right.

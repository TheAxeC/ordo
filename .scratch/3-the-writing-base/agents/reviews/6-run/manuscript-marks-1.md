# Marks of manuscript marker 1

Agent af9e18c06b5359637, ordo-high, served claude-opus-5-5: 224746 tokens, 42 tool uses, 12.3 min (735765 ms). The text below is its final message, verbatim apart from character names.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/6-run/manuscript-report.md

What I read: the report (lines 1-664), the prose standard, writing/SKILL.md, rules.md, registers.md, and all 33 draft files, each one whole. The only command I ran on the draft was one `grep -rn -o` for "SSL", "DINO", "patchify", "stem", "TRIPOD" and "guideline", to find line numbers. It shows that "SSL" appears only at 1_baseline.tex:3, that the first "DINO" is at introduction.tex:11, that "patchify" appears only at b_architecture.tex:5, and that "stem" appears only at d_pretraining.tex:15. No file of the draft has "TRIPOD", and no file of the draft has "guideline" (the one hit is in a_prediction.tex, which is not part of the draft).

Totals: 194 marks, 177 right and 17 wrong.

== Limitations and alternative interpretations ==
1. abstract.tex:3, "Our results show that HCCNet substantially improves...": wrong (4). The replacement says HCCNet "improves the average AUPRC ... by 106.6% ... 48.9% ... 52.3%". In the draft those numbers are averages of the per-variant relative changes. The rise of the average AUPRC is about 106.3%, 50.0% and 48.4%. The replacement also turns "providing a reliable tool" into "could support", which drops the claim instead of only changing its device.
2. d_results.tex:21, "More interestingly, the comparison between baseline...": right. The ECE rose only for HCCNet-F on T1 IOP & T2-MRI (0.182 to 0.204). The replacement states that limit, cuts the aside and puts the sentence in the past tense.
3. d_results.tex:19, "Figure \ref{fig:calibration} shows consistently lower...": right. The averages (DW about 0.127, T1 IOP & T2 about 0.171, DCE about 0.194) hold the order in the replacement, and the bracket gives the per-variant exceptions correctly from tables/results_reliability.tex.
4. discussion.tex:10, "Thus, even for imaging modalities where...": wrong (4). In the replacement, "which suggests the value of our proposed pre-training framework" attaches to "rose from 0.182 to 0.204". It then reads as if the rise in ECE showed the framework's value, a relation the draft does not make.
5. discussion.tex:12, "An ablation that pre-trains only the CNN backbone...": right. tables/results_pretrain_ablation.tex holds the claim only for DW and DCE (for T1 IOP & T2, 0.457 against 0.447). The replacement states that limit and matches finding D23 word for word.
6. conclusion.tex:1, "Beyond the original framework, an ablation...": right. Same limit, same table, and the replacement is correct.
7. introduction.tex:11, "Additionally, the Transformer encoder is pre-trained with...": right. SKILL.md has a limit that the draft's numbers contradict named in square brackets, and the bracket's numbers (0.307 to 0.457, 0.308 to 0.310) match the ablation table.

== Hedging ==
1. abstract.tex:5, "The methodological approach presented in this paper is versatile...": right. This generalizes from a single cohort with no hedge, and the replacement uses weak devices that fit the evidence.
2. abstract.tex:5, "Its ability to handle varying patient record lengths...": wrong (4). Only HCC was tested, so for chronic diseases in general the evidence carries a weak device, as the finding gives in items 1, 3 and 4 on the same evidence. The replacement uses the moderate "suggests".
3. introduction.tex:13, "Thus, HCCNet provides a flexible framework...": right. The generalization has no hedge, and the replacement changes only the devices.
4. conclusion.tex:1, "The methodology is versatile and offers a framework...": right. It is hedged correctly and matches D25.
5. d_results.tex:5, "The combined T1 IOP \& T2-MRI modality reaches...": wrong (2). The passage already hedges the interpretation with the moderate "indicating". The replacement's "suggests" is also moderate, which shows that no break of strength was found.
6. discussion.tex:10, "Inspection of the models' reliability diagrams further demonstrated...": right. "Demonstrated" is a strong device for an inference from reliability diagrams. The replacement moves to moderate and weak devices and names the missing evidence for the mechanism.
7. discussion.tex:12, "We attribute this to the limited number...": right. The attribution is hedged with "may", "this" is replaced by the result the draft states in d_results.tex:25, and the sentence's two ideas (the cause and the future work) are split.

== Evidence for claims ==
1. a_longitudinal_analysis.tex:1, "To date, deep learning applications to medical imaging still predominately...": right. The claim has no citation anywhere in the draft, and the bracket replaces both the qualifier and the missing source.
2. a_longitudinal_analysis.tex:1, "However,  physicians usually assess...": right. The claim has no citation, and the bracket names the share or the guideline with its source.
3. a_longitudinal_analysis.tex:5, "To mitigate this shortcoming, our study uses...": right. "Third most common" has no source, and the bracket asks for one.
4. b_pretraining.tex:1, "While the temporal relationship across medical image screening...": right. "Scarcely explored" has no source, and the bracket asks for one.
5. b_pretraining.tex:3, "Among them, contrastive learning approaches remain...": right. "Most commonly applied" has no source, and the bracket asks for one.
6. introduction.tex:7, "Likewise, most deep learning applications are aimed...": right. The claim has no citation, and the brackets supply the share and the source.
7. c_variants.tex:10, "Deviating from the head dimension of 128...": right. The draft shows no evidence about convergence, and the bracket names it.
8. discussion.tex:12, "Our augmentation strategy exposes the backbone...": right. "Richest for diffusion-weighted imaging" has no source, and the replacement adds brackets for the evidence and for an alternative explanation.

== registers.md, "What the reader looks for" (Medicine and Health) ==
1. a_data.tex:1, "We evaluate HCCNet on data that is retrospectively collected...": right. No file of the draft names a reporting guideline. The register is the draft's (a clinical prediction study in Intelligent Medicine), and the replacement adds the guideline as the author's fact.

== Vague language ==
1. b_pretraining.tex:1, "Using the potential abundance of unlabeled data, some...": right. "Some ... studies" is the table's "some researchers" kind of phrase, and the replacement names the studies the draft cites.
2. b_pretraining.tex:1, "As a result, many deep learning studies...": right. This is the table's "many studies", and the replacement is a bracket for the studies or their count.
3. introduction.tex:7, "However, many existing approaches have not fully explored...": right. "Many studies" kind, replaced by a bracket.
4. a_longitudinal_analysis.tex:7, "Likewise, many of them disregard...": right. "Many studies" kind, replaced by a bracket.
5. a_longitudinal_analysis.tex:1, "As a result, longitudinal imaging has long been established...": right. "Many branches" and "recent studies" are replaced by the named branches and studies with a dated span.

== Prose standard, section A, vague qualifiers ==
1. abstract.tex:1, "where early detection can considerably influence...": right. The qualifier is replaced by a bracket for the measured amount.
2. introduction.tex:1, "However, despite its potential, the development...": right. "Significant" is replaced by a bracket for the specific obstacle.
3. introduction.tex:5, "Traditional approaches often simplify this task...": right. "Often" is replaced by a bracket for the share.
4. introduction.tex:5, "However, this method has limitations, particularly...": right. "Often" and "considerably" are each replaced by a bracket.
5. discussion.tex:8, "Overall, fine-tuned model results varied substantially...": wrong (4). The range "between 0.429 ... and 0.614" does not hold under tables/results_finetune.tex, where the T1 IOP-MRI and T2-MRI modalities average about 0.389 and 0.428 AUPRC. No bracket names this.
6. discussion.tex:6, "Despite being long established as the gold standard...": right. "Many branches" is replaced by a bracket, and a citation bracket is added.
7. 2_reliability.tex:3, "As for the comparison across performance metrics...": right. "Predominantly" is replaced by a bracket for the extent, in the Results tense.
8. figures/cumulative_gain.tex:10, "Generally, lower MAE values indicate...": right. The MAE definition at c_evaluation.tex:1-6 holds the claim in every case, the finding names it, and the qualifier is cut.

== Most specific term ==
1. discussion.tex:8, "Our proposed pre-training approach improved model performance...": wrong (4). The change from "model performance" to "AUPRC" is right, but "improved the average AUPRC by 48.9% and 52.3%" uses the draft's averages of relative changes as changes of the average AUPRC, which are about 50.0% and 48.4%.

== Terms defined at first use ==
1. introduction.tex:11, "The CNN backbone is pre-trained using an extended version of the DINO framework...": right. This is the first use of DINO, which the draft never expands, and the expansion "self-distillation with no labels" is correct.
2. b_architecture.tex:5, "Additionally, we reimplement the patchify layer...": wrong (4). The definition brings in "stem convolution", a technical term the draft never defines; its only other use is at d_pretraining.tex:15.
3. 1_baseline.tex:3, "Overall differences between imaging modalities are however...": right. This is the only use of SSL, which is now spelled out. "Generally" is cut, and the AUPRC and AUROC ranges that results_baseline.tex holds take its place.

== Prose standard, section D, "No synonym cycling" ==
1. Term "CNN backbone":
- b_architecture.tex:5, "\textbf{CNN Feature Extractor.}": right. The heading names the same component.
- b_architecture.tex:7, "The CNN feature extractor takes the MR images...": right.
- b_architecture.tex:14, "we concatenate the image embeddings obtained from the CNN feature extractor...": right. The Methodology tense comes with the change.
- d_pretraining.tex:3, "\textbf{CNN Feature Extractor.}": right.
- d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed...": right.
- 2_augmentations.tex:1, "During pre-training of the CNN feature extractor...": right.
- tables/results_pretrain_ablation.tex:27, "pre-trains the CNN feature extractor using DINO": right. It matches D35.
2. Term "model variant":
- c_variants.tex:1, "The five model variations are:": right.
- c_evaluation.tex:1, "For the comparison across model variations...": right.
- d_results.tex:5, "stratified by imaging modality and model architecture": right. "Model architecture" here means the variants.
- d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent...": right.
- d_results.tex:9, "\textbf{Comparison across Model Variations.}": right.
- d_results.tex:15, "stratified by image modality and model variation": right.
- 1_baseline.tex:3, "stratified by image modality and model variation": right.
- 2_reliability.tex:3, "stratified by imaging modality and model architecture": right.
3. Term "imaging modality":
- d_results.tex:15, "That is, although baseline model results vary only gradually...": right. The passage is exact, and the replacement changes the term and the tense.
- "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change": wrong (1, 4). The entry quotes no passage and gives no replacement, only a reference to item 2.
- figures/cumulative_gain.tex:10, "across three MRI types": right.
- figures/calibration.tex:10, "across three MRI modalities": right.

== Transitions ==
1. d_results.tex:15, "Finally, we evaluate the impact...": right. The fusion subsection and the ablation subsection follow, and d_results.tex:29 opens with a second "Finally". The replacement cuts the transition and uses the Results tense.

== Clear antecedents ==
1. abstract.tex:1, "To address this, we propose HCCNet...": wrong (4). The finding names sentence length, and the first sentence it writes runs to 28 words.
2. introduction.tex:1, "This is especially relevant in conditions like hepatocellular carcinoma...": right. "This" is replaced by the subject of the sentence before it, and "considerably" by a bracket.
3. d_pretraining.tex:8, "This teaches the model to identify the same patient...": right. The replacement names the sampling described in the sentence before.
4. d_pretraining.tex:15, "This transfers the pre-trained representation...": right. "Replicating the stem filters" is the draft's own action.
5. 3_hyperparams.tex:3, "This is due to convergence issues...": right. The noun is named, and the tense is past. It matches D27.
6. 2_reliability.tex:3, "That is despite that baseline models...": right. "That" is replaced by the reliability result of the sentence before, and the replacement matches D28.

== registers.md, "Voice" ==
1. discussion.tex:6, "To support HCCNet's capability...": right. This is the authors' decision, now with "we", under the draft's register.
2. a_data.tex:1, "In total, 963 MRI examinations were included in the study": right. Inclusion is the authors' decision.
3. discussion.tex:16, "Despite these successes, several challenges and limitations were identified.": wrong (4). The finding names "several" as a vague qualifier, but the replacement cuts it without the number, the specific claim or a bracket.

== Formality (a sentence with two ideas) ==
1. conclusion.tex:1, "Additionally, exploring the integration of multi-modal data...": right. The two contrasted claims are split, and with D25 the paragraph's parts run to three sentences each.

== Prose standard, section C ==
1. d_results.tex:3, "We report HCCNet's fine-tuned performance (i)...": right. The sentence announces what follows, so the replacement is delete.
2. d_results.tex:11, "Across imaging modalities, the models are thus robust...": right. The opener recaps d_results.tex:9 and is cut, and the second sentence keeps its claim.
3. b_implementation.tex:1, "As aforementioned, we pre-train both...": right. It is a recapping opener, cut.
4. d_pretraining.tex:8, "Note that in our implementation, we use a 3D crop...": right. "Note that" is cut, and the replacement matches D7.
5. d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder...": right.
6. 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training...": right.

== Prose standard, section E ==
1. d_results.tex:11, "At least on the data evaluated in this study...": right. It is a restating close, so the replacement is delete.
2. c_evaluation.tex:8, "Since all metrics are obtained through cross-validation...": wrong (4). The third sentence of the replacement runs to 28 words with no mechanism that needs them.
3. d_pretraining.tex:3, "Accordingly, we define a student $F_s$...": wrong (4). The two sentences it writes run to about 24 and 29 words, and both could be split.

== Prose standard, section D, paragraphs ==
1. abstract.tex:3, "The CNN backbone is pre-trained using a self-supervised learning framework...": right. The paragraph has 5 sentences and the parts have 2 and 3.
2. introduction.tex:13, "This application not only demonstrates...": wrong (4). The second part keeps the code-availability sentence with the sentences on other conditions, two ideas, and the finding gives no further split.
3. a_longitudinal_analysis.tex:3, "While the approach is relatively simple to implement...": right. 7 sentences, split into parts of 3 and 4.
4. a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end...": right. 6 sentences into 3 and 3, and "typically" is replaced by a bracket.
5. b_pretraining.tex:3, "As such, they randomly derive different views...": right. 6 sentences into 3 and 3.
6. a_problem_formulation.tex:1, "Since the frequency of liver screenings is typically...": right. 5 sentences into 2 and 3.
7. d_pretraining.tex:8 (first break), "Note that in our implementation...": right. With the second break, the 8 sentences fall into parts of 2, 3 and 3.
8. d_pretraining.tex:8 (second break), "Specifically, we treat different series...": right.
9. d_pretraining.tex:15, "Likewise, we concatenate the different series...": right. 6 sentences into 3 and 3.
10. a_data.tex:1, "Prior to pre-training and fine-tuning, MR images were anonymized...": wrong (4). Counted with the guideline sentence that the registers finding adds, the first part has 5 sentences.
11. a_data.tex:3 (first break), "During fine-tuning we additionally exclude...": right. The 10 sentences fall into parts of 2, 3, 3 and 2, and the change from "robust" to "reliable" matches filler item 5.
12. a_data.tex:3 (second break), "The folds are stratified by HCC outcome...": right.
13. a_data.tex:3 (third break), "Because pre-training is re-run within every fold...": right.
14. b_implementation.tex:1, "During the first 5\% of training steps...": right. 6 sentences into 3 and 3.
15. b_implementation.tex:9, "Concretely, we evaluate the full fusion...": right. 5 sentences into 3 and 2.
16. c_evaluation.tex:1, "Every reported metric is computed on this per-fold ensemble prediction...": right. 6 sentences into 3 and 3.
17. d_results.tex:5, "Contrast enhanced T1 weighted and the combination...": right. 7 sentences into 3 and 4.
18. d_results.tex:9, "As such, Figure \ref{fig:cumulative_gain} plots...": right. 5 sentences into 2 and 3.
19. d_results.tex:19 (first break), "Extended reliability metrics are presented...": right. With break 20 the parts are 3, 2 and 2, and "largely" is replaced by a bracket.
20. d_results.tex:19 (second break), "Figure \ref{fig:calibration} shows consistently lower...": right. The text is the same as Limitations 3.
21. d_results.tex:25, "None of the fused configurations exceeds...": right. 5 sentences into 3 and 2.
22. d_results.tex:29, "The CNN-backbone dominance also holds...": right. 5 sentences into 3 and 2.
23. discussion.tex:12, "An ablation that pre-trains only...": right. Counted with the sentence that Hedging 7 adds, the parts have 3 and 3 sentences, and the text matches Limitations 5.
24. discussion.tex:18, "Incorporating these data sources could further...": right. Two ideas, split into 2 and 1.
25. conclusion.tex:1 (first break), "Exploratory experiments further showed...": right. With the Formality split the parts have 3, 3 and 3 sentences, and the text matches Hedging 4.
26. 2_augmentations.tex:1, "Contrarily, during pre-training of the Transformer encoder...": right. 5 sentences into 2 and 3.
27. 3_hyperparams.tex:3, "This is due to convergence issues...": right. 5 sentences into 3 and 2.
28. 2_reliability.tex:3, "That is despite that baseline models...": right. 6 sentences into 4 and 2, and the text matches Clear antecedents 6.
29. figures/cumulative_gain.tex:10, "Optimal robustness is presented by the gray dashed line...": right. 5 sentences into 3 and 2.
30. figures/calibration.tex:10, "The x-axis represents confidence levels...": right. 5 sentences into 2 and 3.
31. tables/results_finetune.tex:42, "Second best results are underlined. DW-MRI comprises...": right. 8 sentences into 4 and 4.
32. tables/results_base_vs_pre.tex:42, "Second best results are underlined...": right. 7 sentences into 4 and 3.
33. tables/results_baseline.tex:42, "Second best results are underlined...": right. 8 sentences into 4 and 4.
34. tables/results_fusion.tex:21, "The within-contrast augmentation restriction is retained...": right. 6 sentences into 2 and 4.
35. tables/results_pretrain_ablation.tex:27, "``CNN backbone only'' pre-trains the CNN feature extractor...": right. 5 sentences into 3 and 2, and the text matches synonym 1.
36. tables/results_reliability.tex:32 (first break), "ECE represents the expected...": right. With break 37 the parts are 2, 3 and 3.
37. tables/results_reliability.tex:32 (second break), "Second best results are underlined...": right.

== Prose standard, section A, filler and flagged terms ==
1. b_pretraining.tex:3, "Instead of simply comparing view pairs...": wrong (4). Cutting "simply" turns "did more than compare" into "did not compare", which changes the claim, so the concrete fact was needed instead of a cut.
2. b_pretraining.tex:5, "adopts a simple sequence-order-prediction task": right. "Simple" is banned as filler.
3. d_pretraining.tex:10, "this study employs a simple binary sequence-order-prediction (SOP) task": right.
4. b_implementation.tex:3, "an abbreviated pre-training protocol of just 8000 training steps": wrong (2). "Just" here means "only" and states the deliberately short protocol. That is a genuine minimality claim, which section A keeps.
5. a_data.tex:3, "robust performance estimates": right. "Robust" is not the statistical term here, and the replacement comes from the rules-page table.

== Tense per section ==
All 67 entries are right. Each passage stands at the place named, in a Methodology section (sections 3 and 4.1-4.3, appendix A) or a Results section (section 4.4, appendix B), in the present tense. Each replacement puts the same words in the past tense. The entries are: b_architecture.tex:3 "We use the CNN backbone"; b_architecture.tex:5 "we adapt the ConvNeXt architecture"; b_architecture.tex:5 "we replace the 2-dimensional depthwise..."; b_architecture.tex:21 "we embed the input's positional information"; b_architecture.tex:21 "we replace the conventional sequence position"; b_architecture.tex:21 "we compute the vector of intervals"; b_architecture.tex:26 "prepend" and "obtain positional encodings"; b_architecture.tex:34 "we add the positional encodings"; b_architecture.tex:39 "We feed the input sequence..."; b_architecture.tex:44 "we feed it through a pooling layer"; c_variants.tex:1 "we introduce four variants"; c_variants.tex:10 "we additionally introduce HCCNet-C"; d_pretraining.tex:1 "we therefore design two"; d_pretraining.tex:3 "this study extends"; d_pretraining.tex:8 "which are cropped"; d_pretraining.tex:8 "we exploit the abundance"; d_pretraining.tex:10 "we randomly shuffle 50\%"; d_pretraining.tex:10 "we actually randomly shuffle 66\%"; d_pretraining.tex:10 "We apply the sigmoid function..."; d_pretraining.tex:15 "we reconcile..." with its two further clauses; e_finetuning.tex:1 "we initialize the parameters"; e_finetuning.tex:1 "we append the final pooling layer..."; a_data.tex:1 "This complete co-availability allows us"; a_data.tex:3 "we include all available data"; a_data.tex:3 "We partition the patient cohort"; a_data.tex:3 "is repeated independently"; b_implementation.tex:1 "We train the CNN"; b_implementation.tex:1 "We employ the same cosine decay..."; b_implementation.tex:1 "we also limit the temperature..."; b_implementation.tex:3 "While MRI scans are assumed..."; b_implementation.tex:3 "apply dropout..."; b_implementation.tex:5 "we update HCCNet"; b_implementation.tex:5 "We fine-tune the model..." and "decrease"; b_implementation.tex:5 "we select the batch size" and "apply no further"; b_implementation.tex:5 "we then train HCCNet" and "evaluate it"; b_implementation.tex:7 "we establish a baseline"; b_implementation.tex:7 "we equally train"; b_implementation.tex:7 "We employ the same optimizer" and "increase"; b_implementation.tex:9 "we additionally evaluate"; b_implementation.tex:9 "we naively concatenate"; b_implementation.tex:9 "we restrict"; b_implementation.tex:11 "we further disentangle"; b_implementation.tex:11 "we evaluate two intermediate"; b_implementation.tex:11 "We conduct this ablation"; c_evaluation.tex:1 "we evaluate HCCNet's baseline"; c_evaluation.tex:1 "we train ten ... and average"; c_evaluation.tex:6 "we evaluate the models' respective calibration"; c_evaluation.tex:8 "we therefore refrain" and "treat"; d_results.tex:5 "is markedly stronger" and "are comparable"; d_results.tex:5 "remains the weakest"; d_results.tex:9 "we explore the impact"; d_results.tex:9 "This robustness is tightest"; d_results.tex:9 "No model variant falls..."; d_results.tex:15 "varies"; d_results.tex:19 "we compare the reliability"; d_results.tex:19 "consistently show" and "display"; d_results.tex:21 "is largest", "reaches" and "is smallest"; d_results.tex:25 "we evaluate whether"; d_results.tex:25 "which reaches"; d_results.tex:25 "As all differences fall"; d_results.tex:29 "recovers" and "yields"; 1_conv_layer.tex:3 "we inflate ... and reduce"; 2_augmentations.tex:1 "we randomly shift and scale", "apply" and "flip"; 2_augmentations.tex:1 "we use the same data augmentation strategy"; 1_baseline.tex:3 "consistently display the highest"; 2_reliability.tex:3 "consistently display the lowest"; 2_reliability.tex:3 "display ... while ... exhibit".

== Prose standard, section F, source formatting ==
1. sections/6_conclusion/ack.tex:2, "... op basis van MRI-radiomics" / "Primair leverkanker (hepatocellulair ...": wrong (4). The replacement leaves out "(hepatocellulair", one of the quoted words. SKILL.md says the replacement writes all the quoted words on one line.
2. sections/6_conclusion/ack.tex:6, "... (OpenAI ChatGPT) to help" / "refine the English language ...": wrong (4). The replacement leaves out the quoted "(OpenAI ChatGPT)".
3. sections/6_conclusion/ack.tex:7, "... reviewed and edited the" / "content as needed ...": right. The line really is hard-wrapped, and the replacement joins all the quoted words with one space.

Groups whose line is missing or names no loss of this draft's reader:
- The section D paragraphs group. Its line gives as its example "the single-cohort limit in the Discussion, is buried in the middle of a long paragraph". In the draft, that limit is the last sentence of discussion.tex:18, a paragraph of three sentences, so the loss the line names does not hold in the draft.

Findings with no quoted passage, no replacement, or a reference in place of text:
- The synonym-cycling group, term 3, second entry: "the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change". It quotes no passage and gives no replacement, only a reference to item 2.

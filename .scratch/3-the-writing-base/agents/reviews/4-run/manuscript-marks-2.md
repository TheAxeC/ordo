# Manuscript marks 2

Marker a1adeaa151d894670, ordo-high, served claude-opus-5-5. Usage: 230831 tokens, 42 tool uses, 13.4 min.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/4-run/manuscript-report.md

I read all the pages the brief names, the whole report and all 33 draft files, each one whole. I checked every place against the draft at its line. One grep (`grep -n` over main.tex, sections/, figures/ and tables/) listed every use of MRI, CNN, SSL, "feature extractor", HCCNet-Pico, Pre-LN, Brier, DINO, ConvNeXt, "stem", "first convolutional", patchify, AUC and AUPRC. Hits in files the draft does not input (a_prediction.tex, the *_original.tex files, results_etio*.tex and others) were ignored.

How I applied the standard on two points:
- A replacement that points to text written out elsewhere in the report, such as "replacement as in finding 34" or "the same two sentences with an empty line between them", fixes the result exactly, so I counted it as text and not as an instruction. These findings are listed at the end.
- A passage must be quoted at the place (SKILL.md, "A finding": "The passage, quoted as the draft has it"). A passage named only by its first words or by another finding's number fails condition 1.

Totals: 14 numbered findings are wrong (7, 22, 37, 51, 56, 59, 62, 68, 72, 77, 80, 81, 83, 85), and 2 entries of the tense list are wrong. Everything else is right.

== references/rules.md, "Limitations and alternative interpretations"
Group line: names what the reader loses.
- 1, sections/4_experiments/d_results.tex:11, "This corresponds with the results...": right. The limit holds in the draft: AUPRC runs from 0.329 (C) to 0.628 (N) for T1 DCE-MRI and from 0.507 (N) to 0.725 (T) for DW-MRI (tables/results_finetune.tex:13-22). The tense and antecedent changes carried with it change no claim.
- 2, sections/4_experiments/b_implementation.tex:9, "Owing to the limited number of positive cases...": right. It adds the same limit as finding 1 and carries the tense of the tense list and the HCCNet-P name of finding 40, so the three can be applied together.
- 3, sections/5_discussion/discussion.tex:12, "An ablation that pre-trains only the CNN backbone...": right. The discussion claim has no limit. tables/results_pretrain_ablation.tex:20-21 (0.447 against 0.457) shows the claim holds only for DW and DCE, and the added numbers stand in the draft.
- 4, sections/6_conclusion/conclusion.tex:1, "Beyond the original framework, an ablation...": right. The same limit holds in the same table.
- 5, sections/1_introduction/introduction.tex:11, "Additionally, the Transformer encoder is pre-trained...": right. All three AUPRC pairs match tables/results_pretrain_ablation.tex:11-21. The added sentence would, however, make the Introduction the first use of AUPRC, which the draft defines only at c_evaluation.tex:1.

== references/rules.md, "Hedging"
Group line: names what the reader loses.
- 6, sections/abstract/abstract.tex:3, "We demonstrate the effectiveness of HCCNet...": right. A strong device on a single-centre result becomes the moderate "indicate", and no claim is lost.
- 7, sections/abstract/abstract.tex:3, "Our results show that HCCNet substantially improves...": wrong, condition 4. Besides the hedge, the replacement drops the claim that HCCNet is "a reliable tool" ("could support personalized HCC surveillance"). A hedged form that keeps the claim would read "which suggests that it could provide a reliable tool for personalized HCC surveillance".
- 8, sections/abstract/abstract.tex:5, "The methodological approach presented in this paper is versatile...": right. The generalization the draft never tests gets weak devices and keeps every clause.
- 9, sections/abstract/abstract.tex:5, "Its ability to handle varying patient record lengths...": right. "Establishes" becomes "could serve", and the banned self-assessment "invaluable" goes. No other claim changes.
- 10, sections/1_introduction/introduction.tex:9, "Unlike previous approaches that rely on 2D slices...": right. The comparative claim is untested in the draft and gets "could". The three named properties are those the draft describes.
- 11, sections/1_introduction/introduction.tex:13, "By fine-tuning the pre-trained model on this dataset, we demonstrate...": right. "Demonstrate" becomes "indicates", and the claim and its citation are kept.
- 12, sections/1_introduction/introduction.tex:13, "Thus, HCCNet provides a flexible framework...": right. The untested generalization is hedged with "could serve as", which also ends the "provides" of spec-sheet voice.
- 13, sections/5_discussion/discussion.tex:10, "Inspection of the models' reliability diagrams further demonstrated...": right. The unmeasured mechanism gets "may" and the inspection gets "suggested".
- 14, sections/5_discussion/discussion.tex:10, "Thus, even for imaging modalities where the pre-training approach...": right. "Demonstrating the value ... in the medical domain" generalizes from one cohort and becomes "suggests".
- 15, sections/5_discussion/discussion.tex:12, "We attribute this to the limited number of positive cases...": right. The cause of the missing fusion gain is an interpretation with alternatives. The replacement hedges it, names the antecedent in terms the data hold (no fused configuration exceeded DW-MRI), and keeps the future-work clause.
- 16, sections/appendix/b_additional_results/2_reliability.tex:3, "Contrarily, for the fine-tuned models, preceding pre-training establishes...": right. A causal claim from a comparison gets the moderate "appeared to".
- 17, sections/6_conclusion/conclusion.tex:1, "The methodology is versatile and offers a framework...": right. The untested generalization gets weak devices and keeps every clause.

== references/rules.md, "Evidence for claims"
Group line: names what the reader loses.
- 18, sections/2_related_work/a_longitudinal_analysis.tex:1, "To date, deep learning applications to medical imaging still predominately...": right. The claim has no citation and no evidence, and the citation is left in brackets for the author.
- 19, sections/2_related_work/a_longitudinal_analysis.tex:1, "As a result, longitudinal imaging has long been established...": right. The citations and the named branches are left to the author in brackets, and "therefore" keeps the causal link that "enticing" carried.
- 20, sections/2_related_work/a_longitudinal_analysis.tex:5, "To mitigate this shortcoming, our study uses a hybrid model architecture...": right. The ranking has no source anywhere in the draft.
- 21, sections/2_related_work/b_pretraining.tex:1, "While the temporal relationship across medical image screening...": right. No source is given for the claim that the field is scarcely explored.
- 22, sections/2_related_work/b_pretraining.tex:1, "Using the potential abundance of unlabeled data, some longitudinal...": wrong, condition 2. The draft gives the evidence two sentences later: b_pretraining.tex:3 names jamaludinSelfsupervisedLearningSpinal2017 and rivailModelingDiseaseProgression2019 as such studies, and "Evidence for claims" does not report a claim the draft's text supports. "Some ... studies" is also not the "some researchers" of "Vague language".
- 23, sections/2_related_work/b_pretraining.tex:3, "Among them, contrastive learning approaches remain the most commonly applied...": right. Nothing in the draft supports "most commonly".
- 24, sections/3_methodology/d_pretraining.tex:1, "When training neural networks, task agnostic pre-training has been repeatedly shown...": right. "Repeatedly shown" carries no citation.
- 25, sections/1_introduction/introduction.tex:7, "Likewise, most deep learning applications are aimed at detecting a malignancy...": right. The citation and the share are the author's facts in brackets, and nothing is made universal.
- 26, sections/5_discussion/discussion.tex:12, "Our augmentation strategy exposes the backbone...": right. "Richest for diffusion-weighted imaging" has no evidence and gets a bracket and "may". "Largest gains" for DW holds (106.6% AUPRC, d_results.tex:15).

== references/rules.md, "Most specific term"
Group line: see the group-line notes at the end.
- 27, sections/5_discussion/discussion.tex:8, "while combined T1 in- and out-of-phase and T2-weighted MRIs exhibited the lowest accuracy...": right. "Accuracy" here stands in for predictive performance, next to "predictive power". AUPRC and AUROC are the paragraph's metrics, and the combined group is lowest on both (0.429 and 0.759).
- 28, sections/5_discussion/discussion.tex:8, "Our proposed pre-training approach improved model performance by up to 147.1\%...": right. 147.1% is the AUPRC change of DW HCCNet-T (tables/results_base_vs_pre.tex:17).
- 29, sections/3_methodology/e_finetuning.tex:1, "Additionally, we append the final pooling layer...": right. "Our initial task" is replaced by the task the draft defines at a_problem_formulation.tex:1, and the tense change matches the tense list.

== references/registers.md, "What the reader looks for" and "Voice"
Group line: names what the reader loses.
- 30, sections/4_experiments/a_data.tex:1, "We evaluate HCCNet on data that is retrospectively collected...": right. Medicine and Health is the draft's register: it is a clinical prediction study on a retrospective patient cohort for the journal Intelligent Medicine (main.tex:38). The methods name no reporting guideline, and the added sentence leaves the guideline to the author in brackets.
- 31, sections/5_discussion/discussion.tex:6, "To support HCCNet's capability to capture disease progression...": right. The authors' decision is written in the passive and takes "we". Every register that could apply rules the same way here.
- 32, sections/5_discussion/discussion.tex:16, "Despite these successes, several challenges and limitations were identified.": right. The authors' finding takes "we".

== references/rules.md, "Terms defined at first use"
Group line: names what the reader loses.
- 33, main.tex:45, "\title{HCCNet: A Self-Supervised CNN-Transformer...": right. The title is the first use of both CNN and MRI, and the definition is added there. The report's note is wrong for CNN, which introduction.tex:5 and a_longitudinal_analysis.tex:3 spell out after the title. MRI is never spelled out.
- 34, sections/abstract/abstract.tex:1, "To address this, we propose HCCNet...": right. The abstract is the first use of ConvNeXt, and the definition is left to the author in brackets. The antecedent of finding 44 is carried.
- 35, sections/1_introduction/introduction.tex:11, "The CNN backbone is pre-trained using an extended version of the DINO framework...": right. The introduction is DINO's first use, and the definition agrees with d_pretraining.tex:3 and cites caronEmergingPropertiesSelfSupervised2021, which the draft cites.
- 36, sections/3_methodology/b_architecture.tex:14, "The Transformer encoder is based on the Pre-LN implementation...": right. Pre-LN is used only here and never defined, and the inserted definition is the cited method's. The placement before "of the original Transformer encoder architecture" reads awkwardly but correctly.
- 37, sections/3_methodology/b_architecture.tex:5, "Additionally, we reimplement the patchify layer in ConvNeXt...": wrong, condition 4. The replacement turns "the lower input size typically encountered in volumetric data" into "the lower input size of volumetric data (...)". Cutting the qualifier makes the general claim read as universal, which SKILL.md, "A finding", forbids.
- 38, sections/appendix/b_additional_results/1_baseline.tex:3, "Overall differences between imaging modalities are however far less pronounced...": right. SSL is never expanded, and the ranges that replace "generally" are correct: AUPRC 0.228 to 0.375 and AUROC 0.592 to 0.724 (tables/results_baseline.tex:13-37).
- 39, sections/4_experiments/c_evaluation.tex:6, "Likewise, for the comparison against the randomly initialized baseline...": right. This is the first use of "Brier score", and the added definition is the standard one.

== Prose standard, section D, "No synonym cycling"
Group line: names what the reader loses.
- 40, HCCNet-Pico against HCCNet-P: right at each of the 11 places (c_variants.tex:1 and :10, b_implementation.tex:9 and :11, d_results.tex:5, :25 and :29, tables/results_fusion.tex:3 and :21, tables/results_pretrain_ablation.tex:3 and :27). Each passage stands at its line, the grep finds no other use, and every replacement uses the table's name with the tense changes of the tense list.
- 41, "CNN feature extractor" against "CNN backbone": right at each of the 7 places (b_architecture.tex:5, :7 and :14, d_pretraining.tex:3 and :10, 2_augmentations.tex:1, tables/results_pretrain_ablation.tex:27). The remaining use at a_longitudinal_analysis.tex:5 describes hybrid models in general, not HCCNet.
- 42, "stem" and "first convolutional layer" against "patchify layer": right at both places (d_pretraining.tex:15, the "Since the backbone..." sentence and the "This transfers..." sentence). They name the layer that b_architecture.tex:5 calls the patchify layer, and the second replacement also ends the antecedent break of finding 46.
- 43, AUC against AUROC, a_longitudinal_analysis.tex:5, "area under the receiver operating characteristic curve (AUC)...": right. This is the only AUC outside a comment.

== references/rules.md, "Clear antecedents"
Group line: names what the reader loses.
- 44, sections/abstract/abstract.tex:1, "To address this, we propose HCCNet, ...": right. The replacement in finding 34 names the referent, "the focus on cross-sectional imaging data".
- 45, sections/3_methodology/d_pretraining.tex:8, "This teaches the model to identify the same patient...": right. "Sampling series in this way" names the act the pronoun stood for.
- 46, sections/3_methodology/d_pretraining.tex:15, "This transfers ...": right, through finding 42's "Replicating the filters".
- 47, sections/4_experiments/d_results.tex:11, "This corresponds with ...": right, through finding 1.
- 48, sections/5_discussion/discussion.tex:12, "We attribute this to ...": right, through finding 15.
- 49, sections/appendix/b_additional_results/2_reliability.tex:3, "That is despite that baseline models...": right. "These lowest scores" names what "That" stood for.
- 50, sections/appendix/a_implementation/3_hyperparams.tex:3, "This is due to convergence issues...": right. "The deviation" names the referent.

== references/rules.md, "Reader's question per section"
Group line: see the group-line notes at the end.
- 51, sections/1_introduction/introduction.tex:1, "Predicting disease outcomes based on longitudinal MRI scans is important...": wrong, condition 4. The reordering adds "therefore", so the general importance now follows from the HCC case, and it drops the claim that HCC is "especially relevant".
- 52, sections/4_experiments/d_results.tex:5, "Table \ref{tab:finetuned_results} presents fine-tuned model results...": right. Once finding 87 deletes line 3, this is the first sentence of the Results. The finding it leads with holds: DW has the highest averages, 0.614 and 0.901.

== Prose standard, section A (vague qualifiers) and references/rules.md, "Vague language"
Group line: names what the reader loses.
- 53, sections/1_introduction/introduction.tex:1, "remains a significant challenge...": right. The vague qualifier becomes a specific claim with the same citation.
- 54, sections/1_introduction/introduction.tex:5, "Traditional approaches often simplify this task": right. "Usually" with the bracketed count is the form SKILL.md gives for a qualifier.
- 55, sections/1_introduction/introduction.tex:5, "However, this method has limitations...": right. "Often" becomes "usually" with the size in brackets, and the split keeps both limitations.
- 56, sections/1_introduction/introduction.tex:7, "However, many existing approaches have not fully explored": wrong, condition 4. "Existing approaches such as [...]" drops "many", so the claim reads as covering every existing approach.
- 57, sections/2_related_work/a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end...": right. "Typically" becomes "usually" with the count in brackets, and the split keeps both facts.
- 58, sections/2_related_work/a_longitudinal_analysis.tex:7, "Likewise, many of them disregard": right. The studies are named in brackets, which reads as no universal claim.
- 59, sections/2_related_work/b_pretraining.tex:1, "As a result, many deep learning studies analyzing medical images...": wrong, condition 4. "Deep learning studies ..., such as [...], continue to extract" drops "many" and reads as all such studies.
- 60, sections/3_methodology/a_problem_formulation.tex:1, "Since the frequency of liver screenings is typically determined...": right. "Usually" keeps the scope, and the source is left to the author in brackets.
- 61, figures/cumulative_gain.tex:10, "Generally, lower MAE values indicate greater robustness...": right. MAE is defined in the same note as the deviation from the optimal line, so the claim holds without the qualifier.
- 62, sections/5_discussion/discussion.tex:6, "Despite being long established as the gold standard...": wrong, condition 4. The replacement deletes "notoriously", which weakens the claim. "Formality" asks for the formal academic word in its place, not for deletion.

== references/rules.md, "Tense per section"
Group line: names what the reader loses.
Unless an item says otherwise, each quoted clause stands at its line, is a present-tense sentence in a Methodology or Results part, and its past-tense replacement reads in its place with no other change. The list quotes clauses rather than whole sentences; I did not count that as a failure of condition 1.

Methodology:
- a_problem_formulation.tex:1, "This study aims to define", "patient records are subset during fine-tuning", "\subseteq D^{(p,t)}$ is set to:": right, each.
- b_architecture.tex:3, "We use the CNN backbone": right.
- b_architecture.tex:5, "we adapt the ConvNeXt architecture" and "we replace the 2-dimensional depthwise convolutional layers...": right, each.
- b_architecture.tex:5, "the reimplement sentence as in finding 37": wrong, condition 4. It carries finding 37's replacement, which makes the "typically" claim universal.
- b_architecture.tex:14, as in finding 41: right.
- b_architecture.tex:21, "we embed the input's positional information", "we replace the conventional sequence position", "The reference point is determined solely", "and never uses the outcome itself", "we compute the vector of intervals": right, each.
- b_architecture.tex:26 ("prepend", "obtain positional encodings"), :34 ("we add the positional encodings"), :39 ("We feed the input sequence through the encoder $G$ and select") and :44 ("we feed it through a pooling layer"): right, each.
- c_variants.tex:1 as in finding 40, and c_variants.tex:10 "we additionally introduce HCCNet-C (compact)": right, each.
- d_pretraining.tex:1, "we therefore design two": right.
- d_pretraining.tex:3, "this study extends the self-supervised DINO pre-training framework", "we define a student", "the teacher is built as", "we learn to match": right, each.
- d_pretraining.tex:8, "we exploit the abundance", "we treat different series", and the "Note that" and "For a view" sentences as in finding 70: right, each.
- d_pretraining.tex:10, "this study employs a simple binary sequence-order-prediction (SOP) task": right. The past tense and the cut of the banned filler "simple" (section A) can be applied together.
- d_pretraining.tex:10, "we randomly shuffle 50\% of the input sequences", "and task the model", the footnote "we actually randomly shuffle 66\% of sequences", the CNN-parameters sentence as in finding 41, "We apply the sigmoid function", "and learn to identify shuffled sequences": right, each.
- d_pretraining.tex:15, "we do not randomly crop multiple views ... only crop a single view", "we concatenate the different series", and the remaining sentences as in findings 42 and 71: right, each.
- e_finetuning.tex:1, "we initialize the parameters of HCCNet", and the second sentence as in finding 29: right, each.
- a_data.tex:1, the first sentence as in finding 30, "This complete co-availability allows us", and the "All examinations" sentence as in finding 72: right, each. Finding 72 itself is wrong, but on the paragraph count, not on the tense.
- a_data.tex:3, "we include all available data ... and subset the data", "We partition the patient cohort", "The folds are stratified ... are distributed", "Because pre-training is re-run ... which precludes", "we only fine-tune HCCNet on longitudinal MRIs that are also included", and the remaining sentences as in finding 73: right, each.
- b_implementation.tex:1, "we pre-train both the CNN backbone", "We train the CNN over 32000 training steps", "we decay the learning rate", "We employ the same cosine decay ... but only apply it", "we also limit the temperature", "and increase the initial exponential moving average momentum", and the warm-up sentence as in finding 74: right, each.
- b_implementation.tex:3, "While MRI scans are assumed ... considers", "we train the Transformer encoder", "We set the maximal sequence length ..., apply dropout ..., and employ": right, each.
- b_implementation.tex:5, "we update HCCNet", "We fine-tune the model over 400 training steps", "but decrease the weight decay", "we select the batch size", "and apply no further hyperparameter tuning", "we then train HCCNet", "and evaluate it on the corresponding held-out fold": right, each.
- b_implementation.tex:7, "we establish a baseline", "we equally train the baseline", "We employ the same optimizer", "but slightly increase the learning rate warm-up": right, each.
- b_implementation.tex:9, "we additionally evaluate a set of exploratory multi-modal configurations", "we naively concatenate", "Concretely, we evaluate the full fusion", "augmentation views are sampled within a single contrast family", and the last sentence as in finding 2: right, each.
- b_implementation.tex:11, "we further disentangle", "we evaluate two intermediate configurations", and the last sentence as in finding 40: right, each.
- c_evaluation.tex:1, "we evaluate HCCNet's baseline", "we train ten independently seeded models ... and average", "we also explore the robustness of the model", and the sentences as in finding 75: right, each.
- c_evaluation.tex:1, "the remaining sentences as in findings 39 ...": wrong, condition 1. Finding 39's sentence ("Likewise, for the comparison against the randomly initialized baseline...") stands at c_evaluation.tex:6, not line 1.
- c_evaluation.tex:8, as in finding 81: right as a tense change. Finding 81's split is marked under its own group.
- 1_conv_layer.tex:3, "we inflate the 2D depthwise and pointwise convolutional layers ... and reduce": right.
- 2_augmentations.tex:1, the first sentence as in finding 41, "we randomly crop a multi-channel sub-volume", "further augmentations remain consistent", "we randomly shift and scale the intensity", "apply random 90 degree rotations", "and randomly flip the cropped view", "we use the same data augmentation strategy": right, each.
- 3_hyperparams.tex:3, "we slightly deviate from", and the next sentence as in finding 50: right, each.

Results:
- d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent predictive capability...": right. The past tense and the cut of the self-assessment "excellent" (section 0) keep the two reported values.
- d_results.tex:5, the contrast-enhanced T1 sentence as in finding 76, "At HCCNet-Pico" as in finding 40, "The combined T1 IOP \& T2-MRI modality reaches ... exceeds it on AUROC", "the combined modality nonetheless remains the weakest": right, each.
- d_results.tex:9, "we explore the impact of varying model complexity", "the per-fold ensemble closely follows the diagonal line", "This robustness is tightest on AUROC", "No model variant falls consistently below the diagonal line.": right, each.
- d_results.tex:11, "the models are thus robust", "the plots reveal no consistent differences ... is persistently deviating", and the third sentence as in finding 1: right, each.
- d_results.tex:15, the first sentence as in finding 86, "the magnitude of the improvement from our proposed approach varies", and the "That is" sentence as in finding 77: right, each. The tense change in finding 77's text changes no claim; its split is marked under finding 77.
- d_results.tex:19, "we compare the reliability", "the plots largely align" as in finding 78, "the expected calibration error does not display", "consistently show the lowest ... display the highest": right, each.
- d_results.tex:21, the first sentence as in finding 84, "This reduction is largest ... reaches 37.0\%", "and is smallest at 12.1\%": right, each.
- d_results.tex:25, "we evaluate whether naively fusing", "None of the fused configurations exceeds", the "Adding" sentence as in finding 79, "As all differences fall within one standard deviation": right, each.
- d_results.tex:29, the CNN-backbone-only sentence as in finding 80, "The CNN-backbone dominance also holds", "clearly exceeds the Transformer encoder alone", "the two stages contribute comparably": right, each.
- 1_baseline.tex:3, "consistently display the highest detection rate", and the last sentence as in finding 38: right, each.
- 2_reliability.tex:3, "variations in reliability scores are predominantly driven", "consistently display the lowest average reliability scores", the "That is despite" sentence as in finding 49, the "Contrarily" sentence as in finding 16, "display the lowest ... exhibit the highest": right, each.

== Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences"
Group line: names what the reader loses. The report never splits a four-sentence paragraph, so I took a part of four sentences as meeting the rule and a part of five as not.
- 63, sections/abstract/abstract.tex:3, "The CNN backbone is pre-trained..." / "We demonstrate the effectiveness...": right. Five sentences become two and three, and the second part carries finding 6.
- 64, sections/1_introduction/introduction.tex:13, both breaks ("This application not only demonstrates..." / "The methodological approach presented...", and "Thus, HCCNet provides..." / "All code..."): right, each. Six sentences become three, two and one, and finding 12 is carried.
- 65, sections/2_related_work/a_longitudinal_analysis.tex:3, "While the approach is relatively simple to implement..." / "Studies investigating treatment effects...": right. Seven sentences become three and four. The bracket replaces the filler "simple" with the author's fact, and the passive "it has been shown" gets its cited actor.
- 66, sections/2_related_work/a_longitudinal_analysis.tex:5, "Hybrid models can be trained end-to-end..." / "Compared to the aforementioned approaches...": right. With finding 57's split the parts have four and three sentences.
- 67, sections/2_related_work/b_pretraining.tex:3, "As such, they randomly derive different views..." / "\cite{jamaludin...}, for example...": right. Six sentences become three and three.
- 68, sections/5_discussion/discussion.tex:12, "the ablation sentence of finding 3" / "Finally, our exploratory multi-modal experiments...": wrong, conditions 1 and 4. The sentence before the break is named but not quoted. Once findings 26 and 3 apply, the first part is five sentences long, and the finding gives no further split.
- 69, sections/5_discussion/discussion.tex:18, "Incorporating these data sources..." / "In addition, the study's focus on a single cohort...": right. Adding data and single-cohort generalizability are two ideas.
- 70, sections/3_methodology/d_pretraining.tex:8, both breaks ("Note that in our implementation..." / "Besides that, our implementation also proposes...", and "For a view cropped from a Diffusion-Weighted MRI..." / "This teaches the model..."): right, each. Eight sentences become two, four and two, carrying the tense changes and finding 45.
- 71, sections/3_methodology/d_pretraining.tex:15, "Provided a sequence of DW-MRI's..." / "Since the backbone is pre-trained on single-channel views...": right. Six sentences become four and two, and finding 42 is carried.
- 72, sections/4_experiments/a_data.tex:1, "Prior to pre-training and fine-tuning, MR images were anonymized..." / "All examinations included in the study comprise...": wrong, condition 4. With finding 30's added sentence the first part has five sentences, and the finding gives no further split.
- 73, sections/4_experiments/a_data.tex:3, both breaks ("During fine-tuning we additionally exclude..." / "To obtain robust performance estimates...", and "Each fold serves as the held-out test set..." / "The full modeling pipeline..."): right, each. Ten sentences become two, four and four. "Robust" is not used in its statistical sense here, so "reliable" from the rules page's table is a fair replacement.
- 74, sections/4_experiments/b_implementation.tex:1, "During the first 5\% of training steps..." / "After reaching its maximum value...": right. Six sentences become three and three.
- 75, sections/4_experiments/c_evaluation.tex:1, "Every reported metric is computed..." / "For evaluation, we employ...": right. Six sentences (the paragraph runs to line 6) become three and three.
- 76, sections/4_experiments/d_results.tex:5, "Contrast enhanced T1 weighted ... appear to display..." / "The two contrasts that make up this combined group...": right. After the split and finding 52 the parts have four and four sentences. The sentence split after "albeit" changes no claim.
- 77, sections/4_experiments/d_results.tex:15, "That is, although baseline model results vary only gradually...": wrong, condition 2. Its named rule is "Formality", and the sentence's clauses are clearly connected by the "although ... while" comparison, which the rule lets share a sentence. The replacement itself keeps two of the three comparisons joined. The finding also sits in the section D group without splitting the paragraph, which has five sentences.
- 78, sections/4_experiments/d_results.tex:19, "Extended reliability metrics are presented..." / "For the fine-tuned models, the plots largely align...": right. Seven sentences become three and four.
- 82, sections/6_conclusion/conclusion.tex:1, both breaks ("Exploratory experiments further showed..." / "The methodology is versatile...", and "Yet, each condition presents..." / "Additionally, exploring the integration..."): right, each. Eight sentences become three, two and four, carrying findings 17 and 4.
- 83, sections/appendix/b_additional_results/2_reliability.tex:3, the "That is despite" sentence and the "Contrarily" sentence: wrong, condition 1. Neither sentence is quoted at the place; they are named only by their first words. The split itself (four and two sentences) would hold.

== references/rules.md, "Formality"
Group line: the first half names what the reader loses; the second half describes the breaks.
- 79, sections/4_experiments/d_results.tex:25, "Adding T1 DCE-MRI to DW-MRI lowers performance...": right. The three fusion results are joined only by enumeration, each could stand alone, and the split changes no claim.
- 80, sections/4_experiments/d_results.tex:29, "For diffusion-weighted imaging, pre-training only the CNN backbone recovers...": wrong, condition 2. The two configurations are joined by "whereas", and that contrast is the point of the sentence. "Formality" lets clearly connected ideas share a sentence.
- 81, sections/4_experiments/c_evaluation.tex:8, "Since all metrics are obtained through cross-validation...": wrong, condition 2. "So" makes the reading of the standard deviations a consequence of the shared development data. The replacement keeps that link with "therefore", which shows the ideas are clearly connected.
- 85, sections/2_related_work/b_pretraining.tex:1, "However, the usefulness of transfer learning from natural images remains fiercely disputed...": wrong, condition 4. Deleting "fiercely" weakens the claim. "Formality" asks for the formal word in its place, and no rule asks for the cut.

== Prose standard, section 0
Group line: see the group-line notes at the end.
- 84, sections/4_experiments/d_results.tex:21, "More interestingly, the comparison between baseline and fine-tuned models'...": right. The performative aside goes and the tense change is carried.
- main.tex:47 "Longitudinal 3D MRI Images: -- A Case Study...", main.tex:49, :51, :53 "...Images -- A Case Study...", main.tex:57 "...Images -- Application to...", and sections/5_discussion/discussion.tex:1 "HCCNet - a spatio-temporal neural network ... encoder - to predict": right, each. Each is a `--` or spaced-hyphen dash in an internal comment, which section 0 covers, and each is rewritten without the dash.

== references/rules.md, "Transitions"
Group line: names what the reader loses.
- 86, sections/4_experiments/d_results.tex:15, "Finally, we evaluate the impact of our proposed pre-training approach...": right. Two more subsections follow, so "Finally" states a sequence the text does not have, and the transition is cut.

== Prose standard, section C (meta-commentary) and section E (restating closes)
Group line: names what the reader loses.
- 87, sections/4_experiments/d_results.tex:3, "We report HCCNet's fine-tuned performance (i)...": right. The sentence announces what the section does, and section C cuts it.
- 88, sections/4_experiments/d_results.tex:11, "At least on the data evaluated in this study, variations in model complexity...": right. The closing sentence restates the paragraph, and section E cuts it.

== Prose standard, section E, "Spec-sheet voice"
Group line: names what the reader loses.
- 89, sections/1_introduction/introduction.tex:9, "HCCNet integrates a 3D adaptation of the ConvNeXt architecture...": right. "Allowing it to" becomes what each part does, and that matches b_architecture.tex:3.
- 90, sections/1_introduction/introduction.tex:11, "This self-supervised learning approach allows the model to learn...": right. "Allows" becomes what the model does.

== Prose standard, section A, banned filler
Group line: names what the reader loses.
- 91, sections/2_related_work/b_pretraining.tex:3, "Instead of simply comparing view pairs from different patients": right. "Only" is the concrete meaning.
- 92, sections/2_related_work/b_pretraining.tex:5, "adopts a simple sequence-order-prediction task": right. Section A allows the cut.

== Prose standard, section F, "no hard wrapping"
Group line: names what the reader loses.
- 93, sections/6_conclusion/ack.tex:2-3, "... MRI-radiomics" / "Primair leverkanker ...": right. One sentence is broken across two source lines, the quote has the required form, and the line break is replaced by a space.
- 94, sections/6_conclusion/ack.tex:6-8, "... (OpenAI ChatGPT) to help" / "refine the English language ..." and "... reviewed and edited the" / "content as needed ...": right, each.

== Group lines that fail
- "Reader's question per section": the line ("The Introduction does not open with a consequence or a gap, and the Results section does not open with a finding") describes the breaks and does not name what the reader loses.
- "Most specific term": the stated loss ("'accuracy' is a reported metric on which the stated ranking does not hold") is contradicted by tables/results_finetune.tex. The group mean accuracies are 0.854 (DW), 0.811 (T1 DCE) and 0.799 (combined), so the ranking holds on accuracy too. The line also does not cover findings 28 and 29.
- Prose standard, section 0: the line ("Evaluative words that carry no measured claim...") does not cover the six dash entries listed under it.
- Every group has a line under its heading.

== Passages and replacements given by reference
- Passage not quoted at the place: 83 (both sentences named only by their first words) and 68 (the sentence before the break given as "the ablation sentence of finding 3"). Both are marked wrong by condition 1 above.
- Replacement stated by pointing to text the report writes elsewhere, which I counted as text and not as an instruction:
  - 5: "the same sentence, followed by ...".
  - 44, 46, 47, 48: "replacement as in finding N".
  - 64 (first break), 67, 69: "the same two sentences with an empty line between them".
  - 66, 68, 71, 82 (first break), 83: assembled from other findings' replacements.
  - The tense list's "as in finding N" entries.
  - If "the same two sentences with an empty line between them" is to be read as an instruction ("split before ..."), then 64 (first break), 67 and 69 fail condition 4.
- No finding lacks a replacement, and none gives a replacement that is an instruction in place of text.

Manuscript marker 2: agent aafb8073cdd7eafde, served claude-opus-5-5 as ordo-high, 247629 tokens, 40 tool uses, 15.4 min. The marks below are the agent's final message, verbatim apart from character names.

Marks for /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/10-run/manuscript-report.md

I read the following in full with the file-reading tool: the report (623 lines), the prose standard, SKILL.md, rules.md, registers.md and all 33 draft files. I ran no command. Word counts below are my own counts of the quoted text. Under condition 3, the register the report applies (Medicine and Health, journal Intelligent Medicine, main.tex:38) is the draft's discipline. Its Voice rule is the same as Engineering and CS.

Result: 37 rows are right and 96 are wrong.

GROUP 1. Hedging

- G1 #1, abstract.tex:3, "Our results show that HCCNet substantially improves...": **wrong (4).**
  - The passage stands, and the "may ... once it is validated" hedge does end the hedging break.
  - The limit bracket names only the ECE rise. The draft's other reliability measures also fail "improves ... reliability":
    - MCE rose for all five T1 DCE-MRI models (e.g. HCCNet-F 0.679 to 0.748) and for DW-MRI HCCNet-C and HCCNet-N.
    - The Brier score rose for HCCNet-F on T1 IOP & T2-MRI (0.170 to 0.174).
  - The replacement writes a bare "%" ("5.6% to 147.1%") into a .tex line. In LaTeX that comments out the rest of abstract.tex:3, so the text does not read as a sentence there.
- G1 #2, abstract.tex:5, "The methodological approach presented in this paper is versatile...": **right.**
  - The passage stands, and it is an untested generalization stated without a hedge.
  - "may be adapted to other ... applications" uses a weak device and keeps the adaptability claim ("versatile" says the same thing).
  - The sentence is 19 words.
- G1 #3, abstract.tex:5, "Its ability to handle varying patient record lengths...": **wrong (4).**
  - The passage stands, and "may make it a framework" ends the hedging break.
  - "invaluable" is dropped with no named rule. If it is read as a degree word, section A is not named and the replacement cuts the word instead of replacing it.
  - The "Also breaks" line says 32 words. The sentence has 34.
- G1 #4, introduction.tex:13, "Thus, HCCNet provides a flexible framework...": **wrong (4).**
  - The passage stands, and "HCCNet may be adapted to other ... tasks. In those tasks, it may improve..." ends the hedging, "Thus" and "provides" breaks.
  - The passage is 28 words. The finding names section E only for spec-sheet voice, never for sentence length.
- G1 #5, introduction.tex:13, "This application not only demonstrates HCCNet's capabilities...": **wrong (2, 4).**
  - The passage stands.
  - The replacement "This application addresses a need..." adds no hedge to any claim. It cuts the claim "demonstrates HCCNet's capabilities", which the Hedging rule keeps.
  - The section D line is not met: one "not only ... but also" does not break a rule that allows two binary contrasts per page.
  - The stated count is 32 words; the sentence has 30.
- G1 #6, discussion.tex:10, "Inspection of the models' reliability diagrams further demonstrated...": **wrong (4).**
  - The passage stands, and "suggest" and "may" weaken the strong device.
  - The replacement still says pre-training "aligned the models closer to the target distribution" with no limit. ECE rose for HCCNet-F on T1 IOP & T2-MRI (0.182 to 0.204, tables/results_reliability.tex:23).
  - "demonstrated" becomes the present "suggest", a tense change the finding does not name. "further" is dropped with no rule.
- G1 #7, discussion.tex:10, "Thus, even for imaging modalities where...": **wrong (4).**
  - The passage stands, and the passage's 33 words are not named under section E.
  - The first replacement sentence is 25 words.
  - It narrows "imaging modalities" to T1 DCE-MRI alone and drops "Thus" and "even" with no named rule.
  - It stacks "suggests ... may", two devices on one claim.
  - The bare "%" signs comment out the rest of the line in .tex.
- G1 #8, discussion.tex:16, "Additionally, while HCCNet demonstrates strong predictive capabilities...": **wrong (4).**
  - The passage stands.
  - The replacement gives no hedge device. It swaps the claim for a data statement narrowed to DW-MRI ("average AUROC of 0.901 with DW-MRI").
  - It drops "Additionally", "careful" and "specific" with no rule.
- G1 #9, d_results.tex:21, "Improved calibration makes the models predicted scores...": **wrong (2, 4).**
  - The passage stands.
  - That improved calibration makes scores more dependable for probabilistic interpretation follows from what calibration is (a well-established fact), so Hedging does not ask for a hedge.
  - The Formality line names a redundancy ("more reliable and more dependable"). No Formality bullet describes redundancy.
  - "Improved calibration suggests that..." makes calibration the agent that suggests.
  - The passage's present tense in Results is left and not named.

GROUP 2. Limitations and alternative interpretations

- G2 #10, d_results.tex:21, "More interestingly, the comparison between baseline and fine-tuned models'...": **wrong (4).**
  - The passage stands, and the HCCNet-F limit (0.182 to 0.204) is right.
  - The passage is 36 words, and section E is not named.
  - The replacement's first sentence is 27 words.
  - It drops "indicates", which strengthens the claim with no named rule.
  - It writes a bare "&" in "T1 IOP & T2-MRI", which does not compile in running .tex text.
- G2 #11, d_results.tex:5, "The combined T1 IOP \& T2-MRI modality reaches AUPRC = 0.420...": **wrong (4).**
  - The passage stands, and splitting the 40 words ends the length break.
  - The AUPRC limit omits HCCNet-Pico itself, the variant the passage is about: T2-MRI 0.419 against the combined 0.420 (tables/results_finetune.tex:25 and :35). It names only HCCNet-C and HCCNet-T.
- G2 #12, discussion.tex:12, "An ablation that pre-trains only the CNN backbone...": **wrong (4).**
  - The passage stands.
  - The replacement brings in "most", a vague qualifier.
  - Its first sentence is 30 words.
  - The relation fails on AUROC for T1 DCE-MRI: CNN backbone only 0.773 against Transformer encoder only 0.755, out of a 0.154 full gain. No bracket names this.
  - It drops "further" and the "comparatively little" clause instead of giving its number, and it writes a bare "&".
- G2 #13, conclusion.tex:1, "Beyond the original framework, an ablation of the two pre-training stages...": **wrong (4).**
  - The passage stands.
  - The replacement uses "most" (vague) and has a 25-word first sentence.
  - It has no AUROC limit (T1 DCE-MRI 0.773 against 0.755).
  - It drops "Beyond the original framework" with no rule and writes a bare "&".
- G2 #14, c_evaluation.tex:8, "To avoid over-interpreting the limited number of positive cases...": **wrong (2).**
  - The passage stands, but it describes the method. It is not a claim whose evidence allows another explanation, so the words of "Limitations" do not describe it.
  - The bracket's point is that the results contradict the protocol, which is a question of content (rules.md, "Evidence for claims", last bullet).
  - The passage's 32 words are not named, and "therefore" is dropped with no rule.

GROUP 3. Evidence for claims

- G3 #15, a_longitudinal_analysis.tex:1, "To date, deep learning applications to medical imaging still predominately...": **right.**
  - The passage stands, uncited, with no evidence elsewhere in the draft.
  - The bracket asks for the share in place of "predominately". "still" is redundant with the kept "To date".
- G3 #16, a_longitudinal_analysis.tex:1, "However,  physicians usually assess...": **right.**
  - The passage stands, double space included, and is uncited.
  - The share bracket replaces the frequency word "usually" as the rule asks.
- G3 #17, a_longitudinal_analysis.tex:1, "As a result, longitudinal imaging has long been established...": **wrong (2, 4).**
  - The passage stands, uncited.
  - "recent studies" is not a Vague language row: the second form covers only a changed noun, so the "Vague language" line fails.
  - The replacement drops "long been established" (duration), the causal link "enticing" and "recent", all with no rule.
  - The passage's 36 words are not named.
- G3 #18, a_longitudinal_analysis.tex:5, "To mitigate this shortcoming, our study uses a hybrid model architecture...": **wrong (4).**
  - The passage stands, uncited.
  - "the third of the three frameworks" replaces the ranking claim "third most common" with a position in a list, while the bracket still asks for the rank. The claim is changed.
- G3 #19, b_pretraining.tex:3, "Among them, contrastive learning approaches remain the most commonly applied...": **right.**
  - The passage stands, uncited.
  - The replacement writes the sentence out with "[the citation or the count of studies that shows it]". Each alternative supplied alone supports the claim.
- G3 #20, d_pretraining.tex:1, "When training neural networks, task agnostic pre-training has been repeatedly shown...": **wrong (2).**
  - The passage stands.
  - The draft gives evidence for the claim. introduction.tex:7 says pre-training approaches help "improve model performance" \citep{tang2021self}, and the draft's own tables/results_base_vs_pre.tex shows gains. "Evidence for claims" does not report a claim that has such evidence.
- G3 #21, introduction.tex:7, "Likewise, most deep learning applications are aimed at detecting a malignancy...": **wrong (4).**
  - The passage stands, uncited.
  - The replacement writes "few studies [their count, with citations]". "few" is a vague qualifier left in the text, swapped in for "a lack of".
  - The passage's 27 words are not named.
- G3 #22, discussion.tex:6, "Despite being long established as the gold standard...": **wrong (4).**
  - The passage stands, uncited.
  - The Formality line calls "notoriously" an intensifier. Formality replaces an intensifier with a formal word of the same strength, but the replacement cuts it.
  - It drops "long" and the concession with no rule. The passage's 26 words are not named.

GROUP 4. Vague language

- G4 #23, introduction.tex:7, "However, many existing approaches have not fully explored...": **wrong (4).**
  - The passage stands, and the "[the approaches, ... or their count]" bracket follows the row.
  - The replacement drops "fully" (which turns "not fully explored" into "not explored") and "existing", with no rule.
  - It turns "particularly for diseases" into "of diseases", which narrows the scope.
- G4 #24, b_pretraining.tex:1, "As a result, many deep learning studies analyzing medical images...": **wrong (4).**
  - The passage stands, and the bracket follows the row.
  - The replacement drops "continue to" (the claim that the practice persists) with no rule.
- G4 #25, b_pretraining.tex:1, "Using the potential abundance of unlabeled data, some longitudinal...": **wrong (4).**
  - The passage stands.
  - Naming \cite{jamaludin...} and \cite{rivail...} (b_pretraining.tex:3) follows the "some researchers" row.
  - "have therefore started to apply" becomes "have therefore applied", which drops the onset claim with no rule.
- G4 #26, a_longitudinal_analysis.tex:7, "Likewise, many of them disregard...": **wrong (4).**
  - The passage stands.
  - "[the studies, with their citations, or their count]" drops "of them", which limits the claim to the hybrid-model studies of the previous sentence. A count supplied alone no longer reads as a share of those studies.

GROUP 5. Section A (vague qualifiers)

- G5 #27, c_variants.tex:1, "In addition to our base model, called HCCNet-Pico...": **wrong (4).**
  - The passage stands, and the bracketed ratios 0.56, 0.75, 2.09 and 3.29 are correct from c_variants.tex:10.
  - "introduce" becomes "introduced", an unnamed tense change.
  - "size" is renamed "parameter count" with no named rule.
- G5 #28, abstract.tex:1, "Longitudinal MRI analysis is important for predicting disease outcomes...": **wrong (4).**
  - The passage stands, and the bracket replaces "considerably".
  - Dropping "particularly" narrows the claim to chronic conditions.
  - "In HCC" narrows "chronic conditions like HCC" to HCC alone.
  - "can ... influence" becomes "influences", which drops the modal.
- G5 #29, abstract.tex:3, "We additionally find that an exploratory naive fusion...": **wrong (2, 4).**
  - The passage stands. The numbers 0.894, 0.535 to 0.587 and 0.588 are right.
  - The replacement is 29 words.
  - It states "fell below" without the limit the draft sets: tables/results_fusion.tex:21 says all differences fall within one SD.
  - It drops "We additionally find that" and changes the tense, unnamed.
  - The "Limitations" line names data that contradict the claim (no gain at all). That is a content question under rules.md, "Evidence for claims".
- G5 #30, discussion.tex:12, "Finally, our exploratory multi-modal experiments show...": **wrong (4).**
  - The passage stands.
  - The replacement is 26 words, and the passage's 24 words are not named.
  - "lowered its AUPRC" gives no within-one-SD limit.
  - "show that" is dropped with no rule.
- G5 #31, conclusion.tex:1, "Exploratory experiments further showed that naively fusing...": **wrong (4).**
  - The passage stands, and the split ends the 42-word length.
  - "suggesting that ... will require" becomes "may be required", a change of hedge strength with Hedging not named.
  - "the full potential" is dropped with no rule.
- G5 #32, introduction.tex:1, "This is especially relevant in conditions like hepatocellular carcinoma...": **wrong (4).**
  - The passage stands, and "Such prediction" fixes the antecedent.
  - "especially" is cut instead of replaced, "conditions like HCC" is narrowed to HCC, and "can" is dropped from "can considerably impact".
- G5 #33, introduction.tex:1, "However, despite its potential, the development of effective predictive models...": **wrong (4).**
  - The passage stands, and the "[the specific obstacle ...]" bracket is allowed.
  - The replacement drops "despite its potential", "effective" and "fully" with no rule.
  - The passage's 25 words are not named.
- G5 #34, introduction.tex:5, "Traditional approaches often simplify this task...": **wrong (4).**
  - The passage stands, and the share bracket replaces "often".
  - It drops "Traditional", a word that sets the claim's scope.
  - The passage's 26 words are not named.
- G5 #35, introduction.tex:5, "However, this method has limitations, particularly in the medical domain...": **wrong (4).**
  - The passage stands.
  - The bracket for the frequency word "often" asks for "[the typical dataset size]", not a share. "typical" is itself a section A qualifier.
  - "particularly" is cut, and "such as texture, contrast, and noise" becomes the closed "in texture, contrast and noise".
- G5 #36, a_problem_formulation.tex:1, "Since the frequency of liver screenings is typically determined...": **wrong (4).**
  - The passage stands.
  - The "or" bracket fails its own test: "the protocol that sets it", supplied alone, does not keep the share scope that "typically" needs.
  - "may" and "more or less regular" are dropped.
  - The passage's 32 words are not named.
- G5 #37, b_architecture.tex:5, "Additionally, we reimplement the patchify layer in ConvNeXt...": **wrong (4).**
  - The passage stands, and the finding names "Terms defined" for "patchify layer".
  - The replacement still leaves "patchify layer" undefined.
  - "reimplement" becomes "reimplemented", an unnamed tense change.
- G5 #38, d_results.tex:5, "At HCCNet-Pico, the standalone T2-MRI model (AUPRC = 0.419...": **wrong (4).**
  - The passage stands, and the split ends the length break.
  - "within 0.013 of each other" is a number computed from 0.419 minus 0.406. It is not in the draft and is not in square brackets.
- G5 #39, d_results.tex:9, "Across model variants and imaging modalities, the per-fold ensemble closely follows...": **wrong (4).**
  - The passage stands, and the MAE bracket replaces "closely".
  - "follows" becomes "deviated", an unnamed tense change.
- G5 #40, d_results.tex:9, "This robustness is tightest on AUROC and slightly looser on AUPRC...": **wrong (4).**
  - The passage stands, and the brackets replace "slightly" and "modest".
  - "is" becomes "was", an unnamed tense change.
- G5 #41, d_results.tex:11, "Across imaging modalities, the models are thus robust...": **wrong (2, 4).**
  - The passage stands.
  - It is the first sentence of its paragraph, so "restating close" (a final sentence) does not describe it.
  - "MAE stayed at or below [the largest MAE]" says nothing and drops the robustness claim. The tense change is unnamed.
- G5 #42, d_results.tex:11, "This corresponds with the results presented in Table...": **wrong (4).**
  - The passage stands.
  - The replacement narrows the claim to DW-MRI AUROC and drops the comparison with the differences between modalities. "agree" has no stated object.
  - Other modalities break the claim and are not bracketed: T1 DCE-MRI AUPRC runs 0.329 to 0.628 across variants.
  - The passage's 27 words are not named.
- G5 #43, d_results.tex:11, "At least on the data evaluated in this study, variations in model complexity...": **right.**
  - The passage stands as the last sentence of the paragraph.
  - It restates the paragraph's robustness and model-size claims, and "delete" is the replacement section E's restating-close rule asks for, named in its own line.
- G5 #44, b_implementation.tex:9, "Owing to the limited number of positive cases...": **wrong (4).**
  - The passage stands.
  - "at most 0.054" is a computed number given outside square brackets. A note to confirm it is not a bracket.
  - The replacement is 29 words.
  - It narrows "downstream performance" to DW-MRI AUROC without the AUPRC limit (0.507 to 0.725).
- G5 #45, d_results.tex:19, "For the fine-tuned models, the plots largely align...": **wrong (4).**
  - The passage stands.
  - "align" becomes "matched", an unnamed tense change.
  - "the ranking of modalities" adds a relation the draft does not state.
- G5 #46, d_results.tex:25, "Adding T1 DCE-MRI to DW-MRI lowers performance...": **wrong (4).**
  - The passage stands, and the list form ends the section D break.
  - "within 0.003" and "0.047 lower" are computed numbers outside square brackets.
  - "lower performance" has no within-one-SD limit (tables/results_fusion.tex:21).
- G5 #47, d_results.tex:29, "For diffusion-weighted imaging, pre-training only the CNN backbone recovers essentially all...": **wrong (4).**
  - The passage stands.
  - "0.002 above the baseline" is a computed number outside square brackets.
  - The first replacement sentence is 25 words.
- G5 #48, d_results.tex:29, "The CNN-backbone dominance also holds for dynamic contrast enhanced T1-weighted images...": **wrong (4).**
  - The passage stands.
  - "by more than two standard deviations" is a computed comparison outside brackets.
  - The replacement is 33 words, and "holds/exceeds" becomes "held/exceeded", an unnamed tense change.
  - On AUROC (0.773 against 0.755) the dominance does not hold, and no bracket names that.
- G5 #49, c_evaluation.tex:8, "Since all metrics are obtained through cross-validation, we note that...": **wrong (4).**
  - The passage stands.
  - "share three of their four folds" is computed and not bracketed.
  - "not fully independent" becomes "not independent", and "likely to slightly understate" becomes "may understate", both strength changes with no named rule.
- G5 #50, 3_hyperparams.tex:3, "Note that during CNN-backbone pre-training we slightly deviate...": **wrong (4).**
  - The passage stands.
  - "two hyperparameter settings" is a count the draft does not give. b_implementation.tex:1 also names the EMA momentum as departing from the original DINO.
  - "deviate" becomes "changed", an unnamed tense change.
- G5 #51, 3_hyperparams.tex:3, "Consequently, we drastically reduced the projection head's output dimensionality...": **wrong (4).**
  - The passage stands.
  - "reduced the temperature" becomes "set the temperature", which drops the claim of a reduction with no rule.
  - The replacement is still about 23 words, and the passage's 25 words are not named.
- G5 #52, 1_baseline.tex:3, "Overall differences between imaging modalities are however far less pronounced...": **wrong (4).**
  - The passage stands, and its ranges are correct (0.592 to 0.724, 0.703 to 0.936, 0.228 to 0.375).
  - Ranges taken across modalities and variants together do not state the between-modality differences the claim is about.
  - The first sentence is 26 words.
  - "However" is dropped and the tense changes, both unnamed.
  - The passage's 30 words are not named.
- G5 #53, 2_reliability.tex:3, "As for the comparison across performance metrics...": **wrong (4).**
  - The passage stands.
  - "differ more between imaging modalities than between model variants" fails under fine-tuned ECE: within T1 DCE-MRI it runs 0.131 to 0.274, a wider span than the modality averages. No bracket names this.
  - The causal "driven by" is dropped with no rule.
- G5 #54, figures/cumulative_gain.tex:10, "Generally, lower MAE values indicate greater robustness...": **wrong (4).**
  - The passage stands.
  - Cutting "Generally" needs the finding to name the definition that holds the claim in every case (the MAE at c_evaluation.tex:1). It names none.
  - Cutting the second clause has no named rule.
- G5 #55, b_implementation.tex:7, "We employ the same optimizer, learning rate schedule...": **wrong (4).**
  - The passage stands.
  - The finding names "Voice", but the first replacement sentence "The baseline used the same optimizer..." is active, not passive.
  - "to ensure a more stable convergence" becomes "to stabilize convergence", which drops the comparison.
- G5 #56, d_pretraining.tex:1, "Additionally, subset $V^{(p,t)}$ contains only roughly 75\%...": **right.**
  - The passage stands. 703 and 963 stand in a_data.tex:1 and :3 as counts of examinations, and "[73%]" is a computed number placed in brackets.
  - The only defect is that a bare "%" inside an author bracket comments out the rest of the line in .tex.

GROUP 6. What the reader looks for

- G6 #57, a_data.tex:1, "We evaluate HCCNet on data that is retrospectively collected...": **right.**
  - The passage stands, and no methods text names a reporting guideline.
  - The replacement writes the sentence in the passive past (Tense and Voice named), splits the 40 words into 20 and 16, and adds the guideline bracket after it.

GROUP 7. Most specific term

- G7 #58, discussion.tex:8, "Our proposed pre-training approach improved model performance by up to 147.1\%...": **wrong (4).**
  - The passage stands, and "AUPRC" is the specific term.
  - "average AUPRC rose by 48.9\% and 52.3\%" misstates the quantity. The draft's 48.9% is the mean of the per-variant relative changes (d_results.tex:15). The rise of the average T1 DCE-MRI AUPRC (0.347 to 0.520) is about 50%.
- G7 #59, discussion.tex:8, "Overall, fine-tuned model results varied substantially...": **wrong (4).**
  - The passage stands, and 0.429 and 0.614 are right.
  - The replacement is 25 words and writes a bare "&" in "T1 IOP & T2-MRI" in running .tex.

GROUP 8. Terms defined at first use

- G8 #60, main.tex:45, "\title{HCCNet: A Self-Supervised CNN-Transformer...}": **wrong (4).**
  - The passage stands, and expanding CNN and MRI is right.
  - "Transformer" has its first use in the same title and is never defined in the draft. The replacement leaves that break in the passage.
- G8 #61, abstract.tex:1, "To address this, we propose HCCNet, a novel model architecture...": **wrong (4).**
  - The passage stands, and the ConvNeXt bracket and "the focus on cross-sectional data" are right.
  - "a novel model architecture", "fine-grained" and "complex" are dropped with no rule.
  - The second sentence joins two claims with "and", two ideas in one sentence.
- G8 #62, introduction.tex:11, "The CNN backbone is pre-trained using an extended version of the DINO framework...": **right.**
  - The passage stands at DINO's first use.
  - The definition bracket with \citet{caron...} is added, and the split gives sentences under 20 words while keeping "adapted to 3D MRI".
- G8 #63, b_architecture.tex:14, "The Transformer encoder is based on the Pre-LN implementation...": **wrong (4).**
  - The passage stands at Pre-LN's only use.
  - The replacement brings in "layer normalization" and "sublayer", which the draft defines nowhere, with no bracket.
- G8 #64, b_implementation.tex:3, "While MRI scans are assumed to be i.i.d. during CNN pre-training...": **wrong (4).**
  - The passage stands, and the i.i.d. expansion is right.
  - "assumed to be" becomes "treated as" and "considers" becomes "accounted for", with no rule.
  - The split drops the contrast "While", with Formality not named.

GROUP 9. Section D (synonym cycling)

- G9 #65, c_variants.tex:1, "The five model variations are:": **right.** The phrase stands, and "The five model variants are:" uses the draft's name for the same five configurations.
- G9 #66, c_evaluation.tex:1, "For the comparison across model variations": **right.** The phrase stands, and "model variants" ends the cycling.
- G9 #67, d_results.tex:5, "stratified by imaging modality and model architecture": **right.** The phrase stands, and "model variant" names the same set.
- G9 #68, d_results.tex:5, "across model architectures": **right.**
  - The phrase stands, and "across model variants" ends the cycling.
  - #100 gives the same place again (see the lists).
- G9 #69, d_results.tex:9, "\textbf{Comparison across Model Variations.}": **right.** The heading stands, and "Model Variants" ends the cycling.
- G9 #70, d_results.tex:9, "we explore the impact of varying model complexity...": **wrong (4).**
  - The phrase stands.
  - "explore" becomes "explored", a tense change the group does not name.
  - "impact" becomes "effect" with no rule.
- G9 #71, d_results.tex:11, "the plots reveal no consistent differences across model architecture...": **wrong (4).**
  - The phrase stands.
  - "reveal/is deviating" becomes "showed/deviated" (unnamed tense change).
  - "consistent" and "persistently" are reinterpreted as "recurred across folds" and "in every fold", with section A not named. "optimal" is dropped.
- G9 #72, d_results.tex:15, "stratified by image modality and model variation": **wrong (4).**
  - The phrase stands.
  - The replacement also renames "image modality" to "imaging modality". That rename is not among the group's stated names, and its other uses are not given (d_results.tex:9 "the varying image modalities", d_results.tex:15 "across image modalities").
- G9 #73, 1_baseline.tex:3, "stratified by image modality and model variation": **wrong (4).** The phrase stands, but it carries the same unstated "image modality" rename, and the term's other places are not listed.
- G9 #74, 2_reliability.tex:3, "stratified by imaging modality and model architecture": **right.** The phrase stands, and "model variant" ends the cycling.
- G9 #75, tables/hyperparams.tex:36, "for model variations HCCNet-F, -C, and -P": **right.** The phrase stands, and "model variants" ends the cycling.
- G9 #76, b_architecture.tex:5, "\textbf{CNN Feature Extractor.}": **right.** The heading stands, and "CNN Backbone" is the draft's own term for the same network (b_architecture.tex:5 continues "For the CNN backbone").
- G9 #77, b_architecture.tex:7, "The CNN feature extractor takes the MR images as inputs": **right.** The phrase stands, and "The CNN backbone takes..." ends the cycling.
- G9 #78, b_architecture.tex:14, "the image embeddings obtained from the CNN feature extractor": **right.** The phrase stands, and "...from the CNN backbone" ends the cycling.
- G9 #79, d_pretraining.tex:3, "\textbf{CNN Feature Extractor.}": **right.** The heading stands, and "CNN Backbone" ends the cycling.
- G9 #80, d_pretraining.tex:10, "we keep the parameters of the CNN feature extractor fixed": **wrong (4).** The phrase stands, but the replacement "see entry 89, which gives this sentence whole" is a reference to another finding, not text.
- G9 #81, 2_augmentations.tex:1, "During pre-training of the CNN feature extractor": **right.** The phrase stands, and "...of the CNN backbone" ends the cycling.
- G9 #82, tables/results_pretrain_ablation.tex:27, "pre-trains the CNN feature extractor using DINO": **right.** The phrase stands, and "pre-trains the CNN backbone using DINO" ends the cycling.

GROUP 10. Tense per section, with Voice

- G10 #83, d_pretraining.tex:1, "To fully use all available data and improve the representations...": **wrong (4).**
  - The passage stands, and "designed" fixes the tense.
  - The replacement is 34 words, and the passage's 36 words are not named.
  - "fully" is dropped with no rule.
- G10 #84, d_pretraining.tex:3, "For the CNN backbone, this study extends the self-supervised DINO...": **right.** The passage stands, and "we extended" gives the past tense and "we" for the authors' contribution in place of "this study".
- G10 #85, d_pretraining.tex:8, "Note that in our implementation, we use a 3D crop...": **right.** The passage stands. "Note that" is cut under section C (named), and "Global views were cropped at shape $s = 72^3$..." is past passive.
- G10 #86, d_pretraining.tex:8, "Besides that, our implementation also proposes a novel augmentation strategy...": **wrong (4).**
  - The passage stands, and "We also proposed" fixes the tense and the personified artifact.
  - "novel", a claim, is dropped with no rule.
- G10 #87, d_pretraining.tex:8, "This teaches the model to identify the same patient...": **wrong (2, 4).**
  - The passage stands.
  - It is listed under the Methodology past-tense row, but the replacement "This sampling trains..." keeps the present tense. Either the sentence is a general mechanism the row does not cover, or the replacement leaves the tense break.
- G10 #88, d_pretraining.tex:10, "To improve the encoder's understanding of disease progression...": **right.**
  - The passage stands.
  - "we used" fixes the tense and the third-person "this study". "simple" is cut (section A named), and "understanding" becomes "representation" (personification named).
- G10 #89, d_pretraining.tex:10, "During the SOP pre-training, we keep the parameters...": **right.**
  - The passage stands, and "the parameters of the CNN backbone were initialized with the pre-trained weights and kept fixed" is past passive and carries the synonym fix.
  - It repeats the place #80 gives (see the lists).
- G10 #90, d_pretraining.tex:15, "Note that during pre-training of the Transformer encoder we do not randomly crop...": **wrong (4).**
  - The passage stands, and the past passive replacement is right.
  - The passage is 33 words, and section E is not named in its own line.
- G10 #91, d_pretraining.tex:15, "Likewise, we concatenate the different series...": **wrong (4).**
  - The passage stands.
  - "The series of each MRI scan were concatenated..." drops "instead of randomly selecting a single one" (the contrast with CNN pre-training) and "Likewise", with no rule.
- G10 #92, d_pretraining.tex:15, "Since the backbone is pre-trained on single-channel views, we reconcile...": **right.** The passage stands, and the three past passive sentences (20, 18 and 9 words) keep the stem expansion and the replication mechanism.
- G10 #93, b_implementation.tex:1, "As aforementioned, we pre-train both...": **wrong (4).**
  - The passage stands, and "were pre-trained" fixes the tense and voice.
  - "As aforementioned" is meta-commentary under section C. The replacement cuts it without the finding naming that rule.
- G10 #94, b_implementation.tex:1, "We train the CNN over 32000 training steps...": **right.** The passage stands, and "The CNN was trained for 32000 steps with the AdamW optimizer..." is past passive and keeps every value.
- G10 #95, b_implementation.tex:1, "After reaching its maximum value, we decay the learning rate...": **right.** The passage stands, and "the learning rate was decayed with a cosine schedule" is past passive.
- G10 #96, b_implementation.tex:1, "Contrary to the original DINO implementation, we also limit the temperature...": **wrong (4).**
  - The passage stands.
  - The split leaves the condition "Unlike the original DINO implementation" out of the second sentence about the momentum, which it governs.
  - "also" is dropped, and the passage's 29 words are not named.
- G10 #97, b_implementation.tex:5, "During fine-tuning, we update HCCNet...": **right.** The passage stands, and "HCCNet was updated on the development subset" is past passive.
- G10 #98, b_implementation.tex:5, "Within each of the five outer cross-validation folds, we then train HCCNet...": **wrong (4).**
  - The passage stands.
  - The first replacement sentence is 26 words.
  - "same default" is dropped with no rule.
- G10 #99, b_implementation.tex:11, "We conduct this ablation on the HCCNet-Pico variant...": **right.** The passage stands, and "The ablation was run on the HCCNet-Pico variant..." is past passive.
- G10 #100, d_results.tex:5, "HCCNet trained using diffusion weighted MR images shows excellent predictive capability...": **wrong (4).**
  - The passage stands, and "reached" fixes the tense.
  - "excellent predictive capability" is dropped with section A not named.
  - The passage's 27 words are not named.
  - It overlaps #68.
- G10 #101, d_results.tex:5, "At the group level, the combined modality nonetheless remains the weakest...": **right.** The passage stands, and "remained" is the Results past. The group averages (0.429/0.759) are the lowest.
- G10 #102, d_results.tex:9, "No model variant falls consistently below the diagonal line.": **wrong (4).**
  - The passage stands.
  - The replacement turns the vague "consistently" into "in every fold" with section A not named.
- G10 #103, d_results.tex:15, "Across imaging modalities, the magnitude of the improvement...varies.": **right.** The passage stands, and "The improvement ... varied in magnitude across imaging modalities" is past and keeps the claim.
- G10 #104, d_results.tex:19, "For the randomly initialized baseline, however, the expected calibration error does not display...": **right.** The passage stands, and "did not show the same negative relationship" is past with the claim kept.
- G10 #105, d_results.tex:21, "This reduction is largest for diffusion weighted MR images at 56.0\%...": **wrong (4).**
  - The passage stands, and the numbers and "baseline ECE was the lowest" (mean 0.195) are right.
  - The replacement is 34 words, longer than sentences the report itself names as over the rule (27, 30, 32).
  - The three-item list in paragraph form (section D) is not named.
- G10 #106, d_results.tex:25, "None of the fused configurations exceeds this best single modality.": **right.** The passage stands, and "exceeded" is the Results past.
- G10 #107, d_results.tex:29, "These results indicate that the self-supervised pre-training of the CNN backbone is the dominant driver...": **right.** The passage stands as the paragraph's last sentence and restates its DW-MRI and T1 DCE-MRI sentences. "delete" is section E's restating-close cut, named in the line.

GROUP 11. Transitions

- G11 #108, d_results.tex:15, "Finally, we evaluate the impact of our proposed pre-training approach on model performance.": **wrong (4).**
  - The passage stands, and the false sequence "Finally" is cut.
  - "model performance" becomes "AUPRC and AUROC" (Most specific term) and "impact" becomes "effect", both with no named rule.
- G11 #109, d_results.tex:9, "As such, Figure \ref{fig:cumulative_gain} plots the cumulative gain...": **wrong (4).**
  - The passage stands, and cutting "As such" is right.
  - "against the test results obtained" is dropped with no rule.
  - The passage's 29 words are not named.

GROUP 12. Clear antecedents

- G12 #110, discussion.tex:12, "We attribute this to the limited number of positive cases...": **wrong (4).**
  - The passage stands, and "The absence of a fusion gain" names the antecedent.
  - The first replacement sentence is 26 words.
  - "and" becomes "or", which changes the joint attribution.
  - "structured ... that explicitly account for the distinct characteristics" becomes "that model each modality separately", and "promising avenue" is dropped.
- G12 #111, d_pretraining.tex:15, "This transfers the pre-trained representation...": **wrong (4).**
  - The passage stands, and "The stem expansion" names the antecedent.
  - "transfers" becomes "transferred", an unnamed tense change, and "from scratch" is dropped.
- G12 #112, 3_hyperparams.tex:3, "This is due to convergence issues that we noted...": **wrong (4).**
  - The passage stands, and "The changes" names the antecedent.
  - "addressed convergence failures" adds the claim that the changes fixed the problem, where the draft only states the cause. "issues" becomes "failures".

GROUP 13. Section C

- G13 #113, d_results.tex:3, "We report HCCNet's fine-tuned performance (i) across imaging modalities...": **wrong (4).**
  - The passage stands and announces the subsections, so "delete" fits section C.
  - The passage also holds "model variations", a synonym-cycling place the finding does not name in its own line and group 9 does not list.
- G13 #114, b_architecture.tex:5, "More details on the study's 3D implementation of ConvNeXt are presented in...": **wrong (2, 4).**
  - The passage stands, but it is a cross-reference to an appendix, not a description of what the page is about to do, so section C's words do not describe it.
  - The replacement rewrites the sentence instead of deleting it, and narrows "details on the ... implementation" to "the 3D ConvNeXt block".

GROUP 14. Section D (paragraph length and ideas)

- G14 #115, abstract.tex:3, the split "The CNN backbone is pre-trained using..." / "We demonstrate the effectiveness of HCCNet...": **wrong (4).**
  - The quoted sentences stand, and the paragraph has 5 sentences.
  - The second part, counted with #1's three sentences and #29's one, has 5 sentences, and no further split is given.
  - The first quoted sentence is 33 words and is not named.
  - "demonstrate the effectiveness" is dropped and "understanding" becomes "represent", both unnamed.
- G14 #116, introduction.tex:13, the split "This application not only demonstrates..." / "The methodological approach ... can also be considered...": **wrong (4).**
  - The sentences stand, and the paragraph has 6 sentences.
  - The first sentence inherits #5's cut of "demonstrates HCCNet's capabilities".
  - "can also be considered for predicting" becomes "may also be applied to predict", a hedge and claim change with no rule. That sentence is 25 words and not named.
- G14 #117, a_longitudinal_analysis.tex:3, the split "While the approach is relatively simple..." / "Studies investigating treatment effects...": **wrong (4).**
  - The sentences stand, and the paragraph has 7 sentences.
  - "straightforward" swaps the banned "simple" for a synonym.
  - "has been shown to not fully explore" becomes "does not exploit" (evidence and degree dropped).
  - "increasingly" is cut, though the rule asks for a share or a bracket.
- G14 #118, a_longitudinal_analysis.tex:5, the split "Compared to the aforementioned approaches, hybrid models..." / "As such, they have been successfully employed...": **wrong (4).**
  - The sentences stand. The paragraph has 6 sentences, not the 7 stated.
  - The first part has 5 sentences after the split.
  - "especially" and "successfully" are cut, "As such" and "can" are dropped, and "varying time points" becomes "any number".
- G14 #119, b_pretraining.tex:3, the split "As such, they randomly derive different views..." / "\cite{jamaludin...}, for example, pre-trained...": **wrong (4).**
  - The sentences stand, and the paragraph has 6 sentences.
  - The replacement drops "rich contextual", "As such" and the valid example transition "for example", with no rule.
  - The roughly 45-word first quoted sentence is not named under section E.
- G14 #120 split 1, d_pretraining.tex:8, "Note that in our implementation..." / "Besides that, our implementation also proposes...": **wrong (4).**
  - The sentences stand, and the paragraph has 8 sentences.
  - The second sentence carries #86's unnamed cut of "novel".
- G14 #120 split 2, d_pretraining.tex:8, before "For a view cropped from a Diffusion-Weighted MRI...": **wrong (1, 4).**
  - Only the first sentence after the break is quoted. The last sentence before it ("Specifically, we treat ...") is missing, which the split form requires.
  - The list replacement drops "randomly".
  - The stated 82 words is wrong: the sentence has about 68 to 73.
- G14 #121, a_data.tex:1, the split "Prior to pre-training and fine-tuning..." / "All examinations included in the study comprise...": **wrong (4).**
  - The sentences stand, and the paragraph has 6 sentences.
  - The first part, with #57's three sentences, has 6 sentences, and no further split is given.
  - "comprise/are" becomes "contained/were", an unnamed tense change.
- G14 #122 split 1, a_data.tex:3, "During fine-tuning we additionally exclude..." / "To obtain robust performance estimates...": **wrong (2, 4).**
  - The sentences stand. The paragraph has 10 sentences, not the 9 stated.
  - "without a definitive diagnosis of HCC" loses "of HCC".
  - The tense and voice changes are unnamed.
  - "robust" here is statistics' exempt use (an estimate insensitive to the partition of the data). The "Also breaks" line also names "approximately", which stands outside the passage.
- G14 #122 split 2, a_data.tex:3, "Each fold serves as the held-out test set..." / "The full modeling pipeline...": **wrong (4).**
  - The sentences stand.
  - "exactly", "independently" and "that is used for both" are dropped, and "serves/is repeated" becomes "served/was repeated", all unnamed.
- G14 #123, b_implementation.tex:9, "Concretely, we evaluate the full fusion..." / "As during single-modality pre-training...": **wrong (4).**
  - The sentences stand, and the list form is right.
  - "Concretely" and the claim "the two pairings that include the strongest single modality" are dropped.
  - "evaluate/are sampled" becomes "were evaluated/were sampled", unnamed.
- G14 #124, c_evaluation.tex:1, "Every reported metric is computed..." / "For evaluation, we employ the following...": **wrong (4).**
  - The sentences stand, and the paragraph has 5 sentences.
  - The tense and voice changes ("was computed", "were the following") are unnamed.
  - "curve" is added to AUROC's expansion with no named rule.
- G14 #125, d_results.tex:19, "Figure \ref{fig:calibration} shows consistently lower..." / "For the randomly initialized baseline, however...": **wrong (4).**
  - The sentences stand, and the paragraph has 7 sentences.
  - The split leaves a first part of 5 sentences.
  - The first replacement sentence is 34 words.
  - Cutting "consistently" makes "lowest" read as universal, but DW-MRI HCCNet-C's fine-tuned ECE of 0.146 is above T1 DCE-MRI HCCNet-T's 0.131 and above T1 IOP & T2-MRI HCCNet-C's 0.145.
- G14 #126 split 1, conclusion.tex:1, "The methodology is versatile..." / "Yet, each condition presents...": **wrong (4).**
  - The sentences stand, and the paragraph has 8 sentences.
  - The first part, counted with #13's and #31's added sentences, has 6.
  - "Yet", "unique challenges" and "further" are dropped or changed with no rule.
- G14 #126 split 2, conclusion.tex:1, before "In the future, we therefore plan to validate...": **wrong (1, 4).**
  - Only the first sentence after the break is quoted, so the split form is not met.
  - The replacement drops "In the future", "therefore" and "aim to ... further improve upon our results".
- G14 #127, 2_reliability.tex:3, "That is despite that baseline models..." / "Contrarily, for the fine-tuned models...": **wrong (4).**
  - The sentences stand, and the paragraph has 6 sentences.
  - "reliability metrics" (ECE, MCE, Brier) becomes "calibration error".
  - "establishes" becomes "produced", "Contrarily" is dropped, and "show" becomes "showed", all unnamed.

GROUP 15. Section F (hard wrapping)

- G15 #128, ack.tex:6, "...(OpenAI ChatGPT) to help / refine the English language...": **right.** The line break after "to help" stands at line 6, and the replacement writes the words on one line with a space.
- G15 #129, ack.tex:7, "...the authors reviewed and edited the / content as needed...": **right.** The break after "edited the" stands at line 7, and the replacement joins it with a space.
- G15 #130, ack.tex:2, "...op basis van MRI-radiomics / Primair leverkanker...": **right.** The break after "MRI-radiomics" stands at line 2, and the replacement joins it with a space.

Lists

**1. Are the groups ordered most consequential first?** No. Group 12 (Clear antecedents) stands after groups 10 and 11, whose lines say "No claim changes". Group 12's line does not say its breaks change no claim; it says the reader has to guess the referent. If that loss is real, the group belongs before 10 and 11. If it is not, the line fails to say so. The order of the other groups fits their lines.

**2. Group lines.** Every group has a line. These lines do not meet "How you group them":
- Group 5: part of the line is a content point that no rule covers. "the '4x' variant has 3.3 times the base model's parameters" is a number the draft's data contradict (rules.md, "Evidence for claims", last bullet).
- Group 8: the "SSL is never explained" part belongs to #52, a group 5 finding. The example place, main.tex:45, shows only CNN and MRI.
- Group 12: "A reader has to guess what 'this' refers to" restates the rule. It names no loss specific to the draft and does not say whether claims change.
- Group 13: "The reader reads a sentence that only announces the subsections" describes the break, not what it costs the reader.
- Group 14: "paragraphs of five to nine sentences that each hold two or more ideas" describes the break and names no cost. Its own example, a_data.tex:3, has 10 sentences.
- Group 10: its line meets the rule, but it also says the group covers only three files. The report's opening coverage note likewise says that b_architecture, e_finetuning, a_data, c_evaluation, 2_augmentations and 3_hyperparams "still need their own entries". The report does not cover the whole draft, which SKILL.md ("Your report") requires.

**3. Missing passage or replacement, or a replacement given as an instruction or reference.**
- #80: its replacement is the reference "see entry 89, which gives this sentence whole".
- #116, #120 and #125 carry "(... as in entry N)" notes but also write their text out in full.
- No finding lacks a quoted passage.

**4. Passages or places given twice.**
- d_results.tex:5 "across model architectures": #68 and again inside #100's passage, in a later group.
- d_pretraining.tex:10 "we keep the parameters of the CNN feature extractor fixed": #80 and #89, in a later group.
- The split quotes #116 (repeating #5's sentence), #120 (repeating #85's and #86's) and #125 (repeating #104's) are the split form SKILL.md allows.

**5. Findings with a line saying they still break a rule.** None. #105 carries a line conceding its replacement is 33 words, but it is not written as a "still breaks" line. #44 carries a note asking the author to confirm 0.054.

Review of the HCCNet manuscript (main.tex and the 32 files it inputs, read as one document). Places are given as paths from the main file's folder. The draft is a clinical prediction study: its journal is Intelligent Medicine, its data come from a patient cohort and two of its authors work in clinical departments. I therefore applied the Medicine and Health register. The ASCII scan (`LC_ALL=C grep -n '[^ -~]'`, run once per file) found one hit in all 33 files: main.tex:75, "St<latin small letter e with acute>phanie". An accented letter in a name stays under the prose standard, section B, so the scan gives no finding.

== references/rules.md, "Limitations and alternative interpretations" ==
These claims are stated as holding in every case, but the draft's own tables show where they do not. A reader who trusts the abstract believes pre-training improved calibration for every model, while Table results_reliability shows that the ECE of HCCNet-F on T1 IOP & T2-MRI rose from 0.182 to 0.204.

1. sections/abstract/abstract.tex:3
Passage: "Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, providing a reliable tool for personalized HCC surveillance."
Also: prose standard section A ("substantially"); "Hedging" (a generalization from one cohort).
Replacement: "Our results show that HCCNet improves the average AUPRC over the baseline models by 106.6% for diffusion-weighted MRI, 48.9% for dynamic contrast-enhanced T1-weighted MRI and 52.3% for the combined T1 in- and out-of-phase and T2-weighted MRI, and lowers the average expected calibration error in all three modality groups, which suggests that HCCNet could support personalized HCC surveillance once it is validated beyond this single cohort."

2. sections/4_experiments/d_results.tex:21
Passage: "More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicates that the proposed self-supervised pre-training reduces the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters."
Also: prose standard section 0 (performative aside, "More interestingly"); "Tense per section" (Results).
Replacement: "The comparison between baseline and fine-tuned models' reliability diagrams indicated that the proposed self-supervised pre-training reduced the average expected calibration error in all three modality groups relative to the models trained with randomly initialized parameters, although for HCCNet-F on the combined T1 in- and out-of-phase and T2-weighted modality it rose from 0.182 to 0.204."

3. sections/4_experiments/d_results.tex:19
Passage: "Figure \ref{fig:calibration} shows consistently lower expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between."
Replacement: "Figure \ref{fig:calibration} shows lower average expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest average expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between [per variant the order does not hold: DW-MRI HCCNet-C at 0.146 exceeds T1 DCE-MRI HCCNet-T at 0.131 and T1 IOP & T2-MRI HCCNet-C at 0.145]."

4. sections/5_discussion/discussion.tex:10
Passage: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, demonstrating the value of our proposed pre-training framework for applications in the medical domain."
Also: "Hedging" (a strong device on a generalization from one cohort).
Replacement: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were on average more reliable, although the expected calibration error of HCCNet-F on the combined T1 in- and out-of-phase and T2-weighted modality rose from 0.182 to 0.204, which suggests the value of our proposed pre-training framework for applications in the medical domain."

5. sections/5_discussion/discussion.tex:12
Passage: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little."
Replacement: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit for diffusion-weighted and dynamic contrast-enhanced T1-weighted imaging, while the sequence-order-prediction task contributes comparatively little for these two modalities and comparably to the CNN backbone for the combined T1 in- and out-of-phase and T2-weighted modality."

6. sections/6_conclusion/conclusion.tex:1
Passage: "Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains, while the sequence-order-prediction task contributes comparatively little."
Replacement: "Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains for diffusion-weighted and dynamic contrast-enhanced T1-weighted imaging, while the sequence-order-prediction task contributes comparatively little for these two modalities and comparably to the CNN backbone for the combined T1 in- and out-of-phase and T2-weighted modality."

7. sections/1_introduction/introduction.tex:11
Passage: "Additionally, the Transformer encoder is pre-trained with a sequence-order-prediction task inspired by techniques used in natural language processing, which helps the model to understand the progression of disease over time and to make accurate predictions despite the irregular timing of medical screenings \citep{zeng2021positional}."
Replacement: "Additionally, the Transformer encoder is pre-trained with a sequence-order-prediction task inspired by techniques used in natural language processing, which helps the model to understand the progression of disease over time and to make accurate predictions despite the irregular timing of medical screenings \citep{zeng2021positional} [limit: in this study's ablation, pre-training only the Transformer encoder raised AUPRC from 0.307 to 0.457 for T1 IOP & T2-MRI but only from 0.308 to 0.310 for DW-MRI]."

== references/rules.md, "Hedging" ==
These sentences state a generalization or an interpretation with a strong device or with none, although the draft evaluates one disease in one cohort. A reader of the abstract takes "establishes it as an invaluable framework for monitoring chronic diseases" as a tested result, but no disease other than HCC was evaluated.

1. sections/abstract/abstract.tex:5
Passage: "The methodological approach presented in this paper is versatile and can be adapted to various longitudinal MRI screening applications."
Replacement: "The methodological approach presented in this paper may be versatile and could be adapted to various longitudinal MRI screening applications."

2. sections/abstract/abstract.tex:5
Passage: "Its ability to handle varying patient record lengths and irregular screening intervals establishes it as an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
Replacement: "Its ability to handle varying patient record lengths and irregular screening intervals suggests that it is an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."

3. sections/1_introduction/introduction.tex:13
Passage: "Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."
Replacement: "Thus, HCCNet may provide a flexible framework that could be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."

4. sections/6_conclusion/conclusion.tex:1
Passage: "The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: "The methodology may be versatile and may offer a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."

5. sections/4_experiments/d_results.tex:5
Passage: "The combined T1 IOP \& T2-MRI modality reaches AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeds it on AUROC (0.873 versus 0.736), indicating that concatenating the weaker T1 IOP-MRI with T2-MRI dilutes the T2 signal."
Also: "Tense per section" (Results).
Replacement: "The combined T1 IOP \& T2-MRI modality reached AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeded it on AUROC (0.873 versus 0.736), which suggests that concatenating the weaker T1 IOP-MRI with T2-MRI dilutes the T2 signal."

6. sections/5_discussion/discussion.tex:10
Passage: "Inspection of the models' reliability diagrams further demonstrated that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning."
Also: "Evidence for claims" (the propagation mechanism is not measured).
Replacement: "Inspection of the models' reliability diagrams further suggests that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, which may reduce the extent to which calibration errors are propagated and amplified during fine-tuning [evidence or citation for this mechanism]."

7. sections/5_discussion/discussion.tex:12
Passage: "We attribute this to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
Also: "Clear antecedents" ("this" stands alone); "Formality" (two ideas: the cause of the fusion result, and the future work).
Replacement: "The absence of a clear gain from channel-concatenation fusion may be due to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences. We view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."

== references/rules.md, "Evidence for claims" ==
The gap that the paper claims to fill rests on these sentences, and they carry no citation and no data. A reader cannot check that hybrid models are "the third most common framework" or that pre-training for longitudinal imaging is "scarcely explored".

1. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data."
Also: prose standard section A ("predominately").
Replacement: "To date, [the share of deep learning applications to medical imaging, with its citation] still consider cross-sectional instead of repeated imaging data."

2. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "However,  physicians usually assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records."
Also: prose standard section A ("usually").
Replacement: "However, physicians assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records [the share of assessments made this way, or the clinical guideline that prescribes it, with its citation]."

3. sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis."
Replacement: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis [citation or count of studies per framework]."

4. sections/2_related_work/b_pretraining.tex:1
Passage: "While the temporal relationship across medical image screening is increasingly investigated, pre-training approaches for longitudinal medical image analysis remain scarcely explored."
Replacement: "While the temporal relationship across medical image screening is increasingly investigated, pre-training approaches for longitudinal medical image analysis remain scarcely explored [citation or count of such studies]."

5. sections/2_related_work/b_pretraining.tex:3
Passage: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework."
Replacement: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework [citation or count of studies per framework]."

6. sections/1_introduction/introduction.tex:7
Passage: "Likewise, most deep learning applications are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."
Also: prose standard section A ("most").
Replacement: "Likewise, [the share of deep learning applications, with its citation] are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops [citation]."

7. sections/3_methodology/c_variants.tex:10
Passage: "Deviating from the head dimension of 128 used by the ConvNeXt-derived variants, HCCNet-C retains $A = 4$ self-attention heads at $H = 448$ (i.e., a head dimension of 112), which we found to have no adverse effect on convergence."
Replacement: "Deviating from the head dimension of 128 used by the ConvNeXt-derived variants, HCCNet-C retains $A = 4$ self-attention heads at $H = 448$ (i.e., a head dimension of 112), which we found to have no adverse effect on convergence [the evidence, for example the training loss of HCCNet-C against the other variants]."

8. sections/5_discussion/discussion.tex:12
Passage: "Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast, and this variation is richest for diffusion-weighted imaging, for which pre-training yielded the largest gains."
Also: "Limitations and alternative interpretations" (the sentence implies a cause for the larger gain and names no alternative).
Replacement: "Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast, and this variation is richest for diffusion-weighted imaging [evidence or citation], for which pre-training yielded the largest gains [an alternative explanation for the larger gain, which the author supplies]."

== references/registers.md, "What the reader looks for" (Medicine and Health) ==
A clinical reader cannot check the study against a reporting guideline, because the methods name none.

1. sections/4_experiments/a_data.tex:1
Passage: "We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands."
Also: "Tense per section" (Methodology).
Replacement: "We evaluated HCCNet on data that were retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands. [The reporting guideline the study follows, named by the author, for example TRIPOD+AI.]"

== references/rules.md, "Vague language" ==
These sentences describe the state of the field as "many" or "some" studies without naming them. A reader cannot tell how many studies stand behind the claim or which ones they are.

1. sections/2_related_work/b_pretraining.tex:1
Passage: "Using the potential abundance of unlabeled data, some longitudinal medical imaging studies have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
Replacement: "Using the potential abundance of unlabeled data, [the longitudinal medical imaging studies named with their citations, among them \citet{jamaludinSelfsupervisedLearningSpinal2017} and \citet{rivailModelingDiseaseProgression2019}] have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."

2. sections/2_related_work/b_pretraining.tex:1
Passage: "As a result, many deep learning studies analyzing medical images over time continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets."
Replacement: "As a result, [the deep learning studies analyzing medical images over time, named with their citations, or their count] continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets."

3. sections/1_introduction/introduction.tex:7
Passage: "However, many existing approaches have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."
Replacement: "However, [the existing approaches named with their citations, or their count] have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."

4. sections/2_related_work/a_longitudinal_analysis.tex:7
Passage: "Likewise, many of them disregard the irregular time intervals between image screenings."
Replacement: "Likewise, [these studies named with their citations, or their count] disregard the irregular time intervals between image screenings."

5. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "As a result, longitudinal imaging has long been established as the gold standard in many branches of oncology, enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time."
Also: prose standard section A ("many"); "Evidence for claims".
Replacement: "As a result, longitudinal imaging has long been established as the gold standard in [the branches of oncology, named with their citations], enticing [the studies named with their citations and their dated span] to extend the analysis of medical imaging to the analysis of imaging data across time."

== Prose standard, section A, vague qualifiers ==
These sentences give no size for the effects they describe. A reader of the abstract cannot tell how much early detection "considerably" changes treatment, and cannot tell how far fine-tuned results "varied substantially" across modalities, although Table results_finetune holds that number.

1. sections/abstract/abstract.tex:1
Passage: "where early detection can considerably influence treatment strategies and patient prognosis"
Replacement: "where early detection can influence treatment strategies and patient prognosis [by the measured amount, with its citation]"

2. sections/1_introduction/introduction.tex:1
Passage: "However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a significant challenge \citep{jin2021predicting}."
Replacement: "However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a challenge [the specific obstacle, as \citep{jin2021predicting} reports it]."

3. sections/1_introduction/introduction.tex:5
Passage: "Traditional approaches often simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}."
Replacement: "[The share of traditional approaches, with its citation] simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}."

4. sections/1_introduction/introduction.tex:5
Passage: "However, this method has limitations, particularly in the medical domain where datasets are often small, and the differences between natural and medical images, such as texture, contrast, and noise, considerably impact the transferability of pre-trained models \citep{zeng2021positional}."
Replacement: "However, this method has limitations, particularly in the medical domain where datasets are small [the dataset sizes or the share of small datasets, with its citation], and the differences between natural and medical images, such as texture, contrast, and noise, impact the transferability of pre-trained models [by the measured amount, as \citep{zeng2021positional} reports it]."

5. sections/5_discussion/discussion.tex:8
Passage: "Overall, fine-tuned model results varied substantially across imaging modalities."
Replacement: "Overall, fine-tuned model results varied across imaging modalities, with an average AUPRC between 0.429 for the combined T1 in- and out-of-phase and T2-weighted MRIs and 0.614 for diffusion weighted MR images."

6. sections/5_discussion/discussion.tex:6
Passage: "Despite being long established as the gold standard in many branches of oncology, deep learning applications to the study of longitudinal medical images remain notoriously understudied."
Also: "Evidence for claims".
Replacement: "Despite being long established as the gold standard in [the branches of oncology, named with their citations], deep learning applications to the study of longitudinal medical images remain notoriously understudied [citation]."

7. sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores are predominantly driven by imaging modality rather than model complexity."
Also: "Tense per section" (Results).
Replacement: "As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores were driven by imaging modality rather than model complexity [to the extent the author supplies, for example the share of variance explained by modality]."

8. figures/cumulative_gain.tex:10
Passage: "Generally, lower MAE values indicate greater robustness to fold-to-fold variation, while higher MAE values signify greater sensitivity to the data partitioning."
The claim holds in every case by the definition of the MAE in sections/4_experiments/c_evaluation.tex:1-6, which is the deviation from the identity line.
Replacement: "Lower MAE values indicate greater robustness to fold-to-fold variation, while higher MAE values signify greater sensitivity to the data partitioning."

== references/rules.md, "Most specific term" ==
The 147.1% figure is a change in AUPRC, but the Discussion reports it as a gain in "model performance". A reader will apply the figure to every metric.

1. sections/5_discussion/discussion.tex:8
Passage: "Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and yielded substantial improvements as well for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities."
Also: prose standard section A ("substantial").
Replacement: "Our proposed pre-training approach improved AUPRC by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and improved the average AUPRC by 48.9\% and 52.3\% for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities."

== references/rules.md, "Terms defined at first use" ==
"SSL" is never expanded anywhere in the draft. DINO and the patchify layer are used before they are explained, so a reader outside the subfield cannot follow the method at the point where it is introduced.

1. sections/1_introduction/introduction.tex:11 (first use of "DINO")
Passage: "The CNN backbone is pre-trained using an extended version of the DINO framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."
Replacement: "The CNN backbone is pre-trained using an extended version of the DINO (self-distillation with no labels) framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."

2. sections/3_methodology/b_architecture.tex:5 (first use of "patchify layer")
Passage: "Additionally, we reimplement the patchify layer in ConvNeXt with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size typically encountered in volumetric data."
Also: prose standard section A ("typically"); "Tense per section" (Methodology).
Replacement: "Additionally, we reimplemented the patchify layer in ConvNeXt (the stem convolution whose kernel size equals its stride, so that it splits the input into non-overlapping patches) with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size encountered in [the share of volumetric data the author supplies]."

3. sections/appendix/b_additional_results/1_baseline.tex:3 (only use of "SSL")
Passage: "Overall differences between imaging modalities are however far less pronounced than for the models intialized with SSL pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remains generally poor."
Also: prose standard section A ("generally"); "Tense per section" (Results).
Replacement: "Overall differences between imaging modalities were however far less pronounced than for the models intialized with self-supervised pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remained poor (AUPRC between 0.228 and 0.375 and AUROC between 0.592 and 0.724)."

== Prose standard, section D, "No synonym cycling" ==
One component and one experimental factor each go under several names. A reader can take "CNN feature extractor" and "CNN backbone" for two parts of the model, and can take "model architecture", "model variation" and "model variant" for three different factors.

1. Term: CNN backbone (also called "CNN feature extractor").
- sections/3_methodology/b_architecture.tex:5: "\textbf{CNN Feature Extractor.}" becomes "\textbf{CNN Backbone.}"
- sections/3_methodology/b_architecture.tex:7: "The CNN feature extractor takes the MR images as inputs" becomes "The CNN backbone takes the MR images as inputs"
- sections/3_methodology/b_architecture.tex:14: "we concatenate the image embeddings obtained from the CNN feature extractor and prepend" becomes "we concatenated the image embeddings obtained from the CNN backbone and prepended"
- sections/3_methodology/d_pretraining.tex:3: "\textbf{CNN Feature Extractor.}" becomes "\textbf{CNN Backbone.}"
- sections/3_methodology/d_pretraining.tex:10: "we keep the parameters of the CNN feature extractor fixed and initialize them" becomes "we kept the parameters of the CNN backbone fixed and initialized them"
- sections/appendix/a_implementation/2_augmentations.tex:1: "During pre-training of the CNN feature extractor, we randomly crop two global views" becomes "During pre-training of the CNN backbone, we randomly cropped two global views"
- tables/results_pretrain_ablation.tex:27: "pre-trains the CNN feature extractor using DINO" becomes "pre-trains the CNN backbone using DINO"

2. Term: model variant (also called "model variation" and "model architecture").
- sections/3_methodology/c_variants.tex:1: "The five model variations are:" becomes "The five model variants are:"
- sections/4_experiments/c_evaluation.tex:1: "For the comparison across model variations, we also explore the robustness of the model" becomes "For the comparison across model variants, we also explored the robustness of the model"
- sections/4_experiments/d_results.tex:5: "stratified by imaging modality and model architecture" becomes "stratified by imaging modality and model variant"
- sections/4_experiments/d_results.tex:5: "HCCNet trained using diffusion weighted MR images shows excellent predictive capability of tumor development with an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model architectures." becomes "HCCNet trained using diffusion weighted MR images showed excellent predictive capability of tumor development with an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model variants."
- sections/4_experiments/d_results.tex:9: "\textbf{Comparison across Model Variations.}" becomes "\textbf{Comparison across Model Variants.}"
- sections/4_experiments/d_results.tex:15: "stratified by image modality and model variation" becomes "stratified by imaging modality and model variant"
- sections/appendix/b_additional_results/1_baseline.tex:3: "stratified by image modality and model variation" becomes "stratified by imaging modality and model variant"
- sections/appendix/b_additional_results/2_reliability.tex:3: "stratified by imaging modality and model architecture" becomes "stratified by imaging modality and model variant"

3. Term: imaging modality (also called "image modality", "MRI types" and "MRI modalities").
- sections/4_experiments/d_results.tex:15: "That is, although baseline model results vary only gradually across image modalities, diffusion weighted MR images display the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning, while dynamic contrast enhanced T1-weighted images show smaller but still substantial gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displays an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning." becomes "That is, although baseline model results varied only gradually across imaging modalities, diffusion weighted MR images displayed the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning, while dynamic contrast enhanced T1-weighted images showed smaller but still substantial gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displayed an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning." (This also carries the Results tense.)
- the two places at d_results.tex:15 and 1_baseline.tex:3 under item 2 above also carry this change.
- figures/cumulative_gain.tex:10: "across three MRI types" becomes "across three imaging modalities"
- figures/calibration.tex:10: "across three MRI modalities" becomes "across three imaging modalities"

== references/rules.md, "Transitions" ==
"Finally" tells the reader that the baseline comparison is the last result, but two further result subsections follow it.

1. sections/4_experiments/d_results.tex:15
Passage: "Finally, we evaluate the impact of our proposed pre-training approach on model performance."
Also: "Tense per section" (Results).
Replacement: "We evaluated the impact of our proposed pre-training approach on model performance."

== references/rules.md, "Clear antecedents" ==
In these sentences "This" or "That" stands alone. In the Abstract the reader cannot tell which problem HCCNet is proposed to address.

1. sections/abstract/abstract.tex:1
Passage: "To address this, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
Also: prose standard section E (sentence length).
Replacement: "To address this focus on cross-sectional data, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder. HCCNet captures both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."

2. sections/1_introduction/introduction.tex:1
Passage: "This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}."
Also: prose standard section A ("considerably").
Replacement: "Predicting disease outcomes based on longitudinal MRI scans is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can impact treatment decisions and prognosis [by the measured amount, as \citep{parikh2020biomarkers} reports it]."

3. sections/3_methodology/d_pretraining.tex:8
Passage: "This teaches the model to identify the same patient under varying acquisition conditions."
Replacement: "Sampling among these series teaches the model to identify the same patient under varying acquisition conditions."

4. sections/3_methodology/d_pretraining.tex:15
Passage: "This transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch."
Replacement: "Replicating the stem filters transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch."

5. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "This is due to convergence issues that we noted during initial model runs."
Also: "Tense per section" (Methodology).
Replacement: "This deviation was due to convergence issues that we noted during initial model runs."

6. sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC."
Also: "Tense per section" (Results).
Replacement: "These lowest reliability scores occurred even though baseline models trained using diffusion weighted MRIs showed the best average discriminatory power between patients of low and high risk of HCC."

== references/registers.md, "Voice" ==
These passives hide decisions that the authors made, so the reader cannot tell who chose the training approach, the included scans or the limitations.

1. sections/5_discussion/discussion.tex:6
Passage: "To support HCCNet's capability to capture disease progression over time, a step-wise model training approach was adopted."
Replacement: "To support HCCNet's capability to capture disease progression over time, we adopted a step-wise model training approach."

2. sections/4_experiments/a_data.tex:1
Passage: "In total, 963 MRI examinations were included in the study"
Replacement: "In total, we included 963 MRI examinations in the study"

3. sections/5_discussion/discussion.tex:16
Passage: "Despite these successes, several challenges and limitations were identified."
Also: prose standard section A ("several").
Replacement: "Despite these successes, we identified challenges and limitations."

== references/rules.md, "Formality" (a sentence with two ideas) ==
The need for external validation, which is the paper's main limit, is placed in the second half of a sentence about multi-modal data. The two ideas are: integrating multi-modal data could improve accuracy; external validation is needed to assess generalizability.

1. sections/6_conclusion/conclusion.tex:1
Passage: "Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy, while further external validation is needed to assess the generalizability of the study's findings."
Also: prose standard section D (this split is also a paragraph break; see that group).
Replacement: "Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy.

Further external validation is needed to assess the generalizability of the study's findings."

== Prose standard, section C ==
These breaks change no claim. Their cost to the reader is a sentence that announces or recaps the text instead of saying something, and a "Note that" that adds nothing.

1. sections/4_experiments/d_results.tex:3
Passage: "We report HCCNet's fine-tuned performance (i) across imaging modalities, (ii) model variations, and (iii) against a randomly initialized baseline."
Replacement: delete

2. sections/4_experiments/d_results.tex:11 (the paragraph opens by recapping the previous one)
Passage: "Across imaging modalities, the models are thus robust and not overly sensitive to variation across folds. Likewise, the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating from the optimal diagonal line."
Replacement: "The plots revealed no consistent differences across model variants, as no model variant persistently deviated from the optimal diagonal line."

3. sections/4_experiments/b_implementation.tex:1
Passage: "As aforementioned, we pre-train both the CNN backbone and the Transformer encoder on development superset $D_p^{\text{dev}}$."
Replacement: "We pre-trained both the CNN backbone and the Transformer encoder on development superset $D_p^{\text{dev}}$."

4. sections/3_methodology/d_pretraining.tex:8
Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views."
Replacement: "In our implementation, we used a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views."

5. sections/3_methodology/d_pretraining.tex:15
Passage: "Note that during pre-training of the Transformer encoder we do not randomly crop multiple views from the same image but instead only crop a single view of shape $s = 72^3$ from the original MRI."
Replacement: "During pre-training of the Transformer encoder, we did not randomly crop multiple views from the same image but instead only cropped a single view of shape $s = 72^3$ from the original MRI."

6. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "Note that during CNN-backbone pre-training we slightly deviate from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}."
Replacement: "During CNN-backbone pre-training, we slightly deviated from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}."

== Prose standard, section E ==
No claim changes. Each of these long sentences holds three to four claims that the reader must separate by hand. The restating close repeats the paragraph's point a second time.

1. sections/4_experiments/d_results.tex:11 (restating close)
Passage: "At least on the data evaluated in this study, variations in model complexity do thus not considerably influence the quality of the models' predictions nor their robustness."
Replacement: delete

2. sections/4_experiments/c_evaluation.tex:8 (sentence length; also section C, "we note that", and Methodology tense)
Passage: "Since all metrics are obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data, so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate."
Replacement: "Because all metrics were obtained through cross-validation, the five fold-level estimates are not fully independent. Consecutive folds share the majority of their development data. The reported standard deviations should therefore be interpreted as fold-to-fold variability, not as an unbiased estimate of the true standard error, which they are likely to slightly understate."

3. sections/3_methodology/d_pretraining.tex:3 (sentence length; also Methodology tense)
Passage: "Accordingly, we define a student $F_s$ and a teacher network $F_t$, where the teacher is built as an exponential moving average of the student and we learn to match the output probability distributions of the networks (i.e., $p_{{F}_s}(i^{(p,t)})$ and $p_{{F}_t}(i^{(p,t)})$ respectively) by minimizing the cross-entropy loss w.r.t. the parameters of the student network ${\theta_F}_s$:"
Replacement: "Accordingly, we defined a student $F_s$ and a teacher network $F_t$, where the teacher was built as an exponential moving average of the student. We learned to match the output probability distributions of the networks (i.e., $p_{{F}_s}(i^{(p,t)})$ and $p_{{F}_t}(i^{(p,t)})$ respectively) by minimizing the cross-entropy loss w.r.t. the parameters of the student network ${\theta_F}_s$:"

== Prose standard, section D, paragraphs (over four sentences, or two ideas) ==
These breaks change no claim. Their cost is that a key point, such as the single-cohort limit in the Discussion, is buried in the middle of a long paragraph. Each replacement writes out the sentences on either side of the break as they read after every other finding on them.

1. sections/abstract/abstract.tex:3
Passage: "The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time. We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement: "The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time.

We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."

2. sections/1_introduction/introduction.tex:13
Passage: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes. The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."
Also: prose standard section A ("considerably").
Replacement: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can influence clinical outcomes [by the measured amount, with its citation].

The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."

3. sections/2_related_work/a_longitudinal_analysis.tex:3
Passage: "While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}. Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
Replacement: "While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}.

Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."

4. sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and typically employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings. Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."
Also: prose standard section A ("typically").
Replacement: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model [in the share of studies the author supplies] to process the sequence of image embeddings.

Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."

5. sections/2_related_work/b_pretraining.tex:3
Passage: "As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}. \cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."
Replacement: "As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}.

\cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."

6. sections/3_methodology/a_problem_formulation.tex:1
Passage: "Since the frequency of liver screenings is typically determined by the patient's unique condition, some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations. As such, the data of each patient $p \in \{1, 2, ..., P\}$ corresponds to a vector of unique length and is denoted by $D^p = \{i^{(p,1)}, i^{(p,2)}, ..., i^{(p,t)}; t_{HCC}^p\}$, where ${i^{(p,t)}}$ is the patient's MRI examination at time point $t$ and $t_{HCC}^p$ is the patient's date of diagnosis which is set to None if HCC was not diagnosed within $t$."
Also: prose standard section A ("typically").
Replacement: "Since the frequency of liver screenings is determined by the patient's unique condition [for the share of patients the author supplies], some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations.

As such, the data of each patient $p \in \{1, 2, ..., P\}$ corresponds to a vector of unique length and is denoted by $D^p = \{i^{(p,1)}, i^{(p,2)}, ..., i^{(p,t)}; t_{HCC}^p\}$, where ${i^{(p,t)}}$ is the patient's MRI examination at time point $t$ and $t_{HCC}^p$ is the patient's date of diagnosis which is set to None if HCC was not diagnosed within $t$."

7. sections/3_methodology/d_pretraining.tex:8 (first break)
Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views. Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Replacement: "In our implementation, we used a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views.

Besides that, our implementation also proposed a novel augmentation strategy specific to MR images."

8. sections/3_methodology/d_pretraining.tex:8 (second break)
Passage: "Specifically, we treat different series within a contrast-coherent subset of an MRI sequence as natural augmentations of the same image. For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sample one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sample among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sample within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)."
Replacement: "Specifically, we treated different series within a contrast-coherent subset of an MRI sequence as natural augmentations of the same image.

For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sampled one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sampled among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sampled within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)."

9. sections/3_methodology/d_pretraining.tex:15
Passage: "Likewise, we concatenate the different series in the sequence of MRI scans to a multi-channel volume instead of randomly selecting a single one. Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ is thus a four rather than a one channel volume."
Replacement: "Likewise, we concatenated the different series in the sequence of MRI scans to a multi-channel volume instead of randomly selecting a single one.

Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ was thus a four rather than a one channel volume."

10. sections/4_experiments/a_data.tex:1
Passage: "Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing. All examinations included in the study comprise the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups are available for every patient."
Replacement: "Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing.

All examinations included in the study comprised the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups were available for every patient."

11. sections/4_experiments/a_data.tex:3 (first break)
Passage: "During fine-tuning we additionally exclude all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 develop HCC (i.e., 703 and 101 total MRI examinations respectively). To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Also: prose standard section A (flagged "robust").
Replacement: "During fine-tuning we additionally excluded all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 developed HCC (i.e., 703 and 101 total MRI examinations respectively).

To obtain reliable performance estimates despite the limited number of positive cases, we evaluated HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."

12. sections/4_experiments/a_data.tex:3 (second break)
Passage: "The folds are stratified by HCC outcome so that the 37 HCC-positive patients are distributed approximately evenly across folds (i.e., 7--8 positive patients per fold). Each fold serves as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds form the development set $D^{\text{dev}}_p$ that is used for both pre-training and fine-tuning."
Replacement: "The folds were stratified by HCC outcome so that the 37 HCC-positive patients were distributed approximately evenly across folds (i.e., 7--8 positive patients per fold).

Each fold served as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds formed the development set $D^{\text{dev}}_p$ that was used for both pre-training and fine-tuning."

13. sections/4_experiments/a_data.tex:3 (third break)
Passage: "Because pre-training is re-run within every fold, the held-out patients are never observed at any training stage, which precludes information leakage between the test fold and either pre-training or fine-tuning. As before, to avoid leakage between pre-training and fine-tuning within a fold, we only fine-tune HCCNet on longitudinal MRIs that are also included in the fold's development superset $D^{\text{dev}}_p$."
Replacement: "Because pre-training was re-run within every fold, the held-out patients were never observed at any training stage, which precluded information leakage between the test fold and either pre-training or fine-tuning.

As before, to avoid leakage between pre-training and fine-tuning within a fold, we only fine-tuned HCCNet on longitudinal MRIs that were also included in the fold's development superset $D^{\text{dev}}_p$."

14. sections/4_experiments/b_implementation.tex:1
Passage: "During the first 5\% of training steps (i.e., 1600 warm-up steps), we linearly increase the learning rate $\eta$ to its base value which is determined using the following square-root scaling rule \citep{granziolLearningRatesFunction}: $\eta = \alpha \frac{\sqrt{b}}{\sqrt{128}}$, where $b$ is the effective batch size and $\alpha$ is a constant scaling factor that is chosen according to $b$. After reaching its maximum value, we decay the learning rate using a cosine schedule."
Replacement: "During the first 5\% of training steps (i.e., 1600 warm-up steps), we linearly increased the learning rate $\eta$ to its base value which was determined using the following square-root scaling rule \citep{granziolLearningRatesFunction}: $\eta = \alpha \frac{\sqrt{b}}{\sqrt{128}}$, where $b$ is the effective batch size and $\alpha$ is a constant scaling factor that was chosen according to $b$.

After reaching its maximum value, we decayed the learning rate using a cosine schedule."

15. sections/4_experiments/b_implementation.tex:9
Passage: "Concretely, we evaluate the full fusion of all three modality groups (DW-MRI, T1 DCE-MRI, and T1 IOP \& T2-MRI; twelve input channels) as well as the two pairings that include the strongest single modality, namely DW-MRI + T1 DCE-MRI and DW-MRI + T1 IOP \& T2-MRI (eight input channels each). As during single-modality pre-training, augmentation views are sampled within a single contrast family."
Replacement: "Concretely, we evaluated the full fusion of all three modality groups (DW-MRI, T1 DCE-MRI, and T1 IOP \& T2-MRI; twelve input channels) as well as the two pairings that include the strongest single modality, namely DW-MRI + T1 DCE-MRI and DW-MRI + T1 IOP \& T2-MRI (eight input channels each).

As during single-modality pre-training, augmentation views were sampled within a single contrast family."

16. sections/4_experiments/c_evaluation.tex:1
Passage: "Every reported metric is computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds. For evaluation, we employ the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."
Replacement: "Every reported metric was computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds.

For evaluation, we employed the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."

17. sections/4_experiments/d_results.tex:5
Passage: "Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appear to display less expressive characteristics for the prediction of HCC development, albeit models trained using contrast enhanced T1-weighted images still maintain a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759). The two contrasts that make up this combined group are also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."
Replacement: "Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appeared to display less expressive characteristics for the prediction of HCC development, albeit models trained using contrast enhanced T1-weighted images still maintained a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759).

The two contrasts that make up this combined group were also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."

18. sections/4_experiments/d_results.tex:9
Passage: "As such, Figure \ref{fig:cumulative_gain} plots the cumulative gain in normalized AUPRC and AUROC against the test results obtained over the five cross-validation folds and ordered by ascending cumulative gain. Across model variants and imaging modalities, the per-fold ensemble closely follows the diagonal line, indicating low sensitivity to the data partitioning."
Replacement: "As such, Figure \ref{fig:cumulative_gain} plots the cumulative gain in normalized AUPRC and AUROC against the test results obtained over the five cross-validation folds and ordered by ascending cumulative gain.

Across model variants and imaging modalities, the per-fold ensemble closely followed the diagonal line, indicating low sensitivity to the data partitioning."

19. sections/4_experiments/d_results.tex:19 (first break)
Passage: "Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}. For the fine-tuned models, the plots largely align with the results presented in Table \ref{tab:results_base_pre}."
Also: prose standard section A ("largely").
Replacement: "Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}.

For the fine-tuned models, the plots aligned with the results presented in Table \ref{tab:results_base_pre} [for which models, or to what extent, which the author supplies]."

20. sections/4_experiments/d_results.tex:19 (second break)
Passage: "Figure \ref{fig:calibration} shows consistently lower expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between. For the randomly initialized baseline, however, the expected calibration error does not display the same negative relationship with model performance."
Replacement: "Figure \ref{fig:calibration} shows lower average expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest average expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between [per variant the order does not hold: DW-MRI HCCNet-C at 0.146 exceeds T1 DCE-MRI HCCNet-T at 0.131 and T1 IOP & T2-MRI HCCNet-C at 0.145].

For the randomly initialized baseline, however, the expected calibration error did not display the same negative relationship with model performance."

21. sections/4_experiments/d_results.tex:25
Passage: "None of the fused configurations exceeds this best single modality. Adding T1 DCE-MRI to DW-MRI lowers performance (AUPRC = 0.535 and AUROC = 0.873), fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI leaves performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matches DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541)."
Replacement: "None of the fused configurations exceeded this best single modality.

Adding T1 DCE-MRI to DW-MRI lowered performance (AUPRC = 0.535 and AUROC = 0.873), fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI left performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matched DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541)."

22. sections/4_experiments/d_results.tex:29
Passage: "The CNN-backbone dominance also holds for dynamic contrast enhanced T1-weighted images, where the CNN backbone alone (AUPRC = 0.524) clearly exceeds the Transformer encoder alone (AUPRC = 0.361). For the combined T1 in- and out-of-phase and T2-weighted modality, however, the two stages contribute comparably (Transformer encoder AUPRC = 0.457 versus CNN backbone AUPRC = 0.447)."
Replacement: "The CNN-backbone dominance also held for dynamic contrast enhanced T1-weighted images, where the CNN backbone alone (AUPRC = 0.524) clearly exceeded the Transformer encoder alone (AUPRC = 0.361).

For the combined T1 in- and out-of-phase and T2-weighted modality, however, the two stages contributed comparably (Transformer encoder AUPRC = 0.457 versus CNN backbone AUPRC = 0.447)."

23. sections/5_discussion/discussion.tex:12 (two ideas: the pre-training benefit, and the fusion experiments)
Passage: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little. Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."
Replacement: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit for diffusion-weighted and dynamic contrast-enhanced T1-weighted imaging, while the sequence-order-prediction task contributes comparatively little for these two modalities and comparably to the CNN backbone for the combined T1 in- and out-of-phase and T2-weighted modality.

Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."

24. sections/5_discussion/discussion.tex:18 (two ideas: integrating clinical data, and the single-cohort limit)
Passage: "Incorporating these data sources could further enhance the model's predictive power and provide a fuller understanding of disease progression. In addition, the study's focus on a single cohort from a specific clinical setting may limit the generalizability of the findings, highlighting the need for external validation in diverse patient populations."
Replacement: "Incorporating these data sources could further enhance the model's predictive power and provide a fuller understanding of disease progression.

In addition, the study's focus on a single cohort from a specific clinical setting may limit the generalizability of the findings, highlighting the need for external validation in diverse patient populations."

25. sections/6_conclusion/conclusion.tex:1 (first break; the second break is the Formality finding above)
Passage: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work. The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work.

The methodology may be versatile and may offer a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."

26. sections/appendix/a_implementation/2_augmentations.tex:1
Passage: "Contrarily, during pre-training of the Transformer encoder, we randomly crop a multi-channel sub-volume of shape $s = 72^3$ from the image, concatenating all available series from the sequence of MRI's to a single 4D image. Apart from the alternating cropping approach, further augmentations remain consistent across pre-training."
Replacement: "Contrarily, during pre-training of the Transformer encoder, we randomly cropped a multi-channel sub-volume of shape $s = 72^3$ from the image, concatenating all available series from the sequence of MRI's to a single 4D image.

Apart from the alternating cropping approach, further augmentations remained consistent across pre-training."

27. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "This is due to convergence issues that we noted during initial model runs. Consequently, we drastically reduced the projection head's output dimensionality to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."
Replacement: "This deviation was due to convergence issues that we noted during initial model runs.

Consequently, we drastically reduced the projection head's output dimensionality to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."

28. sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC. Contrarily, for the fine-tuned models, preceding pre-training establishes a negative relationship between performance and reliability metrics."
Replacement: "These lowest reliability scores occurred even though baseline models trained using diffusion weighted MRIs showed the best average discriminatory power between patients of low and high risk of HCC.

Contrarily, for the fine-tuned models, preceding pre-training established a negative relationship between performance and reliability metrics."

29. figures/cumulative_gain.tex:10
Passage: "Optimal robustness is presented by the gray dashed line, indicating no sensitivity to the data partitioning. The Mean Absolute Error (MAE) quantifies the deviation of each model's performance from this optimal line averaged over the five cross-validation folds."
Replacement: "Optimal robustness is presented by the gray dashed line, indicating no sensitivity to the data partitioning.

The Mean Absolute Error (MAE) quantifies the deviation of each model's performance from this optimal line averaged over the five cross-validation folds."

30. figures/calibration.tex:10
Passage: "The x-axis represents confidence levels (0.0 to 1.0), while the y-axis shows accuracy within each confidence bin. Optimal calibration, where predicted confidence matches actual accuracy, is depicted by the pink-striped region."
Replacement: "The x-axis represents confidence levels (0.0 to 1.0), while the y-axis shows accuracy within each confidence bin.

Optimal calibration, where predicted confidence matches actual accuracy, is depicted by the pink-striped region."

31. tables/results_finetune.tex:42
Passage: "Second best results are underlined. DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."
Replacement: "Second best results are underlined.

DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."

32. tables/results_base_vs_pre.tex:42
Passage: "Second best results are underlined. DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."
Replacement: "Second best results are underlined.

DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."

33. tables/results_baseline.tex:42
Passage: "Second best results are underlined. DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."
Replacement: "Second best results are underlined.

DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."

34. tables/results_fusion.tex:21
Passage: "The within-contrast augmentation restriction is retained during pre-training of all fused models. Performance metrics range from 0 to 1 or from 0.50 to 1 and from 0.14 to 1 for the AUROC and the AUPRC respectively."
Replacement: "The within-contrast augmentation restriction is retained during pre-training of all fused models.

Performance metrics range from 0 to 1 or from 0.50 to 1 and from 0.14 to 1 for the AUROC and the AUPRC respectively."

35. tables/results_pretrain_ablation.tex:27
Passage: "``CNN backbone only'' pre-trains the CNN feature extractor using DINO while leaving the Transformer encoder randomly initialized, and ``Transformer encoder only'' pre-trains the encoder using the sequence-order-prediction task while leaving the CNN backbone randomly initialized. AUPRC and AUROC values range from 0.14 and 0.50 to 1 respectively."
Replacement: "``CNN backbone only'' pre-trains the CNN backbone using DINO while leaving the Transformer encoder randomly initialized, and ``Transformer encoder only'' pre-trains the encoder using the sequence-order-prediction task while leaving the CNN backbone randomly initialized.

AUPRC and AUROC values range from 0.14 and 0.50 to 1 respectively."

36. tables/results_reliability.tex:32 (first break)
Passage: "ECE represents the expected, while MCE denotes the maximal calibration error with lower values representing better model performance. All metrics are presented using the mean and standard deviation across the five cross-validation folds."
Replacement: "ECE represents the expected, while MCE denotes the maximal calibration error with lower values representing better model performance.

All metrics are presented using the mean and standard deviation across the five cross-validation folds."

37. tables/results_reliability.tex:32 (second break)
Passage: "Second best results are underlined. DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."
Replacement: "Second best results are underlined.

DW-MRI comprises diffusion MRI scans with diffusion coefficient $b \in \{0, 150, 400, 800\}$."

== Prose standard, section A, filler and flagged terms ==
No claim changes. The cost is a word that adds nothing: "simple" and "just" are softeners.

1. sections/2_related_work/b_pretraining.tex:3: "Instead of simply comparing view pairs from different patients" becomes "Instead of comparing view pairs from different patients"
2. sections/2_related_work/b_pretraining.tex:5: "adopts a simple sequence-order-prediction task" becomes "adopts a sequence-order-prediction task"
3. sections/3_methodology/d_pretraining.tex:10: "this study employs a simple binary sequence-order-prediction (SOP) task" becomes "this study employed a binary sequence-order-prediction (SOP) task" (with the Methodology tense)
4. sections/4_experiments/b_implementation.tex:3: "we train the Transformer encoder using an abbreviated pre-training protocol of just 8000 training steps" becomes "we trained the Transformer encoder using an abbreviated pre-training protocol of 8000 training steps" (with the Methodology tense)
5. sections/4_experiments/a_data.tex:3: "robust performance estimates" becomes "reliable performance estimates" (written out in full in section D item 11)

== references/rules.md, "Tense per section" ==
No claim changes. In the present tense, the Methods and Results read as standing properties of the model and do not read as what was done and measured in this study. Methodology and Results take the past tense. Sentences already rewritten in the groups above are not repeated here. Each entry gives the place, the passage and its replacement.

- sections/3_methodology/b_architecture.tex:3: "We use the CNN backbone" / "We used the CNN backbone"
- sections/3_methodology/b_architecture.tex:5: "we adapt the ConvNeXt architecture" / "we adapted the ConvNeXt architecture"
- sections/3_methodology/b_architecture.tex:5: "we replace the 2-dimensional depthwise convolutional layers in ConvNeXt with their 3-dimensional counterpart and reduce the proposed kernel size" / "we replaced the 2-dimensional depthwise convolutional layers in ConvNeXt with their 3-dimensional counterpart and reduced the proposed kernel size"
- sections/3_methodology/b_architecture.tex:21: "we embed the input's positional information" / "we embedded the input's positional information"
- sections/3_methodology/b_architecture.tex:21: "we replace the conventional sequence position" / "we replaced the conventional sequence position"
- sections/3_methodology/b_architecture.tex:21: "we compute the vector of intervals" / "we computed the vector of intervals"
- sections/3_methodology/b_architecture.tex:26: "prepend" / "prepended"; "and, finally, obtain positional encodings" / "and, finally, obtained positional encodings"
- sections/3_methodology/b_architecture.tex:34: "we add the positional encodings" / "we added the positional encodings"
- sections/3_methodology/b_architecture.tex:39: "We feed the input sequence through the encoder $G$ and select the last hidden state" / "We fed the input sequence through the encoder $G$ and selected the last hidden state"
- sections/3_methodology/b_architecture.tex:44: "we feed it through a pooling layer" / "we fed it through a pooling layer"
- sections/3_methodology/c_variants.tex:1: "we introduce four variants of HCCNet" / "we introduced four variants of HCCNet"
- sections/3_methodology/c_variants.tex:10: "we additionally introduce HCCNet-C (compact)" / "we additionally introduced HCCNet-C (compact)"
- sections/3_methodology/d_pretraining.tex:1: "we therefore design two (self-)supervised pre-training tasks" / "we therefore designed two (self-)supervised pre-training tasks"
- sections/3_methodology/d_pretraining.tex:3: "this study extends the self-supervised DINO pre-training framework" / "this study extended the self-supervised DINO pre-training framework"
- sections/3_methodology/d_pretraining.tex:8: "which are cropped from the original image and used as input" / "which were cropped from the original image and used as input"
- sections/3_methodology/d_pretraining.tex:8: "we exploit the abundance of natural variation" / "we exploited the abundance of natural variation"
- sections/3_methodology/d_pretraining.tex:10: "we randomly shuffle 50\% of the input sequences" / "we randomly shuffled 50\% of the input sequences"
- sections/3_methodology/d_pretraining.tex:10: "we actually randomly shuffle 66\% of sequences" / "we actually randomly shuffled 66\% of sequences"
- sections/3_methodology/d_pretraining.tex:10: "We apply the sigmoid function to the output of the model's pooling layer and learn to identify" / "We applied the sigmoid function to the output of the model's pooling layer and learned to identify"
- sections/3_methodology/d_pretraining.tex:15: "we reconcile the differing input dimensionality" / "we reconciled the differing input dimensionality"; "the learned stem filters are replicated" / "the learned stem filters were replicated"; "which is then fine-tuned end to end" / "which was then fine-tuned end to end"
- sections/3_methodology/e_finetuning.tex:1: "we initialize the parameters of HCCNet" / "we initialized the parameters of HCCNet"
- sections/3_methodology/e_finetuning.tex:1: "we append the final pooling layer as discussed in \ref{sec:architecture} and fine-tune the model" / "we appended the final pooling layer as discussed in \ref{sec:architecture} and fine-tuned the model"
- sections/4_experiments/a_data.tex:1: "This complete co-availability allows us" / "This complete co-availability allowed us"
- sections/4_experiments/a_data.tex:3: "we include all available data" / "we included all available data"
- sections/4_experiments/a_data.tex:3: "We partition the patient cohort" / "We partitioned the patient cohort"
- sections/4_experiments/a_data.tex:3: "is repeated independently for each fold" / "was repeated independently for each fold"
- sections/4_experiments/b_implementation.tex:1: "We train the CNN over 32000 training steps" / "We trained the CNN over 32000 training steps"
- sections/4_experiments/b_implementation.tex:1: "We employ the same cosine decay without warm-up for the weight decay $\lambda$ but only apply it" / "We employed the same cosine decay without warm-up for the weight decay $\lambda$ but only applied it"
- sections/4_experiments/b_implementation.tex:1: "we also limit the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$ and increase" / "we also limited the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$ and increased"
- sections/4_experiments/b_implementation.tex:3: "While MRI scans are assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considers" / "While MRI scans were assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considered"
- sections/4_experiments/b_implementation.tex:3: "apply dropout with probability $p = 0.2$, and employ the same optimizer" / "applied dropout with probability $p = 0.2$, and employed the same optimizer"
- sections/4_experiments/b_implementation.tex:5: "we update HCCNet" / "we updated HCCNet"
- sections/4_experiments/b_implementation.tex:5: "We fine-tune the model over 400 training steps" / "We fine-tuned the model over 400 training steps"; "but decrease the weight decay" / "but decreased the weight decay"
- sections/4_experiments/b_implementation.tex:5: "we select the batch size" / "we selected the batch size"; "and apply no further hyperparameter tuning" / "and applied no further hyperparameter tuning"
- sections/4_experiments/b_implementation.tex:5: "we then train HCCNet" / "we then trained HCCNet"; "and evaluate it on the corresponding held-out fold" / "and evaluated it on the corresponding held-out fold"
- sections/4_experiments/b_implementation.tex:7: "we establish a baseline" / "we established a baseline"
- sections/4_experiments/b_implementation.tex:7: "we equally train the baseline" / "we equally trained the baseline"
- sections/4_experiments/b_implementation.tex:7: "We employ the same optimizer" / "We employed the same optimizer"; "but slightly increase the learning rate warm-up" / "but slightly increased the learning rate warm-up"
- sections/4_experiments/b_implementation.tex:9: "we additionally evaluate a set of exploratory multi-modal configurations" / "we additionally evaluated a set of exploratory multi-modal configurations"
- sections/4_experiments/b_implementation.tex:9: "we naively concatenate the series" / "we naively concatenated the series"
- sections/4_experiments/b_implementation.tex:9: "we restrict the fusion experiments" / "we restricted the fusion experiments"
- sections/4_experiments/b_implementation.tex:11: "we further disentangle" / "we further disentangled"
- sections/4_experiments/b_implementation.tex:11: "we evaluate two intermediate configurations" / "we evaluated two intermediate configurations"
- sections/4_experiments/b_implementation.tex:11: "We conduct this ablation" / "We conducted this ablation"
- sections/4_experiments/c_evaluation.tex:1: "we evaluate HCCNet's baseline" / "we evaluated HCCNet's baseline"
- sections/4_experiments/c_evaluation.tex:1: "we train ten independently seeded models (fifty models in total) and average their predicted probabilities" / "we trained ten independently seeded models (fifty models in total) and averaged their predicted probabilities"
- sections/4_experiments/c_evaluation.tex:6: "we evaluate the models' respective calibration" / "we evaluated the models' respective calibration"
- sections/4_experiments/c_evaluation.tex:8: "we therefore refrain from drawing conclusions" / "we therefore refrained from drawing conclusions"; "and treat such cases as performance ties" / "and treated such cases as performance ties"
- sections/4_experiments/d_results.tex:5: "is markedly stronger on AUROC" / "was markedly stronger on AUROC"; "the two are comparable" / "the two were comparable"
- sections/4_experiments/d_results.tex:5: "the combined modality nonetheless remains the weakest" / "the combined modality nonetheless remained the weakest"
- sections/4_experiments/d_results.tex:9: "we explore the impact of varying model complexity" / "we explored the impact of varying model complexity"
- sections/4_experiments/d_results.tex:9: "This robustness is tightest on AUROC" / "This robustness was tightest on AUROC"
- sections/4_experiments/d_results.tex:9: "No model variant falls consistently below the diagonal line." / "No model variant fell consistently below the diagonal line."
- sections/4_experiments/d_results.tex:15: "the magnitude of the improvement from our proposed approach varies" / "the magnitude of the improvement from our proposed approach varied"
- sections/4_experiments/d_results.tex:19: "we compare the reliability" / "we compared the reliability"
- sections/4_experiments/d_results.tex:19: "consistently show the lowest expected calibration error" / "consistently showed the lowest expected calibration error"; "display the highest expected calibration error" / "displayed the highest expected calibration error"
- sections/4_experiments/d_results.tex:21: "This reduction is largest" / "This reduction was largest"; "reaches 37.0\%" / "reached 37.0\%"; "and is smallest at 12.1\%" / "and was smallest at 12.1\%"
- sections/4_experiments/d_results.tex:25: "we evaluate whether naively fusing" / "we evaluated whether naively fusing"
- sections/4_experiments/d_results.tex:25: "which reaches AUPRC = 0.588" / "which reached AUPRC = 0.588"
- sections/4_experiments/d_results.tex:25: "As all differences fall within one standard deviation" / "As all differences fell within one standard deviation"
- sections/4_experiments/d_results.tex:29: "pre-training only the CNN backbone recovers essentially all" / "pre-training only the CNN backbone recovered essentially all"; "pre-training only the Transformer encoder yields AUPRC = 0.310" / "pre-training only the Transformer encoder yielded AUPRC = 0.310"
- sections/appendix/a_implementation/1_conv_layer.tex:3: "we inflate the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduce" / "we inflated the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduced"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we randomly shift and scale the intensity" / "we randomly shifted and scaled the intensity"; "apply random 90 degree rotations" / "applied random 90 degree rotations"; "and randomly flip the cropped view" / "and randomly flipped the cropped view"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we use the same data augmentation strategy" / "we used the same data augmentation strategy"
- sections/appendix/b_additional_results/1_baseline.tex:3: "consistently display the highest detection rate" / "consistently displayed the highest detection rate"
- sections/appendix/b_additional_results/2_reliability.tex:3: "consistently display the lowest average reliability scores" / "consistently displayed the lowest average reliability scores"
- sections/appendix/b_additional_results/2_reliability.tex:3: "HCCNet fine-tuned using diffusion weighted MRIs display the lowest average reliability scores, while models fine-tuned using dynamic contrast enhanced T1-weighted MR images exhibit the highest" / "HCCNet fine-tuned using diffusion weighted MRIs displayed the lowest average reliability scores, while models fine-tuned using dynamic contrast enhanced T1-weighted MR images exhibited the highest"

== Prose standard, section F, source formatting (no hard wrapping) ==
No claim changes. The cost is in the source: a phrase broken across lines cannot be found with a search or read cleanly in a diff.

1. sections/6_conclusion/ack.tex:2
Passage: "... op basis van MRI-radiomics" / "Primair leverkanker (hepatocellulair ..."
Replacement: "op basis van MRI-radiomics Primair leverkanker"

2. sections/6_conclusion/ack.tex:6
Passage: "... (OpenAI ChatGPT) to help" / "refine the English language ..."
Replacement: "to help refine the English language"

3. sections/6_conclusion/ack.tex:7
Passage: "... reviewed and edited the" / "content as needed ..."
Replacement: "reviewed and edited the content as needed"

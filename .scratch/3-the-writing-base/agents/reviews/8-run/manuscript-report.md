Review of the HCCNet manuscript (main.tex and the 32 files it inputs), against the prose standard, references/rules.md and references/registers.md. The register applied is Medicine and Health (journal: Intelligent Medicine; clinical prediction study). The ASCII check (LC_ALL=C grep -n '[^ -~]', once per file) found one hit, main.tex:75 "St<latin small letter e with acute>phanie", an accented letter in a name, which the prose standard keeps; no ASCII finding follows from it.

=== 1. references/rules.md, "Hedging" ===
The reader takes a result from one cohort of 243 patients (37 with HCC), with no external validation, as established for HCC surveillance and for other chronic diseases. Example: abstract.tex:5 states that the method "establishes it as an invaluable framework for monitoring chronic diseases", although the draft tests it only on HCC.

1.1 Place: sections/abstract/abstract.tex:3
Passage: "Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, providing a reliable tool for personalized HCC surveillance."
Replacement: "Our results on a single cohort suggest that HCCNet improves predictive accuracy (an average AUPRC gain of 48.9% to 106.6% across the three modality groups) and reliability (an average reduction of the expected calibration error of 12.1% to 56.0%) over baseline models, which could make it a reliable tool for personalized HCC surveillance once [the external validation the discussion calls for] confirms these results [limit for the author: for HCCNet-F on T1 IOP & T2-MRI the expected calibration error rose from 0.182 to 0.204, Table tab:reliability_results]."
Also breaks: prose standard, section A, vague qualifiers ("substantially").
Also breaks: references/rules.md, "Limitations and alternative interpretations".

1.2 Place: sections/abstract/abstract.tex:3
Passage: "We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement: "Applying HCCNet to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance indicates its effectiveness."

1.3 Place: sections/abstract/abstract.tex:5
Passage: "The methodological approach presented in this paper is versatile and can be adapted to various longitudinal MRI screening applications."
Replacement: "The methodological approach presented in this paper may be versatile and adaptable to various longitudinal MRI screening applications."

1.4 Place: sections/abstract/abstract.tex:5
Passage: "Its ability to handle varying patient record lengths and irregular screening intervals establishes it as an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
Replacement: "Its ability to handle varying patient record lengths and irregular screening intervals means that it may serve as a framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
Also breaks: prose standard, section 0, "No dramatic bolded closers, no grandiose self-assessment" ("invaluable").

1.5 Place: sections/1_introduction/introduction.tex:13
Passage: "By fine-tuning the pre-trained model on this dataset, we demonstrate the model's ability to predict whether a patient will develop HCC at the next examination \citep{parikh2020biomarkers}."
Replacement: "By fine-tuning the pre-trained model on this dataset, we obtain results that indicate the model's ability to predict whether a patient will develop HCC at the next examination \citep{parikh2020biomarkers}."

1.6 Place: sections/1_introduction/introduction.tex:13
Passage: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes."
Replacement: "This application not only indicates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can influence clinical outcomes [the measured effect on clinical outcomes, with its citation]."
Also breaks: prose standard, section A, vague qualifiers ("considerably").

1.7 Place: sections/1_introduction/introduction.tex:13
Passage: "Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."
Replacement: "Thus, HCCNet may provide a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."

1.8 Place: sections/6_conclusion/conclusion.tex:1
Passage: "The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: "The methodology may be versatile and may offer a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."

1.9 Place: sections/5_discussion/discussion.tex:10
Passage: "Inspection of the models' reliability diagrams further demonstrated that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning."
Replacement: "Inspection of the models' reliability diagrams further suggested that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning."

1.10 Place: sections/5_discussion/discussion.tex:10
Passage: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, demonstrating the value of our proposed pre-training framework for applications in the medical domain."
Replacement: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were on average more reliable, which suggests the value of our proposed pre-training framework for applications in the medical domain [limit for the author: for HCCNet-F on T1 IOP & T2-MRI the expected calibration error rose from 0.182 to 0.204, Table tab:reliability_results]."
Also breaks: references/rules.md, "Limitations and alternative interpretations".

1.11 Place: sections/5_discussion/discussion.tex:12
Passage: "Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast, and this variation is richest for diffusion-weighted imaging, for which pre-training yielded the largest gains."
Replacement: "Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast, and this variation may be richest for diffusion-weighted imaging [the evidence that it is richest there, given that T1 DCE-MRI also comprises four series], for which pre-training yielded the largest gains."
Also breaks: references/rules.md, "Evidence for claims".

1.12 Place: sections/5_discussion/discussion.tex:12
Passage: "We attribute this to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
Replacement: "These at most marginal improvements may reflect the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and we view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
Also breaks: references/rules.md, "Clear antecedents" ("this").

1.13 Place: sections/5_discussion/discussion.tex:16
Passage: "Additionally, while HCCNet demonstrates strong predictive capabilities for HCC development, its application to other diseases will require careful consideration of the specific characteristics and progression patterns of those diseases."
Replacement: "Additionally, while the results suggest strong predictive capabilities of HCCNet for HCC development, its application to other diseases will require careful consideration of the specific characteristics and progression patterns of those diseases."

=== 2. references/rules.md, "Limitations and alternative interpretations" ===
The reader takes the calibration gain as holding for every model, although one fine-tuned model in the draft's own table is worse calibrated than its baseline.

2.1 Place: sections/4_experiments/d_results.tex:21
Passage: "More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicates that the proposed self-supervised pre-training reduces the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters."
Replacement: "More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicated that the proposed self-supervised pre-training reduced the average expected calibration error in all three modality groups relative to the models trained with randomly initialized parameters, although for HCCNet-F on the combined T1 in- and out-of-phase and T2-weighted modality the expected calibration error rose from 0.182 to 0.204."
Also breaks: references/rules.md, "Tense per section" (Results, past).

=== 3. references/rules.md, "Evidence for claims" ===
The reader cannot check the claims that set up the research gap, such as "longitudinal imaging has long been established as the gold standard in many branches of oncology" (a_longitudinal_analysis.tex:1), because no source is given.

3.1 Place: sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data."
Replacement: "To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data [citation]."

3.2 Place: sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "However,  physicians usually assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records."
Replacement: "However, physicians assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records in [the share of assessments, with its citation]."
Also breaks: prose standard, section A, vague qualifiers ("usually").

3.3 Place: sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "As a result, longitudinal imaging has long been established as the gold standard in many branches of oncology, enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time."
Replacement: "As a result, longitudinal imaging has long been established as the gold standard in [the branches of oncology, with their citations], enticing [the studies, with their citations and years] to extend the analysis of medical imaging to the analysis of imaging data across time."
Also breaks: prose standard, section A, vague qualifiers ("many"); references/rules.md, "Vague language" ("recent").

3.4 Place: sections/5_discussion/discussion.tex:6
Passage: "Despite being long established as the gold standard in many branches of oncology, deep learning applications to the study of longitudinal medical images remain notoriously understudied."
Replacement: "Despite being long established as the gold standard in [the branches of oncology, with their citations], deep learning applications to the study of longitudinal medical images remain notoriously understudied [citation]."
Also breaks: prose standard, section A, vague qualifiers ("many").

3.5 Place: sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis."
Replacement: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis [citation or the count of studies per framework]."

3.6 Place: sections/2_related_work/b_pretraining.tex:3
Passage: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework."
Replacement: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework [citation or the count of studies per framework]."

3.7 Place: sections/2_related_work/b_pretraining.tex:1
Passage: "As a result, many deep learning studies analyzing medical images over time continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets."
Replacement: "As a result, [the deep learning studies, with their citations, or their count] analyzing medical images over time continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets."
Also breaks: references/rules.md, "Vague language" ("many studies").

3.8 Place: sections/1_introduction/introduction.tex:7
Passage: "Likewise, most deep learning applications are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."
Replacement: "Likewise, [the share of deep learning applications, with its citation] are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."
Also breaks: prose standard, section A, vague qualifiers ("most").

3.9 Place: sections/3_methodology/d_pretraining.tex:1
Passage: "When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks."
Replacement: "When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks [citations]."

3.10 Place: sections/3_methodology/c_variants.tex:10
Passage: "Deviating from the head dimension of 128 used by the ConvNeXt-derived variants, HCCNet-C retains $A = 4$ self-attention heads at $H = 448$ (i.e., a head dimension of 112), which we found to have no adverse effect on convergence."
Replacement: "Deviating from the head dimension of 128 used by the ConvNeXt-derived variants, HCCNet-C retains $A = 4$ self-attention heads at $H = 448$ (i.e., a head dimension of 112), which we found to have no adverse effect on convergence [the evidence for this finding, such as the training curves]."

=== 4. references/registers.md, "What the reader looks for" ===
A clinical reader of this prediction model cannot tell which reporting guideline the study follows, so cannot check what the methods should contain.

4.1 Place: sections/4_experiments/a_data.tex:1
Passage: "We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands."
Replacement: "We evaluated HCCNet on data that were retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands. [The reporting guideline the study follows, with its citation.]"
Also breaks: references/rules.md, "Tense per section" (Methodology, past).

=== 5. Prose standard, section A, vague qualifiers ===
The reader gets a word in place of a size. Example: d_results.tex:11 says model size "only negligibly affects downstream model performance", while Table tab:finetuned_results shows a T1 DCE-MRI AUPRC from 0.329 to 0.628 across variants.

5.1 Place: sections/abstract/abstract.tex:1
Passage: "Longitudinal MRI analysis is important for predicting disease outcomes, particularly in chronic conditions like hepatocellular carcinoma (HCC), where early detection can considerably influence treatment strategies and patient prognosis."
Replacement: "Longitudinal magnetic resonance imaging (MRI) analysis is important for predicting disease outcomes, particularly in chronic conditions like hepatocellular carcinoma (HCC), where early detection can influence treatment strategies and patient prognosis [the measured effect, with its citation]."
Also breaks: references/rules.md, "Terms defined at first use" (MRI, first use, never defined in the draft).

5.2 Place: sections/1_introduction/introduction.tex:1
Passage: "This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}."
Replacement: "This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can impact treatment decisions and prognosis [the specific effect, as \citet{parikh2020biomarkers} reports it] \citep{parikh2020biomarkers}."
Also breaks: references/rules.md, "Clear antecedents" ("This" stands alone); replacement for that rule: begin the sentence with "Outcome prediction from longitudinal MRI is especially relevant ...".

5.3 Place: sections/1_introduction/introduction.tex:1
Passage: "However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a significant challenge \citep{jin2021predicting}."
Replacement: "However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a challenge [the specific obstacle, as \citet{jin2021predicting} reports it] \citep{jin2021predicting}."

5.4 Place: sections/1_introduction/introduction.tex:5
Passage: "Traditional approaches often simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}."
Replacement: "[The share of approaches, as \citet{kumar2024improving} reports it] simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}."

5.5 Place: sections/1_introduction/introduction.tex:5
Passage: "However, this method has limitations, particularly in the medical domain where datasets are often small, and the differences between natural and medical images, such as texture, contrast, and noise, considerably impact the transferability of pre-trained models \citep{zeng2021positional}."
Replacement: "However, this method has limitations, particularly in the medical domain where datasets are small [the dataset sizes, with a citation], and the differences between natural and medical images, such as texture, contrast, and noise, impact the transferability of pre-trained models [the measured effect, as \citet{zeng2021positional} reports it] \citep{zeng2021positional}."

5.6 Place: sections/1_introduction/introduction.tex:7
Passage: "However, many existing approaches have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."
Replacement: "However, [the existing approaches, with their citations, or their count] have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."
Also breaks: references/rules.md, "Vague language" ("many studies").

5.7 Place: sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and typically employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings."
Replacement: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor, and [the share of hybrid models, with citations] employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings."

5.8 Place: sections/2_related_work/a_longitudinal_analysis.tex:7
Passage: "Likewise, many of them disregard the irregular time intervals between image screenings."
Replacement: "Likewise, [the number of these studies, with their citations] disregard the irregular time intervals between image screenings."

5.9 Place: sections/2_related_work/b_pretraining.tex:1
Passage: "Using the potential abundance of unlabeled data, some longitudinal medical imaging studies have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
Replacement: "Using the potential abundance of unlabeled data, [the longitudinal medical imaging studies, with their citations] have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
Also breaks: references/rules.md, "Vague language" ("some researchers").

5.10 Place: sections/3_methodology/a_problem_formulation.tex:1
Passage: "Since the frequency of liver screenings is typically determined by the patient's unique condition, some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations."
Replacement: "Since the frequency of liver screenings is determined by the patient's unique condition in [the share of patients in the cohort], some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations."

5.11 Place: sections/3_methodology/b_architecture.tex:5
Passage: "Additionally, we reimplement the patchify layer in ConvNeXt with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size typically encountered in volumetric data."
Replacement: "Additionally, we reimplemented the patchify layer in ConvNeXt [the definition of the patchify layer, as \citep{liuConvNet2020s2022} gives it] with a smaller kernel size and stride for the convolutional layer, resulting in a 3x rather than 4x downsampling of the input images and thus accommodating the lower input size of volumetric data [the input sizes, with a citation]."
Also breaks: references/rules.md, "Tense per section" (Methodology, past); references/rules.md, "Terms defined at first use" (patchify layer).

5.12 Place: sections/4_experiments/b_implementation.tex:9
Passage: "Owing to the limited number of positive cases and our finding that model capacity only negligibly affects downstream performance, we restrict the fusion experiments to the HCCNet-Pico variant."
Replacement: "Owing to the limited number of positive cases and our finding that model capacity affects downstream performance by [the range of AUPRC and AUROC across model variants within each modality, Table tab:finetuned_results; for T1 DCE-MRI the AUPRC ranges from 0.329 to 0.628], we restricted the fusion experiments to the HCCNet-Pico variant."
Also breaks: references/rules.md, "Tense per section" (Methodology, past).

5.13 Place: sections/4_experiments/d_results.tex:11
Passage: "This corresponds with the results presented in Table \ref{tab:finetuned_results}, which indicate that compared to the differences between imaging modalities model size only negligibly affects downstream model performance."
Replacement: "This absence of consistent differences corresponds with the results presented in Table \ref{tab:finetuned_results}, which indicated that, compared to the differences between imaging modalities, model size affected downstream model performance by [the range of AUPRC and AUROC across model variants within each modality; for T1 DCE-MRI the AUPRC ranges from 0.329 to 0.628]."
Also breaks: references/rules.md, "Tense per section" (Results, past); references/rules.md, "Clear antecedents" ("This").

5.14 Place: sections/4_experiments/d_results.tex:11
Passage: "At least on the data evaluated in this study, variations in model complexity do thus not considerably influence the quality of the models' predictions nor their robustness."
Replacement: "At least on the data evaluated in this study, variations in model complexity thus changed the quality of the models' predictions and their robustness by [the range of AUPRC, AUROC and MAE across model variants within each modality]."
Also breaks: references/rules.md, "Tense per section" (Results, past).

5.15 Place: sections/4_experiments/d_results.tex:15
Passage: "That is, although baseline model results vary only gradually across image modalities, diffusion weighted MR images display the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning, while dynamic contrast enhanced T1-weighted images show smaller but still substantial gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displays an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning."
Replacement: "That is, although baseline model results varied across imaging modalities by [the range of baseline AUPRC and AUROC across modalities, Table tab:results_base_pre], diffusion weighted MR images displayed the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning, while dynamic contrast enhanced T1-weighted images showed smaller gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displayed an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning."
Also breaks: references/rules.md, "Tense per section" (Results, past); prose standard, section D, "No synonym cycling" ("image modalities" for "imaging modalities").

5.16 Place: sections/5_discussion/discussion.tex:8
Passage: "Overall, fine-tuned model results varied substantially across imaging modalities."
Replacement: "Overall, fine-tuned model results varied across imaging modalities, with an average AUPRC of 0.614 for DW-MRI, 0.520 for T1 DCE-MRI and 0.429 for the combined T1 IOP \& T2-MRI modality."

5.17 Place: sections/5_discussion/discussion.tex:8
Passage: "Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and yielded substantial improvements as well for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities."
Replacement: "Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and yielded average AUPRC improvements of 48.9\% and 52.3\% for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities respectively."

5.18 Place: sections/4_experiments/c_evaluation.tex:8
Passage: "Since all metrics are obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data, so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate."
Replacement: "Since all metrics were obtained through cross-validation, the five fold-level estimates are not fully independent: any two folds share [three of their four development folds], so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to understate by [the expected size of the understatement, with a citation]."
Also breaks: prose standard, section C ("we note that", the class of "It should be noted that"); references/rules.md, "Tense per section" (Methodology, past).

5.19 Place: sections/appendix/b_additional_results/1_baseline.tex:3
Passage: "Overall differences between imaging modalities are however far less pronounced than for the models intialized with SSL pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remains generally poor."
Replacement: "Overall differences between imaging modalities were however far less pronounced than for the models initialized with self-supervised learning (SSL) pre-trained weights (s. Table \ref{tab:finetuned_results}), and the overall diagnostic performance remained poor, with AUROC between 0.592 and 0.724 for every baseline model in Table \ref{tab:results_base}."
The cut of "generally" rests on Table tab:results_base, where every baseline AUROC lies between 0.592 and 0.724.
Also breaks: references/rules.md, "Terms defined at first use" (SSL, never defined); references/rules.md, "Tense per section" (Results, past).

5.20 Place: sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores are predominantly driven by imaging modality rather than model complexity."
Replacement: "As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores were driven by imaging modality rather than model complexity in [the share of the variation, or the ECE range across modalities against the range across model variants, Table tab:reliability_results]."
Also breaks: references/rules.md, "Tense per section" (Results, past).

5.21 Place: sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "Consequently, we drastically reduced the projection head's output dimensionality to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."
Replacement: "Consequently, we reduced the projection head's output dimensionality from [the dimensionality \citep{caronEmergingPropertiesSelfSupervised2021} proposes] to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."

=== 6. references/rules.md, "Terms defined at first use" ===
A reader outside the method's subfield meets the terms below with no definition at their first use, as with "CNN" in the first paragraph of the abstract.

6.1 Place: sections/abstract/abstract.tex:1
Passage: "To address this, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
Replacement: "To address this focus on cross-sectional imaging data, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt convolutional neural network (CNN) architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
Also breaks: references/rules.md, "Clear antecedents" ("this").

6.2 Place: sections/1_introduction/introduction.tex:11
Passage: "The CNN backbone is pre-trained using an extended version of the DINO framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."
Replacement: "The CNN backbone is pre-trained using an extended version of the DINO framework [the definition of DINO, as \citet{caronEmergingPropertiesSelfSupervised2021} gives it], adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."

6.3 Place: sections/3_methodology/b_architecture.tex:14
Passage: "The Transformer encoder is based on the Pre-LN implementation \citep{xiongLayerNormalizationTransformer2020}"
Replacement: "The Transformer encoder is based on the Pre-LN implementation [the definition of Pre-LN, as \citet{xiongLayerNormalizationTransformer2020} gives it] \citep{xiongLayerNormalizationTransformer2020}"

6.4 Place: sections/4_experiments/b_implementation.tex:3
Passage: "While MRI scans are assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considers the within-person dependencies across time points."
Replacement: "While MRI scans were assumed to be independent and identically distributed (i.i.d.) during CNN pre-training, pre-training of the Transformer encoder considered the within-person dependencies across time points."
Also breaks: references/rules.md, "Tense per section" (Methodology, past).

=== 7. references/registers.md, "Voice" ===
The reader cannot tell which choices are the authors' decisions, because the study or an unnamed actor makes them, as in "a step-wise model training approach was adopted" (discussion.tex:6).

7.1 Place: sections/3_methodology/a_problem_formulation.tex:1
Passage: "This study aims to define a mapping function $f$"
Replacement: "We aimed to define a mapping function $f$"

7.2 Place: sections/3_methodology/d_pretraining.tex:3
Passage: "For the CNN backbone, this study extends the self-supervised DINO pre-training framework described in \citep{caronEmergingPropertiesSelfSupervised2021} to 3D MR images."
Replacement: "For the CNN backbone, we extended the self-supervised DINO pre-training framework described in \citep{caronEmergingPropertiesSelfSupervised2021} to 3D MR images."
Also breaks: references/rules.md, "Tense per section".

7.3 Place: sections/3_methodology/d_pretraining.tex:8
Passage: "Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Replacement: "Besides that, we also proposed a novel augmentation strategy specific to MR images."
Also breaks: prose standard, section E, "Personified artifacts"; references/rules.md, "Tense per section".

7.4 Place: sections/3_methodology/d_pretraining.tex:10
Passage: "To improve the encoder's understanding of disease progression, this study employs a simple binary sequence-order-prediction (SOP) task inspired by \citep{lanALBERTLiteBERT2020}."
Replacement: "To improve the encoder's understanding of disease progression, we employed a binary sequence-order-prediction (SOP) task inspired by \citep{lanALBERTLiteBERT2020}."
Also breaks: prose standard, section A, banned filler ("simple"); references/rules.md, "Tense per section".

7.5 Place: sections/5_discussion/discussion.tex:6
Passage: "Therefore, this study developed HCCNet, a spatio-temporal neural network that uses a 3D ConvNeXt backbone combined with a Transformer encoder, to predict future cancer development based on past MRI examinations."
Replacement: "Therefore, we developed HCCNet, a spatio-temporal neural network that uses a 3D ConvNeXt backbone combined with a Transformer encoder, to predict future cancer development based on past MRI examinations."

7.6 Place: sections/5_discussion/discussion.tex:6
Passage: "To support HCCNet's capability to capture disease progression over time, a step-wise model training approach was adopted."
Replacement: "To support HCCNet's capability to capture disease progression over time, we adopted a step-wise model training approach."

=== 8. references/rules.md, "Clear antecedents" ===
The reader has to guess what "this" or "that" refers to, as in "This is due to convergence issues" (3_hyperparams.tex:3), where it could be the deviation or the settings.

8.1 Place: sections/3_methodology/d_pretraining.tex:8
Passage: "This teaches the model to identify the same patient under varying acquisition conditions."
Replacement: "This augmentation strategy teaches the model to identify the same patient under varying acquisition conditions."

8.2 Place: sections/3_methodology/d_pretraining.tex:15
Passage: "This transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch."
Replacement: "This stem expansion transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch."

8.3 Place: sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "This is due to convergence issues that we noted during initial model runs."
Replacement: "This deviation is due to convergence issues that we noted during initial model runs."

8.4 Place: sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC."
Replacement: "That ranking held even though baseline models trained using diffusion weighted MRIs showed the best average discriminatory power between patients of low and high risk of HCC."
Also breaks: references/rules.md, "Tense per section" (Results, past).

=== 9. references/rules.md, "Tense per section" ===
The breaks change no claim. The reader of the methods and results reads what was done as a standing description, which the row for those sections puts in the past.
Methodology (sections 3 and 4.1 to 4.3, and appendix A), past:
- sections/2_related_work/a_longitudinal_analysis.tex:3: "it has been shown to not fully explore" / "it was shown not to fully explore"
- sections/2_related_work/a_longitudinal_analysis.tex:5: "they have been successfully employed" / "they were successfully employed"
- sections/3_methodology/b_architecture.tex:3: "We use the CNN backbone" / "We used the CNN backbone"
- sections/3_methodology/b_architecture.tex:5: "we adapt the ConvNeXt architecture" / "we adapted the ConvNeXt architecture"
- sections/3_methodology/b_architecture.tex:5: "we replace the 2-dimensional depthwise convolutional layers" / "we replaced the 2-dimensional depthwise convolutional layers"
- sections/3_methodology/b_architecture.tex:5: "and reduce the proposed kernel size" / "and reduced the proposed kernel size"
- sections/3_methodology/b_architecture.tex:14: "we concatenate the image embeddings obtained from the CNN feature extractor and prepend" / "we concatenated the image embeddings obtained from the CNN feature extractor and prepended"
- sections/3_methodology/b_architecture.tex:21: "we embed the input's positional information" / "we embedded the input's positional information"
- sections/3_methodology/b_architecture.tex:21: "we replace the conventional sequence position" / "we replaced the conventional sequence position"
- sections/3_methodology/b_architecture.tex:21: "we compute the vector of intervals" / "we computed the vector of intervals"
- sections/3_methodology/b_architecture.tex:26: "prepend" / "prepended"
- sections/3_methodology/b_architecture.tex:26: "and, finally, obtain positional encodings" / "and, finally, obtained positional encodings"
- sections/3_methodology/b_architecture.tex:34: "we add the positional encodings" / "we added the positional encodings"
- sections/3_methodology/b_architecture.tex:39: "We feed the input sequence through the encoder $G$ and select" / "We fed the input sequence through the encoder $G$ and selected"
- sections/3_methodology/b_architecture.tex:44: "we feed it through a pooling layer" / "we fed it through a pooling layer"
- sections/3_methodology/c_variants.tex:1: "we introduce four variants of HCCNet" / "we introduced four variants of HCCNet"
- sections/3_methodology/c_variants.tex:10: "we additionally introduce HCCNet-C (compact)" / "we additionally introduced HCCNet-C (compact)"
- sections/3_methodology/d_pretraining.tex:1: "we therefore design two (self-)supervised pre-training tasks" / "we therefore designed two (self-)supervised pre-training tasks"
- sections/3_methodology/d_pretraining.tex:3: "we define a student $F_s$" / "we defined a student $F_s$"
- sections/3_methodology/d_pretraining.tex:3: "we learn to match" / "we learned to match"
- sections/3_methodology/d_pretraining.tex:8: "we exploit the abundance of natural variation" / "we exploited the abundance of natural variation"
- sections/3_methodology/d_pretraining.tex:8: "we treat different series" / "we treated different series"
- sections/3_methodology/d_pretraining.tex:8: "we randomly sample one series" / "we randomly sampled one series"
- sections/3_methodology/d_pretraining.tex:8: "we sample among the pre- and post-contrast phases" / "we sampled among the pre- and post-contrast phases"
- sections/3_methodology/d_pretraining.tex:8: "we sample within a single contrast family" / "we sampled within a single contrast family"
- sections/3_methodology/d_pretraining.tex:10: "we randomly shuffle 50\% of the input sequences" / "we randomly shuffled 50\% of the input sequences"
- sections/3_methodology/d_pretraining.tex:10: "we actually randomly shuffle 66\% of sequences" / "we actually randomly shuffled 66\% of sequences"
- sections/3_methodology/d_pretraining.tex:10: "and task the model" / "and tasked the model"
- sections/3_methodology/d_pretraining.tex:10: "we keep the parameters of the CNN feature extractor fixed and initialize them" / "we kept the parameters of the CNN feature extractor fixed and initialized them"
- sections/3_methodology/d_pretraining.tex:10: "We apply the sigmoid function" / "We applied the sigmoid function"
- sections/3_methodology/d_pretraining.tex:10: "and learn to identify shuffled sequences" / "and learned to identify shuffled sequences"
- sections/3_methodology/d_pretraining.tex:15: "we concatenate the different series" / "we concatenated the different series"
- sections/3_methodology/d_pretraining.tex:15: "we reconcile the differing input dimensionality" / "we reconciled the differing input dimensionality"
- sections/3_methodology/d_pretraining.tex:15: "the learned stem filters are replicated" / "the learned stem filters were replicated"
- sections/3_methodology/e_finetuning.tex:1: "we initialize the parameters of HCCNet" / "we initialized the parameters of HCCNet"
- sections/3_methodology/e_finetuning.tex:1: "we append the final pooling layer as discussed in \ref{sec:architecture} and fine-tune the model" / "we appended the final pooling layer as discussed in \ref{sec:architecture} and fine-tuned the model"
- sections/4_experiments/a_data.tex:1: "All examinations included in the study comprise" / "All examinations included in the study comprised"
- sections/4_experiments/a_data.tex:1: "modality groups are available for every patient" / "modality groups were available for every patient"
- sections/4_experiments/a_data.tex:3: "we include all available data" / "we included all available data"
- sections/4_experiments/a_data.tex:3: "we additionally exclude all patients" / "we additionally excluded all patients"
- sections/4_experiments/a_data.tex:3: "of which 37 develop HCC" / "of which 37 developed HCC"
- sections/4_experiments/a_data.tex:3: "we evaluate HCCNet using stratified 5-fold cross-validation" / "we evaluated HCCNet using stratified 5-fold cross-validation"
- sections/4_experiments/a_data.tex:3: "We partition the patient cohort" / "We partitioned the patient cohort"
- sections/4_experiments/a_data.tex:3: "The folds are stratified by HCC outcome" / "The folds were stratified by HCC outcome"
- sections/4_experiments/a_data.tex:3: "Each fold serves as the held-out test set" / "Each fold served as the held-out test set"
- sections/4_experiments/a_data.tex:3: "the remaining four folds form the development set $D^{\text{dev}}_p$ that is used" / "the remaining four folds formed the development set $D^{\text{dev}}_p$ that was used"
- sections/4_experiments/a_data.tex:3: "is repeated independently for each fold" / "was repeated independently for each fold"
- sections/4_experiments/a_data.tex:3: "we only fine-tune HCCNet on longitudinal MRIs that are also included" / "we only fine-tuned HCCNet on longitudinal MRIs that were also included"
- sections/4_experiments/b_implementation.tex:1: "we pre-train both the CNN backbone" / "we pre-trained both the CNN backbone"
- sections/4_experiments/b_implementation.tex:1: "We train the CNN over 32000 training steps" / "We trained the CNN over 32000 training steps"
- sections/4_experiments/b_implementation.tex:1: "we linearly increase the learning rate" / "we linearly increased the learning rate"
- sections/4_experiments/b_implementation.tex:1: "we decay the learning rate" / "we decayed the learning rate"
- sections/4_experiments/b_implementation.tex:1: "We employ the same cosine decay without warm-up" / "We employed the same cosine decay without warm-up"
- sections/4_experiments/b_implementation.tex:1: "but only apply it to the weights" / "but only applied it to the weights"
- sections/4_experiments/b_implementation.tex:1: "we also limit the temperature" / "we also limited the temperature"
- sections/4_experiments/b_implementation.tex:3: "pre-training of the Transformer encoder considers" is given in finding 6.4.
- sections/4_experiments/b_implementation.tex:3: "we train the Transformer encoder using an abbreviated pre-training protocol of just 8000 training steps" / "we trained the Transformer encoder using an abbreviated pre-training protocol of 8000 training steps" (also breaks: prose standard, section A, banned filler, "just" as a softener)
- sections/4_experiments/b_implementation.tex:3: "We set the maximal sequence length to $s = 8$, apply dropout with probability $p = 0.2$, and employ" / "We set the maximal sequence length to $s = 8$, applied dropout with probability $p = 0.2$, and employed"
- sections/4_experiments/b_implementation.tex:5: "we update HCCNet" / "we updated HCCNet"
- sections/4_experiments/b_implementation.tex:5: "We fine-tune the model over 400 training steps" / "We fine-tuned the model over 400 training steps"
- sections/4_experiments/b_implementation.tex:5: "but decrease the weight decay" / "but decreased the weight decay"
- sections/4_experiments/b_implementation.tex:5: "we select the batch size" / "we selected the batch size"
- sections/4_experiments/b_implementation.tex:5: "we then train HCCNet" / "we then trained HCCNet"
- sections/4_experiments/b_implementation.tex:7: "we establish a baseline" / "we established a baseline"
- sections/4_experiments/b_implementation.tex:7: "we equally train the baseline" / "we equally trained the baseline"
- sections/4_experiments/b_implementation.tex:7: "We employ the same optimizer" / "We employed the same optimizer"
- sections/4_experiments/b_implementation.tex:7: "but slightly increase the learning rate warm-up" / "but increased the learning rate warm-up" (the cut of "slightly" rests on the same sentence, which gives the change from 20 to 40 training steps)
- sections/4_experiments/b_implementation.tex:9: "we additionally evaluate a set of exploratory multi-modal configurations" / "we additionally evaluated a set of exploratory multi-modal configurations"
- sections/4_experiments/b_implementation.tex:9: "we naively concatenate the series" / "we naively concatenated the series"
- sections/4_experiments/b_implementation.tex:9: "we evaluate the full fusion" / "we evaluated the full fusion"
- sections/4_experiments/b_implementation.tex:9: "augmentation views are sampled" / "augmentation views were sampled"
- sections/4_experiments/b_implementation.tex:11: "we further disentangle the contributions" / "we further disentangled the contributions"
- sections/4_experiments/b_implementation.tex:11: "we evaluate two intermediate configurations" / "we evaluated two intermediate configurations"
- sections/4_experiments/b_implementation.tex:11: "We conduct this ablation" / "We conducted this ablation"
- sections/4_experiments/c_evaluation.tex:1: "we evaluate HCCNet's baseline" / "we evaluated HCCNet's baseline"
- sections/4_experiments/c_evaluation.tex:1: "we train ten independently seeded models (fifty models in total) and average" / "we trained ten independently seeded models (fifty models in total) and averaged"
- sections/4_experiments/c_evaluation.tex:1: "Every reported metric is computed" / "Every reported metric was computed"
- sections/4_experiments/c_evaluation.tex:1: "we employ the following performance metrics" / "we employed the following performance metrics"
- sections/4_experiments/c_evaluation.tex:1: "we also explore the robustness of the model" / "we also explored the robustness of the model"
- sections/4_experiments/c_evaluation.tex:6: "we evaluate the models' respective calibration" / "we evaluated the models' respective calibration"
- sections/appendix/a_implementation/1_conv_layer.tex:3: "we inflate the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduce" / "we inflated the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduced"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we randomly crop two global views" / "we randomly cropped two global views"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we randomly crop a multi-channel sub-volume" / "we randomly cropped a multi-channel sub-volume"
- sections/appendix/a_implementation/2_augmentations.tex:1: "further augmentations remain consistent across pre-training" / "further augmentations remained consistent across pre-training"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we randomly shift and scale the intensity by a constant $v$ using probability $p = 1.0$, apply random 90 degree rotations with probability $p = 0.5$, and randomly flip" / "we randomly shifted and scaled the intensity by a constant $v$ using probability $p = 1.0$, applied random 90 degree rotations with probability $p = 0.5$, and randomly flipped"
- sections/appendix/a_implementation/2_augmentations.tex:1: "we use the same data augmentation strategy" / "we used the same data augmentation strategy"
Results (section 4.4 and appendix B), past:
- sections/4_experiments/d_results.tex:5: "shows excellent predictive capability" / "showed excellent predictive capability"
- sections/4_experiments/d_results.tex:5: "appear to display less expressive characteristics" / "appeared to display less expressive characteristics"
- sections/4_experiments/d_results.tex:5: "still maintain a stronger average predictive capability" / "still maintained a stronger average predictive capability"
- sections/4_experiments/d_results.tex:5: "are also evaluated in their own right" / "were also evaluated in their own right"
- sections/4_experiments/d_results.tex:5: "is markedly stronger on AUROC" / "was markedly stronger on AUROC"
- sections/4_experiments/d_results.tex:5: "while on AUPRC the two are comparable" / "while on AUPRC the two were comparable"
- sections/4_experiments/d_results.tex:5: "The combined T1 IOP \& T2-MRI modality reaches" / "The combined T1 IOP \& T2-MRI modality reached"
- sections/4_experiments/d_results.tex:5: "so the T2-MRI model alone exceeds it" / "so the T2-MRI model alone exceeded it"
- sections/4_experiments/d_results.tex:5: "the combined modality nonetheless remains the weakest" / "the combined modality nonetheless remained the weakest"
- sections/4_experiments/d_results.tex:9: "the per-fold ensemble closely follows the diagonal line" / "the per-fold ensemble closely followed the diagonal line"
- sections/4_experiments/d_results.tex:9: "This robustness is tightest on AUROC" / "This robustness was tightest on AUROC"
- sections/4_experiments/d_results.tex:9: "No model variant falls consistently below" / "No model variant fell consistently below"
- sections/4_experiments/d_results.tex:11: "the models are thus robust" / "the models were thus robust"
- sections/4_experiments/d_results.tex:11: "the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating" / "the plots revealed no consistent differences across model variants, as no model variant deviated persistently" (also breaks: prose standard, section D, "No synonym cycling", "model architecture" for "model variant")
- sections/4_experiments/d_results.tex:15: "Across imaging modalities, the magnitude of the improvement from our proposed approach varies." / "Across imaging modalities, the magnitude of the improvement from our proposed approach varied."
- sections/4_experiments/d_results.tex:19: "the plots largely align with the results" / "the plots largely aligned with the results"
- sections/4_experiments/d_results.tex:19: "the expected calibration error does not display the same negative relationship" / "the expected calibration error did not display the same negative relationship"
- sections/4_experiments/d_results.tex:19: "consistently show the lowest expected calibration error" / "consistently showed the lowest expected calibration error"
- sections/4_experiments/d_results.tex:19: "display the highest expected calibration error" / "displayed the highest expected calibration error"
- sections/4_experiments/d_results.tex:21: "This reduction is largest for diffusion weighted MR images at 56.0\%, reaches 37.0\%" / "This reduction was largest for diffusion weighted MR images at 56.0\%, reached 37.0\%"
- sections/4_experiments/d_results.tex:21: "and is smallest at 12.1\%" / "and was smallest at 12.1\%"
- sections/4_experiments/d_results.tex:25: "None of the fused configurations exceeds this best single modality." / "None of the fused configurations exceeded this best single modality."
- sections/4_experiments/d_results.tex:25: "Adding T1 DCE-MRI to DW-MRI lowers performance" / "Adding T1 DCE-MRI to DW-MRI lowered performance"
- sections/4_experiments/d_results.tex:25: "leaves performance essentially equal" / "left performance essentially equal"
- sections/4_experiments/d_results.tex:25: "matches DW-MRI alone on AUROC" / "matched DW-MRI alone on AUROC"
- sections/4_experiments/d_results.tex:29: "pre-training only the CNN backbone recovers essentially all" / "pre-training only the CNN backbone recovered essentially all"
- sections/4_experiments/d_results.tex:29: "yields AUPRC = 0.310" / "yielded AUPRC = 0.310"
- sections/4_experiments/d_results.tex:29: "The CNN-backbone dominance also holds" / "The CNN-backbone dominance also held"
- sections/4_experiments/d_results.tex:29: "clearly exceeds the Transformer encoder alone" / "clearly exceeded the Transformer encoder alone"
- sections/4_experiments/d_results.tex:29: "the two stages contribute comparably" / "the two stages contributed comparably"
- sections/4_experiments/d_results.tex:29: "These results indicate that" / "These results indicated that"
- sections/appendix/b_additional_results/1_baseline.tex:3: "consistently display the highest detection rate" / "consistently displayed the highest detection rate"
- sections/appendix/b_additional_results/2_reliability.tex:3: "consistently display the lowest average reliability scores" / "consistently displayed the lowest average reliability scores"
- sections/appendix/b_additional_results/2_reliability.tex:3: "preceding pre-training establishes a negative relationship" / "preceding pre-training established a negative relationship"
- sections/appendix/b_additional_results/2_reliability.tex:3: "HCCNet fine-tuned using diffusion weighted MRIs display the lowest" / "HCCNet fine-tuned using diffusion weighted MRIs displayed the lowest"
- sections/appendix/b_additional_results/2_reliability.tex:3: "exhibit the highest average reliability metrics" / "exhibited the highest average reliability metrics"

=== 10. Prose standard, section C ===
The breaks change no claim. They cost the reader sentences that announce or flag content instead of stating it.

10.1 Place: sections/4_experiments/d_results.tex:3
Passage: "We report HCCNet's fine-tuned performance (i) across imaging modalities, (ii) model variations, and (iii) against a randomly initialized baseline."
Replacement: delete

10.2 Place: sections/3_methodology/d_pretraining.tex:8
Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views."
Replacement: "In our implementation, we used a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views."
Also breaks: references/rules.md, "Tense per section".

10.3 Place: sections/3_methodology/d_pretraining.tex:15
Passage: "Note that during pre-training of the Transformer encoder we do not randomly crop multiple views from the same image but instead only crop a single view of shape $s = 72^3$ from the original MRI."
Replacement: "During pre-training of the Transformer encoder, we did not randomly crop multiple views from the same image but instead only cropped a single view of shape $s = 72^3$ from the original MRI."
Also breaks: references/rules.md, "Tense per section".

10.4 Place: sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "Note that during CNN-backbone pre-training we slightly deviate from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}."
Replacement: "During CNN-backbone pre-training, we deviated from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021} in the projection head's output dimensionality and the teacher temperature."
The specific claim rests on the next two sentences of the paragraph, which name these two deviations and state that the other parameters follow \citep{caronEmergingPropertiesSelfSupervised2021}.
Also breaks: prose standard, section A, vague qualifiers ("slightly"); references/rules.md, "Tense per section".

=== 11. Prose standard, section A, banned filler and flagged terms ===
The breaks change no claim. The reader gets a softener with no fact in it, as in "Instead of simply comparing".

11.1 Place: sections/2_related_work/a_longitudinal_analysis.tex:3
Passage: "While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}."
Replacement: "While the approach [the concrete implementation cost, such as the number of components], it was shown not to fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}."
Also breaks: references/rules.md, "Tense per section" (Literature review, reporting findings, past).

11.2 Place: sections/2_related_work/b_pretraining.tex:3
Passage: "Instead of simply comparing view pairs from different patients, they additionally considered the time interval between image screenings from the same patient for their loss calculation."
Replacement: "Instead of comparing view pairs from different patients only, they additionally considered the time interval between image screenings from the same patient for their loss calculation."

11.3 Place: sections/2_related_work/b_pretraining.tex:5
Passage: "adopts a simple sequence-order-prediction task inspired by"
Replacement: "adopts a sequence-order-prediction task inspired by"

11.4 Place: sections/4_experiments/a_data.tex:3
Passage: "To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Replacement: "To obtain reliable performance estimates despite the limited number of positive cases, we evaluated HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Also breaks: references/rules.md, "Tense per section". (This place is not repeated in the tense list.)

=== 12. Prose standard, section D, "No synonym cycling" ===
The reader may take "model variations" and "model variants" for different sets, though both name the five HCCNet sizes defined in c_variants.tex:3-7.
- sections/3_methodology/c_variants.tex:1: "The five model variations are:" / "The five model variants are:"
- sections/4_experiments/c_evaluation.tex:1: "For the comparison across model variations" / "For the comparison across model variants"
- sections/4_experiments/d_results.tex:9: "\textbf{Comparison across Model Variations.}" / "\textbf{Comparison across Model Variants.}"
- sections/4_experiments/d_results.tex:5: "stratified by imaging modality and model architecture" / "stratified by imaging modality and model variant"
- sections/4_experiments/d_results.tex:5: "across model architectures" / "across model variants"
- sections/4_experiments/d_results.tex:15: "stratified by image modality and model variation" / "stratified by imaging modality and model variant"
- sections/appendix/b_additional_results/1_baseline.tex:3: "stratified by image modality and model variation" / "stratified by imaging modality and model variant"
- sections/appendix/b_additional_results/2_reliability.tex:3: "stratified by imaging modality and model architecture" / "stratified by imaging modality and model variant"
- tables/hyperparams.tex:36: "for model variations HCCNet-F, -C, and -P" / "for model variants HCCNet-F, -C, and -P"

=== 13. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" ===
The breaks change no claim. The reader has to hold two topics in one block, as in a_data.tex:3, whose ten sentences cover cohort selection, the fold design, leakage control and reporting.

13.1 Place: sections/abstract/abstract.tex:3
Passage: "The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time. We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement: "The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time.

Applying HCCNet to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance indicates its effectiveness."

13.2 Place: sections/1_introduction/introduction.tex:13
Passage: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes. The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."
Replacement: "This application not only indicates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can influence clinical outcomes [the measured effect on clinical outcomes, with its citation].

The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."

13.3 Place: sections/1_introduction/introduction.tex:13
Passage: "Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases. All code for the proposed method is available at: \href{https://github.com/jmnolte/HCCNet}{github.com/jmnolte/HCCNet}."
Replacement: "Thus, HCCNet may provide a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases.

All code for the proposed method is available at: \href{https://github.com/jmnolte/HCCNet}{github.com/jmnolte/HCCNet}."

13.4 Place: sections/2_related_work/a_longitudinal_analysis.tex:3
Passage: "While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}. Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
Replacement: "While the approach [the concrete implementation cost, such as the number of components], it was shown not to fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}.

Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."

13.5 Place: sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and typically employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings. Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."
Replacement: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor, and [the share of hybrid models, with citations] employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings.

Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."

13.6 Place: sections/2_related_work/b_pretraining.tex:3
Passage: "As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}. \cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."
Replacement: "As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}.

\cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."

13.7 Place: sections/3_methodology/a_problem_formulation.tex:1
Passage: "As such, the data of each patient $p \in \{1, 2, ..., P\}$ corresponds to a vector of unique length and is denoted by $D^p = \{i^{(p,1)}, i^{(p,2)}, ..., i^{(p,t)}; t_{HCC}^p\}$, where ${i^{(p,t)}}$ is the patient's MRI examination at time point $t$ and $t_{HCC}^p$ is the patient's date of diagnosis which is set to None if HCC was not diagnosed within $t$. For each patient with $t_{HCC}^p \neq \text{None}$, patient records are subset during fine-tuning such that the patient's last considered observation $i^{(p,t)}$ has time point $t < t_{HCC}^p$."
Replacement: "As such, the data of each patient $p \in \{1, 2, ..., P\}$ corresponds to a vector of unique length and is denoted by $D^p = \{i^{(p,1)}, i^{(p,2)}, ..., i^{(p,t)}; t_{HCC}^p\}$, where ${i^{(p,t)}}$ is the patient's MRI examination at time point $t$ and $t_{HCC}^p$ is the patient's date of diagnosis which is set to None if HCC was not diagnosed within $t$.

For each patient with $t_{HCC}^p \neq \text{None}$, patient records were subset during fine-tuning such that the patient's last considered observation $i^{(p,t)}$ had time point $t < t_{HCC}^p$."
Also breaks: references/rules.md, "Tense per section" ("are subset", "has time point").

13.8 Place: sections/3_methodology/d_pretraining.tex:8
Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views. Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Replacement: "In our implementation, we used a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views.

Besides that, we also proposed a novel augmentation strategy specific to MR images."

13.9 Place: sections/3_methodology/d_pretraining.tex:8
Passage: "Specifically, we treat different series within a contrast-coherent subset of an MRI sequence as natural augmentations of the same image. For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sample one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sample among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sample within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)."
Replacement: "Specifically, we treated different series within a contrast-coherent subset of an MRI sequence as natural augmentations of the same image.

For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sampled one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sampled among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sampled within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)."

13.10 Place: sections/3_methodology/d_pretraining.tex:10 and sections/3_methodology/d_pretraining.tex:15
Passage: "We apply the sigmoid function to the output of the model's pooling layer and learn to identify shuffled sequences by minimizing the binary cross-entropy loss w.r.t. the parameters $\theta_{G^\prime} = \theta_G \cup \theta_\phi$ of the Transformer encoder $G$ and the pooling layer $\phi$: \begin{equation} \min_{\theta_{G^\prime}} - \sum_{e \in \textbf{E}^{(p,t)}} t_{G^\prime}(e) \text{log}(p_{G^\prime}(e)), \end{equation} \noindent where $p_{G^\prime}(e)$ is the predicted probability of shuffling and $t_{G^\prime}(e)$ is the true value. Note that during pre-training of the Transformer encoder we do not randomly crop multiple views from the same image but instead only crop a single view of shape $s = 72^3$ from the original MRI."
Replacement: "We applied the sigmoid function to the output of the model's pooling layer and learned to identify shuffled sequences by minimizing the binary cross-entropy loss w.r.t. the parameters $\theta_{G^\prime} = \theta_G \cup \theta_\phi$ of the Transformer encoder $G$ and the pooling layer $\phi$: \begin{equation} \min_{\theta_{G^\prime}} - \sum_{e \in \textbf{E}^{(p,t)}} t_{G^\prime}(e) \text{log}(p_{G^\prime}(e)), \end{equation} \noindent where $p_{G^\prime}(e)$ is the predicted probability of shuffling and $t_{G^\prime}(e)$ is the true value.

During pre-training of the Transformer encoder, we did not randomly crop multiple views from the same image but instead only cropped a single view of shape $s = 72^3$ from the original MRI."

13.11 Place: sections/3_methodology/d_pretraining.tex:15
Passage: "Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ is thus a four rather than a one channel volume. Since the backbone is pre-trained on single-channel views, we reconcile the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters are replicated across the input series to initialize the first convolutional layer, which is then fine-tuned end to end."
Replacement: "Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ is thus a four rather than a one channel volume.

Since the backbone was pre-trained on single-channel views, we reconciled the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters were replicated across the input series to initialize the first convolutional layer, which was then fine-tuned end to end."

13.12 Place: sections/4_experiments/a_data.tex:1
Passage: "Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing. All examinations included in the study comprise the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups are available for every patient."
Replacement: "Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing.

All examinations included in the study comprised the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups were available for every patient."

13.13 Place: sections/4_experiments/a_data.tex:3
Passage: "During fine-tuning we additionally exclude all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 develop HCC (i.e., 703 and 101 total MRI examinations respectively). To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Replacement: "During fine-tuning we additionally excluded all patients without a definitive diagnosis of HCC, yielding a total of 243 patients of which 37 developed HCC (i.e., 703 and 101 total MRI examinations respectively).

To obtain reliable performance estimates despite the limited number of positive cases, we evaluated HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."

13.14 Place: sections/4_experiments/a_data.tex:3
Passage: "Each fold serves as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds form the development set $D^{\text{dev}}_p$ that is used for both pre-training and fine-tuning. The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) is repeated independently for each fold using only the data of its development set."
Replacement: "Each fold served as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds formed the development set $D^{\text{dev}}_p$ that was used for both pre-training and fine-tuning.

The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) was repeated independently for each fold using only the data of its development set."

13.15 Place: sections/4_experiments/a_data.tex:3
Passage: "As before, to avoid leakage between pre-training and fine-tuning within a fold, we only fine-tune HCCNet on longitudinal MRIs that are also included in the fold's development superset $D^{\text{dev}}_p$. All results are reported as the mean and standard deviation across the five folds."
Replacement: "As before, to avoid leakage between pre-training and fine-tuning within a fold, we only fine-tuned HCCNet on longitudinal MRIs that were also included in the fold's development superset $D^{\text{dev}}_p$.

All results are reported as the mean and standard deviation across the five folds."

13.16 Place: sections/4_experiments/b_implementation.tex:1
Passage: "After reaching its maximum value, we decay the learning rate using a cosine schedule. We employ the same cosine decay without warm-up for the weight decay $\lambda$ but only apply it to the weights of the parameters excluding normalization layers \citep{liUnderstandingDisharmonyWeight2020}."
Replacement: "After reaching its maximum value, we decayed the learning rate using a cosine schedule.

We employed the same cosine decay without warm-up for the weight decay $\lambda$ but only applied it to the weights of the parameters excluding normalization layers \citep{liUnderstandingDisharmonyWeight2020}."

13.17 Place: sections/4_experiments/c_evaluation.tex:1
Passage: "Every reported metric is computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds. For evaluation, we employ the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."
Replacement: "Every reported metric was computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds.

For evaluation, we employed the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."

13.18 Place: sections/4_experiments/d_results.tex:5
Passage: "Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appear to display less expressive characteristics for the prediction of HCC development, albeit models trained using contrast enhanced T1-weighted images still maintain a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759). The two contrasts that make up this combined group are also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."
Replacement: "Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appeared to display less expressive characteristics for the prediction of HCC development, albeit models trained using contrast enhanced T1-weighted images still maintained a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759).

The two contrasts that make up this combined group were also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."

13.19 Place: sections/4_experiments/d_results.tex:19
Passage: "Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}. For the fine-tuned models, the plots largely align with the results presented in Table \ref{tab:results_base_pre}."
Replacement: "Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}.

For the fine-tuned models, the plots largely aligned with the results presented in Table \ref{tab:results_base_pre}."

13.20 Place: sections/5_discussion/discussion.tex:12
Passage: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little. Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."
Replacement: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little.

Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."

13.21 Place: sections/6_conclusion/conclusion.tex:1
Passage: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work. The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work.

The methodology may be versatile and may offer a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."

13.22 Place: sections/6_conclusion/conclusion.tex:1
Passage: "Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework. Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy, while further external validation is needed to assess the generalizability of the study's findings."
Replacement: "Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework.

Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy, while further external validation is needed to assess the generalizability of the study's findings."

13.23 Place: sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC. Contrarily, for the fine-tuned models, preceding pre-training establishes a negative relationship between performance and reliability metrics."
Replacement: "That ranking held even though baseline models trained using diffusion weighted MRIs showed the best average discriminatory power between patients of low and high risk of HCC.

Contrarily, for the fine-tuned models, preceding pre-training established a negative relationship between performance and reliability metrics."

=== 14. Prose standard, section 0, "Em dash: zero" (spaced hyphen or "--" as an aside) ===
The breaks change no claim; all stand in LaTeX comments that do not print. They cost a co-author reading the source the aside construction the standard bans in every comment.
- main.tex:47: "Longitudinal 3D MRI Images: -- A Case Study on Hepatocellular Carcinoma Prediction" / "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction"
- main.tex:49: "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma Prediction" / "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction"
- main.tex:51: "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma Prediction" / "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction"
- main.tex:53: "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma" / "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma"
- main.tex:57: "Longitudinal Medical Images -- Application to Hepatocellular Carcinoma" / "Longitudinal Medical Images, with an Application to Hepatocellular Carcinoma"
- sections/5_discussion/discussion.tex:1: "This study therefore developed HCCNet - a spatio-temporal neural network that utilizes a 3D ConvNeXt backbone combined with a transformer encoder - to predict future cancer development based on past MRI examinations." / "This study therefore developed HCCNet, a spatio-temporal neural network that utilizes a 3D ConvNeXt backbone combined with a transformer encoder, to predict future cancer development based on past MRI examinations."

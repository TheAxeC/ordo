Review of the HCCNet manuscript (main.tex and the 33 files it inputs, read as one document). Register applied: Medicine and Health, because the draft predicts a clinical outcome in a patient cohort for the journal Intelligent Medicine. Command run on each file: `LC_ALL=C grep -n '[^ -~]' <file>`. Its only hit was main.tex:75 "St<latin small letter e with acute>phanie", an accented letter in a name, which stays. Paths below are relative to the main file's folder. Where one sentence has findings under several rules, every finding gives the same combined replacement.

== references/rules.md, "Limitations and alternative interpretations"
The reader takes away general conclusions about model size and about which pre-training stage matters, but the draft's own tables show those conclusions hold only for some modalities.

1. sections/4_experiments/d_results.tex:11
"This corresponds with the results presented in Table \ref{tab:finetuned_results}, which indicate that compared to the differences between imaging modalities model size only negligibly affects downstream model performance."
Replacement: "The absence of consistent differences in the plots corresponded with the results presented in Table \ref{tab:finetuned_results}, which indicated that compared to the differences between imaging modalities model size only negligibly affected downstream model performance, except on AUPRC for T1 DCE-MRI, where it ranged from 0.329 (HCCNet-C) to 0.628 (HCCNet-N), and for DW-MRI, where it ranged from 0.507 (HCCNet-N) to 0.725 (HCCNet-T)."
(This replacement also ends the "Clear antecedents" and tense breaks in the same sentence.)

2. sections/4_experiments/b_implementation.tex:9
"Owing to the limited number of positive cases and our finding that model capacity only negligibly affects downstream performance, we restrict the fusion experiments to the HCCNet-Pico variant."
Replacement: "Owing to the limited number of positive cases and our finding that model capacity only negligibly affected downstream performance outside the AUPRC of T1 DCE-MRI and DW-MRI, we restricted the fusion experiments to the HCCNet-P variant."

3. sections/5_discussion/discussion.tex:12
"An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little."
Replacement: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit for DW-MRI and T1 DCE-MRI, while the sequence-order-prediction task contributes comparatively little for these two modalities. For the combined T1 IOP \& T2-MRI modality, the two stages contributed comparably (AUPRC = 0.457 for the Transformer encoder alone versus 0.447 for the CNN backbone alone)."

4. sections/6_conclusion/conclusion.tex:1
"Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains, while the sequence-order-prediction task contributes comparatively little."
Replacement: "Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains for DW-MRI and T1 DCE-MRI, while the sequence-order-prediction task contributes comparatively little for them and comparably to the CNN backbone for the combined T1 IOP \& T2-MRI modality."

5. sections/1_introduction/introduction.tex:11
"Additionally, the Transformer encoder is pre-trained with a sequence-order-prediction task inspired by techniques used in natural language processing, which helps the model to understand the progression of disease over time and to make accurate predictions despite the irregular timing of medical screenings \citep{zeng2021positional}."
Replacement: the same sentence, followed by "In the ablation of Section~\ref{sec:results}, this task raised AUPRC over the randomly initialized baseline for the combined T1-weighted in- and out-of-phase and T2-weighted images (0.457 versus 0.307) but added little for diffusion-weighted (0.310 versus 0.308) and dynamic contrast-enhanced T1-weighted images (0.361 versus 0.350)."

== references/rules.md, "Hedging"
The reader is told that results from one center, with 37 positive patients, establish general clinical value and mechanisms that the draft did not measure.

6. sections/abstract/abstract.tex:3
"We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement: "Results on a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance indicate the effectiveness of HCCNet."

7. sections/abstract/abstract.tex:3
"Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, providing a reliable tool for personalized HCC surveillance."
Replacement: "Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, which suggests that it could support personalized HCC surveillance."

8. sections/abstract/abstract.tex:5
"The methodological approach presented in this paper is versatile and can be adapted to various longitudinal MRI screening applications."
Replacement: "The methodological approach presented in this paper may be versatile and could be adapted to various longitudinal MRI screening applications."

9. sections/abstract/abstract.tex:5
"Its ability to handle varying patient record lengths and irregular screening intervals establishes it as an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
Replacement: "Because it handles varying patient record lengths and irregular screening intervals, it could serve as a framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
(This also ends the prose standard's section 0 break on "invaluable" and the section E spec-sheet "Its ability to".)

10. sections/1_introduction/introduction.tex:9
"Unlike previous approaches that rely on 2D slices or disregard the irregular intervals between scans, HCCNet is designed to handle the complexities of longitudinal data, making it better suited for tasks like predicting disease progression \citep{jin2021predicting}."
Replacement: "Unlike previous approaches that rely on 2D slices or disregard the irregular intervals between scans, HCCNet is designed to handle 3D volumes, patient records of varying length and irregular intervals between scans, which could make it better suited for tasks like predicting disease progression \citep{jin2021predicting}."
(This also ends the "Most specific term" break on "the complexities of longitudinal data".)

11. sections/1_introduction/introduction.tex:13
"By fine-tuning the pre-trained model on this dataset, we demonstrate the model's ability to predict whether a patient will develop HCC at the next examination \citep{parikh2020biomarkers}."
Replacement: "Fine-tuning the pre-trained model on this dataset indicates that the model can predict whether a patient will develop HCC at the next examination \citep{parikh2020biomarkers}."

12. sections/1_introduction/introduction.tex:13
"Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."
Replacement: "Thus, HCCNet could serve as a flexible framework for various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."
(This also ends the section E spec-sheet "provides".)

13. sections/5_discussion/discussion.tex:10
"Inspection of the models' reliability diagrams further demonstrated that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning."
Replacement: "Inspection of the models' reliability diagrams further suggested that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, which may reduce the extent to which calibration errors are propagated and amplified during fine-tuning."

14. sections/5_discussion/discussion.tex:10
"Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, demonstrating the value of our proposed pre-training framework for applications in the medical domain."
Replacement: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, which suggests the value of our proposed pre-training framework for applications in the medical domain."

15. sections/5_discussion/discussion.tex:12
"We attribute this to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
Replacement: "The absence of a gain from fusion may be due to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences. We view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
(This also ends the "Clear antecedents" break on "this" and the "Formality" break of two ideas in one sentence.)

16. sections/appendix/b_additional_results/2_reliability.tex:3
"Contrarily, for the fine-tuned models, preceding pre-training establishes a negative relationship between performance and reliability metrics."
Replacement: "Contrarily, for the fine-tuned models, preceding pre-training appeared to establish a negative relationship between performance and reliability metrics."

17. sections/6_conclusion/conclusion.tex:1
"The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: "The methodology may be versatile and could offer a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."

== references/rules.md, "Evidence for claims"
The reader cannot check the claims that build the research gap, because they carry no source.

18. sections/2_related_work/a_longitudinal_analysis.tex:1
"To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data."
Replacement: "To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data \citep{[citations, from the author]}."

19. sections/2_related_work/a_longitudinal_analysis.tex:1
"As a result, longitudinal imaging has long been established as the gold standard in many branches of oncology, enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time."
Replacement: "As a result, longitudinal imaging has long been established as the gold standard in [the branches of oncology, named, from the author] \citep{[citation, from the author]}. Recent studies have therefore extended the analysis of medical imaging to the analysis of imaging data across time \citep{[citations, from the author]}."
(This also ends the section A vague qualifier "many" and the "Formality" break of two ideas in one sentence.)

20. sections/2_related_work/a_longitudinal_analysis.tex:5
"To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis."
Replacement: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis \citep{[source of this ranking, from the author]}."

21. sections/2_related_work/b_pretraining.tex:1
"While the temporal relationship across medical image screening is increasingly investigated, pre-training approaches for longitudinal medical image analysis remain scarcely explored."
Replacement: "While the temporal relationship across medical image screening is increasingly investigated, pre-training approaches for longitudinal medical image analysis remain scarcely explored \citep{[citations, from the author]}."

22. sections/2_related_work/b_pretraining.tex:1
"Using the potential abundance of unlabeled data, some longitudinal medical imaging studies have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
Replacement: "Using the potential abundance of unlabeled data, longitudinal medical imaging studies such as \citet{jamaludinSelfsupervisedLearningSpinal2017} and \citet{rivailModelingDiseaseProgression2019} have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
(This also ends the references/rules.md "Vague language" break on "some researchers".)

23. sections/2_related_work/b_pretraining.tex:3
"Among them, contrastive learning approaches remain the most commonly applied pre-training framework."
Replacement: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework \citep{[citation, from the author]}."

24. sections/3_methodology/d_pretraining.tex:1
"When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks."
Replacement: "When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks \citep{[citations, from the author]}."

25. sections/1_introduction/introduction.tex:7
"Likewise, most deep learning applications are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."
Replacement: "Likewise, [the share, from the author] of deep learning applications are aimed at detecting a malignancy \citep{[citations, from the author]}, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."

26. sections/5_discussion/discussion.tex:12
"Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast, and this variation is richest for diffusion-weighted imaging, for which pre-training yielded the largest gains."
Replacement: "Our augmentation strategy exposes the backbone to the natural variation among the series that share a common contrast. This variation may be richest for diffusion-weighted imaging [the evidence or citation, from the author], for which pre-training yielded the largest gains."
(This also ends the "Hedging" and "Formality" breaks in the same sentence.)

== references/rules.md, "Most specific term"
The reader is led to a wrong reading of the results: "accuracy" is a reported metric on which the stated ranking does not hold.

27. sections/5_discussion/discussion.tex:8
"while combined T1 in- and out-of-phase and T2-weighted MRIs exhibited the lowest accuracy at the group level"
Replacement: "while combined T1 in- and out-of-phase and T2-weighted MRIs exhibited the lowest AUPRC and AUROC at the group level"

28. sections/5_discussion/discussion.tex:8
"Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images"
Replacement: "Our proposed pre-training approach improved AUPRC by up to 147.1\% for models fine-tuned using diffusion-weighted MR images"

29. sections/3_methodology/e_finetuning.tex:1
"Additionally, we append the final pooling layer as discussed in \ref{sec:architecture} and fine-tune the model on our initial task by minimizing the class-balanced binary cross-entropy w.r.t. all parameters $\theta_{\text{HCCNet}}$:"
Replacement: "Additionally, we appended the final pooling layer as discussed in \ref{sec:architecture} and fine-tuned the model on the prediction of HCC at the next examination by minimizing the class-balanced binary cross-entropy w.r.t. all parameters $\theta_{\text{HCCNet}}$:"

== references/registers.md, "What the reader looks for" and "Voice"
A clinical reader cannot check the study against a reporting guideline, and some of the authors' own decisions are written as if no one made them.

30. sections/4_experiments/a_data.tex:1 (no reporting guideline is named anywhere in the methods)
"We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands."
Replacement: "We evaluated HCCNet on data that were retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands. The study is reported according to [the reporting guideline followed, such as TRIPOD+AI or CLAIM, from the author]."

31. sections/5_discussion/discussion.tex:6
"To support HCCNet's capability to capture disease progression over time, a step-wise model training approach was adopted."
Replacement: "To support HCCNet's capability to capture disease progression over time, we adopted a step-wise model training approach."

32. sections/5_discussion/discussion.tex:16
"Despite these successes, several challenges and limitations were identified."
Replacement: "Despite these successes, we identified several challenges and limitations."

== references/rules.md, "Terms defined at first use"
A clinical reader meets abbreviations and method names that are never explained.

33. main.tex:45 (first use of CNN and MRI, which are never spelled out anywhere in the draft)
"\title{HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from Longitudinal 3D MRI, with a Case Study on Hepatocellular Carcinoma}"
Replacement: "\title{HCCNet: A Self-Supervised Convolutional Neural Network (CNN)-Transformer for Disease Prognosis from Longitudinal 3D Magnetic Resonance Imaging (MRI), with a Case Study on Hepatocellular Carcinoma}"

34. sections/abstract/abstract.tex:1 (first use of ConvNeXt)
"To address this, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
Replacement: "To address the focus on cross-sectional imaging data, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture, [a one-clause definition of ConvNeXt, from the author], with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
(This also ends the "Clear antecedents" break on "this".)

35. sections/1_introduction/introduction.tex:11 (first use of DINO)
"The CNN backbone is pre-trained using an extended version of the DINO framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."
Replacement: "The CNN backbone is pre-trained using an extended version of the DINO framework, a self-supervised framework in which a student network learns to match the output distribution of a teacher network built as an exponential moving average of the student \citep{caronEmergingPropertiesSelfSupervised2021}. Our extension adapts DINO to 3D MRI and treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."

36. sections/3_methodology/b_architecture.tex:14 (first use of Pre-LN)
"The Transformer encoder is based on the Pre-LN implementation \citep{xiongLayerNormalizationTransformer2020} of the original Transformer encoder architecture"
Replacement: "The Transformer encoder is based on the Pre-LN implementation \citep{xiongLayerNormalizationTransformer2020}, which applies layer normalization (LN) before each attention and feed-forward sublayer, of the original Transformer encoder architecture"

37. sections/3_methodology/b_architecture.tex:5 (first use of "patchify layer")
"Additionally, we reimplement the patchify layer in ConvNeXt with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size typically encountered in volumetric data."
Replacement: "Additionally, we reimplemented the patchify layer in ConvNeXt (its first convolutional layer, which downsamples the input image) with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size of volumetric data (crops of $72^3$ voxels in this study)."
(This also ends the tense break and the section A vague qualifier "typically".)

38. sections/appendix/b_additional_results/1_baseline.tex:3 (SSL is never defined)
"Overall differences between imaging modalities are however far less pronounced than for the models intialized with SSL pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remains generally poor."
Replacement: "Overall differences between imaging modalities were however far less pronounced than for the models intialized with self-supervised learning (SSL) pre-trained weighted (s. Table \ref{tab:finetuned_results}). The overall diagnostic performance remained poor (AUPRC from 0.228 to 0.375 and AUROC from 0.592 to 0.724 across all baseline models)."
(This also ends the tense break, the "Formality" break of two ideas in one sentence, and the section A vague qualifier "generally".)

39. sections/4_experiments/c_evaluation.tex:6 (Brier score is never defined)
"Likewise, for the comparison against the randomly initialized baseline, we evaluate the models' respective calibration considering the expected (ECE), and maximum calibration error (MCE) as well as the Brier score."
Replacement: "Likewise, for the comparison against the randomly initialized baseline, we evaluated the models' respective calibration considering the expected (ECE), and maximum calibration error (MCE) as well as the Brier score, the mean squared difference between the predicted probability and the observed outcome."

== Prose standard, section D, "No synonym cycling"
The reader cannot tell whether two names refer to one model, layer or metric or to two different ones.

40. HCCNet-Pico is also called HCCNet-P (the name in every table). Each place, with its replacement:
- sections/3_methodology/c_variants.tex:1 "In addition to our base model, called HCCNet-Pico, we introduce four variants of HCCNet" -> "In addition to our base model, called HCCNet-P, we introduced four variants of HCCNet"
- sections/3_methodology/c_variants.tex:10 "scales only the channel and hidden dimensions of HCCNet-Pico to approximately 0.75x its size" -> "scales only the channel and hidden dimensions of HCCNet-P to approximately 0.75x its size"
- sections/4_experiments/b_implementation.tex:9 (replacement as in finding 2)
- sections/4_experiments/b_implementation.tex:11 "We conduct this ablation on the HCCNet-Pico variant" -> "We conducted this ablation on the HCCNet-P variant"
- sections/4_experiments/d_results.tex:5 "At HCCNet-Pico, the standalone T2-MRI model (AUPRC = 0.419 and AUROC = 0.873) is markedly stronger on AUROC than the standalone T1 IOP-MRI model (AUPRC = 0.406 and AUROC = 0.703), while on AUPRC the two are comparable (around 0.42)." -> "At HCCNet-P, the standalone T2-MRI model (AUPRC = 0.419 and AUROC = 0.873) was markedly stronger on AUROC than the standalone T1 IOP-MRI model (AUPRC = 0.406 and AUROC = 0.703), while on AUPRC the two were comparable (around 0.42)."
- sections/4_experiments/d_results.tex:25 "reports the fine-tuned HCCNet-Pico performance" -> "reports the fine-tuned HCCNet-P performance"
- sections/4_experiments/d_results.tex:29 "the contribution of the two pre-training stages for HCCNet-Pico." -> "the contribution of the two pre-training stages for HCCNet-P."
- tables/results_fusion.tex:3 "(HCCNet-Pico)}" -> "(HCCNet-P)}"
- tables/results_fusion.tex:21 "All configurations use the HCCNet-Pico variant" -> "All configurations use the HCCNet-P variant"
- tables/results_pretrain_ablation.tex:3 "(HCCNet-Pico)}" -> "(HCCNet-P)}"
- tables/results_pretrain_ablation.tex:27 "All configurations use the HCCNet-Pico variant." -> "All configurations use the HCCNet-P variant."

41. The "CNN backbone" is also called the "CNN feature extractor". Each place, with its replacement:
- sections/3_methodology/b_architecture.tex:5 "\textbf{CNN Feature Extractor.}" -> "\textbf{CNN Backbone.}"
- sections/3_methodology/b_architecture.tex:7 "The CNN feature extractor takes the MR images as inputs" -> "The CNN backbone takes the MR images as inputs"
- sections/3_methodology/b_architecture.tex:14 "we concatenate the image embeddings obtained from the CNN feature extractor and prepend" -> "we concatenated the image embeddings obtained from the CNN backbone and prepended"
- sections/3_methodology/d_pretraining.tex:3 "\textbf{CNN Feature Extractor.}" -> "\textbf{CNN Backbone.}"
- sections/3_methodology/d_pretraining.tex:10 "we keep the parameters of the CNN feature extractor fixed and initialize them using the previously pre-trained weights" -> "we kept the parameters of the CNN backbone fixed and initialized them using the previously pre-trained weights"
- sections/appendix/a_implementation/2_augmentations.tex:1 "During pre-training of the CNN feature extractor, we randomly crop" -> "During pre-training of the CNN backbone, we randomly cropped"
- tables/results_pretrain_ablation.tex:27 "pre-trains the CNN feature extractor using DINO" -> "pre-trains the CNN backbone using DINO"

42. The patchify layer (b_architecture.tex:5) is also called the "stem" and the "first convolutional layer". Each place, with its replacement:
- sections/3_methodology/d_pretraining.tex:15 "Since the backbone is pre-trained on single-channel views, we reconcile the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters are replicated across the input series to initialize the first convolutional layer, which is then fine-tuned end to end." -> "Since the backbone was pre-trained on single-channel views, we reconciled the differing input dimensionality by expanding the pre-trained single-channel patchify layer to the required number of input channels: the learned patchify-layer filters were replicated across the input series to initialize the patchify layer, which was then fine-tuned end to end."
- sections/3_methodology/d_pretraining.tex:15 "This transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch." -> "Replicating the filters transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the patchify layer from scratch." (This also ends the "Clear antecedents" break on "This".)

43. AUROC is also called AUC.
- sections/2_related_work/a_longitudinal_analysis.tex:5 "area under the receiver operating characteristic curve (AUC) of 0.775" -> "area under the receiver operating characteristic curve (AUROC) of 0.775"

== references/rules.md, "Clear antecedents"
The reader has to guess what "this" or "that" refers to.

44. sections/abstract/abstract.tex:1 "To address this, we propose HCCNet, ..." (replacement as in finding 34)
45. sections/3_methodology/d_pretraining.tex:8 "This teaches the model to identify the same patient under varying acquisition conditions." -> "Sampling series in this way teaches the model to identify the same patient under varying acquisition conditions."
46. sections/3_methodology/d_pretraining.tex:15 "This transfers ..." (replacement as in finding 42)
47. sections/4_experiments/d_results.tex:11 "This corresponds with ..." (replacement as in finding 1)
48. sections/5_discussion/discussion.tex:12 "We attribute this to ..." (replacement as in finding 15)
49. sections/appendix/b_additional_results/2_reliability.tex:3 "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC." -> "These lowest scores held even though baseline models trained using diffusion weighted MRIs showed the best average discriminatory power between patients of low and high risk of HCC."
50. sections/appendix/a_implementation/3_hyperparams.tex:3 "This is due to convergence issues that we noted during initial model runs." -> "The deviation was due to convergence issues that we noted during initial model runs."

== references/rules.md, "Reader's question per section"
The Introduction does not open with a consequence or a gap, and the Results section does not open with a finding.

51. sections/1_introduction/introduction.tex:1
"Predicting disease outcomes based on longitudinal MRI scans is important for improving patient management. This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}."
Replacement: "In conditions like hepatocellular carcinoma (HCC), early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}. Predicting disease outcomes based on longitudinal MRI scans is therefore important for improving patient management."
(This also ends the "Clear antecedents" break on "This".)

52. sections/4_experiments/d_results.tex:5
"Table \ref{tab:finetuned_results} presents fine-tuned model results for the prediction of HCC development at the next observation stratified by imaging modality and model architecture."
Replacement: "Of the three modality groups, diffusion weighted MR images gave the highest predictive capability for HCC development at the next observation (Table \ref{tab:finetuned_results}, stratified by imaging modality and model architecture)."

== Prose standard, section A (vague qualifiers) and references/rules.md, "Vague language"
The reader cannot tell how widespread the cited practices are, or how many studies stand behind each claim.

53. sections/1_introduction/introduction.tex:1 "remains a significant challenge \citep{jin2021predicting}" -> "remains an open problem \citep{jin2021predicting}"
54. sections/1_introduction/introduction.tex:5 "Traditional approaches often simplify this task" -> "Traditional approaches usually simplify this task [in N of the M studies the author reviewed]"
55. sections/1_introduction/introduction.tex:5 "However, this method has limitations, particularly in the medical domain where datasets are often small, and the differences between natural and medical images, such as texture, contrast, and noise, considerably impact the transferability of pre-trained models \citep{zeng2021positional}." -> "However, this method has limitations, particularly in the medical domain, where datasets are usually small ([the usual dataset size, from the author]). The differences between natural and medical images, such as texture, contrast, and noise, also considerably impact the transferability of pre-trained models \citep{zeng2021positional}." (This also ends the "Formality" break of two ideas in one sentence.)
56. sections/1_introduction/introduction.tex:7 "However, many existing approaches have not fully explored" -> "However, existing approaches such as [the approaches named with their citations, from the author] have not fully explored"
57. sections/2_related_work/a_longitudinal_analysis.tex:5 "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and typically employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings." -> "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor. They usually employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings ([the count of studies using each, from the author])." (This also ends the "Formality" break.)
58. sections/2_related_work/a_longitudinal_analysis.tex:7 "Likewise, many of them disregard" -> "Likewise, [the studies named with their citations, from the author] disregard"
59. sections/2_related_work/b_pretraining.tex:1 "As a result, many deep learning studies analyzing medical images over time continue to extract" -> "As a result, deep learning studies analyzing medical images over time, such as [the studies named with their citations, from the author], continue to extract"
60. sections/3_methodology/a_problem_formulation.tex:1 "Since the frequency of liver screenings is typically determined by the patient's unique condition" -> "Since the frequency of liver screenings is usually determined by the patient's unique condition [the surveillance guideline that sets it, from the author]"
61. figures/cumulative_gain.tex:10 "Generally, lower MAE values indicate greater robustness to fold-to-fold variation" -> "Lower MAE values indicate greater robustness to fold-to-fold variation" (MAE is defined as this deviation, so the claim holds without the qualifier.)
62. sections/5_discussion/discussion.tex:6 "Despite being long established as the gold standard in many branches of oncology, deep learning applications to the study of longitudinal medical images remain notoriously understudied." -> "Although longitudinal imaging has long been established as the gold standard in [the branches of oncology, named, from the author], deep learning applications to the study of longitudinal medical images remain understudied \citep{[citation, from the author]}." (This also ends the "Formality" break on the colloquial "notoriously" and the "Evidence for claims" break.)
Findings 19, 37 and 38 above also end vague-qualifier breaks.

== references/rules.md, "Tense per section"
Methods and results move between present and past, so the reader cannot always tell what was done in this study from what the model is in general. Sentences that only define notation or point to a table or figure are not listed. Sentences whose past-tense replacement is given under another finding are named by that finding's number.

Methodology:
- sections/3_methodology/a_problem_formulation.tex:1 "This study aims to define" -> "This study aimed to define"; "patient records are subset during fine-tuning" -> "patient records were subset during fine-tuning"; "\subseteq D^{(p,t)}$ is set to:" -> "\subseteq D^{(p,t)}$ was set to:"
- sections/3_methodology/b_architecture.tex:3 "We use the CNN backbone" -> "We used the CNN backbone"
- b_architecture.tex:5 "we adapt the ConvNeXt architecture" -> "we adapted the ConvNeXt architecture"; "we replace the 2-dimensional depthwise convolutional layers in ConvNeXt with their 3-dimensional counterpart and reduce" -> "we replaced the 2-dimensional depthwise convolutional layers in ConvNeXt with their 3-dimensional counterpart and reduced"; the reimplement sentence as in finding 37
- b_architecture.tex:14 as in finding 41
- b_architecture.tex:21 "we embed the input's positional information" -> "we embedded the input's positional information"; "we replace the conventional sequence position" -> "we replaced the conventional sequence position"; "The reference point is determined solely" -> "The reference point was determined solely"; "and never uses the outcome itself" -> "and never used the outcome itself"; "we compute the vector of intervals" -> "we computed the vector of intervals"
- b_architecture.tex:26 "prepend" -> "prepended"; "obtain positional encodings" -> "obtained positional encodings"
- b_architecture.tex:34 "we add the positional encodings" -> "we added the positional encodings"
- b_architecture.tex:39 "We feed the input sequence through the encoder $G$ and select" -> "We fed the input sequence through the encoder $G$ and selected"
- b_architecture.tex:44 "we feed it through a pooling layer" -> "we fed it through a pooling layer"
- sections/3_methodology/c_variants.tex:1 as in finding 40; c_variants.tex:10 "we additionally introduce HCCNet-C (compact)" -> "we additionally introduced HCCNet-C (compact)"
- sections/3_methodology/d_pretraining.tex:1 "we therefore design two" -> "we therefore designed two"
- d_pretraining.tex:3 "this study extends the self-supervised DINO pre-training framework" -> "this study extended the self-supervised DINO pre-training framework"; "we define a student" -> "we defined a student"; "the teacher is built as" -> "the teacher was built as"; "we learn to match" -> "we learned to match"
- d_pretraining.tex:8 "we exploit the abundance" -> "we exploited the abundance"; "we treat different series" -> "we treated different series"; the "Note that" and "For a view" sentences as in the paragraph-split finding 70
- d_pretraining.tex:10 "this study employs a simple binary sequence-order-prediction (SOP) task" -> "this study employed a binary sequence-order-prediction (SOP) task"; "we randomly shuffle 50\% of the input sequences" -> "we randomly shuffled 50\% of the input sequences"; "and task the model" -> "and tasked the model"; footnote "we actually randomly shuffle 66\% of sequences" -> "we actually randomly shuffled 66\% of sequences"; the CNN-parameters sentence as in finding 41; "We apply the sigmoid function" -> "We applied the sigmoid function"; "and learn to identify shuffled sequences" -> "and learned to identify shuffled sequences"
- d_pretraining.tex:15 "we do not randomly crop multiple views from the same image but instead only crop a single view" -> "we did not randomly crop multiple views from the same image but instead only cropped a single view"; "we concatenate the different series" -> "we concatenated the different series"; the remaining sentences as in findings 42 and 71
- sections/3_methodology/e_finetuning.tex:1 "we initialize the parameters of HCCNet" -> "we initialized the parameters of HCCNet"; second sentence as in finding 29
- sections/4_experiments/a_data.tex:1 first sentence as in finding 30; "This complete co-availability allows us" -> "This complete co-availability allowed us"; the "All examinations" sentence as in finding 72
- a_data.tex:3 "we include all available data in superset $D_p$ during pre-training and subset the data" -> "we included all available data in superset $D_p$ during pre-training and subset the data"; "We partition the patient cohort" -> "We partitioned the patient cohort"; "The folds are stratified by HCC outcome so that the 37 HCC-positive patients are distributed" -> "The folds were stratified by HCC outcome so that the 37 HCC-positive patients were distributed"; "Because pre-training is re-run within every fold, the held-out patients are never observed at any training stage, which precludes" -> "Because pre-training was re-run within every fold, the held-out patients were never observed at any training stage, which precluded"; "we only fine-tune HCCNet on longitudinal MRIs that are also included" -> "we only fine-tuned HCCNet on longitudinal MRIs that were also included"; the remaining sentences as in finding 73
- sections/4_experiments/b_implementation.tex:1 "we pre-train both the CNN backbone" -> "we pre-trained both the CNN backbone"; "We train the CNN over 32000 training steps" -> "We trained the CNN over 32000 training steps"; "we decay the learning rate" -> "we decayed the learning rate"; "We employ the same cosine decay without warm-up for the weight decay $\lambda$ but only apply it" -> "We employed the same cosine decay without warm-up for the weight decay $\lambda$ but only applied it"; "we also limit the temperature" -> "we also limited the temperature"; "and increase the initial exponential moving average momentum" -> "and increased the initial exponential moving average momentum"; the warm-up sentence as in finding 74
- b_implementation.tex:3 "While MRI scans are assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considers" -> "While MRI scans were assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considered"; "we train the Transformer encoder" -> "we trained the Transformer encoder"; "We set the maximal sequence length to $s = 8$, apply dropout with probability $p = 0.2$, and employ" -> "We set the maximal sequence length to $s = 8$, applied dropout with probability $p = 0.2$, and employed"
- b_implementation.tex:5 "we update HCCNet" -> "we updated HCCNet"; "We fine-tune the model over 400 training steps" -> "We fine-tuned the model over 400 training steps"; "but decrease the weight decay" -> "but decreased the weight decay"; "we select the batch size" -> "we selected the batch size"; "and apply no further hyperparameter tuning" -> "and applied no further hyperparameter tuning"; "we then train HCCNet" -> "we then trained HCCNet"; "and evaluate it on the corresponding held-out fold" -> "and evaluated it on the corresponding held-out fold"
- b_implementation.tex:7 "we establish a baseline" -> "we established a baseline"; "we equally train the baseline" -> "we equally trained the baseline"; "We employ the same optimizer" -> "We employed the same optimizer"; "but slightly increase the learning rate warm-up" -> "but slightly increased the learning rate warm-up"
- b_implementation.tex:9 "we additionally evaluate a set of exploratory multi-modal configurations" -> "we additionally evaluated a set of exploratory multi-modal configurations"; "we naively concatenate" -> "we naively concatenated"; "Concretely, we evaluate the full fusion" -> "Concretely, we evaluated the full fusion"; "augmentation views are sampled within a single contrast family" -> "augmentation views were sampled within a single contrast family"; the last sentence as in finding 2
- b_implementation.tex:11 "we further disentangle" -> "we further disentangled"; "we evaluate two intermediate configurations" -> "we evaluated two intermediate configurations"; the last sentence as in finding 40
- sections/4_experiments/c_evaluation.tex:1 "we evaluate HCCNet's baseline" -> "we evaluated HCCNet's baseline"; "we train ten independently seeded models (fifty models in total) and average" -> "we trained ten independently seeded models (fifty models in total) and averaged"; "we also explore the robustness of the model" -> "we also explored the robustness of the model"; the remaining sentences as in findings 39 and 75
- c_evaluation.tex:8 as in finding 81
- sections/appendix/a_implementation/1_conv_layer.tex:3 "we inflate the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduce" -> "we inflated the 2D depthwise and pointwise convolutional layers to 3 dimensions and reduced"
- sections/appendix/a_implementation/2_augmentations.tex:1 first sentence as in finding 41; "we randomly crop a multi-channel sub-volume" -> "we randomly cropped a multi-channel sub-volume"; "further augmentations remain consistent" -> "further augmentations remained consistent"; "we randomly shift and scale the intensity" -> "we randomly shifted and scaled the intensity"; "apply random 90 degree rotations" -> "applied random 90 degree rotations"; "and randomly flip the cropped view" -> "and randomly flipped the cropped view"; "we use the same data augmentation strategy" -> "we used the same data augmentation strategy"
- sections/appendix/a_implementation/3_hyperparams.tex:3 "we slightly deviate from" -> "we slightly deviated from"; the next sentence as in finding 50

Results:
- sections/4_experiments/d_results.tex:5 "HCCNet trained using diffusion weighted MR images shows excellent predictive capability of tumor development with an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model architectures." -> "HCCNet trained using diffusion weighted MR images reached an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model architectures." (This also ends the prose standard's section 0 break on "excellent".)
- d_results.tex:5 the contrast-enhanced T1 sentence as in finding 76; "At HCCNet-Pico" as in finding 40; "The combined T1 IOP \& T2-MRI modality reaches AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeds it on AUROC" -> "The combined T1 IOP \& T2-MRI modality reached AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeded it on AUROC"; "the combined modality nonetheless remains the weakest" -> "the combined modality nonetheless remained the weakest"
- d_results.tex:9 "we explore the impact of varying model complexity" -> "we explored the impact of varying model complexity"; "the per-fold ensemble closely follows the diagonal line" -> "the per-fold ensemble closely followed the diagonal line"; "This robustness is tightest on AUROC" -> "This robustness was tightest on AUROC"; "No model variant falls consistently below the diagonal line." -> "No model variant fell consistently below the diagonal line."
- d_results.tex:11 "the models are thus robust" -> "the models were thus robust"; "the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating" -> "the plots revealed no consistent differences across model architecture, as no model variant was persistently deviating"; the third sentence as in finding 1
- d_results.tex:15 first sentence as in finding 86; "the magnitude of the improvement from our proposed approach varies" -> "the magnitude of the improvement from our proposed approach varied"; the "That is" sentence as in finding 77
- d_results.tex:19 "we compare the reliability" -> "we compared the reliability"; "the plots largely align" as in finding 78; "the expected calibration error does not display" -> "the expected calibration error did not display"; "consistently show the lowest expected calibration error, while models trained using dynamic contrast enhanced T1-weighted MRIs display the highest" -> "consistently showed the lowest expected calibration error, while models trained using dynamic contrast enhanced T1-weighted MRIs displayed the highest"
- d_results.tex:21 first sentence as in finding 84; "This reduction is largest for diffusion weighted MR images at 56.0\%, reaches 37.0\%" -> "This reduction was largest for diffusion weighted MR images at 56.0\%, reached 37.0\%"; "and is smallest at 12.1\%" -> "and was smallest at 12.1\%"
- d_results.tex:25 "we evaluate whether naively fusing" -> "we evaluated whether naively fusing"; "None of the fused configurations exceeds" -> "None of the fused configurations exceeded"; the "Adding" sentence as in finding 79; "As all differences fall within one standard deviation" -> "As all differences fell within one standard deviation"
- d_results.tex:29 the CNN-backbone-only sentence as in finding 80; "The CNN-backbone dominance also holds" -> "The CNN-backbone dominance also held"; "clearly exceeds the Transformer encoder alone" -> "clearly exceeded the Transformer encoder alone"; "the two stages contribute comparably" -> "the two stages contributed comparably"
- sections/appendix/b_additional_results/1_baseline.tex:3 "consistently display the highest detection rate" -> "consistently displayed the highest detection rate"; the last sentence as in finding 38
- sections/appendix/b_additional_results/2_reliability.tex:3 "variations in reliability scores are predominantly driven" -> "variations in reliability scores were predominantly driven"; "consistently display the lowest average reliability scores" -> "consistently displayed the lowest average reliability scores"; the "That is despite" sentence as in finding 49; the "Contrarily" sentence as in finding 16; "display the lowest average reliability scores, while models fine-tuned using dynamic contrast enhanced T1-weighted MR images exhibit the highest" -> "displayed the lowest average reliability scores, while models fine-tuned using dynamic contrast enhanced T1-weighted MR images exhibited the highest"

== Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences"
Long paragraphs that cover two ideas hide which point each paragraph makes. Each finding below quotes the last sentence before the break and the first sentence after it. The replacement is those two sentences with an empty line between them, already carrying the other findings on them.

63. sections/abstract/abstract.tex:3 (5 sentences: method, then results)
"The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time. We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement:
"The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time.

Results on a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance indicate the effectiveness of HCCNet."

64. sections/1_introduction/introduction.tex:13 (6 sentences, three ideas; two breaks)
First break: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes. The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."
Replacement: the same two sentences with an empty line between them.
Second break: "Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases. All code for the proposed method is available at: \href{https://github.com/jmnolte/HCCNet}{github.com/jmnolte/HCCNet}."
Replacement:
"Thus, HCCNet could serve as a flexible framework for various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases.

All code for the proposed method is available at: \href{https://github.com/jmnolte/HCCNet}{github.com/jmnolte/HCCNet}."

65. sections/2_related_work/a_longitudinal_analysis.tex:3 (7 sentences: stacked CNNs, then Siamese networks)
"While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}. Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
Replacement:
"While the approach is [the concrete implementation advantage, from the author], \citet{dammuDeepLearningPrediction2023} showed that it does not fully explore the relationship between time points.

Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
(This also ends the section A filler "simple" and the section E passive "it has been shown", whose actor is the cited study.)

66. sections/2_related_work/a_longitudinal_analysis.tex:5 (6 sentences: what hybrid models are, then what they are used for)
"Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor and typically employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings. Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."
Replacement: the two sentences of finding 57, an empty line, then "Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment."

67. sections/2_related_work/b_pretraining.tex:3 (6 sentences: the contrastive principle, then two example studies)
"As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}. \cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."
Replacement: the same two sentences with an empty line between them.

68. sections/5_discussion/discussion.tex:12 (5 sentences: pre-training benefit, then fusion)
Last before: the ablation sentence of finding 3. First after: "Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."
Replacement: the two sentences of finding 3, an empty line, then the "Finally" sentence unchanged.

69. sections/5_discussion/discussion.tex:18 (additional data, then single-cohort generalizability)
"Incorporating these data sources could further enhance the model's predictive power and provide a fuller understanding of disease progression. In addition, the study's focus on a single cohort from a specific clinical setting may limit the generalizability of the findings, highlighting the need for external validation in diverse patient populations."
Replacement: the same two sentences with an empty line between them.

70. sections/3_methodology/d_pretraining.tex:8 (8 sentences; two breaks)
First break: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views. Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Replacement:
"Note that in our implementation, we used a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views.

Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Second break: "For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sample one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sample among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sample within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series). This teaches the model to identify the same patient under varying acquisition conditions."
Replacement:
"For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sampled one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sampled among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sampled within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series).

Sampling series in this way teaches the model to identify the same patient under varying acquisition conditions."

71. sections/3_methodology/d_pretraining.tex:15 (6 sentences: the transformer-stage input, then the expansion of the patchify layer)
"Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ is thus a four rather than a one channel volume. Since the backbone is pre-trained on single-channel views, we reconcile the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters are replicated across the input series to initialize the first convolutional layer, which is then fine-tuned end to end."
Replacement: "Provided a sequence of DW-MRI's with diffusion coefficients $b \in \{0, 150, 400, 800\}$, the input $i^{(p,t)}$ to the CNN backbone $G$ was thus a four rather than a one channel volume.", an empty line, then the first sentence of finding 42.

72. sections/4_experiments/a_data.tex:1 (6 sentences: the cohort, then modality availability)
"Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing. All examinations included in the study comprise the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups are available for every patient."
Replacement:
"Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing.

All examinations included in the study comprised the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups were available for every patient."

73. sections/4_experiments/a_data.tex:3 (10 sentences; two breaks)
First break: "During fine-tuning we additionally exclude all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 develop HCC (i.e., 703 and 101 total MRI examinations respectively). To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Replacement:
"During fine-tuning we additionally excluded all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 developed HCC (i.e., 703 and 101 total MRI examinations respectively).

To obtain reliable performance estimates despite the limited number of positive cases, we evaluated HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
(This also ends the section A break on the flagged term "robust", which is not used in its statistical sense here.)
Second break: "Each fold serves as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds form the development set $D^{\text{dev}}_p$ that is used for both pre-training and fine-tuning. The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) is repeated independently for each fold using only the data of its development set."
Replacement:
"Each fold served as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds formed the development set $D^{\text{dev}}_p$ that was used for both pre-training and fine-tuning.

The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) was repeated independently for each fold using only the data of its development set."

74. sections/4_experiments/b_implementation.tex:1 (6 sentences)
"During the first 5\% of training steps (i.e., 1600 warm-up steps), we linearly increase the learning rate $\eta$ to its base value which is determined using the following square-root scaling rule \citep{granziolLearningRatesFunction}: $\eta = \alpha \frac{\sqrt{b}}{\sqrt{128}}$, where $b$ is the effective batch size and $\alpha$ is a constant scaling factor that is chosen according to $b$. After reaching its maximum value, we decay the learning rate using a cosine schedule."
Replacement:
"During the first 5\% of training steps (i.e., 1600 warm-up steps), we linearly increased the learning rate $\eta$ to its base value which was determined using the following square-root scaling rule \citep{granziolLearningRatesFunction}: $\eta = \alpha \frac{\sqrt{b}}{\sqrt{128}}$, where $b$ is the effective batch size and $\alpha$ is a constant scaling factor that was chosen according to $b$.

After reaching its maximum value, we decayed the learning rate using a cosine schedule."

75. sections/4_experiments/c_evaluation.tex:1 (6 sentences: the ensemble, then the metrics)
"Every reported metric is computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds. For evaluation, we employ the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."
Replacement:
"Every reported metric was computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds.

For evaluation, we employed the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."

76. sections/4_experiments/d_results.tex:5 (7 sentences: the three groups, then the split of the combined group)
"Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appear to display less expressive characteristics for the prediction of HCC development, albeit models trained using contrast enhanced T1-weighted images still maintain a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759). The two contrasts that make up this combined group are also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."
Replacement:
"Contrast enhanced T1 weighted and the combination of T1 weighted in- and out-of-phase and T2 weighted images, on the other hand, appeared to display less expressive characteristics for the prediction of HCC development. Models trained using contrast enhanced T1-weighted images still maintained a stronger average predictive capability than the combined T1 IOP and T2-weighted MRIs (i.e., AUPRC = 0.520 and AUROC = 0.805 versus AUPRC = 0.429 and AUROC = 0.759).

The two contrasts that make up this combined group were also evaluated in their own right as standalone single-modality models, reported as the T1 IOP-MRI and T2-MRI modalities in Table \ref{tab:finetuned_results}."
(This also ends the tense break and the "Formality" break of two ideas in one sentence.)

77. sections/4_experiments/d_results.tex:15 (finding 86 and the tense break apply; the long last sentence is split under "Formality")
"That is, although baseline model results vary only gradually across image modalities, diffusion weighted MR images display the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning, while dynamic contrast enhanced T1-weighted images show smaller but still substantial gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displays an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning."
Replacement: "That is, although baseline model results varied only gradually across image modalities, diffusion weighted MR images displayed the largest average improvement of 106.6\% in AUPRC and 25.5\% in AUROC after fine-tuning. Dynamic contrast enhanced T1-weighted images showed smaller but still substantial gains (i.e., 48.9\% in AUPRC and 14.9\% in AUROC), and the combination of T1-weighted in- and out-of-phase and T2-weighted MRIs displayed an average improvement of 52.3\% in AUPRC and 22.4\% in AUROC after fine-tuning."

78. sections/4_experiments/d_results.tex:19 (7 sentences: the setup, then the findings)
"Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}. For the fine-tuned models, the plots largely align with the results presented in Table \ref{tab:results_base_pre}."
Replacement:
"Extended reliability metrics are presented in Table \ref{tab:reliability_results} in \ref{sec:appendix_reliability}.

For the fine-tuned models, the plots largely aligned with the results presented in Table \ref{tab:results_base_pre}."

82. sections/6_conclusion/conclusion.tex:1 (8 sentences; two breaks)
First break: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work. The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes."
Replacement: the first sentence unchanged, an empty line, then the replacement of finding 17.
Second break: "Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework. Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy, while further external validation is needed to assess the generalizability of the study's findings."
Replacement:
"Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework.

Additionally, exploring the integration of multi-modal data, including EHR, genomic information, and other imaging modalities, could provide a fuller view of patient health and improve predictive accuracy. Further external validation is needed to assess the generalizability of the study's findings."
(This also ends the "Formality" break of two ideas in one sentence.)

83. sections/appendix/b_additional_results/2_reliability.tex:3 (6 sentences: the baseline, then the fine-tuned models)
Last before: the "That is despite" sentence. First after: the "Contrarily" sentence.
Replacement: the replacement of finding 49, an empty line, then the replacement of finding 16.

== references/rules.md, "Formality"
The reader has to separate two claims packed into one sentence, or meets colloquial intensifiers in a clinical paper.

79. sections/4_experiments/d_results.tex:25
"Adding T1 DCE-MRI to DW-MRI lowers performance (AUPRC = 0.535 and AUROC = 0.873), fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI leaves performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matches DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541)."
Replacement: "Adding T1 DCE-MRI to DW-MRI lowered performance (AUPRC = 0.535 and AUROC = 0.873). Fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI left performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matched DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541)."

80. sections/4_experiments/d_results.tex:29
"For diffusion-weighted imaging, pre-training only the CNN backbone recovers essentially all of the full pre-training gain (AUPRC = 0.672 versus 0.588 for both stages and 0.308 for the randomly initialized baseline), with the difference between the two configurations falling within one standard deviation across folds, whereas pre-training only the Transformer encoder yields AUPRC = 0.310, barely above the baseline."
Replacement: "For diffusion-weighted imaging, pre-training only the CNN backbone recovered essentially all of the full pre-training gain (AUPRC = 0.672 versus 0.588 for both stages and 0.308 for the randomly initialized baseline), with the difference between the two configurations falling within one standard deviation across folds. Pre-training only the Transformer encoder yielded AUPRC = 0.310, barely above the baseline."

81. sections/4_experiments/c_evaluation.tex:8
"Since all metrics are obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data, so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate."
Replacement: "Since all metrics were obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data. The reported standard deviations should therefore be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate."

85. sections/2_related_work/b_pretraining.tex:1
"However, the usefulness of transfer learning from natural images remains fiercely disputed \citep{zhangAdvancing3DMedical2022, huangSelfsupervisedLearningMedical2023, el-noubyAreLargescaleDatasets2021} and our study also employs a 3D rather than a 2D CNN."
Replacement: "However, the usefulness of transfer learning from natural images remains disputed \citep{zhangAdvancing3DMedical2022, huangSelfsupervisedLearningMedical2023, el-noubyAreLargescaleDatasets2021}. In addition, our study employs a 3D rather than a 2D CNN."
Findings 15, 19, 26, 38, 55, 57, 62, 76, 77 and 82 also end Formality breaks.

== Prose standard, section 0 (grandiose self-assessment, performative asides, dashes as asides)
Evaluative words that carry no measured claim make the results read as promotion.

84. sections/4_experiments/d_results.tex:21
"More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicates that the proposed self-supervised pre-training reduces the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters."
Replacement: "The comparison between baseline and fine-tuned models' reliability diagrams indicated that the proposed self-supervised pre-training reduced the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters."
Findings 9 ("invaluable") and the d_results.tex:5 entry in the tense list ("excellent") also end section 0 breaks.

Dashes used as asides inside LaTeX comments, which are internal comments under the prose standard:
- main.tex:47 "Longitudinal 3D MRI Images: -- A Case Study on Hepatocellular Carcinoma Prediction}" -> "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction}"
- main.tex:49 "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma Prediction" -> "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction"
- main.tex:51 "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma Prediction" -> "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma Prediction"
- main.tex:53 "Longitudinal 3D MRI Images -- A Case Study on Hepatocellular Carcinoma" -> "Longitudinal 3D MRI Images, with a Case Study on Hepatocellular Carcinoma"
- main.tex:57 "Longitudinal Medical Images -- Application to Hepatocellular Carcinoma" -> "Longitudinal Medical Images, with Application to Hepatocellular Carcinoma"
- sections/5_discussion/discussion.tex:1 "HCCNet - a spatio-temporal neural network that utilizes a 3D ConvNeXt backbone combined with a transformer encoder - to predict" -> "HCCNet, a spatio-temporal neural network that utilizes a 3D ConvNeXt backbone combined with a transformer encoder, to predict"

== references/rules.md, "Transitions"
The reader is told the last subsection has begun when two more follow.

86. sections/4_experiments/d_results.tex:15
"Finally, we evaluate the impact of our proposed pre-training approach on model performance."
Replacement: "We evaluated the impact of our proposed pre-training approach on model performance."

== Prose standard, section C (meta-commentary) and section E (restating closes)
These sentences make the reader read the same content twice.

87. sections/4_experiments/d_results.tex:3
"We report HCCNet's fine-tuned performance (i) across imaging modalities, (ii) model variations, and (iii) against a randomly initialized baseline."
Replacement: delete

88. sections/4_experiments/d_results.tex:11
"At least on the data evaluated in this study, variations in model complexity do thus not considerably influence the quality of the models' predictions nor their robustness."
Replacement: delete

== Prose standard, section E, "Spec-sheet voice"
The reader gets a capability claim where the text could say what each part of the model does.

89. sections/1_introduction/introduction.tex:9
"HCCNet integrates a 3D adaptation of the ConvNeXt architecture with a Transformer encoder, allowing it to capture both the spatial features of 3D MRIs and the temporal dependencies between different scans \citep{gong2024individualised}."
Replacement: "HCCNet integrates a 3D adaptation of the ConvNeXt architecture, which captures the spatial features of 3D MRIs, with a Transformer encoder, which captures the temporal dependencies between different scans \citep{gong2024individualised}."

90. sections/1_introduction/introduction.tex:11
"This self-supervised learning approach allows the model to learn from the inherent variability in MRI data, even when labeled examples are scarce \citep{kumar2024improving}."
Replacement: "With this self-supervised learning approach, the model learns from the inherent variability in MRI data, even when labeled examples are scarce \citep{kumar2024improving}."
Findings 9 and 12 also end spec-sheet breaks.

== Prose standard, section A, banned filler ("simple", "simply")
These words make a claim about effort that the text never states.

91. sections/2_related_work/b_pretraining.tex:3 "Instead of simply comparing view pairs from different patients" -> "Instead of only comparing view pairs from different patients"
92. sections/2_related_work/b_pretraining.tex:5 "adopts a simple sequence-order-prediction task" -> "adopts a sequence-order-prediction task"
Findings 65 and the d_pretraining.tex:10 entry in the tense list also remove "simple".

== Prose standard, section F, "no hard wrapping"
The source breaks single paragraphs across lines, so diffs and searches do not follow the text.

93. sections/6_conclusion/ack.tex:2-3
"... MRI-radiomics" / "Primair leverkanker ..."
Replacement: "... MRI-radiomics Primair leverkanker ..." (the line break replaced by a space)

94. sections/6_conclusion/ack.tex:6-8
"... (OpenAI ChatGPT) to help" / "refine the English language ..." and "... reviewed and edited the" / "content as needed ..."
Replacement: "... (OpenAI ChatGPT) to help refine the English language ..." and "... reviewed and edited the content as needed ..." (each line break replaced by a space)

Note on numbering: findings are grouped by rule, so some numbers appear out of order where a finding sits in the group of the rule it mainly breaks.

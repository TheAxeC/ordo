Review of the draft "HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from Longitudinal 3D MRI" (main file /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/manuscript/main.tex and the 32 files it inputs).

I read the prose standard, the rules page, the registers page and all 33 files in full. The draft is a clinical prediction study submitted to Intelligent Medicine, so it is held to the Medicine and Health register.

I ran `LC_ALL=C grep -n '[^ -~]'` on each of the 33 files. The only hit is main.tex:75, "St<latin small letter e with acute>phanie", an accented letter in a name, which the ASCII rule allows. No finding comes from that check.

Coverage: every group below covers the whole draft except the "Tense per section" and "Voice" group, which is partial. That group covers sections/3_methodology/d_pretraining.tex, sections/4_experiments/b_implementation.tex and the Results file sections/4_experiments/d_results.tex. I did not list the procedure sentences in these files: sections/3_methodology/b_architecture.tex, sections/3_methodology/e_finetuning.tex, sections/4_experiments/a_data.tex, sections/4_experiments/c_evaluation.tex, sections/appendix/a_implementation/2_augmentations.tex and sections/appendix/a_implementation/3_hyperparams.tex. Most of them break the same two rules in the same way: they report procedure in the present tense with "we". Examples are "we replace the 2-dimensional depthwise convolutional layers" (b_architecture.tex:5), "we crop two global views" (2_augmentations.tex:1) and "we train ten independently seeded models" (c_evaluation.tex:1). Those files still need their own entries.

================================================================
GROUP 1. references/rules.md, "Hedging"
A reader takes the claims of the abstract and the Discussion as proven for clinical use and for diseases other than HCC. The draft tests one cohort, one disease and no external data. Example: sections/abstract/abstract.tex:5.

1. sections/abstract/abstract.tex:3
Passage: "Our results show that HCCNet substantially improves predictive accuracy and reliability over baseline models, providing a reliable tool for personalized HCC surveillance."
Replacement: "Our results show that HCCNet improves predictive accuracy and reliability over baseline models. Its AUPRC rises by 5.6% to 147.1% and its AUROC by 5.0% to 45.5%. [Limit for the author: for HCCNet-F on T1 IOP & T2-MRI, the expected calibration error rises from 0.182 to 0.204.] HCCNet may provide a reliable tool for personalized HCC surveillance once it is validated on an external cohort."
Also breaks: the prose standard, section A ("substantially" is a vague qualifier); references/rules.md, "Limitations and alternative interpretations"; references/rules.md, "Formality" (two ideas in one sentence: the improvement over baselines, and use as a surveillance tool).

2. sections/abstract/abstract.tex:5
Passage: "The methodological approach presented in this paper is versatile and can be adapted to various longitudinal MRI screening applications."
Replacement: "The methodological approach presented in this paper may be adapted to other longitudinal MRI screening applications."

3. sections/abstract/abstract.tex:5
Passage: "Its ability to handle varying patient record lengths and irregular screening intervals establishes it as an invaluable framework for monitoring chronic diseases, where timely and accurate disease prognosis is critical for effective treatment planning."
Replacement: "Its handling of varying patient record lengths and irregular screening intervals may make it a framework for monitoring chronic diseases. In such diseases, timely and accurate disease prognosis is critical for effective treatment planning."
Also breaks: the prose standard, section E (the sentence has 32 words).

4. sections/1_introduction/introduction.tex:13
Passage: "Thus, HCCNet provides a flexible framework that can be adapted to various longitudinal medical imaging tasks, potentially improving predictive accuracy and patient outcomes across a range of diseases."
Replacement: "HCCNet may be adapted to other longitudinal medical imaging tasks. In those tasks, it may improve predictive accuracy and patient outcomes."
Also breaks: references/rules.md, "Transitions" ("Thus": the sentence before it already makes the same claim, so it does not follow from it as an effect); the prose standard, section E (spec-sheet voice "provides").

5. sections/1_introduction/introduction.tex:13
Passage: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes."
Replacement: "This application addresses a need in personalized HCC surveillance of cirrhotic patients. In these patients, timely and accurate predictions can influence clinical outcomes [the size of the effect on clinical outcomes, with its citation]."
Also breaks: the prose standard, section A ("considerably"); the prose standard, section D (the binary contrast "not only ... but also"); the prose standard, section E (the sentence has 32 words).

6. sections/5_discussion/discussion.tex:10
Passage: "Inspection of the models' reliability diagrams further demonstrated that the proposed self-supervised pre-training approach aligned the models closer to the target distribution, reducing the extent to which calibration errors are propagated and amplified during fine-tuning."
Replacement: "The models' reliability diagrams suggest that the proposed self-supervised pre-training approach aligned the models closer to the target distribution. Pre-training may reduce the extent to which calibration errors are propagated and amplified during fine-tuning."
Also breaks: the prose standard, section E (the sentence has 35 words).

7. sections/5_discussion/discussion.tex:10
Passage: "Thus, even for imaging modalities where the pre-training approach only yielded moderate improvements, the predicted risks were more reliable, demonstrating the value of our proposed pre-training framework for applications in the medical domain."
Replacement: "For T1 DCE-MRI, where pre-training yielded the smallest average improvements (48.9% in AUPRC and 14.9% in AUROC), the expected calibration error still fell by 37.0%. This reduction suggests that our proposed pre-training framework may be of value for applications in the medical domain."
Also breaks: the prose standard, section A ("moderate").

8. sections/5_discussion/discussion.tex:16
Passage: "Additionally, while HCCNet demonstrates strong predictive capabilities for HCC development, its application to other diseases will require careful consideration of the specific characteristics and progression patterns of those diseases."
Replacement: "HCCNet reached an average AUROC of 0.901 with DW-MRI for HCC development in a single cohort. Its application to other diseases will require attention to the characteristics and progression patterns of those diseases."
Also breaks: references/rules.md, "Formality" (two ideas in one sentence); the prose standard, section E (the sentence has 30 words).

9. sections/4_experiments/d_results.tex:21
Passage: "Improved calibration makes the models predicted scores of tumor development more reliable and more dependable for probabilistic interpretation."
Replacement: "Improved calibration suggests that the models' predicted scores of tumor development are more dependable for probabilistic interpretation."
Also breaks: references/rules.md, "Formality" (the missing apostrophe aside, "more reliable and more dependable" says one claim twice).

================================================================
GROUP 2. references/rules.md, "Limitations and alternative interpretations"
A reader believes that pre-training lowered calibration error for every model, and that the sequence-order-prediction task adds little for every modality. The draft's own tables show exceptions to both. Example: sections/4_experiments/d_results.tex:21.

10. sections/4_experiments/d_results.tex:21
Passage: "More interestingly, the comparison between baseline and fine-tuned models' reliability diagrams indicates that the proposed self-supervised pre-training reduces the expected calibration error across all three modality groups relative to the models trained with randomly initialized parameters."
Replacement: "Averaged over model variants, the proposed self-supervised pre-training reduced the expected calibration error in all three modality groups, relative to the models trained with randomly initialized parameters. For HCCNet-F on T1 IOP & T2-MRI, the expected calibration error rose from 0.182 to 0.204."
Also breaks: the prose standard, section 0 ("More interestingly" is a performative aside); references/rules.md, "Tense per section" (Results take the past tense).

11. sections/4_experiments/d_results.tex:5
Passage: "The combined T1 IOP \& T2-MRI modality reaches AUPRC = 0.420 and AUROC = 0.736, so the T2-MRI model alone exceeds it on AUROC (0.873 versus 0.736), indicating that concatenating the weaker T1 IOP-MRI with T2-MRI dilutes the T2 signal."
Replacement: "The combined T1 IOP \& T2-MRI modality reached AUPRC = 0.420 and AUROC = 0.736. The T2-MRI model alone exceeded it on AUROC (0.873 versus 0.736). This difference indicates that concatenating the weaker T1 IOP-MRI with T2-MRI dilutes the T2 signal on AUROC. On AUPRC, T2-MRI fell below the combined modality at HCCNet-C (0.351 versus 0.373) and HCCNet-T (0.365 versus 0.407)."
Also breaks: the prose standard, section E (the sentence has 40 words); references/rules.md, "Tense per section".

12. sections/5_discussion/discussion.tex:12
Passage: "An ablation that pre-trains only the CNN backbone or only the Transformer encoder further indicates that the self-supervised pre-training of the CNN backbone is the dominant driver of the pre-training benefit, while the sequence-order-prediction task contributes comparatively little."
Replacement: "For DW-MRI and T1 DCE-MRI, an ablation that pre-trains only the CNN backbone or only the Transformer encoder indicates that pre-training the CNN backbone drives most of the pre-training benefit. For T1 IOP & T2-MRI, the Transformer encoder alone reached an AUPRC of 0.457 and the CNN backbone alone 0.447."
Also breaks: the prose standard, section A ("comparatively little" is a vague qualifier); the prose standard, section E (the sentence has 40 words).

13. sections/6_conclusion/conclusion.tex:1
Passage: "Beyond the original framework, an ablation of the two pre-training stages indicated that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed performance gains, while the sequence-order-prediction task contributes comparatively little."
Replacement: "For DW-MRI and T1 DCE-MRI, an ablation of the two pre-training stages indicated that pre-training the CNN backbone drives most of the observed performance gains. For T1 IOP & T2-MRI, the two stages contributed comparably (AUPRC of 0.457 for the Transformer encoder alone and 0.447 for the CNN backbone alone)."
Also breaks: the prose standard, section A ("comparatively little"); the prose standard, section E (the sentence has 36 words).

14. sections/4_experiments/c_evaluation.tex:8
Passage: "To avoid over-interpreting the limited number of positive cases, we therefore refrain from drawing conclusions from differences that fall within one standard deviation across folds and treat such cases as performance ties."
Replacement: "To avoid over-interpreting the 37 positive cases, we treated differences within one standard deviation across folds as performance ties. We drew no conclusions from them."
Also breaks: references/rules.md, "Tense per section"; references/rules.md, "Formality" (two ideas). [Limit for the author: sections/4_experiments/d_results.tex:11 and sections/4_experiments/d_results.tex:29 draw conclusions from differences that the tables place within one standard deviation. Examples are DW-MRI with CNN backbone only (0.672 +/- 0.069) against both stages (0.588 +/- 0.068).]

================================================================
GROUP 3. references/rules.md, "Evidence for claims"
A reader cannot check the claims of the background, which carry no source. The Related Work opens on one of them. Example: sections/2_related_work/a_longitudinal_analysis.tex:1.

15. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "To date, deep learning applications to medical imaging still predominately consider cross-sectional instead of repeated imaging data."
Replacement: "To date, [the share of deep learning applications to medical imaging that use cross-sectional data, with its citation] consider cross-sectional instead of repeated imaging data."
Also breaks: the prose standard, section A ("predominately").

16. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "However,  physicians usually assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records."
Replacement: "However, [the share of assessments in which physicians do this, with its citation] assess the progression of disease or the effect of treatment by comparing patients' current to previous imaging records."
Also breaks: the prose standard, section A ("usually").

17. sections/2_related_work/a_longitudinal_analysis.tex:1
Passage: "As a result, longitudinal imaging has long been established as the gold standard in many branches of oncology, enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time."
Replacement: "As a result, longitudinal imaging is the gold standard in [the branches of oncology, with their citations]. [The studies, with their citations] have extended the analysis of medical imaging to imaging data across time."
Also breaks: the prose standard, section A ("many"); references/rules.md, "Vague language" ("recent studies"); references/rules.md, "Formality" (two ideas).

18. sections/2_related_work/a_longitudinal_analysis.tex:5
Passage: "To mitigate this shortcoming, our study uses a hybrid model architecture, which is the third most common framework in longitudinal medical image analysis."
Replacement: "To mitigate this shortcoming, our study uses a hybrid model architecture, the third of the three frameworks in longitudinal medical image analysis [the citation for its rank by frequency]."

19. sections/2_related_work/b_pretraining.tex:3
Passage: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework."
Replacement: "Among them, contrastive learning approaches remain the most commonly applied pre-training framework [the citation or the count of studies that shows it]."

20. sections/3_methodology/d_pretraining.tex:1
Passage: "When training neural networks, task agnostic pre-training has been repeatedly shown to improve performance on downstream tasks."
Replacement: "Task agnostic pre-training improved downstream performance of neural networks in [the studies, with their citations]."
Also breaks: the prose standard, section A ("repeatedly").

21. sections/1_introduction/introduction.tex:7
Passage: "Likewise, most deep learning applications are aimed at detecting a malignancy, resulting in a lack of studies focusing on detecting tissue changes before the tumor actually develops."
Replacement: "Likewise, [the share of deep learning applications aimed at detecting a malignancy, with its citation] are aimed at detecting a malignancy. As a result, few studies [their count, with citations] detect tissue changes before the tumor develops."
Also breaks: the prose standard, section A ("most", "actually" as a softener); references/rules.md, "Formality" (two ideas).

22. sections/5_discussion/discussion.tex:6
Passage: "Despite being long established as the gold standard in many branches of oncology, deep learning applications to the study of longitudinal medical images remain notoriously understudied."
Replacement: "Longitudinal imaging is the gold standard in [the branches of oncology, with their citations]. Deep learning applications to longitudinal medical images remain understudied [the citation or count that shows it]."
Also breaks: the prose standard, section A ("many"); references/rules.md, "Formality" ("notoriously" is an intensifier the claim does not carry, and the sentence holds two ideas).

================================================================
GROUP 4. references/rules.md, "Vague language"
A reader cannot tell which studies or approaches the claims about prior work refer to. Example: sections/1_introduction/introduction.tex:7.

23. sections/1_introduction/introduction.tex:7
Passage: "However, many existing approaches have not fully explored the potential of these techniques in the context of longitudinal MRI analysis, particularly for diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."
Replacement: "However, [the approaches, with their citations, or their count] have not explored these techniques for longitudinal MRI analysis of diseases that require monitoring over extended periods \citep{parikh2020biomarkers}."
Also breaks: the prose standard, section E (the sentence has 31 words).

24. sections/2_related_work/b_pretraining.tex:1
Passage: "As a result, many deep learning studies analyzing medical images over time continue to extract 2D slices from 3D medical images to use CNN model weights pre-trained on large scale natural image datasets."
Replacement: "As a result, [the studies, with their citations, or their count] that analyze medical images over time extract 2D slices from 3D medical images. These slices let them use CNN weights pre-trained on large scale natural image datasets."
Also breaks: the prose standard, section E (the sentence has 33 words).

25. sections/2_related_work/b_pretraining.tex:1
Passage: "Using the potential abundance of unlabeled data, some longitudinal medical imaging studies have therefore started to apply self-supervised pre-training approaches to enhance downstream model performance."
Replacement: "Using the potential abundance of unlabeled data, \cite{jamaludinSelfsupervisedLearningSpinal2017}, \cite{rivailModelingDiseaseProgression2019} [and any further studies, with their citations] have therefore applied self-supervised pre-training approaches to enhance downstream model performance."

26. sections/2_related_work/a_longitudinal_analysis.tex:7
Passage: "Likewise, many of them disregard the irregular time intervals between image screenings."
Replacement: "Likewise, [the studies, with their citations, or their count] disregard the irregular time intervals between image screenings."

================================================================
GROUP 5. The prose standard, section A (vague qualifiers)
A reader cannot tell how large the effects and differences are. In one place the stated size is wrong: the "4x" variant has 3.3 times the base model's parameters. Example: sections/3_methodology/c_variants.tex:1.

27. sections/3_methodology/c_variants.tex:1
Passage: "In addition to our base model, called HCCNet-Pico, we introduce four variants of HCCNet, which are versions of about 0.5x, 0.75x, 2x, and 4x the base model's size respectively."
Replacement: "In addition to our base model, called HCCNet-Pico, we introduced four variants of HCCNet, with [0.56], [0.75], [2.09] and [3.29] times the base model's parameter count respectively."
The bracketed ratios are computed from c_variants.tex:10 and are facts for the author: 12.4, 16.5, 45.9 and 72.4 million parameters against 22.0 million.

28. sections/abstract/abstract.tex:1
Passage: "Longitudinal MRI analysis is important for predicting disease outcomes, particularly in chronic conditions like hepatocellular carcinoma (HCC), where early detection can considerably influence treatment strategies and patient prognosis."
Replacement: "Longitudinal MRI analysis is important for predicting disease outcomes in chronic conditions like hepatocellular carcinoma (HCC). In HCC, early detection influences treatment strategies and patient prognosis [the size of the effect, with its citation]."
Also breaks: the prose standard, section E (the sentence has 27 words).

29. sections/abstract/abstract.tex:3
Passage: "We additionally find that an exploratory naive fusion of imaging modalities yields only marginal gains over the strongest single modality."
Replacement: "An exploratory naive fusion of imaging modalities at most matched the strongest single modality, DW-MRI, on AUROC (0.894) and fell below it on AUPRC (0.535 to 0.587 versus 0.588)."
Also breaks: references/rules.md, "Limitations and alternative interpretations" (no fused configuration gains over DW-MRI in tables/results_fusion.tex).

30. sections/5_discussion/discussion.tex:12
Passage: "Finally, our exploratory multi-modal experiments show that naively fusing imaging modalities by channel concatenation provides at most marginal improvements over the strongest single modality."
Replacement: "Finally, in our exploratory multi-modal experiments, naive fusion by channel concatenation at most matched the AUROC of the strongest single modality (0.894) and lowered its AUPRC."

31. sections/6_conclusion/conclusion.tex:1
Passage: "Exploratory experiments further showed that naively fusing imaging modalities through channel concatenation yields at most marginal gains over the strongest single modality, suggesting that realizing the full potential of multi-modal fusion will require more structured fusion strategies, which we leave to future work."
Replacement: "Exploratory experiments further showed that naive fusion through channel concatenation at most matched the strongest single modality. More structured fusion strategies may be required to gain from multi-modal fusion, and we leave them to future work."
Also breaks: the prose standard, section E (the sentence has 42 words).

32. sections/1_introduction/introduction.tex:1
Passage: "This is especially relevant in conditions like hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring can considerably impact treatment decisions and prognosis \citep{parikh2020biomarkers}."
Replacement: "Such prediction is relevant in hepatocellular carcinoma (HCC), where early detection of tissue changes and subsequent monitoring affect treatment decisions and prognosis [the size of the effect, as \citet{parikh2020biomarkers} reports it]."
Also breaks: references/rules.md, "Clear antecedents" ("This" stands alone).

33. sections/1_introduction/introduction.tex:1
Passage: "However, despite its potential, the development of effective predictive models that can fully exploit the temporal information in longitudinal MRI data remains a significant challenge \citep{jin2021predicting}."
Replacement: "However, predictive models that exploit the temporal information in longitudinal MRI data remain difficult to develop [the specific obstacle, as \citet{jin2021predicting} reports it]."

34. sections/1_introduction/introduction.tex:5
Passage: "Traditional approaches often simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets \citep{kumar2024improving}."
Replacement: "[The share of approaches that do so, as \citet{kumar2024improving} reports it] simplify this task by extracting 2D slices from 3D MRI scans and applying convolutional neural networks (CNNs) pre-trained on large-scale natural image datasets."

35. sections/1_introduction/introduction.tex:5
Passage: "However, this method has limitations, particularly in the medical domain where datasets are often small, and the differences between natural and medical images, such as texture, contrast, and noise, considerably impact the transferability of pre-trained models \citep{zeng2021positional}."
Replacement: "However, this method is limited in the medical domain, where datasets hold [the typical dataset size, with its citation]. The differences between natural and medical images in texture, contrast and noise reduce the transferability of pre-trained models [the size of the reduction, as \citet{zeng2021positional} reports it]."
Also breaks: the prose standard, section E (the sentence has 38 words); references/rules.md, "Formality" (two ideas).

36. sections/3_methodology/a_problem_formulation.tex:1
Passage: "Since the frequency of liver screenings is typically determined by the patient's unique condition, some patients may undergo more frequent screenings than others with more or less regular time intervals between examinations."
Replacement: "The frequency of liver screenings depends on the patient's condition in [the share of patients for whom it does, or the protocol that sets it]. As a result, the number of screenings and the intervals between examinations differ between patients (screening intervals from 1 month to 6.5 years)."

37. sections/3_methodology/b_architecture.tex:5
Passage: "Additionally, we reimplement the patchify layer in ConvNeXt with a smaller kernel size and stride for the convolutional layer resulting in a 3x rather than 4x downsampling of the input images and thus accommodating for the lower input size typically encountered in volumetric data."
Replacement: "Additionally, we reimplemented the patchify layer in ConvNeXt with a smaller kernel size and stride, which downsamples the input images 3x rather than 4x. The smaller downsampling suits the input size of the volumetric crops used here ($72^3$ and $48^3$ voxels)."
Also breaks: the prose standard, section E (the sentence has 45 words); references/rules.md, "Terms defined at first use" ("patchify layer" is not defined).

38. sections/4_experiments/d_results.tex:5
Passage: "At HCCNet-Pico, the standalone T2-MRI model (AUPRC = 0.419 and AUROC = 0.873) is markedly stronger on AUROC than the standalone T1 IOP-MRI model (AUPRC = 0.406 and AUROC = 0.703), while on AUPRC the two are comparable (around 0.42)."
Replacement: "At HCCNet-Pico, the standalone T2-MRI model reached an AUROC of 0.873, against 0.703 for the standalone T1 IOP-MRI model. On AUPRC, the two models were within 0.013 of each other (0.419 and 0.406)."
Also breaks: references/rules.md, "Tense per section"; the prose standard, section E (the sentence has 38 words). "around 0.42" does not hold for T1 IOP-MRI (0.406).

39. sections/4_experiments/d_results.tex:9
Passage: "Across model variants and imaging modalities, the per-fold ensemble closely follows the diagonal line, indicating low sensitivity to the data partitioning."
Replacement: "Across model variants and imaging modalities, the per-fold ensemble deviated from the diagonal line by an MAE of [the range of MAE values in Figure \ref{fig:cumulative_gain}]. This deviation indicates low sensitivity to the data partitioning."

40. sections/4_experiments/d_results.tex:9
Passage: "This robustness is tightest on AUROC and slightly looser on AUPRC, with the largest, though still modest, fold-to-fold spread observed on the combined T1 in- and out-of-phase and T2-weighted modality."
Replacement: "The MAE was lower on AUROC than on AUPRC [the two MAE ranges]. The largest fold-to-fold spread [its MAE] occurred on the combined T1 in- and out-of-phase and T2-weighted modality."
Also breaks: the prose standard, section E (the sentence has 32 words).

41. sections/4_experiments/d_results.tex:11
Passage: "Across imaging modalities, the models are thus robust and not overly sensitive to variation across folds."
Replacement: "Across imaging modalities, the models' MAE stayed at or below [the largest MAE in Figure \ref{fig:cumulative_gain}]."
Also breaks: the prose standard, section E (restating close: this sentence repeats the paragraph at d_results.tex:9).

42. sections/4_experiments/d_results.tex:11
Passage: "This corresponds with the results presented in Table \ref{tab:finetuned_results}, which indicate that compared to the differences between imaging modalities model size only negligibly affects downstream model performance."
Replacement: "The results in Table \ref{tab:finetuned_results} agree: across model variants, AUROC with DW-MRI ranged from 0.882 to 0.936. [Limit for the author: AUPRC with DW-MRI ranged from 0.507 to 0.725 across model variants, more than the gap between the DW-MRI and T1 DCE-MRI averages (0.614 and 0.520).]"
Also breaks: references/rules.md, "Clear antecedents" ("This" stands alone).

43. sections/4_experiments/d_results.tex:11
Passage: "At least on the data evaluated in this study, variations in model complexity do thus not considerably influence the quality of the models' predictions nor their robustness."
Replacement: "delete"
The sentence restates the paragraph (the prose standard, section E, restating closes).

44. sections/4_experiments/b_implementation.tex:9
Passage: "Owing to the limited number of positive cases and our finding that model capacity only negligibly affects downstream performance, we restrict the fusion experiments to the HCCNet-Pico variant."
Replacement: "Because the cohort has 37 positive cases and model capacity changed AUROC with DW-MRI by at most 0.054 across variants, we restricted the fusion experiments to the HCCNet-Pico variant."
The 0.054 is 0.936 minus 0.882, computed from tables/results_finetune.tex rows 13 to 17; the author should confirm it. Also breaks: references/rules.md, "Tense per section".

45. sections/4_experiments/d_results.tex:19
Passage: "For the fine-tuned models, the plots largely align with the results presented in Table \ref{tab:results_base_pre}."
Replacement: "For the fine-tuned models, the plots matched the ranking of modalities in Table \ref{tab:results_base_pre} [the cases in which they do not]."

46. sections/4_experiments/d_results.tex:25
Passage: "Adding T1 DCE-MRI to DW-MRI lowers performance (AUPRC = 0.535 and AUROC = 0.873), fusing the weaker T1 IOP \& T2-MRI modality with DW-MRI leaves performance essentially equal to DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891), and the full fusion of all three modality groups matches DW-MRI alone on AUROC (0.894) while landing slightly below on AUPRC (0.541)."
Replacement:
"Each fused configuration compared with DW-MRI alone as follows:
- DW-MRI + T1 DCE-MRI: lower performance (AUPRC = 0.535 and AUROC = 0.873).
- DW-MRI + T1 IOP \& T2-MRI: within 0.003 of DW-MRI alone (AUPRC = 0.587 and AUROC = 0.891).
- Full fusion: the same AUROC as DW-MRI alone (0.894) and an AUPRC 0.047 lower (0.541)."
Also breaks: the prose standard, section D (three items in paragraph form); references/rules.md, "Tense per section"; the prose standard, section E (the sentence has 61 words).

47. sections/4_experiments/d_results.tex:29
Passage: "For diffusion-weighted imaging, pre-training only the CNN backbone recovers essentially all of the full pre-training gain (AUPRC = 0.672 versus 0.588 for both stages and 0.308 for the randomly initialized baseline), with the difference between the two configurations falling within one standard deviation across folds, whereas pre-training only the Transformer encoder yields AUPRC = 0.310, barely above the baseline."
Replacement: "For diffusion-weighted imaging, pre-training only the CNN backbone reached an AUPRC of 0.672, against 0.588 for both stages and 0.308 for the randomly initialized baseline. The difference between the first two configurations fell within one standard deviation across folds. Pre-training only the Transformer encoder reached an AUPRC of 0.310, 0.002 above the baseline."
Also breaks: references/rules.md, "Tense per section"; the prose standard, section E (the sentence has 58 words).

48. sections/4_experiments/d_results.tex:29
Passage: "The CNN-backbone dominance also holds for dynamic contrast enhanced T1-weighted images, where the CNN backbone alone (AUPRC = 0.524) clearly exceeds the Transformer encoder alone (AUPRC = 0.361)."
Replacement: "The CNN-backbone dominance also held for dynamic contrast enhanced T1-weighted images, where the CNN backbone alone (AUPRC = 0.524) exceeded the Transformer encoder alone (AUPRC = 0.361) by more than two standard deviations."

49. sections/4_experiments/c_evaluation.tex:8
Passage: "Since all metrics are obtained through cross-validation, we note that the five fold-level estimates are not fully independent: consecutive folds share the majority of their development data, so the reported standard deviations should be interpreted as a measure of fold-to-fold variability rather than as an unbiased estimate of the true standard error, which they are likely to slightly understate."
Replacement: "Because all metrics come from cross-validation, the five fold-level estimates are not independent. Any two folds' development sets share three of their four folds. The reported standard deviations therefore measure fold-to-fold variability, and they may understate the true standard error [by an amount the author supplies]."
Also breaks: the prose standard, section C ("we note that"); the prose standard, section E (the sentence has 60 words).

50. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "Note that during CNN-backbone pre-training we slightly deviate from the hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}."
Replacement: "During CNN-backbone pre-training, we changed two hyperparameter settings proposed in \citep{caronEmergingPropertiesSelfSupervised2021}: the projection head's output dimensionality and the teacher temperature."
Also breaks: the prose standard, section C ("Note that").

51. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "Consequently, we drastically reduced the projection head's output dimensionality to 1024 classes and reduced the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."
Replacement: "Consequently, we reduced the projection head's output dimensionality to 1024 classes [from the original value] and set the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$."

52. sections/appendix/b_additional_results/1_baseline.tex:3
Passage: "Overall differences between imaging modalities are however far less pronounced than for the models intialized with SSL pre-trained weighted (s. Table \ref{tab:finetuned_results}) and the overall diagnostic performance remains generally poor."
Replacement: "Baseline AUROC ranged from 0.592 to 0.724 across imaging modalities and model variants, against 0.703 to 0.936 for the models initialized with self-supervised pre-trained weights (Table \ref{tab:finetuned_results}). The baseline AUPRC stayed between 0.228 and 0.375."
Also breaks: references/rules.md, "Terms defined at first use" ("SSL" is never defined); references/rules.md, "Formality" (two ideas; "s." is an informal abbreviation).

53. sections/appendix/b_additional_results/2_reliability.tex:3
Passage: "As for the comparison across performance metrics depicted in Table \ref{tab:results_base_pre}, variations in reliability scores are predominantly driven by imaging modality rather than model complexity."
Replacement: "As in Table \ref{tab:results_base_pre}, reliability scores differ more between imaging modalities than between model variants [the spread across modalities and across variants]."

54. figures/cumulative_gain.tex:10
Passage: "Generally, lower MAE values indicate greater robustness to fold-to-fold variation, while higher MAE values signify greater sensitivity to the data partitioning."
Replacement: "Lower MAE values indicate greater robustness to fold-to-fold variation."
The cut half of the sentence restates the first half in reverse.

55. sections/4_experiments/b_implementation.tex:7
Passage: "We employ the same optimizer, learning rate schedule, number of training steps, batch size, and further hyper-parameter settings as during fine-tuning but slightly increase the learning rate warm-up (i.e., from 20 to 40 training steps) to ensure a more stable convergence."
Replacement: "The baseline used the same optimizer, learning rate schedule, number of training steps, batch size and further hyper-parameter settings as fine-tuning. Its learning rate warm-up was increased from 20 to 40 training steps to stabilize convergence."
Also breaks: references/registers.md, "Voice" (a procedure takes the passive); references/rules.md, "Tense per section"; the prose standard, section E (the sentence has 42 words).

56. sections/3_methodology/d_pretraining.tex:1
Passage: "Additionally, subset $V^{(p,t)}$ contains only roughly 75\% of observations included in superset $D^{(p,t)}$."
Replacement: "Additionally, subset $V^{(p,t)}$ contains 703 of the 963 observations included in superset $D^{(p,t)}$ [73%]."

================================================================
GROUP 6. references/registers.md, "What the reader looks for"
A reader in Medicine and Health cannot check the study against a reporting guideline, because the methods name none. Example: sections/4_experiments/a_data.tex:1.

57. sections/4_experiments/a_data.tex:1
Passage: "We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients who underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022 at Medisch Spectrum Twente (MST) in Enschede, the Netherlands."
Replacement: "HCCNet was evaluated on data collected retrospectively from liver cirrhosis patients at Medisch Spectrum Twente (MST) in Enschede, the Netherlands. These patients underwent repeated abdominal MRI screening for HCC surveillance between March 2011 and September 2022. The study is reported according to [the reporting guideline the study follows]."
Also breaks: references/rules.md, "Tense per section"; references/registers.md, "Voice"; the prose standard, section E (the sentence has 40 words).

================================================================
GROUP 7. references/rules.md, "Most specific term"
A reader takes "model performance" as a general gain. The 147.1% is an AUPRC change only, and the AUROC change for the same model is 29.7%. Example: sections/5_discussion/discussion.tex:8.

58. sections/5_discussion/discussion.tex:8
Passage: "Our proposed pre-training approach improved model performance by up to 147.1\% for models fine-tuned using diffusion-weighted MR images and yielded substantial improvements as well for models fine-tuned on the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities."
Replacement: "Our proposed pre-training approach improved AUPRC by up to 147.1\% for models fine-tuned using diffusion-weighted MR images. For the dynamic contrast-enhanced T1-weighted and the combined T1 in- and out-of-phase and T2-weighted modalities, average AUPRC rose by 48.9\% and 52.3\%."
Also breaks: the prose standard, section A ("substantial"); the prose standard, section E (the sentence has 42 words).

59. sections/5_discussion/discussion.tex:8
Passage: "Overall, fine-tuned model results varied substantially across imaging modalities."
Replacement: "Fine-tuned AUPRC varied across the three modality groups, from an average of 0.429 for the combined T1 IOP & T2-MRI modality to 0.614 for DW-MRI."
Also breaks: the prose standard, section A ("substantially"); references/rules.md, "Transitions" ("Overall" opens a paragraph that does not summarize the one before).

================================================================
GROUP 8. references/rules.md, "Terms defined at first use"
A reader outside the field meets abbreviations and method names before they are explained. "SSL" is never explained. Example: main.tex:45.

60. main.tex:45
Passage: "\title{HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from Longitudinal 3D MRI, with a Case Study on Hepatocellular Carcinoma}"
Replacement: "\title{HCCNet: A Self-Supervised Convolutional Neural Network (CNN)-Transformer for Disease Prognosis from Longitudinal 3D Magnetic Resonance Imaging (MRI), with a Case Study on Hepatocellular Carcinoma}"

61. sections/abstract/abstract.tex:1
Passage: "To address this, we propose HCCNet, a novel model architecture that integrates a 3D adaptation of the ConvNeXt CNN architecture with a Transformer encoder, capturing both the fine-grained spatial features of 3D MRIs and the complex temporal dependencies across different time points."
Replacement: "To address the focus on cross-sectional data, we propose HCCNet, which combines a 3D adaptation of ConvNeXt [a one-clause definition of ConvNeXt] with a Transformer encoder. The ConvNeXt backbone captures the spatial features of 3D MRIs, and the Transformer encoder captures the temporal dependencies across time points."
Also breaks: references/rules.md, "Clear antecedents" ("this" stands alone); the prose standard, section E (the sentence has 43 words).

62. sections/1_introduction/introduction.tex:11
Passage: "The CNN backbone is pre-trained using an extended version of the DINO framework, adapted to 3D MRI, which treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."
Replacement: "The CNN backbone is pre-trained using an extended version of the DINO framework [the expansion of DINO and a one-clause definition, with \citet{caronEmergingPropertiesSelfSupervised2021}], adapted to 3D MRI. The adaptation treats different MRI sequences as natural augmentations of the same image \citep{tang2021self}."
Also breaks: the prose standard, section E (the sentence has 31 words).

63. sections/3_methodology/b_architecture.tex:14
Passage: "The Transformer encoder is based on the Pre-LN implementation \citep{xiongLayerNormalizationTransformer2020}"
Replacement: "The Transformer encoder is based on the Pre-LN implementation, which applies layer normalization before each sublayer \citep{xiongLayerNormalizationTransformer2020},"

64. sections/4_experiments/b_implementation.tex:3
Passage: "While MRI scans are assumed to be i.i.d. during CNN pre-training, pre-training of the Transformer encoder considers the within-person dependencies across time points."
Replacement: "During CNN pre-training, MRI scans were treated as independent and identically distributed (i.i.d.). Pre-training of the Transformer encoder accounted for the within-person dependencies across time points."
Also breaks: references/rules.md, "Tense per section".

================================================================
GROUP 9. The prose standard, section D (no synonym cycling)
A reader cannot tell whether "model variations", "model architectures", "model complexity" and "model variants" name the same five configurations. Example: sections/4_experiments/d_results.tex:11.

Each entry below replaces the off name with "model variants", the name sections/3_methodology/c_variants.tex gives the subsection (Architectural Variants) and that d_results.tex:9 uses.

65. sections/3_methodology/c_variants.tex:1. Passage: "The five model variations are:". Replacement: "The five model variants are:"

66. sections/4_experiments/c_evaluation.tex:1. Passage: "For the comparison across model variations". Replacement: "For the comparison across model variants"

67. sections/4_experiments/d_results.tex:5. Passage: "stratified by imaging modality and model architecture". Replacement: "stratified by imaging modality and model variant"

68. sections/4_experiments/d_results.tex:5. Passage: "across model architectures". Replacement: "across model variants"

69. sections/4_experiments/d_results.tex:9. Passage: "\textbf{Comparison across Model Variations.}". Replacement: "\textbf{Comparison across Model Variants.}"

70. sections/4_experiments/d_results.tex:9. Passage: "we explore the impact of varying model complexity on HCC risk prediction". Replacement: "we explored the effect of the model variant on HCC risk prediction"

71. sections/4_experiments/d_results.tex:11. Passage: "the plots reveal no consistent differences across model architecture, as no model variant is persistently deviating from the optimal diagonal line". Replacement: "the plots showed no difference that recurred across folds between model variants, as no model variant deviated from the diagonal line in every fold"

72. sections/4_experiments/d_results.tex:15. Passage: "stratified by image modality and model variation". Replacement: "stratified by imaging modality and model variant"

73. sections/appendix/b_additional_results/1_baseline.tex:3. Passage: "stratified by image modality and model variation". Replacement: "stratified by imaging modality and model variant"

74. sections/appendix/b_additional_results/2_reliability.tex:3. Passage: "stratified by imaging modality and model architecture". Replacement: "stratified by imaging modality and model variant"

75. tables/hyperparams.tex:36. Passage: "for model variations HCCNet-F, -C, and -P". Replacement: "for model variants HCCNet-F, -C, and -P"

The CNN is also called by two names, "CNN backbone" and "CNN feature extractor". Each entry below replaces "CNN feature extractor" with "CNN backbone".

76. sections/3_methodology/b_architecture.tex:5. Passage: "\textbf{CNN Feature Extractor.}". Replacement: "\textbf{CNN Backbone.}"

77. sections/3_methodology/b_architecture.tex:7. Passage: "The CNN feature extractor takes the MR images as inputs". Replacement: "The CNN backbone takes the MR images as inputs"

78. sections/3_methodology/b_architecture.tex:14. Passage: "the image embeddings obtained from the CNN feature extractor". Replacement: "the image embeddings obtained from the CNN backbone"

79. sections/3_methodology/d_pretraining.tex:3. Passage: "\textbf{CNN Feature Extractor.}". Replacement: "\textbf{CNN Backbone.}"

80. sections/3_methodology/d_pretraining.tex:10. Passage: "we keep the parameters of the CNN feature extractor fixed". Replacement: see entry 89, which gives this sentence whole.

81. sections/appendix/a_implementation/2_augmentations.tex:1. Passage: "During pre-training of the CNN feature extractor". Replacement: "During pre-training of the CNN backbone"

82. tables/results_pretrain_ablation.tex:27. Passage: "pre-trains the CNN feature extractor using DINO". Replacement: "pre-trains the CNN backbone using DINO"

================================================================
GROUP 10. references/rules.md, "Tense per section", with references/registers.md, "Voice"
No claim changes. The reader cannot tell what was done in this study from what the model does in general, because procedures are written in the present tense with "we". This group lists d_pretraining.tex, b_implementation.tex and d_results.tex only; the coverage note at the top names the files still to be listed. Example: sections/3_methodology/d_pretraining.tex:10.

Methodology (past tense; a procedure in the passive):

83. sections/3_methodology/d_pretraining.tex:1. Passage: "To fully use all available data and improve the representations learned during training, we therefore design two (self-)supervised pre-training tasks for both the CNN backbone and the Transformer encoder prior to training on our downstream task." Replacement: "To use all available data and improve the learned representations, we therefore designed two (self-)supervised pre-training tasks, one for the CNN backbone and one for the Transformer encoder, before training on the downstream task."

84. sections/3_methodology/d_pretraining.tex:3. Passage: "For the CNN backbone, this study extends the self-supervised DINO pre-training framework described in \citep{caronEmergingPropertiesSelfSupervised2021} to 3D MR images." Replacement: "For the CNN backbone, we extended the self-supervised DINO pre-training framework of \citep{caronEmergingPropertiesSelfSupervised2021} to 3D MR images."

85. sections/3_methodology/d_pretraining.tex:8. Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views." Replacement: "Global views were cropped at shape $s = 72^3$ and local views at $s = 48^3$." Also breaks: the prose standard, section C ("Note that").

86. sections/3_methodology/d_pretraining.tex:8. Passage: "Besides that, our implementation also proposes a novel augmentation strategy specific to MR images." Replacement: "We also proposed an augmentation strategy specific to MR images." Also breaks: the prose standard, section E (a personified artifact: "our implementation ... proposes").

87. sections/3_methodology/d_pretraining.tex:8. Passage: "This teaches the model to identify the same patient under varying acquisition conditions." Replacement: "This sampling trains the model to identify the same patient under varying acquisition conditions." Also breaks: references/rules.md, "Clear antecedents".

88. sections/3_methodology/d_pretraining.tex:10. Passage: "To improve the encoder's understanding of disease progression, this study employs a simple binary sequence-order-prediction (SOP) task inspired by \citep{lanALBERTLiteBERT2020}." Replacement: "To improve the encoder's representation of disease progression, we used a binary sequence-order-prediction (SOP) task inspired by \citep{lanALBERTLiteBERT2020}." Also breaks: the prose standard, section A ("simple"); the prose standard, section E ("understanding" is a personified artifact).

89. sections/3_methodology/d_pretraining.tex:10. Passage: "During the SOP pre-training, we keep the parameters of the CNN feature extractor fixed and initialize them using the previously pre-trained weights." Replacement: "During the SOP pre-training, the parameters of the CNN backbone were initialized with the pre-trained weights and kept fixed."

90. sections/3_methodology/d_pretraining.tex:15. Passage: "Note that during pre-training of the Transformer encoder we do not randomly crop multiple views from the same image but instead only crop a single view of shape $s = 72^3$ from the original MRI." Replacement: "During pre-training of the Transformer encoder, a single view of shape $s = 72^3$ was cropped from the original MRI." Also breaks: the prose standard, section C ("Note that").

91. sections/3_methodology/d_pretraining.tex:15. Passage: "Likewise, we concatenate the different series in the sequence of MRI scans to a multi-channel volume instead of randomly selecting a single one." Replacement: "The series of each MRI scan were concatenated into a multi-channel volume."

92. sections/3_methodology/d_pretraining.tex:15. Passage: "Since the backbone is pre-trained on single-channel views, we reconcile the differing input dimensionality by expanding the pre-trained single-channel stem to the required number of input channels: the learned stem filters are replicated across the input series to initialize the first convolutional layer, which is then fine-tuned end to end." Replacement: "Because the backbone was pre-trained on single-channel views, its single-channel stem was expanded to the required number of input channels. The learned stem filters were replicated across the input series to initialize the first convolutional layer. That layer was then fine-tuned end to end." Also breaks: the prose standard, section E (the sentence has 49 words).

Experiments, procedure (past tense; a procedure in the passive):

93. sections/4_experiments/b_implementation.tex:1. Passage: "As aforementioned, we pre-train both the CNN backbone and the Transformer encoder on development superset $D_p^{\text{dev}}$." Replacement: "The CNN backbone and the Transformer encoder were pre-trained on development superset $D_p^{\text{dev}}$."

94. sections/4_experiments/b_implementation.tex:1. Passage: "We train the CNN over 32000 training steps using the AdamW optimizer \citep{loshchilovDecoupledWeightDecay2019} with an effective batch size of $b = 128$." Replacement: "The CNN was trained for 32000 steps with the AdamW optimizer \citep{loshchilovDecoupledWeightDecay2019} and an effective batch size of $b = 128$."

95. sections/4_experiments/b_implementation.tex:1. Passage: "After reaching its maximum value, we decay the learning rate using a cosine schedule." Replacement: "After reaching its maximum value, the learning rate was decayed with a cosine schedule."

96. sections/4_experiments/b_implementation.tex:1. Passage: "Contrary to the original DINO implementation, we also limit the temperature of the teacher network to a constant $\tau_{F_t} = 0.04$ and increase the initial exponential moving average momentum to $m = 0.9995$." Replacement: "Unlike the original DINO implementation, the teacher temperature was fixed at $\tau_{F_t} = 0.04$. The initial exponential moving average momentum was raised to $m = 0.9995$."

97. sections/4_experiments/b_implementation.tex:5. Passage: "During fine-tuning, we update HCCNet on the development subset $V_p^{\text{dev}}$." Replacement: "During fine-tuning, HCCNet was updated on the development subset $V_p^{\text{dev}}$."

98. sections/4_experiments/b_implementation.tex:5. Passage: "Within each of the five outer cross-validation folds, we then train HCCNet on the fold's development subset $V_p^{\text{dev}}$ using the same default hyper-parameter settings as during Transformer encoder pre-training and evaluate it on the corresponding held-out fold." Replacement: "Within each of the five outer cross-validation folds, HCCNet was then trained on the fold's development subset $V_p^{\text{dev}}$ with the hyper-parameter settings of Transformer encoder pre-training. It was evaluated on the corresponding held-out fold."

99. sections/4_experiments/b_implementation.tex:11. Passage: "We conduct this ablation on the HCCNet-Pico variant across all three modality groups using the same five-fold protocol." Replacement: "The ablation was run on the HCCNet-Pico variant for all three modality groups with the same five-fold protocol."

Results (past tense):

100. sections/4_experiments/d_results.tex:5. Passage: "HCCNet trained using diffusion weighted MR images shows excellent predictive capability of tumor development with an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ across model architectures." Replacement: "HCCNet trained on diffusion weighted MR images reached an average $\text{AUPRC} = 0.614$ and $\text{AUROC} = 0.901$ for tumor development across model variants."

101. sections/4_experiments/d_results.tex:5. Passage: "At the group level, the combined modality nonetheless remains the weakest of the three groups." Replacement: "At the group level, the combined modality nonetheless remained the weakest of the three groups."

102. sections/4_experiments/d_results.tex:9. Passage: "No model variant falls consistently below the diagonal line." Replacement: "No model variant fell below the diagonal line in every fold."

103. sections/4_experiments/d_results.tex:15. Passage: "Across imaging modalities, the magnitude of the improvement from our proposed approach varies." Replacement: "The improvement from our proposed approach varied in magnitude across imaging modalities."

104. sections/4_experiments/d_results.tex:19. Passage: "For the randomly initialized baseline, however, the expected calibration error does not display the same negative relationship with model performance." Replacement: "For the randomly initialized baseline, however, the expected calibration error did not show the same negative relationship with model performance."

105. sections/4_experiments/d_results.tex:21. Passage: "This reduction is largest for diffusion weighted MR images at 56.0\%, reaches 37.0\% for dynamic contrast enhanced T1-weighted MRIs, and is smallest at 12.1\% for the already well-calibrated combined T1 in- and out-of-phase and T2-weighted modality." Replacement: "The reduction was 56.0\% for diffusion weighted MR images, 37.0\% for dynamic contrast enhanced T1-weighted MRIs and 12.1\% for the combined T1 in- and out-of-phase and T2-weighted modality, whose baseline ECE was the lowest." Also breaks: the prose standard, section E (the sentence has 36 words; the replacement has 33, which the comparison of three numbers needs).

106. sections/4_experiments/d_results.tex:25. Passage: "None of the fused configurations exceeds this best single modality." Replacement: "None of the fused configurations exceeded this best single modality."

107. sections/4_experiments/d_results.tex:29. Passage: "These results indicate that the self-supervised pre-training of the CNN backbone is the dominant driver of the observed pre-training effects for diffusion-weighted and dynamic contrast enhanced T1-weighted imaging." Replacement: "delete". The sentence restates the paragraph (the prose standard, section E, restating closes).

================================================================
GROUP 11. references/rules.md, "Transitions"
No claim changes. A reader reads the baseline comparison as the last result, and then meets a later "Finally". Example: sections/4_experiments/d_results.tex:15.

108. sections/4_experiments/d_results.tex:15
Passage: "Finally, we evaluate the impact of our proposed pre-training approach on model performance."
Replacement: "We evaluated the effect of our proposed pre-training approach on AUPRC and AUROC."
Also breaks: references/rules.md, "Tense per section".

109. sections/4_experiments/d_results.tex:9
Passage: "As such, Figure \ref{fig:cumulative_gain} plots the cumulative gain in normalized AUPRC and AUROC against the test results obtained over the five cross-validation folds and ordered by ascending cumulative gain."
Replacement: "Figure \ref{fig:cumulative_gain} plots the cumulative gain in normalized AUPRC and AUROC over the five cross-validation folds, ordered by ascending cumulative gain."

================================================================
GROUP 12. references/rules.md, "Clear antecedents"
A reader has to guess what "this" refers to. Example: sections/5_discussion/discussion.tex:12.

110. sections/5_discussion/discussion.tex:12
Passage: "We attribute this to the limited number of positive cases and the additional registration burden incurred when concatenating series acquired across separate sequences, and view structured fusion strategies that explicitly account for the distinct characteristics of each modality as a promising avenue for future work."
Replacement: "The absence of a fusion gain may be due to the 37 positive cases or to the registration burden of concatenating series acquired across separate sequences. Fusion strategies that model each modality separately may be examined in future work."
Also breaks: references/rules.md, "Hedging" (the attribution has no supporting data); references/rules.md, "Formality" (two ideas); the prose standard, section E (the sentence has 44 words).

111. sections/3_methodology/d_pretraining.tex:15
Passage: "This transfers the pre-trained representation to inputs comprising an arbitrary number of series without re-initializing the first convolutional layer from scratch."
Replacement: "The stem expansion transferred the pre-trained representation to inputs of any number of series without re-initializing the first convolutional layer."

112. sections/appendix/a_implementation/3_hyperparams.tex:3
Passage: "This is due to convergence issues that we noted during initial model runs."
Replacement: "The changes addressed convergence failures in initial model runs [the failure observed]."

================================================================
GROUP 13. The prose standard, section C (throat-clearing and meta-commentary)
No claim changes. The reader reads a sentence that only announces the subsections that follow. Example: sections/4_experiments/d_results.tex:3.

113. sections/4_experiments/d_results.tex:3
Passage: "We report HCCNet's fine-tuned performance (i) across imaging modalities, (ii) model variations, and (iii) against a randomly initialized baseline."
Replacement: "delete"

114. sections/3_methodology/b_architecture.tex:5
Passage: "More details on the study's 3D implementation of ConvNeXt are presented in \ref{sec:appendix_conv_layer}."
Replacement: "Appendix \ref{sec:appendix_conv_layer} gives the 3D ConvNeXt block."

================================================================
GROUP 14. The prose standard, section D (paragraphs of one idea, under roughly four sentences)
No claim changes. The reader meets paragraphs of five to nine sentences that each hold two or more ideas. Example: sections/4_experiments/a_data.tex:3.

115. sections/abstract/abstract.tex:3 (5 sentences; two ideas, the method and the results)
Passage: "The CNN backbone is pre-trained using a self-supervised learning framework adapted for 3D MRIs, while the Transformer encoder is pre-trained with a sequence-order-prediction task to enhance its understanding of disease progression over time. We demonstrate the effectiveness of HCCNet by applying it to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."
Replacement:
"The CNN backbone is pre-trained with a self-supervised learning framework adapted for 3D MRIs. The Transformer encoder is pre-trained with a sequence-order-prediction task to represent disease progression over time.

We applied HCCNet to a cohort of liver cirrhosis patients undergoing regular MRI screenings for HCC surveillance."

116. sections/1_introduction/introduction.tex:13 (6 sentences; two ideas, the HCC application and the transfer to other conditions)
Passage: "This application not only demonstrates HCCNet's capabilities but also addresses a key need in personalized HCC surveillance of cirrhotic patients, where timely and accurate predictions can considerably influence clinical outcomes. The methodological approach presented in this paper can also be considered for predicting other conditions that, similar to HCC, benefit from monitoring changes over time."
Replacement (first sentence as in entry 5):
"This application addresses a need in personalized HCC surveillance of cirrhotic patients. In these patients, timely and accurate predictions can influence clinical outcomes [the size of the effect on clinical outcomes, with its citation].

The methodological approach presented in this paper may also be applied to predict other conditions that, like HCC, benefit from monitoring changes over time."

117. sections/2_related_work/a_longitudinal_analysis.tex:3 (7 sentences; two ideas, stacked CNNs and Siamese networks)
Passage: "While the approach is relatively simple to implement, it has been shown to not fully explore the relationship between time points \citep{dammuDeepLearningPrediction2023}. Studies investigating treatment effects have therefore increasingly employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
Replacement:
"Stacking is straightforward to implement, but it does not exploit the relationship between time points \citep{dammuDeepLearningPrediction2023}.

Studies investigating treatment effects have therefore employed Siamese networks \citep{jin2021predicting, dammuDeepLearningPrediction2023}."
Also breaks: the prose standard, section A ("simple", "relatively", "increasingly").

118. sections/2_related_work/a_longitudinal_analysis.tex:5 (7 sentences; two ideas, what hybrid models are and where they have been applied)
Passage: "Compared to the aforementioned approaches, hybrid models can handle patient records of varying time points, making them especially suited for the continued surveillance of patients at high-risk of disease or after the onset of treatment. As such, they have been successfully employed in response prediction to radiotherapy \citep{leeDeepLearningDriven2022, wangPredictingEvolutionLung2019, wangPredictingSpatialEsophageal2020, xuDeepLearningPredicts2019} and endothelial therapy \citep{luDeepLearningPrediction2021} as well as in breast cancer risk prediction \citep{dadsetanDeepLearningLongitudinal2022}."
Replacement:
"Unlike stacked CNNs and Siamese networks, hybrid models handle patient records with any number of time points. They suit the surveillance of patients at high risk of disease or after the onset of treatment.

Hybrid models have been used in response prediction to radiotherapy \citep{leeDeepLearningDriven2022, wangPredictingEvolutionLung2019, wangPredictingSpatialEsophageal2020, xuDeepLearningPredicts2019} and endothelial therapy \citep{luDeepLearningPrediction2021}, and in breast cancer risk prediction \citep{dadsetanDeepLearningLongitudinal2022}."
Also breaks: the prose standard, section A ("especially"); the prose standard, section E (the first sentence has 34 words).

119. sections/2_related_work/b_pretraining.tex:3 (6 sentences; two ideas, the contrastive principle and two longitudinal studies)
Passage: "As such, they randomly derive different views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points and learn rich contextual feature embeddings by matching the view's embedded representation to the one obtained with the other part of a Siamese network or a momentum encoder \citep{grillBootstrapYourOwn2020}. \cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained a Siamese CNN on baseline and follow-up image pairs by minimizing the distance between view pairs from the same patient and maximizing the distance between images from different patients."
Replacement:
"These approaches derive random views from the same input image \citep{chenSimpleFrameworkContrastive2020} or from the same patient at different time points. They learn feature embeddings by matching one view's representation to the representation from a Siamese network's other branch or a momentum encoder \citep{grillBootstrapYourOwn2020}.

\cite{jamaludinSelfsupervisedLearningSpinal2017} pre-trained a Siamese CNN on baseline and follow-up image pairs. Their loss minimized the distance between view pairs from the same patient and maximized the distance between images from different patients."

120. sections/3_methodology/d_pretraining.tex:8 (8 sentences; two ideas, the crops and the MRI-specific augmentation)
Passage: "Note that in our implementation, we use a 3D crop of shape $s = 72^3$ for the global and $s = 48^3$ for the local views. Besides that, our implementation also proposes a novel augmentation strategy specific to MR images."
Replacement (both sentences as in entries 85 and 86):
"Global views were cropped at shape $s = 72^3$ and local views at $s = 48^3$.

We also proposed an augmentation strategy specific to MR images."
The second part has six sentences, so a further split falls before "For a view cropped from a Diffusion-Weighted MRI (DW-MRI), we randomly sample one series among the diffusion coefficients $b \in \{0, 150, 400, 800\}$; for dynamic contrast-enhanced T1-weighted MRIs (T1 DCE-MRI) we sample among the pre- and post-contrast phases; and for the combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI) we sample within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)." That sentence has 82 words. Its replacement:
"One series was sampled per view as follows:
- Diffusion-Weighted MRI (DW-MRI): one of the diffusion coefficients $b \in \{0, 150, 400, 800\}$.
- Dynamic contrast-enhanced T1-weighted MRI (T1 DCE-MRI): one of the pre- and post-contrast phases.
- The combined T1 in- and out-of-phase and T2-weighted modality (T1 IOP \& T2-MRI): one series within a single contrast family (the in- and out-of-phase series, or the short- and long-echo T2 series)."

121. sections/4_experiments/a_data.tex:1 (6 sentences; two ideas, the cohort and the complete set of sequences)
Passage: "Prior to pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing. All examinations included in the study comprise the complete set of imaging sequences, such that the diffusion-weighted, the dynamic contrast-enhanced T1-weighted, and the combined T1 in- and out-of-phase and T2-weighted modality groups are available for every patient."
Replacement:
"Before pre-training and fine-tuning, MR images were anonymized and resampled to 1.5x1.5x1.5mm voxel spacing.

Every examination in the study contained the complete set of imaging sequences. The diffusion-weighted, dynamic contrast-enhanced T1-weighted, and combined T1 in- and out-of-phase and T2-weighted modality groups were therefore available for every patient."

122. sections/4_experiments/a_data.tex:3 (9 sentences; three ideas: the fine-tuning cohort, the fold construction, the leakage control)
Passage: "During fine-tuning we additionally exclude all patients without a definitive diagnosis of HCC yielding a total of 243 patients of which 37 develop HCC (i.e., 703 and 101 total MRI examinations respectively). To obtain robust performance estimates despite the limited number of positive cases, we evaluate HCCNet using stratified 5-fold cross-validation rather than a single hold-out split."
Replacement:
"For fine-tuning, patients without a definitive diagnosis were excluded, leaving 243 patients, of whom 37 developed HCC (703 and 101 MRI examinations respectively).

Because the cohort has 37 positive cases, HCCNet was evaluated with stratified 5-fold cross-validation rather than a single hold-out split."
A second split falls between "Each fold serves as the held-out test set $D^{\text{test}}_p$ exactly once, while the remaining four folds form the development set $D^{\text{dev}}_p$ that is used for both pre-training and fine-tuning." and "The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) is repeated independently for each fold using only the data of its development set." Replacement:
"Each fold served once as the held-out test set $D^{\text{test}}_p$, and the remaining four folds formed the development set $D^{\text{dev}}_p$ for pre-training and fine-tuning.

The full modeling pipeline (self-supervised pre-training of the CNN backbone and Transformer encoder, fine-tuning, and baseline training) was repeated for each fold on that fold's development set only."
Also breaks: the prose standard, section A ("robust" is not the most precise word here; "approximately" in the following sentence is given by "7--8").

123. sections/4_experiments/b_implementation.tex:9 (5 sentences)
Passage: "Concretely, we evaluate the full fusion of all three modality groups (DW-MRI, T1 DCE-MRI, and T1 IOP \& T2-MRI; twelve input channels) as well as the two pairings that include the strongest single modality, namely DW-MRI + T1 DCE-MRI and DW-MRI + T1 IOP \& T2-MRI (eight input channels each). As during single-modality pre-training, augmentation views are sampled within a single contrast family."
Replacement:
"Three configurations were evaluated:
- the full fusion of DW-MRI, T1 DCE-MRI and T1 IOP \& T2-MRI (twelve input channels);
- DW-MRI + T1 DCE-MRI (eight input channels);
- DW-MRI + T1 IOP \& T2-MRI (eight input channels).

As in single-modality pre-training, augmentation views were sampled within a single contrast family."
Also breaks: the prose standard, section D (three items in paragraph form); the prose standard, section E (the sentence has 49 words).

124. sections/4_experiments/c_evaluation.tex:1 (5 sentences; two ideas, the ensemble and the metrics)
Passage: "Every reported metric is computed on this per-fold ensemble prediction, and we report its mean and standard deviation across the five cross-validation folds. For evaluation, we employ the following performance metrics: accuracy, precision, recall, F1-score, area under the receiver operating characteristic (AUROC), and area under the precision-recall curve (AUPRC)."
Replacement:
"Every reported metric was computed on this per-fold ensemble prediction and is given as the mean and standard deviation across the five folds.

The performance metrics were the following: accuracy, precision, recall, F1-score, area under the receiver operating characteristic curve (AUROC) and area under the precision-recall curve (AUPRC)."

125. sections/4_experiments/d_results.tex:19 (7 sentences; two ideas, the fine-tuned and the baseline calibration)
Passage: "Figure \ref{fig:calibration} shows consistently lower expected calibration errors among models fine-tuned using diffusion weighted MR images and the highest expected calibration errors among models fine-tuned on dynamic contrast enhanced T1-weighted MRIs, with the combined T1 in- and out-of-phase and T2-weighted MRIs falling in between. For the randomly initialized baseline, however, the expected calibration error does not display the same negative relationship with model performance."
Replacement (second sentence as in entry 104):
"Among fine-tuned models, the expected calibration error was lowest for diffusion weighted MR images, highest for dynamic contrast enhanced T1-weighted MRIs and in between for the combined T1 in- and out-of-phase and T2-weighted MRIs.

For the randomly initialized baseline, however, the expected calibration error did not show the same negative relationship with model performance."
Also breaks: the prose standard, section A ("consistently").

126. sections/6_conclusion/conclusion.tex:1 (8 sentences; three ideas: findings, adaptation to other diseases, future work)
Passage: "The methodology is versatile and offers a framework for other longitudinal medical imaging applications where patient monitoring can lead to better outcomes. Yet, each condition presents its own unique challenges in terms of disease progression and imaging characteristics, which will require further adaptation of the HCCNet framework."
Replacement:
"The methodology may serve other longitudinal medical imaging applications where patient monitoring can lead to better outcomes.

Each condition differs in disease progression and imaging characteristics, which will require adaptation of the HCCNet framework."
A further split falls before "In the future, we therefore plan to validate our findings on an external validation cohort and aim to incorporate multi-modal data to further improve upon our results." Its replacement: "We plan to validate our findings on an external cohort and to add multi-modal data."
Also breaks: references/rules.md, "Hedging" ("versatile" and "offers" claim adaptation that was not tested).

127. sections/appendix/b_additional_results/2_reliability.tex:3 (6 sentences; two ideas, baseline and fine-tuned reliability)
Passage: "That is despite that baseline models trained using diffusion weighted MRIs show the best average discriminatory power between patients of low and high risk of HCC. Contrarily, for the fine-tuned models, preceding pre-training establishes a negative relationship between performance and reliability metrics."
Replacement:
"Baseline models trained on diffusion weighted MRIs nonetheless showed the best average discrimination between patients of low and high risk of HCC.

For the fine-tuned models, pre-training produced a negative relationship between performance and calibration error."

================================================================
GROUP 15. The prose standard, section F (no hard wrapping)
No claim changes. Each line break inside a paragraph shows up as a change of its own in a diff. Example: sections/6_conclusion/ack.tex:6.

128. sections/6_conclusion/ack.tex:6
Passage: "...(OpenAI ChatGPT) to help / refine the English language..."
Replacement: "(OpenAI ChatGPT) to help refine the English language"

129. sections/6_conclusion/ack.tex:7
Passage: "...the authors reviewed and edited the / content as needed..."
Replacement: "the authors reviewed and edited the content as needed"

130. sections/6_conclusion/ack.tex:2
Passage: "...op basis van MRI-radiomics / Primair leverkanker..."
Replacement: "op basis van MRI-radiomics Primair leverkanker"

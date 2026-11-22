# Literature review: ECG representation families for label-free SR-versus-AF clustering

## 1. Search strategy

```
Screened from the manuscript's .bib:
- Entries scanned: 21
- Included: 21 entries: clifford2017af, clocs2021, dechazal2004, ecgfounder2024, fedavg2017, hdbscan2013, hrvstandards1996, hubertarabie1985, hubertecg2024, lookingbeyond2026, mehari2022ssl, mitbih2001, neurokit2021, physionet2000, ptbxl2020, rousseeuw1987, sklearn2011, sslclustering2025, threekg2021, vinh2010, wavelettensorecg2018
- Excluded by the criteria: 0 entries
- Skipped (the criteria cannot be applied): 0 entries
- Note: presence in the .bib does not imply inclusion; the same criteria applied to the .bib and to external sources.
```

Research question, from config.md: which ECG representation family (raw whole-recording flattening, a convolutional reconstruction autoencoder, compact hand-crafted rhythm and morphology features, or frozen foundation-model embeddings) gives label-free clusters that recover SR-versus-AF structure on PTB-XL, under chance-corrected, patient-grouped evaluation bounded by a supervised ceiling, and which representation stays robust under heavy class imbalance and under federation across heterogeneous sites.

Discipline: Biomedical engineering, sub-field biomedical signal processing. Language: English. Paper type: IMRaD. Domain evidence profile: cs_ml. The profile fits the discipline (Engineering), so no mismatch is reported.

Primary concepts: (A) electrocardiogram; (B) unsupervised clustering; (C) representation (foundation-model embedding, autoencoder, hand-crafted features); (D) atrial fibrillation or arrhythmia. Secondary concepts, added from the research question and from the referee comments in admin/reviews/reviewer-comments.md: clustering validation (adjusted Rand index, adjusted mutual information, silhouette), effect sizes and the bootstrap, federated learning and federated clustering under non-IID data, multi-class 12-lead datasets, and compute cost.

Indexes: every search queried Crossref, OpenAlex, Semantic Scholar and arXiv through lookup.py. The table names the indexes each call left out, with the reason lookup.py printed. "429" stands for "left out, HTTP 429 after 3 retries"; "not found" means the index returned no record.

All searches were run on 2026-11-15 with `--limit 100`.

| Id | Layer | Search string | Records | Indexes left out |
|---|---|---|---|---|
| p1_l1 | 1 | ("electrocardiogram" OR "ECG") AND ("clustering" OR "unsupervised") AND ("representation" OR "embedding" OR "foundation model" OR "autoencoder" OR "self-supervised") AND ("atrial fibrillation" OR "arrhythmia") | 205 | Semantic Scholar (429) |
| p1_l1b | 1 | ("ECG" OR "electrocardiogram") AND ("clustering") AND ("foundation model" OR "self-supervised" OR "hand-crafted features" OR "autoencoder") AND ("PTB-XL" OR "atrial fibrillation" OR "MIT-BIH") | 198 | Semantic Scholar (not found), arXiv (not found) |
| t1_fm | 1 | ("ECG foundation model" OR "electrocardiogram foundation model") AND ("benchmark" OR "linear probing" OR "frozen embeddings") | 197 | Semantic Scholar (429) |
| t2_clu | 1 | ("ECG" OR "electrocardiogram") AND ("unsupervised clustering" OR "cluster analysis") AND ("arrhythmia" OR "heartbeat" OR "atrial fibrillation") | 194 | Semantic Scholar (429), arXiv (not found) |
| t3_val | 1 | ("clustering validation" OR "cluster validity" OR "comparing clusterings") AND ("adjusted Rand index" OR "silhouette" OR "mutual information") | 225 | Semantic Scholar (429) |
| t4_fedclu | 1 | ("federated clustering" OR "federated k-means") AND ("non-IID" OR "heterogeneous") | 207 | Semantic Scholar (429) |
| t5_fedecg | 1 | ("federated learning") AND ("ECG" OR "electrocardiogram") AND ("arrhythmia" OR "atrial fibrillation") | 105 | OpenAlex (429), Semantic Scholar (429) |
| t6_mc | 1 | ("12-lead ECG" OR "12-lead electrocardiogram") AND ("database" OR "dataset") AND ("multi-label" OR "multi-class") AND ("arrhythmia" OR "rhythm") | 104 | OpenAlex (429), Semantic Scholar (429) |
| t7_eff | 1 | ("effect size" OR "Cliff's delta") AND ("statistical comparison" OR "classifiers" OR "machine learning") | 200 | OpenAlex (429), Semantic Scholar (429) |
| t8_af | 1 | ("atrial fibrillation detection") AND ("RR interval" OR "heart rate variability" OR "P-wave") AND ("features") | 106 | OpenAlex (429), Semantic Scholar (429) |
| t9_sep | 1 | ("linear probing" OR "linear separability") AND ("clustering" OR "k-means") AND ("self-supervised representations") | 105 | OpenAlex (429), Semantic Scholar (not found) |
| t10_cost | 1 | ("ECG" OR "electrocardiogram") AND ("foundation model" OR "deep learning") AND ("inference time" OR "computational cost" OR "edge deployment") | 130 | OpenAlex (429), Semantic Scholar (429) |
| t11_imb | 1 | ("adjusted Rand index" OR "external cluster validity") AND ("imbalanced" OR "unbalanced clusters" OR "cluster size") | 102 | OpenAlex (429), Semantic Scholar (429) |
| t12_ds | 1 | ("PhysioNet Computing in Cardiology Challenge 2020" OR "Chapman" OR "CPSC 2018" OR "Georgia") AND ("12-lead ECG") AND ("classification") | 105 | OpenAlex (429), Semantic Scholar (429) |
| l4_rq | 4 | The research question above, as one sentence | 29 | OpenAlex (429), Semantic Scholar (429), arXiv (not found) |
| l4_short | 4 | unsupervised clustering of ECG representations hand-crafted features versus foundation model embeddings for atrial fibrillation | 100 | OpenAlex (429), Semantic Scholar (not found), arXiv (not found) |
| l4_sep | 4 | linear probe accuracy versus k-means clustering of self-supervised representations separability clusterability | 100 | OpenAlex (429), Semantic Scholar (429), arXiv (not found) |
| p2_l1 | 1 (pass 2) | ("electrocardiogram" OR "ECG") AND ("clustering" OR "unsupervised") AND ("foundation model" OR "self-supervised" OR "hand-crafted features") AND ("atrial fibrillation" OR "arrhythmia") | 104 | 1 record not seen in pass 1 |
| p2_l4 | 4 (pass 2) | benchmark of ECG representations for unsupervised clustering of atrial fibrillation with hand-crafted features and foundation model embeddings | 100 | 6 records not seen in pass 1 |
| g_recent | currency gate | ("ECG foundation model" OR "electrocardiogram foundation model" OR "ECG representation learning") AND ("embedding" OR "clustering" OR "unsupervised" OR "federated") | 112 | OpenAlex (429), Semantic Scholar (not found) |

p1_l1 filled the 100 records of an index and was tightened into p1_l1b, as layer 1 asks. No NOT term was needed, since no string returned fewer than 20 records except l4_rq, which is a layer 4 sentence search and was complemented by l4_short and l4_sep.

Layer 2, citation chaining (`lookup.py refs`), on the core papers of layer 1: Filice et al. 2026 (arXiv 2601.21830, 37 records), Taleshinosrati et al. 2026 (arXiv 2608.03597, 69), Al-Masud et al. 2025 (arXiv 2509.25095, 58), Berger et al. 2026 (arXiv 2602.17531, 100, more exist), Strodthoff et al. 2021 (doi 10.1109/jbhi.2020.3022989, 70), McKeen et al. 2025 (doi 10.1093/jamiaopen/ooaf122, 29), and Nezamabadi et al. 2023 (doi 10.1109/rbme.2022.3154893, 0 records, Semantic Scholar not found). In all, 363 records. Works in the references of 3 or more core papers were marked must include: PTB-XL (Wagner et al. 2020, in 4), ST-MEM (Na et al. 2024), ECG-FM (McKeen et al. 2025), Strodthoff et al. 2021, ECGFounder (Li et al.), Hannun et al. 2019, Ribeiro et al. 2020, I-JEPA (Assran et al.) and MAE (He et al.). Each was screened; the outcome is in section 3.

Layer 3, forward tracking (`lookup.py cited-by`), on the foundational works. Semantic Scholar printed "first 100, more exist", which is read as 100 or more citing works, for: ST-MEM (2402.09450), Hubert and Arabie 1985, Rousseeuw 1987, the HRV standards 1996, de Chazal et al. 2004, Campello et al. 2013, McMahan et al. 2017 (1602.05629), Pedregosa et al. 2011 (1201.0490), PTB-XL, Strodthoff et al. 2021, Moody and Mark 2001, Steinley 2004, Cliff 1993, Efron 1979, Kerby 2014, Romano et al. 2015 (1512.01286), Li et al. 2025 (NEJM AI) and Hannun et al. 2019. ECGFounder on arXiv (2410.04133) has 43 citing records, 41 from 2024 to 2026; HuBERT-ECG (10.1101/2024.11.14.24317328) has 36, 33 from 2024 to 2026. Every foundational work with a listing has citing works in the last 3 years, so none is marked possibly outdated. In all, 1,779 citing records.

Layer 4, semantic search: l4_rq, l4_short and l4_sep in pass 1, and p2_l4 in pass 2.

Passes and stopping. Two passes were run. After pass 2 the five conditions stand as follows. (1) The source count of 55 meets the IMRaD minimum of 20: holds. (2) The latest search added fewer than 10 percent: p2_l1 added 1 record not seen before (99 percent overlap) and p2_l4 added 6 (94 percent overlap, saturated by the layer 4 rule): holds. (3) Every theme of the matrix has at least 3 sources: holds. (4) The citation loop closes: every work that chaining marked must include was collected and screened: holds. (5) The temporal span runs from foundational works (1979, 1985, 1987) to work of 2026: holds. The search ended after pass 2 with 5 of 5 conditions holding.

Criteria. Publication type: peer-reviewed journals, books, chapters and conference proceedings, and under cs_ml also archival preprints (arXiv, medRxiv), each tagged by its evidence type. Date range: 2016 to 2026, and seminal works outside it when they are foundational and cited more than 100 times by the cited-by listing. Language: English. Relevance: the abstract addresses at least one aspect of the research question. The three gates of every profile apply: relevance, no fatal design flaw, not predatory or fabricated.

## 2. Distribution advisory

No distribution advisory triggered.

Counts over the 66 included sources: time, sources from 2020 to 2026 are 45 of 66 (68 percent); venue, preprints are 21 of 66 (32 percent), and no single journal or conference family holds more than 4; method, computational methods and benchmarks are the largest group at 37 of 66 (56 percent). Geography is left out, since most sources state no study site.

## 3. Screening results

- Initial records: 2,728 search records over 20 searches (repeats included), 363 reference records and 1,779 citing records; 3,824 unique titles after removal of records that share a DOI or an arXiv ID.
- After title and abstract screening: 47 external candidates went to the full-text stage, besides the 21 entries of the manuscript's .bib.
- After full-text assessment: 34 external sources included and 13 excluded. The 21 .bib entries were all included.
- The search for the sections of the outline that need literature (section 11) added 11 external sources, screened under the same criteria.
- Final set: 66 sources (21 from the .bib, 45 external).

Exclusions at the full-text stage, each with the node that decided it:

| Source | Reason |
|---|---|
| Tateno and Glass 2001, AF detection from RR intervals | No abstract and no text could be read; the criteria could not be applied to content (node 4) |
| Petrenas et al. 2015, AF detection | No abstract and no text could be read (node 4) |
| Luz et al. 2016, ECG heartbeat classification survey | No abstract and no text could be read (node 4) |
| Meila 2007, comparing clusterings by variation of information | No abstract and no text could be read (node 4) |
| Assran et al., I-JEPA | Vision only, no ECG content (node 3) |
| He et al., masked autoencoders | Vision only, no ECG content (node 3) |
| Hannun et al. 2019, cardiologist-level arrhythmia detection | Supervised single-lead classifier; background only for this question (node 3) |
| Ribeiro et al. 2020, automatic diagnosis of the 12-lead ECG | Supervised classifier; background only (node 3) |
| Li et al. 2025, ECGFounder in NEJM AI | The same work as ecgfounder2024, already included (duplicate) |
| Tan et al., Icentia11k | Single-lead beat dataset; it does not address the PTB-XL rhythm task or the multi-class 12-lead cohorts the question needs (node 3) |
| Kairouz et al. 2021, advances in federated learning | General federated learning overview; Rieke et al. 2020 and the federated clustering sources cover the question's federation aspect directly (node 3) |
| CLEF 2025 (arXiv 2512.02180), clinically guided contrastive pretraining | Single-lead pretraining with supervised downstream tasks; it is evaluated within FOUND-AF, which is included (node 3) |
| Demsar 2006, statistical comparisons of classifiers | No record returned by any index, so it could not be screened (node 4) |

Peer-reviewed share: 45 of 66 sources (68 percent) are peer-reviewed by their entry, and 21 are preprints. Under cs_ml the preprints count toward the share, so the gate passes.

## 4. Annotated bibliography

### Filice et al. (2026). Looking Beyond Accuracy: A Holistic Benchmark of ECG Foundation Models.
- **Type**: Preprint (arXiv), computational benchmark
- **Method**: Benchmark of six ECG-expert foundation models (ECG-FM, ECGFounder, three HuBERT-ECG sizes, ECG-JEPA) over four datasets (Georgia, CODE-15%, PTB-XL, Chapman-Shaoxing plus Ningbo) for two labels, conduction disturbance (CD) and AF. Downstream classifiers are trained on the frozen embeddings at four data sizes, and a representation analysis adds SHAP feature ranking, UMAP views and three embedding metrics: kNN agreement, centroid separation and the ARI of Gaussian mixture clusters, each computed against the clinical label and against dataset membership.
- **Key results**: ECGFounder and ECG-FM have the higher label-level and the lower dataset-level separability; for AF, the label-level ARI is 0.70 for ECGFounder and 0.64 for ECG-FM, against 0.00 to 0.04 for the HuBERT-ECG sizes and 0.00 for ECG-JEPA (Table 4). HuBERT-ECG and ECG-JEPA organise by dataset rather than by label, ECG-JEPA most strongly (dataset-level ARI 0.98 for CD and 1.00 for AF). AF is not evaluated on PTB-XL (Table 2), and the authors find PTB-XL the hardest dataset to embed.
- **Relevance**: The closest prior study to the question: it scores frozen ECG embeddings by ARI of unsupervised clusters against the AF label, without hand-crafted features, without MIT-BIH, and without a supervised ceiling paired with the clustering on one split.
- **Quality**: Medium (11): directly relevant, four datasets; a preprint, and the text states no interval for the ARI values and no patient grouping.
- **Stance**: Supports the paper's position that embedding geometry, beyond probe accuracy, needs evaluation.
- **Potential use**: Introduction, Literature Review, Discussion
- **BibTeX**: already in the .bib

### Coppola et al. (2024). HuBERT-ECG: a self-supervised foundation model for broad and scalable cardiac applications.
- **Type**: Preprint (medRxiv), model paper
- **Method**: Self-supervised pretraining of a transformer foundation model on 9.1 million 12-lead ECGs covering 164 conditions, with fine-tuning for downstream tasks.
- **Key results**: AUROCs from 84.3 percent in low-data settings to 99 percent in large-scale settings; above 90 percent for 140 of 164 conditions trained jointly; AUROC 93.4 percent for death within 2 years. Models and code are released.
- **Relevance**: One of the frozen foundation-model encoders the question compares.
- **Quality**: High (13): very large pretraining set, released weights; a preprint whose results are reported under fine-tuning, not under frozen clustering.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Li et al. (2024). An Electrocardiogram Foundation Model Built on over 10 Million Recordings with External Evaluation across Multiple Domains.
- **Type**: Preprint (arXiv); the same work is published in NEJM AI (Li et al. 2025, doi 10.1056/aioa2401033)
- **Method**: ECGFounder, a model trained with expert annotations on over 10 million ECGs with 150 label categories from the Harvard-Emory ECG Database, extended to lower-lead and single-lead ECGs and evaluated externally across domains.
- **Key results**: The model is designed as an out-of-the-box diagnostic model and as a backbone to fine-tune; the abstract reports its extension to arbitrary single-lead ECGs and external evaluation. FOUND-AF later finds it the strongest of nine frozen encoders for AF detection.
- **Relevance**: A frozen foundation-model encoder for the comparison; pretrained with supervision, which bears on how "label-free" its embeddings are.
- **Quality**: High (13): large scale and external evaluation; the entry cites the preprint rather than the journal version.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Lunelli et al. (2026). BenchECG and xECG: a benchmark and baseline for ECG foundation models.
- **Type**: Journal article (npj Digital Medicine), computational benchmark
- **Method**: A standardised benchmark of public ECG datasets and tasks; models evaluated by fine-tuning and by linear probing over five seeds, with an xLSTM model trained by SimDINOv2 as a new baseline.
- **Key results**: xECG achieves the best BenchECG score of the publicly available models and is the only one to perform strongly on all datasets and tasks. Rankings are reported separately for fine-tuning and linear probing.
- **Relevance**: Defines how frozen ECG encoders are compared under supervised probes, the protocol that the paper's supervised ceiling parallels.
- **Quality**: High (13): Q1 journal, repeated seeds, broad task set.
- **Stance**: Neutral; it supports standardised evaluation.
- **Potential use**: Literature Review, Methodology
- **BibTeX**: new entry Lunelli_2026

### Al-Masud et al. (2025). Benchmarking ECG FMs: A Reality Check Across Clinical Tasks.
- **Type**: Preprint (arXiv), computational benchmark
- **Method**: Eight ECG foundation models on 26 tasks from 12 public datasets (1,650 targets), under fine-tuning and frozen settings, with scaling analyses and an efficiency benchmark of GFLOPs, GPU memory and inference speed.
- **Key results**: Three foundation models outperform supervised baselines in adult ECG interpretation, and ECG-CPC, a compact state-space model, leads 5 of 7 task categories, so architecture matters more than scale. Label efficiency improves 3.3 to 9 times; models with similar performance learn different internal structures.
- **Relevance**: Evidence on frozen-embedding quality and on compute cost across encoders, both asked for by the referees.
- **Quality**: Medium (11): broad and reproducible design; a preprint with supervised evaluation only.
- **Stance**: Supports the view that encoder scale alone does not decide representation quality.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry arxiv_2509_25095

### Taleshinosrati et al. (2026). FOUND-AF: Benchmarking ECG Foundation Models for Atrial Fibrillation Detection.
- **Type**: Preprint (arXiv), computational benchmark
- **Method**: Nine frozen foundation models from five families (HuBERT-ECG, CLEF, ST-MEM, ECG-JEPA, ECGFounder) on AFDB, CinC2017, CPSC2021 and LTAFDB with standardised preprocessing, a fixed XGBoost classifier, recording-level grouped cross-validation, paired bootstrap comparisons with Holm correction, embedding visualization and computational profiling.
- **Key results**: ECGFounder gives the strongest overall AF detection and a favourable trade-off between accuracy, model size, inference time and memory. The authors note that earlier studies used different datasets, preprocessing, classifiers and validation protocols.
- **Relevance**: The supervised counterpart of the question on the same AF task, with leakage control, bootstrap statistics and compute cost.
- **Quality**: Medium (11): rigorous leakage-controlled design; a preprint, supervised probe only.
- **Stance**: Supports grouped evaluation and cost reporting.
- **Potential use**: Literature Review, Methodology, Discussion
- **BibTeX**: new entry arxiv_2608_03597

### Berger et al. (2026). Position: Evaluation of ECG Representations Must Be Fixed.
- **Type**: Preprint (arXiv), position paper with experiments
- **Method**: Five ECG pretraining approaches evaluated across six settings: PTB-XL, CPSC2018 and CSN, a structural disease dataset, hemodynamic inference and patient forecasting, under evaluation practice for multi-label imbalanced data.
- **Key results**: The field relies on three multi-label benchmarks dominated by arrhythmia and morphology labels. Applying best practice for imbalanced multi-label evaluation changes which representation ranks best, and a randomly initialized encoder with linear evaluation matches pretraining on many tasks.
- **Relevance**: Grounds the paper's use of baselines (raw flattening, a supervised ceiling) and of imbalance-aware metrics.
- **Quality**: Medium (11): six settings and released code; a position preprint.
- **Stance**: Supports the paper's evaluation design.
- **Potential use**: Introduction, Methodology, Discussion
- **BibTeX**: new entry arxiv_2602_17531

### McKeen et al. (2025). ECG-FM: an open electrocardiogram foundation model.
- **Type**: Journal article (JAMIA Open), model paper
- **Method**: A transformer pretrained with a hybrid contrastive and generative self-supervised objective on 1.5 million ECGs, evaluated on LVEF prediction and interpretation labels with a released MIMIC-IV-ECG benchmark, data scaling, latent space analysis and saliency maps.
- **Key results**: ECG-FM outperforms task-specific models in small to medium data regimes and generalizes across datasets, with AUROC 0.996 for atrial fibrillation and 0.929 for LVEF at or below 40 percent. Weights and code are open.
- **Relevance**: An open-weight foundation-model encoder with a latent space analysis, a candidate for the "other FMs" the referees request.
- **Quality**: High (12): open weights, external datasets; supervised downstream evaluation.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry McKeen_2025

### Na et al. (2024). Guiding Masked Representation Learning to Capture Spatio-Temporal Relationship of Electrocardiogram.
- **Type**: Preprint (arXiv), model paper
- **Method**: ST-MEM, masked reconstruction of 12-lead ECG designed to learn spatio-temporal features, evaluated on arrhythmia classification and lead combinations.
- **Key results**: ST-MEM outperforms other self-supervised baselines on arrhythmia classification and adapts to different lead combinations; analyses show spatio-temporal relationships in the learned features. Code is released.
- **Relevance**: A reconstruction-based foundation model, the family closest to the paper's convolutional autoencoder.
- **Quality**: High (12): widely chained (cited by 100 or more), code released; a preprint entry.
- **Stance**: Neutral
- **Potential use**: Literature Review, Methodology
- **BibTeX**: new entry arxiv_2402_09450

### Kim (2024). Learning General Representation of 12-Lead Electrocardiogram with a Joint-Embedding Predictive Architecture.
- **Type**: Preprint (arXiv), model paper
- **Method**: ECG-JEPA, masked modelling in latent space with a cross-pattern attention mechanism for 12-lead ECG, trained on about 180,000 samples from open datasets.
- **Key results**: Predicting in latent space avoids reconstructing noise and the limits of an L2 loss on raw signals, and the model reports state-of-the-art results in diagnostic classification, feature extraction and segmentation.
- **Relevance**: A latent-prediction foundation model, a further encoder family for the comparison.
- **Quality**: Medium (9): single author, preprint; results reported on supervised tasks.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: new entry arxiv_2410_08559

### Han et al. (2024). A Systematic Review on Foundation Models for Electrocardiogram Analysis: Initial Strides and Expansive Horizons.
- **Type**: Preprint (arXiv), systematic review
- **Method**: Review of ECG foundation models: architectures, pretraining paradigms and adaptation strategies.
- **Key results**: It maps the landscape of ECG foundation models and examines their strengths, limitations and clinical potential.
- **Relevance**: Background on the encoder family; it frames which foundation models exist for the comparison.
- **Quality**: Medium (9): review, secondary evidence, preprint.
- **Stance**: Neutral
- **Potential use**: Introduction, Literature Review
- **BibTeX**: new entry arxiv_2410_19877

### Wan et al. (2025). OpenECG: Benchmarking ECG Foundation Models with Public 1.2 Million Records.
- **Type**: Preprint (arXiv), computational benchmark
- **Method**: SimCLR, BYOL and MAE with ResNet-50 and Vision Transformer backbones pretrained on 1.2 million 12-lead ECGs from nine centres, assessed by leave-one-dataset-out experiments and data scaling.
- **Key results**: Pretraining on diverse datasets improves generalization; BYOL and MAE outperform SimCLR, and their performance saturates at about 60 to 70 percent of the data. Public data can match proprietary data for training foundation models.
- **Relevance**: Shows that site heterogeneity changes what an encoder learns, which bears on the federated arm.
- **Quality**: Medium (9): nine centres; preprint, supervised evaluation.
- **Stance**: Neutral
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2503_00711

### Xu et al. (2025). An Electrocardiogram Multi-Task Benchmark with Comprehensive Evaluations and Insightful Findings.
- **Type**: Chapter (MEDINFO 2025 proceedings); text read in its arXiv version
- **Method**: Language, general time-series and ECG foundation models compared with time-series deep learning models across several ECG tasks.
- **Key results**: General time-series and ECG foundation models achieve a top performance rate of 80 percent; the study discusses the limitations and potential of foundation models for physiological waveforms. Data and code are public.
- **Relevance**: Places ECG foundation models against other model families, the comparison the referees ask for with other FMs.
- **Quality**: Medium (10): peer-reviewed proceedings, public code; supervised tasks only.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: new entry Xu_2025

### Liu et al. (2024). Zero-Shot ECG Classification with Multimodal Learning and Test-time Clinical Knowledge Enhancement.
- **Type**: Preprint (arXiv), model paper
- **Method**: MERL, multimodal learning on ECG records and their reports, with prompts enhanced by clinical knowledge at test time; benchmarked across six public ECG datasets.
- **Key results**: Zero-shot classification reaches an average AUC of 75.2 percent without training data, 3.2 points above linear-probed self-supervised methods given 10 percent of labels.
- **Relevance**: A label-free route to class structure that differs from clustering, and a further foundation model for the comparison.
- **Quality**: High (12): six datasets, code released; preprint entry.
- **Stance**: Neutral
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2403_06659

### Strodthoff et al. (2021). Deep Learning for ECG Analysis: Benchmarks and Insights from PTB-XL.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics), benchmark
- **Method**: Benchmarking of deep and feature-based classifiers on PTB-XL tasks (statement prediction, age and sex, signal quality) and on ICBEB2018, with analyses of hidden stratification, uncertainty and interpretability.
- **Key results**: ResNet- and Inception-based convolutional networks show the strongest performance on all tasks and outperform feature-based algorithms by a large margin. The paper establishes PTB-XL as a structured benchmark with recommended folds.
- **Relevance**: The supervised reference on PTB-XL, which informs the paper's supervised ceiling.
- **Quality**: High (14): Q1 journal, standard benchmark, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Strodthoff_2021

### Kiyasseh et al. (2021). CLOCS: Contrastive Learning of Cardiac Signals Across Space, Time, and Patients.
- **Type**: Conference paper (ICML)
- **Method**: A family of contrastive methods that treat representations across space, time and patients as positives; linear evaluation and fine-tuning.
- **Key results**: CLOCS outperforms BYOL and SimCLR under linear evaluation and fine-tuning, generalizes with 25 percent of labels, and yields patient-specific representations usable for patient similarity.
- **Relevance**: Patient-level structure in learned representations bears on patient-grouped evaluation.
- **Quality**: High (12): top venue; supervised linear evaluation only.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: already in the .bib

### Gopal et al. (2021). 3KG: Contrastive Learning of 12-Lead Electrocardiograms using Physiologically-Inspired Augmentations.
- **Type**: Conference paper (ML4H)
- **Method**: Contrastive learning with 3D vectorcardiographic augmentations; linear evaluation on 23-class diagnosis of PhysioNet 2020.
- **Key results**: 9.1 percent higher mean AUC than the best self-supervised baseline with 1 percent of labels; the largest gains are for conduction and rhythm abnormalities.
- **Relevance**: Rhythm-sensitive self-supervised features, related to the AF task.
- **Quality**: Medium (11): workshop-level venue, single dataset.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: already in the .bib

### Mehari and Strodthoff (2022). Self-supervised representation learning from 12-lead ECG data.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: Instance discrimination and latent forecasting methods adapted to ECG; linear evaluation on a clinical ECG classification task and comparison of fine-tuned classifiers with supervised training.
- **Key results**: It presents the first comprehensive assessment of self-supervised learning on clinical 12-lead ECG; an adaptation of contrastive predictive coding performs best.
- **Relevance**: Establishes linear evaluation as the standard test of ECG representations, which the paper contrasts with clustering.
- **Quality**: High (13): Q1 journal, systematic comparison.
- **Stance**: Neutral
- **Potential use**: Literature Review, Methodology
- **BibTeX**: already in the .bib

### Weng et al. (2025). Clustering Properties of Self-Supervised Learning.
- **Type**: Preprint (arXiv), method paper
- **Method**: Measurement of clustering properties of joint-embedding self-supervised models by several metrics, and a positive-feedback method, ReSA, that uses those properties for training; evaluated on standard SSL benchmarks.
- **Key results**: The encoder's output encoding has better and more stable clustering properties than other components, and ReSA outperforms other SSL methods and improves clustering at fine- and coarse-grained levels.
- **Relevance**: Evidence that clustering structure in self-supervised representations differs between components and can be measured; it is general vision SSL, not ECG.
- **Quality**: Medium (10): preprint, vision benchmarks.
- **Stance**: Neutral
- **Potential use**: Literature Review, Discussion
- **BibTeX**: already in the .bib

### Nezamabadi et al. (2023). Unsupervised ECG Analysis: A Review.
- **Type**: Journal article (IEEE Reviews in Biomedical Engineering), review
- **Method**: Review of ECG clustering techniques of the last decade, mainly machine learning and deep learning, with applications and limitations.
- **Key results**: ECG clustering partitions samples into abnormality classes without cardiologist labels, finds inter- and intra-individual patterns, and can address imbalanced data in supervised systems. The review compares techniques and sets out future directions.
- **Relevance**: The standing review of the paper's subject area.
- **Quality**: High (12): Q1 review journal, secondary evidence.
- **Stance**: Supports the value of unsupervised ECG analysis.
- **Potential use**: Introduction, Literature Review
- **BibTeX**: new entry Nezamabadi_2023

### He et al. (2019). Unsupervised classification of 12-lead ECG signals using wavelet tensor decomposition and two-dimensional Gaussian spectral clustering.
- **Type**: Journal article (Knowledge-Based Systems)
- **Method**: Discrete wavelet packet tensors of 12-lead ECGs, multilinear PCA for dimension reduction, and a two-dimensional Gaussian spectral clustering; tested on an experimental 12-lead dataset and two PhysioBank datasets.
- **Key results**: Clustering on the tensor features recovers groups of 12-lead ECG samples, and the authors report the scheme as efficient across the three datasets.
- **Relevance**: A prior unsupervised 12-lead clustering pipeline built on engineered features.
- **Quality**: High (13): Q1 journal; small evaluation sets.
- **Stance**: Supports feature-based unsupervised ECG classification.
- **Potential use**: Literature Review
- **BibTeX**: already in the .bib

### Friedman et al. (2025). Unsupervised deep learning of electrocardiograms enables scalable human disease profiling.
- **Type**: Journal article (npj Digital Medicine)
- **Method**: A denoising autoencoder on 12-lead ECGs; associations between latent encodings and about 1,600 Phecodes tested in three external datasets and meta-analysed.
- **Key results**: The latent space associates with 645 prevalent and 606 incident Phecodes, more than models on standard ECG intervals, and discriminates prevalent disease better than age, sex and race models.
- **Relevance**: Evidence that an autoencoder latent space carries clinical structure, which bears on the autoencoder arm.
- **Quality**: High (13): Q1 journal, three external datasets.
- **Stance**: Supports the informativeness of unsupervised ECG latents.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry Friedman_2025

### Madrid et al. (2025). Unsupervised clustering of single-lead electrocardiograms associates with prevalent and incident heart failure in coronary artery disease.
- **Type**: Journal article (European Heart Journal - Digital Health)
- **Method**: Twenty-one hand-crafted markers from single-lead median beats of 1,928 UK Biobank participants with coronary artery disease, clustered without labels, with validation in an independent cohort of 1,644.
- **Key results**: Two clusters emerge; the smaller one (n = 359) has longer QRS and QT intervals and more QRS and T-wave variation, and carries a higher risk of incident heart failure (HR 2.40, 95 percent CI 1.51 to 3.83).
- **Relevance**: Shows that clustering compact hand-crafted ECG features yields clinically distinct groups.
- **Quality**: Medium (10): independent validation; a single population and single lead.
- **Stance**: Supports hand-crafted features for unsupervised ECG grouping.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry Madrid_2025

### Jang et al. (2021). Unsupervised feature learning for electrocardiogram data using the convolutional variational autoencoder.
- **Type**: Journal article (PLOS ONE)
- **Method**: A convolutional variational autoencoder trained on 596,000 ECG samples from 1,278 ICU patients; features examined by clustering, latent space exploration and anomaly detection on three external datasets, and used for 12-class arrhythmia classification.
- **Key results**: The learned features reflect the various ECG rhythms; XGBoost on the features alone reaches an F1 of 0.86, and encoder initialization improves F1 by 5 percent over random initialization.
- **Relevance**: The closest prior use of a convolutional autoencoder with clustering on ECG rhythms.
- **Quality**: Medium (11): external validation; Q2 journal.
- **Stance**: Supports autoencoder features for rhythm structure.
- **Potential use**: Literature Review, Methodology
- **BibTeX**: new entry Jang_2021

### Wheeldon and Serb (2023). A study on the clusterability of latent representations in image pipelines.
- **Type**: Journal article (Frontiers in Neuroinformatics)
- **Method**: Sequential clustering algorithms applied to latent representations of autoencoders and CNNs, and a new memory- and operation-efficient algorithm, Collage, designed for hardware accelerators.
- **Key results**: Plain autoencoders produce latent representations with large inter-cluster overlaps; CNN latents reduce the overlap but bring other problems for cognitive pipelines.
- **Relevance**: Direct evidence that reconstruction latents can cluster poorly, which bears on the autoencoder arm; image data, not ECG.
- **Quality**: Medium (9): image domain, modest scale.
- **Stance**: Supports the expectation that reconstruction objectives need not yield clusterable latents.
- **Potential use**: Discussion
- **BibTeX**: new entry Wheeldon_2023

### Campello et al. (2013). Density-based clustering based on hierarchical density estimates.
- **Type**: Conference paper (PAKDD)
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: HDBSCAN, a density-based clustering algorithm that does not need the number of clusters; a candidate clusterer besides k-means. Relevance is judged from the title and the manuscript's use, since no abstract could be fetched.
- **Quality**: Medium (11): cited by 100 or more; abstract not read, so rigor is scored at the default.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Wesselius et al. (2021). Digital biomarkers and algorithms for detection of atrial fibrillation using surface electrocardiograms: A systematic review.
- **Type**: Journal article (Computers in Biology and Medicine), systematic review
- **Method**: PubMed search of 14 September 2020 with MeSH terms; 451 articles, 130 after full-text screening.
- **Key results**: AF detection methods grow more complex over time; features fall into atrial, ventricular and signal features, and only 22 percent of the methods use atrial features although AF is an atrial disease.
- **Relevance**: Defines the rhythm and morphology feature families that the hand-crafted arm draws on.
- **Quality**: High (12): systematic method, Q1 journal.
- **Stance**: Neutral
- **Potential use**: Introduction, Methodology
- **BibTeX**: new entry Wesselius_2021

### Rouhi et al. (2021). An Interpretable Hand-Crafted Feature-Based Model for Atrial Fibrillation Detection.
- **Type**: Journal article (Frontiers in Physiology)
- **Method**: Explanation techniques applied to hand-crafted-feature classifiers for rhythm classification, with feature selection and classification on the CinC/PhysioNet 2017 dataset.
- **Key results**: SHAP with random forests reaches a mean F-score of 0.746 against 0.706 for a cascaded SVM on the same features, and gives a more compact feature set.
- **Relevance**: Shows that a compact hand-crafted set carries the AF signal, which bears on the hand-crafted arm.
- **Quality**: Medium (11): public dataset; supervised and single-dataset.
- **Stance**: Supports compact hand-crafted features for AF.
- **Potential use**: Literature Review, Methodology
- **BibTeX**: new entry Rouhi_2021

### Task Force of the European Society of Cardiology and the North American Society of Pacing and Electrophysiology (1996). Heart rate variability: standards of measurement, physiological interpretation, and clinical use.
- **Type**: Journal article (Circulation), standards report
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: The standard definitions of heart rate variability measures, which the rhythm features of the hand-crafted arm use. Judged from the title, since no abstract could be fetched.
- **Quality**: High (12): standards document, cited by 100 or more; abstract not read.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### de Chazal et al. (2004). Automatic classification of heartbeats using ECG morphology and heartbeat interval features.
- **Type**: Journal article (IEEE Transactions on Biomedical Engineering)
- **Method**: Heartbeats of 44 MIT-BIH recordings assigned to the five AAMI classes by a statistical classifier on morphology, interval and RR features, with a patient-wise split into two datasets of about 50,000 beats from 22 recordings each.
- **Key results**: For supraventricular ectopic beats, sensitivity 75.9 percent and positive predictivity 38.5 percent; for ventricular ectopic beats, sensitivity 77.7 percent and positive predictivity 81.9 percent.
- **Relevance**: The origin of the inter-patient split and of the morphology and interval feature set.
- **Quality**: High (14): Q1 journal, cited by 100 or more, patient-wise evaluation.
- **Stance**: Supports patient-grouped evaluation.
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Makowski et al. (2021). NeuroKit2: A Python toolbox for neurophysiological signal processing.
- **Type**: Journal article (Behavior Research Methods), software
- **Method**: An open-source Python package of validated processing pipelines for ECG, PPG, EDA, EMG and respiration, illustrated on event-related and interval-related analyses.
- **Key results**: The package offers high-level pipelines and low-level steps such as rate extraction and filtering, aimed at transparency and reproducibility.
- **Relevance**: The tool that extracts the hand-crafted features.
- **Quality**: High (12): Q1 journal; software paper.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Hubert and Arabie (1985). Comparing partitions.
- **Type**: Journal article (Journal of Classification)
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: The origin of the adjusted Rand index, the paper's chance-corrected agreement measure; Steinley (2004) calls it the cluster validation measure of choice. No abstract could be fetched.
- **Quality**: High (13): foundational, cited by 100 or more; abstract not read.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Vinh et al. (2010). Information theoretic measures for clusterings comparison: variants, properties, normalization and correction for chance.
- **Type**: Journal article (Journal of Machine Learning Research)
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: Information-theoretic agreement measures corrected for chance, among them adjusted mutual information; Romano et al. (2015) build on this line. Judged from the title, since the entry has no DOI or arXiv ID and no text could be fetched.
- **Quality**: High (12): JMLR; the citation count could not be obtained and the item is scored at the default.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Rousseeuw (1987). Silhouettes: a graphical aid to the interpretation and validation of cluster analysis.
- **Type**: Journal article (Journal of Computational and Applied Mathematics)
- **Method**: A graphical display of partitions in which each cluster is a silhouette based on tightness and separation.
- **Key results**: The silhouette shows which objects lie well within their cluster and which lie between clusters; the average silhouette width evaluates clustering validity and can select the number of clusters.
- **Relevance**: The label-free internal validity measure the paper reports beside ARI.
- **Quality**: High (12): foundational, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Steinley (2004). Properties of the Hubert-Arabie Adjusted Rand Index.
- **Type**: Journal article (Psychological Methods)
- **Method**: Analytic and simulation study relating four cluster validation indices to the Hubert-Arabie adjusted Rand index.
- **Key results**: Other indices can be roughly transformed to the ARI scale; classification rates should not be used in cluster validation; the article summarizes ARI properties across many conditions and gives a significance test for observed ARI values.
- **Relevance**: Justifies ARI over accuracy-style measures and gives a significance test, which answers the referees' request for effect sizes and tests.
- **Quality**: High (13): Q1 journal, cited by 100 or more.
- **Stance**: Supports ARI as the external measure.
- **Potential use**: Methodology
- **BibTeX**: new entry Steinley_2004

### Romano et al. (2015). Adjusting for Chance Clustering Comparison Measures.
- **Type**: Preprint (arXiv); cited by 100 or more
- **Method**: Analytic expected value and variance of generalized information-theoretic measures based on Tsallis entropy, which link pair-counting and Shannon measures.
- **Key results**: ARI should be used when the reference clustering has large equal-sized clusters, and AMI when the reference is unbalanced and has small clusters.
- **Relevance**: Directly bears on the 9:1 SR-to-AF cohort: it says when AMI, rather than ARI, is the right external measure under imbalance.
- **Quality**: High (13): analytic result, cited by 100 or more; preprint entry.
- **Stance**: Supports reporting AMI beside ARI under imbalance.
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry arxiv_1512_01286

### Pedregosa et al. (2011). Scikit-learn: Machine learning in Python.
- **Type**: Journal article (Journal of Machine Learning Research), software
- **Method**: A Python module of machine learning algorithms for supervised and unsupervised problems with a consistent API.
- **Key results**: The package emphasizes ease of use, performance, documentation and API consistency, with minimal dependencies under a BSD license.
- **Relevance**: The implementation of k-means, the metrics and the supervised ceiling.
- **Quality**: Medium (11): software paper, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Cliff (1993). Dominance statistics: Ordinal analyses to answer ordinal questions.
- **Type**: Journal article (Psychological Bulletin)
- **Method**: Statistical argument for the ordinal statistic d, which counts how often a score from one group exceeds one from the other.
- **Key results**: Compared with mean comparisons, d is more robust and equally or more powerful, invariant under transformation, and closer to many research hypotheses; inference should use sample estimates of its variance.
- **Relevance**: The effect size (Cliff's delta) the referees ask for to compare representations across seeds or folds.
- **Quality**: High (13): Q1 journal, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: new entry Cliff_1993

### Kerby (2014). The Simple Difference Formula: An Approach to Teaching Nonparametric Correlation.
- **Type**: Journal article (Comprehensive Psychology)
- **Method**: An expository formula for effect sizes of the Mann-Whitney U test and the Wilcoxon signed-rank test.
- **Key results**: [GAP: Key results] The abstract returned by the indexes is cut after its first two sentences, which say that statistics texts often omit effect sizes for these two tests.
- **Relevance**: The rank-biserial effect size for paired Wilcoxon comparisons, one answer to the referees' effect-size request.
- **Quality**: Medium (9): teaching paper, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: new entry Kerby_2014

### Efron (1979). Bootstrap Methods: Another Look at the Jackknife.
- **Type**: Journal article (The Annals of Statistics)
- **Method**: Introduces the bootstrap for estimating the sampling distribution of a statistic, shown on worked examples; the jackknife is shown to be a linear approximation of it.
- **Key results**: The bootstrap works satisfactorily on a variety of estimation problems, including the variance of the median and error rates in discriminant analysis.
- **Relevance**: The basis for the confidence intervals on ARI and on differences between representations.
- **Quality**: High (13): foundational, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: new entry Efron_1979

### McMahan et al. (2017). Communication-efficient learning of deep networks from decentralized data.
- **Type**: Conference paper (AISTATS)
- **Method**: Federated averaging of locally computed updates, evaluated on five architectures and four datasets.
- **Key results**: The approach is robust to unbalanced and non-IID data and needs 10 to 100 times fewer communication rounds than synchronized SGD.
- **Relevance**: The federated procedure of the paper's federation arm.
- **Quality**: High (14): foundational, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Hsu et al. (2019). Measuring the Effects of Non-Identical Data Distribution for Federated Visual Classification.
- **Type**: Preprint (arXiv)
- **Method**: Synthetic client datasets with a continuous range of identicalness (Dirichlet partitions) and measurements of federated averaging on CIFAR-10, with server momentum as mitigation.
- **Key results**: Performance degrades as client distributions differ more; server momentum raises accuracy from 30.1 to 76.9 percent in the most skewed setting.
- **Relevance**: The standard way to simulate heterogeneous sites, against which a realistic site split can be set.
- **Quality**: Medium (11): widely used protocol; vision only, preprint.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: new entry arxiv_1909_06335

### Rieke et al. (2020). The future of digital health with federated learning.
- **Type**: Journal article (npj Digital Medicine), perspective
- **Method**: Analysis of why medical data stays in silos and how federated learning can address it, with its challenges.
- **Key results**: Data silos and privacy limit machine learning on medical data; federated learning is a route to use such data, with challenges that must be met for clinical use.
- **Relevance**: Motivates the federation arm in healthcare terms.
- **Quality**: Medium (11): Q1 journal, perspective without original data.
- **Stance**: Supports federation as a clinical need.
- **Potential use**: Introduction
- **BibTeX**: new entry Rieke_2020

### Dennis et al. (2021). Heterogeneity for the Win: One-Shot Federated Clustering.
- **Type**: Preprint (arXiv); the paper carries the ICML keyword
- **Method**: k-FED, one-shot federated k-means based on Lloyd's method, analysed under a centre-separation assumption and tested on common federated benchmarks.
- **Key results**: When each device holds fewer clusters than the network (k' at most the square root of k), heterogeneity weakens the separation requirement; k-FED needs one round of communication and tolerates partial participation.
- **Relevance**: A federated clustering method with theory on heterogeneity, the unsupervised counterpart of federated averaging.
- **Quality**: High (12): theory and experiments; preprint entry.
- **Stance**: Supports the view that site heterogeneity need not harm federated clustering.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry arxiv_2103_00697

### Holzer et al. (2023). Dynamically Weighted Federated k-Means.
- **Type**: Preprint (arXiv)
- **Method**: DWF k-means, federated k-means that aggregates cluster assignments and centroids from each source adaptively and handles empty clusters; evaluated on several datasets and distribution settings by clustering score, accuracy and v-measure.
- **Key results**: The method matches centralized k-means and outperforms existing federated clustering algorithms in the reported settings.
- **Relevance**: A federated k-means under heterogeneous data, a candidate for the federation arm.
- **Quality**: Medium (9): preprint, generic datasets.
- **Stance**: Neutral
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2310_14858

### Cai and Zhang (2026). One-Shot Hierarchical Federated Clustering for Distributed Non-IID Biomedical Data Analysis.
- **Type**: Preprint (arXiv)
- **Method**: One-shot hierarchical federated clustering by one-way prototype transmission from clients and multi-granular competitive learning on the server; twelve datasets, ten from the UCI repository and two synthetic.
- **Key results**: The framework balances clustering quality, privacy and computation in the comparisons reported against other methods.
- **Relevance**: Federated clustering framed for multi-institution biomedical data, though tested on UCI tables and not on ECG.
- **Quality**: Medium (9): recent preprint, no ECG data.
- **Stance**: Neutral
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2611_11481

### Alreshidi et al. (2024). Fed-CL- an atrial fibrillation prediction system using ECG signals employing federated learning mechanism.
- **Type**: Journal article (Scientific Reports)
- **Method**: A CNN and LSTM model trained by federated learning with client weights adjusted to each client's contribution, on the PhysioNet/CinC 2020 data from six centres, with mean heart rate variability analysis.
- **Key results**: The approach reports an AF prediction accuracy above 92 percent and outperforms FedAvg-SVM and FedMA-SVM.
- **Relevance**: Federated AF detection on multi-site ECG, supervised.
- **Quality**: Medium (8): Q1 journal; an author correction was issued, and the federated split is not described in detail.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: new entry Alreshidi_2024

### Wagner et al. (2020). PTB-XL, a large publicly available electrocardiography dataset.
- **Type**: Journal article (Scientific Data), dataset
- **Method**: Data descriptor of 21,837 ten-second 12-lead records from 18,885 patients, annotated by up to two cardiologists as a multi-label dataset with super- and subclasses.
- **Key results**: The dataset is the largest freely accessible clinical 12-lead set at its release, with metadata, signal properties and recommended folds for training and testing.
- **Relevance**: The study's dataset; patient identifiers allow patient-grouped evaluation.
- **Quality**: High (15): Q1 journal, primary data, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Zheng et al. (2020). A 12-lead electrocardiogram database for arrhythmia research covering more than 10,000 patients.
- **Type**: Journal article (Scientific Data), dataset
- **Method**: Data descriptor of 12-lead ECGs of 10,646 patients at 500 Hz from Chapman University and Shaoxing People's Hospital, labelled by experts.
- **Key results**: The database covers 11 common rhythms, including atrial fibrillation, and 67 further cardiovascular conditions, in 10-second recordings.
- **Relevance**: A multi-class rhythm cohort for testing whether results transfer beyond SR versus AF on PTB-XL, as the referees ask.
- **Quality**: High (15): Q1 journal, primary data.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Zheng_2020

### Perez Alday et al. (2020). Classification of 12-lead ECGs: the PhysioNet/Computing in Cardiology Challenge 2020.
- **Type**: Journal article (Physiological Measurement), challenge and dataset
- **Method**: 66,405 recordings from hospital systems in four countries, 43,101 public, with a clinically weighted evaluation metric and required submission of training code.
- **Key results**: Over 200 teams submitted 850 algorithms (432 ran); the multi-institution sourcing allows assessment of generalizability, and the code requirement supports reproducibility.
- **Relevance**: A multi-site multi-class dataset whose source institutions give a natural site split for federation.
- **Quality**: High (14): primary data across sites.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Perez_Alday_2020

### Reyna et al. (2021). Will Two Do? Varying Dimensions in Electrocardiography: The PhysioNet/Computing in Cardiology Challenge 2021.
- **Type**: Conference paper (Computing in Cardiology)
- **Method**: 131,155 recordings from seven institutions in four countries, 88,253 public, for identifying cardiac abnormalities from twelve-, six-, four-, three- and two-lead ECGs.
- **Key results**: 68 teams submitted 1,056 algorithms and 39 succeeded; the diverse populations and required training code target generalizable and reproducible algorithms.
- **Relevance**: The largest public multi-site multi-class set, with seven institutions for a realistic federation split.
- **Quality**: High (13): primary data across sites; conference venue.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Reyna_2021

### Clifford et al. (2017). AF classification from a short single lead ECG recording: the PhysioNet/Computing in Cardiology Challenge 2017.
- **Type**: Conference paper (Computing in Cardiology)
- **Method**: 12,186 short single-lead ECGs (9 to 61 s) labelled AF, normal, other rhythm or noise; mid-competition bootstrap relabelling of contentious labels.
- **Key results**: 75 teams entered; four tied at an F1 of 0.83 with the top 11 within 2 percent, and a LASSO combination of 45 algorithms reached 0.87. Inter-expert disagreement was high for a significant fraction of labels.
- **Relevance**: The reference AF dataset and evidence that AF labels carry disagreement, which caps any label-agreement measure.
- **Quality**: High (14): primary data, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Methodology, Discussion
- **BibTeX**: already in the .bib

### Moody and Mark (2001). The impact of the MIT-BIH Arrhythmia Database.
- **Type**: Journal article (IEEE Engineering in Medicine and Biology Magazine)
- **Method**: Historical account of the database's design, contents and use.
- **Key results**: The database was the first generally available standard test material for arrhythmia detectors and has been used at about 500 sites since 1980; the article reviews its contents and the lessons for database design.
- **Relevance**: The beat-level arrhythmia database that most unsupervised ECG work uses, a point of reference for the multi-class question.
- **Quality**: High (12): historical, cited by 100 or more.
- **Stance**: Neutral
- **Potential use**: Literature Review
- **BibTeX**: already in the .bib

### Goldberger et al. (2000). PhysioBank, PhysioToolkit, and PhysioNet: components of a new research resource for complex physiologic signals.
- **Type**: Journal article (Circulation), resource description
- **Method**: Description of a research resource with three components: PhysioBank, an archive of recordings; PhysioToolkit, open-source software; and PhysioNet, the online forum.
- **Key results**: PhysioBank holds multiparameter cardiopulmonary, neural and other recordings from healthy subjects and patients, including life-threatening arrhythmias; PhysioToolkit provides signal processing, event detection and evaluation tools.
- **Relevance**: The repository that distributes PTB-XL and the challenge datasets.
- **Quality**: Medium (10): background resource; citation count not obtained.
- **Stance**: Neutral
- **Potential use**: Methodology
- **BibTeX**: already in the .bib

### Pham et al. (2023). Machine learning-based detection of cardiovascular disease using ECG signals: performance vs. complexity.
- **Type**: Preprint (arXiv)
- **Method**: Poincare-image CNNs, XGBoost on extracted features and 1D convolutional models compared on CinC 2017 and CinC 2020, with power consumption and CO2 measurements.
- **Key results**: 1D ResNet gives the best results (F1 85 percent on CinC 2017 and 71 percent on CinC 2020); XGBoost has a long inference time because of costly preprocessing, and 1D models are the most energy efficient.
- **Relevance**: Reports compute and energy cost of feature-based against deep pipelines, the cost comparison the referees ask for.
- **Quality**: Medium (9): two public datasets; preprint, supervised.
- **Stance**: Supports reporting compute cost per pipeline.
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2303_11429

### Luthra et al. (2026). Directional Neural Collapse Explains Few-Shot Transfer in Self-Supervised Learning.
- **Type**: Preprint (arXiv), theory with experiments
- **Method**: Non-asymptotic error bounds for nearest-class-centroid and linear-probe classification on frozen self-supervised representations, governed by the variance along class-separating directions (directional CDNV) rather than the variance over all directions (classical CDNV); measured across SSL objectives and on synthetic multitask data.
- **Key results**: Directional CDNV collapses during pretraining even when classical CDNV remains large, and the bounds track few-shot error. A representation can support many tasks with small decision-axis variance while classical CDNV is large, because most within-class energy can lie in directions orthogonal to the task-relevant axes; global clustering proxies are therefore too coarse to predict few-shot transfer.
- **Relevance**: States the mechanism of the separability-versus-clusterability divergence: a label direction that a linear probe recovers can sit beside large within-class variance in other directions, which is what a clustering criterion over all directions sees.
- **Quality**: Medium (10): formal bounds with experiments; a recent preprint on vision representations.
- **Stance**: Supports the paper's reading of the gap between the supervised ceiling and the clustering agreement.
- **Potential use**: Introduction, Literature Review, Discussion
- **BibTeX**: new entry arxiv_2603_03530

### Rodriguez-Betancourt and Casasola-Murillo (2026). Geometric Analysis of Self-Supervised Vision Representations for Semantic Image Retrieval.
- **Type**: Preprint (arXiv), computational benchmark
- **Method**: Self-supervised vision representations trained on Food-101 and ImageNet-1k, evaluated by linear probe and kNN accuracy and by retrieval through three approximate nearest neighbour indexes (IVF, HNSW, LSH), with measures of anisotropy and skewness of the latent space.
- **Key results**: Highly anisotropic, highly skewed representations degrade partition-based and hashing-based search even when their linear-probe or kNN accuracy is not affected; strong performance under linear-probe and kNN evaluation does not necessarily translate to good retrieval.
- **Relevance**: A second case in which linear-probe accuracy and a partition of the same representation diverge, tied to the geometry of the space; image retrieval, not clustering against labels.
- **Quality**: Medium (10): two datasets; preprint, small sample of models as the authors state.
- **Stance**: Supports the view that linear-probe accuracy does not certify partition-based use of a representation.
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2604_24469

### Van Gansbeke et al. (2020). SCAN: Learning to Classify Images Without Labels.
- **Type**: Chapter (Computer Vision, ECCV 2020)
- **Method**: Two-step unsupervised image classification: self-supervised pretext features, then a clustering objective on mined nearest neighbours, compared with k-means on the same pretext features on CIFAR-10, CIFAR-100-20, STL-10 and ImageNet.
- **Key results**: K-means on the instance-discrimination pretext features reaches 65.9 percent accuracy with a standard deviation of 5.7 on CIFAR-10, against 87.6 percent for the SCAN objective on the same features; naively applying k-means to the features "can lead to cluster degeneracy", and the k-means assignments are imbalanced (Figure 3).
- **Relevance**: Shows that self-supervised features hold class structure that k-means does not recover, and that k-means on such features gives imbalanced, degenerate clusters.
- **Quality**: High (13): widely cited (100 or more citing works), controlled ablations on the same features.
- **Stance**: Supports the expectation that a feature space can carry class information that k-means does not follow.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry Van_Gansbeke_2020

### Adaloglou et al. (2023). Exploring the Limits of Deep Image Clustering using Pretrained Models.
- **Type**: Preprint (arXiv)
- **Method**: Clustering of features from 17 pretrained models (supervised, self-supervised and vision-language) on ImageNet and CIFAR-100 by k-means and by a nearest-neighbour-based clustering head.
- **Key results**: The clustering head improves clustering accuracy over k-means by 6.1 and 12.2 points on ImageNet and CIFAR-100 across the 17 models; the authors state that k-means "often leads to imbalanced clusters" since it suits evenly scattered samples around their centroids.
- **Relevance**: Evidence across many encoders that k-means under-recovers class structure in pretrained feature spaces, and that it tends to imbalanced clusters.
- **Quality**: Medium (10): 17 models; preprint.
- **Stance**: Supports the paper's use of several clusterers.
- **Potential use**: Discussion
- **BibTeX**: new entry arxiv_2303_17896

### Wongoutong (2024). The impact of neglecting feature scaling in k-means clustering.
- **Type**: Journal article (PLOS ONE)
- **Method**: Experimental comparison of k-means on raw features and after five scalings: Z-score, min-max, percentile transformation, maximum absolute scaling and RobustScaler, on datasets with features of different or the same units.
- **Key results**: For features with different units, scaling before k-means improves accuracy, precision, recall and F-score over the raw data, and Z-score and percentile transformation perform best of the five; for features with the same unit, scaling gives results similar to the raw data.
- **Relevance**: Shows that the choice of scaler, RobustScaler among them, changes the k-means result, which bears on the conditioner sweep.
- **Quality**: High (12): peer-reviewed, controlled comparison; generic datasets, not physiological signals.
- **Stance**: Supports reporting the conditioner as part of the representation.
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Wongoutong_2024

### Liang et al. (2012). The K-Means-Type Algorithms Versus Imbalanced Data Distributions.
- **Type**: Journal article (IEEE Transactions on Fuzzy Systems)
- **Method**: Analysis of the causes of the uniform effect in hard and fuzzy k-means, and a multicentre clustering algorithm tested on synthetic and real balanced and imbalanced datasets.
- **Key results**: K-means-type algorithms are affected by imbalanced data and "often produce clusters of relatively uniform sizes, even if input data have varied cluster sizes", the uniform effect, which grows with the fuzzy index; representing each cluster by several centres counters it.
- **Relevance**: Directly supports the statement that k-means has difficulty isolating a small minority cluster, as in the 9:1 SR-to-AF cohort.
- **Quality**: High (14): Q1 journal, analysis and experiments, cited by 100 or more.
- **Stance**: Supports the reading of the imbalance result.
- **Potential use**: Discussion
- **BibTeX**: new entry Liang_2012

### Xiong et al. (2009). K-Means Clustering Versus Validation Measures: A Data-Distribution Perspective.
- **Type**: Journal article (IEEE Transactions on Systems, Man, and Cybernetics, Part B)
- **Method**: Formal and empirical study of the effect of skewed data distributions on k-means, with the coefficient of variation (CV) of cluster sizes as a criterion.
- **Key results**: K-means tends to produce clusters of relatively uniform size even when the true cluster sizes vary, keeping the CV of resulting cluster sizes in a range of about 0.3 to 1.0; for data with CV above 1.0 it reduces the variation below 1.0. Some validation measures, such as entropy, may not capture this uniform effect and give misleading information.
- **Relevance**: Supports the k-means minority statement and shows that a validation measure can rate a distorted partition well.
- **Quality**: High (14): Q1 journal, formal results, cited by 100 or more.
- **Stance**: Supports the reading of the imbalance result and the caution on validation measures.
- **Potential use**: Methodology, Discussion
- **BibTeX**: new entry Hui_Xiong_2009

### von Luxburg (2007). A tutorial on spectral clustering.
- **Type**: Journal article (Statistics and Computing), tutorial
- **Method**: Tutorial on similarity graphs, graph Laplacians and spectral clustering algorithms, with their derivations and practical recommendations.
- **Key results**: The tutorial states that "if the similarity graph contains more connected components than the number of clusters we ask the algorithm to detect, then spectral clustering will trivially return connected components as clusters"; the k-nearest neighbour graph can break into disconnected components, and its connectivity parameter should be chosen so that the graph is connected or has far fewer components than clusters.
- **Relevance**: Supports the draft's statement that spectral clustering degrades on a poorly connected nearest-neighbour graph.
- **Quality**: High (13): standard reference, cited by 100 or more.
- **Stance**: Supports the explanation of the spectral clustering result.
- **Potential use**: Discussion
- **BibTeX**: new entry von_Luxburg_2007

### Wang and Ye (2026). Deep Clustering Evaluation: How to Validate Internal Clustering Validation Measures.
- **Type**: Journal article (Journal of the American Statistical Association); text read in its arXiv version 2403.14830
- **Method**: Theory and a framework for internal clustering validation of deep clustering, which identifies embedding spaces that agree in ranking partitions and weights index values across them.
- **Key results**: Traditional internal measures are problematic for deep clustering, through the curse of dimensionality on the input data and through unreliable comparison of clustering results computed in different embedding spaces; the authors establish why and propose a weighted scoring scheme.
- **Relevance**: Supports the caution that an internal index such as the silhouette does not compare partitions across different representation spaces, which is what the silhouette result of this paper shows.
- **Quality**: High (13): top statistics journal, theory and experiments.
- **Stance**: Supports the silhouette caution.
- **Potential use**: Literature Review, Discussion
- **BibTeX**: new entry Wang_2026

### Digiacomo et al. (2025). Intra-Subject Clustering of ECG Heartbeats from Wearable Devices Using Deep Learning and Feature Engineering.
- **Type**: Conference paper (IEEE CBMS 2025)
- **Method**: A multiscale CNN with a bidirectional GRU for P-QRS-T wave detection, heartbeat segmentation, manual and TSFEL features, and intra-subject k-means clustering, on MIT-BIH and on a new wearable three-lead database (HiDB).
- **Key results**: On MIT-BIH, intra-subject clustering gives a mean ARI of 0.78 (SD 0.19) and a mean silhouette of 0.65 (SD 0.14); on the unlabelled HiDB, the clustering is reported by an average silhouette of 0.74 (SD 0.13).
- **Relevance**: An applied ECG clustering study that reports the silhouette as the validation where no labels exist.
- **Quality**: Medium (11): conference venue, ANSI/AAMI testing of the detector.
- **Stance**: Neutral; it is the practice the silhouette caution addresses.
- **Potential use**: Discussion
- **BibTeX**: new entry Digiacomo_2025

### Shetty et al. (2024). Unveiling the Biological Subtypes of Left Ventricular Diastolic Dysfunction through Unsupervised Clustering of ECG Data.
- **Type**: Conference abstract (Circulation supplement)
- **Method**: A convolutional autoencoder compresses ECGs to 128 dimensions, k-means groups 22,183 patients with 96,921 ECGs with clinician-confirmed diastolic dysfunction, and silhouette analysis sets the number of clusters.
- **Key results**: Silhouette analysis identified 2 as the optimal number of clusters, and the clusters differ in age, sex and race (p below 0.00001 for each).
- **Relevance**: An applied ECG clustering study in which the silhouette is the validation that selects and supports the partition.
- **Quality**: Medium (8): large cohort; abstract-level report.
- **Stance**: Neutral; it is the practice the silhouette caution addresses.
- **Potential use**: Discussion
- **BibTeX**: new entry Shetty_2024

## 5. Literature matrix

Themes: T1, ECG foundation models, self-supervised encoders and their benchmarks; T2, unsupervised ECG analysis and clusterability of representations; T3, hand-crafted rhythm and morphology features; T4, clustering evaluation; T5, statistical reporting (effect sizes, bootstrap); T6, federated learning and federated clustering; T7, datasets, including multi-class 12-lead cohorts; T8, compute and deployment cost.

| Source | T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8 | Method | Quality |
|---|---|---|---|---|---|---|---|---|---|---|
| Filice et al. (2026) | main | x | | x | | | x | | Computational benchmark | Medium |
| Coppola et al. (2024) | main | | | | | | | | Computational method | High |
| Li et al. (2024) | main | | | | | | | | Computational method | High |
| Lunelli et al. (2026) | main | | | | | | | | Computational benchmark | High |
| Al-Masud et al. (2025) | main | | | | | | | x | Computational benchmark | Medium |
| Taleshinosrati et al. (2026) | main | | | | x | | | x | Computational benchmark | Medium |
| Berger et al. (2026) | main | | | x | | | x | | Position with experiments | Medium |
| McKeen et al. (2025) | main | | | | | | | | Computational method | High |
| Na et al. (2024) | main | | | | | | | | Computational method | High |
| Kim (2024) | main | | | | | | | | Computational method | Medium |
| Han et al. (2024) | main | | | | | | | | Review | Medium |
| Wan et al. (2025) | main | | | | | x | | | Computational benchmark | Medium |
| Xu et al. (2025) | main | | | | | | | | Computational benchmark | Medium |
| Liu et al. (2024) | main | x | | | | | | | Computational method | High |
| Strodthoff et al. (2021) | x | | x | | | | main | | Computational benchmark | High |
| Kiyasseh et al. (2021) | main | | | | | | | | Computational method | High |
| Gopal et al. (2021) | main | | | | | | | | Computational method | Medium |
| Mehari and Strodthoff (2022) | main | | | | | | | | Computational benchmark | High |
| Weng et al. (2025) | x | main | | x | | | | | Computational method | Medium |
| Nezamabadi et al. (2023) | | main | | | | | | | Review | High |
| He et al. (2019) | | main | x | | | | | | Computational method | High |
| Friedman et al. (2025) | x | main | | | | | | | Computational method | High |
| Madrid et al. (2025) | | main | x | | | | | | Observational cohort | Medium |
| Jang et al. (2021) | | main | | | | | | | Computational method | Medium |
| Wheeldon and Serb (2023) | | main | | | | | | x | Computational method | Medium |
| Campello et al. (2013) | | main | | x | | | | | Computational method | Medium |
| Wesselius et al. (2021) | | | main | | | | | | Systematic review | High |
| Rouhi et al. (2021) | | | main | | | | | | Computational method | Medium |
| Task Force (1996) | | | main | | | | | | Standards report | High |
| de Chazal et al. (2004) | | | main | | | | x | | Computational method | High |
| Makowski et al. (2021) | | | main | | | | | | Tool | High |
| Hubert and Arabie (1985) | | | | main | | | | | Theoretical | High |
| Vinh et al. (2010) | | | | main | | | | | Theoretical | High |
| Rousseeuw (1987) | | | | main | | | | | Theoretical | High |
| Steinley (2004) | | | | main | x | | | | Theoretical | High |
| Romano et al. (2015) | | | | main | | | | | Theoretical | High |
| Pedregosa et al. (2011) | | | | x | | | | | Tool | Medium |
| Cliff (1993) | | | | | main | | | | Theoretical | High |
| Kerby (2014) | | | | | main | | | | Theoretical | Medium |
| Efron (1979) | | | | | main | | | | Theoretical | High |
| McMahan et al. (2017) | | | | | | main | | | Computational method | High |
| Hsu et al. (2019) | | | | | | main | | | Computational method | Medium |
| Rieke et al. (2020) | | | | | | main | | | Review | Medium |
| Dennis et al. (2021) | | x | | | | main | | | Computational method | High |
| Holzer et al. (2023) | | x | | | | main | | | Computational method | Medium |
| Cai and Zhang (2026) | | x | | | | main | | | Computational method | Medium |
| Alreshidi et al. (2024) | | | | | | main | x | | Computational method | Medium |
| Wagner et al. (2020) | | | | | | | main | | Dataset | High |
| Zheng et al. (2020) | | | | | | | main | | Dataset | High |
| Perez Alday et al. (2020) | | | | | | x | main | | Dataset | High |
| Reyna et al. (2021) | | | | | | x | main | | Dataset | High |
| Clifford et al. (2017) | | | x | | | | main | | Dataset | High |
| Moody and Mark (2001) | | | | | | | main | | Dataset | High |
| Goldberger et al. (2000) | | | | | | | main | | Dataset | Medium |
| Pham et al. (2023) | | | x | | | | | main | Computational benchmark | Medium |
| Luthra et al. (2026) | x | main | | | | | | | Theoretical | Medium |
| Rodriguez-Betancourt and Casasola-Murillo (2026) | x | main | | | | | | | Computational benchmark | Medium |
| Van Gansbeke et al. (2020) | | main | | | | | | | Computational method | High |
| Adaloglou et al. (2023) | | main | | | | | | | Computational method | Medium |
| Wongoutong (2024) | | main | | | | | | | Computational benchmark | High |
| Liang et al. (2012) | | main | | x | | | | | Computational method | High |
| Xiong et al. (2009) | | x | | main | | | | | Theoretical | High |
| von Luxburg (2007) | | main | | | | | | | Review | High |
| Wang and Ye (2026) | | | | main | | | | | Theoretical | High |
| Digiacomo et al. (2025) | | main | x | x | | | x | | Computational method | Medium |
| Shetty et al. (2024) | | main | | x | | | | | Observational cohort | Medium |

Sources per theme (main or x): T1 22, T2 23, T3 11, T4 15, T5 5, T6 10, T7 13, T8 4.

## 6. Identified gaps

1. Under-researched area. No study compares compact hand-crafted rhythm and morphology features with frozen foundation-model embeddings under chance-corrected unsupervised clustering. The foundation-model benchmarks evaluate frozen embeddings through supervised probes, linear heads or a fixed XGBoost [@Lunelli_2026; @arxiv_2509_25095; @arxiv_2608_03597], or score the ARI of Gaussian mixture clusters among foundation models only [@lookingbeyond2026]. Unsupervised ECG studies cluster one representation at a time, hand-crafted markers [@Madrid_2025], wavelet tensors [@wavelettensorecg2018] or autoencoder latents [@Jang_2021; @Friedman_2025]. This gap is the paper's main contribution statement.
2. Methodological gap. No ECG representation benchmark reports a supervised ceiling and a chance-corrected clustering agreement on the same split, with patient grouping and intervals. The supervised benchmarks report probe or fine-tuning scores [@Strodthoff_2021; @Lunelli_2026]. The closest study reports the ARI of Gaussian mixture clusters against the CD and AF labels and against dataset membership beside downstream classifier scores, with no interval for the ARI, no patient grouping stated in the text, and no AF evaluation on PTB-XL [@lookingbeyond2026]. Berger et al. show that conclusions change with the evaluation protocol and that a random encoder is a needed baseline [@arxiv_2602_17531]. Under the cs_ml profile this is surfaced as a critical gap: the benchmarks differ in datasets, preprocessing, classifiers and validation [@arxiv_2608_03597], which leaves room for benchmark cherry-picking and limits reproducibility.
3. Population gap. The multi-class, multi-site 12-lead cohorts, Chapman-Shaoxing [@Zheng_2020] and the PhysioNet/CinC 2020 and 2021 challenge sets [@Perez_Alday_2020; @Reyna_2021], have been used for supervised classification and for foundation-model benchmarks, and no source read here uses them to test whether label-free clusters recover rhythm classes beyond SR versus AF. This answers referee item R3-2.
4. Under-researched area. Federated clustering methods are tested on generic benchmarks or UCI tables [@arxiv_2103_00697; @arxiv_2310_14858; @arxiv_2611_11481], and federated ECG work is supervised [@Alreshidi_2024]. No source applies federated clustering to ECG representations with a site split taken from real institutions, which the challenge datasets allow [@Perez_Alday_2020; @Reyna_2021]. This answers referee item R3-5.
5. Methodological gap. Compute cost is reported for supervised foundation-model use [@arxiv_2608_03597; @arxiv_2509_25095] and for supervised pipelines [@arxiv_2303_11429], and no source reports the extraction cost of hand-crafted features against foundation-model embeddings for an unsupervised pipeline. This answers referee items R1-4 and R3-6.
6. Methodological gap. Imbalance-aware external validation is rarely applied to ECG clustering. Romano et al. recommend AMI over ARI when the reference partition is unbalanced [@arxiv_1512_01286], and the 9:1 SR-to-AF cohort is such a case; none of the ECG clustering sources read reports both measures.

No uncovered topic of the .bib screening carries into the gaps, since all 21 entries were included.

## 7. Synthesis

### T1. ECG foundation models, self-supervised encoders and their benchmarks

Self-supervised and foundation-model encoders for ECG now span contrastive objectives [@clocs2021; @threekg2021; @mehari2022ssl], masked reconstruction [@arxiv_2402_09450], latent prediction [@arxiv_2410_08559], hybrid contrastive and generative pretraining [@McKeen_2025], self-supervised pretraining at the scale of 9.1 million ECGs [@hubertecg2024], supervised pretraining on over 10 million ECGs [@ecgfounder2024] and multimodal pretraining with reports [@arxiv_2403_06659]. A systematic review maps their architectures and adaptation strategies [@arxiv_2410_19877].

The benchmarks agree that the encoders are evaluated through supervised heads. BenchECG ranks models by fine-tuning and by linear probing [@Lunelli_2026], Al-Masud et al. use fine-tuned and frozen settings [@arxiv_2509_25095], FOUND-AF fixes an XGBoost classifier on frozen embeddings with grouped cross-validation [@arxiv_2608_03597], and the earlier self-supervised work uses linear evaluation [@mehari2022ssl; @clocs2021; @threekg2021]. They disagree on what decides quality: Al-Masud et al. find that a compact state-space model leads most task categories, so architecture matters more than scale [@arxiv_2509_25095], while FOUND-AF finds the large supervised ECGFounder strongest for AF [@arxiv_2608_03597]. OpenECG finds that diverse multi-centre pretraining improves generalization [@arxiv_2503_00711], and Xu et al. find that general time-series and ECG foundation models reach a top performance rate of 80 percent [@Xu_2025].

Two sources question the evaluation itself. Berger et al. show that best practice for imbalanced multi-label evaluation changes which representation ranks best, and that a random encoder with linear evaluation matches pretraining on many tasks [@arxiv_2602_17531]. Filice et al. add representation-level analysis to performance and score Gaussian mixture clusters of frozen embeddings by ARI against the clinical label and against dataset membership: ECGFounder and ECG-FM organise by label, while HuBERT-ECG and ECG-JEPA organise by dataset [@lookingbeyond2026]. That study is the nearest the literature comes to asking how frozen ECG embeddings cluster.

### T2. Unsupervised ECG analysis and clusterability of representations

Unsupervised ECG analysis partitions recordings into abnormality classes without cardiologist labels and can address the imbalance problem of supervised systems [@Nezamabadi_2023]. Prior work clusters one kind of representation: wavelet tensor features with spectral clustering on 12-lead ECG [@wavelettensorecg2018], hand-crafted single-lead markers that give clusters with distinct heart-failure risk [@Madrid_2025], convolutional variational autoencoder features that reflect ECG rhythms [@Jang_2021], and denoising autoencoder latents that associate with hundreds of diseases [@Friedman_2025]. Density-based clustering without a preset number of clusters is available as an alternative to k-means [@hdbscan2013].

Whether a learned latent space clusters well is not settled by its informativeness. In images, plain autoencoder latents show large inter-cluster overlaps [@Wheeldon_2023]. In self-supervised vision models, the encoder output has better and more stable clustering properties than other components, and a training objective can strengthen them [@sslclustering2025]. These sources concern image data; for ECG, the informativeness of autoencoder latents [@Friedman_2025; @Jang_2021] is shown through supervised associations, not through agreement of unsupervised clusters with rhythm labels.

Outside ECG, several sources separate what a linear probe recovers from what a partition of the same space shows. For frozen self-supervised representations, error bounds for linear-probe and nearest-centroid classification depend on the variance along class-separating directions, which collapses during pretraining even when the variance over all directions stays large, so that most within-class energy can lie in directions orthogonal to the task axes [@arxiv_2603_03530]. Anisotropic, skewed self-supervised representations degrade partition-based retrieval while their linear-probe and kNN accuracy is unaffected [@arxiv_2604_24469]. On the same pretext features, k-means reaches 65.9 percent accuracy on CIFAR-10 and degenerate, imbalanced clusters, against 87.6 percent for a neighbour-based clustering objective [@Van_Gansbeke_2020], and across 17 pretrained models a clustering head improves on k-means by 6.1 and 12.2 points on ImageNet and CIFAR-100 [@arxiv_2303_17896]. No source read measures linear-probe accuracy and clustering agreement on the same ECG representation.

The clusterer and the conditioner shape the partition. K-means tends to produce clusters of relatively uniform size whatever the true sizes, the uniform effect [@Hui_Xiong_2009; @Liang_2012], and it tends to imbalanced clusters on pretrained image features [@arxiv_2303_17896; @Van_Gansbeke_2020]; the two statements concern different settings, true imbalance in the data against degenerate assignments on balanced data. The choice of scaler changes the k-means result, with Z-score and percentile transformation ahead of RobustScaler and three other scalings on features of different units [@Wongoutong_2024]. Spectral clustering returns connected components as clusters when the similarity graph has more components than the clusters asked for, so the k-nearest neighbour graph should be chosen connected [@von_Luxburg_2007].

### T3. Hand-crafted rhythm and morphology features

AF detection features fall into atrial, ventricular and signal features, and only 22 percent of published methods use atrial features [@Wesselius_2021]. A compact set of hand-crafted features with SHAP-based selection reaches a mean F-score of 0.746 on CinC 2017 [@Rouhi_2021], and morphology, interval and RR features underlie the inter-patient heartbeat classification of de Chazal et al. [@dechazal2004]. Heart rate variability measures follow the Task Force standards [@hrvstandards1996], and NeuroKit2 provides validated extraction pipelines [@neurokit2021]. On PTB-XL, supervised convolutional networks outperform feature-based algorithms by a large margin [@Strodthoff_2021]; that comparison is supervised and leaves open how the two compare without labels.

### T4. Clustering evaluation

The adjusted Rand index of Hubert and Arabie [@hubertarabie1985] is the cluster validation measure of choice, other indices can be roughly mapped to its scale, classification rates should not be used for cluster validation, and a significance test for observed ARI exists [@Steinley_2004]. Information-theoretic measures corrected for chance form the second family [@vinh2010]. The two families disagree in when each should be used: ARI suits a reference with large equal-sized clusters and AMI an unbalanced reference with small clusters [@arxiv_1512_01286]. The silhouette gives a label-free measure of tightness and separation and a way to choose the number of clusters [@rousseeuw1987]. Standard implementations are in scikit-learn [@sklearn2011].

The reliability of internal indices is disputed. Traditional internal measures are unreliable for comparing partitions computed in different embedding spaces and suffer from the curse of dimensionality on the input data [@Wang_2026], and some validation measures, entropy among them, do not register the uniform effect of k-means and give misleading information [@Hui_Xiong_2009]. Applied ECG clustering still reports the silhouette as validation: it sets the number of clusters for autoencoder embeddings of ECGs in diastolic dysfunction [@Shetty_2024], and it is the only validation reported for heartbeat clusters on an unlabelled wearable database [@Digiacomo_2025].

### T5. Statistical reporting

Cliff's ordinal dominance statistic is more robust than mean comparisons and invariant under transformation [@Cliff_1993], and the simple difference formula gives an effect size for the Mann-Whitney and Wilcoxon tests [@Kerby_2014]. The bootstrap estimates the sampling distribution of a statistic from the data [@Efron_1979], and FOUND-AF uses paired recording-level bootstrap comparisons with Holm correction to compare encoders [@arxiv_2608_03597]. Steinley's significance test for ARI [@Steinley_2004] completes the tools for the effect sizes and intervals the referees ask for.

### T6. Federated learning and federated clustering

Federated averaging trains a shared model from local updates and is robust to unbalanced and non-IID data [@fedavg2017], and its accuracy falls as client distributions grow more skewed under Dirichlet partitions [@arxiv_1909_06335]. In health care, federated learning is a route around data silos and privacy limits [@Rieke_2020]. For clustering, k-FED shows that heterogeneity can weaken the separation requirement when each device holds few clusters [@arxiv_2103_00697], DWF k-means matches centralized k-means in its settings [@arxiv_2310_14858], and a one-shot hierarchical method targets non-IID biomedical data [@arxiv_2611_11481]. The sources agree that heterogeneity is the central issue, and they differ on whether it hurts (supervised averaging [@arxiv_1909_06335]) or can help (one-shot clustering [@arxiv_2103_00697]). Federated ECG work is supervised: Fed-CL trains an AF predictor across clients on the CinC 2020 data [@Alreshidi_2024].

### T7. Datasets

PTB-XL provides 21,837 records from 18,885 patients with recommended folds [@ptbxl2020], and its supervised benchmark is the reference for models on it [@Strodthoff_2021]. PhysioNet distributes these datasets [@physionet2000]. For AF, the CinC 2017 challenge provides 12,186 short single-lead recordings and documents substantial inter-expert disagreement in the labels [@clifford2017af]. For multi-class rhythm, Chapman-Shaoxing covers 11 rhythms in 10,646 patients [@Zheng_2020], and the CinC 2020 and 2021 challenges pool recordings from four countries and up to seven institutions [@Perez_Alday_2020; @Reyna_2021]. MIT-BIH remains the reference beat-level arrhythmia database [@mitbih2001], with the inter-patient split of [@dechazal2004]. Berger et al. note that the field has converged on three multi-label benchmarks dominated by arrhythmia and morphology labels [@arxiv_2602_17531].

### T8. Compute and deployment cost

FOUND-AF profiles model size, inference time and memory and finds ECGFounder favourable in accuracy against cost [@arxiv_2608_03597]. Al-Masud et al. benchmark GFLOPs, memory and inference speed and find a compact state-space model several times more efficient than transformers [@arxiv_2509_25095]. For supervised pipelines, Pham et al. find that feature-based XGBoost has long inference times because of costly preprocessing while 1D convolutional models are the most energy efficient [@arxiv_2303_11429], and Wheeldon and Serb design a clustering algorithm for low memory and operation counts on accelerators [@Wheeldon_2023]. None of these measures the cost of an unsupervised pipeline.

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Nezamabadi_2023, arxiv_2410_19877, lookingbeyond2026, arxiv_2602_17531, Wesselius_2021, Rieke_2020, Lunelli_2026, arxiv_2603_03530 |
| Literature Review | lookingbeyond2026, Lunelli_2026, arxiv_2509_25095, arxiv_2608_03597, mehari2022ssl, clocs2021, threekg2021, arxiv_2402_09450, arxiv_2410_08559, Xu_2025, Nezamabadi_2023, wavelettensorecg2018, Madrid_2025, Jang_2021, Friedman_2025, sslclustering2025, Rouhi_2021, arxiv_2103_00697, Alreshidi_2024, mitbih2001, arxiv_2603_03530, Van_Gansbeke_2020, Wang_2026 |
| Methodology | ptbxl2020, physionet2000, dechazal2004, hrvstandards1996, neurokit2021, Wesselius_2021, hubertecg2024, ecgfounder2024, McKeen_2025, Strodthoff_2021, hubertarabie1985, Steinley_2004, arxiv_1512_01286, vinh2010, rousseeuw1987, hdbscan2013, sklearn2011, Cliff_1993, Kerby_2014, Efron_1979, fedavg2017, arxiv_1909_06335, Zheng_2020, Perez_Alday_2020, Reyna_2021, clifford2017af, Wongoutong_2024, Hui_Xiong_2009 |
| Discussion | arxiv_2602_17531, arxiv_2608_03597, arxiv_2509_25095, arxiv_1512_01286, Wheeldon_2023, Friedman_2025, Madrid_2025, sslclustering2025, arxiv_2503_00711, arxiv_2403_06659, arxiv_2103_00697, arxiv_2310_14858, arxiv_2611_11481, arxiv_2303_11429, Zheng_2020, Reyna_2021, clifford2017af, arxiv_2603_03530, arxiv_2604_24469, Van_Gansbeke_2020, arxiv_2303_17896, Wongoutong_2024, Liang_2012, Hui_Xiong_2009, von_Luxburg_2007, Wang_2026, Digiacomo_2025, Shetty_2024 |

## 9. No entry written

None. Every included external source has an entry in refs.bib from `lookup.py bibtex`, and the 21 included .bib entries are already in the manuscript's .bib, including vinh2010, sklearn2011, fedavg2017, clocs2021 and threekg2021, which carry no DOI there.

## 10. Search limitations and gate failures

- Currency gate not met. Sources from 2022 to 2026 are 31 of 66 (47 percent), below the 50 percent the gate requires. The gate's action was taken once: the search g_recent for the last 3 years with preprints, tagged as preprints, added recent sources, and the share still falls short. The reason is the method and statistics base of the question: the clustering measures (1985, 1987, 2004, 2010, 2015), the effect sizes and the bootstrap (1979, 1993, 2014), the HRV standards (1996), the heartbeat feature set (2004), the k-means and spectral clustering references (2007, 2009, 2012) and the datasets (2000, 2001, 2017, 2020, 2021) are foundational and have no recent replacement. The foundation-model and federated themes are current: 25 sources are from 2024 to 2026.
- Index availability. OpenAlex and Semantic Scholar answered most calls with HTTP 429 after 3 retries, so most searches rested on Crossref and arXiv, and layer 4 rested mostly on Crossref (table in section 1). Semantic Scholar did answer most cited-by calls.
- Citation counts not obtained. The cited-by count of Goldberger et al. 2000 (physionet2000) could not be obtained (Semantic Scholar not found, OpenAlex HTTP 429), and Vinh et al. 2010 (vinh2010) has no DOI or arXiv ID in the .bib, so its count could not be looked up. Both are outside the 10-year range, and both are kept as foundational works of the field: the seminal rule's count of more than 100 is not verified for them.
- Abstracts not obtained. No abstract or text could be fetched for Hubert and Arabie 1985, the HRV standards 1996, Campello et al. 2013 and Vinh et al. 2010; their Method and Key results fields are marked as gaps, and the abstract of Kerby 2014 is cut short in the indexes.
- No ECG source measures both linear separability and clusterability of the same representations: neither t9_sep and l4_sep nor the searches of section 11 returned one. The sources that state the divergence concern image representations.
- Three items of section 11 are left without a source that states the claim: item 3 (lead II as the standard rhythm lead), the two claims of item 4 (robust scaling as a common default for physiological signals; heavy-tailed features dominating Euclidean distance after it), and item 6 (internal indices maximized by degenerate partitions). They carry into the outline as coverage limits.

## 11. Sections of the outline that need literature

The planner's outline (outline.md, list "Needs literature") marks eight items. For each, the search of section 1 ran within 4 passes: Boolean strings (layer 1), title lookups with `lookup.py resolve` for works the screening named, citation chaining and forward tracking (layers 2 and 3), and sentence searches (layer 4). All searches were run on 2026-11-15 with `--limit 100`. OpenAlex was left out of every search with "HTTP 429 after 3 retries"; Semantic Scholar was left out with the same reason or returned no record in every search; arXiv returned no record for the sentence searches. arXiv returned no record for nine of the Boolean strings as well. The searches therefore rested on Crossref, and on arXiv for the remaining Boolean strings.

Passes. Pass 1 ran 16 searches (1,783 records), pass 2 ran 5 searches and 8 title lookups (501 records), and pass 3 ran 4 searches (401 records, 271 titles not seen in passes 1 and 2, none included at screening). Layers 2 and 3: `refs` on Van Gansbeke et al. 2020 (63 records) and Wang and Ye 2026 (arXiv 2403.14830, 64 records), on Liang et al. 2012 and Digiacomo et al. 2025 (0 records, Semantic Scholar not found); `cited-by` on Van Gansbeke et al. 2020 (100, more exist) and Weng et al. 2025 (12). The search stopped after pass 3, since its last searches added no included source. Eleven sources were included; 2,211 unique titles were screened from the searches.

Screening of the candidates read at full text or abstract, besides the eleven included:

| Candidate | Item | Decision |
|---|---|---|
| Tarpey 2007, Linear transformations and the k-means clustering algorithm (doi 10.1198/000313007x171016) | 1, 4 | Excluded at node 2: outside the range, and its cited-by listing holds 88 works, below the seminal threshold of 100 |
| Kligfield et al. 2007, AHA recommendations, part I (doi 10.1161/CIRCULATIONAHA.106.180200) | 3 | Excluded at node 3: its abstract does not address the rhythm lead; no full text was available |
| Spodick 2001 and 2003, Misleading and Deceptiveness of lead II as a "rhythm strip" | 3 | Excluded at node 4: no abstract and no text could be fetched |
| Zhou and Yang 2019, Effect of cluster size distribution on clustering | 5 | Excluded at node 4: no abstract and no text could be fetched |
| Liu et al. 2010 and 2013, internal clustering validation measures; Arbelaitz et al. 2013; Gurrutxaga et al. 2011; Tomasini et al. 2017; Hamalainen et al. 2017 | 6 | Excluded at node 3: their abstracts and texts compare internal indices and do not state that degenerate partitions maximize them |
| Rashkovska et al. 2016; Rodriguez-Sotelo et al. 2007; Annam and Surampudi 2016; Madrid et al. 2024 (J Electrocardiol); Madrid et al. 2025 (CinC) | 8 | Excluded at node 3: none reports the silhouette or purity as validation (Madrid et al. 2025 selects k by the elbow of the sum of squared errors) |
| Luthra et al. 2026 (arXiv 2609.38393), Which tasks survive self-supervised learning | 1 | Excluded at node 3: it characterizes recoverability by linear probes and does not compare them with clustering |
| Hu et al. 2026, VLM4Cluster | 1 | Excluded at node 3: a benchmark of clustering methods without linear-probe comparison |

### Item 1. Linear-probe accuracy diverging from clustering agreement on the same representation (Introduction 1.1, Related work 2.2.2, Discussion 5.1)

- Searches: s1a ("linear probe" OR "linear evaluation" OR "linear probing") AND ("k-means" OR "clustering") AND ("self-supervised" OR "representations"), 164 records; s1b ("clusterability" OR "cluster structure") AND ("linear separability") AND ("representations"), 110; s1sem 'representations with high linear probe accuracy but poor k-means clustering accuracy', 100; s1c ("k-means") AND ("linear evaluation" OR "linear probe") AND ("pretrained features" OR "self-supervised features") AND ("image clustering"), 100; s1d ("linear probing" OR "linear evaluation") AND ("k-means") AND ("clustering accuracy"), 100; title lookups of SCAN and of Adaloglou et al.; refs and cited-by of Van Gansbeke et al. 2020 and cited-by of Weng et al. 2025.
- Sources found: arxiv_2603_03530 (Luthra et al. 2026) states the mechanism: linear-probe and nearest-centroid error depend on the variance along class-separating directions, which can be small while the variance over all directions stays large. arxiv_2604_24469 (Rodriguez-Betancourt and Casasola-Murillo 2026) reports partition-based retrieval degrading while linear-probe and kNN accuracy is unaffected. Van_Gansbeke_2020 and arxiv_2303_17896 report that k-means under-recovers the class structure that the same features hold.
- Outcome: the phenomenon can be credited to prior work in self-supervised vision representations through these four sources, with sslclustering2025 kept as background on clustering properties of SSL components. No source measures linear-probe accuracy and clustering agreement on the same ECG representation, which keeps the ECG measurement as this paper's contribution.

### Item 2. What lookingbeyond2026 reports (Related work 2.4, Discussion 5.2)

Settled by reading the full text, fetched with `lookup.py fetch 2601.21830` (arXiv HTML). The passages:

- Method: "for inter-cluster evaluation we compute two complementary metrics: centroid separation Fisher (1936), which assesses whether classes are globally distinct in the embedding space by quantifying the normalized distance between centroids, and Adjusted Rand Index (ARI) Hubert and Arabie (1985), which measures cluster separability (i.e., whether and, possibly, to which extent different clusters exhibit overlaps). For the latter, we obtain the needed clusters via Gaussian Mixture Models (GMM) Reynolds (2015)."
- Method: "Label-level separability measures the ability of the embedding space to discriminate between clinical classes, while dataset-level separability captures domain-specific structure induced by differences in acquisition protocols, populations, preprocessing pipelines or pretraining techniques."
- Table 4 caption: "Label-level and dataset-level separability across FMs' embedding spaces. Metrics are reported separately for CD and AF classes." Its ARI (label) values for AF are 0.64 (ECG-FM), 0.70 (ECGFounder), 0.00, 0.04 and 0.01 (HuBERT-ECG small, base, large) and 0.00 (ECG-JEPA); for CD, 0.23, 0.24, 0.12, 0.02, 0.03 and 0.07. Table 4 gives one value per model and label, with no per-dataset breakdown.
- Results: "Across all models, ECGFounder and ECG-FM correctly optimize the dataset-level and label-level separability (Table 4), tending to minimize the first while maximizing the second."
- Results: "Conversely, HuBERT-ECG and ECG-JEPA exhibit a systematically higher dataset-level separability w.r.t. label-level separability, particularly when considering kNN agreement and ARI (Table 4). This confirms that such model retain dataset-dependent information, thus suggesting that the global organization of the embedding space is driven by dataset-specific characteristics rather than by the clinical label."
- Datasets: Table 2 marks AF presence as absent for PTX (PTB-XL) and present for CODE-15%, Georgia and Chapman-Shaoxing; the text adds: "However, the considered datasets include a limited number of AF-positive samples; consequently, some datasets could not be evaluated for this classification task."
- PTB-XL: "Importantly, among all the datasets, PTX emerges as a particularly challenging one for FMs to embed, as evidenced by both degraded performance and embedded representation evaluation."
- Prior work: "Nonetheless, none of these works include a representation-wise evaluation in their benchmark: instead, they focus on performances over downstream tasks."
- The text names no hand-crafted features and no MIT-BIH; its datasets are Georgia, CODE-15%, PTB-XL and Chapman-Shaoxing plus Ningbo.

What this settles for the draft's statements (main.tex lines 122 to 125, 179 to 185, 466 to 468, 777 to 778):

- "a cluster-separability analysis on PTB-XL" and "reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL": supported only in part. The source reports ARI of GMM clusters per label in one table over its four datasets, not a PTB-XL result, and it does not evaluate AF on PTB-XL at all. The accurate statement is that it reports ARI against the CD and AF labels and against dataset membership across four datasets, PTB-XL among them for CD only.
- "some models cluster by clinical label while others cluster by dataset": supported by the two Results passages above (ECGFounder and ECG-FM by label; HuBERT-ECG and ECG-JEPA by dataset).
- "By its own statement it does not include a representation-wise comparison against hand-crafted features": not supported. The source never mentions hand-crafted features; its own statement is that prior benchmarks lack a representation-wise evaluation. The absence of hand-crafted features and of MIT-BIH is an observation about the source, not its statement.
- "states that prior work omits a representation-wise evaluation": supported by the Prior work passage.
- "other foundation models, including some reported to cluster well": supported for ECG-FM, whose label-level ARI for AF is 0.64; ECGFounder, the other model with a high value, is one of the two models this paper tests.
- The strategist's earlier annotation, which said the cluster analysis was not chance-corrected against labels and that the source reports no external agreement against labels, was wrong; the annotation, gap 2 and the synthesis of T1 now state what the text reports.

### Item 3. Lead II as the standard rhythm lead (Methods 3.2)

- Searches: s3a ("lead II") AND ("rhythm strip" OR "rhythm lead") AND ("electrocardiogram" OR "ECG"), 100 records; s3b ("standardization and interpretation of the electrocardiogram") AND ("recommendations"), 100; s3sem 'lead II as the standard rhythm lead for arrhythmia monitoring and atrial fibrillation detection', 100; s3c ("rhythm strip") AND ("lead II") AND ("atrial activity" OR "P wave" OR "arrhythmia"), 100; s3d ("lead II") AND ("atrial fibrillation") AND ("single-lead" OR "single lead") AND ("detection"), 100; title lookup of the AHA recommendations, part I.
- No source found. The two Spodick notes whose titles question lead II as a "rhythm strip" (2001, 2003) have no abstract or text in the indexes, and the abstract of the AHA recommendations, part I does not address the rhythm lead. The sentence needs a source the user holds, or a rewording to what clifford2017af supports: that single-lead recordings are an established setting for automated AF detection.

### Item 4. Robust scaling as a common default for physiological signals, and heavy-tailed features dominating Euclidean distance after it (Results 4.1.2, Discussion 5.1)

- Searches: s4a ("feature scaling" OR "normalization" OR "standardization") AND ("clustering" OR "k-means") AND ("outliers" OR "heavy-tailed" OR "robust scaling"), 200 records; s4sem 'effect of data normalization methods on k-means clustering performance', 100; s4b ("robust scaler" OR "median and interquartile range") AND ("physiological signals" OR "ECG" OR "biosignal") AND ("normalization"), 100; s4c ("robust scaling" OR "RobustScaler" OR "interquartile range") AND ("outliers") AND ("Euclidean distance"), 100.
- Source found for a related claim: Wongoutong_2024 shows that the scaler changes the k-means result and that RobustScaler is not among the best of five scalings for features of different units.
- No source found for either claim as worded: no source read states that robust scaling is a common default for physiological signals, or that heavy-tailed features dominate Euclidean distance after it. The outline can cite Wongoutong_2024 for the dependence of k-means on the scaler and state the heavy-tail reading as this paper's explanation of its own result.

### Item 5. K-means and a 10 percent minority cluster (Results 4.4.1, Discussion 5.1)

- Searches: s5a ("k-means") AND ("imbalanced" OR "unbalanced") AND ("uniform effect" OR "cluster size"), 103 records; s5sem 'k-means tends to produce clusters of uniform size and fails on imbalanced data distributions', 100; title lookup of Xiong et al. 2009; cited-by counts of Xiong et al. 2009 and Liang et al. 2012 (100 or more each).
- Sources found: Hui_Xiong_2009 and Liang_2012 (the uniform effect: k-means produces clusters of relatively uniform size even when the true sizes vary); arxiv_2303_17896 and Van_Gansbeke_2020 add that k-means gives imbalanced clusters on pretrained image features, a different setting.
- Outcome: supported.

### Item 6. Internal indices maximized by degenerate partitions (Related work 2.3)

- Searches: s6a ("internal validity" OR "internal clustering validation" OR "cluster validity indices") AND ("comparative study" OR "bias") AND ("silhouette"), 103 records; s6sem 'internal cluster validity indices favour degenerate partitions or trivial solutions', 100; s6b ("internal validation" OR "internal clustering validation measures") AND ("skewed distributions" OR "subclusters" OR "monotonicity"), 101; s6c ("silhouette") AND ("degenerate" OR "trivial" OR "singleton") AND ("cluster validity" OR "number of clusters"), 101; title lookups of Liu et al. 2010 and Arbelaitz et al. 2013.
- No source found for the claim as worded. Sources found for related claims: Wang_2026 (internal measures are unreliable for comparing partitions computed in different embedding spaces) and Hui_Xiong_2009 (some validation measures do not register the uniform effect and give misleading information). The outline can state the degenerate-partition result as this paper's finding in 4.3 and cite Wang_2026 for the unreliability of internal indices across representation spaces, without citing rousseeuw1987 for it.

### Item 7. Spectral clustering on a poorly connected nearest-neighbour graph (Discussion 5.1)

- Searches: s7a ("spectral clustering") AND ("tutorial" OR "k-nearest neighbor graph") AND ("connected components" OR "graph construction"), 102 records; s7sem 'spectral clustering performance depends on the connectivity of the k-nearest neighbour similarity graph', 100; title lookup of von Luxburg 2007; its cited-by listing holds 100 or more works (arXiv 0711.0189).
- Source found: von_Luxburg_2007, which states that spectral clustering returns connected components as clusters when the similarity graph has more components than clusters asked for, and that the k-nearest neighbour graph should be chosen connected.
- Outcome: supported, if the draft's sentence is kept.

### Item 8. Applied ECG clustering that reports purity or the silhouette as validation (Discussion 5.2)

- Searches: s8a ("ECG" OR "electrocardiogram") AND ("clustering") AND ("silhouette" OR "purity" OR "Davies-Bouldin") AND ("heartbeat" OR "arrhythmia"), 101 records; s8sem 'unsupervised clustering of ECG heartbeats evaluated with silhouette score and cluster purity', 100; s8b ("electrocardiogram" OR "ECG") AND ("cluster analysis" OR "unsupervised clustering") AND ("silhouette coefficient" OR "silhouette score"), 100; refs of Digiacomo et al. 2025 (0 records).
- Sources found: Shetty_2024 (silhouette analysis sets the number of clusters for autoencoder embeddings of 96,921 ECGs) and Digiacomo_2025 (silhouette as the only validation on an unlabelled wearable heartbeat database, beside ARI and silhouette on MIT-BIH).
- Outcome: supported. The silhouette caution can rest on these two studies, without the earlier master's project.

## 12. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (claude-opus-5-5, through the /paper skill). The AI took part in research assistance (the search and the annotated bibliography) and drafting assistance (the synthesis). A person oversaw the process, and the authors take responsibility for the content.

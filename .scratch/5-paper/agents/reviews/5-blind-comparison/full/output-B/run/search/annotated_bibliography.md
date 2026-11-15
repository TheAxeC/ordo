# the search stage: Annotated bibliography

Produced by the search agent for the `full`-mode run. Every entry below was verified against a metadata record read during this phase; the record is named on the "Verified" line. Annotations are written from the abstract or metadata record that was read, never from memory. Where no abstract was available, the annotation says so and limits itself to what the metadata establishes.

Numbering here is a working index grouped by theme. Vancouver numbers in the manuscript are assigned in order of first citation by the drafting and citation agents. The BibTeX key of each entry is given in brackets and matches `references.bib`.

Evidence types follow the `cs_ml` profile: peer-reviewed journal article, peer-reviewed conference proceedings, archival preprint (arXiv), dataset record, clinical guideline, reporting guideline. Stance is relative to the paper's premise that an interpretable-by-design ECG model can be compared fairly with a clinical model and a CNN, and that its interpretation must be tested for faithfulness rather than asserted.

Verification sources used: PubMed records read through the NCBI E-utilities `efetch` and `esummary` pages (PMID given), Crossref REST API records (`https://api.crossref.org/works/<DOI>` or a filter query on the DOI), arXiv API records (`http://export.arxiv.org/api/query?id_list=<id>`), PMLR, NeurIPS and JMLR proceedings pages, the PhysioNet and Zenodo dataset pages, and the Semantic Scholar Graph API record for two papers without an abstract in Crossref.

## A. AI-ECG prediction of atrial fibrillation from sinus rhythm

### 1. [attia2019] Attia ZI, Noseworthy PA, Lopez-Jimenez F, Asirvatham SJ, Deshmukh AJ, Gersh BJ, et al. An artificial intelligence-enabled ECG algorithm for the identification of patients with atrial fibrillation during sinus rhythm: a retrospective analysis of outcome prediction. Lancet. 2019;394(10201):861-7. doi:10.1016/S0140-6736(19)31721-0
- Verified: PMID 31378392 (efetch); Crossref `https://api.crossref.org/works/10.1016/S0140-6736(19)31721-0`.
- Evidence type: peer-reviewed journal article. Method: retrospective CNN development on 649,931 sinus-rhythm ECGs from 180,922 patients. Quality: High. Stance: supports (the sinus-rhythm ECG carries AF information).
- Annotation: A CNN applied to a single 10-second 12-lead sinus-rhythm ECG identified patients with AF with AUC 0.87 (95% CI 0.86-0.88) in a test set of 130,802 ECGs from 36,280 patients; using all ECGs from the first month of the window raised the AUC to 0.90. This is the founding AI-ECG study for AF identification during sinus rhythm; the task is identification of concurrent or recent AF, which the paper should distinguish from dated incident prediction.
- Potential use: Introduction (motivation), Discussion (task definition, comparison).

### 2. [raghunath2021] Raghunath S, Pfeifer JM, Ulloa-Cerna AE, Nemani A, Carbonati T, Jing L, et al. Deep neural networks can predict new-onset atrial fibrillation from the 12-lead ECG and help identify those at risk of atrial fibrillation-related stroke. Circulation. 2021;143(13):1287-98. doi:10.1161/CIRCULATIONAHA.120.047829
- Verified: PMID 33588584 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Method: deep neural network on 1.6 M ECGs from 430,000 patients. Quality: High. Stance: supports.
- Annotation: A deep network predicted new-onset AF within 1 year in patients without prior AF with AUROC 0.85 and AUPRC 0.22; high-risk versus low-risk groups had a hazard ratio of 7.2 (95% CI 6.9-7.6) over 30 years, and a simulated deployment gave sensitivity 69%, specificity 81% and number needed to screen 9. It establishes 1-year incident AF from the ECG as a defined prediction task and reports the black-box CNN as the state of the art.
- Potential use: Introduction, Discussion (comparison of task and horizon).

### 3. [khurshid2022] Khurshid S, Friedman S, Reeder C, Di Achille P, Diamant N, Singh P, et al. ECG-based deep learning and clinical risk factors to predict atrial fibrillation. Circulation. 2022;145(2):122-33. doi:10.1161/CIRCULATIONAHA.121.057480
- Verified: PMID 34743566 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Method: CNN (ECG-AI) trained on 45,770 individuals, compared with CHARGE-AF and a combined model (CH-AI) in internal and two external sets. Quality: High. Stance: supports (fusion of ECG and clinical risk).
- Annotation: For 5-year incident AF, AUROCs of CHARGE-AF, ECG-AI and CH-AI were 0.802, 0.823 and 0.838 (MGH), 0.752, 0.747 and 0.777 (BWH) and 0.732, 0.705 and 0.746 (UK Biobank); the authors concluded the ECG and clinical approaches have similar usefulness and are complementary. This is the direct precedent for comparing an ECG model with a clinical risk-factor model and for fusing them.
- Potential use: Introduction, Methods (baseline rationale), Discussion.

### 4. [christopoulos2020] Christopoulos G, Graff-Radford J, Lopez CL, Yao X, Attia ZI, Rabinstein AA, et al. Artificial intelligence-electrocardiography to predict incident atrial fibrillation: a population-based study. Circ Arrhythm Electrophysiol. 2020;13(12):e009355. doi:10.1161/CIRCEP.120.009355
- Verified: PMID 33185118 (efetch and esummary); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Method: population cohort of 1,936 participants (Mayo Clinic Study of Aging). Quality: High. Stance: supports.
- Annotation: AI-ECG output and CHARGE-AF each independently predicted incident AF (HR 1.76 and 1.90 per SD), with C statistics 0.69, 0.69 and 0.72 for AI-ECG, CHARGE-AF and the combination. Supports the finding that ECG-based and clinical risk carry partly separate information and that a clinical baseline is a strong comparator.
- Potential use: Introduction, Discussion.

### 5. [biton2021] Biton S, Gendelman S, Ribeiro AH, Miana G, Moreira C, Ribeiro ALP, et al. Atrial fibrillation risk prediction from the 12-lead electrocardiogram using digital biomarkers and deep representation learning. Eur Heart J Digit Health. 2021;2(4):576-85. doi:10.1093/ehjdh/ztab071
- Verified: PMID 36713102 (efetch); Crossref filter query on the DOI (abstract present in Crossref).
- Evidence type: peer-reviewed journal article. Method: random forest on demographics, clinical data, engineered ECG features and deep representations; 1,130,404 recordings from 415,389 patients (Telehealth Network of Minas Gerais). Quality: High. Stance: supports (ECG features plus clinical information).
- Annotation: For 5-year AF risk, the model combining all feature types reached AUROC 0.909 against 0.839 for the best single modality. Shows that combining engineered (readable) ECG features, learned representations and clinical data improves AF risk prediction; the data come from the same network that produced CODE-15.
- Potential use: Introduction, Discussion.

### 6. [jabbour2024] Jabbour G, Nolin-Lapalme A, Tastet O, Corbin D, Jord<latin small letter a with grave> P, Sowa A, et al. Prediction of incident atrial fibrillation using deep learning, clinical models, and polygenic scores. Eur Heart J. 2024;45(46):4920-34. doi:10.1093/eurheartj/ehae595
- Verified: PMID 39217446 (efetch); Crossref `https://api.crossref.org/works/10.1093/eurheartj/ehae595`.
- Evidence type: peer-reviewed journal article. Method: deep learning on 669,782 sinus-rhythm ECGs from 145,323 patients (Montreal Heart Institute), external validation in MIMIC-IV. Quality: High. Stance: supports.
- Annotation: ECG-AI predicted 5-year incident AF or flutter with AUC-ROC 0.78 internally and 0.77 in the MIMIC-IV external set; in a 2,301-patient subgroup it exceeded CHARGE-AF (0.62) and a polygenic score (0.59). This is the closest verified prior use of MIMIC-IV for incident-AF prediction from sinus-rhythm ECGs, and it used MIMIC-IV only as an external test set.
- Potential use: Introduction (MIMIC-IV precedent), Discussion (comparison).

### 7. [yuan2023] Yuan N, Duffy G, Dhruva SS, Oesterle A, Pellegrini CN, Theurer J, et al. Deep learning of electrocardiograms in sinus rhythm from US veterans to predict atrial fibrillation. JAMA Cardiol. 2023;8(12):1131-9. doi:10.1001/jamacardio.2023.3701
- Verified: PMID 37851434 (efetch and esummary).
- Evidence type: peer-reviewed journal article. Method: CNN on outpatient sinus-rhythm ECGs from two VA networks (907,858 ECGs) with an external academic center. Quality: High. Stance: neutral (short-window task).
- Annotation: The model flagged AF within 31 days of a sinus-rhythm ECG with AUROC 0.86 (VA test) and 0.93 at the external center, Brier 0.02. Useful to separate short-window AF identification from the dated incident prediction with a blanking window that this paper uses.
- Potential use: Discussion (task definition).

### 8. [noseworthy2022] Noseworthy PA, Attia ZI, Behnken EM, Giblon RE, Bews KA, Liu S, et al. Artificial intelligence-guided screening for atrial fibrillation using electrocardiogram during sinus rhythm: a prospective non-randomised interventional trial. Lancet. 2022;400(10359):1206-12. doi:10.1016/S0140-6736(22)01637-3
- Verified: PMID 36179758 (efetch).
- Evidence type: peer-reviewed journal article (prospective trial). Method: 1,003 patients stratified by AI-ECG risk, up to 30 days of monitoring. Quality: High. Stance: supports (clinical use of ECG-based risk).
- Annotation: AF was detected in 7.6% of high-risk versus 1.6% of low-risk patients (OR 4.98), and AI-guided screening raised detection in the high-risk group from 3.6% under usual care to 10.6%. Establishes the clinical use case (targeted screening) that motivates operating points and risk strata.
- Potential use: Introduction, Discussion (clinical utility).

### 9. [ko2026] Ko M, Gadaleta M, Topol EJ, Muse ED, Quer G. Development and external validation of a contrastive learning foundation model for ECG-based prediction of cardiovascular diseases and outcomes. Lancet Digit Health. 2026;8(10):101092. doi:10.1016/j.landig.2026.101092
- Verified: PMID 42680677 (efetch and esummary).
- Evidence type: peer-reviewed journal article. Method: two-stage pretraining (masked reconstruction and ECG-text contrastive learning), MIMIC-IV used for external validation. Quality: High. Stance: neutral.
- Annotation: Among other tasks, the model predicted AF in patients starting from normal sinus rhythm; with only 10 positive labels, AF AUROC was 0.777 (95% CI 0.773-0.781) against 0.765 for the runner-up. The abstract does not state the AF label source in MIMIC-IV. Recent evidence that self-supervised pretraining is being applied to sinus-rhythm AF prediction and that MIMIC-IV is used as a validation set.
- Potential use: Introduction or Discussion (self-supervised pretraining, MIMIC-IV use).

### 10. [nolinlapalme2026] Nolin-Lapalme A, Sowa A, Delfrate J, Tastet O, Corbin D, Kulbay M, et al. Foundation models for electrocardiogram interpretation: clinical implications. Eur Heart J. 2026;47(18):2174-86. doi:10.1093/eurheartj/ehaf1119
- Verified: PMID 41568699 (efetch and esummary). The record lists an erratum (Eur Heart J. 2026;47(18):2223).
- Evidence type: peer-reviewed journal article. Method: self-supervised (DeepECG-SSL) versus supervised (DeepECG-SL) foundation models trained on over 1 million ECGs with labels from automated extraction of ECG reports. Quality: High. Stance: neutral.
- Annotation: For 5-year AF risk, DeepECG-SSL had AUROC 0.742 against 0.734 for DeepECG-SL; MIMIC-IV is among the external public datasets. Shows a small gain from self-supervision for AF risk and documents report-derived labels as common practice, against which this paper's ICD-10 labels can be contrasted.
- Potential use: Discussion (SSL benefit, label source).

### 11. [mckeen2025] McKeen K, Masood S, Toma A, Rubin B, Wang B. ECG-FM: an open electrocardiogram foundation model. JAMIA Open. 2025;8(5):ooaf122. doi:10.1093/jamiaopen/ooaf122
- Verified: PMID 41113504 (efetch and esummary).
- Evidence type: peer-reviewed journal article. Method: transformer pretrained with masked reconstruction and contrastive learning on 1.5 million ECGs; downstream benchmark built on MIMIC-IV-ECG. Quality: Medium (detection task). Stance: neutral.
- Annotation: Fine-tuned AUROC was 0.996 for AF detection and 0.929 for LVEF of 40% or less. Documents MIMIC-IV-ECG as a public benchmark, and shows that current AF detection on it is near ceiling, which separates detection from the harder incident-prediction task.
- Potential use: Methods (dataset context), Discussion (detection versus prediction).

### 12. [matsuo2026] Matsuo K, Sobue Y, Miyake T, Takeda K, Watanabe E, Matsuo H, et al. AI-ECG risk stratification for atrial fibrillation: real-world performance and explainability. JACC Adv. 2026;5(8):103036. doi:10.1016/j.jacadv.2026.103036
- Verified: PMID 42485714 (efetch).
- Evidence type: peer-reviewed journal article. Method: SVM, AdaBoost and neural network models on clinical and ECG-derived variables, 665 patients, external cohort; SHAP explanations. Quality: Medium (small cohort, AUROC of 1.00 for one model). Stance: supports the gap (explanation is post hoc).
- Annotation: AI-ECG alone reached AUROC 0.64-0.69, and models with CHADS2 and CHA2DS2-VASc scores reached 0.89-1.00. Interpretability came from post-hoc SHAP with no test of whether the attributions are faithful to the model. An example of current practice in "explainable" AF risk stratification.
- Potential use: Introduction (gap), Discussion.

### 13. [hammer2022] Hammer A, Malberg H, Schmidt M. Towards the prediction of atrial fibrillation based on interpretable ECG features. In: 2022 Computing in Cardiology Conference (CinC); 2022. doi:10.22489/CinC.2022.236
- Verified: Crossref `https://api.crossref.org/works/10.22489/CinC.2022.236`; abstract read on `https://cinc.org/2022/Program/accepted/236.html`.
- Evidence type: peer-reviewed conference proceedings. Method: 155 hand-crafted features on 644 five-minute segments preceding AF (MIT-BIH AF database), logistic regression and tree ensemble. Quality: Medium (small database, minutes-ahead horizon). Stance: supports (interpretable features carry pre-AF information).
- Annotation: Segments ending 5 minutes before AF onset differed most; PQ interval slope, PQ interval correlation and median RR time were the most relevant features, and a tree ensemble separated eight segment clusters with accuracy 0.87. Shows interpretable-feature AF prediction exists only at very short horizons on small data.
- Potential use: Introduction or Discussion (interpretable AF prediction).

## B. Clinical AF risk scores, epidemiology and guideline

### 14. [alonso2013] Alonso A, Krijthe BP, Aspelund T, Stepas KA, Pencina MJ, Moser CB, et al. Simple risk model predicts incidence of atrial fibrillation in a racially and geographically diverse population: the CHARGE-AF consortium. J Am Heart Assoc. 2013;2(2):e000102. doi:10.1161/JAHA.112.000102
- Verified: PMID 23537808 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Method: pooled cohorts (ARIC, CHS, FHS; 18,556 participants) with validation in AGES and Rotterdam. Quality: High. Stance: supports (clinical baseline).
- Annotation: The 5-year CHARGE-AF clinical model had C-statistic 0.765 (95% CI 0.748-0.781); adding ECG variables did not meaningfully improve it (0.767); external C-statistics were 0.664 (AGES) and 0.705 (RS). The standard clinical AF risk score and the reason a clinical risk-factor model is the baseline.
- Potential use: Introduction, Methods (clinical baseline rationale), Discussion.

### 15. [schnabel2009] Schnabel RB, Sullivan LM, Levy D, Pencina MJ, Massaro JM, D'Agostino RB Sr, et al. Development of a risk score for atrial fibrillation (Framingham Heart Study): a community-based cohort study. Lancet. 2009;373(9665):739-45. doi:10.1016/S0140-6736(09)60443-8
- Verified: PMID 19249635 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Method: 4,764 Framingham participants followed up to 10 years. Quality: High. Stance: supports (clinical baseline).
- Annotation: A clinical risk model reached C statistic 0.78 (95% CI 0.76-0.80); echocardiographic measures added little (0.79). Establishes age and clinical factors as strong AF predictors and the earlier Framingham AF risk score.
- Potential use: Introduction, Methods.

### 16. [kornej2020] Kornej J, B<latin small letter o with diaeresis>rschel CS, Benjamin EJ, Schnabel RB. Epidemiology of atrial fibrillation in the 21st century: novel methods and new insights. Circ Res. 2020;127(1):4-20. doi:10.1161/CIRCRESAHA.120.316340
- Verified: PMID 32716709 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (review). Quality: High. Stance: neutral (background).
- Annotation: Reviews the rising incidence and prevalence of AF with population ageing, modifiable risk factors, risk prediction, prognosis, and eHealth and AI developments. Background for the burden of AF and the need for risk prediction.
- Potential use: Introduction.

### 17. [hindricks2021] Hindricks G, Potpara T, Dagres N, Arbelo E, Bax JJ, Blomstr<latin small letter o with diaeresis>m-Lundqvist C, et al. 2020 ESC guidelines for the diagnosis and management of atrial fibrillation developed in collaboration with the European Association for Cardio-Thoracic Surgery (EACTS). Eur Heart J. 2021;42(5):373-498. doi:10.1093/eurheartj/ehaa612
- Verified: PMID 32860505 (efetch); Crossref filter query on the DOI.
- Evidence type: clinical guideline. Quality: High. Stance: neutral.
- Annotation: No abstract is available in PubMed or Crossref; the record establishes the guideline's identity and bibliographic details only. Cite only for the existence of the current ESC guideline on AF diagnosis and management; any specific statement drawn from it (for example the ICD-based or ECG-based definition of AF) needs the full text checked by the citation agent.
- Potential use: Introduction (AF definition), Methods (outcome definition), only after full-text check.

## C. Datasets and data infrastructure

### 18. [johnson2023] Johnson AEW, Bulgarelli L, Shen L, Gayles A, Shammout A, Horng S, et al. MIMIC-IV, a freely accessible electronic health record dataset. Sci Data. 2023;10(1):1. doi:10.1038/s41597-022-01899-x
- Verified: PMID 36596836 (efetch); Crossref filter query on the DOI.
- Evidence type: dataset descriptor (peer-reviewed journal article). Quality: High. Stance: neutral.
- Annotation: Describes MIMIC-IV, drawn from Beth Israel Deaconess Medical Center records, with measurements, orders, diagnoses, procedures, treatments and deidentified notes. Source of the hospital module that provides the ICD-10 I48 diagnoses used as gold labels.
- Potential use: Methods (data source), Data availability.

### 19. [gow2023] Gow B, Pollard T, Nathanson LA, Johnson A, Moody B, Fernandes C, et al. MIMIC-IV-ECG: diagnostic electrocardiogram matched subset (version 1.0). PhysioNet; 2023. doi:10.13026/4nqg-sb35
- Verified: PhysioNet project page `https://physionet.org/content/mimic-iv-ecg/1.0/` (title, 16 authors, version 1.0, 15 September 2023, DOI). The page also lists a latest-version DOI 10.13026/b95v-ff39; the version used must match `code/core/config.py` (file name `...matched-subset-1.0.zip`, so version 1.0).
- Evidence type: dataset record. Quality: High. Stance: neutral.
- Annotation: About 800,000 diagnostic 12-lead ECGs from nearly 160,000 patients, 10 seconds at 500 Hz, matched to the MIMIC-IV Clinical Database so ECGs can be linked to other modules. The primary cohort source.
- Potential use: Methods, Data availability.

### 20. [goldberger2000] Goldberger AL, Amaral LA, Glass L, Hausdorff JM, Ivanov PC, Mark RG, et al. PhysioBank, PhysioToolkit, and PhysioNet: components of a new research resource for complex physiologic signals. Circulation. 2000;101(23):e215-20. doi:10.1161/01.CIR.101.23.e215
- Verified: PMID 10851218 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (resource). Quality: High. Stance: neutral.
- Annotation: Introduces PhysioNet, with an archive of physiological recordings, open-source signal software and an online forum. The standard citation required for PhysioNet-hosted data (MIMIC-IV-ECG, PTB-XL).
- Potential use: Methods, Data availability.

### 21. [wagner2020] Wagner P, Strodthoff N, Bousseljot RD, Kreiseler D, Lunze FI, Samek W, et al. PTB-XL, a large publicly available electrocardiography dataset. Sci Data. 2020;7(1):154. doi:10.1038/s41597-020-0495-6
- Verified: PMID 32451379 (efetch); Crossref filter query on the DOI.
- Evidence type: dataset descriptor. Quality: High. Stance: neutral.
- Annotation: 21,837 ten-second 12-lead records from 18,885 patients, annotated by up to two cardiologists with multi-label diagnostic statements, with suggested folds. External dataset described in Methods (AF detection task).
- Potential use: Methods (external validation).

### 22. [ribeiro2020] Ribeiro AH, Ribeiro MH, Paix<latin small letter a with tilde>o GMM, Oliveira DM, Gomes PR, Canazart JA, et al. Automatic diagnosis of the 12-lead ECG using a deep neural network. Nat Commun. 2020;11(1):1760. doi:10.1038/s41467-020-15432-4
- Verified: PMID 32273514 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral.
- Annotation: A deep network trained on more than 2 million exams from the Telehealth Network of Minas Gerais (CODE study) outperformed cardiology residents for 6 abnormalities, with F1 above 80% and specificity over 99%. The study that produced the CODE data from which CODE-15 is sampled.
- Potential use: Methods (external dataset provenance).

### 23. [ribeiro2021code15] Ribeiro AH, Paixao GMM, Lima EM, Horta Ribeiro M, Pinto Filho MM, Gomes PR, et al. CODE-15%: a large scale annotated dataset of 12-lead ECGs (version 1.0.0). Zenodo; 2021. doi:10.5281/zenodo.4916206
- Verified: Zenodo record `https://zenodo.org/records/4916206` (10 creators, 9 June 2021, version 1.0.0, DOI).
- Evidence type: dataset record. Quality: High. Stance: neutral.
- Annotation: 345,779 exams from 233,770 patients, a stratified 15% sample of CODE (2010-2016), with `exams.csv` annotations including an AF flag, age, sex and follow-up for first exams. External dataset described in Methods.
- Potential use: Methods (external validation), Data availability.

## D. Tensor decomposition and block-term tensor regression

### 24. [delathauwer2008] De Lathauwer L. Decompositions of a higher-order tensor in block terms, part II: definitions and uniqueness. SIAM J Matrix Anal Appl. 2008;30(3):1033-66. doi:10.1137/070690729
- Verified: Crossref filter query on the DOI (abstract present in Crossref).
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (foundation).
- Annotation: Introduces decompositions of a tensor into block terms with specified mode-n ranks, gives conditions for essential uniqueness, and treats CP and Tucker as special cases. The definitional source for the block-term structure that BTTN parameterises.
- Potential use: Methods (model definition).

### 25. [kolda2009] Kolda TG, Bader BW. Tensor decompositions and applications. SIAM Rev. 2009;51(3):455-500. doi:10.1137/07070111X
- Verified: Crossref filter query on the DOI (abstract present).
- Evidence type: peer-reviewed journal article (survey). Quality: High. Stance: neutral.
- Annotation: Surveys higher-order tensor decompositions, especially CP and Tucker, their applications and software. Standard reference for tensor notation (mode-n product, CP, Tucker) used in Methods.
- Potential use: Methods (notation).

### 26. [zhao2013] Zhao Q, Caiafa CF, Mandic DP, Chao ZC, Nagasaka Y, Fujii N, et al. Higher order partial least squares (HOPLS): a generalized multilinear regression method. IEEE Trans Pattern Anal Mach Intell. 2013;35(7):1660-73. doi:10.1109/TPAMI.2012.254
- Verified: PMID 23681994 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral.
- Annotation: HOPLS predicts a tensor from a tensor via latent variables, modelling data as a sum of orthogonal Tucker blocks fitted by deflation and higher-order SVD; it outperformed alternatives on ECoG movement decoding. The multilinear regression lineage that BTTR builds on.
- Potential use: Methods or Introduction (tensor regression background).

### 27. [camarrone2019] Camarrone F, Van Hulle MM. Fast multiway partial least squares regression. IEEE Trans Biomed Eng. 2019;66(2):433-43. doi:10.1109/TBME.2018.2847404
- Verified: PMID 29993452 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral.
- Annotation: Proposes fast HOPLS (fHOPLS), significantly faster than HOPLS with comparable regression performance on synthetic data and an ECoG task, both beating unfolded PLS. Part of the BTTR lineage from the group that wrote the vendored `bttrlib`.
- Potential use: Methods (baseline lineage).

### 28. [faes2024] Faes A, Camarrone F, Van Hulle MM. Single finger trajectory prediction from intracranial brain activity using block-term tensor regression with fast and automatic component extraction. IEEE Trans Neural Netw Learn Syst. 2024;35(7):8897-908. doi:10.1109/TNNLS.2022.3216589
- Verified: PMID 36395140 (efetch); Crossref bibliographic query.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (linear baseline).
- Annotation: Proposes two tensor factorizations and a marginalization procedure for block-term tensor regression (BTTR) with automatic component extraction, predicting single-finger trajectories from intracranial recordings better than vector- or matrix-based methods. The method implemented by the vendored `bttrlib` (ACE component extraction) that serves as the linear BTTR baseline.
- Potential use: Methods (BTTR baseline).

### 29. [faes2022] Faes A, Van Hulle MM. Finger movement and coactivation predicted from intracranial brain activity using extended block-term tensor regression. J Neural Eng. 2022;19(6):066011. doi:10.1088/1741-2552/ac9a75
- Verified: PMID 36240727 (efetch); Crossref bibliographic query (article number 066011).
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral.
- Annotation: Introduces extended BTTR (eBTTR) using recursive Tucker decomposition with automatic component extraction, predicting finger trajectories and coactivations more accurately than multilinear and deep learning regressors at lower cost. Supports the statement that block-term regression is the linear predecessor of BTTN; the `score_vector_matrix` option in `bttrlib` refers to this paper.
- Potential use: Methods (BTTR lineage).

### 30. [yokota2014] Yokota T, Cichocki A. Multilinear tensor rank estimation via sparse Tucker decomposition. In: 2014 Joint 7th International Conference on Soft Computing and Intelligent Systems (SCIS) and 15th International Symposium on Advanced Intelligent Systems (ISIS); 2014. p. 478-83. doi:10.1109/SCIS-ISIS.2014.7044685
- Verified: Crossref bibliographic query (DOI, title, authors, pages). No abstract was read.
- Evidence type: peer-reviewed conference proceedings. Quality: Medium. Stance: neutral.
- Annotation: Metadata only. Cited in the vendored `code/bttrlib/ace.py` as the source of the sparse Tucker rank-estimation step inside ACE; cite only if Methods describes that step of the BTTR baseline.
- Potential use: Methods (BTTR baseline detail), optional.

### 31. [hunyadi2014] Hunyadi B, Camps D, Sorber L, Van Paesschen W, De Vos M, Van Huffel S, et al. Block term decomposition for modelling epileptic seizures. EURASIP J Adv Signal Process. 2014;2014:139. doi:10.1186/1687-6180-2014-139
- Verified: Crossref filter query on the DOI (article number 139, 7 authors); Semantic Scholar Graph API `https://api.semanticscholar.org/graph/v1/paper/DOI:10.1186/1687-6180-2014-139` (abstract, last author De Lathauwer L).
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (prior interpretable BTD in biosignals).
- Annotation: Applies block term decomposition with rank-(Lr,Lr,1) terms to wavelet-transformed EEG tensors, capturing nonstationary seizure patterns that rank-1 CPD misses, and outperforming CPD on real recordings. Prior art for block terms as interpretable biosignal components, used as an unsupervised decomposition rather than a supervised predictive layer.
- Potential use: Introduction or Discussion (related work).

### 32. [goulart2020] Goulart JHM, de Oliveira PMR, Farias RC, Zarzoso V, Comon P. Alternating group lasso for block-term tensor decomposition and application to ECG source separation. IEEE Trans Signal Process. 2020;68:2682-96. doi:10.1109/TSP.2020.2985591
- Verified: Crossref bibliographic query; Semantic Scholar Graph API `https://api.semanticscholar.org/graph/v1/paper/DOI:10.1109/TSP.2020.2985591` (abstract).
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (prior BTD on AF ECG).
- Annotation: Proposes a provably convergent alternating group lasso that estimates block-term model parameters and structure jointly; applied to atrial activity extraction from ECG during AF, it selected suitable structures and recovered multiple physiologically interpretable signals. Prior art for block terms on the AF ECG, used for source separation during AF rather than prediction from sinus rhythm.
- Potential use: Introduction or Discussion (related work).

### 33. [kim2017] Kim Y, El-Kareh R, Sun J, Yu H, Jiang X. Discriminative and distinct phenotyping by constrained tensor factorization. Sci Rep. 2017;7(1):1114. doi:10.1038/s41598-017-01139-y
- Verified: PMID 28442772 (efetch).
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (supervised tensor factors on the predictive path).
- Annotation: A supervised nonnegative CP factorization of diagnosis-by-prescription tensors on MIMIC-III produced phenotypes (for example sepsis with acute kidney injury) and outperformed APACHE II and SAPS II for ICU mortality. The supervised CP phenotyping prior art named in the project's novelty note: tensor factors that are both predictive and readable.
- Potential use: Discussion (related work).

## E. Block-term tensor neural networks and multilinear interpretable networks

### 34. [ye2018] Ye J, Wang L, Li G, Chen D, Zhe S, Chu X, et al. Learning compact recurrent neural networks with block-term tensor decomposition. In: Proceedings of the 2018 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR); 2018. p. 9378-87. doi:10.1109/CVPR.2018.00977. arXiv:1712.05134
- Verified: Crossref bibliographic query (DOI, pages); arXiv API record 1712.05134v2 (comment "CVPR2018").
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: neutral (distinguish).
- Annotation: Uses block-term decomposition to compress RNN weights (BT-RNN), approximating the original networks better than tensor-train RNNs with far fewer parameters (17,388-fold reduction for BT-LSTM on UCF11). Block terms inside a network were introduced for weight compression, with factors not read as signatures of the input.
- Potential use: Introduction or Discussion (related work, name distinction).

### 35. [li2017btnets] Li G, Ye J, Yang H, Chen D, Yan S, Xu Z. BT-Nets: simplifying deep neural networks via block term decomposition. arXiv:1712.05689 [Preprint]. 2017.
- Verified: arXiv API record 1712.05689v1 (no journal reference).
- Evidence type: archival preprint. Quality: Medium. Stance: neutral (distinguish).
- Annotation: Replaces fully connected layers with block-term layers that reshape inputs and outputs into tensors, compressing parameters while largely preserving representational power. Second weight-compression use of block terms in networks.
- Potential use: Related work.

### 36. [ye2020] Ye J, Li G, Chen D, Yang H, Zhe S, Xu Z. Block-term tensor neural networks. Neural Netw. 2020;130:11-21. doi:10.1016/j.neunet.2020.05.034. arXiv:2010.04963
- Verified: PMID 32589587 (efetch); Crossref bibliographic query; arXiv API record 2010.04963v2.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (distinguish; name collision).
- Annotation: Approximates DNN weight matrices with low-rank block-term tensors (BT-layers) in CNNs and RNNs for large compression with maintained or improved representational power. The paper's title is literally "block-term tensor neural networks", so the manuscript must state how BTTN differs (factorising the input tensor into readable frequency and lead factors on the predictive path, rather than compressing weights).
- Potential use: Introduction, Discussion (name and mechanism distinction).

### 37. [vandenkerchove2025] Van Den Kerchove A, Si-Mohammed H, Cabestaing F, Van Hulle MM. BTTDA: block-term tensor discriminant analysis for brain-computer interfacing. arXiv:2511.04292 [Preprint]. 2025.
- Verified: arXiv API record 2511.04292v1 (6 November 2025; no journal reference).
- Evidence type: archival preprint. Quality: Medium. Stance: neutral (closest prior art for supervised interpretable block terms).
- Annotation: Extends higher-order discriminant analysis with a block-term forward model and deflation for EEG feature extraction, reaching ROC-AUC 91.25% on ERP data and a modest gain on motor imagery (MOABB benchmarks). Supervised block-term features used as a standalone extractor followed by a classifier, not trained end-to-end with a nonlinear head or a survival objective.
- Potential use: Introduction or Discussion (related work).

### 38. [dooms2025] Dooms T, Gauderis W, Wiggins GA, Oramas J. Compositionality unlocks deep interpretable models. arXiv:2504.02667 [Preprint]. 2025.
- Verified: arXiv API record 2504.02667v1 (3 April 2025; no journal reference).
- Evidence type: archival preprint. Quality: Medium. Stance: neutral (closest conceptual prior art).
- Annotation: Introduces chi-net, combining tensor-network multilinear structure with deep network capacity, claimed to match baseline accuracy, and evaluates a diagonalisation algorithm (ODT) that uncovers low-rank structure in a multilayer SVHN model for weight-based interpretability. Prior art for intrinsic interpretability from multilinear structure; generic image models without named physiological signatures or a clinical outcome.
- Potential use: Discussion (related work).

### 39. [bohle2022] B<latin small letter o with diaeresis>hle M, Fritz M, Schiele B. B-cos networks: alignment is all we need for interpretability. In: 2022 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR); 2022. p. 10319-28. doi:10.1109/CVPR52688.2022.01008. arXiv:2205.10268
- Verified: Crossref bibliographic query (DOI, pages); arXiv API record 2205.10268v1.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports (interpretable by design at competitive accuracy).
- Annotation: Replacing linear transforms with a B-cos transform makes the network collapse into a single input-dependent linear transform that summarises its computation, with ImageNet accuracy similar to standard VGG, ResNet, Inception and DenseNet. A by-design route to explanations that are the model's computation.
- Potential use: Introduction, Discussion.

## F. Interpretable by design versus post-hoc explanation; concept bottlenecks and leakage

### 40. [rudin2019] Rudin C. Stop explaining black box machine learning models for high stakes decisions and use interpretable models instead. Nat Mach Intell. 2019;1(5):206-15. doi:10.1038/s42256-019-0048-x
- Verified: PMID 35603010 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (perspective). Quality: High. Stance: supports.
- Annotation: Argues that explaining black boxes in high-stakes settings such as healthcare can perpetuate bad practice, and that interpretable models should be used instead, with example applications. The principal argument for an interpretable-by-design model.
- Potential use: Introduction.

### 41. [ghassemi2021] Ghassemi M, Oakden-Rayner L, Beam AL. The false hope of current approaches to explainable artificial intelligence in health care. Lancet Digit Health. 2021;3(11):e745-50. doi:10.1016/S2589-7500(21)00208-9
- Verified: PMID 34711379 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (viewpoint). Quality: High. Stance: opposes in part (doubts explainability; favours validation).
- Annotation: Argues that current explainability methods are unlikely to provide the trust, transparency and bias mitigation expected for patient-level decisions, describes failure cases, and recommends rigorous internal and external validation instead. The counter-position the paper must address: it supports measuring faithfulness and validating rather than asserting interpretability.
- Potential use: Introduction, Discussion.

### 42. [koh2020] Koh PW, Nguyen T, Tang YS, Mussmann S, Pierson E, Kim B, et al. Concept bottleneck models. In: Proceedings of the 37th International Conference on Machine Learning. PMLR; 2020. p. 5338-48. (Proceedings of Machine Learning Research; vol. 119). arXiv:2007.04612
- Verified: PMLR page `https://proceedings.mlr.press/v119/koh20a.html`; arXiv API record 2007.04612v3.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports (interpretable intermediate layer at competitive accuracy).
- Annotation: Models that first predict human-specified concepts and then the label reach accuracy competitive with end-to-end models on x-ray grading and bird identification and allow test-time concept intervention. The template for an interpretable intermediate representation on the predictive path.
- Potential use: Introduction, Discussion.

### 43. [mahinpei2021] Mahinpei A, Clark J, Lage I, Doshi-Velez F, Pan W. Promises and pitfalls of black-box concept learning models. arXiv:2106.13314 [Preprint]. 2021.
- Verified: arXiv API record 2106.13314v1.
- Evidence type: archival preprint. Quality: Medium. Stance: supports the need for faithfulness tests.
- Annotation: Shows that learned concept representations leak information beyond the predefined concepts and that common mitigations only partly work, which can make explanations misleading. Motivates testing whether a nonlinear head reads information outside the interpretable block scores.
- Potential use: Methods (rationale for control probes), Discussion.

### 44. [havasi2022] Havasi M, Parbhoo S, Doshi-Velez F. Addressing leakage in concept bottleneck models. In: Advances in Neural Information Processing Systems 35 (NeurIPS 2022); 2022. p. 23386-97. doi:10.52202/068431-1699
- Verified: NeurIPS proceedings page `https://proceedings.neurips.cc/paper_files/paper/2022/hash/944ecf65a46feb578a43abfd5cddd960-Abstract.html`; Crossref filter query on the DOI (pages 23386-23397).
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports the need for faithfulness tests.
- Annotation: Shows that training the label predictor on soft concept probabilities improves accuracy but lets information leak, corrupting concept predictions and weakening intervention, and proposes a side channel and an autoregressive concept predictor. Leakage is the failure mode the BTTN faithfulness and intervention tests are designed to detect.
- Potential use: Methods, Discussion.

## G. Faithfulness evaluation and post-hoc attribution

### 45. [adebayo2018] Adebayo J, Gilmer J, Muelly M, Goodfellow I, Hardt M, Kim B. Sanity checks for saliency maps. In: Advances in Neural Information Processing Systems 31 (NeurIPS 2018); 2018. arXiv:1810.03292
- Verified: NeurIPS proceedings page `https://proceedings.neurips.cc/paper_files/paper/2018/hash/294a8ed24b1ad22ec2e7efea049b8737-Abstract.html`; arXiv API record 1810.03292v3. Page numbers were not shown on the official page and are omitted.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports (post-hoc saliency can be unfaithful).
- Annotation: Proposes model-parameter and data randomisation tests and shows that some saliency methods produce maps independent of the model and data, resembling edge detectors. Grounds the claim that post-hoc saliency on ECG CNNs needs validation and motivates control comparisons.
- Potential use: Introduction, Methods (control-probe rationale).

### 46. [hooker2019] Hooker S, Erhan D, Kindermans PJ, Kim B. A benchmark for interpretability methods in deep neural networks. In: Advances in Neural Information Processing Systems 32 (NeurIPS 2019); 2019. arXiv:1806.10758
- Verified: NeurIPS proceedings page `https://proceedings.neurips.cc/paper/2019/hash/fe4b8556000d0f0cae99daa5c5c5a410-Abstract.html`; arXiv API record 1806.10758v3. Page numbers omitted (not on the official page).
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports.
- Annotation: Proposes measuring how well feature-importance estimates identify truly important features by removing them and retraining (ROAR); many popular methods were no better than random, and only VarGrad and SmoothGrad-Squared clearly outperformed it. Precedent for intervention-based faithfulness testing such as the intervention curve and block-structure ablation.
- Potential use: Methods (intervention test rationale).

### 47. [jacovi2020] Jacovi A, Goldberg Y. Towards faithfully interpretable NLP systems: how should we define and evaluate faithfulness? In: Proceedings of the 58th Annual Meeting of the Association for Computational Linguistics; 2020. p. 4198-205. doi:10.18653/v1/2020.acl-main.386
- Verified: Crossref filter query on the DOI; arXiv API record 2004.03685v3.
- Evidence type: peer-reviewed conference proceedings (position paper). Quality: High. Stance: neutral (definitions).
- Annotation: Surveys faithfulness evaluation, separates faithfulness from plausibility, and argues for a graded rather than binary notion of faithfulness with guidelines for evaluation. Source for defining faithfulness as agreement between an interpretation and the model's actual reasoning, measured in degrees.
- Potential use: Methods (definition of faithfulness).

### 48. [sundararajan2017] Sundararajan M, Taly A, Yan Q. Axiomatic attribution for deep networks. In: Proceedings of the 34th International Conference on Machine Learning. PMLR; 2017. p. 3319-28. (Proceedings of Machine Learning Research; vol. 70). arXiv:1703.01365
- Verified: PMLR page `https://proceedings.mlr.press/v70/sundararajan17a.html`; arXiv API record 1703.01365v2.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: neutral.
- Annotation: Defines Sensitivity and Implementation Invariance axioms, shows most attribution methods fail them, and proposes Integrated Gradients. Representative post-hoc attribution method against which a by-design interpretation can be positioned.
- Potential use: Introduction or Discussion.

## H. ECG explainability

### 49. [hughes2021] Hughes JW, Olgin JE, Avram R, Abreau SA, Sittler T, Radia K, et al. Performance of a convolutional neural network and explainability technique for 12-lead electrocardiogram interpretation. JAMA Cardiol. 2021;6(11):1285-95. doi:10.1001/jamacardio.2021.2746
- Verified: PMID 34347007 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (post-hoc ECG explanation).
- Annotation: A CNN on 992,748 ECGs from 365,009 UCSF patients reached AUC of at least 0.960 for 32 of 38 classes, with LIME used to explain outputs; cardiologists still outperformed it on F1 for AF (0.881 vs 0.847). An example of post-hoc local explanation applied to 12-lead ECG CNNs.
- Potential use: Introduction (post-hoc ECG explanation).

### 50. [storas2023] Stor<latin small letter a with ring above>s AM, Andersen OE, Lockhart S, Thielemann R, Gnesin F, Thambawita V, et al. Usefulness of heat map explanations for deep-learning-based electrocardiogram analysis. Diagnostics (Basel). 2023;13(14):2345. doi:10.3390/diagnostics13142345
- Verified: PMID 37510089 (efetch).
- Evidence type: peer-reviewed journal article. Quality: Medium (sex-prediction task, qualitative assessment). Stance: supports (post-hoc heat maps fall short).
- Annotation: Grad-CAM heat maps for an ECG sex-prediction network were reviewed by physicians, who found they gave no meaningful information; the authors concluded explanation techniques tailored to medical data are needed. Direct ECG evidence that post-hoc heat maps are of limited clinical use.
- Potential use: Introduction (gap).

## I. Survival modelling and discrimination for time-to-event outcomes

### 51. [cox1972] Cox DR. Regression models and life-tables. J R Stat Soc Series B Stat Methodol. 1972;34(2):187-202. doi:10.1111/j.2517-6161.1972.tb00899.x
- Verified: Crossref filter query on the DOI (abstract present).
- Evidence type: peer-reviewed journal article (seminal). Quality: High. Stance: neutral (method).
- Annotation: Models censored failure times with a hazard depending on covariates through regression coefficients and an unknown function of time, and derives a conditional likelihood for the coefficients. Source of the partial-likelihood loss used to train BTTN.
- Potential use: Methods (loss).

### 52. [katzman2018] Katzman JL, Shaham U, Cloninger A, Bates J, Jiang T, Kluger Y. DeepSurv: personalized treatment recommender system using a Cox proportional hazards deep neural network. BMC Med Res Methodol. 2018;18(1):24. doi:10.1186/s12874-018-0482-1
- Verified: PMID 29482517 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (method).
- Annotation: A Cox proportional hazards deep network performed as well as or better than other survival models on simulated and real data. Precedent for training a neural network with the Cox partial likelihood.
- Potential use: Methods.

### 53. [kvamme2019] Kvamme H, Borgan <latin capital letter o with stroke>, Scheel I. Time-to-event prediction with neural networks and Cox regression. J Mach Learn Res. 2019;20(129):1-30. arXiv:1907.00825
- Verified: JMLR page `https://jmlr.org/papers/v20/18-424.html`; arXiv API record 1907.00825v2 (journal reference JMLR 20(129):1-30). No DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: neutral (method).
- Annotation: Extends Cox regression with neural networks using a loss based on nested case-control sampling of the risk set that scales to large data and approximates the Cox partial log-likelihood. Supports the use of sampled (within-batch) risk sets in BTTN's Cox loss.
- Potential use: Methods (loss approximation).

### 54. [harrell1982] Harrell FE Jr, Califf RM, Pryor DB, Lee KL, Rosati RA. Evaluating the yield of medical tests. JAMA. 1982;247(18):2543-6. doi:10.1001/jama.1982.03320430047030
- Verified: PMID 7069920 (efetch, five authors); Crossref filter query on the DOI (Crossref lists only the first author).
- Evidence type: peer-reviewed journal article (seminal). Quality: High. Stance: neutral (method).
- Annotation: Describes a method for measuring how much prognostic information a test adds for individual patients, applied to the treadmill test. The standard citation for Harrell's concordance index for survival models.
- Potential use: Methods (C-index), only where a C-index is reported.

## J. Self-supervised contrastive pretraining

### 55. [chen2020simclr] Chen T, Kornblith S, Norouzi M, Hinton G. A simple framework for contrastive learning of visual representations. In: Proceedings of the 37th International Conference on Machine Learning. PMLR; 2020. p. 1597-607. (Proceedings of Machine Learning Research; vol. 119). arXiv:2002.05709
- Verified: PMLR page `https://proceedings.mlr.press/v119/chen20j.html`; arXiv API record 2002.05709v3.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: neutral (method).
- Annotation: SimCLR shows that augmentation composition, a nonlinear projection head and large batches drive contrastive representation quality, reaching 76.5% ImageNet top-1 in linear evaluation. The framework `code/core/ssl_pretrain.py` follows ("SimCLR-style").
- Potential use: Methods (SSL pretraining).

### 56. [kiyasseh2021] Kiyasseh D, Zhu T, Clifton DA. CLOCS: contrastive learning of cardiac signals across space, time, and patients. In: Proceedings of the 38th International Conference on Machine Learning. PMLR; 2021. p. 5606-15. (Proceedings of Machine Learning Research; vol. 139). arXiv:2005.13249
- Verified: PMLR page `https://proceedings.mlr.press/v139/kiyasseh21a.html`; arXiv API record 2005.13249v3.
- Evidence type: peer-reviewed conference proceedings. Quality: High. Stance: supports (contrastive pretraining helps ECG tasks).
- Annotation: Contrastive learning across leads, time segments and patients outperformed BYOL and SimCLR in linear evaluation and fine-tuning on cardiac signals and generalised with 25% of labels. ECG-specific contrastive pretraining precedent.
- Potential use: Methods, Discussion.

### 57. [mehari2022] Mehari T, Strodthoff N. Self-supervised representation learning from 12-lead ECG data. Comput Biol Med. 2022;141:105114. doi:10.1016/j.compbiomed.2021.105114
- Verified: PMID 34973584 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: supports.
- Annotation: Adapted contrastive and predictive self-supervised methods to 12-lead ECG; the best (CPC-based) came within 0.5% of supervised linear evaluation and fine-tuning added about 1% with better label efficiency and robustness. Evidence that self-supervised pretraining yields modest gains on 12-lead ECG tasks.
- Potential use: Methods, Discussion (size of SSL benefit).

## K. Time-frequency ECG representations and AF electrophysiology

### 58. [jeong2021] Jeong DU, Lim KM. Convolutional neural network for classification of eight types of arrhythmia using 2D time-frequency feature map from standard 12-lead electrocardiogram. Sci Rep. 2021;11(1):20396. doi:10.1038/s41598-021-99975-6
- Verified: PMID 34650175 (efetch and esummary).
- Evidence type: peer-reviewed journal article. Quality: Medium. Stance: neutral.
- Annotation: A 2D CNN on time-frequency feature maps from 12-lead ECGs classified eight arrhythmias and sinus rhythm in 6,877 CPSC 2018 patients, performing better on persistent than episodic arrhythmias. Precedent for 12-lead time-frequency inputs, used for detection of current arrhythmia rather than prediction.
- Potential use: Methods (input representation), Discussion.

### 59. [bollmann2006] Bollmann A, Husser D, Mainardi L, Lombardi F, Langley P, Murray A, et al. Analysis of surface electrocardiograms in atrial fibrillation: techniques, research, and clinical applications. Europace. 2006;8(11):911-26. doi:10.1093/europace/eul113
- Verified: PMID 17043067 (efetch).
- Evidence type: peer-reviewed journal article (review). Quality: High. Stance: neutral (substrate background).
- Annotation: Reviews surface-ECG techniques for atrial fibrillatory rate, which correlates with atrial cycle length, and for ventricular response; low-rate AF terminates more readily and high-rate AF tends to persist. The abstract gives no frequency band or lead, so any specific band in Hz must be checked in full text before it is cited.
- Potential use: Discussion (frequency signatures and atrial substrate), after full-text check for numbers.

### 60. [platonov2014] Platonov PG, Corino VD, Seifert M, Holmqvist F, S<latin small letter o with diaeresis>rnmo L. Atrial fibrillatory rate in the clinical context: natural course and prediction of intervention outcome. Europace. 2014;16 Suppl 4:iv110-9. doi:10.1093/europace/euu249
- Verified: PMID 25362161 (efetch); Crossref bibliographic query.
- Evidence type: peer-reviewed journal article (review). Quality: High. Stance: neutral.
- Annotation: Reviews surface-ECG atrial fibrillatory rate, its course over time, clinical modifiers and value for predicting intervention outcome, noting that reference values depend on population and context. The abstract gives no band, rate or lead values.
- Potential use: Discussion (frequency signatures), after full-text check for numbers.

### 61. [nielsen2015] Nielsen JB, K<latin small letter u with diaeresis>hl JT, Pietersen A, Graff C, Lind B, Struijk JJ, et al. P-wave duration and the risk of atrial fibrillation: results from the Copenhagen ECG Study. Heart Rhythm. 2015;12(9):1887-95. doi:10.1016/j.hrthm.2015.04.026
- Verified: PMID 25916567 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article. Quality: High. Stance: supports (sinus-rhythm ECG markers of AF risk).
- Annotation: In 285,933 primary-care individuals (9,550 incident AF over median 6.7 years), both very long (130 ms or more; HR 2.06) and very short (89 ms or less; HR 1.60) P-wave durations predicted AF relative to 100-105 ms. Establishes P-wave duration, one of the clinical-model ECG intervals, as an AF predictor.
- Potential use: Methods (clinical covariates), Discussion (substrate).

### 62. [huang2020] Huang Z, Zheng Z, Wu B, Tang L, Xie X, Dong R, et al. Predictive value of P wave terminal force in lead V1 for atrial fibrillation: a meta-analysis. Ann Noninvasive Electrocardiol. 2020;25(4):e12739. doi:10.1111/anec.12739
- Verified: PMID 32022368 (efetch).
- Evidence type: peer-reviewed journal article (meta-analysis). Quality: High. Stance: supports (lead V1 carries AF risk).
- Annotation: Across 12 studies (51,372 participants), abnormal P-wave terminal force in V1 was associated with AF (pooled OR 1.39, 95% CI 1.08-1.79; per-SD OR 1.27), with heterogeneity by population. Supports lead V1 as a physiologically expected AF-risk lead against which lead signatures can be compared.
- Potential use: Discussion (substrate map interpretation).

### 63. [wolder2023] Wolder LD, Graff C, Baadsgaard KH, Langgaard ML, Polcwiartek C, Ji-Young Lee C, et al. Electrocardiographic P terminal force in lead V1, its components, and the association with stroke and atrial fibrillation or flutter. Heart Rhythm. 2023;20(3):354-62. doi:10.1016/j.hrthm.2022.11.010
- Verified: PMID 36435351 (efetch and esummary; the sixth author is listed by PubMed as "Ji-Young Lee C").
- Evidence type: peer-reviewed journal article. Quality: High. Stance: supports.
- Annotation: In 267,636 Copenhagen primary-care patients, abnormal PTFV1 (4 mV ms or more, 16.7% prevalence) was associated with incident AF and stroke; the highest duration tertile had HR 1.37 for AF with a dose-response for duration. Large-cohort evidence for V1 P-wave morphology as an AF-risk marker.
- Potential use: Discussion (substrate map interpretation).

## L. Evaluation, calibration, clinical utility and reporting

### 64. [vickers2006] Vickers AJ, Elkin EB. Decision curve analysis: a novel method for evaluating prediction models. Med Decis Making. 2006;26(6):565-74. doi:10.1177/0272989X06295361
- Verified: PMID 17099194 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (seminal). Quality: High. Stance: neutral (method).
- Annotation: Proposes decision curve analysis, which derives a model's net benefit across threshold probabilities and plots it as a decision curve. Source for the decision curve in `clin_eval.png`.
- Potential use: Methods (clinical utility).

### 65. [vancalster2019] Van Calster B, McLernon DJ, van Smeden M, Wynants L, Steyerberg EW. Calibration: the Achilles heel of predictive analytics. BMC Med. 2019;17(1):230. doi:10.1186/s12916-019-1466-7
- Verified: PMID 31842878 (efetch); Crossref filter query on the DOI (Crossref also lists the STRATOS topic group as a collective author).
- Evidence type: peer-reviewed journal article (methods guidance). Quality: High. Stance: neutral (method).
- Annotation: Argues that poor calibration can mislead clinical decisions and describes how to avoid, assess and update calibration. Rationale for reporting calibration and Brier scores alongside AUROC, and for recalibrating case-control-sampled risks to true prevalence.
- Potential use: Methods (calibration), Discussion.

### 66. [collins2024] Collins GS, Moons KGM, Dhiman P, Riley RD, Beam AL, Van Calster B, et al. TRIPOD+AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods. BMJ. 2024;385:e078378. doi:10.1136/bmj-2023-078378
- Verified: PMID 38626948 (efetch); Crossref filter query on the DOI.
- Evidence type: reporting guideline. Quality: High. Stance: neutral (reporting standard).
- Annotation: A 27-item checklist (plus an abstracts checklist) for reporting prediction model studies using regression or machine learning, replacing TRIPOD 2015. The reporting standard the manuscript follows.
- Potential use: Methods (reporting statement).

### 67. [hanley1982] Hanley JA, McNeil BJ. The meaning and use of the area under a receiver operating characteristic (ROC) curve. Radiology. 1982;143(1):29-36. doi:10.1148/radiology.143.1.7063747
- Verified: PMID 7063747 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (seminal). Quality: High. Stance: neutral (method).
- Annotation: Shows that the ROC area equals the probability that a random diseased subject is ranked above a random non-diseased one (the Wilcoxon statistic) and derives standard errors. Source for the interpretation of AUROC.
- Potential use: Methods (metrics).

### 68. [carpenter2000] Carpenter J, Bithell J. Bootstrap confidence intervals: when, which, what? A practical guide for medical statisticians. Stat Med. 2000;19(9):1141-64. doi:10.1002/(SICI)1097-0258(20000515)19:9<1141::AID-SIM479>3.0.CO;2-F
- Verified: PMID 10797513 (efetch); Crossref filter query on the DOI.
- Evidence type: peer-reviewed journal article (methods guidance). Quality: High. Stance: neutral (method).
- Annotation: Guides when to use bootstrap confidence intervals, which construction to choose and how to implement it, with a simulation study and a survival example. Source for the patient-level bootstrap 95% CIs on AUROC.
- Potential use: Methods (statistics).

## Recommended sources by paper section

| Section | Key sources (working index numbers) |
|---|---|
| Introduction | 1, 2, 3, 4, 6, 8, 12, 14, 15, 16, 36, 39, 40, 41, 42, 45, 50 |
| Methods: data and cohort | 17 (after full-text check), 18, 19, 20, 21, 22, 23 |
| Methods: model | 24, 25, 26, 27, 28, 29, 30, 51, 52, 53, 55, 56, 58 |
| Methods: faithfulness tests | 43, 44, 45, 46, 47 |
| Methods: evaluation and reporting | 54, 64, 65, 66, 67, 68 |
| Discussion: comparison with prior AI-ECG | 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 13 |
| Discussion: related tensor and interpretable models | 31, 32, 33, 34, 35, 36, 37, 38, 39, 42, 48, 49 |
| Discussion: physiological plausibility of signatures | 59, 60, 61, 62, 63 |
| Discussion: SSL benefit | 9, 10, 56, 57 |

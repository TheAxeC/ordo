# Theme A: Multilinear and tensor PLS, tensor regression, and decompositions with an unaligned mode

Phase 1 theme-scoped Literature Search Report (decision D1 in config.md), produced by literature_strategist_agent for the later merge run. This file contains no outline and no draft prose for any paper section.

## Search Strategy

### Domain evidence profile

The PCR row `Domain Evidence Profile` reads exactly `cs_ml`, which is in the four-value enum, carries no `(requested: ...)` suffix, and implies CS / Engineering / Technology. The PCR `Discipline` is machine learning with medical image analysis as the application setting, which falls inside that implied set. No advisory tag applies: not `[NO-PROFILE-NEUTRAL]` (the row is present), not `[PROFILE-RESERVED-FALLBACK]`, not `[PROFILE-UNRESOLVED]`, not `[PROFILE-DISCIPLINE-MISMATCH]`. Under `cs_ml`, archival arXiv preprints and peer-reviewed proceedings are admitted at the peer-review and publication-type nodes; the relevance, methodology and predatory checks are applied unchanged.

### Key concepts

- Concept 1, multilinear supervised models: multilinear PLS, N-way PLS, N-PLS, higher-order PLS (HOPLS), tensor PLS, tensor envelope PLS, supervised CP (SupCP).
- Concept 2, tensor regression: tensor regression, scalar-on-tensor, tensor-on-scalar, tensor response regression, tensor predictor or covariate, CP and Tucker low-rank coefficients, Bayesian tensor regression.
- Concept 3, unaligned or irregular mode: PARAFAC2, irregular tensor, ragged tensor, unaligned or misaligned observations, shift-invariant or shift-aware, coupled matrix and tensor factorization.
- Concept 4, application and structure links: neuroimaging, MRI, fMRI, EEG, PET, electronic health records; point cloud, point set, permutation invariant, optimal transport, Wasserstein, Gromov-Wasserstein.
- Generic Boolean form: (Concept 1 OR Concept 2 OR Concept 3) AND (Concept 4 term), adapted to each database's syntax as recorded below.

### Databases actually queried, and those that could not be

- Queried: arXiv API (export.arxiv.org), OpenAlex API, Crossref REST API, Semantic Scholar Graph API (search, references, citations) and Semantic Scholar Recommendations API, PubMed through NCBI E-utilities (esearch and efetch), the PMLR volume 225 index page and the JMLR volume 18 index page (used only to confirm two bibliographic records).
- Not queried: IEEE Xplore, ACM Digital Library and Scopus, the agent file's CS/Engineering databases, were not accessed because they need institutional subscriptions or API keys that this run does not have. IEEE and ACM records were reached through Crossref (DOI resolution and keyword search), OpenAlex and Semantic Scholar instead. Google Scholar was not used because it has no public API.
- Access failures: six Semantic Scholar keyword searches on 2026-11-14 (UTC) returned HTTP 429 (rate limit) and returned no records: "multilinear partial least squares", "N-way partial least squares", "higher-order partial least squares", "tensor regression neuroimaging", "PARAFAC2", "scalar-on-tensor regression". Four OpenAlex queries returned HTTP 429 because the shared free daily budget for the network IP was exhausted, and returned no records: ("multilinear partial least squares" OR "N-way partial least squares" OR "N-PLS"), ("higher-order partial least squares"), ("tensor regression" AND (neuroimaging OR MRI OR brain)) and ("PARAFAC2"). After the budget reset they were run as queries 11, 10, 12 and 13, with the strings given in the table. Two later Semantic Scholar searches failed after ten retries and returned no records: "supervised tensor factorization where one mode varies in size across subjects" and "Bayesian low-rank tensor regression brain MRI classification". The PubMed connector tool was not permitted in this session, so PubMed was queried through E-utilities instead.

### Query log

Counts are the values each tool returned: for arXiv the `totalResults` field, for OpenAlex the `meta.count` field, for Crossref the `total-results` field, for PubMed the esearch `count` field, and for Semantic Scholar the `total` field where the endpoint returns one. "Retrieved" is the number of records actually downloaded. Semantic Scholar references, citations and recommendations endpoints return no total, so only the retrieved number is given. All logged queries ran on 2026-11-15 (local date); query 0 ran on 2026-11-14 (UTC) before the log file existed, and its numbers are copied from its printed output.

| # | Tool | Query string | Filters | Count returned | Retrieved |
|---|---|---|---|---|---|
| 0 | OpenAlex | "multilinear partial least squares" | publication_year 2013-2026 | 44 | 25 |
| 1 | Crossref | multilinear partial least squares N-way PLS | from-pub-date 2013-01-01 | 322326 | 30 |
| 2 | arXiv | abs:"partial least squares" AND (abs:tensor OR abs:multilinear OR abs:multiway) | none | 8 | 8 |
| 3 | arXiv | abs:"tensor regression" AND (abs:neuroimaging OR abs:MRI OR abs:brain) | none | 21 | 21 |
| 4 | arXiv | abs:PARAFAC2 | none | 30 | 30 |
| 5 | arXiv | abs:"scalar-on-tensor" OR abs:"tensor-on-scalar" OR abs:"tensor response regression" | none | 3332 | 40 |
| 6 | arXiv | (cat:stat.ME OR cat:stat.ML OR cat:stat.AP OR cat:cs.LG) AND (abs:"tensor response" OR abs:"tensor predictor" OR abs:"tensor covariate") | categories in query | 38 | 38 |
| 7 | arXiv | abs:"irregular tensor" OR abs:"irregular tensors" | none | 12 | 12 |
| 8 | arXiv | (abs:tensor OR abs:multilinear OR abs:PARAFAC) AND (abs:"optimal transport" OR abs:Wasserstein) | none | 152 | 40 |
| 9 | arXiv | (abs:"tensor decomposition" OR abs:"tensor factorization") AND (abs:"point cloud" OR abs:"permutation invariant" OR abs:"unaligned" OR abs:"misaligned") | none | 13 | 13 |
| 10 | OpenAlex | "higher-order partial least squares" OR "tensor partial least squares" | 2013-2026; type article, preprint, review, book-chapter | 133 | 30 |
| 11 | OpenAlex | "N-way partial least squares" OR "multilinear PLS" OR "N-PLS" | same as 10 | 754 | 30 |
| 12 | OpenAlex | "tensor regression" AND (neuroimaging OR MRI OR brain) | same as 10 | 679 | 30 |
| 13 | OpenAlex | PARAFAC2 AND (supervised OR prediction OR classification OR regression) | same as 10 | 445 | 30 |
| 14 | OpenAlex | "scalar-on-tensor" OR "scalar-on-image" OR "tensor-on-scalar" | same as 10 | 19228 | 30 |
| 15 | OpenAlex | (tensor OR multilinear OR multiway) AND "partial least squares" AND (MRI OR neuroimaging OR brain OR EEG) | same as 10 | 2337 | 30 |
| 16 | OpenAlex | "tensor decomposition" AND ("point cloud" OR "point set") AND (regression OR classification OR prediction) | same as 10 | 780 | 30 |
| 17 | OpenAlex | "coupled matrix and tensor factorization" AND (neuroimaging OR fMRI OR EEG OR patient) | same as 10 | 105 | 30 |
| 18 | OpenAlex | (tensor OR CP OR Tucker) AND (lesion OR tumor) AND (regression OR classification) AND (MRI OR CT OR PET) AND "low-rank" | same as 10 | 1388 | 30 |
| 19 | Semantic Scholar references | arXiv:2410.14046 (Tang et al.) | none | n/a | 61 |
| 20 | Semantic Scholar references | DOI:10.1109/TASE.2022.3230563 (Biehler et al.) | none | n/a | 75 |
| 21 | Semantic Scholar references | DOI:10.1080/01621459.2013.776499 (Zhou et al.) | none | n/a | 63 |
| 22 | Semantic Scholar references | arXiv:2208.00993 (Ren et al.) | none | n/a | 46 |
| 23 | Semantic Scholar references | DOI:10.1137/21M1450033 (Roald et al.) | none | n/a | 67 |
| 24 | Semantic Scholar references | arXiv:1207.1230 (Zhao et al.) | none | n/a | 57 |
| 25 | Semantic Scholar citations | arXiv:2410.14046 | none | n/a | 7 |
| 26 | Semantic Scholar citations | DOI:10.1109/TASE.2022.3230563 | none | n/a | 11 |
| 27 | Semantic Scholar citations | arXiv:2208.00993 | none | n/a | 4 |
| 28 | Semantic Scholar citations | arXiv:2410.14046 (repeat of 25, printed unfiltered) | none | n/a | 7 |
| 29 | Semantic Scholar citations | DOI of Kiers et al. 1999 (PARAFAC2 Part I) | none | n/a | 447 |
| 30 | Semantic Scholar citations | DOI:10.1080/01621459.2013.776499 | none | n/a | 650 |
| 31 | Semantic Scholar citations | arXiv:1207.1230 | none | n/a | 146 |
| 32 | Semantic Scholar search | tensor regression on unstructured point clouds without point correspondence | none | 1 | 1 |
| 33 | Semantic Scholar search | PARAFAC2 fMRI subject variability spatial mode | none | 1347 | 30 |
| 34 | Semantic Scholar search | tensor decomposition optimal transport alignment of a mode | none | 1 | 1 |
| 35 | arXiv | abs:"supervised" AND (abs:"CP decomposition" OR abs:"PARAFAC" OR abs:"Tucker decomposition") AND (abs:covariates OR abs:"auxiliary") | none | 2 | 2 |
| 36 | arXiv | (abs:tensor OR abs:multiway) AND (abs:"shift-invariant" OR abs:"shifted" OR abs:"misalignment") AND (abs:regression OR abs:classification) | none | 42 | 30 |
| 37 | arXiv | abs:"tensor" AND abs:"Gromov-Wasserstein" | none | 3 | 3 |
| 38 | Semantic Scholar search | multilinear partial least squares neuroimaging prediction of clinical outcome | none | 3 | 3 |
| 39 | PubMed E-utilities | (tensor[tiab] OR multilinear[tiab] OR multiway[tiab] OR PARAFAC[tiab] OR PARAFAC2[tiab]) AND (regression[tiab] OR "partial least squares"[tiab] OR classification[tiab] OR prediction[tiab]) AND (MRI[tiab] OR neuroimaging[tiab] OR fMRI[tiab] OR PET[tiab]) | pdat 2013-2026 | 1778 | 40 |
| 40 | PubMed E-utilities | ("tensor regression"[tiab] OR "tensor decomposition"[tiab] OR "tensor factorization"[tiab] OR multilinear[tiab] OR "multiway partial least squares"[tiab] OR "N-way partial least squares"[tiab] OR PARAFAC2[tiab]) AND (MRI[tiab] OR neuroimaging[tiab] OR fMRI[tiab] OR PET[tiab] OR EEG[tiab] OR "electronic health records"[tiab]) AND (prediction[tiab] OR classification[tiab] OR regression[tiab] OR supervised[tiab] OR biomarker*[tiab]) NOT "diffusion tensor"[tiab] | pdat 2013-2026, sort relevance | 153 | 40 |
| 41 | Crossref | Tensor Decomposition with Unaligned Observations Tang Kolda Zhang | from-pub-date 2024-01-01 | 1802237 | 5 |
| 42 | Crossref | MULTIPAR Supervised Irregular Tensor Factorization Multi-task Learning Computational Phenotyping | from-pub-date 2022-01-01 | 150357 | 5 |
| 43 | Crossref | SWIFT Scalable Wasserstein Factorization Sparse Nonnegative Tensors | from-pub-date 2020-01-01 | 104574 | 3 |
| 44 | Semantic Scholar recommendations (all-cs pool) | for paper arXiv:2410.14046 | none | n/a | 40 |
| 45 | Semantic Scholar recommendations (all-cs pool) | for paper DOI:10.1109/TASE.2022.3230563 | none | n/a | 40 |
| 46 | Crossref | PAR2COX Survival-Informed Tensor Decomposition Phenotyping Risk Prediction Irregular Longitudinal Data | from-pub-date 2026-01-01 | 31042 | 3 |

Crossref keyword counts (queries 1, 41, 42, 43, 46) are relevance-ranked totals of any record matching one word, so they say nothing about topic size. Crossref queries 41 to 43 and 46 were run to find a peer-reviewed version of a known preprint. Queries 5 and 14 matched cosmology papers about the tensor-to-scalar ratio, and query 39 matched diffusion tensor imaging papers. Query 40 is the reformulation of 39 that excludes diffusion tensor imaging.

### Layer mapping

- Layer 1 (Boolean): queries 0 to 18, 35 to 37, 39, 40.
- Layer 2 (backward citation chaining): queries 19 to 24 on six core papers chosen from Layer 1: Tang et al., Biehler et al., Zhou et al., Ren et al., Roald et al. and Zhao et al.
- Layer 3 (forward tracking): queries 25 to 31 on the foundational works (Kiers et al. 1999, Zhou et al. 2013, Zhao et al. 2013) and on the recent core papers, read for 2023 to 2026 citers.
- Layer 4 (semantic): Semantic Scholar natural-language searches 32 to 34 and 38, and Semantic Scholar recommendations 44 and 45.
- Record verification: every included source was resolved through Crossref by DOI (author list, venue, volume, issue, pages) and, where it has an arXiv ID, through the arXiv API by ID. MULTIPAR and Guhaniyogi et al. carry no DOI, and their venues were confirmed on the PMLR volume 225 and JMLR volume 18 index pages. Abstracts were read from Crossref, OpenAlex (abstract inverted index), arXiv or PubMed efetch.

### Inclusion and exclusion criteria

| Criterion | Include | Exclude |
|---|---|---|
| Publication type | Peer-reviewed journal articles and proceedings; arXiv preprints admitted under `cs_ml` and flagged | Blogs, theses, review reports (Publons records), software and dataset records |
| Date range | Systematic search 2013 to 2026; foundational works at any year | Pre-2013 works that are neither foundational (cited over 100 times) nor a must-include from citation chaining |
| Language | English | Other languages |
| Relevance | A supervised multilinear or tensor model for a subject-level outcome, a decomposition that handles a mode which differs in size or ordering across subjects, or a multilinear model combined with point clouds, sets, permutation or transport | Tensor methods used only as a generic compression or completion tool; tensor networks in physics; diffusion tensor imaging used as an imaging modality; chemometric applications of N-PLS that add no method |
| Methodology | Method stated with estimation procedure and evaluated on simulated or real data | No evaluation stated |
| Record | A bibliographic record retrieved in this run (DOI resolved or arXiv record fetched, or a proceedings index page for records without a DOI) | No retrievable record |

## Coverage Distribution Advisory

DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: venue tier distribution
- Concentration: journal article = 22/25 (88%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: ML venue proceedings (NeurIPS, ICML, ICLR, MICCAI) for supervised tensor models on unaligned inputs should be covered by a dedicated proceedings query in the merge run or in Theme C; in this run the proceedings records reached through OpenAlex and Semantic Scholar were ACM KDD, ACM CIKM, AAAI and PMLR ML4H, of which AAAI and ML4H entered the included set.

DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational method papers = 24/25 (96%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: no expansion; the RQ asks which methods exist and how each handles correspondence, so method papers are the expected evidence type. The one non-method source is the Kolda and Bader survey.

Time distribution by decade (1970s 1, 1990s 2, 2000s 2, 2010s 7, 2020s 13; the largest share is 13/25, 52%) does not reach 70% for any value. Geographic distribution is omitted because the records give no study-site metadata.

## Screening Results

- Initial hits: 2414 records retrieved across the 47 query runs in the table (sum of the Retrieved column), not deduplicated. The sum includes the 7-record repeat in query 28 and overlap between databases and between citation lists.
- Title screening: all records of queries 0 to 18, 32 to 46, reference lists 19 and 20, and citation list 28 were read at title level. For reference lists 21 to 24, titles were first filtered by a keyword pattern (tensor, multilinear, multiway, multi-way, PARAFAC, PLS, partial least, Tucker, N-way, three-way, candecomp, polyadic, irregular) before reading. For citation lists 25 to 27 and 29 to 31, titles were first filtered to years 2023 to 2026 and by a keyword pattern (supervised, predict, regress, classif, point, unaligned, misaligned, irregular, transport, Wasserstein, registration, neuro, brain, MRI, patient, lesion, set, least squares, PLS) before reading. For list 30 (650 Zhou et al. citers) only the first 45 filtered titles were read; for the other filtered lists every filtered title was read.
- After title/abstract screening: 36 records were taken to Phase B, and their abstracts and bibliographic records were read.
- After Phase B assessment: 25 records. Phase B was carried out on abstracts and bibliographic records; no full texts were read in this run, so each Quality line says "abstract only".
- Final included sources: 25 (24 peer-reviewed, 1 arXiv preprint).

Main title-screen exclusion reasons: cosmology tensor-to-scalar papers (queries 5, 14); diffusion tensor imaging studies (query 39); food, spectroscopy and process-monitoring applications of N-PLS or HOPLS that add no method (queries 0, 10, 11, 13); PLS structural equation modelling (queries 1, 10); hardware, compression and completion uses of tensors with no supervised or unaligned element; general optimal transport theory with no tensor model (query 8).

### Citation chaining outcomes

- Works cited by three or more of the six Layer 2 seeds: Kolda and Bader 2009 (Tang, Zhou, Zhao, Roald; included as Kolda2009Tensor), Carroll and Chang 1970 (Ren, Roald, Zhao; included as Carroll1970Individual), and Harshman 1970, "Foundations of the PARAFAC procedure" (Ren, Roald, Zhao). Harshman 1970 is not included: the Semantic Scholar entries carry no DOI or other identifier, and no bibliographic record could be retrieved for it in this run. Harshman's 1972 PARAFAC2 working paper is likewise absent; Ren et al. and Roald et al. cite only a "Parafac2: Mathematical and Technical Notes" entry without an identifier.
- Kiers et al. 1999 (Part I) is cited by Ren and Roald and was included as the foundational PARAFAC2 fitting paper.
- Forward tracking: none of the foundational works is "possibly outdated"; Kiers et al. 1999, Zhou et al. 2013 and Zhao et al. 2013 each have citers dated 2023 to 2026 in lists 29 to 31.

### Saturation (stopping conditions)

- Condition 1, source count meets target: met against this theme's brief (12 to 25; 25 included). The Literature Review minimum of 30 applies to the merged report, not to one theme.
- Condition 2, no new additions from the latest round: met. The last round (Layer 4 recommendations, queries 44 and 45, 80 records) added one included source (Hu2026Ragged) to 24 already included, which is 4%, under the 10% threshold.
- Condition 3, theme saturation: met. Every sub-theme column of the matrix below has at least 3 sources (A1: 5, A2: 14, A3: 13, A4: 11, A5: 4, counting "main" and "x" entries).
- Condition 4, citation loop closure: not met. Harshman 1970 recurs in three seed reference lists and could not be collected because no record was retrievable.
- Condition 5, temporal span coverage: met. Foundational works from 1970, 1996 and 1999 are included, and 11 included sources are from 2023 to 2026.
- Four of five conditions are met, above the required three.
- The Layer 4 rule (over 80% overlap with Layers 1 to 3 counts as saturation) was not computed as a percentage in this run.

### Quality gates

- Peer-reviewed ratio: 24/25 (96%), at least 70%.
- Currency (published 2021 to 2026): 13/25 (52%), at least 50%.
- Annotation completeness: 25/25.
- Research gaps: 5, at least 2.

## Annotated Bibliography

Quick-assessment items, in order: journal ranking, methodological rigor, relevance to RQ, citation count, data/evidence quality (1 to 3 each). Citation-count scores use the counts OpenAlex or Semantic Scholar returned in this run; sources from 2025 and 2026 are too recent to rank and are scored 1. Rigor scores are judgments from the abstract, since no full text was read. Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly: "supports" marks a source whose model handles a mode that is not aligned across subjects or whose abstract names misalignment as a problem; "neutral" marks a source that assumes aligned modes or is foundational.

### Carroll, J. D. and Chang, J.-J. (1970). Analysis of individual differences in multidimensional scaling via an N-way generalization of "Eckart-Young" decomposition.
- **Type**: Journal article (Psychometrika 35(3):283-319).
- **Method**: Decomposition of a three-way (or higher-way) table of scalar products between stimuli for individuals (the CANDECOMP model).
- **Key Findings**: The abstract states that individuals are modelled as differentially weighting the dimensions of a common psychological space, and that the decomposition yields a stimulus-by-dimensions coordinate matrix and a subjects-by-dimensions weight matrix; it is illustrated on auditory stimuli and on perception of nations.
- **Relevance**: Origin of the CP model on which CP tensor regression, N-PLS and PARAFAC2 build; a common space with subject-specific weights.
- **Stance**: Neutral (foundational; all subjects share the same stimulus index).
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: every subject's table is indexed by the same stimuli.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 3, 3, 1, 3, 2 = 12.
- **Quality**: High. Read: abstract only (Crossref and OpenAlex records). Limitation: psychometric setting, no supervised outcome.
- **Potential Use**: Background on multilinear models.
- **Citation key**: Carroll1970Individual

### Bro, R. (1996). Multiway calibration. Multilinear PLS.
- **Type**: Journal article (Journal of Chemometrics 10(1):47-61).
- **Method**: N-way partial least squares (N-PLS, tri-PLS) regression algorithm, compared with unfold-PLS.
- **Key Findings**: The abstract reports that N-PLS stabilises the decomposition relative to unfolding methods, giving better interpretability and predictions; on simulated noisy fluorescence EEMs, unfold-PLS predictions were almost twice as bad as tri-PLS despite 125 calibration samples, and on sugar-solution EEMs predicting ash content the two methods gave comparable predictions with different interpretability.
- **Relevance**: The original multilinear PLS for predicting a response from a multiway predictor.
- **Stance**: Neutral (assumes aligned modes).
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: excitation and emission modes are the same wavelengths for every sample.
- **Pipeline relation**: Not applicable (chemometrics).
- **Quick-assessment score**: 3, 3, 2, 3, 3 = 14.
- **Quality**: High. Read: abstract only (OpenAlex record). Limitation: no imaging application.
- **Potential Use**: Background and methods lineage for multilinear PLS.
- **Citation key**: Bro1996Multiway

### Kiers, H. A. L., ten Berge, J. M. F. and Bro, R. (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Type**: Journal article (Journal of Chemometrics 13(3-4):275-294).
- **Method**: Direct fitting algorithm for PARAFAC2.
- **Key Findings**: The abstract states that PARAFAC2 applies when data matrices share column units but have different (numbers of) row units, gives unique solutions under mild assumptions, and that direct fitting is more efficient than indirect fitting, admits constraints and missing data, and yields factor scores for the row units.
- **Relevance**: The foundational model for a mode whose size differs across slices (subjects), the defining case of an unaligned mode in this theme.
- **Stance**: Supports (the model exists to handle a mode that differs across slices).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter, as the closest category: the abstract describes slice-specific row units tied to shared factors through the cross-product structure, with no point matching between slices.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 3, 3, 3, 3, 2 = 14.
- **Quality**: High. Read: abstract only (OpenAlex record). Limitation: unsupervised; the abstract reports no application data.
- **Potential Use**: Methods background for unaligned-mode decompositions.
- **Citation key**: Kiers1999PARAFAC2

### Martinez-Montes, E., Valdes-Sosa, P. A., Miwakeichi, F., Goldman, R. I. and Cohen, M. S. (2004). Concurrent EEG/fMRI analysis by multiway partial least squares.
- **Type**: Journal article (NeuroImage 22(3):1023-1034).
- **Method**: N-PLS with the EEG space-frequency-time array as predictor and fMRI as response.
- **Key Findings**: The abstract reports that N-PLS decomposed EEG and fMRI into atoms with maximised temporal covariance, that theta, alpha and gamma components appeared on all data sets, and that only the alpha atom correlated significantly with fMRI, with a spatial distribution matching earlier conventional analysis.
- **Relevance**: An early supervised use of multilinear PLS in neuroimaging.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: EEG channels and fMRI voxels are fixed coordinates within the recording.
- **Pipeline relation**: Builds on the standard fMRI voxel grid; the abstract does not describe registration steps.
- **Quick-assessment score**: 3, 2, 2, 3, 3 = 13.
- **Quality**: High. Read: abstract only (PubMed efetch). Limitation: within-recording fusion, not a subject-level outcome.
- **Potential Use**: Neuroimaging applications of multilinear PLS.
- **Citation key**: MartinezMontes2004Concurrent

### Kolda, T. G. and Bader, B. W. (2009). Tensor decompositions and applications.
- **Type**: Journal article, survey (SIAM Review 51(3):455-500).
- **Method**: Survey of higher-order tensor decompositions and software.
- **Key Findings**: The abstract presents CP and Tucker as higher-order extensions of the SVD and lists INDSCAL, PARAFAC2, CANDELINC, DEDICOM, PARATUCK2 and nonnegative variants, with N-way Toolbox, Tensor Toolbox and Multilinear Engine as software.
- **Relevance**: Standard reference for the CP, Tucker and PARAFAC2 notation used throughout this theme; cited by four of six chaining seeds.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Not applicable (survey).
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 3, 3, 1, 3, 2 = 12.
- **Quality**: High. Read: abstract only (Crossref record).
- **Potential Use**: Background and notation.
- **Citation key**: Kolda2009Tensor

### Zhao, Q., Caiafa, C. F., Mandic, D. P., Chao, Z. C., Nagasaka, Y., Fujii, N., Zhang, L. and Cichocki, A. (2013). Higher order partial least squares (HOPLS): A generalized multilinear regression method.
- **Type**: Journal article (IEEE TPAMI 35(7):1660-1673); arXiv 1207.1230.
- **Method**: Tensor-to-tensor regression by projection onto a latent space formed by a sum of orthogonal Tucker tensors, optimised by HOSVD of a generalised cross-covariance tensor with deflation.
- **Key Findings**: The abstract reports better predictive ability, suitability for small samples and robustness to noise than existing methods on synthetic data and on decoding 3D movement trajectories from ECoG.
- **Relevance**: The main higher-order PLS formulation; Park2026Sparse studies its consistency.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: ECoG channels and time-frequency bins are shared across samples.
- **Pipeline relation**: Not applicable (electrophysiology decoding).
- **Quick-assessment score**: 3, 3, 2, 3, 3 = 14.
- **Quality**: High. Read: abstract only (arXiv record).
- **Potential Use**: Multilinear PLS methods.
- **Citation key**: Zhao2013HOPLS

### Zhou, H., Li, L. and Zhu, H. (2013). Tensor regression with applications in neuroimaging data analysis.
- **Type**: Journal article (JASA 108(502):540-552); arXiv 1203.3209.
- **Method**: Generalised linear models with a tensor covariate whose coefficient array has low-rank CP structure, fitted by a scalable maximum-likelihood algorithm with asymptotic theory.
- **Key Findings**: The abstract states that the CP structure reduces ultrahigh dimensionality to a manageable level for estimation and prediction, demonstrated on synthetic and real MRI data.
- **Relevance**: The reference scalar-on-tensor model for imaging outcomes; any method on unaligned data is compared against this aligned-voxel baseline.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: a voxel-indexed coefficient array requires voxels to correspond across subjects.
- **Pipeline relation**: Builds on registration to a common image grid; this follows from the voxel-indexed coefficient and is not stated in the abstract.
- **Quick-assessment score**: 3, 3, 3, 3, 3 = 15.
- **Quality**: High. Read: abstract only (arXiv record; Crossref for bibliographic fields).
- **Potential Use**: Core methods comparison for tensor regression.
- **Citation key**: Zhou2013Tensor

### Guhaniyogi, R., Qamar, S. and Dunson, D. B. (2017). Bayesian tensor regression.
- **Type**: Journal article (JMLR 18(79):1-31, confirmed on the JMLR volume 18 index page); arXiv 1509.06490.
- **Method**: Scalar-on-tensor regression with a multiway shrinkage prior on PARAFAC-structured coefficients, with MCMC.
- **Key Findings**: The abstract reports posterior consistency under mild conditions and substantial gains over vectorising or existing tensor regression in estimation and inference, illustrated in a neuroimaging application.
- **Relevance**: The Bayesian counterpart of CP tensor regression.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (voxel-indexed coefficient tensor).
- **Pipeline relation**: Builds on registered images, which follows from the model; not stated in the abstract.
- **Quick-assessment score**: 3, 3, 2, 2, 3 = 13.
- **Quality**: High. Read: abstract only (arXiv record).
- **Potential Use**: Bayesian tensor regression methods.
- **Citation key**: Guhaniyogi2017Bayesian

### Li, L. and Zhang, X. (2017). Parsimonious tensor response regression.
- **Type**: Journal article (JASA 112(519):1131-1146); arXiv 1501.07815.
- **Method**: Tensor-on-vector (tensor response) regression estimated with the envelope method under a generalised sparsity principle.
- **Key Findings**: The abstract reports that the estimator is asymptotically efficient, has competitive finite-sample performance, and models all voxels jointly, illustrated on two neuroimaging studies.
- **Relevance**: The tensor-on-scalar direction, comparing tensor images across groups after covariate adjustment.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (voxel-indexed response).
- **Pipeline relation**: Builds on registered images, which follows from voxelwise modelling; not stated in the abstract.
- **Quick-assessment score**: 3, 3, 2, 3, 3 = 14.
- **Quality**: High. Read: abstract only (OpenAlex record).
- **Potential Use**: Tensor response regression.
- **Citation key**: Li2017Parsimonious

### Zhang, X. and Li, L. (2017). Tensor envelope partial least-squares regression.
- **Type**: Journal article (Technometrics 59(4):426-436).
- **Method**: A tensor PLS algorithm with a population interpretation linked to envelopes and sufficient dimension reduction.
- **Key Findings**: The abstract states that the population model gives the asymptotic consistency of the PLS estimator, that the method was compared analytically and numerically with alternatives, and that it was illustrated on simulations and two neuroimaging analyses.
- **Relevance**: Gives tensor PLS a statistical model; neuroimaging prediction.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (tensor predictor on a common grid).
- **Pipeline relation**: Builds on registered images (follows from the model; not stated in the abstract).
- **Quick-assessment score**: 3, 3, 2, 2, 3 = 13.
- **Quality**: High. Read: abstract only (OpenAlex record).
- **Potential Use**: Multilinear PLS methods with theory.
- **Citation key**: Zhang2017Envelope

### Lock, E. F. and Li, G. (2018). Supervised multiway factorization.
- **Type**: Journal article (Electronic Journal of Statistics 12(1):1150-1180); arXiv 1609.03228.
- **Method**: SupCP, a probabilistic CP factorization whose latent variables are informed by covariates, estimated by EM.
- **Key Findings**: The abstract reports identifiability conditions, more accurate and interpretable latent structure under covariate supervision, and a full predictive distribution, with applications to a facial image database and amino acid fluorescence.
- **Relevance**: Supervision inside a multilinear decomposition, the pattern MULTIPAR and semi-supervised PARAFAC2 later apply to irregular tensors.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (regular tensor).
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 2, 3, 2, 2, 3 = 12.
- **Quality**: High. Read: abstract only (Crossref and arXiv records).
- **Potential Use**: Supervised decompositions.
- **Citation key**: Lock2018Supervised

### Yan, H., Paynabar, K. and Pacella, M. (2019). Structured point cloud data analysis via regularized tensor regression for process modeling and optimization.
- **Type**: Journal article (Technometrics 61(3):385-395); arXiv 1807.10278.
- **Method**: Regularised tensor regression linking point-cloud variation patterns to process variables.
- **Key Findings**: The abstract reports evaluation through simulations and a real turning-process optimisation case study.
- **Relevance**: Tensor regression on point clouds, restricted to structured point clouds, the aligned counterpart of Biehler2024ANTLER.
- **Stance**: Neutral (requires structured point clouds).
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: the title and abstract restrict the method to structured point clouds, arranged as a tensor on a common grid.
- **Pipeline relation**: Not applicable (manufacturing metrology).
- **Quick-assessment score**: 3, 2, 2, 2, 3 = 12.
- **Quality**: High. Read: abstract only (arXiv record).
- **Potential Use**: Point-cloud tensor regression.
- **Citation key**: Yan2019Structured

### Afshar, A., Yin, K., Yan, S., Qian, C., Ho, J., Park, H. and Sun, J. (2021). SWIFT: Scalable Wasserstein factorization for sparse nonnegative tensors.
- **Type**: Conference paper (AAAI 35(8):6548-6556); arXiv 2010.04081.
- **Method**: CP factorization that minimises an N-th order tensor Wasserstein loss between the input and the reconstruction.
- **Key Findings**: The abstract states that the method uses correlation across dimensions without assuming a distribution, is as scalable as other CP algorithms, and that using the factor matrices as features gives up to 9.65% and 11.31% relative improvement over baselines on downstream prediction.
- **Relevance**: Combines multilinear structure with optimal transport and uses the factors for downstream prediction.
- **Stance**: Neutral (transport is used inside the loss, not to match subjects).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling: the Wasserstein loss couples entries of the input and the reconstruction within a dimension; the abstract describes no coupling across subjects.
- **Pipeline relation**: Not applicable (no imaging application is stated in the abstract).
- **Quick-assessment score**: 2, 2, 2, 1, 2 = 9.
- **Quality**: Medium. Read: abstract only (Crossref and arXiv records; the Crossref abstract text was read up to the reported improvements).
- **Potential Use**: Links between Theme A and the transport theme.
- **Citation key**: Afshar2021SWIFT

### Roald, M., Schenker, C., Calhoun, V. D., Adali, T., Bro, R., Cohen, J. E. and Acar, E. (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes.
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science 4(3):1191-1222); arXiv 2110.01278.
- **Method**: PARAFAC2 fitted by alternating optimisation with ADMM, allowing general penalties and hard constraints on every mode including the evolving mode.
- **Key Findings**: The abstract reports accurate recovery and computational efficiency on simulated data, and improved interpretability from constraining the evolving mode on neuroscience and chemometrics data.
- **Relevance**: Current algorithmic form of PARAFAC2 for data with unaligned time profiles, with a neuroscience application.
- **Stance**: Supports (the abstract names unaligned profiles as the target problem).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter, as the closest category: per-slice evolving factor matrices are estimated explicitly under the PARAFAC2 constant cross-product constraint, with no point matching.
- **Pipeline relation**: Not determinable from the abstract for the neuroscience dataset.
- **Quick-assessment score**: 3, 3, 3, 2, 3 = 14.
- **Quality**: High. Read: abstract only (Crossref record).
- **Potential Use**: Unaligned-mode decompositions.
- **Citation key**: Roald2022AOADMM

### Ren, Y., Lou, J., Xiong, L., Ho, J. C., Jiang, X. and Bhavani, S. V. (2023). MULTIPAR: Supervised irregular tensor factorization with multi-task learning for computational phenotyping.
- **Type**: Conference paper (Proceedings of the 3rd Machine Learning for Health Symposium, PMLR 225:498-511, confirmed on the PMLR index page); arXiv 2208.00993.
- **Method**: PARAFAC2 factorization supervised by static and dynamic downstream prediction tasks through multi-task learning.
- **Key Findings**: The abstract reports, on two real temporal EHR datasets, better tensor fit, more meaningful subgroups and stronger predictive performance than existing methods, and scalability.
- **Relevance**: A supervised model for subject-level outcomes on tensors whose mode is not aligned across patients.
- **Stance**: Supports.
- **Evidence type**: Proceedings.
- **Correspondence handling**: Learned template or barycenter, as the closest category: PARAFAC2 shared factors with patient-specific factors for the unaligned time mode.
- **Pipeline relation**: Not applicable (EHR, no imaging).
- **Quick-assessment score**: 2, 2, 3, 1, 3 = 11.
- **Quality**: Medium. Read: abstract only (arXiv record; PMLR index page for venue).
- **Potential Use**: Supervised unaligned-mode decompositions.
- **Citation key**: Ren2023MULTIPAR

### Biehler, M., Yan, H. and Shi, J. (2024). ANTLER: Bayesian nonlinear tensor learning and modeler for unstructured, varying-size point cloud data.
- **Type**: Journal article (IEEE Transactions on Automation Science and Engineering 21(1):402-415); arXiv 2202.13788.
- **Method**: Joint nonlinear tensor dimensionality reduction and nonlinear regression from a 3D point cloud to a vector response, in a Bayesian framework.
- **Key Findings**: The abstract states that existing practice relies on structured subsampling and feature extraction, which cause quantization artefacts and ignore the response, and that ANTLER handles the high dimensionality and inconsistent size of unstructured point clouds; the case study predicts gear transmission error and eccentricity from measurement point clouds.
- **Relevance**: The included source closest to the RQ's input type: supervised prediction from point clouds of varying size with a multilinear model.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Not determinable from the abstract: the abstract states that varying size is handled directly but does not state whether the model is permutation invariant, uses a template, or uses a coupling.
- **Pipeline relation**: Removes structured subsampling and hand-crafted feature extraction from point-cloud preprocessing (manufacturing; the medical-imaging pipeline is not addressed).
- **Quick-assessment score**: 3, 2, 3, 2, 3 = 13.
- **Quality**: High. Read: abstract only (OpenAlex record).
- **Potential Use**: Core comparison for point-cloud tensor learning.
- **Citation key**: Biehler2024ANTLER

### Spencer, D. A., Gutierrez, R., Guhaniyogi, R., Shinohara, R. T., Prado, R. and others (2024). Bayesian scalar-on-tensor regression using the Tucker decomposition for sparse spatial modeling.
- **Type**: Journal article (Biostatistics 26(1):kxaf029; Crossref gives print date 2024-12-31 and online date 2025-12-23).
- **Method**: Bayesian scalar-on-tensor regression with a Tucker-structured coefficient and regularisation.
- **Key Findings**: The abstract reports comparisons with recently proposed methods on simulated data and improved inferential performance over other tensor regression methods on ADNI neuroimaging data.
- **Relevance**: Recent Bayesian Tucker tensor regression for an imaging outcome.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (spatially indexed coefficient tensor).
- **Pipeline relation**: Builds on registered ADNI images; registration is implied by the spatial coefficient and is not stated in the abstract.
- **Quick-assessment score**: 3, 3, 2, 2, 3 = 13.
- **Quality**: High. Read: abstract only (Crossref record).
- **Potential Use**: Bayesian tensor regression in neuroimaging.
- **Citation key**: Spencer2024Bayesian

### Xu, T., Chen, K. and Li, G. (2024). Tensor regression for incomplete observations with application to longitudinal studies.
- **Type**: Journal article (Annals of Applied Statistics 18(2):1195-1212).
- **Method**: Scalar-on-tensor regression on a sample-by-feature-by-time tensor with a regularised covariance-based estimator that uses all available observations without imputation.
- **Key Findings**: The abstract reports variable selection and smooth time-varying effects, links between preterm infants' gut microbiome dynamics and neurodevelopment, and efficacy on synthetic data and a longitudinal aging study.
- **Relevance**: A subject-level outcome from tensors in which subjects are observed at different subsets of time points.
- **Stance**: Neutral (time points are a shared grid with blockwise missing entries).
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment: subjects share a common time grid and only some entries are missing.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 3, 3, 2, 1, 3 = 12.
- **Quality**: High. Read: abstract only (Crossref record).
- **Potential Use**: Tensor regression with incomplete modes.
- **Citation key**: Xu2024Incomplete

### Konyar, E. and Reisi Gahrooei, M. (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping using electronic health records.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics 29(6):4415-4425).
- **Method**: PARAFAC2 decomposition that incorporates labels available for a subset of patients.
- **Key Findings**: The abstract states that EHR data form irregular tensors because of varying hospital visits, and reports superiority over benchmarks on a synthetic dataset and on MIMIC-IV.
- **Relevance**: Label information inside an irregular-tensor decomposition.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter, as the closest category (PARAFAC2 shared factors with patient-specific varying mode).
- **Pipeline relation**: Not applicable (EHR).
- **Quick-assessment score**: 3, 2, 3, 1, 3 = 12.
- **Quality**: High. Read: abstract only (PubMed efetch).
- **Potential Use**: Supervised unaligned-mode decompositions.
- **Citation key**: Konyar2025SemiSupervised

### Schenker, C., Wang, X., Horner, D., Rasmussen, M. A. and Acar, E. (2025). PARAFAC2-based coupled matrix and tensor factorizations with constraints.
- **Type**: Journal article (IEEE Journal of Selected Topics in Signal Processing 19(7):1461-1476); arXiv 2406.12338.
- **Method**: AO-ADMM framework for coupled matrix and tensor factorizations that include PARAFAC2 components, with constraints on all modes and linear couplings.
- **Key Findings**: The abstract states that PARAFAC2 handles irregular or ragged tensors and unaligned or irregular time profiles, and reports accuracy and efficiency gains over existing methods on simulated data and one real dataset.
- **Relevance**: Fusion of an unaligned-mode tensor with other data sources.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter, as the closest category (PARAFAC2 components coupled to other matrices or tensors).
- **Pipeline relation**: Not determinable from the abstract.
- **Quick-assessment score**: 3, 3, 2, 1, 2 = 11.
- **Quality**: Medium. Read: abstract only (arXiv record; Crossref for bibliographic fields). Limitation: unsupervised.
- **Potential Use**: Unaligned-mode decompositions and fusion.
- **Citation key**: Schenker2025PARAFAC2CMTF

### Park, K. and Keles, S. (2026). Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising.
- **Type**: Journal article (Biometrika 113(1):asaf082; Crossref gives online date 2025-11-19 and print date 2026-02-13); arXiv 2310.09428.
- **Method**: Sparse higher-order PLS (SHOPS) for a tensor response and vector predictors, with high-dimensional asymptotics.
- **Key Findings**: The abstract shows that the consistency of the HOPLS estimator of Zhao et al. cannot be guaranteed when the tensor dimensions and the number of predictors grow faster than the sample size, and reports that SHOPS has asymptotic guarantees in that regime, outperforms baselines in simulation, and gives insights on multimodal single-cell Hi-C data.
- **Relevance**: The recent statistical theory for tensor PLS, and its high-dimensional limits.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment (genomic contact tensor on a common index).
- **Pipeline relation**: Not applicable (genomics).
- **Quick-assessment score**: 3, 3, 2, 1, 3 = 12.
- **Quality**: High. Read: abstract only (Crossref record).
- **Potential Use**: Multilinear PLS methods with theory.
- **Citation key**: Park2026Sparse

### Tang, R., Kolda, T. G. and Zhang, A. R. (2026). Tensor decomposition with unaligned observations.
- **Type**: Journal article (SIAM Journal on Matrix Analysis and Applications 47(1):107-131); arXiv 2410.14046.
- **Method**: CP decomposition in which the mode with unaligned observations is represented by functions in an RKHS, with a loss for binary, integer and positive data, a stochastic gradient method and a sketching algorithm for the l2 loss.
- **Key Findings**: The abstract reports illustrative results on synthetic data and an early-childhood human microbiome dataset.
- **Relevance**: The most direct treatment in this theme of a mode whose observations are not aligned across subjects.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment of a shared continuous coordinate: subjects are observed at different points of one continuous domain, so the RKHS mode removes the common sampling grid but keeps the common coordinate.
- **Pipeline relation**: Not applicable (microbiome time series).
- **Quick-assessment score**: 3, 3, 3, 2, 3 = 14.
- **Quality**: High. Read: abstract only (arXiv record; Crossref for the published version).
- **Potential Use**: Core comparison for unaligned-mode decompositions.
- **Citation key**: Tang2026Unaligned

### Huang, H.-H., Chen, Y.-H. and Zhang, T. (2026). Shift-aware sparse Kronecker tensor classification.
- **Type**: Journal article (Statistics and Computing 36(3):132). An arXiv preprint by the same authors, "Cyclic-shift sparse Kronecker tensor classifier for signal-region detection in neuroimaging" (arXiv 2505.12113), describes the same cyclic-shift logistic SKPD model on OASIS-1 and ADNI-1.
- **Method**: Cyclic-shift logistic sparse Kronecker product decomposition (CS-SKPD) inside low-rank tensor regression for binary classification.
- **Key Findings**: The journal abstract states that spatial misalignment across subjects challenges neuroimaging classification, that adaptively aligned views improve robustness to anatomical variability, that consistency holds under restricted strong convexity, and that the model attains competitive classification on OASIS-1 and ADNI-1 MRI while identifying the hippocampus and cerebellum.
- **Relevance**: Tensor regression for an imaging outcome that handles residual misalignment inside the model.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space, learned inside the model as cyclic shifts of the input.
- **Pipeline relation**: Builds on registration and corrects remaining misalignment; the abstract does not describe the preprocessing.
- **Quick-assessment score**: 3, 3, 3, 1, 3 = 13.
- **Quality**: High. Read: abstract only (OpenAlex record for the journal version; arXiv record for the preprint).
- **Potential Use**: Core comparison for misalignment-aware tensor regression in MRI.
- **Citation key**: Huang2026ShiftAware

### Hu, Y., Jiang, T.-X., Ng, M. K. and Zhao, X.-L. (2026). Separable decomposition for ragged tensors.
- **Type**: Journal article (IEEE TPAMI 48(8):9624-9641).
- **Method**: CP-based geometry-aware separable decomposition of ragged tensors, with a binary weighting tensor for the valid domain and proximal alternating minimisation with convergence to a critical point.
- **Key Findings**: The abstract reports superior accuracy and efficiency over competing baselines on multispectral and hyperspectral images and on spatial transcriptomics data.
- **Relevance**: Decomposition of multidimensionally irregular data whose index ranges differ.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Assumes alignment of positions that exist, with irregular index ranges masked by the weighting tensor.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: 3, 3, 2, 1, 3 = 12.
- **Quality**: High. Read: abstract only (OpenAlex record). Limitation: unsupervised.
- **Potential Use**: Irregular-tensor decompositions.
- **Citation key**: Hu2026Ragged

### Patalano, M., Konyar, E. and Paynabar, K. (2026). PAR2COX: Survival-informed tensor decomposition for phenotyping and risk prediction from irregular longitudinal data.
- **Type**: arXiv preprint 2609.23705 (no peer-reviewed version found; Crossref query 46).
- **Method**: Joint PARAFAC2 decomposition and Cox proportional hazards model with patient-specific latent factors as covariates, by alternating optimisation.
- **Key Findings**: The abstract reports improved risk stratification over existing approaches in numerical experiments and a MIMIC-IV case study, and handles patients with and without observed outcomes.
- **Relevance**: A subject-level survival outcome supervising an irregular-tensor decomposition.
- **Stance**: Supports.
- **Evidence type**: arXiv preprint.
- **Correspondence handling**: Learned template or barycenter, as the closest category (PARAFAC2 shared factors with patient-specific irregular mode).
- **Pipeline relation**: Not applicable (EHR).
- **Quick-assessment score**: 1, 2, 3, 1, 3 = 10.
- **Quality**: Medium. Read: abstract only (arXiv record). Under `cs_ml` the preprint is admitted at the journal-ranking item; the other four items are scored as for any source.
- **Potential Use**: Supervised unaligned-mode decompositions.
- **Citation key**: Patalano2026PAR2COX

## Literature Matrix

Sub-theme columns: A1 multilinear and tensor PLS; A2 tensor regression (scalar-on-tensor, tensor-on-scalar, tensor classification); A3 decomposition with an unaligned, irregular or ragged mode; A4 supervised use in neuroimaging or medical data; A5 multilinear structure combined with point clouds, sets, permutation or transport. "main" is the source's primary sub-theme and "x" a secondary one.

| Source | A1 PLS | A2 Regression | A3 Unaligned mode | A4 Neuro/medical | A5 Sets/points/transport | Method | Quality |
|---|---|---|---|---|---|---|---|
| Carroll1970Individual | | | x | | | Decomposition model | High |
| Bro1996Multiway | main | x | | | | Algorithm, real data | High |
| Kiers1999PARAFAC2 | | | main | | | Algorithm | High |
| MartinezMontes2004Concurrent | x | | | main | | Application of N-PLS | High |
| Kolda2009Tensor | | | x | | | Survey | High |
| Zhao2013HOPLS | main | x | | | | Algorithm, real data | High |
| Zhou2013Tensor | | main | | x | | Statistical model, theory, real data | High |
| Guhaniyogi2017Bayesian | | main | | x | | Bayesian model, theory | High |
| Li2017Parsimonious | | main | | x | | Statistical model, theory | High |
| Zhang2017Envelope | main | x | | x | | Statistical model, theory | High |
| Lock2018Supervised | | x | | | | Probabilistic model, EM | High |
| Yan2019Structured | | main | | | x | Statistical model, case study | High |
| Afshar2021SWIFT | | | | | main | Algorithm, downstream prediction | Medium |
| Roald2022AOADMM | | | main | x | | Algorithm, real data | High |
| Ren2023MULTIPAR | | x | main | x | | Supervised factorization, EHR | Medium |
| Biehler2024ANTLER | | x | x | | main | Bayesian nonlinear model, case study | High |
| Spencer2024Bayesian | | main | | x | | Bayesian model, ADNI | High |
| Xu2024Incomplete | | main | x | | | Statistical model, real data | High |
| Konyar2025SemiSupervised | | | main | x | | Semi-supervised factorization, MIMIC-IV | High |
| Schenker2025PARAFAC2CMTF | | | main | | | Algorithm framework | Medium |
| Park2026Sparse | main | | | | | Statistical model, theory | High |
| Tang2026Unaligned | | | main | | | Algorithm, real data | High |
| Huang2026ShiftAware | | x | x | main | | Statistical model, theory, MRI | High |
| Hu2026Ragged | | | main | | x | Algorithm, convergence proof | High |
| Patalano2026PAR2COX | | x | main | x | | Supervised factorization, preprint | Medium |

Column counts (main plus x): A1 5, A2 14, A3 13, A4 11, A5 4.

## Identified Gaps

1. No included method predicts a subject-level imaging outcome when the spatial mode itself is unaligned. Imaging tensor regressions and tensor PLS (Zhou2013Tensor, Guhaniyogi2017Bayesian, Li2017Parsimonious, Zhang2017Envelope, Spencer2024Bayesian) index coefficients by voxel and so assume registered images. Huang2026ShiftAware handles only cyclic shifts of an already gridded image. The supervised unaligned-mode models (Ren2023MULTIPAR, Konyar2025SemiSupervised, Patalano2026PAR2COX) treat the unaligned mode as time in EHR data.
2. Supervised multilinear PLS for an unaligned mode was not found. The multilinear PLS line (Bro1996Multiway, Zhao2013HOPLS, Zhang2017Envelope, Park2026Sparse, MartinezMontes2004Concurrent) assumes aligned modes, and the PARAFAC2 line (Kiers1999PARAFAC2, Roald2022AOADMM, Schenker2025PARAFAC2CMTF) is unsupervised apart from the factorization-plus-predictor models in gap 1.
3. Methods for unaligned or irregular modes keep some common coordinate. Tang2026Unaligned needs a shared continuous domain, Hu2026Ragged masks positions on a shared index, and Xu2024Incomplete uses a shared time grid with missing entries. None models elements (points, lesions) with no shared coordinate, which the RQ's lesion- and region-set case requires.
4. Multilinear learning on unstructured point clouds is limited to manufacturing. Biehler2024ANTLER (varying-size, unstructured) and Yan2019Structured (structured) were the only point-cloud tensor regressions found, and no medical-imaging application was found in queries 9, 16 or 18. The ANTLER abstract does not state how correspondence between points is handled.
5. Transport appears in tensor methods only as a reconstruction loss. Afshar2021SWIFT uses a Wasserstein loss between a tensor and its reconstruction; no included or screened source uses a transport coupling (Wasserstein or Gromov-Wasserstein) to align the unaligned mode across subjects inside a tensor regression or PLS model (queries 8, 34, 37).

## Excluded at Phase B (abstract and record assessment)

| Source (record) | Identifier | Reason |
|---|---|---|
| Larsen, Kolda, Zhang, Williams (2024), Tensor decomposition meets RKHS: efficient algorithms for smooth and misaligned data | arXiv 2408.05677 | Preprint whose abstract illustrates the method on one synthetic example only; the same RKHS-mode approach is developed and evaluated on real data in Tang2026Unaligned. |
| Afshar et al. (2018), COPA: Constrained PARAFAC2 for sparse and large datasets | 10.1145/3269206.3271775 | Adds constraints and speed to unsupervised PARAFAC2; the constrained-PARAFAC2 contribution is covered by Roald2022AOADMM, which constrains all modes. |
| Perros et al. (2017), SPARTan: Scalable PARAFAC2 for large and sparse data | 10.1145/3097983.3098014 | Scalability algorithm for unsupervised PARAFAC2; its abstract's statement of the unaligned-records problem is also made by Ren2023MULTIPAR and Konyar2025SemiSupervised, which add supervision. |
| Cohen and Bro (2018), Nonnegative PARAFAC2: a flexible coupling approach | arXiv 1802.05035 | Nonnegativity on the varying mode; superseded within this theme by Roald2022AOADMM, which imposes general constraints on all modes, with the same group of authors. |
| Li, Xu, Zhou, Li (2018), Tucker tensor regression and neuroimaging analysis | 10.1007/s12561-018-9215-6 | Tucker variant of Zhou2013Tensor; the Tucker scalar-on-tensor model is represented by the more recent Spencer2024Bayesian on ADNI. |
| Acar et al. (2019), Unraveling diagnostic biomarkers of schizophrenia through structure-revealing fusion of multi-modal neuroimaging data | 10.3389/fnins.2019.00416 | Unsupervised coupled factorization with the datasets coupled along an aligned subject mode; the abstract reports components that differentiate patients from controls but describes no supervised model and no unaligned mode. |
| Karahan et al. (2015), Tensor analysis and fusion of multimodal brain images | 10.1109/JPROC.2015.2455028 | Notation and overview paper (Markov-Penrose diagrams) whose multilinear PLS content is covered by MartinezMontes2004Concurrent; no subject-level supervised model. |
| Minoccheri et al. (2025), Supervised coupled matrix-tensor factorization (SCMTF) for ulcerative colitis | arXiv 2506.20065 | Preprint; supervised coupled factorization on aligned temporal measurements with missing data; no unaligned mode. |
| Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition (2026) | 10.1093/biostatistics/kxag007 | Supervised functional tensor on lipidomics with aligned features; no imaging and no unaligned mode stated in the abstract. |
| Wang and Tang (2024), Wasserstein nonnegative tensor factorization with manifold regularization | arXiv 2401.01842 | Preprint; unsupervised Wasserstein-loss factorization with no subject-level prediction; the transport-loss link is covered by Afshar2021SWIFT. |
| Soubrier, Woollard, Warren, Dao Duc (2026), Beyond Procrustes distances: a multilinear Gromov-Wasserstein distance capturing chirality | arXiv 2608.27774 | "Multilinear" refers to the Gromov-Wasserstein objective, not to a tensor data model; a shape distance belongs to the transport theme (Theme B). |

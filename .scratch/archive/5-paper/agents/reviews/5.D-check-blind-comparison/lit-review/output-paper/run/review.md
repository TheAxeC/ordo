# Literature review: subject-level prediction from data whose spatial mode is not aligned across subjects

Run date: 2026-11-16. Paper type: Literature Review. Profile: `cs_ml`. Language: English. DOI checking: strict.

Research question (from settings.md): Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

## 1. Search strategy

### Databases, interfaces and the search record

The Discipline row ("Machine learning, with medical image analysis as the application setting; methods admitted from any application domain") takes the CS/Engineering rows and the Medicine rows, so PubMed was searched alongside the indexes `the lookup script` queries (Crossref, OpenAlex, Semantic Scholar, arXiv) and web searches limited to IEEE Xplore, ACM Digital Library and Scopus.

Primary concepts: (1) unaligned spatial mode: point cloud, set, lesions, regions, unregistered; (2) correspondence handling: registration, template, barycenter, optimal transport, Wasserstein, Gromov-Wasserstein, permutation invariance, multiple instance learning; (3) supervised model: tensor regression, multilinear or higher-order PLS, PARAFAC2; (4) outcome: subject-level or patient-level prediction, classification, regression.

PubMed (NCBI E-utilities `esearch.fcgi`, `db=pubmed`, `retmode=json`), all searched 2026-11-16:

| ID | Search string (field tags as sent) | Filters | Count | Records taken |
|---|---|---|---|---|
| A | ("optimal transport"[Title/Abstract] OR "Wasserstein"[Title/Abstract] OR "Gromov-Wasserstein"[Title/Abstract]) AND ("MRI"[Title/Abstract] OR "medical imaging"[Title/Abstract] OR "neuroimaging"[Title/Abstract] OR "brain"[Title/Abstract] OR "point cloud"[Title/Abstract]) | English; 2016/01/01 to 2026/12/31 | 234 | 200 |
| B | ("point cloud"[Title/Abstract] OR "permutation-invariant"[Title/Abstract] OR "multiple instance learning"[Title/Abstract]) AND ("lesion"[Title/Abstract] OR "lesions"[Title/Abstract] OR "regions"[Title/Abstract]) AND ("prediction"[Title/Abstract] OR "classification"[Title/Abstract] OR "outcome"[Title/Abstract]) | English; 2016 to 2026 | 238 | 200 |
| C | ("tensor regression"[Title/Abstract] OR "multilinear partial least squares"[Title/Abstract] OR "higher-order partial least squares"[Title/Abstract] OR "N-way partial least squares"[Title/Abstract] OR "PARAFAC2"[Title/Abstract]) | English; 2016 to 2026 | 149 | 149 |
| D | "radiomics"[Title/Abstract] AND ("multiple lesions"[Title/Abstract] OR "multiple metastases"[Title/Abstract] OR "patient-level"[Title/Abstract] OR "lesion-level"[Title/Abstract]) AND ("segmentation"[Title/Abstract] OR "registration"[Title/Abstract]) | English; 2016 to 2026 | 37 | 37 |
| E | ("deformable image registration"[Title] OR "image registration"[Title]) AND ("deep learning"[Title/Abstract] OR "survey"[Title/Abstract] OR "review"[Publication Type]) | English; 2013 to 2026; sort relevance | 307 | 40 |
| F | "radiomics"[Title] AND ("review"[Publication Type] OR "standardization"[Title/Abstract] OR "computational"[Title/Abstract]) | English; 2013 to 2026; sort relevance | 1444 | 40 |
| G | ("lesion segmentation"[Title/Abstract] OR "tumor segmentation"[Title/Abstract]) AND ("benchmark"[Title/Abstract] OR "self-configuring"[Title/Abstract] OR "challenge"[Title/Abstract]) | English; 2013 to 2026; sort relevance | 801 | 40 |
| H | ("tensor regression"[Title/Abstract] OR "tensor decomposition"[Title/Abstract]) AND ("neuroimaging"[Title/Abstract] OR "MRI"[Title/Abstract]) | English; 2013 to 2026; sort relevance | 69 | 40 |
| R1 | ("optimal transport"[Title/Abstract] OR "Wasserstein"[Title/Abstract] OR "Gromov-Wasserstein"[Title/Abstract]) AND ("patient"[Title/Abstract] OR "subject-level"[Title/Abstract] OR "individual"[Title/Abstract]) AND ("prediction"[Title/Abstract] OR "classification"[Title/Abstract]) | English; 2024 to 2026; sort relevance | 34 | 34 |
| R2 | ("multiple lesions"[Title/Abstract] OR "multifocal"[Title/Abstract] OR "metastases"[Title/Abstract] OR "lymph nodes"[Title/Abstract]) AND ("set transformer"[Title/Abstract] OR "deep sets"[Title/Abstract] OR "multiple instance learning"[Title/Abstract] OR "permutation-invariant"[Title/Abstract] OR "attention-based pooling"[Title/Abstract]) | English; 2024 to 2026; sort relevance | 15 | 15 |
| R3 | ("point cloud"[Title/Abstract] OR "point set"[Title/Abstract]) AND ("MRI"[Title/Abstract] OR "CT"[Title/Abstract] OR "anatomical"[Title/Abstract]) AND ("prediction"[Title/Abstract] OR "classification"[Title/Abstract] OR "regression"[Title/Abstract]) | English; 2024 to 2026; sort relevance | 29 | 29 |

Searches E to H were tightened with a title field and relevance ranking because F and G returned over 500 records; 40 records were taken from each. Searches D, R2 and R3 returned under 20 or near 20 records by design (narrow strands); the strands they serve are also covered by searches B and A and by layers 2 to 4.

Web searches (layer 1 for databases reachable only by a web search; no count):

| Database | Interface | Query | Count | Records taken |
|---|---|---|---|---|
| IEEE Xplore | web search, `site:ieeexplore.ieee.org` (three queries on tensor PLS, optimal transport medical imaging, point cloud classification) | no count | 0 (no ieeexplore page returned) |
| IEEE Xplore | web search, allowed domain ieeexplore.ieee.org (two queries) | no count | ieeexplore pages returned, among them the HOPLS document 6365194, which layer 2 had already found |
| ACM Digital Library | web search, `site:dl.acm.org` (two queries) and allowed domain dl.acm.org (one query) | no count | 0 |
| Scopus | web search, `site:scopus.com` (one query) and allowed domain scopus.com (one query) | no count | 0 |

`the lookup script search` (Crossref, OpenAlex, Semantic Scholar, arXiv; record counts are the lines printed):

| File | Query | Limit | Records | Index notes |
|---|---|---|---|---|
| s4_rq | the research question as a sentence: "Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects, such as point clouds or sets of lesions or regions, using registration, learned templates or barycenters, optimal transport couplings, or permutation invariance" | 100 | 100 | |
| s4_q1 | optimal transport embedding of sets with a learned reference | 40 | 79 | Semantic Scholar: left out, HTTP 429 after 3 retries |
| s4_q2 | point cloud deep learning disease prediction brain MRI | 40 | 116 | |
| s4_q3 | multiple instance learning patient-level prediction multiple lesions | 40 | 81 | Semantic Scholar: left out, HTTP 429 after 3 retries |
| s4_q4 | Gromov-Wasserstein dictionary learning graphs | 40 | 108 | |
| s4_q5 | permutation invariant neural networks for sets attention | 30 | 77 | |
| s4_q6 | tensor regression neuroimaging low-rank | 30 | 75 | |
| s4_q7 | deformable medical image registration learning | 30 | 80 | Semantic Scholar: left out, HTTP 429 after 3 retries |
| s4_q8 | self-configuring deep learning biomedical image segmentation | 30 | 60 | Semantic Scholar: left out, HTTP 429 after 3 retries |
| s4_q9 | distribution regression learning theory kernel embedding | 30 | 85 | |
| s4_q10 | Wasserstein embedding graph learning reference distribution | 30 | 84 | |
| s4_q11 | weakly supervised whole slide images clinical-grade multiple instance | 30 | 77 | |
| s3_q1 | Wasserstein tensor factorization | 30 | 92 | |
| s5_q1 | registration-free prediction optimal transport medical imaging | 40 | 114 | arXiv: not found |
| s5_q2 | patient-level prediction set of lesions permutation invariant | 40 | 89 | arXiv: not found |
| s5_q3 | Gromov-Wasserstein template learning graph classification | 40 | 103 | |

The Semantic Scholar search API was also called directly with the research question (`https://api.semanticscholar.org/graph/v1/paper/search?query=<research question>&fields=title,year,externalIds&limit=100`): the first call answered HTTP 429 and the second answered total 0.

Citation chaining (`the lookup script refs`) and forward tracking (`the lookup script cited-by`), from Semantic Scholar and OpenAlex:

| Call | Work | Records | Note |
|---|---|---|---|
| refs | TFGW, arXiv 2205.15733 | 79 | |
| refs | Vayer et al. 2019, arXiv 1805.09114 | 72 | |
| refs | Mialon et al., arXiv 2006.12065 | 54 | |
| refs | HOPLS, 10.1109/TPAMI.2012.254 | 50 | |
| refs | Thual et al. 2022, arXiv 2206.09398 | 58 | |
| refs | Gramfort et al. 2015, arXiv 1503.08596 | 34 | |
| refs | MULTIPAR, arXiv 2208.00993 | 46 | |
| refs | Chen and Martel, arXiv 2203.04964 | 22 | |
| refs | Gutierrez-Becker and Wachinger, arXiv 1806.01069 | 17 | |
| refs | Gerber et al., 10.1016/j.media.2022.102696 | 39 | |
| refs | Mahan et al., arXiv 2401.01460 | 43 | |
| refs | TractGeoNet, 10.1016/j.media.2024.103120 | 99 | OpenAlex: first 100, more exist |
| refs | Mazelet et al., arXiv 2605.20883 | 28 | |
| refs | Roald et al., 10.1137/21m1450033 | 73 | |
| refs | Shen et al., arXiv 2111.00648 | 102 | first 100, more exist |
| cited-by | TFGW | 43 | |
| cited-by | Mialon et al. | 42 | |
| cited-by | Gramfort et al. 2015 | 142 | first 100, more exist |
| cited-by | Thual et al. 2022 | 73 | |
| cited-by | HOPLS | 100 | first 100, more exist |
| cited-by | Gutierrez-Becker and Wachinger | 33 | |
| cited-by | Schmitz et al., 10.1137/17M1140431 | 145 | first 100, more exist |
| cited-by | each of the 18 other included works published before 2016 (seminal check, below) | 100 to 200 each | every one: first 100, more exist, in at least one index |

Works found in the references of 3 or more core papers and marked "must include": Cuturi 2013 (Sinkhorn distances), Memoli 2011, Peyre, Cuturi and Solomon 2016, Cuturi and Doucet 2014, and Peyre and Cuturi, Computational Optimal Transport. All five are included.

### Passes and the sources each added

- **Pass 1** (PubMed A to D; the web searches; refs of TFGW, Vayer 2019, Mialon, HOPLS, Thual 2022, Gramfort 2015 and MULTIPAR; cited-by of TFGW, Mialon, Gramfort 2015, Thual 2022, HOPLS and Gutierrez-Becker; `the lookup script search` with the research question and q1 to q4). Added 56 sources: Qibin_Zhao_2013, Lock_2018, Li_2018, Kolda_2009, Perros_2017, Afshar_2018, arxiv_2208_00993, Park_2025, Bro_1996, Kiers_1999, Bro_1999, Krishnan_2011, Roald_2022, Peyr__2019, arxiv_1306_0895, Kolouri_2017, M_moli_2011, Peyre_2016, Vayer_2020, arxiv_1805_09114, Thual_2022, arxiv_2009_04266, Agueh_2011, arxiv_2205_15733, arxiv_2102_06555, arxiv_2202_03813, Wang_2024, Benamou_2015, arxiv_1310_4375, Schmitz_2018, Wang_2012, arxiv_2006_12065, arxiv_2103_03892, Song_2024, arxiv_2006_09430, arxiv_2401_01460, Gramfort_2015, Bazeille_2019, Kundu_2018, Feydy_2017, arxiv_2111_00648, Gong_2026, arxiv_2605_20883, Gerber_2023, Barbarant_2026, Thual_2025, Guti_rrez_Becker_2018, arxiv_2203_04964, Liu_2026, Sarasua_2021, Chen_2024, Yang_2020, Karimzadeh_2026, Phan_2026, Eertink_2022, AVANTS_2008.
- **Pass 2** (PubMed E to H; refs of Chen and Martel, Gutierrez-Becker, Gerber, Mahan and TractGeoNet; `the lookup script search` q5 to q11). Added 19 sources, 33.9 percent of the 56 then held: Zhou_2013, Charles_2017, arxiv_1703_06114, arxiv_1810_00825, arxiv_1802_04712, Campanella_2019, arxiv_1411_2066, Muandet_2017, Balakrishnan_2019, Ashburner_2000, Bookstein_2001, Davatzikos_2004, Gillies_2016, Lambin_2017, Aerts_2014, van_Griethuysen_2017, Zwanenburg_2020, Isensee_2020, Menze_2015. The TractGeoNet refs call of this pass was sent with a mistyped DOI and printed "not found" from both indexes; it was run again with the correct DOI (10.1016/j.media.2024.103120) and its 99 records added no source.
- **Pass 3** (refs of Mazelet, Roald and Shen; cited-by of Schmitz; `the lookup script search` "Wasserstein tensor factorization"). Added 2 sources, 2.7 percent of the 75 then held: Afshar_2021, arxiv_1810_08278.

Conditions when the search ended after pass 3: condition 1 held (75 sources, minimum 30); condition 2 held (2.7 percent added); condition 3 held (every theme of the matrix had 3 or more sources); condition 5 held (foundational works from 1996 on and works of 2024 to 2026). Condition 4 held for the chains of pass 3 (the references of Mazelet, Roald and Shen held no relevant work not yet collected). Three or more conditions held with condition 2 among them, so the search ended.

- **Currency gate search after pass 3** (the action the currency gate's row prescribes, run once: PubMed R1 to R3 for 2024 to 2026; `the lookup script search` s5_q1 to s5_q3; the 2024 to 2026 records of every cited-by listing already held). Added 27 sources: https://doi.org/10.5281/zenodo.22212575 (Naji et al., the key as `bibtex` printed it), Li_2027, Wang_2025, arxiv_2401_01842, Zhang_2024, Beier_2025, D_az_Mart_n_2026, Qian_2024, arxiv_2506_02203, arxiv_2411_10204, arxiv_2309_16604, Seyedi_2026, Yan_2026, Jeganathan_2024, Tang_2026, Gachon_2025, Qahqaie_2026, Peng_2026, Peng_2026a, arxiv_2505_24403, Do_2025, Jia_2024, Yang_2025, arxiv_2610_22091, Zare_2025, Nguyen_2026, Chen_2025. This is 36.0 percent of the 75 held before it, so after this search condition 2 no longer holds by its own measure; see section 10.

### Criteria and profile

- Inclusion: English; the abstract addresses at least one aspect of the research question (a supervised or representation method for data whose spatial mode is unaligned across subjects, a way of handling the missing correspondence, or the registration, radiomics and lesion-segmentation steps such methods remove or build on); methods from any application domain.
- Year range: 2016 to 2026 (the last 10 years), with seminal works unrestricted. Every included work published before 2016 was checked with `the lookup script cited-by`: each printed "first 100, more exist" in at least one index, so each is cited more than 100 times and is admitted as seminal. None was marked "possibly outdated": each has citing works from 2024 to 2026 in its listing (counts from 2 for Krishnan_2011 to 138 for Cuturi 2013).
- Exclusion: blog posts and news; works whose abstract addresses none of the question's aspects; a methodology with an obvious design flaw.
- Profile `cs_ml`: conference proceedings count as peer-reviewed, and preprints are admitted, tagged as preprints, and count toward the peer-reviewed share.

## 2. Distribution advisory

Counted over the 104 included sources from the Method column of the matrix and the year field of refs.bib. Geography is left out: the study site or population region is stated for too few sources.

Distribution advisory:
- Dimension: method
- Concentration: computational or simulation = 75/104 (72.1 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: no expansion; the research question asks which methods exist and how each handles correspondence, so method papers dominate by design. The empirical clinical comparisons that exist (Sarasua_2021, Eertink_2022, Barbarant_2026, Nguyen_2026, Jeganathan_2024, Tang_2026, Phan_2026) are all included.

Time: the most frequent year is 2026 with 17/104 (16.3 percent); no concentration. Venue: the largest families are NeurIPS (7/104) and ICML (7/104); preprints are 15/104 (14.4 percent); no concentration.

## 3. Screening results

- Initial hits: PubMed totals 3357 across the eleven searches, of which 824 records were taken; `the lookup script search` 1420 records across sixteen searches; citation chaining 815 records; forward tracking 578 records (plus 3343 records of the seminal check, read for counts and for 2024 to 2026 citing works); web searches returned no counted records. Records sharing a DOI or arXiv ID were merged by `the lookup script`; no deduplicated total over all files was computed.
- Title and abstract stage: 116 candidates kept as Include or Maybe from the title lines; 104 of them were read and kept.
- Excluded at selection after title screening, as covering the same sub-theme as an included source that the question needs more: Genevay et al. (Sinkhorn divergences learning), Frogner et al. (Wasserstein loss), Courty et al. (OT domain adaptation), Chizat et al. (unbalanced OT), Xu et al. 2019 (GW learning), Rabin et al. (sliced Wasserstein), DGCNN, Muandet et al. 2012 (support measure machines), U-Net, Janati et al. 2020, Togninalli et al. (Wasserstein Weisfeiler-Lehman kernels), Henry et al. 2022. Morup et al. 2008 and Janati et al. 2019 were resolved by title but no search output of the run listed them, so they were not candidates.
- Full-text assessment: 104 assessed (full text for 56, abstract or venue-page description for 48); 104 included.
- Final included sources: 104. Peer-reviewed: 89 (85.6 percent); preprints: 15 (arxiv_2006_12065, arxiv_2103_03892, arxiv_2006_09430, arxiv_2401_01460, arxiv_2203_04964, arxiv_2605_20883, Barbarant_2026, arxiv_2401_01842, arxiv_2506_02203, arxiv_2411_10204, arxiv_2309_16604, arxiv_2610_22091, Peng_2026, Nguyen_2026, and the Naji et al. deposit). With preprints counted under `cs_ml`: 100 percent.
- Candidates that stayed unread: none. For each candidate whose `fetch` gave neither text nor abstract, a later way gave the abstract or the text:
  - Li_2018: `fetch` found no open-access URL; Europe PMC search for DOI:10.1007/s12561-018-9215-6 (200).
  - Krishnan_2011: `fetch` found no open-access URL; Europe PMC search for DOI:10.1016/j.neuroimage.2010.07.034 (200).
  - M_moli_2011: Europe PMC search for DOI:10.1007/s10208-011-9093-5 (200, no abstract); https://doi.org/10.1007/s10208-011-9093-5 (200, a "Client Challenge" page with no abstract); author copy https://www.math.ucdavis.edu/~saito/data/acha.read.w12/memoli-gromov-dist.pdf (200), read.
  - Bazeille_2019: Europe PMC search for DOI:10.1007/978-3-030-20351-1_18 (200, no abstract); https://hal.science/hal-02278663 (200), description tag read.
  - Gerber_2023, Chen_2024 (TractGeoNet), AVANTS_2008, Ashburner_2000, Bookstein_2001, Davatzikos_2004, Lambin_2017, Phan_2026, Chen_2025: Europe PMC search for each DOI (200 each), abstract read.
  - Thual_2025: `fetch` by the Semantic Scholar ID found no DOI, no arXiv ID and no open-access URL; https://mlanthology.org/tmlr/2025/thual2025tmlr-sampleefficient/ (200), abstract read.
  - Zwanenburg_2020: the abstract `fetch` wrote held only an editorial note; Europe PMC search for DOI:10.1148/radiol.2020191145 (200), abstract read.
  - Wang_2025: `fetch` found no open-access URL; https://link.springer.com/article/10.1007/s10994-025-06942-7 (200, final address with a cookies query string), `dc.description` tag read.
  - arxiv_2309_16604: `fetch` by the Semantic Scholar ID found no open-access URL; `fetch` by arXiv ID 2309.16604 read https://arxiv.org/html/2309.16604 (200).

## 4. Annotated bibliography

"EPMC" below stands for the address `https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:<the DOI>&resultType=core&format=json`, saved with curl, status 200. "Index abstract" stands for the abstract `the lookup script fetch` wrote from an index record of the DOI named.

### Theme 1: Tensor regression, multilinear PLS, and decompositions with an unaligned mode

### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Type**: Journal article (IEEE TPAMI)
- **Read from**: https://arxiv.org/pdf/1207.1230 (full text)
- **Method**: Tucker-structured PLS that projects tensor predictors and responses onto shared latent vectors with orthogonal loadings per mode.
- **Key results**: HOPLS predicts better than N-PLS and unfolded PLS on simulated data and on decoding limb movement from ECoG, and handles tensor responses.
- **Relevance**: The reference multilinear PLS; it assumes every mode, the spatial mode included, is indexed identically across subjects.
- **Quality**: High; top venue, method with real-data validation.
- **Stance**: neutral (the aligned-mode baseline the question asks about).
- **Potential use**: Literature Review, Methodology.

### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Type**: Journal article (JASA)
- **Read from**: index abstract, doi:10.1080/01621459.2013.776499
- **Method**: Generalized linear model with a rank-R CP coefficient tensor, fitted by block relaxation.
- **Key results**: The low-rank coefficient makes regression on whole MRI volumes feasible with far fewer parameters, with asymptotic theory and an ADHD MRI analysis.
- **Relevance**: Tensor regression with the subject outcome as response; requires registered voxel grids.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Lock (2018). Tensor-on-Tensor Regression.
- **Type**: Journal article (JCGS)
- **Read from**: index abstract, doi:10.1080/10618600.2017.1401544
- **Method**: Contracted tensor product with a CP-rank and ridge-penalised coefficient tensor.
- **Key results**: A single framework covers tensor predictors and tensor responses, with an efficient fitting algorithm.
- **Relevance**: General multilinear regression that still requires aligned modes.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Li et al. (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Type**: Journal article (Statistics in Biosciences)
- **Read from**: EPMC, DOI 10.1007/s12561-018-9215-6
- **Method**: GLM with a Tucker-decomposed coefficient tensor.
- **Key results**: Tucker allows a different rank per mode, which fits neuroimaging volumes better than CP at a similar parameter count.
- **Relevance**: Tensor regression on registered images.
- **Quality**: Medium; Q2 journal.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Type**: Journal article (SIAM Review), survey
- **Read from**: index abstract, doi:10.1137/07070111X
- **Method**: Survey of CP, Tucker and their variants, PARAFAC2 included.
- **Key results**: Standard notation and algorithms for higher-order decompositions.
- **Relevance**: Background on the decompositions the regression and unaligned-mode methods build on.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction, Methodology.

### Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large and Sparse Data.
- **Type**: Conference paper (KDD)
- **Read from**: index abstract, doi:10.1145/3097983.3098014
- **Method**: Scalable PARAFAC2 fitting for irregular tensors whose slices have different numbers of rows.
- **Key results**: Orders-of-magnitude speedup on large EHR data where each patient has a different number of visits.
- **Relevance**: A decomposition whose one mode is not aligned across subjects.
- **Quality**: High.
- **Stance**: supports (an unaligned mode handled inside the model).
- **Potential use**: Literature Review.

### Afshar et al. (2018). COPA: Constrained PARAFAC2 for Sparse and Large Datasets.
- **Type**: Conference paper (CIKM)
- **Read from**: index abstract, doi:10.1145/3269206.3271775
- **Method**: PARAFAC2 with smoothness, sparsity and non-negativity constraints.
- **Key results**: Interpretable phenotypes from irregular temporal EHR tensors at scale.
- **Relevance**: Unaligned-mode decomposition with constraints.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Ren et al. (2023). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning.
- **Type**: Conference paper (ML4H 2023, PMLR 225); entry from https://proceedings.mlr.press/v225/ren23a.html
- **Read from**: https://arxiv.org/html/2208.00993 (full text)
- **Method**: PARAFAC2 factorization trained jointly with multi-task outcome prediction from the patient factors.
- **Key results**: Supervision improves both the predictive performance and the meaning of the phenotypes over unsupervised PARAFAC2 followed by a classifier.
- **Relevance**: The closest existing case of a supervised multilinear model with an unaligned mode.
- **Quality**: Medium; workshop-level proceedings.
- **Stance**: supports.
- **Potential use**: Literature Review, Discussion.

### Afshar et al. (2021). SWIFT: Scalable Wasserstein Factorization for Sparse Nonnegative Tensors.
- **Type**: Journal article (AAAI proceedings)
- **Read from**: https://arxiv.org/html/2010.04081 (full text)
- **Method**: CP factorization with a Wasserstein reconstruction loss whose ground cost encodes feature similarity.
- **Key results**: Better downstream classification than Euclidean or KL losses on sparse count tensors.
- **Relevance**: Joins tensor factorization and transport, but the transport acts on the feature mode, not on an unaligned spatial mode.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review, Discussion.

### Park and Keles (2025). Sparse Higher-Order Partial Least Squares for Simultaneous Variable Selection, Dimension Reduction and Tensor Denoising.
- **Type**: Journal article (Biometrika)
- **Read from**: https://arxiv.org/pdf/2310.09428 (full text)
- **Method**: Theoretical analysis of HOPLS and a sparse variant (SHOPS).
- **Key results**: The HOPLS estimator is not consistent when the tensor dimensions and features grow faster than the sample size; SHOPS restores consistency.
- **Relevance**: Limits of tensor PLS in the small-cohort, large-tensor regime typical of imaging.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology, Discussion.

### Bro (1996). Multiway Calibration. Multilinear PLS.
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: index abstract, doi:10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C
- **Method**: N-PLS: PLS with trilinear weight structure.
- **Key results**: More parsimonious and more stable than unfolded PLS on multiway calibration data.
- **Relevance**: Origin of multilinear PLS.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Kiers, ten Berge and Bro (1999). PARAFAC2, Part I. A Direct Fitting Algorithm for the PARAFAC2 Model.
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: index abstract, doi:10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B
- **Method**: Direct alternating least squares for PARAFAC2.
- **Key results**: Fits PARAFAC2 without forming cross-product matrices, allowing constraints.
- **Relevance**: The algorithm behind decompositions whose one mode varies across slices.
- **Quality**: High; seminal.
- **Stance**: supports.
- **Potential use**: Methodology.

### Bro, Andersson and Kiers (1999). PARAFAC2, Part II. Modeling Chromatographic Data with Retention Time Shifts.
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: index abstract, doi:10.1002/(SICI)1099-128X(199905/08)13:3/4<295::AID-CEM547>3.0.CO;2-Y
- **Method**: PARAFAC2 applied to chromatographic profiles that shift between samples.
- **Key results**: PARAFAC2 recovers components despite misaligned elution profiles, where PARAFAC fails.
- **Relevance**: The first demonstration that a decomposition can absorb misalignment of one mode.
- **Quality**: High; seminal.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Krishnan et al. (2011). Partial Least Squares (PLS) Methods for Neuroimaging: A Tutorial and Review.
- **Type**: Journal article (NeuroImage), review
- **Read from**: EPMC, DOI 10.1016/j.neuroimage.2010.07.034
- **Method**: Tutorial on PLS correlation and PLS regression for brain imaging.
- **Key results**: Sets out the PLS variants used to relate voxel patterns to behaviour and design.
- **Relevance**: PLS in neuroimaging assumes registered voxels.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Roald et al. (2022). An AO-ADMM Approach to Constraining PARAFAC2 on All Modes.
- **Type**: Journal article (SIAM J. Math. Data Sci.)
- **Read from**: index abstract, doi:10.1137/21m1450033
- **Method**: AO-ADMM fitting of PARAFAC2 with constraints on every mode, the varying mode included.
- **Key results**: Recovers smooth or non-negative evolving profiles more accurately than earlier PARAFAC2 algorithms.
- **Relevance**: Regularising the unaligned mode itself.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Naji et al. (2026). Bayesian Tensor Regression for Neuroimaging Data.
- **Type**: Preprint (Zenodo deposit of arXiv 2609.27880)
- **Read from**: https://arxiv.org/html/2609.27880 (full text)
- **Method**: Bayesian tensor-response linear model with an envelope parameterisation, Gibbs sampling.
- **Key results**: Posterior consistency and an analysis of alcohol use disorder effects on brain connectivity.
- **Relevance**: Current tensor regression in neuroimaging, still on aligned modes.
- **Quality**: Medium; preprint.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Li, Yao and Zhang (2027). Functional Tensor Regression.
- **Type**: Journal article (Statistica Sinica; Crossref gives 2027, OpenAlex and Semantic Scholar 2025)
- **Read from**: https://doi.org/10.5705/ss.202024.0342 (full text)
- **Method**: Tucker-low-rank regression with a smooth functional mode, Riemannian Gauss-Newton fitting.
- **Key results**: Quadratic convergence and error bounds, with a neuroimaging analysis.
- **Relevance**: Structure placed on one mode of a tensor coefficient; the mode is still aligned.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Wang et al. (2025). Low-Rank Fully-Connected Tensor Network Learning for Tensor-on-Tensor Regression.
- **Type**: Journal article (Machine Learning)
- **Read from**: https://link.springer.com/article/10.1007/s10994-025-06942-7 (200), dc.description tag
- **Method**: Tensor-on-tensor regression with a fully-connected tensor network coefficient, ridge ALS with leverage sampling.
- **Key results**: Better accuracy than CP and Tucker-based regression on synthetic and real data.
- **Relevance**: Current state of tensor-on-tensor regression.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Wang and Tang (2024). Wasserstein Nonnegative Tensor Factorization with Manifold Regularization.
- **Type**: Preprint (arXiv 2401.01842)
- **Read from**: https://arxiv.org/html/2401.01842 (full text)
- **Method**: NTF minimising a Wasserstein loss between data and reconstruction with a graph regulariser.
- **Key results**: Better clustering than Euclidean and KL NTF on image data.
- **Relevance**: Another transport loss on a tensor factorization, again over features and not an unaligned mode.
- **Quality**: Low; preprint, small evaluation.
- **Stance**: neutral.
- **Potential use**: Discussion.

### Theme 2: Entropic OT, barycenters, dictionaries and learnable templates

### Peyre and Cuturi (2019). Computational Optimal Transport.
- **Type**: Journal article (Foundations and Trends in ML), monograph
- **Read from**: https://arxiv.org/pdf/1803.00567 (full text)
- **Method**: Monograph on discrete and entropic OT, Sinkhorn, barycenters, GW.
- **Key results**: Unified computational treatment of the transport tools the other sources use.
- **Relevance**: Reference text for every transport strand.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction, Methodology.

### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport.
- **Type**: Conference paper (NeurIPS 26); entry from https://papers.nips.cc/paper/4927-sinkhorn-distances-lightspeed-computation-of-optimal-transport
- **Read from**: https://arxiv.org/html/1306.0895 (full text)
- **Method**: Entropic regularisation of OT solved by Sinkhorn matrix scaling.
- **Key results**: Orders-of-magnitude faster than exact OT and better on MNIST classification than the exact distance.
- **Relevance**: Makes transport couplings differentiable and cheap enough for learning.
- **Quality**: High; seminal, must include.
- **Stance**: supports.
- **Potential use**: Methodology.

### Feydy et al. (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Type**: Conference paper (AISTATS, PMLR 89); entry from https://proceedings.mlr.press/v89/feydy19a.html
- **Read from**: https://arxiv.org/html/1810.08278 (full text)
- **Method**: Debiased Sinkhorn divergences, theory and GPU implementation.
- **Key results**: The divergence is positive, convex and metrises weak convergence, interpolating between OT and MMD.
- **Relevance**: The loss used when comparing unaligned point sets.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Kolouri et al. (2017). Optimal Mass Transport: Signal Processing and Machine-Learning Applications.
- **Type**: Journal article (IEEE Signal Processing Magazine), review
- **Read from**: index abstract, doi:10.1109/MSP.2017.2695801
- **Method**: Tutorial review of transport in signal processing and ML.
- **Key results**: Surveys transport-based embeddings, among them linear OT for image analysis.
- **Relevance**: Background for transport-based morphometry and embeddings.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Type**: Journal article (SIAM J. Math. Anal.)
- **Read from**: index abstract, doi:10.1137/100805741
- **Method**: Existence, uniqueness and characterisation of Wasserstein barycenters.
- **Key results**: Barycenters exist and are unique under mild conditions, with a dual characterisation.
- **Relevance**: The theory behind a barycenter as a learned common space.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Type**: Conference paper (ICML, PMLR 32); entry from https://proceedings.mlr.press/v32/cuturi14.html
- **Read from**: https://arxiv.org/html/1310.4375 (full text)
- **Method**: Entropic barycenters by subgradient methods.
- **Key results**: Barycenters of many measures computed fast, with applications to clustering.
- **Relevance**: The computational route to a transport template.
- **Quality**: High; seminal, must include.
- **Stance**: supports.
- **Potential use**: Methodology.

### Benamou et al. (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Type**: Journal article (SIAM J. Sci. Comput.)
- **Read from**: https://arxiv.org/pdf/1412.5154 (full text)
- **Method**: Bregman projections for entropic barycenters and related problems.
- **Key results**: One algorithm covers barycenters, multi-marginal and partial transport.
- **Relevance**: Standard solver for barycenter templates.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Schmitz et al. (2018). Wasserstein Dictionary Learning.
- **Type**: Journal article (SIAM J. Imaging Sci.)
- **Read from**: https://arxiv.org/pdf/1708.01955 (full text)
- **Method**: Learns dictionary atoms so that each datum is a Wasserstein barycenter of the atoms.
- **Key results**: Nonlinear dictionaries capture displacement variation that linear dictionaries cannot.
- **Relevance**: Learnable transport templates with barycentric codes as features.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Wang et al. (2012). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Type**: Journal article (IJCV)
- **Read from**: index abstract, doi:10.1007/s11263-012-0566-z
- **Method**: Linear OT: embeds each image by its transport map from a fixed reference.
- **Key results**: Linear statistics on the embeddings approximate Wasserstein geometry at a fraction of the cost.
- **Relevance**: The template-based embedding that turns unaligned measures into vectors.
- **Quality**: High; seminal.
- **Stance**: supports.
- **Potential use**: Methodology.

### Mialon et al. (2020). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Type**: Preprint (arXiv 2006.12065); no published version named by `bibtex`
- **Read from**: https://arxiv.org/html/2006.12065 (full text)
- **Method**: OTKE: aggregates a set by its entropic transport plan to a trainable reference.
- **Key results**: Competitive on biological sequence and NLP benchmarks; the embedding relates to attention with a learned reference.
- **Relevance**: A learned template whose coupling replaces correspondence for set-level prediction.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding.
- **Type**: Preprint (arXiv 2103.03892)
- **Read from**: https://arxiv.org/html/2103.03892 (full text)
- **Method**: Generalized sliced-Wasserstein embedding of a set against a trainable reference.
- **Key results**: Matches or beats attention pooling on point cloud and graph classification at lower cost.
- **Relevance**: Template-based permutation-invariant pooling.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Kolouri et al. (2020). Wasserstein Embedding for Graph Learning.
- **Type**: Preprint (arXiv 2006.09430); International Conference on Learning Representations per Semantic Scholar, published version not confirmed
- **Read from**: https://arxiv.org/html/2006.09430 (full text)
- **Method**: WEGL: Monge maps from a reference to each graph's node-embedding distribution give a fixed-size vector.
- **Key results**: State-of-the-art graph classification with cost linear in the number of graphs.
- **Relevance**: Linear-OT template embedding applied to unaligned structures.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Mahan et al. (2024). Deep Set Linearized Optimal Transport.
- **Type**: Preprint (arXiv 2401.01460)
- **Read from**: https://arxiv.org/html/2401.01460 (full text)
- **Method**: ICNN-approximated transport maps from a shared reference embed point clouds; a discriminator is trained on the embedding.
- **Key results**: Euclidean distances between the learned maps approximate W2 under stated conditions.
- **Relevance**: Joins linear OT and set encoders.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Methodology.

### Song et al. (2024). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology (PANTHER).
- **Type**: Conference paper (CVPR)
- **Read from**: https://arxiv.org/pdf/2405.11643 (full text)
- **Method**: Gaussian-mixture prototypes of patch features summarise a whole slide image.
- **Key results**: Unsupervised slide embeddings competitive with supervised MIL on subtyping and survival.
- **Relevance**: Prototype templates as a correspondence-free subject representation in medical imaging.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Wang et al. (2024). Graph Classification via Reference Distribution Learning: Theory and Practice.
- **Type**: Conference paper (NeurIPS 37)
- **Read from**: https://arxiv.org/html/2408.11370 (full text)
- **Method**: GRDL: MMD between a graph's node-embedding distribution and learned reference distributions.
- **Key results**: Generalisation bounds and faster training than GW-template methods with competitive accuracy.
- **Relevance**: Learned templates without a transport solve.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Szabo et al. (2016). Learning Theory for Distribution Regression.
- **Type**: Journal article (JMLR 17); entry from https://jmlr.org/papers/v17/14-510.html
- **Read from**: https://arxiv.org/html/1411.2066 (full text)
- **Method**: Two-stage sampled distribution regression with kernel mean embeddings.
- **Key results**: Consistency and rates for ridge regression on sets of samples.
- **Relevance**: The learning theory for predicting an outcome from a set of points.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Muandet et al. (2017). Kernel Mean Embedding of Distributions: A Review and Beyond.
- **Type**: Journal article (Foundations and Trends in ML), review
- **Read from**: https://arxiv.org/pdf/1605.09522 (full text)
- **Method**: Review of kernel mean embeddings.
- **Key results**: Mean embeddings turn distributions into RKHS points usable by kernel methods.
- **Relevance**: The kernel alternative to transport for set-level prediction.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Zhang et al. (2024). Wasserstein Discriminant Dictionary Learning for Graph Representation.
- **Type**: Journal article (IEEE TPAMI)
- **Read from**: index abstract, doi:10.1109/tpami.2024.3409772
- **Method**: Learnable graph keys with a Wasserstein discriminant loss; graphs projected onto the dictionary by node and edge transport.
- **Key results**: Intra-class keys become compact and inter-class keys dispersed without computing global barycenters.
- **Relevance**: A supervised transport dictionary of templates.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Wilson, Needham and Srivastava (2024). Fused Gromov-Wasserstein Variance Decomposition with Linear Optimal Transport.
- **Type**: Preprint (arXiv 2411.10204)
- **Read from**: https://arxiv.org/html/2411.10204 (full text)
- **Method**: Decomposes the Frechet variance in W2 and FGW to measure what a LOT embedding keeps.
- **Key results**: Gives the percentage of variance a LOT embedding explains, by embedding dimension.
- **Relevance**: Tells how much a template embedding loses before a downstream regression.
- **Quality**: Medium; preprint.
- **Stance**: neutral.
- **Potential use**: Discussion.

### NaderiAlizadeh et al. (2025). Constrained Sliced Wasserstein Embedding.
- **Type**: Preprint (arXiv 2506.02203)
- **Read from**: https://arxiv.org/html/2506.02203 (full text)
- **Method**: Learns slicing directions under constraints that the 1D plans approximate the full plan; pools sets into fixed-length permutation-invariant vectors.
- **Key results**: Fewer slices for equal performance on image, point cloud and protein embeddings.
- **Relevance**: Current template-free transport pooling.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Gachon et al. (2025). Low Dimensional Representation of Multi-Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia.
- **Type**: Journal article (Cytometry Part A)
- **Read from**: index abstract, doi:10.1002/cyto.a.24918
- **Method**: Mean-measure quantisation of all patients' point clouds, then Wasserstein PCA through linearized OT or log-ratio PCA.
- **Key results**: Better than kernel mean embeddings on a public dataset and a Bordeaux hospital dataset, with a two-dimensional map of patients by residual disease level.
- **Relevance**: A patient-level analysis of unaligned point clouds through a transport template, in a clinical setting.
- **Quality**: Medium; two datasets.
- **Stance**: supports.
- **Potential use**: Literature Review, Discussion.

### Theme 3: Gromov-Wasserstein and fused Gromov-Wasserstein

### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Type**: Journal article (Foundations of Computational Mathematics)
- **Read from**: https://www.math.ucdavis.edu/~saito/data/acha.read.w12/memoli-gromov-dist.pdf (200)
- **Method**: Defines GW distances between metric measure spaces and studies their properties.
- **Key results**: GW is a metric up to isomorphism, comparing objects with no common ambient space.
- **Relevance**: The foundation for comparing subjects whose spatial modes share no coordinates.
- **Quality**: High; seminal, must include.
- **Stance**: supports.
- **Potential use**: Methodology.

### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Type**: Conference paper (ICML)
- **Read from**: index abstract, OpenAlex W2417433140
- **Method**: Entropic GW and GW barycenters of similarity matrices.
- **Key results**: Barycenters of matrices not in correspondence, with shape and graph applications.
- **Relevance**: The first practical GW template.
- **Quality**: High; must include.
- **Stance**: supports.
- **Potential use**: Methodology.

### Vayer et al. (2019). Optimal Transport for Structured Data with Application on Graphs.
- **Type**: Conference paper (ICML, PMLR 97); entry from https://proceedings.mlr.press/v97/titouan19a.html
- **Read from**: https://arxiv.org/html/1805.09114 (full text)
- **Method**: FGW, a distance mixing feature Wasserstein and structural GW terms.
- **Key results**: FGW classifies and averages attributed graphs better than either term alone.
- **Relevance**: Joint feature and geometry coupling for unaligned objects.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Vayer et al. (2020). Fused Gromov-Wasserstein Distance for Structured Objects.
- **Type**: Journal article (Algorithms)
- **Read from**: https://www.mdpi.com/1999-4893/13/9/212/pdf?version=1599119885 (full text)
- **Method**: Metric properties, geodesics and barycenters of FGW.
- **Key results**: FGW is a metric for suitable parameters and interpolates between W and GW.
- **Relevance**: Theory of FGW templates.
- **Quality**: Medium; Q2 journal.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Sejourne, Vialard and Peyre (2021). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
- **Type**: Conference paper (NeurIPS); entry from https://proceedings.neurips.cc/paper/2021/hash/4990974d150d0de5e6e15a1454fe6b0f-Abstract.html
- **Read from**: https://arxiv.org/html/2009.04266 (full text)
- **Method**: Unbalanced GW with a conic formulation and a computable relaxation.
- **Key results**: Robust to outliers and unequal mass, with a GPU-friendly algorithm.
- **Relevance**: Needed when subjects hold different amounts of signal, such as different lesion loads.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov-Wasserstein.
- **Type**: Conference paper (NeurIPS 35)
- **Read from**: https://arxiv.org/html/2206.09398 (full text)
- **Method**: FUGW: landmark-free alignment of cortical functional maps, and FUGW barycenters as group templates.
- **Key results**: Better inter-subject correlation of fMRI contrasts than anatomical alignment, and barycenters that keep fine topography.
- **Relevance**: Transport coupling as a replacement for anatomical registration in neuroimaging.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Vincent-Cuaz et al. (2021). Online Graph Dictionary Learning.
- **Type**: Conference paper (ICML, PMLR 139); entry from https://proceedings.mlr.press/v139/vincent-cuaz21a.html
- **Read from**: https://arxiv.org/html/2102.06555 (full text)
- **Method**: GW dictionary: each graph is a linear combination of atom graphs under GW.
- **Key results**: Embeddings of unregistered graphs usable for clustering and classification, learned online.
- **Relevance**: A GW template dictionary for unaligned objects.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Type**: Conference paper (NeurIPS); entry from https://proceedings.neurips.cc/paper_files/paper/2022/hash/4d3525bc60ba1adc72336c0392d3d902-Abstract.html
- **Read from**: https://arxiv.org/html/2205.15733 (full text)
- **Method**: TFGW: a GNN layer whose output is the vector of FGW distances to learnable template graphs.
- **Key results**: Outperforms GNN pooling baselines on graph classification and regression benchmarks.
- **Relevance**: The clearest case of end-to-end learned transport templates for object-level prediction.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Brogat-Motte et al. (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Type**: Conference paper (ICML, PMLR 162); entry from https://proceedings.mlr.press/v162/brogat-motte22a.html
- **Read from**: https://arxiv.org/html/2202.03813 (full text)
- **Method**: Predicts a graph as an FGW barycenter of learned templates weighted by the input.
- **Key results**: Consistency results and competitive structured prediction.
- **Relevance**: Templates as the output space, the converse of the question's setting.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Discussion.

### Yang, Labeau and d'Alche-Buc (2023). Exploiting Edge Features in Graphs with Fused Network Gromov-Wasserstein Distance.
- **Type**: Preprint (arXiv 2309.16604); Semantic Scholar names Trans. Mach. Learn. Res. 2024
- **Read from**: https://arxiv.org/html/2309.16604 (full text)
- **Method**: FNGW, extending FGW to edge features, with distance and barycenter algorithms.
- **Key results**: Gains on learning tasks where edges carry attributes.
- **Relevance**: Couplings that also compare relations between regions.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Methodology.

### Beier, Beinert and Steidl (2025). Tangential Fixpoint Iterations for Gromov-Wasserstein Barycenters.
- **Type**: Journal article (SIAM J. Imaging Sci.)
- **Read from**: https://arxiv.org/pdf/2403.08612 (full text)
- **Method**: GW barycenters by tangent-space fixpoint iteration.
- **Key results**: A characterisation of barycenters in the GW tangent space and a faster algorithm.
- **Relevance**: Computing GW templates.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Diaz Martin et al. (2026). Gromov-Wasserstein Barycenters: The Analysis Problem.
- **Type**: Journal article (SIAM J. Math. Data Sci.)
- **Read from**: https://arxiv.org/pdf/2507.09865 (full text)
- **Method**: Estimates barycentric coordinates of a matrix with respect to known GW templates.
- **Key results**: Two algorithms (fixed point and blow-up differentiation) and ML applications.
- **Relevance**: The coordinates of a subject against templates are a feature vector for prediction.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Qian et al. (2024). Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem.
- **Type**: Conference paper (KDD)
- **Read from**: index abstract, doi:10.1145/3637528.3671696
- **Method**: Several learned prototypes per class compared by FGW, with a neural FGW approximator.
- **Key results**: Competitive accuracy on graph benchmarks and an O(1/N) generalisation bound.
- **Relevance**: Prototype templates per class.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Seyedi et al. (2026). Conditional Gromov-Wasserstein Matching across Contexts: Theory, Regularization, and Applications to Brain Connectivity.
- **Type**: Journal article (Brain Informatics)
- **Read from**: index abstract, doi:10.1186/s40708-026-00336-8
- **Method**: GW whose geometry depends on a context variable, with expected, conditional and regularised formulations.
- **Key results**: Recovers constructed rewiring patterns on synthetic connectivity graphs; no real brain data.
- **Relevance**: GW extended to state-dependent connectomes.
- **Quality**: Low; synthetic evaluation only.
- **Stance**: neutral.
- **Potential use**: Discussion.

### Peng et al. (2026a). Wasserstein Graph Topological Learning for Brain Network Classification.
- **Type**: Journal article (IEEE Trans. Cogn. Dev. Syst.)
- **Read from**: index abstract, doi:10.1109/tcds.2026.3722535
- **Method**: Wasserstein prototypical contrastive learning on fMRI brain networks.
- **Key results**: Better disease detection than existing methods on several datasets.
- **Relevance**: Transport between subjects' networks for diagnosis; networks are on a common atlas.
- **Quality**: Medium; abstract reports no figures.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Theme 4: Permutation-invariant set encoders, multiple instance learning and point clouds

### Qi et al. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper (CVPR)
- **Read from**: https://arxiv.org/html/1612.00593 (full text)
- **Method**: Shared per-point MLP with symmetric max pooling.
- **Key results**: On par with or better than voxel methods on classification and segmentation, robust to perturbation.
- **Relevance**: The base permutation-invariant point cloud encoder.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Zaheer et al. (2017). Deep Sets.
- **Type**: Conference paper (NeurIPS); entry from https://papers.nips.cc/paper_files/paper/2017/hash/f22e4747da1aa27e363d86d40ff442fe-Abstract.html
- **Read from**: https://arxiv.org/html/1703.06114 (full text)
- **Method**: Characterises permutation-invariant functions as sum-decomposable.
- **Key results**: The rho(sum phi) architecture and conditions for equivariance.
- **Relevance**: The theory behind permutation invariance as a correspondence strategy.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Lee et al. (2019). Set Transformer.
- **Type**: Conference paper (ICML, PMLR 97); entry from https://proceedings.mlr.press/v97/lee19d.html
- **Read from**: https://arxiv.org/html/1810.00825 (full text)
- **Method**: Attention-based set encoder with inducing points.
- **Key results**: Models interactions among elements at linear cost and beats pooling baselines.
- **Relevance**: Set encoder that captures interactions between lesions or regions.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Conference paper (ICML, PMLR 80); entry from https://proceedings.mlr.press/v80/ilse18a.html
- **Read from**: https://arxiv.org/html/1802.04712 (full text)
- **Method**: Gated attention pooling of instances to a bag label.
- **Key results**: Comparable to the best MIL methods on benchmarks, better on histopathology, with instance weights.
- **Relevance**: The standard patient-level aggregator in medical MIL.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Methodology.

### Campanella et al. (2019). Clinical-Grade Computational Pathology Using Weakly Supervised Deep Learning on Whole Slide Images.
- **Type**: Journal article (Nature Medicine)
- **Read from**: index abstract, doi:10.1038/s41591-019-0508-1
- **Method**: MIL on 44,732 slides from 15,187 patients with report labels only.
- **Key results**: AUC above 0.98 for three cancer types without pixel annotation.
- **Relevance**: Shows set-level weak supervision removing the annotation step at scale.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Introduction, Discussion.

### Gutierrez-Becker and Wachinger (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy.
- **Type**: Chapter (MICCAI 2018)
- **Read from**: https://arxiv.org/html/1806.01069 (full text)
- **Method**: Multi-branch point cloud network with spatial transformers on raw structure point clouds.
- **Key results**: Predicts Alzheimer's disease and MCI and regresses brain age without meshes or point correspondence.
- **Relevance**: Subject-level prediction from unaligned anatomical point clouds.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Chen and Martel (2022). Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling.
- **Type**: Preprint (arXiv 2203.04964)
- **Read from**: https://arxiv.org/html/2203.04964 (full text)
- **Method**: Two injective MIL pooling functions over lesion radiomic features; a 341-patient multifocal benchmark.
- **Key results**: State-of-the-art outcome prediction on NSCLC CT and head and neck CT.
- **Relevance**: Patient-level prediction from a set of lesions.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Liu et al. (2026). Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease.
- **Type**: Journal article (BME Frontiers)
- **Read from**: index abstract, doi:10.34133/bmef.0276
- **Method**: Patient point clouds of anatomy, electrode and simulated electric field, PointNet++ versus voxel CNN.
- **Key results**: 15 of 24 test predictions within 5 UPDRS-III points versus 8 of 24 for the voxel CNN; 79 patients; the authors state the split does not support generalisation claims.
- **Relevance**: Point cloud representation kept in patient space instead of an atlas.
- **Quality**: Low; small fixed test set.
- **Stance**: supports.
- **Potential use**: Discussion.

### Sarasua et al. (2021). Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer's Disease.
- **Type**: Conference paper (ISBI)
- **Read from**: https://arxiv.org/pdf/2104.10047 (full text)
- **Method**: Compares template-free and template-based mesh networks on hippocampal meshes.
- **Key results**: Template-based methods were better in accuracy, parameter count and training speed.
- **Relevance**: Direct evidence for keeping a template-based correspondence step.
- **Quality**: Medium.
- **Stance**: opposes.
- **Potential use**: Discussion.

### Chen et al. (2024). TractGeoNet.
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: EPMC, DOI 10.1016/j.media.2024.103120
- **Method**: Point cloud regression on tract points with a paired-Siamese loss.
- **Key results**: Predicts language scores from tract microstructure without averaging along streamlines, with critical-region analysis.
- **Relevance**: Subject-level regression from unaligned point sets in neuroimaging.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Yang and Chakraborty (2020). An Augmentation-Free Rotation Invariant Classification Scheme on Point-Cloud and Its Application to Neuroimaging.
- **Type**: Conference paper (ISBI)
- **Read from**: https://arxiv.org/pdf/1911.03443 (full text)
- **Method**: Rotation-invariant point cloud classifier with spherical convolution and attention.
- **Key results**: Dementia classification from corpus callosum shapes on OASIS without rotation augmentation.
- **Relevance**: Builds pose invariance into the model in place of rigid registration.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Nikolentzos and Skianis (2026). On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets.
- **Type**: Conference paper (ICLR 2026); entry from https://mlanthology.org/iclr/2026/nikolentzos2026iclr-lipschitz/
- **Read from**: https://arxiv.org/html/2505.24403 (full text)
- **Method**: Lipschitz constants of sum, mean, max and attention aggregators under three multiset distances.
- **Key results**: Each aggregator is Lipschitz for only one of the distances in general; attention is not Lipschitz for any.
- **Relevance**: Stability of set encoders to small changes in the lesion or point set.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology, Discussion.

### Do et al. (2025). Incorporating Hierarchical Information into Multiple Instance Learning for Patient Phenotype Prediction with scRNA-seq Data.
- **Type**: Journal article (Bioinformatics)
- **Read from**: index abstract, doi:10.1093/bioinformatics/btaf241
- **Method**: Attention MIL over cells and cell types.
- **Key results**: Competitive phenotype prediction, robust to small samples.
- **Relevance**: Patient-level prediction from unordered sets outside imaging.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Jia et al. (2024). Using 3D Point Cloud and Graph-Based Neural Networks to Improve the Estimation of Pulmonary Function Tests from Chest CT.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Read from**: index abstract, doi:10.1016/j.compbiomed.2024.109192
- **Method**: Point cloud and graph networks on vessel centrelines versus a CNN on down-sampled vessel images.
- **Key results**: The point cloud network beat the CNN by 14 percent in mean ICC with 30 percent of the training time.
- **Relevance**: Subject-level regression from point sets without volume resampling.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Yang et al. (2025). PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation.
- **Type**: Journal article (IEEE JBHI)
- **Read from**: index abstract, doi:10.1109/JBHI.2024.3495035
- **Method**: Point cloud dataset of hearts with a benchmark of point cloud methods and a manifold-learning representation.
- **Key results**: The proposed representation was best on every benchmark task.
- **Relevance**: A public benchmark for patient-level point cloud classification.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential use**: Methodology.

### Gan et al. (2026). Beyond the Dominant Label: Recovering Coexisting Lesion Evidence with Multiple Instance Learning.
- **Type**: Preprint (arXiv 2610.22091)
- **Read from**: https://arxiv.org/html/2610.22091 (full text)
- **Method**: Dominant-label MIL with a censored likelihood and severity-ordered routing.
- **Key results**: Better dominant-label prediction and recovery of coexisting lesions.
- **Relevance**: Lesion-set labels when only the worst lesion is reported.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Discussion.

### Zare et al. (2025). Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology.
- **Type**: Journal article (Kidney360)
- **Read from**: index abstract, doi:10.34067/kid.0000000668
- **Method**: Transformer set operator over sets of glomerular crops.
- **Key results**: AUC 0.99 internal and 0.96 external for active crescents; 0.97 for case-level antibody-mediated rejection.
- **Relevance**: Case-level prediction from sets of regions with external validation.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Theme 5: Medical-imaging pipelines and registration-free transport-based alternatives

### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Type**: Chapter (IPMI 2015)
- **Read from**: https://arxiv.org/html/1503.08596 (full text)
- **Method**: Entropic Kantorovich means of non-normalised data on arbitrary domains.
- **Key results**: Group averages of MEG and fMRI maps that keep spatially non-overlapping effects instead of blurring them.
- **Relevance**: The first transport template for neuroimaging groups, in place of smoothing.
- **Quality**: High; seminal.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Bazeille et al. (2019). Local Optimal Transport for Functional Brain Template Estimation.
- **Type**: Chapter (IPMI 2019)
- **Read from**: https://hal.science/hal-02278663 (200), description tag
- **Method**: Local OT alignment of subjects to a functional template.
- **Key results**: The template improves inter-subject decoding over anatomical alignment.
- **Relevance**: Transport template replacing anatomical registration.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Kundu et al. (2018). Discovery and Visualization of Structural Biomarkers from MRI Using Transport-Based Morphometry.
- **Type**: Journal article (NeuroImage)
- **Read from**: index abstract, doi:10.1016/j.neuroimage.2017.11.006
- **Method**: Transport-based morphometry: images mapped by transport to a reference, then linear models.
- **Key results**: Discovers ageing changes and fitness associations with linear models, with invertible visualisation.
- **Relevance**: A transport embedding as the feature space for subject-level outcomes.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Feydy et al. (2017). Optimal Transport for Diffeomorphic Registration.
- **Type**: Chapter (MICCAI 2017)
- **Read from**: https://arxiv.org/html/1706.05218 (full text)
- **Method**: Unbalanced OT as a similarity term in LDDMM.
- **Key results**: Better matching of fibre bundles and surfaces.
- **Relevance**: Transport that improves registration rather than removing it.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Shen et al. (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
- **Type**: Conference paper (NeurIPS); entry from https://proceedings.neurips.cc/paper/2021/hash/2b0f658cbffd284984fb11d90254081f-Abstract.html
- **Read from**: https://arxiv.org/html/2111.00648 (full text)
- **Method**: Robust OT inside optimisation and deep point cloud registration.
- **Key results**: State of the art on KITTI scene flow and lung vessel registration; the PVT1010 dataset.
- **Relevance**: Transport-based registration of medical point clouds.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Gong et al. (2026). Robust Prostate Cancer Risk Stratification from Unregistered mpMRI via Learned Cross-Modal Correspondence.
- **Type**: Journal article (Frontiers in Oncology)
- **Read from**: https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf (full text)
- **Method**: CMOT-Fusion: learned transport matching of regions between misaligned T2WI and ADC.
- **Key results**: CV AUC 0.849 on 250 men; temporal test AUC 0.824 versus PI-RADS 0.839 on 50 men.
- **Relevance**: Registration removed from a clinical prediction pipeline by a transport coupling.
- **Quality**: Medium; single centre, small test set.
- **Stance**: supports.
- **Potential use**: Literature Review, Discussion.

### Mazelet et al. (2026). Learning fMRI Activations Dictionaries across Individual Geometries via Optimal Transport.
- **Type**: Preprint (arXiv 2605.20883)
- **Read from**: https://arxiv.org/html/2605.20883 (full text)
- **Method**: FGW dictionary learning on individual cortical graphs with amortised FGW.
- **Key results**: Dictionaries learned without projecting subjects to a common template.
- **Relevance**: The most direct case of a learned transport dictionary on unaligned brains.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Literature Review, Methodology.

### Gerber et al. (2023). Optimal Transport Features for Morphometric Population Analysis.
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: EPMC, DOI 10.1016/j.media.2022.102696
- **Method**: Unbalanced OT feature extraction added to morphometry.
- **Key results**: More statistical power for dispersed tissue loss and less sensitivity to misalignment.
- **Relevance**: Transport features that tolerate registration error.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Barbarant et al. (2026). Functional Templates for fMRI Decoding (bioRxiv preprint, 10.64898/2026.05.21.726781).
- **Type**: Preprint (bioRxiv)
- **Read from**: index abstract, doi:10.64898/2026.05.21.726781
- **Method**: Compares OT, Procrustes, ridge and shared response alignment and template strategies in decoding.
- **Key results**: OT templates gave the highest decoding accuracy, were not biased by individual subjects and kept topography.
- **Relevance**: Comparative evidence that transport templates beat other alignment.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Discussion.

### Thual et al. (2025). Sample-Efficient Decoding of Visual Stimuli from fMRI through Inter-Individual Functional Alignment.
- **Type**: Journal article (TMLR); entry from the Semantic Scholar record
- **Read from**: https://mlanthology.org/tmlr/2025/thual2025tmlr-sampleefficient/ (200)
- **Method**: FUGW alignment of left-out subjects to training subjects before decoding.
- **Key results**: Halves the median rank out-of-subject and beats within-subject decoding below 100 minutes of data.
- **Relevance**: Transport alignment as the step that makes subject transfer work.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Jeganathan et al. (2024). Integrating Anatomical and Functional Landmarks for Interparticipant Alignment of Imaging Data.
- **Type**: Journal article (Imaging Neuroscience)
- **Read from**: index abstract, doi:10.1162/imag_a_00253
- **Method**: Functional alignment to a template interpolated with anatomical alignment, 80 HCP participants.
- **Key results**: Using the same participants for template and alignment inflates decoding; templates must be tested on held-out participants.
- **Relevance**: A validation rule for any template-based method.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology, Discussion.

### Tang et al. (2026). Metabolic Connectivity Alterations in ALS: Individual Network Analysis Based on Wasserstein Distances.
- **Type**: Journal article (Imaging Neuroscience)
- **Read from**: index abstract, doi:10.1162/IMAG.a.1343
- **Method**: Single-subject FDG-PET networks from Wasserstein distances between regional uptake distributions; SVM classification.
- **Key results**: Matched voxel-wise accuracy (above 0.80, significantly lower than voxel-wise) for ALS versus controls and beat images for ALS versus mimics (0.65).
- **Relevance**: Transport between within-subject regional distributions as subject features.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Yan et al. (2026). GWDRO-Lung.
- **Type**: Journal article (npj Digital Medicine)
- **Read from**: https://www.nature.com/articles/s41746-026-03323-9_reference.pdf (full text)
- **Method**: Cohort relation matrices aligned to a GW barycenter plus distributionally robust calibration.
- **Key results**: External AUC 0.857 to 0.878 and ECE 0.106 to 0.066 on 618 LNDb nodules.
- **Relevance**: A GW barycenter used at the cohort level in a clinical prediction model.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Qahqaie et al. (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
- **Type**: Conference paper (ISBI 2026)
- **Read from**: https://arxiv.org/pdf/2602.09933 (full text)
- **Method**: Unbalanced OT over lesion instances with a registration trust term from the Jacobian.
- **Key results**: Handles appearing, disappearing, merging and splitting lesions.
- **Relevance**: Transport coupling of lesion sets that builds on registration.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Peng et al. (2026). AtlasOT: The Fused Unbalanced Gromov-Wasserstein for Multimodal Integration of Disease Atlases.
- **Type**: Preprint (bioRxiv)
- **Read from**: index abstract, doi:10.64898/2026.09.22.753496
- **Method**: FUGW integration of unpaired modalities restricted to within-sample cells.
- **Key results**: Better than baselines on scRNA-scATAC and spatial mapping.
- **Relevance**: FUGW across domains with unequal mass.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Discussion.

### Avants et al. (2008). Symmetric Diffeomorphic Image Registration with Cross-Correlation.
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: EPMC, DOI 10.1016/j.media.2007.06.004
- **Method**: SyN symmetric diffeomorphic registration.
- **Key results**: Accurate labelling in elderly and neurodegenerative brains.
- **Relevance**: The registration step that transport and set methods aim to remove.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Balakrishnan et al. (2019). VoxelMorph.
- **Type**: Journal article (IEEE TMI)
- **Read from**: https://arxiv.org/pdf/1809.05231 (full text)
- **Method**: CNN that maps an image pair to a deformation field.
- **Key results**: Accuracy comparable to classical methods at a fraction of the runtime.
- **Relevance**: Learned registration as the fast form of the common-space strategy.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Ashburner and Friston (2000). Voxel-Based Morphometry: The Methods.
- **Type**: Journal article (NeuroImage)
- **Read from**: EPMC, DOI 10.1006/nimg.2000.0582
- **Method**: Spatial normalisation, segmentation, smoothing and voxel-wise statistics.
- **Key results**: Defines the VBM pipeline.
- **Relevance**: The canonical registration-dependent pipeline.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Bookstein (2001). "Voxel-Based Morphometry" Should Not Be Used with Imperfectly Registered Images.
- **Type**: Journal article (NeuroImage)
- **Read from**: EPMC, DOI 10.1006/nimg.2001.0770
- **Method**: Theoretical critique of VBM.
- **Key results**: VBM statistics are uninformative wherever spatial normalisation has failed.
- **Relevance**: The argument that registration error confounds group and subject inference.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Introduction.

### Davatzikos (2004). Why Voxel-Based Morphometric Analysis Should Be Used with Great Caution.
- **Type**: Journal article (NeuroImage), commentary
- **Read from**: EPMC, DOI 10.1016/j.neuroimage.2004.05.010
- **Method**: Analysis of VBM limits.
- **Key results**: VBM results depend on registration accuracy and smoothing.
- **Relevance**: Same argument as Bookstein from the registration side.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Introduction.

### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Type**: Journal article (Radiology), review
- **Read from**: index abstract, doi:10.1148/radiol.2015151169
- **Method**: Review of the radiomics process.
- **Key results**: Describes the pipeline, its challenges and its potential for decision making.
- **Relevance**: The radiomics pipeline that lesion-set methods build on.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Lambin et al. (2017). Radiomics: The Bridge between Medical Imaging and Personalized Medicine.
- **Type**: Journal article (Nature Reviews Clinical Oncology), review
- **Read from**: EPMC, DOI 10.1038/nrclinonc.2017.141
- **Method**: Review with a radiomics quality score.
- **Key results**: Sets out the process and pitfalls, and a quality score for studies.
- **Relevance**: Standards a lesion-set model must still meet.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

### Aerts et al. (2014). Decoding Tumour Phenotype by Noninvasive Imaging Using a Quantitative Radiomics Approach.
- **Type**: Journal article (Nature Communications)
- **Read from**: https://www.nature.com/articles/ncomms5006.pdf (full text)
- **Method**: 440 radiomic features in lung and head and neck cohorts.
- **Key results**: A prognostic radiomic signature validated across cohorts.
- **Relevance**: The single-lesion radiomics baseline.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Introduction.

### van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Type**: Journal article (Cancer Research), tool
- **Read from**: index abstract, doi:10.1158/0008-5472.CAN-17-0339
- **Method**: PyRadiomics open-source feature extraction.
- **Key results**: Standardised feature definitions for reproducible extraction.
- **Relevance**: The extractor used by lesion-set studies (Karimzadeh_2026).
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative.
- **Type**: Journal article (Radiology)
- **Read from**: EPMC, DOI 10.1148/radiol.2020191145
- **Method**: Multi-team standardisation of 174 radiomic features in three phases.
- **Key results**: Weak consensus fell from 76.8 percent of features to 0.4 percent of 487 features.
- **Relevance**: Feature reproducibility for lesion-level inputs.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Isensee et al. (2020). nnU-Net.
- **Type**: Journal article (Nature Methods)
- **Read from**: https://arxiv.org/pdf/1904.08128 (full text)
- **Method**: Self-configuring segmentation framework.
- **Key results**: Beats most specialised pipelines in 19 competitions and 49 tasks without manual tuning.
- **Relevance**: The segmentation step that produces lesion sets.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Methodology.

### Menze et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS).
- **Type**: Journal article (IEEE TMI), benchmark
- **Read from**: index abstract, doi:10.1109/TMI.2014.2377694
- **Method**: Benchmark of 20 segmentation algorithms on 65 real and 65 simulated scans.
- **Key results**: Inter-rater Dice 74 to 85 percent; fused algorithms beat single ones.
- **Relevance**: Segmentation error that propagates into lesion-level inputs.
- **Quality**: High; seminal.
- **Stance**: neutral.
- **Potential use**: Discussion.

### Karimzadeh et al. (2026). Revisiting Multi-Nodal Radiomics with Advanced Feature Learning for Lymphoma Classification.
- **Type**: Journal article (Physics in Medicine and Biology)
- **Read from**: https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf (full text)
- **Method**: Patients as unordered sets of lymph-node radiomic vectors; Deep Sets, Set Transformer, MIL and Transformer versus pooled baselines; two centres.
- **Key results**: Internal AUC up to 0.91; external drop recovered by test-time adaptation (Transformer 0.81 to 0.87).
- **Relevance**: Lesion-set encoders on radiomics with rigid registration only for node coordinates.
- **Quality**: High.
- **Stance**: supports.
- **Potential use**: Literature Review.

### Phan et al. (2026). Estimating Metastatic Disease Heterogeneity Using Radiomics-Based Lesion Clustering and Heterogeneity Index.
- **Type**: Journal article (J. Imaging Informatics in Medicine)
- **Read from**: EPMC, DOI 10.1007/s10278-026-02118-4
- **Method**: Consensus clustering of 1,583 lesions of 335 patients and a Hill-number heterogeneity index.
- **Key results**: A patient-level heterogeneity index from lesion clusters, validated on a temporal cohort.
- **Relevance**: A hand-built set summary of lesions.
- **Quality**: Medium; single centre.
- **Stance**: neutral.
- **Potential use**: Literature Review.

### Eertink et al. (2022). Comparing Lesion and Feature Selections to Predict Progression in DLBCL with FDG PET/CT Radiomics.
- **Type**: Journal article (EJNMMI)
- **Read from**: https://link.springer.com/content/pdf/10.1007/s00259-022-05916-4.pdf (full text)
- **Method**: Lesion selection rules (largest, hottest, patient-level, max or median) compared in 296 patients.
- **Key results**: Conventional PET and dissemination features gave CV-AUC 0.72 to 0.75; no lesion selection beat the earlier model.
- **Relevance**: Shows hand-chosen lesion aggregation adds little; motivates learned set aggregation.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Discussion.

### Nguyen et al. (2026). The Case for Interpretable Geometry: Statistical Shape Models vs. Curvature-Based Descriptors in Aortic Disease Classification.
- **Type**: Preprint (medRxiv)
- **Read from**: index abstract, doi:10.64898/2026.07.29.26359299
- **Method**: Point-cloud SSM with PCA versus two correspondence-free curvature descriptors on 290 CTA scans.
- **Key results**: The curvature descriptors generalised better to an unseen dataset than SSM.
- **Relevance**: Correspondence-based versus correspondence-free shape features for outcome classes.
- **Quality**: Medium; preprint.
- **Stance**: supports.
- **Potential use**: Discussion.

### Chen et al. (2025). A Survey on Deep Learning in Medical Image Registration.
- **Type**: Journal article (Medical Image Analysis), review
- **Read from**: EPMC, DOI 10.1016/j.media.2024.103385
- **Method**: Survey of deep registration.
- **Key results**: Covers architectures, losses, uncertainty and evaluation metrics.
- **Relevance**: Current state of the registration step.
- **Quality**: High.
- **Stance**: neutral.
- **Potential use**: Introduction.

## 5. Literature matrix

Themes: T1 tensor regression, multilinear PLS and unaligned-mode decompositions; T2 entropic OT, barycenters, dictionaries and learnable templates; T3 GW and FGW; T4 permutation-invariant set encoders, MIL and point clouds; T5 medical-imaging pipelines (registration, radiomics, lesion segmentation) and registration-free transport-based alternatives.

| Source | T1 | T2 | T3 | T4 | T5 | Method | Quality |
|---|---|---|---|---|---|---|---|
| Zhao et al. (2013) | main | | | | | Computational | High |
| Zhou et al. (2013) | main | | | | x | Computational | High |
| Lock (2018) | main | | | | | Computational | High |
| Li et al. (2018) | main | | | | x | Computational | Medium |
| Kolda and Bader (2009) | main | | | | | Review | High |
| Perros et al. (2017) | main | | | x | | Computational | High |
| Afshar et al. (2018) | main | | | | | Computational | Medium |
| Ren et al. (2023) | main | | | | | Computational | Medium |
| Afshar et al. (2021) | main | x | | | | Computational | High |
| Park and Keles (2025) | main | | | | | Theoretical | High |
| Bro (1996) | main | | | | | Computational | High |
| Kiers et al. (1999) | main | | | | | Computational | High |
| Bro et al. (1999) | main | | | | | Computational | High |
| Krishnan et al. (2011) | main | | | | x | Review | High |
| Roald et al. (2022) | main | | | | | Computational | High |
| Naji et al. (2026) | main | | | | x | Computational | Medium |
| Li et al. (2027) | main | | | | | Computational | High |
| Wang et al. (2025) | main | | | | | Computational | Medium |
| Wang and Tang (2024) | main | x | | | | Computational | Low |
| Peyre and Cuturi (2019) | | main | x | | | Review | High |
| Cuturi (2013) | | main | | | | Computational | High |
| Feydy et al. (2019) | | main | | x | | Computational | High |
| Kolouri et al. (2017) | | main | | | x | Review | High |
| Agueh and Carlier (2011) | | main | | | | Theoretical | High |
| Cuturi and Doucet (2014) | | main | | | | Computational | High |
| Benamou et al. (2015) | | main | | | | Computational | High |
| Schmitz et al. (2018) | | main | | | | Computational | High |
| Wang et al. (2012) | | main | | | x | Computational | High |
| Mialon et al. (2020) | | main | | x | | Computational | Medium |
| Naderializadeh et al. (2021) | | main | | x | | Computational | Medium |
| Kolouri et al. (2020) | | main | | x | | Computational | Medium |
| Mahan et al. (2024) | | main | | x | | Computational | Medium |
| Song et al. (2024) | | main | | x | x | Computational | High |
| Wang et al. (2024) | | main | | x | | Computational | High |
| Szabo et al. (2016) | | main | | x | | Theoretical | High |
| Muandet et al. (2017) | | main | | x | | Review | High |
| Zhang et al. (2024) | | main | x | | | Computational | High |
| Wilson et al. (2024) | | main | x | | | Computational | Medium |
| NaderiAlizadeh et al. (2025) | | main | | x | | Computational | Medium |
| Gachon et al. (2025) | | main | | | x | Computational | Medium |
| Memoli (2011) | | x | main | | | Theoretical | High |
| Peyre et al. (2016) | | x | main | | | Computational | High |
| Vayer et al. (2019) | | | main | | | Computational | High |
| Vayer et al. (2020) | | | main | | | Theoretical | Medium |
| Sejourne et al. (2021) | | | main | | | Computational | High |
| Thual et al. (2022) | | x | main | | x | Computational | High |
| Vincent-Cuaz et al. (2021) | | x | main | | | Computational | High |
| Vincent-Cuaz et al. (2022) | | x | main | x | | Computational | High |
| Brogat-Motte et al. (2022) | | x | main | | | Computational | High |
| Yang et al. (2023) | | | main | | | Computational | Medium |
| Beier et al. (2025) | | x | main | | | Computational | High |
| Diaz Martin et al. (2026) | | x | main | | | Computational | High |
| Qian et al. (2024) | | x | main | | | Computational | High |
| Seyedi et al. (2026) | | | main | | x | Computational | Low |
| Peng et al. (2026a) | | | main | | x | Computational | Medium |
| Qi et al. (2017) | | | | main | | Computational | High |
| Zaheer et al. (2017) | | | | main | | Theoretical | High |
| Lee et al. (2019) | | | | main | | Computational | High |
| Ilse et al. (2018) | | | | main | x | Computational | High |
| Campanella et al. (2019) | | | | main | x | Computational | High |
| Gutierrez-Becker and Wachinger (2018) | | | | main | x | Computational | High |
| Chen and Martel (2022) | | | | main | x | Computational | Medium |
| Liu et al. (2026) | | | | main | x | Computational | Low |
| Sarasua et al. (2021) | | | | main | x | Quantitative | Medium |
| Chen et al. (2024) | | | | main | x | Computational | High |
| Yang and Chakraborty (2020) | | | | main | x | Computational | Medium |
| Nikolentzos and Skianis (2026) | | | | main | | Theoretical | High |
| Do et al. (2025) | | | | main | | Computational | High |
| Jia et al. (2024) | | | | main | x | Computational | Medium |
| Yang et al. (2025) | | | | main | x | Dataset or tool | Medium |
| Gan et al. (2026) | | | | main | x | Computational | Medium |
| Zare et al. (2025) | | | | main | x | Computational | High |
| Gramfort et al. (2015) | | x | | | main | Computational | High |
| Bazeille et al. (2019) | | x | | | main | Computational | High |
| Kundu et al. (2018) | | x | | | main | Computational | High |
| Feydy et al. (2017) | | x | | | main | Computational | High |
| Shen et al. (2021) | | x | | x | main | Computational | High |
| Gong et al. (2026) | | x | | | main | Computational | Medium |
| Mazelet et al. (2026) | | x | x | | main | Computational | Medium |
| Gerber et al. (2023) | | x | | | main | Computational | High |
| Barbarant et al. (2026) | | x | | | main | Quantitative | Medium |
| Thual et al. (2025) | | | x | | main | Computational | High |
| Jeganathan et al. (2024) | | | | | main | Quantitative | High |
| Tang et al. (2026) | | x | | | main | Quantitative | Medium |
| Yan et al. (2026) | | | x | | main | Computational | High |
| Qahqaie et al. (2026) | | x | | | main | Computational | Medium |
| Peng et al. (2026) | | | x | | main | Computational | Medium |
| Avants et al. (2008) | | | | | main | Computational | High |
| Balakrishnan et al. (2019) | | | | | main | Computational | High |
| Ashburner and Friston (2000) | | | | | main | Computational | High |
| Bookstein (2001) | | | | | main | Theoretical | High |
| Davatzikos (2004) | | | | | main | Theoretical | High |
| Gillies et al. (2016) | | | | | main | Review | High |
| Lambin et al. (2017) | | | | | main | Review | High |
| Aerts et al. (2014) | | | | | main | Quantitative | High |
| van Griethuysen et al. (2017) | | | | | main | Dataset or tool | High |
| Zwanenburg et al. (2020) | | | | | main | Quantitative | High |
| Isensee et al. (2020) | | | | | main | Computational | High |
| Menze et al. (2015) | | | | | main | Dataset or tool | High |
| Karimzadeh et al. (2026) | | | | x | main | Computational | High |
| Phan et al. (2026) | | | | x | main | Quantitative | Medium |
| Eertink et al. (2022) | | | | x | main | Quantitative | High |
| Nguyen et al. (2026) | | | | | main | Quantitative | Medium |
| Chen et al. (2025) | | | | | main | Review | High |

Coverage (main, then main or x): T1 19, 19; T2 21, 43; T3 15, 22; T4 17, 33; T5 32, 55. Every theme holds 3 or more sources.

## 6. Identified gaps

1. **Methodological gap: no supervised multilinear model whose spatial mode is matched by a transport coupling.** Tensor regression and tensor PLS require every mode to share an index across subjects [@Qibin_Zhao_2013; @Zhou_2013; @Lock_2018; @Li_2018; @Park_2025]. PARAFAC2 absorbs an unaligned mode in decomposition [@Kiers_1999; @Bro_1999; @Roald_2022], and only one included source supervises it, on EHR time rather than space [@arxiv_2208_00993]. Where transport and tensor factorization meet, the transport acts on the feature mode [@Afshar_2021; @arxiv_2401_01842]. A tensor PLS or regression whose spatial mode is coupled to a learned template by entropic or (F)GW transport, trained end to end with the outcome, appears in none of the 104 sources.
2. **Under-researched area: transport templates for sets of lesions.** Patient-level lesion-set prediction uses radiomics with set pooling or hand-built summaries [@Karimzadeh_2026; @arxiv_2203_04964; @Phan_2026; @Eertink_2022]. Transport-based registration-free methods in medicine concentrate on brain alignment and morphometry [@Thual_2022; @Thual_2025; @Gerber_2023; @Kundu_2018] and on matching lesions over time [@Qahqaie_2026]. No included source couples each patient's lesion set to a learned template or barycenter for outcome prediction, although learned transport templates exist for graphs and sets [@arxiv_2205_15733; @arxiv_2006_12065; @Zhang_2024].
3. **Methodological gap: no comparison of the four correspondence strategies on one task.** Comparisons exist only in pairs: template-based versus template-free meshes [@Sarasua_2021], shape models versus correspondence-free curvature [@Nguyen_2026], transport versus other functional alignment [@Barbarant_2026], point clouds versus voxels [@Liu_2026; @Jia_2024]. Their verdicts point in different directions, and none compares registration, a learned template, a transport coupling and permutation invariance on the same cohort and outcome.
4. **Population gap: small, single-centre clinical evaluations.** The registration-free clinical models are validated on 50 to a few hundred patients from one or two centres [@Gong_2026; @Liu_2026; @Karimzadeh_2026; @Phan_2026], and template validation can be inflated when the same participants build and use the template [@Jeganathan_2024]. External validation appears in Yan_2026, Zare_2025 and Karimzadeh_2026 only.

## 7. Synthesis

### Topic, rationale and scope

Many subject-level prediction problems in medical imaging start from data whose spatial mode is not shared across subjects: a different number of lesions per patient, anatomical surfaces sampled as point clouds, or cortical maps whose functional layout differs between people. The standard pipeline restores a shared index before modelling, by registering images to a common space [@AVANTS_2008; @Balakrishnan_2019; @Ashburner_2000], segmenting lesions [@Isensee_2020; @Menze_2015] and computing radiomic features per lesion [@Gillies_2016; @Lambin_2017; @van_Griethuysen_2017]. This review asks which methods predict a subject-level outcome without that shared index, how each handles the missing correspondence, and where each removes or builds on registration, radiomics and segmentation. It covers methods from any domain (chemometrics, health records, graphs, computer vision, neuroimaging and oncology imaging), English sources, with seminal works from 1996 and a focus on 2016 to 2026.

### Review methodology

The search used PubMed, the Crossref, OpenAlex, Semantic Scholar and arXiv indexes through `the lookup script`, and web searches for IEEE Xplore, ACM DL and Scopus, in three passes of Boolean search, citation chaining, forward tracking and semantic search, plus a search restricted to 2024 to 2026 to meet the currency gate. Title and abstract screening and a full-text or abstract assessment gave 104 sources. The themes are tensor and multilinear models (T1), entropic OT and templates (T2), GW and FGW (T3), set encoders (T4), and the medical pipeline with its transport-based alternatives (T5).

### Theme 1: Tensor regression, multilinear PLS and decompositions with an unaligned mode

**Multilinear regression assumes alignment.** Multilinear PLS began as N-PLS in chemometrics [@Bro_1996] and was generalised to Tucker-structured HOPLS [@Qibin_Zhao_2013]. Tensor GLMs with CP or Tucker coefficients made regression on whole MRI volumes feasible [@Zhou_2013; @Li_2018], and tensor-on-tensor models cover tensor responses [@Lock_2018; @Wang_2025]. Current work adds functional smoothness [@Li_2027] or Bayesian envelopes [@https://doi.org/10.5281/zenodo.22212575]. All of these treat the spatial mode as a fixed grid, so each relies on prior registration; PLS in neuroimaging is used the same way [@Krishnan_2011]. In high dimensions HOPLS is not even consistent without sparsity [@Park_2025], which matters for small imaging cohorts.

**Decompositions that absorb an unaligned mode.** PARAFAC2 lets one mode vary across slices, first for chromatographic retention shifts [@Bro_1999] with a direct fitting algorithm [@Kiers_1999], later at EHR scale with irregular visit counts [@Perros_2017; @Afshar_2018] and with constraints on the varying mode [@Roald_2022]. MULTIPAR supervises PARAFAC2 with outcomes and reports better prediction than factorizing first [@arxiv_2208_00993]. Transport has entered tensor factorization only as a loss over features [@Afshar_2021; @arxiv_2401_01842].

**Summary.** The tensor literature offers strong supervised models for aligned modes and unsupervised models for one unaligned mode; supervision with an unaligned spatial mode is limited to one EHR study [@Kolda_2009].

### Theme 2: Entropic OT, barycenters, dictionaries and learnable templates

**Couplings made cheap.** Entropic regularisation and Sinkhorn scaling made transport fast and differentiable [@arxiv_1306_0895; @Peyr__2019], and Sinkhorn divergences give a debiased loss between point sets [@arxiv_1810_08278].

**Barycenters as a learned common space.** Wasserstein barycenters exist and are unique under mild conditions [@Agueh_2011] and can be computed by entropic methods [@arxiv_1310_4375; @Benamou_2015]. Dictionaries of barycenters represent each datum by barycentric weights [@Schmitz_2018]. Linear OT embeds each measure by its map from a fixed reference so that linear statistics apply [@Wang_2012; @Kolouri_2017], and a variance decomposition measures what such an embedding keeps [@arxiv_2411_10204].

**Templates learned for prediction.** A trainable reference turns a set into a fixed-size vector through its transport plan [@arxiv_2006_12065], by sliced transport [@arxiv_2103_03892; @arxiv_2506_02203], by Monge maps for graphs [@arxiv_2006_09430] or by learned maps with set encoders [@arxiv_2401_01460]. Kernel mean embeddings offer the non-transport route, with consistency theory for distribution regression [@Muandet_2017; @arxiv_1411_2066] and learned reference distributions for graphs [@Wang_2024]. Supervised transport dictionaries make templates class-discriminative [@Zhang_2024]. In medicine, prototype summaries of whole slides [@Song_2024] and transport embeddings of multi-patient flow cytometry point clouds [@Gachon_2025] apply these ideas at the patient level.

**Summary.** Learned references are a tested way to replace correspondence with a coupling to a template, and the template can be trained with the outcome.

### Theme 3: Gromov-Wasserstein and fused Gromov-Wasserstein

**Comparing objects with no shared coordinates.** GW compares metric measure spaces with no common ambient space [@M_moli_2011], and entropic GW gives barycenters of matrices not in correspondence [@Peyre_2016]. FGW adds node features [@arxiv_1805_09114; @Vayer_2020], FNGW edge features [@arxiv_2309_16604], and unbalanced GW tolerates unequal mass [@arxiv_2009_04266].

**GW templates and dictionaries.** GW dictionaries embed unregistered graphs [@arxiv_2102_06555]; TFGW feeds FGW distances to learnable templates into a network and outperforms pooling baselines [@arxiv_2205_15733]; per-class prototypes give generalisation bounds [@Qian_2024]. Barycenter algorithms [@Beier_2025] and barycentric coordinates against fixed templates [@D_az_Mart_n_2026] supply features, and templates can also serve as an output space [@arxiv_2202_03813]. Brain-network work applies GW to context-dependent connectomes [@Seyedi_2026] and Wasserstein prototypes to diagnosis on atlas networks [@Peng_2026a].

**Summary.** GW and FGW are the strategy that needs no shared space at all; the cost is a non-convex problem, which the template and barycenter methods amortise.

### Theme 4: Permutation-invariant set encoders, MIL and point clouds

**Architectures.** Permutation-invariant functions are sum-decomposable [@arxiv_1703_06114]; PointNet applies this to point clouds [@Charles_2017], the Set Transformer models interactions [@arxiv_1810_00825], and attention MIL weights instances [@arxiv_1802_04712]. Stability depends on the aggregator: each common one is Lipschitz for one multiset distance only [@arxiv_2505_24403].

**Medical use.** Weakly supervised MIL reached clinical-grade pathology at scale [@Campanella_2019], with case-level prediction from region sets validated externally [@Zare_2025] and label models for coexisting lesions [@arxiv_2610_22091]. Raw anatomical point clouds predict dementia and brain age without correspondence [@Guti_rrez_Becker_2018; @Yang_2020], tract point clouds predict language scores [@Chen_2024], vessel point clouds predict lung function better than a down-sampled CNN [@Jia_2024], and electrode-field point clouds predict DBS response in a small cohort [@Liu_2026]. A public point cloud benchmark exists for congenital heart disease [@Yang_2025]. Outside imaging, attention MIL predicts patient phenotypes from cell sets [@Do_2025].

**Summary.** Permutation invariance removes correspondence by design, at the price of ignoring which element matches which across subjects.

### Theme 5: The medical pipeline and registration-free transport alternatives

**The pipeline and its weak points.** VBM depends on spatial normalisation [@Ashburner_2000], and its statistics fail where registration fails [@Bookstein_2001; @Davatzikos_2004]. Radiomics needs segmentation and standardised features [@Aerts_2014; @Zwanenburg_2020], and segmentation itself varies between raters [@Menze_2015]. Registration has moved to learned models [@Balakrishnan_2019; @Chen_2025].

**Transport building on registration.** OT improves registration as a similarity term [@Feydy_2017], registers lung vessel point clouds [@arxiv_2111_00648] and matches lesions over time with a registration trust term [@Qahqaie_2026].

**Transport removing registration.** Kantorovich means average neuroimaging maps without smoothing [@Gramfort_2015]; OT and FUGW templates replace anatomical alignment [@Bazeille_2019; @Thual_2022] and make cross-subject decoding sample-efficient [@Thual_2025], with OT templates best among alignment methods [@Barbarant_2026]. FGW dictionaries are learned on individual brain geometries [@arxiv_2605_20883]. Transport morphometry and unbalanced OT features make subject-level analysis robust to misalignment [@Kundu_2018; @Gerber_2023]; Wasserstein-based single-subject networks classify ALS [@Tang_2026]; a learned cross-modal coupling removes registration between MRI sequences [@Gong_2026]; and a GW barycenter aligns cohorts for nodule malignancy prediction [@Yan_2026]. FUGW also integrates unpaired modalities with unequal mass [@Peng_2026].

**Lesion sets.** Multi-lesion oncology uses lesion radiomics with set encoders [@Karimzadeh_2026; @arxiv_2203_04964] or hand-built summaries [@Phan_2026]; hand-chosen lesion selection did not beat a simpler model [@Eertink_2022].

**Summary.** Transport methods both build on registration and replace it; on lesion sets, set encoders remain the only learned strategy.

### Cross-cutting synthesis

**Convergent findings.** Learned references recur in every strand: barycenters and dictionaries [@Schmitz_2018], trainable transport references [@arxiv_2006_12065], FGW templates [@arxiv_2205_15733], prototypes [@Song_2024; @Qian_2024] and functional templates [@Thual_2022; @Barbarant_2026]. Where transport replaces registration in neuroimaging, the reported effect is favourable [@Gerber_2023; @Thual_2025].

**Divergent findings and debates.** Template-based meshes beat template-free ones for Alzheimer's prediction [@Sarasua_2021], while correspondence-free curvature descriptors generalised better than shape models for aortic outcomes [@Nguyen_2026]. Templates built on the evaluation participants inflate accuracy [@Jeganathan_2024]. Attention aggregation is common but not Lipschitz [@arxiv_2505_24403].

**Dominant and underused methods.** Computational method papers dominate (section 2); controlled comparisons and external validation are rare [@Zare_2025; @Yan_2026; @Karimzadeh_2026].

### Gaps and research agenda

The gaps of section 6 set the agenda: (1) a supervised multilinear model whose spatial mode is coupled by transport to a learned template; (2) transport templates for patient-level lesion sets; (3) a comparison of registration, templates, couplings and permutation invariance on one task; (4) multi-centre validation with templates built on held-out subjects.

### Key takeaways and implications for practice

- Four strategies exist: a common space by registration, a learned template or barycenter, a transport coupling (W, GW, FGW, unbalanced), and permutation invariance.
- Transport templates are mature in ML and in functional neuroimaging; tensor models have not adopted them for an unaligned spatial mode.
- For practice, a template-based model should be validated on subjects not used to build the template [@Jeganathan_2024], and lesion-level inputs still rest on standardised segmentation and features [@Zwanenburg_2020; @Isensee_2020].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Ashburner_2000, Bookstein_2001, Davatzikos_2004, AVANTS_2008, Balakrishnan_2019, Chen_2025, Gillies_2016, Lambin_2017, Aerts_2014, Campanella_2019, Kolda_2009, Peyr__2019, Kolouri_2017, Bro_1996, Krishnan_2011 |
| Literature Review | Qibin_Zhao_2013, Zhou_2013, Lock_2018, Perros_2017, arxiv_2208_00993, arxiv_2006_12065, arxiv_2205_15733, arxiv_2102_06555, Zhang_2024, Song_2024, Gachon_2025, Thual_2022, Thual_2025, Gerber_2023, Kundu_2018, Gramfort_2015, Bazeille_2019, Gong_2026, Yan_2026, Karimzadeh_2026, arxiv_2203_04964, Guti_rrez_Becker_2018, Chen_2024, Zare_2025 |
| Methodology | arxiv_1306_0895, arxiv_1810_08278, arxiv_1310_4375, Benamou_2015, Schmitz_2018, Wang_2012, M_moli_2011, Peyre_2016, arxiv_1805_09114, arxiv_2009_04266, D_az_Mart_n_2026, Beier_2025, arxiv_1703_06114, arxiv_1810_00825, arxiv_1802_04712, arxiv_1411_2066, Kiers_1999, Roald_2022, Park_2025, Jeganathan_2024, Zwanenburg_2020, Isensee_2020 |
| Discussion | Sarasua_2021, Nguyen_2026, Barbarant_2026, Eertink_2022, Phan_2026, arxiv_2505_24403, arxiv_2411_10204, Afshar_2021, Liu_2026, Jia_2024, Menze_2015, arxiv_2610_22091, Qahqaie_2026 |

## 9. No entry written

None. Every one of the 104 entries in refs.bib printed CONFIRMED under `the lookup script resolve --entry`.

## 10. Search limitations and gate failures

- **Currency gate: not met.** Sources from the calendar years 2022 to 2026 (and 2027 for Li_2027) are 47 of 104 (45.2 percent), below 50 percent. The gate's prescribed search for the last 3 years and preprints was run once (the currency gate search) and raised the share from 33.8 percent counted the same way. Counting 2021 as within the last five years gives 53 of 104 (51.0 percent).
- **Condition 2 after the currency gate search.** That search added 27 sources (36.0 percent of the 75 before it), so the "added under 10 percent" condition held at the end of pass 3 but does not hold for the final set by the same measure. No further pass was run after the gate search.
- **Databases not reached.** Google Scholar: answers automated requests with a bot check. IEEE Xplore, ACM Digital Library and Scopus: reachable only by web search; `site:` queries returned no page of those sites, and allowed-domain queries returned ieeexplore pages only. Databases of other discipline rows (education, humanities) are not applicable.
- **Semantic Scholar rate limits.** Several calls printed "Semantic Scholar: left out, HTTP 429 after 3 retries" (searches s4_q1, s4_q3, s4_q7, s4_q8; cited-by of Menze_2015). Entries whose final `bibtex` call printed this note, published version not checked through Semantic Scholar: arxiv_1306_0895 (on the `--page` call), Guti_rrez_Becker_2018, arxiv_2111_00648 (on the `--page` call).
- **arxiv_2006_09430 (WEGL).** `bibtex` printed "published in International Conference on Learning Representations (conference) per Semantic Scholar". Page tried: https://iclr.cc/virtual/2021/poster/3182, refused with "page https://iclr.cc/virtual/2021/poster/3182: no citation_title tag". The @misc entry stays; ICLR, published version not confirmed.
- **arxiv_2505_24403.** The ICLR page https://iclr.cc/virtual/2026/poster/10007061 was refused ("no citation_title tag"); the entry was built from https://mlanthology.org/iclr/2026/nikolentzos2026iclr-lipschitz/.
- **Entries built from an index record.** Peyre_2016 (from the OpenAlex and Semantic Scholar records) and Thual_2025 (from the Semantic Scholar record, whose author list ends "and others", so the entry's author field does too).
- **Unusual entries as `bibtex` printed them.** The Naji et al. entry is the Zenodo deposit of arXiv 2609.27880 with the key `https://doi.org/10.5281/zenodo.22212575`; Li_2027 carries Crossref's year 2027 where OpenAlex and Semantic Scholar give 2025. The key of the second Peng 2026 entry was given the suffix `a` (Peng_2026a) so that no two entries share a key.
- **Non-ASCII in refs.bib.** The doi.org entries keep their en dashes in page ranges, curly quotes and accented names, since refs.bib holds each entry as the script printed it; this differs from the ASCII rule that applies to the files this run authors.
- **Predatory-venue screen.** No venue list was checked; Frontiers in Oncology (Gong_2026), BME Frontiers (Liu_2026) and Algorithms (Vayer_2020) were not checked against any list.

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (not known (user's answer)). The AI took part in research assistance. A person oversaw the process, and the authors take responsibility for the content.

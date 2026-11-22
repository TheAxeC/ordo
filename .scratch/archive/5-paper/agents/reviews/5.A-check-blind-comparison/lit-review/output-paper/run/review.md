# Literature review: supervised prediction from data with an unaligned spatial mode

Research question: which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

## 1. Search strategy

### Indexes, profile and criteria

- Indexes: Crossref, OpenAlex, Semantic Scholar and arXiv, each asked by every `the lookup script search`, `refs`, `cited-by` and `resolve` call.
- Indexes left out or silent: Semantic Scholar printed "not found" for most Boolean strings and for the research-question sentence, and was left out with "HTTP 429 after 3 retries" on several `refs`, `cited-by` and `fetch` calls (for example the `refs` call on 10.3390/a13090212 and the fetches of 10.1080/01621459.2013.776499 and 10.1561/2200000073). arXiv printed "not found" for the sentence-form queries and answered no Crossref-only DOI.
- No seed `.bib` and no reference list were given, so no screened-`.bib` block applies.
- Domain evidence profile: `cs_ml`. It matches the Discipline row (machine learning, with medical image analysis as the application setting). Archival preprints and conference proceedings are admitted and tagged by evidence type.
- Criteria: peer-reviewed journals, conference proceedings and, under `cs_ml`, archival preprints; English; the last 10 years by default, with seminal works (more than 100 citing works in the `cited-by` listing) admitted outside the range; relevance to at least one aspect of the research question; no fatal design flaw; not predatory.
- Paper type: Literature Review (minimum 30 sources, typical range 40 to 80).

### Search design

Primary concepts: (A) supervised prediction or regression; (B) data whose spatial mode is unaligned across subjects (point clouds, sets, irregular tensors, graphs of regions); (C) the correspondence mechanism (registration, template or barycenter, transport coupling, permutation invariance); (D) the medical-imaging pipeline (registration, lesion segmentation, radiomics).

Secondary terms used: tensor partial least squares, multilinear PLS, higher-order PLS, tensor regression, PARAFAC2, irregular tensor, entropic regularization, Sinkhorn, Gromov-Wasserstein, fused Gromov-Wasserstein, Wasserstein barycenter, dictionary learning, template, prototype, linear optimal transport, Wasserstein embedding, Deep Sets, Set Transformer, PointNet, attention-based multiple instance learning, deformable or diffeomorphic registration, radiomics, IBSI, nnU-Net, lesion segmentation.

`the lookup script search` has no filters, so year range, publication type and language were applied at screening. Crossref and OpenAlex returned their 100-record ceiling for nearly every string, including the narrower strings of passes 2 and 3, because both rank by relevance without Boolean filtering. The narrower strings and the title lookups of named primary works were the tightening step.

### Search strings, all run on 2026-11-16

Counts are records per index as `search` printed them (C Crossref, O OpenAlex, S Semantic Scholar, a arXiv), then the number of distinct records.

| # | Pass, layer | Search string | Records |
|---|---|---|---|
| 1 | 1, L1 | `("tensor partial least squares" OR "multilinear PLS" OR "higher-order PLS") AND ("regression" OR "prediction")` | C 100, O 99, a 1, S not found; 200 |
| 2 | 1, L1 | `("tensor regression" OR "low-rank tensor regression") AND ("imaging" OR "neuroimaging")` | C 100, O 99, S 18, a 40; 226 |
| 3 | 1, L1 | `("PARAFAC2" OR "irregular tensor" OR "unaligned mode") AND ("decomposition" OR "factorization")` | C 100, O 100, a 32; 204 |
| 4 | 1, L1 | `("entropic regularization" OR "Sinkhorn") AND ("optimal transport")` | C 100, O 100, S 99, a 100; 304 |
| 5 | 1, L1 | `("Gromov-Wasserstein") AND ("graph" OR "shape" OR "metric measure")` | C 100, O 100, a 100; 227 |
| 6 | 1, L1 | `("fused Gromov-Wasserstein") AND ("graph" OR "structured data")` | C 100, O 100, S 28, a 34; 198 |
| 7 | 1, L1 | `("Gromov-Wasserstein barycenter" OR "Gromov-Wasserstein dictionary" OR "Wasserstein barycenter") AND ("template" OR "dictionary")` | C 100, O 100, a 18; 200 |
| 8 | 1, L1 | `("optimal transport" OR "Wasserstein") AND ("medical imaging" OR "MRI" OR "lesion") AND ("registration-free" OR "without registration" OR "fusion")` | C 100, O 100, a 4; 200 |
| 9 | 1, L1 | `("optimal transport") AND ("multiple sclerosis lesions" OR "brain lesions" OR "point cloud") AND ("prediction" OR "classification")` | C 100, O 100, a 32; 222 |
| 10 | 1, L1 | `("Deep Sets" OR "Set Transformer" OR "PointNet") AND ("permutation invariant" OR "point cloud" OR "sets")` | C 100, O 100, a 100; 280 |
| 11 | 1, L1 | `("attention-based" OR "attention") AND ("multiple instance learning") AND ("medical" OR "histopathology" OR "deep")` | C 100, O 100, a 100; 265 |
| 12 | 1, L1 | `("deformable image registration" OR "diffeomorphic registration") AND ("brain MRI" OR "medical image") AND ("learning" OR "symmetric normalization")` | C 100, O 100, a 94; 269 |
| 13 | 1, L1 | `("radiomics") AND ("quantitative imaging features" OR "image biomarker standardisation" OR "pyradiomics")` | C 100, O 100, S 5, a 42; 245 |
| 14 | 1, L1 | `("lesion segmentation" OR "medical image segmentation") AND ("U-Net" OR "nnU-Net" OR "self-configuring")` | C 100, O 100, a 100; 283 |
| 15 | 1, L4 | The research question as a sentence (first clause and the correspondence clause) | C 100, O 88, S and a not found; 188 |
| 16 | 1, L4 | `registration-free prediction from brain MRI using optimal transport` | C 100, O 100, S 90; 287 |
| 17 | 1, L4 | `point cloud deep learning for brain shape classification` | C 100, O 100, S 98; 286 |
| 18 | 1, L4 | `graph neural network on lesions for multiple sclerosis disability prediction` | C 100, O 100; 200 |
| 19 | 2, L1 | `("optimal transport embedding" OR "sliced-Wasserstein embedding" OR "Wasserstein embedding") AND ("pooling" OR "sets" OR "feature aggregation")` | C 100, O 100, a 8; 197 |
| 20 | 2, L1 | `("linear optimal transport") AND ("images" OR "point clouds" OR "template")` | C 95, O 100, a 11; 197 |
| 21 | 2, L1 | `("graph dictionary learning" OR "template-based") AND ("Gromov-Wasserstein")` | C 100, O 93, S 1, a 3; 189 |
| 22 | 2, L4 | `learnable template optimal transport embedding for prediction from medical images without registration` | C 100, O 100, S 1; 201 |
| 23 | 3, L1 | `("supervised" OR "regression" OR "prediction") AND ("PARAFAC2" OR "irregular tensor") AND ("imaging" OR "spatial")` | C 100, O 100; 198 |
| 24 | 3, L1 | `("optimal transport" OR "Gromov-Wasserstein") AND ("lesions" OR "tumor" OR "brain") AND ("outcome prediction" OR "classification") AND ("template" OR "prototype")` | C 100, O 100, a 2; 198 |
| 25 | 3, L4 | `prediction of a patient outcome from a variable-size set of regions or lesions using optimal transport to learned prototypes` | C 100, O 100; 200 |
| 26 | Currency gate | `("Gromov-Wasserstein" OR "optimal transport") AND ("neuroimaging" OR "cortical" OR "fMRI") AND ("individual" OR "inter-subject")` | C 100, O 100, a 9; 203 |
| 27 | Currency gate | `("multiple instance learning" OR "set transformer" OR "point cloud") AND ("MRI" OR "CT") AND ("lesions" OR "nodules" OR "metastases")` | C 100, O 100, a 6; 198 |

Title lookups with `the lookup script resolve '<title>'` were run for named primary works in pass 2, for the re-screen of recent records in pass 2, in pass 3 and at the currency gate. The number of title lookups per pass was not tallied.

### Citation chaining and forward tracking

| Pass | Layer | Input | Records |
|---|---|---|---|
| 1 | L2 `refs` | Zhou_2013 (76), Qibin_Zhao_2013 (50), Vayer_2020 (63), Xu_2020 (34), M_moli_2011 (98), Charles_2017 (37), arxiv_1802_04712 (36), Isensee_2020 (62) | 456 |
| 1 | L3 `cited-by` | arxiv_1805_09114 (199, first 100 per index, more exist), arxiv_2102_06555 (69), Thual_2022 by its arXiv DOI (73), Zhou_2013 (200, first 100 per index, more exist), arxiv_1802_04712 (100, first 100 from OpenAlex, more exist) | 641 |
| 2 | L2 `refs` | Thual_2022 (58), Vincent_Cuaz_2022 (79), arxiv_2006_12065 (54), Gramfort_2015 (27), arxiv_2102_06555 (100), arxiv_2605_20883 (28), arxiv_2202_03813 (84), Prabhakar_2023 (23) | 453 |
| 2 | L3 `cited-by` | Gramfort_2015 (100), Vincent_Cuaz_2022 by its arXiv DOI (43) | 143 |
| 3 | L2 `refs` | Kwon_2025 (81), arxiv_2602_07260 (1), arxiv_1906_01277 (64), arxiv_1905_07645 (68) | 214 |
| 3 | L3 `cited-by` | Kiers_1999 (195), arxiv_2006_12065 (42) | 237 |

Must-include marks (a work in the references of 3 or more core papers of the same pass): pass 1 found only "Adam: a method for stochastic optimization" in 3 core reference lists, excluded as off-topic. Pass 2 found ten works: Gromov-Wasserstein averaging (5 lists), the fused Gromov-Wasserstein theory paper (5), Wasserstein Weisfeiler-Lehman graph kernels (3), Sinkhorn distances (3), scalable Gromov-Wasserstein learning (3), optimal transport for structured data (3), online graph dictionary learning (3), Memoli's Gromov-Wasserstein paper (3), fast computation of Wasserstein barycenters (3) and Computational Optimal Transport (3). Eight were already collected and two were added (arxiv_1906_01277, arxiv_1905_07645). Pass 3 found no work in 3 or more of its core lists.

Forward tracking: every foundational work tracked had citing works dated 2024 to 2026, so none is marked "possibly outdated".

Thual_2022 and arxiv_2102_06555 entered pass 1 as forward-tracking inputs, named from the topic's strands (fused unbalanced Gromov-Wasserstein alignment of brains, Gromov-Wasserstein dictionaries). Both were then confirmed by `resolve` and screened like every other candidate.

### Passes and the sources each added

- Pass 1 (35 sources): Bro_1996, Qibin_Zhao_2013, Zhou_2013, Zhang_2017, Kolda_2009, Perros_2017, arxiv_2208_00993, arxiv_1306_0895, Benamou_2015, arxiv_1810_08278, M_moli_2011, Peyre_2016, arxiv_1805_09114, Vayer_2020, Xu_2020, Schmitz_2018, Ackaouy_2020, arxiv_1703_06114, Charles_2017, arxiv_1810_00825, arxiv_1802_04712, Isensee_2020, Gillies_2016, arxiv_2202_03813, Vincent_Cuaz_2022 (layer 1); Peyr__2019, Solomon_2016, Agueh_2011, arxiv_1310_4375 (layer 2); Thual_2022, arxiv_2102_06555, arxiv_2605_20883 (layer 3); Guti_rrez_Becker_2021, Prabhakar_2023, Kolouri_2017 (layer 4). Conditions after pass 1: 1 (35 of 30) and 3 held. Condition 2 does not apply to a first pass, so another pass ran.
- Pass 2 (25 sources, 71 percent of the 35 existing): Kiers_1999, Gramfort_2015, arxiv_1411_2066, Wang_2012, arxiv_2006_12065, arxiv_2006_09430, Moosm_ller_2022, arxiv_1706_02413, Lu_2021, Balakrishnan_2019, Ronneberger_2015, Aerts_2014, van_Griethuysen_2017, Zwanenburg_2020, AVANTS_2008 (layer 1 strings and title lookups); arxiv_1906_01277, arxiv_1905_07645 (layer 2, must include); arxiv_2602_07260, Kwon_2025 (layers 3 and 4); arxiv_2401_01460, Lo_2025, Barbarant_2026, Castro_Mac_as_2026, Schenker_2025, arxiv_2502_09934 (re-screen of the 2024 to 2026 records that passes 1 and 2 listed). Condition 2 failed, so pass 3 ran.
- Pass 3 (4 sources, 6.7 percent of the 60 existing): Qian_2024, M_rup_2025, Konyar_2025 (layers 1 and 3), Song_2024 (layer 3).
- Currency-gate action after the search ended (2 sources): Mazelet_2025, arxiv_2604_26807.

### Conditions when the search ended

The search ended after pass 3, when conditions 1, 2, 3, 4 and 5 held:

1. Source count: 64 sources at the end of pass 3, against a minimum of 30.
2. Little new: pass 3 added 4 of 60, under 10 percent.
3. Theme saturation: every theme of the matrix has at least 3 sources (section 5).
4. Citation loop: pass 3 chaining found no work cited by 3 or more of its core papers that was not yet collected. Read literally ("no cited work not yet collected"), the condition never holds, since every reference list holds works outside a review. The search ends on conditions 1, 2, 3 and 5 under either reading.
5. Temporal span: foundational works from 1996 to 2013 and 13 sources from 2024 to 2026 (15 in the final set).

## 2. Distribution advisory

```
Distribution advisory:
- Dimension: method
- Concentration: computational (new algorithms, models or distances) = 56/66 (85 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: add clinical validation studies of registration-free predictors, for example "external validation" AND ("multiple instance learning" OR "point cloud" OR "optimal transport") AND ("MRI" OR "CT").
```

The other ten sources are five reviews or tutorials (Kolda_2009, Peyr__2019, Kolouri_2017, Gillies_2016, M_rup_2025), three tool or standardization papers (van_Griethuysen_2017, Zwanenburg_2020, arxiv_2602_07260), one clinical radiomics study (Aerts_2014) and one benchmark (arxiv_2604_26807). Time is not concentrated: 2 sources from the 1990s, 2 from the 2000s, 31 from the 2010s and 31 from the 2020s. Venue is not concentrated. Geography is left out, since most method papers state no study site.

## 3. Screening results

- Initial hits: 6,383 records from the 27 search strings (counts per string above, not deduplicated across strings), 1,123 reference records from 20 `refs` calls and 1,021 citing records from 9 `cited-by` calls.
- After title and abstract screening: 69 candidates were sent to `the lookup script fetch` into the run's temporary folder. All other records were excluded on their title. No tally per record was kept for that stage.
- After full-text assessment: 66 included, 3 excluded.
- Full texts read: 40 included sources. Abstract only (the `.abstract.txt` case): 24 included sources. Not read: 2 included and 3 excluded, listed below.

Candidates whose first fetch wrote no file, and the lookups tried:

| Candidate | First fetch input | Lookups tried | Second fetch | Outcome |
|---|---|---|---|---|
| Vincent-Cuaz et al. 2022, template-based GNN | 10.52202/068431-0857: "no full text and no abstract" | `resolve` on the DOI and on arXiv 2205.15733 | 2205.15733: https://arxiv.org/html/2205.15733, HTTP 200, full text | Included, read |
| Lu et al. 2021, CLAM | 10.1038/s41551-020-00682-w: "no full text and no abstract" | `resolve` on the DOI (Semantic Scholar printed arXiv 2004.09666) | 2004.09666: https://arxiv.org/html/2004.09666, HTTP 200, full text | Included, read |
| Gutierrez-Becker et al. 2021 | 10.1016/j.media.2020.101852: "no full text and no abstract" | `resolve` on the DOI and on arXiv 2010.00820 | 2010.00820: https://arxiv.org/html/2010.00820, HTTP 200, full text | Included, read |
| Peyre, Cuturi, Solomon 2016 | Semantic Scholar 4658ae98be04425f7967307401cbcb74c354ab65: "no full text and no abstract" | `resolve` on that ID (all four indexes "not found" or no record), `resolve` on the title | OpenAlex W2417433140: https://hal.science/hal-01322992, HTTP 200, not a PDF, abstract written | Included, abstract read |
| Memoli 2011 | 10.1007/s10208-011-9093-5: "no full text and no abstract" | `resolve` on the DOI, `resolve` on the title; no arXiv ID exists | OpenAlex W2027842533: "no full text and no abstract" | Included as seminal (200 citing records, more exist), "abstract not read" |
| Avants et al. 2008 | 10.1016/j.media.2007.06.004: "no full text and no abstract" | `resolve` on the DOI; no arXiv ID exists | OpenAlex W1970928383: https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/, HTTP 200, not a PDF, no abstract | Included as seminal (200 citing records, more exist), "abstract not read" |
| Naderializadeh et al. 2021, pooling by sliced-Wasserstein embedding | Semantic Scholar 81aa417675aeb17790072f783c1179533f667c56: "no full text and no abstract" | `resolve` on that ID (Semantic Scholar "HTTP 429 after 3 retries"), `resolve` on the title; no DOI or arXiv ID printed | OpenAlex W3212862161: "no full text and no abstract" | Excluded: unread, 12 citing records, not marked must include and not seminal |
| Zhao et al. 2026, spinal cord surgery outcomes from point-cloud features and radiomics | 10.1016/j.inffus.2026.104509: "no full text and no abstract" | `resolve` on the title and on the DOI; no arXiv ID | none | Excluded: unread, not must include, not seminal |
| Hu et al. 2026, BoneFusion | 10.1016/j.inffus.2026.104560: "no full text and no abstract" | `resolve` on the title and on the DOI; no arXiv ID | none | Excluded: unread, not must include, not seminal |

Nine included sources were read under an identifier other than their DOI: for arXiv-only works and for proceedings whose DOI is arXiv's own DataCite DOI (10.48550), the input and key were the arXiv ID (for example 1306.0895 and 1906.01277, whose printed DOI 10.3929/ethz-b-000420933 is a repository DOI).

## 4. Annotated bibliography

### A. Multilinear regression and tensor decompositions with an unaligned mode

### Bro (1996). Multiway calibration. Multilinear PLS.
- **Type**: Journal article (Journal of Chemometrics)
- **Method**: N-way partial least squares (N-PLS), a trilinear extension of PLS fitted by eigenvalue problems; compared with unfold-PLS on sugar fluorescence data and a simulation.
- **Key results**: Tri-PLS stabilizes the decomposition and gives more interpretable solutions than unfold-PLS. On noisy simulated excitation-emission data, unfold-PLS predictions were "almost twice as bad" as tri-PLS with 125 calibration samples.
- **Relevance**: The origin of multilinear PLS. Correspondence: every mode is assumed aligned across samples (the same excitation and emission wavelengths). Pipeline: none from imaging.
- **Quality**: High (seminal; chemometrics evaluation on one application).
- **Stance**: Neutral.
- **Potential use**: Literature Review (multilinear PLS), Methodology (baseline family).

### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Type**: Journal article (IEEE TPAMI)
- **Method**: Tensor-to-tensor regression through a sum of orthogonal Tucker terms, with loadings from a higher-order SVD of a generalized cross-covariance tensor; tested on synthetic data and ECoG decoding of 3D movement trajectories.
- **Key results**: HOPLS predicted better than existing methods, coped with small samples and was robust to noise.
- **Relevance**: The main tensor-PLS generalization. Correspondence: aligned modes (channels, frequencies, time). Pipeline: none from imaging.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Literature Review, Methodology.

### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Type**: Journal article (Journal of the American Statistical Association)
- **Method**: Generalized linear models with a low-rank (CP) tensor coefficient for tensor covariates, fitted by maximum likelihood with asymptotic theory.
- **Key results**: The low-rank structure reduces ultrahigh dimensionality to a manageable level and gives efficient estimation and prediction on synthetic and real MRI data.
- **Relevance**: The reference scalar-on-image tensor regression. Correspondence: the abstract treats each image as a fixed array, so voxel positions are taken as comparable across subjects. Pipeline: [GAP: preprocessing of the MRI data, abstract only].
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Literature Review.

### Zhang and Li (2017). Tensor Envelope Partial Least-Squares Regression.
- **Type**: Journal article (Technometrics)
- **Method**: A tensor PLS algorithm with a population model linked to sufficient dimension reduction; simulations and two neuroimaging analyses.
- **Key results**: The population interpretation explains how PLS reduces dimension and yields asymptotic consistency of the estimator.
- **Relevance**: Gives tensor PLS a statistical model. Correspondence: aligned tensor modes. Pipeline: [GAP: imaging preprocessing, abstract only].
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Type**: Journal article, review (SIAM Review)
- **Method**: Survey of CP, Tucker and related decompositions, including PARAFAC2, and software.
- **Key results**: CP and Tucker are higher-order extensions of the SVD and PCA. The survey lists PARAFAC2, INDSCAL, DEDICOM and PARATUCK2 among further models.
- **Relevance**: Reference for the decomposition vocabulary of the review. Correspondence: names PARAFAC2 as the model family for a mode that varies across slices.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Literature Review.

### Kiers, ten Berge and Bro (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Type**: Journal article (Journal of Chemometrics)
- **Method**: A direct fitting algorithm for PARAFAC2 on a set of matrices with shared column units and different numbers of row units.
- **Key results**: PARAFAC2 applies when "each data matrix has the same column units but different (numbers of) row units", and gives unique solutions under mild assumptions. The direct algorithm is more efficient than indirect fitting and handles constraints and missing data.
- **Relevance**: The defining model for a decomposition with one unaligned mode. Correspondence: the unaligned mode is absorbed by slice-specific factor matrices constrained to a shared cross-product.
- **Quality**: High (seminal; 195 citing records).
- **Stance**: Supports (an unaligned mode can be modeled without alignment).
- **Potential use**: Literature Review, Methodology.

### Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large and Sparse Data.
- **Type**: Conference paper (ACM KDD)
- **Method**: A scalable reformulation of PARAFAC2 for large sparse data, applied to temporal phenotyping of pediatric patients.
- **Key results**: 22-fold speed gains over the best previous implementation, and phenotypes endorsed by clinical experts.
- **Relevance**: States the unaligned-subject problem plainly: patients' records "do not align naturally" over time. Correspondence: PARAFAC2 slices. Pipeline: electronic health records, not imaging.
- **Quality**: Medium (unsupervised, one clinical cohort).
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Ren et al. (2022). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: PARAFAC2 factorization supervised by static and dynamic prediction tasks in a multi-task framework.
- **Key results**: On two temporal EHR datasets, supervision gave better tensor fit, more meaningful subgroups and stronger prediction than state-of-the-art methods.
- **Relevance**: The closest supervised analogue of a tensor model with an unaligned mode. Correspondence: the unaligned mode is temporal (record length), not spatial.
- **Quality**: Medium (preprint; EHR only).
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Konyar and Gahrooei (2025). Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records.
- **Type**: Journal article (IEEE JBHI)
- **Method**: PARAFAC2 with label information for a subset of patients; synthetic data and a MIMIC-IV case study.
- **Key results**: The semi-supervised model outperformed the benchmarks. The authors state that methods integrating label information in irregular-tensor decomposition "are lacking".
- **Relevance**: Confirms that supervised irregular-tensor models are recent and confined to EHR time modes.
- **Quality**: Medium.
- **Stance**: Supports.
- **Potential use**: Literature Review, gaps.

### Schenker et al. (2025). PARAFAC2-Based Coupled Matrix and Tensor Factorizations With Constraints.
- **Type**: Journal article (IEEE Journal of Selected Topics in Signal Processing)
- **Method**: An AO-ADMM framework for PARAFAC2-based coupled matrix and tensor factorizations with constraints on all modes and linear couplings.
- **Key results**: PARAFAC2 models "can handle irregular/ragged tensors" with "unaligned or irregular time profiles". The framework adds regularization and coupling options and improves accuracy on simulated and real data.
- **Relevance**: Current state of constrained PARAFAC2 fusion. Correspondence: unaligned time profiles.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Morup, Acar and Adali (2025). Tensor and Coupled Decompositions: Interpretable pattern discovery in multiset and multimodal functional neuroimaging data.
- **Type**: Journal article, review (IEEE Signal Processing Magazine)
- **Method**: Survey of hard and soft coupling models for multiset and multimodal functional neuroimaging.
- **Key results**: Functional neuroimaging data "exhibit high degrees of variability across individuals". The survey stresses model uniqueness as a prerequisite for reproducible pattern discovery.
- **Relevance**: Places inter-subject variability inside the tensor-decomposition literature. Correspondence: hard versus soft coupling across subjects.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Literature Review.

### B. Entropic optimal transport, barycenters and linear embeddings

### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances.
- **Type**: Conference paper (record: Neural Information Processing Systems); entry from arXiv
- **Method**: Entropic regularization of the transport problem, solved by Sinkhorn-Knopp matrix scaling.
- **Key results**: The regularized optimum is a distance computed "several orders of magnitude faster" than transportation solvers, with better MNIST performance than classical transport distances.
- **Relevance**: The computational basis of every differentiable coupling in the review. Correspondence: a soft coupling between two histograms.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Peyre and Cuturi (2019). Computational Optimal Transport.
- **Type**: Monograph (Foundations and Trends in Machine Learning)
- **Method**: Review of optimal transport with a bias toward numerical methods.
- **Key results**: Covers barycenters, entropic solvers and generalizations, and their links to statistics, kernels and information theory.
- **Relevance**: General reference for the transport strand.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Methodology.

### Benamou et al. (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Type**: Journal article (SIAM Journal on Scientific Computing)
- **Method**: Entropic regularization recast as Kullback-Leibler Bregman projections onto split constraint sets.
- **Key results**: Closed-form projections solve barycenters, multi-marginal transport, partial and unbalanced transport, and capacity-constrained transport.
- **Relevance**: The solver behind entropic barycenters used as templates. Correspondence: barycenter as a common reference without registration.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Feydy et al. (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Type**: Conference paper (record: AISTATS); entry from arXiv
- **Method**: Theory of Sinkhorn divergences between MMD and transport.
- **Key results**: Proves positivity, convexity and metrization of convergence in law for Sinkhorn divergences.
- **Relevance**: The debiased loss used when a transport cost is a training objective.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Type**: Journal article (SIAM Journal on Mathematical Analysis)
- **Method**: Existence, uniqueness and characterization of Wasserstein barycenters of several measures.
- **Key results**: Relates the barycenter to multi-marginal transport and solves the Gaussian case.
- **Relevance**: Defines the barycenter used as a population template.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Type**: Conference paper (record: International Conference on Machine Learning); entry from arXiv
- **Method**: Subgradient algorithms for barycenters of empirical measures, smoothed by an entropic term.
- **Key results**: Smoothing gives a strictly convex objective with cheap gradients by matrix scaling. Used to visualize image families and for constrained clustering.
- **Relevance**: Practical barycenter templates.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Schmitz et al. (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Type**: Journal article (SIAM Journal on Imaging Sciences)
- **Method**: Histograms reconstructed as Wasserstein barycenters of learned atoms, with gradients by automatic differentiation through Sinkhorn iterations.
- **Key results**: Atoms and weights are learned jointly and allow nonlinear relations between atoms and data.
- **Relevance**: The first learnable-template model in the transport strand. Correspondence: atoms as learned templates on a shared support.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Wang et al. (2012). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Type**: Journal article (International Journal of Computer Vision)
- **Method**: Linear optimal transportation (LOT), a linearized Wasserstein distance with an isometric linear embedding.
- **Key results**: LOT computes all pairwise distances efficiently and discriminates chromatin patterns, facial expressions, galaxy morphologies and protein distributions.
- **Relevance**: Images treated as mass distributions compared through a reference. Correspondence: transport to a fixed reference.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Moosmuller and Cloninger (2022). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Type**: Journal article (Information and Inference)
- **Method**: Theory of the LOT embedding to a fixed reference.
- **Key results**: LOT makes families of shifted and scaled distributions linearly separable, and its L2 distance is nearly isometric to Wasserstein-2 under stated conditions. Only N transport maps are needed for N squared distances.
- **Relevance**: Guarantees for reference-based embeddings of unaligned measures.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Methodology.

### Mahan, Moosmuller and Cloninger (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: LOT embedding of point clouds with input convex neural networks and a permutation-invariant weighted classifier.
- **Key results**: Transport maps from a shared reference approximate Wasserstein-2 distances. The method outperformed a standard deep set approach on a flow cytometry dataset with few labeled point clouds.
- **Relevance**: Combines a reference template with permutation invariance for subject-level classification of point clouds.
- **Quality**: Medium (preprint; one dataset).
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Kolouri et al. (2017). Optimal Mass Transport: Signal processing and machine-learning applications.
- **Type**: Journal article, tutorial (IEEE Signal Processing Magazine)
- **Method**: Overview of transport mathematics, numerics and applications.
- **Key results**: Covers retrieval, cancer detection, super-resolution and statistical learning, with software.
- **Relevance**: Background on transport-based signal and image analysis.
- **Quality**: Medium (tutorial).
- **Stance**: Neutral.
- **Potential use**: Introduction.

### C. Gromov-Wasserstein, fused Gromov-Wasserstein, templates and dictionaries

### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Type**: Journal article (Foundations of Computational Mathematics)
- **Method**: [GAP: method] (abstract not read).
- **Key results**: [GAP: key results] (abstract not read).
- **Relevance**: Record title only: the Gromov-Wasserstein distance as a metric approach to matching objects. Seminal: 200 citing records listed, more exist. Lookups tried: `fetch` on 10.1007/s10208-011-9093-5 and OpenAlex W2027842533 ("no full text and no abstract"); `resolve` on the DOI and the title.
- **Quality**: High by record and citation count; abstract not read.
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Type**: Conference paper (record: International Conference on Machine Learning)
- **Method**: A Frechet mean of distance or kernel matrices under entropic Gromov-Wasserstein, solved iteratively.
- **Key results**: The input matrices "are not required to have the same size or to be in row-by-row correspondence". Applied to shape barycenters and to predicting energy levels of molecules.
- **Relevance**: The GW barycenter as a template for objects without correspondence, used for a regression target.
- **Quality**: High (5 core reference lists in pass 2).
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology.

### Vayer et al. (2019). Optimal Transport for structured data with application on graphs.
- **Type**: Archival preprint (arXiv; record: HAL); evidence type preprint
- **Method**: The fused Gromov-Wasserstein (FGW) distance on features and structure.
- **Key results**: FGW outperformed graph kernels and graph convolutional networks on graph classification, and gives Frechet means of graphs.
- **Relevance**: Defines FGW, the distance that couples feature and geometry without node correspondence.
- **Quality**: High (3 core reference lists).
- **Stance**: Supports.
- **Potential use**: Methodology.

### Vayer et al. (2020). Fused Gromov-Wasserstein Distance for Structured Objects.
- **Type**: Journal article (Algorithms)
- **Method**: Theory of FGW, extending the Wasserstein and Gromov-Wasserstein distances.
- **Key results**: The Kantorovich formulation compares features independently, Gromov-Wasserstein compares relations and discards features, and FGW encodes both.
- **Relevance**: Theoretical reference for FGW.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Solomon et al. (2016). Entropic Metric Alignment for Correspondence Problems.
- **Type**: Journal article (ACM Transactions on Graphics)
- **Method**: Probabilistic correspondence by an entropy-regularized Gromov-Wasserstein objective.
- **Key results**: The algorithm is provably convergent, applies to any metric-measure domain and extends to partial matching, symmetry detection and joint analysis of several domains.
- **Relevance**: A soft correspondence computed instead of registered.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Methodology.

### Xu (2020). Gromov-Wasserstein Factorization Models for Graph Clustering.
- **Type**: Conference paper (AAAI)
- **Method**: Graphs estimated as GW barycenters of learned atoms, learned by unrolled solvers.
- **Key results**: "Both the observed graphs and the learnable atoms can be unaligned and with different sizes". Results on graph clustering were encouraging.
- **Relevance**: Learnable GW templates for unaligned graphs.
- **Quality**: Medium (unsupervised clustering only).
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Xu, Luo and Carin (2019). Scalable Gromov-Wasserstein Learning for Graph Partitioning and Matching.
- **Type**: Conference paper (record: Neural Information Processing Systems); entry from arXiv
- **Method**: Scalable GW learning for large-graph partitioning and matching.
- **Key results**: The GW transport between two graphs "provides the correspondence between their nodes and achieves graph matching".
- **Relevance**: The coupling itself as the correspondence. Must include (3 core lists).
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Methodology.

### Vincent-Cuaz et al. (2021). Online Graph Dictionary Learning.
- **Type**: Conference paper (record: International Conference on Machine Learning); entry from arXiv
- **Method**: Graph dictionary learning with a Gromov-Wasserstein data-fitting term and an online stochastic algorithm.
- **Key results**: Graphs are convex combinations of atoms learned on "a dataset of unregistered graphs with potentially different number of nodes", with an upper bound that approximates GW in the embedding space.
- **Relevance**: Learned templates for unregistered graphs.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology.

### Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Type**: Conference paper (NeurIPS 35)
- **Method**: A layer of FGW distances to learnable template graphs, fed to a nonlinear classifier, with templates learned end to end.
- **Key results**: The method was competitive with or better than kernel and GNN baselines on synthetic and real graph classification.
- **Relevance**: The supervised learnable-template transport model closest to the research question. Correspondence: a soft FGW matching to each template.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology, Discussion.

### Brogat-Motte et al. (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Type**: Conference paper (record: International Conference on Machine Learning); entry from arXiv
- **Method**: Regression with an FGW loss through an FGW barycenter whose weights depend on the input; kernel and neural versions.
- **Key results**: Consistency and excess-risk bounds for the kernel estimator; good performance on a metabolic identification problem.
- **Relevance**: Transport barycenters with learned templates in a supervised model.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Qian et al. (2024). Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem.
- **Type**: Conference paper (ACM KDD)
- **Method**: Prototype-based graph classification with FGW similarity and a neural FGW approximator.
- **Key results**: An O(1/N) generalization bound and competitive results on graph benchmarks.
- **Relevance**: Class prototypes as learned templates under FGW.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Bai et al. (2025). Fused Partial Gromov-Wasserstein for Structured Objects.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: FGW with a relaxed mass constraint (FPGW), with Frank-Wolfe and Sinkhorn solvers.
- **Key results**: Metric properties of FPGW and robust performance on graph matching, classification and clustering.
- **Relevance**: Handles subjects whose sets carry different total mass.
- **Quality**: Medium.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Togninalli et al. (2019). Wasserstein Weisfeiler-Lehman Graph Kernels.
- **Type**: Conference paper (record: Neural Information Processing Systems); entry from arXiv
- **Method**: A graph kernel based on the Wasserstein distance between node-feature distributions.
- **Key results**: Comparing distributions of node features finds subtler differences than sum or mean aggregation of substructures.
- **Relevance**: A transport alternative to pooling for sets of node features. Must include (3 core lists).
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### D. Permutation-invariant set encoders and multiple instance learning

### Zaheer et al. (2017). Deep Sets.
- **Type**: Conference paper (record: neural information processing systems); entry from arXiv
- **Method**: Characterization of permutation-invariant functions and a sum-decomposition architecture.
- **Key results**: Any permutation-invariant objective belongs to a family with a special structure; applied to population statistics, point cloud classification, set expansion and outlier detection.
- **Relevance**: The defining treatment of permutation invariance.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology.

### Qi et al. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper (CVPR)
- **Method**: A network that consumes point clouds directly with a symmetric aggregation.
- **Key results**: Respects permutation invariance and is robust to input perturbation, with strong performance in classification and segmentation.
- **Relevance**: Point clouds without voxel grids. Crossref holds the authors as "Charles, R. Qi" and "Kaichun, Mo". The entry Charles_2017 gives the authors as Qi, Charles R., Su, Hao, Mo, Kaichun and Guibas, Leonidas J., and `resolve --entry` confirms it against Crossref.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Qi et al. (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Type**: Conference paper (record: Neural Information Processing Systems); entry from arXiv
- **Method**: PointNet applied recursively on nested partitions, with multi-scale layers for varying density.
- **Key results**: Learns local features at increasing scales and improves on 3D point cloud benchmarks.
- **Relevance**: Local geometry within a permutation-invariant encoder.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Lee et al. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: An attention encoder-decoder on sets with inducing points.
- **Key results**: Models interactions among set elements and reduces self-attention cost from quadratic to linear in set size.
- **Relevance**: Attention-based set encoder, including multiple instance learning.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: MIL as learning a Bernoulli bag label with an attention-based permutation-invariant pooling.
- **Key results**: Comparable results on MIL benchmarks and better results on an MNIST-based MIL task and two histopathology datasets, with instance-level interpretability.
- **Relevance**: Bag-level prediction from an unordered set of instances.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology.

### Lu et al. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Type**: Journal article (Nature Biomedical Engineering)
- **Method**: CLAM, clustering-constrained attention MIL with slide-level labels.
- **Key results**: Data-efficient, interpretable whole-slide classification that adapted to independent cohorts, phone microscopy and varying tissue content "without using any spatial labels".
- **Relevance**: Attention MIL in a clinical imaging setting without pixel annotation. Pipeline: removes manual region annotation.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Song et al. (2024). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology.
- **Type**: Conference paper (CVPR)
- **Method**: PANTHER, a Gaussian-mixture summary of a slide's patch set into morphological prototypes.
- **Key results**: Across 13 datasets for subtyping and survival, PANTHER outperformed or matched supervised MIL baselines.
- **Relevance**: Learned prototypes as a template for sets of patches.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Castro-Macias et al. (2026). Probabilistic smooth attention for deep multiple instance learning in medical imaging.
- **Type**: Journal article (Pattern Recognition)
- **Method**: A distribution over attention values with global and local interactions.
- **Key results**: Top predictive performance against eleven baselines on three medical datasets, and uncertainty maps that localize illness.
- **Relevance**: Current attention MIL for medical images treated as bags of patches or slices.
- **Quality**: Medium.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Harvey et al. (2026). A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification.
- **Type**: Archival preprint (arXiv; the text names CHIL 2026), evidence type preprint
- **Method**: Comparison of mean-pooling MIL, attention MIL, 3D CNNs and 3D ViTs on three CT and four MRI datasets.
- **Key results**: Mean-pooling MIL without learnable attention matched or outperformed alternatives on 4 of 6 moderate-sized tasks and trained 25 times faster.
- **Relevance**: Evidence that the simplest permutation-invariant pooling is a strong baseline for 3D neuroimages.
- **Quality**: Medium (preprint).
- **Stance**: Neutral (questions reported gains of attention MIL).
- **Potential use**: Discussion.

### Szabo et al. (2014). Learning Theory for Distribution Regression.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: Theory of regressing vector outputs from probability measures observed through samples.
- **Key results**: Treats multi-instance learning as distribution regression and analyses the two-stage sampled setting.
- **Relevance**: Statistical framing of subject-level prediction from a set.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Methodology.

### Mialon et al. (2020). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Type**: Conference paper (record: International Conference on Learning Representations); entry from arXiv
- **Method**: Set elements embedded and aggregated by the transport plan to a trainable reference.
- **Key results**: State-of-the-art protein fold recognition and chromatin profile detection. The aggregation relates to attention and to a transport kernel.
- **Relevance**: Joins the transport and set strands: a learned template that defines a permutation-invariant pooling.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Methodology.

### Kolouri et al. (2020). Wasserstein Embedding for Graph Learning.
- **Type**: Conference paper (record: International Conference on Learning Representations); entry from arXiv
- **Method**: Monge maps from a reference distribution to each graph's node embeddings, giving a fixed-size vector.
- **Key results**: Linear rather than quadratic cost in the number of graphs, with state-of-the-art graph classification.
- **Relevance**: Reference-based transport embedding of a set.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### E. Medical imaging: correspondence, transport and the pipeline

### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
- **Type**: Conference paper (NeurIPS 35)
- **Method**: Fused unbalanced GW (FUGW) alignment of cortical surfaces by functional signatures with a penalty on large deformations.
- **Key results**: "Current co-registration procedures rely on limited data, and thus lead to very coarse inter-subject alignments". FUGW gives landmark-free alignment, handles areas of different size and raises between-subject correlation.
- **Relevance**: Replaces anatomical co-registration by a transport coupling. Pipeline: works on cortical surfaces, so surface reconstruction stays.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Type**: Archival preprint (arXiv), evidence type preprint
- **Method**: FGW dictionary learning on brain graphs with amortized prediction of transport plans.
- **Key results**: Brain variability "is usually addressed by projecting each individual brain geometry onto a common template, which removes subject-specific information". The method captured levels of geometric variability on HCP data.
- **Relevance**: Learned FGW templates replacing a common anatomical template.
- **Quality**: Medium (preprint; one dataset; unsupervised).
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Mazelet, Flamary and Thirion (2025). Unsupervised Learning for Optimal Transport plan prediction between unbalanced graphs.
- **Type**: Conference paper (NeurIPS 38)
- **Method**: ULOT, a cross-attention network that predicts FUGW plans, trained on the FUGW loss.
- **Key results**: Competitive loss "up to two orders of magnitude faster" than classical solvers on SBM graphs and fMRI cortical surfaces.
- **Relevance**: Makes transport couplings between subjects cheap enough for large cohorts.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Methodology.

### Barbarant, Meyniel and Thirion (2026). Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders.
- **Type**: Archival preprint (bioRxiv), evidence type preprint
- **Method**: Comparison of functional alignment methods (optimal transport, Procrustes, ridge, shared response model) and template strategies for task decoding.
- **Key results**: Anatomical registration "fail[s] to capture functional variability". Templates built with optimal transport gave the highest decoding accuracy, were not biased by individual subjects and preserved topography.
- **Relevance**: The only included source that compares correspondence strategies on one predictive task. Pipeline: builds on anatomical registration.
- **Quality**: Medium (preprint).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Type**: Conference paper (IPMI, Lecture Notes in Computer Science)
- **Method**: Kantorovich means of non-normalized data linked to entropic Wasserstein barycenters.
- **Key results**: The standard approach smooths data "after the individual data have been ported to a common space using anatomical landmarks (anatomical registration)". The transport average handles non-overlapping effects in fMRI and MEG.
- **Relevance**: Transport barycenters as group templates in neuroimaging. Pipeline: replaces Gaussian smoothing as the remedy for residual misalignment.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Gutierrez-Becker, Sarasua and Wachinger (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: Point-cloud networks with similarity invariance for disease classification, age regression and conditional generation.
- **Key results**: The networks avoid "the need to identify point correspondences between shapes". The authors state that mesh methods usually need a registration step that is "challenging but also computationally expensive".
- **Relevance**: Subject-level prediction from anatomical point clouds. Pipeline: needs segmented structures; a rotation network aligns each cloud to a reference template.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Lo et al. (2025). TractShapeNet: Efficient Multi-Shape Learning with 3D Tractography Point Clouds.
- **Type**: Conference paper (IEEE ISBI)
- **Method**: Point-cloud network computing five tract shape measures, on 1,065 young adults.
- **Key results**: Outperformed other point-cloud networks on shape-measure computation. Its shape measures predicted language cognition as well as those of DSI-Studio.
- **Relevance**: Point clouds of tractography feeding subject-level prediction. Pipeline: builds on tractography.
- **Quality**: Medium.
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Prabhakar et al. (2023). Self-pruning Graph Neural Network for Predicting Inflammatory Disease Activity in Multiple Sclerosis from Brain MR Images.
- **Type**: Conference paper (MICCAI, Lecture Notes in Computer Science)
- **Method**: Lesions segmented by a 3D network, embedded by self-supervision and connected by spatial proximity into a patient graph classified by a GNN with self-pruning.
- **Key results**: AUCs of 0.67 against 0.61 (one year) and 0.66 against 0.60 (two years) over the baseline, with an importance score per lesion.
- **Relevance**: The included study closest to subject-level prediction from a set of lesions. Pipeline: builds on lesion segmentation; scans "were rigidly co-registered to the MNI152 atlas".
- **Quality**: Medium (one cohort; modest AUCs).
- **Stance**: Supports.
- **Potential use**: Introduction, Discussion.

### Kwon et al. (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: Prototype-based GNN on sulcal-pit graphs with inverse projection of prototypes onto nodes.
- **Key results**: Earlier sulcal analyses used "spectral graph matching" to normative references, with no standard reference set and costly matching. The method classified 174 controls and 345 patients better than state-of-the-art models.
- **Relevance**: Learned prototypes replace graph matching to a reference set.
- **Quality**: High.
- **Stance**: Supports.
- **Potential use**: Literature Review, Discussion.

### Kan et al. (2026). 3D Transport-based Morphometry (3D-TBM) for medical image analysis.
- **Type**: Archival preprint (arXiv), tool paper, evidence type preprint
- **Method**: Images embedded in a transport domain by invertible LOT maps to a reference, with classification, regression and back-projection.
- **Key results**: Preprocessing "typically involves registration, segmentation, cropping, and centering". The reference defaults to the mean training image.
- **Relevance**: A transport template method that still builds on registration and segmentation.
- **Quality**: Medium (tool paper).
- **Stance**: Neutral.
- **Potential use**: Discussion.

### Ackaouy et al. (2020). Unsupervised Domain Adaptation With Optimal Transport in Multi-Site Segmentation of Multiple Sclerosis Lesions From MRI Data.
- **Type**: Journal article (Frontiers in Computational Neuroscience)
- **Method**: Seg-JDOT, a joint distribution optimal transport adaptation of a segmentation network.
- **Key results**: Adaptation toward a target site improved segmentation on the MICCAI 2016 multi-site dataset.
- **Relevance**: Transport used inside the lesion-segmentation step, which subject-level predictors build on.
- **Quality**: Medium.
- **Stance**: Neutral.
- **Potential use**: Discussion.

### Avants et al. (2008). Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: [GAP: method] (abstract not read).
- **Key results**: [GAP: key results] (abstract not read).
- **Relevance**: Record title only: symmetric diffeomorphic registration evaluated on automated labeling of elderly and neurodegenerative brains. Seminal: 200 citing records listed, more exist. Lookups tried: `fetch` on 10.1016/j.media.2007.06.004 and OpenAlex W1970928383 (PMC page not a PDF, no abstract); `resolve` on the DOI.
- **Quality**: High by record and citation count; abstract not read.
- **Stance**: Neutral.
- **Potential use**: Introduction (the registration step).

### Balakrishnan et al. (2019). VoxelMorph: A Learning Framework for Deformable Medical Image Registration.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: A CNN mapping an image pair to a deformation field, trained unsupervised or with auxiliary segmentations.
- **Key results**: Accuracy comparable to state-of-the-art methods "while operating orders of magnitude faster".
- **Relevance**: The learned registration step. Pipeline: makes registration cheap without removing it.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction.

### Ronneberger, Fischer and Brox (2015). U-Net: Convolutional Networks for Biomedical Image Segmentation.
- **Type**: Conference paper (MICCAI, Lecture Notes in Computer Science)
- **Method**: A contracting and expanding network trained with strong augmentation.
- **Key results**: Trained end to end from few images, it won the ISBI 2015 cell tracking challenge in two categories.
- **Relevance**: Base architecture of the segmentation step.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction.

### Isensee et al. (2020). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Type**: Journal article (Nature Methods)
- **Method**: A framework that configures preprocessing, architecture and training of a U-Net per dataset.
- **Key results**: Without manual tuning it surpassed most specialized pipelines in 19 public competitions and set a new state of the art in most of 49 tasks.
- **Relevance**: The standard lesion-segmentation step that set and graph predictors build on.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Methodology.

### Aerts et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Type**: Journal article (Nature Communications)
- **Method**: 440 radiomic features from CT of 1,019 lung or head-and-neck cancer patients, with radiogenomic analysis.
- **Key results**: Many features had prognostic power in independent datasets, and a prognostic signature was associated with gene-expression patterns. Feature stability was assessed on test-retest and multiple-delineation data.
- **Relevance**: The radiomics pipeline (segmentation, then hand-crafted features, then a model). Correspondence: per-lesion features need no spatial alignment.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Introduction, Literature Review.

### van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Type**: Journal article (Cancer Research)
- **Method**: PyRadiomics, an open-source platform for engineered features.
- **Key results**: The lack of "standardized algorithm definitions and image processing severely hampers reproducibility and comparability". Demonstrated on lung lesions.
- **Relevance**: The reference radiomics feature extractor.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping.
- **Type**: Journal article (Radiology)
- **Method**: Three-phase consensus by 25 teams on reference values from a phantom, a CT and multimodality sarcoma images.
- **Key results**: 169 of 174 features were standardized, and most were excellently reproduced on CT (166), PET (164) and MRI (164).
- **Relevance**: Standardizes the radiomics step that set-based methods may replace or feed.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methodology, Discussion.

### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Type**: Journal article, review (Radiology)
- **Method**: Narrative review.
- **Key results**: Describes the radiomics process, its challenges and its potential for clinical decision making in cancer.
- **Relevance**: Background on the radiomics pipeline.
- **Quality**: Medium (review; one-sentence abstract read).
- **Stance**: Neutral.
- **Potential use**: Introduction.

## 5. Literature matrix

Themes: A multilinear regression and unaligned tensor modes; B entropic transport, barycenters and linear embeddings; C GW, FGW, templates and dictionaries; D set encoders and multiple instance learning; E medical-imaging correspondence and pipeline.

| Source | A | B | C | D | E | Method | Quality |
|---|---|---|---|---|---|---|---|
| Bro (1996) | main | | | | | Computational | High |
| Zhao et al. (2013) | main | | | | | Computational | High |
| Zhou, Li, Zhu (2013) | main | | | | x | Computational | High |
| Zhang, Li (2017) | main | | | | x | Computational | High |
| Kolda, Bader (2009) | main | | | | | Review | High |
| Kiers et al. (1999) | main | | | | | Computational | High |
| Perros et al. (2017) | main | | | | | Computational | Medium |
| Ren et al. (2022) | main | | | | | Computational | Medium |
| Konyar, Gahrooei (2025) | main | | | | | Computational | Medium |
| Schenker et al. (2025) | main | | | | | Computational | High |
| Morup et al. (2025) | main | | | | x | Review | High |
| Cuturi (2013) | | main | | | | Computational | High |
| Peyre, Cuturi (2019) | | main | x | | | Review | High |
| Benamou et al. (2015) | | main | | | | Computational | High |
| Feydy et al. (2019) | | main | | | | Computational | High |
| Agueh, Carlier (2011) | | main | | | | Theoretical | High |
| Cuturi, Doucet (2014) | | main | | | | Computational | High |
| Schmitz et al. (2018) | | main | x | | | Computational | High |
| Wang et al. (2012) | | main | | | x | Computational | High |
| Moosmuller, Cloninger (2022) | | main | | x | | Theoretical | High |
| Mahan et al. (2024) | | main | | x | | Computational | Medium |
| Kolouri et al. (2017) | | main | | | x | Review | Medium |
| Memoli (2011) | | | main | | | Theoretical | High |
| Peyre, Cuturi, Solomon (2016) | | x | main | | | Computational | High |
| Vayer et al. (2019) | | | main | | | Computational | High |
| Vayer et al. (2020) | | | main | | | Theoretical | High |
| Solomon et al. (2016) | | x | main | | | Computational | High |
| Xu (2020) | | | main | | | Computational | Medium |
| Xu, Luo, Carin (2019) | | | main | | | Computational | High |
| Vincent-Cuaz et al. (2021) | | | main | | | Computational | High |
| Vincent-Cuaz et al. (2022) | | | main | x | | Computational | High |
| Brogat-Motte et al. (2022) | | x | main | | | Computational | High |
| Qian et al. (2024) | | | main | x | | Computational | High |
| Bai et al. (2025) | | | main | | | Computational | Medium |
| Togninalli et al. (2019) | | x | main | x | | Computational | High |
| Zaheer et al. (2017) | | | | main | | Computational | High |
| Qi et al. (2017), PointNet | | | | main | | Computational | High |
| Qi et al. (2017), PointNet++ | | | | main | | Computational | High |
| Lee et al. (2019) | | | | main | | Computational | High |
| Ilse et al. (2018) | | | | main | x | Computational | High |
| Lu et al. (2021) | | | | main | x | Computational | High |
| Song et al. (2024) | | | | main | x | Computational | High |
| Castro-Macias et al. (2026) | | | | main | x | Computational | Medium |
| Harvey et al. (2026) | | | | main | x | Benchmark | Medium |
| Szabo et al. (2014) | | | | main | | Theoretical | High |
| Mialon et al. (2020) | | x | | main | | Computational | High |
| Kolouri et al. (2020) | | x | x | main | | Computational | High |
| Thual et al. (2022) | | | x | | main | Computational | High |
| Mazelet et al. (2026) | | | x | | main | Computational | Medium |
| Mazelet et al. (2025) | | | x | | main | Computational | High |
| Barbarant et al. (2026) | | x | | | main | Computational | Medium |
| Gramfort et al. (2015) | | x | | | main | Computational | High |
| Gutierrez-Becker et al. (2021) | | | | x | main | Computational | High |
| Lo et al. (2025) | | | | x | main | Computational | Medium |
| Prabhakar et al. (2023) | | | | x | main | Computational | Medium |
| Kwon et al. (2025) | | | x | x | main | Computational | High |
| Kan et al. (2026) | | x | | | main | Tool | Medium |
| Ackaouy et al. (2020) | | x | | | main | Computational | Medium |
| Avants et al. (2008) | | | | | main | Computational | High |
| Balakrishnan et al. (2019) | | | | | main | Computational | High |
| Ronneberger et al. (2015) | | | | | main | Computational | High |
| Isensee et al. (2020) | | | | | main | Computational | High |
| Aerts et al. (2014) | | | | | main | Quant (clinical cohort) | High |
| van Griethuysen et al. (2017) | | | | | main | Tool | High |
| Zwanenburg et al. (2020) | | | | | main | Standardization | High |
| Gillies et al. (2016) | | | | | main | Review | Medium |

Sources per theme as main: A 11, B 11, C 13, D 12, E 19.

## 6. Identified gaps

1. **Under-researched area: supervised outcome prediction from lesion or region sets through transport to learned templates.** Learnable transport templates are supervised on graphs, sequences and molecules [@Vincent_Cuaz_2022; @arxiv_2006_12065; @Qian_2024; @arxiv_2202_03813]. In neuroimaging, transport couplings and templates serve alignment, averaging, dictionaries and decoding [@Thual_2022; @Gramfort_2015; @arxiv_2605_20883; @Barbarant_2026]. The lesion-set predictor among the included sources uses a GNN on segmented lesions after rigid atlas co-registration [@Prabhakar_2023]. No included source predicts a clinical outcome from a set of lesions through couplings to learned templates.
2. **Methodological gap: multilinear PLS or tensor regression with an unaligned spatial mode.** Tensor PLS and tensor regression assume aligned modes [@Bro_1996; @Qibin_Zhao_2013; @Zhou_2013; @Zhang_2017]. PARAFAC2 handles one unaligned mode [@Kiers_1999], and its supervised or semi-supervised forms treat the irregular time mode of health records [@arxiv_2208_00993; @Konyar_2025]. No included source supervises a decomposition whose unaligned mode is spatial.
3. **Methodological gap: no comparison of correspondence strategies on a shared clinical outcome.** One preprint compares functional alignment methods for fMRI decoding after anatomical registration [@Barbarant_2026], and one benchmark compares MIL pooling with 3D CNNs on neuroimages [@arxiv_2604_26807]. No included source compares registration, a learned template, a transport coupling and permutation invariance on one subject-level outcome.
4. **Pipeline dependence of registration-free methods.** Several correspondence-free predictors still begin with segmentation, registration or tractography [@Prabhakar_2023; @arxiv_2602_07260; @Lo_2025; @Guti_rrez_Becker_2021]. The radiomics literature standardizes feature definitions [@Zwanenburg_2020; @van_Griethuysen_2017] and measures delineation variability [@Aerts_2014]. The included sources do not measure how segmentation error propagates into set-based or transport-based predictions.
5. **Critical gap under the `cs_ml` profile: thin and partly unreviewed evidence for medical transport templates.** The neuroimaging template and dictionary results come from preprints on one dataset or one family of datasets [@arxiv_2605_20883; @Barbarant_2026]. A benchmark found that mean pooling matched or beat attention MIL on 4 of 6 tasks [@arxiv_2604_26807], which signals that reported gains of more complex set encoders depend on the benchmarks chosen. The lesion-graph study reports one cohort with AUCs near 0.67 [@Prabhakar_2023].

## 7. Synthesis

### Topic, scope and method of the review

Clinical prediction from imaging usually assumes that every subject's image can be placed in one coordinate frame. That assumption fails when the informative content is a set: lesions that differ in number and position, regions of interest, tract point clouds or cortical graphs. This review asks which methods predict a subject-level outcome from such data, how each method handles the missing correspondence between subjects, and how each relates to the registration, segmentation and radiomics steps of imaging pipelines. The scope covers machine learning methods from any application domain, with medical image analysis as the setting of interest. It includes multilinear regression and decompositions, entropic and Gromov-Wasserstein transport with barycenters and templates, permutation-invariant set encoders and attention-based multiple instance learning, and the imaging pipelines these methods remove or build on. Sources run from 1996 to 2026 and are in English. The search queried Crossref, OpenAlex, Semantic Scholar and arXiv on 2026-11-16 in three passes of Boolean search, citation chaining, forward tracking and sentence search, followed by one search for recent work. It included 66 sources. Five themes follow: multilinear models, entropic transport, Gromov-Wasserstein templates, set encoders, and medical-imaging correspondence.

### Theme A: multilinear regression and tensor modes that do not align

Multilinear partial least squares began in chemometrics, where trilinear PLS stabilized the decomposition and predicted better than PLS on unfolded data [@Bro_1996]. Higher-order PLS generalized the model to Tucker structure for tensor predictors and responses and handled small samples and noise [@Qibin_Zhao_2013]. Statistical tensor regression brought low-rank coefficients to imaging covariates and made estimation feasible for MRI data [@Zhou_2013]. Envelope theory then gave tensor PLS a population model and consistency [@Zhang_2017]. All four models index each mode by the same units in every sample. For images, that means a voxel in one subject is taken to be the same voxel in another, which presupposes registration. These sources agree on the value of low-rank multilinear structure. None of them addresses a mode whose entries differ across subjects.

The decomposition literature does have a model for one such mode. PARAFAC2 applies when matrices share column units but differ in their row units, and it keeps uniqueness under mild assumptions [@Kiers_1999; @Kolda_2009]. Scalable PARAFAC2 was built for patients whose records "do not align naturally" in time [@Perros_2017]. Recent work adds constraints and couplings to other datasets [@Schenker_2025]. Supervision entered only recently, through multi-task prediction and partial labels on health records [@arxiv_2208_00993; @Konyar_2025], and a survey of functional neuroimaging places inter-subject variability at the centre of coupled decompositions [@M_rup_2025]. In every included case the unaligned mode is temporal. The summary for this theme is that multilinear prediction is mature for aligned arrays, and that the one model family built for an unaligned mode has been used for prediction only on time-indexed clinical records.

### Theme B: entropic transport, barycenters and linear embeddings

Entropic regularization made transport usable in learning. Smoothing the transport problem by entropy gives a distance that Sinkhorn scaling computes far faster than linear programming [@arxiv_1306_0895]. Bregman projections extend the same device to barycenters, multi-marginal and unbalanced problems [@Benamou_2015], and Sinkhorn divergences give a debiased loss with metric guarantees [@arxiv_1810_08278]. A monograph collects the numerics and the generalizations [@Peyr__2019]. For this review, the soft coupling matters more than the distance itself. The coupling is a probabilistic correspondence between two subjects' supports, computed rather than imposed by registration. Its cost depends on a ground metric, so a coupling between point sets still assumes that their coordinates are comparable.

Barycenters turn couplings into templates. The Wasserstein barycenter generalizes interpolation to many measures [@Agueh_2011], entropic smoothing makes it fast to compute [@arxiv_1310_4375], and dictionary learning learns several barycentric atoms jointly with each sample's weights [@Schmitz_2018]. Linear optimal transport takes a single reference instead. Each image or point cloud is mapped to that reference, and the maps form a linear embedding that keeps class structure [@Wang_2012]. Theory shows that this embedding separates shifted and scaled families and nearly preserves Wasserstein distances [@Moosm_ller_2022]. A recent preprint learns the maps with convex networks and adds a permutation-invariant classifier for point clouds [@arxiv_2401_01460]. A tutorial surveys these uses in signal processing [@Kolouri_2017]. The sources agree that a reference or barycenter gives a fixed-size representation of unaligned measures. They differ on whether the reference is fixed in advance or learned with the task.

### Theme C: Gromov-Wasserstein couplings, fused distances and learned templates

Gromov-Wasserstein distances drop the shared ground metric and compare objects by their internal distances [@M_moli_2011]. This removes the last assumption of Theme B: two subjects need no common coordinate system. Entropic GW gives soft correspondences between arbitrary metric-measure domains [@Solomon_2016], and the coupling is itself a node matching between graphs [@arxiv_1905_07645]. GW barycenters average distance matrices that need not share size or row correspondence, and one application predicted molecular energy levels from such representations [@Peyre_2016]. Fused GW adds node features to structure, so a coupling respects both [@arxiv_1805_09114; @Vayer_2020]. A partial variant relaxes the equal-mass constraint for objects of unequal size [@arxiv_2502_09934]. A transport kernel on node-feature distributions, an earlier relative, finds differences that sum or mean pooling misses [@arxiv_1906_01277].

Learned templates are where this strand meets supervised prediction. GW factorization and online graph dictionary learning express each graph as a barycenter of atoms learned from unregistered graphs of different sizes [@Xu_2020; @arxiv_2102_06555]. Template-based graph networks feed the vector of FGW distances to learnable template graphs into a classifier and learn the templates end to end [@Vincent_Cuaz_2022]. Prototype classifiers learn class templates under FGW with a generalization bound [@Qian_2024], and FGW barycenters with input-dependent weights serve as a regression model for graph outputs [@arxiv_2202_03813]. Reported results come from graph and molecular benchmarks, with competitive or better accuracy than kernels and graph neural networks. In this theme, the missing correspondence is resolved twice: by a soft coupling per subject, and by templates that the task itself shapes.

### Theme D: permutation-invariant set encoders and multiple instance learning

Set encoders remove correspondence by design. Any permutation-invariant function decomposes into an element-wise map followed by a symmetric aggregation [@arxiv_1703_06114]. PointNet applies that idea to point clouds [@Charles_2017], and PointNet++ adds local structure at several scales [@arxiv_1706_02413]. The Set Transformer replaces the fixed aggregation with attention among elements [@arxiv_1810_00825]. Distribution regression gives the statistical frame: each subject is a probability measure seen through a sample, and the output is regressed on that measure [@arxiv_1411_2066]. These encoders need no template and no coupling. Their cost is that relations between elements are learned only through aggregation or attention, unless the architecture adds them.

Multiple instance learning brings this frame to clinical images. Attention-based MIL learns a weighted pooling of instances and points to the instances that drive a bag label [@arxiv_1802_04712]. CLAM extended it to whole-slide pathology with slide-level labels only [@Lu_2021], and probabilistic attention adds uncertainty over instance weights [@Castro_Mac_as_2026]. Two sources join this theme to the previous ones. A trainable transport embedding pools a set by its plan to a learned reference and relates that pooling to attention [@arxiv_2006_12065], and a Wasserstein graph embedding pools node embeddings through Monge maps from a reference [@arxiv_2006_09430]. Morphological prototypes summarize a slide's patches by a mixture model and matched supervised MIL on 13 datasets [@Song_2024]. A benchmark on CT and MRI volumes found that plain mean pooling matched or beat attention MIL on 4 of 6 tasks [@arxiv_2604_26807]. The theme converges on permutation invariance as the cheapest correspondence-free route. It diverges on whether attention or templates add accuracy beyond a simple pool.

### Theme E: correspondence and the medical-imaging pipeline

The conventional pipeline imposes correspondence before prediction. Diffeomorphic registration maps brains to a common space [@AVANTS_2008], and learned registration makes this mapping fast without removing it [@Balakrishnan_2019]. Segmentation networks delineate lesions and structures [@Ronneberger_2015; @Isensee_2020]. Radiomics then reduces each segmented lesion to engineered features [@Aerts_2014; @van_Griethuysen_2017; @Gillies_2016], and standardization work fixes their definitions [@Zwanenburg_2020]. Radiomic features need no spatial alignment between subjects, since each describes one lesion. They depend on the delineation, which was shown by test-retest and multiple-delineation analyses [@Aerts_2014]. Transport also appears inside this pipeline, for example to adapt a lesion segmentation network across sites [@Ackaouy_2020].

Transport-based neuroimaging work targets the registration step directly. Transport averages replaced the smoothing that compensates for residual misalignment after anatomical registration [@Gramfort_2015]. Fused unbalanced GW aligned cortical surfaces by function without landmarks, because co-registration gives only coarse inter-subject alignment [@Thual_2022]. FGW dictionaries learned across individual geometries avoid projecting every brain onto one template [@arxiv_2605_20883], and learned plan predictors make such couplings fast [@Mazelet_2025]. Templates built by transport alignment gave the best fMRI decoding accuracy in a comparison of alignment methods [@Barbarant_2026]. Set and graph methods address the segmentation output instead. Point-cloud networks classify anatomical shapes without point correspondences [@Guti_rrez_Becker_2021], tract point clouds yield shape measures that predict cognition [@Lo_2025], prototypes replace graph matching for sulcal patterns [@Kwon_2025], and a lesion graph predicted multiple sclerosis activity [@Prabhakar_2023]. Each of these still starts from segmentation, tractography or registration, and a transport morphometry tool lists registration and segmentation as required preprocessing [@arxiv_2602_07260].

### Cross-cutting synthesis

The sources describe four answers to missing correspondence. The table maps each method family to its answer and to the pipeline steps it removes or keeps, as the annotations above report them.

| Method family | How correspondence is handled | Pipeline step removed | Pipeline step kept or built on |
|---|---|---|---|
| Tensor PLS and tensor regression [@Bro_1996; @Qibin_Zhao_2013; @Zhou_2013; @Zhang_2017] | Aligned modes assumed | None | Registration to a common grid |
| PARAFAC2 and supervised variants [@Kiers_1999; @arxiv_2208_00993; @Konyar_2025] | Slice-specific factors for one unaligned mode | Alignment of the unaligned mode | Applied to time-indexed records in the included sources |
| Entropic transport and barycenters [@arxiv_1306_0895; @arxiv_1310_4375; @Gramfort_2015] | Soft coupling to a barycenter on a shared ground space | Post-registration smoothing | Anatomical registration to a common space |
| Linear OT embeddings [@Wang_2012; @Moosm_ller_2022; @arxiv_2602_07260] | Maps to one fixed or mean reference | Voxel-wise comparison | Registration and segmentation in 3D-TBM |
| GW and FGW with learned templates [@Vincent_Cuaz_2022; @arxiv_2102_06555; @Qian_2024; @arxiv_2605_20883] | Coupling within each subject's own geometry to learned templates | Common anatomical template | Graph construction from parcels or surfaces |
| Transport alignment of brains [@Thual_2022; @Barbarant_2026] | Coupling between subjects' surfaces | Landmark co-registration as the final alignment | Surface reconstruction, anatomical registration |
| Set encoders and MIL [@arxiv_1703_06114; @Charles_2017; @arxiv_1802_04712; @Lu_2021] | Permutation invariance | Registration and spatial labels | Instance extraction (patches, slices, points) |
| Transport and prototype pooling [@arxiv_2006_12065; @arxiv_2006_09430; @Song_2024] | Coupling or mixture fit to a learned reference | Fixed pooling | Instance encoder |
| Lesion and shape set predictors [@Prabhakar_2023; @Guti_rrez_Becker_2021; @Kwon_2025] | Graph or point-cloud invariance, learned prototypes | Point correspondence, graph matching | Segmentation, rigid co-registration |
| Radiomics [@Aerts_2014; @van_Griethuysen_2017; @Zwanenburg_2020] | Per-lesion features, no spatial alignment | Spatial alignment of lesions | Segmentation, feature engineering |

The convergent finding is that subject-level prediction without dense correspondence is feasible by three routes: invariance, couplings and learned templates. The literature diverges on what the extra machinery buys. Template-based transport reports gains on graph benchmarks [@Vincent_Cuaz_2022; @Qian_2024], while a neuroimaging benchmark found that mean pooling is hard to beat [@arxiv_2604_26807]. Computational method papers dominate the set. Clinical validation is rare, and the clinical studies that exist report single cohorts [@Prabhakar_2023; @Kwon_2025].

### Gaps, research agenda and key takeaways

The gaps of section 6 define the agenda. The first item is a supervised model that predicts an outcome from a lesion or region set through FGW couplings to learned templates, evaluated against attention MIL, mean pooling and a registration-based radiomics model on one cohort. The second is a supervised decomposition with an unaligned spatial mode, for example a PARAFAC2-type model whose spatial factors are tied to a transport template. The third is a measurement of how segmentation error propagates into each family, using the multiple-delineation designs of radiomics. The fourth is external validation on more than one cohort, with the simple pooling baseline always reported.

Key takeaways follow. Tensor regression assumes alignment. PARAFAC2 relaxes one mode but has been supervised only on time. Transport couplings and learned templates replace a common anatomical template. Set encoders replace correspondence by invariance. Every included medical method still depends on a segmentation or registration step somewhere. For practice, a registration-free claim should name which pipeline step a method removes and which it keeps, since none of the included methods removes all of them.

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Zhou_2013, Prabhakar_2023, Thual_2022, AVANTS_2008, Balakrishnan_2019, Isensee_2020, Aerts_2014, Gillies_2016, Kolda_2009, M_rup_2025, Peyr__2019, Kolouri_2017 |
| Literature Review | Bro_1996, Qibin_Zhao_2013, Zhang_2017, Kiers_1999, Perros_2017, arxiv_2208_00993, Konyar_2025, Schenker_2025, Schmitz_2018, Wang_2012, arxiv_2401_01460, M_moli_2011, Peyre_2016, Xu_2020, arxiv_2102_06555, Vincent_Cuaz_2022, arxiv_2202_03813, Qian_2024, arxiv_1906_01277, arxiv_1703_06114, Charles_2017, arxiv_1706_02413, arxiv_1810_00825, arxiv_1802_04712, Lu_2021, Song_2024, Castro_Mac_as_2026, arxiv_2006_12065, arxiv_2006_09430, Gramfort_2015, arxiv_2605_20883, Guti_rrez_Becker_2021, Lo_2025, Kwon_2025 |
| Methodology | arxiv_1306_0895, Benamou_2015, arxiv_1810_08278, Agueh_2011, arxiv_1310_4375, Moosm_ller_2022, arxiv_1805_09114, Vayer_2020, Solomon_2016, arxiv_1905_07645, arxiv_2502_09934, Mazelet_2025, arxiv_1411_2066, van_Griethuysen_2017, Zwanenburg_2020, Ronneberger_2015 |
| Discussion | arxiv_2604_26807, Barbarant_2026, arxiv_2602_07260, Ackaouy_2020, Prabhakar_2023, Kwon_2025, Thual_2022, Vincent_Cuaz_2022, Lu_2021, Aerts_2014 |

## 10. Search limitations and gate failures

- **Currency gate not met.** 24 of the 66 sources (36 percent) are dated 2021 to 2026, against a threshold of 50 percent. The gate action ran once (search strings 26 and 27, 2026-11-16) and added Mazelet_2025 and arxiv_2604_26807. The share is still below the threshold. The foundational transport, tensor and pipeline works that the research question names are older than five years, which accounts for much of the shortfall.
- **Condition 4 under its literal reading.** The search ended on conditions 1, 2, 3 and 5. Condition 4 held only under the reading "no new work cited by 3 or more core papers".
- **Index behaviour.** Crossref and OpenAlex returned their 100-record ceiling for nearly all strings, so the tightening rule could only narrow by terms. Semantic Scholar was left out with "HTTP 429 after 3 retries" on several calls and printed "not found" for most Boolean strings, so its coverage is thinner than that of the other three indexes.
- **Title-stage tally.** Records excluded on their title were not counted one by one, so the number after title screening is given as the 69 fetched candidates.
- **Abstract-only reading.** 24 included sources were read from their abstract only, and two seminal sources (M_moli_2011, AVANTS_2008) were included without an abstract. Their annotations claim nothing beyond what those files or records hold.
- **Corrections to the printed BibTeX.** The author field of Charles_2017 is corrected to Qi, Charles R., Su, Hao, Mo, Kaichun and Guibas, Leonidas J., and the entry is confirmed against Crossref with ratio 1.00. All 37 page ranges use the BibTeX range `--`. Other characters are written in ASCII. Kiers_1999 has `---` in its title, and M_moli_2011 has `--` in its title. Prabhakar_2023 and Ronneberger_2015 have `--` in their venue names. The title of Prabhakar_2023 has ordinary spaces. Peyr__2019 has `\textregistered{}` in its venue name. Perros_2017 and Qian_2024 have straight apostrophes in their series and collection fields. Lo_2025 has a straight apostrophe in O'Donnell. All eight entries are confirmed by `resolve --entry`. Every ampersand is escaped as `\&`: in the title of Perros_2017 ("Large \& Sparse Data", where Crossref holds the HTML entity `&amp;`) and in the publisher field "Society for Industrial \& Applied Mathematics (SIAM)" of Kolda_2009, Benamou_2015, Agueh_2011 and Schmitz_2018. These five entries are confirmed by `resolve --entry`. The only non-ASCII characters left in refs.bib are accented letters in names.
- **Unread exclusions.** Three recent or relevant candidates could not be read and were excluded (section 3). One of them, Zhao et al. 2026, combines point-cloud features with radiomics for surgical outcome prediction and bears directly on the research question.

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (Claude Opus 5.5, identifier claude-opus-5-5). The AI took part in research assistance for the search and the annotated bibliography. A person oversaw the process, and the authors take responsibility for the content.

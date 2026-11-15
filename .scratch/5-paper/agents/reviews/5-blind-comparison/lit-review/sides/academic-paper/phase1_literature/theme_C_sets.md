# Theme C Literature Search Report: permutation-invariant set encoders, point-cloud networks, multiple-instance learning, and set encoders on medical data

This file is the Phase 1 output of one theme-scoped literature_strategist_agent run (decision D1 in `config.md`). It holds the search strategy, screening counts, annotated bibliography, theme-level literature matrix, gaps tied to named sources, and the sources excluded at full-text assessment. It contains no outline and no draft prose for any paper section.

## Search Strategy

### Research question and theme scope

Research question (from the confirmed Paper Configuration Record): which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

Theme C covers the permutation-invariance branch of that question. Sub-themes used as matrix columns: C1 theory of invariant set functions (sum and mean decomposition, universality, expressivity limits); C2 attention-based and learned-seed or inducing-point set pooling; C3 point-cloud networks (PointNet family, hierarchical, graph-based, point transformers); C4 multiple-instance learning (MIL) for bag-level prediction; C5 set and point-cloud encoders applied to medical data (cortical surfaces, brain structures, white matter tracts, lesion sets, cell sets, region sets).

Key concepts and synonyms: (a) permutation invariant, permutation-invariant, symmetric function, multiset, set encoder, Deep Sets, Set Transformer, sum decomposition; (b) point cloud, PointNet, geometric deep learning, point transformer; (c) multiple instance learning, multiple-instance learning, attention pooling, bag; (d) medical terms: lesion, nodule, metastases, cortical surface, brain shape, neuroanatomy, white matter, hippocampus, cell, patient-level.

### Domain evidence profile resolution

The PCR row `Domain Evidence Profile` reads `cs_ml`, a value in the four-value enum, so the profile is `cs_ml` and fallback cases (a), (b), (b-reserved) and (c) do not apply; no `[NO-PROFILE-NEUTRAL]`, `[PROFILE-RESERVED-FALLBACK]` or `[PROFILE-UNRESOLVED]` tag is emitted. The PCR `Discipline` row is machine learning with medical image analysis as the application setting; machine learning falls within the `cs_ml` implied set (CS / Engineering / Technology), so `[PROFILE-DISCIPLINE-MISMATCH]` is not emitted. No advisory tag is required. Under `cs_ml`, archival arXiv preprints and conference proceedings are admissible at the peer-review and publication-type nodes; the relevance, methodology and predatory checks were applied to every source unchanged.

### Databases and tools

All queries were run on 2026-11-15 (local date from `date +%F`).

Queried and returned results:
- Semantic Scholar Graph API (`api.semanticscholar.org`): `/paper/search/bulk` (Boolean syntax, sorted by citation count, year filter 2013-2026), `/paper/search` (relevance), `/paper/{id}/references`, `/paper/{id}/citations`, `/recommendations/v1/papers/forpaper/{id}`, `/paper/batch` (record retrieval).
- PubMed E-utilities (`esearch`, `esummary`, `efetch` abstracts), date filter publication date 2013-2026.
- arXiv API (`export.arxiv.org/api/query`), search and `id_list` record retrieval.
- Crossref REST API (`api.crossref.org/works/{doi}` and `query.bibliographic`), used to resolve every DOI recorded below.
- WebSearch (two natural-language semantic queries) and WebFetch (JMLR and PMLR proceedings pages for volume and page data; one arXiv abstract page).

Attempted and not available in this run:
- OpenAlex (`api.openalex.org`): HTTP 429 with the message "Insufficient budget. This request has no API key" on both attempted queries; no OpenAlex result is used.
- DBLP search API: returned a bot-verification HTML page instead of JSON; not used.
- PubMed Central article pages through WebFetch: returned a browser-verification page; PMC full text was not read.
- One Semantic Scholar relevance query (medical point clouds, listed below) failed with HTTP 429 and returned no records.

Not queried: IEEE Xplore, ACM Digital Library and Scopus, the CS/Engineering databases named in the agent's database table. They are subscription databases and no access route to them was attempted in this run. Semantic Scholar and Crossref were used in their place; the retrieved Semantic Scholar and Crossref records include IEEE (CVPR, ICCV, ISBI, IEEE TMI) and ACM (ACM Transactions on Graphics, ACM Computing Surveys) publications. Medicine databases: PubMed was queried; MEDLINE content is reached through PubMed; Cochrane was not queried because the theme contains no clinical-trial evidence.

### Inclusion and exclusion criteria

- Include: English-language peer-reviewed journal articles and conference proceedings; arXiv preprints admitted under `cs_ml` where no peer-reviewed version exists, flagged as preprints; foundational works at any year; systematic search window 2013 to 2026.
- Include on relevance: the source proposes, analyses or applies a permutation-invariant set or point-cloud encoder, or an MIL bag-level predictor, and either (i) gives theory or architecture that a subject-level predictor on unaligned spatial sets builds on, or (ii) applies such an encoder to medical data to predict a subject-, patient-, case- or bag-level outcome.
- Exclude: segmentation-only, registration-only, completion, generation and detection papers that make no set-level or subject-level prediction; non-English; non-scholarly web pages; records for which no DOI or arXiv record could be retrieved; topics belonging to Themes A, B or D unless centrally about a permutation-invariant encoder.

### Layer 1: Boolean search

"Total" is the total-count field returned by the API. "Screened" is the number of records whose titles (with venue, year and identifier) were read in this run, taken in the order the API returned them (Semantic Scholar bulk: sorted by citation count; PubMed: date order; arXiv: relevance).

| ID | Tool | Query string | Total returned | Screened |
|---|---|---|---|---|
| L1-A | S2 bulk, 2013-2026 | `("permutation invariant" \| "permutation-invariant" \| "set encoder" \| "deep sets" \| "set transformer") + (set \| sets \| "point cloud" \| multiset)` | 1724 | 30 |
| L1-B | S2 bulk, 2013-2026 | `("point cloud") + (classification \| regression) + (network \| deep)` | 3846 | 30 |
| L1-C | S2 bulk, 2013-2026 | `("multiple instance learning" \| "multiple-instance learning") + (attention \| "attention-based") + (bag \| slide \| medical \| pathology)` | 837 | 30 |
| L1-D | S2 bulk, 2013-2026 | `("permutation invariant" \| "permutation-invariant" \| "symmetric function" \| "sum decomposition" \| "multiset") + (universal \| universality \| expressive \| expressivity \| injective \| approximation) + (set \| sets)` | 274 | 25 |
| L1-E | S2 relevance, 2013-2026 | `universal approximation permutation invariant functions on sets sum decomposition latent dimension` | 3 | 3 |
| L1-F | S2 relevance, 2013-2026 | `point cloud deep learning brain cortical surface shape classification disease prediction` | HTTP 429, no records | 0 |
| L1-G | OpenAlex | `"point cloud" brain` and `"point cloud" OR "PointNet" cortical surface` | HTTP 429, no records | 0 |
| L1-H | PubMed, pdat 2013-2026 | `("point cloud"[tiab] OR "PointNet"[tiab] OR "set transformer"[tiab] OR "deep sets"[tiab] OR "permutation invariant"[tiab] OR "permutation-invariant"[tiab]) AND (brain[tiab] OR cortical[tiab] OR lesion*[tiab] OR "cell"[tiab] OR anatomical[tiab] OR shape[tiab]) AND (classification[tiab] OR prediction[tiab] OR regression[tiab] OR diagnosis[tiab])` | 186 | 186 |
| L1-I | PubMed, pdat 2013-2026 | `("multiple instance learning"[tiab] OR "multiple-instance learning"[tiab]) AND attention[tiab] AND (MRI[tiab] OR "magnetic resonance"[tiab] OR CT[tiab] OR "computed tomography"[tiab] OR lesion*[tiab]) NOT ("whole slide"[tiab] OR histopatholog*[tiab])` | 53 | 53 |
| L1-J | arXiv | `abs:"permutation invariant" AND (abs:"set" OR abs:"multiset") AND (abs:"universal" OR abs:"expressive" OR abs:"expressivity" OR abs:"injective") AND (cat:cs.LG OR cat:stat.ML)` | 37 | 37 |
| L1-K | arXiv | `(abs:"point cloud" OR abs:"set transformer" OR abs:"deep sets" OR abs:"permutation invariant") AND (abs:"lesion" OR abs:"lesions" OR abs:"cortical" OR abs:"brain" OR abs:"cells") AND (abs:"prediction" OR abs:"classification")` | 81 (50 retrieved) | 50 |
| L1-L | S2 bulk, 2013-2026 | `("set transformer" \| "deep sets" \| "permutation invariant" \| "permutation-invariant" \| "attention pooling" \| "multiple instance") + (lesions \| metastases \| nodules \| "lesion-level" \| "patient-level") + (MRI \| CT \| PET \| imaging)` | 339 | 40 |
| L1-M | S2 bulk, 2013-2026 | `("point cloud" \| PointNet \| "geometric deep learning") + ("cortical surface" \| "brain shape" \| neuroanatomy \| "white matter" \| hippocampus) + (prediction \| classification \| regression \| age \| disease)` | 34 | 34 |
| L1-N | arXiv | `ti:"point transformer" OR (abs:"self-attention" AND abs:"point cloud" AND ti:transformer AND cat:cs.CV)` | 147 (50 retrieved) | 20 |
| L1-O | S2 bulk, 2013-2026 | `("multiple instance learning" \| "multiple-instance learning") + (transformer \| "self-attention") + ("whole slide" \| "whole-slide")` | 207 | 20 |

Layer 1 decision rule: L1-A, L1-B and L1-C exceeded 500 hits; they were not re-run with tighter strings because sorting by citation count put the foundational records in the first 30, and the medical and theory sub-themes were covered by the narrower queries L1-D to L1-O. L1-E returned 3 records (fewer than 20); the theory sub-theme was relaxed by running L1-D and L1-J instead.

### Layer 2: backward citation chaining

Reference lists were retrieved from the Semantic Scholar references endpoint. "Records returned" is the count the endpoint returned per seed.

| Seed group | Seeds (records returned) | Unique references | Rule for examining titles | Titles examined |
|---|---|---|---|---|
| Set encoders | Deep Sets arXiv:1703.06114 (54), Set Transformer arXiv:1810.00825 (40), Wagstaff 2019 arXiv:1901.09006 (35), Wagstaff 2022 arXiv:2107.01959 (37); arXiv:1802.04712 returned HTTP 404 and arXiv:2310.13829 returned 0 records | 139 | cited by at least 2 of the 4 seeds | 22 |
| MIL | CLAM DOI:10.1038/s41551-020-00682-w (55), TransMIL arXiv:2106.00908 (41), Campanella DOI:10.1038/s41591-019-0508-1 (39) | 126 | cited by at least 2 of the 3 seeds | 9 |
| MIL (DSMIL) | DSMIL arXiv:2011.08939 (63) | 63 | title contains "point" or "set" | 1 |
| Medical point clouds | Gutierrez-Becker arXiv:1806.01069 (17), Chen 2022 arXiv:2207.02402 (34), TractGeoNet arXiv:2307.03982 (140) | 167 | cited by at least 2 of the 3 seeds | 23 |

Must-include signal (cited by at least 3 seeds): PointNet (3 of 4 set seeds and 3 of 3 medical seeds) and Deep Sets (3 of 4 set seeds). Cited by 2 seeds and carried forward: PointNet++, Set Transformer, Wagstaff 2019; the Ilse 2018 attention-MIL record appeared in 2 of 3 MIL seeds, under a Semantic Scholar record titled "UvA-DARE (Digital Academic Repository) Attention-based Deep Multiple Instance Learning" (CorpusId 3537028). Layer 2 contributed 45 titles not seen in Layer 1.

### Layer 3: forward tracking

| Seed | Citing records retrieved | Filter | Titles examined |
|---|---|---|---|
| Wagstaff 2022 arXiv:2107.01959 and Wagstaff 2019 arXiv:1901.09006 (90 and 201 records) | 266 unique | year 2023 or later (138 records), sorted by number of the two seeds cited, then citation count | 50 |
| Ilse 2018 (CorpusId 3537028), all pages | 2957 | year 2023 or later and title matching `MRI\|magnetic resonance\|\bCT\b\|tomograph\|lesion\|brain\|PET\|radiolog\|nodule\|patient-level\|subject-level\|point cloud\|set` (192 records), sorted by citation count | 68 |

Layer 3 contributed 112 titles not seen in Layers 1 and 2, including Amir 2023 and Wang 2024 (both citing both Wagstaff papers). No foundational source in the included set has zero citing records from 2023 or later, so none is marked possibly outdated.

### Layer 4: semantic search

| Tool | Input | Returned | Examined | Relevant additions |
|---|---|---|---|---|
| S2 recommendations | Set Transformer arXiv:1810.00825 | 40 | 40 | 0 |
| S2 recommendations | TractGeoNet arXiv:2307.03982 | 40 | 40 | 0 |
| S2 recommendations | Gutierrez-Becker arXiv:1806.01069 | 0 | 0 | 0 |
| WebSearch | `set transformer over multiple lesions patient-level prediction MRI permutation invariant lesion set` | 10 links | 10 | 2 (NoduleSAT arXiv:2004.05640; AMINN arXiv:2012.06875) |
| WebSearch | `PointNet cortical surface point cloud brain age prediction deep learning` | 10 links | 10 | 0 new (Vosylius 2020 and Gutierrez-Becker 2018 were already in Layer 1) |

The 75 unique recommendation titles had 0 overlap with Layers 1 to 3; all 75 were 2024 to 2026 records off the theme (image classification, quantization, diffusion MRI processing), so the recommendation endpoint added no relevant candidate. The two WebSearch additions are 2 of 25 included sources (8 percent).

### Coverage Distribution Advisory

DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational (method development, theory, or computational evaluation on existing datasets) = 25/25 (100%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: no expansion; the RQ asks which computational methods handle the missing correspondence, so a computational concentration follows from the scope.

Time distribution (known_N = 25): 2017: 3, 2018: 2, 2019: 4, 2020: 2, 2021: 4, 2022: 3, 2023: 1, 2024: 4, 2025: 2; no year reaches 70 percent. Venue tier (known_N = 25): proceedings 14 (56%), journals 11 (44%), preprint-only 0; no concentration reaches 70 percent. Geographic distribution is not assessed because study sites are not stated in most abstracts read.

## Screening Results

- Initial hits: 811 titles screened across Layers 1 to 4 through the APIs (744 unique after title normalisation), plus 20 WebSearch result links. These are records actually read; the API total counts in the tables above are larger and were not all read.
- After title/abstract screening: 28 records. Phase A was run on titles with venue, year and identifier; records kept were sent to record retrieval (Semantic Scholar batch, arXiv `id_list`, Crossref, PubMed `efetch`).
- After full-text assessment: 25 records. Phase B read the abstract of all 28 records and, for 6 of them, sections of the full text (arXiv PDFs of Ilse 2018, Gutierrez-Becker 2018, Vosylius 2020, Yang 2020, Chen 2021 AMINN, Chen 2022). Three records were excluded (see the last section).
- Final included sources: 25.

Examples of title-stage exclusions within scope: Janossy pooling (arXiv:1811.01900) and Bloem-Reddy and Teh's probabilistic symmetries (JMLR 2020) were not retrieved because Wagstaff 2022 analyses Deep Sets as the most efficient instance of Janossy pooling and the theory column already holds six primary sources; PCT, PointNeXt, KPConv and PointConv were not retrieved because they are object-level point-cloud architectures and four point-cloud networks already cover the PointNet, hierarchical, graph and attention designs; the many whole-slide MIL variants from L1-C, L1-O and Layer 3 were not retrieved because CLAM, TransMIL, Campanella and Ilse already cover the attention, max-pooling and correlated-instance designs. Point-cloud completion, segmentation and registration records from L1-H were excluded as making no set-level prediction.

Quality gates: peer-reviewed ratio 25/25 (each included source has a peer-reviewed version identified from the arXiv comment field, the Semantic Scholar venue field, the Crossref container title, or the PMLR or JMLR page); currency 14/25 (56%) published 2021 to 2026; 7/25 published 2023 to 2026; every matrix column holds at least 3 sources.

### Saturation

| # | Condition | Met | Evidence |
|---|---|---|---|
| 1 | Source count meets target | Yes | 25 included against the theme target of 12 to 25; the paper-level minimum of 30 applies to the merged report. |
| 2 | Latest round added under 10 percent | Yes | Layer 4 added 2 of 25 included sources (8 percent); the recommendation endpoint added 0. |
| 3 | Every matrix theme has at least 3 sources | Yes | C1: 9, C2: 10, C3: 11, C4: 10, C5: 14 (main or x entries in the matrix). |
| 4 | Citation loop closure | No | Layer 3 still found uncollected sources (Amir 2023, Wang 2024), and backward chaining was not re-run on the final set. |
| 5 | Temporal span coverage | Yes | Foundational works 2017 to 2019 and 7 sources from 2023 to 2026. |

Four conditions (1, 2, 3, 5) are met, above the required three, so the search stopped.

## Annotated Bibliography

Quick-assessment scores follow the agent's five 1-3 items: journal ranking (JR), methodological rigor (MR), relevance to RQ (RR), citation count (CC), data/evidence quality (DE). JR, MR, RR and DE are judgments made by reading. JR uses 3 for a journal judged Q1/Q2 and 2 for a well-known conference; quartiles were not checked against a ranking database, because none was reachable in this run. CC uses the Semantic Scholar citation count retrieved in this run (`/paper/batch` or search output), compared by judgment with same-age literature. Total 12 or more is High, 8 to 11 is Medium.

### C1. Theory of invariant set functions

### Zaheer, M., Kottur, S., Ravanbakhsh, S., Poczos, B., Salakhutdinov, R., Smola, A. (2017). Deep Sets.
- **Type**: Conference paper
- **Evidence type**: proceedings (NeurIPS 2017, per the arXiv comment "NIPS 2017"); arXiv:1703.06114
- **Method**: theoretical characterisation of permutation-invariant functions plus a network architecture, evaluated on population statistic estimation, point cloud classification, set expansion and outlier detection.
- **Key Findings**: The main theorem characterises permutation-invariant functions and gives a family of functions to which any permutation-invariant objective must belong; this structure yields a deep architecture that operates on sets. The paper also derives necessary and sufficient conditions for permutation equivariance in deep models.
- **Relevance**: Gives the sum-decomposition form that most set encoders for subject-level prediction from unaligned elements build on.
- **Stance**: supports (permutation invariance is presented as the structural answer to set inputs whose order carries no information).
- **Correspondence handling**: permutation invariance; the model sums element embeddings, so no element-to-element correspondence across sets is needed.
- **Pipeline relation**: not applicable (general method, no imaging pipeline).
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 3 (S2: 3572), DE 2; total 13.
- **Quality**: High. Read: abstract only.
- **Potential Use**: foundational definition of the permutation-invariance route.
- **Citation key**: Zaheer2017DeepSets

### Wagstaff, E., Fuchs, F. B., Engelcke, M., Posner, I., Osborne, M. A. (2019). On the Limitations of Representing Functions on Sets.
- **Type**: Conference paper
- **Evidence type**: proceedings (ICML 2019, per the arXiv comment; S2 pages 6487-6494); arXiv:1901.09006
- **Method**: theoretical analysis of sum-decomposition models with continuous mappings.
- **Key Findings**: The conjecture that latent dimension can stay fixed as set cardinality grows relies on highly discontinuous mappings. With continuous mappings, practical universal representation of set functions requires a latent dimension at least the maximum number of input elements.
- **Relevance**: States an expressivity limit of sum pooling that applies to any encoder of lesion, region or point sets of varying size.
- **Stance**: neutral (theory of the mechanism; it states a cost of the invariance route without taking a position on whether correspondence must be handled explicitly).
- **Correspondence handling**: permutation invariance; analyses the latent dimension that sum pooling needs.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 2 (S2: 201), DE 2; total 12.
- **Quality**: High. Read: abstract only.
- **Potential Use**: expressivity limits of invariant pooling.
- **Citation key**: Wagstaff2019Limitations

### Wagstaff, E., Fuchs, F. B., Engelcke, M., Osborne, M. A., Posner, I. (2022). Universal Approximation of Functions on Sets.
- **Type**: Journal article
- **Evidence type**: journal (Journal of Machine Learning Research 23, paper 151, pp. 1-56, per the JMLR page); arXiv:2107.01959
- **Method**: theoretical analysis of Deep Sets and of the Janossy pooling paradigm.
- **Key Findings**: Deep Sets is a universal approximator only if its latent space is sufficiently high-dimensional; one dimension fewer than necessary admits piecewise-affine functions on which Deep Sets does no better than a constant baseline in worst-case error. Deep Sets is identified as the most efficient instance of Janossy pooling, which the authors say encompasses most popular set-learning methods.
- **Relevance**: Sharpens the latent-dimension requirement for sum-decomposition encoders and places attention and other set encoders under one paradigm.
- **Stance**: neutral (theory).
- **Correspondence handling**: permutation invariance; analyses universality of invariant pooling.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 3, MR 3, RR 3, CC 2 (S2: 90), DE 2; total 13.
- **Quality**: High. Read: abstract and the JMLR bibliographic page.
- **Potential Use**: universality and its dimension requirement.
- **Citation key**: Wagstaff2022Universal

### Amir, T., Gortler, S. J., Avni, I., Ravina, R., Dym, N. (2023). Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem.
- **Type**: Conference paper
- **Evidence type**: proceedings (NeurIPS 2023, per the arXiv comment "NeurIPS 2023 camera-ready"); arXiv:2306.06529
- **Method**: theory; proves a finite witness theorem and derives injectivity, approximation and separation results.
- **Key Findings**: Moments of neural networks define injective multiset functions when an analytic non-polynomial activation is used, with a number of moments optimal up to a factor of two. Moments of piecewise-linear networks cannot be injective multiset functions, and moment-based multiset functions, even when injective, can never be bi-Lipschitz.
- **Relevance**: Shows which activation choices make a sum-pooled set encoder able to distinguish all multisets, which bears on encoding sets of lesions or regions without correspondence.
- **Stance**: neutral (theory).
- **Correspondence handling**: permutation invariance; characterises injectivity of sum-of-features (moment) pooling.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 2, CC 3 (S2: 47), DE 2; total 12.
- **Quality**: High. Read: abstract only.
- **Potential Use**: recent expressivity results; negative results for ReLU sum pooling.
- **Citation key**: Amir2023Injective

### Wang, P., Yang, S., Li, S., Wang, Z., Li, P. (2024). Polynomial Width is Sufficient for Set Representation with High-dimensional Features.
- **Type**: Conference paper
- **Evidence type**: proceedings (ICLR 2024, per the arXiv comment); arXiv:2307.04001
- **Method**: theory; two element-embedding layers (linear plus power activation, linear plus exponential activation) and bounds on latent dimension.
- **Key Findings**: A latent dimension polynomial in set size N and feature dimension D suffices for DeepSets to represent set functions with either embedding layer, with a lower bound for the power-activation layer; the results extend to permutation-equivariant functions and the complex field.
- **Relevance**: Relaxes earlier exponential or one-dimensional-feature analyses to the high-dimensional element features that lesion or region descriptors have.
- **Stance**: neutral (theory).
- **Correspondence handling**: permutation invariance; latent-dimension bounds for sum pooling.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 2, CC 2 (S2: 11), DE 2; total 11.
- **Quality**: Medium. Read: abstract only.
- **Potential Use**: recent bound for high-dimensional element features.
- **Citation key**: Wang2024PolynomialWidth

### C2. Attention-based and learned-seed set pooling

### Lee, J., Lee, Y., Kim, J., Kosiorek, A. R., Choi, S., Teh, Y. W. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Type**: Conference paper
- **Evidence type**: proceedings (ICML 2019, PMLR 97, pp. 3744-3753, per the PMLR page); arXiv:1810.00825
- **Method**: attention-based encoder-decoder set architecture with an inducing-point attention scheme.
- **Key Findings**: The Set Transformer models interactions among set elements with attention in both encoder and decoder. An attention scheme inspired by inducing-point methods from sparse Gaussian processes reduces self-attention cost from quadratic to linear in set size. The abstract lists multiple instance learning and 3D shape recognition among the target tasks.
- **Relevance**: The reference design for attention pooling over a set of elements with learned inducing points, used as a baseline by the medical set operators in this theme (Zare 2025).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; elements interact through attention, and pooling uses learned inducing points, so no cross-set correspondence is needed.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 3 (S2: 252 on the record returned; a low figure for this paper, not verified elsewhere), DE 2; total 13.
- **Quality**: High. Read: abstract and PMLR bibliographic page.
- **Potential Use**: attention and inducing-point pooling.
- **Citation key**: Lee2019SetTransformer

### C3. Point-cloud networks

### Qi, C. R., Su, H., Mo, K., Guibas, L. J. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper
- **Evidence type**: proceedings (CVPR 2017, pp. 77-85, DOI 10.1109/CVPR.2017.16 resolved via Crossref); arXiv:1612.00593
- **Method**: network that consumes raw point clouds with a symmetric aggregation; object classification, part segmentation and scene parsing benchmarks; theoretical analysis.
- **Key Findings**: PointNet directly consumes point clouds and respects permutation invariance of points, avoiding conversion to voxel grids or image collections, and performs on par with or better than the state of the art on the reported tasks. The authors analyse what the network learns and why it is robust to input perturbation and corruption.
- **Relevance**: The point-cloud encoder used or adapted by the medical point-cloud studies in this theme (Gutierrez-Becker 2018 compares against it; Chen 2024 and Vosylius 2020 build on the PointNet family).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance over points; inputs are not resampled to a common grid.
- **Pipeline relation**: not applicable (general method); in medical use it replaces voxelisation of a segmented structure.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 3 (S2: 19138), DE 3; total 14.
- **Quality**: High. Read: abstract only.
- **Potential Use**: foundational point-cloud encoder.
- **Citation key**: Qi2017PointNet

### Qi, C. R., Yi, L., Su, H., Guibas, L. J. (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Type**: Conference paper
- **Evidence type**: proceedings (NeurIPS 2017, per the S2 venue field, pp. 5099-5108); arXiv:1706.02413
- **Method**: hierarchical network applying PointNet recursively on a nested partition of the point set; multi-scale grouping layers for non-uniform density.
- **Key Findings**: PointNet does not capture local structure induced by the metric space; applying it recursively with metric distances learns local features at increasing scales, and density-adaptive layers combine scales. Results on 3D point-cloud benchmarks are reported as significantly better than the prior state of the art.
- **Relevance**: The hierarchical encoder that gave the best result in the neonatal cortical-surface study (Vosylius 2020).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance within local neighbourhoods and globally.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 3 (S2: 15613), DE 3; total 14.
- **Quality**: High. Read: abstract only.
- **Potential Use**: hierarchical point-cloud encoder.
- **Citation key**: Qi2017PointNetPP

### Wang, Y., Sun, Y., Liu, Z., Sarma, S. E., Bronstein, M. M., Solomon, J. M. (2019). Dynamic Graph CNN for Learning on Point Clouds.
- **Type**: Journal article
- **Evidence type**: journal (ACM Transactions on Graphics 38(5), pp. 1-12, DOI 10.1145/3326362 resolved via Crossref); arXiv:1801.07829
- **Method**: EdgeConv module acting on k-nearest-neighbour graphs recomputed in each layer; ModelNet40, ShapeNetPart and S3DIS benchmarks.
- **Key Findings**: EdgeConv incorporates local neighbourhood information, can be stacked to learn global shape properties, and its feature-space affinity captures semantic characteristics over long distances.
- **Relevance**: The graph-based point-cloud design in the theme scope; graph neighbourhoods are built per subject, so no shared graph across subjects is assumed.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; graphs are built dynamically per input from feature-space neighbours.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 3, MR 3, RR 2, CC 3 (S2: 8243), DE 3; total 14.
- **Quality**: High. Read: abstract only.
- **Potential Use**: graph-based point network.
- **Citation key**: Wang2019DGCNN

### Zhao, H., Jiang, L., Jia, J., Torr, P., Koltun, V. (2021). Point Transformer.
- **Type**: Conference paper
- **Evidence type**: proceedings (ICCV 2021, pp. 16239-16248, DOI 10.1109/ICCV48922.2021.01595 resolved via Crossref); arXiv:2012.09164
- **Method**: self-attention layers designed for point clouds; scene segmentation, part segmentation and object classification.
- **Key Findings**: The Point Transformer improves on prior work across the reported domains and tasks; on S3DIS Area 5 semantic segmentation it reaches 70.4% mIoU, 3.3 points above the strongest prior model.
- **Relevance**: The point-transformer design named in the theme scope; attention over points without a fixed ordering.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance through attention over points.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: JR 2, MR 3, RR 2, CC 1 (S2: 36 on the record returned for arXiv:2012.09164; this looks like a split Semantic Scholar record and was not verified elsewhere), DE 3; total 11.
- **Quality**: Medium. Read: abstract only.
- **Potential Use**: point transformer architecture.
- **Citation key**: Zhao2021PointTransformer

### C4. Multiple-instance learning

### Ilse, M., Tomczak, J. M., Welling, M. (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Conference paper
- **Evidence type**: proceedings (ICML 2018, PMLR 80, pp. 2127-2136, per the PMLR page); arXiv:1802.04712
- **Method**: MIL stated as learning the Bernoulli distribution of the bag label, with a neural permutation-invariant attention aggregation (and a gated variant); MIL benchmarks, an MNIST-bags dataset and two histopathology datasets.
- **Key Findings**: The attention-based aggregation performs comparably to the best MIL methods on benchmark datasets and outperforms other methods on MNIST-bags and two histopathology datasets while giving per-instance attention weights. The full text grounds the operator in the fundamental theorem of symmetric functions (stated after Zaheer et al.) and the PointNet approximation theorem.
- **Relevance**: The attention-MIL operator used by the lesion-set studies in this theme (Chen 2022 uses deep attention-based MIL; AMINN tests attention pooling against average and max pooling).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; a weighted average with learned attention weights over instances.
- **Pipeline relation**: removes the need for instance-level labels (only bag labels are used); no imaging pipeline step is replaced in the abstract.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 3 (S2: 2957), DE 2; total 13.
- **Quality**: High. Read: abstract and Sections 1 to 2 of the arXiv full text.
- **Potential Use**: attention-MIL operator and its link to set-function theory.
- **Citation key**: Ilse2018AttentionMIL

### Campanella, G., Hanna, M. G., Geneslaw, L., Miraflor, A., Werneck Krauss Silva, V., Busam, K. J., Brogi, E., Reuter, V. E., Klimstra, D. S., Fuchs, T. J. (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
- **Type**: Journal article
- **Evidence type**: journal (Nature Medicine 25(8), pp. 1301-1309, DOI 10.1038/s41591-019-0508-1 resolved via Crossref)
- **Method**: MIL-based deep learning trained only on reported diagnoses; 44,732 whole slide images from 15,187 patients without data curation.
- **Key Findings**: On prostate cancer, basal cell carcinoma and breast cancer metastases to axillary lymph nodes, the AUC exceeded 0.98 for all cancer types. Clinical use would let pathologists exclude 65-75% of slides while keeping 100% sensitivity.
- **Relevance**: Shows bag-level MIL at clinical scale with slide labels only, the weak-supervision setting that subject-level prediction from unaligned sets shares.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; a slide is treated as a bag of tiles with no correspondence across slides.
- **Pipeline relation**: removes pixel-wise manual annotation (segmentation labels) from training.
- **Quick-assessment score**: JR 3, MR 3, RR 2, CC 3 (S2: 2909), DE 3; total 14.
- **Quality**: High. Read: abstract only.
- **Potential Use**: MIL at scale without segmentation labels.
- **Citation key**: Campanella2019Clinical

### Lu, M. Y., Williamson, D. F. K., Chen, T. Y., Chen, R. J., Barbieri, M., Mahmood, F. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Type**: Journal article
- **Evidence type**: journal (Nature Biomedical Engineering 5(6), pp. 555-570, DOI 10.1038/s41551-020-00682-w resolved via Crossref); arXiv:2004.09666
- **Method**: CLAM, clustering-constrained attention MIL, using slide-level labels only; three analyses including independent test cohorts, cell phone microscopy images and biopsies.
- **Key Findings**: CLAM uses attention to identify sub-regions of high diagnostic value and instance-level clustering over those regions to refine the feature space. The authors report data efficiency, performance above standard weakly supervised classification, interpretability, and adaptability to independent cohorts.
- **Relevance**: Attention MIL with an instance-level auxiliary objective; a design that a lesion-set encoder could adopt.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; attention pooling over tile embeddings.
- **Pipeline relation**: removes manual annotation of whole slide images.
- **Quick-assessment score**: JR 3, MR 3, RR 2, CC 3 (S2: 2544), DE 3; total 14.
- **Quality**: High. Read: abstract only.
- **Potential Use**: attention MIL in medical imaging.
- **Citation key**: Lu2021CLAM

### Shao, Z., Bian, H., Chen, Y., Wang, Y., Zhang, J., Ji, X., Zhang, Y. (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
- **Type**: Conference paper
- **Evidence type**: proceedings (NeurIPS 2021, per the S2 venue field); arXiv:2106.00908
- **Method**: correlated-MIL framework with a convergence proof, implemented as a Transformer that uses morphological and spatial information; CAMELYON16, TCGA-NSCLC and TCGA-RCC.
- **Key Findings**: The abstract argues that MIL methods built on the independent and identically distributed instance assumption ignore correlation among instances. TransMIL reports test AUC up to 93.09% on CAMELYON16 and 96.03% and 98.82% on TCGA-NSCLC and TCGA-RCC subtyping.
- **Relevance**: Argues that instance interactions and spatial information matter beyond independent pooling, which bears on whether a set encoder of lesions should model relations among elements.
- **Stance**: neutral (it handles the bag with instance correlation and spatial information rather than pure invariance; the abstract does not state the cross-subject correspondence position).
- **Correspondence handling**: permutation invariance at the bag level with added within-slide spatial information; the abstract does not specify how the spatial information is encoded.
- **Pipeline relation**: removes instance-level annotation; no imaging step is replaced in the abstract.
- **Quick-assessment score**: JR 2, MR 2, RR 2, CC 3 (S2: 1563), DE 2; total 11.
- **Quality**: Medium. Read: abstract only.
- **Potential Use**: correlated MIL versus independent pooling.
- **Citation key**: Shao2021TransMIL

### C5. Set and point-cloud encoders on medical data

### Chen, J., Zeng, H., Zhang, C., Shi, Z., Dekker, A., Wee, L., Bermejo, I. (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics.
- **Type**: Journal article
- **Evidence type**: journal (Medical Physics 49(5), pp. 3134-3143, DOI 10.1002/mp.15539 resolved via Crossref); arXiv:2104.14655
- **Method**: patient-level lung cancer diagnosis as MIL: each patient is a bag of nodules described by pyRadiomics features from the LIDC-IDRI nodule masks; deep attention MIL; a bag simulation method for a small imbalanced dataset of 110 patients (82 cancer, 28 non-cancer); bags fixed to 12 instances by duplicating nodules; 20 repeated runs.
- **Key Findings**: Mean accuracy 0.807 (SEM 0.069), recall 0.870, positive predictive value 0.928, negative predictive value 0.591 and AUC 0.842 (SEM 0.074), above the other MIL methods compared; the oversampling strategy improved performance; attention weights indicate each nodule's importance. The discussion states the method depends on nodule detection and segmentation.
- **Relevance**: A direct instance of subject-level prediction from a variable-size set of lesions without cross-patient lesion correspondence.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; attention pooling over a patient's nodules.
- **Pipeline relation**: builds on lesion segmentation (dataset nodule masks) and radiomics (pyRadiomics features per nodule); replaces single-nodule classification with patient-level aggregation.
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 2 (S2: 43), DE 2; total 11.
- **Quality**: Medium. Read: abstract and the Methods, Results and Discussion sections of the arXiv full text.
- **Potential Use**: lesion-set MIL on radiomics features; small-sample limitations.
- **Citation key**: Chen2022LungMIL

### Yang, J., Deng, H., Huang, X., Ni, B., Xu, Y. (2020). Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers.
- **Type**: Conference paper
- **Evidence type**: proceedings (IEEE ISBI 2020, pp. 1875-1878, DOI 10.1109/ISBI45749.2020.9098722 resolved via Crossref); arXiv:2004.05640
- **Method**: NoduleSAT, a 3D CNN followed by a set attention transformer over all nodules or candidates of one patient; LUNA16 false positive reduction and LIDC-IDRI malignancy classification.
- **Key Findings**: Treating a patient's nodules as a set and learning relations among them with self-attention, in place of pooling-based MIL aggregation, improved false positive reduction and malignancy classification over the solitary-nodule baseline. The full text reports that 74.0% of LIDC-IDRI patients have multiple nodules (1 to 23 per patient) and that predictions are made per candidate with the set as context.
- **Relevance**: Lesion-set encoder that models relations among lesions; the outputs are lesion-level with patient-set context, not a single patient label.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; set self-attention over a patient's nodules, no correspondence across patients.
- **Pipeline relation**: builds on nodule candidate detection (candidates scored by a 3D DenseNet baseline); replaces solitary-nodule analysis and pooling-based aggregation.
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 2 (S2: 33), DE 2; total 11.
- **Quality**: Medium. Read: abstract and Sections 2 to 3 of the arXiv full text.
- **Potential Use**: relational lesion-set encoder.
- **Citation key**: Yang2020NoduleSAT

### Chen, J., Cheung, H. M. C., Milot, L., Martel, A. L. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper
- **Evidence type**: proceedings (MICCAI 2021, LNCS, pp. 752-761, DOI 10.1007/978-3-030-87240-3_72 resolved via Crossref); arXiv:2012.06875
- **Method**: autoencoder jointly trained with a multiple instance network that aggregates radiomic features of all lesions of a patient; two-step feature normalisation; 108 colorectal liver metastases patients, of whom 50 multifocal (2 to 17 lesions, 181 lesions); 3-year survival.
- **Key Findings**: AMINN reached AUC 0.70, 11.4% above the best baseline (LASSO logistic regression on the largest tumour); a unifocal AMINN using only the largest tumour performed like the baselines. In the full text, average pooling gave the best result and attention pooling did not outperform the other pooling functions, which the authors attribute to limited data.
- **Relevance**: Lesion-set prediction of a patient outcome, with a direct comparison of invariant pooling functions on a small cohort.
- **Stance**: supports (using all lesions as a set improved outcome prediction over the largest-lesion convention).
- **Correspondence handling**: permutation invariance; permutation-invariant MIL pooling over lesion representations.
- **Pipeline relation**: builds on manual lesion delineation (slice by slice by a radiologist) and radiomics (pyradiomics); replaces the largest-lesion selection step.
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 1 (S2: 17), DE 2; total 10.
- **Quality**: Medium. Read: abstract and the Methods and Results sections of the arXiv full text.
- **Potential Use**: lesion-set pooling choice in small cohorts.
- **Citation key**: Chen2021AMINN

### Zare, S., Vo, H. Q., Altini, N., Bevilacqua, V., Rossini, M., Pesce, F., Gesualdo, L., Turkevi-Nagy, S., Becker, J. U., Mohan, C., Van Nguyen, H. (2025). Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology.
- **Type**: Journal article
- **Evidence type**: journal (Kidney360 6(3), pp. 441-450, DOI 10.34067/KID.0000000668 resolved via Crossref)
- **Method**: PICASO, a Transformer-based set operator with static histopathologic memory vectors updated by input embeddings; sets of glomerular crops; active crescent detection in IgA nephropathy (6206 crops, three institutes) and case-level antibody-mediated rejection classification (1655 crops from 89 biopsies); compared with DeepSet, Set Transformer, DeepSet++ and Set Transformer++.
- **Key Findings**: AUROC 0.99 (95% CI 0.98 to 0.99) internal and 0.96 (95% CI 0.95 to 0.98) external for active crescent detection, significantly above the other set operators (P < 0.001), and AUROC 0.97 (95% CI 0.90 to 1.0, P = 0.02) for case-level rejection classification.
- **Relevance**: A recent region-set (glomerulus-set) encoder for case-level prediction, benchmarked against the canonical set encoders.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; attention-based set operator over crops.
- **Pipeline relation**: builds on extraction of glomerular crops; the abstract does not state how the crops are obtained.
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 2 (S2: 3), DE 2; total 11.
- **Quality**: Medium. Read: abstract only (PubMed).
- **Potential Use**: recent region-set encoder versus Deep Sets and Set Transformer.
- **Citation key**: Zare2025PICASO

### Gutierrez-Becker, B., Wachinger, C. (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy.
- **Type**: Conference paper
- **Evidence type**: proceedings (MICCAI 2018, LNCS, pp. 523-531, DOI 10.1007/978-3-030-00931-1_60 resolved via Crossref); arXiv:1806.01069
- **Method**: MSPNet, a multi-branch PointNet-style network with transformation networks mapping each structure's point cloud to a canonical space; point clouds sampled from FreeSurfer segmentations of left and right hippocampus and lateral ventricles (512 points per structure); ADNI, 7,974 images (2,423 HC, 978 AD, 4,625 MCI); AD and MCI classification and age regression; compared with PointNet and BrainPrint spectral descriptors.
- **Key Findings**: The network operates on raw point clouds without mesh processing or point correspondences. F1 was 0.61 for HC versus MCI and 0.80 for HC versus AD, against 0.59 and 0.78 for PointNet and 0.57 and 0.78 for BrainPrint. For age on healthy controls MSPNet outperformed BrainPrint and PointNet; on all subjects MSPNet and PointNet were comparable and both outperformed BrainPrint.
- **Relevance**: Subject-level prediction from unaligned point sets of segmented brain structures, with an explicit statement that no correspondence is needed.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance plus a learned transformation to a canonical space (T-Net); no point correspondence and no registration to a template.
- **Pipeline relation**: builds on structure segmentation (FreeSurfer); removes mesh processing and point-correspondence establishment; replaces hand-crafted shape descriptors.
- **Quick-assessment score**: JR 2, MR 3, RR 3, CC 2 (S2: 23), DE 3; total 13.
- **Quality**: High. Read: abstract, Sections 2 and 3 of the arXiv full text.
- **Potential Use**: point-cloud neuroanatomy without correspondence.
- **Citation key**: GutierrezBecker2018MSPNet

### Vosylius, V., Wang, A., Waters, C., Zakharov, A., Ward, F., Le Folgoc, L., Cupitt, J., Makropoulos, A., Schuh, A., Rueckert, D., Alansary, A. (2020). Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface.
- **Type**: Conference paper (workshop)
- **Evidence type**: proceedings (UNSURE/GRAIL workshops at MICCAI 2020, LNCS, pp. 174-186, DOI 10.1007/978-3-030-60365-6_17 resolved via Crossref); arXiv:2008.06098
- **Method**: comparison of MeshCNN, PointNet++, GraphCNN and a 3D CNN volumetric benchmark for post-menstrual age prediction from the neonatal white matter cortical surface; dHCP, 727 scans from 650 subjects, 27 to 45 weeks.
- **Key Findings**: All geometric models had mean absolute error below one week. PointNet++ with local cortical features (thickness, curvature, sulcal depth) was best (validation MAE 0.701, test MAE 0.6211 weeks), better than the 3D CNN on the test set (0.62 against 0.82 weeks). The full text states that surfaces were used in their native coordinates.
- **Relevance**: Cortical-surface point-cloud regression of a subject-level outcome without registration to a template, compared directly with mesh, graph and volumetric representations.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; surfaces in native coordinates, no template registration stated.
- **Pipeline relation**: builds on the dHCP structural pipeline for surface extraction and cortical features; the volumetric benchmark requires cortical grey-matter segmentation.
- **Quick-assessment score**: JR 1, MR 2, RR 3, CC 1 (S2: 17), DE 3; total 10.
- **Quality**: Medium. Read: abstract and Sections 4 and 5 of the arXiv full text.
- **Potential Use**: cortical surfaces as point clouds; comparison with volumetric CNN.
- **Citation key**: Vosylius2020NeonatalSurface

### Sarasua, I., Polsterl, S., Wachinger, C. (2022). Hippocampal representations for deep learning on Alzheimer's disease.
- **Type**: Journal article
- **Evidence type**: journal (Scientific Reports 12, article 8619, DOI 10.1038/s41598-022-12533-6 resolved via Crossref)
- **Method**: comparison of five hippocampal representations with tailored architectures, from raw images to meshes and point clouds; AD diagnosis and time-to-dementia prediction with an independent test set; interpretability assessment.
- **Key Findings**: The choice of hippocampal representation for predicting Alzheimer's disease with deep learning affects both performance and ease of interpretation.
- **Relevance**: One of the few included sources that compares point-cloud input with image-based input for the same subject-level task.
- **Stance**: neutral (the abstract reports that representation matters without favouring one correspondence strategy).
- **Correspondence handling**: permutation invariance for the point-cloud representation; the abstract does not state the alignment or registration used by the image and mesh representations.
- **Pipeline relation**: builds on hippocampus segmentation for the geometric representations (implied by mesh and point-cloud inputs; the abstract does not name the tool).
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 2 (S2: 17), DE 3; total 12.
- **Quality**: High. Read: abstract only (PMC full text was not reachable).
- **Potential Use**: representation choice for one structure.
- **Citation key**: Sarasua2022Hippocampal

### Chen, Y., Zekelman, L. R., Zhang, C., Xue, T., Song, Y., Makris, N., Rathi, Y., Golby, A. J., Cai, W., Zhang, F., O'Donnell, L. J. (2024). TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance.
- **Type**: Journal article
- **Evidence type**: journal (Medical Image Analysis 94, article 103120, DOI 10.1016/j.media.2024.103120 resolved via Crossref); arXiv:2307.03982
- **Method**: point-cloud regression from dMRI tractography with pointwise microstructure; Paired-Siamese Regression loss; Critical Region Localization; 20 association tracts from 806 Human Connectome Project Young Adult subjects; two language assessments.
- **Key Findings**: Using all points of a tract without averaging or binning along the streamline, TractGeoNet outperformed several regression models used to predict cognitive performance from neuroimaging features. The left arcuate fasciculus was the most predictive tract, and critical regions were consistent across subjects and independently trained models.
- **Relevance**: Subject-level regression from unaligned point sets, journal extension of the MICCAI 2022 study by the same group (excluded below as the earlier version).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; each tract is a point cloud with per-point features.
- **Pipeline relation**: builds on tractography and tract identification; removes the along-tract averaging or binning step of tractometry.
- **Quick-assessment score**: JR 3, MR 3, RR 3, CC 2 (S2: 17 for the arXiv record), DE 3; total 14.
- **Quality**: High. Read: abstract only (PubMed and arXiv).
- **Potential Use**: point-cloud subject-level regression in neuroimaging.
- **Citation key**: Chen2024TractGeoNet

### Beetz, M., Banerjee, A., Li, L., Camps, J., Rodriguez, B., Grau, V. (2025). 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis.
- **Type**: Journal article
- **Evidence type**: journal (Computerized Medical Imaging and Graphics 124, article 102587, DOI 10.1016/j.compmedimag.2025.102587 resolved via Crossref)
- **Method**: multi-class variational point cloud autoencoder (Point VAE) on high-resolution point clouds of multi-class 3D cardiac anatomy; over 10,000 subjects for reconstruction; latent space used for prevalent and incident myocardial infarction prediction and survival analysis.
- **Key Findings**: Mean Chamfer distances between input and reconstructed point clouds were below the pixel resolution of the source images. The latent space outperformed clinical benchmarks by 13% and 16% AUROC for prevalent MI detection and incident MI prediction and by 10% in Harrell's concordance index for MI survival.
- **Relevance**: A recent point-cloud representation of an organ used for subject-level outcome prediction, where the encoder output is the subject feature.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance (point-cloud encoder); the abstract does not state how point order or cross-subject alignment is handled.
- **Pipeline relation**: builds on image-derived anatomical point clouds (the abstract compares reconstruction error with the resolution of the underlying image acquisitions); replaces clinical shape metrics as predictors.
- **Quick-assessment score**: JR 3, MR 2, RR 2, CC 2 (S2: 8), DE 3; total 12.
- **Quality**: High. Read: abstract only (PubMed).
- **Potential Use**: recent organ-level point-cloud predictor.
- **Citation key**: Beetz2025PointVAE

### Jia, J., Yu, B., Mody, P., Ninaber, M. K., Schouffoer, A. A., de Vries-Bouwstra, J. K., Kroft, L. J. M., Staring, M., Stoel, B. C. (2024). Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT.
- **Type**: Journal article
- **Evidence type**: journal (Computers in Biology and Medicine 182, article 109192, DOI 10.1016/j.compbiomed.2024.109192 resolved via Crossref)
- **Method**: point cloud network (PNN-Vessel) and graph network (GNN-Vessel) on pulmonary vessel centerlines from chest CT in systemic sclerosis, compared with CNNs on down-sampled CT and extracted vessels; combination by multiple variable step-wise regression.
- **Key Findings**: PNN-Vessel and GNN-Vessel outperformed CNN-Vessel by 14% and 4% in averaged ICC over four PFT measures, with 30% and 7% of its training time and 7% and 0.7% of its parameters. The combination of CNN-CT, PNN-Vessel and GNN-Vessel gave the best estimates (ICC 0.748, 0.742, 0.836 and 0.835).
- **Relevance**: Subject-level regression from an unaligned point set derived from a segmented structure, compared head-to-head with grid-based CNNs that need down-sampling.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance (point cloud network); the graph network works on per-subject vessel graphs.
- **Pipeline relation**: builds on vessel extraction and centreline computation; removes image down-sampling required by the CNN baselines.
- **Quick-assessment score**: JR 3, MR 2, RR 3, CC 1 (S2: 6), DE 2; total 11.
- **Quality**: Medium. Read: abstract only (PubMed).
- **Potential Use**: point cloud versus grid representation for a subject-level target.
- **Citation key**: Jia2024PFT

### van Dijk, R., Arevalo, J., Babadi, M., Carpenter, A. E., Singh, S. (2024). Capturing cell heterogeneity in representations of cell populations for image-based profiling using contrastive learning.
- **Type**: Journal article
- **Evidence type**: journal (PLOS Computational Biology 20(11), e1012547, DOI 10.1371/journal.pcbi.1012547 resolved via Crossref)
- **Method**: CytoSummaryNet, a Deep Sets-based aggregator of single-cell feature profiles trained with self-supervised contrastive learning in a multiple-instance framework, using perturbation labels only.
- **Key Findings**: CytoSummaryNet improved mechanism-of-action prediction by 30-68% in mean average precision over average profiling on a public dataset. Interpretability analysis suggests it downweights small mitotic cells or cells with debris and prioritises large uncrowded cells.
- **Relevance**: A cell-set encoder that replaces averaging over a population whose cells have no correspondence across samples.
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; Deep Sets aggregation over cells.
- **Pipeline relation**: builds on single-cell feature extraction from images; replaces the population-averaging step of image-based profiling.
- **Quick-assessment score**: JR 3, MR 2, RR 2, CC 2 (S2: 15), DE 3; total 12.
- **Quality**: High. Read: abstract only (PubMed).
- **Potential Use**: cell-set encoders versus mean aggregation.
- **Citation key**: vanDijk2024CytoSummaryNet

## Literature Matrix

Columns: C1 theory of invariant set functions; C2 attention or learned-seed pooling; C3 point-cloud networks; C4 multiple-instance learning; C5 medical set or point-cloud application. "main" marks the sub-theme a source is primarily about; "x" marks a secondary sub-theme.

| Source | C1 Theory | C2 Attention pooling | C3 Point clouds | C4 MIL | C5 Medical | Method | Quality |
|---|---|---|---|---|---|---|---|
| Zaheer2017DeepSets | main | | x | | | Theory and architecture | High |
| Wagstaff2019Limitations | main | | | | | Theory | High |
| Wagstaff2022Universal | main | x | | | | Theory | High |
| Amir2023Injective | main | | | | | Theory | High |
| Wang2024PolynomialWidth | main | | | | | Theory | Medium |
| Lee2019SetTransformer | x | main | | x | | Architecture | High |
| Qi2017PointNet | x | | main | | | Architecture and theory | High |
| Qi2017PointNetPP | | | main | | | Architecture | High |
| Wang2019DGCNN | | | main | | | Architecture | High |
| Zhao2021PointTransformer | | x | main | | | Architecture | Medium |
| Ilse2018AttentionMIL | x | x | | main | | Architecture and theory | High |
| Campanella2019Clinical | | | | main | x | Computational evaluation | High |
| Lu2021CLAM | | x | | main | x | Architecture and evaluation | High |
| Shao2021TransMIL | | x | | main | x | Architecture | Medium |
| Chen2022LungMIL | | x | | x | main | Computational evaluation | Medium |
| Yang2020NoduleSAT | | x | | x | main | Architecture | Medium |
| Chen2021AMINN | | x | | x | main | Architecture and evaluation | Medium |
| Zare2025PICASO | | x | | x | main | Architecture and evaluation | Medium |
| GutierrezBecker2018MSPNet | | | x | | main | Architecture and evaluation | High |
| Vosylius2020NeonatalSurface | | | x | | main | Comparative evaluation | Medium |
| Sarasua2022Hippocampal | | | x | | main | Comparative evaluation | High |
| Chen2024TractGeoNet | | | x | | main | Architecture and evaluation | High |
| Beetz2025PointVAE | | | x | | main | Architecture and evaluation | High |
| Jia2024PFT | | | x | | main | Comparative evaluation | Medium |
| vanDijk2024CytoSummaryNet | x | | | x | main | Architecture and evaluation | High |

Counts per column (main plus x): C1 9, C2 10, C3 11, C4 10, C5 14.

## Identified Gaps

1. Expressivity theory is not used in the medical set studies. Wagstaff2019Limitations and Wagstaff2022Universal tie universality of sum pooling to a latent dimension at least the maximum set size, Amir2023Injective shows that piecewise-linear moment pooling is not injective, and Wang2024PolynomialWidth gives polynomial bounds for high-dimensional features. None of the medical sources read (Chen2022LungMIL, Chen2021AMINN, Yang2020NoduleSAT, Zare2025PICASO, vanDijk2024CytoSummaryNet) reports its latent dimension relative to set size or its activation choice in these terms, so whether their encoders can separate all lesion or cell sets of the observed sizes is untested.
2. Lesion-set studies are small and depend on manual delineation and radiomics. Chen2021AMINN uses 50 multifocal patients with radiologist-delineated lesions and pyradiomics features, and Chen2022LungMIL uses 110 patients with dataset nodule masks and pyRadiomics features and states its dependence on segmentation; neither learns the lesion encoder end-to-end from images with automatic segmentation. In Chen2021AMINN, attention pooling did not outperform average pooling, which the authors attribute to limited data, and Chen2022LungMIL fixes bags to 12 instances by duplicating nodules, which changes what a sum or mean pool computes.
3. Head-to-head comparison with registration-based correspondence is rare. Gutierrez-Becker2018MSPNet avoids correspondence with a learned canonical transform and compares with PointNet and spectral descriptors; Vosylius2020NeonatalSurface uses native coordinates and compares with a volumetric CNN; Jia2024PFT compares with down-sampled CNNs. Among the sources read, only Sarasua2022Hippocampal compares point-cloud input with image input for the same task, and its abstract does not state the registration used. No included source compares a permutation-invariant encoder with a registered-template or atlas-based predictor on the same cohort.
4. Spatial relations among set elements across subjects are handled inconsistently. Shao2021TransMIL argues against the independent-instance assumption and adds spatial information, Yang2020NoduleSAT models relations among nodules with self-attention, and Gutierrez-Becker2018MSPNet maps each structure to a canonical space before pooling; pure sum or attention pooling (Zaheer2017DeepSets, Ilse2018AttentionMIL) discards element positions. No included source analyses invariance to element order together with invariance to subject-specific pose or position for medical sets.
5. Recent subject-level point-cloud work is concentrated in neuroimaging and cardiac shape and reports single-cohort results. Chen2024TractGeoNet (806 HCP subjects), Beetz2025PointVAE and Vosylius2020NeonatalSurface each evaluate on one study population, and external validation appears only in the pathology set studies (Zare2025PICASO, Lu2021CLAM).

## Excluded at Full-Text Assessment

| Source | Identifier | Reason |
|---|---|---|
| Chen, Y. et al. (2022). White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning. MICCAI 2022, LNCS, pp. 174-184. | DOI 10.1007/978-3-031-16431-6_17; arXiv:2207.02402 | Earlier conference version of the same method line by the same group; Chen2024TractGeoNet extends it from the arcuate fasciculus to 20 tracts on the same 806-subject HCP cohort and is included instead. |
| Han, Z. et al. (2020). Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning. IEEE Transactions on Medical Imaging 39(8), pp. 2584-2594. | DOI 10.1109/TMI.2020.2996256 | Its bag is a set of 3D instances generated from one chest CT volume, with attention pooling as in Ilse2018AttentionMIL; the abstract adds no mechanism for elements without correspondence beyond the included MIL sources. |
| Xie, J., Tong, G. (2025). Advances in Set Function Learning: A Survey of Techniques and Applications. ACM Computing Surveys 57(7), pp. 1-37. | DOI 10.1145/3715905; arXiv:2501.14991 | Secondary survey; the primary sources it covers (DeepSets and Set Transformer based methods, point cloud processing) are included directly. |

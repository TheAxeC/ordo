## Literature Search Report

Research question (settings.md): which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

This report merges the four strand reports of the run (`strand-A.md` to `strand-D.md`) and their bibliographies into one set of 270 sources. The bibliography is `refs.bib` in this folder. Every citation below is a key in that file. The review serves as the related-work basis of a later method paper, whose name is [GAP: the name or working title of the paper the review serves].

Evidence profile: `cs_ml`, as settings.md states. Preprints count as peer-reviewed equivalent at the publication-type node. The relevance, methodology and predatory gates were applied by each strand to every source. The materials in hand are none, so no corpus was pre-screened and no PRE-SCREENED block exists. Each strand ran the 4-layer progressive strategy.

### Search Strategy

All four strands searched on 2026-11-20 through public APIs. The inclusion window is 2013 to 2026, with foundational works admitted from any year. The language is English. Inclusion criteria (a) to (d) and exclusion criteria (e) to (i) of the settings.md Review design row were applied by every strand.

Databases named in the Sources row that no strand searched: Scopus, Web of Science, IEEE Xplore and the ACM Digital Library were not searched, since the run holds no subscription or API key for them. Items from IEEE and ACM venues were reached through OpenAlex, Semantic Scholar and PubMed, which index them. DBLP was blocked: it answered every API request from strands A, B and C with a bot-check page, so no DBLP count exists. Strand D lists DBLP among the indexes it reached through `the lookup script`, and reports no DBLP hit count.

#### Strand A: tensor PLS, tensor regression and decompositions with an unaligned mode

Databases: OpenAlex (`title_and_abstract.search` with a date filter), Semantic Scholar (bulk search with a year filter), arXiv (`abs:` search with `submittedDate`), PubMed (`[tiab]` with `pdat` dates). Europe PMC (`ABSTRACT:` with `PUB_YEAR`) was added in the currency round only. Main search 2013 to 2026; currency round 2023 to 2026.

Main search queries, as strand A records them:

- Q1, tensor PLS: `"multilinear partial least squares" OR "N-PLS" OR "N-way partial least squares" OR "higher-order partial least squares" OR "tensor partial least squares" OR "multiway partial least squares"`.
- Q2, tensor regression: `"tensor regression" OR "Tucker regression" OR "CP regression" OR "tensor-on-tensor regression" OR "tensor response regression" OR "generalized linear tensor regression"`. The arXiv and PubMed forms omit the last term.
- Q3, decompositions with an unaligned mode: `"PARAFAC2" OR "irregular tensor" OR "shift-invariant CP" OR "shifted CP" OR "warped CP" OR "coupled matrix and tensor factorization" OR "coupled matrix tensor factorization"`. "warped CP" is in the OpenAlex and Semantic Scholar forms only.
- Q4, imaging use of Q1 and Q2: the Q1 and Q2 terms AND (`neuroimaging OR MRI OR fMRI OR EEG OR "brain imaging" OR "medical imaging"`).
- Q5, supervised use of Q3: the PARAFAC2, irregular tensor, shift-invariant CP, shifted CP and CMTF terms AND (`supervised OR classification OR prediction OR regression OR outcome`).

| Query | OpenAlex | Semantic Scholar | arXiv | PubMed | Total |
|---|---|---|---|---|---|
| Q1 | 340 | 234 | 11 | 85 | 670 |
| Q2 | 370 | 318 | 101 | 55 | 844 |
| Q3 | 334 | 308 | 59 | 90 | 791 |
| Q4 | 78 | 64 | 23 | 21 | 186 |
| Q5 | 69 | 64 | 5 | 16 | 154 |
| Total | 1191 | 988 | 199 | 267 | 2645 |

Layer 2 (backward chaining) read the reference lists of six core papers (Roald 2022, MULTIPAR, Lock 2018, CS-SKPD, SPARTan, Kuang 2015) and added 10 records. Layer 3 (forward tracking from 2022) collected 543 works citing five anchors and added 1 record. Layer 4 ran five natural-language queries through the Semantic Scholar relevance search (125 results) and added none.

Currency round (Layer 5, 2023 to 2026), as strand A records it:

- Q6: (`"tensor regression" OR "Tucker regression" OR "tensor-on-tensor" OR "tensor response regression" OR "tensor partial least squares" OR "higher-order partial least squares" OR "multilinear partial least squares"`) AND (`neuroimaging OR MRI OR fMRI OR EEG OR "medical imaging" OR brain`).
- Q7: `"PARAFAC2" OR "irregular tensor" OR "ragged tensor" OR "shift-invariant CP" OR "shifted CP" OR "shift-invariant tensor" OR "misaligned tensor"`.
- Q8: (`"tensor regression" OR "tensor decomposition" OR "tensor factorization" OR "tensor classification"`) AND (`"point cloud" OR "unstructured mesh" OR "irregular grid" OR misalignment OR misregistration OR "registration-free"`).

| Query | OpenAlex | Semantic Scholar | arXiv | PubMed | Europe PMC | Total |
|---|---|---|---|---|---|---|
| Q6 | 42 | 39 | 20 | 29 | 21 | 151 |
| Q7 | 113 | 74 | 24 | 15 | 26 | 252 |
| Q8 | 29 | 16 | 8 | 1 | 2 | 56 |
| Total | 184 | 129 | 52 | 45 | 49 | 459 |

A check round after Layer 5 ran four semantic queries through Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed (142 result lines), with forward tracking of four new sources. It added 3 sources, 3.4 percent of the set.

#### Strand B: entropic and unbalanced transport, Gromov-Wasserstein, fused GW, barycenters, linearized and sliced embeddings, learned templates

Databases: OpenAlex (`title_and_abstract.search`, `publication_year:2013-2026`, every page retrieved) and arXiv (`abs:` queries, `submittedDate:[201301010000 TO 202612312359]`, every page retrieved). Semantic Scholar returned HTTP 429 to every Layer 4 request, so Layer 4 ran on the OpenAlex relevance search. Single Semantic Scholar lookups later in the run gave abstracts and venue checks. DBLP was blocked, and venues were found through the PMLR volume indexes and the NeurIPS proceedings listings.

| Query | String | OpenAlex | arXiv |
|---|---|---|---|
| B1 | `"Sinkhorn" AND "optimal transport" AND (classification OR embedding OR kernel OR learning)` | 345 | 196 |
| B2 | `"unbalanced optimal transport" OR "semi-relaxed optimal transport" OR "semi-relaxed Gromov-Wasserstein"` | 365 | 175 |
| B3 | `("linear optimal transport" OR "sliced Wasserstein") AND (embedding OR kernel OR classification)` | 163 | 76 |
| B4 | `"Gromov-Wasserstein"` | 540 | 307 |
| B5 | `"fused Gromov-Wasserstein"` | 121 | 58 |
| B6 | `"Wasserstein barycenter" OR "Wasserstein barycenters" OR "Gromov-Wasserstein barycenter"` | 530 | 315 |
| B7 | `("Gromov-Wasserstein" OR "optimal transport") AND (dictionary OR template OR templates) AND (graph OR graphs OR "point cloud")` | 35 | 14 |
| Total | | 2099 | 1141 |

The arXiv strings are the OpenAlex strings with an `abs:` prefix on each term. Layer 2 chained the references of four seeds (TFGW, OGDL, FGW and Sinkhorn distances). Layer 3 listed works citing TFGW, OGDL and FGW from 2023 on (164 records, in two passes). Layer 4 used five OpenAlex relevance queries, top 50 each:

| Query | String | Index count |
|---|---|---|
| S1 | optimal transport learned templates graph classification | 5973 |
| S2 | Wasserstein embedding reference measure fixed-length representation sets classification | 3735 |
| S3 | Gromov-Wasserstein alignment across subjects brain cortical | 84 |
| S4 | optimal transport kernel embedding feature aggregation sets of features | 9610 |
| S5 | fused Gromov-Wasserstein barycenter graph dictionary supervised | 36 |

Two currency rounds targeted 2022 to 2026 (15 and 5 candidates screened). Title searches made while re-screening the sources excluded under (g) found two more candidates (Gachon et al. and Ma et al. 2020).

#### Strand C: permutation-invariant set encoders and registration-free transport-based fusion in medical imaging

Databases: arXiv (export API; no date filter, so the window was applied at screening), PubMed (E-utilities, `2013:2026[dp]`), OpenAlex (`title_and_abstract.search`, `from_publication_date:2013-01-01`) and Semantic Scholar (bulk search, `year=2013-2026`). Chaining used OpenAlex reference and citing-work lists. No peer-review filter was used.

| Tag | Index | Query string | Hits |
|---|---|---|---|
| A1 | arXiv | `abs:"permutation invariant" AND (abs:"set" OR abs:"point cloud") AND (abs:pooling OR abs:"set function" OR abs:encoder)` | 124 |
| A2 | arXiv | `(abs:"sliced Wasserstein embedding" OR abs:"optimal transport kernel embedding" OR abs:"Janossy pooling" OR abs:"induced point" OR abs:"set transformer")` | 337 |
| A3 | arXiv | `(abs:"optimal transport" OR abs:"Wasserstein") AND (abs:"set embedding" OR abs:"pooling" OR abs:"set representation" OR abs:"permutation invariant") AND (cat:cs.LG OR cat:stat.ML)` | 60 |
| A4 | arXiv | `(abs:"multiple instance learning") AND (abs:attention OR abs:pooling) AND (abs:permutation OR abs:"set") AND (cat:cs.LG OR cat:stat.ML OR cat:cs.CV)` | 78 |
| A5 | arXiv | `(abs:"optimal transport" OR abs:"Wasserstein" OR abs:"point cloud" OR abs:"permutation invariant" OR abs:"set transformer") AND (abs:"registration-free" OR abs:"without registration" OR abs:"registration free" OR abs:"no registration" OR abs:"correspondence-free")` | 974 |
| A6 | arXiv | `(abs:"set transformer" OR abs:"deep sets" OR abs:"permutation invariant" OR abs:"multiple instance") AND (abs:lesions OR abs:"lesion") AND (cat:eess.IV OR cat:cs.CV OR cat:cs.LG)` | 29 |
| P1 | PubMed | `("point cloud"[tiab] OR "point set"[tiab] OR PointNet[tiab] OR "permutation invariant"[tiab] OR "deep sets"[tiab] OR "set transformer"[tiab]) AND (MRI[tiab] OR "magnetic resonance"[tiab] OR cortical[tiab] OR tractography[tiab] OR "white matter"[tiab] OR lesion*[tiab] OR brain[tiab]) AND (classification[tiab] OR prediction[tiab] OR predict*[tiab] OR regression[tiab])` | 48 |
| P2 | PubMed | `("optimal transport"[tiab] OR Wasserstein[tiab] OR "earth mover*"[tiab]) AND (MRI[tiab] OR "magnetic resonance"[tiab] OR cortical[tiab] OR tractography[tiab] OR "white matter"[tiab] OR lesion*[tiab] OR brain[tiab] OR shape[tiab] OR surface[tiab]) AND (classification[tiab] OR prediction[tiab] OR predict*[tiab] OR regression[tiab] OR fusion[tiab])` | 150 |
| P3 | PubMed | `("optimal transport"[tiab] OR Wasserstein[tiab] OR "Gromov"[tiab]) AND (cortical[tiab] OR cortex[tiab] OR tract*[tiab] OR "white matter"[tiab] OR vessel*[tiab] OR "shape analysis"[tiab] OR connectom*[tiab] OR fMRI[tiab]) AND (registration-free[tiab] OR "without registration"[tiab] OR alignment[tiab] OR correspondence[tiab] OR atlas[tiab] OR subjects[tiab]) NOT (GAN[tiab] OR "generative adversarial"[tiab] OR EEG[tiab])` | 27 |
| P4 | PubMed | `("multiple instance learning"[tiab] OR "attention-based pooling"[tiab] OR "set-based"[tiab] OR "bag of lesions"[tiab]) AND (MRI[tiab] OR CT[tiab] OR "computed tomography"[tiab]) AND (lesion*[tiab] OR nodule*[tiab] OR region*[tiab]) AND (prediction[tiab] OR classification[tiab] OR survival[tiab] OR outcome[tiab])` | 39 |
| P5 | PubMed | `("registration-free"[tiab] OR "without registration"[tiab] OR "registration free"[tiab] OR "correspondence-free"[tiab] OR "native space"[tiab]) AND ("point cloud"[tiab] OR "geometric deep learning"[tiab] OR "optimal transport"[tiab] OR "graph neural network"[tiab] OR "cortical surface"[tiab] OR tractography[tiab]) AND (prediction[tiab] OR classification[tiab] OR parcellation[tiab] OR phenotype*[tiab])` | 10 |
| O1 | OpenAlex | `("point cloud" OR PointNet OR "permutation invariant") AND (brain OR cortical OR tractography OR "white matter" OR neuroanatomy OR aneurysm OR vessel) AND (prediction OR classification OR diagnosis)` | 213 |
| O2 | OpenAlex | `("optimal transport" OR Wasserstein OR "Gromov-Wasserstein") AND (MRI OR "cortical surface" OR tractography OR fMRI OR neuroimaging) AND (alignment OR fusion OR correspondence OR "across subjects" OR "inter-subject")` | 63 |
| O3 | OpenAlex | `("set transformer" OR "deep sets" OR "multiple instance" OR "permutation invariant" OR "attention pooling") AND (multifocal OR "multiple lesions" OR metastases OR "multiple nodules" OR "lesion-level") AND (outcome OR survival OR prediction OR prognosis)` | 33 |
| O4 | OpenAlex | `"optimal transport" AND ("whole slide" OR histopathology OR pathology) AND (genomic OR multimodal) AND survival` | 16 |
| S1 | Semantic Scholar | `("permutation invariant" \| "deep sets" \| "set transformer" \| "Janossy pooling" \| "sliced Wasserstein embedding" \| "optimal transport embedding") + (set \| "point cloud") + (pooling \| encoder \| aggregation)` | 296 |
| S2 | Semantic Scholar | `("point cloud" \| PointNet \| "permutation invariant" \| "set transformer" \| "optimal transport" \| Wasserstein) + (tractography \| "cortical surface" \| "white matter" \| aneurysm \| lesions \| neuroanatomy) + (prediction \| classification)` | 100 |

Hits per index: arXiv 1,602, PubMed 274, OpenAlex 325, Semantic Scholar 396, total 2,597. Strand C screened the titles of the top-ranked records of each query (top 20 to 60, all 10 for P5), 610 records from Layer 1. Records below these cut-offs were not screened, and strand C rests that choice on Layers 2 to 4 finding no new record beyond one 1997 foundation. A5 returned 974 records, mostly point-cloud registration, so the medical registration-free question was taken up by P5 and O2. Layer 2 chained 140 references of five core papers. Layer 3 listed 67 works citing three anchors from 2023 on. Layer 4 used 60 Semantic Scholar recommendations and added no candidate.

#### Strand D: registration, radiomics and lesion segmentation pipelines, and subject-level prediction from sets of lesions or regions

Databases: PubMed (E-utilities, relevance sort, each query with `AND 2013:2026[dp] AND english[la]`), arXiv (export API, relevance sort, `submittedDate:[201301010000 TO 202611202359]`), OpenAlex (relevance-ranked works search, `publication_year:2013-2026,language:en`), and OpenAlex reference and citing-work lists for chaining. Semantic Scholar was reached through `the lookup script resolve` and `index-abstract`. One Semantic Scholar call returned HTTP 429 after three retries, so no recommendation list was used.

| ID | Database | Query string | Hits | Screened |
|---|---|---|---|---|
| PM1 | PubMed | `(("image registration"[tiab] OR "deformable registration"[tiab] OR "nonrigid registration"[tiab]) AND (review[pt] OR survey[ti] OR review[ti] OR benchmark*[ti] OR challenge[ti] OR evaluation[ti]))` | 620 | 40 |
| PM2 | PubMed | `(("deep learning"[tiab] OR "learning-based"[tiab] OR unsupervised[tiab]) AND registration[ti] AND (challenge[ti] OR benchmark*[ti] OR review[pt] OR survey[ti]))` | 32 | 30 |
| PM3 | PubMed | `((template[ti] OR atlas[ti] OR atlases[ti]) AND (unbiased[tiab] OR groupwise[tiab] OR "group-wise"[tiab] OR learned[tiab] OR conditional[tiab] OR "population-specific"[tiab]) AND (construction[tiab] OR building[tiab] OR registration[tiab]))` | 130 | 40 |
| PM4 | PubMed | `((registration[ti] OR normalization[ti] OR template[ti]) AND (classification[tiab] OR prediction[tiab] OR "machine learning"[tiab]) AND (impact[ti] OR effect[ti] OR influence[ti] OR choice[ti] OR comparison[ti] OR variability[ti] OR reproducibility[ti]) AND (MRI[tiab] OR "magnetic resonance"[tiab]))` | 10 | 10 |
| PM5 | PubMed | `(("image biomarker standardisation initiative"[tiab] OR "image biomarker standardization initiative"[tiab] OR IBSI[ti]))` | 104 | 30 |
| PM6 | PubMed | `(radiomic*[ti] AND (reproducibility[ti] OR repeatability[ti] OR robustness[ti] OR stability[ti] OR variability[ti]) AND (review[pt] OR systematic[sb]))` | 21 | 21 |
| PM7 | PubMed | `(radiomic*[ti] AND (prognos*[tiab] OR outcome*[tiab] OR survival[tiab] OR prediction[tiab]) AND ("radiomics quality score"[tiab] OR "systematic review"[ti] OR "meta-analysis"[ti]) AND (review[pt] OR systematic[sb]))` | 352 | 40 |
| PM8 | PubMed | `(radiomic*[tiab] AND ("multiple lesions"[tiab] OR multilesion[tiab] OR "multi-lesion"[tiab] OR "lesion-level"[tiab] OR "patient-level"[tiab] OR "multiple metastases"[tiab] OR "all lesions"[tiab]) AND (aggregat*[tiab] OR "largest lesion"[tiab] OR pool*[tiab] OR "intertumor heterogeneity"[tiab] OR "inter-lesion"[tiab] OR "intra-patient"[tiab]))` | 47 | 47 |
| PM9 | PubMed | `(radiomic*[tiab] AND (segmentation[ti] OR delineation[ti] OR contour*[ti]) AND (variability[tiab] OR reproducibility[tiab] OR robustness[tiab] OR stability[tiab]))` | 164 | 40 |
| PM10 | PubMed | `("multiple sclerosis"[tiab] AND lesion*[tiab] AND segmentation[ti] AND (challenge[ti] OR benchmark*[ti] OR review[pt] OR evaluation[ti] OR comparison[ti]))` | 20 | 20 |
| PM11 | PubMed | `(("brain metastases"[tiab] OR "brain metastasis"[tiab]) AND (segmentation[ti] OR detection[ti]) AND (challenge[tiab] OR benchmark*[tiab] OR review[pt] OR "systematic review"[ti] OR meta-analysis[ti]))` | 36 | 36 |
| PM12 | PubMed | `(("brain tumor segmentation"[ti] OR "brain tumour segmentation"[ti] OR BraTS[ti] OR "lesion segmentation"[ti]) AND (challenge[ti] OR benchmark[ti]))` | 22 | 22 |
| PM13 | PubMed | `(("multiple instance learning"[tiab]) AND (lesion*[tiab] OR metastas*[tiab] OR nodule*[tiab] OR tumor*[tiab] OR tumour*[tiab]) AND (CT[tiab] OR MRI[tiab] OR PET[tiab] OR "magnetic resonance"[tiab] OR "computed tomography"[tiab]))` | 46 | 46 |
| PM14 | PubMed | `(("lesion load"[tiab] OR "lesion volume"[tiab] OR "lesion count"[tiab]) AND "multiple sclerosis"[tiab] AND (predict*[ti] OR prognos*[ti]) AND ("machine learning"[tiab] OR "deep learning"[tiab] OR automated[tiab] OR automatic[tiab]))` | 13 | 13 |
| PM15 | PubMed | `(("multiple metastases"[tiab] OR "multiple lesions"[tiab] OR "metastatic lesions"[tiab] OR "lesion-wise"[tiab] OR "lesion-level"[tiab]) AND ("deep learning"[tiab] OR "graph neural network"[tiab] OR attention[tiab] OR "deep sets"[tiab] OR "set"[ti]) AND ("patient-level"[tiab] OR "subject-level"[tiab] OR survival[tiab] OR "overall survival"[tiab]))` | 107 | 50 |
| PM16 | PubMed | `(("lesion-symptom mapping"[tiab] OR "lesion symptom mapping"[tiab] OR "lesion-deficit"[tiab]) AND (predict*[ti] OR multivariate[ti] OR "machine learning"[tiab] OR normalization[tiab] OR registration[tiab]))` | 115 | 40 |
| PM17 | PubMed | `(("spatial normalization"[ti] OR "spatial normalisation"[ti] OR registration[ti]) AND (lesion*[ti] OR stroke[ti] OR tumor*[ti] OR tumour*[ti] OR pathology[ti]) AND (template[tiab] OR atlas[tiab] OR MNI[tiab]))` | 9 | 9 |
| PM18 | PubMed | `((preprocessing[ti] OR registration[ti] OR "spatial normalization"[ti] OR "skull stripping"[ti]) AND ("deep learning"[tiab] OR "convolutional neural network"[tiab]) AND ("brain age"[tiab] OR "Alzheimer"[tiab] OR classification[tiab] OR prediction[tiab]) AND (impact[ti] OR effect[ti] OR influence[ti] OR necessary[ti] OR matter*[ti] OR role[ti]))` | 10 | 10 |
| PM19 | PubMed | `(("multiple sclerosis"[tiab]) AND ("deep learning"[tiab] OR "convolutional"[tiab]) AND (disability[tiab] OR EDSS[tiab] OR progression[tiab] OR conversion[tiab]) AND (predict*[ti] OR stratification[ti] OR classification[ti]) AND (lesion*[tiab]))` | 13 | 13 |
| PM20 | PubMed | `(("brain metastases"[tiab]) AND (radiomic*[tiab] OR "deep learning"[tiab]) AND ("overall survival"[tiab] OR "patient-level"[tiab] OR "intracranial progression"[tiab]) AND (multiple[tiab]))` | 8 | 8 |
| AX1 | arXiv | `abs:registration AND (abs:template OR abs:atlas) AND (abs:groupwise OR abs:conditional OR abs:unbiased OR abs:learned)` | 180 | 30 |
| AX2 | arXiv | `abs:"multiple instance" AND (abs:lesion OR abs:lesions OR abs:metastases) AND (abs:MRI OR abs:CT OR abs:PET)` | 7 | 7 |
| AX3 | arXiv | `(abs:lesions OR abs:metastases OR abs:tumors) AND (abs:"patient-level" OR abs:"subject-level") AND (abs:aggregation OR abs:"set" OR abs:graph OR abs:attention) AND (abs:prediction OR abs:survival OR abs:prognosis)` | 31 | 30 |
| AX4 | arXiv | `abs:registration AND (abs:prediction OR abs:classification) AND (abs:"registration-free" OR abs:"without registration" OR abs:"registration error" OR abs:"registration errors")` | 48 | 30 |
| AX5 | arXiv | `abs:radiomics AND (abs:reproducibility OR abs:standardization OR abs:standardisation OR abs:harmonization)` | 134 | 30 |
| AX6 | arXiv | `(ti:challenge OR ti:benchmark) AND (abs:"lesion segmentation" OR abs:"tumor segmentation" OR abs:"metastases segmentation" OR abs:"multiple sclerosis")` | 87 | 30 |
| OA1 | OpenAlex | `deformable medical image registration survey` | 12,210 | 20 |
| OA2 | OpenAlex | `learning conditional deformable templates atlas construction` | 598 | 15 |
| OA3 | OpenAlex | `radiomic feature aggregation multiple lesions patient-level outcome` | 2,341 | 20 |
| OA4 | OpenAlex | `multiple instance learning multiple sclerosis lesions disability prediction MRI` | 2,268 | 15 |
| OA5 | OpenAlex | `brain metastases radiomics multiple lesions patient-level survival aggregation` | 493 | 15 |
| OA6 | OpenAlex | `effect of image registration on classification accuracy neuroimaging spatial normalization machine learning` | 6,480 | 20 |

OpenAlex counts are the works matching any term after relevance scoring, so strand D treats them as index breadth and screened by rank only. Layer 2 read 153 references of four core papers (Geady 2025, Wilk 2025, Chang 2021, Juhling 2024) and screened every one. Layer 3 listed 52 works citing Chang 2021 from 2022 on. Layer 4 ran as the OpenAlex queries OA1 to OA6. Strand D did not chain the reference lists of the 20 works its citation loop added, a stopping decision recorded as D12 in settings.md.

### Coverage Distribution Advisory

No distributional skew advisory triggered. No dimension has one known value at 70 percent or more of its known entries. The counts below come from the year, journal and booktitle fields of refs.bib and from the Method column of the Literature Matrix, over the 270 included sources.

- Time distribution (known_N = 270, by decade): 1970s 3, 1990s 4, 2000s 7, 2010s 79, 2020s 177. The largest value is the 2020s at 177/270 (65.6 percent).
- Methodological distribution (known_N = 270, Method column of the matrix): Method 173, Empirical 31, Review 23, Benchmark 22, Foundation 11, Theory 10. The largest value is Method at 173/270 (64.1 percent). The 77 strand D sources hold 11 of the Method rows, all 31 Empirical rows, 19 of the 23 Review rows and 16 of the 22 Benchmark rows.
- Venue tier distribution: 29 of 270 sources (10.7 percent) carry a preprint or technical-report note in refs.bib. Of the 226 entries with a journal or booktitle field, the three most frequent venues are NeurIPS (14), NeuroImage (11), and MICCAI and ICML (7 each), so the top three venues hold 32/226 (14.2 percent) if one of the two tied venues is counted.
- Geographic distribution: omitted. The strands did not record study site or population region for enough sources to assess.

The 2020s share is the closest to the threshold. The research question concerns learned transport templates and set encoders, which the strands found mostly in recent work, and the foundational works of each strand are included. No search expansion is proposed for it.

### Screening Results

Per strand, as each strand report records it:

| Stage | Strand A | Strand B | Strand C | Strand D |
|---|---|---|---|---|
| Initial hits | 2645 (Layer 1) and 459 (Layer 5) | 3240 | 2,597 | PubMed 1,879, arXiv 487, OpenAlex 24,390 (index breadth), chaining 153 references and 52 citing works |
| Records screened on title | 1115 unique (Layer 1) and 221 unique (Layer 5) | 1899 unique | 877 (610 from Layer 1) | 1,015, not deduplicated across sources |
| After title and abstract screening (Phase A) | 63 (Layers 1 to 4), then 32 new and 17 re-screened in Layer 5 | 81 | 49 | 81 |
| After full-text assessment (Phase B) | 56, then 32 from Layer 5 and 3 from the check round | 73 | 40 | 77 |
| Final included | 91 | 73 | 40 | 77 |

Merged set:

- Entries across the four strand bibliographies: 281 (91, 73, 40 and 77).
- Duplicates removed: 11. Ten works are held by strands B and C (thual2022aligning, gramfort2015fast, vincentcuaz2022template, mialon2020trainable, kolouri2020wasserstein, naderializadeh2021pooling, mazelet2026learning, shifaterabbi2025linear, mahan2024point, amir2024fourier). One work is held by strands C and D (chen2021aminn).
- Deduplication order: DOI, then arXiv identifier, then normalized title, with a fuzzy title pass that found no further pair.
- Final included sources (`final_included`): 270.

Read level of the included sources, as each strand recorded it: strand A 71 full text and 20 abstract; strand B 43 full text, 23 method section and 7 abstract only; strand C 36 method sections from a full text, 2 from a PubMed Central author manuscript and 2 abstract only; strand D 61 full text (1 whole, 60 methods and results) and 16 abstract only. A claim in this review that rests on an abstract-only reading says no more than the abstract.

### Annotated Bibliography

Every included source appears once. Each entry gives the citation key, the bibliographic line, the type, the method and findings, how the source handles the missing correspondence and which pipeline step it concerns, the stance tag, what was read, the quality, and the potential use. The text condenses the annotation of the strand that holds the source. For the 11 works held by two strands, both annotations are merged and both tags are given.

The four strands tested different propositions, so a tag means something different in each:

- Strand A: "supports" means the method assumes an aligned spatial or feature mode in a supervised model. "Opposes" means it predicts an outcome while leaving a mode unaligned, irregular or misaligned. "Neutral" marks a decomposition with no outcome, a review or a foundation.
- Strand B: "support" means the source shows that a transport coupling to a learned template, trained with a supervised loss, gives a usable subject-level predictor on sets of unequal size, or shows a component such a model needs. "Oppose" means the source reports the transport route as too costly, unnecessary or beaten by an alternative. "Neutral" marks theory or tools with no bearing on that question.
- Strand C: "supports" means the source supports subject-level prediction without registering subjects to a common space. "Opposes" means it shows a cost of doing so, or relies on registration in a way that limits the claim. "Neutral" marks a definition or mechanism.
- Strand D: "supports" means the source measures or reports that a pipeline step (registration, radiomics, segmentation or aggregation), used ahead of a subject-level predictor, introduces error, variability or information loss that changes the prediction. "Opposes" means the choice made at the step leaves the prediction unchanged. "Neutral" marks a description or standardization of the step without that test.

Read levels are the strand's own: full text, method section, methods and results, PubMed Central manuscript, or abstract. Quality is High, Medium or Low as the strand rated it. Where two strands rated a shared work differently, the lower rating is kept, so the rating is not raised by the merge.

#### 1. Multilinear PLS and supervised factor models (strand A)

[bro1996multiway] Bro, R. (1996). Multiway calibration. Multilinear PLS. Journal of Chemometrics, 10(1), 47-61. Method, foundational. Tag (A): supports. Read: abstract. Quality: High.
- Method and findings: N-PLS gives each mode of the predictor array a weight vector, so the score model is trilinear and fitted with the response. It has fewer parameters than PLS on the unfolded array and is more stable on chemical calibration data.
- Correspondence and step: every mode is shared across samples, so variables must be aligned first. Supervised predictor.
- Use: origin of N-PLS and the baseline multiway method.

[zhao2013higher] Zhao, Q. et al. (2013). Higher Order Partial Least Squares (HOPLS). IEEE TPAMI, 35(7), 1660-1673. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: X and Y share the sample mode. Every other mode has loadings common to all samples, found by a block Tucker decomposition of the cross-covariance. HOPLS predicts better than N-PLS and unfolded PLS on ECoG decoding with a smaller model.
- Correspondence and step: all non-sample modes are aligned by construction. Supervised. N-PLS is the CP form of the same idea.
- Use: the reference tensor-to-tensor PLS baseline.

[eliseyev2013recursive] Eliseyev, A. and Aksenova, T. (2013). Recursive N-way PLS for brain-computer interface. PLoS ONE, 8(7), e69962. Method with application. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: N-PLS updated recursively on streaming ECoG blocks with time, frequency and electrode modes. It handles data too large for batch N-PLS with similar decoding accuracy.
- Correspondence and step: the implanted array fixes the electrode mode, so alignment comes from acquisition. Supervised.
- Use: related work on N-PLS in neural data.

[zhang2017tensor] Zhang, X. and Li, L. (2017). Tensor envelope partial least-squares regression. Technometrics, 59(4), 426-436. Method, statistical theory. Tag (A): supports. Read: abstract. Quality: High.
- Method and findings: tensor PLS given a population model through envelope subspaces. The abstract reports a consistent estimator and two neuroimaging applications.
- Correspondence and step: the image tensor is a voxel grid shared across subjects. Supervised.
- Use: statistical grounding of tensor PLS.

[mishra2023iterative] Mishra, P. and Liland, K. H. (2023). Iterative re-weighted multilinear partial least squares modelling for robust predictive modelling. Journal of Chemometrics, 38(1), e3527. Method. Tag (A): supports. Read: full text (Wageningen repository copy). Quality: Medium.
- Method and findings: N-PLS with iterative down-weighting of outlying observations. Lower prediction error than N-PLS on three real data sets, at the cost of one tuning parameter.
- Correspondence and step: all non-sample modes aligned, as in N-PLS. Supervised.
- Use: currency of the PLS family.

[sun2024partial] Sun, D., Peng, L., Qiu, Z., Guo, Y. and Manatunga, A. (2024). Partial quantile tensor regression. JASA, 120(551), 1724-1735. Method. Tag (A): supports. Read: full text (PubMed Central). Quality: High.
- Method and findings: the PLS principle applied to quantile regression with a tensor covariate, with an envelope model. Root-n consistency and better finite-sample results than benchmarks, applied to PTSD symptom severity.
- Correspondence and step: the covariate is a connectivity matrix over the 279 nodes of the Seitzman atlas, so correspondence comes from the atlas. Supervised.
- Use: recent PLS-type tensor regression with an imaging outcome.

[vanderploeg2026acmtfr] van der Ploeg, G. R. et al. (2026). ACMTF-R: supervised multi-omics data integration. PLOS One, 21(1), e0339650. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: advanced coupled matrix and tensor factorization with a regression term on the shared subject factor, weighted by a parameter. The outcome term pulls outcome-related variation into the shared and distinct components.
- Correspondence and step: the subject mode is shared and the feature modes are aligned. Supervised.
- Use: design of a joint factorization and prediction loss.

[marini2013scream] Marini, F. and Bro, R. (2013). SCREAM: a novel method for multi-way regression problems with shifts and shape changes in one mode. Chemometrics and Intelligent Laboratory Systems, 129, 64-75. Method. Tag (A): opposes. Read: abstract (from the authors' department page). Quality: Medium.
- Method and findings: a PARAFAC2 decomposition of the predictor array joined with a principal covariates regression step. The abstract reports results as good as or better than other multi-way regression methods, and loss of accuracy for N-PLS when one mode shifts or changes shape.
- Correspondence and step: the elution-time mode shifts across samples, and the other modes are aligned. Supervised.
- Use: the earliest supervised method found by strand A that leaves one mode unaligned. A baseline design on the regression side.

#### 2. Tensor regression on an aligned grid (strand A)

[zhou2013tensor] Zhou, H., Li, L. and Zhu, H. (2013). Tensor regression with applications in neuroimaging data analysis. JASA, 108(502), 540-552. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: a GLM with a CP-structured coefficient tensor fitted by block relaxation. The CP form cuts parameters from the product of the dimensions to their sum times the rank. ADHD classification from MRI.
- Correspondence and step: the MRI is segmented and registered, with RAVENS normalization to a template. Builds on registration. Supervised.
- Use: the reference tensor regression for imaging outcomes, and the main example of registration first.

[li2018tucker] Li, X., Xu, D., Zhou, H. and Li, L. (2018). Tucker tensor regression and neuroimaging analysis. Statistics in Biosciences, 10(3), 520-545. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: a GLM with a Tucker coefficient and wavelet downsizing of the image. Tucker allows a rank per mode and fits better than CP at equal parameter count on ADHD-200.
- Correspondence and step: images preprocessed onto a common grid. Builds on registration. Supervised.
- Use: baseline.

[guhaniyogi2015bayesian] Guhaniyogi, R., Qamar, S. and Dunson, D. B. (2015). Bayesian tensor regression. arXiv 1509.06490, published in JMLR 18 (2017). Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: scalar-on-tensor regression with a multiway Dirichlet generalized double Pareto prior on the CP margins. Posterior consistency and better recovery of sparse coefficient images than penalised CP.
- Correspondence and step: coefficient tensor on a common voxel grid. Supervised.
- Use: Bayesian line of tensor regression.

[lock2018tensorontensor] Lock, E. F. (2018). Tensor-on-tensor regression. JCGS, 27(3), 638-647. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: a contracted tensor product of the predictor with a low-rank CP coefficient gives a tensor response, with ridge and rank penalties in one framework.
- Correspondence and step: the contraction sums over the predictor modes, which must be indexed alike across samples. Supervised.
- Use: general form and notation of multilinear regression.

[li2017parsimonious] Li, L. and Zhang, X. (2017). Parsimonious tensor response regression. JASA, 112(519), 1131-1146. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: a tensor response on scalar predictors with an envelope model per mode. Large efficiency gains over voxel-wise regression in EEG and MRI studies.
- Correspondence and step: the response image lies on a common grid. Association with covariates.
- Use: the tensor-response direction of the family.

[guhaniyogi2021bayesian] Guhaniyogi, R. and Spencer, D. (2021). Bayesian tensor response regression with an application to brain activation studies. Bayesian Analysis, 16(4), 1221-1249. Method. Tag (A): supports. Read: abstract. Quality: High.
- Method and findings: a tensor response with a multiway stick-breaking shrinkage prior. The abstract reports posterior contraction when the voxel count grows faster than the sample size.
- Correspondence and step: voxels indexed alike across scans. Association.
- Use: Bayesian tensor response.

[li2016sparse] Li, Z., Suk, H.-I., Shen, D. and Li, L. (2016). Sparse multi-response tensor regression for Alzheimer's disease. IEEE TMI, 35(8), 1927-1936. Method with application. Tag (A): supports. Read: full text (PubMed Central). Quality: High.
- Method and findings: sparse tensor regression with several clinical scores as joint outcomes. Better prediction of ADNI clinical scores than competing methods.
- Correspondence and step: tissues normalized with HAMMER to an MNI-space atlas, RAVENS maps formed, and grey matter maps downsized to 32 x 32 x 32 voxels. Builds on registration. Supervised.
- Use: imaging tensor regression with an explicit registration pipeline.

[papadogeorgou2019soft] Papadogeorgou, G., Zhang, Z. and Dunson, D. B. (2019). Soft tensor regression. arXiv 1910.09699, published in JMLR. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: CP margins vary softly across components, which relaxes the low-rank form. Better fit than hard CP regression for HCP connectome outcomes.
- Correspondence and step: the predictor is an ROI-by-ROI connectome, so correspondence comes from the parcellation. Supervised.
- Use: shows atlas parcellation as a second route to correspondence.

[kossaifi2017tensor] Kossaifi, J. et al. (2017). Tensor regression networks. arXiv 1707.08308, preprint record. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: a tensor regression layer with a low-rank coefficient replaces flattening and fully connected layers in a CNN, with large parameter savings at equal accuracy. Applied to UK Biobank MRI.
- Correspondence and step: CNN activations on a fixed grid from preprocessed images. Supervised.
- Use: tensor regression inside deep networks.

[yan2019structured] Yan, H., Paynabar, K. and Pacella, M. (2019). Structured point cloud data analysis via regularized tensor regression. Technometrics, 61(3), 385-395. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: a point-cloud response on process variables with a Tucker coefficient and basis expansion, modelling surface shape in manufacturing.
- Correspondence and step: the point cloud is measured on a pre-specified grid. The authors name a model for unstructured point clouds as future work. Supervised (tensor response).
- Use: introduction, as a nearby field that states the unstructured case as open.

[gahrooei2020multiple] Gahrooei, M. R., Yan, H., Paynabar, K. and Shi, J. (2020). Multiple tensor-on-tensor regression. Technometrics, 63(2), 147-159. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: several tensor predictors of different orders map to one tensor response through Tucker coefficients, so images, profiles and scalars enter one model.
- Correspondence and step: images and structured point clouds on aligned grids. Supervised.
- Use: multi-source tensor regression.

[wang2026maximum] Wang, Q. and Paynabar, K. (2026). Maximum covariance unfolding: a novel covariate-based manifold learning approach for point cloud regression. INFORMS Journal on Data Science, 5(1), 24-42. Method. Tag (A): supports. Read: full text (arXiv 2303.17852). Quality: Medium.
- Method and findings: learns a low-dimensional manifold of point clouds with the highest correlation to covariates, then regresses. Better than Euclidean regression on a steel bracket case.
- Correspondence and step: each point cloud has the same n points in the same order and is flattened to a vector, so point correspondence is assumed. Supervised (point-cloud response).
- Use: point-cloud regression that still needs point correspondence.

[wang2025tensorontensor] Wang, Q., Bisheh, M. N. and Paynabar, K. (2025). Tensor-on-tensor regression neural networks for process modeling with high-dimensional data. arXiv 2510.05329, preprint, not peer reviewed. Method. Tag (A): supports. Read: full text. Quality: Low.
- Method and findings: a network whose layers keep tensor structure, related to PLS in its Section 3.4. Better than linear tensor regression on point-cloud simulations and two case studies.
- Correspondence and step: point clouds are generated on a parameter grid, so points correspond across samples. Supervised.
- Use: nonlinear tensor regression for point clouds.

[huang2026shiftaware] Huang, H.-H., Chen, Y.-H. and Zhang, T. (2026). Shift-aware sparse Kronecker tensor classification. Statistics and Computing, 36(3). Method. Tag (A): opposes. Read: full text. Quality: Medium.
- Method and findings: sparse Kronecker product decomposition for logistic classification, with a second view of each scan shifted by a fixed cyclic offset. Robust to minor mis-registration while keeping sparse coefficients.
- Correspondence and step: small circular shifts on the same grid, so prior registration is still needed. Supervised.
- Use: the only tensor regression strand A found that models spatial misalignment of images. A close baseline.

[wang2026a] Wang, S.-H. and Huang, H.-H. (2026). A Bayesian sparse Kronecker product decomposition framework for tensor predictors with mixed-type responses. Statistical Analysis and Data Mining, 19(4). Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: Bayesian sparse Kronecker product decomposition for continuous, binary and count responses in one model, applied to OASIS MRI.
- Correspondence and step: OASIS volumes are atlas-registered. Builds on registration. Supervised.
- Use: currency of imaging tensor regression.

[lyu2024bayesian] Lyu, R., Vannucci, M., Kundu, S. and ADNI (2024). Bayesian tensor modeling for image-based classification of Alzheimer's disease. Neuroinformatics, 22(4), 437-455. Method with application. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: a Bayesian tensor model of the image feeds an SVM or logistic classifier, with good classification and interpretable regions.
- Correspondence and step: all images registered to a template with ANTs. Builds on registration. Supervised.
- Use: example of registration first.

[guhaniyogi2024a] Guha Niyogi, P., Lindquist, M. A. and Maiti, T. (2024). A tensor based varying-coefficient model for multi-modal neuroimaging. IEEE TSP, 72, 1607-1619. Method. Tag (A): supports. Read: full text. Quality: High.
- Method and findings: tensor coefficients that vary with a covariate capture modality interactions with few parameters.
- Correspondence and step: multi-modal images on a common voxel grid. Supervised.
- Use: currency of imaging tensor regression.

[li2022coupled] Li, P., Sofuoglu, S. E., Aviyente, S. and Maiti, T. (2022). Coupled support tensor machine classification for multimodal neuroimaging. Statistical Analysis and Data Mining, 15(6), 797-818. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: coupled CP decomposition of EEG and fMRI tensors feeds a support tensor machine, which beats single-modality tensor classifiers.
- Correspondence and step: SPM12 preprocessing with co-registration. Builds on registration. Supervised.
- Use: supervised coupled tensor model in imaging.

[zhou2021partially] Zhou, J., Sun, W. W., Zhang, J. and Li, L. (2021). Partially observed dynamic tensor response regression. JASA, 118(541), 424-439. Method. Tag (A): supports. Read: full text (PubMed Central). Quality: High.
- Method and findings: a dynamic tensor response with low-rank, sparse and fused coefficients and a loss projected onto the observed entries, with error bounds at each step. Dementia MRI study.
- Correspondence and step: each MRI preprocessed to a 32 x 32 x 32 grid, with visits as a fourth mode. Voxels aligned. Missing visits handled by the projected loss. Association.
- Use: missing entries of a time mode on an aligned grid.

[xu2024tensor] Xu, T., Chen, K. and Li, G. (2024). Tensor regression for incomplete observations with application to longitudinal studies. Annals of Applied Statistics, 18(2), 1195-1212. Method. Tag (A): opposes. Read: full text (PubMed Central). Quality: High.
- Method and findings: scalar-on-tensor regression on a sample by feature by time tensor, estimated from covariances so that every observed entry is used without imputation. Links preterm gut microbiome dynamics to neurodevelopment.
- Correspondence and step: subjects are measured at different subsets of time points, so the time mode differs across subjects. The feature mode is aligned. Supervised.
- Use: estimation without a complete grid.

[faes2024single] Faes, A., Camarrone, F. and Van Hulle, M. M. (2024). Single finger trajectory prediction from intracranial brain activity using block-term tensor regression with fast and automatic component extraction. IEEE TNNLS, 35(7), 8897-8908. Method. Tag (A): supports. Read: full text (KU Leuven repository). Quality: High.
- Method and findings: block-term tensor regression with two new factorizations and a marginalization step. Better finger trajectory prediction than vector and matrix methods on ECoG.
- Correspondence and step: the electrode grids are fixed within each patient, so the electrode mode is aligned by acquisition. Supervised.
- Use: recent supervised multiway regression on neural recordings.

[li2027functional] Li, T., Yao, F. and Zhang, A. R. (2027). Functional tensor regression. Statistica Sinica, accepted (year from Crossref). Method. Tag (A): supports. Read: full text (arXiv 2506.09358). Quality: Medium.
- Method and findings: a tensor covariate with a functional mode, a low Tucker rank coefficient smooth on that mode, and a Riemannian Gauss-Newton algorithm with quadratic convergence. Better than tabular tensor regression on ADHD-200.
- Correspondence and step: images preprocessed as in Zhou 2013. Voxels aligned, and the functional mode is time. Supervised.
- Use: a continuous mode inside tensor regression.

[he2026an] He, J. and Li, J. (2026). An ensemble approach to tensor learning. Statistical Methods in Medical Research, 35(4), 847-866. Method. Tag (A): supports. Read: abstract. Quality: Medium.
- Method and findings: an ensemble over block partitions of the tensor and over CP ranks. The abstract reports better prediction than single tensor regressions for glaucoma from fundus images and for cognition in Alzheimer's disease.
- Correspondence and step: fixed spatial blocks assume the same layout across subjects. Supervised.
- Use: currency of imaging tensor regression.

[kundu2023bayesian] Kundu, S. et al. (2023). Bayesian longitudinal tensor response regression for modeling neuroplasticity. Human Brain Mapping, 44(18), 6326-6348. Method. Tag (A): supports. Read: full text (arXiv 2309.10065). Quality: High.
- Method and findings: Bayesian tensor response over visits with time-varying and subject-specific effects. Better feature selection than voxel-wise and cross-sectional methods in post-stroke aphasia.
- Correspondence and step: a T1-weighted image was acquired for registration to MNI space. Builds on registration. Association.
- Use: imaging tensor response with explicit registration.

[pietrosanu2026regularized] Pietrosanu, M. et al. (2026). Regularized tensor quantile regression with applications to neuroimaging data analysis. Statistics in Medicine, 45(10-12). Method. Tag (A): supports. Read: full text (PubMed Central). Quality: Medium.
- Method and findings: linear quantile regression with a tensor covariate regularized through the tensor estimate. Better than tensor frameworks when standard regression assumptions fail.
- Correspondence and step: covariates on a common grid. Supervised.
- Use: currency of imaging tensor regression.

[haijie2024a] Haijie, X. and Chen, Z. (2024). A scalable operator-valued kernel learning framework for continuous multi-way regression (FRCOMA). arXiv 2406.19021, preprint, not peer reviewed. Method. Tag (A): opposes. Read: full text. Quality: Low.
- Method and findings: nonlinear regression with separable operator-valued kernels for covariates and responses on continuous domains, solved with Kronecker structure.
- Correspondence and step: samples need no fixed grid, and irregular sampling needs no interpolation. The domain itself is shared across samples. Supervised.
- Use: a route to grid-free supervised models.

[spencer2024bayesian] Spencer, D. A. et al. (2024). Bayesian scalar-on-tensor regression using the Tucker decomposition for sparse spatial modeling. Biostatistics, 26(1). Method. Tag (A): supports. Read: full text (arXiv 2203.04733). Quality: High.
- Method and findings: Bayesian scalar-on-tensor regression with a Tucker coefficient and shrinkage priors, with better inference on ADNI than other tensor regressions.
- Correspondence and step: ADNI images on a common voxel grid. Supervised.
- Use: recent Bayesian Tucker regression.

[naji2026bayesian] Naji, Z., Fuentes, M., Ma, L. and Moradi Rekabdarkolaee, H. (2026). Bayesian tensor regression for neuroimaging data. arXiv 2609.27880, preprint, not peer reviewed. Method. Tag (A): supports. Read: full text. Quality: Low.
- Method and findings: a Bayesian envelope model for an image response on vector covariates, leading to a Tucker decomposition, with posterior consistency and better estimation in simulation.
- Correspondence and step: preprocessed ADHD-200 and fMRI data on a common grid. Association.
- Use: currency.

[liu2026bayesian] Liu, Y., Luo, H. and Kundu, S. (2026). Bayesian tensor-on-tensor varying coefficient model for forecasting Alzheimer's disease progression. arXiv 2604.07764, preprint, not peer reviewed. Method. Tag (A): supports. Read: full text. Quality: Low.
- Method and findings: tensor-on-tensor regression with Gaussian process priors and patch-to-voxel maps. Forecasts of cortical thickness maps on ADNI that also predict brain age.
- Correspondence and step: the ANTs longitudinal pipeline normalised each scan to a population template. Builds on registration. Supervised (image response).
- Use: example of registration first.

[reinhardt2026spatiallyinformed] Reinhardt, A., Liu, Y. and Kundu, S. (2026). Spatially-informed image harmonization results in improved scanner effect removal and prediction (Tensor-ComBat). arXiv 2604.01546, preprint, not peer reviewed. Method. Tag (A): supports. Read: full text. Quality: Low.
- Method and findings: a Bayesian tensor response regression with a PARAFAC coefficient estimates scanner effects, which ComBat then removes, with better downstream prediction on ADNI than classical ComBat.
- Correspondence and step: each scan registered with ANTs to a population template. Builds on registration.
- Use: preprocessing context after registration.

[liu2023integrative] Liu, Y. et al. (2023). Integrative Bayesian tensor regression for imaging genetics applications. Frontiers in Neuroscience, 17. Method. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: Bayesian scalar-on-image regression joins voxel images and genetics to predict cognition, beating models on region summaries in ADNI.
- Correspondence and step: images registered with ANTs to a population template so that locations match. Builds on registration. Supervised.
- Use: example of registration first.

[llosavite2023reducedrank] Llosa-Vite, C. and Maitra, R. (2023). Reduced-rank tensor-on-tensor regression and tensor-variate analysis of variance. IEEE TPAMI, 45(2), 2282-2296. Method. Tag (A): supports. Read: full text (arXiv 2012.10249). Quality: High.
- Method and findings: tensor-on-tensor regression in four low-rank formats with tensor-variate normal errors, giving a tensor ANOVA. Finds regions linked to suicide attempt status in fMRI.
- Correspondence and step: voxel-level statistics on a common grid. Association.
- Use: related work.

[liu2021tensor] Liu, J., Zhu, C., Long, Z. and Liu, Y. (2021). Tensor regression. Foundations and Trends in Machine Learning, 14(4), 379-565. Review. Tag (A): neutral. Read: full text (arXiv 2308.11419). Quality: High.
- Method and findings: a survey of linear, nonlinear and Bayesian tensor regression organised by low-rank format, regularisation and model class.
- Correspondence and step: the surveyed methods take tensors on fixed index sets.
- Use: background for the tensor regression family.

#### 3. Decompositions with an unaligned, ragged or shifted mode (strand A)

[harshman1972parafac2] Harshman, R. A. (1972). PARAFAC2: mathematical and technical notes. UCLA Working Papers in Phonetics, 22, 30-47. Method, foundational. Tag (A): neutral. Read: full text (author's reproduction). Quality: High.
- Method and findings: a three-mode model for sets of cross-product matrices that keeps the uniqueness of PARAFAC1 and allows oblique factors, a case PARAFAC1 on cross-products cannot describe.
- Correspondence and step: the model works on cross-products, so slices need not share row units. Decomposition only.
- Use: origin of PARAFAC2.

[kiers1999parafac2] Kiers, H. A. L., ten Berge, J. M. F. and Bro, R. (1999). PARAFAC2 Part I. A direct fitting algorithm. Journal of Chemometrics, 13(3-4), 275-294. Method, foundational. Tag (A): neutral. Read: abstract. Quality: High.
- Method and findings: PARAFAC2 fitted by alternating least squares, with each slice `X_k ~ U_k S_k V^T` and `U_k = Q_k H` for orthonormal `Q_k`, which keeps `U_k^T U_k` constant. The abstract presents it for slices with the same column units and different numbers of row units.
- Correspondence and step: one mode may vary in size and order per slice, and the other must be aligned. Decomposition only.
- Use: model definition for a varying mode.

[bro1999parafac2] Bro, R., Andersson, C. A. and Kiers, H. A. L. (1999). PARAFAC2 Part II. Modeling chromatographic data with retention time shifts. Journal of Chemometrics, 13(3-4), 295-309. Method with application. Tag (A): neutral. Read: abstract. Quality: High.
- Method and findings: PARAFAC2 applied to chromatography with elution profiles that shift between samples. The abstract states that it handles the shifts because each sample keeps the same inner-product structure.
- Correspondence and step: the elution mode is unaligned and the spectral mode aligned. Decomposition only.
- Use: first use of PARAFAC2 for a misaligned mode.

[morup2008shiftinvariant] Morup, M. et al. (2008). Shift-invariant multilinear decomposition of neuroimaging data. NeuroImage, 42(4), 1439-1450. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: shift-invariant CP, `X_ijk = sum_d A_id B_(j-tau_kd),d C_kd`, with shifts estimated in the frequency domain. Recovers EEG and fMRI components with trial or subject delays that plain CP splits.
- Correspondence and step: the time mode may shift per slice and component, and the spatial mode stays aligned. Decomposition only.
- Use: the shift model as a contrast to PARAFAC2.

[kuang2015multisubject] Kuang, L.-D. et al. (2015). Multi-subject fMRI analysis via combined ICA and shift-invariant CP. Journal of Neuroscience Methods, 256, 127-140. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: ICA initialisation followed by shift-invariant CP across subjects. The abstract reports better shared maps and time courses than tensor PICA when delays are large.
- Correspondence and step: subject-specific delays with shared spatial maps, so the spatial mode is aligned. Decomposition only.
- Use: multi-subject imaging with a shifted mode.

[kuang2024shiftinvariant] Kuang, L.-D. et al. (2024). Shift-invariant rank-(L, L, 1, 1) BTD with 3D spatial pooling and orthonormalization: application to multi-subject fMRI data. Biomedical Signal Processing and Control, 92, 106058. Method. Tag (A): neutral. Read: abstract (library record). Quality: Medium.
- Method and findings: spatial pooling, then a block term decomposition with temporal shift-invariance. The abstract reports better separation than the same model without shifts.
- Correspondence and step: shared spatial maps with subject-specific delays. Decomposition only.
- Use: currency of shift models in imaging.

[rivet2016modeling] Rivet, B. and Cohen, J. E. (2016). Modeling time warping in tensor decomposition. IEEE SAM Workshop 2016, 1-5. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: a CP-type model in which shared sources reach each EEG recording through a diffeomorphic time warping. The abstract describes a proof of concept on simulated ocular artifacts.
- Correspondence and step: the time mode is warped per recording, and the electrode mode is aligned. Decomposition only.
- Use: a model of nonrigid misalignment along one mode.

[madsen2016quantifying] Madsen, K. H., Churchill, N. W. and Morup, M. (2016). Quantifying functional connectivity in multi-subject fMRI using component models. Human Brain Mapping, 38(2), 882-899. Comparison study. Tag (A): neutral. Read: full text (PubMed Central). Quality: High.
- Method and findings: a cross-validated comparison of component models by prediction of voxel-wise covariance. The best models allow subject variability within a common spatial subspace, and PARAFAC2 gives stable connectivity.
- Correspondence and step: spatial maps shared, the time mode varies per subject, and data were normalized to an EPI template in SPM8. Builds on registration. Decomposition only.
- Use: motivation for PARAFAC2 in multi-subject imaging.

[roald2020tracing] Roald, M. et al. (2020). Tracing network evolution using the PARAFAC2 model. ICASSP 2020, 1100-1104. Method with application. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: PARAFAC2 on task fMRI with an evolving voxel mode recovers networks that change gradually across slices.
- Correspondence and step: the evolving mode is spatial, while subjects are indexed in an aligned mode on registered data. Decomposition only.
- Use: closest unsupervised use in imaging.

[roald2022an] Roald, M. et al. (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes. SIAM Journal on Mathematics of Data Science, 4(3), 1191-1222. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: AO-ADMM fitting of PARAFAC2 with constraints on every mode, including the varying one. Smoothness and non-negativity on the evolving mode improve recovery, and ragged tensors are handled.
- Correspondence and step: in multi-task fMRI the voxel mode evolves per task, and evolving patterns can rotate and mirror per slice. Decomposition only.
- Use: the fitting framework that most supervised PARAFAC2 work builds on.

[cottrell2026subspace] Cottrell, S., Wei, G.-W. and Huang, L. (2026). Subspace tensor orthogonal rotation model (STORM) for spatial transcriptomic data. arXiv 2603.22477, preprint, not peer reviewed. Method. Tag (A): neutral. Read: full text. Quality: Low.
- Method and findings: each tissue slice gets an orthonormal spatial subspace, and the projected slices are fitted by PARAFAC2 with graph regularization. The authors report state-of-the-art batch integration and deconvolution.
- Correspondence and step: the spot mode varies in number and geometry across slices, and the gene mode is aligned. No outcome model.
- Use: closest work on the decomposition side with the spatial mode as the varying mode.

[ramirez2025integrative] Ramirez, A. et al. (2025). Integrative, high-resolution analysis of single-cell gene expression across experimental conditions with PARAFAC2-RISE. Cell Systems, 16(6), 101294. Method with application. Tag (A): opposes. Read: full text (PubMed Central). Quality: High.
- Method and findings: PARAFAC2 on one cells-by-genes matrix per condition or patient separates condition variation from cell variation without labels. Patient factors passed to logistic regression predict lupus status across batches.
- Correspondence and step: the cell mode varies in number and identity across patients. Two-stage: decomposition, then supervised prediction.
- Use: two-stage baseline for subject-level prediction from sets without correspondence.

[cui2024gstrpca] Cui, L. et al. (2024). GSTRPCA: irregular tensor singular value decomposition for single-cell multi-omics data clustering. Briefings in Bioinformatics, 26(1). Method. Tag (A): neutral. Read: full text (PubMed Central). Quality: Medium.
- Method and findings: irregular tensor robust PCA with low-rank and sparse terms, with global convergence and better clustering.
- Correspondence and step: omics layers with different feature dimensions. Decomposition only.
- Use: an irregular tensor model outside PARAFAC2.

[larsen2024tensor] Larsen, B. W., Kolda, T. G., Zhang, A. R. and Williams, A. H. (2024). Tensor decomposition meets RKHS: efficient algorithms for smooth and misaligned data. arXiv 2408.05677, preprint, not peer reviewed. Method. Tag (A): neutral. Read: full text. Quality: Low.
- Method and findings: CP-HiFi, a CP decomposition with some factors in a reproducing kernel Hilbert space, with a solver for incomplete or misaligned data (Section 4.2).
- Correspondence and step: each slice can be sampled at its own points of the continuous mode. Decomposition only.
- Use: model of off-grid samples.

[brust2026fast] Brust, J. J. and Kolda, T. G. (2026). Fast and accurate CP-HIFI tensor decompositions: exploiting Kronecker structure. arXiv 2603.25691, preprint, not peer reviewed. Method. Tag (A): neutral. Read: full text. Quality: Low.
- Method and findings: fast solvers for the infinite-dimensional subproblems of CP-HiFi, with the accuracy of direct solves and large speed-ups.
- Correspondence and step: in the unaligned case each tensor has a scattered subset of observations (Section 5.2). Decomposition only.
- Use: computation of the unaligned case at scale.

[tang2026tensor] Tang, R., Kolda, T. G. and Zhang, A. R. (2026). Tensor decomposition with unaligned observations. SIAM Journal on Matrix Analysis and Applications, 47(1), 107-131. Method. Tag (A): neutral. Read: full text (arXiv 2410.14046). Quality: High.
- Method and findings: a functional decomposition in which subject i is observed at its own time points, fitted with RKHS factors, with an early childhood microbiome application.
- Correspondence and step: the time mode is unaligned across subjects, and features are aligned. Decomposition only.
- Use: formal model of unaligned observations of one mode.

[cohen2018nonnegative] Cohen, J. E. and Bro, R. (2018). Nonnegative PARAFAC2: a flexible coupling approach. LVA/ICA 2018, 89-98. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: the hard PARAFAC2 constraint becomes a penalty, `B_k = P_k B* + Gamma_k`, which allows non-negativity on the varying mode. The paper notes that PARAFAC2 transforms all columns of `B_k` alike, unlike shift-PARAFAC.
- Correspondence and step: the varying mode is coupled softly to a common factor. Decomposition only.
- Use: flexible coupling as a soft form of correspondence.

[perros2017spartan] Perros, I. et al. (2017). SPARTan: scalable PARAFAC2 for large and sparse data. KDD 2017, 375-384. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: PARAFAC2 for sparse EHR tensors, orders of magnitude faster on large data.
- Correspondence and step: the columns of each slice must be aligned across subjects, and the visit mode varies. Decomposition only.
- Use: states the aligned-feature requirement explicitly.

[afshar2018copa] Afshar, A. et al. (2018). COPA: constrained PARAFAC2 for sparse and large datasets. CIKM 2018, 793-802. Method. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: PARAFAC2 with smoothness and sparsity constraints by AO-ADMM gives interpretable temporal phenotypes from EHR at scale.
- Correspondence and step: irregular time mode, aligned features. Decomposition only.
- Use: constrained PARAFAC2.

[ren2020robust] Ren, Y. et al. (2020). Robust irregular tensor factorization and completion (REPAIR). CIKM 2020, 1295-1304. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: PARAFAC2 with a low-rank regulariser for missing and erroneous entries. The abstract reports robust phenotypes from corrupted EHR.
- Correspondence and step: unaligned time, aligned features. Decomposition only.
- Use: robustness of PARAFAC2.

[ren2025unraveling] Ren, Y. et al. (2025). Unraveling complex temporal patterns in EHRs via robust irregular tensor factorization (REPAR). AMIA Joint Summits on Translational Science Proceedings 2025. Method. Tag (A): neutral. Read: full text (PubMed Central page). Quality: Medium.
- Method and findings: PARAFAC2 with recurrent temporal regularization and a low-rank term, with better reconstruction and robustness to missing data on three EHR sets.
- Correspondence and step: visit counts vary per patient, features aligned. Used for subgroups, with no outcome model.
- Use: currency of PARAFAC2 for EHR.

[jorgensen2024probabilistic] Jorgensen, P. J. H. et al. (2024). Probabilistic PARAFAC2. Entropy, 26(8), 697. Method. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: PARAFAC2 with variational inference, giving uncertainty estimates and automatic rank selection.
- Correspondence and step: varying mode as in PARAFAC2. Decomposition only.
- Use: a probabilistic route to joint models.

[chen2023enhanced] Chen, Z., Cheng, L. and Wu, Y.-C. (2023). Enhanced tensor rank learning in Bayesian PARAFAC2 for noisy irregular tensor data. EUSIPCO 2023, 645-649. Method. Tag (A): neutral. Read: full text (EURASIP proceedings). Quality: Medium.
- Method and findings: a generalized hyperbolic sparsity prior on all factors recovers rank better than a Gaussian-gamma prior at high rank and low signal-to-noise.
- Correspondence and step: irregular data as in PARAFAC2. Decomposition only.
- Use: rank selection.

[chatzis2025tparafac2] Chatzis, C., Schenker, C., Pfeffer, M. and Acar, E. (2025). tPARAFAC2: tracking evolving patterns in temporal data. Data Mining and Knowledge Discovery, 39(6). Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: PARAFAC2 with temporal smoothness on the evolving factors and missing-entry handling, which tracks gradual change better than plain PARAFAC2.
- Correspondence and step: the evolving mode is regularised across slices. Decomposition only.
- Use: currency of PARAFAC2 variants.

[chatzis2025dcmf] Chatzis, C., Schenker, C., Cohen, J. E. and Acar, E. (2025). dCMF: learning interpretable evolving patterns from temporal multiway data. EUSIPCO 2025, 2122-2126. Method. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: coupled matrix factorization with a linear dynamical constraint in place of the PARAFAC2 constraint. It matches PARAFAC2 when the data follow PARAFAC2 structure and does better when they do not.
- Correspondence and step: evolving factors across time slices. Decomposition only.
- Use: an alternative to the PARAFAC2 constraint.

[hu2026separable] Hu, Y., Jiang, T.-X., Ng, M. K. and Zhao, X.-L. (2026). Separable decomposition for ragged tensors. IEEE TPAMI, 48(8), 9624-9641. Method. Tag (A): neutral. Read: abstract. Quality: High.
- Method and findings: a CP-based decomposition of tensors with irregular index patterns, using a binary weighting tensor. The abstract reports an efficient solver with a convergence guarantee on hyperspectral and spatial transcriptomics data.
- Correspondence and step: irregular in several modes, with the valid domain marked by weights. Decomposition only.
- Use: ragged tensors as a second route to unaligned data.

[kim2024fast] Kim, J., Park, K. H., Jang, J.-G. and Kang, U (2024). Fast and accurate domain adaptation for irregular tensor decomposition. KDD 2024, 1383-1394. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: PARAFAC2 for a new target tensor using factors learned on source tensors. The abstract reports fast, accurate patterns for a new domain with little data.
- Correspondence and step: irregular mode as in PARAFAC2. Used for missing values and anomalies.
- Use: transfer across PARAFAC2 models.

[jang2023fast] Jang, J.-G., Lee, J., Park, Y.-C. and Kang, U (2023). Fast and accurate dual-way streaming PARAFAC2 for irregular tensors. KDD 2023, 879-890. Method. Tag (A): neutral. Read: full text (arXiv 2305.18376). Quality: Medium.
- Method and findings: streaming PARAFAC2 for new rows and new slices, faster and more accurate than earlier versions.
- Correspondence and step: slices share columns and differ in row length. Decomposition only.
- Use: PARAFAC2 at scale.

[jang2024fast] Jang, J.-G., Park, Y.-C. and Kang, U (2024). Fast and accurate PARAFAC2 decomposition for time range queries on irregular tensors. CIKM 2024, 962-972. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: PARAFAC2 for chosen time ranges without decomposing from scratch, as the abstract describes.
- Correspondence and step: slices with different row sizes. Decomposition only.
- Use: PARAFAC2 tooling.

[kwon2024compact] Kwon, T. et al. (2024). Compact decomposition of irregular tensors for data compression. KDD 2024, 1451-1462. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: a compression-oriented decomposition of irregular tensors. The abstract states that PARAFAC2 compresses poorly because of its many first-mode factor matrices.
- Correspondence and step: matrices with different numbers of rows. Decomposition only.
- Use: irregular models beyond PARAFAC2.

[zhao2024fedpar] Zhao, M. and Reisi Gahrooei, M. (2024). FedPAR: federated PARAFAC2 tensor factorization for computational phenotyping. IISE Transactions on Healthcare Systems Engineering, 14(3), 264-275. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: federated PARAFAC2 for EHR held by several entities, giving phenotypes without pooling data, as the abstract states.
- Correspondence and step: irregular time, aligned features. Decomposition only.
- Use: PARAFAC2 under data-sharing limits.

[magbonde2023constrained] Magbonde, A., Quaine, F. and Rivet, B. (2023). Constrained non-negative PARAFAC2 for electromyogram separation. ICASSP 2023, 1-5. Method. Tag (A): neutral. Read: full text (HAL). Quality: Medium.
- Method and findings: non-negative PARAFAC2 with physiological constraints and handling of faulty sensors, by AO-ADMM, matching non-negative PARAFAC2 with one component per muscle.
- Correspondence and step: surface EMG on a fixed electrode matrix. Decomposition only.
- Use: PARAFAC2 on biomedical sensor arrays.

[schneide2023shiftinvariant] Schneide, P.-A., Bro, R. and Gallagher, N. B. (2023). Shift-invariant tri-linearity. Journal of Chemometrics, 37(8). Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: a shift-invariant trilinear model for GC-MS. The abstract reports 20 to 60 times faster fitting than PARAFAC2 ALS, with constraints on all modes.
- Correspondence and step: elution mode shifted, mass mode aligned. Decomposition only.
- Use: a fast shift model.

[schneide2024shift] Schneide, P.-A., Gallagher, N. B. and Bro, R. (2024). Shift invariant soft trilinearity. Chemometrics and Intelligent Laboratory Systems, 251, 105155. Method. Tag (A): neutral. Read: abstract. Quality: Medium.
- Method and findings: shift-invariant tri-linearity extended to peak shape changes. The abstract reports better factor resolution than the rigid model when data depart from trilinearity.
- Correspondence and step: shifted and reshaped elution mode, aligned mass mode. Decomposition only.
- Use: a model of shift plus shape change.

[schneide2024unlocking] Schneide, P.-A., Sorochan Armstrong, M., Gallagher, N. and Bro, R. (2024). Unlocking new capabilities in the analysis of GCxGC-TOFMS data with shift-invariant multi-linearity. Journal of Chemometrics, 39(1). Method. Tag (A): neutral. Read: full text (arXiv 2412.12114). Quality: Medium.
- Method and findings: shift-invariant multi-linearity with wavelet smoothing and Fourier shift correction inside MCR-ALS, more robust at low signal-to-noise than MCR-ALS and PARAFAC2xN.
- Correspondence and step: shifts in two chromatographic modes, aligned mass mode. Decomposition only.
- Use: a shift model in several modes.

[sorochanarmstrong2023parafac2n] Sorochan Armstrong, M. D. et al. (2023). PARAFAC2xN: coupled decomposition of multi-modal data with drift in N modes. Analytica Chimica Acta, 1249, 340909. Method. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: PARAFAC2 extended to drift along two chromatographic modes at once.
- Correspondence and step: two modes unaligned across samples, mass mode aligned. Decomposition only.
- Use: frees more than one mode.

#### 4. Supervised models with an unaligned or irregular mode (strand A)

Five more sources of this family are annotated above: [marini2013scream], [huang2026shiftaware], [xu2024tensor], [haijie2024a] and [ramirez2025integrative].

[afshar2020taste] Afshar, A. et al. (2020). TASTE: temporal and static tensor factorization for phenotyping EHR. ACM CHIL 2020, 193-203. Method. Tag (A): opposes. Read: full text. Quality: Medium.
- Method and findings: PARAFAC2 on temporal EHR coupled with a static patient matrix, and phenotypes passed to logistic regression. They predict heart failure as well as raw features and are easier to interpret.
- Correspondence and step: irregular visit mode, aligned features. Two-stage.
- Use: two-stage baseline.

[yin2020logpar] Yin, K. et al. (2020). LogPar: logistic PARAFAC2 factorization for temporal binary data with missing values. KDD 2020, 1625-1635. Method. Tag (A): opposes. Read: full text (PubMed Central). Quality: Medium.
- Method and findings: Bernoulli PARAFAC2 with a positive-unlabeled loss. The paper reports relative gains of 13.2 percent for heart failure and 14 percent for mortality prediction over other PARAFAC2 models.
- Correspondence and step: irregular time, aligned features. The diagonal of `S_k` represents each patient and feeds logistic regression. Two-stage.
- Use: non-Gaussian PARAFAC2 for prediction.

[ren2022multipar] Ren, Y. et al. (2022). MULTIPAR: supervised irregular tensor factorization with multi-task learning. arXiv 2208.00993, with a 2023 PubMed Central record. Method. Tag (A): opposes. Read: full text. Quality: Medium.
- Method and findings: a joint loss of PARAFAC2 reconstruction and static and dynamic outcome losses on `S_k` and `U_k`. Joint training predicts mortality and other outcomes better than two-stage PARAFAC2.
- Correspondence and step: irregular time, aligned features. Supervised, fitted jointly.
- Use: the closest joint supervised PARAFAC2, with time as the varying mode.

[konyar2025semisupervised] Konyar, E. and Gahrooei, M. R. (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping. IEEE JBHI, 29(6), 4415-4425. Method. Tag (A): opposes. Read: abstract. Quality: Medium.
- Method and findings: PARAFAC2 with labels for a subset of patients. The abstract reports better phenotypes than unsupervised PARAFAC2 on MIMIC-IV.
- Correspondence and step: irregular visit mode, aligned features. Semi-supervised, binary outcome.
- Use: label information in PARAFAC2.

[patalano2026par2cox] Patalano, M., Konyar, E. and Paynabar, K. (2026). PAR2COX: survival-informed tensor decomposition. arXiv 2609.23705, preprint, not peer reviewed. Method. Tag (A): opposes. Read: full text. Quality: Low.
- Method and findings: PARAFAC2 plus a Cox partial likelihood on `w_k = diag(S_k)`, solved by AO-ADMM, giving phenotypes that predict survival risk.
- Correspondence and step: irregular time, aligned features. Supervised (survival).
- Use: design of a joint objective.

[minoccheri2025supervised] Minoccheri, C., Tesic, S., Najarian, K. and Stidham, R. (2025). Supervised coupled matrix-tensor factorization (SCMTF). arXiv 2506.20065, preprint, not peer reviewed. Method with application. Tag (A): opposes. Read: full text. Quality: Low.
- Method and findings: coupled matrix and tensor factorization with a supervised term, whose phenotypes predict medication persistence in ulcerative colitis.
- Correspondence and step: irregular time, aligned features. Supervised.
- Use: supervised CMTF with an irregular mode.

#### 5. Coupled matrix and tensor factorization (strand A)

[vanderploeg2026acmtfr], [li2022coupled], [minoccheri2025supervised] and [chatzis2025dcmf], annotated above, also belong to this family.

[acar2014structurerevealing] Acar, E. et al. (2014). Structure-revealing data fusion. BMC Bioinformatics, 15. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: advanced CMTF with sparsity on component weights, which recovers the shared and unshared structure in metabolomics fusion.
- Correspondence and step: coupled along the subject mode, other modes aligned. Decomposition only.
- Use: base of ACMTF and ACMTF-R.

[acar2019unraveling] Acar, E. et al. (2019). Unraveling diagnostic biomarkers of schizophrenia through structure-revealing fusion of multi-modal neuroimaging. Frontiers in Neuroscience, 13. Method with application. Tag (A): supports. Read: full text. Quality: Medium.
- Method and findings: ACMTF on fMRI, sMRI and EEG features coupled in the subject mode. The subject factors separate patients from controls.
- Correspondence and step: features from images in a common space. Builds on registration. Decomposition, then outcome analysis.
- Use: imaging biomarkers from coupled factorization.

[schenker2025parafac2based] Schenker, C. et al. (2025). PARAFAC2-based coupled matrix and tensor factorizations with constraints. IEEE JSTSP, 19(7), 1461-1476. Method. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: CMTF in which one tensor follows PARAFAC2, fitted by AO-ADMM with constraints, for joint analysis of an irregular tensor with matrices.
- Correspondence and step: one coupled tensor carries a varying mode. Decomposition only.
- Use: CMTF with an unaligned mode.

[chatzichristos2021early] Chatzichristos, C. et al. (2021). Early soft and flexible fusion of EEG and fMRI via double coupled matrix tensor factorization. Human Brain Mapping, 43(4), 1231-1255. Method with application. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: double coupled factorization of EEG and fMRI with soft and flexible coupling, which absorbs variability of the haemodynamic response across subjects.
- Correspondence and step: fMRI registered to MNI with FLIRT, so space is aligned, and the flexibility lies in the response function. Decomposition only.
- Use: flexible coupling in imaging.

[borsoi2023coupled] Borsoi, R. A. et al. (2023). Coupled CP tensor decomposition with shared and distinct components for multi-task fMRI fusion. ICASSP 2023, 1-5. Method. Tag (A): neutral. Read: full text. Quality: Medium.
- Method and findings: coupled CP across task tensors recovers task-shared and task-specific patterns.
- Correspondence and step: SPM coefficient maps in a common space. Builds on registration. Decomposition only.
- Use: multi-task imaging fusion.

#### 6. Foundations of CP, PARAFAC and tensor notation (strand A)

[kiers1999parafac2], [bro1999parafac2] and [harshman1972parafac2], annotated in family 3, are also foundations.

[harshman1970foundations] Harshman, R. A. (1970). Foundations of the PARAFAC procedure: models and conditions for an "explanatory" multimodal factor analysis. UCLA Working Papers in Phonetics, 16, 1-84. Method, foundational. Tag (A): neutral. Read: full text (author's reproduction). Quality: High.
- Method and findings: PARAFAC, derived from the principle of proportional profiles for three-way data, with a uniqueness proof credited to Jennrich.
- Correspondence and step: every mode aligned across slices. Decomposition only.
- Use: background. Cited by 4 of the 6 core papers strand A chained.

[carroll1970analysis] Carroll, J. D. and Chang, J.-J. (1970). Analysis of individual differences in multidimensional scaling via an N-way generalization of Eckart-Young decomposition. Psychometrika, 35(3), 283-319. Method, foundational. Tag (A): neutral. Read: abstract. Quality: High.
- Method and findings: CANDECOMP, the CP model, as an N-way generalisation of the Eckart-Young decomposition.
- Correspondence and step: every mode aligned. Decomposition only.
- Use: the CP model behind most tensor regression.

[kolda2009tensor] Kolda, T. G. and Bader, B. W. (2009). Tensor decompositions and applications. SIAM Review, 51(3), 455-500. Review. Tag (A): neutral. Read: full text. Quality: High.
- Method and findings: survey of CP, Tucker, PARAFAC2 and related models with their notation. Section 5.2 presents PARAFAC2 for matrices of size `I_k x J` with `I_k` free to vary.
- Correspondence and step: PARAFAC2 shares one factor and lets the other mode vary. Decomposition only.
- Use: notation and background. Cited by 5 of the 6 chained core papers.

#### 7. Optimal transport foundations, entropic and unbalanced transport (strand B)

[villani2009optimal] Villani, C. (2009). Optimal Transport: Old and New. Springer. Book, foundational. Tag (B): neutral. Read: method section of the author's 2006 lecture-notes version (chapters 1, 4 and 6). Quality: High.
- Method and findings: defines a coupling of two probability measures as a measure on the product space with those marginals, proves that an optimal coupling exists for lower semicontinuous costs, and defines the Wasserstein distance of order p.
- Correspondence and step: the coupling is the formal object behind every transport correspondence in this review. Theory, no predictor.
- Use: definitions.

[cuturi2013sinkhorn] Cuturi, M. (2013). Sinkhorn distances: lightspeed computation of optimal transport. NeurIPS 2013. Method, foundational. Tag (B): support. Read: full text. Quality: High.
- Method and findings: an entropic penalty on the transport problem, solved by Sinkhorn-Knopp matrix scaling on a GPU and vectorized over a batch of histograms at cost O(d^2 N).
- Correspondence and step: the entropic coupling is a soft correspondence and is differentiable, which strand B counts as the building block a jointly trained template needs. Output: a distance.
- Use: background on entropic transport.

[peyre2019computational] Peyre, G. and Cuturi, M. (2019). Computational Optimal Transport with Applications to Data Sciences. Foundations and Trends in Machine Learning. Review monograph. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: covers Sinkhorn and its complexity, barycenters, unbalanced transport and Gromov-Wasserstein.
- Correspondence and step: theory and algorithms, no predictor.
- Use: background reference for the transport family.

[benamou2015iterative] Benamou, J.-D. et al. (2015). Iterative Bregman projections for regularized transportation problems. SIAM Journal on Scientific Computing. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: recasts entropic transport, barycenters and partial transport as iterative Bregman projections onto affine constraints.
- Correspondence and step: the barycenter is computed, not learned. Output: a distance or barycenter.
- Use: background on barycenter algorithms.

[chizat2018scaling] Chizat, L. et al. (2018). Scaling algorithms for unbalanced optimal transport problems. Mathematics of Computation. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: entropic regularization extended to unbalanced transport, where divergence penalties such as KL replace the marginal constraints, solved by a scaling algorithm that is a case of Dykstra's iterations. The same scheme gives unbalanced barycenters.
- Correspondence and step: unbalanced marginals let a template ignore elements that have no match. Output: a distance.
- Use: background for sets with unmatched elements, such as new or vanished lesions.

[feydy2019interpolating] Feydy, J. et al. (2019). Interpolating between optimal transport and MMD using Sinkhorn divergences. AISTATS 2019. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: defines the Sinkhorn divergence, which is positive definite, metrizes convergence in law, and moves from transport to MMD as the regularization grows.
- Correspondence and step: removes the entropic bias from a loss trained through a coupling. Output: a loss.
- Use: loss design.

[luise2018differential] Luise, G. et al. (2018). Differential properties of Sinkhorn approximation for learning with Wasserstein distance. NeurIPS 2018. Theory. Tag (B): support. Read: full text. Quality: High.
- Method and findings: proves that the sharp Sinkhorn distance is smooth and gives its gradient in closed form.
- Correspondence and step: makes the coupling-based distance usable as a learning loss. No predictor.
- Use: gradients through transport.

#### 8. Gromov-Wasserstein and its variants (strand B)

[memoli2011gromovwasserstein] Memoli, F. (2011). Gromov-Wasserstein distances and the metric approach to object matching. Foundations of Computational Mathematics. Theory, foundational. Tag (B): support. Read: method section (published article). Quality: High.
- Method and findings: objects become metric measure spaces, and the correspondences of the Gromov-Hausdorff distance are relaxed to measure couplings, which defines the GW distance. Theorem 5.1 shows it is a metric on isomorphism classes. Remark 5.13 shows that the support of an optimal coupling is a correspondence. The discrete problem is a quadratic program that need not be convex.
- Correspondence and step: the coupling is established as the correspondence between unaligned objects. Output: a distance.
- Use: definition of GW and of the coupling as a correspondence.

[memoli2014the] Memoli, F. (2014). The Gromov-Wasserstein distance: a brief overview. Axioms. Review. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: defines GW through couplings and shows that it vanishes exactly on isomorphic spaces.
- Correspondence and step: theory. No predictor.
- Use: background.

[chowdhury2019the] Chowdhury, S. and Memoli, F. (2019). The Gromov-Wasserstein distance between networks and stable network invariants. Information and Inference. Theory. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: a GW distance on weighted directed networks that need not satisfy the triangle inequality, with transport-based invariants that bound it from below.
- Correspondence and step: theory for networks. Output: a distance.
- Use: GW on networks such as connectomes.

[peyre2016gromovwasserstein] Peyre, G., Cuturi, M. and Solomon, J. (2016). Gromov-Wasserstein averaging of kernel and distance matrices. ICML 2016. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: entropic GW couplings between similarity matrices in different spaces, averaged into a GW barycenter at cost O(N1^2 N2 + N2^2 N1) per iteration, used to predict energy levels in quantum chemistry.
- Correspondence and step: the barycenter is computed for given weights. Output: a predictor.
- Use: GW barycenters.

[solomon2016entropic] Solomon, J. et al. (2016). Entropic metric alignment for correspondence problems. ACM Transactions on Graphics. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: probabilistic correspondences between geometric domains by entropy-regularized GW, solved by an iterative algorithm that reaches a local minimum from any start. The fuzzy correspondence matrix is the output, with extensions to partial distance matrices and shape collections.
- Correspondence and step: the coupling is the correspondence. Output: an alignment.
- Use: entropic GW for shapes.

[xu2019gromovwasserstein] Xu, H. et al. (2019). Gromov-Wasserstein learning for graph matching and node embedding. ICML 2019. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: node embeddings of two graphs learned jointly with their GW coupling, solved by a proximal point method at cost O(M(V^2 D + N V^3)).
- Correspondence and step: the coupling gives the graph matching. Output: alignment and embeddings.
- Use: joint learning of embeddings and couplings.

[vayer2019sliced] Vayer, T. et al. (2019). Sliced Gromov-Wasserstein. NeurIPS 2019. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: projects to one dimension and solves GW in closed form at O(n log n).
- Correspondence and step: the full coupling is not returned. Output: a distance.
- Use: scalability.

[sejourne2021the] Sejourne, T. et al. (2021). The unbalanced Gromov-Wasserstein distance: conic formulation and relaxation. NeurIPS 2021. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: unbalanced GW and a conic relaxation, solved by unbalanced Sinkhorn at O(n^3) time and O(n^2) memory.
- Correspondence and step: the coupling is a partial correspondence. Output: a distance.
- Use: GW for sets with unmatched elements.

[vincentcuaz2021semirelaxed] Vincent-Cuaz, C. et al. (2021). Semi-relaxed Gromov-Wasserstein divergence with applications on graphs. arXiv preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: relaxes the target marginal of GW, so a graph can be matched to a template with free node weights, giving dictionary embeddings for clustering at gradient cost O(n^2 m + m^2 n).
- Correspondence and step: the template is learned without supervision. Output: an embedding.
- Use: templates with free weights.

[scetbon2022lineartime] Scetbon, M. et al. (2022). Linear-time Gromov-Wasserstein distances using low rank couplings and costs. ICML 2022. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: low-rank costs and couplings bring GW to time linear in the number of points.
- Correspondence and step: the coupling is factored. Output: a distance.
- Use: scalability.

[beier2022on] Beier, F., Beinert, R. and Steidl, G. (2022). On a linear Gromov-Wasserstein distance. IEEE Transactions on Image Processing. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: linearizes GW against a reference metric measure space, so N spaces need N couplings instead of N^2, and classifies shapes from the embedding.
- Correspondence and step: fixed reference. Output: an embedding.
- Use: linear GW embeddings.

[zhang2024gromovwasserstein] Zhang, Z. et al. (2024). Gromov-Wasserstein distances: entropic regularization, duality and sample complexity. Annals of Statistics. Theory. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: a dual form of entropic GW with a dual variable restricted to a hypercube set by the second moments, giving the first empirical convergence rates for GW.
- Correspondence and step: theory only.
- Use: statistical background.

[rioux2023entropic] Rioux, G., Goldfeld, Z. and Kato, K. (2023). Entropic Gromov-Wasserstein distances: stability and algorithms. arXiv preprint record; no peer-reviewed version was confirmed in this run. Theory. Tag (B): neutral. Read: method section. Quality: Medium.
- Method and findings: smoothness and convexity of the variational form of entropic GW, solved by an accelerated gradient method with Sinkhorn steps at O(N^2), whose stationary points converge to those of unregularized GW.
- Correspondence and step: theory and algorithm.
- Use: background.

[bai2024linear] Bai, Y. et al. (2024). Linear partial Gromov-Wasserstein embedding. Published at ICLR, per Semantic Scholar. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: linearizes partial GW against a reference space, needing N plans instead of N^2, and classifies the embeddings by logistic regression.
- Correspondence and step: fixed reference. Output: an embedding.
- Use: partial GW embeddings.

#### 9. Fused Gromov-Wasserstein for structured objects (strand B)

[vayer2019optimal] Vayer, T. et al. (2019). Optimal transport for structured data with application on graphs. ICML 2019. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: FGW matches the nodes of two graphs by trading a feature Wasserstein cost against a structure GW cost. It is a metric for q = 1 and handles graphs of different sizes.
- Correspondence and step: the coupling matches nodes. Output: a distance used in kernels.
- Use: definition of FGW.

[vayer2020fused] Vayer, T. et al. (2020). Fused Gromov-Wasserstein distance for structured objects. Algorithms. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: the journal version of FGW with its metric properties and the FGW barycenter.
- Correspondence and step: computed barycenter. Output: a distance.
- Use: FGW barycenters.

[nguyen2023on] Nguyen, D. H. and Tsuda, K. (2023). On a linear fused Gromov-Wasserstein distance for graph structured data. Pattern Recognition. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: linearizes FGW against a reference that is itself an FGW barycenter, giving a Euclidean embedding of dimension K + K^2 and a valid kernel.
- Correspondence and step: the reference is computed, not trained against labels. Output: a kernel.
- Use: linear FGW embeddings.

[bai2025fused] Bai, Y. et al. (2025). Fused partial Gromov-Wasserstein for structured objects. arXiv preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: defines fused partial GW with barycenter solvers.
- Correspondence and step: partial coupling with a computed barycenter. Output: a distance.
- Use: partial matching of structured sets.

[piening2026a] Piening, M. and Beinert, R. (2026). A novel sliced fused Gromov-Wasserstein distance. AAAI 2026. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: slices FGW at cost O(Ln(r + d) + (Ln + n^2) log n) and classifies with k nearest neighbours.
- Correspondence and step: partial coupling. Output: a distance.
- Use: scalability.

[aburidi2025optimal] Aburidi, M. and Marcia, R. (2025). Optimal transport based graph kernels for drug property prediction. IEEE Open Journal of Engineering in Medicine and Biology. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: three OT graph kernels for ADMET prediction from Wasserstein, GW and FGW distances between molecular graphs, fed to an SVM or kernel MLP. The kernels beat the graph deep learning baselines on 9 of 19 datasets, and FGW is more accurate than Wasserstein.
- Correspondence and step: no template. Output: a kernel.
- Use: transport kernels for prediction.

[ma2023fused] Ma, X. et al. (2023). Fused Gromov-Wasserstein graph mixup for graph-level classifications. NeurIPS 2023. Method. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: FGWMixup takes the FGW barycenter of two graphs as the mixed sample, and a relaxed coupling polytope raises the solver's rate from O(1/t) to O(1/t^2).
- Correspondence and step: the template is computed per pair. Output: augmented data for a GNN.
- Use: barycenters as augmentation.

[qian2024reimagining] Qian, C., Tang, H., Liang, H. and Liu, Y. (2024). Reimagining graph classification from a prototype view with optimal transport: algorithm and theorem. KDD 2024. Method. Tag (B): support. Read: abstract only. Quality: Medium.
- Method and findings: the abstract describes classification by FGW distance to class prototypes, an NN approximator of FGW for GPU training, and an O(1/N) generalization bound. It does not say how the prototypes are trained.
- Correspondence and step: prototypes of unstated training. Output: a predictor.
- Use: prototype classifiers.

#### 10. Barycenters (strand B)

[cuturi2014fast] Cuturi, M. and Doucet, A. (2014). Fast computation of Wasserstein barycenters. ICML 2014. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: barycenters through the smoothed dual, with a free-support version that generalizes k-means.
- Correspondence and step: computed template. Output: an embedding.
- Use: barycenter algorithms.

[xu2021learning] Xu, H. et al. (2021). Learning graphons via structured Gromov-Wasserstein barycenters. AAAI 2021. Method. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: graphons learned from unaligned graphs of different sizes as structured GW barycenters, with a mixture for clustered graphs, at O(EK + NK^2) per step.
- Correspondence and step: template learned without labels. Output: an embedding.
- Use: barycenters of unaligned graphs.

[werenski2024linearized] Werenski, M., Mallery, B., Aeron, S. and Murphy, J. M. (2024). Linearized Wasserstein barycenters: synthesis, analysis, representational capacity, and applications. arXiv 2410.23602, published at AISTATS, per Semantic Scholar. Theory. Tag (B): neutral. Read: method section. Quality: Medium.
- Method and findings: represents a measure by barycentric coefficients over given references in the linearized OT metric, with rates of estimation, and shows that the natural two-dimensional construction fails.
- Correspondence and step: fixed references. Output: an embedding.
- Use: barycentric coding.

[brogatmotte2022learning] Brogat-Motte, L. et al. (2022). Learning to predict graphs with fused Gromov-Wasserstein barycenters. ICML 2022. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: predicts a graph as an FGW barycenter of templates with input-dependent weights, and learns the templates jointly with a network under a supervised FGW loss.
- Correspondence and step: templates trained jointly with a supervised loss through FGW couplings. Output: structured prediction of graphs, not a scalar outcome.
- Use: joint template learning.

#### 11. Learned dictionaries, templates and reference sets (strands B and C)

[vincentcuaz2022template] Vincent-Cuaz, C. et al. (2022). Template based graph neural network with optimal transport distances (TFGW). NeurIPS 2022. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: High.
- Method and findings: a graph becomes its vector of FGW distances to K templates, fed to an MLP. The templates (structure, features, node weights) and the trade-off are learned end-to-end with cross-entropy, with gradients by the envelope theorem. Strand C notes that the layer encodes feature and structure dissimilarities at once.
- Correspondence and step: the coupling is the node-to-template correspondence, and the embedding is invariant to strong isomorphism. The conditional gradient solver costs O(n^2 nbar + nbar^2 n) per iteration, one problem per template per graph. Output: a predictor.
- Use: the closest graph-level analogue of a learned atlas.

[vincentcuaz2021online] Vincent-Cuaz, C. et al. (2021). Online graph dictionary learning (OGDL). ICML 2021. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: each graph is approximated by a linear combination of GW or FGW atoms, and the atom weights from GW unmixing form the embedding.
- Correspondence and step: atoms learned without supervision. Output: an embedding.
- Use: dictionaries.

[xu2020gromovwasserstein] Xu, H. (2020). Gromov-Wasserstein factorization models for graph clustering. AAAI 2020. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: factorizes graphs as GW barycenters of learned atoms, and the atom weights form a permutation-invariant embedding for clustering.
- Correspondence and step: unsupervised atoms. Output: an embedding.
- Use: dictionaries.

[xu2023representing] Xu, H. et al. (2023). Representing graphs via Gromov-Wasserstein factorization. IEEE TPAMI. Method. Tag (B): support. Read: abstract only. Quality: Medium.
- Method and findings: the abstract describes graph factors and per-graph weights learned jointly by reconstruction, with extensions to node attributes, a GNN auto-encoder and a regularizer for semi-supervised classification.
- Correspondence and step: unsupervised atoms. Output: an embedding.
- Use: dictionaries.

[schmitz2018wasserstein] Schmitz, M. A. et al. (2018). Wasserstein dictionary learning: optimal transport-based unsupervised nonlinear dictionary learning. SIAM Journal on Imaging Sciences. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: atoms learned so that each datum is a Wasserstein barycenter of them.
- Correspondence and step: unsupervised. Output: an embedding.
- Use: dictionaries.

[wang2025an] Wang, S., Wang, Z., Zhao, X.-L. and Shen, X. (2025). An unbalanced optimal transport-based approach for robust dictionary learning. IEEE Transactions on Neural Networks and Learning Systems. Method. Tag (B): neutral. Read: abstract only. Quality: Medium.
- Method and findings: the abstract describes unbalanced OT in place of the Wasserstein fit, which makes atoms robust to outliers, solved by block coordinate descent with a convergence proof, tested on MNIST, faces and hyperspectral images.
- Correspondence and step: unsupervised atoms. Output: an embedding.
- Use: robust dictionaries.

[chen2020optimal] Chen, B. et al. (2020). Optimal transport graph neural networks (OT-GNN). arXiv preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: Wasserstein distances between a graph's node-embedding set and learned prototype point clouds feed a supervised predictor, with a noise-contrastive term that keeps prototypes from collapsing.
- Correspondence and step: prototypes learned jointly. Output: a predictor.
- Use: learned prototype sets.

[mialon2020trainable] Mialon, G., Chen, D., d'Aspremont, A. and Mairal, J. (2020). A trainable optimal transport embedding for feature aggregation and its relationship to attention (OTKE). Published at ICLR, per Semantic Scholar. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: Medium (B Medium, C High).
- Method and findings: elements are embedded in a reproducing kernel Hilbert space and pooled with weights from the entropic transport plan to a trainable reference, learned without labels or with supervision. Several references act like attention heads, and position smoothing adds location. Strand C reports state-of-the-art results on protein fold recognition and chromatin profile detection.
- Correspondence and step: transport coupling to a learned reference. Strand C notes that positions are lost unless encoded and that the reference size bounds resolution. One Sinkhorn plan per set. Output: an embedding.
- Use: the prototype of transport pooling against a learned reference, cited by PANTHER and MMP.

[wang2024graph] Wang, Z. and Fan, J. (2024). Graph classification via reference distribution learning: theory and practice. NeurIPS 2024. Method. Tag (B): oppose. Read: full text. Quality: High.
- Method and findings: reference distributions learned end-to-end, compared with node-embedding sets by MMD. The authors judge Wasserstein too costly, report that MMD performed better in their tests, and run faster than OT-GNN and TFGW.
- Correspondence and step: learned references without a coupling. Output: a predictor.
- Use: the counter-evidence for transport-based learned references.

[zhang2024wasserstein] Zhang, T. et al. (2024). Wasserstein discriminant dictionary learning for graph representation (WDDL). IEEE TPAMI. Method. Tag (B): support. Read: abstract only. Quality: Medium.
- Method and findings: the abstract describes a dictionary of graph keys, a joint Wasserstein and Kron-Gromov-Wasserstein embedding, and a discriminant loss that makes keys of one class compact.
- Correspondence and step: keys learned with a discriminant loss. Output: a predictor.
- Use: supervised dictionaries.

[liu2024structuresensitive] Liu, G. et al. (2024). Structure-sensitive graph dictionary embedding for graph classification (SS-GDE). IEEE Transactions on Artificial Intelligence. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: a base dictionary adapted to each graph by Bernoulli sampling of substructures, with multi-sensitivity Wasserstein encoding, trained for classification under a mutual-information objective.
- Correspondence and step: dictionary learned jointly. Output: a predictor.
- Use: supervised dictionaries.

[xu2023regularized] Xu, H. and Cheng, M. (2023). Regularized optimal transport layers for generalized global pooling operations (ROTP). IEEE TPAMI. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: global pooling operations unified as regularized OT problems with learnable regularization, tested on multi-instance learning, graph classification and image classification. Similarity matrices cost O(N^2 D + D^2 N), and an unrolled layer O(KND).
- Correspondence and step: transport inside the pooling layer. Output: an embedding.
- Use: pooling as transport.

[naderializadeh2021pooling] Naderializadeh, N., Comer, J. F., Andrews, R. W., Hoffmann, H. and Kolouri, S. (2021). Pooling by sliced-Wasserstein embedding (PSWE). NeurIPS 2021, volume 34. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: High.
- Method and findings: set elements are samples of a distribution, and an end-to-end trainable Euclidean embedding of the generalized sliced Wasserstein distance comes from Monge maps between slices of the input and of trainable reference sets, with trainable slicers. Strand C cites the abstract's report that it outperforms other set representations on point-cloud, graph and image classification.
- Correspondence and step: per-slice coupling to learned references, at the cost of sorting per slice. Slicing discards joint structure the slices miss. Output: an embedding.
- Use: transport pooling linear in set size per slice.

[naderializadeh2025constrained] Naderializadeh, N. et al. (2025). Constrained sliced Wasserstein embedding (CSWE). arXiv preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: slicing directions learned under a constraint so that their plans approximate the full transport plan.
- Correspondence and step: partial coupling with learned slices. Output: an embedding.
- Use: sliced embeddings that keep more of the coupling.

#### 12. Linearized and sliced embeddings, graph distances and kernels (strands B and C)

[wang2012a] Wang, W. et al. (2012). A linear optimal transportation framework for quantifying and visualizing variations in sets of images. International Journal of Computer Vision. Method, foundational. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: linear optimal transport for image sets. A template is computed from the data, each image is approximated by particles, and its plan to the template gives an isometric linear embedding in which statistics and classification run, with nuclear chromatin patterns in cancer cells as one application.
- Correspondence and step: computed template. Output: an embedding.
- Use: origin of LOT.

[kolouri2016sliced] Kolouri, S., Zou, Y. and Rohde, G. K. (2016). Sliced Wasserstein kernels for probability distributions. CVPR 2016. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: a positive definite kernel from the sliced Wasserstein distance through a template measure.
- Correspondence and step: no coupling kept. Output: a kernel.
- Use: transport kernels.

[moosmuller2022linear] Moosmuller, C. and Cloninger, A. (2022). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations. Information and Inference. Theory. Tag (B): support. Read: full text. Quality: High.
- Method and findings: the LOT embedding to a fixed reference is exact for shifts and scalings, which gives linear separability of classes generated by them.
- Correspondence and step: fixed reference. Output: an embedding.
- Use: guarantees for LOT under rigid variation.

[kolouri2020wasserstein] Kolouri, S., Naderializadeh, N., Rohde, G. K. and Hoffmann, H. (2020). Wasserstein embedding for graph learning (WEGL). Published at ICLR, per Semantic Scholar. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: Medium (B Medium, C High).
- Method and findings: node embeddings are mapped by Monge maps from a reference to each graph's node-embedding distribution, a fixed-size linear Wasserstein embedding that needs M transport problems instead of M(M-1)/2. Strand C notes that in the appendix a k-means reference and a normal reference gave no significant difference on ogbg-molhiv.
- Correspondence and step: coupling to a fixed reference found by k-means. Graph structure enters only through the node embeddings. Output: an embedding.
- Use: LOT readout for graphs.

[togninalli2019wasserstein] Togninalli, M. et al. (2019). Wasserstein Weisfeiler-Lehman graph kernels (WWL). NeurIPS 2019. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: the Wasserstein distance between Weisfeiler-Lehman node embeddings with a Laplacian kernel, positive definite for categorical labels, at O(n^3 log n).
- Correspondence and step: no template. Output: a kernel.
- Use: transport graph kernels.

[petricmaretic2019got] Petric Maretic, H. et al. (2019). GOT: an optimal transport framework for graph comparison. NeurIPS 2019. Method. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: compares graphs by the Wasserstein distance between the smooth graph-signal distributions they define, and finds the permutation that minimizes it by stochastic exploration, at O(N^3) per iteration.
- Correspondence and step: assumes graphs with the same number of vertices. Output: distance and alignment.
- Use: graph comparison.

[ma2020transport] Ma, K. et al. (2020). Transport based graph kernels. arXiv 2011.00745, preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: method section. Quality: Medium.
- Method and findings: pyramid and subgraph kernels from the L1 Wasserstein distance between eigen-decomposition node embeddings at each pyramid level, with a regularized positive semidefinite variant. The benchmarks include KKI, a brain-network dataset for ADHD.
- Correspondence and step: no template. Output: a kernel.
- Use: transport kernels on brain networks.

[ma2023positive] Ma, K. et al. (2023). Positive definite Wasserstein graph kernel for brain disease diagnosis. MICCAI 2023. Method. Tag (B): support. Read: abstract only (Springer chapter page). Quality: Medium.
- Method and findings: the abstract describes a graph sliced Wasserstein distance between brain functional networks and a kernel on it, reported as positive definite, faster than graph kernels and GNNs, and more accurate for brain disease classification from fMRI.
- Correspondence and step: no template, on atlas-defined networks. Output: a kernel.
- Use: transport kernels in neuroimaging.

[scholkemper2024a] Scholkemper, M. et al. (2024). A Wasserstein graph distance based on distributions of probabilistic node embeddings. ICASSP 2024. Method. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: each node is a probability distribution, each graph a Gaussian mixture of them, compared by the Wasserstein distance between mixtures. Classification by k nearest neighbours.
- Correspondence and step: no template. Output: a distance.
- Use: graph distances.

[khorana2025families] Khorana, R. (2025). Families of optimal transport kernels for cell complexes. arXiv preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): neutral. Read: method section. Quality: Medium.
- Method and findings: kernels between measures on CW complexes from the dual of regularized OT, used for Gaussian processes over cell complexes.
- Correspondence and step: no template. Output: a kernel.
- Use: transport kernels.

[bui2024toward] Bui, T.-C. and Li, W.-S. (2024). Toward interpretable graph classification via concept-focused structural correspondence. Trends and Applications in Knowledge Discovery and Data Mining (PAKDD workshops). Method. Tag (B): neutral. Read: abstract only (Springer chapter page). Quality: Medium.
- Method and findings: the abstract describes case-based classification in which references selected by Euclidean distance are refined by an Earth Mover's Distance with concept-centric node weights.
- Correspondence and step: fixed references. Output: a predictor.
- Use: interpretable reference-based classifiers.

[shifaterabbi2025linear] Shifat-E-Rabbi, M. et al. (2025). Linear optimal transport subspaces for point set classification. Journal of Mathematical Imaging and Vision. Method. Held by strands B and C. Tag (B): neutral. Tag (C): supports. Read: full text (B); abstract and introduction of the arXiv version (C). Quality: Medium (B High, C Medium).
- Method and findings: the LOT transform of point sets gives a convex data space under affine deformations, classified by the nearest LOT subspace with a fixed reference. Strand C reports label efficiency, non-iterative training and accuracy competitive with point-set classifiers.
- Correspondence and step: coupling to a fixed reference, designed for affine deformations, not general non-rigid variation. Output: a predictor.
- Use: transport embeddings that model a deformation class.

[rahman2026geometric] Rahman, M. et al. (2026). Geometric deformation invariant point cloud classification using LOT subspaces. SSRN preprint, not peer reviewed. Benchmark. Tag (B): neutral. Read: abstract only. Quality: Medium.
- Method and findings: the abstract describes a benchmark of LOT nearest-subspace classification under deformation, with 4 to 16 training samples per class.
- Correspondence and step: fixed reference. Output: a predictor.
- Use: label efficiency of LOT classifiers.

[mahan2024point] Mahan, S., Moosmuller, C. and Cloninger, A. (2024). Point cloud classification via deep set linearized optimal transport. arXiv 2401.01460, preprint record; no peer-reviewed version was confirmed in this run. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: Medium.
- Method and findings: input convex neural networks map a shared fixed reference to each point cloud, so that L2 distances between maps approximate Wasserstein-2 distances, and a DeepSets-style head classifies. Strand C reports advantages over the plain deep set approach on a flow cytometry dataset with few labelled clouds.
- Correspondence and step: coupling to a fixed reference, one ICNN map per set, with the approximation holding under the paper's stated assumptions. Output: a predictor.
- Use: LOT embeddings of whole point clouds.

[amir2024fourier] Amir, T. and Dym, N. (2024). Fourier sliced-Wasserstein embedding for multisets and measures (FSW). Published at ICLR, per OpenAlex and Semantic Scholar. Method. Held by strands B and C. Tag (B): neutral. Tag (C): supports. Read: full text (B and C). Quality: Medium (B Medium, C High).
- Method and findings: embeds multisets and measures on R^d into Euclidean space so that the sliced Wasserstein distance is approximately preserved, injective on measures and bi-Lipschitz on multisets at output dimension about 2Nd, with cost O(mNd + mN log N). Strand C notes the paper's statement that sum and max pooling are provably not bi-Lipschitz and often not injective.
- Correspondence and step: permutation invariance through a transport-preserving embedding, with no coupling kept and an output dimension that scales with the maximal set size. Output: an embedding.
- Use: injective set embeddings and the limits of plain pooling.

#### 13. Transport alignment and transport features in neuroimaging and clinical sets (strands B and C)

[thual2022aligning] Thual, A. et al. (2022). Aligning individual brains with fused unbalanced Gromov-Wasserstein (FUGW). NeurIPS 2022. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: High.
- Method and findings: aligns cortical surfaces by matching functional signatures across stimulation settings, while a GW term on geodesic distance matrices penalizes large deformations and an unbalanced term lets functional areas differ in size. Strand C reports higher between-subject correlation of held-out functional data.
- Correspondence and step: the coupling is the inter-subject correspondence. Experiment 1 aligns subjects on fsaverage5, and experiment 2 aligns pairs on their own anatomical meshes, which removes template registration there. The FUGW barycenter keeps its geometry fixed to fsaverage5. Output: alignment, not a clinical outcome.
- Use: the clearest registration-free transport alignment across individual meshes.

[gramfort2015fast] Gramfort, A., Peyre, G. and Cuturi, M. (2015). Fast optimal transport averaging of neuroimaging data. IPMI 2015, LNCS. Method. Held by strands B and C. Tag (B): support. Tag (C): neutral. Read: full text (B and C). Quality: High.
- Method and findings: Kantorovich means of unnormalized measures, linked to entropic barycenters, average activation maps on a voxel grid or cortical surface with a geodesic metric, on a GPU in minutes. Strand C reports that on fMRI from 20 subjects and MEG from 16 the transport average keeps focal activations that Euclidean averaging blurs.
- Correspondence and step: a computed template, not learned against a label. It builds on registration to a common grid or surface and handles residual displacement within it. Output: a group template.
- Use: the transport barycenter as a group template for spatially variable maps.

[feydy2019fast] Feydy, J. et al. (2019). Fast and scalable optimal transport for brain tractograms. MICCAI 2019. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: transfers labels from an atlas to a subject's tractogram by multiscale unbalanced transport on a GPU, with no clustering step.
- Correspondence and step: fixed atlas, coupling as the correspondence. Output: an alignment.
- Use: transport on tractogram point sets.

[gerber2018exploratory] Gerber, S. et al. (2018). Exploratory population analysis with unbalanced optimal transport. MICCAI 2018. Method. Tag (B): neutral. Read: method section. Quality: High.
- Method and findings: unbalanced OT from each subject's tissue segmentation to a template separates changes in mass from changes in location, and the mass-allocation and transport-cost images are correlated voxel-wise with clinical variables on OASIS.
- Correspondence and step: fixed template. Builds on segmentation. Output: embedding images for association.
- Use: transport features as imaging biomarkers.

[gerber2023optimal] Gerber, S. et al. (2023). Optimal transport features for morphometric population analysis. Medical Image Analysis. Method. Tag (B): neutral. Read: full text. Quality: High.
- Method and findings: unbalanced transport features to a template, taken after spatial normalization, correlated voxel-wise with clinical variables.
- Correspondence and step: fixed template after registration. Builds on registration. Output: an embedding.
- Use: transport features after registration.

[mazelet2025unsupervised] Mazelet, S., Flamary, R. and Thirion, B. (2025). Unsupervised learning for optimal transport plan prediction between unbalanced graphs (ULOT). NeurIPS 2025. Method. Tag (B): support. Read: full text. Quality: High.
- Method and findings: a network trained to predict FUGW plans between unbalanced graphs, which amortizes the solver, applied to fMRI.
- Correspondence and step: amortized coupling. Output: an alignment.
- Use: amortized transport for large sets.

[mazelet2026learning] Mazelet, S., Flamary, R. and Thirion, B. (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport. arXiv 2605.20883, preprint, not peer reviewed. Method. Held by strands B and C. Tag (B): support. Tag (C): supports. Read: full text (B and C). Quality: Low (B Medium, C Low).
- Method and findings: an FGW dictionary of fMRI activations over graphs of each individual's geometry, with a network trained by amortized optimization to predict approximate plans. Strand C quotes the paper's statement that projecting each brain onto a common template "removes subject-specific information", and the dictionaries are aimed at tasks such as brain state classification.
- Correspondence and step: coupling to learned dictionary atoms, which removes template projection. The dictionary is learned without a supervised subject-level loss. Output: an embedding.
- Use: registration-free transport dictionaries.

[barbarant2026fast] Barbarant, P.-L., Meyniel, F. and Thirion, B. (2026). Fast whole-brain, geometry-aware functional alignment for cross-subject decoding (SpectralOT). Proceedings of Cognitive Computational Neuroscience 2026. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: each cortical mesh is embedded by Laplace-Beltrami eigenmodes aligned in sign across subjects and joined with functional data. A log-Sinkhorn solver then gives a vertex coupling, which converges orders of magnitude faster than FUGW. The coupling transfers signal across subjects before a population decoder is trained.
- Correspondence and step: coupling between meshes, with no template. Output: alignment, then a separately trained decoder.
- Use: fast mesh-to-mesh transport.

[wang2025linearized] Wang, T. et al. (2025). Linearized optimal transport for analysis of high-dimensional point-cloud and single-cell data. arXiv 2510.22033, preprint record; no peer-reviewed version was confirmed in this run. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: each patient is a single-cell point cloud, classified from its LOT embedding to a fixed reference.
- Correspondence and step: fixed reference. Output: a predictor.
- Use: patient-level transport classifiers.

[pathan2026flowlot] Pathan, N. S. et al. (2026). FlowLOT: linearized optimal transport for flow cytometry analysis. arXiv 2609.17906, preprint, not peer reviewed. Method. Tag (B): support. Read: full text. Quality: Medium.
- Method and findings: classifies AML patients from flow cytometry (BLAST-110 and FlowCAP-II) by LOT to a fixed reference plus subspace classification.
- Correspondence and step: fixed reference. Output: a predictor.
- Use: patient-level transport classifiers.

[gachon2025low] Gachon, E. et al. (2025). Low dimensional representation of multi-patient flow cytometry datasets using optimal transport for measurable residual disease detection in leukemia. Cytometry Part A. Method. Tag (B): support. Read: method section. Quality: High.
- Method and findings: measurements are quantized by a Wasserstein barycenter with shared support, which the authors show is k-means on the mean measure, then embedded by LOT with that barycenter as the reference. A three-component PCA feeds a logistic regression that separates positive from negative residual-disease follow-ups in AML.
- Correspondence and step: computed reference, no label in its construction. Output: a predictor.
- Use: patient-level transport classifiers with a computed reference.

#### 14. Permutation-invariant pooling (strand C)

[amir2024fourier], annotated in family 12, also belongs here.

[maron1997framework] Maron, O. and Lozano-Perez, T. (1997). A framework for multiple-instance learning. NIPS 10. Method, foundational. Tag (C): neutral. Read: method sections, full text. Quality: Medium.
- Method and findings: learning from labelled bags of instances, where a bag is positive if one instance falls within the concept, with Diverse Density as the algorithm. Applied to person description, stock selection and drug activity.
- Correspondence and step: the label is a function of the bag, so no correspondence between instances is needed. The positive-if-any rule is one fixed aggregation, and relations among instances are lost. Two strand C core papers cite it.
- Use: background on multiple-instance learning, which the lesion-set studies inherit.

[zaheer2017deep] Zaheer, M. et al. (2017). Deep Sets. NeurIPS 2017, cited by arXiv 1703.06114. Theory and model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: Theorem 2 states that a function on sets from a countable universe is permutation invariant if and only if it can be written as rho(sum of phi(x)). For uncountable universes the proof covers sets of fixed size only. Lemma 3 gives the equivariant layer. Applied to set regression, anomaly detection and point-cloud classification.
- Correspondence and step: permutation invariance by sum pooling, with no relation between elements before pooling.
- Use: definitions and the base set encoder.

[qi2017pointnet] Qi, C. R., Su, H., Mo, K. and Guibas, L. J. (2017). PointNet: deep learning on point sets for 3D classification and segmentation. CVPR 2017. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: a shared network per point, max pooling as "a single symmetric function", and two alignment networks that predict a spatial and a feature transform toward a canonical pose. A theorem gives approximation of continuous set functions in the Hausdorff distance.
- Correspondence and step: permutation invariance plus a learned rigid canonicalization. PointNet++ states that PointNet does not capture local structure induced by the metric.
- Use: the encoder behind most included medical point-cloud studies.

[wagstaff2019on] Wagstaff, E. et al. (2019). On the limitations of representing functions on sets. ICML 2019, cited by arXiv 1901.09006. Theory. Tag (C): opposes. Read: method sections, full text. Quality: High.
- Method and findings: the earlier universality argument for sum decomposition needs highly discontinuous maps. With continuous maps, a latent dimension at least as large as the largest set is necessary and sufficient for universal representation.
- Correspondence and step: analysis of permutation invariance. Fixed-width sum pooling cannot represent all continuous set functions once sets exceed the latent width.
- Use: limits of pooled encoders for sets of thousands of points.

[murphy2018janossy] Murphy, R. L., Srinivasan, B., Rao, V. and Ribeiro, B. (2018). Janossy pooling: learning deep permutation-invariant functions for variable-size inputs. ICLR 2019, cited by arXiv 1811.01900. Theory and model. Tag (C): neutral. Read: method sections, full text. Quality: High.
- Method and findings: a permutation-invariant function as the average of a permutation-sensitive function over all orderings, made tractable by canonical orderings, k-ary dependencies and permutation sampling. k = 1 recovers Deep Sets, and cost grows with |h|!/(|h|-k)!.
- Correspondence and step: invariance by symmetrization, which trades invariance or interaction order for cost.
- Use: a route between sum pooling and full interaction.

[ilse2018attention] Ilse, M., Tomczak, J. M. and Welling, M. (2018). Attention-based deep multiple instance learning. arXiv 1802.04712, preprint record; no index queried in this run named a venue. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: MIL as learning a Bernoulli bag label, a three-step model (instance embedding, invariant pooling, bag classifier), and attention pooling as a learned weighted average whose weights point to key instances. Evaluated on MNIST-bags and two histopathology sets.
- Correspondence and step: instances have "neither ordering nor dependency", so spatial relations are dropped.
- Use: the pooling of the AMINN attention variant and most medical MIL work.

[kothapalli2023equivariant] Kothapalli, A. et al. (2023). Equivariant vs. invariant layers: a comparison of backbone and pooling for point cloud classification. arXiv 2306.05553, preprint record; Semantic Scholar names the GRaM workshop. Benchmark. Tag (C): neutral. Read: method sections, full text. Quality: Medium.
- Method and findings: equivariant backbones crossed with invariant poolings on three point-cloud datasets. Transport or attention pooling "can significantly boost the performance of simple backbones, but the benefits diminish for more complex backbones", and pooling choice can matter more than backbone size.
- Correspondence and step: compares pooling mechanisms on non-medical data.
- Use: design choices for small cohorts.

#### 15. Set encoders that model relations between elements (strand C)

[qi2017pointnetpp] Qi, C. R., Yi, L., Su, H. and Guibas, L. J. (2017). PointNet++: deep hierarchical feature learning on point sets in a metric space. NeurIPS 2017, cited by arXiv 1706.02413. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: set abstraction levels of sampling, ball grouping and a mini-PointNet per region, stacked into a hierarchy with multi-scale grouping. Captures local structure that PointNet misses.
- Correspondence and step: invariance within and across local regions, with no cross-subject correspondence. Neighbourhoods depend on coordinates, so a global pose difference changes the input.
- Use: the best architecture in the two neonatal cortical surface studies.

[wang2019dynamic] Wang, Y. et al. (2019). Dynamic graph CNN for learning on point clouds. ACM Transactions on Graphics. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: EdgeConv builds a k-nearest-neighbour graph, recomputed in feature space at each layer, and learns edge features. The authors argue that treating points independently "neglects the geometric relationships among points".
- Correspondence and step: permutation invariance, with a quadratic neighbour search and no cross-subject template.
- Use: the relational alternative to pooled encoders.

[lee2018set] Lee, J. et al. (2018). Set Transformer: a framework for attention-based permutation-invariant neural networks. ICML 2019, cited by arXiv 1810.00825. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: self-attention blocks model interactions, induced set attention routes attention through m trainable inducing points to make cost linear in set size, and pooling by multihead attention attends from learnable seeds. The authors state that independent pooling must discard some interaction information.
- Correspondence and step: permutation invariance with learned reference points. Geometry enters only through element features.
- Use: learned reference points, as used for multiple pulmonary nodules.

[baek2021accurate] Baek, J., Kang, M. and Hwang, S. J. (2021). Accurate learning of graph representations with graph multiset pooling. ICLR 2021, cited by arXiv 2102.11533. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: graph readout as multiset encoding, with attention from k seeds to node features whose keys come from a graph network, as powerful as the Weisfeiler-Lehman test under injectivity conditions.
- Correspondence and step: learned seeds. Node identity across subjects is not used, which is a loss when regions do correspond.
- Use: graph-level readout for graphs of regions.

#### 16. Learned prototypes and transport inside pooling (strand C)

The other reference-set methods of strand C ([mialon2020trainable], [naderializadeh2021pooling], [kolouri2020wasserstein], [vincentcuaz2022template], [mahan2024point], [shifaterabbi2025linear]) are annotated in families 11 and 12.

[cheng2022revisiting] Cheng, M. and Xu, H. (2022). Revisiting global pooling through the lens of optimal transport. arXiv 2201.09191, preprint record; no peer-reviewed version was confirmed in this run. Model. Tag (C): neutral. Read: method sections, full text. Quality: Medium.
- Method and findings: mean, max, DeepSet, attention and Set Transformer pooling, among the cases discussed, are special cases of an unbalanced transport problem. UOT-Pooling makes its parameters learnable, with Sinkhorn or Bregman ADMM layers, and imitates or improves conventional poolings.
- Correspondence and step: transport inside the pooling, with no cross-subject reference.
- Use: a unifying account of pooling as transport.

[song2024morphological] Song, A. H. et al. (2024). Morphological prototyping for unsupervised slide representation learning in computational pathology (PANTHER). CVPR 2024. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: patch embeddings of a slide form a Gaussian mixture whose components are prototypes, and the mixture parameters are the slide representation. Section 3.1.1 shows transport aggregation to prototypes as the case with uniform weights. On 13 datasets PANTHER "outperforms or is on par with supervised MIL baselines".
- Correspondence and step: learned prototypes with soft assignment. Patch positions do not enter the representation.
- Use: subject-level prediction from a set of patches with a learned reference.

[song2024multimodal] Song, A. H. et al. (2024). Multimodal prototyping for cancer survival prediction (MMP). ICML 2024, cited by arXiv 2407.00224. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: each slide is summarized by 16 to 32 morphological prototypes and the transcriptome by 50 pathway prototypes, fused by a Transformer. The paper links transport cross-alignment to cross-attention. Six cancer cohorts, survival outcome.
- Correspondence and step: learned prototypes per modality, without the spatial layout of patches.
- Use: multimodal fusion of sets of different sizes.

#### 17. Transport couplings between subjects, modalities and parcellations (strand C)

[thual2022aligning], [gramfort2015fast] and [mazelet2026learning], held by strands B and C, are annotated in family 13.

[xu2023multimodal] Xu, Y. and Chen, H. (2023). Multimodal optimal transport-based co-attention transformer with global structure consistency for survival prediction (MOTCat). ICCV 2023. Model. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: a transport plan between histology patch instances and genomic instances replaces dense co-attention, solved over micro-batches, with higher concordance than prior multimodal methods on five TCGA cohorts.
- Correspondence and step: coupling between modalities within a subject. Patch positions enter only through patch features.
- Use: a coupling between two sets of different sizes used for an outcome.

[janati2019group] Janati, H., Bazeille, T., Thirion, B., Cuturi, M. and Gramfort, A. (2019). Group level MEG/EEG source imaging via optimal transport: minimum Wasserstein estimates. IPMI 2019. Model. Tag (C): opposes. Read: method sections, full text. Quality: High.
- Method and findings: multi-task regression across subjects with an unbalanced transport penalty that promotes support proximity, with subject-specific noise. Joint estimation improves group source localization.
- Correspondence and step: coupling between subjects, while each subject's source space "is mapped to a high resolution average brain using morphing". Builds on registration.
- Use: transport between subjects' supports inside an estimation model.

[bazeille2021empirical] Bazeille, T. et al. (2021). An empirical evaluation of functional alignment using inter-subject decoding. NeuroImage. Benchmark. Tag (C): supports, with the registration reliance stated. Read: method sections, full text. Quality: High.
- Method and findings: piecewise Procrustes, searchlight Procrustes, piecewise entropic transport, shared response modelling and intra-subject alignment on four fMRI datasets, scored by decoding on left-out subjects. Functional alignment generally improves inter-subject decoding over anatomical alignment, and transport performs well.
- Correspondence and step: coupling within parcels after anatomical alignment. Builds on registration.
- Use: the predictive test of transport alignment.

[dadashkarimi2023cross] Dadashkarimi, J. et al. (2023). Cross atlas remapping via optimal transport (CAROT). Medical Image Analysis. Algorithm. Tag (C): supports. Read: method sections, PubMed Central author manuscript. Quality: High.
- Method and findings: fMRI time series mapped from a source atlas to an unavailable target atlas by a plan whose cost is a functional distance. Reconstructed connectomes predict fluid intelligence in HCP (n = 515) and sex in REST-meta-MDD (1,005 controls).
- Correspondence and step: coupling between parcellations, after registration of each dataset to MNI. It removes re-parcellation of raw data.
- Use: transport between region sets that do not correspond.

[su2015shape] Su, Z., Zeng, W., Wang, Y., Lu, Z.-L. and Gu, X. (2015). Shape classification using Wasserstein distance for brain morphometry analysis. IPMI 2015. Algorithm. Tag (C): supports. Read: method sections, PubMed Central author manuscript. Quality: Medium.
- Method and findings: each FreeSurfer surface is conformally mapped to the sphere, the area distortion gives a measure, and Wasserstein distances between subjects come from optimal mass transport on the sphere, classified by k nearest neighbours. On 100 subjects three IQ classes were classified at 78.57 percent, against 53.57 to 67.85 percent for SVMs on area and curvature.
- Correspondence and step: transport on a canonical domain, which removes surface registration to a template while relying on FreeSurfer reconstruction.
- Use: subject-level prediction from cortical shape without vertex correspondence.

#### 18. Medical imaging studies with set or point-cloud encoders (strands C and D)

[gutierrezbecker2018deep] Gutierrez-Becker, B. and Wachinger, C. (2018). Deep multi-structural shape analysis: application to neuroanatomy. MICCAI 2018. Application method. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: FreeSurfer segmentation, point clouds of 512 points on each structure boundary, and a multi-branch PointNet with spatial transformers. Classifies controls, MCI and Alzheimer's disease in ADNI from hippocampus and ventricle clouds, and regresses brain age.
- Correspondence and step: removes point correspondence and mesh processing, and builds on segmentation.
- Use: subject-level outcome from point clouds without point correspondence.

[chen2022white] Chen, Y. et al. (2022). White matter tracts are point clouds: neuropsychological score prediction and critical region localization via geometric deep learning. MICCAI 2022. Application method. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: the left arcuate fasciculus of each subject is a point cloud with five channels per point, and a point network with a paired-Siamese loss predicts the NIH Toolbox vocabulary score in 806 HCP subjects.
- Correspondence and step: removes along-tract resampling and point correspondence. Tract identification is not described in the passages read, and the reference list cites a fiber clustering atlas.
- Use: subject-level regression from a tract point cloud.

[chen2024tractgeonet] Chen, Y. et al. (2024). TractGeoNet: a geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance. Medical Image Analysis. Application method. Tag (C): opposes (registration kept). Read: method sections, full text. Quality: High.
- Method and findings: the 2022 method extended to 20 tracts and two language scores, with the left arcuate fasciculus the most predictive.
- Correspondence and step: tracts identified with the WMA fiber clustering pipeline and the ORG atlas, with points in atlas coordinates. Builds on registration.
- Use: where a point-cloud pipeline still depends on registration.

[xue2023tractcloud] Xue, T. et al. (2023). TractCloud: registration-free tractography parcellation with a novel local-global streamline point cloud representation. MICCAI 2023. Application method. Tag (C): supports. Read: method sections, full text. Quality: High.
- Method and findings: each streamline is classified from a point cloud that adds neighbouring and whole-brain streamlines, trained with synthetic transformations, so parcellation runs in subject space.
- Correspondence and step: removes affine or nonrigid registration. The outcome is streamline labels, not a subject-level outcome.
- Use: a pipeline step removed by a set encoder.

[vosylius2020geometric] Vosylius, V. et al. (2020). Geometric deep learning for post-menstrual age prediction based on the neonatal white matter cortical surface. MICCAI UNSURE and GRAIL workshops 2020. Comparison. Tag (C): supports. Read: method sections, full text. Quality: Medium.
- Method and findings: PointNet++, MeshCNN and a graph CNN on dHCP surfaces decimated to 10,000 vertices, against a 3D CNN. PointNet++ with thickness, curvature and sulcal depth reached a test MAE of 0.62 weeks, against 0.82 for the 3D CNN.
- Correspondence and step: permutation invariance, building on surface extraction. Registration is not stated in the passages read.
- Use: point-cloud prediction from cortical surfaces.

[fawaz2021benchmarking] Fawaz, A. et al. (2021). Benchmarking geometric deep learning for cortical segmentation and neurodevelopmental phenotype prediction. bioRxiv, preprint, not peer reviewed. Benchmark. Tag (C): supports and opposes. Read: method sections, full text (bioRxiv). Quality: Medium.
- Method and findings: spherical surface networks on MSM-registered and native data, with and without rotations, against PointNet++ and a spectral GCN on native meshes. Non-equivariant spherical models went from errors within a week to over a month on rotated unregistered data. PointNet++ on native meshes gave MAE 0.512 weeks for post-menstrual age and 1.15 weeks for gestational age at birth.
- Correspondence and step: removes MSM registration for the native models and builds on surface reconstruction.
- Use: direct evidence on the cost of removing registration, by architecture.

[chen2021aminn] Chen, J., Cheung, H. M. C., Milot, L. and Martel, A. L. (2021). AMINN: autoencoder-based multiple instance neural network improves outcome prediction in multifocal liver metastases. MICCAI 2021, LNCS. Application method. Held by strands C and D. Tag (C): supports. Tag (D): supports. Read: method sections (C) and methods and results of the arXiv version 2012.06875 (D). Quality: Medium (C High, D Medium).
- Method and findings: each tumour is an instance of pyradiomics features from contrast-enhanced MRI. An autoencoder branch and a MIL branch with max, average, log-sum-exp or attention pooling predict 3-year survival. AUC 0.70, 11.4 percent above LASSO logistic regression on the largest tumour. Average pooling was best, and strand D notes that the authors attribute the weaker attention result to sample size.
- Correspondence and step: no correspondence between lesions, a bag of variable size. Builds on manual slice-by-slice delineation, since nnU-Net segmentation was unsatisfactory, and on radiomics. No segmentation error was measured. Lesion location and relations are lost.
- Use: the included source closest to a set encoder over radiomic lesion features, and a baseline.

[chen2022metastatic] Chen, J. and Martel, A. L. (2022). Metastatic cancer outcome prediction with injective multiple instance pooling. arXiv 2203.04964, preprint, not peer reviewed. Application method. Tag (C): supports. Read: method sections, full text. Quality: Medium.
- Method and findings: a benchmark of 341 patients with several tumours from TCIA HN1 and Lung1. Radiomic features per tumour feed a MIL network with two injective poolings, with patient risk modelled as cumulative tumour risk. The authors report state-of-the-art results and name a lack of expressiveness in common MIL networks.
- Correspondence and step: injective pooling. Builds on the distributed segmentations and on radiomics.
- Use: the expressiveness argument applied to lesion sets.

[yang2020relational] Yang, J. et al. (2020). Relational learning between multiple pulmonary nodules via deep set attention transformers (NoduleSAT). ISBI 2020. Application method. Tag (C): supports. Read: method sections, full text. Quality: Medium.
- Method and findings: a 3D DenseNet encodes each nodule, and a set attention transformer refines it using the patient's other nodules. Relations improve false positive reduction and multiple-nodule malignancy classification.
- Correspondence and step: self-attention over lesions, building on nodule detection and cropping. Position is lost unless encoded.
- Use: a lesion-set encoder that keeps relations.

[zhang2020survival] Zhang, X. et al. (2020). Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach. European Radiology. Application method. Tag (C): supports. Read: structured abstract only. Quality: Low.
- Method and findings: the abstract reports tumour regions delineated on normalized MRI of 104 patients, K-means clustering into three global clusters giving 294 subregions, radiomics per subregion, and a subregion MIL model with 87.88 percent stratification accuracy on 33 test patients.
- Correspondence and step: MIL with a global clustering as a shared reference. Builds on segmentation and radiomics.
- Use: a region set without correspondence between patients.

[luo2022prediction] Luo, X. et al. (2022). Prediction of cerebral aneurysm rupture using a point cloud neural network. Journal of NeuroInterventional Surgery. Application method. Tag (C): supports. Read: structured abstract only. Quality: Medium.
- Method and findings: the abstract reports a point-cloud network on aneurysm models from CTA (n = 180) or MRA (n = 238), with internal AUC 0.913 against 0.803 for ridge regression on radiomics, and external AUC 0.835 against 0.681 to 0.701.
- Correspondence and step: removes radiomics extraction, and builds on aneurysm and vessel segmentation whose method is not in the abstract.
- Use: a point-cloud encoder in place of radiomics for a vessel shape.

#### 19. Registration, templates and spatial normalization (strand D)

[sotiras2013deformable] Sotiras, A., Davatzikos, C. and Paragios, N. (2013). Deformable medical image registration: a survey. IEEE TMI, 32(7), 1153-1190. Review. Tag (D): neutral. Read: methods and results sections of the full text (PMC). Quality: High.
- Method and findings: decomposes deformable registration into deformation model, matching criterion and optimization, and names population modelling and statistical atlases as a main use. Registering a normal atlas to a brain with a tumour is a topological mismatch that needs a growth model. The discussion states that registration is hard to validate because the true correspondences are unknown.
- Correspondence and step: a dense smooth map to a template. Concerns the registration step.
- Use: the reference account of the step that methods for non-aligned data remove.

[haskins2020deep] Haskins, G., Kruger, U. and Yan, P. (2020). Deep learning in medical image registration: a survey. Machine Vision and Applications, 31. Review. Tag (D): neutral. Read: full text (arXiv 1903.02026v2), introduction, atlas passages and conclusion. Quality: Medium.
- Method and findings: traces learning-based registration from learned similarity metrics to direct transformation prediction. Open problems named: no robust multimodal metric, few large datasets, scarce ground truth, and uncertainty quantification.
- Correspondence and step: dense voxel maps. Concerns registration.
- Use: background on learning-based alignment.

[fu2020deep] Fu, Y. et al. (2020). Deep learning in medical image registration: a review. Physics in Medicine and Biology, 65(20), 20TR01. Review. Tag (D): neutral. Read: full text (PMC), benchmark and discussion sections. Quality: Medium.
- Method and findings: over 150 papers in seven categories. On DIRLAB lung landmarks the listed deep methods had not reached the error of the best traditional methods. Brain papers used no common database or metric, and Dice over regions was most common.
- Correspondence and step: dense voxel correspondence, with accuracy measured on benchmarks only. Concerns registration.
- Use: registration benchmarks.

[chen2025a] Chen, J. et al. (2025). A survey on deep learning in medical image registration: new technologies, uncertainty, evaluation metrics, and beyond. Medical Image Analysis, 100, 103385. Review. Tag (D): neutral. Read: full text (PMC), atlas, uncertainty and metamorphic sections. Quality: High.
- Method and findings: atlases built by iterative averaging blur regions of high-frequency deformation, and atlases learned during training cannot be rebuilt at test time. Registering an atlas to an image with a tumour violates the one-to-one assumption of diffeomorphic registration. Registration uncertainty has no ground truth, and its use as a weight in atlas-based segmentation is named as unexplored.
- Correspondence and step: dense diffeomorphic correspondence, which fails where pathology has no counterpart. Concerns registration and atlas construction.
- Use: discussion of registration uncertainty and lesioned images.

[hering2023learn2reg] Hering, A. et al. (2023). Learn2Reg: comprehensive multi-task medical image registration challenge, dataset and evaluation in the era of deep learning. IEEE TMI, 42(3), 697-712. Benchmark. Tag (D): neutral. Read: full text (arXiv 2112.04489v3), tasks, OASIS results and label-bias analysis. Quality: High.
- Method and findings: over 65 submissions on brain, abdomen and thorax tasks. No single approach was best, and conventional methods were not necessarily slower. On OASIS inter-subject brains most methods reached Dice of 80 to 90 percent on easier cases. Inter-patient tasks lost accuracy on structures left out of training labels.
- Correspondence and step: anatomical correspondence by label overlap, weaker for unsupervised structures. Concerns registration.
- Use: how well subjects can be brought into correspondence, and a registration baseline.

[avants2011a] Avants, B. B. et al. (2011). A reproducible evaluation of ANTs similarity metric performance in brain image registration. NeuroImage, 54(3), 2033-2044. Tool evaluation, foundational. Tag (D): neutral. Read: full text (PMC), methods and results. Quality: High.
- Method and findings: two-fold cross-validation on 40 labelled brains (LPBA40) of three metrics in ANTs template normalization. Mutual information for the affine step with cross-correlation for the diffeomorphic step gave the best labelling (Jaccard 0.669). Templates from different subgroups agreed beyond human rater repeatability.
- Correspondence and step: one diffeomorphic map per subject to a population template. Concerns registration.
- Use: the ANTs registration used by Juhling 2024 and Thakran 2022, as a registration baseline.

[avants2009advanced] Avants, B., Tustison, N. J. and Song, G. (2009). Advanced Normalization Tools: V1.0. The Insight Journal. Technical report, foundational; the review process of the venue was not checked in this run. Tag (D): neutral. Read: full text (Insight Journal PDF), template and lesion sections. Quality: Medium.
- Method and findings: documents ANTs transformation models, metrics and optimal template construction, which stabilizes at about ten images for most populations. For brains with lesions, which "violate the basic assumption of a one-to-one mapping", ANTs offers constrained cost function masking, with the lesion carried to template space by the inverse transform.
- Correspondence and step: a diffeomorphic map to a template, outside a masked lesion for lesioned brains. Concerns registration.
- Use: the tool and masking procedure Pustina 2017 names as its alignment step.

[shamonin2013fast] Shamonin, D. P. et al. (2013). Fast parallel image registration on CPU and GPU for diagnostic classification of Alzheimer's disease. Frontiers in Neuroinformatics, 7. Tool paper with a classification study. Tag (D): neutral. Read: methods and results, full text. Quality: Medium.
- Method and findings: accelerated elastix, then SVM classification of Alzheimer's disease in 299 ADNI participants from voxel-wise template-space features and from 72 regions labelled by multi-atlas segmentation. AUC 88 percent (voxel) and 90 percent (region), unchanged by the speed-up.
- Correspondence and step: voxel correspondence to a template, or matched regions. Builds on registration, with region volumes as a fixed-length vector.
- Use: the standard voxel-wise and region-wise pipeline, and a region-wise baseline.

[thakran2022impact] Thakran, S. et al. (2022). Impact of deformable registration methods for prediction of recurrence free survival response to neoadjuvant chemotherapy in breast cancer: results from the ISPY 1/ACRIN 6657 trial. Translational Oncology, 20, 101411. Empirical study. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: six deformable methods aligned two DCE-MRI visits of 130 women, and radiomic features of parametric response maps entered Cox models. Without registration the radiomic model reached a C-statistic of 0.66 (cross-validated 0.55). With ANTs it reached 0.72 (cross-validated 0.63), the only significant improvement (p = 0.01). The C-statistic followed the landmark-error ranking, and twelve scans were excluded for failed registration.
- Correspondence and step: intra-subject voxel correspondence between visits, feeding radiomics. Measures how the registration choice changes a subject-level prediction.
- Use: the one included study with a registration-free variant of the same features.

[juhling2024spatial] Juhling, D. et al. (2024). Spatial normalization for voxel-based lesion symptom mapping: impact of registration approaches. Frontiers in Neuroscience, 18. Empirical study. Tag (D): supports (for distortion). Read: methods and results, full text. Quality: Medium.
- Method and findings: lesion maps of 122 acute stroke patients normalized by affine, nonlinear, masked and enantiomorphic ANTs registration, then mapped against 30-day mRS. The important areas were largely consistent across approaches. Nonlinear variants distorted the images, and the ventricles stayed misaligned with the atlas. The authors question the benefit of nonlinear registration here.
- Correspondence and step: lesioned brains to a healthy template. Measures distortion and lesion volume change.
- Use: what registration does to lesion maps before outcome modelling.

[arthofer2024internally] Arthofer, C. et al. (2024). Internally consistent and fully unbiased multimodal MRI brain template construction from UK Biobank: Oxford-MM. Imaging Neuroscience, 2. Method. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: an unbiased T1, FLAIR and DTI template from 240 individuals and age-dependent templates from 37,330. On 128 held-out subjects, pairwise Dice of warped regions was 13.17 percent higher (cortical) and 4.74 percent higher (subcortical) with OMM-1 than with MNI 152. The authors note that this overlap mixes segmentation and registration error.
- Correspondence and step: a common reference of the population's average shape. Shows that the template itself is a source of alignment error.
- Use: related work on templates.

[dalca2019learning] Dalca, A. V., Rakic, M., Guttag, J. and Sabuncu, M. R. (2019). Learning conditional deformable templates with convolutional networks. NeurIPS 2019. Method. Tag (D): neutral. Read: methods and results, full text. Quality: High.
- Method and findings: a probabilistic diffeomorphic model whose network learns a universal or attribute-conditional template jointly with registration. The authors note that a template chosen from one image can bias analyses.
- Correspondence and step: every image is a smooth deformation of a learned template. Concerns registration.
- Use: the learned-template answer on the registration side.

[dey2021generative] Dey, N., Ren, M., Dalca, A. V. and Gerig, G. (2021). Generative adversarial registration for improved conditional deformable templates. ICCV 2021. Method. Tag (D): neutral. Read: full text (arXiv 2105.04349v2), introduction, data and evaluation. Quality: High.
- Method and findings: adversarial training of conditional templates and registration. Templates from regularized objectives alone are often blurry, while the adversarial ones were sharper and more specific to age and disease on dHCP, Predict-HD and face data, at comparable Dice.
- Correspondence and step: deformation of a covariate-conditioned template. Concerns registration.
- Use: learned templates as reference spaces.

[abulnaga2025multimorph] Abulnaga, S. M. et al. (2025). MultiMorph: on-demand atlas construction. CVPR 2025. Method. Tag (D): neutral. Read: full text (PMC), method and ablation. Quality: High.
- Method and findings: a feedforward network builds a population-specific atlas in one pass, over 100 times faster than ANTs and AtlasMorph on IXI with the highest Dice. The authors report that the cost of a new atlas leads most studies to use ill-suited existing atlases. Its group layer concatenates the mean of feature maps across a set of any size to each image.
- Correspondence and step: group-wise correspondence to a space of zero mean deformation. Concerns registration.
- Use: a learned template whose group layer is the permutation-invariant mean that set encoders use.

[hess2018on] Hess, A., Hinz, R., Keliris, G. A. and Boehm-Sturm, P. (2018). On the usage of brain atlases in neuroimaging research. Molecular Imaging and Biology, 20(5), 742-749. Review. Tag (D): neutral. Read: abstract only. Quality: Low.
- Method and findings: the abstract describes atlas databases and registration-based workflows.
- Correspondence and step: atlas labels transferred by registration. Concerns registration.
- Use: introduction background.

[nenoff2023review] Nenoff, L. et al. (2023). Review and recommendations on deformable image registration uncertainties for radiotherapy applications. Physics in Medicine and Biology, 68(24), 24TR01. Review. Tag (D): supports. Read: full text (Europe PMC), uncertainty and outcome-modelling sections. Quality: Medium.
- Method and findings: registration uncertainty can be large and hard to quantify, and its reporting is not standardized. In voxel-based outcome models each dose map is registered to an arbitrary reference CT, and blurring to absorb uncertainty lowers the significance of small radiosensitive regions and changes their shape.
- Correspondence and step: correspondence of each patient to one reference anatomy, ahead of a dose-outcome model. Builds on registration.
- Use: discussion of registration error in subject-level outcome models.

[coll2023global] Coll, L. et al. (2023). Global and regional deep learning models for multiple sclerosis stratification from MRI. Journal of Magnetic Resonance Imaging, 60(1), 258-267. Empirical study. Tag (D): supports. Read: methods and results, full text (UAB repository). Quality: Medium.
- Method and findings: a 3D CNN classifies EDSS of 3 or more from whole-brain or regional input in 319 patients, with external validation on 440. In-house the grey matter model reached 81 percent and the global model 79 percent, externally 72 and 71 percent.
- Correspondence and step: linear and nonlinear registration to MNI152, Jacobian modulation, and lesion filling before parcellation. Builds on registration and segmentation, with lesions filled in rather than used as a set.
- Use: subject-level MS prediction resting on template registration.

[brett2001spatial] Brett, M., Leff, A. P., Rorden, C. and Ashburner, J. (2001). Spatial normalization of brain images with focal lesions using cost function masking. NeuroImage, 14(2), 486-500. Method evaluation, foundational. Tag (D): supports. Read: abstract only. Quality: High.
- Method and findings: the abstract reports that automated normalization reduces mismatch at the lesion and can distort the image, and that masking the lesion from the cost function outperformed affine-only normalization.
- Correspondence and step: correspondence outside the lesion, none inside. Concerns registration of lesioned brains.
- Use: the evidence that a lesion breaks the correspondence assumption of template registration.

[crinion2007spatial] Crinion, J. et al. (2007). Spatial normalization of lesioned brains: performance evaluation and impact on fMRI analyses. NeuroImage, 37(3), 866-875. Evaluation, foundational. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: simulated lesions in ten brains and 24 landmarks compared affine, nonlinear and unified segmentation normalization with and without masking. Unified segmentation stayed closer to the unlesioned deformation (RMSD 1.64 mm against 5.29 mm), and the choice of normalization changed group fMRI activations in 18 stroke patients. Normalization error is largest inside the lesion and also affects nearby tissue.
- Correspondence and step: correspondence to a healthy template, with the lesion modelled or masked. Measures the change in a group result.
- Use: the size of normalization error caused by a lesion.

[nachev2008enantiomorphic] Nachev, P., Coulthard, E., Jager, H. R., Kennard, C. and Husain, M. (2008). Enantiomorphic normalization of focally lesioned brains. NeuroImage, 39(3), 1215-1226. Method with evaluation, foundational. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: the lesion is replaced by the mirrored signal of the other hemisphere before normalization. With 305 real lesion shapes inserted into 92 brains, it beat cost function masking for every subject and lesion, by more than a factor of four on average in the T2 data, and error rose with lesion size.
- Correspondence and step: the healthy contralateral tissue supplies the missing correspondence, assuming hemispheric symmetry. Concerns registration.
- Use: an alignment tool used ahead of lesion-based predictors.

[andersen2010cost] Andersen, S. M., Rapcsak, S. Z. and Beeson, P. M. (2010). Cost function masking during normalization of brains with focal lesions: still a necessity? NeuroImage, 53(1), 78-84. Evaluation, foundational. Tag (D): supports. Read: full text (PMC), methods and results. Quality: High.
- Method and findings: 49 patients with vascular lesions normalized without and with precise or rough masks, plus simulated lesions. Unmasked normalization differed from the masked reference by 1.07 mm RMS and gave significantly smaller lesion volumes. The effect came from large lesions, and rough masks matched precise ones.
- Correspondence and step: correspondence outside the lesion. Measures normalization error and lesion volume change.
- Use: registration changes lesion volume, a common input of lesion-load predictors.

[ripolles2012analysis] Ripolles, P. et al. (2012). Analysis of automated methods for spatial normalization of lesioned brains. NeuroImage, 60(2), 1296-1306. Benchmark, foundational. Tag (D): supports. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports 500 artificial lesions and a comparison of masking, automatic lesion identification, DARTEL and SyN with constrained masking. DARTEL with an extra prior was most accurate and shrank lesion volume relative to unified segmentation with masking.
- Correspondence and step: correspondence to a healthy template. Measures normalization accuracy and lesion volume change.
- Use: discussion of registration error.

#### 20. Radiomics standardization, reproducibility and reviews (strand D)

[zwanenburg2020the] Zwanenburg, A. et al. (2020). The Image Biomarker Standardization Initiative: standardized quantitative radiomics for high-throughput image-based phenotyping. Radiology, 295(2), 328-338. Standardization study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: High.
- Method and findings: a consensus of 25 teams on a phantom, a lung CT and a sarcoma cohort standardized 169 of 174 features, and most reproduced well on CT, PET and MRI. Every team used the supplied tumour segmentation. The authors state that acquisition, reconstruction and segmentation remain sources of variability outside the study.
- Correspondence and step: features inside each segmented region, no correspondence across subjects. Concerns radiomics, with segmentation held fixed.
- Use: feature definitions.

[whybra2024the] Whybra, P. et al. (2024). The Image Biomarker Standardization Initiative: standardized convolutional filters for reproducible radiomics and enhanced clinical insights. Radiology, 310(2). Standardization study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: High.
- Method and findings: eight filter types standardized (Riesz not), with 458 of 486 filtered features reproducible across nine teams. Segmentation and acquisition were steps outside the study.
- Correspondence and step: no correspondence across subjects. Concerns radiomics.
- Use: completes the per-lesion feature standard.

[traverso2018repeatability] Traverso, A., Wee, L., Dekker, A. and Gillies, R. (2018). Repeatability and reproducibility of radiomic features: a systematic review. International Journal of Radiation Oncology, Biology, Physics, 102(4), 1143-1158. Systematic review. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: 41 full texts. Reproducibility depends on acquisition, reconstruction, preprocessing and software, and first-order features are more reproducible than shape and texture. Only 7 of 35 human studies reported every aspect. Studies of multiple delineations found that observer differences affected reproducibility.
- Correspondence and step: concerns radiomics including the delineation of each region.
- Use: per-lesion features carry pipeline and delineation variability into any aggregate.

[pfaehler2021a] Pfaehler, E. et al. (2021). A systematic review and quality of reporting checklist for repeatability and reproducibility of radiomic features. Physics and Imaging in Radiation Oncology, 20, 69-75. Systematic review. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: 42 full texts. All features were sensitive to acquisition, reconstruction, segmentation and interpolation. In one PET study sphericity changed its prognostic value with the delineation, and contours by different clinicians changed prognostic value in CT studies.
- Correspondence and step: concerns radiomics and its segmentation input.
- Use: segmentation variability that reaches prognostic models.

[zhao2021understanding] Zhao, B. (2021). Understanding sources of variation to improve the reproducibility of radiomics. Frontiers in Oncology, 11. Review. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: sources of variation at each step of the radiomics workflow in lung cancer. Segmentation difficulty varies by disease site. A cited pilot study found EGFR prediction AUCs of 0.79, 0.85 and 0.91 for three radiologists' segmentations, with a different top feature each time.
- Correspondence and step: concerns radiomics and segmentation.
- Use: inter-reader segmentation changing a patient-level prediction.

[lambin2017radiomics] Lambin, P. et al. (2017). Radiomics: the bridge between medical imaging and personalized medicine. Nature Reviews Clinical Oncology, 14(12), 749-762. Review. Tag (D): neutral. Read: abstract only. Quality: High.
- Method and findings: the abstract describes the radiomics process and its pitfalls and states that the field lacks standardized evaluation of scientific integrity and clinical relevance. It is the source of the radiomics quality score.
- Correspondence and step: concerns radiomics.
- Use: introduction.

[spadarella2022systematic] Spadarella, G. et al. (2022). Systematic review of the radiomics quality score applications: an EuSoMII Radiomics Auditing Group initiative. European Radiology, 33(3), 1884-1894. Review of reviews. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: 44 systematic reviews reporting the radiomics quality score, 40 in oncology and 10 in neuroradiology, with a median score of 21.00 percent and no difference between domains. The authors note that the score fits deep learning studies poorly.
- Correspondence and step: concerns radiomics-based outcome prediction.
- Use: the state of radiomic outcome prediction as reviews assess it.

[aerts2014decoding] Aerts, H. J. W. L. et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach. Nature Communications, 5. Empirical study, foundational. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: 440 CT features from 1,019 lung and head and neck patients. Many features had prognostic power in independent sets, and a signature of intratumour heterogeneity was associated with gene expression. Feature stability under five oncologists' contours of 21 patients was used to select the 100 most stable features.
- Correspondence and step: one segmented primary tumour per patient, no aggregation. Builds on segmentation and radiomics.
- Use: the single-lesion design that multi-lesion work generalizes. Cited by three of the four core papers strand D chained.

[vangriethuysen2017computational] van Griethuysen, J. J. M. et al. (2017). Computational radiomics system to decode the radiographic phenotype. Cancer Research, 77(21), e104-e107. Software. Tag (D): neutral. Read: whole full text (PMC). Quality: High.
- Method and findings: the PyRadiomics platform. In LIDC-IDRI (429 nodules, four radiologist segmentations each) stability across segmentations was high for first-order and texture features (median ICC 0.88 to 0.91) and moderate for shape (0.60) and wavelet (0.63), and a random forest on 25 stable features reached AUC 0.79.
- Correspondence and step: each nodule is a sample. Concerns radiomics, with sensitivity to delineation measured.
- Use: the extraction tool named by Sabouri 2025 and Gharibi 2026.

[kumar2012radiomics] Kumar, V. et al. (2012). Radiomics: the process and the challenges. Magnetic Resonance Imaging, 30(9), 1234-1248. Review, foundational. Tag (D): neutral. Read: methods and results, full text (PMC). Quality: Medium.
- Method and findings: manual boundaries "suffer from significant inter-reader bias", and partly solid nodules remain hard to segment. Features are qualified by test-retest reproducibility, dynamic range and redundancy before modelling.
- Correspondence and step: one tumour per sample. Concerns radiomics.
- Use: an early feature qualification rule.

[gillies2016radiomics] Gillies, R. J., Kinahan, P. E. and Hricak, H. (2016). Radiomics: images are more than pictures, they are data. Radiology, 278(2), 563-577. Review. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: calls segmentation "the most critical, challenging, and contentious component of radiomics", notes that "most patients with cancer metastasis have multiple lesions", and describes habitats within a tumour, with no rule for combining lesions or habitats.
- Correspondence and step: concerns radiomics and segmentation.
- Use: the multi-lesion setting stated without an aggregation method.

[liu2019the] Liu, Z. et al. (2019). The applications of radiomics in precision diagnosis and treatment of oncology: opportunities and challenges. Theranostics, 9(5), 1303-1322. Review. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: states that "it is the entire primary tumor that is usually analyzed", that tumour segmentation has no gold standard, and that features unstable across readers are removed by ICC.
- Correspondence and step: one primary tumour per patient. Concerns radiomics.
- Use: the single-tumour default across cancer types.

[vantimmeren2020radiomics] van Timmeren, J. E. et al. (2020). Radiomics in medical imaging: "how-to" guide and critical reflection. Insights into Imaging, 11(1), 91. Review. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: manual and semi-automatic segmentation introduce observer bias, and many features are not robust to delineation. The common response, removing unstable features, can remove informative ones, and harmonization is the alternative named.
- Correspondence and step: concerns radiomics.
- Use: how pipeline factors change radiomic inputs.

[traverso2020machine] Traverso, A. et al. (2020). Machine learning helps identifying volume-confounding effects in radiomics. Physica Medica, 71, 24-30. Empirical study. Tag (D): supports. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports that over 80 percent of 841 features were highly correlated and nearly 30 percent correlated strongly with tumour volume, and that clinical predictors outperformed radiomic features.
- Correspondence and step: one tumour per patient. Concerns radiomic feature selection.
- Use: volume confounding, which an aggregate over lesions can carry through total volume.

[poirot2022robustness] Poirot, M. G. et al. (2022). Robustness of radiomics to variations in segmentation methods in multimodal brain MRI. Scientific Reports, 12(1). Empirical study. Tag (D): supports. Read: methods and results, full text. Quality: Medium.
- Method and findings: scan-rescan T1 and DTI of 46 subjects segmented by four automatic methods. Agreement was high (Dice IQR 0.77 to 0.90) and robustness to segmentation exceeded scan-rescan reproducibility, yet classification accuracy differed significantly between methods, from 77 to 84 percent.
- Correspondence and step: matched anatomical regions across subjects. Builds on segmentation and measures its effect on a subject-level classifier.
- Use: propagation of segmentation choice into prediction.

#### 21. Aggregation of per-lesion and per-region features into a subject-level input (strand D)

[chen2021aminn], held by strands C and D, is annotated in family 18.

[chang2021comparison] Chang, E. et al. (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors. Scientific Reports, 11(1). Empirical study. Tag (D): supports. Read: methods and results, full text. Quality: High.
- Method and findings: six aggregation rules over 3,596 brain metastases in 831 patients with Cox, Cox-LASSO and random survival forests. The volume-weighted average of the largest three gave the highest C-index in all three models (0.627, 0.628, 0.652). By lesion count, the unweighted average was best for 5 to 10 metastases (0.697) and largest plus count for 11 or more (0.909).
- Correspondence and step: no correspondence between lesions. Builds on manual segmentation and radiomics. The rule changes the C-index by about 0.03.
- Use: the reference comparison of fixed pooling rules, and baselines.

[henry2022investigation] Henry, T. et al. (2022). Investigation of radiomics based intra-patient inter-tumor heterogeneity and the impact of tumor subsampling strategies. Scientific Reports, 12(1). Empirical study. Tag (D): supports. Read: methods and results, full text. Quality: Medium.
- Method and findings: all visible tumours delineated in 43 lung cancer patients (602 lesions) and a melanoma cohort. Robust indexes varied by at least 20 percent across a patient's lesions, and no subsampling strategy recovered the heterogeneity of exhaustive sampling.
- Correspondence and step: lesion selection after segmentation. Measures the information lost by subsampling.
- Use: keeping one or a few lesions loses subject-level information.

[geady2025radiomic] Geady, C., Patel, H., Peoples, J., Simpson, A. and Haibe-Kains, B. (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review. BMC Cancer, 25(1). Quantitative review with replication. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: ten published aggregation rules replicated on three datasets (16,894 lesions, 3,930 patients) against total tumour volume. No rule consistently beat the others or total volume. In liver metastases the volume-weighted average reached 0.842 for three or more lesions, in sarcoma concatenation was best (0.673), and in head and neck total volume stayed strongest.
- Correspondence and step: no correspondence between lesions, and concatenation and N-largest rules impose an order by size. Concerns aggregation of radiomics.
- Use: the widest comparison of fixed rules, and baselines.

[wilk2025towards] Wilk, A. M. et al. (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: finding a strategy of aggregating lesions. Computer Methods and Programs in Biomedicine, 269, 108840. Empirical study. Tag (D): supports. Read: methods and results, full text (arXiv 2405.17668v2). Quality: Medium.
- Method and findings: feature-level and prediction-level aggregation of PET radiomics in 115 NSCLC patients, with splits that keep a patient's lesions together. All lesions raised the best median c-index to 0.632, against 0.554 for the largest lesion with stepwise Cox. Test c-indices across iterations ranged from 0.09 to 0.94, which the authors attribute to overfitting.
- Correspondence and step: no correspondence between lesions. Concerns aggregation of features and of predictions.
- Use: the instability of fixed rules in a small cohort.

[sabouri2025enhancing] Sabouri, M. et al. (2025). Enhancing PRRT outcome prediction in neuroendocrine tumors: aggregated multi-lesion PET radiomics incorporating inter-tumor heterogeneity. Cancers, 17(23), 3887. Empirical study. Tag (D): supports. Read: methods and results, full text. Quality: Medium.
- Method and findings: 81 patients, lesions ranked by SUV or volume, top one, three or five kept, then concatenated or summarized. All-lesion aggregation and the top five by SUVmean gave the best time-to-progression prediction (C-index 0.68).
- Correspondence and step: a fixed number of ranked lesions imposes an order. Builds on PyRadiomics.
- Use: forcing a set into a fixed-length vector by ranking.

[cavinato2023radiomics] Cavinato, L. et al. (2023). Radiomics-based inter-lesion relation network to describe [18F]FMCH PET/CT imaging phenotypes in prostate cancer. Cancers, 15(3), 823. Empirical study. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Low.
- Method and findings: 55 men with at least two avid lesions. Lesion profiles were clustered into phenotypes across the cohort, and each patient became a dendrogram of pairwise lesion distances. Most univariate tree descriptors were not significant, and the best multivariate model (concordance 0.86, log-rank p 0.09) was not validated.
- Correspondence and step: no correspondence within a patient, and phenotype clusters give a shared vocabulary. Builds on semi-automatic segmentation and radiomics.
- Use: a relational, permutation-invariant representation of a lesion set.

[eertink2022comparing] Eertink, J. J. et al. (2022). Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features. European Journal of Nuclear Medicine and Molecular Imaging, 49(13), 4642-4651. Empirical study. Tag (D): opposes. Read: methods and results, full text. Quality: High.
- Method and findings: 296 trial patients, with largest, hottest, patient-level, maximum and median lesion rules. Conventional PET and dissemination features gave the highest CV-AUC (0.72 to 0.75), and no lesion selection was significantly better.
- Correspondence and step: no correspondence, with dissemination features measuring spatial spread. The selection choice did not change predictive value significantly.
- Use: the counter-example in which spread features carry the signal.

[gharibi2026radiomic] Gharibi, O. et al. (2026). Radiomic phenotype-informed patient-level aggregation of multiple lesions: application to PET prognostic modeling in NET and DLBCL. Chemical and Biomedical Imaging. Empirical study. Tag (D): supports. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports 81 NET and 76 DLBCL patients, ComBat-harmonized PyRadiomics features clustered into lesion phenotypes, and aggregation by body, phenotype and organ. Clinical plus aggregated models reached C-indices of 0.72 against 0.65 (NET) and 0.66 against 0.62 (DLBCL), described as "numerically favorable" without a stated test.
- Correspondence and step: lesions matched to shared phenotypes and organs across patients. Builds on radiomics.
- Use: correspondence through shared phenotype clusters, a discrete analogue of a template.

[vargas2017a] Vargas, H. A. et al. (2017). A novel representation of inter-site tumour heterogeneity from pre-treatment computed tomography textures classifies ovarian cancers by clinical outcome. European Radiology, 27(9), 3991-4001. Empirical study. Tag (D): supports. Read: methods and results, full text (PMC). Quality: Low.
- Method and findings: 38 HGSOC patients, all disease sites segmented manually and coded by 13 anatomical locations, textures clustered, and statistics of the inter-site similarity matrix computed. Three of 12 metrics were associated with shorter survival, with no correction for multiple testing stated in the sections read. Site count and total volume were not associated.
- Correspondence and step: pairwise similarities that do not depend on which site is which. Builds on segmentation and radiomics.
- Use: an early set-level summary from pairwise lesion similarities.

[sun2022radiomics] Sun, R. et al. (2022). Radiomics to evaluate interlesion heterogeneity and to predict lesion response and patient outcomes using a validated signature of CD8 cells in advanced melanoma patients treated with anti-PD1 immunotherapy. Journal for ImmunoTherapy of Cancer, 10(10), e004867. Empirical study. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: 1,120 lesions in 136 patients, with a CD8 radiomic score per lesion. Lesions that could not be separated from surrounding tissue were not delineated. The minimum score over a patient's lesions was associated with overall survival in training (HR 0.31) and test (HR 0.28) sets.
- Correspondence and step: no correspondence. Builds on segmentation and radiomics, with minimum and dispersion pooling.
- Use: an extreme-value pooling rule with outcome evidence.

[liao2023predicting] Liao, C.-Y. et al. (2023). Predicting survival after radiosurgery in patients with lung cancer brain metastases using deep learning of radiomics and EGFR status. Physical and Engineering Sciences in Medicine, 46(2), 585-596. Empirical study. Tag (D): supports. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports DeepSurv on 1,793 radiomic features with clinical and EGFR data in 237 patients, with the largest metastasis the best of four aggregation rules (C-index 0.75).
- Correspondence and step: no correspondence. Builds on radiomics with a fixed rule.
- Use: a deep survival model that keeps a fixed aggregation rule.

[hu2024lung] Hu, Y. et al. (2024). Lung CT-based multi-lesion radiomic model to differentiate between nontuberculous mycobacteria and Mycobacterium tuberculosis. Medical Physics, 52(2), 1086-1095. Empirical study. Tag (D): supports. Read: abstract only. Quality: Low.
- Method and findings: the abstract reports 240 patients, one signature per lesion type concatenated into a random forest, with AUC 90.2 percent, 1 to 13 points above single-type models.
- Correspondence and step: lesions matched across patients by lesion type, with missing types per patient. Builds on radiomics.
- Use: correspondence through lesion categories.

[geady2024radiomic] Geady, C. et al. (2024). Radiomic-based prediction of lesion-specific systemic treatment response in metastatic disease. Computerized Medical Imaging and Graphics, 116, 102413. Empirical study. Tag (D): neutral. Read: methods and results, full text (PMC). Quality: Medium.
- Method and findings: 202 lung metastases in 80 leiomyosarcoma patients. Features unstable under 1 mm erosion and dilation of the contour were removed (1,452 of 6,592), then volume-correlated ones, leaving 32. Lesion-specific models reached a precision-recall AUC of 0.70 for doxorubicin.
- Correspondence and step: no aggregation, with each lesion a sample. Builds on segmentation and radiomics, with contour sensitivity used as a filter.
- Use: the lesion-level alternative to subject-level aggregation.

[zhao2022multilesion] Zhao, M. et al. (2022). Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma. European Radiology, 32(10), 7056-7067. Empirical study. Tag (D): neutral. Read: abstract only. Quality: Low.
- Method and findings: the abstract reports 421 patients, all FDG-avid lesions delineated, 2,082 features with clinical data, and AUC 0.88 for 4-year survival under Monte Carlo cross-validation.
- Correspondence and step: the abstract does not state the aggregation rule. Builds on segmentation and radiomics.
- Use: a large multi-lesion cohort with patient-level endpoints.

[lu2021dualregion] Lu, N. et al. (2021). Dual-region radiomics signature: integrating primary tumor and lymph node computed tomography features improves survival prediction in esophageal squamous cell cancer. Computer Methods and Programs in Biomedicine, 208, 106287. Empirical study. Tag (D): supports. Read: abstract only. Quality: Low.
- Method and findings: the abstract reports LASSO Cox signatures of the primary tumour, the nodes and both, on 200 training and 107 validation patients. The dual-region signature reached a C-index of 0.611, against 0.594 to 0.604 for single regions.
- Correspondence and step: regions matched across patients by type. The abstract does not say how several nodes are combined.
- Use: a fixed two-region combination with a small gain.

[xu2022multiregion] Xu, Z., Wang, Y., Chen, M. and Zhang, Q. (2022). Multi-region radiomics for artificially intelligent diagnosis of breast cancer using multimodal ultrasound. Computers in Biology and Medicine, 149, 105920. Empirical study. Tag (D): supports. Read: abstract only. Quality: Low.
- Method and findings: the abstract reports five regions on B-mode and contrast ultrasound, one SVM per region, and decision-level fusion in 187 patients (accuracy 87.1 percent, AUC 0.849), better than single-region models.
- Correspondence and step: regions matched by definition. Late fusion of per-region models.
- Use: decision-level fusion as a fixed rule.

[peng2024a] Peng, J. et al. (2024). A novel sub-regional radiomics model to predict immunotherapy response in non-small cell lung carcinoma. Journal of Translational Medicine, 22(1), 87. Empirical study. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Low.
- Method and findings: each tumour split into three sub-regions by clustering, with 1,896 features per sub-region concatenated. Validation AUC 0.86 against 0.79 for whole-tumour radiomics, not significant (p = 0.377).
- Correspondence and step: sub-regions matched by cluster index, with the clustering method described inconsistently and no stated ordering of labels across patients.
- Use: sub-region concatenation needs a cross-patient matching of clusters.

[captier2024radshap] Captier, N. et al. (2024). RadShap: an explanation tool for highlighting the contributions of multiple regions of interest to the prediction of radiomic models. Journal of Nuclear Medicine, 65(8), 1307-1312. Method. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: Shapley values over the regions an aggregation function combines give each lesion a contribution to a patient's prediction, validated on 1,000 synthetic tasks in 130 NSCLC patients. The aggregative survival model beat the primary-tumour model (mean tAUC 0.66 against 0.55).
- Correspondence and step: regions are optional, so any subset is a valid input. Fixed functions (min, max, mean, SD) explained per lesion.
- Use: per-lesion attribution for permutation-invariant aggregates.

#### 22. Lesion segmentation benchmarks and datasets (strand D)

[menze2015the] Menze, B. H. et al. (2015). The multimodal brain tumor image segmentation benchmark (BRATS). IEEE TMI, 34(10), 1993-2024. Benchmark. Tag (D): supports. Read: methods and results, full text (PMC). Quality: High.
- Method and findings: twenty algorithms on 65 glioma scans with up to four raters. Raters disagreed considerably (Dice 74 to 85 percent), and a majority vote of algorithms ranked above each one.
- Correspondence and step: sequences co-registered within each subject, with no common space across patients. Concerns segmentation.
- Use: the inter-rater floor on segmentation error.

[commowick2018objective] Commowick, O. et al. (2018). Objective evaluation of multiple sclerosis lesion segmentation using a data management and processing infrastructure. Scientific Reports, 8(1). Benchmark. Tag (D): supports. Read: methods and results, full text. Quality: High.
- Method and findings: 13 methods on 53 cases with seven experts each. Automatic methods trailed experts on detection and delineation.
- Correspondence and step: concerns segmentation. Detection error changes each subject's lesion count.
- Use: lesion-count error that fixed-count rules ignore.

[commowick2021multiple] Commowick, O. et al. (2021). Multiple sclerosis lesions segmentation from multiple experts: the MICCAI 2016 challenge dataset. NeuroImage, 244, 118589. Dataset. Tag (D): neutral. Read: abstract only. Quality: High.
- Method and findings: the abstract describes 53 patients on four scanners with seven delineations and a consensus, and a test split with an unseen scanner.
- Correspondence and step: concerns segmentation.
- Use: data for measuring how segmentation variability reaches lesion-set predictors.

[carass2017longitudinal] Carass, A. et al. (2017). Longitudinal multiple sclerosis lesion segmentation: resource and challenge. NeuroImage, 148, 77-102. Benchmark. Tag (D): supports. Read: methods and results, full text (PMC). Quality: High.
- Method and findings: 82 longitudinal datasets with two raters. Inter-rater Dice was 0.634, with large differences in lesion volume.
- Correspondence and step: within-subject rigid registration to MNI space before delineation. Concerns segmentation.
- Use: bounds the agreement on which lesions a subject has.

[moawad2025the] Moawad, A. W. et al. (2025). The Brain Tumor Segmentation (BraTS-METS) Challenge 2023: brain metastasis segmentation on pre-treatment MRI. Machine Learning for Biomedical Imaging, 2025, 204-247. Benchmark. Tag (D): supports. Read: methods and results, full text. Quality: High.
- Method and findings: 1,303 studies, with the winning Dice 0.65 plus or minus 0.25. Common errors were missed small lesions and misregistered masks, and the lesion-wise metric is itself an aggregate over a variable set.
- Correspondence and step: concerns segmentation.
- Use: missed lesions change the set a predictor receives.

[wang2024brain] Wang, T.-W. et al. (2024). Brain metastasis tumor segmentation and detection using deep learning algorithms: a systematic review and meta-analysis. Radiotherapy and Oncology, 190, 110007. Systematic review. Tag (D): supports. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports 42 studies, pooled lesion-wise Dice 79 percent and lesion-wise sensitivity 87 percent, with slice thickness affecting detection.
- Correspondence and step: concerns segmentation.
- Use: the size of detection error entering multi-metastasis predictors.

[zeng2020review] Zeng, C., Gu, L., Liu, Z. and Zhao, S. (2020). Review of deep learning approaches for the segmentation of multiple sclerosis lesions on brain MRI. Frontiers in Neuroinformatics, 14. Review. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Low.
- Method and findings: patch-wise and semantic CNNs compared by reported DSC, which ranges from 0.524 to 0.698 on ISBI 2015.
- Correspondence and step: concerns segmentation.
- Use: background.

[spagnolo2023how] Spagnolo, F. et al. (2023). How far MS lesion detection and segmentation are integrated into the clinical workflow? A systematic review. NeuroImage: Clinical, 39, 103491. Systematic review. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: of 156 studies, 94 and 99 percent met the two technical steps and 5 percent or fewer the clinical validation steps.
- Correspondence and step: concerns segmentation.
- Use: segmentation tools are rarely validated against clinical outcomes.

[maier2017isles] Maier, O. et al. (2017). ISLES 2015: a public evaluation benchmark for ischemic stroke lesion segmentation from multispectral MRI. Medical Image Analysis, 35, 250-269. Benchmark. Tag (D): supports. Read: methods and results, full text (PMC). Quality: High.
- Method and findings: 16 groups. Experts agreed at Dice 0.70 plus or minus 0.20 on sub-acute lesions, no method segmented all 36 test cases, and fusing submissions was worse than the top two because failures were correlated.
- Correspondence and step: within-subject co-registration. Concerns segmentation.
- Use: a lesion-based predictor can receive an empty lesion map.

[mehta2022qubrats] Mehta, R. et al. (2022). QU-BraTS: MICCAI BraTS 2020 challenge on quantifying uncertainty in brain tumor segmentation. Machine Learning for Biomedical Imaging, 2022, 1-54. Benchmark. Tag (D): neutral. Read: methods and results, full text (journal PDF). Quality: Medium.
- Method and findings: a score rewarding confident correct and unconfident incorrect voxels, applied to 14 teams. Good segmentation did not imply good uncertainty.
- Correspondence and step: concerns segmentation with uncertainty.
- Use: a per-subject uncertainty no included study carries into a lesion-set predictor.

[moore2023a] Moore, M. J. et al. (2023). A comparison of lesion mapping analyses based on CT versus MR imaging in stroke. Neuropsychologia, 184, 108564. Benchmark. Tag (D): supports. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: 85 stroke patients with one manual mask per modality, warped to template space with modality-specific templates. CT and MR volumes did not differ, but masks overlapped poorly (mean Dice 0.42), and both missed lesions. Paired lesion-mapping z-maps agreed at mean Dice 0.335.
- Correspondence and step: voxel correspondence in template space. Measures how the segmentation input changes the downstream map.
- Use: discussion of segmentation error.

[simpson2024preoperative] Simpson, A. L. et al. (2024). Preoperative CT and survival data for patients undergoing resection of colorectal liver metastases. Scientific Data, 11(1), 172. Dataset. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: High.
- Method and findings: 197 patients with portal venous CT, semi-automatic segmentations of each tumour and survival data. 114 patients (58 percent) had several metastases, and no radiomic features are released.
- Correspondence and step: a variable number of segmented tumours per patient. Concerns segmentation.
- Use: a public multi-lesion dataset with patient-level survival.

[armato2011the] Armato, S. G. et al. (2011). The Lung Image Database Consortium (LIDC) and Image Database Resource Initiative (IDRI): a completed reference database of lung nodules on CT scans. Medical Physics, 38(2), 915-931. Dataset. Tag (D): supports. Read: methods and results, full text (PMC page). Quality: High.
- Method and findings: 1,018 scans read by four radiologists in two phases without forced consensus. Of 2,669 nodules of 3 mm or more marked by at least one reader, 928 (34.7 percent) were marked by all four.
- Correspondence and step: concerns detection and segmentation. The per-patient lesion set differs between readers.
- Use: data, and the reader dependence of the lesion set.

#### 23. Lesion-based subject-level prediction (strand D)

[karnath2019reprint] Karnath, H.-O., Sperber, C. and Rorden, C. (2019). Reprint of: Mapping human brain lesions and their functional consequences. NeuroImage, 190, 4-13. Review. Tag (D): neutral. Read: abstract only. Quality: High.
- Method and findings: the abstract describes voxel-based lesion behaviour mapping as limited by its mass-univariate design and complemented by multivariate and connectome methods.
- Correspondence and step: lesions in a common template space. Builds on segmentation and registration.
- Use: the lesion-mapping design.

[bowren2022poststroke] Bowren, M. et al. (2022). Post-stroke outcomes predicted from multivariate lesion-behaviour and lesion network mapping. Brain, 145(4), 1338-1353. Empirical study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: High.
- Method and findings: lesion-behaviour and lesion network maps from two cohorts applied to an independent sample. Each modality predicted significant variance in 12-month outcomes, and network maps added variance.
- Correspondence and step: manual lesions registered linearly and nonlinearly to MNI152 and reviewed by a neurologist. Each lesion is reduced to one load value per map.
- Use: subject-level prediction resting on template correspondence of lesions.

[forkert2015multiclass] Forkert, N. D. et al. (2015). Multiclass support vector machine-based lesion mapping predicts functional outcome in ischemic stroke patients. PLOS ONE, 10(6), e0129569. Empirical study. Tag (D): neutral. Read: methods and results, full text (Europe PMC). Quality: Medium.
- Method and findings: the percentage of lesioned voxels per atlas region feeds an SVM for 30-day mRS in 68 patients, with 56 percent exact and 85 percent binary accuracy.
- Correspondence and step: affine-only atlas registration to each patient. Region-wise lesion load as a fixed vector.
- Use: a region-wise baseline.

[salvalaggio2020poststroke] Salvalaggio, A. et al. (2020). Post-stroke deficit prediction from lesion and indirect structural and functional disconnection. Brain, 143(7), 2173-2188. Empirical study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: High.
- Method and findings: 132 patients. Lesion and structural disconnection maps predicted deficits in all domains except verbal memory (R2 0.16 to 0.58), and functional disconnection predicted little.
- Correspondence and step: manual segmentation, enantiomorphic normalization and affine plus diffeomorphic registration to MNI152. The authors note that registration success differed from an earlier pipeline on the same cohort and changed the number of patients included.
- Use: prediction that needs the lesion in a common atlas space.

[roca2020artificial] Roca, P. et al. (2020). Artificial intelligence to predict clinical disability in patients with multiple sclerosis using FLAIR MRI. Diagnostic and Interventional Imaging, 101(12), 795-802. Empirical study. Tag (D): neutral. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports 971 training patients, a CNN combined with random forests on lesion load per white matter tract, and two-year EDSS predicted with MSE 3.
- Correspondence and step: lesion load in a common tract space. Builds on segmentation and registration.
- Use: MS prediction from region-wise lesion load.

[pustina2017enhanced] Pustina, D. et al. (2017). Enhanced estimations of post-stroke aphasia severity using stacked multimodal predictions. Human Brain Mapping, 38(11), 5603-5615. Empirical study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: Medium.
- Method and findings: 53 patients with manual lesions registered by ANTs with cost function masking, lesion load per parcel, tractography lesions and connectivity, stacked by random forests. Correlations of 0.79 to 0.88 fell for naming from 0.82 to 0.52 once variable selection moved inside the cross-validation.
- Correspondence and step: template correspondence outside the masked lesion, shared parcels. Builds on segmentation and registration.
- Use: a lesion-based predictor whose input exists only after registration.

[rajashekar2020structural] Rajashekar, D. et al. (2020). Structural integrity of white matter tracts as a predictor of acute ischemic stroke outcome. International Journal of Stroke, 15(9), 965-972. Empirical study. Tag (D): neutral. Read: abstract only. Quality: Medium.
- Method and findings: the abstract reports 96 patients, lesions registered nonlinearly to an atlas, and tract overlap and integrity in a support vector regression of 24-hour NIHSS (r = 0.7).
- Correspondence and step: tract correspondence through the atlas. Builds on segmentation and registration.
- Use: tract-wise reduction of a lesion mask.

[yourganov2016multivariate] Yourganov, G. et al. (2016). Multivariate connectome-based symptom mapping in post-stroke patients: networks supporting language and speech. The Journal of Neuroscience, 36(25), 6668-6679. Empirical study. Tag (D): neutral. Read: methods and results, full text (PMC page). Quality: Medium.
- Method and findings: 90 patients with enantiomorphic normalization, regional damage and connectomes in a support vector regression of five aphasia scores (r = 0.46 to 0.71). Lesion size alone was about as predictive as regional damage or connectome integrity.
- Correspondence and step: standard-space correspondence after mirroring. Builds on segmentation and registration.
- Use: the lesion size baseline.


### Literature Matrix

The matrix has one row per included source, 270 rows, with no column for the strand a source came from. Its themes cut across the strands.

Correspondence (theme 1, how the missing correspondence is handled):

- Reg: registration or spatial normalization to a common space, an atlas or a parcellation.
- Fixed: the mode is indexed alike across samples by acquisition or by construction, with no registration step stated (for example a fixed electrode array, an instrument's variables, or a tensor defined on a shared index set).
- Tmpl: a learned or computed template, barycenter, reference set, dictionary or prototype set.
- OT: a transport coupling between elements of two sets, or a transport distance between them.
- PI: permutation invariance, a set or point encoder, or a fixed aggregation rule over a set (mean, maximum, largest lesion and similar).
- Unal: a tensor or factor model with an unaligned, irregular, shifted or off-grid mode.
- n/a: no element of one subject is matched to an element of another, because each subject contributes one region or the source evaluates a step within each subject (single-tumour radiomics, segmentation benchmarks, radiomics reviews).

A row can carry more than one code. The first code is the main one.

Predictor (theme 2, whether the method yields a subject-level supervised predictor): Sup (a supervised predictor or classifier of a sample-level or subject-level outcome, including association models with an outcome), Two-stage (an unsupervised representation followed by a separate predictor), No (a distance, decomposition, alignment, review or tool with no predictor).

Pipeline step (theme 3, which step of a medical-imaging pipeline the source removes or builds on): Builds Reg, Builds Rad, Builds Seg (the source uses that step ahead of its model); Removes Reg, Removes Rad, Removes Seg (the source predicts without that step on data where it is usual); Step Reg, Step Rad, Step Seg (the source is about the step itself, as a review, benchmark, tool or study of its effect); none (no imaging pipeline, for example chemometrics, EHR, graphs or generic point clouds).

Method: Method (a new method), Theory, Review, Benchmark (comparison, challenge, dataset or standardization study), Empirical (a predictive or measurement study with existing methods), Foundation (a definition or algorithm the field rests on).

Quality: High, Medium or Low, as the strand rated it, with the lower rating kept for a work two strands hold.

| Source | Correspondence | Predictor | Pipeline step | Method | Quality |
|---|---|---|---|---|---|
| bro1996multiway | Fixed | Sup | none | Foundation | High |
| zhao2013higher | Fixed | Sup | none | Method | High |
| eliseyev2013recursive | Fixed | Sup | none | Method | Medium |
| zhang2017tensor | Reg | Sup | Builds Reg | Theory | High |
| mishra2023iterative | Fixed | Sup | none | Method | Medium |
| sun2024partial | Reg (atlas) | Sup | Builds Reg | Method | High |
| vanderploeg2026acmtfr | Fixed | Sup | none | Method | Medium |
| marini2013scream | Unal | Sup | none | Method | Medium |
| zhou2013tensor | Reg | Sup | Builds Reg | Method | High |
| li2018tucker | Reg | Sup | Builds Reg | Method | High |
| guhaniyogi2015bayesian | Reg | Sup | Builds Reg | Method | High |
| lock2018tensorontensor | Fixed | Sup | none | Method | High |
| li2017parsimonious | Reg | Sup | Builds Reg | Method | High |
| guhaniyogi2021bayesian | Reg | Sup | Builds Reg | Method | High |
| li2016sparse | Reg | Sup | Builds Reg | Method | High |
| papadogeorgou2019soft | Reg (atlas) | Sup | Builds Reg | Method | High |
| kossaifi2017tensor | Reg | Sup | Builds Reg | Method | Medium |
| yan2019structured | Fixed | Sup | none | Method | Medium |
| gahrooei2020multiple | Fixed | Sup | none | Method | Medium |
| wang2026maximum | Fixed | Sup | none | Method | Medium |
| wang2025tensorontensor | Fixed | Sup | none | Method | Low |
| huang2026shiftaware | Unal, Reg | Sup | Builds Reg | Method | Medium |
| wang2026a | Reg | Sup | Builds Reg | Method | Medium |
| lyu2024bayesian | Reg | Sup | Builds Reg | Method | Medium |
| guhaniyogi2024a | Reg | Sup | Builds Reg | Method | High |
| li2022coupled | Reg | Sup | Builds Reg | Method | Medium |
| zhou2021partially | Reg | Sup | Builds Reg | Method | High |
| xu2024tensor | Unal | Sup | none | Method | High |
| faes2024single | Fixed | Sup | none | Method | High |
| li2027functional | Reg | Sup | Builds Reg | Method | Medium |
| he2026an | Reg | Sup | Builds Reg | Method | Medium |
| kundu2023bayesian | Reg | Sup | Builds Reg | Method | High |
| pietrosanu2026regularized | Reg | Sup | Builds Reg | Method | Medium |
| haijie2024a | Unal | Sup | none | Method | Low |
| spencer2024bayesian | Reg | Sup | Builds Reg | Method | High |
| naji2026bayesian | Reg | Sup | Builds Reg | Method | Low |
| liu2026bayesian | Reg | Sup | Builds Reg | Method | Low |
| reinhardt2026spatiallyinformed | Reg | Two-stage | Builds Reg | Method | Low |
| liu2023integrative | Reg | Sup | Builds Reg | Method | Medium |
| llosavite2023reducedrank | Reg | Sup | Builds Reg | Method | High |
| liu2021tensor | Fixed | No | none | Review | High |
| harshman1972parafac2 | Unal | No | none | Foundation | High |
| kiers1999parafac2 | Unal | No | none | Foundation | High |
| bro1999parafac2 | Unal | No | none | Foundation | High |
| morup2008shiftinvariant | Unal, Reg | No | Builds Reg | Method | High |
| kuang2015multisubject | Unal, Reg | No | Builds Reg | Method | Medium |
| kuang2024shiftinvariant | Unal, Reg | No | Builds Reg | Method | Medium |
| rivet2016modeling | Unal | No | none | Method | Medium |
| madsen2016quantifying | Unal, Reg | No | Builds Reg | Benchmark | High |
| roald2020tracing | Unal, Reg | No | Builds Reg | Method | Medium |
| roald2022an | Unal | No | none | Method | High |
| cottrell2026subspace | Unal | No | none | Method | Low |
| ramirez2025integrative | Unal | Two-stage | none | Method | High |
| cui2024gstrpca | Unal | No | none | Method | Medium |
| larsen2024tensor | Unal | No | none | Method | Low |
| brust2026fast | Unal | No | none | Method | Low |
| tang2026tensor | Unal | No | none | Method | High |
| cohen2018nonnegative | Unal | No | none | Method | High |
| perros2017spartan | Unal | No | none | Method | High |
| afshar2018copa | Unal | No | none | Method | Medium |
| ren2020robust | Unal | No | none | Method | Medium |
| ren2025unraveling | Unal | No | none | Method | Medium |
| jorgensen2024probabilistic | Unal | No | none | Method | Medium |
| chen2023enhanced | Unal | No | none | Method | Medium |
| chatzis2025tparafac2 | Unal | No | none | Method | High |
| chatzis2025dcmf | Unal | No | none | Method | Medium |
| hu2026separable | Unal | No | none | Method | High |
| kim2024fast | Unal | No | none | Method | Medium |
| jang2023fast | Unal | No | none | Method | Medium |
| jang2024fast | Unal | No | none | Method | Medium |
| kwon2024compact | Unal | No | none | Method | Medium |
| zhao2024fedpar | Unal | No | none | Method | Medium |
| magbonde2023constrained | Unal | No | none | Method | Medium |
| schneide2023shiftinvariant | Unal | No | none | Method | Medium |
| schneide2024shift | Unal | No | none | Method | Medium |
| schneide2024unlocking | Unal | No | none | Method | Medium |
| sorochanarmstrong2023parafac2n | Unal | No | none | Method | Medium |
| afshar2020taste | Unal | Two-stage | none | Method | Medium |
| yin2020logpar | Unal | Two-stage | none | Method | Medium |
| ren2022multipar | Unal | Sup | none | Method | Medium |
| konyar2025semisupervised | Unal | Sup | none | Method | Medium |
| patalano2026par2cox | Unal | Sup | none | Method | Low |
| minoccheri2025supervised | Unal | Sup | none | Method | Low |
| acar2014structurerevealing | Fixed | No | none | Method | High |
| acar2019unraveling | Reg | Two-stage | Builds Reg | Method | Medium |
| schenker2025parafac2based | Unal | No | none | Method | High |
| chatzichristos2021early | Reg | No | Builds Reg | Method | High |
| borsoi2023coupled | Reg | No | Builds Reg | Method | Medium |
| harshman1970foundations | Fixed | No | none | Foundation | High |
| carroll1970analysis | Fixed | No | none | Foundation | High |
| kolda2009tensor | Fixed | No | none | Review | High |
| villani2009optimal | OT | No | none | Foundation | High |
| cuturi2013sinkhorn | OT | No | none | Foundation | High |
| peyre2019computational | OT, Tmpl | No | none | Review | High |
| benamou2015iterative | OT, Tmpl | No | none | Method | High |
| chizat2018scaling | OT | No | none | Method | High |
| feydy2019interpolating | OT | No | none | Method | High |
| luise2018differential | OT | No | none | Theory | High |
| memoli2011gromovwasserstein | OT | No | none | Foundation | High |
| memoli2014the | OT | No | none | Review | High |
| chowdhury2019the | OT | No | none | Theory | High |
| peyre2016gromovwasserstein | OT, Tmpl | Sup | none | Method | High |
| solomon2016entropic | OT | No | none | Method | High |
| xu2019gromovwasserstein | OT | No | none | Method | High |
| vayer2019sliced | OT | No | none | Method | High |
| sejourne2021the | OT | No | none | Method | High |
| vincentcuaz2021semirelaxed | OT, Tmpl | No | none | Method | Medium |
| scetbon2022lineartime | OT | No | none | Method | High |
| beier2022on | OT, Tmpl | Two-stage | none | Method | High |
| zhang2024gromovwasserstein | OT | No | none | Theory | High |
| rioux2023entropic | OT | No | none | Theory | Medium |
| bai2024linear | OT, Tmpl | Two-stage | none | Method | Medium |
| vayer2019optimal | OT | Two-stage | none | Method | High |
| vayer2020fused | OT, Tmpl | Two-stage | none | Method | High |
| nguyen2023on | OT, Tmpl | Two-stage | none | Method | High |
| bai2025fused | OT, Tmpl | No | none | Method | Medium |
| piening2026a | OT | Two-stage | none | Method | High |
| aburidi2025optimal | OT | Two-stage | none | Method | High |
| ma2023fused | OT, Tmpl | Sup | none | Method | High |
| qian2024reimagining | OT, Tmpl | Sup | none | Method | Medium |
| cuturi2014fast | Tmpl, OT | No | none | Method | High |
| xu2021learning | Tmpl, OT | No | none | Method | High |
| werenski2024linearized | Tmpl, OT | No | none | Theory | Medium |
| brogatmotte2022learning | Tmpl, OT | Sup | none | Method | High |
| vincentcuaz2022template | Tmpl, OT | Sup | none | Method | High |
| vincentcuaz2021online | Tmpl, OT | Two-stage | none | Method | High |
| xu2020gromovwasserstein | Tmpl, OT | No | none | Method | High |
| xu2023representing | Tmpl, OT | Two-stage | none | Method | Medium |
| schmitz2018wasserstein | Tmpl, OT | No | none | Method | High |
| wang2025an | Tmpl, OT | No | none | Method | Medium |
| chen2020optimal | Tmpl, OT | Sup | none | Method | Medium |
| mialon2020trainable | Tmpl, OT | Sup | none | Method | Medium |
| wang2024graph | Tmpl | Sup | none | Method | High |
| zhang2024wasserstein | Tmpl, OT | Sup | none | Method | Medium |
| liu2024structuresensitive | Tmpl, OT | Sup | none | Method | High |
| xu2023regularized | PI, OT | Sup | none | Method | High |
| naderializadeh2021pooling | Tmpl, OT | Sup | none | Method | High |
| naderializadeh2025constrained | Tmpl, OT | Sup | none | Method | Medium |
| wang2012a | Tmpl, OT | Two-stage | none | Foundation | High |
| kolouri2016sliced | OT, Tmpl | Two-stage | none | Method | High |
| moosmuller2022linear | OT, Tmpl | Two-stage | none | Theory | High |
| kolouri2020wasserstein | OT, Tmpl | Two-stage | none | Method | Medium |
| togninalli2019wasserstein | OT | Two-stage | none | Method | High |
| petricmaretic2019got | OT | No | none | Method | High |
| ma2020transport | OT | Two-stage | none | Method | Medium |
| ma2023positive | OT, Reg (atlas) | Two-stage | Builds Reg | Method | Medium |
| scholkemper2024a | OT | Two-stage | none | Method | High |
| khorana2025families | OT | No | none | Method | Medium |
| bui2024toward | OT, Tmpl | Sup | none | Method | Medium |
| shifaterabbi2025linear | OT, Tmpl | Sup | none | Method | Medium |
| rahman2026geometric | OT, Tmpl | Sup | none | Benchmark | Medium |
| mahan2024point | OT, Tmpl | Sup | none | Method | Medium |
| amir2024fourier | PI, OT | Two-stage | none | Method | Medium |
| thual2022aligning | OT, Tmpl | No | Removes Reg | Method | High |
| gramfort2015fast | Tmpl, OT, Reg | No | Builds Reg | Method | High |
| feydy2019fast | OT, Tmpl | No | Step Reg | Method | High |
| gerber2018exploratory | OT, Tmpl | Two-stage | Builds Seg | Method | High |
| gerber2023optimal | OT, Tmpl, Reg | Two-stage | Builds Reg | Method | High |
| mazelet2025unsupervised | OT | No | Step Reg | Method | High |
| mazelet2026learning | OT, Tmpl | No | Removes Reg | Method | Low |
| barbarant2026fast | OT | Two-stage | Step Reg | Method | High |
| wang2025linearized | OT, Tmpl | Sup | none | Method | Medium |
| pathan2026flowlot | OT, Tmpl | Sup | none | Method | Medium |
| gachon2025low | OT, Tmpl | Two-stage | none | Method | High |
| maron1997framework | PI | Sup | none | Foundation | Medium |
| zaheer2017deep | PI | Sup | none | Theory | High |
| qi2017pointnet | PI | Sup | none | Method | High |
| wagstaff2019on | PI | No | none | Theory | High |
| murphy2018janossy | PI | Sup | none | Theory | High |
| ilse2018attention | PI | Sup | none | Method | High |
| kothapalli2023equivariant | PI, OT | Sup | none | Benchmark | Medium |
| qi2017pointnetpp | PI | Sup | none | Method | High |
| wang2019dynamic | PI | Sup | none | Method | High |
| lee2018set | PI, Tmpl | Sup | none | Method | High |
| baek2021accurate | PI, Tmpl | Sup | none | Method | High |
| cheng2022revisiting | PI, OT | Sup | none | Method | Medium |
| song2024morphological | Tmpl, PI | Two-stage | none | Method | High |
| song2024multimodal | Tmpl, PI | Sup | none | Method | High |
| xu2023multimodal | OT | Sup | none | Method | High |
| janati2019group | OT, Reg | Sup | Builds Reg | Method | High |
| bazeille2021empirical | OT, Reg | Two-stage | Step Reg | Benchmark | High |
| dadashkarimi2023cross | OT, Reg | Two-stage | Builds Reg | Method | High |
| su2015shape | OT | Two-stage | Removes Reg, Builds Seg | Method | Medium |
| gutierrezbecker2018deep | PI | Sup | Builds Seg | Method | High |
| chen2022white | PI | Sup | Builds Seg (tract identification) | Method | High |
| chen2024tractgeonet | PI, Reg (atlas) | Sup | Builds Reg | Method | High |
| xue2023tractcloud | PI | Sup | Removes Reg | Method | High |
| vosylius2020geometric | PI | Sup | Builds Seg (surface extraction) | Benchmark | Medium |
| fawaz2021benchmarking | PI, Reg | Sup | Step Reg | Benchmark | Medium |
| chen2021aminn | PI | Sup | Builds Seg, Builds Rad | Method | Medium |
| chen2022metastatic | PI | Sup | Builds Seg, Builds Rad | Method | Medium |
| yang2020relational | PI | Sup | Builds Seg | Method | Medium |
| zhang2020survival | PI, Tmpl | Sup | Builds Seg, Builds Rad | Method | Low |
| luo2022prediction | PI | Sup | Removes Rad, Builds Seg | Method | Medium |
| sotiras2013deformable | Reg | No | Step Reg | Review | High |
| haskins2020deep | Reg | No | Step Reg | Review | Medium |
| fu2020deep | Reg | No | Step Reg | Review | Medium |
| chen2025a | Reg, Tmpl | No | Step Reg | Review | High |
| hering2023learn2reg | Reg | No | Step Reg | Benchmark | High |
| avants2011a | Reg, Tmpl | No | Step Reg | Benchmark | High |
| avants2009advanced | Reg, Tmpl | No | Step Reg | Method | Medium |
| shamonin2013fast | Reg | Sup | Step Reg, Builds Seg (multi-atlas regions) | Method | Medium |
| thakran2022impact | Reg | Sup | Step Reg, Builds Rad | Empirical | Medium |
| juhling2024spatial | Reg | No (voxel-wise mapping) | Step Reg | Empirical | Medium |
| arthofer2024internally | Tmpl, Reg | No | Step Reg | Method | High |
| dalca2019learning | Tmpl, Reg | No | Step Reg | Method | High |
| dey2021generative | Tmpl, Reg | No | Step Reg | Method | High |
| abulnaga2025multimorph | Tmpl, Reg, PI (group layer) | No | Step Reg | Method | High |
| hess2018on | Reg | No | Step Reg | Review | Low |
| nenoff2023review | Reg | No | Step Reg | Review | Medium |
| coll2023global | Reg | Sup | Builds Reg, Builds Seg | Empirical | Medium |
| brett2001spatial | Reg | No | Step Reg | Method | High |
| crinion2007spatial | Reg | No | Step Reg | Empirical | High |
| nachev2008enantiomorphic | Reg | No | Step Reg | Method | High |
| andersen2010cost | Reg | No | Step Reg | Empirical | High |
| ripolles2012analysis | Reg | No | Step Reg | Benchmark | Medium |
| zwanenburg2020the | n/a | No | Step Rad | Benchmark | High |
| whybra2024the | n/a | No | Step Rad | Benchmark | High |
| traverso2018repeatability | n/a | No | Step Rad, Step Seg | Review | High |
| pfaehler2021a | n/a | No | Step Rad, Step Seg | Review | Medium |
| zhao2021understanding | n/a | No | Step Rad, Step Seg | Review | Medium |
| lambin2017radiomics | n/a | No | Step Rad | Review | High |
| spadarella2022systematic | n/a | No | Step Rad | Review | Medium |
| aerts2014decoding | n/a | Sup | Builds Seg, Builds Rad | Empirical | High |
| vangriethuysen2017computational | n/a | Sup | Step Rad, Step Seg | Method | High |
| kumar2012radiomics | n/a | No | Step Rad | Review | Medium |
| gillies2016radiomics | n/a | No | Step Rad | Review | High |
| liu2019the | n/a | No | Step Rad | Review | Medium |
| vantimmeren2020radiomics | n/a | No | Step Rad | Review | Medium |
| traverso2020machine | n/a | Sup | Step Rad | Empirical | Medium |
| poirot2022robustness | Fixed (anatomical regions) | Sup | Step Seg, Builds Rad | Empirical | Medium |
| chang2021comparison | PI | Sup | Builds Seg, Builds Rad | Empirical | High |
| henry2022investigation | PI | No | Builds Seg, Builds Rad | Empirical | Medium |
| geady2025radiomic | PI | Sup | Builds Seg, Builds Rad | Benchmark | High |
| wilk2025towards | PI | Sup | Builds Seg, Builds Rad | Empirical | Medium |
| sabouri2025enhancing | PI (ranked lesions) | Sup | Builds Seg, Builds Rad | Empirical | Medium |
| cavinato2023radiomics | PI, Tmpl (phenotype clusters) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| eertink2022comparing | PI | Sup | Builds Seg, Builds Rad | Empirical | High |
| gharibi2026radiomic | Tmpl (phenotype clusters), PI | Sup | Builds Rad | Empirical | Medium |
| vargas2017a | PI (pairwise similarities) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| sun2022radiomics | PI | Sup | Builds Seg, Builds Rad | Empirical | Medium |
| liao2023predicting | PI | Sup | Builds Rad | Empirical | Medium |
| hu2024lung | Fixed (lesion types) | Sup | Builds Rad | Empirical | Low |
| geady2024radiomic | n/a | Sup (lesion-level) | Builds Seg, Builds Rad | Empirical | Medium |
| zhao2022multilesion | PI (rule not stated in the abstract) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| lu2021dualregion | Fixed (region types) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| xu2022multiregion | Fixed (region types) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| peng2024a | Fixed (cluster index) | Sup | Builds Seg, Builds Rad | Empirical | Low |
| captier2024radshap | PI | Sup | Builds Seg, Builds Rad | Method | Medium |
| menze2015the | n/a | No | Step Seg | Benchmark | High |
| commowick2018objective | n/a | No | Step Seg | Benchmark | High |
| commowick2021multiple | n/a | No | Step Seg | Benchmark | High |
| carass2017longitudinal | n/a | No | Step Seg | Benchmark | High |
| moawad2025the | n/a | No | Step Seg | Benchmark | High |
| wang2024brain | n/a | No | Step Seg | Review | Medium |
| zeng2020review | n/a | No | Step Seg | Review | Low |
| spagnolo2023how | n/a | No | Step Seg | Review | Medium |
| maier2017isles | n/a | No | Step Seg | Benchmark | High |
| mehta2022qubrats | n/a | No | Step Seg | Benchmark | Medium |
| moore2023a | Reg | No (voxel-wise mapping) | Step Seg, Builds Reg | Benchmark | Medium |
| simpson2024preoperative | n/a | No | Step Seg | Benchmark | High |
| armato2011the | n/a | No | Step Seg | Benchmark | High |
| karnath2019reprint | Reg | No | Builds Reg, Builds Seg | Review | High |
| bowren2022poststroke | Reg | Sup | Builds Reg, Builds Seg | Empirical | High |
| forkert2015multiclass | Reg (affine atlas) | Sup | Builds Reg, Builds Seg | Empirical | Medium |
| salvalaggio2020poststroke | Reg | Sup | Builds Reg, Builds Seg | Empirical | High |
| roca2020artificial | Reg (tract space) | Sup | Builds Reg, Builds Seg | Empirical | Medium |
| pustina2017enhanced | Reg | Sup | Builds Reg, Builds Seg | Empirical | Medium |
| rajashekar2020structural | Reg | Sup | Builds Reg, Builds Seg | Empirical | Medium |
| yourganov2016multivariate | Reg | Sup | Builds Reg, Builds Seg | Empirical | Medium |

### Identified Gaps

The five gaps below join the gaps of the four strand reports. Each states what the documented searches of the Search Strategy section found, and the evidence line of each gap names the queries and chaining rounds it rests on. None is a statement about the literature as a whole. Scopus, Web of Science, IEEE Xplore and the ACM Digital Library were not searched, and DBLP was blocked, so work indexed only there is outside these findings.

1. **The correspondence is not learned against a subject-level clinical outcome.** The sources that learn a template, a reference set or a dictionary jointly with a supervised loss are TFGW [vincentcuaz2022template], OT-GNN [chen2020optimal], OTKE [mialon2020trainable], PSWE [naderializadeh2021pooling], CSWE, WDDL, SS-GDE, ROTP and the template work of Brogat-Motte et al., as annotated in families 11 and 16. In the text read, none reports a medical subject-level benchmark. ROTP names medical image analysis among its multiple instance tasks. The medical transport classifiers found use kernels or a fixed or computed reference (Ma 2020 and 2023, Aburidi and Marcia, Gachon, FlowLOT, Wang 2025). The neuroimaging transport work aligns, averages or decodes, as FUGW [thual2022aligning], Gramfort 2015 [gramfort2015fast], ULOT, Mazelet 2026 [mazelet2026learning] and SpectralOT do, and none trains a subject-level predictor through the coupling. Su 2015 and CAROT predict a subject-level trait (IQ, sex), and no included transport study predicts a clinical outcome. On the tensor side, every supervised tensor regression and tensor PLS method found with imaging data takes the spatial mode as aligned by template registration or atlas parcellation, and the decompositions that let a spatial mode vary (Roald 2020, Roald 2022, STORM) have no outcome term. The supervised methods that leave a mode unaligned free an elution, visit or time mode (SCREAM, TASTE, LogPar, MULTIPAR, PAR2COX), and CS-SKPD [huang2026shiftaware] models only small cyclic shifts on a registered grid. The shift and warping models found move a time or elution mode, and PARAFAC2xN and SIML free two modes at once in chromatography, while no source found shifts, warps or frees a 3-D spatial mode. Models of unaligned observations on a continuous mode (Larsen 2024, Brust 2026, Tang 2026) are decompositions only. The point-cloud regression found assumes point correspondence (Yan 2019, Wang 2025, Wang 2026 MCU). Among the transport embeddings for sets, only PSWE, OTKE and CSWE train the reference, and the clinical set classifiers found (Wang 2025, FlowLOT, Gachon, Gerber 2023) embed against a fixed reference or an unsupervised barycenter. Among the medical imaging studies with spatial point sets, none used a learned transport reference over spatial coordinates in the passages read. PANTHER and MMP learn prototypes for pathology patch features, and transport alignment between subjects is evaluated by alignment or decoding quality (FUGW, Gramfort 2015, Janati 2019, Bazeille 2021). Among the radiomics aggregation studies, none matched lesions across subjects by optimal transport or learned a template of lesion sets. Wang and Fan 2024 [wang2024graph] report MMD to learned references beating Wasserstein-based learned references on graph classification, and no study found tests this comparison on medical sets with unbalanced or entropic couplings. Evidence: strand A queries Q1 to Q8 with its chaining, forward tracking, Layer 4 queries and check round; strand B queries B1 to B7 and S1 to S5 with its chaining, forward tracking and title searches; strand C queries A2, A3, P2, P3, O2, S1 and S2; strand D queries PM8, PM13, PM15, AX2, AX3, OA3 and OA5.

2. **Subject-level aggregation of lesion sets rests on fixed rules or on pooling of independent lesions.** The radiomics aggregation studies use averages, volume weighting, the largest or top-k lesions, concatenation of ranked lesions, summary statistics or an extreme lesion [chang2021comparison; geady2025radiomic; sabouri2025enhancing; sun2022radiomics; liao2023predicting]. Others cluster lesions into shared phenotypes [gharibi2026radiomic], summarize pairwise similarities [vargas2017a; cavinato2023radiomics], pool per-lesion risks [wilk2025towards] or pool with attention over instances [chen2021aminn]. The region-based studies concatenate or fuse fixed regions [lu2021dualregion; xu2022multiregion; peng2024a]. Geady 2025 found that no fixed rule was best across three datasets, and Wilk 2025 reported test c-indices from 0.09 to 0.94 across splits. In the set-encoder literature, pooling treats instances as independent, Wagstaff 2019 ties the latent width to the set size, and FSW [amir2024fourier] states that sum and max pooling are not bi-Lipschitz. The lesion-set studies of strand C do not encode lesion location, and only NoduleSAT models relations between lesions. The aggregation studies concentrate on oncology, with Hu 2024 [hu2024lung] the one non-oncologic multi-lesion radiomics study in the set. The MS prediction studies found use whole-brain or regional inputs in MNI152 space [coll2023global] or lesion load per tract [roca2020artificial], and none encodes each patient's lesions as a set of per-lesion descriptors. Evidence: strand D queries PM8, PM13, PM14, PM15, PM19, AX2, AX3, OA3, OA4 and OA5 with the chaining of four core papers; strand C queries A1, A4, A6, P4, O3 and S1 with the chaining of five core papers.

3. **No study compares a registration-based predictor with a predictor built for non-aligned inputs on the same cohort and outcome.** Three included studies measure how the registration step changes a downstream result across subjects: Thakran 2022 [thakran2022impact], Juhling 2024 [juhling2024spatial] and Crinion 2007 [crinion2007spatial]. Thakran 2022 reports a variant of its features computed without registration, which skips alignment and does not replace it. Nachev 2008 [nachev2008enantiomorphic], Andersen 2010 [andersen2010cost] and Ripolles 2012 [ripolles2012analysis] measure the normalization error and lesion volume change that a lesion causes, without a predictor, and Shamonin 2013 [shamonin2013fast] compares only standard and accelerated versions of one registration. Fawaz 2021 [fawaz2021benchmarking], a preprint on neonatal cortical surfaces, is the one included study that trains the same models on registered and unregistered data. The lesion-based predictors each use one alignment without varying it [pustina2017enhanced; yourganov2016multivariate; rajashekar2020structural]. The registration-free point-cloud predictors still build on segmentation or atlas-based identification: FreeSurfer structures [gutierrezbecker2018deep], delineated tumours [chen2021aminn], segmented vessels [luo2022prediction] and atlas tract identification [chen2024tractgeonet]. TractCloud [xue2023tractcloud] removes registration, with streamline parcellation as its outcome. In the Literature Matrix, 4 of the 270 sources remove registration, 1 removes radiomics and none removes segmentation. Evidence: strand D queries PM4, PM16, PM17, PM18, AX4 and OA6 with the chaining of Juhling 2024; strand C queries A5, P5, O1, O2 and S2.

4. **Segmentation and registration error is not carried into a subject-level prediction over several lesions.** The segmentation benchmarks report inter-rater disagreement, missed small lesions, complete misses and detection error [menze2015the; commowick2018objective; carass2017longitudinal; maier2017isles; moawad2025the; wang2024brain]. In LIDC-IDRI only 928 of 2,669 larger nodules were marked by all four readers [armato2011the], so the lesion set itself depends on the reader. Moore 2023 [moore2023a] measured how the segmentation source displaced lesion-symptom maps, and Poirot 2022 [poirot2022robustness] measured the effect of segmentation method on a subject-level classifier for anatomical regions. The reproducibility literature reports delineation effects on single-lesion features and prognostic values [traverso2018repeatability; pfaehler2021a; zhao2021understanding], and three studies use delineation stability to filter features [aerts2014decoding; vangriethuysen2017computational; geady2024radiomic]. On the registration side, Chen 2025 [chen2025a] names the use of registration uncertainty as a weight as unexplored, and Nenoff 2023 [nenoff2023review] reports that blurring to absorb registration uncertainty changes the regions found by voxel-based outcome models. No screened study propagated lesion detection or delineation error, or the voxel uncertainty of QU-BraTS [mehta2022qubrats], into an aggregated subject-level prediction over several lesions. Evidence: strand D queries PM6, PM9 to PM12, AX5, AX6, PM1 and OA1 with the chaining of four core papers.

5. **Transport with a full coupling does not yet reach large sets at a known cost.** Exact Gromov-Wasserstein and fused Gromov-Wasserstein solvers are cubic in set size per iteration, as the costs stated for TFGW [vincentcuaz2022template], unbalanced GW [sejourne2021the] and GWL [xu2019gromovwasserstein] show. The scalable variants (sliced, low-rank, linear Gromov-Wasserstein, sliced fused Gromov-Wasserstein) give up the full coupling. Amortized or approximated transport, as in ULOT, Mazelet 2026 [mazelet2026learning] and Qian 2024 [qian2024reimagining], is the route found to large sets with a full or approximate coupling, and all of it dates from 2024 to 2026. Evidence: strand B queries B4, B5, B6 and S5 with the forward tracking of TFGW, OGDL and FGW from 2023 on.

### Recommended Sources by Paper Section

The table serves the related-work and framing sections of the later method paper. It joins the recommendation tables of the four strands and lists each source under the section where it does the most work. Sources in the Methodology row are baselines, data and feature definitions for the paper's comparisons.

| Section | Key Sources |
|---|---|
| Introduction | sotiras2013deformable, brett2001spatial, thakran2022impact, juhling2024spatial, lambin2017radiomics, gillies2016radiomics, henry2022investigation, geady2025radiomic, zhou2013tensor, li2016sparse, villani2009optimal, peyre2019computational, memoli2011gromovwasserstein, vayer2019optimal, zaheer2017deep, qi2017pointnet, thual2022aligning, gutierrezbecker2018deep, fawaz2021benchmarking |
| Related work: supervised tensor models on an aligned grid | bro1996multiway, zhao2013higher, eliseyev2013recursive, zhang2017tensor, sun2024partial, vanderploeg2026acmtfr, li2018tucker, guhaniyogi2015bayesian, lock2018tensorontensor, li2017parsimonious, guhaniyogi2021bayesian, papadogeorgou2019soft, kossaifi2017tensor, lyu2024bayesian, liu2023integrative, liu2026bayesian, kundu2023bayesian, spencer2024bayesian, li2027functional, faes2024single, liu2021tensor |
| Related work: decompositions and supervised models with an unaligned mode | harshman1972parafac2, kiers1999parafac2, bro1999parafac2, roald2020tracing, roald2022an, cottrell2026subspace, perros2017spartan, afshar2018copa, afshar2020taste, yin2020logpar, ren2022multipar, marini2013scream, morup2008shiftinvariant, kuang2015multisubject, sorochanarmstrong2023parafac2n, larsen2024tensor, brust2026fast, tang2026tensor, huang2026shiftaware, yan2019structured |
| Related work: transport foundations, Gromov-Wasserstein and fused Gromov-Wasserstein | cuturi2013sinkhorn, benamou2015iterative, chizat2018scaling, feydy2019interpolating, sejourne2021the, memoli2014the, chowdhury2019the, peyre2016gromovwasserstein, solomon2016entropic, xu2019gromovwasserstein, vayer2020fused, vincentcuaz2021semirelaxed |
| Related work: barycenters, dictionaries and learned templates | cuturi2014fast, schmitz2018wasserstein, xu2020gromovwasserstein, vincentcuaz2021online, xu2021learning, werenski2024linearized, vincentcuaz2022template, brogatmotte2022learning, chen2020optimal, mialon2020trainable, qian2024reimagining, zhang2024wasserstein, naderializadeh2021pooling, naderializadeh2025constrained, wang2024graph |
| Related work: fixed-length transport embeddings and scalability | wang2012a, moosmuller2022linear, kolouri2020wasserstein, kolouri2016sliced, nguyen2023on, bai2024linear, amir2024fourier, shifaterabbi2025linear, mahan2024point, vayer2019sliced, scetbon2022lineartime, bai2025fused, mazelet2025unsupervised |
| Related work: permutation-invariant set encoders | maron1997framework, zaheer2017deep, qi2017pointnet, qi2017pointnetpp, ilse2018attention, murphy2018janossy, wagstaff2019on, lee2018set, wang2019dynamic, kothapalli2023equivariant |
| Related work: transport between subjects and in clinical sets | gramfort2015fast, janati2019group, bazeille2021empirical, dadashkarimi2023cross, su2015shape, mazelet2026learning, barbarant2026fast, gerber2023optimal, ma2020transport, ma2023positive, wang2025linearized, pathan2026flowlot, gachon2025low, aburidi2025optimal, xu2023multimodal |
| Related work: registration and templates | haskins2020deep, fu2020deep, chen2025a, hering2023learn2reg, avants2011a, avants2009advanced, arthofer2024internally, dalca2019learning, dey2021generative, abulnaga2025multimorph, nenoff2023review, crinion2007spatial, nachev2008enantiomorphic, andersen2010cost, ripolles2012analysis |
| Related work: radiomics and lesion segmentation | zwanenburg2020the, whybra2024the, traverso2018repeatability, pfaehler2021a, zhao2021understanding, aerts2014decoding, vangriethuysen2017computational, poirot2022robustness, menze2015the, commowick2018objective, carass2017longitudinal, moawad2025the, maier2017isles, mehta2022qubrats, armato2011the |
| Related work: subject-level prediction from sets of lesions, regions and points | chang2021comparison, wilk2025towards, sabouri2025enhancing, eertink2022comparing, gharibi2026radiomic, cavinato2023radiomics, vargas2017a, sun2022radiomics, captier2024radshap, chen2021aminn, chen2022metastatic, yang2020relational, luo2022prediction, chen2022white, chen2024tractgeonet, xue2023tractcloud, bowren2022poststroke, salvalaggio2020poststroke, pustina2017enhanced, yourganov2016multivariate, coll2023global |
| Methodology (baselines, data and feature definitions) | chang2021comparison, geady2025radiomic, wilk2025towards, ilse2018attention, zaheer2017deep, lee2018set, mialon2020trainable, naderializadeh2021pooling, vincentcuaz2022template, forkert2015multiclass, shamonin2013fast, avants2011a, zwanenburg2020the, vangriethuysen2017computational, commowick2021multiple, simpson2024preoperative, armato2011the |
| Discussion | thakran2022impact, juhling2024spatial, fawaz2021benchmarking, chen2025a, nenoff2023review, moawad2025the, mehta2022qubrats, moore2023a, geady2024radiomic, wagstaff2019on, amir2024fourier, eertink2022comparing, wang2024graph, huang2026shiftaware |

### Quality Gates

Each gate below was computed over refs.bib and the Literature Matrix of this file with grep, awk and the counting script of the search agent's own folder.

| Check item | Pass criterion | Result | Status |
|---|---|---|---|
| Search strategy documented | databases, strings and criteria recorded | every query string and hit count of the four strands is in the Search Strategy section, with the indexes not searched named | Pass |
| Source count | 30 or more for a literature review | 270 entries in refs.bib, 270 rows in the matrix | Pass |
| Annotated bibliography completeness | every included source annotated | 270 of 270 keys open an annotation line once; five further lines are cross-references to an annotation in another family | Pass |
| Literature matrix coverage | every theme with 3 or more sources | theme 1 (correspondence): Reg 73, OT 79, Tmpl 59, Unal 47, PI 41, n/a 27, Fixed 21; theme 2 (predictor): Sup 118, No 121, Two-stage 31; theme 3 (pipeline step): 134 sources name a step, with Builds Reg 50, Builds Seg 36, Builds Rad 24, Step Reg 26, Step Seg 18, Step Rad 13, Removes Reg 4, Removes Rad 1, Removes Seg 0 | Pass for each theme; within theme 3, the values Removes Rad (1) and Removes Seg (0) hold fewer than 3 sources, which Gap 3 reports |
| Research gaps | 2 or more specific gaps | 5 gaps, each with its queries | Pass |
| Peer-reviewed ratio | 70 percent or more, preprints counting as peer-reviewed equivalent under cs_ml | 241 of 270 (89.3 percent) have a confirmed peer-reviewed venue; 29 carry a preprint or technical-report note; under cs_ml 270 of 270 are admissible | Pass |
| Currency | 50 percent or more in the last 5 years | 135 of 270 (50.0 percent) carry a year of 2022 or later, counting li2027functional, which Crossref dates 2027; without it 134 of 270 (49.6 percent); with 2021 counted, since five years before 2026-11-20 begins in November 2021 and the year field cannot separate months, 154 of 270 (57.0 percent) | Pass at the threshold under the 2022 count |

## Synthesis Analysis

This synthesis reads the 270 included sources against the three parts of the research question. Section 1 asks which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects. Section 2 asks how each family handles the missing correspondence. Section 3 asks where each family removes or builds on the registration, radiomics and lesion-segmentation steps of a medical-imaging pipeline. Section 4 joins the three answers into what the documented searches leave open. The four strands came from different literatures. Strand A covers tensor regression, tensor PLS and decompositions with an unaligned mode. Strand B covers optimal transport, Gromov-Wasserstein distances and learned templates. Strand C covers set encoders and transport fusion in medical imaging. Strand D covers the pipeline steps and the studies that predict from sets of lesions or regions. The synthesis compares families across these strands, so a single paragraph often cites sources from two or three of them.

Two limits of the evidence apply throughout. First, the read level differs by source. For the 45 sources read at abstract level only, a claim below says no more than the abstract does. Where it matters, the text names the abstract as its basis. Second, the searches covered the indexes named in the Search Strategy section. Scopus, Web of Science, IEEE Xplore and the ACM Digital Library were not searched, and DBLP was blocked. Every statement that a kind of study was not found refers to these searches and to the chaining rounds of the four strands. Such a statement describes the screened records and makes no claim about the literature beyond them. The quality ratings are those of the strands, with the lower rating kept for a work two strands hold.

### 1. Which methods predict a subject-level outcome from non-aligned data

#### 1.1 Supervised tensor models on an aligned grid

The tensor regression literature predicts subject-level outcomes from images, and it does so on a shared voxel grid. Zhou 2013 [zhou2013tensor] fits a generalized linear model with a CP-structured coefficient tensor and classifies ADHD from MRI. The images are segmented, registered and RAVENS-normalized to a template before the model sees them. Li 2016 [li2016sparse] predicts several ADNI clinical scores after HAMMER normalization to an MNI-space atlas and downsizing to 32 x 32 x 32 voxels. Tucker regression [li2018tucker], Bayesian CP regression [guhaniyogi2015bayesian], soft tensor regression [papadogeorgou2019soft] and Bayesian Tucker regression [spencer2024bayesian] follow the same design. Recent imaging work keeps it as well. Lyu 2024 [lyu2024bayesian], Liu 2023 [liu2023integrative] and Liu 2026 [liu2026bayesian] all register images to a population template with ANTs before modelling. Strand A found no supervised tensor regression or tensor PLS method with imaging data that leaves the spatial mode unaligned. In the Literature Matrix this family carries the codes Reg or Fixed with a supervised predictor, and its pipeline code is Builds Reg.

The tensor PLS line shares this structure. N-PLS [bro1996multiway] gives each mode of the predictor array one weight vector, which requires every non-sample mode to be indexed alike across samples. HOPLS [zhao2013higher] finds loadings common to all samples through a block Tucker decomposition of the cross-covariance. Partial quantile tensor regression [sun2024partial] takes a connectivity matrix over the 279 nodes of an atlas as its covariate. Correspondence comes from the parcellation. Papadogeorgou 2019 [papadogeorgou2019soft] uses an ROI-by-ROI connectome in the same way. These two sources show that an atlas parcellation is a second route to correspondence beside voxel-wise registration. Kossaifi 2017 [kossaifi2017tensor] places a tensor regression layer inside a convolutional network on UK Biobank MRI. The activations still lie on a fixed grid of preprocessed images. Point-cloud regression in manufacturing follows the same assumption. Yan 2019 [yan2019structured] models point clouds measured on a pre-specified grid and names unstructured point clouds as future work. Wang 2026 [wang2026maximum] assumes that each cloud has the same points in the same order.

One supervised tensor method in the set models spatial misalignment directly. CS-SKPD [huang2026shiftaware] adds to each scan a second view shifted by a fixed cyclic offset and fits a sparse Kronecker product classifier. The authors report robustness to minor mis-registration. The shifts are small and lie on the same grid, so prior registration is still needed. FRCOMA [haijie2024a], a preprint, regresses with operator-valued kernels on continuous domains and needs no fixed grid. It has no image application in the text read. Strand A therefore records a family that predicts well from aligned images. It treats alignment as a preprocessing step outside the model. The comparison with the other strands starts from this point. Sections 1.3 to 1.6 describe families that predict without a shared grid, and each pays for this in a different way.

#### 1.2 Supervised factor models with an unaligned mode outside space

PARAFAC2 lets one mode vary in size and order from slice to slice. Harshman 1972 [harshman1972parafac2] introduced the model for sets of cross-product matrices, and Kiers 1999 [kiers1999parafac2] gave the direct fitting algorithm. The abstract of Kiers 1999 presents it for slices with the same column units and different numbers of row units. Several supervised methods build an outcome term on this model. SCREAM [marini2013scream] joins a PARAFAC2 decomposition with a principal covariates regression step. Its abstract reports a loss of accuracy for N-PLS when one mode shifts. TASTE [afshar2020taste] and LogPar [yin2020logpar] fit PARAFAC2 to electronic health records and pass the patient factors to logistic regression. MULTIPAR [ren2022multipar] fits the reconstruction and the outcome losses jointly and reports better mortality prediction than the two-stage design. PAR2COX [patalano2026par2cox], a preprint, adds a Cox partial likelihood on the patient weights. Konyar 2025 [konyar2025semisupervised] and SCMTF [minoccheri2025supervised] add label information in other forms.

In all of these, the unaligned mode is a visit, time or elution mode, and the feature mode is aligned. Xu 2024 [xu2024tensor] handles subject-specific time points in a scalar-on-tensor regression without imputation. PARAFAC2-RISE [ramirez2025integrative] lets the cell mode vary across patients and passes the patient factors to logistic regression for lupus status. This is the one included two-stage design in which the varying mode is an unordered set of observations per patient. It sits close to the research question, since each patient contributes a set of cells whose identity differs across patients. Its prediction step comes after an unsupervised decomposition. The joint supervised designs, MULTIPAR and PAR2COX, keep time as the varying mode. The documented searches of strand A found no supervised method that leaves a three-dimensional spatial mode unaligned across subjects. The Literature Matrix reflects this. Of the 11 supervised or two-stage rows with the code Unal, 10 carry the pipeline code none. They work outside an imaging pipeline. The eleventh is CS-SKPD, which builds on registration.

#### 1.3 Supervised predictors through transport to a learned template

Strand B found a family of graph-level classifiers in which the correspondence and the predictor are trained together. TFGW [vincentcuaz2022template] represents a graph by its fused Gromov-Wasserstein distances to K templates and feeds this vector to a multilayer perceptron. The templates, their node weights and the trade-off parameter are learned end-to-end with cross-entropy. The coupling between each graph and each template is the node-to-template correspondence. OT-GNN [chen2020optimal], a preprint, compares a graph's node-embedding set with learned prototype point clouds by Wasserstein distances. A noise-contrastive term keeps the prototypes from collapsing. OTKE [mialon2020trainable] pools a set by the entropic transport plan to a trainable reference, learned with or without supervision. PSWE [naderializadeh2021pooling] learns reference sets and slicing directions end-to-end for a generalized sliced Wasserstein embedding. CSWE [naderializadeh2025constrained] constrains the slices so that their plans approximate the full plan. WDDL [zhang2024wasserstein] and SS-GDE [liu2024structuresensitive] learn graph dictionaries with discriminant or mutual-information objectives, the first known from its abstract only.

This family is the one in the set whose correspondence is shaped by the label. It is also the family whose evaluation lies furthest from medicine. In the text read, none of TFGW, OT-GNN, OTKE, PSWE, CSWE, WDDL, SS-GDE or ROTP [xu2023regularized] reports a medical subject-level benchmark. ROTP names medical image analysis among its multiple instance tasks. Brogat-Motte 2022 [brogatmotte2022learning] trains templates jointly with a network under a supervised FGW loss, and its output is a predicted graph. Qian 2024 [qian2024reimagining] classifies graphs by FGW distance to class prototypes, and its abstract does not say how the prototypes are trained. Wang and Fan 2024 [wang2024graph] provide the main counter-evidence. They learn reference distributions end-to-end and compare them with node-embedding sets by MMD. The authors judge Wasserstein distances too costly and report that MMD performed better in their tests. Their models also ran faster than OT-GNN and TFGW. The strand B tag "oppose" marks this result.

#### 1.4 Transport embeddings against a fixed or computed reference

A second transport family embeds each set against a reference that is fixed or computed before training. Linear optimal transport [wang2012a] computes a template from the data and embeds each image by its plan to the template. Moosmuller and Cloninger 2022 [moosmuller2022linear] prove that this embedding is exact for shifts and scalings, which gives linear separability for classes generated by them. WEGL [kolouri2020wasserstein] maps node embeddings by Monge maps from a reference found by k-means. Strand C notes that its appendix reports no significant difference between a k-means reference and a normal reference on one molecular benchmark. LOT subspaces [shifaterabbi2025linear] classify point sets by the nearest subspace in the LOT space, designed for affine deformations. Deep set LOT [mahan2024point], a preprint, maps a shared fixed reference to each point cloud by input convex networks. A DeepSets-style head then classifies. FSW [amir2024fourier] embeds multisets so that the sliced Wasserstein distance is approximately preserved, injective on measures and bi-Lipschitz on multisets.

This family reaches patient-level prediction in cytometry. Wang 2025 [wang2025linearized], a preprint, treats each patient as a single-cell point cloud and classifies its LOT embedding to a fixed reference. FlowLOT [pathan2026flowlot], a preprint, classifies AML patients from flow cytometry in the same way. Gachon 2025 [gachon2025low] quantizes measurements by a Wasserstein barycenter with shared support. The authors show that this barycenter is k-means on the mean measure. A three-component PCA of the LOT embedding then feeds a logistic regression that separates positive from negative residual-disease follow-ups. In these studies the set has no spatial coordinates in the imaging sense, and the reference is built without the label. Transport kernels on brain networks form a nearby group. Ma 2020 [ma2020transport] includes an ADHD brain-network dataset among its benchmarks. The abstract of Ma 2023 [ma2023positive] reports a positive definite kernel for brain disease classification from fMRI networks. Both work on atlas-defined networks, so the nodes already correspond across subjects.

#### 1.5 Set encoders and multiple instance learning in medical imaging

Strand C found the set encoders that the medical point-cloud studies use. Deep Sets [zaheer2017deep] shows that a permutation-invariant function on sets from a countable universe is a function of a sum of element embeddings. PointNet [qi2017pointnet] uses max pooling and learned alignment networks toward a canonical pose. PointNet++ [qi2017pointnetpp] adds hierarchical grouping to capture local structure. Attention-based multiple instance learning [ilse2018attention] pools instances by a learned weighted average whose weights point to key instances. Set Transformer [lee2018set] models interactions with self-attention and pools from learnable seeds. These encoders carry a supervised predictor by construction. The medical studies built on them predict a subject-level outcome from point clouds of structures, tracts, surfaces or vessels. Gutierrez-Becker and Wachinger 2018 [gutierrezbecker2018deep] classify controls, MCI and Alzheimer's disease from hippocampus and ventricle point clouds. Chen 2022 [chen2022white] predicts a vocabulary score from the left arcuate fasciculus of 806 HCP subjects.

Other studies in this family predict age or other subject-level scores. TractGeoNet [chen2024tractgeonet] extends the tract design to 20 tracts and two language scores. Vosylius 2020 [vosylius2020geometric] predicts post-menstrual age from neonatal cortical surfaces. PointNet++ reached a test MAE of 0.62 weeks, against 0.82 for a 3D CNN. Fawaz 2021 [fawaz2021benchmarking], a preprint, reports an MAE of 0.512 weeks with PointNet++ on native meshes. The abstract of Luo 2022 [luo2022prediction] reports a point-cloud network for aneurysm rupture. Its external AUC was 0.835, against 0.681 to 0.701 for radiomics models. Lesion sets enter this family through multiple instance learning. AMINN [chen2021aminn] treats each liver metastasis as an instance of radiomic features and predicts 3-year survival with an AUC of 0.70. This is 11.4 percent above LASSO logistic regression on the largest tumour. Chen and Martel 2022 [chen2022metastatic], a preprint, propose injective pooling over tumour sets and model patient risk as cumulative tumour risk. NoduleSAT [yang2020relational] refines each pulmonary nodule with set attention over the patient's other nodules.

Histopathology contributes a related design at the slide level. PANTHER [song2024morphological] summarizes the patch embeddings of a slide as a Gaussian mixture whose components are prototypes. On 13 datasets it outperforms or matches supervised MIL baselines. MMP [song2024multimodal] fuses morphological and pathway prototypes for survival prediction in six cancer cohorts. MOTCat [xu2023multimodal] replaces dense co-attention between histology patches and genomic instances by a transport plan, with higher concordance on five TCGA cohorts. These studies predict a subject-level outcome from sets of unequal size. Their sets are patch features, and the patch positions do not enter the representation. Strand C records this as a limit for spatial data. The lesion-set studies in this family likewise do not encode lesion location. Only NoduleSAT models relations between lesions.

#### 1.6 Radiomics aggregation and lesion-based predictors

Strand D found the clinical studies that predict a subject-level outcome from several lesions or regions. They reduce the set to a fixed-length vector before a standard model. Chang 2021 [chang2021comparison] compared six aggregation rules over 3,596 brain metastases in 831 patients. The volume-weighted average of the largest three lesions gave the highest C-index in all three survival models. Geady 2025 [geady2025radiomic] replicated ten published rules on three datasets with 16,894 lesions. No rule consistently beat the others or total tumour volume. Wilk 2025 [wilk2025towards] found that using all lesions raised the best median c-index from 0.554 to 0.632 in 115 NSCLC patients. Test c-indices across iterations ranged from 0.09 to 0.94. Sabouri 2025 [sabouri2025enhancing] ranked lesions by SUV or volume and kept the top one, three or five. Eertink 2022 [eertink2022comparing] found that no lesion selection was significantly better than conventional PET and dissemination features in 296 DLBCL patients.

Some aggregation studies go beyond averages and ranked lists. Sun 2022 [sun2022radiomics] pooled a per-lesion CD8 radiomic score by its minimum and found an association with overall survival in training and test sets. Vargas 2017 [vargas2017a] summarized the inter-site similarity matrix of ovarian cancer lesions, and three of 12 metrics were associated with shorter survival. Cavinato 2023 [cavinato2023radiomics] represented each patient as a dendrogram of pairwise lesion distances, with an unvalidated best model. The abstract of Gharibi 2026 [gharibi2026radiomic] reports lesions clustered into shared phenotypes and aggregated by phenotype and organ. RadShap [captier2024radshap] attributes a patient's prediction to its lesions by Shapley values over the aggregated regions. The region-based studies combine regions matched by type, such as tumour and nodes [lu2021dualregion] or five ultrasound regions [xu2022multiregion], both known from their abstracts. Peng 2024 [peng2024a] concatenates three intratumoral sub-regions whose order across patients the methods do not state.

The lesion-based predictors in stroke and multiple sclerosis take a different route. Each lesion mask is registered to a template, and the model receives one load value per atlas region, tract or map. Forkert 2015 [forkert2015multiclass] feeds the lesioned percentage of each atlas region to an SVM for 30-day mRS. Salvalaggio 2020 [salvalaggio2020poststroke] predicts deficits from lesion and disconnection maps in MNI152 space. Bowren 2022 [bowren2022poststroke] applies lesion-behaviour and lesion network maps from two cohorts to an independent sample. Pustina 2017 [pustina2017enhanced] stacks parcel loads, tractography lesions and connectivity in random forests. Its correlations for naming fell from 0.82 to 0.52 once variable selection moved inside the cross-validation. Yourganov 2016 [yourganov2016multivariate] found that lesion size alone was about as predictive as regional damage or connectome integrity. The abstracts of Roca 2020 [roca2020artificial] and Rajashekar 2020 [rajashekar2020structural] report lesion load per tract as the input. Coll 2023 [coll2023global] classifies MS disability from whole-brain or regional CNN inputs, with lesions filled in before parcellation.

#### 1.7 The predictive families compared

Across the four strands, five families predict a subject-level outcome from data that are not aligned across subjects. The supervised tensor models with an unaligned mode predict from time or cell modes. The transport classifiers with learned templates predict graph labels on non-medical benchmarks. The fixed-reference transport embeddings predict patient status from cytometry point clouds. The set encoders predict ages, scores and survival from point clouds and lesion sets. The radiomics aggregation studies predict survival and response from lesion sets reduced by fixed rules. The lesion-mapping studies predict from lesions placed in template space, so they belong with the registration-based families of Section 1.1. In the matrix, 118 of the 270 sources carry the code Sup and 31 the code Two-stage.

The families differ in the kind of evidence they offer. The transport and tensor families report methods with benchmarks and, in several cases, theory. The aggregation studies compare fixed rules on the same clinical data. Their cohorts range from 38 patients in Vargas 2017 to 3,930 patients over three datasets in Geady 2025. Strand D tags most of them "supports", meaning that the aggregation choice changes the prediction. Geady 2025 and Wilk 2025 add that the choice is unstable across datasets and splits. Eertink 2022 is the one aggregation study tagged "opposes", since no lesion selection changed the predictive value significantly. The set-encoder studies report gains over radiomics or grid baselines on single cohorts. Fawaz 2021 is the one included study that trains the same models on registered and unregistered data, and Section 3.1 returns to it. Strand D tags the lesion-mapping studies neutral, because they use one alignment without testing it.

### 2. How each family handles the missing correspondence

#### 2.1 Registration to a common space

Registration supplies a dense map from each subject to a template, and every later step treats corresponding voxels as the same variable. Sotiras 2013 [sotiras2013deformable] decomposes deformable registration into a deformation model, a matching criterion and an optimization method. The survey names population modelling and statistical atlases as a main use. It also states that registration is hard to validate, because the true correspondences are unknown. Learn2Reg [hering2023learn2reg] found that no single approach was best across its tasks. Most methods reached Dice overlaps of 80 to 90 percent on the easier inter-subject brain cases. Inter-patient tasks lost accuracy on structures left out of the training labels. Fu 2020 [fu2020deep] reports on DIRLAB lung data. The deep methods it lists had not reached the landmark error of the best traditional methods. Avants 2011 [avants2011a] evaluated the ANTs similarity metrics on 40 labelled brains, with a best Jaccard overlap of 0.669. Several predictive studies in the set use this ANTs pipeline as their alignment step.

Lesions break the one-to-one assumption on which registration rests. Chen 2025 [chen2025a] states that registering an atlas to an image with a tumour violates the one-to-one assumption of diffeomorphic registration. The ANTs documentation [avants2009advanced] says the same of lesioned brains and offers cost function masking. The abstract of Brett 2001 [brett2001spatial] reports that automated normalization can distort a lesioned image and that masking the lesion helps. Crinion 2007 [crinion2007spatial] measured the error on simulated lesions in ten brains. Unified segmentation stayed closer to the unlesioned deformation than the other methods, and the choice of normalization changed group fMRI activations. Nachev 2008 [nachev2008enantiomorphic] replaced the lesion by the mirrored signal of the other hemisphere. This beat cost function masking for every subject and lesion in its tests, and error rose with lesion size. Andersen 2010 [andersen2010cost] found that unmasked normalization gave significantly smaller lesion volumes. The abstract of Ripolles 2012 [ripolles2012analysis] reports that the most accurate method also shrank lesion volume.

The registration literature also measures uncertainty and template bias. Nenoff 2023 [nenoff2023review] reports that registration uncertainty in radiotherapy can be large and hard to quantify. In voxel-based outcome models each dose map is registered to an arbitrary reference CT. Blurring to absorb the uncertainty lowers the significance of small regions and changes their shape. Chen 2025 names the use of registration uncertainty as a weight in atlas-based segmentation as unexplored. Arthofer 2024 [arthofer2024internally] built an unbiased multimodal template from UK Biobank. On held-out subjects, pairwise Dice of warped cortical regions was 13.17 percent higher with this template than with MNI 152. The authors note that this overlap mixes segmentation and registration error. Juhling 2024 [juhling2024spatial] compared affine, nonlinear, masked and enantiomorphic normalization for lesion-symptom mapping in 122 stroke patients. The important areas were largely consistent across approaches. The nonlinear variants distorted the images, and the authors question their benefit in this setting.

#### 2.2 Templates, barycenters, dictionaries and prototypes

A template appears in four strands, with four meanings. In registration, the template is a reference image to which each subject is deformed. Dalca 2019 [dalca2019learning] learns a universal or attribute-conditional template jointly with registration, and notes that a template chosen from one image can bias analyses. Dey 2021 [dey2021generative] trains conditional templates adversarially and reports sharper templates at comparable Dice. MultiMorph [abulnaga2025multimorph] builds a population-specific atlas in one forward pass, over 100 times faster than ANTs and AtlasMorph on IXI. Its group layer concatenates the mean of feature maps across a set of any size to each image. This is the permutation-invariant mean that the set encoders of strand C use. These templates are learned without the outcome, and each subject still receives a dense deformation to them. Strand D tags them neutral, since none tests the effect of the template on a prediction.

In transport, a template is a measure, a graph or a set to which each subject is coupled. The barycenter computes it from the data. Cuturi and Doucet 2014 [cuturi2014fast] give a free-support barycenter that generalizes k-means. Benamou 2015 [benamou2015iterative] compute barycenters by iterative Bregman projections. Peyre 2016 [peyre2016gromovwasserstein] average similarity matrices from different spaces into a Gromov-Wasserstein barycenter. Gramfort 2015 [gramfort2015fast] average activation maps of 20 fMRI subjects into a transport barycenter on a common grid. The transport average kept focal activations that Euclidean averaging blurred. Dictionary methods generalize the barycenter to several atoms. OGDL [vincentcuaz2021online] and Gromov-Wasserstein factorization [xu2020gromovwasserstein] represent each graph by weights over learned atoms. Xu 2021 [xu2021learning] learns graphons from unaligned graphs of different sizes as structured barycenters. The atoms of these methods are learned without labels. Mazelet 2026 [mazelet2026learning] learns an FGW dictionary of fMRI activations over each individual's cortical geometry. Its dictionary is also learned without a supervised subject-level loss.

The supervised template methods of Section 1.3 shape the template with the label. TFGW learns the structure, features and node weights of each template under cross-entropy. OTKE and PSWE learn their references in the same loop as the classifier. Strand C adds learned prototypes inside pooling. PANTHER fits prototypes as the components of a Gaussian mixture over patch embeddings. Its Section 3.1.1 shows transport aggregation to prototypes as the case with uniform weights. Set Transformer routes attention through trainable inducing points and pools from learnable seeds. Graph multiset pooling [baek2021accurate] attends from learned seeds to node features. In these encoders the seeds are reference points in feature space, and no coupling is kept as a correspondence. The radiomics literature has a discrete analogue. Gharibi 2026 clusters lesions into phenotypes shared across patients, as its abstract describes. Zhang 2020 [zhang2020survival] clusters tumour subregions into three global clusters, as its structured abstract reports. A cluster label then plays the role of a template element to which lesions are assigned.

Across the four meanings the role of the template is the same. It gives every subject a common vocabulary of reference elements, so that a model can compare subjects through their relation to it. The registration template does so through a dense map. The barycenter and the dictionary do so through couplings or weights, and the learned seeds and prototypes do so through soft assignment. The cluster vocabularies of radiomics do so through hard assignment. The families differ in what shapes the template. In registration and in the barycenter it is the image or measure data. In the supervised transport and set-encoder methods it is the label. Strand B tags its supervised template methods "support", meaning that they show a component a template trained with a supervised loss needs. Strand C tags its prototype methods "supports", meaning that they predict without registration. The template is shaped by a clinical label in none of the medical studies found, as Gap 1 records.

#### 2.3 Transport couplings as the correspondence

Transport makes the correspondence an explicit object. Villani 2009 [villani2009optimal] defines a coupling of two measures as a measure on the product space with those marginals. Memoli 2011 [memoli2011gromovwasserstein] relaxes the correspondences of the Gromov-Hausdorff distance to measure couplings, which defines the Gromov-Wasserstein distance. Its Remark 5.13 shows that the support of an optimal coupling is a correspondence. The discrete problem is a quadratic program that need not be convex. Gromov-Wasserstein compares two spaces through their internal distances, so it needs no shared coordinate frame. FGW [vayer2019optimal] trades a feature cost against this structure cost and handles graphs of different sizes. Entropic regularization [cuturi2013sinkhorn] makes the coupling soft and differentiable through Sinkhorn iterations. Luise 2018 [luise2018differential] prove that the sharp Sinkhorn distance is smooth and give its gradient. Feydy 2019 [feydy2019interpolating] define the Sinkhorn divergence, which removes the entropic bias. Solomon 2016 [solomon2016entropic] use entropic GW to compute fuzzy correspondences between shapes.

Unbalanced transport relaxes the marginal constraints, so that a subject's elements need not all be matched. Chizat 2018 [chizat2018scaling] replace the marginal constraints by divergence penalties and solve the problem by a scaling algorithm. Sejourne 2021 [sejourne2021the] define unbalanced GW with a conic relaxation. Semi-relaxed GW [vincentcuaz2021semirelaxed] relaxes the target marginal, so that a graph can be matched to a template with free node weights. Strand B annotates unbalanced marginals as a way for a template to ignore elements without a match. New or vanished lesions are the medical example the strand names. In neuroimaging, FUGW [thual2022aligning] aligns cortical surfaces by matching functional signatures, with a GW term on geodesic distances that penalizes large deformations. An unbalanced term lets functional areas differ in size. In its second experiment FUGW aligns pairs on their own anatomical meshes, without template registration. Feydy 2019 [feydy2019fast] transfer atlas labels to a subject's tractogram by multiscale unbalanced transport. Gerber 2018 [gerber2018exploratory] and Gerber 2023 [gerber2023optimal] use unbalanced transport to a template to separate changes in mass from changes in location.

Couplings also link subjects, modalities and parcellations inside predictive models. Janati 2019 [janati2019group] estimate MEG and EEG sources for several subjects jointly, with an unbalanced transport penalty that promotes support proximity. Each subject's source space is first morphed to an average brain. Bazeille 2021 [bazeille2021empirical] compared functional alignment methods by decoding on left-out subjects. Functional alignment generally improved inter-subject decoding over anatomical alignment, and transport performed well. CAROT [dadashkarimi2023cross] maps fMRI time series from one atlas to another by a transport plan. Its reconstructed connectomes predict fluid intelligence and sex. Su 2015 [su2015shape] maps each FreeSurfer surface to the sphere and compares the area distortions by Wasserstein distances. It classifies three IQ classes with 78.57 percent accuracy. SpectralOT [barbarant2026fast] couples cortical meshes through aligned Laplace-Beltrami eigenmodes and trains a population decoder after alignment. In these studies the coupling is computed first and the predictor is trained afterwards, or the predicted trait is non-clinical.

The coupling has a computational price, and strand B records it. TFGW states a conditional gradient cost of O(n^2 nbar + nbar^2 n) per iteration, with one problem per template per graph. Unbalanced GW costs O(n^3) time and O(n^2) memory. GWL [xu2019gromovwasserstein] states a cost cubic in the number of nodes per outer step. Sliced GW [vayer2019sliced] solves the one-dimensional problem in closed form at O(n log n) and does not return the full coupling. Low-rank GW [scetbon2022lineartime] brings the cost to linear time with a factored coupling. Linear GW [beier2022on] and linear partial GW [bai2024linear] need N couplings to a reference instead of N^2 between pairs. Sliced FGW [piening2026a] slices the fused problem. ULOT [mazelet2025unsupervised] trains a network to predict FUGW plans, which amortizes the solver. Mazelet 2026 uses the same amortized optimization for its dictionary. The amortized route keeps a full or approximate coupling at scale. Every source of it in the set dates from 2024 to 2026.

#### 2.4 Permutation invariance

Permutation invariance avoids correspondence by making the output independent of element order. Multiple instance learning [maron1997framework] makes the label a function of the bag, with a positive-if-any rule as one fixed aggregation. Deep Sets sums element embeddings. PointNet takes a maximum and adds a learned rigid canonicalization. Attention MIL takes a learned weighted average. The radiomics aggregation rules of Section 1.6 belong here as well. An average, a volume-weighted average, a minimum or a maximum over lesions is a permutation-invariant function, fixed in advance. Rules that keep the largest k lesions or concatenate lesions by rank impose an order by size. Geady 2025 makes this point for its concatenation and N-largest rules. In the matrix, 41 sources carry the code PI, from set-encoder theory to clinical aggregation studies. Strand C and strand D thus describe one mechanism from two directions. Strand C learns the invariant function, and strand D fixes it in advance.

The theory of strand C sets limits on pooled invariant encoders. Wagstaff 2019 [wagstaff2019on] study sum decomposition with continuous maps. For universal representation, a latent dimension at least as large as the largest set is then necessary and sufficient. Fixed-width sum pooling therefore cannot represent all continuous set functions once sets exceed the latent width. FSW [amir2024fourier] states that sum and max pooling are provably not bi-Lipschitz and often not injective. Its own embedding is bi-Lipschitz on multisets at an output dimension of about 2Nd. Chen and Martel 2022 apply the expressiveness argument to lesion sets with injective pooling. Kothapalli 2023 [kothapalli2023equivariant], a workshop preprint, report that transport or attention pooling can significantly boost simple backbones on point-cloud data. The benefit diminishes for more complex backbones. Janossy pooling [murphy2018janossy] trades interaction order for cost by averaging over orderings. Its k = 1 case recovers Deep Sets.

Relational encoders model the elements jointly before pooling. PointNet++ groups points in metric neighbourhoods. Dynamic graph CNN [wang2019dynamic] recomputes a k-nearest-neighbour graph in feature space at each layer. Its authors argue that treating points independently neglects their geometric relationships. Set Transformer models pairwise interactions with self-attention, and its authors state that independent pooling must discard some interaction information. NoduleSAT applies set attention to the nodules of one patient. These encoders keep relations within a subject. None of them builds a correspondence across subjects. In PointNet++ the neighbourhoods depend on coordinates, so a global pose difference between subjects changes the input. This is why PointNet adds alignment networks and why TractCloud trains with synthetic transformations. The invariant encoders thus remove the need for element correspondence while leaving pose sensitivity to be handled by canonicalization, augmentation or registration.

Strand C links transport and attention in several places. OTKE presents its transport pooling as related to attention, with several references acting like attention heads. UOT-Pooling [cheng2022revisiting], a preprint, shows that mean, max, DeepSet, attention and Set Transformer pooling are special cases of an unbalanced transport problem. ROTP unifies global pooling operations as regularized transport problems with learnable regularization. MMP links transport cross-alignment to cross-attention. These sources place permutation-invariant pooling and transport to a reference on one continuum. At one end, a fixed rule pools all elements with equal or preset weights. At the other end, a coupling to a learned reference assigns each element to reference elements, with the assignment shaped by the loss. The radiomics aggregation studies sit at the first end. The supervised transport methods of strand B sit at the second, and they were evaluated on non-medical data in the text read.

#### 2.5 Tensor models with an unaligned mode

Strand A found a third handling of correspondence, in which the factor model itself allows one mode to vary. PARAFAC2 keeps the cross-product of each slice's varying factor constant, so the varying mode may differ in size and order per slice. Kolda and Bader 2009 [kolda2009tensor] present it for matrices whose row count varies. Cohen and Bro 2018 [cohen2018nonnegative] soften the constraint into a coupling penalty, which allows non-negativity on the varying mode. Shift-invariant CP [morup2008shiftinvariant] lets the time mode shift per slice and component. It recovers EEG and fMRI components with delays that plain CP splits. The abstract of Rivet and Cohen 2016 [rivet2016modeling] describes a diffeomorphic time warping per recording. PARAFAC2xN [sorochanarmstrong2023parafac2n] frees two chromatographic modes at once. Ragged and irregular tensor models [hu2026separable; kwon2024compact; cui2024gstrpca] handle irregular index patterns by weights or other structures, the first two known from their abstracts.

The spatial cases of this family come closest to the research question. Roald 2020 [roald2020tracing] lets the voxel mode evolve across slices in task fMRI. Roald 2022 [roald2022an] fits PARAFAC2 with constraints on every mode, including the varying one, and handles ragged tensors. In multi-task fMRI the voxel mode evolves per task, and evolving patterns can rotate and mirror per slice. Subjects in these studies are indexed in an aligned mode on registered data. STORM [cottrell2026subspace], a preprint, gives each tissue slice an orthonormal spatial subspace before a graph-regularized PARAFAC2. Its spot mode varies in number and geometry across slices. CP-HiFi [larsen2024tensor; brust2026fast] places factors in a reproducing kernel Hilbert space and solves for misaligned observations of a continuous mode. Tang 2026 [tang2026tensor] gives a formal model in which each subject is observed at its own time points. These spatial and continuous-mode models are decompositions without an outcome term in the sources read.

#### 2.6 The handlings compared

The five handlings form an order by how much correspondence they impose. Registration imposes a dense map from every voxel to a template voxel. Atlas parcellation imposes a correspondence between named regions, as the connectome regressions and lesion-load predictors show. A template, barycenter or dictionary imposes a soft or hard assignment of each element to a small set of reference elements. A transport coupling between two subjects imposes a pairwise assignment without a reference. Permutation invariance imposes nothing between elements, and the PARAFAC2 family imposes a constant cross-product on the varying mode. The more correspondence a method imposes, the more it depends on the assumption that corresponding elements exist. The lesion normalization studies of Section 2.1 show where this assumption fails. The pooling theory of Section 2.4 shows what is lost when no correspondence is used.

The comparison also shows where the families meet. MultiMorph uses a permutation-invariant mean inside a registration network. OTKE, UOT-Pooling and MMP place transport and attention in one framework. The phenotype clusters of Gharibi 2026 and the global clusters of Zhang 2020 are discrete templates inside radiomics pipelines. FUGW combines a transport coupling with a computed barycenter, whose geometry stays fixed to fsaverage5. Gachon 2025 shows that a Wasserstein barycenter with shared support is k-means on the mean measure. Linear optimal transport connects templates and couplings, since each subject's embedding is its plan to one reference. Wang and Fan 2024 show that a learned reference can also be compared by MMD, with no coupling. Through these links the handlings share their building blocks. They differ in which object carries the correspondence, and in what shapes that object: the image data, the measure data or the label.

### 3. Where each family removes or builds on registration, radiomics and segmentation

#### 3.1 The pipeline step in the matrix

The third theme of the Literature Matrix codes the pipeline step each source removes or builds on. Of the 270 sources, 136 carry the code none, since they work outside an imaging pipeline. These are the chemometrics, EHR, graph and generic point-cloud sources of strands A, B and C. The remaining 134 sources name at least one step. Registration is the step most often built on, with 50 sources coded Builds Reg. Segmentation follows with 36 and radiomics with 24. A further 26 sources study registration itself, 18 study segmentation and 13 study radiomics. Four sources remove registration, one removes radiomics and none removes segmentation. The four that remove registration are FUGW, Mazelet 2026, Su 2015 and TractCloud. Luo 2022 removes radiomics. These counts describe the included set, and the searches that produced it are named in the Identified Gaps section. The methods built for non-aligned data mostly enter a medical pipeline after segmentation. The clinical predictors mostly enter after registration or radiomics.

#### 3.2 Registration: built on, measured, removed

The registration-based predictors build on the step without varying it. The tensor regressions of Section 1.1 register to a template with RAVENS, HAMMER or ANTs. The connectome regressions and Partial quantile tensor regression use an atlas parcellation. The lesion-based stroke predictors register manual lesions to MNI152 or an atlas. Pustina 2017 uses ANTs with cost function masking, Yourganov 2016 enantiomorphic normalization and Forkert 2015 affine-only atlas registration. Salvalaggio 2020 used enantiomorphic normalization followed by affine and diffeomorphic registration. Its authors note that registration success differed from an earlier pipeline on the same cohort, which changed the number of patients included. Shamonin 2013 [shamonin2013fast] classified Alzheimer's disease from voxel-wise template-space features and from 72 multi-atlas regions, with AUCs of 88 and 90 percent. Its accelerated registration left the AUC unchanged. TractGeoNet places tract points in atlas coordinates. Janati 2019, Bazeille 2021 and CAROT couple subjects or atlases after anatomical alignment to a common space.

Three included studies measure how the registration step changes a downstream result across subjects. Thakran 2022 [thakran2022impact] aligned two DCE-MRI visits of 130 women with six deformable methods. Radiomic features of parametric response maps then entered Cox models. Without registration, the radiomic model reached a C-statistic of 0.66, with 0.55 under cross-validation. With ANTs it reached 0.72, with 0.63 under cross-validation, the only significant improvement. The C-statistic followed the landmark-error ranking, and twelve scans were excluded for failed registration. Juhling 2024 measured distortion and lesion volume change in lesion-symptom mapping. Crinion 2007 found that the normalization choice changed group fMRI activations. Thakran 2022 concerns registration between visits of one subject, so its unregistered variant skips alignment and does not replace it. Strand D tags these three studies "supports", meaning that the step changes the prediction or its inputs. Nachev 2008, Andersen 2010 and Ripolles 2012 measure normalization error and lesion volume change without a predictor.

Fawaz 2021 is the one included study that trains the same models on registered and unregistered data. Spherical surface networks went from errors within a week to over a month on rotated unregistered data when they were not equivariant. PointNet++ on native meshes gave an MAE of 0.512 weeks for post-menstrual age. The study is a preprint on neonatal cortical surfaces, and strand C tags it "supports and opposes". It shows that removing registration has a cost that depends on the architecture. The sources that remove registration do so in three ways. FUGW's second experiment and Mazelet 2026 couple individual meshes or geometries by transport. Su 2015 maps each surface to a canonical sphere and compares subjects by transport there. TractCloud trains a streamline classifier with synthetic transformations, so parcellation runs in subject space. Gutierrez-Becker and Wachinger 2018 remove point correspondence and mesh processing, while keeping FreeSurfer segmentation. Mazelet 2026 states that projecting each brain onto a common template removes subject-specific information, as strand C quotes. None of the registration-removing sources predicts a clinical outcome.

#### 3.3 Radiomics: built on, standardized, removed

Radiomics is the feature step that turns each segmented lesion into a vector. The standardization literature defines this step. IBSI [zwanenburg2020the] standardized 169 of 174 features across 25 teams, and most reproduced well on CT, PET and MRI. Every team used the supplied segmentation, and the authors state that acquisition, reconstruction and segmentation remain outside the study. The filter extension [whybra2024the] standardized eight filter types, with 458 of 486 filtered features reproducible across nine teams. PyRadiomics [vangriethuysen2017computational] measured stability across four radiologist segmentations in 429 LIDC-IDRI nodules. First-order and texture features were highly stable, and shape and wavelet features moderately. Kumar 2012 [kumar2012radiomics] states that manual boundaries suffer from significant inter-reader bias. Traverso 2018 [traverso2018repeatability] found in 41 studies that reproducibility depends on acquisition, reconstruction, preprocessing and software. The abstract of Traverso 2020 [traverso2020machine] reports that nearly 30 percent of 841 features correlated strongly with tumour volume.

The radiomics-based predictors build on this step and add aggregation on top. Aerts 2014 [aerts2014decoding] predicted from one segmented primary tumour per patient and selected the 100 features most stable under five oncologists' contours. Liu 2019 [liu2019the] states that the entire primary tumour is usually analysed. Gillies 2016 [gillies2016radiomics] notes that most patients with metastatic cancer have multiple lesions. It gives no rule for combining them. The aggregation studies of Section 1.6 supply such rules. AMINN and Chen and Martel 2022 learn the pooling over radiomic instances. The review of radiomics quality scores by Spadarella 2022 [spadarella2022systematic] found a median score of 21.00 percent across 44 systematic reviews. The authors note that the score fits deep learning studies poorly. Henry 2022 [henry2022investigation] found that robust indexes varied by at least 20 percent across the lesions of one patient. No subsampling strategy recovered the heterogeneity of exhaustive sampling. The radiomics step thus carries both the variability of each lesion's features and the loss from reducing many lesions to few.

One included study removes the radiomics step. The abstract of Luo 2022 reports a point-cloud network on aneurysm models. It reached an internal AUC of 0.913, against 0.803 for ridge regression on radiomics. The external AUC was 0.835 against 0.681 to 0.701. The study keeps the aneurysm and vessel segmentation, whose method is not in the abstract. In the set-encoder studies of strand C, the point cloud of a structure boundary or tract replaces hand-crafted shape features. PANTHER and MMP take patch embeddings from pathology encoders in place of hand-crafted features, at the slide level. The transport embeddings of strand B take element features as given, so they could take radiomic vectors or learned embeddings alike. In the set, radiomic features feed every aggregation study of strand D and the MIL studies of strand C. A learned embedding feeds the point-cloud and pathology studies.

#### 3.4 Segmentation: built on by every lesion-set method

Every lesion-set and structure-based predictor in the set builds on a segmentation step. AMINN used manual slice-by-slice delineation, because nnU-Net segmentation was unsatisfactory, and measured no segmentation error. The aggregation studies use manual or semi-automatic delineation. Sun 2022 did not delineate lesions that could not be separated from surrounding tissue. The point-cloud studies build on FreeSurfer structures, segmented vessels, surface extraction or tract identification. The segmentation benchmarks measure the error that enters these inputs. BRATS [menze2015the] found inter-rater Dice of 74 to 85 percent on glioma scans. In the longitudinal MS challenge [carass2017longitudinal], inter-rater Dice was 0.634, with large differences in lesion volume. ISLES 2015 [maier2017isles] found expert agreement at a Dice of 0.70 on sub-acute stroke lesions. No method segmented all 36 test cases, so a lesion-based predictor can receive an empty lesion map. BraTS-METS 2023 [moawad2025the] reports a winning Dice of 0.65, with missed small lesions and misregistered masks among the common errors.

Detection error changes the set itself. Commowick 2018 [commowick2018objective] found that automatic methods trailed experts on detection and delineation of MS lesions, which changes each subject's lesion count. The abstract of the meta-analysis by Wang 2024 [wang2024brain] reports a pooled lesion-wise sensitivity of 87 percent for brain metastases. In LIDC-IDRI, 928 of 2,669 larger nodules were marked by all four readers [armato2011the]. Moore 2023 [moore2023a] found that CT and MR lesion masks of the same stroke patients overlapped at a mean Dice of 0.42. Both modalities missed lesions. The paired lesion-mapping maps agreed at a mean Dice of 0.335. Poirot 2022 [poirot2022robustness] found that four automatic segmentation methods agreed well, yet classification accuracy differed significantly between them, from 77 to 84 percent. The study used anatomical regions, so it measures a subject-level classifier over matched regions. Zhao 2021 [zhao2021understanding] cites a pilot study in which three radiologists' segmentations gave EGFR prediction AUCs of 0.79, 0.85 and 0.91.

The segmentation literature offers tools that a lesion-set predictor could take as input. QU-BraTS [mehta2022qubrats] scores voxel uncertainty and found that good segmentation did not imply good uncertainty. The MS dataset of Commowick 2021 [commowick2021multiple] provides seven delineations and a consensus per patient, as its abstract describes. The liver dataset of Simpson 2024 [simpson2024preoperative] provides segmentations of each tumour and survival data for 197 patients, 114 of whom had several metastases. The reproducibility literature uses delineation stability to filter features. Aerts 2014, PyRadiomics and Geady 2024 [geady2024radiomic] remove features that are unstable under contour variation. Spagnolo 2023 [spagnolo2023how] found that 5 percent or fewer of 156 MS segmentation studies met the clinical validation steps. In the set, segmentation error is measured at the voxel, lesion and feature levels. It is filtered out of features or ignored before aggregation. Gap 4 records that no screened study propagated it into a subject-level prediction over several lesions.

#### 3.5 The three steps compared across families

Each family enters the pipeline at its own point. The tensor regressions enter after registration and use voxels as the variables. The lesion-mapping studies enter after segmentation and registration and use region loads. The radiomics aggregation studies enter after segmentation and radiomics and use fixed rules. The MIL studies of strand C enter at the same point and learn the pooling. The point-cloud studies enter after segmentation or surface extraction and skip registration, radiomics or both. The transport alignment studies of neuroimaging enter after surface reconstruction, with or without template registration, and stop at alignment or decoding. The supervised transport methods of strand B enter no medical pipeline in the text read. The comparison shows that the step removed differs by family. Registration is removed by transport and canonicalization, and radiomics by point-cloud encoders. Segmentation is removed by no included source, and every lesion-set method depends on it.

The evidence on the cost of each step is also uneven. For registration, three included studies measure its effect on a downstream result, and one trains the same models with and without it. For radiomics, the reproducibility reviews measure its variability, and the aggregation studies measure how the reduction of many lesions changes prediction. For segmentation, the benchmarks measure inter-rater and algorithm error. Poirot 2022 and Zhao 2021 report effects on a subject-level prediction for regions or a single lesion. Strand D found no study that carried segmentation error into an aggregate over several lesions. The tag counts of strand D agree with this. Most aggregation and segmentation sources are tagged "supports", meaning the step changes the prediction or its inputs. The lesion-mapping predictors are tagged neutral, since they do not vary their steps.

### 4. What the documented searches leave open

#### 4.1 Where the three parts of the question meet

Read together, the three sections describe a split in the included set. The families that handle missing correspondence most flexibly are evaluated away from the clinical pipeline. The supervised transport templates of strand B classify graphs and point clouds on benchmark data. The unaligned tensor models of strand A predict from time and cell modes. The registration-free transport alignments of strands B and C stop at alignment, averaging or decoding. Where they predict, the traits are non-clinical, such as IQ and sex. The families that predict clinical outcomes from lesion sets use the least flexible handlings. The radiomics aggregation studies of strand D use fixed rules, and the lesion-mapping studies use registration to a template. The MIL and point-cloud studies of strand C sit between the two groups. They learn the pooling from the label. They treat lesions or points as independent instances, and only the coordinate-based point networks encode location. Gap 1 and Gap 2 of the Identified Gaps section record this split as the documented searches found it.

The pipeline evidence of strand D adds a second observation. Each step ahead of a lesion-set predictor changes its input. Registration changes lesion volume and distorts lesioned images. Segmentation changes which lesions a subject has and how each is delineated. Radiomics carries delineation variability and volume confounding into each lesion's features. Aggregation then reduces the set by a rule whose best choice differed across the three datasets of Geady 2025. The included studies measure these effects one step at a time. Gap 3 concerns registration. No screened study compared a registration-based predictor with one built for non-aligned inputs on the same cohort and outcome. Gap 4 records that no screened study carried segmentation or registration uncertainty into an aggregated subject-level prediction over several lesions. Both gaps rest on the strand D queries and chaining rounds named in their evidence lines.

#### 4.2 Properties the evidence asks of a predictor for non-aligned lesion sets

The included sources state several properties that a subject-level predictor for non-aligned lesion sets would need, each with its source. This section lists them as the evidence states them and proposes no specific method. First, the set size varies by subject, from one lesion to many. Simpson 2024 reports that 58 percent of its patients had several metastases. Chang 2021 found that the best fixed rule changed with lesion count. Second, some lesions have no counterpart in another subject. The unbalanced transport sources [chizat2018scaling; sejourne2021the; thual2022aligning] relax the marginal constraints for this case. Third, pooling of independent instances loses information that relations and positions carry. Wagstaff 2019, FSW and Set Transformer state this for set encoders, and Henry 2022 shows it for lesion subsampling. Fourth, the lesion set itself is uncertain. The LIDC-IDRI reader study, the MS challenges and QU-BraTS measure this uncertainty at the source.

Further properties come from the cost and the evaluation evidence. Fifth, exact transport couplings are cubic in set size per iteration. The scalable variants give up the full coupling, as Gap 5 records. The amortized solvers [mazelet2025unsupervised; mazelet2026learning; qian2024reimagining] are the recent route to large sets in the set. Sixth, small clinical cohorts make learned aggregation unstable. Wilk 2025 reported test c-indices from 0.09 to 0.94 across splits, and AMINN attributes its weaker attention result to sample size. Kothapalli 2023 found that the benefit of transport or attention pooling diminishes with more complex backbones. Seventh, a learned reference can be compared by MMD at lower cost than by transport. Wang and Fan 2024 found MMD better in their tests. Any transport-based design meets this result as a baseline. The properties are drawn from sources of different strands. No included source states all of them together, and the documented searches found no study that addresses them jointly on a clinical outcome.

#### 4.3 Baselines and evaluation designs the set provides

The included set also supplies baselines and data for a later method paper. On the aggregation side, Chang 2021 and Geady 2025 give the reference comparisons of fixed rules. Geady 2025 adds total tumour volume as a baseline that no rule consistently beat. Yourganov 2016 shows that lesion size alone was about as predictive as regional damage in its cohort. On the registration side, the ANTs pipeline [avants2011a; avants2009advanced] is the alignment step most predictive studies name. Forkert 2015 and Shamonin 2013 give region-wise baselines. On the set-encoder side, Deep Sets, attention MIL and Set Transformer are the standard learned poolings. AMINN applies attention MIL to radiomic lesion features. On the transport side, OTKE, PSWE and TFGW are the learned-reference embeddings, and WEGL and LOT are the fixed-reference ones. Two public data sources in the set have several lesions per patient and patient-level outcomes. They are the liver metastasis data of Simpson 2024 and the TCIA cohorts used by Chen and Martel 2022.

The evaluation designs in the set also differ in a way a later paper can use. Fawaz 2021 trains the same models on registered and unregistered data. Thakran 2022 compares registration methods and no registration on the same features. Wilk 2025 keeps a patient's lesions together in its splits. Poirot 2022 varies the segmentation method and reports the effect on a classifier. Pustina 2017 shows that moving variable selection inside the cross-validation lowered its correlations. Geady 2025 replicates published rules on several datasets. These designs measure the effect of one step or one rule while holding the rest of the pipeline fixed. A comparison of correspondence handlings on one clinical cohort could take its controls from them. The Recommended Sources table lists the sources by the paper section where each serves.

#### 4.4 Limits of this synthesis

The synthesis rests on the screened records of the four strands. Its statements that a kind of study was not found have the scope of those searches. Four of the named databases were not searched, and DBLP was blocked. Strand D did not chain the reference lists of the 20 works its citation loop added. Strand C screened the top-ranked records of each query, and its later layers found no new record beyond one 1997 foundation. A study indexed only in the unsearched databases, or ranked below these cut-offs, could change Gaps 1 to 4. The read level also limits some comparisons. The supervised template methods WDDL and the prototype method of Qian 2024 are known from their abstracts. So are several aggregation studies, among them Gharibi 2026, Liao 2023 and Zhao 2022. Their claims above say no more than their abstracts. Finally, the strands rated quality by their own criteria, and the merge kept the lower rating for shared works.



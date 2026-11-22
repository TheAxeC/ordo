## Literature Search Report

Merge run of the this literature review run of 2026-11-19, over the four theme runs recorded in `theme-report-1.md` to `theme-report-4.md`. The merged set holds 129 works, one key each, all in `refs.bib`.

Research question (settings.md, word for word): "Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?"

Sub-questions (settings.md, "Decisions" item 2):

- SQ1: How does the method handle the missing correspondence across subjects: registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance?
- SQ2: Is the method supervised for a subject-level outcome (classification, regression, survival), and how does the outcome enter the objective (end to end, two-stage features then predictor, or unsupervised only)?
- SQ3: Which pipeline step does it remove or rely on: image registration, radiomics feature extraction, lesion segmentation?
- SQ4: What data does it take (point clouds, sets of lesions or regions, graphs, aligned tensors), and has it been applied to medical imaging?

**Reading convention.** An SQ answer without a mark rests on a passage the theme run or this merge run read, as the annotation's "Read" line names. "[inferred]" marks an inference by the run that wrote it, from a common grid, a template or a pipeline description, and not a statement of the source. "[not stated in the parts read]" marks a point the reading could not settle.

### Search Strategy

#### Profile and inputs

- Domain evidence profile: the row reads `cs_ml`, with no suffix. Screening used the neutral criteria with the `cs_ml` admit path: archival preprints and proceedings count as peer-reviewed-equivalent, and then pass the relevance and methodology nodes unchanged.
- `[PROFILE-DISCIPLINE-MISMATCH]`: the Discipline row reads "Machine learning, with medical image analysis as the application setting; methods admitted from any application domain". The implied disciplines of `cs_ml` are CS, Engineering and Technology, and the row names none of them. The page compares names and infers nothing, so the warning stands for the merged set. Themes 1, 2 and 4 wrote it. Theme 3 judged the row to fall inside the implied disciplines and did not write it. The warning blocks nothing: admission used `cs_ml`, and the Discipline row chose the databases.
- Materials in hand: none. No source list was given, so no PRE-SCREENED block applies and no patch is written.
- Paper type IMRaD (minimum 20 sources, typical range 25 to 40). Language English.
- Date range: recent work 2015 to 2026 (theme 1 and 4), 2016 to 2026 (theme 2) and 2017 to 2026 (theme 3), with foundational works admitted whatever their year through the seminal-work path or because the run brief named them.

#### Key concepts

- Primary: subject-level outcome prediction; missing cross-subject correspondence; supervised multilinear and tensor methods (N-PLS, HOPLS, tensor regression, PARAFAC2); optimal transport (Sinkhorn, Gromov-Wasserstein, fused Gromov-Wasserstein, barycenters, dictionaries, templates); permutation-invariant set encoders and point-cloud networks; registration, radiomics and lesion segmentation as pipeline steps.
- Secondary: irregular or unaligned mode, shift-invariant decomposition, supervised CP, coupled factorization; unbalanced, semi-relaxed and low-rank transport, linear optimal transport (LOT), transport kernels, distribution regression; Janossy pooling, Set Transformer, attention-based multiple-instance learning (MIL), sliced-Wasserstein pooling; atlas, template, registration-free, lesion-level, multifocal, point cloud of anatomy, radiomics reproducibility.

#### Databases and access, by theme run

| Theme | Reached | Not reached |
|---|---|---|
| 1 | OpenAlex (keyword, citation, semantic), Crossref (keyword and ISSN-filtered for 8 journals), arXiv API, WebSearch, JMLR and PMLR pages, Europe PMC, author-hosted PDFs | IEEE Xplore, ACM DL and Scopus (no interface access; their records reached through OpenAlex and Crossref). Semantic Scholar: HTTP 429 on 3 queries. OpenAlex: HTTP 429 on 2 queries |
| 2 | arXiv API, PMLR and NeurIPS proceedings pages, OpenReview API, Crossref and doi.org, OpenAlex, PubMed E-utilities, POT documentation, JMLR site search, WebSearch | Semantic Scholar (HTTP 429), Google Scholar (redirect), IEEE Xplore (HTTP 418), ACM DL and Scopus (HTTP 403) |
| 3 | arXiv API, OpenAlex, Semantic Scholar (1 of 3 calls), WebSearch, proceedings pages (NeurIPS, PMLR, ICLR, CVF, JMLR, MICCAI), doi.org with Crossref, Europe PMC | IEEE Xplore and ACM DL searched only through DOI resolution |
| 4 | PubMed search page, arXiv API, Semantic Scholar (1 of 6 calls), OpenAlex, Crossref, Europe PMC, WebSearch, proceedings pages | Google Scholar (verification page), IEEE Xplore (HTTP 418), Scopus and ACM DL (no access). The PubMed connector was denied permission |
| Merge (currency gate) | arXiv API, WebSearch, doi.org with Crossref, MICCAI paper pages, arXiv HTML | None |

#### Queries run, as the theme runs recorded them

Counts are the totals each tool reported. Crossref and OpenAlex keyword totals count any-term matches and are no measure of the literature. "Shown" is the number of records read at title level.

**Theme 1** (supervised tensor methods with an unaligned mode). Layer 1, Boolean and keyword:

| # | Engine | Query | Total | Shown |
|---|---|---|---|---|
| 1 | OpenAlex | "partial least squares" multiway OR "N-PLS" OR "higher-order partial least squares" | 2504 | 20 |
| 2 | OpenAlex | multilinear partial least squares regression tensor | 1466 | 20 |
| 3 | Crossref | multiway partial least squares regression | 532068 | 15 |
| 4 | Crossref | higher-order partial least squares tensor | 1453272 | 15 |
| 5 | arXiv | all:"partial least squares" AND all:tensor | 8 | 8 |
| 6 | OpenAlex | tensor regression neuroimaging low-rank | 8745 | 20 |
| 7 | OpenAlex | generalized linear tensor regression CP decomposition | 4574 | 15 |
| 8 | OpenAlex | Bayesian tensor regression | 44853 | 15 |
| 9 | OpenAlex | tensor response regression | 152593 | 10 |
| 10 | arXiv | ti:"tensor regression" | 67 | 25 |
| 11 | OpenAlex | PARAFAC2 (sorted by citations) | 1014 | 30 |
| 12 | OpenAlex | PARAFAC2 constrained OR sparse OR supervised OR irregular | 11965411 | 20 |
| 13 | arXiv | all:PARAFAC2 | 30 | 30 |
| 14 | Crossref | PARAFAC2 | 88 | 30 |
| 15 | OpenAlex | supervised tensor decomposition outcome | 29742 | 20 |
| 16 | OpenAlex | supervised CP decomposition side information covariates | 1392 | 15 |
| 17 | OpenAlex | coupled matrix tensor factorization (sorted by citations) | 44839 | 15 |
| 18 | arXiv | all:"supervised tensor" AND (all:decomposition OR all:factorization) | 6 | 6 |
| 19 | arXiv | all:"irregular tensor" | 14 | 14 |
| 20 | OpenAlex | coupled matrix and tensor factorization data fusion | 7811 | 15 |
| 21 | OpenAlex | tensor decomposition unaligned observations | 704 | 15 |
| 22 | OpenAlex | logistic PARAFAC2 electronic health records phenotyping | 38 | 15 |
| 23 | OpenAlex | supervised multiway factorization | 1088 | 15 |
| 24 | arXiv | all:"coupled matrix and tensor" | 9 | 9 |
| 25 | OpenAlex | shift-invariant multilinear decomposition neuroimaging | 197 | 10 |
| 26 | OpenAlex | tensor ragged mode varying size slices decomposition | 106 | 15 |
| 27 | OpenAlex | tensor classification neuroimaging Alzheimer MRI low-rank | 3248 | 15 |
| 28 | OpenAlex | tensor regression point cloud OR shape OR "functional data" unaligned | 13288776 | 15 |
| 29 | arXiv | all:tensor AND all:regression AND all:misaligned | 0 | 0 |
| 30 | OpenAlex | logistic PARAFAC2 binary irregular tensor | 26 | 10 |
| 31, 32 | OpenAlex | semi-supervised PARAFAC2 computational phenotyping; tensor discriminant analysis misaligned images alignment | none (HTTP 429) | 0 |
| 33 | arXiv | ti:"time warping" AND ti:tensor | 0 | 0 |
| 34, 35 | WebSearch | supervised PARAFAC2 outcome prediction irregular tensor survival classification; tensor regression covariates without spatial correspondence across subjects registration-free shape tensor | no count | 10 links each |
| 36 to 43 | Crossref, ISSN-filtered | Journal of Chemometrics, Chemometrics and Intelligent Laboratory Systems, NeuroImage, JASA, Annals of Statistics, IEEE TPAMI, IEEE TSP, SIAM J. Math. Data Sci. | 331, 479, 905, 1738, 901, 601, 473, 20 | 8 each |

Theme 1 layer 2 read the reference lists of 10 core papers (463 references); 50 works were cited by two or more cores, and the works cited by three or more were marked "must include" and then passed through the universal gates. Layer 3 forward-tracked 7 works (queries 44 to 50; totals 91, 291, 43, 14, 9, 30, 27). Layer 4 ran 3 OpenAlex semantic queries (engine cap 50 each, 15 shown each) and 3 Semantic Scholar queries that returned HTTP 429.

**Theme 2** (optimal transport distances, barycenters and dictionaries). Layer 1, arXiv API, each run twice with the same totals:

| # | Query | Total | Shown |
|---|---|---|---|
| 1 | abs:"gromov-wasserstein" AND abs:dictionary | 4 | 4 |
| 2 | abs:"fused gromov-wasserstein" | 58 | 30 |
| 3 | abs:"optimal transport" AND abs:template AND abs:"graph neural" | 1 | 1 |
| 4 | abs:"wasserstein barycenter" AND (abs:learning OR abs:dictionary) | 102 | 25 |
| 5 | abs:"gromov-wasserstein barycenter" | 5 | 5 |
| 6 | abs:"unbalanced optimal transport" AND abs:"scaling algorithm" | 5 | 5 |
| 7 | abs:"optimal transport" AND abs:kernel AND abs:embedding AND abs:"set" | 16 | 16 |
| 8 | abs:"linear optimal transport" AND abs:embedding | 11 | 11 |
| 9 | abs:"distribution regression" AND abs:wasserstein | 13 | 13 |
| 10 | abs:"gromov-wasserstein" AND (abs:classification OR abs:regression) AND abs:supervised | 5 | 5 |
| 11 | abs:"optimal transport" AND abs:"point cloud" AND abs:classification AND abs:template | 0 | 0 |
| 12 | abs:"sinkhorn" AND abs:differentiable AND abs:layer | 13 | 13 |
| 13 | abs:"unbalanced" AND abs:"gromov-wasserstein" | 30 | 20 |
| 14 | abs:"wasserstein" AND abs:"graph kernel" | 11 | 11 |
| 15 | abs:"optimal transport" AND abs:"cortical" AND abs:alignment | 2 | 2 |
| 16 | abs:"wasserstein embedding" AND abs:graph | 1 | 1 |
| 17 | abs:"optimal transport" AND abs:"multiple instance learning" | 4 | 4 |
| 18 | abs:"gromov-wasserstein" AND abs:"low-rank" | 9 | 9 |
| 19 | abs:"barycenter" AND abs:"end-to-end" AND abs:"optimal transport" | 1 | 1 |
| 20 | ti:"gromov-wasserstein" AND abs:"point cloud" | 9 | 9 |
| 21 | abs:"optimal transport" AND abs:"supervised" AND abs:"ground metric" AND abs:learning | 3 | 3 |

The 21 queries reported 303 records and showed 188 (171 unique). Theme 2 also ran 5 WebSearch venue lookups (10 links each) and 3 Crossref keyword queries (totals 545409, 2925267, 1509847; 15 shown each). Layer 2 read the reference lists of TFGW, OTKE and GDL and the POT documentation (88 indexed entries). Layer 3 forward-tracked 5 records (citing works 27, 10, 20, 41, 58; 105 shown). Layer 4 ran 7 WebSearch semantic queries (Semantic Scholar returned HTTP 429), and 9 of the 12 records that bore on the theme were already candidates (75 percent).

**Theme 3** (permutation-invariant set encoders and point-cloud learning). Layer 1, arXiv API:

| # | Query | Total | Shown |
|---|---|---|---|
| q1 | abs:"permutation invariant" AND abs:"set" AND abs:"neural" AND (cat:cs.LG OR cat:stat.ML) | 104 | 40 |
| q2 | abs:"set functions" AND (abs:expressive OR abs:expressivity OR abs:universal OR abs:limitations) AND (cat:cs.LG OR cat:stat.ML) | 33 | 33 |
| q3 | (abs:"sum-decomposition" OR abs:"sum decomposition" OR abs:janossy OR all:"deep sets") AND (abs:invariant OR abs:permutation) | 83 | 40 |
| q4 | (ti:"point cloud" OR ti:"point set" OR ti:"point sets") AND (abs:classification OR abs:segmentation) AND abs:"deep" AND cat:cs.CV | 337 | 40 |
| q5 | ti:"point transformer" OR ti:"graph cnn" OR ti:"pointnet" OR ti:"point cloud transformer" OR ti:"edgeconv" | 163 | 40 |
| q6 | abs:"multiple instance learning" AND (abs:attention OR abs:pooling) AND (abs:deep OR abs:neural) | 121 | 40 |
| q7 | (abs:"sliced wasserstein" OR abs:"optimal transport") AND (abs:pooling OR abs:embedding) AND (abs:"set" OR abs:"sets" OR abs:"point cloud") AND (cat:cs.LG OR cat:stat.ML) | 85 | 40 |
| q8 | (abs:"point cloud" OR abs:pointnet OR abs:"point set") AND (abs:brain OR abs:anatomy OR abs:anatomical OR abs:cortical OR abs:lesion OR abs:lesions) AND (abs:prediction OR abs:classification OR abs:diagnosis OR abs:age) | 79 | 50 |
| q9 | (abs:"set of lesions" OR abs:"sets of lesions" OR abs:"multiple lesions" OR abs:"lesion-level") AND (abs:"permutation" OR abs:"deep sets" OR abs:"set transformer" OR abs:attention OR abs:"multiple instance") | 17 | 17 |

Theme 3 layer 2 read the references of 15 core papers in three rounds (24, 23 and 44 works cited by two or more cores). Layer 3 forward-tracked PointNet (169 citing works with a medical filter), Ilse et al. (187), PSWE (26) and Janossy pooling (85), 25 shown each. Layer 4: one Semantic Scholar query returned 89 (25 shown), two returned HTTP 429, and three WebSearch queries returned 10 links each.

**Theme 4** (medical-imaging pipelines and registration-free fusion):

| ID | Tool | Query | Total | Shown |
|---|---|---|---|---|
| P1 | PubMed 2015-2026 | ("optimal transport" OR Wasserstein) AND (MRI OR "medical imaging" OR neuroimaging) AND (classification OR prediction) | 59 | 50 |
| P2 | PubMed | ("multiple instance learning" OR "set of lesions" OR "lesion-level" OR "per-lesion") AND (metastases OR "multiple sclerosis" OR multifocal) AND (prediction OR prognosis OR survival) | 682 | 50 |
| P3 | PubMed | radiomics[Title] AND (reproducibility[Title] OR robustness[Title] OR stability[Title] OR repeatability[Title]) AND (segmentation OR registration) | 85 | 50 |
| P4 | PubMed | ("point cloud" OR "point clouds") AND (MRI OR CT OR anatomy) AND (classification OR prediction OR diagnosis) AND ("deep learning") | 85 | 50 |
| P5 | PubMed | ("optimal transport" OR "Gromov-Wasserstein" OR "Wasserstein barycenter") AND (registration OR alignment OR template OR atlas) AND (brain OR MRI OR CT) | 54 | 50 |
| P6 | PubMed | ("brain metastases") AND ("deep learning" OR "multiple instance" OR attention) AND ("patient-level") AND (survival OR response OR outcome OR prediction) | 5 | 5 |
| P7 | PubMed | (registration-free OR "without registration" OR "atlas-free" OR "registration free") AND (MRI OR CT OR PET) AND (classification OR prediction OR prognosis) | 7,727 | 50 |
| P7b | PubMed | P7 tightened to title and abstract fields, with "unregistered" and survival added | 71 | 50 |
| A1 | arXiv | abs:"optimal transport" AND abs:registration-free AND (cat:eess.IV OR cat:cs.CV) | 1 | 1 |
| A2 | arXiv | abs:"point cloud" AND (abs:anatomy OR abs:anatomical) AND (abs:classification OR abs:prediction) AND (cat:eess.IV OR cat:cs.CV) | 40 | 40 |
| A3 | arXiv | (abs:"optimal transport" OR abs:Wasserstein) AND (abs:lesions OR abs:lesion) AND (cat:eess.IV OR cat:cs.CV OR cat:cs.LG) | 20 | 20 |
| A4 | arXiv | (abs:"optimal transport" OR abs:"Gromov-Wasserstein") AND (abs:subjects) AND (abs:brain OR abs:MRI OR abs:fMRI OR abs:cortical) | 12 | 12 |
| S1 | Semantic Scholar | registration-free subject-level prediction set of lesions | 16 | 16 |
| S2 to S6 | Semantic Scholar | five queries on MIL for brain metastases, MS lesion-level prediction, OT barycenters in neuroimaging, anatomical point clouds, radiomics robustness | none (HTTP 429) | 0 |
| W1, W2 | WebSearch | MIL for brain metastases; MS lesion-level set or graph models for EDSS | no count | 10 links each |
| O1 to O4 | OpenAlex from 2015 | MS lesions GNN patient classification; WMH distribution without registration; radiomics variability with deformable registration; lesion set permutation invariant outcome | 5,835; 2,169; 1,193; 821 | 21 each |
| F1 to F5 | OpenAlex cites: | AMINN; Bazeille et al. 2019; Gramfort et al. 2015; Feydy et al. 2017 (filter "medical"); Gutierrez-Becker et al. 2018 | 21; 33; 137; 89; 27 | 21; 33; 44; 29; 27 |
| B1, B2 | OpenAlex referenced_works | AMINN; Chen et al. 2022 | 24; 32 | 24; 32 |

**Merge run, currency-gate search** (failure handling "Insufficient currency", step 1, a specialised search for the last three years). arXiv API, every query with `submittedDate:[202401010000 TO 202611192359]`:

| ID | Query (before the date filter) | Total | Shown |
|---|---|---|---|
| M1 | (abs:"optimal transport" OR abs:wasserstein OR abs:"gromov-wasserstein") AND (abs:patient OR abs:subject OR abs:subjects) AND (abs:"point cloud" OR abs:lesions OR abs:regions OR abs:connectome) AND (abs:classification OR abs:prediction OR abs:prognosis) | 10 | 10 |
| M2 | (abs:"multiple instance" OR abs:"set transformer" OR abs:"permutation invariant") AND (abs:lesions OR abs:metastases OR abs:"multi-lesion") AND (abs:survival OR abs:prognosis OR abs:outcome OR abs:response) | 5 | 5 |
| M3 | (abs:"gromov-wasserstein" OR abs:"fused gromov") AND (abs:template OR abs:templates OR abs:prototype OR abs:dictionary) AND (abs:classification OR abs:supervised) | 1 | 1 |
| M4 | (abs:"point cloud" OR abs:"point clouds") AND (abs:brain OR abs:cortical OR abs:anatomical OR abs:cardiac) AND (abs:disease OR abs:diagnosis OR abs:age) AND (abs:classification OR abs:prediction OR abs:regression) | 3 | 3 |
| M5 | (abs:"optimal transport" OR abs:wasserstein) AND (abs:template OR abs:templates OR abs:prototypes OR abs:"reference set" OR abs:"reference measure") AND (abs:"graph classification" OR abs:"set classification" OR abs:"point cloud classification" OR abs:"distribution regression") | 2 | 2 |
| M6 | (abs:lesion OR abs:lesions OR abs:tumors OR abs:tumours) AND (abs:"graph neural network" OR abs:"multiple instance learning") AND (abs:patient-level OR abs:"patient level") AND (abs:survival OR abs:prognosis OR abs:outcome) | 7 | 7 |
| M7 | (abs:"sliced wasserstein" OR abs:"optimal transport") AND (abs:pooling OR abs:aggregation) AND (abs:"multiple instance" OR abs:"whole slide" OR abs:sets) | 42 | 40 |
| M8 | (abs:PARAFAC2 OR abs:"irregular tensor" OR abs:"tensor regression") AND (abs:supervised OR abs:outcome OR abs:prediction) | 16 | 16 |
| M9 | (abs:"optimal transport" OR abs:wasserstein) AND (abs:lesion OR abs:lesions) AND (abs:MRI OR abs:CT OR abs:PET) | 1 | 1 |
| M10 | (abs:"cortical surface" OR abs:"brain shape" OR abs:"anatomical shape") AND (abs:"point cloud" OR abs:"geometric deep learning" OR abs:mesh) AND (abs:prediction OR abs:classification) AND (abs:registration OR abs:correspondence OR abs:template) | 5 | 5 |
| M11 | (abs:"gromov-wasserstein" OR abs:"optimal transport") AND (abs:connectome OR abs:parcellation OR abs:"brain network" OR abs:"brain networks") | 10 | 10 |
| W-M1 | WebSearch: 2025 Gromov-Wasserstein brain network classification subjects without node correspondence | no count | 10 links |
| W-M2 | WebSearch: MICCAI 2024 OR 2025 multiple lesions set patient-level outcome prediction permutation invariant attention lesion graph | no count | 10 links |
| W-M3 | WebSearch: 2024 2025 optimal transport learnable template point cloud classification medical shape disease prediction | no count | 10 links |

The 11 arXiv queries reported 102 records and showed 100. Each source added in this round was confirmed by a live lookup: its arXiv record through the arXiv API, and its DOI at `https://doi.org/<doi>` (HTTP 302) with the Crossref record, or its MICCAI paper page.

#### Inclusion and exclusion criteria

| Criterion | Include | Exclude |
|---|---|---|
| Publication type | Journal articles, books, proceedings; archival preprints under `cs_ml` | Blogs, news, abstracts without a paper |
| Date | The windows above, and seminal works of any year | Older work that is not seminal |
| Language | English | Other languages |
| Relevance | Addresses at least one of SQ1 to SQ4 within a theme's scope | Tangential |
| Methodology | No fatal design flaw | A fatal flaw, a predatory venue, or a record that could not be confirmed |

#### Stopping rules, as each run recorded them

- Theme 1: four of five met (count 30; last round added 1 of 30; every sub-topic at least 3; foundational works 1970 to 2013 and 7 sources from 2024 to 2026). The citation loop was not closed.
- Theme 2: four of five met (count 35; layer 4 added 0; every sub-topic at least 4; foundational works 2011 to 2016 and 6 sources from 2023 to 2026). The citation loop was not closed (2 unconfirmed works).
- Theme 3: four of five met (count 30; layer 4 added 1 of 30; every sub-topic at least 3; foundational works from 1997 and 2016 to 2019, and work of the last 3 years). The citation loop was not fully closed.
- Theme 4: four of five met (count 35; last round added 2 of 33; every sub-topic at least 4; seminal works 2008 to 2015 and work from 2023 to 2026). The citation loop was not closed (3 works unassessed).

#### Deduplication across the themes

| Kept key | Keys folded into it | Themes | Shared identifier | Merge note |
|---|---|---|---|---|
| `thual2022aligning` | `thual2022aligning` of theme 4 | 2, 4 | DOI 10.52202/068431-1584, arXiv 2206.09398 | Same key in two files. The theme 2 entry, which carries both identifiers, is kept |
| `mazelet2026learning` | `mazelet2026learning` of theme 4 | 2, 4 | arXiv 2605.20883 | Same key in two files. The theme 2 entry is kept |
| `mialon2021otke` | `mialon2021trainable` | 2, 3 | arXiv 2006.12065 | One ICLR 2021 paper under two keys |
| `chen2022tracts` | `chen2022white` | 3, 4 | DOI 10.1007/978-3-031-16431-6_17, arXiv 2207.02402 | One MICCAI 2022 paper under two keys |
| `beetz2023mi` | `beetz2023shape` | 3, 4 | DOI 10.1109/EMBC40787.2023.10340878, arXiv 2307.07298 | One EMBC 2023 paper under two keys |
| `gutierrezbecker2021discriminative` | `gutierrezbecker2018multistructural` | 3, 4 | DOIs 10.1016/j.media.2020.101852 and 10.1007/978-3-030-00931-1_60 | Two publications of one line of work: the MICCAI 2018 paper and its Medical Image Analysis extension. Theme 3 kept the conference paper and theme 4 the journal paper, and each run excluded the other's choice as the other version. They are counted as one work, under the journal version of record. The annotation keeps the figures each run read, each attributed to its version |

The leads one theme run passed to another were checked against the merged set:

- Theme 2 passed Gramfort et al. 2015 and Su et al. 2015 to theme 4, which included both (`gramfort2015fast`, `su2015shape`).
- Theme 2 excluded "Revisiting global pooling through the lens of OT" (TPAMI, DOI 10.1109/TPAMI.2023.3314661) as theme 3 material, and theme 3 included it as `xu2023rotp`. It stands once, under `xu2023rotp`.
- Theme 3 excluded Mahan et al. 2024 and flagged it for theme 2, which included it as `mahan2024point`. It stands once, tagged for both themes.
- Theme 2's report that Shen et al. 2021 (point-cloud registration with robust transport) belongs to theme 4 matches theme 4's inclusion of `shen2021accurate`.
- Leads that no run assessed stay out of the merged set and are listed under "Leads not assessed".

#### Identifier check: decisions on printed differences

`checks.md` printed, for 77 entries, a title, year or venue that differs from the entry, and for further entries an arXiv record as the venue. Each decision below sets the version-of-record title, venue and year in `refs.bib`. Three kinds of difference recur:

- An arXiv or online-first year: the entry keeps the year of the version of record.
- A Lecture Notes series name printed as the venue: the entry keeps the proceedings volume title with `series = {Lecture Notes in Computer Science}`.
- An index's short form of a conference name: the entry keeps the full proceedings title.

| Key | What the index printed | What the entry holds | Decision and reason |
|---|---|---|---|
| zhao2013hopls | OpenAlex year 2012 | 2013, TPAMI 35(7) | Keep 2013: the issue year; 2012 is online-first |
| park2026sparsehopls | Crossref and OpenAlex year 2025 | 2026, Biometrika 113(1) | Keep 2026: volume 113, issue 1 is the 2026 issue; 2025-11-19 is the online date |
| zhou2013tensor | Semantic Scholar year 2012 | 2013, JASA 108(502) | Keep 2013: 2012 is the arXiv year |
| guhaniyogi2017bayesian | OpenAlex, Semantic Scholar, arXiv year 2015; OpenAlex venue arXiv | 2017, JMLR 18(79) | Keep 2017 and JMLR: the version of record on the JMLR page the theme run fetched |
| li2018tucker | Semantic Scholar year 2013 | 2018, Statistics in Biosciences 10(3) | Keep 2018: 2013 is the arXiv year |
| lock2018tensor | OpenAlex and Semantic Scholar year 2017 | 2018, JCGS 27(3) | Keep 2018: the issue year |
| perros2017spartan | Crossref title "SPARTan" (DOI_MISMATCH in OpenAlex and Semantic Scholar at ratio 0.26); OpenAlex venue "ACM SIGKDD Conference ... (KDD)" | "SPARTan: Scalable PARAFAC2 for Large & Sparse Data", KDD 2017 proceedings | Keep the full title: Crossref holds the subtitle in a separate field, and OpenAlex and Semantic Scholar print the full title on the same DOI. Keep the full proceedings title |
| afshar2018copa | Crossref title "COPA" (DOI_MISMATCH at 0.15 in the other two); OpenAlex venue "(CIKM)" | "COPA: Constrained PARAFAC2 for Sparse & Large Datasets", CIKM 2018 proceedings | Same decision as perros2017spartan |
| cohen2018nonnegative | Crossref and OpenAlex venue "Lecture Notes in Computer Science" | booktitle "Latent Variable Analysis and Signal Separation", series LNCS | Keep: the volume title with the series field |
| roald2022aoadmm | Semantic Scholar year 2021 | 2022, SIMODS 4(3) | Keep 2022: 2021 is the arXiv year |
| yin2020logpar | Crossref venue with "&amp;"; OpenAlex "(KDD)"; Semantic Scholar "Knowledge Discovery and Data Mining" | KDD 2020 proceedings | Keep: the same venue; "&amp;" is HTML escaping of "&" |
| hu2022generalized | Crossref and OpenAlex year 2021; Semantic Scholar 2019 | 2022, JCGS 31(1) | Keep 2022: volume 31, issue 1 is the 2022 issue; 2021 is online, 2019 arXiv |
| ren2023multipar | OpenAlex, Semantic Scholar, arXiv title without "for Computational Phenotyping", year 2022, venue arXiv | PMLR 225 title, 2023 | Keep the PMLR title and year: the version of record the theme run fetched on proceedings.mlr.press |
| sprangers2023group | Semantic Scholar year 2022 | 2023, SIMODS 5(4) | Keep 2023: 2022 is the arXiv year |
| schenker2025parafac2cmtf | Semantic Scholar year 2024, venue "IEEE Journal on Selected Topics ..." | 2025, IEEE JSTSP 19(7) | Keep 2025 and the journal's own name: 2024 is the arXiv year |
| harshman1972parafac2 | Crossref title with `<scp>` markup and curly quotes; OpenAlex "PARAFAC2 :" (ratio 0.97) | Same title in plain form | Keep: markup and spacing only |
| kiers1999parafac2 | OpenAlex "PARAFAC2 - Part I" (ratio 0.99); Crossref with an em dash | "PARAFAC2--Part I" | Keep: punctuation only |
| cuturi2013sinkhorn | OpenAlex and arXiv title ending "Optimal Transportation Distances"; OpenAlex venue arXiv | NeurIPS 26 title ending "Optimal Transport" | Keep the NeurIPS title: the version of record |
| peyre2019computational | Semantic Scholar DOI_MISMATCH at 0.64: "Computational Optimal Transport", 2018 | "Computational Optimal Transport with Applications to Data Sciences", FnTML 11(5-6), 2019 | Keep the journal title and year: Crossref and OpenAlex print it on the DOI; the short title is the arXiv and book form |
| chizat2018scaling | OpenAlex and Semantic Scholar year 2017 | 2018, Math. Comp. 87(314) | Keep 2018: the issue year |
| feydy2019interpolating | Year 2018 in three indexes; OpenAlex venue arXiv | AISTATS 2019, PMLR 89 | Keep 2019 and AISTATS: the version of record |
| eisenberger2022unified | OpenAlex venue "IEEE Computer Society Conference on Computer Vision and Pattern Recognition/Proceedings ..." | CVPR 2022 proceedings | Keep: the Crossref venue name of the same DOI |
| memoli2011gromov | No difference in title words (en dash in the printed title) | Same | Keep |
| vayer2019optimal | Year 2018 in three indexes; OpenAlex venue HAL | ICML 2019, PMLR 97 | Keep 2019 and ICML: the version of record. The author order follows the PMLR page |
| sejourne2021unbalanced | OpenAlex and arXiv year 2020; OpenAlex venue arXiv | NeurIPS 34, 2021 | Keep 2021: the version of record |
| scetbon2022linear | Year 2021 in three indexes; OpenAlex venue arXiv | ICML 2022, PMLR 162 | Keep 2022: the version of record |
| thual2022aligning | Semantic Scholar lower-case title | Crossref title | Keep the Crossref title of the DOI |
| vincentcuaz2022semirelaxed | Title "... divergence with applications on graphs", year 2021, venue arXiv | ICLR 2022 title "... and applications on graphs" | Keep the ICLR title and 2022: the OpenReview record the theme run read |
| cuturi2014fast | Year 2013 in three indexes; OpenAlex venue Oxford archive | ICML 2014, PMLR 32 | Keep 2014 and ICML: the version of record |
| benamou2015iterative | Semantic Scholar year 2014 | 2015, SISC 37(2) | Keep 2015: 2014 is the arXiv year |
| brogatmotte2022learning | OpenAlex venue arXiv | ICML 2022 | Keep ICML: the version of record |
| schmitz2018wasserstein | Semantic Scholar year 2017, venue "SIAM Journal of Imaging Sciences", arXiv title "unsupervised non-linear" | 2018, SIAM J. Imaging Sci. 11(1) | Keep the journal title, name and year |
| vincentcuaz2021online | OpenAlex venue arXiv | ICML 2021, PMLR 139 | Keep ICML |
| kolouri2016sliced | OpenAlex long CVPR venue string; Semantic Scholar year 2015 | CVPR 2016 | Keep 2016 and the Crossref venue name: 2015 is the arXiv year |
| wang2013linear | Year 2012 in three indexes | 2013, IJCV 101(2) | Keep 2013: the issue year; 2012 is online-first |
| moosmuller2023linear | Crossref and OpenAlex year 2022 | 2023, Information and Inference 12(1) | Keep 2023: the issue year |
| togninalli2019wasserstein | OpenAlex venue arXiv, pages 6439-6449, DOI 10.3929/ethz-b-000420933; Semantic Scholar pages 6436-6446 | NeurIPS 32, no pages | Keep NeurIPS without pages: the two indexes disagree on pages; the ETH DOI is a repository copy, so the entry keeps its arXiv ID |
| mialon2021otke | Year 2020; Semantic Scholar title "An Optimal Transport Kernel for Feature Aggregation ..." and venue arXiv | ICLR 2021 title | Keep the ICLR title and 2021: the Semantic Scholar title is an earlier arXiv version |
| kolouri2021wasserstein | Year 2020 in three indexes; venue arXiv | ICLR 2021 | Keep 2021 and ICLR |
| meunier2022distribution | OpenAlex venue arXiv | ICML 2022, PMLR 162 | Keep ICML |
| bachoc2023gaussian | Year 2022 in three indexes; OpenAlex venue HAL | AISTATS 2023, PMLR 206 | Keep 2023 and AISTATS |
| zaheer2017deepsets | OpenAlex and Semantic Scholar venue arXiv | NeurIPS 30 | Keep NeurIPS: the proceedings page the theme run fetched |
| murphy2019janossy | Year 2018 in three indexes; venue arXiv | ICLR 2019 | Keep 2019 and ICLR: the OpenReview record |
| wagstaff2019limitations | OpenAlex venue Oxford archive | ICML 2019, PMLR 97 | Keep ICML |
| wagstaff2022universal | Year 2021 in three indexes; OpenAlex venue Oxford archive | JMLR 23(151), 2022 | Keep 2022 and JMLR |
| zhang2020fspool | Year 2019 in three indexes; venue arXiv | ICLR 2020 | Keep 2020 and ICLR |
| wang2024polynomial | Year 2023 in three indexes; venue arXiv | ICLR 2024 | Keep 2024 and ICLR |
| vinyals2016order | Year 2015 in three indexes; venue arXiv | ICLR 2016 | Keep 2016: the Google Research page names ICLR 2016; the arXiv comment's "ICLR 2015" is recorded in the entry's note |
| lee2019settransformer | Year 2018; OpenAlex venue Oxford archive; Semantic Scholar DOI_MISMATCH at 0.31 with title "Set Transformer" | ICML 2019 full title | Keep the PMLR title and 2019: the short title is a truncation of the same arXiv record |
| kim2021transformers | Title with "and" in three indexes; venue arXiv | NeurIPS 34 title with "&" | Keep the proceedings title |
| qi2017pointnet | OpenAlex long CVPR venue; Semantic Scholar year 2016 | CVPR 2017 | Keep 2017: 2016 is the arXiv year |
| qi2017pointnetpp | OpenAlex venue arXiv | NeurIPS 30 | Keep NeurIPS |
| wang2019dgcnn | Semantic Scholar year 2018 | 2019, ACM TOG 38(5) | Keep 2019 |
| thomas2019kpconv | Semantic Scholar venue "IEEE International Conference on Computer Vision" | ICCV 2019 proceedings title | Keep the Crossref proceedings title |
| prokudin2019bps | Same as thomas2019kpconv | ICCV 2019 | Keep |
| zhao2021pointtransformer | Semantic Scholar year 2020, short venue | ICCV 2021 | Keep 2021: 2020 is the arXiv year |
| ilse2018attention | OpenAlex venue arXiv | ICML 2018, PMLR 80 | Keep ICML |
| wang2018revisiting | OpenAlex 2017, Semantic Scholar 2016 | 2018, Pattern Recognition 74 | Keep 2018: online and arXiv years differ |
| lu2021clam | Semantic Scholar year 2020 | 2021, Nat. Biomed. Eng. 5(6) | Keep 2021 |
| shao2021transmil | Semantic Scholar title "... Classication"; OpenAlex venue arXiv | NeurIPS 34 title | Keep: the printed title is a typing error of the index |
| xu2023rotp | Semantic Scholar year 2022 | 2023, TPAMI 45(12) | Keep 2023 |
| amir2025fsw | Year 2024 in three indexes; Semantic Scholar arXiv ID 2504.02544 | ICLR 2025, arXiv 2405.16519 | Keep 2025 and arXiv 2405.16519: theme 3 recorded 2504.02544 as a duplicate arXiv entry of the same paper |
| gutierrezbecker2021discriminative | OpenAlex year 2020 | 2021, Medical Image Analysis 67 | Keep 2021: volume 67 is the January 2021 issue |
| chen2022tracts | Crossref and OpenAlex venue LNCS | MICCAI 2022 volume title, series LNCS | Keep |
| beetz2023mi | Crossref venue with "&amp;"; OpenAlex short name | EMBC 2023 proceedings | Keep: the same venue |
| thiery2023dlbcl | OpenAlex venue LNCS vol 14394, pages 103-112, DOI 10.1007/978-3-031-47425-5_10; Semantic Scholar venue "MTSAIL/LEAF/AI4Treat/MMMI/REMIA@MICCAI" | `@misc`, AI4Treat workshop, arXiv only | Change to the version of record. This run resolved the DOI at doi.org (HTTP 302 to link.springer.com) and read its Crossref record: title "Graph-Based Multimodal Multi-lesion DLBCL Treatment Response Prediction from PET Images", "Medical Image Computing and Computer Assisted Intervention - MICCAI 2023 Workshops", LNCS, pages 103-112, 2023, same nine authors. The arXiv ID is kept |
| zhang2025lamp | LNCS series name; short MICCAI name | MICCAI 2025 volume title | Keep |
| avants2008syn | OpenAlex year 2007 | 2008, MedIA 12(1) | Keep 2008: 2007 is online-first. The author field held upper-case initials from Crossref and now holds the full names OpenAlex printed on the same DOI |
| balakrishnan2019voxelmorph | Semantic Scholar year 2018 | 2019, IEEE TMI 38(8) | Keep 2019 |
| rakic2026atlasmorph | OpenAlex year 2025 | 2026, MedIA 110 | Keep 2026: Crossref prints 2026 for volume 110 |
| feydy2017optimal | LNCS series name; short MICCAI name | MICCAI 2017 volume title | Keep |
| gillies2016radiomics | OpenAlex and Semantic Scholar year 2015 | 2016, Radiology 278(2) | Keep 2016: the February 2016 issue; the DOI suffix carries the online year |
| zwanenburg2020ibsi | Semantic Scholar year 2016 with arXiv 1612.07003 | 2020, Radiology 295(2) | Keep 2020: 2016 is the arXiv preprint year |
| ronneberger2015unet | LNCS series name | MICCAI 2015 volume title | Keep |
| kamnitsas2017efficient | OpenAlex and Semantic Scholar year 2016 | 2017, MedIA 36 | Keep 2017 |
| menze2015brats | OpenAlex year 2014 | 2015, IEEE TMI 34(10) | Keep 2015 |
| isensee2021nnunet | Crossref and OpenAlex year 2020 | 2021, Nature Methods 18(2) | Keep 2021: volume 18, issue 2 is the February 2021 issue; 2020 is online-first |
| gramfort2015fast | LNCS series name; OpenAlex "vol 24" (the IPMI edition number) | IPMI 2015 volume title | Keep |
| su2015shape | Same as gramfort2015fast | IPMI 2015 | Keep |
| bazeille2019local | LNCS series name | IPMI 2019, volume 11492 | Keep |
| dadashkarimi2023carot | OpenAlex title "... Creating connectomes for any atlas ...", year 2022 | Crossref title "... for different atlases ...", 2023, MedIA 88 | Keep the Crossref title and 2023: the OpenAlex title is the preprint title |
| chen2021aminn | LNCS series name; Semantic Scholar year 2020 | MICCAI 2021 | Keep 2021: 2020 is the arXiv year |
| prabhakar2023selfpruning | LNCS series name | MICCAI 2023 | Keep |
| dalca2019learning | OpenAlex venue arXiv, pages 804-816 | NeurIPS 32, no pages | Keep NeurIPS without pages: the pages come from an arXiv-venue record and were not read on the proceedings page |
| shen2021accurate | OpenAlex venue "PubMed", pages 5373-5389 | NeurIPS 34, no pages | Keep NeurIPS without pages, for the same reason |
| qahqaie2026unbalanced | OpenAlex and Semantic Scholar venue ISBI 2026, pages 1-4, DOI 10.1109/ISBI61048.2026.11516053 | `@misc`, arXiv only | Change to the version of record. This run resolved the DOI at doi.org (HTTP 302 to ieeexplore.ieee.org/document/11516053) and read its Crossref record: "2026 IEEE 23rd International Symposium on Biomedical Imaging (ISBI)", pages 1-4, issued 2026-04-08, same five authors. The arXiv ID is kept |
| chen2026brainpicm | OpenAlex (session's second identifier check): title with "Self-supervised", 2026, venue "Lecture notes in computer science", pages 461--471, DOI 10.1007/978-3-032-38069-2_44 | `@misc`, arXiv only, title with "Self-Supervised" | Change to the version of record. This run resolved the DOI at doi.org (HTTP 302 to link.springer.com/10.1007/978-3-032-38069-2_44), read its Crossref record (book chapter in "Medical Image Computing and Computer Assisted Intervention - MICCAI 2026", Lecture Notes in Computer Science, pages 461-471, Springer Nature Switzerland, published 2026-09-26, ISBNs 978-3-032-38068-5 and 978-3-032-38069-2, same six authors) and read the Springer chapter page, which names "Lecture Notes in Computer Science ((LNCS,volume 16880))" and "Published: 26 September 2026". The page's copyright line reads 2027; the entry keeps 2026, the publication date that the page, Crossref and OpenAlex give. The title takes the Crossref capitalization. The arXiv ID is kept |
| patalano2026par2cox, acar2011allatonce, mazelet2026learning, chen2020optimal, mahan2024point, wang2025linearized, chen2022injective | Venue arXiv | `@misc` preprint | Keep as preprints: no index printed a version of record |
| peyre2016gromov, rolet2016fast, huang2016supervised, naderializadeh2021pswe | No identifier; checked on the proceedings page | url-only entries | Keep: each proceedings page names the entry's title (checks.md) |

#### Identifiers added by this merge run

These are new in `refs.bib` and have not yet been through the session's identifier check:

- DOI 10.1007/978-3-031-47425-5_10 (`thiery2023dlbcl`) and DOI 10.1109/ISBI61048.2026.11516053 (`qahqaie2026unbalanced`), each resolved at doi.org in this run.
- arXiv 2010.00820 added to `gutierrezbecker2021discriminative`, as theme 4 recorded it confirmed.
- The five added sources: `gachon2025low` (DOI 10.1002/cyto.a.24918, arXiv 2407.17329), `bae2024hognet` (DOI 10.1007/978-3-031-72086-4_30), `alberb2026automated` (arXiv 2603.10216), `tian2026roam` (arXiv 2604.07298), `chen2026brainpicm` (DOI 10.1007/978-3-032-38069-2_44, version of record resolved in this run, and arXiv 2606.29695).

### Coverage Distribution Advisory

The pass ran over the 129 included works. Values come from `refs.bib` and the annotations.

- **Time distribution** (decade of the version of record): 2020s 64, 2010s 55, 1990s 4, 2000s 3, 1970s 2, 1980s 1. The largest value is 64/129 (49.6 percent), so no advisory is written.
- **Geographic distribution**: left out. The annotations record a study site for fewer than a third of the works, so known_N is too small to assess.
- **Venue tier distribution**: journals 60, PMLR proceedings (ICML, AISTATS, ML4H) 14, NeurIPS 13, Springer LNCS (MICCAI, IPMI, LVA) 13, arXiv preprints 9, IEEE conferences (CVPR, ICCV, EMBC, ISBI) 8, ICLR 8, ACM conferences (KDD, CIKM) 3, AAAI 1. The largest value is 60/129 (46.5 percent), and the top three families hold 87/129 (67.4 percent), so no advisory is written.
- **Methodological distribution**: the matrix's Method column counts below.

```markdown
DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational method = 105/129 (81.4%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: no expansion; the research question asks which methods predict an outcome, so method papers are its subject. The other categories are theory 10, review 6, empirical measurement study 4, and standard, tool or benchmark 4.
```

### Screening Results

The counts are those each run recorded. Records were not deduplicated across runs before Phase A, and the theme runs did not deduplicate across their own layers either.

| Run | Records shown and title-screened | Phase A, Include or Maybe | Phase B assessed | Included |
|---|---|---|---|---|
| Theme 1 | 808 (758 from logged queries and lookups, 50 from layer 2) plus 20 WebSearch links | 41 | 41 | 30 |
| Theme 2 | 546 (layer 1: 188 arXiv, 50 WebSearch links, 45 Crossref; layer 2: 88; layer 3: 105; layer 4: 70 links) | 45 (of 74 candidates: 35 Include, 10 Maybe) | 45 | 35 |
| Theme 3 | 586 | 46 | 46 | 30 |
| Theme 4 | 758 | 55 | 55 | 35 |
| Merge, currency search | 100 arXiv records plus 30 WebSearch links | 15 | 15 | 5 |

- Initial hits (records shown, summed, not deduplicated): 2,848.
- After title and abstract screening: 202.
- After full-text assessment: 135 inclusions across the five runs.
- After deduplication (5 works included by two themes, and one work in two versions): 129.
- Final included sources: 129.

#### Excluded in the merge run's currency search

| Record | Reason |
|---|---|
| Alberb, Cheung and Martel 2025, "Live(r) Die", arXiv 2509.08935 | Master's thesis presenting the same framework as the included `alberb2026automated` |
| Islam and Mahmud 2026, NeuroAPS-Net, arXiv 2604.22883 (IJCNN 2026) | Methodology: the full text reports single-run accuracies that are all fractions of 66, while it states an 80:20 split of 1,000 subjects. The denominator mismatch is this run's inference from the reported numbers, and the paper does not explain it. The paper describes no registration and labels regions "using anatomical masks or atlas-based segmentation" without naming the atlas |
| Verdelho, Bernardino and Barata 2025, arXiv 2503.23042 | Tangential: selects one of several pathology slides of a patient; no missing spatial correspondence |
| Martinez Leon and Niles-Weed 2026, arXiv 2605.30266; Girshfeld and Chen 2025, arXiv 2511.10824 | Distribution-valued response, the reason theme 2 excluded its records #50 and #51 |
| Kumar 2026, arXiv 2608.17370 | Explanation method on tabular data and chest X-rays; no correspondence problem |
| Duta and Lio 2025, arXiv 2506.09682 | Sliced-Wasserstein pooling for node classification, not a set-level outcome |
| Faes, Pirmani, Moreau and Peeters 2024, arXiv 2412.06815 | Federated block-term tensor regression on aligned inputs; redundant for SQ1 with the included tensor regressions, as theme 1 excluded Li and Zhang 2017 and Pan, Mai and Zhang 2019 |
| Krsicka and Kubik 2025, arXiv 2511.01613 | Classifies the anatomical class of a mesh, not a subject-level outcome |
| Sheng et al. 2025, EDT-PA, arXiv 2509.16238 | Transport aligns the structural and functional networks of one subject on atlas regions; the within-patient case is held by `gong2026robust` |

#### Leads not assessed

These were named by a theme run and not read in any run, so they are not in the merged set:

- Theme 1: Zhang, Fanaee-T and Thoresen 2021 (doi:10.1007/s10618-020-00724-6, unreadable); Morup, Acar and Adali 2025 (doi:10.1109/MSP.2025.3605746, unreadable); Williams et al. 2020 (bioRxiv doi:10.1101/2020.03.02.974014, title only). Unconfirmed: Harshman 1970; the Huang et al. 2020 and Chen et al. 2025 Cox models cited in PAR2COX.
- Theme 2: Rakotomamonjy et al. 2018 and Bonneel, Peyre and Cuturi 2016 (unconfirmed); Kwon et al. 2025 (doi:10.1016/j.media.2025.103538, a prototype graph network with surface registration to a template and no transport); OTSurv (arXiv 2506.20741); the transport pyramid graph kernel for autism (doi:10.1016/j.patcog.2023.109716); GRDL (doi:10.52202/079017-4374).
- Theme 3: Yao et al. 2020 DeepAttnMISL; Polsterl et al. 2020; TractGraphFormer 2025 (abstract not retrievable).
- Theme 4: Joshi et al. 2004 (excluded to hold the target); "Vulnerabilities of radiomic signature development" (doi:10.1016/j.radonc.2018.10.027); Chen and Martel 2023 (HECKTOR, unreadable); Ivantsits et al. 2021 (unreadable).

### Annotated Bibliography

Each entry gives the themes it belongs to (main theme first), the keys folded into it, and what was read. "Quality" is the five-item quick assessment (venue, rigor, relevance, citations, data, 1 to 3 each) as the run that read the source scored it. Citation counts are the OpenAlex counts the theme runs observed on 2026-11-19. High is 12 or more, acceptable 8 to 11, marginal 7 or less. "Stance" is toward the premise that a subject-level outcome can be predicted without a registered common space, or neutral.

#### Theme 1: supervised multilinear and tensor methods

### Wold, Geladi, Esbensen and Ohman (1987). Multi-way principal components- and PLS-analysis.
- **Key**: `wold1987multiway`. Themes: 1.
- **Type**: Journal article, Journal of Chemometrics 1(1), 41-56. doi:10.1002/cem.1180010107.
- **Method**: Lohmoller-Wold decomposition of a multi-way array combined with NIPALS, giving multi-way PCA and PLS.
- **Key Findings**: The abstract states that the methods are equivalent to unfolding the array into a matrix followed by ordinary PCA or PLS.
- **SQ1**: Not addressed. Unfolding requires every mode to be indexed identically across samples. **SQ2**: Supervised, the outcome entering each component's extraction. **SQ3**: Not addressed. **SQ4**: Aligned arrays, a chemical example; no medical imaging.
- **Relevance**: The origin of multiway PLS and the unfold-PLS reference point.
- **Quality**: 12/15, high. 835 citations. Seminal.
- **Stance**: Neutral.
- **Potential Use**: Related work, history of supervised multiway regression.

### Bro (1996). Multiway calibration. Multilinear PLS.
- **Key**: `bro1996multiway`. Themes: 1. Named foundational work.
- **Type**: Journal article, Journal of Chemometrics 10(1), 47-61. Full text read.
- **Method**: N-PLS: per component, one weight vector per mode so that the trilinear score has maximal covariance with y.
- **Key Findings**: On simulated noisy fluorescence data with 125 calibration samples, unfold-PLS predictions were almost twice as bad as tri-PLS; on sugar ash data predictions were comparable.
- **SQ1**: Not addressed. Each mode must carry the same meaning for every sample. **SQ2**: Supervised, outcome inside the extraction. **SQ3**: Not addressed. **SQ4**: Aligned excitation-emission arrays; no medical imaging.
- **Relevance**: The baseline a supervised multilinear method for unaligned data departs from: per-mode weights shared by all samples.
- **Quality**: 13/15, high. 795 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work; method contrast.

### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Key**: `zhao2013hopls`. Themes: 1. Named foundational work.
- **Type**: Journal article, IEEE TPAMI 35(7), 1660-1673. doi:10.1109/TPAMI.2012.254. Abstract read.
- **Method**: Projects tensors X and Y onto a latent space with sums of orthogonal Tucker tensors, loadings from a higher-order SVD of a cross-covariance tensor.
- **Key Findings**: Better prediction than existing methods on synthetic data and on ECoG decoding of 3D movement, per the abstract.
- **SQ1**: Not addressed; Tucker loadings shared by all samples. **SQ2**: Supervised, outcome inside the extraction. **SQ3**: Not addressed. **SQ4**: Aligned ECoG tensors; neural recordings, not imaging.
- **Relevance**: The Tucker counterpart of N-PLS.
- **Quality**: 14/15, high. 176 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Park and Keles (2026). Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising.
- **Key**: `park2026sparsehopls`. Themes: 1.
- **Type**: Journal article, Biometrika 113(1), asaf082. Abstract read.
- **Method**: Tensor-response PLS with a low-rank sparse coefficient tensor.
- **Key Findings**: The abstract shows that HOPLS consistency cannot be guaranteed when dimensions grow faster than the sample size, and gives an estimator with guarantees in that regime; application to single-cell Hi-C data.
- **SQ1**: Not addressed (common genomic grid). **SQ2**: Supervised, the tensor as response of vector predictors. **SQ3**: Not addressed. **SQ4**: Aligned Hi-C tensors; no medical imaging.
- **Relevance**: Current theory of higher-order PLS.
- **Quality**: 13/15, high. 5 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Key**: `zhou2013tensor`. Themes: 1 (main), 4. Named foundational work.
- **Type**: Journal article, JASA 108(502), 540-552. arXiv text read.
- **Method**: Generalized linear models with a tensor covariate whose coefficient has low CP rank, fitted by block relaxation.
- **Key Findings**: Shown on MRI of the ADHD-200 sample (776 subjects).
- **SQ1**: Registration to a common space before the model. The text states the images "were preprocessed by standard steps including ... segmentation, and registration". **SQ2**: Supervised end to end, ADHD status as the GLM response. **SQ3**: Relies on registration and tissue segmentation. **SQ4**: Registered MRI tensors; medical imaging.
- **Relevance**: The baseline that predicts a subject-level outcome from a registered image tensor.
- **Quality**: 15/15, high. 710 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work; main baseline for a registration-free method.

### Guhaniyogi, Qamar and Dunson (2017). Bayesian Tensor Regression.
- **Key**: `guhaniyogi2017bayesian`. Themes: 1 (main), 4.
- **Type**: Journal article, JMLR 18(79), 1-31. arXiv 1509.06490. Abstract read.
- **Method**: Scalar response on vector and tensor covariates, PARAFAC-structured coefficient with a multiway shrinkage prior, MCMC.
- **Key Findings**: Posterior consistency, and gains over vectorizing; applied to 30 x 30 x 30 MRI of 550 adolescents.
- **SQ1**: Not addressed; a common grid [inferred: registered input]. **SQ2**: Supervised end to end. **SQ3**: [not stated in the parts read]. **SQ4**: Aligned MRI tensors.
- **Relevance**: The Bayesian form of low-rank tensor regression.
- **Quality**: 14/15, high. 144 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Li, Xu, Zhou and Li (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Key**: `li2018tucker`. Themes: 1 (main), 4.
- **Type**: Journal article, Statistics in Biosciences 10(3), 520-545. Abstract read.
- **Method**: GLM tensor regression with a Tucker coefficient.
- **Key Findings**: Recovery of high-rank signals and consistency results, compared with the CP model.
- **SQ1**: Not addressed; common grid. **SQ2**: Supervised end to end. **SQ3**: [inferred: registered images]. **SQ4**: Aligned neuroimaging tensors.
- **Relevance**: Mode-specific ranks for tensor regression.
- **Quality**: 13/15, high. 209 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Lock (2018). Tensor-on-Tensor Regression.
- **Key**: `lock2018tensor`. Themes: 1.
- **Type**: Journal article, JCGS 27(3), 638-647. Abstract read.
- **Method**: Contracted tensor product with a reduced CP-rank coefficient, ridge penalty and a Gibbs sampler.
- **Key Findings**: Contains scalar-on-tensor and tensor-on-scalar regression as special cases; facial image application.
- **SQ1**: Not addressed. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Aligned facial images; no medical imaging.
- **Relevance**: The general form the other tensor regressions specialize.
- **Quality**: 13/15, high. 164 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Huang, Chen and Zhang (2026). Shift-aware sparse kronecker tensor classification.
- **Key**: `huang2026shift`. Themes: 1 (main), 4.
- **Type**: Journal article, Statistics and Computing 36(3), 132. The annotation reads the authors' preprint arXiv 2505.12113, whose title differs.
- **Method**: Logistic sparse Kronecker decomposition of an image coefficient, with a cyclically shifted view of each scan added.
- **Key Findings**: Consistency under a restricted isometry condition, and classification on OASIS-1 and ADNI-1 with hippocampal coefficients.
- **SQ1**: Registration kept; residual misregistration absorbed by small cyclic shifts. The preprint states the augmentation "realigns each scan by small circular shifts before decomposition". **SQ2**: Supervised end to end (logistic). **SQ3**: Relies on registration and works on its residual error. **SQ4**: Registered MRI; medical imaging.
- **Relevance**: The one tensor regression that names misalignment across subjects as its target, as a small shift of a registered image.
- **Quality**: 11/15, acceptable. 0 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work, closest tensor neighbour of a registration-free method.

### Sprangers and Vannieuwenhoven (2023). Group-Invariant Tensor Train Networks for Supervised Learning.
- **Key**: `sprangers2023group`. Themes: 1 (main), 3.
- **Type**: Journal article, SIMODS 5(4), 829-853. Abstract read.
- **Method**: A basis of tensors invariant under a discrete group, assembled into a supervised tensor train network.
- **Key Findings**: Basis construction several orders of magnitude faster; protein binding accuracy in line with deep learning.
- **SQ1**: Invariance built into the model; the permutation group gives permutation invariance inside a tensor model. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Sequence data; no medical imaging.
- **Relevance**: The one tensor method that builds an invariance in place of aligning data.
- **Quality**: 12/15, high. 0 citations.
- **Stance**: Supports.
- **Potential Use**: Related work, link between tensor and set models.

### Harshman (1972). PARAFAC2: Extensions of a Procedure for "Explanatory" Factor-Analysis and Multidimensional Scaling.
- **Key**: `harshman1972parafac2`. Themes: 1. Named foundational work.
- **Type**: Conference abstract, JASA (Acoustical Society) 51(1A Supplement), 111. The same-year working paper (UCLA Working Papers in Phonetics 22) was read; it has no DOI.
- **Method**: PARAFAC applied to sets of cross-product matrices.
- **Key Findings**: PARAFAC2 requires only that "the average effect of a given factor change, relative to the other factors, from one covariance matrix to the next"; uniqueness then shown only empirically.
- **SQ1**: Row units of different slices need not correspond; the cross-product of the factors and the column units must be shared. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Cross-product matrices from speech data.
- **Relevance**: The precise sense in which PARAFAC2 handles a varying mode, narrower than absent correspondence.
- **Quality**: 9/15, acceptable.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Kiers, ten Berge and Bro (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Key**: `kiers1999parafac2`. Themes: 1. Named foundational work.
- **Type**: Journal article, Journal of Chemometrics 13(3-4), 275-294. Full text read.
- **Method**: Direct fit of PARAFAC2 to the data matrices.
- **Key Findings**: "If each data matrix has the same column units but different (numbers of) row units, the PARAFAC2 model can be used." The direct fit handles constraints and missing data.
- **SQ1**: Row mode free in number and identity; column mode shared; row-factor cross-product constant. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Multiple-set matrices.
- **Relevance**: The fitting algorithm the SPARTan, COPA, LogPar, MULTIPAR and PAR2COX line builds on.
- **Quality**: 14/15, high. 484 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work and method.

### Bro, Andersson and Kiers (1999). PARAFAC2, Part II. Modeling chromatographic data with retention time shifts.
- **Key**: `bro1999parafac2`. Themes: 1.
- **Type**: Journal article, Journal of Chemometrics 13(3-4), 295-309. Full text read.
- **Method**: PARAFAC2 for elution profiles that shift between samples.
- **Key Findings**: PARAFAC2 assumes only that "the cross-products of the matrix holding the elution profiles in its columns remain constant".
- **SQ1**: Shifts absorbed by per-sample profiles with shared inner products. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Chromatography.
- **Relevance**: What PARAFAC2 can and cannot absorb.
- **Quality**: 13/15, high. 356 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work, discussion.

### Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large & Sparse Data.
- **Key**: `perros2017spartan`. Themes: 1.
- **Type**: Conference paper, KDD 2017, 375-384. Abstract read.
- **Method**: PARAFAC2 fitting that exploits structure in large sparse data.
- **Key Findings**: 22 times faster fitting; phenotypes of medically complex children endorsed by experts.
- **SQ1**: PARAFAC2 for subjects "whose observations do not align naturally"; the visit mode is unaligned and the feature mode shared. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Irregular EHR tensors.
- **Relevance**: Made PARAFAC2 the standard model for unaligned record sequences.
- **Quality**: 13/15, high. 83 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Afshar et al. (2018). COPA: Constrained PARAFAC2 for Sparse & Large Datasets.
- **Key**: `afshar2018copa`. Themes: 1.
- **Type**: Conference paper, CIKM 2018, 793-802. Abstract read.
- **Method**: PARAFAC2 with smoothness, sparsity and non-negativity constraints, fitted by AO-ADMM.
- **Key Findings**: Up to 36 times faster at the same accuracy on EHR data of hundreds of thousands of patients.
- **SQ1**: Irregular visit mode. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: EHR tensors.
- **Relevance**: The constrained PARAFAC2 that MULTIPAR and LogPar compare against.
- **Quality**: 13/15, high. 58 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Cohen and Bro (2018). Nonnegative PARAFAC2: A Flexible Coupling Approach.
- **Key**: `cohen2018nonnegative`. Themes: 1.
- **Type**: Conference paper, LVA/ICA 2018, LNCS, 89-98. Abstract read.
- **Method**: Flexible coupling of the varying-mode factors, so non-negativity can be imposed on them.
- **Key Findings**: Constraints on the varying mode made possible; synthetic and chemometric data.
- **SQ1**: Relaxed coupling of varying factors. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Chemometric data.
- **Relevance**: The first loosening of the exact PARAFAC2 constraint.
- **Quality**: 11/15, acceptable. 46 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Roald et al. (2022). An AO-ADMM Approach to Constraining PARAFAC2 on All Modes.
- **Key**: `roald2022aoadmm`. Themes: 1.
- **Type**: Journal article, SIMODS 4(3), 1191-1222. Abstract read.
- **Method**: AO-ADMM fitting of PARAFAC2 with constraints on all modes.
- **Key Findings**: Accurate recovery, and better interpretability on neuroscience and chemometric data.
- **SQ1**: For data that "evolve over time or have unaligned time profiles". **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Multiway data with an evolving mode.
- **Relevance**: Current general PARAFAC2 fitting.
- **Quality**: 13/15, high. 42 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Yin et al. (2020). LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values.
- **Key**: `yin2020logpar`. Themes: 1.
- **Type**: Conference paper, KDD 2020, 1625-1635. Accepted manuscript read.
- **Method**: Bernoulli PARAFAC2 with a positive-unlabeled loss and smoothness penalties.
- **Key Findings**: Average relative improvements of 13.2 percent for heart failure prediction and 14 percent for mortality over earlier PARAFAC2 models, per the abstract.
- **SQ1**: Irregular visit mode. **SQ2**: Two-stage. The manuscript states that "during the factorization step, no supervision information is available"; a predictor is fitted afterwards on diag(S_k). **SQ3**: Not addressed. **SQ4**: Binary EHR tensors.
- **Relevance**: The two-stage pattern: reported prediction accuracy does not make the factorization supervised.
- **Quality**: 13/15, high. 39 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work, two-stage baseline.

### Tang, Kolda and Zhang (2026). Tensor Decomposition with Unaligned Observations.
- **Key**: `tang2026unaligned`. Themes: 1.
- **Type**: Journal article, SIMAX 47(1), 107-131. Full text read.
- **Method**: CP with the unaligned mode as functions in an RKHS, generalized losses, stochastic gradient and sketching.
- **Key Findings**: Shown on the ECAM infant microbiome study (42 infants, irregular sampling times).
- **SQ1**: Subjects measured at time points T_i that "may vary among different subjects", placed in one continuous domain. A mode with no common coordinate is outside the model. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Irregular longitudinal counts.
- **Relevance**: The closest tensor work to an unaligned mode; it needs a shared continuous index.
- **Quality**: 13/15, high. 9 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work, method contrast.

### Morup et al. (2008). Shift-invariant multilinear decomposition of neuroimaging data.
- **Key**: `morup2008shift`. Themes: 1 (main), 4.
- **Type**: Journal article, NeuroImage 42(4), 1439-1450. Abstract read.
- **Method**: Multilinear decomposition with arbitrary per-component shifts along one mode.
- **Key Findings**: Shifts cope with variable latencies that cause degenerate solutions in EEG and fMRI.
- **SQ1**: Per-component shift estimated in the model; space assumed aligned. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: EEG and fMRI arrays.
- **Relevance**: Alignment inside the model for a misaligned mode.
- **Quality**: 13/15, high. 121 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Lock and Li (2018). Supervised multiway factorization.
- **Key**: `lock2018supervised`. Themes: 1.
- **Type**: Journal article, Electronic Journal of Statistics 12(1), 1150-1180. Abstract read.
- **Method**: SupCP, a probabilistic CP whose subject scores are informed by covariates, fitted by EM.
- **Key Findings**: Identifiability conditions; more accurate latent structure under supervision.
- **SQ1**: Not addressed; shared loadings. **SQ2**: Covariates enter the generative model of the scores; an outcome enters as a covariate, with no prediction loss. **SQ3**: Not addressed. **SQ4**: Aligned images and fluorescence.
- **Relevance**: The precise meaning of "supervised" in this line.
- **Quality**: 12/15, high. 25 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Hu, Lee and Wang (2022). Generalized Tensor Decomposition With Features on Multiple Modes.
- **Key**: `hu2022generalized`. Themes: 1 (main), 4.
- **Type**: Journal article, JCGS 31(1), 204-218. Abstract read.
- **Method**: Decomposition confined to the space of side-information features on several modes.
- **Key Findings**: On HCP diffusion connectivity, a global pattern and feature-associated regions.
- **SQ1**: Not addressed; a common parcellation. **SQ2**: Subject features are covariates of the tensor, not an outcome predicted from it. **SQ3**: Relies on a common parcellation. **SQ4**: Aligned connectivity tensors; diffusion MRI.
- **Relevance**: Multi-mode form of covariate supervision.
- **Quality**: 13/15, high. 16 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Ren et al. (2023). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning for Computational Phenotyping.
- **Key**: `ren2023multipar`. Themes: 1.
- **Type**: Conference paper, ML4H 2023, PMLR 225, 498-511. arXiv 2208.00993. Full text read.
- **Method**: PARAFAC2 with static and dynamic outcome losses added to the objective, weighted by multi-task learning.
- **Key Findings**: Better fit and prediction of in-hospital mortality and ventilation on two EHR datasets.
- **SQ1**: PARAFAC2, U_k = Q_k H. **SQ2**: Supervised end to end: rho_1 L_1 + rho_2 L_2(S_k) + rho_3 L_3(U_k). The paper states earlier models "separate the PARAFAC2 training process and downstream prediction process". **SQ3**: Not addressed. **SQ4**: EHR tensors.
- **Relevance**: The first PARAFAC2 fitted jointly with a subject-level loss.
- **Quality**: 11/15, acceptable. 6 citations.
- **Stance**: Supports joint supervision of an irregular-mode factorization.
- **Potential Use**: Related work, closest supervised baseline with an irregular mode.

### Konyar and Gahrooei (2025). Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records.
- **Key**: `konyar2025semisupervised`. Themes: 1.
- **Type**: Journal article, IEEE JBHI 29(6), 4415-4425. Abstract read.
- **Method**: Labels for a subset of patients enter the decomposition.
- **Key Findings**: Better than benchmarks on synthetic data and MIMIC-IV.
- **SQ1**: PARAFAC2 on irregular visits. **SQ2**: Semi-supervised, labels inside the decomposition, binary outcome. **SQ3**: Not addressed. **SQ4**: EHR tensors.
- **Relevance**: Between MULTIPAR and PAR2COX.
- **Quality**: 12/15, high. 2 citations.
- **Stance**: Supports joint supervision.
- **Potential Use**: Related work.

### Patalano, Konyar and Paynabar (2026). PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data.
- **Key**: `patalano2026par2cox`. Themes: 1.
- **Type**: Preprint, arXiv 2609.23705. Full text read.
- **Method**: PARAFAC2 fitted jointly with a Cox model on diag(S_k), by AO-ADMM.
- **Key Findings**: The objective sums reconstruction, ridge penalties and lambda times the negative Cox partial likelihood; better C-index on simulations and MIMIC-IV.
- **SQ1**: PARAFAC2. **SQ2**: Supervised end to end, survival. The paper calls earlier phenotyping "two-step approaches". **SQ3**: Not addressed. **SQ4**: EHR tensors.
- **Relevance**: The one survival-supervised irregular-mode factorization.
- **Quality**: 10/15, acceptable. `cs_ml` preprint path.
- **Stance**: Supports joint supervision.
- **Potential Use**: Related work.

### Alam, Kaddurah-Daouk and Luo (2026). Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition.
- **Key**: `alam2026joint`. Themes: 1.
- **Type**: Journal article, Biostatistics 27(1), kxag007. Abstract read.
- **Method**: Functional tensor with covariate-supervised low rank, joint with proportional hazards, MCEM.
- **Key Findings**: Better than a two-stage approach under high censoring; on ADNI lipidomics four components explain over 99 percent of the variation.
- **SQ1**: Functional time mode; whether visit times differ is [not stated in the parts read]. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Longitudinal omics.
- **Relevance**: Joint tensor and survival model with a two-stage comparison.
- **Quality**: 12/15, high. 1 citation.
- **Stance**: Supports joint over two-stage modelling.
- **Potential Use**: Related work.

### Acar, Kolda and Dunlavy (2011). All-at-once Optimization for Coupled Matrix and Tensor Factorizations.
- **Key**: `acar2011allatonce`. Themes: 1.
- **Type**: Preprint, arXiv 1105.3422. Abstract read.
- **Method**: CMTF-OPT, gradient fit of coupled tensors and matrices.
- **Key Findings**: More accurate than alternating least squares in experiments.
- **SQ1**: Not addressed; the coupled mode is aligned. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Heterogeneous data.
- **Relevance**: The base form of coupled factorization.
- **Quality**: 10/15, acceptable. 340 citations. Seminal preprint.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Schenker et al. (2025). PARAFAC2-Based Coupled Matrix and Tensor Factorizations With Constraints.
- **Key**: `schenker2025parafac2cmtf`. Themes: 1.
- **Type**: Journal article, IEEE JSTSP 19(7), 1461-1476. Abstract read.
- **Method**: AO-ADMM for PARAFAC2-based coupled models with constraints.
- **Key Findings**: Gains on simulated and one real dataset; PARAFAC2 "can handle irregular/ragged tensors".
- **SQ1**: PARAFAC2 on an unaligned time mode. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Coupled ragged data.
- **Relevance**: Current coupled factorization with an irregular mode.
- **Quality**: 12/15, high. 4 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Key**: `kolda2009tensor`. Themes: 1. Named foundational work.
- **Type**: Survey, SIAM Review 51(3), 455-500.
- **Method**: Survey of CP, Tucker and their variants, PARAFAC2 among them.
- **Key Findings**: CP and Tucker as higher-order SVD extensions.
- **SQ1 to SQ4**: Background; general tensors.
- **Relevance**: Notation and decompositions.
- **Quality**: 13/15, high. 12341 citations.
- **Stance**: Neutral.
- **Potential Use**: Background.

### Carroll and Chang (1970). Analysis of Individual Differences in Multidimensional Scaling Via an N-way Generalization of "Eckart-Young" Decomposition.
- **Key**: `carroll1970analysis`. Themes: 1.
- **Type**: Journal article, Psychometrika 35(3), 283-319.
- **Method**: INDSCAL and CANDECOMP: subjects weight the dimensions of a common space.
- **Key Findings**: Stimulus coordinates and subject weights recovered on perception data.
- **SQ1**: A common template; stimuli must correspond across subjects. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Scalar-product tables.
- **Relevance**: Origin of CP and of subject weights on a shared space.
- **Quality**: 12/15, high. 5447 citations.
- **Stance**: Neutral.
- **Potential Use**: Background.

#### Theme 2: optimal transport distances, barycenters and dictionaries

### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport.
- **Key**: `cuturi2013sinkhorn`. Themes: 2. Named foundational work.
- **Type**: Conference paper, NeurIPS 26, 2292-2300. arXiv 1306.0895. Abstract read.
- **Method**: Entropic regularization of transport, solved by Sinkhorn-Knopp scaling.
- **Key Findings**: Several orders of magnitude faster than exact solvers; improved on exact transport distances on MNIST.
- **SQ1**: A coupling between histograms on a shared ground space. **SQ2**: Not addressed. **SQ3**: Not addressed. **SQ4**: Histograms.
- **Relevance**: The solver under every entropic layer and barycenter here.
- **Quality**: 12/15, high. 282 citations (arXiv record).
- **Stance**: Supports.
- **Potential Use**: Related work.

### Peyre and Cuturi (2019). Computational Optimal Transport with Applications to Data Sciences.
- **Key**: `peyre2019computational`. Themes: 2. Named foundational work.
- **Type**: Monograph-length review, FnTML 11(5-6), 355-607.
- **Method**: Review of numerical transport.
- **Key Findings**: Entropic solvers, Gromov-Wasserstein, barycenters and unbalanced transport, and their use in learning.
- **SQ1**: Reviews couplings, barycenters and GW. **SQ2**: Transport losses in general terms. **SQ3**: Not addressed. **SQ4**: Histograms, point clouds, metric measure spaces.
- **Relevance**: Reference text; cited by all three theme 2 core papers.
- **Quality**: 13/15, high. 4648 citations.
- **Stance**: Neutral.
- **Potential Use**: Notation.

### Chizat, Peyre, Schmitzer and Vialard (2018). Scaling algorithms for unbalanced optimal transport problems.
- **Key**: `chizat2018scaling`. Themes: 2. Named foundational work.
- **Type**: Journal article, Mathematics of Computation 87(314), 2563-2609.
- **Method**: Entropic scaling for transport between positive measures with relaxed marginals.
- **Key Findings**: Diagonal scaling solves unbalanced transport, gradient flows and barycenters.
- **SQ1**: A coupling that creates or destroys mass [inferred by theme 2: relevant when subjects differ in lesion number or size]. **SQ2**: Not addressed. **SQ3**: Not addressed. **SQ4**: Positive measures.
- **Relevance**: The relaxation used by FUGW and unbalanced GW.
- **Quality**: 13/15, high. 574 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Feydy et al. (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Key**: `feydy2019interpolating`. Themes: 2.
- **Type**: Conference paper, AISTATS 2019, PMLR 89, 2681-2690. Abstract read.
- **Method**: Debiased Sinkhorn divergences with a GPU scheme.
- **Key Findings**: Positive, convex, metrize convergence in law; batches of a million samples.
- **SQ1**: Coupling between point clouds without correspondence. **SQ2**: Not addressed (a loss). **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: Makes entropic transport a valid loss between unaligned sets at scale.
- **Quality**: 12/15, high. 512 citations.
- **Stance**: Supports.
- **Potential Use**: Methods, choice of loss.

### Eisenberger et al. (2022). A Unified Framework for Implicit Sinkhorn Differentiation.
- **Key**: `eisenberger2022unified`. Themes: 2.
- **Type**: Conference paper, CVPR 2022, 499-508. Abstract read.
- **Method**: Implicit gradients of a Sinkhorn layer in marginals and cost.
- **Key Findings**: More stable, accurate gradients with less memory than unrolling.
- **SQ1**: Differentiable coupling layer. **SQ2**: Enables end-to-end training through Sinkhorn. **SQ3**: Not addressed. **SQ4**: Vision tasks.
- **Relevance**: The gradient route a supervised template layer needs.
- **Quality**: 11/15, acceptable. 41 citations.
- **Stance**: Supports.
- **Potential Use**: Methods.

### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Key**: `memoli2011gromov`. Themes: 2. Named foundational work.
- **Type**: Journal article, FoCM 11(4), 417-487. First pages read.
- **Method**: Objects as metric measure spaces compared by Gromov-Wasserstein.
- **Key Findings**: A metric on isomorphism classes, with polynomial-time lower bounds.
- **SQ1**: A coupling between spaces with no shared coordinates; only within-object distances are compared. **SQ2**: Not addressed. **SQ3**: Removes the need for a common frame in object matching. **SQ4**: Shapes.
- **Relevance**: The founding definition of comparison without correspondence.
- **Quality**: 13/15, high. 942 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Vayer, Courty, Tavenard, Chapel and Flamary (2019). Optimal Transport for structured data with application on graphs.
- **Key**: `vayer2019optimal`. Themes: 2. Named foundational work.
- **Type**: Conference paper, ICML 2019, PMLR 97, 6275-6284. Abstract read.
- **Method**: Fused Gromov-Wasserstein (FGW), mixing feature and structure costs.
- **Key Findings**: Outperformed graph kernels and GCNs on graph classification; supports graph barycenters.
- **SQ1**: Coupling between graphs of different sizes. **SQ2**: Two-stage, FGW kernel then classifier. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: The distance under TFGW, FUGW and the FGW barycenter predictor.
- **Quality**: 13/15, high. 230 citations.
- **Stance**: Supports.
- **Potential Use**: Related work, methods.

### Sejourne, Vialard and Peyre (2021). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
- **Key**: `sejourne2021unbalanced`. Themes: 2.
- **Type**: Conference paper, NeurIPS 34, 8766-8779. Abstract read.
- **Method**: Two unbalanced GW formulations with an entropic GPU scheme.
- **Key Findings**: GW extended to arbitrary positive measures.
- **SQ1**: Coupling that tolerates mass mismatch. **SQ2**: Not addressed for a subject outcome. **SQ3**: Not addressed. **SQ4**: Metric measure spaces.
- **Relevance**: [inferred by theme 2] the GW that lesion sets of unequal number require.
- **Quality**: 11/15, acceptable. 61 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Scetbon, Peyre and Cuturi (2022). Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs.
- **Key**: `scetbon2022linear`. Themes: 2.
- **Type**: Conference paper, ICML 2022, PMLR 162, 19347-19365. Abstract read.
- **Method**: GW restricted to low-rank couplings and costs.
- **Key Findings**: Entropic GW is cubic in n; the method reaches O(n^2), and O(n) with low-rank costs.
- **SQ1**: Low-rank coupling. **SQ2**: Not addressed. **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: The cost bound for GW on point clouds of thousands of points.
- **Quality**: 11/15, acceptable. 32 citations.
- **Stance**: Supports.
- **Potential Use**: Methods, cost.

### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
- **Key**: `thual2022aligning`. Themes: 2, 4 (both main). Folded: `thual2022aligning` of theme 4.
- **Type**: Conference paper, NeurIPS 35, 21792-21804. doi:10.52202/068431-1584, arXiv 2206.09398. Abstract, methods and experiments read (themes 2 and 4).
- **Method**: FUGW between cortical surfaces, functional features plus geodesic structure, and a FUGW barycenter.
- **Key Findings**: Between-subject correlation "grows by almost 40% from 0.258 to 0.356" on fsaverage5, and "about 35% gain" on individual meshes (theme 4, full text). The barycenter geometry is fixed to fsaverage5 (theme 2). Cost: 10,240 vertices per hemisphere, about 4 minutes and 400 MB per coupling, individual meshes reduced from about 160k vertices to about 10k clusters.
- **SQ1**: Transport coupling between subjects and to a barycenter. Experiment 1 aligns data already on fsaverage5; experiment 2 aligns individual meshes. **SQ2**: Unsupervised; no subject-level outcome. **SQ3**: Experiment 2 removes inter-subject surface registration and relies on FreeSurfer surface extraction. **SQ4**: Cortical meshes with fMRI.
- **Relevance**: The clearest coupling between subjects' own geometries, with its cost at mesh scale.
- **Quality**: 13/15 (theme 2) and 12/15 (theme 4), high. 55 citations.
- **Stance**: Supports transport as a replacement for inter-subject registration.
- **Potential Use**: Related work, methods, discussion.

### Vincent-Cuaz et al. (2022). Semi-relaxed Gromov-Wasserstein divergence and applications on graphs.
- **Key**: `vincentcuaz2022semirelaxed`. Themes: 2.
- **Type**: Conference paper, ICLR 2022. arXiv 2110.02753. Abstract read.
- **Method**: GW with one marginal constrained, and an srGW dictionary.
- **Key Findings**: Computational benefits; partitioning, clustering and completion.
- **SQ1**: A template whose mass is free. **SQ2**: Unsupervised; learned by reconstruction. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: A template that need not match each subject's size.
- **Quality**: 11/15, acceptable. 37 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Key**: `agueh2011barycenters`. Themes: 2. Named foundational work.
- **Type**: Journal article, SIAM J. Math. Anal. 43(2), 904-924.
- **Method**: Definition and analysis of the Wasserstein barycenter.
- **Key Findings**: Existence, uniqueness, characterization; the Gaussian case solved.
- **SQ1**: A barycenter as a common template without correspondence. **SQ2**: Not addressed; a mean. **SQ3**: Not addressed. **SQ4**: Measures.
- **Relevance**: The template that later work learns.
- **Quality**: 13/15, high. 1199 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Key**: `cuturi2014fast`. Themes: 2. Named foundational work.
- **Type**: Conference paper, ICML 2014, PMLR 32(2), 685-693.
- **Method**: Subgradient methods on an entropy-smoothed barycenter objective.
- **Key Findings**: Strictly convex objective with cheap gradients.
- **SQ1**: Barycenter template. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Empirical measures.
- **Relevance**: Free-support transport templates.
- **Quality**: 12/15, high. 871 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Benamou et al. (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Key**: `benamou2015iterative`. Themes: 2.
- **Type**: Journal article, SISC 37(2), A1111-A1138.
- **Method**: Entropic transport as KL Bregman projections.
- **Key Findings**: One framework for barycenters, multi-marginal and unbalanced transport.
- **SQ1**: Fixed-support barycenters. **SQ2**: Not addressed. **SQ3**: Not addressed. **SQ4**: Histograms.
- **Relevance**: The solver that dictionary learning differentiates through.
- **Quality**: 13/15, high. 976 citations.
- **Stance**: Neutral.
- **Potential Use**: Methods.

### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Key**: `peyre2016gromov`. Themes: 2. Named foundational work.
- **Type**: Conference paper, ICML 2016, PMLR 48, 2664-2672. url only.
- **Method**: Entropic GW and GW barycenters of distance matrices.
- **Key Findings**: Inputs need neither the same size nor row correspondence; molecular energy prediction shown.
- **SQ1**: GW barycenter over unaligned structures. **SQ2**: A prediction task is named; how the outcome enters is [not stated in the parts read]. **SQ3**: Not addressed. **SQ4**: Shapes, molecules.
- **Relevance**: The barycenter GDL, GWF and TFGW build on.
- **Quality**: 13/15, high. 593 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Brogat-Motte et al. (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Key**: `brogatmotte2022learning`. Themes: 2.
- **Type**: Conference paper, ICML 2022, PMLR 162, 2321-2335. Model and experiments read.
- **Method**: Prediction as an FGW barycenter of learned templates with input-dependent weights.
- **Key Findings**: Templates learned jointly with the weight network against an FGW loss, plans held fixed in the gradient.
- **SQ1**: Learned FGW templates. **SQ2**: Supervised end to end, with the unaligned mode on the output side. **SQ3**: Not addressed. **SQ4**: Graphs as outputs.
- **Relevance**: FGW templates can be learned for a target, in the reverse direction.
- **Quality**: 11/15, acceptable. 30 citations.
- **Stance**: Supports learned templates.
- **Potential Use**: Related work.

### Rolet, Cuturi and Peyre (2016). Fast Dictionary Learning with a Smoothed Wasserstein Loss.
- **Key**: `rolet2016fast`. Themes: 2.
- **Type**: Conference paper, AISTATS 2016, PMLR 51, 630-638. url only.
- **Method**: Non-negative dictionary learning with an entropic Wasserstein loss.
- **Key Findings**: Topics learned across vocabularies.
- **SQ1**: Atoms compared by transport. **SQ2**: Unsupervised, reconstruction. **SQ3**: Not addressed. **SQ4**: Images, bags of words.
- **Relevance**: The first transport dictionary, learned by reconstruction.
- **Quality**: 11/15, acceptable. 163 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Schmitz et al. (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Key**: `schmitz2018wasserstein`. Themes: 2.
- **Type**: Journal article, SIAM J. Imaging Sci. 11(1), 643-678.
- **Method**: Histograms as Wasserstein barycenters of learned atoms, by differentiating the entropic iterations.
- **Key Findings**: A nonlinear dictionary in image settings.
- **SQ1**: Learned barycenter atoms. **SQ2**: Unsupervised, as the title states. **SQ3**: Not addressed. **SQ4**: Histograms, images.
- **Relevance**: The template mechanism a supervised method would re-target.
- **Quality**: 13/15, high. 200 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Xu (2020). Gromov-Wasserstein Factorization Models for Graph Clustering.
- **Key**: `xu2020gromov`. Themes: 2. Named foundational work.
- **Type**: Conference paper, AAAI 34(04), 6478-6485.
- **Method**: Each graph as a GW barycenter of learnable atoms, trained by unrolled modules.
- **Key Findings**: Graphs and atoms may be unaligned and of different sizes; clustering results.
- **SQ1**: Learned GW atoms, weights as embedding. **SQ2**: Unsupervised. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: The first GW dictionary over unaligned graphs.
- **Quality**: 11/15, acceptable. 66 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Vincent-Cuaz et al. (2021). Online Graph Dictionary Learning.
- **Key**: `vincentcuaz2021online`. Themes: 2. Named foundational work.
- **Type**: Conference paper, ICML 2021, PMLR 139, 10564-10574. Method, experiments and complexity read.
- **Method**: Graphs as convex combinations of atoms under a GW loss, online.
- **Key Findings**: Dictionary learned without labels; classification is two-stage. O(m^2 n + n^2 m) per GW solve, about 44 ms per graph on IMDB-M.
- **SQ1**: Learned GW atoms. **SQ2**: Unsupervised, then two-stage classification. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: The reconstruction-trained baseline TFGW supervises.
- **Quality**: 11/15, acceptable. 28 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Key**: `vincentcuaz2022template`. Themes: 2. Named foundational work (TFGW).
- **Type**: Conference paper, NeurIPS 35, 11800-11814. doi:10.52202/068431-0857. Method, cost and experiments read.
- **Method**: FGW distances from a graph to K learnable templates, then a classifier.
- **Key Findings**: Templates and the FGW trade-off learned end to end by cross-entropy; competitive with kernel and GNN methods. At most cubic per layer; about 12.1 ms per graph on PTC.
- **SQ1**: Learned templates matched by FGW couplings. **SQ2**: Supervised end to end. Only the K distance values enter the classifier. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: The direct precedent for supervised learnable transport templates.
- **Quality**: 11/15, acceptable; theme 2 notes the citation item understates it.
- **Stance**: Supports.
- **Potential Use**: Related work, central precedent; methods.

### Zhang et al. (2024). Wasserstein Discriminant Dictionary Learning for Graph Representation.
- **Key**: `zhang2024wasserstein`. Themes: 2.
- **Type**: Journal article, IEEE TPAMI 46(12), 8619-8635. Abstract read.
- **Method**: Optimizable graph keys, Wasserstein projection, a discriminant loss on the keys.
- **Key Findings**: Keys of one class compact and of different classes dispersed.
- **SQ1**: Learned keys matched by Wasserstein and Kron-GW metrics. **SQ2**: Supervised by a label-based loss on the keys; joint training of the classifier [not stated in the parts read]. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: A dictionary shaped by labels.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Key**: `mazelet2026learning`. Themes: 2, 4 (both main). Folded: `mazelet2026learning` of theme 4.
- **Type**: Preprint, arXiv 2605.20883. Method and experiments read (theme 2); abstract (theme 4).
- **Method**: FGW dictionary learning on individual-geometry fMRI graphs with amortized plan prediction.
- **Key Findings**: Dictionary learned by reconstruction; contrast and subject classification by an SVM trained afterwards. Atoms on fsaverage, subject graphs in native geometry. The abstract states that "projecting each individual brain geometry onto a common template ... removes subject-specific information".
- **SQ1**: FGW couplings from native geometry to atoms on a template geometry. **SQ2**: Unsupervised dictionary, then a two-stage classifier. **SQ3**: Removes projection onto a common template; keeps a template geometry for the atoms. **SQ4**: HCP task fMRI, about 950-node graphs, about 12,000 graphs.
- **Relevance**: The most recent transport dictionary over unaligned spatial modes.
- **Quality**: 10/15 (theme 2) and 9/15 (theme 4), acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work; discussion.

### Huang et al. (2016). Supervised Word Mover's Distance.
- **Key**: `huang2016supervised`. Themes: 2.
- **Type**: Conference paper, NeurIPS 29. url only.
- **Method**: Ground metric and word weights learned to minimize a leave-one-out kNN error.
- **Key Findings**: Outperformed almost all of 26 baselines on eight text tasks.
- **SQ1**: Coupling between sets of embeddings. **SQ2**: Supervised metric learning, kNN predictor. **SQ3**: Not addressed. **SQ4**: Documents.
- **Relevance**: An early transport metric learned for a set-level label.
- **Quality**: 12/15, high. 214 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Kolouri, Zou and Rohde (2016). Sliced Wasserstein Kernels for Probability Distributions.
- **Key**: `kolouri2016sliced`. Themes: 2.
- **Type**: Conference paper, CVPR 2016, 5258-5267.
- **Method**: Positive definite kernels from the sliced Wasserstein distance.
- **Key Findings**: Transport geometry in kernel methods.
- **SQ1**: No correspondence; one-dimensional projections. **SQ2**: Two-stage. **SQ3**: Not addressed. **SQ4**: Distributions.
- **Relevance**: The kernel route from unaligned distributions to a predictor.
- **Quality**: 12/15, high. 226 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Wang, Slepcev, Basu, Ozolek and Rohde (2013). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Key**: `wang2013linear`. Themes: 2 (main), 4. Named foundational work (LOT).
- **Type**: Journal article, IJCV 101(2), 254-269.
- **Method**: LOT: transport of each sample to a reference gives an isometric linear embedding.
- **Key Findings**: Efficient pairwise distances; nuclear chromatin of cancer cells among applications.
- **SQ1**: Transport to one fixed reference. **SQ2**: Two-stage. **SQ3**: Pixel intensities as mass, no registration of images to each other. **SQ4**: Microscopy images.
- **Relevance**: The original LOT; the reference acts as a fixed template.
- **Quality**: 15/15, high. 273 citations.
- **Stance**: Supports.
- **Potential Use**: Related work, methods.

### Moosmuller and Cloninger (2023). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Key**: `moosmuller2023linear`. Themes: 2. LOT work the theme run resolved.
- **Type**: Journal article, Information and Inference 12(1), 363-389.
- **Method**: Analysis of the LOT embedding into L2.
- **Key Findings**: Families generated by shifts, scalings and perturbations become linearly separable; near-isometry to W2 under conditions.
- **SQ1**: Fixed reference. **SQ2**: Two-stage. **SQ3**: Invariance covers rigid differences registration would remove. **SQ4**: Distributions.
- **Relevance**: Conditions under which a fixed reference makes classes separable without registration.
- **Quality**: 13/15, high. 78 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Togninalli et al. (2019). Wasserstein Weisfeiler-Lehman Graph Kernels.
- **Key**: `togninalli2019wasserstein`. Themes: 2.
- **Type**: Conference paper, NeurIPS 32. arXiv 1906.01277.
- **Method**: Wasserstein distance between WL node-embedding distributions in a kernel.
- **Key Findings**: Better graph classification than mean comparison.
- **SQ1**: Coupling between node sets. **SQ2**: Two-stage. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: Pairwise transport kernel baseline.
- **Quality**: 12/15, high. 291 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Mialon, Chen, d'Aspremont and Mairal (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Key**: `mialon2021otke`. Themes: 2, 3 (both main). Folded: `mialon2021trainable`. Named foundational work (OTKE).
- **Type**: Conference paper, ICLR 2021. arXiv 2006.12065. Method and complexity read (theme 2); abstract (theme 3).
- **Method**: Aggregation by the entropic transport plan between a set and a trainable reference of p elements.
- **Key Findings**: Reference set by k-means without labels, or learned end to end through Sinkhorn on a classification or regression loss. O(np) against O(n^2) for self-attention; about 10 Sinkhorn iterations. State of the art on protein fold recognition and chromatin profiles.
- **SQ1**: A learned reference and a plan assigning elements to reference positions. **SQ2**: Unsupervised reference or supervised end to end. **SQ3**: Not addressed. **SQ4**: Sequence features; no medical imaging.
- **Relevance**: The one method that passes the coupling itself to the predictor, with a template learned for the outcome.
- **Quality**: 12/15 (theme 2) and 13/15 (theme 3), high. 56 citations.
- **Stance**: Supports.
- **Potential Use**: Related work, central precedent; methods.

### Kolouri, Naderializadeh, Rohde and Hoffmann (2021). Wasserstein Embedding for Graph Learning.
- **Key**: `kolouri2021wasserstein`. Themes: 2. Named foundational work (LOT embedding named in the theme brief).
- **Type**: Conference paper, ICLR 2021. Method and appendix read.
- **Method**: WEGL: Monge maps from a fixed reference to each graph's node embeddings, as a LOT vector.
- **Key Findings**: Reference fixed before training; vectors feed off-the-shelf classifiers; linear in the number of graphs.
- **SQ1**: Fixed reference. **SQ2**: Two-stage. **SQ3**: Not addressed. **SQ4**: Graphs.
- **Relevance**: A fixed template that gives an aligned representation.
- **Quality**: 12/15, high. 71 citations.
- **Stance**: Supports.
- **Potential Use**: Related work, methods.

### Chen, Becigneul, Ganea, Barzilay and Jaakkola (2020). Optimal Transport Graph Neural Networks.
- **Key**: `chen2020optimal`. Themes: 2 (main), 3.
- **Type**: Preprint, arXiv 2006.04804 v6. Method and experiments read.
- **Method**: Graph embedding as Wasserstein distances to learnable prototype point clouds, with a noise-contrastive regularizer against collapse.
- **Key Findings**: Prototypes learned end to end; universal approximation that sum aggregation lacks; molecular property gains. Sets under 30 elements; training 1 to 7.1 times slower than D-MPNN.
- **SQ1**: Learned prototypes, exact transport. **SQ2**: Supervised end to end; only distances enter, plan fixed in backpropagation. **SQ3**: Not addressed. **SQ4**: Molecules.
- **Relevance**: Learnable point-cloud templates for a scalar outcome, and their collapse.
- **Quality**: 11/15, acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Meunier, Pontil and Ciliberto (2022). Distribution Regression with Sliced Wasserstein Kernels.
- **Key**: `meunier2022distribution`. Themes: 2.
- **Type**: Conference paper, ICML 2022, PMLR 162, 15501-15523.
- **Method**: Kernel ridge regression on a sliced-Wasserstein representation.
- **Key Findings**: Universal consistency and excess-risk bounds.
- **SQ1**: No correspondence needed. **SQ2**: Supervised, fixed representation. **SQ3**: Not addressed. **SQ4**: Samples of distributions.
- **Relevance**: Statistical guarantee for regression from unaligned samples.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Mahan, Moosmuller and Cloninger (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Key**: `mahan2024point`. Themes: 2 (main), 3.
- **Type**: Preprint, arXiv 2401.01460. Method and experiments read.
- **Method**: ICNN transport maps from a fixed reference, and a discriminator weighting transported samples in a permutation-invariant classifier.
- **Key Findings**: Training alternates map epochs and classifier epochs, so the label does not train the maps. On 359 patients' flow cytometry it outperformed a deep set classifier for AML.
- **SQ1**: Fixed reference. **SQ2**: Supervised in alternation; maps not learned for the outcome. **SQ3**: Not addressed. **SQ4**: Patient-level cell point clouds; clinical, not imaging.
- **Relevance**: A subject-level outcome from unaligned point clouds through transport.
- **Quality**: 9/15, acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Wang, Ke, Bhaskar, Krishnaswamy and Cloninger (2025). Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data.
- **Key**: `wang2025linearized`. Themes: 2.
- **Type**: Preprint, arXiv 2510.22033. Method and experiments read.
- **Method**: LOT embedding of each patient's cells to a fixed reference, linear SVM.
- **Key Findings**: COVID-19 status of 148 patients from 16-marker cell clouds, with weights mapped back to markers.
- **SQ1**: Fixed reference, described by the authors as a registration between patients. **SQ2**: Two-stage. **SQ3**: Not addressed for imaging. **SQ4**: Cell point clouds.
- **Relevance**: Interpretable transport embedding for patient prediction.
- **Quality**: 9/15, acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work; discussion.

### Bachoc, Bethune, Gonzalez-Sanz and Loubes (2023). Gaussian Processes on Distributions based on Regularized Optimal Transport.
- **Key**: `bachoc2023gaussian`. Themes: 2.
- **Type**: Conference paper, AISTATS 2023, PMLR 206, 4986-5010.
- **Method**: A kernel from Sinkhorn potentials to a fixed reference, in a Gaussian process.
- **Key Findings**: Valid, universal kernel with guarantees.
- **SQ1**: Fixed reference. **SQ2**: Supervised GP on a fixed embedding. **SQ3**: Not addressed. **SQ4**: Distributions.
- **Relevance**: Entropic counterpart of LOT for regression with uncertainty.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Gachon et al. (2025). Low Dimensional Representation of Multi-Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia.
- **Key**: `gachon2025low`. Themes: 2. Added by this merge run (currency gate).
- **Type**: Journal article, Cytometry Part A 107(2), 126-139. doi:10.1002/cyto.a.24918, arXiv 2407.17329. Read: the Crossref abstract and the arXiv abstract, both in this run.
- **Method**: Each patient's measurements as a distribution. K-means on the merged point cloud, justified by transport as quantization of the mean measure, then Wasserstein PCA through LOT or log-ratio PCA.
- **Key Findings**: The abstract reports benefits over kernel mean embedding on a public dataset and a Bordeaux University Hospital dataset, and clustering of patients by MRD level.
- **SQ1**: A shared quantization of the merged data acts as a common reference, and LOT embeds each patient. **SQ2**: Unsupervised; patients are projected and clustered, and no predictor is trained in the abstract. **SQ3**: Not addressed (cytometry). **SQ4**: Patient-level cell point clouds; not imaging.
- **Relevance**: A recent transport embedding of subjects whose cells do not correspond.
- **Quality**: 10/15 (venue 3, rigor 2, relevance 2, citations 1 as not looked up, data 2), acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Chen et al. (2026). Progressive Self-supervised Learning with Individualized Community Assignment for Brain Network Analysis.
- **Key**: `chen2026brainpicm`. Themes: 2, 4. Added by this merge run (currency gate).
- **Type**: Conference paper, MICCAI 2026, LNCS 16880, 461-471. doi:10.1007/978-3-032-38069-2_44 (version of record resolved in this run), arXiv 2606.29695. Read: arXiv abstract, and methods and experiments of the arXiv HTML version, in this run.
- **Method**: BrainPICM: ROI-to-community assignment as progressive unbalanced transport against a population template, guiding masked self-supervised learning.
- **Key Findings**: ROIs from the Schaefer atlas (100 ROIs) and communities from the Yeo 7-network parcellation. The template is a fixed one-hot assignment, with prototypes from EMA features. The encoder is frozen after label-free pretraining, and a dual-branch MLP head is trained for diagnosis. ABIDE-I (1,114 subjects) ACC 72.03 +/- 0.82 and AUC 77.06 +/- 1.25. ADHD-200 (1,235) ACC 67.37 +/- 0.83. ADNI (291) ACC 82.03 +/- 2.75 and AUC 84.33 +/- 3.62.
- **SQ1**: Unbalanced transport between atlas ROIs and a fixed population template of communities. The ROIs correspond across subjects through the atlas. Registration to MNI is [not stated in the parts read]. **SQ2**: Two-stage: label-free pretraining, then a supervised head on frozen features. **SQ3**: Relies on atlas parcellation [inferred: on spatial normalization]. **SQ4**: fMRI brain networks; neuroimaging.
- **Relevance**: A recent case of transport to a population template whose label enters only the head.
- **Quality**: 10/15 (venue 2, rigor 2, relevance 2, citations 1, data 3), acceptable.
- **Stance**: Neutral toward registration-free prediction; the atlas supplies the correspondence.
- **Potential Use**: Related work; discussion of what "template" means.

#### Theme 3: permutation-invariant set encoders and point-cloud learning

### Zaheer et al. (2017). Deep Sets.
- **Key**: `zaheer2017deepsets`. Themes: 3. Named foundational work.
- **Type**: Conference paper, NeurIPS 30. arXiv 1703.06114. Theorems 2 and 7 and Lemma 3 read.
- **Method**: Permutation-invariant functions as rho(sum phi(x)).
- **Key Findings**: Exact decomposition on a countable universe; for fixed set size M a latent of dimension M+1 suffices; ModelNet40 90 percent at 5000 points.
- **SQ1**: Permutation invariance by sum pooling. **SQ2**: Supervised end to end in its tasks; no medical outcome. **SQ3**: Not addressed. **SQ4**: Sets, point clouds.
- **Relevance**: The base result behind sum-pooled encoders.
- **Quality**: 14/15, high. 1090 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Murphy, Srinivasan, Rao and Ribeiro (2019). Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs.
- **Key**: `murphy2019janossy`. Themes: 3. Named foundational work.
- **Type**: Conference paper, ICLR 2019. Sections 2 and 3 read.
- **Method**: Averaging a permutation-sensitive function over orderings, with tractable approximations.
- **Key Findings**: (k-1)-ary pooling is a proper subset of k-ary (Theorem 2.1); Deep Sets (k = 1) cannot capture higher-order interactions in the pooling.
- **SQ1**: Permutation invariance. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Sequences, graph neighbourhoods.
- **Relevance**: One scale of expressivity for set encoders of lesions or regions.
- **Quality**: 13/15, high. 195 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Wagstaff et al. (2019). On the Limitations of Representing Functions on Sets.
- **Key**: `wagstaff2019limitations`. Themes: 3. Named foundational work.
- **Type**: Conference paper, ICML 2019, PMLR 97, 6487-6494.
- **Method**: Proofs on the latent dimension of continuous sum decomposition.
- **Key Findings**: For set size M, some functions are not continuously sum-decomposable below dimension M; M suffices; max decomposition has the same bound.
- **SQ1**: Permutation invariance and its cost. **SQ2**: Synthetic regression. **SQ3**: Not addressed. **SQ4**: Scalars.
- **Relevance**: Latent width as lesion or region count grows.
- **Quality**: 13/15, high. 209 citations.
- **Stance**: Opposes a fixed small latent.
- **Potential Use**: Related work; discussion.

### Wagstaff et al. (2022). Universal Approximation of Functions on Sets.
- **Key**: `wagstaff2022universal`. Themes: 3.
- **Type**: Journal article, JMLR 23(151), 1-56.
- **Method**: Worst-case error analysis of Deep Sets.
- **Key Findings**: One dimension too few leaves functions approximated no better than a constant; Deep Sets is the most efficient Janossy pooling.
- **SQ1**: Permutation invariance. **SQ2**: Theory. **SQ3**: Not addressed. **SQ4**: Vector sets.
- **Relevance**: Error-level form of the 2019 bound.
- **Quality**: 13/15, high. 89 citations.
- **Stance**: Opposes a fixed small latent.
- **Potential Use**: Related work.

### Zhang, Hare and Prugel-Bennett (2020). FSPool: Learning Set Representations with Featurewise Sort Pooling.
- **Key**: `zhang2020fspool`. Themes: 3.
- **Type**: Conference paper, ICLR 2020.
- **Method**: Per-feature sorting with learned weights.
- **Key Findings**: Better reconstructions and accuracy when replacing pooling.
- **SQ1**: Invariance through per-feature sorting. **SQ2**: Supervised in part. **SQ3**: Not addressed. **SQ4**: Feature sets.
- **Relevance**: Learned pooling between sum and attention.
- **Quality**: 11/15, acceptable. 76 citations.
- **Stance**: Supports learned pooling.
- **Potential Use**: Related work.

### Wang et al. (2024). Polynomial Width is Sufficient for Set Representation with High-dimensional Features.
- **Key**: `wang2024polynomial`. Themes: 3.
- **Type**: Conference paper, ICLR 2024.
- **Method**: Sufficient latent dimension for D-dimensional elements.
- **Key Findings**: Width polynomial in N and D suffices.
- **SQ1**: Permutation invariance. **SQ2**: Theory. **SQ3**: Not addressed. **SQ4**: Vector sets.
- **Relevance**: Lesions or regions with feature vectors.
- **Quality**: 13/15, high.
- **Stance**: Supports sum pooling with adequate width.
- **Potential Use**: Related work.

### Vinyals, Bengio and Kudlur (2016). Order Matters: Sequence to sequence for sets.
- **Key**: `vinyals2016order`. Themes: 3.
- **Type**: Conference paper, ICLR 2016.
- **Method**: Attention-based read-process-write block for input sets.
- **Key Findings**: Input or output order changes learning even for unordered data.
- **SQ1**: Invariance through attention reading. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Numbers, tokens.
- **Relevance**: The earliest attention reader for sets.
- **Quality**: 12/15, high. 1075 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Lee et al. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Key**: `lee2019settransformer`. Themes: 3. Named foundational work.
- **Type**: Conference paper, ICML 2019, PMLR 97, 3744-3753. Section 3 read.
- **Method**: SAB, ISAB and PMA over k learned seeds.
- **Key Findings**: Permutation invariant by composition; universality in a supplement not read; ISAB linear in set size.
- **SQ1**: Permutation invariance; PMA seeds are shared learned queries [inferred by theme 3: the attention counterpart of a learned reference]. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Point clouds, image sets.
- **Relevance**: Standard interaction-modelling encoder.
- **Quality**: 14/15, high. 836 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; baseline.

### Kim, Oh and Hong (2021). Transformers Generalize DeepSets and Can be Extended to Graphs & Hypergraphs.
- **Key**: `kim2021transformers`. Themes: 3.
- **Type**: Conference paper, NeurIPS 34.
- **Method**: Higher-order invariant Transformers with sparse variants.
- **Key Findings**: Full order-k cost O(n^(2k)); the sparse second-order variant is more expressive than message passing at the same cost.
- **SQ1**: Invariance at orders 1 and above. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Sets, graphs.
- **Relevance**: From sets to region graphs.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Qi, Su, Mo and Guibas (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Key**: `qi2017pointnet`. Themes: 3. Named foundational work.
- **Type**: Conference paper, CVPR 2017, 77-85. Theorems and T-Net read.
- **Method**: Shared per-point MLP, max pooling, T-Nets predicting 3x3 and 64x64 transforms.
- **Key Findings**: Universal approximation of Hausdorff-continuous set functions; a critical subset of at most K points.
- **SQ1**: Invariance by max pooling; pose by a learned per-sample transform, which is no registration to a template. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: 3D point clouds.
- **Relevance**: Base point-cloud encoder.
- **Quality**: 14/15, high. 11372 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; baseline.

### Qi, Yi, Su and Guibas (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Key**: `qi2017pointnetpp`. Themes: 3. Named foundational work.
- **Type**: Conference paper, NeurIPS 30.
- **Method**: PointNet applied recursively on nested partitions.
- **Key Findings**: Local features at growing scales; density-adaptive layers.
- **SQ1**: Invariance within local groups. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: Local geometry for anatomical surfaces.
- **Quality**: 14/15, high. 16645 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; baseline.

### Wang et al. (2019). Dynamic Graph CNN for Learning on Point Clouds.
- **Key**: `wang2019dgcnn`. Themes: 3. Named foundational work.
- **Type**: Journal article, ACM TOG 38(5), 1-12.
- **Method**: EdgeConv over a k-NN graph recomputed in feature space.
- **Key Findings**: Order invariant; translation invariance partial.
- **SQ1**: Invariance with pairwise structure per sample. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: Recovers pairwise structure that set pooling discards.
- **Quality**: 14/15, high. 9025 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; baseline.

### Thomas et al. (2019). KPConv: Flexible and Deformable Convolution for Point Clouds.
- **Key**: `thomas2019kpconv`. Themes: 3.
- **Type**: Conference paper, ICCV 2019, 6410-6419.
- **Method**: Convolution with weights at (deformable) kernel points.
- **Key Findings**: Outperformed compared methods on several datasets.
- **SQ1**: Invariant aggregation; local learned kernel geometry. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: Continuous-convolution family.
- **Quality**: 13/15, high. 4418 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Prokudin, Lassner and Romero (2019). Efficient Learning on Point Clouds With Basis Point Sets.
- **Key**: `prokudin2019bps`. Themes: 3.
- **Type**: Conference paper, ICCV 2019, 4331-4340. Construction and registration experiment read.
- **Method**: A fixed basis of k points; each normalized cloud encoded by nearest-point distances.
- **Key Findings**: Matches PointNet with three orders of magnitude fewer operations; not rotation invariant; predicts template-mesh vertices from a scan in one pass.
- **SQ1**: A fixed template with nearest-neighbour assignment. **SQ2**: Supervised. **SQ3**: Replaces per-scan registration optimization with a forward pass. **SQ4**: Point clouds, body scans.
- **Relevance**: The point-cloud analogue of a template with a coupling.
- **Quality**: 13/15, high. 162 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; methods.

### Zhao, Jiang, Jia, Torr and Koltun (2021). Point Transformer.
- **Key**: `zhao2021pointtransformer`. Themes: 3. Named foundational work.
- **Type**: Conference paper, ICCV 2021, 16239-16248.
- **Method**: Vector self-attention over 16 neighbours with relative position encoding.
- **Key Findings**: Relative positions raise S3DIS mIoU from 64.6 to 70.4 percent; ModelNet40 93.7 percent.
- **SQ1**: Invariance with relative positions. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Point clouds.
- **Relevance**: Attention counterpart of DGCNN.
- **Quality**: 13/15, high. 3554 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Dietterich, Lathrop and Lozano-Perez (1997). Solving the multiple instance problem with axis-parallel rectangles.
- **Key**: `dietterich1997multiple`. Themes: 3. Named foundational work.
- **Type**: Journal article, Artificial Intelligence 89(1-2), 31-71. Abstract-level summary read.
- **Method**: Axis-parallel rectangle algorithms for bags.
- **Key Findings**: About 89 percent correct on musk; methods ignoring bag structure performed poorly.
- **SQ1**: A bag is a set. **SQ2**: Supervised bag label. **SQ3**: Not addressed. **SQ4**: Conformation sets.
- **Relevance**: The bag-label problem lesion-set prediction inherits.
- **Quality**: 15/15, high. 3306 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Key**: `ilse2018attention`. Themes: 3. Named foundational work.
- **Type**: Conference paper, ICML 2018, PMLR 80, 2127-2136.
- **Method**: Attention-weighted sum of instance embeddings, with a gated variant.
- **Key Findings**: A convex combination, independent of bag size and order; exceeds earlier MIL on two histopathology datasets; instances treated as independent.
- **SQ1**: Invariance by attention pooling. **SQ2**: Supervised end to end. **SQ3**: Removes patch-level annotation. **SQ4**: Histopathology patches.
- **Relevance**: Standard pooling for medical MIL.
- **Quality**: 14/15, high. 2006 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; baseline.

### Wang et al. (2018). Revisiting multiple instance neural networks.
- **Key**: `wang2018revisiting`. Themes: 3.
- **Type**: Journal article, Pattern Recognition 74, 15-24.
- **Method**: End-to-end MIL networks with pooling layers and deep supervision.
- **Key Findings**: Bag embeddings at or above compared methods.
- **SQ1**: Invariance by MIL pooling. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: MIL benchmarks.
- **Relevance**: From classical MIL to deep bag embeddings.
- **Quality**: 12/15, high. 584 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Campanella et al. (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
- **Key**: `campanella2019clinical`. Themes: 3 (main), 4.
- **Type**: Journal article, Nature Medicine 25(8), 1301-1309. Abstract read.
- **Method**: MIL on 44,732 slides of 15,187 patients with diagnosis labels only.
- **Key Findings**: AUC above 0.98 for three cancers; 65 to 75 percent of slides excludable at 100 percent sensitivity.
- **SQ1**: Invariance over tiles. **SQ2**: Supervised slide label. **SQ3**: Removes pixel-level annotation. **SQ4**: Pathology tiles.
- **Relevance**: Weakly supervised set models at clinical scale.
- **Quality**: 14/15, high. 3431 citations.
- **Stance**: Supports.
- **Potential Use**: Introduction.

### Lu et al. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Key**: `lu2021clam`. Themes: 3 (main), 4.
- **Type**: Journal article, Nature Biomedical Engineering 5(6), 555-570.
- **Method**: CLAM: attention MIL with an instance clustering constraint.
- **Key Findings**: Subtyping and metastasis detection with slide labels only.
- **SQ1**: Attention pooling. **SQ2**: Supervised with an auxiliary instance loss. **SQ3**: Removes spatial annotation. **SQ4**: Pathology patches.
- **Relevance**: An instance-level objective that could carry to lesion sets.
- **Quality**: 14/15, high. 3026 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Shao et al. (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
- **Key**: `shao2021transmil`. Themes: 3.
- **Type**: Conference paper, NeurIPS 34, 2136-2147.
- **Method**: Self-attention with a pyramid position encoding generator on a square grid of instances.
- **Key Findings**: CAMELYON16 AUC 93.09 percent; PPEG raises it from 0.8416 to 0.9309 in the ablation; shuffling lowers AUC.
- **SQ1**: Invariance given up in part through position. **SQ2**: Supervised. **SQ3**: Removes spatial annotation. **SQ4**: Pathology.
- **Relevance**: Full invariance discards information the task uses.
- **Quality**: 13/15, high. 1529 citations.
- **Stance**: Opposes independent-instance pooling.
- **Potential Use**: Discussion.

### Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding.
- **Key**: `naderializadeh2021pswe`. Themes: 3 (main), 2. Named foundational work (PSWE).
- **Type**: Conference paper, NeurIPS 34. url only; preprint arXiv 2103.03892 under another title is noted in the entry. Sections 1 to 4 read.
- **Method**: L trainable slicers and Monge couplings per slice to a trainable reference set of N points.
- **Key Findings**: Embedding distance equals the generalized sliced-Wasserstein distance up to Monte-Carlo error; with a plain backbone PSWE, PMA and FSPool improve markedly over mean pooling.
- **SQ1**: Coupling to a learned reference. **SQ2**: Supervised end to end. **SQ3**: Not addressed. **SQ4**: Point clouds, graphs.
- **Relevance**: A learned template with per-slice couplings and a metric property.
- **Quality**: 13/15, high. 31 citations.
- **Stance**: Supports.
- **Potential Use**: Related work; methods.

### Xu and Cheng (2023). Regularized Optimal Transport Layers for Generalized Global Pooling Operations.
- **Key**: `xu2023rotp`. Themes: 3 (main), 2.
- **Type**: Journal article, IEEE TPAMI 45(12), 15426-15444.
- **Method**: Global pooling as regularized transport over samples and features.
- **Key Findings**: Most pooling methods are special cases; learnable ROTP layers tested on MIL and graphs.
- **SQ1**: Coupling inside the pooling. **SQ2**: Supervised. **SQ3**: Not addressed. **SQ4**: Bags, graphs.
- **Relevance**: Places set pooling and transport on one axis.
- **Quality**: 12/15, high. 13 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Amir and Dym (2025). Fourier Sliced-Wasserstein Embedding for Multisets and Measures.
- **Key**: `amir2025fsw`. Themes: 3 (main), 2.
- **Type**: Conference paper, ICLR 2025.
- **Method**: Sliced-Wasserstein embedding with a Fourier encoding.
- **Key Findings**: Injective on measures, bi-Lipschitz on multisets; sum and max pooling are not bi-Lipschitz.
- **SQ1**: Invariance with a metric guarantee. **SQ2**: Supervised tasks. **SQ3**: Not addressed. **SQ4**: Multisets.
- **Relevance**: Strongest guarantee on what a pooling preserves.
- **Quality**: 13/15, high.
- **Stance**: Opposes sum and max pooling.
- **Potential Use**: Discussion.

### Tian et al. (2026). Region-Graph Optimal Transport Routing for Mixture-of-Experts Whole-Slide Image Classification.
- **Key**: `tian2026roam`. Themes: 3 (main), 2, 4. Added by this merge run (currency gate).
- **Type**: Preprint, arXiv 2604.07298. Read: arXiv abstract, in this run.
- **Method**: ROAM: patch bags compressed into spatial region tokens; tokens routed to expert poolers by capacity-constrained entropic transport (Sinkhorn with per-slide capacity marginals), regularized over the region graph.
- **Key Findings**: Competitive with MIL and MoE baselines on four slide benchmarks; external NSCLC AUC 0.845 +/- 0.019 (TCGA-CPTAC), per the abstract.
- **SQ1**: A transport coupling inside MIL pooling, between region tokens and experts, within one slide. No cross-slide correspondence is sought. **SQ2**: Supervised for a slide label [inferred from the classification task; the training objective is not in the abstract]. **SQ3**: Not addressed. **SQ4**: Pathology slides.
- **Relevance**: A 2026 use of entropic transport as the aggregation of a set encoder in medical imaging.
- **Quality**: 8/15 (venue 1, rigor 2, relevance 2, citations 1, data 2), acceptable. Preprint.
- **Stance**: Supports transport-based pooling.
- **Potential Use**: Related work.

#### Theme 4: medical-imaging pipelines and registration-free fusion

### Avants, Epstein, Grossman and Gee (2008). Symmetric diffeomorphic image registration with cross-correlation.
- **Key**: `avants2008syn`. Themes: 4. Named foundational work (SyN).
- **Type**: Journal article, Medical Image Analysis 12(1), 26-41.
- **Method**: SyN diffeomorphic registration maximizing cross-correlation.
- **Key Findings**: Favourable against elastic and Demons methods, "in particular when the distance between the template brain and the target brain is large".
- **SQ1**: Registration to a template. **SQ2**: Not addressed. **SQ3**: Is the registration step. **SQ4**: Brain MRI.
- **Relevance**: The step unaligned-data methods remove or build on.
- **Quality**: 13/15, high. 6,447 citations.
- **Stance**: Neutral.
- **Potential Use**: Introduction; related work.

### Balakrishnan et al. (2019). VoxelMorph: A Learning Framework for Deformable Medical Image Registration.
- **Key**: `balakrishnan2019voxelmorph`. Themes: 4. Named foundational work.
- **Type**: Journal article, IEEE TMI 38(8), 1788-1800.
- **Method**: A network maps an image pair to a deformation field.
- **Key Findings**: Comparable accuracy "orders of magnitude faster".
- **SQ1**: Learned registration. **SQ2**: Not addressed. **SQ3**: Is the registration step. **SQ4**: Brain MRI.
- **Relevance**: The learned step a registration-free method would replace.
- **Quality**: 13/15, high. 2,819 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Dalca, Rakic, Guttag and Sabuncu (2019). Learning Conditional Deformable Templates with Convolutional Networks.
- **Key**: `dalca2019learning`. Themes: 4.
- **Type**: Conference paper, NeurIPS 32. arXiv 1908.02738.
- **Method**: Template learned jointly with a registration network, optionally attribute-conditional.
- **Key Findings**: Universal or conditional templates with efficient alignment; no outcome figure.
- **SQ1**: Learned template with registration to it. **SQ2**: Unsupervised; attributes condition the template. **SQ3**: Builds on registration. **SQ4**: Brain MRI.
- **Relevance**: The learned-template mechanism of the research question.
- **Quality**: 12/15, high.
- **Stance**: Neutral.
- **Potential Use**: Related work; contrast with transport barycenters.

### Rakic et al. (2026). AtlasMorph: Learning conditional deformable templates for brain MRI.
- **Key**: `rakic2026atlasmorph`. Themes: 4.
- **Type**: Journal article, Medical Image Analysis 110, 103893.
- **Method**: Templates conditioned on age and sex, with template segmentations.
- **Key Findings**: Annotated conditional templates register better than unconditional ones.
- **SQ1**: Learned conditional template. **SQ2**: Not addressed. **SQ3**: Builds on registration and segmentation. **SQ4**: Brain MRI.
- **Relevance**: Current learned-template route.
- **Quality**: 11/15, acceptable.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Feydy, Charlier, Vialard and Peyre (2017). Optimal Transport for Diffeomorphic Registration.
- **Key**: `feydy2017optimal`. Themes: 4 (main), 2. Named foundational work.
- **Type**: Conference paper, MICCAI 2017, LNCS, 291-299.
- **Method**: Unbalanced transport as the data term of LDDMM.
- **Key Findings**: Fast, global matching terms and better matching.
- **SQ1**: Registration with a coupling as similarity. **SQ2**: Not addressed. **SQ3**: Builds on registration. **SQ4**: Surfaces, fibres, volumes.
- **Relevance**: A transport method that still registers.
- **Quality**: 12/15, high. 143 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Shen et al. (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
- **Key**: `shen2021accurate`. Themes: 4 (main), 2. Named foundational work.
- **Type**: Conference paper, NeurIPS 34. arXiv 2111.00648.
- **Method**: Robust transport for pre-alignment and fine-tuning of point-cloud registration.
- **Key Findings**: State of the art on KITTI scene flow and lung vascular trees; releases PVT1010.
- **SQ1**: A coupling used to register. **SQ2**: Not addressed. **SQ3**: Builds on registration; same-subject pairs. **SQ4**: Lung vessel point clouds from CT.
- **Relevance**: Registration-side use of the coupling.
- **Quality**: 12/15, high. 84 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Lambin et al. (2012). Radiomics: extracting more information from medical images using advanced feature analysis.
- **Key**: `lambin2012radiomics`. Themes: 4. Named foundational work.
- **Type**: Journal article, European Journal of Cancer 48(4), 441-446.
- **Method**: Position paper.
- **Key Findings**: Radiomics as "the high-throughput extraction of large amounts of image features from radiographic images".
- **SQ1**: Not addressed. **SQ2**: Motivates outcome models. **SQ3**: Defines radiomics extraction. **SQ4**: Oncology imaging.
- **Relevance**: Origin of the radiomics step.
- **Quality**: 9/15, acceptable. 6,823 citations.
- **Stance**: Neutral.
- **Potential Use**: Introduction.

### Aerts et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Key**: `aerts2014decoding`. Themes: 4. Named foundational work.
- **Type**: Journal article, Nature Communications 5, 4006.
- **Method**: 440 features from CT of 1,019 patients, tested in independent sets.
- **Key Findings**: Prognostic power in independent lung and head-and-neck data.
- **SQ1**: Not addressed; one tumour per patient. **SQ2**: Two-stage. **SQ3**: Relies on segmentation and radiomics. **SQ4**: CT.
- **Relevance**: Radiomics on a segmented tumour predicts an outcome.
- **Quality**: 14/15, high. 5,795 citations.
- **Stance**: Supports the radiomics route lesion-set methods extend.
- **Potential Use**: Introduction.

### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Key**: `gillies2016radiomics`. Themes: 4. Named foundational work.
- **Type**: Review, Radiology 278(2), 563-577.
- **Method**: Review of the radiomics process.
- **Key Findings**: Images converted to mineable data for prognostic models.
- **SQ1**: Not addressed. **SQ2**: Two-stage modelling. **SQ3**: Segmentation and feature extraction as steps. **SQ4**: Oncology.
- **Relevance**: The pipeline the research question asks about.
- **Quality**: 11/15, acceptable. 9,387 citations.
- **Stance**: Neutral.
- **Potential Use**: Introduction.

### Lambin et al. (2017). Radiomics: the bridge between medical imaging and personalized medicine.
- **Key**: `lambin2017radiomics`. Themes: 4. Named foundational work.
- **Type**: Review, Nature Reviews Clinical Oncology 14(12), 749-762.
- **Method**: Review with study guidance.
- **Key Findings**: The field "lacks standardized evaluation of both the scientific integrity and the clinical relevance".
- **SQ1**: Not addressed. **SQ2**: Supervised models on radiomic features. **SQ3**: The radiomics workflow. **SQ4**: Oncology.
- **Relevance**: Evaluation standard.
- **Quality**: 12/15, high. 6,314 citations.
- **Stance**: Neutral.
- **Potential Use**: Introduction; discussion.

### van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Key**: `vangriethuysen2017computational`. Themes: 4. Named foundational work (PyRadiomics).
- **Type**: Journal article, Cancer Research 77(21), e104-e107.
- **Method**: Open-source feature extraction.
- **Key Findings**: Missing standard definitions "severely hampers reproducibility and comparability".
- **SQ1**: Not addressed. **SQ2**: Not addressed. **SQ3**: Is the radiomics step; requires a mask. **SQ4**: Lesion images.
- **Relevance**: Extractor used by AMINN (pyradiomics v2.0.0).
- **Quality**: 12/15, high. 7,417 citations.
- **Stance**: Neutral.
- **Potential Use**: Methods.

### Traverso, Wee, Dekker and Gillies (2018). Repeatability and Reproducibility of Radiomic Features: A Systematic Review.
- **Key**: `traverso2018repeatability`. Themes: 4.
- **Type**: Systematic review, IJROBP 102(4), 1143-1158.
- **Method**: PRISMA review of 41 of 624 studies.
- **Key Findings**: Features sensitive to acquisition, reconstruction, preprocessing and software; only 7 studies addressed every aspect.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Fragility of radiomics. **SQ4**: CT, PET, MRI.
- **Relevance**: Variability of the radiomics step.
- **Quality**: 13/15, high. 1,042 citations.
- **Stance**: Supports removing fragile steps.
- **Potential Use**: Introduction; discussion.

### Shiri et al. (2020). Repeatability of radiomic features in magnetic resonance imaging of glioblastoma: Test-retest and image registration analyses.
- **Key**: `shiri2020repeatability`. Themes: 4.
- **Type**: Journal article, Medical Physics 47(9), 4265-4280.
- **Method**: 17 patients scanned twice; 20 registration approaches; ICC.
- **Key Findings**: Highest mean fraction of repeatable features, 32.4 percent, from a 12-DOF affine with mutual information.
- **SQ1**: Registration as the variable under study. **SQ2**: Not addressed. **SQ3**: Radiomics depends on registration. **SQ4**: Glioblastoma MRI.
- **Relevance**: The one source measuring radiomics against registration.
- **Quality**: 11/15, acceptable. 77 citations.
- **Stance**: Supports registration-free motivation.
- **Potential Use**: Introduction.

### Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative.
- **Key**: `zwanenburg2020ibsi`. Themes: 4. Named foundational work (IBSI).
- **Type**: Journal article, Radiology 295(2), 328-338.
- **Method**: Three-phase consensus of 25 teams.
- **Key Findings**: 169 of 174 features standardized; consensus for 1,220 of 1,347 (90.6 percent) in phase II.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Standardizes radiomics. **SQ4**: CT, PET, MRI.
- **Relevance**: Standard feature definitions.
- **Quality**: 14/15, high. 4,842 citations.
- **Stance**: Neutral.
- **Potential Use**: Methods.

### Poirot et al. (2022). Robustness of radiomics to variations in segmentation methods in multimodal brain MRI.
- **Key**: `poirot2022robustness`. Themes: 4.
- **Type**: Journal article, Scientific Reports 12, 16712.
- **Method**: Scan-rescan data (n = 46) segmented four ways.
- **Key Findings**: Dice IQR 0.77 to 0.90, median ICC above 0.7, yet accuracy varied from 77 to 84 percent across segmentations (p < 0.001).
- **SQ1**: Atlas or network region segmentation. **SQ2**: Two-stage classifier. **SQ3**: Radiomics depends on segmentation. **SQ4**: Brain MRI.
- **Relevance**: Segmentation changes a subject-level prediction.
- **Quality**: 11/15, acceptable. 51 citations.
- **Stance**: Supports removing fragile steps.
- **Potential Use**: Introduction; discussion.

### Ronneberger, Fischer and Brox (2015). U-Net: Convolutional Networks for Biomedical Image Segmentation.
- **Key**: `ronneberger2015unet`. Themes: 4. Named foundational work.
- **Type**: Conference paper, MICCAI 2015, LNCS, 234-241.
- **Method**: Encoder-decoder with skip connections and augmentation.
- **Key Findings**: Won ISBI 2015 cell tracking in two categories.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Is the segmentation step. **SQ4**: Microscopy.
- **Relevance**: Architecture behind lesion segmentation.
- **Quality**: 13/15, high. 119,425 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Menze et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS).
- **Key**: `menze2015brats`. Themes: 4.
- **Type**: Journal article, IEEE TMI 34(10), 1993-2024.
- **Method**: Benchmark of 20 algorithms on 65 real and 65 simulated scans.
- **Key Findings**: Inter-rater Dice 74 to 85 percent.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Benchmarks segmentation. **SQ4**: Glioma MRI.
- **Relevance**: Uncertainty lesion sets inherit.
- **Quality**: 14/15, high. 8,278 citations.
- **Stance**: Neutral.
- **Potential Use**: Introduction.

### Kamnitsas et al. (2017). Efficient multi-scale 3D CNN with fully connected CRF for accurate brain lesion segmentation.
- **Key**: `kamnitsas2017efficient`. Themes: 4.
- **Type**: Journal article, Medical Image Analysis 36, 61-78.
- **Method**: Dual-pathway 3D CNN with a CRF.
- **Key Findings**: Top ranks on BRATS 2015 and ISLES 2015.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Is lesion segmentation. **SQ4**: Brain MRI lesions.
- **Relevance**: The kind of detector that produces lesion sets.
- **Quality**: 14/15, high. 3,969 citations.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Isensee et al. (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Key**: `isensee2021nnunet`. Themes: 4. Named foundational work.
- **Type**: Journal article, Nature Methods 18(2), 203-211.
- **Method**: Self-configuring segmentation.
- **Key Findings**: "Surpasses most existing approaches" on 23 datasets.
- **SQ1 and SQ2**: Not addressed. **SQ3**: Is the segmentation step. **SQ4**: 3D biomedical images.
- **Relevance**: Default segmentation front end.
- **Quality**: 14/15, high. 13,778 citations.
- **Stance**: Neutral.
- **Potential Use**: Methods.

### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Key**: `gramfort2015fast`. Themes: 4 (main), 2.
- **Type**: Conference paper, IPMI 2015, LNCS, 261-272.
- **Method**: Kantorovich means via entropic barycenters.
- **Key Findings**: Averages non-overlapping effects across subjects; fMRI and MEG on voxel grids and cortical meshes.
- **SQ1**: Barycenter over a shared domain [inferred by theme 4: prior normalization to a common space]. **SQ2**: Not addressed. **SQ3**: Builds on registration; replaces linear averaging. **SQ4**: fMRI, MEG.
- **Relevance**: A barycenter in place of smoothing then averaging.
- **Quality**: 12/15, high. 141 citations.
- **Stance**: Supports transport for residual misalignment.
- **Potential Use**: Related work.

### Su, Zeng, Wang, Lu and Gu (2015). Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis.
- **Key**: `su2015shape`. Themes: 4 (main), 2.
- **Type**: Conference paper, IPMI 2015, LNCS, 411-423. Abstract read.
- **Method**: Conformal maps to a canonical domain, area distortion as a measure, Wasserstein distances for classification.
- **Key Findings**: Invariant under rigid motions and scalings; IQ classification; no accuracy in the abstract.
- **SQ1**: Coupling between subject measures on a canonical domain. **SQ2**: Two-stage. **SQ3**: Removes inter-subject registration; relies on surface reconstruction. **SQ4**: Cortical surfaces.
- **Relevance**: Transport distance for a subject label.
- **Quality**: 9/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Carneiro, Nascimento and Bradley (2017). Automated Analysis of Unregistered Multi-View Mammograms With Deep Learning.
- **Key**: `carneiro2017automated`. Themes: 4.
- **Type**: Journal article, IEEE TMI 36(11), 2355-2365. Abstract read.
- **Method**: Joint classification of unregistered CC and MLO views with lesion maps.
- **Key Findings**: AUC over 0.9 with manual maps; with automated maps on INbreast over 0.78 and 0.86.
- **SQ1**: Learned joint representation of views of one patient. **SQ2**: Supervised end to end. **SQ3**: Removes inter-view registration; relies on lesion maps, and accuracy falls when they are automated. **SQ4**: Mammograms.
- **Relevance**: Registration-free fusion within a patient.
- **Quality**: 13/15, high. 225 citations.
- **Stance**: Supports, with the segmentation dependence.
- **Potential Use**: Related work.

### Bazeille, Richard, Janati and Thirion (2019). Local Optimal Transport for Functional Brain Template Estimation.
- **Key**: `bazeille2019local`. Themes: 4 (main), 2.
- **Type**: Conference paper, IPMI 2019, LNCS 11492, 237-248. Abstract as summarized on the portal.
- **Method**: Entropic transport builds a functional template.
- **Key Findings**: Better transfer across individuals than state-of-the-art methods.
- **SQ1**: Template by transport [inferred: subjects already in a common anatomical space]. **SQ2**: Not addressed. **SQ3**: Builds on normalization. **SQ4**: fMRI.
- **Relevance**: Transport template for brains.
- **Quality**: 9/15, acceptable.
- **Stance**: Supports transport templates; does not remove registration.
- **Potential Use**: Related work.

### Dadashkarimi et al. (2023). Cross Atlas Remapping via Optimal Transport (CAROT).
- **Key**: `dadashkarimi2023carot`. Themes: 4 (main), 2.
- **Type**: Journal article, Medical Image Analysis 88, 102864.
- **Method**: Transport between regions of two atlases from training time series.
- **Key Findings**: Reconstructed connectomes predicted IQ as well as or better than the original (preprint text).
- **SQ1**: Coupling between parcellations; atlases in a common template space. **SQ2**: Unsupervised coupling, then a two-stage predictive model. **SQ3**: Builds on registration and parcellation. **SQ4**: Connectomes.
- **Relevance**: Transport between region sets, then prediction.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports; does not remove registration.
- **Potential Use**: Related work.

### Dong, Pachade, Liang, Sheth and Giancardo (2024). A self-supervised learning approach for registration agnostic imaging models with 3D brain CTA.
- **Key**: `dong2024selfsupervised`. Themes: 4.
- **Type**: Journal article, iScience 27(3), 109004. Full-text results table read.
- **Method**: A teacher on registered images distils into a student on unregistered images.
- **Key Findings**: On 402 patients, LVO AUC 0.8785 (teacher, registered), 0.8098 (distilled student, unregistered), 0.632 (student with plain supervision, unregistered).
- **SQ1**: Learned invariance distilled from a registered teacher. **SQ2**: Supervised, two-stage by distillation. **SQ3**: Removes registration at inference; the teacher needs registered training images. **SQ4**: Brain CTA.
- **Relevance**: The one measurement of what removing registration costs.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports, and shows the cost of naive removal.
- **Potential Use**: Introduction; discussion.

### Gong et al. (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence.
- **Key**: `gong2026robust`. Themes: 4 (main), 2.
- **Type**: Journal article, Frontiers in Oncology 15, 1700447. Abstract read.
- **Method**: CMOT-Fusion matches regions between misaligned T2 and ADC images before fusion.
- **Key Findings**: Mean AUC 0.849 +/- 0.034 in 5-fold CV on 300 men; test ensemble 0.824 (95% CI 0.694-0.930) against 0.839 for PI-RADS; the authors call the findings exploratory.
- **SQ1**: Coupling between sequences of one patient. **SQ2**: Supervised end to end. **SQ3**: Removes inter-sequence registration; segmentation use [not stated in the parts read]. **SQ4**: Prostate mpMRI.
- **Relevance**: End-to-end transport fusion for a patient outcome.
- **Quality**: 9/15, acceptable.
- **Stance**: Supports, with a test AUC not above PI-RADS.
- **Potential Use**: Related work.

### Qahqaie, Neumann, Heimann, Maier and Zimmer (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
- **Key**: `qahqaie2026unbalanced`. Themes: 4 (main), 2.
- **Type**: Conference paper, ISBI 2026, 1-4. doi:10.1109/ISBI61048.2026.11516053 (version of record resolved in this run), arXiv 2602.09933. Abstract read.
- **Method**: Unbalanced transport matches lesions across time points with geometry, Jacobian trust and appearance costs.
- **Key Findings**: Better edge-detection precision and recall and lesion-graph F1 than distance-only baselines on longitudinal CT.
- **SQ1**: Unbalanced coupling between lesion sets, guided by registration. **SQ2**: Not addressed. **SQ3**: Builds on deformable registration and segmentation. **SQ4**: Lesion sets in CT.
- **Relevance**: The one coupling between lesion sets of unequal size.
- **Quality**: 7/15, marginal; kept as the only such coupling.
- **Stance**: Neutral.
- **Potential Use**: Related work.

### Chen, Cheung, Milot and Martel (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Key**: `chen2021aminn`. Themes: 4 (main), 3.
- **Type**: Conference paper, MICCAI 2021, LNCS, 752-761. Full text read.
- **Method**: Autoencoder on per-lesion radiomics trained jointly with a MIL network over a patient's lesions.
- **Key Findings**: Table 1: AUC 0.70 (0.67-0.73) for average pooling against 0.58 for largest-lesion baselines, 10 repeats of 3-fold CV; 181 lesions from 50 patients.
- **SQ1**: Permutation invariance over lesions. **SQ2**: Supervised end to end on precomputed features, dichotomized survival. **SQ3**: Removes cross-patient registration; relies on segmentation and radiomics. **SQ4**: Liver MRI lesion sets.
- **Relevance**: Direct precedent of a lesion-set outcome encoder.
- **Quality**: 10/15, acceptable.
- **Stance**: Supports.
- **Potential Use**: Related work; baselines.

### Chen and Martel (2022). Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling.
- **Key**: `chen2022injective`. Themes: 4 (main), 3.
- **Type**: Preprint, arXiv 2203.04964. Full text read.
- **Method**: Multifocal cohorts built from public CT, and injective MIL pooling.
- **Key Findings**: HN1-MF (245 tumours, 83 patients) and Lung1-MF (1,039 tumours, 258 patients); MIL with all tumours "significantly and consistently improves outcome prediction". AUC values are in a table the theme run did not quote.
- **SQ1**: Invariance with injective pooling. **SQ2**: Supervised end to end on radiomics. **SQ3**: Removes registration; relies on released segmentations and radiomics. **SQ4**: Tumour sets in CT.
- **Relevance**: Public benchmark and a pooling-expressiveness argument.
- **Quality**: 9/15, acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work; datasets.

### Alberb et al. (2026). An Automated Radiomics Framework for Postoperative Survival Prediction in Colorectal Liver Metastases using Preoperative MRI.
- **Key**: `alberb2026automated`. Themes: 4 (main), 3. Added by this merge run (currency gate).
- **Type**: Preprint, arXiv 2603.10216. Read: arXiv abstract, in this run.
- **Method**: An anatomy-aware segmentation pipeline (liver, metastases, spleen), using SAM-based prompt propagation (SAMONAI) for pseudo-labels. Per-tumour radiomics then feed SurvAMINN, an autoencoder MIL network that learns dimensionality reduction and survival jointly from censored data.
- **Key Findings**: On 227 patients, median Dice 0.96 (liver) and 0.93 (spleen), metastasis Dice 0.78 and detection F1 0.79, and survival C-index 0.69, per the abstract.
- **SQ1**: Permutation invariance over a patient's tumours (MIL) [inferred from the AMINN design it extends; the abstract does not name the pooling]. **SQ2**: Supervised for time to event, the hazard learned jointly with the autoencoder. **SQ3**: Relies on automated lesion segmentation and on radiomics. Registration across patients is not used [inferred]. **SQ4**: Liver MRI lesion sets.
- **Relevance**: The survival form of AMINN, with the segmentation step automated.
- **Quality**: 9/15 (venue 1, rigor 2, relevance 3, citations 1, data 2), acceptable. Preprint.
- **Stance**: Supports.
- **Potential Use**: Related work; baselines.

### Gutierrez-Becker, Sarasua and Wachinger (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks.
- **Key**: `gutierrezbecker2021discriminative`. Themes: 4, 3 (both main). Folded: `gutierrezbecker2018multistructural` (MICCAI 2018, doi:10.1007/978-3-030-00931-1_60, arXiv 1806.01069), the conference form of this line of work.
- **Type**: Journal article, Medical Image Analysis 67, 101852. arXiv 2010.00820. Full text read (theme 4); for the 2018 paper, methods, data and results read (theme 3).
- **Method**: Point-cloud networks for disease classification, age regression and generation, single- and multi-structure. The 2021 paper adds a rotation network that aligns each shape to one reference point cloud (IXI013) through an earth mover's distance loss. The 2018 paper used a multi-branch PointNet with T-Nets, 512 points per structure.
- **Key Findings**: 2021, full text: HC-AD F1 0.82 against 0.78 for BrainPrint on 7,974 ADNI images; the abstract says the networks avoid "the need to identify point correspondences between shapes". 2018: F1 0.61 for HC-MCI (PointNet 0.59, BrainPrint 0.57) and 0.80 for HC-AD (both baselines 0.78). The 2018 paper drops PointNet's max pooling and keeps per-point features, and how that keeps invariance is [not stated in the parts read].
- **SQ1**: Permutation invariance plus a learned rigid alignment to one reference shape, a template step. **SQ2**: Supervised end to end. **SQ3**: Removes inter-subject deformable registration and mesh correspondence. Relies on FreeSurfer segmentation, which uses atlas-based labelling, so calling it registration-free needs that qualification. **SQ4**: Point clouds of brain structures from MRI.
- **Relevance**: Subject-level prediction from anatomical point clouds without point correspondence.
- **Quality**: 12/15, high (2021, theme 4); 11/15 (2018, theme 3). 28 and 27 citations.
- **Stance**: Supports, with the segmentation dependence.
- **Potential Use**: Related work; baselines.

### Chen et al. (2022). White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning.
- **Key**: `chen2022tracts`. Themes: 3, 4 (both main). Folded: `chen2022white`.
- **Type**: Conference paper, MICCAI 2022, LNCS, 174-184. doi:10.1007/978-3-031-16431-6_17, arXiv 2207.02402. Methods, data and results read (both themes).
- **Method**: The left arcuate fasciculus as 2,048 points with coordinates, FA and streamline counts; a PointNet-based Siamese network without T-Net and a paired-Siamese loss.
- **Key Findings**: 806 HCP subjects, 162 test: Pearson r 0.361 and MAE 6.512 against r 0.225 for the best baseline; critical points locate frontal regions.
- **SQ1**: Permutation invariance over points. The T-Net is removed to keep position, so subjects share a coordinate space from the tractography pipeline. **SQ2**: Supervised end to end. **SQ3**: Relies on tract identification with the WMA fiber-clustering atlas. How the atlas aligns subjects is [not stated in the parts read]. Not registration-free without that qualification. **SQ4**: Tract point clouds from diffusion MRI.
- **Relevance**: Regression of a subject score from an unordered point set.
- **Quality**: 11/15 (both themes), acceptable. 19 citations.
- **Stance**: Supports, with the atlas dependence.
- **Potential Use**: Related work.

### Beetz, Yang, Banerjee, Li and Grau (2023). 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks.
- **Key**: `beetz2023mi`. Themes: 3, 4 (both main). Folded: `beetz2023shape`.
- **Type**: Conference paper, EMBC 2023, 1-4. doi:10.1109/EMBC40787.2023.10340878, arXiv 2307.07298. Methods, data and results read (theme 3); selected passages (theme 4).
- **Method**: Biventricular point clouds from CNN segmentation of cine MRI and a completion network; PointNet with a sigmoid output.
- **Key Findings**: 1,068 UK Biobank subjects: best AUROC 0.758 for prevalent MI against 0.671 for ejection fraction, and 0.651 against 0.620 for incident MI. Only PointNet was tested.
- **SQ1**: Permutation invariance. Whether the clouds share a coordinate frame is [not stated in the parts read]. **SQ2**: The classifier is trained end to end on the point clouds. The point clouds come from a separate segmentation and reconstruction stage that the outcome does not train. Theme 3 recorded this as end to end and theme 4 as two-stage, and both describe the same design. **SQ3**: Relies on segmentation and reconstruction; no registration described. **SQ4**: Cardiac point clouds from MRI.
- **Relevance**: An outcome from anatomical point clouds built by a segmentation pipeline.
- **Quality**: 11/15 (theme 3) and 9/15 (theme 4), acceptable. 12 citations.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Thiery et al. (2023). Graph-Based Multimodal Multi-lesion DLBCL Treatment Response Prediction from PET Images.
- **Key**: `thiery2023dlbcl`. Themes: 3 (main), 4.
- **Type**: Conference paper, MICCAI 2023 Workshops, LNCS 14394, 103-112. doi:10.1007/978-3-031-47425-5_10 (version of record resolved in this run), arXiv 2310.16863. Methods and data read (theme 3).
- **Method**: Per patient, a fully connected lesion graph with distance and feature edges. Node features are intensity and radiomics, with max pooling to a patient vector and cross-attention fusion with clinical data.
- **Key Findings**: On 583 DLBCL patients (GAINED), better 2-year PFS prediction than clinical, imaging or combined baselines. Lesions detected manually and segmented by a majority vote of three thresholds.
- **SQ1**: Permutation invariance (max pooling over the lesion graph). **SQ2**: Supervised end to end, binary outcome. **SQ3**: Relies on lesion detection, segmentation and radiomics. No registration is described. **SQ4**: Lesion sets as graphs, PET.
- **Relevance**: The closest case to the research question in theme 3.
- **Quality**: 10/15, acceptable (scored as a preprint before the version of record was found).
- **Stance**: Supports.
- **Potential Use**: Related work; introduction.

### Zhang et al. (2025). Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation.
- **Key**: `zhang2025lamp`. Themes: 3 (main), 4.
- **Type**: Conference paper, MICCAI 2025, LNCS, 322-332. Abstract and paper page read.
- **Method**: LAMP: each lesion enriched with surrounding organs, lesions pooled by attention MIL.
- **Key Findings**: 229 patients: C-index 0.791 (PFS) and 0.828 (OS) in five-fold CV. The reviews indicate a segmentation stage and TotalSegmentator organ masks.
- **SQ1**: Attention pooling. Anatomical position enters as per-lesion context from organ masks, without registration. **SQ2**: Supervised for survival. **SQ3**: Relies on lesion and organ segmentation; removes registration. **SQ4**: PET/CT lesion sets.
- **Relevance**: Attention MIL over lesions, with anatomy in place of registration.
- **Quality**: 12/15, high.
- **Stance**: Supports.
- **Potential Use**: Related work.

### Prabhakar et al. (2023). Self-pruning Graph Neural Network for Predicting Inflammatory Disease Activity in Multiple Sclerosis from Brain MR Images.
- **Key**: `prabhakar2023selfpruning`. Themes: 4 (main), 3.
- **Type**: Conference paper, MICCAI 2023, LNCS, 226-236. Full text read.
- **Method**: Detected lesions with self-supervised features as nodes of a k-NN (k = 5) spatial graph; a self-pruning GNN.
- **Key Findings**: AUC 0.671 +/- 0.062 (one year) and 0.664 +/- 0.063 (two years) against 0.610 and 0.600 for a CNN. A set baseline without edges reached 0.654 and 0.658, inside one standard deviation.
- **SQ1**: Invariance over lesion nodes. The scans were "rigidly co-registered to the MNI152 atlas", so coordinates sit in a common rigid frame. **SQ2**: Supervised, two-stage (segmentation and features, then GNN). **SQ3**: Relies on lesion segmentation and rigid registration to MNI152; removes deformable registration. **SQ4**: 430 MS patients.
- **Relevance**: The lesion-set method for MS, with set and graph baselines.
- **Quality**: 11/15, acceptable.
- **Stance**: Supports, with a small margin.
- **Potential Use**: Related work; baselines.

### Bae, Kapse, Zhou, Mani and Prasanna (2024). HoG-Net: Hierarchical Multi-organ Graph Network for Head and Neck Cancer Recurrence Prediction from CT Images.
- **Key**: `bae2024hognet`. Themes: 4 (main), 3. Added by this merge run (currency gate).
- **Type**: Conference paper, MICCAI 2024, LNCS 15005, 317-327. doi:10.1007/978-3-031-72086-4_30. Read: the MICCAI 2024 paper page (abstract, reviews, rebuttal) and the Crossref record, in this run.
- **Method**: Local graphs per organ at risk (OAR) and a global graph of interactions between organs, for locoregional recurrence.
- **Key Findings**: Evaluated on 2,741 patients from six institutions, 395 in the test set, and above several baselines per the abstract. The page gives F1 values from the rebuttal (for example RADCURE 0.658 against 0.595) and no AUC; the meta-review calls the AUC gain small.
- **SQ1**: A set of named organ regions, which correspond across patients through their segmentation labels [inferred]. Registration is not mentioned on the page. **SQ2**: Supervised for a binary recurrence label; end to end on the graphs [inferred from the page]. **SQ3**: Relies on OAR segmentation, by nnU-Net per a reviewer or from treatment planning per the rebuttal. **SQ4**: Organ region sets from CT.
- **Relevance**: A region-set outcome model where segmentation supplies the correspondence.
- **Quality**: 10/15 (venue 2, rigor 2, relevance 2, citations 1, data 3), acceptable.
- **Stance**: Supports region-set prediction; relies on segmentation.
- **Potential Use**: Related work.

### Literature Matrix

Columns T1 to T4 are the themes ("main" is the theme whose run included the work; "x" a further theme it bears on). SQ1: Reg = registration or a common grid; Tmpl-fixed or Tmpl-learned = a template, reference or barycenter; TC = transport coupling; PI = permutation invariance; Shared-XP = PARAFAC2 shared cross-product; Shift = estimated shift; Cont = shared continuous domain; Aligned = assumes aligned modes; Atlas = correspondence from an atlas or segmentation labels. SQ2: E2E = outcome in the training objective; 2S = features then a separately trained predictor; Gen = covariates in a generative model; Uns = unsupervised; n/a. SQ3: R-reg, R-seg, R-rad = relies on registration, segmentation or radiomics; X-reg = removes registration; Is-reg, Is-seg, Is-rad = is that step; n/a = not addressed. Method: Method, Theory, Review, Standard (standard, tool or benchmark), Empirical (measurement study). Quality: High, Acc (acceptable), Marg (marginal).

| Source | T1 | T2 | T3 | T4 | SQ1 | SQ2 | SQ3 | Method | Quality |
|---|---|---|---|---|---|---|---|---|---|
| wold1987multiway | main | | | | Aligned | E2E | n/a | Method | High |
| bro1996multiway | main | | | | Aligned | E2E | n/a | Method | High |
| zhao2013hopls | main | | | | Aligned | E2E | n/a | Method | High |
| park2026sparsehopls | main | | | | Aligned | E2E | n/a | Method | High |
| zhou2013tensor | main | | | x | Reg | E2E | R-reg, R-seg | Method | High |
| guhaniyogi2017bayesian | main | | | x | Reg [inferred] | E2E | R-reg [inferred] | Method | High |
| li2018tucker | main | | | x | Reg [inferred] | E2E | R-reg [inferred] | Method | High |
| lock2018tensor | main | | | | Aligned | E2E | n/a | Method | High |
| huang2026shift | main | | | x | Reg + Shift | E2E | R-reg | Method | Acc |
| sprangers2023group | main | | x | | PI (group) | E2E | n/a | Method | High |
| harshman1972parafac2 | main | | | | Shared-XP | Uns | n/a | Method | Acc |
| kiers1999parafac2 | main | | | | Shared-XP | Uns | n/a | Method | High |
| bro1999parafac2 | main | | | | Shared-XP | Uns | n/a | Method | High |
| perros2017spartan | main | | | | Shared-XP | Uns | n/a | Method | High |
| afshar2018copa | main | | | | Shared-XP | Uns | n/a | Method | High |
| cohen2018nonnegative | main | | | | Shared-XP (relaxed) | Uns | n/a | Method | Acc |
| roald2022aoadmm | main | | | | Shared-XP | Uns | n/a | Method | High |
| yin2020logpar | main | | | | Shared-XP | 2S | n/a | Method | High |
| tang2026unaligned | main | | | | Cont | Uns | n/a | Method | High |
| morup2008shift | main | | | x | Shift | Uns | n/a | Method | High |
| lock2018supervised | main | | | | Aligned | Gen | n/a | Method | High |
| hu2022generalized | main | | | x | Atlas | Gen | R-reg (parcellation) | Method | High |
| ren2023multipar | main | | | | Shared-XP | E2E | n/a | Method | Acc |
| konyar2025semisupervised | main | | | | Shared-XP | E2E (semi) | n/a | Method | High |
| patalano2026par2cox | main | | | | Shared-XP | E2E | n/a | Method | Acc |
| alam2026joint | main | | | | Cont | E2E | n/a | Method | High |
| acar2011allatonce | main | | | | Aligned | Uns | n/a | Method | Acc |
| schenker2025parafac2cmtf | main | | | | Shared-XP | Uns | n/a | Method | High |
| kolda2009tensor | main | | | | n/a | n/a | n/a | Review | High |
| carroll1970analysis | main | | | | Tmpl-fixed (common space) | Uns | n/a | Method | High |
| cuturi2013sinkhorn | | main | | | TC | n/a | n/a | Method | High |
| peyre2019computational | | main | | | TC, Tmpl | n/a | n/a | Review | High |
| chizat2018scaling | | main | | | TC (unbalanced) | n/a | n/a | Method | High |
| feydy2019interpolating | | main | | | TC | n/a | n/a | Method | High |
| eisenberger2022unified | | main | | | TC (differentiable) | n/a | n/a | Method | Acc |
| memoli2011gromov | | main | | | TC (GW) | n/a | X-reg (object matching) | Theory | High |
| vayer2019optimal | | main | | | TC (FGW) | 2S | n/a | Method | High |
| sejourne2021unbalanced | | main | | | TC (UGW) | n/a | n/a | Method | Acc |
| scetbon2022linear | | main | | | TC (low-rank GW) | n/a | n/a | Method | Acc |
| thual2022aligning | | main | | main | TC + Tmpl-fixed | Uns | X-reg (exp. 2), R-seg (surfaces) | Method | High |
| vincentcuaz2022semirelaxed | | main | | | Tmpl-learned (srGW) | Uns | n/a | Method | Acc |
| agueh2011barycenters | | main | | | Tmpl (barycenter) | n/a | n/a | Theory | High |
| cuturi2014fast | | main | | | Tmpl (barycenter) | Uns | n/a | Method | High |
| benamou2015iterative | | main | | | Tmpl (barycenter) | n/a | n/a | Method | High |
| peyre2016gromov | | main | | | Tmpl (GW barycenter) | unclear | n/a | Method | High |
| brogatmotte2022learning | | main | | | Tmpl-learned (output) | E2E | n/a | Method | Acc |
| rolet2016fast | | main | | | Tmpl-learned | Uns | n/a | Method | Acc |
| schmitz2018wasserstein | | main | | | Tmpl-learned | Uns | n/a | Method | High |
| xu2020gromov | | main | | | Tmpl-learned (GW atoms) | Uns | n/a | Method | Acc |
| vincentcuaz2021online | | main | | | Tmpl-learned (GW atoms) | Uns then 2S | n/a | Method | Acc |
| vincentcuaz2022template | | main | | | Tmpl-learned + TC | E2E | n/a | Method | Acc |
| zhang2024wasserstein | | main | | | Tmpl-learned + TC | E2E (keys) | n/a | Method | Acc |
| mazelet2026learning | | main | | main | Tmpl-learned + TC | Uns then 2S | X-reg (projection), R-reg (template geometry) | Method | Acc |
| huang2016supervised | | main | | | TC (learned metric) | E2E (metric) | n/a | Method | High |
| kolouri2016sliced | | main | | | TC (sliced) | 2S | n/a | Method | High |
| wang2013linear | | main | | x | Tmpl-fixed (LOT) | 2S | X-reg (images) | Method | High |
| moosmuller2023linear | | main | | | Tmpl-fixed (LOT) | 2S | n/a | Theory | High |
| togninalli2019wasserstein | | main | | | TC | 2S | n/a | Method | High |
| mialon2021otke | | main | main | | Tmpl-learned + TC | E2E or Uns | n/a | Method | High |
| kolouri2021wasserstein | | main | | | Tmpl-fixed (LOT) | 2S | n/a | Method | High |
| chen2020optimal | | main | x | | Tmpl-learned + TC | E2E | n/a | Method | Acc |
| meunier2022distribution | | main | | | TC (sliced) | 2S | n/a | Theory | Acc |
| mahan2024point | | main | x | | Tmpl-fixed (LOT) + PI | Alternating | n/a | Method | Acc |
| wang2025linearized | | main | | | Tmpl-fixed (LOT) | 2S | n/a | Method | Acc |
| bachoc2023gaussian | | main | | | Tmpl-fixed (potentials) | 2S | n/a | Method | Acc |
| gachon2025low | | main | | | Tmpl-fixed (quantization) + LOT | Uns | n/a | Method | Acc |
| chen2026brainpicm | | main | | x | Atlas + TC to Tmpl-fixed | 2S | R-reg (atlas) | Method | Acc |
| zaheer2017deepsets | | | main | | PI | E2E | n/a | Theory | High |
| murphy2019janossy | | | main | | PI | E2E | n/a | Theory | High |
| wagstaff2019limitations | | | main | | PI | E2E (synthetic) | n/a | Theory | High |
| wagstaff2022universal | | | main | | PI | n/a | n/a | Theory | High |
| zhang2020fspool | | | main | | PI | E2E | n/a | Method | Acc |
| wang2024polynomial | | | main | | PI | n/a | n/a | Theory | High |
| vinyals2016order | | | main | | PI | E2E | n/a | Method | High |
| lee2019settransformer | | | main | | PI | E2E | n/a | Method | High |
| kim2021transformers | | | main | | PI | E2E | n/a | Method | Acc |
| qi2017pointnet | | | main | | PI + learned pose | E2E | n/a | Method | High |
| qi2017pointnetpp | | | main | | PI | E2E | n/a | Method | High |
| wang2019dgcnn | | | main | | PI | E2E | n/a | Method | High |
| thomas2019kpconv | | | main | | PI | E2E | n/a | Method | High |
| prokudin2019bps | | | main | | Tmpl-fixed (basis points) | E2E | X-reg (one pass) | Method | High |
| zhao2021pointtransformer | | | main | | PI | E2E | n/a | Method | High |
| dietterich1997multiple | | | main | | PI (bag) | E2E | n/a | Method | High |
| ilse2018attention | | | main | | PI | E2E | n/a | Method | High |
| wang2018revisiting | | | main | | PI | E2E | n/a | Method | High |
| campanella2019clinical | | | main | x | PI | E2E | X-seg annotation | Method | High |
| lu2021clam | | | main | x | PI | E2E | X-seg annotation | Method | High |
| shao2021transmil | | | main | | PI (partly given up) | E2E | n/a | Method | High |
| naderializadeh2021pswe | | x | main | | Tmpl-learned + TC | E2E | n/a | Method | High |
| xu2023rotp | | x | main | | TC (pooling) | E2E | n/a | Method | High |
| amir2025fsw | | x | main | | PI (sliced) | E2E | n/a | Theory | High |
| tian2026roam | | x | main | x | TC (pooling) | E2E [inferred] | n/a | Method | Acc |
| avants2008syn | | | | main | Reg | n/a | Is-reg | Method | High |
| balakrishnan2019voxelmorph | | | | main | Reg | n/a | Is-reg | Method | High |
| dalca2019learning | | | | main | Tmpl-learned + Reg | Uns | R-reg | Method | High |
| rakic2026atlasmorph | | | | main | Tmpl-learned + Reg | n/a | R-reg, R-seg | Method | Acc |
| feydy2017optimal | | x | | main | Reg with TC | n/a | R-reg | Method | High |
| shen2021accurate | | x | | main | Reg with TC | n/a | R-reg | Method | High |
| lambin2012radiomics | | | | main | n/a | n/a | Is-rad | Review | Acc |
| aerts2014decoding | | | | main | n/a | 2S | R-seg, R-rad | Empirical | High |
| gillies2016radiomics | | | | main | n/a | 2S | Is-rad | Review | Acc |
| lambin2017radiomics | | | | main | n/a | 2S | Is-rad | Review | High |
| vangriethuysen2017computational | | | | main | n/a | n/a | Is-rad | Standard | High |
| traverso2018repeatability | | | | main | n/a | n/a | Is-rad | Review | High |
| shiri2020repeatability | | | | main | Reg (studied) | n/a | R-reg, R-rad | Empirical | Acc |
| zwanenburg2020ibsi | | | | main | n/a | n/a | Is-rad | Standard | High |
| poirot2022robustness | | | | main | Atlas | 2S | R-seg, R-rad | Empirical | Acc |
| ronneberger2015unet | | | | main | n/a | n/a | Is-seg | Method | High |
| menze2015brats | | | | main | n/a | n/a | Is-seg | Standard | High |
| kamnitsas2017efficient | | | | main | n/a | n/a | Is-seg | Method | High |
| isensee2021nnunet | | | | main | n/a | n/a | Is-seg | Method | High |
| gramfort2015fast | | x | | main | Tmpl (barycenter) on Reg [inferred] | Uns | R-reg [inferred] | Method | High |
| su2015shape | | x | | main | TC on canonical domain | 2S | X-reg, R-seg (surfaces) | Method | Acc |
| carneiro2017automated | | | | main | Learned fusion (within patient) | E2E | X-reg, R-seg | Method | High |
| bazeille2019local | | x | | main | Tmpl by TC on Reg [inferred] | Uns | R-reg [inferred] | Method | Acc |
| dadashkarimi2023carot | | x | | main | TC between atlases | Uns then 2S | R-reg, atlas | Method | Acc |
| dong2024selfsupervised | | | | main | Learned invariance (distilled) | 2S (distillation) | X-reg at inference | Empirical | Acc |
| gong2026robust | | x | | main | TC (within patient) | E2E | X-reg (sequences) | Method | Acc |
| qahqaie2026unbalanced | | x | | main | TC (unbalanced) + Reg | n/a | R-reg, R-seg | Method | Marg |
| chen2021aminn | | | x | main | PI | E2E | X-reg, R-seg, R-rad | Method | Acc |
| chen2022injective | | | x | main | PI (injective) | E2E | X-reg, R-seg, R-rad | Standard | Acc |
| alberb2026automated | | | x | main | PI [inferred] | E2E | R-seg, R-rad | Method | Acc |
| gutierrezbecker2021discriminative | | | main | main | PI + Tmpl-fixed (rigid) | E2E | X-reg (deformable), R-seg (atlas-based) | Method | High |
| chen2022tracts | | | main | main | PI + Atlas | E2E | R-seg (tract atlas) | Method | Acc |
| beetz2023mi | | | main | main | PI | E2E on pipeline output | R-seg | Method | Acc |
| thiery2023dlbcl | | | main | x | PI (graph) | E2E | R-seg, R-rad | Method | Acc |
| zhang2025lamp | | | main | x | PI (attention) | E2E | R-seg, X-reg | Method | High |
| prabhakar2023selfpruning | | | x | main | PI (graph) + Reg (rigid) | 2S | R-seg, R-reg (rigid) | Method | Acc |
| bae2024hognet | | | x | main | Atlas (organ labels) [inferred] | E2E [inferred] | R-seg | Method | Acc |

Theme counts in the matrix ("main" or "x"): theme 1, 30; theme 2, 49; theme 3, 39; theme 4, 50. Method counts: Method 105, Theory 10, Review 6, Empirical 4, Standard 4.

### Synthesis Analysis

#### By correspondence mechanism

**Registration to a common space.** The supervised tensor regressions predict a subject-level outcome from images on a common grid [zhou2013tensor, guhaniyogi2017bayesian, li2018tucker]. Only Zhou, Li and Zhu state the registration step; for the other two the common grid implies it. The one tensor classifier that targets misalignment keeps registration and absorbs residual error by cyclic shifts [huang2026shift]. Registration itself is the SyN and VoxelMorph step [avants2008syn, balakrishnan2019voxelmorph]. Transport also appears inside registration, as a similarity term or a point-cloud matcher [feydy2017optimal, shen2021accurate, qahqaie2026unbalanced], so a transport method is not registration-free by default. Several methods that need no deformable registration still use a rigid or atlas frame: rigid co-registration to MNI152 [prabhakar2023selfpruning], a tract atlas [chen2022tracts], FreeSurfer labelling [gutierrezbecker2021discriminative], atlas parcellations [dadashkarimi2023carot, chen2026brainpicm, hu2022generalized].

**Shared structure in a tensor model.** PARAFAC2 lets one mode differ in number and identity across slices while the cross-product of its factors stays constant [harshman1972parafac2, kiers1999parafac2, bro1999parafac2]. In every PARAFAC2 work found, that mode is time: visits [perros2017spartan, afshar2018copa, yin2020logpar, ren2023multipar, konyar2025semisupervised, patalano2026par2cox], elution [bro1999parafac2] or time profiles [roald2022aoadmm, schenker2025parafac2cmtf]. Two other treatments need a shared coordinate: a per-component shift [morup2008shift] and functions on a common continuous domain [tang2026unaligned]. One tensor network builds in group invariance [sprangers2023group]. Theme 1 searched for a tensor method whose unaligned mode is a spatial set and found none (see "Identified Gaps").

**Template or barycenter.** Fixed references give every subject coordinates through its transport map: LOT [wang2013linear, moosmuller2023linear, kolouri2021wasserstein, wang2025linearized, gachon2025low], Sinkhorn potentials [bachoc2023gaussian] and basis points [prokudin2019bps]. Learned templates registered to by deformation keep registration [dalca2019learning, rakic2026atlasmorph]. Transport barycenters and dictionaries learn templates by reconstruction: [agueh2011barycenters, cuturi2014fast, benamou2015iterative, peyre2016gromov, rolet2016fast, schmitz2018wasserstein, xu2020gromov, vincentcuaz2021online, vincentcuaz2022semirelaxed]. In neuroimaging, transport templates are built on a template geometry or on normalized data: fsaverage5 for the FUGW barycenter [thual2022aligning], fsaverage for the fMRI dictionary atoms [mazelet2026learning], and an anatomical space inferred for [gramfort2015fast, bazeille2019local]. Templates learned for a label appear in [vincentcuaz2022template, zhang2024wasserstein, chen2020optimal, mialon2021otke, naderializadeh2021pswe], and with the unaligned mode on the output side in [brogatmotte2022learning]. None of these was applied to medical images.

**Transport coupling.** Gromov-Wasserstein compares spaces with no common coordinates [memoli2011gromov], and fused and unbalanced forms add features and mass relaxation [vayer2019optimal, sejourne2021unbalanced, chizat2018scaling]. Pairwise transport kernels and distances feed a separate predictor [togninalli2019wasserstein, kolouri2016sliced, meunier2022distribution, su2015shape]. Within one patient, transport couples views or sequences [gong2026robust], and between lesion sets it matches time points under registration guidance [qahqaie2026unbalanced]. Between subjects' own geometries, the coupling replaces surface registration in the individual-mesh experiment of [thual2022aligning], with no outcome.

**Permutation invariance.** Sum, max and attention pooling make an encoder indifferent to element order [zaheer2017deepsets, qi2017pointnet, lee2019settransformer, ilse2018attention, murphy2019janossy]. The cost is stated: exactness needs latent width growing with set size [wagstaff2019limitations, wagstaff2022universal, wang2024polynomial], sum and max pooling are not injective in general [amir2025fsw], and reintroducing position raised AUC in TransMIL [shao2021transmil]. Transport pooling places set pooling and transport on one axis [xu2023rotp, naderializadeh2021pswe, mialon2021otke, tian2026roam]. In medical imaging, invariant encoders predict outcomes from lesion sets [chen2021aminn, chen2022injective, alberb2026automated, thiery2023dlbcl, zhang2025lamp, prabhakar2023selfpruning] and from anatomical point clouds [gutierrezbecker2021discriminative, chen2022tracts, beetz2023mi]. Region sets with named organs take their correspondence from segmentation labels [bae2024hognet].

#### By how the outcome enters the objective

**End to end.** In tensor models the outcome enters N-PLS, HOPLS and tensor regression directly [bro1996multiway, zhao2013hopls, zhou2013tensor, lock2018tensor]. The supervised PARAFAC2 models add a classification or Cox loss to the factorization [ren2023multipar, konyar2025semisupervised, patalano2026par2cox], and a joint tensor-survival model reports gains over a two-stage approach [alam2026joint]. For transport templates, the label trains the templates in TFGW, OT-GNN, the supervised OTKE and PSWE [vincentcuaz2022template, chen2020optimal, mialon2021otke, naderializadeh2021pswe]. Of these, only OTKE passes the coupling itself to the predictor as aggregation weights; TFGW and OT-GNN pass distance values, and OT-GNN holds the plan fixed in backpropagation. In medical imaging, the lesion-set and point-cloud encoders train on the outcome [chen2021aminn, chen2022injective, thiery2023dlbcl, zhang2025lamp, gutierrezbecker2021discriminative, chen2022tracts, alberb2026automated], as does the within-patient transport fusion [gong2026robust]. Their inputs come from segmentation and radiomics stages the outcome does not train [chen2021aminn, beetz2023mi].

**Two-stage.** An unsupervised factorization followed by a predictor is the pattern of LogPar [yin2020logpar], which PAR2COX describes as the earlier PARAFAC2 phenotyping. Transport kernels and fixed-reference embeddings feed separate classifiers [vayer2019optimal, togninalli2019wasserstein, kolouri2021wasserstein, wang2025linearized, su2015shape]. Mahan et al. alternate map and classifier epochs, so the label does not train the maps [mahan2024point]. In neuroimaging, the fMRI dictionary is learned by reconstruction and an SVM is trained afterwards [mazelet2026learning], remapped connectomes feed a separate predictive model [dadashkarimi2023carot], and BrainPICM trains its head on a frozen self-supervised encoder [chen2026brainpicm]. Radiomics outcome models are two-stage by construction [aerts2014decoding, gillies2016radiomics].

**Covariates in a generative model.** SupCP and the generalized decomposition with features let covariates inform the latent scores, with no prediction loss [lock2018supervised, hu2022generalized].

**Unsupervised only.** The PARAFAC2 fitting line, the barycenter and dictionary line and the brain-alignment methods train no outcome model [kiers1999parafac2, schmitz2018wasserstein, thual2022aligning, bazeille2019local, gramfort2015fast, gachon2025low].

#### By pipeline step removed or relied on

**Registration.** Removing it at inference cost accuracy in the one direct measurement: AUC 0.632 with plain supervision on unregistered CTA, against 0.8785 for a registered teacher. A distilled student recovered 0.8098 [dong2024selfsupervised]. Permutation-invariant lesion-set models avoid cross-patient registration [chen2021aminn, chen2022injective, thiery2023dlbcl, zhang2025lamp]. Anatomical point-cloud models avoid deformable registration but keep a rigid or atlas frame [gutierrezbecker2021discriminative, chen2022tracts, prabhakar2023selfpruning]. Transport removes inter-subject surface registration in one experiment [thual2022aligning] and template projection in one preprint [mazelet2026learning], and both keep FreeSurfer surfaces or a template geometry. Inter-view and inter-sequence registration are removed within a patient [carneiro2017automated, gong2026robust]. Registration also changes radiomics: 32.4 percent of features were repeatable at best across 20 registration approaches [shiri2020repeatability].

**Lesion segmentation.** Every included lesion-set, organ-set and anatomical point-cloud outcome method relies on segmentation [chen2021aminn, chen2022injective, alberb2026automated, thiery2023dlbcl, zhang2025lamp, prabhakar2023selfpruning, bae2024hognet, beetz2023mi, gutierrezbecker2021discriminative, chen2022tracts]. Mammogram fusion relies on lesion maps and loses accuracy when they are automated [carneiro2017automated]. The segmentation step is variable: inter-rater Dice of 74 to 85 percent [menze2015brats], and classification accuracy varying from 77 to 84 percent across segmentation methods [poirot2022robustness]. The segmentation methods are U-Net, DeepMedic-style networks and nnU-Net [ronneberger2015unet, kamnitsas2017efficient, isensee2021nnunet]. MIL in pathology removes pixel-level annotation, a different step from lesion segmentation [campanella2019clinical, lu2021clam].

**Radiomics.** The lesion-set encoders of liver, lung and head-and-neck cancer and of lymphoma consume radiomic features [chen2021aminn, chen2022injective, alberb2026automated, thiery2023dlbcl]. Radiomics is defined, standardized and implemented in [lambin2012radiomics, zwanenburg2020ibsi, vangriethuysen2017computational], and its reproducibility depends on acquisition, preprocessing and software [traverso2018repeatability]. The transport, tensor and set-encoder methods outside medical imaging neither use nor remove radiomics.

#### By sub-question, across the themes

- **SQ1.** Theme 1 answers with shared structure (PARAFAC2) or a shared coordinate (shift, continuous domain), and registration in imaging. Theme 2 answers with couplings, fixed references and templates learned by reconstruction or, outside medicine, for a label. Theme 3 answers with permutation invariance, with transport pooling as the bridge to theme 2. Theme 4 answers with registration and atlases, transport on normalized or template geometries, and invariant encoders on segmented lesions.
- **SQ2.** Stated end-to-end supervision with an unaligned mode occurs in supervised PARAFAC2 (time mode), supervised transport templates (graphs, sequences, molecules) and lesion-set or point-cloud encoders (medical). Two-stage use is the rule for transport in neuroimaging [mazelet2026learning, dadashkarimi2023carot, chen2026brainpicm, su2015shape].
- **SQ3.** Registration is removed or reduced in theme 3 and 4 applications. Segmentation is relied on by every medical outcome method included, and radiomics by four.
- **SQ4.** Medical imaging appears in theme 1 only on registered images or a common parcellation, in theme 2 in FUGW, the fMRI dictionary and LOT on cell microscopy, and in themes 3 and 4 on lesion sets, organ sets, tract and structure point clouds and pathology tiles. Patient-level point clouds of cells appear in clinical cytometry outside imaging [mahan2024point, wang2025linearized, gachon2025low].

### Identified Gaps

Each gap names the searches that support it and claims no more than that they returned no such work.

1. **A transport template or barycenter learned jointly with a subject-level outcome on medical data.** Templates trained on a label exist for graphs, sequences and molecules [vincentcuaz2022template, mialon2021otke, chen2020optimal, naderializadeh2021pswe]. In medical imaging, transport templates are learned by reconstruction and used in two stages [mazelet2026learning], or fixed [thual2022aligning, chen2026brainpicm]. Searches that returned no such work: theme 2 query 11 (0 hits) and its layer 4 queries; theme 3 q7, q9 and PSWE forward tracking (26 works); theme 4 P1, P5, A3, A4, F2 to F4 and O4; merge M1, M3 (1 hit, `mazelet2026learning`), M5 and M9.
2. **A supervised multilinear method whose unaligned mode is a spatial set.** Supervised PARAFAC2 models keep a shared cross-product on a time mode [ren2023multipar, patalano2026par2cox], and the closest unaligned decomposition needs a shared continuous domain [tang2026unaligned]. Theme 1 queries 15, 16, 18, 23, 26, 28, 29, 34, 35, 51 and 52, and merge M8, returned none.
3. **A coupling between patients' lesion sets used for outcome prediction, or a coupling passed into the predictor in medical imaging.** The included coupling between lesion sets matches time points of one patient with registration guidance [qahqaie2026unbalanced]. OTKE passes the plan to the predictor outside medicine [mialon2021otke]. Theme 4 P1, A3, O4 and W1, theme 2's search of template methods, and merge M9 (1 hit, the same Qahqaie paper) returned none.
4. **A comparison, on the same subjects and outcome, of a registration-free set model with a registration-based pipeline.** The one measurement compares a registered teacher with unregistered students on CTA images [dong2024selfsupervised]. The anatomical point-cloud papers compare with BrainPrint or with volume and ejection fraction [gutierrezbecker2021discriminative, beetz2023mi]. Theme 3 reports none among its screened works, and theme 4 P7 and P7b surfaced none.
5. **An outcome model on lesion sets that does not depend on a lesion segmentation step.** Every included lesion-set, organ-set and point-cloud outcome method relies on segmentation, and four on radiomics (see "By pipeline step"). Theme 4 P2, P3, P4 and P7b and theme 3 q8 and q9 returned none, and the segmentation variability is measured [poirot2022robustness, menze2015brats].

### Recommended Sources by Paper Section

| Section | Key Sources |
|---|---|
| Introduction | lambin2012radiomics, aerts2014decoding, gillies2016radiomics, lambin2017radiomics, avants2008syn, balakrishnan2019voxelmorph, traverso2018repeatability, shiri2020repeatability, poirot2022robustness, menze2015brats, dong2024selfsupervised, campanella2019clinical, thiery2023dlbcl, zhou2013tensor |
| Related work: tensor methods | wold1987multiway, bro1996multiway, zhao2013hopls, park2026sparsehopls, zhou2013tensor, guhaniyogi2017bayesian, li2018tucker, lock2018tensor, huang2026shift, sprangers2023group, harshman1972parafac2, kiers1999parafac2, bro1999parafac2, perros2017spartan, afshar2018copa, cohen2018nonnegative, roald2022aoadmm, yin2020logpar, tang2026unaligned, morup2008shift, lock2018supervised, hu2022generalized, ren2023multipar, konyar2025semisupervised, patalano2026par2cox, alam2026joint, acar2011allatonce, schenker2025parafac2cmtf, kolda2009tensor, carroll1970analysis |
| Related work: transport | cuturi2013sinkhorn, peyre2019computational, chizat2018scaling, feydy2019interpolating, memoli2011gromov, vayer2019optimal, sejourne2021unbalanced, thual2022aligning, vincentcuaz2022semirelaxed, agueh2011barycenters, cuturi2014fast, benamou2015iterative, peyre2016gromov, brogatmotte2022learning, rolet2016fast, schmitz2018wasserstein, xu2020gromov, vincentcuaz2021online, vincentcuaz2022template, zhang2024wasserstein, mazelet2026learning, huang2016supervised, kolouri2016sliced, wang2013linear, moosmuller2023linear, togninalli2019wasserstein, mialon2021otke, kolouri2021wasserstein, chen2020optimal, meunier2022distribution, mahan2024point, wang2025linearized, bachoc2023gaussian, gachon2025low, chen2026brainpicm |
| Related work: set encoders | zaheer2017deepsets, murphy2019janossy, wagstaff2019limitations, wagstaff2022universal, zhang2020fspool, wang2024polynomial, vinyals2016order, lee2019settransformer, kim2021transformers, qi2017pointnet, qi2017pointnetpp, wang2019dgcnn, thomas2019kpconv, prokudin2019bps, zhao2021pointtransformer, dietterich1997multiple, ilse2018attention, wang2018revisiting, lu2021clam, shao2021transmil, naderializadeh2021pswe, xu2023rotp, amir2025fsw, tian2026roam |
| Related work: medical applications | dalca2019learning, rakic2026atlasmorph, feydy2017optimal, shen2021accurate, gramfort2015fast, su2015shape, carneiro2017automated, bazeille2019local, dadashkarimi2023carot, gong2026robust, qahqaie2026unbalanced, chen2021aminn, chen2022injective, alberb2026automated, gutierrezbecker2021discriminative, chen2022tracts, beetz2023mi, zhang2025lamp, prabhakar2023selfpruning, bae2024hognet |
| Methods (components and baselines) | eisenberger2022unified, scetbon2022linear, vincentcuaz2022template, mialon2021otke, naderializadeh2021pswe, lee2019settransformer, ilse2018attention, qi2017pointnet, chen2021aminn, chen2022injective, isensee2021nnunet, vangriethuysen2017computational, zwanenburg2020ibsi, ronneberger2015unet, kamnitsas2017efficient |
| Discussion | wagstaff2019limitations, amir2025fsw, shao2021transmil, dong2024selfsupervised, thual2022aligning, mazelet2026learning, chen2026brainpicm, prabhakar2023selfpruning, gutierrezbecker2021discriminative, chen2022tracts, poirot2022robustness, lambin2017radiomics, traverso2018repeatability, wang2025linearized |

### Quality Gates

Computed over the 129 included works. The counts come from `refs.bib` and from the matrix above.

| Check | Pass criterion | Observed | Result |
|---|---|---|---|
| Search strategy documented | Databases, strings and criteria recorded | Recorded per run above | Pass |
| Source count | At least 20 (IMRaD) | 129 | Pass |
| Annotated bibliography complete | Every included source annotated | 129 of 129 | Pass |
| Literature matrix coverage | Every theme at least 3 sources | Theme 1: 30, theme 2: 49, theme 3: 39, theme 4: 50 | Pass |
| Research gaps | At least 2 specific gaps | 5 | Pass |
| Peer-reviewed share | At least 70 percent | Neutral: 120/129 (93.0 percent), the 9 others arXiv preprints. Under `cs_ml`, 129/129 | Pass |
| Currency | At least 50 percent published in the last 5 years (2022 to 2026) | 45/129 (34.9 percent) | Fail |

**Currency, failure handling and result.** Before the merge run's search the merged set held 40 of 124 works from 2022 to 2026 (32.3 percent). The page's strategy for insufficient currency was applied: a specialised search for 2024 to 2026 (queries M1 to M11 and W-M1 to W-M3 above), with preprints admitted and tagged. It added five sources, each confirmed by a live lookup: `gachon2025low`, `bae2024hognet`, `alberb2026automated`, `tian2026roam` and `chen2026brainpicm`. The result is 45/129 (34.9 percent), and the gate still fails. The merged set holds 42 foundational works from before 2022 that the theme briefs named and that the merge must keep. Without them, the share is 45 of 87 (51.7 percent).

The search returned 102 records in its window, and 10 of its 15 candidates failed screening for the reasons listed under "Excluded in the merge run's currency search". The searches found no further recent work that passes the relevance and methodology gates. Passing the gate would take at least 39 more included sources from 2022 to 2026, since (45 + a)/(129 + a) reaches 0.5 at a = 39. The searches run found no such number of in-scope works. The page's next strategy, a further search, was run once in two rounds, and the gate result is recorded as a fail.

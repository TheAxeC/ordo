# Literature review: supervised prediction from data whose spatial mode is not aligned across subjects

## Literature Search Report

### Search Strategy

#### Review design and question

Review design: a structured narrative review with a documented search (databases, query strings, criteria and the count at each stage), as the row Review design of `settings.md` records. Inclusion window: foundational works from any year and a search over 2013 to 2026. Domain evidence profile: `cs_ml`. DOI checking: strict. This report merges four theme runs (`theme-report-1.md` to `theme-report-4.md`) and adds the merge searches, the assessment of the sources the theme runs handed on, one backward and one forward citation round, and a search of the recent literature for the currency gate.

Research question: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

- P1: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions)?
- P2: How does each of these methods handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance)?
- P3: Where does each of these methods remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

The annotation fields that answer the parts are used word for word: Prediction setting (P1), Correspondence handling (P2), Pipeline relation (P3) and Application domain. The literature matrix takes its columns P1, P2, Registration, Radiomics and Lesion seg from them.

#### Databases

- Queried by the merge: OpenAlex (the API with a key; topic searches, referenced and citing works of the citation rounds, title lookups, abstracts), PubMed through the NCBI E-utilities (topic searches, PMID and DOI lookups), Crossref (the IPMI proceedings search, the metadata of each added DOI), Semantic Scholar (the Graph API with a key; batch lookups of abstracts, venues and identifiers, and two title searches for unconfirmed works), arXiv (the export API and abstract pages for every arXiv identifier), the doi.org handle API (resolution of every added DOI), PMLR and the ETH Zurich Research Collection (the proceedings page and repository record of one MIDL paper), DataCite (the record of one repository DOI), and, for the records whose abstract no index gave, Europe PMC (title search), the doi.org landing pages, the Springer chapter and article pages, the MICCAI 2023 and 2025 paper lists, the CVF open-access list of ICCV 2025, the NeurIPS 2021 proceedings, an author copy on a university page, the University of Copenhagen research portal and a web search (rows A-EPMC to A-KU).
- Not reached: DBLP, whose API returned a bot challenge page in place of results. Venue names for proceedings papers were taken from Semantic Scholar and Crossref in its place.
- Also not reached: the Elsevier article API (HTTP 400, since no key was held), ScienceDirect, SSRN and the ACM Digital Library (HTTP 403), OpenReview (a challenge page), IEEE Xplore pages (HTTP 202 with no content), CORE (HTTP 403, and HTTP 429 from its API) and the Rome chemometrics group page (connection refused).
- Named in `settings.md` and not queried by the merge: Google Scholar, which has no API, and IEEE Xplore, whose API needs a key the run was not given. IEEE journals and proceedings were reached through their Crossref and OpenAlex records. The theme runs record their own databases in their files.

#### Queries run by the merge

Each count is the count the tool returned. "In set" is the number of returned records already included, "Abstract" the number read at the abstract stage, "Included" the number included. Records returned by more than one query are counted under each query. OpenAlex queries use the filter `title_and_abstract.search`; the R queries add `from_publication_date:2024-01-01`.

| ID | Tool | Date | Query | Returned | In set | Abstract | Included |
|---|---|---|---|---|---|---|---|
| M1a | OpenAlex | 2026-11-19 | `"tensor regression" "optimal transport"`, from 2013-01-01 | 0 | 0 | 0 | 0 |
| M1b | OpenAlex | 2026-11-19 | `PARAFAC2 ("optimal transport" OR Wasserstein)`, from 2013-01-01 | 0 | 0 | 0 | 0 |
| M1c | OpenAlex | 2026-11-19 | `("tensor decomposition" OR "tensor factorization") Wasserstein alignment`, from 2013-01-01 | 2 | 0 | 0 | 0 |
| M1r | OpenAlex | 2026-11-19 | `tensor ("optimal transport" OR Wasserstein) (regression OR classification OR decomposition)`, from 2013-01-01 | 71 | 1 | 0 | 0 |
| M2a | OpenAlex | 2026-11-19 | `"sliced Wasserstein" (pooling OR embedding) (set OR "point cloud")`, from 2013-01-01 | 19 | 0 | 0 | 0 |
| M2b | OpenAlex | 2026-11-19 | `"optimal transport" pooling ("point cloud" OR "multiple instance")`, from 2013-01-01 | 5 | 0 | 0 | 0 |
| M2r | OpenAlex | 2026-11-19 | `("sliced Wasserstein" OR "optimal transport") (set OR "point cloud" OR "multiset") (embedding OR pooling OR representation) classification`, from 2013-01-01 | 77 | 3 | 5 | 4 |
| M3a | OpenAlex | 2026-11-19 | `"optimal transport" ("without registration" OR "registration-free") (classification OR prediction)`, from 2013-01-01 | 1 | 0 | 0 | 0 |
| M3b | OpenAlex | 2026-11-19 | `("set transformer" OR "deep sets" OR "permutation invariant") ("without segmentation" OR "segmentation-free") (patient OR subject)`, from 2013-01-01 | 0 | 0 | 0 | 0 |
| M3r | OpenAlex | 2026-11-19 | `("optimal transport" OR Wasserstein OR "point cloud" OR "set transformer" OR "multiple instance") (registration OR segmentation) (patient OR subject) prediction MRI`, from 2013-01-01 | 12 | 1 | 0 | 0 |
| M4a | OpenAlex | 2026-11-19 | `(PARAFAC2 OR "tensor decomposition") (unregistered OR misaligned OR "without registration") (MRI OR imaging)`, from 2013-01-01 | 0 | 0 | 0 | 0 |
| M4r | OpenAlex | 2026-11-19 | `(PARAFAC2 OR "tensor decomposition" OR "tensor regression") (registration OR alignment OR misalignment) (MRI OR imaging OR neuroimaging)`, from 2013-01-01 | 24 | 1 | 0 | 0 |
| M5a | OpenAlex | 2026-11-19 | `("multiple lesions" OR "set of lesions" OR "multiple nodules" OR "multiple metastases") ("multiple instance" OR "set transformer" OR "deep sets" OR "permutation invariant")`, from 2013-01-01 | 2 | 1 | 0 | 0 |
| M5r | OpenAlex | 2026-11-19 | `(lesions OR nodules OR metastases) ("multiple instance learning" OR "set transformer" OR "deep sets" OR "permutation invariant") patient-level`, from 2013-01-01 | 70 | 8 | 0 | 0 |
| N1r | OpenAlex | 2026-11-19 | `(lesions OR nodules OR metastases) ("multiple instance learning" OR "weakly supervised") ("without segmentation" OR "segmentation-free" OR "no segmentation" OR "detection-free") patient`, from 2013-01-01 | 2 | 0 | 2 | 2 |
| N2a | OpenAlex | 2026-11-19 | `("registration-free" OR "without registration") (versus OR compared) registration (classification OR prediction) MRI`, from 2013-01-01 | 4 | 0 | 1 | 1 |
| N2r | OpenAlex | 2026-11-19 | `("registration-free" OR "without registration" OR "native space") (registered OR registration OR normalization) (classification OR prediction OR diagnosis) (MRI OR PET OR CT)`, from 2013-01-01 | 55 | 0 | 2 | 2 |
| N4a | OpenAlex | 2026-11-19 | `"Gromov-Wasserstein" (medical OR MRI OR CT OR brain OR patient) (classification OR prediction)`, from 2013-01-01 | 10 | 1 | 0 | 0 |
| N4r | OpenAlex | 2026-11-19 | `("Gromov-Wasserstein" OR "optimal transport") (non-convex OR nonconvex OR "local minima") (medical OR brain OR clinical)`, from 2013-01-01 | 6 | 1 | 0 | 0 |
| P1 | PubMed E-utilities | 2026-11-19 | `("multiple instance learning"[Title/Abstract] OR "weakly supervised"[Title/Abstract]) AND ("without segmentation"[Title/Abstract] OR "segmentation-free"[Title/Abstract] OR "no segmentation"[Title/Abstract] OR "annotation-free"[Title/Abstract]) AND ("lesion*"[Title/Abstract] OR "tumor*"[Title/Abstract] OR "tumour*"[Title/Abstract]) AND 2013/01/01:2026/12/31[Date - Publication]` | 8 | 0 | 2 | 1 |
| P2 | PubMed E-utilities | 2026-11-19 | `("registration-free"[Title/Abstract] OR "native space"[Title/Abstract]) AND ("classification"[Title/Abstract] OR "prediction"[Title/Abstract]) AND ("MRI"[Title/Abstract] OR "PET"[Title/Abstract]) AND 2013/01/01:2026/12/31[Date - Publication]` | 13 | 0 | 2 | 2 |
| P3 | PubMed E-utilities | 2026-11-19 | `("optimal transport"[Title/Abstract] OR "Wasserstein"[Title/Abstract]) AND ("MRI"[Title/Abstract] OR "CT"[Title/Abstract] OR "PET"[Title/Abstract]) AND ("classification"[Title/Abstract] OR "prediction"[Title/Abstract] OR "prognosis"[Title/Abstract]) AND 2013/01/01:2026/12/31[Date - Publication]` | 35 | 2 | 4 | 2 |
| P4 | PubMed E-utilities | 2026-11-19 | `"point cloud"[Title/Abstract] AND ("registration"[Title/Abstract] OR "segmentation"[Title/Abstract]) AND ("prediction"[Title/Abstract] OR "classification"[Title/Abstract]) AND ("patient*"[Title/Abstract] OR "subject*"[Title/Abstract]) AND ("outcome"[Title/Abstract] OR "diagnosis"[Title/Abstract] OR "disease"[Title/Abstract]) AND 2013/01/01:2026/12/31[Date - Publication]` | 5 | 1 | 1 | 1 |
| P5 | PubMed E-utilities | 2026-11-19 | `("lesions"[Title/Abstract] OR "nodules"[Title/Abstract] OR "metastases"[Title/Abstract]) AND ("multiple instance learning"[Title/Abstract] OR "set transformer"[Title/Abstract] OR "permutation invariant"[Title/Abstract] OR "deep sets"[Title/Abstract]) AND ("patient-level"[Title/Abstract] OR "patient-level"[Title/Abstract]) AND 2013/01/01:2026/12/31[Date - Publication]` | 11 | 1 | 0 | 0 |
| IPMI | Crossref | 2026-11-19 | `filter=container-title:Information Processing in Medical Imaging,from-pub-date:2013-01-01,until-pub-date:2025-12-31` | 421 | 0 | 17 | 9 |
| R1 | OpenAlex | 2026-11-20 | `("point cloud" OR "permutation invariant" OR "set transformer" OR "deep sets") (patient OR patients OR subjects) (MRI OR CT OR PET) (classification OR prediction OR prognosis)`, from 2024-01-01 | 36 | 2 | 8 | 1 |
| R2 | OpenAlex | 2026-11-20 | `("optimal transport" OR Wasserstein OR "Gromov-Wasserstein") (patients OR subjects) (MRI OR CT OR PET OR "point cloud" OR shape) (classification OR prediction OR diagnosis)`, from 2024-01-01 | 42 | 0 | 7 | 3 |
| R3 | OpenAlex | 2026-11-20 | `("segmentation variability" OR "contour variability" OR "delineation variability" OR "registration error" OR "registration accuracy") (radiomics OR "deep learning") ("model performance" OR AUC OR "C-index" OR prognostic)`, from 2024-01-01 | 30 | 2 | 6 | 4 |
| R4 | OpenAlex | 2026-11-20 | `"multiple instance learning" (lesions OR nodules OR metastases OR "lymph nodes") (CT OR MRI OR PET) (patient-level OR "patient level")`, from 2024-01-01 | 13 | 1 | 4 | 1 |
| R4r | OpenAlex | 2026-11-20 | `"multiple instance learning" (lesions OR nodules OR metastases OR "lymph nodes") (CT OR MRI OR PET)`, from 2024-01-01 | 37 | 1 | 5 | 2 |
| T-SDS | OpenAlex | 2026-11-19 | `display_name.search:Stacking Deep Set Networks and Pooling by Quantiles` | 0 | 0 | 0 | 0 |
| T-SDS2 | Semantic Scholar | 2026-11-19 | `paper/search?query=Stacking Deep Set Networks and Pooling by Quantiles` | 2 | 0 | 1 | 0 |
| T-MOTOR | OpenAlex | 2026-11-19 | `display_name.search:MOTOR optimal transport survival multimodal` | 0 | 0 | 0 | 0 |
| T-MOTOR2 | Semantic Scholar | 2026-11-19 | `paper/search?query=MOTOR multimodal optimal transport survival MICCAI 2025` | 2 | 0 | 0 | 0 |
| T-HPO | OpenAlex | 2026-11-19 | `display_name.search:Histogram Pooling Operators Deep Sets` | 0 | 0 | 0 | 0 |
| T-PSWE | OpenAlex | 2026-11-19 | `display_name.search:Pooling by Sliced-Wasserstein Embedding` | 1 | 1 | 0 | 0 |
| T-HPO2 | arXiv API | 2026-11-20 | `ti:"Histogram Pooling"` | 0 | 0 | 0 | 0 |
| T-HPO3 | Semantic Scholar | 2026-11-20 | `paper/search?query=Histogram Pooling Operators Interpretable Alternative Deep Sets` | 81 | 0 | 0 | 0 |
| A-EPMC | Europe PMC | 2026-11-20 | exact title of each of the 23 records whose abstract no index gave | 2 | 0 | 0 | 0 |
| A-ARX | arXiv API | 2026-11-20 | `ti:` exact title of each of the 23 records | 2 | 0 | 0 | 0 |
| A-PM | PubMed E-utilities | 2026-11-20 | `efetch` of PMID 34049061 and 28410487, and `esearch` `SCREAM[Title] AND multi-way regression` | 2 and 0 | 0 | 2 | 0 |
| A-DOI | doi.org landing pages | 2026-11-20 | `https://doi.org/<doi>` for each of the 22 records with a DOI, and the OpenReview page of number 135 (Springer and OpenReview returned a challenge page, Elsevier a redirect page, IEEE HTTP 202 with no content, SSRN HTTP 403) | 23 | 0 | 0 | 0 |
| A-SPR | Springer pages | 2026-11-20 | the `link` URL of the Crossref record of each Springer DOI | 14 | 0 | 14 | 11 |
| A-CR | Crossref | 2026-11-20 | `abstract` field of the record of each DOI | 1 | 0 | 1 | 1 |
| A-MICCAI | MICCAI paper lists | 2026-11-20 | papers.miccai.org (MICCAI 2025) and conferences.miccai.org (MICCAI 2023), searched by title | 4 | 0 | 1 | 0 |
| A-CVF | CVF open access | 2026-11-20 | openaccess.thecvf.com ICCV 2025 list, searched by title | 1 | 0 | 1 | 1 |
| A-NIPS | NeurIPS proceedings | 2026-11-20 | proceedings.neurips.cc 2021 list, searched by title | 1 | 0 | 1 | 1 |
| A-AUTH | author page | 2026-11-20 | web.engr.oregonstate.edu author copy of Dietterich et al. (1997) | 1 | 0 | 1 | 1 |
| A-ELS | Elsevier API and ScienceDirect | 2026-11-20 | `api.elsevier.com/content/article/doi/<doi>` for the five Elsevier records (HTTP 400, no key held) and the ScienceDirect abstract page of SCREAM (HTTP 403) | 0 | 0 | 0 | 0 |
| A-WEB | web search | 2026-11-20 | the exact title of SCREAM, of the Engineering Applications of AI paper and of the Information Fusion paper | 10, 10 and 10 results | 0 | 0 | 0 |
| A-KU | repository pages | 2026-11-20 | University of Copenhagen research portal, CORE and AMiner pages for SCREAM | 3 | 0 | 0 | 0 |

The work [tang2026metabolic], returned by R2 and by P3, is counted as included under P3, where it was decided.

The rows A-EPMC to A-KU are the routes outside the indexes, tried for the 23 records that had been excluded because no index gave an abstract (handed-on numbers 23, 48, 135, 137, 148, 156, 243, 292, 299, 303 and 310, IPMI records I186, I188, I312 and I313, and the citation-round and recent records listed under Excluded and Dropped Sources), and for handed-on number 311. Their column Abstract counts the abstracts read through the route and Included the sources included on what was read there. A source counted under one route is not counted again under another. Each record was then decided through the decision tree and the quick assessment, and the decision is recorded with the record: 15 were included, and 3 (handed-on number 48 and the two Elsevier journal papers of 2026) remain without any abstract or text that could be read.

Query R4 returned fewer than 20 records, so it was relaxed to R4r, which holds all 13 records of R4. The intersection queries M1a, M1b, M3b and M4a returned no record and were relaxed to M1r, M3r and M4r. The M queries join the themes the research question joins (tensor models with transport, set encoders with transport, transport or set models with the imaging pipelines, tensor models with registration, set encoders with lesions), and the N and P queries search for the studies the gaps need (segmentation-free lesion-set prediction, registered against registration-free comparisons, Gromov-Wasserstein non-convexity in medical prediction, point clouds after segmentation or registration).

#### Citation rounds

- Merged core set they chained from: the 247 sources included when the rounds ran (106 from the theme runs, 125 handed on and included, 16 from the merge searches and the IPMI search), of which 245 have an OpenAlex record. The forward round also chained from the 14 sources the backward round had included when the forward round ran, 259 works in all.
- Backward round (OpenAlex `referenced_works`, 2026-11-20): 9002 distinct cited works outside the set. Cited by 2 or more included sources: 1567; by 3 or more: 620; by 4 or more: 323. The 620 works cited by 3 or more included sources were screened on title, 16 were read at the abstract stage and 16 were included.
- Forward round (OpenAlex `cites:` filter with `from_publication_date:2024-01-01`, the last three years, 2026-11-20): 53455 distinct citing works, 53396 outside the set. Citing 3 or more included sources: 4811; 4 or more: 1465; 5 or more: 448. With 4 or more above 500 records, the threshold was 5 or more: 448 works screened on title, 31 read at the abstract stage, 19 included.
- Citation loop: it does not close. The two rounds found 35 cited or citing works that were not yet collected and that pass the criteria, and they were added. The theme runs report their own loops in their files (Theme 1 reports its loop closed over its 6 core papers).

#### Inclusion and exclusion criteria and the decision tree

- Include: journal articles, conference proceedings and archival preprints (flagged) in English, 2013 to 2026, or a foundational work cited more than 100 times before 2013, whose abstract addresses at least one part of the research question: a subject-level (or other unit-level) prediction from data without a shared spatial grid, a way of handling the missing correspondence, or a registration, radiomics or lesion segmentation step that a method removes, builds on, or whose failure it measures.
- Exclude: a source with no subject-level structure (within-subject decoding, single-image tasks whose bag is the patches or slices of one volume), a work whose abstract or text could not be read by any route tried (the indexes, the publisher landing page, the proceedings page, Europe PMC, PubMed, arXiv, a repository copy and a web search), since its annotation could state nothing, a meeting abstract, a review where its primary studies are included, a data deposit, a tool or dataset paper with no study, a source covered by an included version or companion of the same group and task, a predatory or unidentifiable venue, and any source that could not be confirmed by a live lookup.
- The screening decision tree of the page runs under `cs_ml`: an archival preprint or a proceedings paper passes the node on peer review and goes on through the relevance and methodology nodes; the seminal-work path admits works before 2013 cited more than 100 times.
- Every source the merge adds is confirmed by a live lookup: Crossref and the doi.org handle API for each DOI, the arXiv abstract page for each arXiv identifier, the PubMed record for each PMID, and the official proceedings page for a paper with neither. The quick assessment (five items, 1 to 3 points each; 12 or more High, 8 to 11 Acceptable, 7 or less Marginal) is in each annotation.

#### Titles and venues decided for refs.bib

The identifier check in `checks.md` printed six titles that differ from their entries, and the merge review found a seventh. Each is resolved as follows.

- [kiers1999parafac2]: the Crossref title "PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model" is kept, with the em dash of the record after "PARAFAC2" written as the LaTeX dash in `refs.bib`; the OpenAlex ratio of 0.99 comes from OpenAlex writing that dash as a spaced hyphen.
- [peyre2019computational]: the title of the version of record in Foundations and Trends in Machine Learning, "Computational Optimal Transport with Applications to Data Sciences", is kept as Crossref and OpenAlex give it; Semantic Scholar prints the shorter title of the 2018 arXiv version.
- [rioux2024entropic]: the JMLR title "Entropic Gromov-Wasserstein Distances: Stability and Algorithms" is kept, and the article number 363 of volume 25 is added as the field `number`; Semantic Scholar prints the longer title of the arXiv version.
- [cuturi2013sinkhorn]: the NeurIPS 2013 proceedings title "Sinkhorn Distances: Lightspeed Computation of Optimal Transport" is kept; OpenAlex prints the arXiv title, which ends in "Optimal Transportation Distances".
- [mialon2021trainable]: the ICLR 2021 title "A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention" is kept; Semantic Scholar prints the earlier arXiv title "An Optimal Transport Kernel for Feature Aggregation and its Relationship to Attention".
- [lee2019set]: the full ICML 2019 title is kept; Semantic Scholar prints "Set Transformer".
- [afshar2020taste]: the Crossref record of DOI 10.1145/3368555.3384464 deposits the title as "TASTE" and the rest in its subtitle field, "temporal and static tensor factorization for phenotyping electronic health records". The version-of-record title is the two joined, "TASTE: temporal and static tensor factorization for phenotyping electronic health records", which is the title OpenAlex prints, and `refs.bib` now carries it. The ACM Digital Library page returned HTTP 403.

After this correction the title of every added source with a DOI (158 records) equals its Crossref title, or its Crossref title joined with its subtitle, after case and punctuation are removed.

#### Duplicates

No work is kept under two keys: the 106 entries of the four theme files share no DOI, arXiv identifier or normalized title, and no added source repeats an included one (checked over DOI, arXiv identifier and normalized title). No key was folded. Among the merge records, S105 is the arXiv record of the included [vincentcuaz2022template], S330 the conference version of the included journal paper [tu2020computing], and the preprints W4414593707 and W4414077156 are versions of the included [liu2026three].

### Coverage Distribution Advisory

```
DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational = 270/303 (89.1%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: no expansion; user requested this scope (the research question asks which methods predict, so computational studies are the population it names)
```

The computational value counts the matrix Method values Method (184), Benchmark (66) and Application (20); the others are Theory (24), Review (4) and Tool or dataset (5). The other dimensions do not reach 70 percent: time distribution, the 2020s hold 201 of 303 (66.3 percent); venue tier distribution, the largest venue family is arXiv with 15 of 303 and preprints are 25 of 303. The geographic distribution is left out, since a study site or cohort region is stated for 8 of 303 sources only.

### Screening Results

The merge run's own counts, by stream. Phase B was a reading of the abstract and the metadata, with sections of the full text read where an annotation says so.

| Stream | Initial hits | Screened on title | After title and abstract screening (read at the abstract) | Included |
|---|---|---|---|---|
| Sources handed on by the theme runs | 314 | 314 | 314 | 132 |
| Merge searches M, N and P | 381 unique records (18 already in the set) | 363 | 15 | 11 |
| IPMI proceedings search | 421 | 421 | 17 | 9 |
| Backward citation round | 9002 cited works outside the set | 620 | 16 | 16 |
| Forward citation round | 53396 citing works outside the set | 448 | 31 | 19 |
| Recent-literature searches R1 to R4r | 142 unique records (4 already in the set) | 138 | 25 | 10 |

- Sources included from the theme runs: 106 (Theme 1: 22, Theme 2: 34, Theme 3: 24, Theme 4: 26), with no duplicate across them.
- Sources added by the merge: 197 (132 handed on, 20 from the merge and IPMI searches, 16 from the backward round, 19 from the forward round, 10 from the recent-literature searches).
- Unconfirmed, excluded: 1 (listed under Excluded and Dropped Sources). Dropped after annotation: 1.
- Final included sources after duplicates are removed: 303.

Each theme run's counts as its file gives them. They overlap across themes and are not added up.

- Theme 1: "Records retrieved and screened by title: 4870"; "Phase A, title and abstract screening: 75 tagged Include or Maybe"; "Phase B, abstract and full-text assessment: 75 assessed"; "Final included sources: 22."
- Theme 2: "Initial hits of the Layer 1 queries at or below 500 records ... 2339"; "Records screened on title, unique across all layers in the saved outputs: 2460"; "After title and abstract screening (Phase A), tagged Include or Maybe: 84"; "After full-text or abstract assessment (Phase B): 34 retained"; "Final included sources: 34".
- Theme 3: "Records whose title and venue were read at Phase A ...: 3801"; "After title and abstract screening (Phase A, tagged Include or Maybe): 156 candidates"; "Read at Phase B ...: 32"; "Final included sources: 24."
- Theme 4: "Records viewed at Phase A, summed over the queries above: 2773"; "Phase A, title and abstract screening: 121 records tagged Include or Maybe"; "Phase B, full-text assessment: 121 assessed"; "Final included sources: 26."

### Annotated Bibliography

Every included source, in order of citation key. The annotations of the theme runs are kept as their files give them, with the line Theme added. Each source the merge added is marked "added" in its line Theme.

#### Abulnaga, Hoopes, Dey, Hoffmann, Fischl, Guttag and Dalca (2025). MultiMorph: on-demand atlas construction.
- **Citation key**: [abulnaga2025multimorph]
- **Type**: Conference paper (CVPR 2025)
- **Identifier**: DOI 10.1109/CVPR52734.2025.02878, PMID 42004731; confirmed at https://doi.org/10.1109/CVPR52734.2025.02878 (resolves to the IEEE Xplore page) and the PubMed record.
- **Method**: A feedforward model that produces a population-specific atlas in one forward pass for a group of 3D brain images, through a linear group-interaction layer that aggregates and shares features within the group, trained with auxiliary synthetic data.
- **Key Findings**: MultiMorph outperforms optimization-based and learning-based atlas construction in small and large population settings with a 100-fold reduction in time. The abstract states that studies otherwise rely on precomputed atlases from mismatched populations, which harms downstream analyses.
- **Relevance**: The group-interaction layer aggregates over an unordered group of subjects, so the template is a function of a set of images; this is the template side of the research question in its 2025 form.
- **Quality**: Abstract read.
- **Potential Use**: Recent learned-template construction; the set-level aggregation links to Theme 3.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (3D brain MRI); the output is an atlas.
- **Correspondence handling**: learned template or barycenter; the atlas is computed from the group by a network that shares features across the group's images.
- **Pipeline relation**: builds on registration; it removes the precomputed atlas and the per-study optimization.
- **Application domain**: medical imaging, brain MRI, with generalization to new modalities stated in the abstract.
- **Theme tags**: `reg-template`.
- **Theme**: Theme 4

#### Acar, Roald, Hossain, Calhoun and Adali (2022). Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches.
- **Citation key**: [acar2022tracing]
- **Identifier**: DOI 10.3389/fnins.2022.861402, confirmed at https://doi.org/10.3389/fnins.2022.861402 through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (Frontiers in Neuroscience).
- **Method**: PARAFAC2 applied to a subjects by voxels by time windows tensor of fALFF summaries of task fMRI, compared with joint ICA and IVA in simulations and on real data.
- **Key Findings**: The abstract reports that PARAFAC2 gives a compact representation in the subject, time and voxel modes with evolving spatial networks, that joint ICA reveals evolving networks but no temporal patterns, and that a PARAFAC2 component with a significant difference between patients with schizophrenia and healthy controls was found in motor regions, cerebellum and temporal lobe.
- **Relevance**: A neuroimaging use of PARAFAC2 in which the evolving mode is the voxel mode across time windows, and whose subject-mode factor separates patient groups.
- **Quality**: Abstract alone.
- **Potential Use**: PARAFAC2 in neuroimaging; the subject-mode factor as a group-level marker.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input tensor (subjects by voxels by time windows); the group difference is tested on the subject-mode factor after the fit.
- **Correspondence handling**: Registration to a common space; voxels are shared across subjects and the spatial maps evolve across time windows, not across subjects.
- **Pipeline relation**: Builds on registration.
- **Application domain**: Medical imaging, task fMRI of the brain (schizophrenia and controls).
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Adams and Elhabian (2023). Can Point Cloud Networks Learn Statistical Shape Models of Anatomies?
- **Citation key**: [adams2023point]
- **Identifier**: DOI 10.1007/978-3-031-43907-0_47; PMID 39498296. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-43907-0_47.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2023)
- **Method**: Existing point cloud encoder-decoder completion networks are applied to learn statistical shape models from unordered point clouds of anatomies.
- **Key Findings**: The abstract states that these networks capture population-level statistical representations of shapes while reducing the inference burden and relaxing the input requirement of correspondence-based SSM methods, which need complete geometric proxies. It discusses limitations and suggests improvements; it gives no numbers and does not name the datasets.
- **Relevance**: It addresses P2 and P3: permutation-invariant networks replace the correspondence-based construction of shape models from point clouds.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 2, data 1. OpenAlex counts 14 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes without correspondence).
- **Stance**: Supports, point cloud networks as a route to shape models without correspondence-based inputs.
- **Prediction setting**: representation or comparison only, no prediction, input point cloud; the output is a population-level shape model.
- **Correspondence handling**: permutation invariance; the networks learn permutation-invariant features from unordered point clouds in place of correspondence-based SSM generation.
- **Pipeline relation**: removes registration; the correspondence step of correspondence-based SSM generation, which establishes point correspondence across shapes, is replaced by the network.
- **Application domain**: medical imaging, anatomical shapes from thresholded images and surface scanning; the abstract does not name the organ.
- **Theme tags**: T3d, T3b, `step-removal`.
- **Theme**: added: handed on by Theme 4 (Adams Elhabian 2023); merge screening reason: point cloud networks learning statistical shape models without correspondence-based inputs

#### Aerts, Velazquez, Leijenaar, Parmar, Grossmann, Carvalho, Bussink, Monshouwer, Haibe-Kains, Rietveld, Hoebers, Rietbergen, Leemans, Dekker, Quackenbush, Gillies and Lambin (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Citation key**: [aerts2014decoding]
- **Type**: Journal article (Nature Communications)
- **Identifier**: DOI 10.1038/ncomms5006, PMID 24892406; confirmed at https://doi.org/10.1038/ncomms5006 and the PubMed record.
- **Method**: 440 features of tumour intensity, shape and texture extracted from CT of 1,019 patients with lung or head-and-neck cancer; prognostic signature validated on independent data sets; radiogenomic association with gene expression.
- **Key Findings**: Many radiomic features have prognostic power in independent lung and head-and-neck data sets. A prognostic signature capturing intratumour heterogeneity is associated with gene-expression patterns.
- **Relevance**: It is the reference subject-level predictor built on segmentation plus engineered features, the pipeline that segmentation-free and end-to-end methods are compared against.
- **Quality**: Abstract read. Named foundational work.
- **Potential Use**: Baseline radiomics predictor for survival.
- **Viewpoint**: supports radiomics.
- **Prediction setting**: subject-level regression (survival, prognostic signature); image on a grid (CT) restricted to the tumour volume.
- **Correspondence handling**: not applicable; each patient's tumour is summarized by features that do not depend on location, so no spatial correspondence is formed.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation.
- **Application domain**: medical imaging, CT, lung and head-and-neck cancer.
- **Theme tags**: `radiomics`.
- **Theme**: Theme 4

#### Afshar et al. (2020). TASTE: temporal and static tensor factorization for phenotyping electronic health records.
- **Citation key**: [afshar2020taste]
- **Identifier**: DOI 10.1145/3368555.3384464. Confirmed by a live lookup at https://doi.org/10.1145/3368555.3384464.
- **Type**: Conference paper (Proceedings of the ACM Conference on Health, Inference, and Learning)
- **Method**: Temporal And Static TEnsor factorization (TASTE) combines a PARAFAC2 model of a temporal tensor of clinical visits with a non-negative matrix factorization of static patient information, fitted by alternating optimization of reformulated sub-problems.
- **Key Findings**: On large EHR data from a heart failure study, TASTE is up to 14 times faster than several baselines, and a cardiologist judged the extracted phenotypes clinically meaningful. A logistic regression on 60 TASTE phenotypes reaches the same AUC for heart failure prediction as a recurrent neural network using 345 features. The abstract does not state the number of patients.
- **Relevance**: It addresses P1 and P2 for a temporal mode that differs across patients: PARAFAC2 absorbs the longitudinal visits of each patient into shared phenotype factors, which then feed a subject-level prediction.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 46 citations.
- **Potential Use**: Related work (tensor factorization of unaligned modes, PARAFAC2 in EHR)
- **Stance**: Supports, that PARAFAC2 phenotypes from irregular visit data give compact features for a subject-level prediction.
- **Prediction setting**: subject-level classification, input tensor; the phenotypes are used by a logistic regression to predict heart failure per patient.
- **Correspondence handling**: learned template or barycenter; the paper uses a PARAFAC2 model, whose shared phenotype factors are estimated from the data and stand in for a visit-by-visit correspondence across patients, which places it under this category.
- **Pipeline relation**: not applicable; the data are electronic health records, so no registration, radiomics or lesion segmentation step is involved.
- **Application domain**: other domain, electronic health records (heart failure).
- **Theme tags**: T1-UNAL, T1-PLS.
- **Theme**: added: handed on by Theme 1 (TASTE 2020); merge screening reason: PARAFAC2 on irregular EHR visit mode with a downstream subject-level heart-failure prediction

#### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Citation key**: [agueh2011barycenters]
- **Type**: Journal article (SIAM Journal on Mathematical Analysis).
- **Method**: Definition of a barycenter of several measures in Wasserstein space, generalizing McCann's interpolation.
- **Key Findings**: The paper proves existence, uniqueness, characterizations and regularity of the barycenter, relates it to multi-marginal transport, and solves the Gaussian case.
- **Relevance**: The definition of the population template that transport-based averaging and templates compute.
- **Quality**: High. Read: abstract and introduction of the HAL author copy (hal-00637399). Cited 1201 times in OpenAlex on 2026-11-19.
- **Potential Use**: Definition of the Wasserstein barycenter.
- **Identifier**: DOI 10.1137/100805741; https://doi.org/10.1137/100805741 (confirmed).
- **Prediction setting**: Not applicable; theory.
- **Correspondence handling**: Learned template or barycenter.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (mathematical analysis).
- **Theme tags**: T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Ahmadi and Bidabad (2026). Hippocampal surface analysis using discrete Ricci flow and Riemannian metrics for the diagnosis of Alzheimer's disease.
- **Citation key**: [ahmadi2026hippocampal]
- **Identifier**: DOI 10.21203/rs.3.rs-10382441/v1. Confirmed by a live lookup at https://doi.org/10.21203/rs.3.rs-10382441/v1.
- **Type**: Preprint (Research Square). Preprint, not peer-reviewed.
- **Method**: Conformal parameterization of hippocampal surface meshes by discrete Ricci flow, three geometric descriptors summarized as one covariance matrix per subject, and k-nearest-neighbour classification under several metrics on symmetric positive definite matrices.
- **Key Findings**: On ADNI data the affine-invariant Riemannian metric gave the best result, 96 percent accuracy. The abstract compares it with a Wasserstein metric and a log-Euclidean metric on the same descriptors.
- **Relevance**: A subject-level classifier on surfaces whose covariance summary removes the need for vertex correspondence (P1, P2); it builds on hippocampus segmentation (P3).
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 1, data 2. Preprint.
- **Potential Use**: Related work (correspondence-free shape descriptors for subject-level prediction).
- **Stance**: Neutral.
- **Prediction setting**: subject-level classification, input mesh or surface (hippocampal surface per subject); the outcome is AD against control.
- **Correspondence handling**: permutation invariance; the covariance of per-vertex descriptors does not depend on the order or matching of vertices across subjects.
- **Pipeline relation**: builds on lesion segmentation; the surfaces come from a segmentation of the hippocampus, which is a structure segmentation rather than a lesion segmentation, and no registration is described.
- **Application domain**: medical imaging, brain MRI (hippocampus, Alzheimer's disease).
- **Theme tags**: T3d.
- **Theme**: added: merge recent-literature search R2 (2024 to 2026)

#### Altschuler and Boix-Adsera (2022). Wasserstein Barycenters Are NP-Hard to Compute.
- **Citation key**: [altschuler2022wasserstein]
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science).
- **Method**: Complexity theory.
- **Key Findings**: Unless P=NP, no algorithm computes Wasserstein barycenters in time polynomial in the dimension, a curse of dimensionality that OT itself does not have. The hardness extends to approximate computation and to other transport metrics. The introduction states that barycenters can be computed in polynomial time in any fixed dimension, and that fixed-support approximations, which guess a support set and optimize the weights, require time exponential in the dimension.
- **Relevance**: Bounds what an exact transport template can cost, which is why every method of the theme uses entropic, fixed-support or learned surrogates.
- **Quality**: High. Read: abstract and introduction of the arXiv full text (arXiv 2101.01100). Cited 88 times in OpenAlex on 2026-11-19.
- **Potential Use**: Failure analysis of barycenters.
- **Identifier**: DOI 10.1137/21M1390062; arXiv 2101.01100; https://doi.org/10.1137/21M1390062 (confirmed).
- **Prediction setting**: Not applicable; theory.
- **Correspondence handling**: Learned template or barycenter.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (theory).
- **Theme tags**: T2c, T2g.
- **Viewpoint**: Opposes (exact barycenters), neutral on surrogates.
- **Theme**: Theme 2

#### Amir et al. (2023). Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem.
- **Citation key**: [amir2023neural]
- **Type**: Conference paper (NeurIPS 2023).
- **Identifier**: DOI 10.52202/075280-1845 (resolved at https://doi.org/10.52202/075280-1845); arXiv 2306.06529.
- **Method**: theory of injectivity of moment-based multiset functions built from neural networks.
- **Key Findings**: Moments of neural networks with an analytic non-polynomial activation define injective multiset functions, with a number of moments optimal up to a factor of two. Moments of piecewise-linear networks cannot be injective. Even injective moment-based multiset functions are never bi-Lipschitz.
- **Relevance**: it states when a sum-pooled set encoder can separate all sets, and gives two negative results that bear on ReLU sum pooling.
- **Prediction setting**: representation or comparison only, no prediction; input is a multiset or measure.
- **Correspondence handling**: permutation invariance; the moments are symmetric functions of the elements.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (theory of multisets and graphs).
- **Theme tags**: T3a, T3e.
- **Quality**: abstract read on the arXiv record. Peer-reviewed proceedings; OpenAlex cited_by_count 44. Quick assessment 12 of 15.
- **Viewpoint**: supports sum pooling with analytic activations; opposes it with ReLU.
- **Potential Use**: expressivity of sum pooling.
- **Theme**: Theme 3

#### Amir and Dym (2025). Fourier Sliced-Wasserstein Embedding for Multisets and Measures.
- **Citation key**: [amir2025fourier]
- **Identifier**: arXiv 2405.16519. Confirmed by a live lookup at https://arxiv.org/abs/2405.16519.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: The Fourier Sliced-Wasserstein (FSW) embedding maps multisets and measures over R^d into Euclidean space while approximately preserving the sliced Wasserstein distance.
- **Key Findings**: The embedding is injective on measures and bi-Lipschitz on multisets with an output dimension of roughly 2Nd, while sum and max pooling are provably not bi-Lipschitz; the authors also prove that no bi-Lipschitz embedding of distributions over R^d into Euclidean space exists. FSW with an MLP reaches state-of-the-art performance in learning the Wasserstein distance, and replacing max pooling in PointNet with FSW keeps performance with only minor degradation after a 40-fold parameter reduction.
- **Relevance**: It addresses P2: it gives a permutation-invariant set embedding with metric guarantees, an alternative to sum or max pooling for point clouds and other sets.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 2. OpenAlex counts 7 citations.
- **Potential Use**: Method background (set encoders and their theory)
- **Stance**: Opposes, sum and max pooling as set embeddings, which the abstract states are not bi-Lipschitz.
- **Prediction setting**: other (learning the Wasserstein distance and point cloud classification with PointNet), input point cloud; the embedding serves set-level tasks.
- **Correspondence handling**: permutation invariance; the embedding is a function of the multiset or measure, independent of element order.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, machine learning on multisets and point clouds.
- **Theme tags**: T3a, T3b.
- **Theme**: added: handed on by Theme 3 (Amir Dym 2025 Fourier sliced-Wasserstein); merge screening reason: Fourier sliced-Wasserstein embedding of multisets, injective and bi-Lipschitz

#### Wanni Arachchige (2026). Segmentation-perturbation propagation in pretrained foundation-model embeddings versus IBSI-aligned radiomics for radiologist-assessed lung-nodule malignancy classification on the LIDC-IDRI cohort.
- **Citation key**: [arachchige2026segmentation]
- **Identifier**: DOI 10.1088/1361-6560/aebf1b. Confirmed by a live lookup at https://doi.org/10.1088/1361-6560/aebf1b.
- **Type**: Journal article (Physics in Medicine & Biology)
- **Method**: Two 2D foundation-model encoders (BiomedCLIP, RadImageNet ResNet50) and IBSI-compliant 2D and 3D radiomics are compared on feature stability under up to thirteen perturbed segmentation masks per nodule and on malignancy discrimination by regularized logistic regression with patient-grouped cross-validation.
- **Key Findings**: On 556 LIDC-IDRI nodules from 399 patients, with labels from radiologist consensus ratings, radiomics outperformed both foundation models on discrimination (AUC 0.940 and 0.930 against 0.833 and 0.798, DeLong p at most 10^-7). BiomedCLIP was as stable as radiomics (93.8% against 90.2 to 92.5% stable features) while RadImageNet was less stable (75.0%), and the radiomics advantage narrowed and partly reversed within size-matched strata. The author concludes that perturbation stability is decoupled from task-informativeness.
- **Relevance**: It addresses P3 by measuring how segmentation-mask perturbation propagates into radiomic features and into the foundation-model embeddings proposed to remove the radiomic step.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (segmentation sensitivity of radiomics and of its learned replacements).
- **Stance**: Opposes, the claim that 2D foundation-model embeddings outperform IBSI radiomics under segmentation perturbation.
- **Prediction setting**: other (nodule-level malignancy classification), input image on a grid; the label is the radiologist-rated malignancy of each nodule on CT.
- **Correspondence handling**: not applicable; features are computed per nodule and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; mask perturbations are propagated into radiomic and foundation-model features and into malignancy discrimination.
- **Application domain**: medical imaging, CT, lung nodules.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Wanni Arachchige 2026); merge screening reason: head-to-head propagation of segmentation-mask perturbation into foundation-model embeddings and IBSI radiomics on 556 nodules

#### Aramayo Carrasco et al. (2023). Uncovering Challenges of Solving the Continuous Gromov-Wasserstein Problem.
- **Citation key**: [aramayo2023uncovering]
- **Identifier**: arXiv 2303.05978. Confirmed by a live lookup at https://arxiv.org/abs/2303.05978.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: A benchmark that tests existing continuous Gromov-Wasserstein optimal transport solvers on different scenarios, and a new continuous GWOT method that does not rely on discrete techniques.
- **Key Findings**: The abstract states that all existing continuous GWOT solvers still rely heavily on discrete techniques. The experiments indicate that the community still lacks a reliable continuous GWOT solver. The proposed method partially solves some of the problems of the competing methods.
- **Relevance**: It addresses P2 from the failure side: it measures where Gromov-Wasserstein couplings, one way to match unaligned spaces, cannot be computed reliably.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 8 citations.
- **Potential Use**: Discussion and limitations (failure of Gromov-Wasserstein solvers)
- **Stance**: Opposes, the claim that existing continuous Gromov-Wasserstein solvers solve the problem reliably.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the task is to recover a map between two distributions from samples.
- **Correspondence handling**: transport coupling; the Gromov-Wasserstein problem seeks the most isometric map between distributions on different spaces.
- **Pipeline relation**: not applicable; the benchmark concerns solvers, not an imaging pipeline step.
- **Application domain**: other domain, machine learning benchmark (no application named in the abstract).
- **Theme tags**: T2b, T2g.
- **Theme**: added: handed on by Theme 2 (Aramayo continuous GW challenges); merge screening reason: benchmark that measures where continuous GW solvers fail (preprint)

#### Ashburner and Friston (2000). Voxel-based morphometry: the methods.
- **Citation key**: [ashburner2000voxel]
- **Type**: Journal article (NeuroImage)
- **Identifier**: DOI 10.1006/nimg.2000.0582, PMID 10860804; confirmed at https://doi.org/10.1006/nimg.2000.0582 and the PubMed record.
- **Method**: Describes voxel-based morphometry: spatial normalization of all subjects into one stereotactic space, gray-matter segmentation, smoothing, and voxelwise parametric tests with Gaussian random field correction.
- **Key Findings**: The abstract describes the steps with emphasis on gray-matter segmentation under nonuniformity artifact, and evaluates the assumptions of the method, including segmentation accuracy and the assumed distribution of the data.
- **Relevance**: It is the analysis that depends on registration most directly: voxelwise comparison exists only after every subject is in the same space.
- **Quality**: Abstract read. Seminal work, admitted as a named foundational work.
- **Potential Use**: Background on registration-dependent group analysis.
- **Viewpoint**: neutral.
- **Prediction setting**: other (group comparison by voxelwise testing, no subject-level prediction); image on a grid (T1-weighted MRI).
- **Correspondence handling**: registration to a common space; spatial normalization to stereotactic space precedes all statistics.
- **Pipeline relation**: builds on registration; also builds on tissue segmentation.
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: `reg-analysis`.
- **Theme**: Theme 4

#### Avants, Epstein, Grossman and Gee (2008). Symmetric diffeomorphic image registration with cross-correlation: evaluating automated labeling of elderly and neurodegenerative brain.
- **Citation key**: [avants2008symmetric]
- **Type**: Journal article (Medical Image Analysis)
- **Identifier**: DOI 10.1016/j.media.2007.06.004, PMID 17659998; confirmed at https://doi.org/10.1016/j.media.2007.06.004 (resolves to the Elsevier landing page) and the PubMed record.
- **Method**: Derives a symmetric image normalization method (SyN) that maximizes cross-correlation within the space of diffeomorphic maps, with its Euler-Lagrange equations, and evaluates it against an elastic method and ITK Demons using manual cortical labels of frontotemporal dementia and control subjects.
- **Key Findings**: SyN compares favorably with both methods, in particular when the distance between template and target brain is large. Volumes from SyN-based labeling correlate most strongly with volumes from expert labeling among the three methods.
- **Relevance**: It is the registration step that establishes correspondence to a template before voxelwise or regional analysis; the abstract states the template-to-target distance as the regime where the method differs.
- **Quality**: Abstract read. Seminal work, admitted as a named foundational work.
- **Potential Use**: Background on registration to a common space; the baseline that registration-free methods remove.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; input image on a grid (T1-weighted MRI); the method aligns images and measures volumes, and no subject-level outcome is predicted.
- **Correspondence handling**: registration to a common space; each brain is mapped diffeomorphically to a template.
- **Pipeline relation**: builds on registration; it is itself the registration step, evaluated by label overlap with manual segmentation.
- **Application domain**: medical imaging, brain MRI (T1-weighted), elderly and neurodegenerative populations.
- **Theme tags**: `reg-template`.
- **Theme**: Theme 4

#### Awate et al. (2017). Kernel Methods for Riemannian Analysis of Robust Descriptors of the Cerebral Cortex.
- **Citation key**: [awate2017kernel]
- **Identifier**: DOI 10.1007/978-3-319-59050-9_3; PMID 29398876. Confirmed by a live lookup at https://doi.org/10.1007/978-3-319-59050-9_3.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: A histogram-based descriptor of the 3D cortical sheet that jointly models folding and thickness lies on a Riemannian manifold, and regularized nonlinear kernel methods use it for group-difference detection (a Mercer kernel with a lifting map to an RKHS) and for regression against clinical variables (kernel density estimation).
- **Key Findings**: The abstract states that typical cortical analyses rely on spatial normalization and are sensitive to misregistration from partial homologies and local optima of nonlinear registration, while the descriptor is robust to misregistration. Results on simulated and clinical data show improved accuracy and stability. The abstract does not state the number of subjects.
- **Relevance**: It addresses P1, P2 and P3: subject-level regression against clinical variables uses a histogram descriptor chosen to tolerate misregistration.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 9 citations.
- **Potential Use**: Related work (registration-robust descriptors and kernels on distributions)
- **Stance**: Supports, that a histogram descriptor of the cortical sheet reduces the dependence of cortical analysis on registration accuracy.
- **Prediction setting**: subject-level regression, input distribution or set of vectors; the histogram descriptor of each subject's cortex is regressed against clinical variables.
- **Correspondence handling**: permutation invariance; the histogram descriptor summarizes cortical measures without their positions, and the abstract does not state whether a coarse spatial normalization is still used.
- **Pipeline relation**: removes registration; the descriptor is designed to be robust to misregistration in place of relying on accurate spatial normalization, and the abstract does not state whether registration is dropped entirely.
- **Application domain**: medical imaging, cerebral cortex (the abstract does not name the modality).
- **Theme tags**: T3c, `reg-analysis`, `step-removal`.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: kernels on robust cortical descriptors, robust to misregistration

#### Bai et al. (2025). Linear Partial Gromov-Wasserstein Embedding.
- **Citation key**: [bai2025linear]
- **Identifier**: arXiv 2410.16669. Confirmed by a live lookup at https://arxiv.org/abs/2410.16669.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: A linearized embedding of the partial Gromov-Wasserstein problem (LPGW) that reduces the number of PGW problems for K metric measure spaces from O(K^2) to O(K).
- **Key Findings**: The paper proves that LPGW defines a valid metric for metric measure spaces. It reports that LPGW keeps the partial-matching advantages of PGW with much higher efficiency on shape retrieval and on learning with transport-based embeddings, and that the code is public.
- **Relevance**: It bears on P2 with a linear GW embedding that compares objects in different metric spaces and of unequal mass without a correspondence.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 3, relevance 2, citations 1, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Method background (GW and partial GW embeddings).
- **Stance**: Supports, linearized partial GW embeddings for efficient comparison of unequal-mass objects.
- **Prediction setting**: other (shape retrieval and learning with transport-based embeddings), input distribution or set of vectors; the abstract names no subject-level target.
- **Correspondence handling**: transport coupling; each metric measure space is embedded through a partial GW problem, and the abstract does not name the reference of the linearization.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, shape retrieval and transport-based embeddings.
- **Theme tags**: T2b, T2e.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Balagurunathan et al. (2014). Reproducibility and Prognosis of Quantitative Features Extracted from CT Images.
- **Citation key**: [balagurunathan2014reproducibility]
- **Identifier**: DOI 10.1593/tlo.13844. Confirmed by a live lookup at https://doi.org/10.1593/tlo.13844.
- **Type**: Journal article (Translational Oncology)
- **Method**: 219 three-dimensional and 110 two-dimensional features of tumour shape, size and texture are computed on 32 non-enhanced NSCLC CT scans of the RIDER data set after manual and software-automated segmentation, and filtered by test-retest concordance, dynamic range and redundancy.
- **Key Findings**: 29 features have a test-retest concordance and dynamic range of at least 0.9 and an R2 between methods of at least 0.95 across segmentation methods. Some texture features (run-length and Laws kernels) predict the radiologist prognostic score with an AUC of 0.9. In an independent set of 59 lung adenocarcinomas, run-length gray-level nonuniformity separates survival groups (P at most 0.046).
- **Relevance**: It addresses P3: it measures how the reproducibility of radiomic features depends on the segmentation method, and tests the reproducible features for prognosis.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 3, data 1. OpenAlex counts 335 citations. Small study (32 scans, and 59 in the independent set).
- **Potential Use**: Discussion and limitations (radiomic feature reproducibility across segmentations)
- **Stance**: Supports, that only a subset of radiomic features is reproducible across segmentation methods and repeat scans.
- **Prediction setting**: subject-level classification, input image on a grid; the reproducible features are tested against a radiologist prognostic score and survival groups.
- **Correspondence handling**: not applicable; features are computed per tumour, with no cross-subject spatial correspondence.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; feature stability under manual and automated tumour segmentation is measured.
- **Application domain**: medical imaging, chest CT, non-small cell lung cancer.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Balagurunathan 2014); merge screening reason: radiomic feature reproducibility across manual and automated segmentation (small study, 32 scans)

#### Balakrishnan, Zhao, Sabuncu, Guttag and Dalca (2019). VoxelMorph: a learning framework for deformable medical image registration.
- **Citation key**: [balakrishnan2019voxelmorph]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Identifier**: DOI 10.1109/TMI.2019.2897538, PMID 30716034; confirmed at https://doi.org/10.1109/TMI.2019.2897538 (resolves to the IEEE Xplore page) and the PubMed record.
- **Method**: Formulates pairwise deformable registration as a convolutional network that maps an image pair to a deformation field, trained unsupervised on intensity matching or with auxiliary segmentations.
- **Key Findings**: The unsupervised model's accuracy is comparable to state-of-the-art methods while running orders of magnitude faster. Auxiliary segmentations at training improve registration accuracy at test time, and the effect of training-set size is evaluated.
- **Relevance**: It turns the registration step into a learned function, which a subject-level predictor can call or train jointly; it still produces correspondence to a fixed target.
- **Quality**: Abstract read. Seminal work, admitted as a named foundational work.
- **Potential Use**: Learning-based registration as the step that end-to-end methods can absorb.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (3D medical scans); the output is a deformation field.
- **Correspondence handling**: registration to a common space; pairs, or images to an atlas, are aligned by the predicted deformation.
- **Pipeline relation**: builds on registration; it replaces per-pair optimization with a network but keeps the registration step.
- **Application domain**: medical imaging; the abstract names medical images in general and does not name the modality or organ of its experiments.
- **Theme tags**: `reg-template`.
- **Theme**: Theme 4

#### Barbarant, Meyniel and Thirion (2026). Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders.
- **Citation key**: [barbarant2026functional]
- **Type**: Preprint (bioRxiv).
- **Method**: Comparison of functional alignment methods (optimal transport, Procrustes, ridge regression, shared response model) and template strategies for task decoding across subjects.
- **Key Findings**: The study compares four functional alignment methods (optimal transport, Procrustes, ridge regression, shared response model) and three template construction strategies (in-sample, out-of-sample, pairwise) within task decoding, where decoding accuracy measures how well individual activation patterns align. Population templates built with optimal transport give the highest decoding accuracy across tasks and datasets, are not significantly biased by individual subjects and preserve cortical signal topography. The abstract states that standard anatomical registration reduces morphological differences but fails to capture functional variability.
- **Relevance**: The most recent measurement of transport templates as the basis of a group-level decoder.
- **Quality**: Medium (preprint). Read: the full abstract from the bioRxiv API record. Routes tried for a full text: the bioRxiv full-text page (WebFetch HTTP 429 three times), the PDF and the JATS XML named by the API (Cloudflare error 1015), and Europe PMC (record PPR1239315, not in EPMC). Cited 1 times in OpenAlex on 2026-11-19.
- **Potential Use**: Transport templates for prediction across subjects.
- **Identifier**: DOI 10.64898/2026.05.21.726781; https://doi.org/10.64898/2026.05.21.726781 (confirmed). Preprint.
- **Prediction setting**: Subject-level classification (task decoding in new subjects), input images on a grid.
- **Correspondence handling**: Registration to a common space, then a learned template or barycenter by transport.
- **Pipeline relation**: Builds on registration.
- **Application domain**: Medical imaging (fMRI, brain).
- **Theme tags**: T2f, T2d.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Basu et al. (2014). Detecting and visualizing cell phenotype differences from microscopy images using transport-based morphometry.
- **Citation key**: [basu2014detecting]
- **Identifier**: DOI 10.1073/pnas.1319779111. Confirmed by a live lookup at https://doi.org/10.1073/pnas.1319779111.
- **Type**: Journal article (Proceedings of the National Academy of Sciences)
- **Method**: An automated approach based on optimal mass transport for detecting and visualizing phenotypic differences between classes of cells in microscopy images without predefined numerical features.
- **Key Findings**: The method shows that the distribution pattern of peripheral chromatin in nuclei of cells from liver and thyroid specimens is associated with malignancy. It recovers biologically interpretable and statistically significant differences in translocation imaging assays automatically. Its visualizations show the most significant differences between classes.
- **Relevance**: It addresses P3 in an imaging setting outside radiology by replacing predefined numerical descriptors with a transport representation.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 100 citations.
- **Potential Use**: Related work (transport-based morphometry).
- **Stance**: Supports, transport-based morphometry in place of predefined cell descriptors.
- **Prediction setting**: other (discrimination between classes of cells), input image on a grid; each cell image is treated as a distribution of mass.
- **Correspondence handling**: transport coupling; cells are compared through optimal mass transport, and the abstract does not name the reference.
- **Pipeline relation**: removes radiomic feature engineering; the abstract states that the method does not require predefined numerical features of cells.
- **Application domain**: medical imaging, microscopy of cell nuclei from liver and thyroid specimens, and translocation imaging assays.
- **Theme tags**: T2e, `step-removal`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Bates, Wilson, Saygin, Dick, Sereno, Knight and Dronkers (2003). Voxel-based lesion-symptom mapping.
- **Citation key**: [bates2003voxel]
- **Type**: Journal article, brief communication (Nature Neuroscience)
- **Identifier**: DOI 10.1038/nn1050, PMID 12704393; confirmed at https://doi.org/10.1038/nn1050 (resolves to the Nature page) and the PubMed record. The PubMed record holds no abstract; the text was read in the author-hosted copy at https://crl.ucsd.edu/~asaygin/papers/vlsm_nn03.pdf.
- **Method**: Voxel-based lesion-symptom mapping (VLSM): for each voxel, patients with a lesion in that voxel are compared with patients without one on a continuous behavioral score by a t-test, in 101 left-hemisphere stroke patients with aphasia scored on fluency and auditory comprehension.
- **Key Findings**: The VLSM maps confirm the anterior-posterior contrast between fluency and comprehension and indicate interacting regions for both. The text states that lesions were reconstructed onto templates by a neurologist, and that the method uses continuous behavioral and lesion information without grouping patients by lesion site or behavioral cutoff.
- **Relevance**: It is the lesion analysis that depends on both lesion delineation and placement in a common space, the two steps the research question asks about, with a subject-level behavioral score as the variable.
- **Quality**: Full text read (the summary and the methods paragraph of the author copy). Before the inclusion window; admitted on the seminal-work path as the method named in the theme scope (lesion-symptom mapping); its citation count was not observed in this run.
- **Potential Use**: Background on lesion-based analyses that need a common space.
- **Viewpoint**: neutral.
- **Prediction setting**: other (voxelwise association of lesion presence with a subject-level behavioral score; no out-of-sample prediction); set of lesions or regions, rasterized as binary lesion maps on a template grid.
- **Correspondence handling**: registration to a common space; lesions are reconstructed onto templates before the voxelwise test.
- **Pipeline relation**: builds on registration; builds on lesion segmentation (manual lesion reconstruction).
- **Application domain**: medical imaging, brain imaging of chronic stroke, aphasia.
- **Theme tags**: `reg-analysis`, `lesion-seg`.
- **Theme**: Theme 4

#### Bazeille et al. (2019). Local Optimal Transport for Functional Brain Template Estimation.
- **Citation key**: [bazeille2019local]
- **Type**: Conference paper (IPMI, LNCS).
- **Method**: Entropic transport alignment within parcels of the brain, and a functional template estimated by alternating alignment of each subject to the template.
- **Key Findings**: The template-based inference improves the transfer of information across individuals over state-of-the-art methods, judged by predicting a subject's unseen contrasts from other subjects. The data were "previously registered in MNI-space"; the baselines include the SyN diffeomorphic registration.
- **Relevance**: A transport template learned across subjects whose quality is measured by prediction, on top of a registration step.
- **Quality**: High. Read: abstract, introduction, method and experiment sections (HAL PDF). Cited 33 times in OpenAlex on 2026-11-19.
- **Potential Use**: Functional transport templates; dependence on registration.
- **Identifier**: DOI 10.1007/978-3-030-20351-1_18; https://doi.org/10.1007/978-3-030-20351-1_18 (confirmed).
- **Prediction setting**: Other: prediction of a subject's held-out activation maps, not of a subject-level outcome; input images on a grid.
- **Correspondence handling**: Registration to a common space, then a learned template or barycenter with local transport couplings.
- **Pipeline relation**: Builds on registration.
- **Application domain**: Medical imaging (fMRI, brain).
- **Theme tags**: T2f, T2d.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Bazeille et al. (2021). An empirical evaluation of functional alignment using inter-subject decoding.
- **Citation key**: [bazeille2021empirical]
- **Type**: Journal article (NeuroImage).
- **Method**: Benchmark of five functional alignment methods, among them piecewise optimal transport, for inter-subject decoding on four public datasets.
- **Key Findings**: Functional alignment improves inter-subject decoding accuracy above anatomical-only alignment, with the best method depending on the context. Shared response modelling and optimal transport perform well at region and whole-brain scale; the paper also benchmarks computational cost. The data are preprocessed with fMRIPrep; the regularized transport plan is found with the Sinkhorn algorithm on parcels of the Schaefer atlas; decoding uses a linear SVM with C = 1 on trial or condition beta maps of left-out subjects.
- **Relevance**: Measures, by a subject-level decoding outcome, how much transport alignment adds after anatomical registration, and at what cost.
- **Quality**: High. Read: abstract, introduction and methods of the PMC full text (PMC11653789). Cited 52 times in OpenAlex on 2026-11-19.
- **Potential Use**: Evidence on transport alignment for prediction across subjects.
- **Identifier**: DOI 10.1016/j.neuroimage.2021.118683; PMID 34715319; https://doi.org/10.1016/j.neuroimage.2021.118683 (confirmed).
- **Prediction setting**: Subject-level classification (decoding of task conditions in a left-out subject), input images on a grid.
- **Correspondence handling**: Registration to a common space (anatomical-only alignment is the baseline) plus a transport coupling (piecewise optimal transport within parcels) among the methods compared.
- **Pipeline relation**: Measures how a pipeline step fails (the residual misalignment after registration) and builds on registration.
- **Application domain**: Medical imaging (fMRI, brain).
- **Theme tags**: T2f, T2g.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Beckmann et al. (2026). Generalizations of the Normalized Radon Cumulative Distribution Transform for Limited Data Recognition.
- **Citation key**: [beckmann2026generalizations]
- **Identifier**: DOI 10.1007/s10851-026-01327-4. Confirmed by a live lookup at https://doi.org/10.1007/s10851-026-01327-4.
- **Type**: Journal article (Journal of Mathematical Imaging and Vision)
- **Method**: Generalized normalizations of the Radon cumulative distribution transform, a one-dimensional Wasserstein transport representation, with generalized Radon transforms for multi-dimensional and non-Euclidean data.
- **Key Findings**: The authors prove that the normalized representations are invariant under classes of transformations, including affine maps, and allow linear separation in feature space. Experiments on 2D images, 3D shapes and 3D rotation matrices report near-perfect classification accuracy.
- **Relevance**: It removes the misalignment caused by affine transformations through an invariant transport representation, which is a correspondence-free route to classification (P2).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 3, relevance 2, citations 1, data 2. No OpenAlex count in the record read.
- **Potential Use**: Method background (transport transforms with invariance to affine misalignment).
- **Stance**: Supports, invariant transport features as a replacement for alignment.
- **Prediction setting**: other (object-level classification of images, shapes and rotation data), input image on a grid and point cloud or shape; the units are watermarks and shapes, not subjects of a medical study.
- **Correspondence handling**: transport coupling; one-dimensional transport along Radon projections, normalized so that affine transformations of the input leave the feature unchanged.
- **Pipeline relation**: not applicable; no imaging pipeline step is studied.
- **Application domain**: other domain (filigranology watermarks, 3D shapes, rotation matrices).
- **Theme tags**: T2e.
- **Theme**: added: merge recent-literature search R2 (2024 to 2026)

#### Beetz et al. (2023). 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks.
- **Citation key**: [beetz20233d]
- **Identifier**: DOI 10.1109/embc40787.2023.10340878. Confirmed by a live lookup at https://doi.org/10.1109/embc40787.2023.10340878.
- **Type**: Conference paper (2023 45th Annual International Conference of the IEEE Engineering in Medicine & Biology Society (EMBC))
- **Method**: A fully automatic pipeline reconstructs 3D cardiac surfaces and classifies them as point clouds with a geometric deep learning network that learns at several scales on high-resolution surface models.
- **Key Findings**: On 1068 UK Biobank subjects, the method improves over clinical benchmarks by about 13% for prevalent MI detection and about 5% for incident MI prediction. The abstract also analyzes the role of each ventricle and cardiac phase and visualizes morphological and physiological patterns associated with MI.
- **Relevance**: It addresses P1 and P3: a subject-level MI outcome is predicted from a whole cardiac point cloud instead of single-valued imaging biomarkers.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 2, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 12 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes for subject-level outcomes)
- **Stance**: Supports, that full 3D cardiac shapes predict MI better than single-valued clinical metrics.
- **Prediction setting**: subject-level classification, input point cloud; each subject's cardiac shape is classified for prevalent and incident MI.
- **Correspondence handling**: permutation invariance; the point cloud classification network learns directly on the points without a correspondence across subjects.
- **Pipeline relation**: removes radiomic feature engineering; learning on the full 3D shape replaces the single-valued imaging biomarkers, and the abstract does not mention registration.
- **Application domain**: medical imaging, cardiac anatomy of the ventricles (the abstract does not name the modality).
- **Theme tags**: T3b, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 3 (MI point cloud classification EMBC); merge screening reason: point cloud classification of cardiac shapes for MI detection and prediction (1,068 UK Biobank subjects)

#### Beetz et al. (2023). Multi-objective Point Cloud Autoencoders for Explainable Myocardial Infarction Prediction.
- **Citation key**: [beetz2023multi]
- **Identifier**: DOI 10.1007/978-3-031-43895-0_50; arXiv 2307.11017. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-43895-0_50.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2023)
- **Method**: A multi-objective point cloud autoencoder with task-specific branches joined by a low-dimensional latent space learns reconstruction and MI prediction from multi-class 3D point clouds of cardiac anatomy and function, with hierarchical point cloud operations at several scales.
- **Key Findings**: On a large UK Biobank dataset, the model reconstructs multi-temporal 3D shapes with Chamfer distances below the pixel resolution of the images. It outperforms several machine learning and deep learning benchmarks for incident MI prediction by 19% in AUROC. The latent space separates control and MI clusters with clinically plausible associations to 3D shape; the abstract does not state the number of subjects.
- **Relevance**: It addresses P1 and P3: a subject-level MI outcome is predicted from cardiac point clouds instead of clinical image biomarkers such as ejection fraction.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 10 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes for subject-level outcomes)
- **Stance**: Supports, that point cloud representations of cardiac anatomy predict incident MI better than benchmarks and clinical biomarkers.
- **Prediction setting**: subject-level classification, input point cloud; incident MI is predicted per subject from the cardiac point clouds.
- **Correspondence handling**: permutation invariance; the point cloud operations learn on the points directly, and the abstract describes no point correspondence across subjects.
- **Pipeline relation**: removes radiomic feature engineering; the learned shape representation replaces hand-defined image biomarkers such as ejection fraction.
- **Application domain**: medical imaging, cardiac anatomy and function (the abstract does not name the modality).
- **Theme tags**: T3b, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 4 (Beetz 2023 point cloud MI); merge screening reason: multi-objective point cloud autoencoder for MI prediction from multi-class cardiac point clouds

#### Beetz et al. (2025). 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis.
- **Citation key**: [beetz20253d]
- **Identifier**: DOI 10.1016/j.compmedimag.2025.102587. Confirmed by a live lookup at https://doi.org/10.1016/j.compmedimag.2025.102587.
- **Type**: Journal article (Computerized Medical Imaging and Graphics)
- **Method**: A multi-class variational point cloud autoencoder (Point VAE) learns a low-dimensional latent space from high-resolution point clouds of multi-class 3D cardiac anatomy, which is then used for myocardial infarction prediction and population synthesis.
- **Key Findings**: On over 10,000 subjects, mean Chamfer distances between input and reconstructed point clouds were below the pixel resolution of the image acquisitions. The latent space outperformed clinical benchmarks by 13 and 16 percent in AUROC for prevalent and incident myocardial infarction and by 10 percent in Harrell's concordance index for survival. Generated populations were used in electrophysiology simulations.
- **Relevance**: A subject-level outcome predicted from a point-cloud representation of anatomy in a large cohort (P1).
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 9 citations.
- **Potential Use**: Related work (point-cloud networks for subject-level prediction in medical imaging).
- **Stance**: Supports, that point cloud latent spaces of cardiac anatomy improve infarction prediction over clinical benchmarks.
- **Prediction setting**: subject-level classification, input point cloud; the latent code of each subject's cardiac point cloud predicts prevalent and incident infarction, and survival is also analysed.
- **Correspondence handling**: permutation invariance; the model works directly on point clouds and its reconstruction is measured by the Chamfer distance, an order-free loss, and the abstract does not state whether the encoder is permutation invariant.
- **Pipeline relation**: not applicable; the abstract does not state how the point clouds are obtained from the images.
- **Application domain**: medical imaging, cardiac anatomy (the abstract does not name the modality).
- **Theme tags**: T3b, T3d.
- **Theme**: added: handed on by Theme 3 (cardiac point cloud VAE MI); merge screening reason: variational point cloud autoencoder of multi-class cardiac anatomy for MI prediction (over 10,000 subjects)

#### Belkhatir, San Jose Estepar and Tannenbaum (2022). Wasserstein-based texture analysis in radiomic studies.
- **Citation key**: [belkhatir2022wasserstein]
- **Type**: Journal article (Computerized Medical Imaging and Graphics).
- **Method**: Gray-level co-occurrence matrices are kept as matrices; features are Wasserstein distances to reference matrices selected per class by Bayesian optimization during SVM training.
- **Key Findings**: The Wasserstein spatial texture features improve COVID-19 classification from CT over statistical radiomic features, Euclidean spatial features and non-optimized Wasserstein features.
- **Relevance**: Transport used inside a radiomics pipeline, with references selected for the supervised task.
- **Quality**: Medium. Read: abstract only. Routes tried for a full text: the ScienceDirect PDF named as open access by OpenAlex and Europe PMC (curl returned an HTML page, WebFetch HTTP 403), the University of Southampton repository PDF (eprints.soton.ac.uk/502052; curl returned HTML, WebFetch HTTP 403), PubMed Central (not deposited, per the PMC ID converter), the medRxiv preprint 10.1101/2020.12.03.20243493 (challenge page) and the lab page (no PDF link). The abstract does not say how the CT regions are delimited. Cited 8 times in OpenAlex on 2026-11-19.
- **Potential Use**: Transport that builds on radiomics.
- **Identifier**: DOI 10.1016/j.compmedimag.2022.102129; PMID 36308869; https://doi.org/10.1016/j.compmedimag.2022.102129 (confirmed).
- **Prediction setting**: Subject-level classification, input texture matrices from CT images.
- **Correspondence handling**: Learned template or barycenter in the sense of class references selected for the supervised loss; transport coupling to each.
- **Pipeline relation**: Builds on radiomics (GLCM texture matrices) and replaces their scalar summaries.
- **Application domain**: Medical imaging (CT, lung).
- **Theme tags**: T2f, T2e, T2d.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Benamou et al. (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Citation key**: [benamou2015iterative]
- **Type**: Journal article (SIAM Journal on Scientific Computing).
- **Method**: Entropic regularization recast as a Kullback-Leibler projection onto intersections of simple constraint sets, solved by iterative Bregman projections or Bregman-Dykstra iterations.
- **Key Findings**: The framework solves barycenters, tomographic reconstruction, multi-marginal transport, partial and unbalanced transport, and transport with capacity constraints with closed-form projections. The introduction notes that exact matching of two measures of N points costs about O(N^3), too much for most applications; the barycenter section names its uses as a mean estimator of observed histograms and as an extension of k-means.
- **Relevance**: The algorithm behind the entropic barycenters used for templates and for averaging of neuroimaging data.
- **Quality**: High. Read: abstract, introduction and the barycenter section of the arXiv full text (arXiv 1412.5154). Cited 978 times in OpenAlex on 2026-11-19.
- **Potential Use**: Background on barycenter computation.
- **Identifier**: DOI 10.1137/141000439; arXiv 1412.5154; https://doi.org/10.1137/141000439 (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input histograms on a grid.
- **Correspondence handling**: Learned template or barycenter; the barycenter is computed by the projections.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (numerical analysis, imaging and fluid examples).
- **Theme tags**: T2a, T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Benveniste et al. (2026). Longitudinal tracking of multiple sclerosis lesions in the spinal cord: A validation study.
- **Citation key**: [benveniste2026longitudinal]
- **Identifier**: arXiv 2609.09424. Confirmed by a live lookup at https://arxiv.org/abs/2609.09424.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: A comparison of five strategies for automated tracking of spinal cord MS lesions in longitudinal MRI of a multi-site cohort, based on deformable registration or a spinal anatomical reference system, with overlap matching, a coordinate-based Hungarian algorithm, gradient-boosted classification or Siamese classification.
- **Key Findings**: Tracking accuracy was measured by instance-level true positives, false positives and false negatives, which also exposes one-to-many and many-to-one associations. The registration-based overlap method performed best. The abstract states that this is the first systematic analysis of lesion-instance correspondence in the spinal cord; it does not state the number of patients.
- **Relevance**: It addresses P2 and P3 directly by comparing registration-based and registration-free ways to establish lesion correspondence across time.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (registration-based against registration-free lesion correspondence).
- **Stance**: Supports, registration-based overlap matching for longitudinal lesion tracking.
- **Prediction setting**: other (lesion-instance matching across visits), input set of lesions or regions; the output is a correspondence between lesions at different time points.
- **Correspondence handling**: registration to a common space; the best strategy registers visits by deformable registration and matches lesions by overlap, while the registration-free strategies use a spinal anatomical reference system with Hungarian assignment, a hard one-to-one coupling.
- **Pipeline relation**: builds on registration, builds on lesion segmentation, measures how a pipeline step fails; lesion masks from each visit are matched and the registration-based and registration-free paradigms are compared.
- **Application domain**: medical imaging, spinal cord MRI, multiple sclerosis.
- **Theme tags**: `reg-analysis`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (spinal cord MS lesion tracking); merge screening reason: compares registration-based and registration-free lesion correspondence for longitudinal spinal cord MS lesions (preprint)

#### Besson et al. (2021). Geometric deep learning on brain shape predicts sex and age.
- **Citation key**: [besson2021geometric]
- **Identifier**: DOI 10.1016/j.compmedimag.2021.101939, PMID 34082280. Confirmed by a live lookup at https://doi.org/10.1016/j.compmedimag.2021.101939.
- **Type**: Journal article (Computerized Medical Imaging and Graphics)
- **Method**: Two graph convolutional neural networks on inner and outer cortical surfaces extracted with Freesurfer and registered into MNI space, one for sex classification and one for age regression, with class and regression activation maps.
- **Key Findings**: MRI from 6410 healthy subjects aged 6 to 89 years from 11 public repositories was used. The network predicted sex with an average accuracy of 87.99 percent and age with a Pearson correlation of 0.93 and an average absolute error of 4.58 years. Activation maps show the brain regions most influential for each decision.
- **Relevance**: It addresses P1 and P3: subject-level prediction from cortical surfaces that removes manually defined shape features but still builds on registration to MNI space.
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 45 citations.
- **Potential Use**: Related work (surface networks on registered brain shapes) and Experimental baselines.
- **Stance**: Supports, data-driven shape features learned from the cortical surface in place of manual feature definition.
- **Prediction setting**: subject-level regression, input mesh or surface; age is regressed and sex is classified by a second network from each subject's cortical surfaces.
- **Correspondence handling**: registration to a common space; the surfaces are registered into MNI space before the graph convolutions.
- **Pipeline relation**: builds on registration, removes radiomic feature engineering; the surfaces are registered into MNI space, and the abstract states that the method eliminates reliance on manually defined features.
- **Application domain**: medical imaging, structural MRI of the brain, cortical surfaces.
- **Theme tags**: T3b, `reg-analysis`.
- **Theme**: added: handed on by Theme 3 (Besson 2021 brain shape sex age); merge screening reason: graph convolution on registered cortical surfaces for sex and age (6,410 subjects)

#### Bizjak et al. (2021). Deep Shape Features for Predicting Future Intracranial Aneurysm Growth.
- **Citation key**: [bizjak2021deep]
- **Identifier**: DOI 10.3389/fphys.2021.644349. Confirmed by a live lookup at https://doi.org/10.3389/fphys.2021.644349.
- **Type**: Journal article (Frontiers in Physiology)
- **Method**: Vascular surface meshes extracted from CTA and MRA are described by established morphologic features or by deep shape features from PointNet++, and future aneurysm growth is predicted by univariate thresholding, random forest, multi-layer perceptron and PointNet++ deep shape learning.
- **Key Findings**: In 39 patients with 44 aneurysms (25 growing, 19 stable, classified by an expert), deep shape learning reached accuracy 0.82 (sensitivity 0.96, specificity 0.63). Multivariate learning and univariate thresholding on morphologic features reached at most 0.68 and 0.63. The abstract gives no external validation.
- **Relevance**: A point-cloud network on lesion surfaces replaces engineered shape features for a lesion-level outcome (P1, P3).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 1, relevance 3, citations 2, data 1. OpenAlex counts 26 citations. Small study (39 patients).
- **Potential Use**: Related work (point-cloud networks on medical surfaces against engineered features).
- **Stance**: Supports, that learned point-cloud shape features predict aneurysm growth better than morphologic features.
- **Prediction setting**: subject-level classification, input point cloud; each baseline aneurysm is classified as growing or stable, one aneurysm per patient in most cases (44 aneurysms in 39 patients).
- **Correspondence handling**: permutation invariance; PointNet++ processes the aneurysm surface as an unordered point set, so no point correspondence across aneurysms is needed.
- **Pipeline relation**: removes radiomic feature engineering / builds on lesion segmentation; learned shape features replace established morphologic features, and the surface meshes are extracted from the angiograms by a step the abstract does not describe.
- **Application domain**: medical imaging, CT angiography and MR angiography of intracranial arteries.
- **Theme tags**: T3b, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 3 (aneurysm growth deep shape); merge screening reason: PointNet++ shape features against morphologic features for aneurysm growth (small study, 39 patients, 44 aneurysms)

#### Bloem-Reddy and Teh (2020). Probabilistic symmetries and invariant neural networks.
- **Citation key**: [bloemreddy2020probabilistic]
- **Identifier**: arXiv 1901.06082. Confirmed by a live lookup at https://arxiv.org/abs/1901.06082.
- **Type**: Journal article (Journal of Machine Learning Research)
- **Method**: Treating network inputs and outputs as random variables, the paper characterizes the structure of neural networks for data invariant or equivariant under the action of a compact group, through probabilistic symmetry.
- **Key Findings**: It establishes a link between functional and probabilistic symmetry and obtains generative functional representations of invariant or equivariant distributions. These representations characterize the networks that can model such distributions and give a general program for constructing invariant stochastic or deterministic networks. Examples from the literature are shown to be special cases, and the program is detailed for exchangeable sequences and arrays.
- **Relevance**: It gives the theoretical basis of permutation invariance, one of the four correspondence strategies of P2.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 1. OpenAlex counts 194 citations.
- **Potential Use**: Method background (theory of invariant networks).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the paper characterizes model structure for exchangeable sequences and arrays.
- **Correspondence handling**: permutation invariance; exchangeability is invariance under the permutation group, the case the paper develops in detail.
- **Pipeline relation**: not applicable; the paper is theory.
- **Application domain**: other domain, machine learning theory.
- **Theme tags**: T3a.
- **Theme**: added: handed on by Theme 3 (Bloem-Reddy Teh 2020); merge screening reason: probabilistic symmetries and the structure of invariant networks (JMLR 2020)

#### Bro (1996). Multiway calibration. Multilinear PLS.
- **Citation key**: [bro1996multiway]
- **Identifier**: DOI 10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c, confirmed at https://doi.org/10.1002/(sici)1099-128x(199601)10:1<47::aid-cem400>3.0.co;2-c through Crossref and OpenAlex records.
- **Type**: Journal article (Journal of Chemometrics). Foundational work named for the theme.
- **Method**: N-way PLS (tri-PLS and its higher-order extension), compared with unfold-PLS on fluorescence excitation-emission matrices of sugar solutions and on simulated data.
- **Key Findings**: The abstract reports that N-PLS stabilises the decomposition compared with unfolding, which gives more interpretable solutions, and that on noisy simulated data the predictions of unfold-PLS were almost twice as bad as those of tri-PLS with 125 calibration samples.
- **Relevance**: The base multilinear PLS model of the theme. Each sample is a fixed-size array whose modes (excitation, emission) are the same for every sample.
- **Quality**: Abstract alone. Seminal (OpenAlex counts 795 citations).
- **Potential Use**: Background of multiway regression; contrast case for a model that requires every mode to be aligned.
- **Stance**: Neutral.
- **Prediction setting**: Other (sample-level regression of a chemical concentration), input tensor (one excitation-emission matrix per sample); the predicted quantity is the ash content of each sample.
- **Correspondence handling**: Assumes alignment; every sample is measured on the same excitation and emission wavelengths, so the modes correspond by construction.
- **Pipeline relation**: Not applicable; the work is in chemometric calibration and has no imaging pipeline.
- **Application domain**: Other domain, analytical chemistry (fluorescence spectroscopy of sugar).
- **Theme tags**: T1-PLS.
- **Theme**: Theme 1

#### Bro, Andersson and Kiers (1999). PARAFAC2, Part II. Modeling chromatographic data with retention time shifts.
- **Citation key**: [bro1999parafac2]
- **Identifier**: DOI 10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y, confirmed at https://doi.org/10.1002/(sici)1099-128x(199905/08)13:3/4<295::aid-cem547>3.0.co;2-y through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (Journal of Chemometrics).
- **Method**: PARAFAC2 applied to chromatographic data whose elution profiles shift between samples, on thick juice samples from beet sugar.
- **Key Findings**: The abstract states that retention time shifts violate the parallel proportional profiles assumption of PARAFAC1, and that PARAFAC2 assumes only that the matrix of elution profiles keeps its inner-product structure from sample to sample.
- **Relevance**: The first use of PARAFAC2 to absorb a misaligned mode instead of aligning it beforehand; the chromatographic analogue of modelling misregistration.
- **Quality**: Abstract alone. Seminal (OpenAlex counts 356 citations).
- **Potential Use**: The shift-tolerant interpretation of PARAFAC2.
- **Stance**: Supports.
- **Prediction setting**: Representation or comparison only, no prediction, input tensor (elution time by spectrum by sample).
- **Correspondence handling**: Other: the shifted mode is left unaligned and the model constrains only the cross-products of its profiles across samples.
- **Pipeline relation**: Not applicable in imaging; in chromatography it replaces an alignment preprocessing step.
- **Application domain**: Other domain, analytical chemistry (size-exclusion chromatography).
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Brogat-Motte et al. (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Citation key**: [brogatmotte2022learning]
- **Type**: Conference paper (ICML, PMLR 162).
- **Method**: Supervised graph prediction as regression with an FGW loss; the prediction is an FGW barycenter whose weights depend on the input, either by kernel ridge regression or by a neural network with learned template graphs.
- **Key Findings**: The kernel estimator is consistent with an excess risk bound; the parametric model learns the templates and performs well on a metabolite identification problem.
- **Relevance**: Templates learned for a supervised loss in the opposite direction to the research question (the output is the unaligned object), and a barycenter used as a predictor.
- **Quality**: High. Read: abstract, Section 3 and the appendix on template choice (arXiv HTML full text). Cited 30 times in OpenAlex on 2026-11-19.
- **Potential Use**: Learned barycenter templates under supervision.
- **Identifier**: arXiv 2202.03813; https://proceedings.mlr.press/v162/brogat-motte22a.html (confirmed).
- **Prediction setting**: Other: the output is a graph predicted from an input (graph-valued regression); input molecules (spectra to graphs).
- **Correspondence handling**: Learned template or barycenter, learned for the supervised loss.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (metabolomics).
- **Theme tags**: T2d, T2e, T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Bruggner et al. (2014). Automated identification of stratifying signatures in cellular subpopulations.
- **Citation key**: [bruggner2014automated]
- **Identifier**: DOI 10.1073/pnas.1408792111. Confirmed by a live lookup at https://doi.org/10.1073/pnas.1408792111.
- **Type**: Journal article (Proceedings of the National Academy of Sciences)
- **Method**: Citrus (cluster identification, characterization, and regression), a data-driven method that identifies cell subpopulations that stratify samples by condition in multidimensional cytometry data.
- **Key Findings**: The method identified known and unexpected pathway responses in mass cytometry of stimulated peripheral blood mononuclear cells. Its performance was compared with existing methods on several public datasets. The abstract gives no figures.
- **Relevance**: A sample-level stratification from unordered sets of cells, through subpopulations defined from the data, the cytometry counterpart of subject-level prediction from point sets (P1, P2).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 502 citations.
- **Potential Use**: Related work (distribution regression and cytometry sets).
- **Stance**: Supports, that data-driven subpopulation discovery can replace manual gating for stratification.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; samples are stratified by condition from features of their cell subpopulations, and the abstract does not describe the model beyond the name, which includes regression.
- **Correspondence handling**: learned template or barycenter; the paper's subpopulations are clusters identified from the data and shared across samples as a common reference, and the abstract does not state whether the clustering pools all samples.
- **Pipeline relation**: not applicable; the step replaced is manual gating in cytometry, outside the imaging pipeline.
- **Application domain**: other domain, mass and flow cytometry in immunology.
- **Theme tags**: T3c.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Bueno and Hylton (2021). On the Representation Power of Set Pooling Networks.
- **Citation key**: [bueno2021representation]
- **Identifier**: proceedings url https://proceedings.neurips.cc/paper_files/paper/2021/hash/8ea1e4f9f24c38f168d538c9cfc50a14-Abstract.html (Advances in Neural Information Processing Systems 34, pages 17170 to 17182); OpenAlex W3214092167. Confirmed by a live lookup at https://proceedings.neurips.cc/paper_files/paper/2021/hash/8ea1e4f9f24c38f168d538c9cfc50a14-Abstract.html.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 34, NeurIPS 2021)
- **Method**: A unified framework for the expressive power of PointNet, Deep Sets and their extensions, built on the Hausdorff and Wasserstein metrics, with cardinality-agnostic universality results, lower bounds on the approximation error and Lipschitz theorems.
- **Key Findings**: PointNet generally cannot approximate averages of continuous functions over sets, such as the center of mass or higher moments, so Deep Sets is strictly more expressive than PointNet when the cardinality is constant. The paper gives explicit lower bounds on the approximation error and a method to produce arbitrarily many examples of this failure. In the unbounded cardinality setting, any function uniformly approximated by both PointNet and normalized Deep Sets must be constant.
- **Relevance**: A failure analysis of the permutation-invariant pooling that set and point-cloud predictors use in place of correspondence (P2), with results that depend on the number of points per set.
- **Quality**: Abstract read (NeurIPS proceedings page). Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 2. OpenAlex counts 15 citations.
- **Potential Use**: Related work (set encoders and their theory); Discussion and limitations (what max pooling and sum pooling cannot represent).
- **Stance**: Opposes, the use of max pooling (PointNet) for targets that are averages over the set.
- **Prediction setting**: representation or comparison only, no prediction, input point cloud (sets of points of variable cardinality); the results characterize which set functions the networks can approximate.
- **Correspondence handling**: permutation invariance; PointNet and Deep Sets pool over the points with a symmetric function, and the paper studies what that pooling can represent.
- **Pipeline relation**: not applicable; the paper is a theory of set pooling with no imaging pipeline.
- **Application domain**: other domain, machine learning theory of set and point-cloud networks.
- **Theme tags**: T3a, T3e.
- **Theme**: added: handed on by Theme 3 (Bueno Hylton set pooling 2021); merge screening reason: expressive power of PointNet and Deep Sets with a failure mode of max pooling, read on the NeurIPS proceedings page

#### Cama et al. (2024). A study on the role of radiomics feature stability in predicting breast cancer subtypes.
- **Citation key**: [cama2024study]
- **Identifier**: DOI 10.1117/12.3027015. Confirmed by a live lookup at https://doi.org/10.1117/12.3027015.
- **Type**: Conference paper (17th International Workshop on Breast Imaging, IWBI 2024)
- **Method**: Radiomic features from breast MRI of 244 images from the Duke-Breast-Cancer-MRI dataset, extracted under varied segmentations, with feature stability related to the accuracy of subtype classifiers.
- **Key Findings**: Features that are stable across segmentations tend to improve model performance. Features that change under small segmentation changes degrade predictive accuracy.
- **Relevance**: It measures how lesion-segmentation variability propagates through radiomics into a subject-level prediction (P3).
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 1, data 1. No OpenAlex count in the record read.
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomic predictors).
- **Stance**: Supports, filtering radiomic features by segmentation stability.
- **Prediction setting**: subject-level classification, input image on a grid (breast MRI with a tumor mask); the outcome is the molecular subtype, including triple-negative breast cancer.
- **Correspondence handling**: not applicable; features are computed inside each tumor mask, so no cross-subject correspondence is formed.
- **Pipeline relation**: builds on lesion segmentation, builds on radiomics, measures how a pipeline step fails; it varies the segmentation and records the change in the predictor.
- **Application domain**: medical imaging, breast MRI.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: merge recent-literature search R3 (2024 to 2026)

#### Cama, Guzman, Campi, Piana, Lekadir, Garbarino and Diaz (2025). Segmentation variability and radiomics stability for predicting triple-negative breast cancer subtype using magnetic resonance imaging.
- **Citation key**: [cama2025segmentation]
- **Type**: Journal article (Journal of Medical Imaging)
- **Identifier**: DOI 10.1117/1.JMI.12.5.054501, PMID 40969922; confirmed at https://doi.org/10.1117/1.JMI.12.5.054501 (resolves to the SPIE Digital Library page) and the PubMed record.
- **Method**: 244 breast MR images of the Duke dataset; controlled modifications of manual segmentations; features selected by SHAP and logistic regression per mask; stability by ICC, Pearson correlation and reliability scores.
- **Key Findings**: Model performance for triple-negative subtype did not differ significantly across segmentations. The most predictive features had decreasing ICC as segmentation accuracy fell but kept their predictive power through high Pearson correlation, so feature stability was not a prerequisite for predictive relevance.
- **Relevance**: It is the counterpoint to `poirot2022robustness`: at the predictor level, moderate segmentation variability left performance unchanged in this task, and ICC-based selection may discard informative features.
- **Quality**: Abstract read.
- **Potential Use**: Recent evidence that feature instability and predictive failure are different quantities.
- **Viewpoint**: opposes the view that unstable features must be discarded.
- **Prediction setting**: subject-level classification (triple-negative or not); image on a grid (dynamic contrast MRI) within a segmented tumour, summarized by radiomic features.
- **Correspondence handling**: not applicable.
- **Pipeline relation**: measures how a pipeline step fails (segmentation variability at feature and model level); builds on radiomics; builds on lesion segmentation.
- **Application domain**: medical imaging, breast MRI.
- **Theme tags**: `failure`, `radiomics`.
- **Theme**: Theme 4

#### Campanella et al. (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
- **Citation key**: [campanella2019clinical]
- **Type**: Journal article (Nature Medicine 25(8)).
- **Identifier**: DOI 10.1038/s41591-019-0508-1 (resolved at https://doi.org/10.1038/s41591-019-0508-1).
- **Method**: MIL-based deep learning trained on reported diagnoses as slide labels.
- **Key Findings**: The system trains on 44,732 whole-slide images from 15,187 patients with no pixel-wise annotation. Areas under the curve exceed 0.98 for prostate cancer, basal cell carcinoma and breast cancer metastases to axillary lymph nodes. The abstract states that pathologists could exclude 65 to 75 percent of slides while keeping 100 percent sensitivity.
- **Relevance**: it treats a whole-slide image as a bag of tiles and predicts a slide-level diagnosis, the large-scale case of a set-input prediction with no spatial correspondence across slides.
- **Prediction setting**: subject-level classification (slide-level diagnosis) from a set of image tiles.
- **Correspondence handling**: permutation invariance (MIL over tiles).
- **Pipeline relation**: removes lesion segmentation; training uses only reported diagnoses, with no pixel-wise annotation.
- **Application domain**: medical imaging (digital histopathology; prostate, skin, axillary lymph nodes).
- **Theme tags**: T3c, T3d.
- **Quality**: abstract read (the full text was not retrieved). Peer-reviewed; OpenAlex cited_by_count 3441. Quick assessment 15 of 15.
- **Viewpoint**: supports MIL at clinical scale.
- **Potential Use**: whole-slide images as bags.
- **Theme**: Theme 3

#### Canalini et al. (2022). Quantitative evaluation of the influence of multiple MRI sequences and of pathological tissues on the registration of longitudinal data acquired during brain tumor treatment.
- **Citation key**: [canalini2022quantitative]
- **Identifier**: DOI 10.3389/fnimg.2022.977491. Confirmed by a live lookup at https://doi.org/10.3389/fnimg.2022.977491.
- **Type**: Journal article (Frontiers in Neuroimaging)
- **Method**: Evaluation of the influence of the MRI sequence (T1, T2, T1-CE, FLAIR) and of excluding pathological tissue on non-rigid registration of pre- and post-operative brain tumor images, for an iterative method and a 3D U-Net method, by mean target registration error on landmarks in two test sets.
- **Key Findings**: Methods using T1-CE achieved the lowest errors, with improvements up to 0.8 mm near the pathology and up to 1.16 mm over the whole brain for the iterative method, and FLAIR was the least informative sequence. Excluding the pathology from the distance measure improved registration of tissue around the tumor. The abstract does not state the number of patients.
- **Relevance**: It addresses P3 by measuring how sequence choice and pathological tissue affect registration accuracy.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Discussion and limitations (registration failure near pathology).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study evaluates registration error.
- **Correspondence handling**: registration to a common space; pre- and post-operative images of the same patient are registered non-rigidly.
- **Pipeline relation**: builds on registration, measures how a pipeline step fails; it quantifies registration error under different sequences and with pathology excluded.
- **Application domain**: medical imaging, multiparametric brain MRI, brain tumor treatment.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (Canalini 2022); merge screening reason: measures how pathological tissue and sequence choice affect registration of longitudinal tumour images

#### Chang and Jung (2020). Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds.
- **Citation key**: [chang2020automatic]
- **Identifier**: DOI 10.1016/j.neucom.2020.08.030. Confirmed by a live lookup at https://doi.org/10.1016/j.neucom.2020.08.030.
- **Type**: Journal article (Neurocomputing)
- **Method**: A YOLO detector finds the region of interest in diastolic and systolic cardiac MRI, a fully convolutional network segments left ventricle, right ventricle and myocardium, 3D surfaces are reconstructed by linear interpolation and sampled as point clouds, and a cardiopathy diagnosis network classifies the point clouds.
- **Key Findings**: Segmentation of the three structures achieves results comparable to several existing methods. The point cloud classifier reaches 92 percent accuracy on the test set. The abstract does not state the dataset or the number of subjects.
- **Relevance**: It addresses P1 and P2: subject-level diagnosis from a point cloud of the heart with a permutation-invariant classifier.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 1. OpenAlex counts 36 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes).
- **Stance**: Supports, point cloud classification of cardiac shape for diagnosis.
- **Prediction setting**: subject-level classification, input point cloud; each patient's cardiac point cloud is assigned a cardiopathy class.
- **Correspondence handling**: permutation invariance; the title states that the classification is permutation-invariant over the sampled points.
- **Pipeline relation**: not applicable; the method builds on segmentation of cardiac chambers and myocardium, an anatomical segmentation step outside registration, radiomics and lesion segmentation.
- **Application domain**: medical imaging, cardiac MRI.
- **Theme tags**: T3b, T3d.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Chauvin et al. (2019). Analyzing Brain Morphology on the Bag-of-Features Manifold.
- **Citation key**: [chauvin2019analyzing]
- **Identifier**: DOI 10.1007/978-3-030-20351-1_4. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-20351-1_4.
- **Type**: Conference paper (Information Processing in Medical Imaging, IPMI 2019, Lecture Notes in Computer Science)
- **Method**: A distance between variable-sized sets of image features (the bag-of-features representation) that generalizes the Jaccard distance to soft set equivalence through an adaptive kernel density framework over feature appearance and geometry, computed with keypoint feature indexing.
- **Key Findings**: On 1010 subjects of the Human Connectome Project, including siblings and twins, with neuroanatomy modelled as a set of scale-invariant keypoints extracted from T1-weighted MRI, the soft set equivalence Jaccard distance outperforms hard set equivalence in predicting the immediate family graph structure and genetic links such as racial origin and sex. The method is efficient enough for pairwise relationships in arbitrarily large data sets.
- **Relevance**: Represents each subject's brain as an unordered set of keypoints of variable size and predicts subject-level labels from a distance between sets (P1, P2).
- **Quality**: Abstract read (Springer chapter page). Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 1, data 3. OpenAlex counts 7 citations.
- **Potential Use**: Related work (sets of lesions or regions and medical point clouds); Experimental baselines (a set distance between keypoint bags).
- **Stance**: Supports, that a soft set distance between keypoint bags captures heritable brain morphology.
- **Prediction setting**: subject-level classification, input set of lesions or regions (a variable-sized set of keypoints per subject); the distance predicts family relations, racial origin and sex.
- **Correspondence handling**: permutation invariance; the soft Jaccard distance compares two sets of keypoints through kernel densities over appearance and geometry, which depend on neither the order nor the number of the keypoints.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomics or lesion segmentation step.
- **Application domain**: medical imaging, T1-weighted MRI of the brain (Human Connectome Project).
- **Theme tags**: T3d.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: soft Jaccard distance between keypoint bags predicts family structure, racial origin and sex in 1010 HCP subjects

#### Chen et al. (2020). Optimal Transport Graph Neural Networks.
- **Citation key**: [chen2020optimal]
- **Identifier**: arXiv 2006.04804. Confirmed by a live lookup at https://arxiv.org/abs/2006.04804.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: OT-GNN represents a graph by the Wasserstein distances between the set of its GNN node embeddings and parametric prototype point clouds learned as free parameters, with a noise contrastive regularizer against optimization collapse.
- **Key Findings**: The paper proves a universal approximation theorem for its function class on point clouds, which it states sum aggregation lacks. It reports that OT-GNN outperforms popular methods on several molecular property prediction tasks and gives smoother graph representations; it gives no numbers.
- **Relevance**: It addresses P2 with learned transport prototypes that replace sum or mean pooling of an unordered set of node embeddings.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 58 citations.
- **Potential Use**: Related work (transport dictionaries and learnable templates).
- **Stance**: Supports, transport distances to learned prototypes over sum aggregation for graph representations.
- **Prediction setting**: other (graph-level molecular property prediction), input graph; each label belongs to a molecule, and no subjects are studied.
- **Correspondence handling**: learned template or barycenter; the paper calls them prototype point clouds, learned as free parameters, and each graph's node set is coupled to them by Wasserstein distances.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, molecular property prediction.
- **Theme tags**: T2d, T2e.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Chen et al. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Citation key**: [chen2021aminn]
- **Type**: Conference paper (MICCAI 2021, LNCS).
- **Identifier**: DOI 10.1007/978-3-030-87240-3_72 (resolved at https://doi.org/10.1007/978-3-030-87240-3_72); arXiv 2012.06875.
- **Method**: an autoencoder on radiomic features of each lesion jointly trained with a MIL network that pools over all lesions of a patient; max, average, log-sum-exp and attention pooling compared.
- **Key Findings**: The cohort is 108 patients with colorectal cancer liver metastases, 50 of them multifocal with 2 to 17 lesions (181 lesions), with 3-year survival as the label. AMINN reaches an AUC of 0.70, 11.4 percent above the best baseline, and a risk score from it was the only predictive biomarker in the multifocal cohort. Lesions were segmented manually by a radiologist because automatic liver tumour segmentation was unsatisfactory.
- **Relevance**: it treats a patient's lesions as an unordered set and predicts a patient-level outcome, keeping the radiomics and segmentation steps upstream.
- **Prediction setting**: subject-level classification (3-year survival) from a set of lesions, each described by radiomic features.
- **Correspondence handling**: permutation invariance; MIL pooling over the patient's lesions.
- **Pipeline relation**: builds on radiomics (radiomic features per lesion, with a two-step normalization for skewed features); builds on lesion segmentation (manual).
- **Application domain**: medical imaging (contrast-enhanced MRI; liver metastases of colorectal cancer).
- **Theme tags**: T3d.
- **Quality**: abstract, introduction, methods (MIL pooling), experiments (cohort) and conclusion read in the arXiv HTML full text. Peer-reviewed; 50 multifocal patients is a small cohort. OpenAlex cited_by_count 22. Quick assessment 10 of 15.
- **Viewpoint**: supports lesion-set MIL over largest-lesion radiomics.
- **Potential Use**: sets of lesions as bags.
- **Theme**: Theme 3

#### Chen et al. (2021). Whole Slide Images are 2D Point Clouds: Context-Aware Survival Prediction Using Patch-Based Graph Convolutional Networks.
- **Citation key**: [chen2021whole]
- **Identifier**: DOI 10.1007/978-3-030-87237-3_33; arXiv 2107.13048. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-87237-3_33.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2021)
- **Method**: Patch-GCN treats a whole slide image as a 2D point cloud of patches and hierarchically aggregates instance-level histology features with a graph convolutional network to model local and global structure for survival prediction.
- **Key Findings**: The method was validated on 4,370 gigapixel whole slide images across five cancer types from the Cancer Genome Atlas. It outperformed all prior weakly supervised approaches by 3.58 to 9.46 percent. Code and models are released.
- **Relevance**: A patient-level survival model on a slide treated as a point set, adding spatial context to set pooling (P1, P2).
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 354 citations.
- **Potential Use**: Related work (point-cloud and graph models for subject-level prediction in pathology); Experimental baselines.
- **Stance**: Supports, that context-aware graph aggregation over patches improves survival prediction over weakly supervised set models.
- **Prediction setting**: subject-level regression, input graph; the outcome is patient survival and the input is a graph built on the patches of the slide.
- **Correspondence handling**: permutation invariance; the graph convolution aggregates patch features over each slide's own patch graph, so no patch correspondence across patients is needed, and the abstract does not state the invariance in these words.
- **Pipeline relation**: removes lesion segmentation; the model is weakly supervised from the outcome, as the comparison with weakly supervised approaches in the abstract states.
- **Application domain**: medical imaging, histopathology whole slide images of five cancer types.
- **Theme tags**: T3b, T3c, T3d.
- **Theme**: added: handed on by Theme 3 (WSI are 2D point clouds); merge screening reason: whole-slide images as 2D point clouds with patch graphs for survival prediction

#### Chen et al. (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics.
- **Citation key**: [chen2022lung]
- **Identifier**: DOI 10.1002/mp.15539. Confirmed by a live lookup at https://doi.org/10.1002/mp.15539.
- **Type**: Journal article (Medical Physics)
- **Method**: Lung cancer diagnosis is cast as multiple-instance learning over the set of nodules of a patient, with radiomic features per nodule, deep attention-based MIL as classifier, and a bag simulation method for a small imbalanced dataset.
- **Key Findings**: The abstract reports an area under the curve of 0.842 (SEM 0.074), outperforming other MIL methods; the results sentence of the abstract is cut at its start in the batch. The proposed oversampling strategy significantly improved performance. The attention weights indicate the importance of each nodule for the diagnosis.
- **Relevance**: A patient-level diagnosis from a variable set of lesions, each described by radiomic features, with permutation-invariant pooling (P1, P2, P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 1. OpenAlex counts 53 citations.
- **Potential Use**: Related work (sets of lesions with MIL); Experimental baselines.
- **Stance**: Supports, that patient-level MIL over nodules matches clinical practice and gives interpretable diagnosis.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each patient's set of nodules receives a lung cancer diagnosis.
- **Correspondence handling**: permutation invariance; attention-based MIL pooling over the nodules of a patient needs no correspondence between nodules of different patients.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation; radiomic features are extracted per nodule, which needs each nodule delineated, and the abstract does not state how the nodules were delineated.
- **Application domain**: medical imaging, lung nodules (the abstract does not name the modality).
- **Theme tags**: T3c, T3d, `radiomics`.
- **Theme**: added: handed on by Theme 3 (Chen lung cancer MIL radiomics); merge screening reason: set of nodule radiomics vectors per patient with attention MIL (small imbalanced dataset)

#### Chen et al. (2023). Wasserstein Regression.
- **Citation key**: [chen2023wasserstein]
- **Identifier**: DOI 10.1080/01621459.2021.1956937. Confirmed by a live lookup at https://doi.org/10.1080/01621459.2021.1956937.
- **Type**: Journal article (Journal of the American Statistical Association)
- **Method**: A class of regression models with univariate probability distributions as predictors and distributions or scalars as responses, defined through the tangent bundle of the Wasserstein space.
- **Key Findings**: In simulations the distribution-to-distribution model performs better than mapping distributions to a Hilbert space by the log quantile density transformation followed by functional regression. The paper derives asymptotic convergence rates for the regression operator and for predicted distributions and extends the model to distributional time series. It is illustrated on human mortality data and house price distributions.
- **Relevance**: It addresses P1 and P2 for one-dimensional distributions: a regression on distribution-valued predictors through transport geometry.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 166 citations.
- **Potential Use**: Method background (regression with distributions as predictors).
- **Stance**: Supports, regression in Wasserstein tangent spaces over a transformation to a Hilbert space.
- **Prediction setting**: other (distribution-to-scalar and distribution-to-distribution regression on mortality and house price data), input distribution or set of vectors; each predictor is a univariate distribution.
- **Correspondence handling**: transport coupling; distributions are mapped to tangent spaces of the Wasserstein space by transport, and the abstract does not name the base point of the tangent space.
- **Pipeline relation**: not applicable; the data are demographic and economic distributions.
- **Application domain**: other domain, demography (human mortality) and house prices.
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Chen Lin Muller Wasserstein regression); merge screening reason: regression with distributions as predictors and scalar or distributional responses

#### Chen et al. (2024). TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance.
- **Citation key**: [chen2024tractgeonet]
- **Identifier**: DOI 10.1016/j.media.2024.103120; PMID 38458095. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2024.103120.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: A point cloud network regresses scores from all points of a dMRI fiber tract with their microstructure measures, trained with a Paired-Siamese Regression loss, with a Critical Region Localization algorithm for interpretation.
- **Key Findings**: On 20 association tracts from 806 subjects of the Human Connectome Project Young Adult dataset, TractGeoNet predicted two language assessment scores better than several regression models used for cognitive prediction from neuroimaging features. The left arcuate fasciculus was the most predictive tract, and the critical regions were spread across both hemispheres and all cerebral lobes.
- **Relevance**: It is a direct case of P1: subject-level regression from point clouds of tract points, which removes the averaging or binning along streamlines that tractometry requires.
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 14 citations.
- **Potential Use**: Related work (point-cloud networks on medical point clouds for subject-level regression).
- **Stance**: Supports, point-cloud regression on tract points over regression on tract summary features.
- **Prediction setting**: subject-level regression, input point cloud; each subject's tract is a point cloud and the target is the subject's language assessment score.
- **Correspondence handling**: permutation invariance; the network takes all points of a tract without averaging along streamlines, and the abstract does not state a point correspondence across subjects.
- **Pipeline relation**: not applicable; the step it removes is along-tract averaging or binning of tractometry, which is none of registration, radiomics or lesion segmentation, and the abstract does not state how the 20 tracts are identified in each subject.
- **Application domain**: medical imaging, diffusion MRI tractography, brain white matter.
- **Theme tags**: T3d, T3b.
- **Theme**: added: handed on by Theme 3 (TractGeoNet); merge screening reason: point cloud regression on tract points with microstructure for language performance (806 subjects)

#### Chen et al. (2026). Distributionally Robust Set Representation Learning Under Inference-Time Element Corruption.
- **Citation key**: [chen2026distributionally]
- **Identifier**: arXiv 2605.30089. Confirmed by a live lookup at https://arxiv.org/abs/2605.30089.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: SW-DRSO is a distributionally robust optimization framework for set representation learning that optimizes a tractable surrogate of the worst-case expected loss over plausible inference-time corruptions, with a barycentric adversary that optimizes simplex weights during training.
- **Key Findings**: The abstract states that standard set representation methods overlook element-level degradations at inference, such as outliers or missing components. Experiments across four tasks show improved robustness to corruption while overall performance stays high. The abstract does not name the tasks or report numbers.
- **Relevance**: It addresses P2 from the failure side: it targets how permutation-invariant set encoders degrade when elements are corrupted or missing, as can happen with lesion or point sets.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (robustness of set encoders to element corruption)
- **Stance**: Supports, that robust training reduces the sensitivity of set representations to corrupted or missing elements.
- **Prediction setting**: other (set-level prediction on four tasks the abstract does not name), input distribution or set of vectors; each input is a set.
- **Correspondence handling**: permutation invariance; the method trains set representations, and its barycentric adversary reweights elements rather than defining a template.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, set representation learning (tasks not named in the abstract).
- **Theme tags**: T3a, T3e.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Chen et al. (2026). Enhancing Alzheimer's Diagnosis: Leveraging Anatomical Landmarks in Graph Convolutional Neural Networks on Tetrahedral Meshes.
- **Citation key**: [chen2026enhancing]
- **Identifier**: DOI 10.1007/978-3-031-96625-5_5; arXiv 2503.05031; PMID 41799028. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-96625-5_5.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: A transformer-based geometric deep learning model on tetrahedral brain meshes from structural MRI, with a tokenization scheme that incorporates anatomical landmarks generated by a pre-trained Gaussian process model and is robust to variations in mesh size.
- **Key Findings**: The model achieves superior classification performance in Alzheimer's disease classification. It also generalizes to predicting brain amyloid positivity in individuals of the medium risk group, where blood-based biomarkers alone do not give a clear classification. The abstract does not report numbers or the number of subjects.
- **Relevance**: It addresses P1 and P2: a subject-level diagnosis is predicted from meshes of varying size, with landmarks from a learned shape model supplying shared anatomical reference points.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (mesh networks for subject-level prediction in neuroimaging)
- **Stance**: Supports, that landmark-informed mesh transformers classify Alzheimer's disease and amyloid positivity from structural MRI.
- **Prediction setting**: subject-level classification, input mesh or surface; Alzheimer's disease and amyloid positivity are classified per individual.
- **Correspondence handling**: learned template or barycenter; the paper uses anatomical landmarks generated by a pre-trained Gaussian process model, a reference estimated from data and shared across subjects, which places it under this category.
- **Pipeline relation**: not applicable; the abstract does not describe a registration, radiomics or lesion-segmentation step or how the meshes are produced.
- **Application domain**: medical imaging, brain structural MRI.
- **Theme tags**: T3d, `reg-template`.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: transformer on tetrahedral meshes with landmark tokens, AD and amyloid (PMID 41799028, arXiv 2503.05031)

#### Chen et al. (2026). Beyond the LUMIR challenge: The pathway to foundational registration models.
- **Citation key**: [chen2026lumir]
- **Identifier**: DOI 10.1016/j.media.2026.104175, PMID 42361771. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2026.104175.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: The Large-scale Unsupervised Brain MRI Image Registration (LUMIR) challenge, with 4,014 unlabeled T1-weighted MRIs for training, 590 in-domain test subjects and zero-shot tasks across disease populations, imaging protocols and species.
- **Key Findings**: Deep learning methods consistently achieved state-of-the-art performance and produced anatomically plausible, diffeomorphic deformation fields. They outperformed several leading optimization-based methods and remained robust to most domain shifts.
- **Relevance**: It addresses P3 by measuring how inter-subject brain registration holds up under shifts in disease, protocol and species.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 3. OpenAlex counts 17 citations.
- **Potential Use**: Introduction (state of registration) and Discussion and limitations.
- **Stance**: Supports, deep learning registration as a basis for general-purpose medical image registration.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the challenge evaluates registration between brain MRIs.
- **Correspondence handling**: registration to a common space; the methods compute deformation fields between subjects' brain MRIs.
- **Pipeline relation**: builds on registration, measures how a pipeline step fails; the challenge evaluates registration methods in-domain and under zero-shot domain shifts.
- **Application domain**: medical imaging, T1-weighted MRI of the brain.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (LUMIR); merge screening reason: unsupervised brain registration challenge with zero-shot tests across disease, protocol and species

#### Chen et al. (2026). From Screening to Differential Diagnosis: Benchmarking 3D Facial Representations Across Craniofacial Conditions.
- **Citation key**: [chen2026screening]
- **Identifier**: DOI 10.64898/2026.11.12.766227. Confirmed by a live lookup at https://doi.org/10.64898/2026.11.12.766227.
- **Type**: Preprint (bioRxiv); Preprint, not peer-reviewed.
- **Method**: Benchmarks PointNet, PointNet++, DGCNN and a geometric baseline on 26,990 3D facial scans from 18,785 subjects across four prediction tasks, without landmark registration, dense correspondence or template fitting, with prototype inference, patient retrieval and region-occlusion analysis.
- **Key Findings**: Broad affected-versus-unaffected screening reached accuracy 0.893 and AUC 0.956, with substantial influence of cohort composition and demographics in sensitivity analyses. Fine-grained syndrome diagnosis had limited top-1 accuracy; combining repeated scans improved patient-level diagnosis, and prototype inference placed the correct syndrome in the top five for about 65 percent of held-out patients across 49 diagnoses. Region-occlusion analysis gave syndrome-dependent facial importance patterns.
- **Relevance**: A subject-level classifier from point clouds that states the removal of landmark registration and template fitting, in a large cohort (P1, P2, P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 1, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Related work (registration-free point-cloud prediction in clinical imaging); Experimental baselines.
- **Stance**: Supports, that 3D facial point cloud models support screening and candidate prioritization without registration, with limits for fine-grained diagnosis.
- **Prediction setting**: subject-level classification, input point cloud; each subject's facial scan receives a screening or syndrome label.
- **Correspondence handling**: permutation invariance; the point cloud networks used process each scan as an unordered point set, and the abstract states that no landmark registration, dense correspondence or template fitting is used.
- **Pipeline relation**: removes registration; the abstract states that the benchmark works without landmark registration, dense correspondence or template fitting.
- **Application domain**: medical imaging, 3D facial surface scans of the face (craniofacial conditions).
- **Theme tags**: T3b, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 3 (3D facial representations craniofacial); merge screening reason: 3D facial point cloud benchmark across craniofacial conditions without landmark registration or template fitting (preprint, 18,785 subjects)

#### Choi et al. (2020). IDH1 mutation prediction using MR-based radiomics in glioblastoma: comparison between manual and fully automated deep learning-based approach of tumor segmentation.
- **Citation key**: [choi2020idh1]
- **Identifier**: DOI 10.1016/j.ejrad.2020.109031, PMID 32417712. Confirmed by a live lookup at https://doi.org/10.1016/j.ejrad.2020.109031.
- **Type**: Journal article (European Journal of Radiology)
- **Method**: A V-Net trained on manual segmentations of glioblastoma and peri-tumoral edema from pretreatment T2-weighted MRI of 45 patients, with radiomic features selected by a random forest wrapper for IDH1 prediction and compared between manual and V-Net segmentations on an external cohort of 137 patients from the Cancer Imaging Archive.
- **Key Findings**: The mean Dice coefficient on test set 1 was 0.78 (SD 0.14, range 0.34 to 0.94), and 9 of 107 features were selected. V-Net segmentation gave similar IDH1 prediction to manual segmentation (AUC 0.86 against 0.90). At the optimal cut point accuracy was 86.8 percent for manual and 75.8 percent for V-Net segmentation.
- **Relevance**: It addresses P3 by measuring how replacing manual with automated lesion segmentation changes a radiomics predictor.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 2, data 1. OpenAlex counts 37 citations. Small study (45 institutional patients; 17 of 136 patients had IDH1 mutations).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics predictors).
- **Stance**: Supports, automated deep segmentation as a substitute for manual segmentation in radiomics.
- **Prediction setting**: subject-level classification, input image on a grid; IDH1 mutation status is predicted per patient from features of the segmented tumour.
- **Correspondence handling**: not applicable; features are computed within each patient's tumour and no cross-subject correspondence is formed.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; it compares manual and automated segmentation within a radiomics pipeline.
- **Application domain**: medical imaging, T2-weighted brain MRI, glioblastoma.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Choi 2020); merge screening reason: manual against automated deep segmentation for IDH1 radiomics in glioblastoma (small training set, 45 patients)

#### Choi et al. (2025). Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework.
- **Citation key**: [choi2025prediction]
- **Identifier**: DOI 10.1016/j.compbiomed.2025.110965. Confirmed by a live lookup at https://doi.org/10.1016/j.compbiomed.2025.110965.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: A pretrained nnU-Net segments the vessels, pretrained PointNet++ models label the vessels and segment the aneurysms, latent keypoint representations serve as vessel and aneurysm shape features, and eight machine learning models classify rupture status from these and conventional features.
- **Key Findings**: The retrospective study has 335 patients with 500 aneurysms (250 ruptured, 250 unruptured). A random forest with feature selection reaches an AUC of 0.851, an accuracy of 0.782, a sensitivity of 0.804 and a specificity of 0.760, and an AUC of 0.805 on 24 external aneurysms imaged with 3D rotational angiography (the abstract lists 10 ruptured and 15 unruptured). Aneurysm shape features contributed consistently, vessel shape features only a small portion.
- **Relevance**: It addresses P2 and P3: point-cloud networks extract shape features of each aneurysm, and the pipeline keeps an automated segmentation step in front of them.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 12 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes)
- **Stance**: Supports, that automated point-cloud shape features of aneurysms help classify rupture status.
- **Prediction setting**: other (aneurysm-level rupture status classification), input point cloud; each aneurysm, not each patient, carries the label.
- **Correspondence handling**: permutation invariance; PointNet++ encodes the vessel and aneurysm point sets without a point correspondence across patients.
- **Pipeline relation**: builds on lesion segmentation; nnU-Net vessel segmentation and PointNet++ aneurysm segmentation produce the shapes that are classified.
- **Application domain**: medical imaging, CT angiography of intracranial arteries, with external 3D rotational angiography.
- **Theme tags**: T3b, T3d, `lesion-seg`.
- **Theme**: added: handed on by Theme 3 (aneurysm rupture CTA automated); merge screening reason: automated nnU-Net and PointNet++ pipeline for aneurysm rupture from CTA

#### Choi et al. (2026). Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients.
- **Citation key**: [choi2026tumor]
- **Identifier**: DOI 10.1016/j.phro.2026.100907. Confirmed by a live lookup at https://doi.org/10.1016/j.phro.2026.100907.
- **Type**: Journal article (Physics and Imaging in Radiation Oncology)
- **Method**: Three inter-patient deformable registration methods (two deep learning methods and SyN) used for voxel-based dose analysis of 240 patients with locally advanced NSCLC, followed by machine learning prediction of grade 2 or higher radiation pneumonitis.
- **Key Findings**: The tumor-aware method preserved tumor volume and organ doses best. Its voxel-based features gave an AUC of 0.78 against 0.73 and 0.71 for the other registrations and 0.69 for a mean lung dose model, and all methods found the same right-lung region.
- **Relevance**: It measures how the choice of registration changes a downstream subject-level prediction on the same cohort (P3), which the theme runs did not find for transport or set methods.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 3, relevance 3, citations 1, data 2. No OpenAlex count in the record read.
- **Potential Use**: Experimental baselines (registration-based voxel analysis as the comparator); Discussion and limitations.
- **Stance**: Supports, tumor-aware registration over standard registration when tumors distort anatomy.
- **Prediction setting**: subject-level classification, input image on a grid (planning CT and dose maps registered to a common space); the outcome is radiation pneumonitis.
- **Correspondence handling**: registration to a common space; dose maps are mapped across patients by deformable registration before voxel-based analysis.
- **Pipeline relation**: builds on registration, measures how a pipeline step fails; three registration methods are compared by their effect on the predictor.
- **Application domain**: medical imaging, thoracic CT in radiotherapy (non-small cell lung cancer).
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: merge recent-literature search R3 (2024 to 2026)

#### Ciszewski et al. (2026). Decision Stability Under Segmentation Uncertainty in CT Radiomics.
- **Citation key**: [ciszewski2026decision]
- **Identifier**: DOI 10.1109/cpee71962.2026.11768023. Confirmed by a live lookup at https://doi.org/10.1109/cpee71962.2026.11768023.
- **Type**: Conference paper (2026 27th International Conference on Computational Problems of Electrical Engineering (CPEE))
- **Method**: On 53 patients from the Adrenal-ACC-Ki67-Seg collection, six deterministic contour variants and ten random shape deformations per tumour give 901 masks, from which 107 features are extracted, and feature stability (ICC) is compared with the stability of the patient-level class decision under bootstrap intervals.
- **Key Findings**: Feature stability was high (73 of 107 features with ICC at least 0.85, median 0.942), while the reference model changed its predicted class for 7.5 percent of alternative contours under margin shifts and 13.4 percent under shape deformations, affecting 72 and 83 percent of patients at least once. The ICC threshold that most improved discrimination gave no stability gain. Aggregating predictions over the contour ensemble cut the flip rate by a factor of 16 to 24 at unchanged discrimination, and the authors show that the flip-rate metric can be gamed by a classifier that stops discriminating.
- **Relevance**: It measures how segmentation uncertainty propagates to the subject-level decision, beyond feature reproducibility (P3).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 3, relevance 3, citations 2, data 1. OpenAlex counts 0 citations. Small study (53 patients).
- **Potential Use**: Discussion and limitations (decision instability from lesion segmentation).
- **Stance**: Opposes, the assumption that feature reproducibility by ICC implies a stable subject-level decision.
- **Prediction setting**: subject-level classification, input image on a grid; the model assigns a Ki-67 class per patient from radiomic features of the tumour mask.
- **Correspondence handling**: not applicable; features are computed per tumour mask and no cross-subject correspondence is formed.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; contour perturbations are propagated through feature extraction to the class decision.
- **Application domain**: medical imaging, CT of adrenal tumours.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Cohen and Bro (2018). Nonnegative PARAFAC2: A Flexible Coupling Approach.
- **Citation key**: [cohen2018nonnegative]
- **Identifier**: DOI 10.1007/978-3-319-93764-9_9. Confirmed by a live lookup at https://doi.org/10.1007/978-3-319-93764-9_9.
- **Type**: Conference paper (Latent Variable Analysis and Signal Separation, LVA/ICA 2018, Lecture Notes in Computer Science)
- **Method**: A relaxation of the PARAFAC2 model that couples the factors of the varying mode flexibly, so that nonnegativity can be imposed on the mode that varies from one data set to another, with an algorithm to fit it.
- **Key Findings**: The abstract states that PARAFAC2 accounts for variation from one jointly analysed data set to another, and that constraints on the varying mode had not been possible before. The relaxed model allows nonnegativity on that mode, and the fitting algorithm is studied on synthetic and chemometrics data.
- **Relevance**: A fitting variant of the PARAFAC2 model for a mode that is not aligned across slices, the tensor route to the missing correspondence (P2), with no prediction.
- **Quality**: Abstract read (Springer chapter page). Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 46 citations.
- **Potential Use**: Related work (tensor decompositions with an unaligned mode); Method background (constraints on the PARAFAC2 varying mode).
- **Stance**: Supports, that the varying mode of PARAFAC2 can carry constraints when its coupling is relaxed.
- **Prediction setting**: representation or comparison only, no prediction, input tensor (a set of slices whose one mode varies from slice to slice); the output is a decomposition.
- **Correspondence handling**: learned template or barycenter; the PARAFAC2 shared factor is estimated from the data and couples the varying mode across slices, here through a flexible coupling instead of the exact cross-product constraint.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomics or lesion segmentation step.
- **Application domain**: other domain, source separation and chemometrics.
- **Theme tags**: T1-UNAL.
- **Theme**: added: handed on by Theme 1 (Cohen Bro 2018 nonnegative PARAFAC2); merge screening reason: PARAFAC2 fitting with nonnegativity on the varying mode, read on the publisher page

#### Cole, Poudel, Tsagkrasoulis, Caan, Steves, Spector and Montana (2017). Predicting brain age with deep learning from raw imaging data results in a reliable and heritable biomarker.
- **Citation key**: [cole2017predicting]
- **Type**: Journal article (NeuroImage)
- **Identifier**: DOI 10.1016/j.neuroimage.2017.07.059, PMID 28765056, arXiv 1612.02572 (preprint of the same paper); confirmed at https://doi.org/10.1016/j.neuroimage.2017.07.059, the PubMed record and https://arxiv.org/pdf/1612.02572 (read).
- **Method**: CNNs and Gaussian process regression predict age from T1-weighted MRI of 2,001 healthy adults, using either SPM gray- or white-matter maps normalized to MNI space with DARTEL, or "raw" images; heritability in 62 twins; test-retest and multi-centre reliability.
- **Key Findings**: CNN error was 4.16 years (r = 0.96) on gray matter and 4.65 years (r = 0.94) on raw data, comparable to GPR on gray matter (4.66 years). Multi-centre reliability was high for gray matter (ICC 0.83 to 0.96) and poor to moderate for white matter and raw data (0.51 to 0.77). The methods section states that the raw images still underwent a rigid six-degree-of-freedom registration to MNI152 space and resampling to a common grid.
- **Relevance**: It removes nonlinear registration and tissue segmentation but keeps rigid alignment and resampling, and it measures what removal costs in accuracy and in between-scanner reliability.
- **Quality**: Full text read (methods sections 2.2.1 and 2.2.2) and abstract.
- **Potential Use**: Evidence for, and the limit of, registration-free subject-level regression.
- **Viewpoint**: supports partial removal of preprocessing, with a reported reliability cost.
- **Prediction setting**: subject-level regression (age); image on a grid (T1-weighted MRI), raw or normalized.
- **Correspondence handling**: registration to a common space in reduced form; rigid alignment only for the raw input, and nonlinear normalization for the tissue maps.
- **Pipeline relation**: removes registration (the nonlinear part; rigid alignment kept); builds on registration for the comparison arm; measures how a pipeline step fails (between-scanner reliability without normalization).
- **Application domain**: medical imaging, brain MRI (T1-weighted).
- **Theme tags**: `step-removal`.
- **Theme**: Theme 4

#### Collenne et al. (2024). Reset: A Residual Set-Transformer Approach to Tackle the Ugly-Duckling Sign in Melanoma Detection.
- **Citation key**: [collenne2024reset]
- **Identifier**: DOI 10.1109/icip51287.2024.10647287. Confirmed by a live lookup at https://doi.org/10.1109/icip51287.2024.10647287.
- **Type**: Conference paper (2024 IEEE International Conference on Image Processing (ICIP))
- **Method**: ReSeT, an image encoder that embeds each skin lesion of a patient and a Set-Transformer with a residual prediction layer that compares the embeddings while predicting.
- **Key Findings**: ReSeT is reported to improve performance significantly over ConvNets, and residual connections are reported to be necessary for multi-output Transformers. Self-supervised encoders give embeddings of comparable quality to supervised ones. The abstract does not state the dataset or any numbers.
- **Relevance**: It addresses P2 with a set of lesions per patient compared by a permutation-invariant attention model, following the ugly-duckling sign.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 1 citation.
- **Potential Use**: Related work (set encoders on sets of lesions).
- **Stance**: Supports, comparing a patient's lesions within the set for melanoma detection.
- **Prediction setting**: other (lesion-level melanoma classification with all lesions of a patient as context), input set of lesions or regions; the model outputs a prediction per lesion from the patient's set.
- **Correspondence handling**: permutation invariance; the Set-Transformer treats the patient's lesions as an unordered set.
- **Pipeline relation**: not applicable; the abstract does not describe registration, radiomic features or lesion segmentation.
- **Application domain**: medical imaging, dermatology images of skin lesions (the abstract does not name the modality).
- **Theme tags**: T3d.
- **Theme**: added: handed on by Theme 3 (Reset ugly duckling melanoma); merge screening reason: set transformer over all skin lesions of a patient for melanoma detection (ugly-duckling sign)

#### Commowick, Istace, Kain, et al. (2018). Objective evaluation of multiple sclerosis lesion segmentation using a data management and processing infrastructure.
- **Citation key**: [commowick2018objective]
- **Type**: Journal article (Scientific Reports)
- **Identifier**: DOI 10.1038/s41598-018-31911-7, PMID 30209345; confirmed at https://doi.org/10.1038/s41598-018-31911-7 and the PubMed record.
- **Method**: The MICCAI 2016 MS lesion segmentation challenge: 13 methods evaluated automatically on 53 cases from four centers under a common acquisition protocol, each case annotated by seven experts.
- **Key Findings**: Automatic algorithms, including random forests and deep learning, still trailed human expertise on detection and delineation. A statistically robust consensus of the algorithms came closer to human expertise on segmentation but still trailed on detection.
- **Relevance**: It is the MS lesion challenge named in the theme scope, and it measures lesion detection, which decides the membership of a lesion set, separately from delineation.
- **Quality**: Abstract read.
- **Potential Use**: MS lesion segmentation benchmark; detection versus delineation.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (brain MRI).
- **Correspondence handling**: not applicable.
- **Pipeline relation**: builds on lesion segmentation; measures how a pipeline step fails (algorithms against seven raters).
- **Application domain**: medical imaging, brain MRI, multiple sclerosis.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: Theme 4

#### Consagra et al. (2024). Continuous and atlas-free analysis of brain structural connectivity.
- **Citation key**: [consagra2024continuous]
- **Identifier**: DOI 10.1214/23-aoas1858. Confirmed by a live lookup at https://doi.org/10.1214/23-aoas1858.
- **Type**: Journal article (The Annals of Applied Statistics)
- **Method**: Each subject's pattern of white matter fiber tract endpoints is modelled as driven by a latent smooth random function on a product manifold domain, and a data-driven reduced-rank function space is constructed for statistical analysis of these functional data objects.
- **Key Findings**: On real data from the Human Connectome Project the method outperforms approaches that use the atlas-based structural connectivity representation on a variety of connectivity analysis tasks; the abstract does not state which tasks or any numbers. The method is also used to detect localized regions and connectivity patterns associated with group differences.
- **Relevance**: It addresses P3 by removing the atlas parcellation step, in which regions of interest are fixed a priori from a brain atlas, and replacing the region-by-region adjacency matrix with a continuous function.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 7 citations.
- **Potential Use**: Related work (atlas-free and registration-free representations of brain data).
- **Stance**: Supports, the removal of the a priori atlas parcellation from connectivity analysis.
- **Prediction setting**: representation or comparison only, no prediction, input mesh or surface; the abstract describes connectivity analysis tasks and group-difference detection on functions over a product manifold and does not state a subject-level prediction.
- **Correspondence handling**: assumes alignment; all subjects' endpoint patterns are modelled on one product manifold domain with a shared reduced-rank function space, and the abstract does not state how subjects are brought onto that domain.
- **Pipeline relation**: removes registration; it removes the atlas-based parcellation into regions of interest, the step that places subjects on a fixed atlas, and the abstract does not state whether a surface registration remains.
- **Application domain**: medical imaging, brain structural connectivity from white matter fiber tracts (Human Connectome Project); the abstract does not name the modality.
- **Theme tags**: `step-removal`, `reg-template`.
- **Theme**: added: handed on by Theme 1 (continuous atlas-free connectivity 2024); merge screening reason: atlas-free continuous model of structural connectivity that removes the atlas parcellation step

#### Costafreda et al. (2011). Automated hippocampal shape analysis predicts the onset of dementia in mild cognitive impairment.
- **Citation key**: [costafreda2011automated]
- **Identifier**: DOI 10.1016/j.neuroimage.2011.01.050; PMID 21272654. Confirmed by a live lookup at https://doi.org/10.1016/j.neuroimage.2011.01.050.
- **Type**: Journal article (NeuroImage)
- **Method**: An automated analysis extracts and maps the hippocampus from structural MRI to obtain 3D hippocampal shape, and machine learning classification predicts conversion from MCI to Alzheimer's disease.
- **Key Findings**: In 103 MCI subjects from the AddNeuroMed study, the model predicts conversion to dementia within a year with 80% accuracy (sensitivity 77%, specificity 80%), competitive with models based on manual measurements. Subjects predicted to convert show faster decline in MMSE and CERAD verbal memory (p below 0.01). The atrophy pattern linked to conversion starts in the anterior CA1 subregion.
- **Relevance**: It addresses P1 and P3: a subject-level conversion outcome is predicted from hippocampal shape after an automated extraction and mapping step.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 238 citations.
- **Potential Use**: Related work (shape-based subject-level prediction built on registration)
- **Stance**: Supports, that automated hippocampal shape analysis predicts conversion from MCI to dementia.
- **Prediction setting**: subject-level classification, input mesh or surface; each MCI subject is classified as converting or stable.
- **Correspondence handling**: registration to a common space; the abstract describes an automated extraction and mapping of the hippocampus before classification, and does not detail the mapping.
- **Pipeline relation**: builds on registration; the shape features come from an automated mapping of the hippocampus.
- **Application domain**: medical imaging, structural brain MRI, hippocampus.
- **Theme tags**: `reg-template`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Cuingnet et al. (2011). Automatic classification of patients with Alzheimer's disease from structural MRI: A comparison of ten methods using the ADNI database.
- **Citation key**: [cuingnet2011automatic]
- **Identifier**: DOI 10.1016/j.neuroimage.2010.06.013; PMID 20542124. Confirmed by a live lookup at https://doi.org/10.1016/j.neuroimage.2010.06.013.
- **Type**: Journal article (NeuroImage)
- **Method**: Ten classification approaches (five voxel-based, three cortical-thickness-based and two hippocampus-based) are compared on the same ADNI subjects for CN against AD, CN against MCI converters and MCI converters against non-converters, with DARTEL compared with SPM5 unified segmentation.
- **Key Findings**: On 509 ADNI subjects, whole-brain methods reached up to 81% sensitivity and 95% specificity for AD against CN, sensitivity was much lower for prodromal AD, and no classifier predicted conversion significantly better than chance. DARTEL registration significantly improved six of 20 classification experiments and lowered two, and feature selection did not improve performance.
- **Relevance**: It addresses P1 and P3: subject-level classification on a common space, with the registration method compared as a variable.
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 1092 citations.
- **Potential Use**: Experimental baselines (registration-based classifiers of AD from MRI).
- **Stance**: Neutral.
- **Prediction setting**: subject-level classification, input image on a grid; each subject is labelled CN, MCI or AD from T1-weighted MRI.
- **Correspondence handling**: registration to a common space; the voxel-based methods compare subjects after DARTEL or SPM5 normalization.
- **Pipeline relation**: builds on registration; measures how a pipeline step fails; the registration method changes classification results in eight of 20 experiments.
- **Application domain**: medical imaging, T1-weighted MRI of the brain, Alzheimer's disease and MCI.
- **Theme tags**: `reg-analysis`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport.
- **Citation key**: [cuturi2013sinkhorn]
- **Type**: Conference paper (NeurIPS 26).
- **Method**: Entropic regularization of the optimal transport linear program, solved by Sinkhorn-Knopp matrix scaling.
- **Key Findings**: The regularized optimum is itself a distance and is computed several orders of magnitude faster than with transportation solvers. The paper reports better performance than classical transport distances on the MNIST benchmark.
- **Relevance**: The solver under every entropic method of this theme, including the averaging, template and alignment methods of the imaging works.
- **Quality**: High (venue, foundational). Read: abstract and the sections on the regularized problem and the algorithm (arXiv HTML full text). Cited 3370 times in OpenAlex on 2026-11-19.
- **Potential Use**: Background on transport couplings and their computation.
- **Identifier**: arXiv 1306.0895; https://proceedings.neurips.cc/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html (confirmed); arXiv record confirmed.
- **Prediction setting**: Representation or comparison only, no prediction; input histograms (images on a grid). The distance is evaluated inside a benchmark classifier, not as a subject-level model.
- **Correspondence handling**: Transport coupling; the coupling between histogram bins is solved for each pair.
- **Pipeline relation**: Not applicable; no imaging pipeline is studied.
- **Application domain**: Other domain (handwritten digit images).
- **Theme tags**: T2a.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Citation key**: [cuturi2014fast]
- **Type**: Conference paper (ICML, PMLR 32).
- **Method**: Subgradient algorithms for the Wasserstein barycenter of empirical measures, smoothed with an entropic regularizer so that gradients come from matrix scaling.
- **Key Findings**: Smoothing gives a strictly convex objective with cheap gradients; the algorithms visualize a large family of images and solve a constrained clustering problem.
- **Relevance**: The first scalable barycenter algorithm, used to build templates from unaligned samples.
- **Quality**: High. Read: abstract and the method sections (arXiv HTML full text). Cited 871 times in OpenAlex on 2026-11-19.
- **Potential Use**: Barycenter computation.
- **Identifier**: arXiv 1310.4375; https://proceedings.mlr.press/v32/cuturi14.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input empirical measures (point clouds) and images on a grid.
- **Correspondence handling**: Learned template or barycenter.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (images, clustering).
- **Theme tags**: T2c, T2a.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Dadashkarimi et al. (2023). Cross Atlas Remapping via Optimal Transport (CAROT): Creating connectomes for different atlases when raw data is not available.
- **Citation key**: [dadashkarimi2023cross]
- **Identifier**: DOI 10.1016/j.media.2023.102864; PMID 37352650. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2023.102864.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: CAROT finds an optimal transport mapping between two brain atlases, so that data already parcellated with one atlas can be turned into a connectome of another atlas without access to the raw voxelwise time series.
- **Key Findings**: Reconstructed connectomes are compared with connectomes built directly from each atlas, and the transformed connectomes are shown to be useful in downstream analyses. A connectome-based predictive model generalizes to public data processed with different atlases. The tool is released as source code and a web application; the abstract does not state the prediction target or the sample size.
- **Relevance**: It addresses P2 and P3: the region correspondence between two parcellations is a transport map, which replaces reprocessing the raw data with a second atlas.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 14 citations.
- **Potential Use**: Related work (transport-based registration-free fusion in medical imaging)
- **Stance**: Supports, that a transport map between atlases can stand in for reprocessing raw data when connectomes come from different parcellations.
- **Prediction setting**: other (cross-atlas connectome remapping, evaluated with a connectome-based predictive model whose target the abstract does not state), input graph; the main output is a remapped connectome.
- **Correspondence handling**: transport coupling; the regions of one atlas are mapped to those of another by an optimal transport plan.
- **Pipeline relation**: builds on registration; it starts from data already registered and parcellated with one atlas and replaces the re-parcellation of raw data with a second atlas.
- **Application domain**: medical imaging, brain functional connectomes from voxelwise time series (the abstract does not name the scanner modality).
- **Theme tags**: T2f, `reg-analysis`.
- **Theme**: added: handed on by Theme 2 (Dadashkarimi 2023 CAROT); merge screening reason: optimal transport mapping of connectomes between atlas parcellations without raw data

#### Dalca, Rakic, Guttag and Sabuncu (2019). Learning conditional deformable templates with convolutional networks.
- **Citation key**: [dalca2019learning]
- **Type**: Conference paper (NeurIPS 2019, Advances in Neural Information Processing Systems 32)
- **Identifier**: arXiv 1908.02738; proceedings page confirmed at https://proceedings.neurips.cc/paper_files/paper/2019/hash/bbcbff5c1f1ded46c25d28119a85c6c2-Abstract.html (citation_title and authors read from the page). Peer-reviewed proceedings; the arXiv record is the preprint of the same paper.
- **Method**: A probabilistic model and learning strategy that yields universal or conditional templates (templates that depend on attributes such as age) jointly with a network that aligns images to them.
- **Key Findings**: The abstract states that conventional template construction iterates template estimation and alignment and is expensive, so most studies use one template per population. The learned method gives conditional templates efficiently and is demonstrated with a focus on neuroimaging.
- **Relevance**: It is the learned-template answer to missing correspondence, the same category the research question names for transport barycenters, with the template conditioned on subject attributes.
- **Quality**: Abstract read (arXiv). Peer-reviewed at NeurIPS.
- **Potential Use**: Learned templates as an intermediate between fixed-template registration and template-free methods; link to Theme 2 barycenters.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (brain MRI and other domains); the output is a template and alignments.
- **Correspondence handling**: learned template or barycenter; the template is learned with the alignment network, optionally conditioned on attributes.
- **Pipeline relation**: builds on registration; it removes the precomputed template, not the registration to it.
- **Application domain**: medical imaging, brain MRI, with other domains also reported in the abstract.
- **Theme tags**: `reg-template`.
- **Theme**: Theme 4

#### Dannecker et al. (2026). CINeMA: Conditional Implicit Neural Multi-Modal Atlas for a Spatio-Temporal Representation of the Perinatal Brain.
- **Citation key**: [dannecker2026cinema]
- **Identifier**: DOI 10.1109/tmi.2025.3605194. Confirmed by a live lookup at https://doi.org/10.1109/tmi.2025.3605194.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: CINeMA, a conditional implicit neural framework that builds high-resolution spatio-temporal multimodal brain atlases in latent space, conditioned on gestational age, birth age and pathologies.
- **Key Findings**: Operating in latent space avoids compute-intensive image registration and reduces atlas construction time from days to minutes. The atlas supports tissue segmentation, age prediction, synthetic data creation and data augmentation, and is reported to surpass state-of-the-art methods in accuracy, efficiency and versatility. The abstract does not state the number of subjects or any numbers.
- **Relevance**: It addresses P2 and P3: a learned atlas that removes image registration from atlas construction.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 5 citations.
- **Potential Use**: Related work (learned templates without registration).
- **Stance**: Supports, building atlases in latent space without image registration.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the output is an atlas, and age prediction is named as a downstream task.
- **Correspondence handling**: learned template or barycenter; the paper calls it a conditional atlas, and it falls under this category because it is learned from the data in latent space.
- **Pipeline relation**: removes registration; the abstract states that CINeMA avoids image registration in atlas construction.
- **Application domain**: medical imaging, fetal and neonatal brain MRI.
- **Theme tags**: `reg-template`, `step-removal`.
- **Theme**: added: handed on by Theme 4 (CINeMA); merge screening reason: conditional implicit atlas built in latent space without image registration, with age prediction downstream

#### Davidson and Dym (2025). On the Holder Stability of Multiset and Graph Neural Networks.
- **Citation key**: [davidson2025holder]
- **Type**: Conference paper (ICLR 2025).
- **Identifier**: arXiv 2406.06984; https://proceedings.iclr.cc/paper_files/paper/2025/hash/89d0d5c2f720921df93bbb8fef514571-Abstract-Conference.html (proceedings page read through `the lookup script bibtex --page`).
- **Method**: a pairwise separation-quality analysis, Holder stability in expectation, for parametric multiset and graph functions.
- **Key Findings**: Separation in theory can be so weak that embeddings of separable objects are identical at finite precision. Common sum-based models are lower-Holder in expectation with an exponent that decays rapidly with depth. Two new message-passing networks, one sort-based, improve separation quality.
- **Relevance**: it measures how sum-pooled set encoders fail to separate inputs in practice, and names sort-based aggregation as a replacement.
- **Prediction setting**: representation or comparison only, no prediction, in the theory; graph classification and regression benchmarks in the experiments.
- **Correspondence handling**: permutation invariance (sum or sort aggregation).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (theory; molecular and graph benchmarks).
- **Theme tags**: T3e.
- **Quality**: abstract and section list read in the arXiv HTML full text. Peer-reviewed; OpenAlex cited_by_count of the arXiv record 12. Quick assessment 11 of 15.
- **Viewpoint**: opposes sum pooling as a stable separator.
- **Potential Use**: failure analysis of sum pooling; sort-based pooling as the method in its place.
- **Theme**: Theme 3

#### Devilliers et al. (2017). Inconsistency of Template Estimation with the Frechet Mean in Quotient Space.
- **Citation key**: [devilliers2017inconsistency]
- **Identifier**: DOI 10.1007/978-3-319-59050-9_2; arXiv 1703.01232. Confirmed by a live lookup at https://doi.org/10.1007/978-3-319-59050-9_2.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: Theoretical analysis of template estimation by the Frechet mean in quotient space when data are transformed by an isometric group action with noise, and of the max-max algorithm.
- **Key Findings**: The consistency bias grows linearly with the noise level, so inconsistency is unavoidable once the noise is large enough. The max-max algorithm converges to an empirical Karcher mean, and the numerical experiments attribute the observed bias to the inconsistency after ruling out small sample size and convergence problems.
- **Relevance**: It addresses P2 and P3 by showing that a template estimated by aligning noisy observations is biased, a failure of the template step that registration pipelines rely on.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 3, relevance 2, citations 1, data 2. OpenAlex counts 5 citations.
- **Potential Use**: Discussion and limitations (bias of estimated templates).
- **Stance**: Opposes, the assumption that template estimation by the Frechet mean in quotient space is consistent under noise.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the data are observations under an isometric group action, and the abstract does not name a data type.
- **Correspondence handling**: learned template or barycenter; the paper calls it a template estimated as the Frechet mean in quotient space from the data.
- **Pipeline relation**: measures how a pipeline step fails; it quantifies the bias of template estimation, the step that template-based registration builds on.
- **Application domain**: other domain, theory of template estimation; the abstract names no application.
- **Theme tags**: `reg-template`, `failure`.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: inconsistency of template estimation with the Frechet mean (arXiv 1703.01232)

#### De Vries et al. (2025). Geometric deep learning and multiple-instance learning for 3D cell-shape profiling.
- **Citation key**: [devries2025geometric]
- **Identifier**: DOI 10.1016/j.cels.2025.101229. Confirmed by a live lookup at https://doi.org/10.1016/j.cels.2025.101229.
- **Type**: Journal article (Cell Systems)
- **Method**: MorphoMIL combines geometric deep learning on 3D point clouds of cell and nuclear shapes with attention-based multiple-instance learning to profile shapes at single-cell and population levels.
- **Key Findings**: Applied to over 95,000 melanoma cells under chemical and genetic perturbations, the pipeline accurately predicted drug perturbations and cell states. The abstract reports superior performance, generalization across diverse datasets, and interpretable links between shapes and signaling activity; it gives no numbers.
- **Relevance**: It bears on P1 and P2 with attention MIL over sets of point clouds for a population-level label, the same structure as a subject described by a set of shapes.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 3. OpenAlex counts 28 citations.
- **Potential Use**: Related work (multiple-instance learning over sets of point clouds).
- **Stance**: Supports, attention MIL over point-cloud encodings for population-level morphological profiling.
- **Prediction setting**: other (population-level prediction of drug perturbations and cell states), input point cloud; each label belongs to a cell population, and no subjects are studied.
- **Correspondence handling**: permutation invariance; point-cloud networks encode each cell without point correspondence and attention MIL pools the cells of a population without matching them.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomic or lesion-segmentation step.
- **Application domain**: other domain, 3D cell and nuclear shape profiling of melanoma cells; the abstract does not name the imaging modality.
- **Theme tags**: T3c, T3b.
- **Theme**: added: handed on by Theme 3 (cell shape geometric MIL); merge screening reason: geometric deep learning with attention MIL over sets of 3D cell point clouds for population-level prediction

#### De Vries et al. (2025). Interpretable Point Cloud Classification Using Multiple Instance Learning.
- **Citation key**: [devries2025interpretable]
- **Identifier**: DOI 10.1109/iccv51701.2025.02062; open-access page https://openaccess.thecvf.com/content/ICCV2025/html/De_Vries_Interpretable_point_cloud_classification_using_multiple_instance_learning_ICCV_2025_paper.html (ICCV 2025, pages 22209 to 22220). Confirmed by a live lookup at https://doi.org/10.1109/iccv51701.2025.02062.
- **Type**: Conference paper (IEEE/CVF International Conference on Computer Vision, ICCV 2025)
- **Method**: PointMIL places standard point-cloud backbones and feature aggregation strategies in a multiple instance learning framework, so that classification comes with point-level explanations without post hoc analysis.
- **Key Findings**: PointMIL reaches a mean accuracy of 97.3 percent and an F1 of 97.5 percent on the IntrA biomedical data set, with interpretability evaluated by quantitative and qualitative metrics. The paper introduces ATLAS-1, a data set of drug-treated 3D cancer cells, on which PointMIL captures morphological effects of chemical treatments, and it generalises to ModelNet40 and ScanObjectNN.
- **Relevance**: Joins point-cloud networks with multiple instance pooling for the classification of biomedical shapes without a shared grid (P2), with labels for vessel segments and cells rather than subjects.
- **Quality**: Abstract read (CVF open-access page). Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 1, data 3. OpenAlex counts 4 citations.
- **Potential Use**: Related work (point-cloud networks; multiple-instance learning and distribution regression); Experimental baselines (MIL pooling over point-cloud backbones).
- **Stance**: Supports, that MIL pooling over point features improves point-cloud classification and gives point-level explanations.
- **Prediction setting**: other (shape-level classification of vessel segments, cells and objects), input point cloud; each point cloud is a bag of points with one label.
- **Correspondence handling**: permutation invariance; the MIL aggregation pools the point features of each cloud with a symmetric operation, and no correspondence between clouds is built.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomics or lesion segmentation step.
- **Application domain**: medical imaging, 3D vessel segments (IntrA) and 3D cancer cell shapes (ATLAS-1), with general 3D object benchmarks.
- **Theme tags**: T3b, T3c.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Dietterich et al. (1997). Solving the multiple instance problem with axis-parallel rectangles.
- **Citation key**: [dietterich1997solving]
- **Identifier**: DOI 10.1016/s0004-3702(96)00034-3; author copy https://web.engr.oregonstate.edu/~tgd/publications/aij-musk-corrected.pdf. Confirmed by a live lookup at https://doi.org/10.1016/s0004-3702(96)00034-3.
- **Type**: Journal article (Artificial Intelligence, volume 89)
- **Method**: Three kinds of algorithms that learn axis-parallel rectangles for the multiple instance problem, in which one example object has many alternative feature vectors (instances) and only one of them may be responsible for its observed class, with artificial data used to debug and compare the algorithms.
- **Key Findings**: Algorithms that ignore the multiple instance problem perform very poorly. The algorithm that tries to identify which feature vectors are responsible for the observed classifications performs best, with 89 percent correct predictions on a musk odour prediction task.
- **Relevance**: The work that defines the multiple instance problem, the label-on-a-bag setting that later subject-level predictors from sets of lesions, regions or patches inherit (P1, P2).
- **Quality**: Abstract and introduction read (author copy of the corrected version). Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 3308 citations. Foundational work before 2013, admitted on the seminal path.
- **Potential Use**: Introduction (origin of the multiple instance setting); Related work (multiple-instance learning and distribution regression); Method background.
- **Stance**: Supports, that methods which model which instance carries the label outperform those that ignore the bag structure.
- **Prediction setting**: other (molecule-level prediction of musk odour), input distribution or set of vectors (the conformations of one molecule); each molecule is a bag of feature vectors with one label.
- **Correspondence handling**: permutation invariance; a bag is labelled positive when any of its instances falls inside the learned rectangle, a rule that does not depend on the order of the instances or on any matching between bags.
- **Pipeline relation**: not applicable; the paper has no imaging pipeline.
- **Application domain**: other domain, drug activity prediction (musk molecules).
- **Theme tags**: T3c.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Ding and Baras (2026). Application and characterization of the multiple instance learning framework in flow cytometry.
- **Citation key**: [ding2026application]
- **Identifier**: DOI 10.1038/s41598-025-32093-9. Confirmed by a live lookup at https://doi.org/10.1038/s41598-025-32093-9.
- **Type**: Journal article (Scientific Reports)
- **Method**: A series of multiple-instance learning frameworks with attention for automated analysis of flow cytometry data, treating each sample's cells as instances.
- **Key Findings**: The models are reported to perform strongly on cancer subtyping from tumour-infiltrating immune cells, HIV survival stratification, AML minimal residual disease prediction and COVID-19 severity assessment. The study examines how architecture affects performance and detection of rare cell populations. Attention identifies phenotype-associated cell subsets as an alternative to manual gating; the abstract gives no figures.
- **Relevance**: Subject-level prediction from unordered sets of cells with attention MIL across several clinical tasks (P1, P2).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Related work (multiple-instance learning on cell sets).
- **Stance**: Supports, that multiple-instance learning is a scalable and interpretable alternative to manual gating.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; each sample's set of cells receives a clinical label.
- **Correspondence handling**: permutation invariance; attention-based MIL pools the cells of a sample without correspondence between cells of different samples.
- **Pipeline relation**: not applicable; the step replaced is manual gating in cytometry, outside the imaging pipeline.
- **Application domain**: other domain, flow cytometry in oncology, infectious disease and haematology.
- **Theme tags**: T3c.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Dole et al. (2025). Enhancing airway obstruction diagnosis with multimodal 3D shape analysis.
- **Citation key**: [dole2025enhancing]
- **Identifier**: DOI 10.1007/s11548-025-03527-6; PMID 41085926. Confirmed by a live lookup at https://doi.org/10.1007/s11548-025-03527-6.
- **Type**: Journal article (International Journal of Computer Assisted Radiology and Surgery)
- **Method**: CBCT scans are segmented automatically to extract 3D airway morphology, which is analysed by a model that combines multi-view and point cloud representations for classification and regression.
- **Key Findings**: The abstract reports 81.88% accuracy for classifying the presence or absence of adenoid hypertrophy and improved prediction of the nasopharynx airway obstruction ratio. It states that the model performs well on severe cases and needs refinement across all severity levels. The abstract does not state the number of scans or patients.
- **Relevance**: It addresses P1 with patient-level classification and regression from a point cloud of an anatomical structure, and P3 because the structure comes from an automatic segmentation.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 1 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes).
- **Stance**: Supports, combined point-cloud and multi-view shape analysis for airway obstruction assessment.
- **Prediction setting**: subject-level classification, input point cloud; the labels are adenoid hypertrophy presence and, by regression, the airway obstruction ratio of each patient.
- **Correspondence handling**: permutation invariance; the point cloud branch takes each patient's airway without point correspondence, and the abstract does not state how the views are oriented across patients.
- **Pipeline relation**: builds on lesion segmentation; the airway is segmented automatically from CBCT before shape analysis, a segmentation of an anatomical structure.
- **Application domain**: medical imaging, cone-beam CT, upper airway (nasopharynx).
- **Theme tags**: T3d, T3b.
- **Theme**: added: handed on by Theme 3 (airway obstruction 3D shape); merge screening reason: point cloud and multi-view shape analysis of automatically segmented airways for adenoid obstruction (1,215 CBCT scans)

#### Dular, Pernus and Spiclin (2024). Extensive T1-weighted MRI preprocessing improves generalizability of deep brain age prediction models.
- **Citation key**: [dular2024extensive]
- **Type**: Journal article (Computers in Biology and Medicine)
- **Identifier**: DOI 10.1016/j.compbiomed.2024.108320, PMID 38531250; confirmed at https://doi.org/10.1016/j.compbiomed.2024.108320 (resolves to the Elsevier linking page), the PubMed record and the Crossref record. The PubMed record states that it updates the bioRxiv preprint 10.1101/2023.05.10.540134; the peer-reviewed version is cited.
- **Method**: Four deep brain age models from the literature trained and tested under four T1-weighted preprocessing pipelines that differ in registration transform (rigid or affine to a brain atlas), grayscale correction and software implementation, with evaluation on new datasets and sites.
- **Key Findings**: The choice of software or preprocessing steps changed the prediction error by up to 0.75 years of mean absolute error for the same model and dataset. Affine rather than rigid registration to the atlas improved the error significantly, while grayscale correction had no significant effect. Models trained on 3D images at 1 mm isotropic resolution were less sensitive to the preprocessing than 2D or downsampled 3D models. The authors state that extensive preprocessing improved error on a new dataset, against the view that minimally preprocessed scans generalize better to unseen scanners, and that an offset correction was needed for every model to generalize across sites.
- **Relevance**: It measures how the registration step changes a subject-level predictor, and it tests the claim behind registration-light brain age models such as `cole2017predicting`.
- **Quality**: Abstract read.
- **Potential Use**: Counter-evidence to the view that removing registration costs nothing in cross-site prediction; the registration transform as a measured factor.
- **Viewpoint**: opposes the view that minimally preprocessed input generalizes better.
- **Prediction setting**: subject-level regression (age); image on a grid (T1-weighted MRI after one of four preprocessing pipelines).
- **Correspondence handling**: registration to a common space; rigid or affine alignment to a brain atlas, compared as a factor.
- **Pipeline relation**: builds on registration; measures how a pipeline step fails (registration transform and software change the prediction error).
- **Application domain**: medical imaging, brain MRI (T1-weighted).
- **Theme tags**: `failure`, `reg-analysis`.
- **Theme**: Theme 4

#### Dutta et al. (2024). Robustness of magnetic resonance imaging and positron emission tomography radiomic features in prostate cancer: Impact on recurrence prediction after radiation therapy.
- **Citation key**: [dutta2024robustness]
- **Identifier**: DOI 10.1016/j.phro.2023.100530. Confirmed by a live lookup at https://doi.org/10.1016/j.phro.2023.100530.
- **Type**: Journal article (Physics and Imaging in Radiation Oncology)
- **Method**: Manual and automatic segmentations of the prostate gland and intraprostatic tumours on T2-weighted MRI, ADC MRI and PSMA-PET are compared by Dice, radiomic feature robustness is assessed by ICC and MAPD, and random forest models on robust features predict biochemical recurrence.
- **Key Findings**: In 142 patients with multi-scanner imaging, gland segmentations were more consistent (mean Dice 0.78) than tumour segmentations (mean Dice 0.46). 112 features (3.6%) showed excellent and 480 (15.4%) good robustness, with PET giving more excellent features than T2 and ADC, and the random forest models reached a mean AUC of 0.89 (0.85 to 0.93). The authors recommend whole-gland features over tumour-segmentation features for recurrence models.
- **Relevance**: It addresses P3 by measuring how segmentation variation changes radiomic features and a subject-level recurrence prediction.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 14 citations.
- **Potential Use**: Discussion and limitations (segmentation variability in radiomic outcome models).
- **Stance**: Supports, the view that segmentation variability must be considered when radiomic features are used for prediction.
- **Prediction setting**: subject-level classification, input image on a grid; the label is each patient's biochemical recurrence after radiation therapy.
- **Correspondence handling**: not applicable; features are computed per segmented region and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; feature robustness to manual against automatic segmentation is measured.
- **Application domain**: medical imaging, T2-weighted and ADC MRI and PSMA-PET, prostate.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Dutta 2024); merge screening reason: robustness of MRI and PET radiomics to segmentation variation and its effect on recurrence prediction (142 patients)

#### Egger et al. (2017). MRI FLAIR lesion segmentation in multiple sclerosis: Does automated segmentation hold up with manual annotation?
- **Citation key**: [egger2017mri]
- **Identifier**: DOI 10.1016/j.nicl.2016.11.020. Confirmed by a live lookup at https://doi.org/10.1016/j.nicl.2016.11.020.
- **Type**: Journal article (NeuroImage: Clinical)
- **Method**: Three versions of the Schmidt automated FLAIR lesion segmentation algorithm (LGA on SPM8, LGA on SPM12, LPA on SPM12) are compared with three independent manual raters on 3.0T MRI of 50 patients with relapsing-remitting MS, by intraclass correlation and Dice coefficients.
- **Key Findings**: For lesion volume, LGA on SPM8 correlates strongly with manual segmentation (ICC 0.958, Dice 0.60), not significantly different from the inter-rater agreement (ICC 0.97, Dice 0.66). The SPM12 versions agree less but adequately (ICC 0.927 and Dice 0.53 for LGA, ICC 0.949 and Dice 0.57 for LPA). Variability of both manual and automated segmentation is significantly higher for lesion numbers than for lesion volume.
- **Relevance**: It addresses P3: it measures how well the automated lesion-segmentation step agrees with manual raters, and shows that lesion counts are less reliable than lesion volume.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 139 citations. Small study (50 patients).
- **Potential Use**: Discussion and limitations (reliability of the lesion-segmentation step)
- **Stance**: Supports, that automated FLAIR lesion volume agrees with manual segmentation about as well as raters agree with each other.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the outcome is agreement of lesion load measures.
- **Correspondence handling**: not applicable; segmentation is done within each subject, with no cross-subject correspondence.
- **Pipeline relation**: measures how a pipeline step fails; automated lesion segmentation is compared with manual raters for volume and count.
- **Application domain**: medical imaging, brain MRI (FLAIR), multiple sclerosis.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Egger 2017); merge screening reason: automated against manual MS lesion segmentation and inter-rater variability (50 patients)

#### Engelson et al. (2026). Deep learning-based mediastinal lymph node assessment on PET/CT images without pixel-level annotations.
- **Citation key**: [engelson2026deep]
- **Identifier**: DOI 10.1117/1.jmi.13.1.014507. Confirmed by a live lookup at https://doi.org/10.1117/1.jmi.13.1.014507.
- **Type**: Journal article (Journal of Medical Imaging)
- **Method**: Lymph node stations are localized by atlas-to-patient registration, pseudo-labels for station groups are deduced from the N-stage, and a weakly supervised network trained on image-level labels classifies stations as malignant or benign and derives the N-stage.
- **Key Findings**: Lymph node station classification reached accuracy 0.88, sensitivity 0.72 and specificity 0.90, significantly better than the standard threshold-based approach and a PET lesion segmentation algorithm trained with masks. Automatic N-staging reached accuracy 0.63, on par with an algorithm trained with segmentation masks. The abstract does not state the number of patients.
- **Relevance**: It addresses P3 by keeping registration to an atlas while removing the need for pixel-level lesion annotation in a subject-level staging task.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 1. OpenAlex counts 1 citations.
- **Potential Use**: Related work (removal of lesion segmentation in imaging pipelines).
- **Stance**: Supports, atlas priors with weak supervision as a replacement for segmentation masks in N-staging.
- **Prediction setting**: subject-level classification, input image on a grid; the N-stage of each patient is derived from station-level malignancy on PET/CT.
- **Correspondence handling**: registration to a common space; atlas-to-patient registration supplies the location of lymph node stations in each patient.
- **Pipeline relation**: builds on registration; removes lesion segmentation; the network is trained without pixel-level annotations and is compared with a segmentation-trained algorithm.
- **Application domain**: medical imaging, PET/CT, mediastinal lymph nodes.
- **Theme tags**: `step-removal`, `reg-template`, `lesion-seg`.
- **Theme**: added: merge intersection or gap search; screening note: lymph node PET/CT without pixel annotations; P3 removes lesion annotation

#### Fan et al. (2024). AmyloidPETNet: Classification of Amyloid Positivity in Brain PET Imaging Using End-to-End Deep Learning.
- **Citation key**: [fan2024amyloidpetnet]
- **Identifier**: DOI 10.1148/radiol.231442. Confirmed by a live lookup at https://doi.org/10.1148/radiol.231442.
- **Type**: Journal article (Radiology)
- **Method**: An end-to-end deep learning classifier of amyloid positivity on native-space brain PET scans that does not require structural MRI.
- **Key Findings**: The abstract, one sentence long, states that the method accurately classified amyloid positivity in native-space PET acquired with five different tracers across five independent data sets. The abstract does not state the number of subjects or any accuracy figures.
- **Relevance**: It addresses P1 and P3: a subject-level classifier on native-space PET that, by the abstract, needs no structural MRI.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 35 citations.
- **Potential Use**: Related work (end-to-end pipelines that remove registration).
- **Stance**: Supports, end-to-end classification on native-space PET without structural MRI.
- **Prediction setting**: subject-level classification, input image on a grid; amyloid positivity is classified per PET scan.
- **Correspondence handling**: not applicable; the network reads native-space scans, and the abstract does not state any registration, template or invariance mechanism.
- **Pipeline relation**: removes registration; the abstract states that scans are classified in native space without structural MRI, the image usually used to register PET to a template.
- **Application domain**: medical imaging, amyloid PET of the brain.
- **Theme tags**: `step-removal`.
- **Theme**: added: handed on by Theme 4 (AmyloidPETNet); merge screening reason: end-to-end amyloid classification on native-space PET without structural MRI or template registration

#### Farazi et al. (2023). TetCNN: Convolutional Neural Networks on Tetrahedral Meshes.
- **Citation key**: [farazi2023tetcnn]
- **Identifier**: DOI 10.1007/978-3-031-34048-2_24; arXiv 2302.03830; PMID 38179190. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-34048-2_24.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: A graph CNN for tetrahedral meshes with filters from the volumetric Laplace-Beltrami operator, pooling by localized minimum cuts in the Graclus algorithm, and Grad-CAM heatmaps adapted to tetrahedral meshes.
- **Key Findings**: The model was applied to cortical tetrahedral meshes from patients with Alzheimer's disease. The LBO-based convolution and pooling outperformed cortical thickness, graph Laplacian and point cloud representations. The abstract does not state the number of subjects or the accuracy figures.
- **Relevance**: A subject-level classifier on brain volumetric meshes, compared with a point cloud representation (P1).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 7 citations.
- **Potential Use**: Related work (mesh networks for subject-level prediction).
- **Stance**: Supports, that Laplace-Beltrami convolution on tetrahedral meshes beats thickness, graph and point cloud representations.
- **Prediction setting**: subject-level classification, input mesh or surface; each subject's cortical tetrahedral mesh is classified for Alzheimer's disease.
- **Correspondence handling**: permutation invariance; filters come from each mesh's own Laplace-Beltrami operator, so no vertex correspondence across subjects is needed, and the abstract does not state the invariance or the readout in these words.
- **Pipeline relation**: not applicable; the abstract does not state how the meshes are obtained from the images.
- **Application domain**: medical imaging, brain cortex (the abstract does not name the modality).
- **Theme tags**: T3d.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: TetCNN: AD classification on cortical tetrahedral meshes (arXiv 2302.03830)

#### Feragen et al. (2013). Geometric Tree Kernels: Classification of COPD from Airway Tree Geometry.
- **Citation key**: [feragen2013geometric]
- **Identifier**: DOI 10.1007/978-3-642-38868-2_15; arXiv 1303.7390; PMID 24683967. Confirmed by a live lookup at https://doi.org/10.1007/978-3-642-38868-2_15.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: A family of kernels for anatomical trees with vector-valued measurements along the tree, such as branch shape and radius, combined with standard kernel learning and kernelized hypothesis testing.
- **Key Findings**: Some kernels scale to datasets of around 10,000 trees with 30 to 600 branches. Kernelized tests show that geometric airway trees are distributed significantly differently in patients with COPD than in healthy individuals. The kernels significantly increased COPD classification accuracy from airway geometry with wall thickness measurements compared with state-of-the-art methods.
- **Relevance**: A subject-level classifier on airway trees whose branches have no fixed correspondence across subjects, compared by kernels (P1, P2).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 15 citations.
- **Potential Use**: Related work (kernels on unaligned anatomical structures).
- **Stance**: Supports, that geometric tree kernels improve COPD classification from airway trees.
- **Prediction setting**: subject-level classification, input graph; each subject's airway tree with branch measurements is classified as COPD or healthy.
- **Correspondence handling**: permutation invariance; the kernels compare trees through their geometric structure and attributes, which needs no branch-to-branch correspondence across subjects, and the abstract does not state the invariance in these words.
- **Pipeline relation**: builds on lesion segmentation; the input is the airway tree segmented from low-dose CT, an anatomical segmentation step in the place lesion segmentation takes in other pipelines.
- **Application domain**: medical imaging, low-dose CT of the lung airways.
- **Theme tags**: T3d.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: geometric tree kernels, COPD from airway trees (PMID 24683967, arXiv 1303.7390); P2 kernel on trees

#### Ferrante et al. (2022). Application of nnU-Net for Automatic Segmentation of Lung Lesions on CT Images and Its Implication for Radiomic Models.
- **Citation key**: [ferrante2022application]
- **Identifier**: DOI 10.3390/jcm11247334. Confirmed by a live lookup at https://doi.org/10.3390/jcm11247334.
- **Type**: Journal article (Journal of Clinical Medicine)
- **Method**: nnU-Net segments lung tumours on CT, the automatic contours are compared with manual ones by Dice, and survival radiomic models with hand-crafted and deep features are compared between manual and automatic contours.
- **Key Findings**: In 899 patients from two proprietary and one public dataset, the best agreement with manual contours (Dice 0.78 plus or minus 0.12) came from averaging 2D and 3D predictions with customised post-processing. The accuracy of the survival classifier (0.65 to 0.78) was not statistically different between manual and automatic contours, with hand-crafted and with deep features.
- **Relevance**: It addresses P3 by replacing manual lesion segmentation with an automatic one and measuring the effect on a radiomic outcome model.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 3. OpenAlex counts 51 citations.
- **Potential Use**: Discussion and limitations (automatic segmentation inside radiomic pipelines).
- **Stance**: Supports, automatic nnU-Net segmentation as a replacement for manual contours in radiomic survival models.
- **Prediction setting**: subject-level classification, input image on a grid; the label is each patient's survival class from CT radiomic features.
- **Correspondence handling**: not applicable; features are computed per tumour and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; it compares outcome models built on manual and on automatic tumour contours.
- **Application domain**: medical imaging, CT, lung tumours.
- **Theme tags**: `radiomics`, `lesion-seg`.
- **Theme**: added: handed on by Theme 4 (Ferrante 2022); merge screening reason: compares survival radiomic models on manual and nnU-Net contours in 899 patients

#### Feydy et al. (2019). Fast and Scalable Optimal Transport for Brain Tractograms.
- **Citation key**: [feydy2019fast]
- **Identifier**: DOI 10.1007/978-3-030-32248-9_71; arXiv 2107.02010. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-32248-9_71.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2019)
- **Method**: A multiscale GPU algorithm for regularized optimal transport with Sinkhorn divergences and linear memory, applied to tractograms as fiber bundles or track density maps, with label transfer for atlas-based segmentation and a Wasserstein barycenter atlas.
- **Key Findings**: The abstract reports transport plans between millions of points computed in minutes. The smooth assignments are used for label transfer in atlas-based segmentation of fiber tractograms, and the blur and reach parameters can be set from anatomical knowledge. A probabilistic atlas of a population of track density maps is estimated as a Wasserstein barycenter, and the implementation is released as the geomloss package.
- **Relevance**: It gives the transport coupling and barycenter tools that a registration-free method on brain point sets needs (P2).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Method background (scalable Sinkhorn transport and barycenters on medical point sets).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input point cloud; the outputs are transport plans, transferred labels and an atlas, and no subject-level outcome is predicted.
- **Correspondence handling**: transport coupling; the transport plan between two tractograms gives the soft assignment used for label transfer, and the population atlas is a Wasserstein barycenter.
- **Pipeline relation**: not applicable; the abstract does not state whether the tractograms are registered before transport.
- **Application domain**: medical imaging, diffusion MRI tractography of the brain.
- **Theme tags**: T2a, T2c.
- **Theme**: added: handed on by Theme 2 (Feydy 2019 OT brain tractograms); merge screening reason: multiscale Sinkhorn transport between brain tractograms with a Wasserstein barycenter atlas (MICCAI 2019)

#### Feydy et al. (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Citation key**: [feydy2019interpolating]
- **Identifier**: arXiv 1810.08278. Confirmed by a live lookup at https://arxiv.org/abs/1810.08278.
- **Type**: Conference paper (Proc. Int. Conf. Artificial Intelligence and Statistics (AISTATS))
- **Method**: Theoretical study of Sinkhorn divergences, a family of geometric divergences between measures that interpolates between maximum mean discrepancies and optimal transport, with a GPU numerical scheme.
- **Key Findings**: Relying on a notion of geometric entropy, the paper proves positivity, convexity and metrization of the convergence in law for Sinkhorn divergences. The abstract reports that gradients of the Sinkhorn loss can be computed on the GPU for batches of a million samples.
- **Relevance**: It supplies the debiased transport loss that compares point sets of different sizes without a correspondence, which bears on P2.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 512 citations.
- **Potential Use**: Method background (entropic transport and Sinkhorn divergences).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the paper defines and analyses a divergence between measures and names no prediction target.
- **Correspondence handling**: transport coupling; the divergence is computed from entropic transport plans between the two measures, so no element-to-element correspondence is given in advance.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, theory of distances between probability measures for machine learning.
- **Theme tags**: T2a.
- **Theme**: added: handed on by Theme 2 (Feydy 2019 OT MMD Sinkhorn divergences); merge screening reason: Sinkhorn divergences, the debiased transport loss used for point sets (AISTATS 2019)

#### Fornacon-Wood, Mistry, Ackermann, Blackhall, McPartlin, Faivre-Finn, Price and O'Connor (2020). Reliability and prognostic value of radiomic features are highly dependent on choice of feature extraction platform.
- **Citation key**: [fornaconwood2020reliability]
- **Type**: Journal article (European Radiology)
- **Identifier**: DOI 10.1007/s00330-020-06957-9, PMID 32483644; confirmed at https://doi.org/10.1007/s00330-020-06957-9 (resolves to the Springer page), the PubMed record and the Crossref record.
- **Method**: Radiomic features of three clinical datasets (108 head and neck cancer, 37 small-cell and 47 non-small-cell lung cancer patients) computed with four platforms (PyRadiomics, LIFEx and CERR, which are IBSI-compliant, and IBEX, which is not); reliability by intraclass correlation; the effect of platform on the association of features with survival by univariable Cox regression in the largest dataset.
- **Key Findings**: Reliability across all four platforms was excellent (ICC above 0.9) for 4 of 17 features, and for 15 of 17 when restricted to the three IBSI-compliant platforms. Without harmonised calculation settings, reliability was poor even across IBSI-compliant platforms, and the platform version changed reliability in CERR and LIFEx. The features found to be associated with survival, and the direction of their hazard ratios, varied between platforms.
- **Relevance**: It measures the failure of the radiomics step at the level of the subject-level prognostic model, which is the level the research question asks about.
- **Quality**: Abstract read. Retrospective, three datasets; the survival analysis is univariable and in one dataset.
- **Potential Use**: Evidence that the implementation of the radiomics step changes which features predict outcome.
- **Viewpoint**: supports the view that radiomic predictors depend on the feature-extraction implementation.
- **Prediction setting**: subject-level regression (survival, univariable Cox models); image on a grid (CT) within a delineated tumour, summarized by radiomic features.
- **Correspondence handling**: not applicable; features are computed per tumour region, with no cross-subject spatial correspondence.
- **Pipeline relation**: builds on radiomics; measures how a pipeline step fails (feature extraction platform, settings and version).
- **Application domain**: medical imaging, CT, head and neck cancer and lung cancer.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: Theme 4

#### Francischello et al. (2026). The influence of annotators' experience on radiomics-based machine learning performance in colorectal liver metastases characterization: Impact and mitigation strategy.
- **Citation key**: [francischello2026influence]
- **Identifier**: DOI 10.1016/j.ejrai.2026.100091. Confirmed by a live lookup at https://doi.org/10.1016/j.ejrai.2026.100091.
- **Type**: Journal article (European Journal of Radiology Artificial Intelligence)
- **Method**: Four annotators of different expertise segmented 93 colorectal liver metastases on CT; a radiomics model was trained on each annotator's masks and tested on every other annotator's masks, with and without an observer-specific normalization.
- **Key Findings**: Test performance depended on which annotator segmented the test lesions as well as on the training annotator, with median AUC between 0.72 and 0.79. The observer-specific normalization raised the median AUC in most cross-annotator comparisons.
- **Relevance**: A direct measurement of how lesion-segmentation variability at deployment changes a radiomic prediction (P3).
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 3, relevance 3, citations 1, data 1. No OpenAlex count in the record read. Small study (93 lesions).
- **Potential Use**: Discussion and limitations (segmentation as a source of error in radiomic predictors).
- **Stance**: Opposes, the assumption that a radiomic model is independent of the person who segments at deployment.
- **Prediction setting**: other (lesion-level classification of the histopathological growth pattern), input image on a grid with a lesion mask; the unit is a metastasis.
- **Correspondence handling**: not applicable; features are computed inside each lesion mask.
- **Pipeline relation**: builds on lesion segmentation, builds on radiomics, measures how a pipeline step fails; the segmentation operator is varied at training and at test time.
- **Application domain**: medical imaging, CT of the liver (colorectal liver metastases).
- **Theme tags**: `radiomics`, `failure`, `lesion-seg`.
- **Theme**: added: merge recent-literature search R3 (2024 to 2026)

#### Fujibayashi et al. (2021). Nonlinear registration as an effective preprocessing technique for Deep learning based classification of disease.
- **Citation key**: [fujibayashi2021nonlinear]
- **Identifier**: DOI 10.1109/embc46164.2021.9631044. Confirmed by a live lookup at https://doi.org/10.1109/embc46164.2021.9631044.
- **Type**: Conference paper (2021 43rd Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC))
- **Method**: Compares affine registration with nonlinear DARTEL registration to a template as preprocessing for deep learning classification of Alzheimer's disease from structural MRI, including noisy images.
- **Key Findings**: Accuracy with nonlinear registration was much higher than with affine registration. DARTEL was less susceptible to noise than affine registration. The authors conclude that nonlinear registration reduces spatial variation and overfitting on limited datasets; the abstract does not state the number of subjects or the accuracy figures.
- **Relevance**: It measures how the strength of the registration step changes a subject-level classifier (P3).
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 5 citations.
- **Potential Use**: Discussion and limitations (evidence for registration as preprocessing on small datasets).
- **Stance**: Supports, that nonlinear registration to a template helps deep learning classification on small datasets.
- **Prediction setting**: subject-level classification, input image on a grid; each subject's structural MRI is classified for Alzheimer's disease.
- **Correspondence handling**: registration to a common space; images are mapped from native space to template space by affine or DARTEL registration.
- **Pipeline relation**: builds on registration / measures how a pipeline step fails; the study compares two registration strengths and their effect on accuracy and noise sensitivity.
- **Application domain**: medical imaging, structural brain MRI.
- **Theme tags**: `reg-analysis`.
- **Theme**: added: merge intersection or gap search; screening note: nonlinear registration vs native space for DL AD classification; P3

#### Gacheva et al. (2026). Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy.
- **Citation key**: [gacheva2026multiple]
- **Identifier**: DOI 10.1016/j.ynirp.2026.100418. Confirmed by a live lookup at https://doi.org/10.1016/j.ynirp.2026.100418.
- **Type**: Journal article (NeuroImage: Reports)
- **Method**: A deep neural network classifies variable-size bags of MR spectra per patient as a MIL problem, with data augmentation and two permutation-invariant aggregations, min-max-mean pooling and attention-based pooling.
- **Key Findings**: The retrospective data are 422 patients with 7442 spectra, of which 844 spectra form an independent internal hold-out test set. The best configuration (CNN with 3Pool aggregation and data augmentation) reaches an AUC of 0.82, a sensitivity of 0.76 and a specificity of 0.80, against an average sensitivity of 0.54 and specificity of 0.88 for neuroradiologists reading MRS only. Attention weights highlight lipid and choline peaks and the Glx region (2.2 to 2.4 ppm).
- **Relevance**: It addresses P1 and P2: a patient-level label is predicted from an unordered, variable-size set of spectra through permutation-invariant pooling.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (sets of regions per patient with permutation-invariant pooling)
- **Stance**: Supports, that MIL on full spectra classifies brain lesions more robustly than single-peak analysis.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; each patient is a bag of spectra labelled neoplastic or non-neoplastic.
- **Correspondence handling**: permutation invariance; the abstract names min-max-mean and attention pooling as permutation-invariant aggregations over variable bag sizes.
- **Pipeline relation**: not applicable; the input is MR spectra, and the abstract replaces metabolite peak ratios, which are not a registration, radiomics or lesion-segmentation step.
- **Application domain**: medical imaging, MR spectroscopy, brain lesions.
- **Theme tags**: T3d, T3c.
- **Theme**: added: handed on by Theme 3 (MIL MR spectroscopy lesions); merge screening reason: variable-size bags of MR spectra per patient with permutation-invariant pooling (422 patients)

#### Gachon et al. (2025). Low Dimensional Representation of Multi-Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia.
- **Citation key**: [gachon2025low]
- **Identifier**: DOI 10.1002/cyto.a.24918. Confirmed by a live lookup at https://doi.org/10.1002/cyto.a.24918.
- **Type**: Journal article (Cytometry Part A)
- **Method**: Flow cytometry measurements of several patients are treated as high-dimensional distributions, quantized by K-means on all data merged into one point cloud (justified as mean measure quantization in optimal transport), and embedded in a linear space by Wasserstein PCA through linearized optimal transport or by log-ratio PCA of compositional data.
- **Key Findings**: On a public flow cytometry dataset and a dataset from Bordeaux University Hospital the approach is reported to be better than kernel mean embedding for statistical learning from multiple high-dimensional distributions. It supports low-dimensional projection and clustering of patient measurements by level of measurable residual disease in acute myeloid leukemia, and an informative two-dimensional representation of FlowSom results.
- **Relevance**: It addresses P2 for patient-level point clouds with no cell correspondence: a shared quantized support and a linearized transport embedding.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 10 citations.
- **Potential Use**: Related work (transport embeddings of patient-level point clouds).
- **Stance**: Supports, transport-based representations over kernel mean embedding for multi-patient distributions.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the abstract reports projection, visualization and clustering of patient measurements by residual disease level.
- **Correspondence handling**: learned template or barycenter; the paper uses a K-means quantization of the merged point cloud, a shared support estimated from the data, onto which every patient's distribution is quantized before the linearized transport embedding.
- **Pipeline relation**: not applicable; the data are flow cytometry measurements outside imaging, and the abstract names manual cytological analysis and FlowSom as the existing analyses.
- **Application domain**: other domain, flow cytometry of blood and bone marrow in acute myeloid leukemia.
- **Theme tags**: T2c, T2d.
- **Theme**: added: handed on by Theme 2 (Gachon 2025 cytometry OT); merge screening reason: multi-patient flow cytometry point clouds embedded by linearized transport for residual disease detection

#### Gachon et al. (2026). Scalable Learning from Probability Measures with Mean Measure Quantization.
- **Citation key**: [gachon2026scalable]
- **Identifier**: arXiv 2502.04907. Confirmed by a live lookup at https://arxiv.org/abs/2502.04907.
- **Type**: Journal article (Transactions on Machine Learning Research)
- **Method**: All input probability measures are approximated by K-point discrete measures that share a common support, with consistency of the quantized measures and convergence guarantees for OT-based downstream tasks.
- **Key Findings**: The quantized measures are consistent. Several OT-based downstream tasks computed from them come with convergence guarantees. On synthetic and real datasets the approach performs comparably to quantizing each measure individually while substantially reducing runtime.
- **Relevance**: It addresses P2: a common support estimated from all measures plays the role of a shared template, which makes transport between many unaligned samples affordable.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 3, relevance 2, citations 2, data 2. OpenAlex counts 2 citations.
- **Potential Use**: Method background (shared-support templates for transport)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the abstract names OT-based downstream tasks without a subject-level target.
- **Correspondence handling**: learned template or barycenter; the paper calls it a common support of K points shared by all quantized measures, estimated from the data, which places it under this category.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, statistical learning on probability measures (synthetic and real datasets, not named).
- **Theme tags**: T2c, T2d.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Genevay et al. (2019). Sample Complexity of Sinkhorn Divergences.
- **Citation key**: [genevay2019sample]
- **Type**: Conference paper (AISTATS, PMLR 89).
- **Method**: Theoretical analysis of Sinkhorn divergences between OT and MMD.
- **Key Findings**: The paper bounds the approximation error of Sinkhorn divergences to OT as a function of the regularizer, and proves a sample complexity in 1/sqrt(n), with a constant that depends on the regularization strength. Unregularized OT converges in 1/n^(1/d) in dimension d.
- **Relevance**: Measures what entropic regularization trades: statistical rate against bias from OT, which governs how many points per subject a transport comparison needs.
- **Quality**: High (venue, theory). Read: abstract and introduction (arXiv HTML full text). Cited 193 times in OpenAlex on 2026-11-19.
- **Potential Use**: Failure analysis of entropic OT.
- **Identifier**: arXiv 1810.02733; https://proceedings.mlr.press/v89/genevay19a.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input samples of distributions (point clouds).
- **Correspondence handling**: Transport coupling.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (theory, no application).
- **Theme tags**: T2a, T2g.
- **Viewpoint**: Neutral.
- **Theme**: Theme 2

#### Gerber et al. (2018). Exploratory Population Analysis with Unbalanced Optimal Transport.
- **Citation key**: [gerber2018exploratory]
- **Type**: Conference paper (MICCAI, LNCS 11072).
- **Method**: Unbalanced optimal transport between every pair of subjects, run separately on grey and white matter segmentation masks; for each subject, mass allocation and transport cost images are averaged from the pairwise plans and then analysed voxelwise and with elastic net regression on clinical variables.
- **Key Findings**: On OASIS T1 MRI (416 subjects; the regression subset has 66 healthy subjects and 71 with very mild to moderate dementia), the transport images increase the explanatory power of regression on clinical variables (clinical dementia rating, MMSE, age) over voxel-based morphometry, reported as 10-fold cross-validated RMSE and R^2. The images come registered to the Talairach atlas with a 12-parameter affine transform; the paper states that the method "still depends on a rigid spatial normalization" but, after it, does not depend on a template because the images average pairwise plans.
- **Relevance**: A transport representation of each subject that feeds a cross-validated subject-level regression, with pairwise couplings in place of a single template.
- **Quality**: Medium (workshop-scale experiment on one public cohort). Read: abstract, introduction, method and experiment sections (PMC full text, PMC6547365). Cited 8 times in OpenAlex on 2026-11-19.
- **Potential Use**: Pairwise unbalanced transport as a template-free subject representation; its dependence on affine registration and tissue segmentation.
- **Identifier**: DOI 10.1007/978-3-030-00931-1_53; PMID 31172134; https://doi.org/10.1007/978-3-030-00931-1_53 (confirmed).
- **Prediction setting**: Subject-level regression (clinical dementia rating, MMSE and age from transport images), input images on a grid (tissue masks).
- **Correspondence handling**: Registration to a common space (affine), then pairwise transport couplings between subjects; no template.
- **Pipeline relation**: Builds on registration (affine to Talairach). It also needs grey and white matter segmentation, a tissue step, not lesion segmentation, and it replaces the template step of deformation-based morphometry with pairwise plans.
- **Application domain**: Medical imaging (structural MRI, brain).
- **Theme tags**: T2f, T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Ghosal et al. (2026). Penalized Cox Regression with Graph-Structured Distribution-Valued Predictors.
- **Citation key**: [ghosal2026penalized]
- **Identifier**: arXiv 2611.03608. Confirmed by a live lookup at https://arxiv.org/abs/2611.03608.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: The Graph-Fused Distributional Cox Model (GFDCM) uses the full distribution of voxel intensities within each region of interest as a predictor in a penalized Cox model, with penalized splines for the distributional effects and a Graph-Fused Group LASSO penalty, fitted by ADMM.
- **Key Findings**: Simulations show satisfactory selection, fusion and estimation compared with unpenalized functional Cox regression and selection-only alternatives. On baseline T1-weighted MRI of 308 ADNI-1 patients, the model identifies brain regions associated with conversion to Alzheimer's disease and predicts better than ROI-level summary approaches.
- **Relevance**: It addresses P1 and P3: a subject-level survival outcome is predicted from the distribution of voxel values inside each region, which drops the voxel correspondence inside a region and replaces scalar regional summaries.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (distribution-valued predictors for subject-level outcomes)
- **Stance**: Supports, that regional voxel distributions predict conversion better than ROI summary values.
- **Prediction setting**: subject-level regression, input distribution or set of vectors; a penalized Cox model relates the voxel-intensity distributions of the ROIs to the time to Alzheimer's disease conversion of each patient.
- **Correspondence handling**: registration to a common space; the ROIs and their adjacency graph are shared across patients, while inside each ROI the voxels enter only through their distribution, and the abstract does not state how the ROIs are defined.
- **Pipeline relation**: builds on registration, removes radiomic feature engineering; the ROIs presuppose a parcellation common to all patients, and the full distribution replaces the scalar ROI summaries.
- **Application domain**: medical imaging, T1-weighted brain MRI.
- **Theme tags**: T3c, T1-BG, `radiomics`.
- **Theme**: added: handed on by Theme 1 (penalized Cox distribution-valued predictors); merge screening reason: distribution-valued ROI predictors for survival (preprint, 308 ADNI patients)

#### Gong et al. (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence.
- **Citation key**: [gong2026robust]
- **Type**: Journal article (Frontiers in Oncology).
- **Method**: CMOT-Fusion: patches of T2-weighted and ADC images of the same patient are matched by an optimal transport plan with a learned cost and fused by barycentric projection, with no image registration step.
- **Key Findings**: In 300 men with confirmed prostate cancer, the model separates NCCN high risk from lower risk with AUC 0.849 in 5-fold cross-validation and 0.824 on a 50-patient temporal test set; PI-RADS v2.1 reaches 0.839 on the same test set. The authors call the results exploratory (single centre, small test cohort). Gland masks from a U-Net contouring tool are used for intensity normalization and cropping.
- **Relevance**: A transport coupling that removes inter-sequence registration in a subject-level clinical prediction.
- **Quality**: Medium (single centre, retrospective; test AUC not above the radiologist score). Read: abstract and methods (Europe PMC full text, PMC12896216). Cited 1 times in OpenAlex on 2026-11-19.
- **Potential Use**: Registration-free fusion within a subject; its reliance on segmentation.
- **Identifier**: DOI 10.3389/fonc.2025.1700447; PMID 41696070; https://doi.org/10.3389/fonc.2025.1700447 (confirmed).
- **Prediction setting**: Subject-level classification, input images on a grid as sets of patches.
- **Correspondence handling**: Transport coupling between patch sets of two sequences of one subject, with a learned cost.
- **Pipeline relation**: Removes registration (between sequences); builds on lesion segmentation in the form of gland segmentation for cropping.
- **Application domain**: Medical imaging (multiparametric MRI, prostate).
- **Theme tags**: T2f, T2e.
- **Viewpoint**: Supports, with the limits the authors state.
- **Theme**: Theme 2

#### Gopinath et al. (2019). Adaptive Graph Convolution Pooling for Brain Surface Analysis.
- **Citation key**: [gopinath2019adaptive]
- **Identifier**: DOI 10.1007/978-3-030-20351-1_7. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-20351-1_7.
- **Type**: Conference paper (Information Processing in Medical Imaging, IPMI 2019, Lecture Notes in Computer Science)
- **Method**: A graph-based pooling method that learns an intrinsic aggregation of the nodes of each input graph from its geometry, using spectral graph alignment to give a common surface parameterization across brain geometries, so that graph neural networks can take full-sized surface data whose graph structure and number of nodes vary.
- **Key Findings**: The abstract states that graph convolution filters are constrained to a single fixed graph structure, while the structure and the number of mesh nodes vary across brain geometries. Two proof-of-concept applications, the classification of disease stages and the regression of subject age, use the surface data from varying mesh geometries directly.
- **Relevance**: A subject-level predictor on brain meshes that differ in size and structure across subjects, with correspondence given by spectral alignment (P1, P2).
- **Quality**: Abstract read (Springer chapter page). Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 24 citations.
- **Potential Use**: Related work (point-cloud networks; sets of lesions or regions and medical point clouds); Experimental baselines (mesh pooling across varying geometries).
- **Stance**: Supports, that pooling learned from each graph's geometry lets graph networks predict from brain surfaces of varying structure.
- **Prediction setting**: subject-level classification, input mesh or surface (brain surfaces with varying graph structure); the networks classify disease stage and, in a second application, regress age.
- **Correspondence handling**: registration to a common space; spectral graph alignment makes the surface parameterization common across brain geometries, a surface-to-surface alignment, and the pooling is learned on top of it.
- **Pipeline relation**: builds on registration; the pooling relies on the spectral alignment of the surfaces.
- **Application domain**: medical imaging, brain cortical surfaces from MRI.
- **Theme tags**: T3b, T3d, `reg-template`.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: graph pooling over brain surfaces of varying mesh geometry with spectral alignment, disease-stage classification and age regression

#### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Citation key**: [gramfort2015fast]
- **Type**: Conference paper (IPMI, LNCS).
- **Method**: Kantorovich means of non-normalized data on arbitrary discrete domains, linked to entropic Wasserstein barycenters, with a convex algorithm.
- **Key Findings**: The method averages fMRI and MEG source estimates on voxel grids and folded cortical triangulations of 20 fMRI and 16 MEG subjects. It replaces the Gaussian smoothing applied after anatomical registration; the paper notes that the added mass-creation cost is a parameter that can be hard to tune.
- **Relevance**: The first transport template of brain data: it addresses residual misalignment after registration, not the registration itself.
- **Quality**: High. Read: abstract, introduction and experiment passages (arXiv HTML full text). Cited 141 times in OpenAlex on 2026-11-19.
- **Potential Use**: Transport averaging of subjects; what it still needs from the pipeline.
- **Identifier**: DOI 10.1007/978-3-319-19992-4_20; arXiv 1503.08596; https://doi.org/10.1007/978-3-319-19992-4_20 (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input images on a grid and cortical meshes.
- **Correspondence handling**: Registration to a common space first (MNI or an average cortical surface), then a learned template or barycenter.
- **Pipeline relation**: Builds on registration; the transport barycenter replaces post-registration smoothing.
- **Application domain**: Medical imaging (fMRI and MEG, brain).
- **Theme tags**: T2f, T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Granzier et al. (2020). MRI-based radiomics in breast cancer: feature robustness with respect to inter-observer segmentation variability.
- **Citation key**: [granzier2020mri]
- **Identifier**: DOI 10.1038/s41598-020-70940-z. Confirmed by a live lookup at https://doi.org/10.1038/s41598-020-70940-z.
- **Type**: Journal article (Scientific Reports)
- **Method**: 129 histologically confirmed breast tumours were segmented manually in 3D on the first post-contrast T1-weighted MRI by four observers of different expertise, and feature robustness of RadiomiX and Pyradiomics was assessed by ICC above 0.9.
- **Key Findings**: Mean Dice between observers was 0.81 (range 0.19 to 0.96). Of all features, 41.6 percent (552 of 1328) for RadiomiX and 32.8 percent (273 of 833) for Pyradiomics were robust to inter-observer segmentation variability. The abstract does not report an outcome model.
- **Relevance**: It measures how variation in lesion delineation propagates into radiomic features (P3).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 100 citations.
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics).
- **Stance**: Supports, that most radiomic features are sensitive to inter-observer segmentation variability.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; feature robustness is measured and no outcome is predicted.
- **Correspondence handling**: not applicable; features are computed per tumour segmentation and compared across observers.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; features are extracted from manual tumour masks and their robustness to the masks is measured.
- **Application domain**: medical imaging, contrast-enhanced T1-weighted breast MRI.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Granzier 2020); merge screening reason: feature robustness to inter-observer breast tumour segmentation on MRI (129 tumours)

#### Gutierrez-Becker, Sarasua and Wachinger (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks.
- **Citation key**: [gutierrezbecker2021discriminative]
- **Type**: Journal article (Medical Image Analysis 67).
- **Identifier**: DOI 10.1016/j.media.2020.101852 (resolved at https://doi.org/10.1016/j.media.2020.101852); PubMed record PMID 33129154 read at https://pubmed.ncbi.nlm.nih.gov/33129154/.
- **Method**: modular deep networks on unordered point clouds of anatomical structures, with discriminative and conditional generative models and a multi-structure extension.
- **Key Findings**: The networks operate on unordered point clouds and provide invariance to similarity transformations, "avoiding the need to identify point correspondences between shapes". A discriminative model performs disease classification and age regression. Joint modelling of several structures is reported as more efficient and more accurate than single-structure analysis, and generated point clouds capture morphological differences linked to Alzheimer's disease.
- **Relevance**: it is a direct case of subject-level prediction from point clouds of brain structures with no point correspondence across subjects.
- **Prediction setting**: subject-level classification (disease) and subject-level regression (age), input point clouds of anatomical structures.
- **Correspondence handling**: permutation invariance, with invariance to similarity transformations built into the network; point correspondences are not needed.
- **Pipeline relation**: removes registration (point correspondence and similarity alignment are handled in the network); builds on segmentation of the anatomical structures, whose source the abstract does not state.
- **Application domain**: medical imaging (brain MRI; subcortical anatomical structures; Alzheimer's disease).
- **Theme tags**: T3d.
- **Quality**: abstract alone (PubMed record); the publisher text and the author manuscript returned HTTP 403. Peer-reviewed; OpenAlex cited_by_count 28. Quick assessment 12 of 15.
- **Viewpoint**: supports point-cloud networks for anatomical shape.
- **Potential Use**: medical point clouds without correspondence.
- **Theme**: Theme 3

#### Haarburger et al. (2020). Radiomics feature reproducibility under inter-rater variability in segmentations of CT images.
- **Citation key**: [haarburger2020radiomics]
- **Identifier**: DOI 10.1038/s41598-020-69534-6. Confirmed by a live lookup at https://doi.org/10.1038/s41598-020-69534-6.
- **Type**: Journal article (Scientific Reports)
- **Method**: Radiomic feature reproducibility is analysed first with manual segmentations by four expert readers and then with probabilistic automated segmentations from a neural network (PHiseg), on three public datasets of lung, kidney and liver lesions.
- **Key Findings**: Results are consistent between manual and automated segmentations in all three datasets. Some subsets of radiomic features are robust to segmentation variability and others are prone to poor reproducibility.
- **Relevance**: It addresses P3 by measuring how variability of the lesion segmentation step propagates into radiomic features.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 147 citations.
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study measures feature reproducibility within segmented lesions.
- **Correspondence handling**: not applicable; features are computed per lesion and no cross-subject correspondence is formed.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; it measures how segmentation variability changes radiomic features.
- **Application domain**: medical imaging, CT of lung, kidney and liver lesions.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Haarburger 2020); merge screening reason: feature reproducibility under inter-rater and probabilistic automated segmentations on three datasets

#### Han et al. (2020). Accurate Screening of COVID-19 Using Attention-Based Deep 3D Multiple Instance Learning.
- **Citation key**: [han2020accurate]
- **Identifier**: DOI 10.1109/tmi.2020.2996256. Confirmed by a live lookup at https://doi.org/10.1109/tmi.2020.2996256.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: Attention-based deep 3D multiple instance learning (AD3D-MIL) treats a 3D chest CT as a bag of deep 3D instances that follow possible infection areas, applies attention-based pooling and learns Bernoulli distributions of the bag-level label.
- **Key Findings**: The data are 460 chest CT examples: 230 from 79 patients with COVID-19, 100 from 100 patients with common pneumonia and 130 from 130 people without pneumonia. The model reaches an overall accuracy of 97.9%, an AUC of 99.0% and a Cohen kappa of 95.7%. Attention pooling indicates each instance's contribution to the bag label.
- **Relevance**: It addresses P1 and P3: a patient-level label is predicted from a bag of 3D instances with weak labels only, without manual annotation of infection areas.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 350 citations.
- **Potential Use**: Related work (multiple instance learning on sets of regions in medical images)
- **Stance**: Supports, that weakly supervised 3D MIL can screen COVID-19 from CT without infection-area annotation.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each chest CT is a bag of 3D instances with one patient-level label.
- **Correspondence handling**: permutation invariance; attention-based pooling aggregates the instances of a bag without matching them across patients.
- **Pipeline relation**: removes lesion segmentation; the abstract states that the model learns from weak labels instead of manual annotations of infection areas.
- **Application domain**: medical imaging, chest CT, lung.
- **Theme tags**: T3c, T3d, `step-removal`, `lesion-seg`.
- **Theme**: added: handed on by Theme 3 (Han 2020 COVID MIL); merge screening reason: patient-level COVID-19 screening from a bag of 3D CT instances without infection-area annotation

#### Hanna et al. (2017). Predictive Nuclear Chromatin Characteristics of Melanoma and Dysplastic Nevi.
- **Citation key**: [hanna2017predictive]
- **Identifier**: DOI 10.4103/jpi.jpi_84_16. Confirmed by a live lookup at https://doi.org/10.4103/jpi.jpi_84_16.
- **Type**: Journal article (Journal of Pathology Informatics)
- **Method**: Nuclei selected on whole slide images of dermatopathology slides are described by chromatin features through an optimal transport-based linear embedding, classified per nucleus by a modified linear discriminant analysis with a k-nearest neighbor classifier, and a patient label is set by voting over the patient's nuclei.
- **Key Findings**: The method reaches a classification accuracy of 81.29%, a gain of 6.4% over a numerical feature-based method in differentiating melanoma from dysplastic nevi. Distribution differences in nuclear morphology between the two classes can be visualized. The abstract text is truncated before the sample size, which appears only as "= 72)", so the number of patients is not clearly stated.
- **Relevance**: It addresses P1 and P2: a patient-level diagnosis is made from the set of a patient's nuclei, each embedded by transport, and aggregated by voting.
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 2, rigor 1, relevance 3, citations 1, data 1. OpenAlex counts 14 citations.
- **Potential Use**: Related work (transport-based embeddings of sets of cells for patient-level diagnosis)
- **Stance**: Supports, that transport-based nuclear chromatin features separate melanoma from dysplastic nevi better than numerical features.
- **Prediction setting**: subject-level classification, input set of lesions or regions; the patient label comes from voting over per-nucleus predictions.
- **Correspondence handling**: transport coupling; each nucleus is embedded by an optimal transport-based linear embedding, and the abstract does not name the reference used.
- **Pipeline relation**: builds on lesion segmentation, removes radiomic feature engineering; nuclei are annotated and segmented first, and the transport embedding replaces numerical features of the nuclei.
- **Application domain**: medical imaging, histopathology whole slide images of skin (melanoma and dysplastic nevi).
- **Theme tags**: T2e, T2f, T3d.
- **Theme**: added: merge intersection or gap search; screening note: OT embedding of nuclei with patient-level voting, melanoma vs nevi

#### Harshman (1972). PARAFAC2: Mathematical and technical notes.
- **Citation key**: [harshman1972parafac2]
- **Identifier**: No DOI. UCLA Working Papers in Phonetics 22, pp. 30-44. Confirmed through the archival reproduction on the author's University of Western Ontario page, https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf, which was downloaded and read and carries the original reference (University Microfilms, Ann Arbor, No. 10,085).
- **Type**: Report (working paper). Foundational work named for the theme.
- **Method**: Derivation of the PARAFAC2 model for sets of cross-product matrices, with a discussion of its uniqueness and of fitting algorithms.
- **Key Findings**: The abstract states that PARAFAC1 applied to cross-product matrices describes only orthogonal factors, that PARAFAC2 describes orthogonal or oblique factors while keeping unique solutions, and that no formal proof of this uniqueness had been found, with uniqueness shown empirically on synthetic data.
- **Relevance**: The origin of PARAFAC2, the decomposition in which one mode may differ in size across slices.
- **Quality**: The abstract and the first two pages of the archival reproduction.
- **Potential Use**: Origin of the cross-product invariance idea behind PARAFAC2.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input set of cross-product matrices.
- **Correspondence handling**: Other: each slice keeps its own row units and only the cross-product (covariance) structure across the shared mode is modelled, so the rows of different slices need not correspond.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, psychometrics and multidimensional scaling.
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Harshman and Lundy (1996). Uniqueness Proof for a Family of Models Sharing Features of Tucker's Three-Mode Factor Analysis and PARAFAC/Candecomp.
- **Citation key**: [harshman1996uniqueness]
- **Identifier**: DOI 10.1007/bf02296963, confirmed at https://doi.org/10.1007/bf02296963 through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (Psychometrika).
- **Method**: Proofs of unique axis orientation for a general parallel-profiles model with interacting dimensions (the abstract writes the model as X_k = A D_k^A H D_k^B B'), and for its symmetrically weighted case.
- **Key Findings**: The abstract states that earlier parallel-profiles models could determine a unique axis orientation but could not deal with interactions among dimensions, presents a uniqueness proof for the more general model without assuming symmetry, and obtains PARAFAC2 and three-way DEDICOM as special cases by successive restrictions.
- **Relevance**: The uniqueness analysis of the theme scope: the proof that Harshman 1972 reported as missing, covering PARAFAC2 as a special case.
- **Quality**: Abstract alone. Seminal (OpenAlex counts 141 citations), admitted before 2013 on the seminal-work path.
- **Potential Use**: Identifiability of PARAFAC2 factors, the condition under which an unaligned mode can be modelled without a fixed rotation.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input set of matrices.
- **Correspondence handling**: Not applicable.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, psychometrics.
- **Theme tags**: T1-FAIL.
- **Theme**: Theme 1

#### Harvey et al. (2026). A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification.
- **Citation key**: [harvey2026multi]
- **Type**: Conference paper (Conference on Health, Inference, and Learning 2026, PMLR 333, pages 114-133).
- **Identifier**: arXiv 2604.26807; https://proceedings.mlr.press/v333/harvey26a.html (proceedings page and its citation tags read).
- **Method**: a comparison of simple MIL with mean pooling, attention-based MIL (TransMIL and SmAP among them), 3D CNNs and 3D ViTs on 9 binary tasks from 7 CT and MRI datasets (ADNI1, OASIS-3, RSNA and proprietary data), each scan a bag of 2D slices embedded by a pre-trained image encoder; a test of per-slice attention against the slice labels of RSNA; a semi-synthetic dataset where a Bayes estimator gives the best possible classifier.
- **Key Findings**: Mean pooling MIL without learnable attention matches or outperforms the MIL and 3D CNN alternatives on 4 of 6 moderate-sized tasks and stays competitive on two large datasets, at 25 times less training time. The attention models gain roughly 0.01 to 0.03 AUROC at 8 times or more the training time. The learned attention of TransMIL and SmAP does not find reliable per-slice signals, and on the semi-synthetic data with 10,000 training scans both fall at least 0.04 AUROC below the Bayes estimator.
- **Relevance**: it measures how attention pooling, the main MIL encoder of the theme, fails to improve on mean pooling for subject-level prediction from 3D brain scans.
- **Prediction setting**: subject-level classification (one binary label per scan) from a bag of slices of one 3D scan.
- **Correspondence handling**: permutation invariance over slice embeddings; the bag comes from one scan, so no element matching across subjects is used (the preprocessing of appendix A was not read).
- **Pipeline relation**: removes lesion segmentation (scan-level labels only).
- **Application domain**: medical imaging (brain CT and MRI).
- **Theme tags**: T3e, T3c, T3d.
- **Quality**: abstract, contribution list, sections 5.3, 6 and 7 read in the arXiv HTML full text; PMLR page read. Peer-reviewed proceedings; 7 datasets, the largest of 21,744 scans; OpenAlex cited_by_count 2. Quick assessment 12 of 15.
- **Viewpoint**: opposes learned attention pooling as an improvement over mean pooling for 3D brain scans.
- **Potential Use**: failure analysis of attention MIL for subject-level neuroimaging; mean pooling as the baseline.
- **Theme**: Theme 3

#### He et al. (2023). Neural Pre-processing: A Learning Framework for End-to-End Brain MRI Pre-processing.
- **Citation key**: [he2023neural]
- **Identifier**: DOI 10.1007/978-3-031-43993-3_25; arXiv 2303.12148. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-43993-3_25.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2023)
- **Method**: Neural Pre-processing (NPP) is an end-to-end weakly supervised network that performs skull stripping, intensity normalization and spatial normalization of head MRI at once, with the geometry-preserving intensity mapping disentangled from the spatial transformation.
- **Key Findings**: The model outperforms state-of-the-art methods that tackle only one of the sub-tasks. Ablations show the importance of the chosen architecture. The user can control each sub-task at inference time; code and model are released.
- **Relevance**: It addresses P3: the spatial normalization step that places every brain in a standard coordinate space is learned jointly with the other pre-processing steps instead of run as a separate registration.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 11 citations.
- **Potential Use**: Method background (learned registration within pre-processing)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the output is a pre-processed brain in a standard space.
- **Correspondence handling**: registration to a common space; spatial normalization maps each brain to a standard coordinate space.
- **Pipeline relation**: builds on registration; the network learns the spatial normalization together with skull stripping and intensity normalization.
- **Application domain**: medical imaging, head and brain MRI.
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 4 (neural pre-processing); merge screening reason: end-to-end network that performs skull stripping, intensity normalization and spatial normalization together

#### Hering et al. (2023). Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning.
- **Citation key**: [hering2023learn2reg]
- **Identifier**: DOI 10.1109/tmi.2022.3213983. Confirmed by a live lookup at https://doi.org/10.1109/tmi.2022.3213983.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: A multi-task registration challenge and dataset covering brain, abdomen and thorax, ultrasound, CT and MR, and intra- and inter-patient tasks, with metrics for robustness, accuracy, plausibility and runtime.
- **Key Findings**: The challenge compiled over 65 method submissions from more than 20 teams. The abstract reports that no single approach worked best across all tasks, analyses transferability, label supervision and bias, and states that conventional registration methods need not be much slower than deep-learning methods.
- **Relevance**: It addresses P3 by measuring registration accuracy and robustness across tasks, the error that registration-based pipelines inherit.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 3. OpenAlex counts 192 citations.
- **Potential Use**: Discussion and limitations (measured registration error).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the challenge scores registration methods and predicts no subject outcome.
- **Correspondence handling**: registration to a common space; the evaluated methods compute deformable correspondences between images within and across patients.
- **Pipeline relation**: measures how a pipeline step fails; it scores deformable registration by robustness, accuracy and plausibility across tasks.
- **Application domain**: medical imaging, ultrasound, CT and MR of the brain, abdomen and thorax.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (Learn2Reg); merge screening reason: multi-task registration challenge with robustness, accuracy and plausibility metrics

#### Hindsholm et al. (2025). Prospective clinical evaluation of automatic lesion assessment in patients with multiple sclerosis.
- **Citation key**: [hindsholm2025prospective]
- **Identifier**: DOI 10.1007/s00234-025-03834-4; PMID 41222674. Confirmed by a live lookup at https://doi.org/10.1007/s00234-025-03834-4.
- **Type**: Journal article (Neuroradiology)
- **Method**: Prospective real-world validation of a commercial AI tool (mdbrain v.4.11.0) for detecting new and enlarging MS lesions on follow-up MRI, with four neuroradiologists reading with and without AI and case-level performance metrics.
- **Key Findings**: In 112 MS patients scanned on 8 MRI scanner models, mean assessment time fell by 27 s with AI (p = 0.317). The AI had a negative predictive value of 0.89 for new lesions and low positive predictive values (0.35 to 0.65) from false positives. Radiologists found the AI helpful in 87% of cases.
- **Relevance**: It addresses P3 by measuring how an automated lesion detection and quantification step performs and fails in clinical use.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 2. OpenAlex counts 2 citations.
- **Potential Use**: Discussion and limitations (clinical failure modes of automated lesion assessment).
- **Stance**: Opposes, reliance on the tool's positive lesion findings, given its low positive predictive value.
- **Prediction setting**: subject-level classification, input image on a grid; performance is computed per case for the presence of new and enlarging lesions on current and prior MRI.
- **Correspondence handling**: not applicable; the abstract does not state how the tool compares current and prior scans, and no cross-subject correspondence is involved.
- **Pipeline relation**: measures how a pipeline step fails; it quantifies false positives and predictive values of automatic lesion detection.
- **Application domain**: medical imaging, brain MRI, multiple sclerosis.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Hindsholm 2025); merge screening reason: prospective clinical evaluation of an AI MS lesion tool on 112 patients, with low positive predictive value

#### Hoffmann et al. (2024). Anatomy-aware and acquisition-agnostic joint registration with SynthMorph.
- **Citation key**: [hoffmann2024anatomy]
- **Identifier**: DOI 10.1162/imag_a_00197. Confirmed by a live lookup at https://doi.org/10.1162/imag_a_00197.
- **Type**: Journal article (Imaging Neuroscience)
- **Method**: SynthMorph, a deep learning tool for joint affine and deformable registration of brain images, trained on images synthesized from label maps, optimizing overlap of selected anatomical labels, with a deformable hypernetwork for choosing regularity at registration time.
- **Key Findings**: The abstract states that training on widely varying synthesized images gives robustness to acquisition characteristics unseen at training. Optimizing selected labels removes the need for preprocessing that excludes irrelevant structures. Compared with state-of-the-art tools on a very diverse set of neuroimaging data, SynthMorph is reported to have high accuracy, with no figures in the abstract.
- **Relevance**: It is the registration step in its current learned form, which a registration-free method is compared against (P3).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 2, rigor 3, relevance 2, citations 3, data 3. OpenAlex counts 56 citations.
- **Potential Use**: Method background (registration to a common space); Experimental baselines.
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the output is a transform between images.
- **Correspondence handling**: registration to a common space; the tool maps one brain image onto another by affine and deformable transforms.
- **Pipeline relation**: builds on registration; the tool is itself the registration step and removes the preprocessing that would otherwise precede it.
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 4 (SynthMorph); merge screening reason: acquisition-agnostic joint affine and deformable registration without preprocessing

#### Hosny, Parmar, Coroller, Grossmann, Zeleznik, Kumar, Bussink, Gillies, Mak and Aerts (2018). Deep learning for lung cancer prognostication: a retrospective multi-cohort radiomics study.
- **Citation key**: [hosny2018deep]
- **Type**: Journal article (PLOS Medicine)
- **Identifier**: DOI 10.1371/journal.pmed.1002711, PMID 30500819; confirmed at https://doi.org/10.1371/journal.pmed.1002711 (resolves to the PLOS page) and the PubMed record.
- **Method**: A 3D CNN on CT patches of 50 x 50 x 50 mm around the tumour centre, trained on 7 data sets (1,194 NSCLC patients) to predict 2-year overall survival, with transfer learning from radiotherapy to surgery patients; compared with clinical models and engineered radiomic features.
- **Key Findings**: The CNN was associated with 2-year survival (AUC 0.70 for radiotherapy, 0.71 for surgery) and outperformed clinical random forests, with test-retest ICC 0.91 and inter-reader Spearman 0.88 under relocated seed points. The methods state that patches were centred on the centre of mass of full 3D tumour segmentations, and the discussion states that deployment needs only a seed point roughly within the tumour.
- **Relevance**: It removes the engineered feature step and the contour, but keeps lesion localization; activation maps point to tumour-surrounding tissue that contour-based features exclude.
- **Quality**: Full text read (methods "Data preprocessing for deep learning", results on stability, discussion) and abstract.
- **Potential Use**: End-to-end alternative to radiomics, with the step it still needs.
- **Viewpoint**: supports end-to-end prediction over engineered features.
- **Prediction setting**: subject-level classification (2-year survival) and risk stratification; image on a grid (CT patch around the tumour).
- **Correspondence handling**: not applicable in the cross-subject sense; each input is centred on its own tumour, which aligns subjects at one point only.
- **Pipeline relation**: removes radiomic feature engineering; builds on lesion segmentation (tumour centre from the segmentation in this study, a seed point in deployment).
- **Application domain**: medical imaging, chest CT, non-small-cell lung cancer.
- **Theme tags**: `step-removal`.
- **Theme**: Theme 4

#### Hu et al. (2023). Overall Survival Time Prediction of Glioblastoma on Preoperative MRI Using Lesion Network Mapping.
- **Citation key**: [hu2023overall]
- **Identifier**: DOI 10.1007/978-3-031-43993-3_29; proceedings page https://conferences.miccai.org/2023/papers/479-Paper2161.html. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-43993-3_29.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2023, Lecture Notes in Computer Science)
- **Method**: Augmented lesion network mapping, which embeds each patient's whole tumour into an atlas of functional connections from a large cohort of healthy subjects to estimate functional disconnection maps, averages subsets of these maps into many functional lesion network maps, and feeds them to a 3D ResNet with average pooling and fully connected layers for survival classification.
- **Key Findings**: The functional lesion network maps are derived from structural MRI, so they do not require functional MRI of the patient, and the averaging of subsets enlarges the training data to reduce over-fitting on a small data set. Experiments on the BraTS 2020 training data show the effectiveness of the maps for glioblastoma survival classification, and the paper identifies survival-relevant brain regions.
- **Relevance**: A subject-level survival classifier that builds on the tumour segmentation and on placing the lesion in the space of a normative atlas (P1, P3), and the abstract contrasts it with MRI radiomics.
- **Quality**: Abstract read (Springer chapter page and the MICCAI 2023 paper page). Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Related work (analyses that depend on registration); Experimental baselines (an atlas-space lesion feature for survival).
- **Stance**: Supports, that features of the lesion in a normative connectivity atlas predict glioblastoma survival from preoperative MRI.
- **Prediction setting**: subject-level classification, input image on a grid (the functional lesion network maps in atlas space); the 3D ResNet classifies the overall survival of each patient.
- **Correspondence handling**: registration to a common space; the lesion is embedded into an atlas of functional connections, which places every patient's tumour in the atlas space, and the abstract does not name the registration method.
- **Pipeline relation**: builds on registration, builds on lesion segmentation; the input is the whole-tumour lesion placed in the atlas space.
- **Application domain**: medical imaging, structural MRI of the brain (glioblastoma, BraTS 2020).
- **Theme tags**: `reg-analysis`, `lesion-seg`.
- **Theme**: added: handed on by Theme 4 (Hu 2023 lesion network mapping survival); merge screening reason: lesion network mapping of the tumour into a healthy connectivity atlas for glioblastoma survival classification, read on the publisher page

#### Huang, Chen and Zhang (2026). Shift-aware sparse Kronecker tensor classification.
- **Citation key**: [huang2026shift]
- **Identifier**: DOI 10.1007/s11222-026-10892-y, confirmed at https://doi.org/10.1007/s11222-026-10892-y through Crossref, OpenAlex and Semantic Scholar; arXiv 2505.12113 is a preprint by the same authors with the title "Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging".
- **Type**: Journal article (Statistics and Computing).
- **Method**: A cyclic-shift logistic sparse Kronecker product decomposition: a low-rank tensor regression for classification that adds a second, circularly shifted view of each image and maps its contribution back to the original coordinates, with consistency under restricted strong convexity.
- **Key Findings**: The abstract states that spatial misalignment across subjects challenges classification from neuroimaging, and reports accurate signal recovery under noise and misalignment in simulations and competitive classification on OASIS-1 and ADNI-1 MRI with hippocampus and cerebellum identified. The preprint text describes the shift as a remedy for "the minor mis-registrations endemic to multi-subject MRI" and fits 2D models to one selected slice per axis.
- **Relevance**: The one included tensor regression that models residual misalignment of the spatial mode, and a measurement of how the aligned-grid assumption fails under small shifts.
- **Quality**: Abstract of the published version, and the introduction, the cyclic-shift section and the application section of the preprint's arXiv HTML full text.
- **Potential Use**: Evidence that tensor regression on registered images still suffers from residual misalignment, and one model-level remedy.
- **Stance**: Supports (that alignment is a failure point of tensor regression).
- **Prediction setting**: Subject-level classification (Alzheimer's disease versus control), input image on a grid (2D MRI slices).
- **Correspondence handling**: Registration to a common space, plus a learned tolerance to small circular shifts; large deformations are left to registration.
- **Pipeline relation**: Builds on registration, and measures how a pipeline step fails (residual mis-registration).
- **Application domain**: Medical imaging, structural MRI of the brain (OASIS-1, ADNI-1).
- **Theme tags**: T1-TR, T1-FAIL.
- **Theme**: Theme 1

#### Iglesias et al. (2026). On the accuracy of nonlinear image registration in portable low-field 3D brain MRI.
- **Citation key**: [iglesias2026accuracy]
- **Identifier**: DOI 10.1038/s41598-026-63646-1. Confirmed by a live lookup at https://doi.org/10.1038/s41598-026-63646-1.
- **Type**: Journal article (Scientific Reports)
- **Method**: Evaluates classical (NiftyReg), learning-based (SynthMorph) and synthesis-based (SynthSR with NiftyReg) nonlinear registration on simulated low-field scans made by downsampling high-field images and on real low-field brain MRI.
- **Key Findings**: On downsampled high-field scans all methods performed well, with high Dice scores and smooth deformation fields, so reduced resolution alone did not hinder registration. Real low-field data gave lower accuracy, mainly from geometric distortion and other acquisition artifacts. The synthesis-based pipeline was the most robust across subjects and modalities.
- **Relevance**: It measures where the registration step fails on a new acquisition type and names the cause (P3).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Discussion and limitations (registration failure on low-field MRI).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; registration accuracy is measured and no outcome is predicted.
- **Correspondence handling**: registration to a common space; the methods evaluated align brain MRI by nonlinear registration.
- **Pipeline relation**: builds on registration / measures how a pipeline step fails; the study measures registration accuracy and attributes the loss to distortion and artifacts.
- **Application domain**: medical imaging, portable low-field and high-field brain MRI.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (Iglesias 2026 low-field registration); merge screening reason: measures nonlinear registration accuracy on portable low-field MRI

#### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Citation key**: [ilse2018attention]
- **Type**: Conference paper (ICML 2018, PMLR 80). Foundational work named for the theme.
- **Identifier**: arXiv 1802.04712; https://proceedings.mlr.press/v80/ilse18a.html (proceedings page read).
- **Method**: MIL as learning the Bernoulli distribution of the bag label, with an attention-based permutation-invariant aggregation operator.
- **Key Findings**: The bag-label probability is parameterized by neural networks and an attention pooling. The attention weights show the contribution of each instance to the bag label. Results match the best MIL methods on benchmark datasets and exceed them on an MNIST-based MIL dataset and two histopathology datasets.
- **Relevance**: it is the attention pooling that most lesion-set and slide-level models of this theme build on; a subject is a bag and its lesions, regions or patches are instances.
- **Prediction setting**: subject-level classification (bag label) from a set of instances (image patches).
- **Correspondence handling**: permutation invariance; attention pooling is invariant to instance order.
- **Pipeline relation**: not applicable in the abstract; in its histopathology uses the instances are image patches.
- **Application domain**: medical imaging (histopathology) and other domain (MNIST bags, MIL benchmarks).
- **Theme tags**: T3c.
- **Quality**: abstract read on the PMLR page. Peer-reviewed; OpenAlex cited_by_count of the arXiv record 2011. Quick assessment 14 of 15.
- **Viewpoint**: supports attention pooling; `raff2023reproducibility` reports that its MIL-pooling model fails the standard MIL assumption test.
- **Potential Use**: MIL pooling for subject-level prediction.
- **Theme**: Theme 3

#### Iporre-Rivas et al. (2026). Benchmarking Geometric Deep Learning for Hippocampal Shape Analysis.
- **Citation key**: [iporrerivas2026benchmarking]
- **Identifier**: DOI 10.1007/978-3-032-37679-4_28. Confirmed by a live lookup at https://doi.org/10.1007/978-3-032-37679-4_28.
- **Type**: Conference paper (Machine Learning and Knowledge Discovery in Databases, ECML PKDD 2026, Lecture Notes in Computer Science)
- **Method**: A comparative study of geometric deep learning models for hippocampal shape analysis on meshes, evaluated on shape retrieval, shape classification and metric learning, with normative modelling of the learned shape space against biomarkers.
- **Key Findings**: The abstract states that the use of geometric deep learning on neuroanatomical data is inconsistent and that comparison is hard because results are sensitive to cohort selection and preprocessing pipelines. Using normative modelling, the study relates coordinates in the learned shape space to beta-amyloid burden, cognitive scores and genetic phenotypes. The abstract does not state the results of the comparison.
- **Relevance**: A benchmark of predictors that take hippocampal meshes without a shared voxel grid, with subject-level inference through normative modelling (P1), and it names the preprocessing pipeline as a source of variation.
- **Quality**: Abstract read (Springer chapter page). Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (point-cloud networks; sets of lesions or regions and medical point clouds); Experimental baselines (geometric deep learning models for hippocampal shape).
- **Stance**: Neutral.
- **Prediction setting**: subject-level classification, input mesh or surface (hippocampal surfaces); the models classify shapes, and normative modelling gives subject-level inference against biomarkers.
- **Correspondence handling**: not applicable; the abstract does not state how the meshes are put in correspondence, and the models learn from manifolds and meshes directly.
- **Pipeline relation**: not applicable; the abstract names preprocessing pipelines as a source of sensitivity without naming a registration, radiomics or lesion segmentation step that the study removes, builds on or measures.
- **Application domain**: medical imaging, brain MRI of the hippocampus.
- **Theme tags**: T3b, T3d.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Isensee, Jaeger, Kohl, Petersen and Maier-Hein (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Citation key**: [isensee2021nnu]
- **Type**: Journal article (Nature Methods)
- **Identifier**: DOI 10.1038/s41592-020-01008-z, PMID 33288961; confirmed at https://doi.org/10.1038/s41592-020-01008-z and the PubMed record.
- **Method**: A segmentation method that configures its preprocessing, architecture, training and post-processing for a new task from fixed parameters, interdependent rules and empirical decisions.
- **Key Findings**: Without manual intervention, nnU-Net surpasses most existing approaches, including specialized ones, on 23 public datasets of international segmentation competitions.
- **Relevance**: It is the automated form of the lesion-segmentation step that a mask-based subject-level pipeline now uses.
- **Quality**: Abstract read. Named foundational work.
- **Potential Use**: The segmentation step as automated today.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (biomedical 2D and 3D images).
- **Correspondence handling**: not applicable.
- **Pipeline relation**: builds on lesion segmentation; it automates the step.
- **Application domain**: medical imaging, many modalities and organs across 23 datasets.
- **Theme tags**: `lesion-seg`.
- **Theme**: Theme 4

#### Isensee et al. (2024). nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation.
- **Citation key**: [isensee2024nnu]
- **Identifier**: DOI 10.1007/978-3-031-72114-4_47, arXiv 2404.09556. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-72114-4_47.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2024)
- **Method**: A benchmark of CNN-based, Transformer-based and Mamba-based 3D medical segmentation methods designed to avoid inadequate baselines, insufficient datasets and neglected computational resources.
- **Key Findings**: Many recent claims of superiority over the U-Net baseline do not hold under scrutiny of these validation shortcomings. The recipe for state-of-the-art performance is CNN-based U-Net models including ResNet and ConvNeXt variants, the nnU-Net framework, and scaling to modern hardware. The authors read this as an innovation bias toward new architectures.
- **Relevance**: It addresses P3 by measuring how claims about the segmentation step fail under rigorous validation.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 835 citations.
- **Potential Use**: Experimental baselines (nnU-Net as the segmentation baseline) and Discussion and limitations.
- **Stance**: Opposes, claims that new segmentation architectures beat a properly configured U-Net.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the benchmark evaluates segmentation.
- **Correspondence handling**: not applicable; segmentation is evaluated per image.
- **Pipeline relation**: measures how a pipeline step fails; it measures the validation of 3D segmentation methods, and the abstract does not state which datasets or whether they are lesion tasks.
- **Application domain**: medical imaging, 3D segmentation (the abstract does not name modalities or organs).
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (nnU-Net revisited); merge screening reason: shows that many claimed segmentation gains fail under rigorous validation against nnU-Net baselines

#### Islam and Mahmud (2026). NeuroAPS-Net: Neuro-Anatomically Aware Point Cloud Representation for Efficient Alzheimer's Disease Classification.
- **Citation key**: [islam2026neuroaps]
- **Identifier**: DOI 10.1109/ijcnn69854.2026.11729839. Confirmed by a live lookup at https://doi.org/10.1109/ijcnn69854.2026.11729839.
- **Type**: Conference paper (2026 International Joint Conference on Neural Networks (IJCNN))
- **Method**: Converts T1-weighted MRI into anatomically labeled 2D point clouds by Anatomical Priority Sampling (the ADNI-2DPC dataset) and classifies them with NeuroAPS-Net, a lightweight geometric network with region-aware feature encoding and ROI token aggregation.
- **Key Findings**: The abstract reports competitive accuracy for Alzheimer's disease classification on ADNI-2DPC with much lower inference latency and GPU memory than state-of-the-art point cloud methods. It presents anatomically guided point cloud learning as an alternative to voxel-based 3D CNNs. The abstract does not state the number of subjects or the accuracy figures.
- **Relevance**: A subject-level classifier from brain MRI recast as a point cloud, with anatomical region tokens (P1, P2).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (point-cloud networks on medical images).
- **Stance**: Supports, that point cloud learning is an efficient alternative to voxel CNNs for Alzheimer's disease classification.
- **Prediction setting**: subject-level classification, input point cloud; each subject's MRI-derived point cloud receives a diagnosis label.
- **Correspondence handling**: permutation invariance; the input is a point cloud processed by a point cloud network with ROI token aggregation, and the abstract does not state the invariance in these words or how the anatomical labels of the points are obtained.
- **Pipeline relation**: not applicable; the abstract does not state whether the anatomical labels come from registration to an atlas or from segmentation.
- **Application domain**: medical imaging, T1-weighted MRI of the brain.
- **Theme tags**: T3b, T3d.
- **Theme**: added: handed on by Theme 3 (NeuroAPS-Net 2026); merge screening reason: MRI-derived point clouds for AD classification (IJCNN 2026)

#### Janati, Cuturi and Gramfort (2020). Debiased Sinkhorn barycenters.
- **Citation key**: [janati2020debiased]
- **Type**: Conference paper (ICML, PMLR 119).
- **Method**: Analysis of the entropic bias of barycenters through the reference measure of the entropy, and a debiased barycenter.
- **Key Findings**: Entropy brings a smoothing bias that blurs barycenters. The paper ties the bias to the reference measure, proves that the entropic barycenter of univariate Gaussians is Gaussian with a quantified variance bias, and proposes debiased barycenters with Sinkhorn-like iterations and no smoothing.
- **Relevance**: The entropic bias that blurs a transport template is the failure mode of entropic averaging of subjects; this paper measures it and removes it.
- **Quality**: High. Read: abstract and Section 2 headings and passages (arXiv HTML full text). Cited 27 times in OpenAlex on 2026-11-19.
- **Potential Use**: Failure analysis and its remedy.
- **Identifier**: arXiv 2006.02575; https://proceedings.mlr.press/v119/janati20a.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input distributions (images on a grid, point clouds).
- **Correspondence handling**: Learned template or barycenter.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (images and simulated data).
- **Theme tags**: T2c, T2g, T2a.
- **Viewpoint**: Neutral.
- **Theme**: Theme 2

#### Jia et al. (2024). Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT.
- **Citation key**: [jia20243d]
- **Identifier**: DOI 10.1016/j.compbiomed.2024.109192. Confirmed by a live lookup at https://doi.org/10.1016/j.compbiomed.2024.109192.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: A point cloud neural network (PNN-Vessel) and a graph neural network (GNN-Vessel) estimate pulmonary function tests from point cloud and graph representations of pulmonary vessel centerlines, combined with a CT-based CNN by multiple variable step-wise regression.
- **Key Findings**: PNN-Vessel and GNN-Vessel outperformed the vessel CNN by 14 percent and 4 percent in averaged intra-class correlation over four pulmonary function metrics, with less training time and fewer parameters. The combination of CNN-CT, PNN-Vessel and GNN-Vessel reached the best accuracy (ICC of 0.748, 0.742, 0.836 and 0.835 for the four measures). The abstract does not state the number of patients.
- **Relevance**: It addresses P1: a subject-level regression from a point cloud of anatomical structures extracted from CT.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 6 citations.
- **Potential Use**: Related work (point-cloud networks on medical structures).
- **Stance**: Supports, point cloud and graph representations of vessels over down-sampled image CNNs.
- **Prediction setting**: subject-level regression, input point cloud; four pulmonary function measures are estimated per patient, with a graph representation as a second input.
- **Correspondence handling**: permutation invariance; the abstract names a point cloud neural network on vessel centerline points, a model class invariant to point order, and does not state any registration.
- **Pipeline relation**: not applicable; the input is extracted vessel centerlines, an anatomical extraction step outside registration, radiomics and lesion segmentation.
- **Application domain**: medical imaging, chest CT, pulmonary vessels in systemic sclerosis with interstitial lung disease.
- **Theme tags**: T3b, T3d.
- **Theme**: added: handed on by Theme 3 (point cloud pulmonary function CT); merge screening reason: point cloud and graph networks on vessel centerlines for pulmonary function from CT

#### Joshi, Davis, Jomier and Gerig (2004). Unbiased diffeomorphic atlas construction for computational anatomy.
- **Citation key**: [joshi2004unbiased]
- **Type**: Journal article (NeuroImage)
- **Identifier**: DOI 10.1016/j.neuroimage.2004.07.068, PMID 15501084; confirmed at https://doi.org/10.1016/j.neuroimage.2004.07.068 and the PubMed record.
- **Method**: Constructs a population atlas in the large-deformation diffeomorphic setting without choosing one subject as the template, applied to MRI of 2-year-old children in an autism study, with a probabilistic atlas of the caudate nucleus.
- **Key Findings**: The abstract states that choosing a template image introduces a bias, and presents an unbiased construction. New subjects are segmented by mapping the atlas, validated against manual segmentations.
- **Relevance**: It is the estimated-template form of correspondence: the common space is itself estimated from the population, which places it between registration to a fixed template and the learned templates of later work.
- **Quality**: Abstract read; the abstract describes the work as work in progress. Seminal work, admitted as a named foundational work.
- **Potential Use**: Background on template estimation and template bias.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (brain MRI); the output is an atlas and atlas-based segmentation.
- **Correspondence handling**: learned template or barycenter; the atlas is estimated jointly with the diffeomorphisms of all subjects to it.
- **Pipeline relation**: builds on registration; it removes the choice of a fixed template, not registration itself.
- **Application domain**: medical imaging, pediatric brain MRI, caudate nucleus.
- **Theme tags**: `reg-template`.
- **Theme**: Theme 4

#### Kachaiev and Recanatesi (2024). Learning to Embed Distributions via Maximum Kernel Entropy.
- **Citation key**: [kachaiev2024learning]
- **Identifier**: DOI 10.52202/079017-1420. Confirmed by a live lookup at https://doi.org/10.52202/079017-1420.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 37)
- **Method**: An unsupervised objective for learning a data-dependent distribution kernel by maximizing entropy in the space of probability measure embeddings.
- **Key Findings**: The paper examines the theoretical properties of the latent embedding space induced by the objective and argues that its geometry suits downstream discriminative tasks. The learned kernel is demonstrated across different modalities; the abstract does not name them or give numbers.
- **Relevance**: It addresses P1 and P2 for distribution regression, where each input is a sample from a distribution with no shared index.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 1. OpenAlex counts 4 citations.
- **Potential Use**: Related work (distribution regression and kernel embeddings).
- **Stance**: Supports, learning data-dependent distribution kernels in place of choosing one by hand.
- **Prediction setting**: other (classification and regression of distributions in downstream tasks), input distribution or set of vectors.
- **Correspondence handling**: permutation invariance; each sample set is embedded as a probability measure, an embedding that does not depend on element order.
- **Pipeline relation**: not applicable; the paper is a general machine learning method.
- **Application domain**: other domain, machine learning across several data modalities (not named in the abstract).
- **Theme tags**: T3c.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Kag et al. (2026). Attention Is Not Localization: A Leakage-Free, End-to-End Evaluation of Weakly-Supervised and Supervised Breast-Lesion Localization in Mammography.
- **Citation key**: [kag2026attention]
- **Identifier**: DOI 10.1109/access.2026.3751717. Confirmed by a live lookup at https://doi.org/10.1109/access.2026.3751717.
- **Type**: Journal article (IEEE Access)
- **Method**: Lesion localization by attention and class-activation maps of image-level classifiers, including attention-based multiple-instance learning and a mammography foundation encoder, is scored against supervised detectors and segmenters under patient-disjoint protocols on four mammography datasets.
- **Key Findings**: Maps of EfficientNet-B0 classifiers placed their peak inside a lesion in at most 11.5% of CBIS-DDSM images, while a supervised Attention U-Net pointed at the lesion in 54.9% but detected only 50.7% of lesions (13.6% of calcifications). Delineation on annotation-centred crops reached Dice 0.871 against 0.781 for a centred disk that ignores the image, and end-to-end Dice with detector-derived crops was 0.360 on CBIS-DDSM and 0.555 on INbreast. The abstract concludes that detection is the bottleneck of the end-to-end pipeline and that conditional segmentation overstates end-to-end performance.
- **Relevance**: It addresses P3 by measuring how lesion localization and segmentation fail end to end, and how weakly supervised attention fails to stand in for them.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (failure of lesion segmentation and of attention as its substitute).
- **Stance**: Opposes, the claim that attention maps of image-level classifiers localize lesions.
- **Prediction setting**: other (image-level lesion classification and lesion localization), input image on a grid; the labels and scores are per mammogram or per lesion.
- **Correspondence handling**: not applicable; each mammogram is analysed on its own and no correspondence across subjects is needed.
- **Pipeline relation**: measures how a pipeline step fails; it scores lesion detection and delineation end to end and shows that segmentation conditioned on annotation-centred crops overstates performance.
- **Application domain**: medical imaging, mammography, breast.
- **Theme tags**: `lesion-seg`, `failure`, T3e.
- **Theme**: added: handed on by Theme 3 (attention is not localization mammography); merge screening reason: tests weakly supervised attention maps against supervised lesion segmentation for localization in mammography

#### Kalpathy-Cramer et al. (2016). Radiomics of Lung Nodules: A Multi-Institutional Study of Robustness and Agreement of Quantitative Imaging Features.
- **Citation key**: [kalpathycramer2016radiomics]
- **Identifier**: DOI 10.18383/j.tom.2016.00235. Confirmed by a live lookup at https://doi.org/10.18383/j.tom.2016.00235.
- **Type**: Journal article (Tomography)
- **Method**: A multi-institutional study of Quantitative Imaging Network members that measures the sensitivity of 830 pulmonary nodule features to segmentation and to the implementation of feature extraction, by concordance correlation, pairwise correlation and a graphical model of uncorrelated feature groups.
- **Key Findings**: 68% of the 830 features have a concordance correlation coefficient of at least 0.75 with respect to the underlying segmentation. At correlation thresholds of 0.75 and 0.95 there are 75 and 246 uncorrelated feature subgroups. The abstract does not state the number of nodules or patients.
- **Relevance**: It addresses P3: it measures how radiomic features of nodules change with the segmentation and with the software that extracts them.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 137 citations.
- **Potential Use**: Discussion and limitations (robustness of radiomic features across segmentations and implementations)
- **Stance**: Supports, that a part of radiomic features is sensitive to segmentation and implementation and many features are redundant.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the outcome is feature stability and redundancy.
- **Correspondence handling**: not applicable; features are computed per nodule.
- **Pipeline relation**: builds on radiomics, measures how a pipeline step fails; feature stability against segmentation and implementation is measured.
- **Application domain**: medical imaging, pulmonary nodules (the abstract does not name the modality).
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Kalpathy-Cramer 2016); merge screening reason: multi-institutional sensitivity of lung nodule features to segmentation and implementation

#### Kan et al. (2026). 3D Transport-based Morphometry (3D-TBM) for medical image analysis.
- **Citation key**: [kan20263d]
- **Identifier**: arXiv 2602.07260. Confirmed by a live lookup at https://arxiv.org/abs/2602.07260.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: 3D-TBM is a tool for morphological analysis of 3D medical images that embeds images into a transport domain by invertible transformations, with data preprocessing, optimal transport embeddings, visualization of main transport directions and techniques for finding discriminating directions.
- **Key Findings**: The abstract states that the transport-domain features support classification, regression and other tasks, and that the inverse mapping projects results back into image space for interpretation. The tool comes with documentation and tutorials and is available through PyTransKit. The abstract reports no experimental results.
- **Relevance**: It addresses P2: images are compared through invertible transport embeddings, and the tool makes this available for subject-level analyses in clinical imaging.
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 1, rigor 1, relevance 3, citations 2, data 1. OpenAlex counts 1 citation.
- **Potential Use**: Method background (transport-based morphometry software)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the tool supports classification and regression, but the abstract reports no prediction experiment.
- **Correspondence handling**: transport coupling; each image is embedded by an optimal transport map, and the abstract does not name the reference it is mapped to.
- **Pipeline relation**: not applicable; the abstract names data preprocessing without saying whether it includes registration or segmentation.
- **Application domain**: medical imaging, 3D medical images (the abstract names neither the modality nor the organ).
- **Theme tags**: T2f.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Karimzadeh et al. (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study.
- **Citation key**: [karimzadeh2026revisiting]
- **Type**: Journal article (Physics in Medicine and Biology 71(12), article 125014).
- **Identifier**: DOI 10.1088/1361-6560/ae7955 (resolved through `the lookup script resolve` against Crossref, OpenAlex and Semantic Scholar, and through doi.org BibTeX); PMID 42248208 (PubMed esummary record).
- **Method**: each patient is an unordered set of lesion-level 18F-FDG PET radiomic feature vectors, 107 PyRadiomics features per involved lymph node, optionally with demographic variables and node centre-of-mass coordinates after rigid registration to a common reference space. Pooled tabular baselines are compared with Transformer, Deep Sets, multiple instance learning, Set Transformer and a graph-based model, with five-fold cross-validation on one centre (151 patients) and an external test on a second centre (80 patients), under direct transfer and unsupervised test-time adaptation.
- **Key Findings**: Adding demographic and spatial features to radiomics improved discrimination. On the first centre the best deep aggregation models reached ROC-AUC up to 0.91 (standard deviation 0.05). Direct transfer to the second centre reduced performance; test-time adaptation with TENT raised the Transformer from ROC-AUC 0.81 to 0.87 and F1 from 0.60 to 0.75.
- **Relevance**: it predicts a subject-level label from a variable-size set of lesions and compares the set encoders of this theme on the same patients, with an external cohort.
- **Prediction setting**: subject-level classification (Hodgkin against non-Hodgkin lymphoma) from a variable-size set of lesion feature vectors.
- **Correspondence handling**: permutation invariance over lesions; the optional spatial features rest on rigid registration to a common reference space.
- **Pipeline relation**: builds on radiomics (PyRadiomics features per lesion) and on lesion delineation, which per-lesion feature extraction needs (the delineation method is not named in the abstract); builds on registration for the spatial features.
- **Application domain**: medical imaging (18F-FDG PET; lymphoma).
- **Theme tags**: T3d, T3c.
- **Quality**: abstract read in the OpenAlex and PubMed records. The full text was not read: the publisher PDF and the University of Copenhagen repository PDF both answered with a browser challenge page. Peer-reviewed; 231 patients over two centres with external testing; OpenAlex cited_by_count 0. Quick assessment 11 of 15.
- **Viewpoint**: supports learnable set aggregation over pooled tabular baselines for lesion sets, and reports a cross-centre drop.
- **Potential Use**: the closest prior use of Deep Sets and Set Transformer on a set of lesions per patient; baseline set for a lesion-set comparison.
- **Theme**: Theme 3

#### Kazmierski et al. (2023). Multi-institutional Prognostic Modeling in Head and Neck Cancer: Evaluating Impact and Generalizability of Deep Learning and Radiomics.
- **Citation key**: [kazmierski2023multi]
- **Identifier**: DOI 10.1158/2767-9764.crc-22-0152. Confirmed by a live lookup at https://doi.org/10.1158/2767-9764.crc-22-0152.
- **Type**: Journal article (Cancer Research Communications)
- **Method**: Crowdsourced development of 12 overall-survival models for head and neck cancer using electronic medical records and pretreatment images, trained on 2,552 patients from one institution and externally validated on three cohorts (873 patients).
- **Key Findings**: The most accurate model used multitask learning on clinical data and tumour volume, outperforming models on clinical data only, engineered radiomics or complex deep networks for 2-year and lifetime survival. External validation of the top three models showed significant drops in performance. The abstract concludes that ML with simple prognostic factors outperformed multiple advanced CT radiomics and deep learning methods.
- **Relevance**: It measures, for a subject-level survival outcome, that engineered radiomics and deep features add little over tumour volume and clinical data and do not transfer across institutions (P3).
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 2, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 58 citations.
- **Potential Use**: Discussion and limitations (value and transfer of radiomics in prognosis); Experimental baselines (clinical and tumour-volume baselines).
- **Stance**: Opposes, the view that engineered radiomics or deep imaging features outperform simple prognostic factors for head and neck cancer survival.
- **Prediction setting**: subject-level regression, input image on a grid; the outcome is overall survival, predicted from pretreatment images and medical records.
- **Correspondence handling**: not applicable; the abstract does not describe a correspondence step, and the best model uses tumour volume and clinical data.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; engineered radiomics and tumour volume (which needs a tumour delineation) are compared with other inputs, and engineered radiomics did not outperform simple factors.
- **Application domain**: medical imaging, pretreatment CT of head and neck cancer.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: handed on by Theme 4 (Kazmierski 2023); merge screening reason: 12 prognostic models comparing engineered radiomics, deep learning and clinical data in head and neck cancer (2,552 and 873 patients)

#### Kiers, ten Berge and Bro (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Citation key**: [kiers1999parafac2]
- **Identifier**: DOI 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b, confirmed at https://doi.org/10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (Journal of Chemometrics). Foundational work named for the theme.
- **Method**: An algorithm that fits PARAFAC2 directly to the set of data matrices.
- **Key Findings**: The abstract states that PARAFAC2 applies when each data matrix has the same column units but different numbers of row units, gives unique solutions under mild assumptions, and that direct fitting is more efficient than indirect fitting and handles constraints, missing data and higher-way generalizations.
- **Relevance**: The standard fitting algorithm for data in which the number of rows varies per slice, such as a varying number of time points or regions per subject.
- **Quality**: Abstract alone. Seminal (OpenAlex counts 484 citations).
- **Potential Use**: Definition of PARAFAC2 for slices with different numbers of rows.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input set of matrices with a varying number of rows.
- **Correspondence handling**: Other: the varying mode is modelled per slice with a constant cross-product constraint, so no row-to-row correspondence across slices is needed.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, chemometrics and psychometrics.
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Klein, Andersson, Ardekani, et al. (2009). Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration.
- **Citation key**: [klein2009evaluation]
- **Type**: Journal article (NeuroImage)
- **Identifier**: DOI 10.1016/j.neuroimage.2008.12.037, PMID 19195496; confirmed at https://doi.org/10.1016/j.neuroimage.2008.12.037 and the PubMed record.
- **Method**: More than 45,000 registrations between 80 manually labeled brains by 14 algorithms (including SyN, ART, IRTK, FNIRT, DARTEL), scored with 8 error measures and ranked by three independent analyses.
- **Key Findings**: Relative performance was little affected by subject population, labeling protocol or overlap measure. ART, SyN, IRTK and DARTEL gave the best overlap and distance results, with ART and SyN the most consistent across subjects and label sets.
- **Relevance**: It is the quantitative measurement of registration error that downstream voxelwise and regional analyses inherit.
- **Quality**: Abstract read. Named foundational work.
- **Potential Use**: Registration accuracy as a measured quantity.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (brain MRI).
- **Correspondence handling**: registration to a common space; pairwise nonlinear registration after FLIRT linear registration.
- **Pipeline relation**: measures how a pipeline step fails (registration, by label overlap and distance).
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: `failure`, `reg-template`.
- **Theme**: Theme 4

#### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Citation key**: [kolda2009tensor]
- **Identifier**: DOI 10.1137/07070111x, confirmed at https://doi.org/10.1137/07070111x through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article, survey (SIAM Review).
- **Method**: Survey of higher-order tensor decompositions and software.
- **Key Findings**: The abstract presents CP and Tucker as higher-order extensions of the SVD and lists INDSCAL, PARAFAC2, CANDELINC, DEDICOM and PARATUCK2 among the other decompositions.
- **Relevance**: Cited by five of the six core papers chained in layer 2 (Roald et al. 2022, Tang et al. 2026, Zhou et al. 2013, Huang et al. 2026, Xu et al. 2024), which marks it "must include" by the chaining rule. It defines the CP and Tucker structures the tensor regressions use and places PARAFAC2 among them.
- **Quality**: Abstract alone. Seminal (OpenAlex counts 12347 citations).
- **Potential Use**: Definitions and notation of CP, Tucker and PARAFAC2.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input tensor.
- **Correspondence handling**: Not applicable.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, survey across psychometrics, chemometrics, signal processing, neuroscience and data mining.
- **Theme tags**: T1-BG.
- **Theme**: Theme 1

#### Kolouri et al. (2016). Sliced Wasserstein Kernels for Probability Distributions.
- **Citation key**: [kolouri2016sliced]
- **Identifier**: DOI 10.1109/cvpr.2016.568. Confirmed by a live lookup at https://doi.org/10.1109/cvpr.2016.568.
- **Type**: Conference paper (2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR))
- **Method**: A family of provably positive definite kernels for probability distributions based on the sliced Wasserstein distance, for use in kernel methods.
- **Key Findings**: The kernels are shown to be positive definite and are reported to benefit a variety of learning tasks. The abstract does not state the tasks, datasets or any numbers.
- **Relevance**: It addresses P2 with a transport-based kernel that compares sets or distributions without a shared index.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 3, data 1. OpenAlex counts 226 citations.
- **Potential Use**: Method background (sliced Wasserstein kernels).
- **Stance**: Supports, sliced Wasserstein kernels for learning on distributions.
- **Prediction setting**: other (learning tasks on probability distributions, not named in the abstract), input distribution or set of vectors.
- **Correspondence handling**: transport coupling; distributions are compared through one-dimensional transport along projection directions.
- **Pipeline relation**: not applicable; the paper is a general machine learning method.
- **Application domain**: other domain, computer vision and machine learning.
- **Theme tags**: T2e.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Kolouri et al. (2021). Wasserstein Embedding for Graph Learning.
- **Citation key**: [kolouri2021wasserstein]
- **Identifier**: arXiv 2006.09430. Confirmed by a live lookup at https://arxiv.org/abs/2006.09430.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: WEGL embeds each graph as the distribution of its node embeddings, computes Monge maps from a reference distribution to each node-embedding distribution, and uses these maps as a fixed-size vector for graph-level prediction.
- **Key Findings**: The abstract reports that the method avoids pairwise distance computation between graphs, reducing the cost from quadratic to linear in the number of graphs. It reports state-of-the-art classification performance on graph-property prediction benchmarks with better computational efficiency. Code is released.
- **Relevance**: It handles missing node correspondence across graphs by transport to one reference, giving a fixed-length code usable by any classifier (P2).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 71 citations.
- **Potential Use**: Method background (linear transport embeddings to a reference distribution).
- **Stance**: Supports, that a linear transport embedding to a reference gives accurate and fast graph-level prediction.
- **Prediction setting**: other (graph-level classification on benchmark datasets), input graph; each graph is represented by the distribution of its node embeddings and receives one label.
- **Correspondence handling**: transport coupling; the paper names a fixed reference distribution, and the Monge map from that reference to each graph's node embeddings gives every graph a common coordinate system.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, graph-property prediction benchmarks.
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Kolouri 2021 Wasserstein embedding graph); merge screening reason: linear transport embedding of node-embedding sets to a reference distribution for graph-level prediction

#### Kothapalli et al. (2024). Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification.
- **Citation key**: [kothapalli2024equivariant]
- **Identifier**: arXiv 2306.05553. Confirmed by a live lookup at https://arxiv.org/abs/2306.05553.
- **Type**: Workshop paper (Proc. Geometry-grounded Representation Learning and Generative Modeling Workshop (GRaM))
- **Method**: An empirical study of the interplay between permutation-equivariant backbones and permutation-invariant global pooling on three benchmark point cloud classification datasets.
- **Key Findings**: Complex pooling, such as transport-based or attention-based pooling, boosts simple backbones, with smaller benefits for complex backbones, and complex backbones still benefit from pooling in low-data settings. The choice of pooling can affect performance more than the width and depth of the backbone, and pairwise combinations of pooling layers improve a fixed backbone.
- **Relevance**: It addresses P2: it measures how the permutation-invariant pooling layer, including transport-based pooling, changes set-level prediction.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 4 citations.
- **Potential Use**: Experimental baselines (pooling choices for point cloud encoders)
- **Stance**: Supports, that the pooling layer matters as much as or more than the backbone in permutation-invariant networks.
- **Prediction setting**: other (object-level point cloud classification), input point cloud; the benchmarks classify whole point clouds.
- **Correspondence handling**: permutation invariance; the networks combine an equivariant backbone with invariant global pooling.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, benchmark point cloud classification datasets.
- **Theme tags**: T3b, T3a.
- **Theme**: added: handed on by Theme 3 (equivariant vs invariant layers point cloud); merge screening reason: comparison of equivariant backbones and invariant pooling, including transport-based pooling, for point cloud classification (preprint)

#### Kothari et al. (2022). The impact of inter-observer variation in delineation on robustness of radiomics features in non-small cell lung cancer.
- **Citation key**: [kothari2022impact]
- **Identifier**: DOI 10.1038/s41598-022-16520-9. Confirmed by a live lookup at https://doi.org/10.1038/s41598-022-16520-9.
- **Type**: Journal article (Scientific Reports)
- **Method**: Using the public NSCLC-Radiomics (an extra manual contour set for 92 patients) and NSCLC-Radiomics-Interobserver1 (five manual and five semi-automated contours for 20 patients) datasets, 1113 radiomic features were tested for robustness to inter-observer contouring by ICC, and a published radiomics signature was tested by Cox regression for overall survival.
- **Key Findings**: Median Dice ranged from 0.81 to 0.85 and median ICC was 0.90, 0.88 and 0.93 across the datasets and contour types, lower for first-order and GLCM features. Survival curves separated similarly for three of four signature features, apart from original_shape_Compactness2 with low ICC (0.61). Semi-automated contouring improved feature stability.
- **Relevance**: It measures how delineation variability changes radiomic features and a survival signature (P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 33 citations. Small study (92 and 20 patients).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics and its effect on prognosis).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the Cox analysis applies a previously published signature to check the effect of feature robustness, and no new predictor is built.
- **Correspondence handling**: not applicable; features are computed per tumour contour and compared across observers.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; features are extracted from manual and semi-automated tumour contours and their robustness to the contours is measured.
- **Application domain**: medical imaging, non-small cell lung cancer (the abstract does not name the modality).
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Kothari 2022); merge screening reason: feature robustness to inter-observer contouring in NSCLC with survival analysis

#### Kovacs et al. (2023). Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer.
- **Citation key**: [kovacs2023addressing]
- **Identifier**: DOI 10.1038/s41598-023-46747-z. Confirmed by a live lookup at https://doi.org/10.1038/s41598-023-46747-z.
- **Type**: Journal article (Scientific Reports)
- **Method**: Compares strategies for handling misalignment between the sequences of multi-parametric prostate MRI in a computer-aided diagnosis model, including established registration algorithms, no registration, and a proposed "misalignment augmentation" used alone or together with registration.
- **Key Findings**: The abstract states that there is no consensus on whether computer-aided diagnosis systems profit from registration. It reports that misalignment augmentation compensates for a complete lack of registration, and that augmentation combined with registration improves overall performance on an independent test set. The abstract does not state the number of patients or the accuracy figures.
- **Relevance**: It measures, for a subject-level diagnosis, whether the registration step is needed and shows a training-time alternative that replaces it (P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 16 citations.
- **Potential Use**: Related work (registration removal and its measured effect in imaging pipelines); Discussion and limitations.
- **Stance**: Supports, that misalignment augmentation can stand in for inter-sequence registration in prostate cancer diagnosis.
- **Prediction setting**: subject-level classification, input image on a grid; the model diagnoses prostate cancer from the multi-parametric MRI of each patient.
- **Correspondence handling**: registration to a common space; the correspondence at issue is between the MRI sequences of one patient, handled by co-registration in some arms and by augmentation that trains the model to tolerate misalignment in others.
- **Pipeline relation**: removes registration / measures how a pipeline step fails; augmentation without registration is compared with registration, and registration combined with augmentation is also tested.
- **Application domain**: medical imaging, multi-parametric MRI of the prostate.
- **Theme tags**: `reg-analysis`, `step-removal`.
- **Theme**: added: handed on by Theme 1 (prostate MRI misalignment 2023); merge screening reason: compares registration, no registration and misalignment augmentation for prostate cancer diagnosis on the same data

#### Kralik, Tinelli, Kozloski, Ponte Costa, Sharott and Peach (2026). Identifying aligned tensor decompositions across heterogeneous neural datasets.
- **Citation key**: [kralik2026identifying]
- **Identifier**: DOI 10.64898/2026.11.12.766278, confirmed at https://doi.org/10.64898/2026.11.12.766278 through Crossref, OpenAlex and Semantic Scholar; the full text was read from https://www.biorxiv.org/content/biorxiv/early/2026/11/13/2026.11.12.766278.full.pdf. No arXiv ID.
- **Type**: Preprint (bioRxiv), flagged as a preprint; not certified by peer review.
- **Method**: Neuralign, a joint tensor decomposition of neuron by time by trial recordings from many sessions and animals, with a temporal factor shared across sessions and neuron and trial factors per session; the neuron factors are coupled across sessions as A(n) = Q(n) H diag(S(n)), a session-specific orthonormal projection of a shared mixing matrix scaled by session gains, imposed as a soft penalty "inspired by PARAFAC2 and coupled tensor models", with Q(n) estimated by orthogonal Procrustes.
- **Key Findings**: The text states that tensor component analysis requires the same neurons to be tracked across sessions, which is not possible between animals, and that applying it after a separate alignment fixes the correspondence before the components are estimated; Neuralign estimates alignment and decomposition jointly, without matched neurons or trials. The abstract reports better recovery of shared components from pooled recordings in simulations, recovery of the ring-like organisation of reach directions in macaque motor cortex, and one component isolating the response to inhibition of the anterior lateral motor cortex across 93 mouse recordings.
- **Relevance**: The one included decomposition whose unaligned mode is a set of units (neurons) with no correspondence across subjects, which is the structure of a point set or a set of regions; the coupling is a PARAFAC2-type orthogonal projection onto a shared geometry.
- **Quality**: Abstract, introduction and the model section (2.1) of the bioRxiv full text.
- **Potential Use**: A PARAFAC2-style coupling for unit sets without correspondence, as a template for subject-level sets of regions or lesions.
- **Stance**: Supports.
- **Prediction setting**: Representation or comparison only, no prediction (unsupervised by default; labels may anchor the alignment), input set of per-session tensors with different numbers of neurons and trials.
- **Correspondence handling**: A learned template or barycenter: a shared component geometry H mapped to each session's neurons by an orthonormal projection fitted by Procrustes.
- **Pipeline relation**: Not applicable; the data are electrophysiological recordings, and the model removes the need to match neurons across sessions.
- **Application domain**: Other domain, systems neuroscience (multi-session neural recordings in mouse and macaque).
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Kuang et al. (2020). Shift-Invariant Canonical Polyadic Decomposition of Complex-Valued Multi-Subject fMRI Data With a Phase Sparsity Constraint.
- **Citation key**: [kuang2020shift]
- **Identifier**: DOI 10.1109/tmi.2019.2936046, confirmed at https://doi.org/10.1109/tmi.2019.2936046 through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (IEEE Transactions on Medical Imaging).
- **Method**: Shift-invariant CPD of multi-subject complex-valued fMRI with subject-specific time delays and a phase sparsity constraint on the shared spatial maps.
- **Key Findings**: The abstract states that CPD of multi-subject fMRI is not well formulated because of subject variability in the spatial and temporal modes, that shift-invariant CPD models temporal variability through subject-specific delays, and that the proposed method detects 178.7% more contiguous task-related activations than a real-valued method combining shift-invariant CPD and ICA.
- **Relevance**: The shifted CP of the theme scope across subjects; it absorbs a temporal misalignment between subjects and handles spatial variability only by a sparsity constraint on a shared spatial map.
- **Quality**: Abstract alone.
- **Potential Use**: Shifted CP in multi-subject imaging, and the limit that the spatial mode is still shared.
- **Stance**: Neutral.
- **Prediction setting**: Representation or comparison only, no prediction, input tensor (voxel by time by subject).
- **Correspondence handling**: Registration to a common space for the spatial mode (the spatial maps are shared across subjects) and a per-subject shift for the time mode.
- **Pipeline relation**: Builds on registration; the voxel mode is shared across subjects.
- **Application domain**: Medical imaging, task fMRI of the brain.
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Kundu et al. (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry.
- **Citation key**: [kundu2018discovery]
- **Identifier**: DOI 10.1016/j.neuroimage.2017.11.006, arXiv 1705.04919, PMID 29117580. Confirmed by a live lookup at https://doi.org/10.1016/j.neuroimage.2017.11.006.
- **Type**: Journal article (NeuroImage)
- **Method**: Transport-based morphometry (TBM), an invertible image transformation that maps brain images losslessly to a transport domain, where linear models for discrimination, regression and blind source separation are fitted.
- **Key Findings**: On structural brain images of healthy older adults, linear models in the TBM domain discover the characteristic changes of aging and highlight potential mechanisms by which aerobic fitness may relate to brain health. The inverse transformation visualizes shifts in tissue distribution behind the statistical associations. The abstract does not state the sample size or any accuracy.
- **Relevance**: It addresses P1 and P3: a subject-level model on brain MRI that, by the abstract, needs no a priori features such as thalamic volume or cortical thickness.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 37 citations.
- **Potential Use**: Related work (transport-based subject representations in neuroimaging).
- **Stance**: Supports, a transport representation of brain images in place of pre-specified anatomical or deformation-based features.
- **Prediction setting**: subject-level regression, input image on a grid; the abstract names linear regression and discrimination models on the transformed images of each subject.
- **Correspondence handling**: transport coupling; each image is mapped by a transport-based transformation, and the abstract does not state the reference image or whether images are registered first.
- **Pipeline relation**: removes radiomic feature engineering; the abstract states that no a priori features, anatomical or deformation-based, are required.
- **Application domain**: medical imaging, structural MRI of the brain.
- **Theme tags**: T2e, T2f, `step-removal`.
- **Theme**: added: handed on by Theme 2 (Kundu 2018 TBM structural biomarkers); merge screening reason: transport-based morphometry mapping brain images to a transport domain for phenotype prediction without a priori features

#### Kundu et al. (2020). Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning.
- **Citation key**: [kundu2020enabling]
- **Type**: Journal article (PNAS).
- **Method**: Optimal mass transport combined with statistical pattern recognition on cartilage texture maps.
- **Key Findings**: In 86 individuals of the Osteoarthritis Initiative with no symptoms at baseline, a classifier on baseline texture maps detected progression to symptomatic osteoarthritis at 3 years with 78 percent test accuracy. The method is generative, so the predictive cartilage phenotype is visualized.
- **Relevance**: A subject-level outcome predicted from transport representations of medical images.
- **Quality**: Medium (small cohort). Read: abstract only. Routes tried for a full text: PubMed Central PMC7547154 (not open access; efetch returned front matter only) and the Europe PMC full-text service (HTTP 500). Cited 77 times in OpenAlex on 2026-11-19.
- **Potential Use**: Transport-based prediction of a clinical outcome.
- **Identifier**: DOI 10.1073/pnas.1917405117; PMID 32958644; https://doi.org/10.1073/pnas.1917405117 (confirmed).
- **Prediction setting**: Subject-level classification, input image on a grid (cartilage texture maps).
- **Correspondence handling**: Transport coupling to a reference (transport-based morphometry); the abstract does not say how the maps are put in correspondence.
- **Pipeline relation**: Removes radiomic feature engineering, by the abstract's contrast with hand-chosen features; the registration and segmentation steps that build the texture maps are not stated in the abstract.
- **Application domain**: Medical imaging (quantitative MRI, knee cartilage).
- **Theme tags**: T2f, T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Kundu et al. (2024). Discovering the gene-brain-behavior link in autism via generative machine learning.
- **Citation key**: [kundu2024discovering]
- **Identifier**: DOI 10.1126/sciadv.adl5307. Confirmed by a live lookup at https://doi.org/10.1126/sciadv.adl5307.
- **Type**: Journal article (Science Advances)
- **Method**: 3D transport-based morphometry (TBM) extracts structural brain changes linked to copy number variation at 16p11.2 from brain images and is used both to predict the variant and to visualize the endophenotypes behind the prediction.
- **Key Findings**: In data from the Simons Variation in Individuals Project, two endophenotypes were identified, and their detection gave 89 to 95 percent test accuracy in predicting 16p11.2 copy number variation from brain images alone. TBM visualized dose-dependent brain changes among deletion and duplication carriers. The endophenotypes are reported as sensitive to articulation disorders and as explaining part of the variability in intelligence quotient.
- **Relevance**: A subject-level classifier from brain images whose representation is built by optimal transport, in a clinical cohort (P1, P2).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 26 citations.
- **Potential Use**: Related work (transport-based supervised prediction in medical imaging).
- **Stance**: Supports, that transport-based morphometry can predict a genetic variant from brain images and make the prediction interpretable.
- **Prediction setting**: subject-level classification, input image on a grid; the outcome is the 16p11.2 copy number variation of each subject, predicted from brain images.
- **Correspondence handling**: transport coupling; the paper's name for the method is transport-based morphometry, and the abstract does not state the reference image or whether a registration step precedes it.
- **Pipeline relation**: not applicable; the abstract does not state which registration, segmentation or feature steps precede TBM.
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Kundu 2024 gene brain behavior autism); merge screening reason: 3D transport-based morphometry predicting 16p11.2 copy number from brain MRI

#### Kusner et al. (2015). From Word Embeddings To Document Distances.
- **Citation key**: [kusner2015word]
- **Identifier**: proceedings url https://proceedings.mlr.press/v37/kusnerb15.html. Confirmed by a live lookup at https://proceedings.mlr.press/v37/kusnerb15.html.
- **Type**: Conference paper (Proc. Int. Conf. Machine Learning (ICML))
- **Method**: The Word Mover's Distance measures the dissimilarity of two documents as the minimum distance the embedded words of one must travel to reach those of the other, an instance of the Earth Mover's Distance.
- **Key Findings**: The metric has no hyperparameters and is straightforward to implement. On eight document classification datasets against seven baselines, it gave very low k-nearest neighbour classification error rates. The abstract gives no figures.
- **Relevance**: It shows a transport distance between unordered sets of vectors used directly for prediction by nearest neighbours (P2).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 2700 citations.
- **Potential Use**: Method background (transport distances between sets for classification).
- **Stance**: Supports, that a transport distance between word sets gives low nearest-neighbour error.
- **Prediction setting**: other (document-level classification by k-nearest neighbours), input distribution or set of vectors; each document is a set of word embeddings.
- **Correspondence handling**: transport coupling; the Earth Mover's Distance solves the coupling between the words of two documents.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, text document classification.
- **Theme tags**: T2e.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Kwon et al. (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease.
- **Citation key**: [kwon2025graph]
- **Identifier**: DOI 10.1016/j.media.2025.103538; PMID 40121807. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2025.103538.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: A prototype-based graph neural network on sulcal pit graphs, with a prototype inverse-projection that projects learned prototypes onto individual node representations for interpretability, replacing spectral graph matching against a normative reference set.
- **Key Findings**: The abstract lists the problems of earlier sulcal pattern analysis: no standard criterion for a typical reference set, the cost of graph matching, user-defined feature weights and an assumption of uniform node distribution. On classification of healthy controls (n = 174) against patients with congenital heart disease (n = 345) from four cohort studies and a public dataset, the method outperformed other state-of-the-art models, with ablation studies. The learned prototypes were visualized and examined.
- **Relevance**: It replaces matching each subject to a reference set by prototypes learned from the data, for a subject-level label (P1, P2).
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 2 citations.
- **Potential Use**: Related work (learned templates and prototypes for unaligned brain structures).
- **Stance**: Supports, that learned prototypes can replace graph matching against a reference set for sulcal pattern classification.
- **Prediction setting**: subject-level classification, input graph; each subject's sulcal pit graph receives a control or congenital heart disease label.
- **Correspondence handling**: learned template or barycenter; the paper calls them prototypes, and they fall under this category because they are learned from the data and replace the fixed reference set used by spectral graph matching.
- **Pipeline relation**: not applicable; the step replaced is graph matching against a reference set, and the abstract does not describe registration, radiomics or lesion segmentation.
- **Application domain**: medical imaging, brain (cortical sulcal pattern graphs; the abstract does not name the imaging modality).
- **Theme tags**: T2d, T3d.
- **Theme**: added: handed on by Theme 2 (Kwon 2025 sulcal prototype CHD); merge screening reason: prototype graph network for sulcal pattern graphs that replaces spectral graph matching against a reference set

#### Lambin, Rios-Velazquez, Leijenaar, Carvalho, van Stiphout, Granton, Zegers, Gillies, Boellard, Dekker and Aerts (2012). Radiomics: extracting more information from medical images using advanced feature analysis.
- **Citation key**: [lambin2012radiomics]
- **Type**: Journal article (European Journal of Cancer)
- **Identifier**: DOI 10.1016/j.ejca.2011.11.036, PMID 22257792; confirmed at https://doi.org/10.1016/j.ejca.2011.11.036 and the PubMed record.
- **Method**: Position paper that defines radiomics as the high-throughput extraction of large amounts of image features from radiographic images.
- **Key Findings**: The abstract argues that imaging can capture intra-tumoural heterogeneity non-invasively and that automated, reproducible feature extraction is needed. It states that the approach needs further validation in multi-centric settings.
- **Relevance**: It names the radiomics step whose removal the research question asks about.
- **Quality**: Abstract read; a position paper with no data of its own. Before the inclusion window; admitted as a named foundational work.
- **Potential Use**: Definition of radiomics.
- **Viewpoint**: supports radiomics.
- **Prediction setting**: other (defines a feature-extraction approach for later prediction models; no prediction reported); image on a grid (CT, PET, MRI) within a tumour region.
- **Correspondence handling**: not applicable; features are computed per tumour region, so no cross-subject spatial correspondence is used.
- **Pipeline relation**: builds on lesion segmentation; it defines the radiomic feature step, computed inside a delineated tumour.
- **Application domain**: medical imaging, oncology, several modalities.
- **Theme tags**: `radiomics`.
- **Theme**: Theme 4

#### Law et al. (2018). Bayesian Approaches to Distribution Regression.
- **Citation key**: [law2018bayesian]
- **Identifier**: arXiv 1705.04293. Confirmed by a live lookup at https://arxiv.org/abs/1705.04293.
- **Type**: Conference paper (Proc. Int. Conf. Artificial Intelligence and Statistics (AISTATS))
- **Method**: A Bayesian distribution regression formalism, framed as a neural network, that propagates the uncertainty due to sampling variability within each group, with MAP inference by backpropagation and MCMC inference.
- **Key Findings**: The abstract states that current distribution regression treats small and large groups as equally well estimated. Accounting for this uncertainty improves robustness and performance when group sizes vary. The approach is shown on toy datasets and on predicting age from images; the abstract does not report numbers.
- **Relevance**: It addresses P1 and P2: a label given at the group level is predicted from a set of samples of varying size, as with a varying number of points, lesions or regions per subject.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 39 citations.
- **Potential Use**: Method background (distribution regression with varying set size)
- **Stance**: Supports, that distribution regression should weight groups by the uncertainty that their size implies.
- **Prediction setting**: other (group-level regression; the abstract names age prediction from images without stating the unit of a group), input distribution or set of vectors; each group of samples has one label.
- **Correspondence handling**: permutation invariance; each group enters as a distribution of samples, with no correspondence between samples of different groups.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, toy data and age prediction from images (the abstract does not name the image type).
- **Theme tags**: T3c.
- **Theme**: added: handed on by Theme 3 (Law Bayesian distribution regression); merge screening reason: Bayesian distribution regression that accounts for varying group size, with age prediction from images

#### Lee et al. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Citation key**: [lee2019set]
- **Type**: Conference paper (ICML 2019, PMLR 97). Foundational work named for the theme.
- **Identifier**: arXiv 1810.00825; https://proceedings.mlr.press/v97/lee19d.html (proceedings page read).
- **Method**: attention-based encoder and decoder for sets, with an inducing-point attention scheme.
- **Key Findings**: The module models interactions among set elements with attention in both encoder and decoder. An inducing-point scheme reduces self-attention cost from quadratic to linear in the number of elements. The paper reports results on tasks that include multiple instance learning and 3D shape recognition.
- **Relevance**: it replaces the sum or max pooling of Deep Sets with attention over elements, keeping permutation invariance as the correspondence route.
- **Prediction setting**: other, set-level classification and estimation with a set of vectors or a point cloud as input; the abstract names multiple instance learning, 3D shape recognition and few-shot classification.
- **Correspondence handling**: permutation invariance; attention over elements and pooling by attention leave the output unchanged under reordering.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (synthetic sets, 3D shapes, images).
- **Theme tags**: T3a.
- **Quality**: abstract read on the PMLR page. Peer-reviewed proceedings; OpenAlex cited_by_count 837. Quick assessment 13 of 15.
- **Viewpoint**: supports attention pooling over sum pooling.
- **Potential Use**: set encoders with element interactions; the attention pooling used in later lesion-set models.
- **Theme**: Theme 3

#### Leijenaar et al. (2013). Stability of FDG-PET Radiomics features: An integrated analysis of test-retest and inter-observer variability.
- **Citation key**: [leijenaar2013stability]
- **Identifier**: DOI 10.3109/0284186x.2013.812798. Confirmed by a live lookup at https://doi.org/10.3109/0284186x.2013.812798.
- **Type**: Journal article (Acta Oncologica)
- **Method**: Test-retest stability (11 NSCLC patients imaged twice within one day, threshold delineation) and inter-observer stability (23 patients, manual delineation by five blinded observers) of 106 PET features, assessed by ICC and coefficient of variability, with the two rankings compared by Spearman correlation.
- **Key Findings**: Most features had high test-retest (71 percent) and inter-observer (91 percent) stability by ICC. Features more stable in repeated imaging were also more robust to inter-observer variability. The authors conclude that further research of these features is warranted.
- **Relevance**: It measures how delineation and repeated acquisition change radiomic features (P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 1. OpenAlex counts 460 citations. Small study (11 and 23 patients).
- **Potential Use**: Discussion and limitations (stability of radiomic features).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; feature stability is measured and no outcome is predicted.
- **Correspondence handling**: not applicable; features are computed per lesion delineation and compared across scans and observers.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; features are extracted from delineated lesions and their stability to rescanning and to observers is measured.
- **Application domain**: medical imaging, FDG-PET and PET-CT of non-small cell lung carcinoma.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Leijenaar 2013); merge screening reason: test-retest and inter-observer stability of PET radiomics (small cohorts, 11 and 23 patients)

#### Leung et al. (2024). Deep Semisupervised Transfer Learning for Fully Automated Whole-Body Tumor Quantification and Prognosis of Cancer on PET/CT.
- **Citation key**: [leung2024deep]
- **Identifier**: DOI 10.2967/jnumed.123.267048. Confirmed by a live lookup at https://doi.org/10.2967/jnumed.123.267048.
- **Type**: Journal article (Journal of Nuclear Medicine)
- **Method**: A semisupervised transfer learning approach with an nnU-net backbone segments tumours on whole-body 18F-FDG and PSMA PET/CT with limited annotations and radiomics analysis, and prognostic models use imaging measures extracted from the predicted segmentations.
- **Key Findings**: On 611 FDG and 408 PSMA PET/CT scans, median Dice was 0.81, 0.76, 0.83 and 0.73 for lung cancer, melanoma, lymphoma and prostate cancer. The prostate cancer risk model reached accuracy 0.83 and AUC 0.86, the head and neck risk score was associated with overall survival, and breast cancer pathologic complete response was predicted with AUC 0.72 from pretherapy and 0.76 from pre- and posttherapy measures.
- **Relevance**: It addresses P3 as a pipeline in which automatic lesion segmentation feeds subject-level prognostic models.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 3. OpenAlex counts 85 citations.
- **Potential Use**: Experimental baselines (segmentation-based prognostic pipelines on PET/CT).
- **Stance**: Supports, fully automated segmentation as the input stage of prognostic models.
- **Prediction setting**: subject-level classification, input image on a grid; the targets are each patient's risk group, survival and pathologic complete response.
- **Correspondence handling**: not applicable; imaging measures are extracted per patient from the predicted tumour segmentations and no cross-subject correspondence is used.
- **Pipeline relation**: builds on lesion segmentation; builds on radiomics; the prognostic models use imaging measures from the predicted segmentations, and radiomics analysis enters the learning of the segmentation.
- **Application domain**: medical imaging, 18F-FDG and PSMA PET/CT, whole body (lung, melanoma, lymphoma, head and neck, breast and prostate cancer).
- **Theme tags**: `lesion-seg`, `radiomics`.
- **Theme**: added: handed on by Theme 4 (Leung 2024); merge screening reason: fully automated whole-body tumour segmentation feeding prognostic models on PET/CT

#### Li, Xu, Zhou and Li (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Citation key**: [li2018tucker]
- **Identifier**: DOI 10.1007/s12561-018-9215-6, confirmed at https://doi.org/10.1007/s12561-018-9215-6 through Crossref, OpenAlex and Semantic Scholar; arXiv 1304.5637 is the preprint.
- **Type**: Journal article (Statistics in Biosciences).
- **Method**: Generalized linear tensor regression with a Tucker-structured coefficient array, the core and factor matrices estimated under supervision of the response; compared with the CP model of Zhou et al. 2013.
- **Key Findings**: The preprint abstract reports recovery of high-rank signals and consistency for the best Tucker approximation in Kullback-Leibler distance. The text applies the model to the ADHD-200 data, obtained from the Neuro Bureau after preprocessing, for continuous, binary and count responses.
- **Relevance**: The Tucker variant of tensor regression named in the theme scope; like the CP model it indexes coefficients by voxel.
- **Quality**: Preprint abstract, and the introduction, model and ADHD data sections of the arXiv HTML full text. Seminal (OpenAlex counts 209 citations).
- **Potential Use**: Alternatives to CP structure in tensor regression on aligned images.
- **Stance**: Neutral.
- **Prediction setting**: Subject-level classification and regression, input image on a grid (preprocessed MRI); one response per subject.
- **Correspondence handling**: Registration to a common space; the text describes the ADHD-200 images as preprocessed and the model requires covariate arrays of the same size for every subject.
- **Pipeline relation**: Builds on registration; the model is fitted to images preprocessed into a common array.
- **Application domain**: Medical imaging, structural MRI of the brain.
- **Theme tags**: T1-TR.
- **Theme**: Theme 1

#### Li et al. (2021). A Closer Look at Rotation-invariant Deep Point Cloud Analysis.
- **Citation key**: [li2021closer]
- **Type**: Conference paper (ICCV 2021).
- **Identifier**: DOI 10.1109/ICCV48922.2021.01591 (resolved at https://doi.org/10.1109/ICCV48922.2021.01591); CVF page https://openaccess.thecvf.com/content/ICCV2021/html/Li_A_Closer_Look_at_Rotation-Invariant_Deep_Point_Cloud_Analysis_ICCV_2021_paper.html read.
- **Method**: study of PCA-based canonical poses for randomly rotated point clouds, with a pose selector module.
- **Key Findings**: Rotation-invariant point cloud analysis mostly converts clouds to canonical poses with PCA, and the alignment of PCA is imperfect. The ambiguity of PCA canonical poses is handled insufficiently in recent works. A pose selector for disambiguation improves classification accuracy by 5.3 percent on a real-world dataset.
- **Relevance**: it measures how point-cloud encoders depend on a canonical pose, the step that permutation invariance does not supply.
- **Prediction setting**: other, object-level classification from a point cloud.
- **Correspondence handling**: permutation invariance plus a canonical pose from PCA (a rigid alignment computed per cloud).
- **Pipeline relation**: measures how a pipeline step fails (the pose canonicalization step that stands in for rigid registration).
- **Application domain**: other domain (3D objects, real-world scans).
- **Theme tags**: T3e, T3b.
- **Quality**: abstract read on the CVF page. Peer-reviewed; OpenAlex cited_by_count 81. Quick assessment 12 of 15.
- **Viewpoint**: opposes treating PCA canonical poses as solved.
- **Potential Use**: pose dependence of point-cloud encoders.
- **Theme**: Theme 3

#### Li et al. (2025). Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression.
- **Citation key**: [li2025quantile]
- **Identifier**: arXiv 2508.21523. Confirmed by a live lookup at https://arxiv.org/abs/2508.21523.
- **Type**: Preprint (arXiv). Preprint, not peer-reviewed.
- **Method**: Wasserstein-Frechet regression with the density function of each subject's epoch-level MEG source results as the response, and classification by Wasserstein distances between quantile functions of the control and patient groups.
- **Key Findings**: The approach keeps the whole distribution of epoch-level results instead of summary statistics, with age and gender as covariates. The abstract reports test accuracy up to 98 percent on a company dataset for mild traumatic brain injury.
- **Relevance**: A subject-level classifier whose input is a distribution per subject, compared by transport (P1, P2).
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 1, data 2. Preprint.
- **Potential Use**: Related work (transport-based prediction from distribution-valued data).
- **Stance**: Supports, distributional representations over summary statistics.
- **Prediction setting**: subject-level classification, input distribution or set of vectors (the density of epoch-level results of each subject); the outcome is mTBI against control.
- **Correspondence handling**: transport coupling; one-dimensional Wasserstein distances between quantile functions compare subjects without matching individual epochs.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomics or segmentation step.
- **Application domain**: medical imaging and electrophysiology, MEG with MRI of the brain (mild traumatic brain injury).
- **Theme tags**: T2e.
- **Theme**: added: merge recent-literature search R2 (2024 to 2026)

#### Liao et al. (2019). Evaluate the Malignancy of Pulmonary Nodules Using the 3-D Deep Leaky Noisy-OR Network.
- **Citation key**: [liao2019evaluate]
- **Type**: Journal article (IEEE Transactions on Neural Networks and Learning Systems 30(11)).
- **Identifier**: DOI 10.1109/TNNLS.2019.2892409 (resolved at https://doi.org/10.1109/TNNLS.2019.2892409); arXiv 1711.08324.
- **Method**: a 3D region proposal network detects nodules; the top five by detection confidence are scored and combined by a leaky noisy-OR gate into a subject-level cancer probability; the two modules share a U-net backbone.
- **Key Findings**: The model outputs the probability of lung cancer for the subject from all suspicious nodules. Alternating training of the two modules reduces over-fitting on the small training set. The model won first place in the Data Science Bowl 2017.
- **Relevance**: it is a subject-level prediction from a variable set of detected nodules, with a symmetric aggregation and a detection step in place of lesion segmentation.
- **Prediction setting**: subject-level classification (lung cancer) from a set of lesions (detected nodules, top five).
- **Correspondence handling**: permutation invariance; the noisy-OR gate is symmetric in the nodules.
- **Pipeline relation**: removes lesion segmentation (a detection network proposes nodules); removes radiomic feature engineering (learned nodule features).
- **Application domain**: medical imaging (chest CT; lung nodules).
- **Theme tags**: T3c, T3d.
- **Quality**: abstract and section list read in the arXiv HTML full text. Peer-reviewed; OpenAlex cited_by_count 558. Quick assessment 13 of 15.
- **Viewpoint**: supports MIL-style aggregation over detected lesions.
- **Potential Use**: sets of detected lesions with a symmetric aggregation.
- **Theme**: Theme 3

#### Liu et al. (2025). Lesion-Centered Vision Transformer for Stroke Outcome Prediction from Image and Clinical Data.
- **Citation key**: [liu2025lesion]
- **Identifier**: DOI 10.1007/978-3-032-05182-0_29; proceedings page https://papers.miccai.org/miccai-2025/0492-Paper2108.html. Confirmed by a live lookup at https://doi.org/10.1007/978-3-032-05182-0_29.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2025, Lecture Notes in Computer Science)
- **Method**: The Lesion-Centered Vision Transformer (LC-ViT) extracts axial, coronal and sagittal views centred on the ischemic lesion, tokenizes them with a pretrained token-clustering transformer (TCFormer), and fuses the image and 62 clinical variables with mutual cross-attention to predict the 3-month modified Rankin Scale.
- **Key Findings**: On a retrospective private cohort of 119 stroke patients treated with thrombectomy (65 percent favourable outcome) with DWI MRI, LC-ViT reaches an AUC of 0.80 (plus or minus 0.03) and an accuracy of 0.77 (plus or minus 0.02), significantly above single-modality deep architectures. The full text (Fig. 1 description) states that the lesion is segmented manually and that its mask centroid sets the three planes, and the conclusion names the small data set as a limitation and automated segmentation as future work.
- **Relevance**: A subject-level outcome predictor that replaces registration to a common grid by views centred on the segmented lesion, so it builds on lesion segmentation (P1, P3).
- **Quality**: Abstract and the method overview and conclusion of the full text read (Springer PDF). Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 2 citations.
- **Potential Use**: Related work (sets of lesions or regions and medical point clouds); Experimental baselines (a lesion-centred predictor of stroke outcome).
- **Stance**: Supports, that lesion-centred views and adaptive tokenization improve stroke outcome prediction over single-modality networks.
- **Prediction setting**: subject-level classification, input image on a grid (three planes centred on the lesion, with clinical data); the classifier predicts a favourable or unfavourable 3-month mRS for each patient.
- **Correspondence handling**: not applicable; the views are anchored at the lesion centroid of each patient and no correspondence across patients is built, and the paper names no registration step.
- **Pipeline relation**: builds on lesion segmentation; the lesion mask, drawn manually, gives the centroid at which the three views are extracted.
- **Application domain**: medical imaging, diffusion-weighted MRI of the brain (ischemic stroke).
- **Theme tags**: `lesion-seg`.
- **Theme**: added: handed on by Theme 4 (Liu 2025 lesion-centered ViT); merge screening reason: lesion-centred views from a manual lesion mask for 3-month mRS prediction, read on the publisher page and the MICCAI 2025 paper page

#### Liu et al. (2026). Three-Dimensional Point-Cloud Learning for Patient-Specific Deep Brain Stimulation Motor Response Prediction in Parkinson Disease.
- **Citation key**: [liu2026three]
- **Identifier**: DOI 10.34133/bmef.0276. Confirmed by a live lookup at https://doi.org/10.34133/bmef.0276.
- **Type**: Journal article (BME Frontiers)
- **Method**: Preoperative MRI, postoperative CT, electrode reconstruction, tissue conductivity and finite element electric field simulations are combined into patient-specific 3D point clouds, which PointNet++ uses to predict motor improvement after deep brain stimulation, compared with a voxelized CNN.
- **Key Findings**: Of 116 initially eligible patients, 37 were excluded for incomplete or unusable data, leaving 79 patients with one stimulation-outcome record each. On the fixed test set, PointNet++ placed 15 of 24 predictions within 5 MDS-UPDRS-III points (62.5%) against 8 of 24 (33.3%) for the voxelized CNN. The abstract states that, given the small test set, these estimates do not support claims of generalization, superiority or clinical utility.
- **Relevance**: It is a direct case of P1, a subject-level outcome predicted from a patient point cloud, and of P3, since the point cloud is built after registration and electrode reconstruction and replaces atlas, voxel-grid and summary-feature representations.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 1. OpenAlex counts 1 citations. Small study (79 patients).
- **Potential Use**: Related work (set encoders on medical point clouds).
- **Stance**: Supports, patient point clouds over voxelized inputs for DBS response prediction, with the authors' own limit on the claim.
- **Prediction setting**: subject-level regression, input point cloud; the target is each patient's motor improvement on the MDS-UPDRS-III scale.
- **Correspondence handling**: permutation invariance; PointNet++ takes each patient's own point cloud, and the abstract describes no point correspondence across patients.
- **Pipeline relation**: builds on registration; the abstract lists registration among the steps whose failure excluded patients, and the point cloud integrates preoperative MRI with postoperative CT and electrode reconstruction.
- **Application domain**: medical imaging, preoperative MRI and postoperative CT of the brain, Parkinson disease with deep brain stimulation.
- **Theme tags**: T3d, T3b.
- **Theme**: added: handed on by Theme 3 (Liu 2026 DBS point cloud); merge screening reason: patient point clouds for DBS motor response prediction (small study, 79 patients)

#### Louis et al. (2024). Identification of CT radiomic features robust to acquisition and segmentation variations for improved prediction of radiotherapy-treated lung cancer patient recurrence.
- **Citation key**: [louis2024identification]
- **Identifier**: DOI 10.1038/s41598-024-58551-4. Confirmed by a live lookup at https://doi.org/10.1038/s41598-024-58551-4.
- **Type**: Journal article (Scientific Reports)
- **Method**: Robustness of 106 CT radiomic features of the primary tumour in early-stage non-small cell lung cancer to two annotators' delineations and to high-dose against low-dose CT, followed by univariate and multivariate prediction of outcome after stereotactic body radiotherapy.
- **Key Findings**: Of 106 features, 21 were identified as robust. Robust features showed greater predictive potential than non-robust ones in univariate analysis. Linear regression models built with robust features generalized better on an external validation dataset; the abstract does not state the number of patients.
- **Relevance**: It addresses P3 by measuring how segmentation and acquisition variation affect radiomic features and the predictor built on them.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 15 citations.
- **Potential Use**: Discussion and limitations (segmentation and acquisition dependence of radiomics).
- **Stance**: Supports, restricting radiomics models to features robust to segmentation and acquisition.
- **Prediction setting**: subject-level classification, input image on a grid; recurrence after radiotherapy is predicted per patient, and the abstract does not state whether the outcome is modelled as binary or time-to-event.
- **Correspondence handling**: not applicable; features are computed within each patient's tumour.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; it measures feature robustness under two annotators' delineations.
- **Application domain**: medical imaging, CT of early-stage non-small cell lung cancer.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Louis 2024); merge screening reason: CT radiomic features robust to segmentation and acquisition variation and their effect on recurrence prediction

#### Lu et al. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Citation key**: [lu2021data]
- **Type**: Journal article (Nature Biomedical Engineering 5(6)).
- **Identifier**: DOI 10.1038/s41551-020-00682-w (resolved at https://doi.org/10.1038/s41551-020-00682-w); arXiv 2004.09666.
- **Method**: CLAM, clustering-constrained attention MIL over patch features.
- **Key Findings**: CLAM uses slide-level labels only, attention to find sub-regions of diagnostic value, and instance-level clustering to constrain the feature space. In its pipeline the tissue is segmented, 256 by 256 patches are cropped inside the tissue contours, and each patch is encoded by an ImageNet-pretrained ResNet50 into a 1024-dimensional vector. The abstract reports adaptation to independent cohorts, cell phone microscopy images and biopsies.
- **Relevance**: it is the widely used attention-MIL pipeline for slide-level prediction, and it shows which preprocessing steps such a pipeline keeps.
- **Prediction setting**: subject-level classification (slide-level subtyping and detection) from a set of patch features.
- **Correspondence handling**: permutation invariance (attention pooling over patches).
- **Pipeline relation**: removes lesion segmentation (slide labels only); builds on tissue segmentation and pretrained patch features, which replace hand-crafted feature engineering.
- **Application domain**: medical imaging (digital histopathology; kidney, lung, breast).
- **Theme tags**: T3c, T3d.
- **Quality**: abstract read on the arXiv record; the "Segmentation", "Patching" and feature extraction parts of the methods read in the arXiv HTML full text. Peer-reviewed; OpenAlex cited_by_count 3035. Quick assessment 15 of 15.
- **Viewpoint**: supports attention MIL.
- **Potential Use**: whole-slide images as bags; preprocessing that set models still need.
- **Theme**: Theme 3

#### Luo et al. (2023). Prediction of cerebral aneurysm rupture using a point cloud neural network.
- **Citation key**: [luo2023prediction]
- **Identifier**: DOI 10.1136/neurintsurg-2022-018655. Confirmed by a live lookup at https://doi.org/10.1136/neurintsurg-2022-018655.
- **Type**: Journal article (Journal of NeuroInterventional Surgery)
- **Method**: A point cloud neural network (PC-NN) on aneurysm models with or without the parent artery, built from MR angiography or CT angiography, compared with ridge regression, SVM and neural network models on radiomics features, on 418 aneurysms in 411 patients of one hospital and prospectively on 258 aneurysms in 254 patients from five external centers.
- **Key Findings**: On internal test data the PC-NN with parent artery reached AUC 0.913, higher than without parent artery (0.851; p=0.041) and than the radiomics models (0.803, 0.788 and 0.805). The PC-NN trained on MRA data reached AUC 0.936 against 0.824 for CTA data (p=0.043). In the prospective external cohort the PC-NN reached AUC 0.835 against 0.692, 0.701 and 0.681 for the radiomics models (p<0.001).
- **Relevance**: It addresses P1 and P3 directly: a point cloud model of the lesion compared with radiomics models on the same cohort, with prospective external testing.
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 23 citations.
- **Potential Use**: Related work (point-cloud networks on medical shapes) and Experimental baselines (radiomics models against a point cloud network).
- **Stance**: Supports, point cloud networks over radiomics-based models for aneurysm rupture prediction.
- **Prediction setting**: subject-level classification, input point cloud; rupture status is predicted per aneurysm, with 418 aneurysms in 411 patients, so the unit is close to one per patient.
- **Correspondence handling**: permutation invariance; the abstract names a point cloud neural network without stating its architecture, and invariance to point order is the property of that model class.
- **Pipeline relation**: removes radiomic feature engineering; the point cloud network replaces the radiomics features of the comparison models, and the abstract does not state how the aneurysm surface is extracted.
- **Application domain**: medical imaging, MR angiography and CT angiography of cerebral aneurysms.
- **Theme tags**: T3b, T3d, `radiomics`, `step-removal`.
- **Theme**: added: handed on by Theme 3 (aneurysm rupture point cloud); merge screening reason: point cloud network against radiomics models for aneurysm rupture on the same cohort with prospective external test

#### Luo et al. (2026). Bayesian Unsupervised Disentanglement of Anatomy and Geometry for Deep Groupwise Image Registration.
- **Citation key**: [luo2026bayesian]
- **Identifier**: DOI 10.1109/tpami.2025.3609521. Confirmed by a live lookup at https://doi.org/10.1109/tpami.2025.3609521.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence)
- **Method**: A Bayesian framework for multi-modal groupwise registration that models a common anatomy and the geometric variations of the images as latent variables and infers them with a hierarchical variational auto-encoder trained by unsupervised self-reconstruction.
- **Key Findings**: The method avoids hand-designed image similarity measures and scales to large image groups of variable size. Experiments on four datasets of cardiac, brain and abdominal images show better accuracy, efficiency, scalability and interpretability than similarity-based approaches. The inferred structural representations capture the latent anatomy of the observations.
- **Relevance**: It addresses P2: the correspondence across a group is obtained by registering every image to a common anatomy learned as a latent variable.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 6 citations.
- **Potential Use**: Method background (learned templates for groupwise registration)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the outputs are registration parameters and a common anatomy.
- **Correspondence handling**: learned template or barycenter; the paper calls the template the common anatomy, a latent variable inferred from the group, which places it under this category.
- **Pipeline relation**: builds on registration; the method is a learned groupwise registration.
- **Application domain**: medical imaging, multi-modal cardiac, brain and abdominal images (the abstract does not name the modalities).
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 4 (Luo 2026 groupwise registration); merge screening reason: Bayesian groupwise registration that disentangles a common anatomy from geometry, for image groups of variable size

#### Ma et al. (2024). A Canonicalization Perspective on Invariant and Equivariant Learning.
- **Citation key**: [ma2024canonicalization]
- **Identifier**: DOI 10.52202/079017-1948. Confirmed by a live lookup at https://doi.org/10.52202/079017-1948.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 37)
- **Method**: A theoretical account of frame averaging through canonicalization, mapping inputs to canonical forms, used to compare the complexity of frames, determine their optimality and design new frames for eigenvectors.
- **Key Findings**: The abstract states an inherent connection between frames and canonical forms. It reports new frames for eigenvectors that are strictly superior to existing ones, some optimal, in theory and in experiments. It states that the canonicalization view uncovers equivalences between earlier methods and unifies invariant and equivariant learning.
- **Relevance**: It gives the theory of reaching invariance by mapping each input to a canonical form, which is the formal counterpart of aligning every subject before prediction (P2).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 39 citations.
- **Potential Use**: Method background (invariance by canonicalization against invariance by architecture).
- **Stance**: Supports, that canonicalization gives a complete view of frame design.
- **Prediction setting**: other (invariant and equivariant learning in general; the abstract does not name a prediction task), input distribution or set of vectors; the inputs named are eigenvectors.
- **Correspondence handling**: registration to a common space; the paper's term is canonicalization, which maps each input to a canonical form, so inputs are aligned to a common representative before the network is applied.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, geometric deep learning.
- **Theme tags**: T3a.
- **Theme**: added: handed on by Theme 3 (Ma 2024 canonicalization); merge screening reason: canonicalization as a design of frames for invariance (NeurIPS 2024)

#### Mahan et al. (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Citation key**: [mahan2024point]
- **Identifier**: arXiv 2401.01460. Confirmed by a live lookup at https://arxiv.org/abs/2401.01460.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: Point clouds are embedded into an L2 space by transport maps from a shared fixed reference distribution, learned with input convex neural networks, and a discriminator network weights the samples to form a permutation-invariant classifier.
- **Key Findings**: The abstract states that, under certain assumptions, L2 distances between transport maps from a shared reference approximate the Wasserstein-2 distance, and that under specific conditions Euclidean distances between ICNN samples mirror Wasserstein-2 distances. It reports advantages over the standard deep set approach on a flow cytometry dataset with a limited number of labeled point clouds.
- **Relevance**: It addresses P1 and P2 directly: point clouds of varying content are classified after a transport embedding relative to one shared reference, compared with a permutation-invariant set baseline.
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 2 citations.
- **Potential Use**: Related work (supervised prediction with transport embeddings), with deep sets as an experimental baseline.
- **Stance**: Supports, linearized transport embeddings over a plain deep set classifier when labeled point clouds are few.
- **Prediction setting**: other (point-cloud-level classification), input point cloud; the abstract does not state whether each point cloud is one subject.
- **Correspondence handling**: transport coupling; the reference is a shared fixed reference distribution used only to embed each point cloud by its transport map.
- **Pipeline relation**: not applicable; the data are flow cytometry point clouds and no imaging pipeline step is named.
- **Application domain**: other domain, flow cytometry.
- **Theme tags**: T2e, T3a.
- **Theme**: added: handed on by Theme 2 (Mahan 2024 deep set LOT point cloud); merge screening reason: point-cloud classification by linearized transport to a shared reference with input convex networks

#### Marchewka et al. (2014). Influence of magnetic field strength and image registration strategy on voxel-based morphometry in a study of Alzheimer's disease.
- **Citation key**: [marchewka2014influence]
- **Identifier**: DOI 10.1002/hbm.22297. Confirmed by a live lookup at https://doi.org/10.1002/hbm.22297.
- **Type**: Journal article (Human Brain Mapping)
- **Method**: Whole-brain voxel-based morphometry in Statistical Parametric Mapping on ADNI data tests main effects of several diffeomorphic spatial registration strategies, of magnetic field strength, and their interaction with disease status.
- **Key Findings**: Beyond confirming medial temporal lobe volume loss in AD, the study detects a significant impact of the spatial registration strategy on the estimate of AD-related atrophy. Field strength had a significant effect in the cerebellum, precentral gyrus and thalamus with no interaction with disease status, and the authors support pooling multi-centre VBM data irrespective of field strength. The abstract does not state the number of subjects.
- **Relevance**: It addresses P3 by measuring how the choice of registration strategy changes a group-level imaging result in AD.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 45 citations.
- **Potential Use**: Discussion and limitations (registration choices change downstream estimates).
- **Stance**: Supports, the view that the registration strategy changes the estimate of AD-related atrophy.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study tests group effects in VBM and fits no predictor.
- **Correspondence handling**: registration to a common space; VBM compares voxels after diffeomorphic spatial registration, and the strategies are the variable under test.
- **Pipeline relation**: builds on registration; measures how a pipeline step fails; the registration strategy is varied and its effect on atrophy estimates is measured.
- **Application domain**: medical imaging, structural T1-weighted MRI of the brain, Alzheimer's disease.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (Marchewka 2014 VBM registration); merge screening reason: measures the effect of registration strategy and field strength on VBM atrophy estimates in AD

#### Maron and Lozano-Perez (1997). A Framework for Multiple-Instance Learning.
- **Citation key**: [maron1997framework]
- **Identifier**: proceedings url https://proceedings.neurips.cc/paper/1997/hash/82965d4ed8150294d4330ace00821d77-Abstract.html. Confirmed by a live lookup at https://proceedings.neurips.cc/paper/1997/hash/82965d4ed8150294d4330ace00821d77-Abstract.html.
- **Type**: Conference paper (Advances in Neural Information Processing Systems (NIPS))
- **Method**: Diverse Density, a general framework for multiple-instance learning in which a bag is positive if at least one instance falls within the concept and negative if all instances are negative.
- **Key Findings**: The abstract describes the framework and applies it to learning a description of a person from series of images, to stock selection and to drug activity prediction. It presents multiple-instance learning as a way to model a teacher who labels bags instead of instances. The abstract does not report figures.
- **Relevance**: The founding formulation of predicting one label from an unordered bag of instances, the setting of lesion-set and patch-set prediction (P1, P2).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 1524 citations.
- **Potential Use**: Related work (multiple-instance learning strand).
- **Stance**: Neutral.
- **Prediction setting**: other (bag-level classification), input distribution or set of vectors; each bag of instances receives one label.
- **Correspondence handling**: permutation invariance; the bag label depends only on which instances fall within the concept, whatever their order.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, person images, stock selection and drug activity prediction.
- **Theme tags**: T3c.
- **Theme**: added: handed on by Theme 3 (Maron Lozano-Perez 1997 MIL); merge screening reason: diverse density framework for multiple-instance learning (seminal)

#### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Citation key**: [mazelet2026learning]
- **Type**: Preprint (arXiv).
- **Method**: FGW graph dictionary learning on individual cortical graphs of about 1000 nodes, with an amortized network that predicts approximate FGW plans, and atoms that depend on the FGW trade-off parameter.
- **Key Findings**: The paper states that FGW is non-convex and cubic in the number of nodes, which limits earlier graph dictionaries to a few tens of nodes; amortization reduces the cost. On HCP data the representations capture different levels of geometric variability and preserve information.
- **Relevance**: A transport dictionary built on individual geometries in place of projection onto a common template.
- **Quality**: Medium (preprint). Read: abstract, introduction and Section 2 (arXiv HTML full text). Cited 0 times in OpenAlex on 2026-11-19.
- **Potential Use**: Registration-free dictionaries for brain data; the cost barrier.
- **Identifier**: arXiv 2605.20883; https://arxiv.org/abs/2605.20883 (arXiv record confirmed). Preprint.
- **Prediction setting**: Representation or comparison only, no prediction in the objective; downstream decoding is named as a use; input cortical graphs.
- **Correspondence handling**: Learned template or barycenter (dictionary atoms) with FGW couplings, learned without labels.
- **Pipeline relation**: Removes registration (to a common template geometry); builds on cortical surface reconstruction.
- **Application domain**: Medical imaging (fMRI, brain cortex).
- **Theme tags**: T2f, T2d, T2g.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### McLeod, Tondel, Calvet, Sermesant and Pennec (2018). Cardiac Motion Evolution Model for Analysis of Functional Changes Using Tensor Decomposition and Cross-Sectional Data.
- **Citation key**: [mcleod2018cardiac]
- **Identifier**: DOI 10.1109/tbme.2018.2816519, confirmed at https://doi.org/10.1109/tbme.2018.2816519 through Crossref, OpenAlex and Semantic Scholar, and PubMed PMID 29993424; the author version was read at https://inria.hal.science/hal-01736454v1/file/TBME2816519.pdf.
- **Type**: Journal article (IEEE Transactions on Biomedical Engineering).
- **Method**: Each subject's left-ventricular motion from cine cardiac MRI is described by polyaffine transformation parameters on the 17 AHA regions; the parameters of a population form a data tensor, and N-way PLS for higher-order arrays models the motion parameters with respect to age, from which a model of motion given age is derived.
- **Key Findings**: The abstract states that the model describes cardiac motion over age and is used to analyse the temporal evolution of functional abnormalities of Tetralogy of Fallot patients against healthy motion dynamics. The text states that image sequences are aligned differently from one acquisition to another, so the parameters are first aligned in space and time (resampled to a common frame, rigidly realigned to the mean peak contraction, and reoriented in prolate spheroidal coordinates so that all subjects are regionally centred at the same point); the data set holds 15 healthy adults and 10 Tetralogy of Fallot patients.
- **Relevance**: A medical-imaging use of multiway PLS across subjects in which the correspondence is created before the tensor model by registration, regional parameterisation and spatio-temporal alignment.
- **Quality**: Abstract (PubMed) and the abstract, introduction, the alignment section and the data description of the HAL author version.
- **Potential Use**: Example of tensor PLS that builds on registration and an atlas of regions to make the spatial mode common across subjects.
- **Stance**: Neutral.
- **Prediction setting**: Subject-level regression (motion parameters as a function of age, each subject one observation), input tensor (regional polyaffine parameters by time per subject).
- **Correspondence handling**: Registration to a common space, through the AHA regions and a spatio-temporal alignment of the transformation parameters.
- **Pipeline relation**: Builds on registration; the tensor is formed from the output of non-rigid motion tracking and a regional parameterisation.
- **Application domain**: Medical imaging, cine cardiac MRI (Tetralogy of Fallot and healthy volunteers).
- **Theme tags**: T1-PLS.
- **Theme**: Theme 1

#### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Citation key**: [memoli2011gromov]
- **Type**: Journal article (Foundations of Computational Mathematics).
- **Method**: Objects are metric measure spaces; a Gromov-Wasserstein distance is defined from mass transport.
- **Key Findings**: The distance is a metric on isomorphism classes of metric measure spaces, with polynomial-time lower bounds that relate it to earlier shape signatures. Section 4 shows that when both objects have the same number of points the discrete problem reduces to a quadratic assignment problem, which is NP-hard.
- **Relevance**: The basis of every GW and FGW method of this theme: it compares objects with no shared coordinate frame, which is the missing correspondence of the research question.
- **Quality**: High. Read: abstract, contents and Section 4 (Remark 4.6) of the PDF. Cited 943 times in OpenAlex on 2026-11-19.
- **Potential Use**: Definition of GW; the hardness result for the failure analysis.
- **Identifier**: DOI 10.1007/s10208-011-9093-5; https://doi.org/10.1007/s10208-011-9093-5 (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input shapes as metric measure spaces (point clouds).
- **Correspondence handling**: Transport coupling between the points of two spaces, invariant to isometries.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (shape matching).
- **Theme tags**: T2b, T2g.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Menze, Jakab, Bauer, et al. (2015). The multimodal brain tumor image segmentation benchmark (BRATS).
- **Citation key**: [menze2015multimodal]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Identifier**: DOI 10.1109/TMI.2014.2377694, PMID 25494501; confirmed at https://doi.org/10.1109/TMI.2014.2377694 and the PubMed record.
- **Method**: Benchmark of 20 tumour segmentation algorithms at MICCAI 2012 and 2013 on 65 multi-contrast MR scans of low- and high-grade glioma annotated by up to four raters, and on 65 simulated scans.
- **Key Findings**: Human raters disagreed considerably on tumour sub-regions (Dice 74 to 85 percent). Different algorithms were best for different sub-regions, reaching inter-rater performance, and a hierarchical majority vote of several algorithms ranked above every single one.
- **Relevance**: It measures the lesion-segmentation step and the inter-rater ceiling that any mask-based downstream feature inherits.
- **Quality**: Abstract read. Named foundational work.
- **Potential Use**: Lesion segmentation benchmark; inter-rater variability figures.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (multi-contrast brain MRI); voxel labels are the output.
- **Correspondence handling**: not applicable; segmentation is per subject.
- **Pipeline relation**: builds on lesion segmentation; measures how a pipeline step fails (inter-rater Dice).
- **Application domain**: medical imaging, brain MRI, glioma.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: Theme 4

#### Mi et al. (2017). An Optimal Transportation Based Univariate Neuroimaging Index.
- **Citation key**: [mi2017optimal]
- **Type**: Conference paper (ICCV).
- **Method**: Each brain image is projected onto a tetrahedral mesh; a variational optimal transport map, computed with Newton's method, takes each mesh to a template built from one brain mesh, and the Wasserstein distance to the template is a one-number index per image used for classification.
- **Key Findings**: On ADNI-1 baseline structural MRI of 75 patients with Alzheimer's disease and 175 cognitively normal subjects the index reaches 82.30 percent accuracy and outperforms hippocampal volume, entorhinal cortex thickness, mean cortical thickness and grey matter volume; on FDG-PET pairwise Wasserstein distances with boosting reach 88.37 percent. The images are first linearly aligned to a common space (FSL FLIRT for MRI, SPM for PET), masked to the cerebral cortex, and surfaces are extracted with FreeSurfer or SPM.
- **Relevance**: A subject-level clinical classification from transport distances of medical images to a template, with the registration and segmentation steps it keeps stated.
- **Quality**: Medium (single index, one cohort per modality). Read: abstract, preprocessing, method and experiment sections (PMC full text, PMC5719504). Cited 6 times in OpenAlex on 2026-11-19.
- **Potential Use**: Transport distance to a template as a subject-level feature; its reliance on linear registration and masks.
- **Identifier**: DOI 10.1109/ICCV.2017.29; PMID 29225556; https://doi.org/10.1109/ICCV.2017.29 (confirmed).
- **Prediction setting**: Subject-level classification, input images on a grid (structural MRI and FDG-PET) as meshes; Alzheimer's disease against normal cognition.
- **Correspondence handling**: Registration to a common space (linear), then a transport coupling of each subject to a single-subject template mesh.
- **Pipeline relation**: Builds on registration (linear alignment with FLIRT or SPM). It also needs brain masking and FreeSurfer surface extraction, which are tissue steps, not lesion segmentation, and it replaces volumetric and thickness summaries with one transport distance.
- **Application domain**: Medical imaging (structural MRI and FDG-PET, brain).
- **Theme tags**: T2f, T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Mialon et al. (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Citation key**: [mialon2021trainable]
- **Type**: Conference paper (ICLR 2021).
- **Method**: Each set of features is embedded in a kernel space and pooled with weights given by the entropic transport plan between the set and a trainable reference; the reference is learned end-to-end or without labels.
- **Key Findings**: The embedding has fixed size for sets of varying size and can be read as attention or as a surrogate of a transport kernel. It reaches state-of-the-art results for protein fold recognition and chromatin profile detection.
- **Relevance**: A trainable transport reference that turns a set of varying size into a fixed-length vector for a supervised predictor, which is the operation a set of lesions or regions needs.
- **Quality**: High. Read: abstract, Sections 3 and 4 headings and method passages (arXiv HTML full text). Cited 56 times in OpenAlex on 2026-11-19.
- **Potential Use**: Learned reference for set-level prediction; link to Theme 3 set encoders.
- **Identifier**: arXiv 2006.12065; https://openreview.net/forum?id=ZK6vTvb84s, named on the confirmed ICLR page https://iclr.cc/virtual/2021/poster/2853; arXiv record confirmed.
- **Prediction setting**: Subject-level classification (one label per sequence), input sets of features.
- **Correspondence handling**: Learned template or barycenter (trainable reference) with a transport coupling per set.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (biological sequences, text).
- **Theme tags**: T2d, T2e.
- **Viewpoint**: Supports. Overlap with Theme 3.
- **Theme**: Theme 2

#### Miller et al. (2025). Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging.
- **Citation key**: [miller2025comparison]
- **Identifier**: DOI 10.1162/imag.a.1048. Confirmed by a live lookup at https://doi.org/10.1162/imag.a.1048.
- **Type**: Journal article (Imaging Neuroscience)
- **Method**: A quantitative and qualitative comparison of three registration algorithms (FNIRT, ANTs, EasyReg) with their default lesion compensation for registering eleven distorted brains with perinatal stroke to a standard template, and of brain grafting, which inserts a healthy tissue mask in place of the lesion before registration.
- **Key Findings**: ANTs and EasyReg are significantly more accurate than FNIRT for chronic perinatal stroke imaging, and all three packages have marked difficulty with large lesions. Brain grafting significantly improved the lesion mask normalization of FNIRT. The authors recommend EasyReg as a starting point and visual inspection of every registered brain.
- **Relevance**: It addresses P3: it measures how registration to a common template fails for brains with large lesions and distorted anatomy.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 1, data 1. OpenAlex counts 0 citations. Small study (11 subjects).
- **Potential Use**: Discussion and limitations (failure of registration in lesioned brains)
- **Stance**: Supports, that registration of distorted, lesioned brains to a template remains unreliable for large lesions.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the outcome is registration accuracy.
- **Correspondence handling**: registration to a common space; every brain is normalized to a standard template.
- **Pipeline relation**: measures how a pipeline step fails, builds on lesion segmentation; registration accuracy is measured, and the lesion compensation and grafting use a defined lesion area.
- **Application domain**: medical imaging, brain imaging in chronic perinatal stroke (the abstract does not name the MRI sequence).
- **Theme tags**: `reg-analysis`, `failure`, `lesion-seg`.
- **Theme**: added: handed on by Theme 4 (Miller 2025 normalization perinatal stroke); merge screening reason: compares three registration tools and lesion compensation in distorted perinatal stroke brains (small study, 11 brains)

#### Miteva and Nisheva-Pavlova (2026). Segmentation Robustness and Predictive Utility in Glioblastoma Radiomics: Evidence for a Trade-off in Survival Modelling.
- **Citation key**: [miteva2026segmentation]
- **Identifier**: arXiv 2607.23626. Confirmed by a live lookup at https://arxiv.org/abs/2607.23626.
- **Type**: Preprint (arXiv). Preprint, not peer-reviewed.
- **Method**: 4,752 radiomic features from multiparametric MRI of three tumor subregions in the UPENN-GBM cohort, robustness by ICC between automatic and expert-refined segmentations, and survival models with and without robustness filtering.
- **Key Findings**: Of the features with a valid ICC, 48.1 percent were robust. Radiomic features gave no consistent gain over the clinical baseline, robustness filtering gave no detectable gain, and the features the models selected were less robust than the pool.
- **Relevance**: It measures the link between segmentation robustness of radiomic features and their value in a subject-level prediction (P3).
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 2. Preprint.
- **Potential Use**: Discussion and limitations (robustness filtering does not ensure predictive value).
- **Stance**: Opposes, robustness to segmentation as a sufficient criterion for selecting radiomic features.
- **Prediction setting**: subject-level regression (survival), input image on a grid with tumor subregion masks; the outcome is overall survival.
- **Correspondence handling**: not applicable; features are computed inside each patient's tumor subregions.
- **Pipeline relation**: builds on lesion segmentation, builds on radiomics, measures how a pipeline step fails; automatic and refined segmentations are compared.
- **Application domain**: medical imaging, multiparametric brain MRI (glioblastoma).
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: merge recent-literature search R3 (2024 to 2026)

#### Moosmuller and Cloninger (2023). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Citation key**: [moosmuller2023linear]
- **Type**: Journal article (Information and Inference).
- **Method**: Linear optimal transport (LOT): each distribution is embedded by its transport map from a fixed reference into an L2 space.
- **Key Findings**: The paper characterizes when LOT makes families of distributions (shifts and scalings of a fixed distribution, with perturbations) linearly separable, in any dimension, and when the L2 distance of the embedding is nearly isometric to W2. N transport maps then give all N^2 distances.
- **Relevance**: States the conditions under which a fixed-reference embedding supports a linear subject-level classifier, and so when it fails.
- **Quality**: High. Read: abstract and the passages on the embedding and the experiments (arXiv HTML full text). Cited 78 times in OpenAlex on 2026-11-19.
- **Potential Use**: Embedding against a fixed template; limits of linear classification.
- **Identifier**: DOI 10.1093/imaiai/iaac023; arXiv 2008.09165; https://doi.org/10.1093/imaiai/iaac023 (confirmed).
- **Prediction setting**: Subject-level classification (one label per distribution), input point clouds and images on a grid.
- **Correspondence handling**: Learned template or barycenter in the sense of a fixed reference, not learned; transport maps give the correspondence to it.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (synthetic data, MNIST).
- **Theme tags**: T2e, T2g.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Morup, Hansen, Arnfred, Lim and Madsen (2008). Shift-invariant multilinear decomposition of neuroimaging data.
- **Citation key**: [morup2008shift]
- **Identifier**: DOI 10.1016/j.neuroimage.2008.05.062, confirmed at https://doi.org/10.1016/j.neuroimage.2008.05.062 through Crossref, OpenAlex and Semantic Scholar, and PubMed PMID 18625324.
- **Type**: Journal article (NeuroImage).
- **Method**: A multilinear decomposition that allows arbitrary shifts along one modality, applied to neural activity arranged as space by time by trial; each component has a fixed time course whose intensity and latency may vary across trials or across space.
- **Key Findings**: The abstract reports the method on simulated data and on EEG and fMRI data, and states that shift-invariant multilinear decompositions cope with variable latencies in neural data, a problem that has caused degenerate solutions when neuroimaging data are modelled with instantaneous multilinear decompositions.
- **Relevance**: The shifted CP of the theme scope in neuroimaging, and a statement of a failure of the CP model (degenerate solutions) when a mode is not aligned.
- **Quality**: Abstract alone (PubMed); the open copy on eprints.drcmr.dk gave no answer to the fetch. Seminal (OpenAlex counts 121 citations), admitted before 2013 on the seminal-work path.
- **Potential Use**: Shift-invariant CP as a model-level handling of misalignment along one mode, and the degeneracy of unshifted CP on such data.
- **Stance**: Supports (that a misaligned mode must be modelled).
- **Prediction setting**: Representation or comparison only, no prediction, input tensor (space by time by trial).
- **Correspondence handling**: Other: a per-trial or per-location shift of the shared time course; the spatial mode is shared.
- **Pipeline relation**: Not applicable; the shifts are latencies within a recording.
- **Application domain**: Medical imaging and electrophysiology, EEG and fMRI.
- **Theme tags**: T1-UNAL, T1-FAIL.
- **Theme**: Theme 1

#### Muandet et al. (2012). Learning from Distributions via Support Measure Machines.
- **Citation key**: [muandet2012learning]
- **Identifier**: arXiv 1202.6504. Confirmed by a live lookup at https://arxiv.org/abs/1202.6504.
- **Type**: Conference paper (Advances in Neural Information Processing Systems (NeurIPS))
- **Method**: A kernel-based discriminative framework that represents probability distributions as mean embeddings in an RKHS and generalizes the support vector machine to a support measure machine (SMM), with a flexible SVM (Flex-SVM) that places a different kernel on each training example.
- **Key Findings**: The analysis gives insights into the relation between SMMs and traditional SVMs. Experiments on synthetic and real-world data demonstrate the effectiveness of the framework. The abstract does not report numbers.
- **Relevance**: It addresses P2: an input that is a set of samples is treated as a distribution and embedded without element correspondence, a basis of distribution regression and classification.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 167 citations.
- **Potential Use**: Method background (learning on distributions with kernel mean embeddings)
- **Stance**: Neutral.
- **Prediction setting**: other (distribution-level classification), input distribution or set of vectors; each training example is a probability distribution.
- **Correspondence handling**: permutation invariance; the mean embedding is a symmetric function of the samples of a distribution.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, general machine learning on synthetic and real-world data.
- **Theme tags**: T3c.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Muandet et al. (2017). Kernel Mean Embedding of Distributions: A Review and Beyond.
- **Citation key**: [muandet2017kernel]
- **Type**: Journal article (survey; Foundations and Trends in Machine Learning 10(1-2)). Foundational work named for the theme.
- **Identifier**: DOI 10.1561/2200000060 (resolved at https://doi.org/10.1561/2200000060); arXiv 1605.09522.
- **Method**: review.
- **Key Findings**: A kernel mean embedding maps a distribution into a reproducing kernel Hilbert space, which extends kernel methods to probability measures. The review covers embeddings of marginal and conditional distributions, theoretical guarantees and applications, including learning on distributional data.
- **Relevance**: it treats a set of samples as an empirical distribution and embeds it without element correspondence, the kernel counterpart of a sum-pooled set encoder.
- **Prediction setting**: representation or comparison only, no prediction, in the review as a whole; it covers learning on distributional inputs.
- **Correspondence handling**: permutation invariance; the empirical mean embedding is a symmetric function of the samples.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (kernel methods, statistics).
- **Theme tags**: T3c.
- **Quality**: abstract read on the arXiv record. Peer-reviewed survey; OpenAlex cited_by_count 1096. Quick assessment 13 of 15.
- **Viewpoint**: neutral (review).
- **Potential Use**: distributional view of set inputs.
- **Theme**: Theme 3

#### Muller-Franzes et al. (2022). Reliability as a Precondition for Trust: Segmentation Reliability Analysis of Radiomic Features Improves Survival Prediction.
- **Citation key**: [mullerfranzes2022reliability]
- **Identifier**: DOI 10.3390/diagnostics12020247. Confirmed by a live lookup at https://doi.org/10.3390/diagnostics12020247.
- **Type**: Journal article (Diagnostics)
- **Method**: An inter-reader reliability analysis of radiomic features over 4598 tumour segmentations in five clinical CT and MRI datasets, with a neural network generating 100 additional outlines per tumour, followed by survival prediction from all features and from the most reliable features.
- **Key Findings**: Survival models based on the most reliable features show less statistical spread and better survival prediction in CT and MRI. Mean concordance indices are 0.58 for the most reliable against 0.56 for all features in CT (p below 0.001) and 0.58 against 0.57 in MRI (p = 0.23). The authors conclude that a preceding reliability analysis improves survival prediction across modalities and tumour entities.
- **Relevance**: It addresses P3: it measures how variability of the segmentation step propagates into radiomic features and into a subject-level survival model.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 1, data 3. OpenAlex counts 6 citations.
- **Potential Use**: Discussion and limitations (segmentation variability in radiomics pipelines)
- **Stance**: Supports, that selecting radiomic features reliable across segmentations improves survival prediction.
- **Prediction setting**: subject-level regression, input image on a grid; patient survival is predicted from radiomic features of the tumour.
- **Correspondence handling**: not applicable; features are computed per tumour region.
- **Pipeline relation**: builds on radiomics, measures how a pipeline step fails; feature reliability under varying segmentation outlines is measured and used to select features.
- **Application domain**: medical imaging, CT and MRI of tumours in five clinical datasets (the abstract does not name the organs).
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Muller-Franzes 2022); merge screening reason: segmentation reliability analysis over 4,598 tumour segmentations and its effect on survival prediction

#### Murphy et al. (2019). Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs.
- **Citation key**: [murphy2019janossy]
- **Type**: Conference paper (ICLR 2019).
- **Identifier**: arXiv 1811.01900; https://arxiv.org/abs/1811.01900 (arXiv record read; its journal reference reads ICLR 2019; the OpenReview page could not be read).
- **Method**: representation of a permutation-invariant function as the average of a permutation-sensitive function over all orderings, with tractable approximations.
- **Key Findings**: Janossy pooling averages a permutation-sensitive function over reorderings of the input. Three approximations make it tractable: canonical orderings, functions with k-order interactions, and stochastic optimization over random permutations. The framework unifies existing set models.
- **Relevance**: it gives a second route to invariance that builds on order-sensitive models, and includes canonical ordering, the analogue of fixing a correspondence, as one approximation.
- **Prediction setting**: other, set-level regression and classification with sequences or multisets as input.
- **Correspondence handling**: permutation invariance, obtained by averaging over orderings or by a canonical ordering.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (synthetic sequence tasks, graphs).
- **Theme tags**: T3a.
- **Quality**: abstract read on the arXiv record. Peer-reviewed at ICLR 2019 per the arXiv journal reference and Semantic Scholar; OpenAlex cited_by_count of the arXiv record 195. Quick assessment 12 of 15.
- **Viewpoint**: neutral; a unifying framework.
- **Potential Use**: taxonomy of set encoders; the Janossy view of set-learning methods.
- **Theme**: Theme 3

#### Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding.
- **Citation key**: [naderializadeh2021pooling]
- **Identifier**: https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html. Confirmed by a live lookup at https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html.
- **Type**: Conference paper (Advances in Neural Information Processing Systems (NeurIPS))
- **Method**: Set elements are treated as samples of a probability distribution and pooled into a fixed-dimensional vector by an end-to-end trainable Euclidean embedding for the sliced-Wasserstein distance.
- **Key Findings**: The abstract reports that the pooling outperforms existing set representation learning approaches on point-cloud, graph and image classification tasks. It gives no numbers, and it states that the code is public.
- **Relevance**: It addresses P2 with a transport-based pooling that gives a fixed-length vector from a set of any size without element correspondence.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 31 citations.
- **Potential Use**: Related work (set encoders built on transport).
- **Stance**: Supports, sliced-Wasserstein pooling over existing set pooling methods.
- **Prediction setting**: other (set-level classification of point clouds, graphs and images), input distribution or set of vectors; each label belongs to a set, and the abstract names no subjects.
- **Correspondence handling**: transport coupling; the pooling is an embedding for the sliced-Wasserstein distance, and the abstract does not state whether a reference measure is fixed or learned.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, point clouds, graphs and images.
- **Theme tags**: T2e, T3a.
- **Theme**: added: handed on by Theme 2 (Naderializadeh 2021); merge screening reason: sliced-Wasserstein embedding as a trainable set pooling (NeurIPS 2021, confirmed on the proceedings page)

#### NaderiAlizadeh and Singh (2024). Aggregating residue-level protein language model embeddings with optimal transport.
- **Citation key**: [naderializadeh2024aggregating]
- **Identifier**: DOI 10.1093/bioadv/vbaf060. Confirmed by a live lookup at https://doi.org/10.1093/bioadv/vbaf060.
- **Type**: Journal article (Bioinformatics Advances)
- **Method**: Per-residue protein language model outputs are treated as samples from a distribution and mapped against a reference set with sliced-Wasserstein distances, giving a fixed-length Euclidean embedding of the whole protein.
- **Key Findings**: The embedding outperforms average pooling on several downstream prediction tasks, particularly with smaller protein language models. Smaller models with this aggregation match or exceed average-pooled larger models. The aggregation is especially effective for longer sequences.
- **Relevance**: It addresses P2: a variable-size set of embeddings is turned into a fixed-length vector by transport to a reference set, the same construction that applies to sets of lesions or points per subject.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 36 citations.
- **Potential Use**: Method background (transport-based set embeddings)
- **Stance**: Supports, that sliced-Wasserstein aggregation preserves information that average pooling loses.
- **Prediction setting**: other (protein-level prediction), input distribution or set of vectors; each protein is a set of residue embeddings.
- **Correspondence handling**: transport coupling; the paper maps the residue samples against a reference set with sliced-Wasserstein distances, and the abstract does not state whether the reference set is learned.
- **Pipeline relation**: not applicable; the domain is protein sequences.
- **Application domain**: other domain, protein sequence representation.
- **Theme tags**: T2e, T3a.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### NaderiAlizadeh et al. (2025). Constrained Sliced Wasserstein Embedding.
- **Citation key**: [naderializadeh2025constrained]
- **Identifier**: arXiv 2506.02203. Confirmed by a live lookup at https://arxiv.org/abs/2506.02203.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: A constrained learning approach that optimizes slicing directions for sliced Wasserstein distances by constraining the one-dimensional transport plans to approximate the optimal plan in the original space, trained by a primal-dual method with continuous relaxations of the plans.
- **Key Findings**: The constrained slicing is applied to pool high-dimensional embeddings into fixed-length permutation-invariant representations. Numerical results on foundation models for images, point clouds and protein sequences are reported to show more informative slicing directions. The abstract does not state any numbers.
- **Relevance**: It addresses P2 with a transport-based pooling of sets into a fixed-length vector.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 4 citations.
- **Potential Use**: Method background (sliced Wasserstein embeddings for set pooling).
- **Stance**: Supports, learned and constrained slicing directions for sliced Wasserstein pooling.
- **Prediction setting**: other (pooled embeddings for downstream tasks on images, point clouds and protein sequences), input distribution or set of vectors; the abstract does not name the prediction tasks.
- **Correspondence handling**: transport coupling; each set is embedded through one-dimensional transport plans along learned slicing directions, giving a permutation-invariant vector, and the abstract does not name a reference set.
- **Pipeline relation**: not applicable; the paper is a general machine learning method.
- **Application domain**: other domain, images, point clouds and protein sequences.
- **Theme tags**: T2e, T3a.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Nguyen and Tsuda (2023). On a linear fused Gromov-Wasserstein distance for graph structured data.
- **Citation key**: [nguyen2023linear]
- **Identifier**: DOI 10.1016/j.patcog.2023.109351; arXiv 2203.04711. Confirmed by a live lookup at https://doi.org/10.1016/j.patcog.2023.109351.
- **Type**: Journal article (Pattern Recognition)
- **Method**: Graphs are embedded into a vector space through an optimal transport problem that uses node features and topology, and linearFGW is defined as the Euclidean distance between the embeddings, used in a kernel framework.
- **Key Findings**: The abstract states that linearFGW accounts for node features and structure and computes a kernel matrix much faster than pairwise fused Gromov-Wasserstein distances, which allows large data sets. It reports experiments on classification and clustering that show the effectiveness of the distance, without numbers.
- **Relevance**: It addresses P2 with a transport embedding that turns graphs without node correspondence into vectors for a kernel predictor.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 25 citations.
- **Potential Use**: Related work (GW and FGW embeddings for prediction).
- **Stance**: Supports, linearized FGW embeddings as a fast substitute for pairwise FGW kernels.
- **Prediction setting**: other (graph-level classification and clustering), input graph; the labels belong to graphs, and the abstract names no subjects.
- **Correspondence handling**: transport coupling; each graph is embedded through an OT problem and compared by the Euclidean distance between embeddings, and the abstract does not name the reference the embedding is computed against.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, graph-structured data; the abstract does not name the datasets.
- **Theme tags**: T2b, T2e.
- **Theme**: added: handed on by Theme 2 (Nguyen Tsuda linear FGW); merge screening reason: linear fused GW embedding of graphs relative to a reference for kernel classification

#### Nikolentzos and Skianis (2025). On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets.
- **Citation key**: [nikolentzos2025lipschitz]
- **Identifier**: arXiv 2505.24403. Confirmed by a live lookup at https://arxiv.org/abs/2505.24403.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: Theoretical analysis of whether sum, mean, max and attention-based aggregation are Lipschitz continuous with respect to three distance functions on multisets, with Lipschitz bounds for set networks and experiments on datasets from several domains.
- **Key Findings**: Each of sum, mean and max is Lipschitz continuous with respect to only one of the three distances, and the attention-based function is Lipschitz continuous with respect to none of them. The paper derives upper bounds on the Lipschitz constant of networks for multisets and studies their stability to perturbations and their generalization under distribution shift.
- **Relevance**: It bears on P2 by stating how stable permutation-invariant pooling is to perturbations of the set, which matters when a subject is a set of lesions or regions.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 3, relevance 2, citations 1, data 2. OpenAlex counts 1 citations.
- **Potential Use**: Method background (stability of set encoders).
- **Stance**: Opposes, the assumption that attention-based set aggregation is Lipschitz continuous with respect to standard multiset distances.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the paper analyses aggregation functions and names no prediction target in the abstract.
- **Correspondence handling**: permutation invariance; the analysed aggregation functions are invariant to the order of set elements.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, theory of neural networks for sets; the abstract does not name the domains of the experiments.
- **Theme tags**: T3a, T3e.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Oner et al. (2023). Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset.
- **Citation key**: [oner2023distribution]
- **Identifier**: DOI 10.1016/j.media.2023.102813. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2023.102813.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: Multiple instance learning on gigapixel histopathology slides as bags of patches, with distribution-based pooling filters that build the bag representation from estimated marginal distributions of instance features.
- **Key Findings**: The paper proves that distribution-based pooling filters capture more information than point-estimate pooling such as max and mean. On MIL tasks defined on the CAMELYON16 lymph node metastases dataset, models with distribution pooling perform equal to or better than point-estimate pooling. The best model reaches an area under the ROC curve of 0.9325 (95% CI 0.8798 to 0.9743) for tumor versus normal slide classification.
- **Relevance**: It addresses P1 and P2: a slide-level label predicted from an unordered bag of patches by a permutation-invariant pooling with a stated expressiveness result.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 3, relevance 2, citations 1, data 2. OpenAlex counts 10 citations.
- **Potential Use**: Related work (multiple-instance learning pooling) and Experimental baselines (distribution pooling).
- **Stance**: Supports, distribution-based pooling over point-estimate pooling in MIL.
- **Prediction setting**: other (slide-level classification of whole-slide images), input distribution or set of vectors; each slide is a bag of patch features with one weak label.
- **Correspondence handling**: permutation invariance; the pooling filters estimate marginal distributions of instance features, which do not depend on patch order or position.
- **Pipeline relation**: removes lesion segmentation; the abstract states that MIL works with the slide's weak label in place of region annotations.
- **Application domain**: medical imaging, histopathology whole-slide images of lymph nodes (CAMELYON16).
- **Theme tags**: T3c.
- **Theme**: added: handed on by Theme 3 (Oner 2023 distribution MIL pooling); merge screening reason: distribution-based MIL pooling filters on CAMELYON16

#### Ou et al. (2014). Comparative Evaluation of Registration Algorithms in Different Brain Databases With Varying Difficulty: Results and Insights.
- **Citation key**: [ou2014comparative]
- **Identifier**: DOI 10.1109/tmi.2014.2330355. Confirmed by a live lookup at https://doi.org/10.1109/tmi.2014.2330355.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: Evaluates 12 general-purpose inter-subject brain MRI registration algorithms with developer-suggested parameters on 7 databases or tasks that present four challenges, including missing correspondences in pathology-bearing images, in 7,562 registrations scored by expert landmarks or regions of interest.
- **Key Findings**: The abstract states that the choice of registration algorithm has seemed task- and parameter-dependent, and asks whether some algorithms apply generally, perform consistently and need no tuning. It reports evaluation results discussed by similarity metric, transformation model and optimization strategy. The abstract does not name the best algorithms or give accuracy figures.
- **Relevance**: It measures how the registration step behaves across data challenges, including the case where correspondence is missing because of pathology (P3).
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 190 citations.
- **Potential Use**: Introduction; Discussion and limitations (registration accuracy and failure with missing correspondence).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; registration accuracy is measured and no outcome is predicted.
- **Correspondence handling**: registration to a common space; every algorithm evaluated maps one subject's brain MRI onto another's.
- **Pipeline relation**: builds on registration / measures how a pipeline step fails; the study evaluates registration itself, including images with missing correspondences.
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: handed on by Theme 4 (Ou 2014 registration comparison); merge screening reason: 12 registration algorithms across 7 databases including missing correspondences in pathology-bearing images

#### Pandilova et al. (2026). Multi-Reference Evaluation of Deep Learning Tumour Segmentation in Multi-Sequence Nasopharyngeal Carcinoma MRI.
- **Citation key**: [pandilova2026multi]
- **Identifier**: DOI 10.3390/diagnostics16213632. Confirmed by a live lookup at https://doi.org/10.3390/diagnostics16213632.
- **Type**: Journal article (Diagnostics)
- **Method**: On a public dataset of 277 patient records with separately delineated T1-weighted, T2-weighted and contrast-enhanced T1-weighted MRI (30 annotated by two radiologists), tumour volumes are compared without registration, spatial agreement is measured after rigid registration with grid-transfer loss estimated separately, and nnU-Net models are scored against every reference on 102 held-out records.
- **Key Findings**: Without registration the sequence effect on tumour volume was 10.9 percent against a reader effect of 5.7 percent (ratio 1.9, 95% CI 1.40 to 2.49), and after rigid registration per-sequence references agreed at a median Dice of 0.783 against 0.898 between radiologists. One fixed set of predictions scored 0.726, 0.685 and 0.673 depending only on the reference, and switching the reference sequence moved scores 2.7 to 3.6 times as much as switching the radiologist. The authors conclude that single-reference Dice on multi-sequence data depends on a rarely stated choice.
- **Relevance**: It addresses P3 by measuring how the choice of reference changes the reported quality of a lesion segmentation step.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 2, rigor 3, relevance 3, citations 1, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (evaluation of lesion segmentation).
- **Stance**: Opposes, reporting segmentation performance as one Dice against a single reference mask.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study evaluates segmentation agreement.
- **Correspondence handling**: registration to a common space; sequences of the same patient are rigidly registered before spatial agreement is measured.
- **Pipeline relation**: builds on registration, builds on lesion segmentation, measures how a pipeline step fails; it measures how reference choice and mask transfer between grids change segmentation scores.
- **Application domain**: medical imaging, multi-sequence MRI of nasopharyngeal carcinoma.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: added: merge intersection or gap search; screening note: multi-reference evaluation of NPC segmentation; P3 measures how segmentation fails

#### Paquier et al. (2022). Radiomics software comparison using digital phantom and patient data: IBSI-compliance does not guarantee concordance of feature values.
- **Citation key**: [paquier2022radiomics]
- **Identifier**: DOI 10.1088/2057-1976/ac8e6f. Confirmed by a live lookup at https://doi.org/10.1088/2057-1976/ac8e6f.
- **Type**: Journal article (Biomedical Physics and Engineering Express)
- **Method**: Compares three IBSI-compliant radiomics platforms (RadiomiX Research Toolbox, LIFEx v7.0.0, syngo.via Frontier Radiomics v1.2.5) on the IBSI digital phantom and on 27 contrast-enhanced CT scans of colorectal liver metastases and 39 breast cancer MRI scans, with ICC agreement at a 0.9 threshold.
- **Key Findings**: The three applications share 41 features out of 172, 84 and 110, with different naming. Excellent reproducibility was achieved only for shape features, while intensity agreement ranged from 46 percent (DCE maps) to 100 percent (CECT) and texture agreement from 44 to 73 percent. Wavelet features varied most, with excellent agreement for only 3 to 11 percent of features.
- **Relevance**: It measures how the radiomic feature step fails between software tools that all follow the standard (P3).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 1. OpenAlex counts 24 citations. Small study (27 CT and 39 MRI cases).
- **Potential Use**: Discussion and limitations (reproducibility of radiomic features).
- **Stance**: Opposes, the assumption that IBSI compliance makes radiomic feature values concordant across software.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; feature agreement is measured and no outcome is predicted.
- **Correspondence handling**: not applicable; features are computed per region of interest and compared across software for the same case.
- **Pipeline relation**: builds on radiomics / measures how a pipeline step fails; the study measures disagreement of radiomic feature values between platforms.
- **Application domain**: medical imaging, contrast-enhanced CT of colorectal liver metastases and breast MRI (IVIM and DCE).
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: handed on by Theme 4 (Paquier 2022); merge screening reason: shows that IBSI-compliant radiomics software still disagrees on feature values (27 CT and 39 MRI cases)

#### Park and Keles (2025). Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising.
- **Citation key**: [park2025sparse]
- **Identifier**: DOI 10.1093/biomet/asaf082, confirmed at https://doi.org/10.1093/biomet/asaf082 through Crossref and OpenAlex; arXiv 2310.09428 is the preprint.
- **Type**: Journal article (Biometrika).
- **Method**: Theory and an estimator for the tensor-response PLS model: a proof about the HOPLS estimator in high dimensions, and a sparse higher-order PLS (SHOPS) estimator with asymptotic guarantees.
- **Key Findings**: The abstract and Theorem 1 of the preprint state that the consistency of the HOPLS estimator cannot be guaranteed when the number of predictors and the response tensor dimensions grow faster than the sample size. SHOPS selects variables, reduces dimension and denoises the response, and is applied to single-cell Hi-C data.
- **Relevance**: A failure analysis of tensor PLS: it measures when the HOPLS estimator fails, in the small-sample regime that subject-level imaging studies are in.
- **Quality**: Abstract of the Biometrika version, and the abstract, contributions and Theorem 1 of the arXiv HTML full text.
- **Potential Use**: Limits of tensor PLS when subjects are few relative to the tensor dimensions.
- **Stance**: Opposes the unqualified use of HOPLS in high dimensions.
- **Prediction setting**: Other (tensor-response regression on a matrix of predictors), input matrix of predictors with a tensor response; no subject-level outcome is predicted from an unaligned input.
- **Correspondence handling**: Assumes alignment; the response tensor has fixed dimensions for every sample.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, single-cell genomics (DNA methylation and 3D genomic contacts).
- **Theme tags**: T1-PLS, T1-FAIL.
- **Theme**: Theme 1

#### Parmar et al. (2014). Robust Radiomics Feature Quantification Using Semiautomatic Volumetric Segmentation.
- **Citation key**: [parmar2014robust]
- **Identifier**: DOI 10.1371/journal.pone.0102107. Confirmed by a live lookup at https://doi.org/10.1371/journal.pone.0102107.
- **Type**: Journal article (PLoS ONE)
- **Method**: Fifty-six 3D radiomic features are extracted from lung tumour volumes on CT segmented twice by three observers with a semiautomatic region-growing algorithm in 3D-Slicer and compared with manual delineations by five physicians by ICC and feature range.
- **Key Findings**: In twenty lung cancer patients, features from 3D-Slicer segmentations were more reproducible (ICC 0.85 plus or minus 0.15, p = 0.0009) than features from manual segmentations (ICC 0.77 plus or minus 0.17). Their range across observers was significantly smaller (p = 3.819e-07), and the authors recommend 3D-Slicer segmentation for feature quantification.
- **Relevance**: It addresses P3 by measuring how the segmentation step changes the reproducibility of radiomic features.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 3, data 1. OpenAlex counts 663 citations. Small study (20 patients).
- **Potential Use**: Discussion and limitations (segmentation variability in radiomics).
- **Stance**: Supports, semiautomatic segmentation as more reproducible than manual delineation for radiomic features.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study measures feature reproducibility and fits no outcome model.
- **Correspondence handling**: not applicable; features are computed per tumour volume and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; inter-observer variation of tumour segmentation is propagated into feature reproducibility.
- **Application domain**: medical imaging, CT, lung cancer.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Parmar 2014); merge screening reason: semiautomatic against manual segmentation for radiomic feature reproducibility (small study, 20 patients)

#### Pasini et al. (2023). A Critical Analysis of the Robustness of Radiomics to Variations in Segmentation Methods in 18F-PSMA-1007 PET Images of Patients Affected by Prostate Cancer.
- **Citation key**: [pasini2023critical]
- **Identifier**: DOI 10.3390/diagnostics13243640. Confirmed by a live lookup at https://doi.org/10.3390/diagnostics13243640.
- **Type**: Journal article (Diagnostics)
- **Method**: Segmentation of 18F-PSMA-1007 PET images of 78 patients (43 low risk, 35 high risk) is repeated with three methods, 1781 radiomic features are extracted per segmentation, agreement is measured by ICC, and selected features feed several classifiers validated by 30 times repeated five-fold cross validation.
- **Key Findings**: Segmentation methods influence the radiomic features: shape features are the least reproducible (average ICC 0.27) and GLCM features the most. 51.18% of LoG features show excellent reproducibility and 47.85% of wavelet features poor reproducibility, with the LLL band highest (average ICC 0.80). Region growing gives the highest accuracy (74.49%), sensitivity (84.38%) and AUC (79.20%) compared with manual segmentation; the abstract text is truncated where the three segmentation methods are described.
- **Relevance**: It addresses P3: it measures how the choice of lesion segmentation changes radiomic features and the subject-level risk classification built on them.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 3, data 1. OpenAlex counts 20 citations. Small study (78 patients).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics)
- **Stance**: Supports, that segmentation methods change radiomic features and the performance of models built on them.
- **Prediction setting**: subject-level classification, input image on a grid; patients are classified as low or high risk from radiomic features.
- **Correspondence handling**: not applicable; features are computed per segmented region.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; the same radiomics pipeline is run on three segmentations and the differences are measured.
- **Application domain**: medical imaging, PSMA PET, prostate cancer.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Pasini 2023); merge screening reason: robustness of PSMA PET radiomics to three segmentation methods and its effect on classifiers (78 patients)

#### Patalano, Konyar and Paynabar (2026). PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data.
- **Citation key**: [patalano2026par2cox]
- **Identifier**: arXiv 2609.23705, confirmed at https://arxiv.org/abs/2609.23705 (citation tags read). Preprint; no published version was found by the bibtex lookup in Semantic Scholar and OpenAlex.
- **Type**: Preprint (arXiv), flagged as a preprint.
- **Method**: A joint objective of PARAFAC2 and the Cox proportional hazards model, in which patient-specific latent factor weights are the covariates of the Cox partial likelihood, fitted by alternating optimization with ADMM.
- **Key Findings**: The abstract reports improved risk stratification over existing approaches in numerical experiments and a MIMIC-IV case study, and states that the framework handles both patients with observed outcomes and current patients without outcomes. The text tunes parameters by the concordance index on held-out data.
- **Relevance**: The most recent supervised PARAFAC2 found, predicting a subject-level time-to-event outcome from records whose time mode varies per patient.
- **Quality**: Abstract, and the introduction and contribution statements of the arXiv HTML full text.
- **Potential Use**: Supervised PARAFAC2 with a survival outcome.
- **Stance**: Supports.
- **Prediction setting**: Subject-level regression (survival risk), input set of per-patient matrices (visits by clinical features).
- **Correspondence handling**: Other: the visit mode differs per patient under the PARAFAC2 constraint; the feature mode is shared.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, electronic health records (MIMIC-IV).
- **Theme tags**: T1-FAIL, T1-UNAL.
- **Theme**: Theme 1

#### Pathan et al. (2026). FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis.
- **Citation key**: [pathan2026flowlot]
- **Identifier**: arXiv 2609.17906. Confirmed by a live lookup at https://arxiv.org/abs/2609.17906.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: FlowLOT models each patient sample's single-cell flow cytometry data as an empirical distribution and maps it by linearized optimal transport into a fixed-length feature vector used for classification, visualization and quantitative inference.
- **Key Findings**: With as few as 16 patients per class on FlowCAP-II and 8 per class on BLAST110, FlowLOT separated healthy from acute myeloid leukemia samples with 94.3 and 98.0 percent balanced accuracy. Its residual disease estimate reached a Pearson correlation of 0.82 on held-out samples and 0.79 under cross-dataset transfer. At the 0.1 percent threshold for leukemia-associated immunophenotype residual disease it detected positivity with 72 percent sensitivity at 100 percent specificity.
- **Relevance**: It addresses P1 and P2: subject-level classification and regression from an unordered set of cells by a transport embedding.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 0 citations. Small study (training sets of 16 and 8 patients per class; the abstract does not state the total number of patients).
- **Potential Use**: Related work (transport embeddings of patient-level point clouds) and Experimental baselines.
- **Stance**: Supports, a linearized transport embedding in place of manual gating and black-box deep learning.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; each patient sample is classified as healthy or leukemic, and residual disease is also regressed.
- **Correspondence handling**: transport coupling; each sample is embedded by linearized optimal transport, which maps it relative to a reference distribution that the abstract does not name.
- **Pipeline relation**: not applicable; the data are flow cytometry measurements, and the step replaced is manual gating.
- **Application domain**: other domain, flow cytometry of acute myeloid leukemia.
- **Theme tags**: T2e.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Pavic, Bogowicz, Wurms, et al. (2018). Influence of inter-observer delineation variability on radiomics stability in different tumor sites.
- **Citation key**: [pavic2018influence]
- **Type**: Journal article (Acta Oncologica)
- **Identifier**: DOI 10.1080/0284186X.2018.1445283, PMID 29513054; confirmed at https://doi.org/10.1080/0284186X.2018.1445283 (resolves to the Medical Journals Sweden page) and the PubMed record.
- **Method**: Eleven tumours per site (head-and-neck squamous cell carcinoma, malignant pleural mesothelioma, NSCLC) contoured on CT by three radiation oncologists; Dice for delineation variability; ICC of 1,404 radiomic features.
- **Key Findings**: Median Dice was 0.86 for NSCLC, 0.72 for head and neck and 0.26 for mesothelioma. The share of stable features correlated with Dice: 90, 59 and 36 percent, with shape features the least stable.
- **Relevance**: It links the failure of the segmentation step (inter-observer Dice) quantitatively to the failure of the radiomics step (feature ICC).
- **Quality**: Abstract read. Small sample per site (11 tumours). Cited by 5 of the 12 core papers whose reference lists were read in backward chaining.
- **Potential Use**: Evidence that radiomics inherits segmentation variability, by tumour site.
- **Viewpoint**: supports the view that segmentation variability limits radiomics.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (CT) within delineated tumours.
- **Correspondence handling**: not applicable.
- **Pipeline relation**: measures how a pipeline step fails (segmentation variability propagated to radiomic features); builds on radiomics; builds on lesion segmentation.
- **Application domain**: medical imaging, CT, head and neck, pleura and lung.
- **Theme tags**: `failure`, `radiomics`.
- **Theme**: Theme 4

#### Peng et al. (2025). CT-Based Habitat Radiomics Combining Multi-Instance Learning for Early Prediction of Post-Neoadjuvant Lymph Node Metastasis in Esophageal Squamous Cell Carcinoma.
- **Citation key**: [peng2025ct]
- **Identifier**: DOI 10.3390/bioengineering12080813. Confirmed by a live lookup at https://doi.org/10.3390/bioengineering12080813.
- **Type**: Journal article (Bioengineering)
- **Method**: Three signatures from CT (radiomic features of three tumor subregions found by K-means clustering, a multiple-instance signature over 2.5D deep features, and a clinicoradiological model) combined in a nomogram.
- **Key Findings**: In 469 patients from one cancer center (328 training, 141 test), the combined nomogram predicted pathologically confirmed lymph node metastasis after neoadjuvant therapy with an AUC of 0.852 in the test cohort. The combined model outperformed each single signature.
- **Relevance**: A subject-level predictor that treats a tumor as a set of subregions or 2.5D instances (P1), pools them by multiple-instance learning (P2) and keeps tumor segmentation and radiomics upstream (P3).
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 1. OpenAlex counts 6 citations. Single-center cohort.
- **Potential Use**: Related work (multiple-instance learning on sets of tumor regions in radiology).
- **Stance**: Supports, the gain of pooling instance-level features over a single radiomic signature.
- **Prediction setting**: subject-level classification, input set of lesions or regions (tumor habitat subregions and 2.5D instances); the outcome is the lymph node status of each patient.
- **Correspondence handling**: permutation invariance; the subregions found by clustering and the 2.5D instances are pooled without matching them across patients.
- **Pipeline relation**: builds on lesion segmentation, builds on radiomics; the habitats are subregions of a delineated tumor and the habitat signature is a radiomic signature.
- **Application domain**: medical imaging, CT of the esophagus (esophageal squamous cell carcinoma).
- **Theme tags**: T3c, T3d, `radiomics`.
- **Theme**: added: merge recent-literature search R4r (2024 to 2026)

#### Peng et al. (2026). Wasserstein Graph Topological Learning for Brain Network Classification.
- **Citation key**: [peng2026wasserstein]
- **Identifier**: DOI 10.1109/tcds.2026.3722535. Confirmed by a live lookup at https://doi.org/10.1109/tcds.2026.3722535.
- **Type**: Journal article (IEEE Transactions on Cognitive and Developmental Systems)
- **Method**: A Wasserstein prototypical contrastive learning model for brain network classification, with a brain functional convolutional layer for intra-cluster and inter-cluster feature interactions, topological difference weighting, and optimal transport to represent differences between brain networks.
- **Key Findings**: The method is reported to outperform existing approaches across different datasets and to improve disease detection accuracy and biological interpretability. The abstract does not state the datasets, the sample sizes or any numbers.
- **Relevance**: It addresses P1 and P2: subject-level diagnosis from fMRI brain networks with transport distances between networks.
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 3, rigor 1, relevance 2, citations 1, data 1. OpenAlex counts 0 citations.
- **Potential Use**: Related work (transport-based classification of brain networks).
- **Stance**: Supports, Wasserstein distances and learned prototypes for brain network classification.
- **Prediction setting**: subject-level classification, input graph; brain networks built from fMRI are classified for Alzheimer's disease and epilepsy.
- **Correspondence handling**: learned template or barycenter; the paper uses the name prototypes, which are learned in training and compared to each network by Wasserstein distance, and the abstract does not state how network nodes are defined across subjects.
- **Pipeline relation**: not applicable; the abstract does not state whether the networks rest on atlas-based regions or a registration step.
- **Application domain**: medical imaging, functional MRI of the brain (Alzheimer's disease and epilepsy).
- **Theme tags**: T2e, T2d.
- **Theme**: added: handed on by Theme 2 (Peng 2026 Wasserstein graph brain network); merge screening reason: transport-based brain network classification for AD and epilepsy

#### PereznGonzalez et al. (2019). Automatic Classification of Alzheimer's Disease based on CPD Brain Point Cloud Registration for Feature Extraction.
- **Citation key**: [perezngonzalez2019automatic]
- **Identifier**: DOI 10.1109/embc.2019.8856372. Confirmed by a live lookup at https://doi.org/10.1109/embc.2019.8856372.
- **Type**: Conference paper (2019 41st Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC))
- **Method**: Each subject's brain surface point cloud from MRI is rigidly registered to a cerebral baseline cloud, and the rotation and displacement parameters of the transformation, with distance metrics between the aligned clouds and the baseline, feed a random forest classifier of control, MCI and Alzheimer's disease.
- **Key Findings**: Training uses 60 MRI studies (20 per class) and testing 30 unseen studies (10 per class). The method reaches up to 87.2% accuracy in the final validation stage. The authors suggest that the features might serve as brain deformation quantifiers.
- **Relevance**: It addresses P1, P2 and P3: a subject-level diagnosis is predicted from point clouds, and the registration step itself is turned into the features.
- **Quality**: Abstract read. Quick assessment 8 of 15 (Acceptable): journal ranking 2, rigor 1, relevance 3, citations 1, data 1. OpenAlex counts 8 citations. Small study (90 subjects).
- **Potential Use**: Related work (registration-derived features of medical point clouds)
- **Stance**: Supports, that point cloud registration parameters to a baseline discriminate Alzheimer's disease, MCI and controls.
- **Prediction setting**: subject-level classification, input point cloud; each subject's brain surface cloud is classified into one of three groups.
- **Correspondence handling**: registration to a common space; each cloud is rigidly registered to one baseline cloud, and the transformation parameters become features.
- **Pipeline relation**: builds on registration; the features are the parameters and residual distances of the registration.
- **Application domain**: medical imaging, brain MRI.
- **Theme tags**: `reg-analysis`, T3d.
- **Theme**: added: merge intersection or gap search; screening note: CPD point-cloud registration features for AD; P2

#### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Citation key**: [peyre2016gromov]
- **Type**: Conference paper (ICML, PMLR 48).
- **Method**: Entropic GW (softassign) between distance or kernel matrices of different sizes with no row correspondence, and a Frechet mean (GW barycenter) of such matrices.
- **Key Findings**: A fast iterative algorithm reaches a stationary point of the non-convex objective. The paper applies the barycenter to shapes and uses the GW discrepancy for a 3-nearest-neighbour regression of molecular energy levels from Coulomb matrices; in its Table 1 that regression has a mean absolute error of 10.83, against 3.07 for a Laplacian kernel ridge regression.
- **Relevance**: Defines the GW barycenter that later template and dictionary methods build on, and contains an early subject-level regression with GW whose accuracy trails a kernel baseline.
- **Quality**: High. Read: abstract, introduction and the experiment table (PMLR PDF). Cited 593 times in OpenAlex on 2026-11-19.
- **Potential Use**: GW barycenters; an early prediction result.
- **Identifier**: https://proceedings.mlr.press/v48/peyre16.html (confirmed); no DOI or arXiv ID in the record.
- **Prediction setting**: Subject-level regression in one experiment (one value per molecule), input distance matrices (graphs); otherwise comparison only.
- **Correspondence handling**: Learned template or barycenter, with transport couplings to each input.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (shapes, quantum chemistry).
- **Theme tags**: T2b, T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Peyre and Cuturi (2019). Computational Optimal Transport with Applications to Data Sciences.
- **Citation key**: [peyre2019computational]
- **Type**: Book-length review (journal issue).
- **Method**: Review of optimal transport with a bias toward numerical methods.
- **Key Findings**: The review covers transport solvers that scale to data-science sizes and their uses in imaging, vision, graphics and machine learning. Section 10.6 states that optimal transport "cannot be used if the bins of those histograms are not defined on the same underlying space, or if one cannot preregister these spaces"; GW instead compares distance matrices, and the GW problem "is a nonconvex problem, which can be recast as a quadratic assignment problem" and is NP-hard in general. Section 2.3 adds that OT "should be used with caution to perform image registration, because it does not operate as an image warping method".
- **Relevance**: The reference for definitions of entropic OT, GW and barycenters used across the theme.
- **Quality**: High (venue, authors of the field). Read: abstract and Sections 10.6 (Gromov-Wasserstein distances) and 2.3 (applications to imaging) of the arXiv full text (arXiv 1803.00567). Cited 4651 times in OpenAlex on 2026-11-19.
- **Potential Use**: Background and notation.
- **Identifier**: DOI 10.1561/2200000073; arXiv 1803.00567; https://doi.org/10.1561/2200000073 (confirmed).
- **Prediction setting**: Not applicable; a review.
- **Correspondence handling**: Transport coupling; the review states that plain OT needs a shared or preregistered space and that GW removes that need by comparing within-object distances.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (data science in general, imaging among its applications).
- **Theme tags**: T2a, T2b, T2c.
- **Viewpoint**: Neutral.
- **Theme**: Theme 2

#### Poirot, Caan, Ruhe, Bjornerud, Groote, Reneman and Marquering (2022). Robustness of radiomics to variations in segmentation methods in multimodal brain MRI.
- **Citation key**: [poirot2022robustness]
- **Type**: Journal article (Scientific Reports)
- **Identifier**: DOI 10.1038/s41598-022-20703-9, PMID 36202934; confirmed at https://doi.org/10.1038/s41598-022-20703-9 and the PubMed record.
- **Method**: Scan-rescan data (n = 46) of T1-weighted and diffusion tensor images segmented by four automatic methods; Dice agreement, ICC of radiomic features, and a sleep-deprivation classifier compared across segmentation methods by a Friedman test.
- **Key Findings**: Segmentation agreement was high (interquartile range 0.77 to 0.90) and median feature robustness to segmentation method (ICC above 0.7) exceeded scan-rescan reproducibility (ICC 0.3 to 0.8). Classification accuracy still differed between segmentation methods, from 77 to 84 percent (p below 0.001).
- **Relevance**: It measures failure at the level the research question cares about, the subject-level predictor, and puts segmentation-method variation and rescan variation on one scale.
- **Quality**: Abstract read.
- **Potential Use**: Evidence that segmentation choice changes subject-level classification even at high Dice.
- **Viewpoint**: supports the view that segmentation variability affects prediction.
- **Prediction setting**: subject-level classification (sleep-deprived or control); set of lesions or regions (anatomical regions from automatic segmentation) summarized by radiomic features.
- **Correspondence handling**: not applicable; regions are defined per subject by segmentation, and features do not need spatial alignment.
- **Pipeline relation**: measures how a pipeline step fails (segmentation method and rescan); builds on radiomics; builds on segmentation of regions.
- **Application domain**: medical imaging, brain MRI (T1-weighted and DTI).
- **Theme tags**: `failure`, `radiomics`.
- **Theme**: Theme 4

#### Prokudin et al. (2019). Efficient Learning on Point Clouds With Basis Point Sets.
- **Citation key**: [prokudin2019efficient]
- **Identifier**: DOI 10.1109/iccv.2019.00443. Confirmed by a live lookup at https://doi.org/10.1109/iccv.2019.00443.
- **Type**: Conference paper (2019 IEEE/CVF International Conference on Computer Vision (ICCV))
- **Method**: Basis point sets give a residual representation of a point cloud that is computed efficiently and fed to standard neural network architectures.
- **Key Findings**: The abstract reports that a relatively simple network on this representation matches PointNet on shape classification with three orders of magnitude fewer floating point operations. It also reports high-resolution mesh recovery from noisy 3D scans comparable to multi-step frameworks in one network pass under 1 ms.
- **Relevance**: It bears on P2 with a fixed reference point set that turns an unordered cloud into a fixed-length vector, an alternative to permutation-invariant architectures.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 162 citations.
- **Potential Use**: Related work (point-cloud networks and fixed-length encodings).
- **Stance**: Supports, basis point sets as an efficient substitute for permutation-invariant point-cloud architectures.
- **Prediction setting**: other (object shape classification and mesh recovery), input point cloud; no subject-level outcome is predicted.
- **Correspondence handling**: permutation invariance; the paper calls its reference a basis point set and the abstract does not state how the residual representation is computed, so it is filed here because it yields an order-independent fixed-length vector from each cloud without matching clouds to each other or by transport.
- **Pipeline relation**: not applicable; the abstract names no medical imaging pipeline step.
- **Application domain**: other domain, 3D scans and shape classification.
- **Theme tags**: T3b.
- **Theme**: added: handed on by Theme 3 (basis point sets); merge screening reason: basis point sets: a fixed reference point set that turns a point cloud into a fixed-length vector

#### Puny et al. (2022). Frame Averaging for Invariant and Equivariant Network Design.
- **Citation key**: [puny2022frame]
- **Identifier**: arXiv 2110.03336. Confirmed by a live lookup at https://arxiv.org/abs/2110.03336.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: Frame averaging replaces the intractable group averaging operator by an average over a small subset of group elements, a frame, to make a backbone network exactly invariant or equivariant to a symmetry.
- **Key Findings**: The paper proves that averaging over a frame gives exact invariance or equivariance and that frame-averaged models have maximal expressive power in a broad setting. It proposes universal GNNs and Euclidean motion invariant point cloud and message passing networks, and reports state-of-the-art results on point cloud normal estimation, beyond 2-WL graph separation and n-body dynamics prediction.
- **Relevance**: It bears on P2 by giving invariance to Euclidean motions of a point cloud, the pose part of the correspondence problem that permutation invariance alone leaves open.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 139 citations.
- **Potential Use**: Method background (invariant point-cloud and graph networks).
- **Stance**: Supports, frame averaging as a general route to invariant point-cloud and graph networks.
- **Prediction setting**: other (normal estimation, graph separation and n-body dynamics prediction), input point cloud; no subject-level outcome is predicted.
- **Correspondence handling**: permutation invariance; the networks are invariant to point order, and frame averaging adds invariance to Euclidean motions without aligning clouds to each other.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, point clouds, graphs and n-body physics.
- **Theme tags**: T3a, T3b.
- **Theme**: added: handed on by Theme 3 (Puny frame averaging); merge screening reason: frame averaging for invariant point cloud and graph networks (ICLR 2022)

#### Qaiser et al. (2021). Multiple Instance Learning with Auxiliary Task Weighting for Multiple Myeloma Classification.
- **Citation key**: [qaiser2021multiple]
- **Identifier**: DOI 10.1007/978-3-030-87234-2_74, arXiv 2107.07805. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-87234-2_74.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2021)
- **Method**: An auxiliary task-based multiple instance learning approach (ATMIL) for multiple myeloma classification from whole-body MRI, with an attention mechanism to localize disease and an auxiliary task with adaptive reweighting.
- **Key Findings**: The approach needs only patient-level annotations, and the attention module localizes bone regions with active disease. The adaptive reweighting of the auxiliary task is reported to improve performance considerably. It is validated on synthetic and real multi-center clinical data; the abstract does not state the number of patients or any numbers.
- **Relevance**: It addresses P1 and P3: subject-level classification from a set of image regions with no lesion annotation.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 9 citations.
- **Potential Use**: Related work (MIL on medical images that removes lesion annotation).
- **Stance**: Supports, patient-level MIL in place of lesion-level annotation for whole-body MRI.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each patient's whole-body MRI is a bag of regions with one patient-level label.
- **Correspondence handling**: permutation invariance; attention-based MIL pooling over regions does not depend on their order.
- **Pipeline relation**: removes lesion segmentation; the abstract states that only patient-level annotations are needed and attention localizes the disease sites.
- **Application domain**: medical imaging, whole-body MRI of the skeleton, multiple myeloma.
- **Theme tags**: T3c, T3d, `lesion-seg`, `step-removal`.
- **Theme**: added: handed on by Theme 3 (MIL multiple myeloma); merge screening reason: attention MIL on whole-body MRI for myeloma using patient-level labels only, without lesion annotation (small multi-center data)

#### Qi et al. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Citation key**: [qi2017pointnet]
- **Type**: Conference paper (CVPR 2017). Foundational work named for the theme.
- **Identifier**: DOI 10.1109/CVPR.2017.16 (resolved at https://doi.org/10.1109/CVPR.2017.16); arXiv 1612.00593; CVF page https://openaccess.thecvf.com/content_cvpr_2017/html/Qi_PointNet_Deep_Learning_CVPR_2017_paper.html read. The author names follow the CVF page, since the Crossref record lists the first author as "Charles, R. Qi".
- **Method**: per-point shared network, max pooling as the symmetric function, and two joint alignment networks (T-nets).
- **Key Findings**: Max pooling over per-point features gives permutation invariance, and a theorem shows that any continuous set function in the Hausdorff distance can be approximated given enough units at the pooling layer. The paper states that the representation should be invariant to rigid transformations and that "a natural solution is to align all input set to a canonical space before feature extraction"; a T-net predicts an affine matrix applied to the input points and a second one to the features. The output depends on a critical point set of at most K points, which the paper links to robustness to point perturbation and missing points.
- **Relevance**: it shows that permutation invariance alone does not handle pose; PointNet adds a learned alignment to a canonical space, a learned form of registration inside the network.
- **Prediction setting**: other, object-level classification and point-level segmentation from a point cloud.
- **Correspondence handling**: permutation invariance for point order, plus a learned alignment to a canonical space (T-net) for pose; no point-to-point correspondence is used.
- **Pipeline relation**: not applicable to medical pipelines directly; the T-net replaces external rigid alignment of the input.
- **Application domain**: other domain (3D object shapes, indoor scenes).
- **Theme tags**: T3b.
- **Quality**: abstract read on the CVF page; sections 4.2 (symmetry function, joint alignment network) and 4.3 (theoretical analysis) read in the arXiv HTML full text. Peer-reviewed; OpenAlex cited_by_count 11374. Quick assessment 14 of 15.
- **Viewpoint**: supports; also records the need for pose alignment.
- **Potential Use**: point-cloud encoders, and the point that invariance to order does not give invariance to pose.
- **Theme**: Theme 3

#### Qi et al. (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Citation key**: [qi2017pointnetpp]
- **Type**: Conference paper (NeurIPS 2017).
- **Identifier**: arXiv 1706.02413; https://proceedings.neurips.cc/paper/2017/hash/d8bf84be3800d12f74d8b05e9b89836f-Abstract.html (proceedings page read).
- **Method**: PointNet applied recursively on a nested partition of the point set, with multi-scale grouping layers.
- **Key Findings**: PointNet does not capture local structure induced by the metric space. PointNet++ learns local features at growing scales using metric distances. Networks trained on uniform densities lose accuracy on sets sampled with varying density, and the new set layers combine features from several scales to address this.
- **Relevance**: it is the point-cloud encoder used in the hippocampal comparison of `sarasua2022hippocampal`, a medical use of this theme.
- **Prediction setting**: other, object-level classification and segmentation from a point cloud.
- **Correspondence handling**: permutation invariance within each local region and at the global pooling.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (3D objects and scenes).
- **Theme tags**: T3b, T3e (sampling density sensitivity).
- **Quality**: abstract read on the NeurIPS page. Peer-reviewed; OpenAlex cited_by_count of the arXiv record 16655. Quick assessment 14 of 15.
- **Viewpoint**: supports, with a reported failure of PointNet on local structure and of uniform-density training on non-uniform sampling.
- **Potential Use**: point-cloud encoders used in medical shape prediction.
- **Theme**: Theme 3

#### Qian et al. (2024). Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem.
- **Citation key**: [qian2024reimagining]
- **Identifier**: DOI 10.1145/3637528.3671696. Confirmed by a live lookup at https://doi.org/10.1145/3637528.3671696.
- **Type**: Conference paper (Proceedings of the 30th ACM SIGKDD Conference on Knowledge Discovery and Data Mining)
- **Method**: The abstract does not state the method; the title names a prototype view of graph classification with optimal transport, with an algorithm and a theorem.
- **Key Findings**: The abstract does not state results. It states only the motivation: message passing may lose structural information, GNN-based decisions lack transparency, and a classifier that represents each class by a single vector limits intra-class diversity.
- **Relevance**: It bears on P2 through the title's prototype view with transport for graph-level labels; the abstract does not describe the mechanism.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 3, rigor 1, relevance 2, citations 2, data 1. OpenAlex counts 9 citations.
- **Potential Use**: Related work (transport dictionaries and learnable templates).
- **Stance**: Supports, a prototype view of graph classification in place of single-vector class representations.
- **Prediction setting**: other (graph classification), input graph; each label belongs to a graph, and no subjects are studied.
- **Correspondence handling**: learned template or barycenter; the title names prototypes with optimal transport, and the abstract does not state whether the prototypes are learned from the data or how graphs are coupled to them.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, graph classification; the abstract does not name the datasets.
- **Theme tags**: T2d, T2e.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Qiu et al. (2019). Reproducibility and non-redundancy of radiomic features extracted from arterial phase CT scans in hepatocellular carcinoma patients: impact of tumor segmentation variability.
- **Citation key**: [qiu2019reproducibility]
- **Identifier**: DOI 10.21037/qims.2019.03.02. Confirmed by a live lookup at https://doi.org/10.21037/qims.2019.03.02.
- **Type**: Journal article (Quantitative Imaging in Medicine and Surgery)
- **Method**: Arterial phase CT of 106 subjects is segmented by GrowCut and GraphCut in 3D Slicer by two observers and manually by five radiation oncologists; 71 IBEX radiomic features are tested for reproducibility by ICC and for redundancy by hierarchical clustering, and an SVM classifies healthy liver against HCC.
- **Key Findings**: Excellent reproducibility holds for 69% of features with manual delineation, 73% with GraphCut and 79% with GrowCut, and 65% are robust for all methods. The optimal number of non-redundant subgroups differs by method (9, 13 and 11), and is 6 when only the collectively reproducible features are clustered. The classifier reaches an AUC of 0.857 with feature reduction and 0.721 without.
- **Relevance**: It addresses P3: it measures how the tumour segmentation method changes radiomic features and the classification built on them.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 74 citations.
- **Potential Use**: Discussion and limitations (segmentation variability in radiomics)
- **Stance**: Supports, that radiomic feature reproducibility and redundancy depend on the tumour segmentation method.
- **Prediction setting**: subject-level classification, input image on a grid; subjects are classified as HCC or healthy liver from radiomic features.
- **Correspondence handling**: not applicable; features are computed per tumour volume.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; features are compared across three segmentation methods.
- **Application domain**: medical imaging, arterial phase contrast CT, liver (hepatocellular carcinoma).
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Qiu 2019); merge screening reason: effect of three segmentation methods on HCC radiomic features and classification

#### Qiu et al. (2023). QCResUNet: Joint Subject-Level and Voxel-Level Prediction of Segmentation Quality.
- **Citation key**: [qiu2023qcresunet]
- **Identifier**: DOI 10.1007/978-3-031-43901-8_17; arXiv 2412.07156. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-43901-8_17.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2023)
- **Method**: QCResUNet, a multi-task deep network that outputs subject-level segmentation-quality measures and voxel-level segmentation error maps for each tissue class.
- **Key Findings**: The method was evaluated on brain tumour segmentation quality with one internal and two external datasets, and on cardiac MRI segmentation quality from the Automated Cardiac Diagnosis Challenge. The abstract reports high performance in predicting subject-level quality metrics and in identifying segmentation errors per voxel. It gives no figures.
- **Relevance**: It detects at the subject level when the lesion-segmentation step has failed (P3).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 7 citations.
- **Potential Use**: Discussion and limitations (quality control of lesion segmentation).
- **Stance**: Neutral.
- **Prediction setting**: other (subject-level prediction of segmentation quality, not of a clinical outcome), input image on a grid; the model predicts quality metrics of a given segmentation.
- **Correspondence handling**: not applicable; segmentation quality is predicted per subject in its own image space.
- **Pipeline relation**: builds on lesion segmentation / measures how a pipeline step fails; the model screens tumour segmentations for errors.
- **Application domain**: medical imaging, brain tumour MRI and cardiac MRI.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (QCResUNet); merge screening reason: subject-level and voxel-level prediction of segmentation quality for brain tumour segmentation

#### Raff and Holt (2023). Reproducibility in Multiple Instance Learning: A Case For Algorithmic Unit Tests.
- **Citation key**: [raff2023reproducibility]
- **Type**: Conference paper (NeurIPS 2023).
- **Identifier**: DOI 10.52202/075280-0596 (resolved at https://doi.org/10.52202/075280-0596); arXiv 2310.17867.
- **Method**: synthetic algorithmic unit tests for the standard MIL assumption and threshold-based MIL assumptions.
- **Key Findings**: Five prominent deep-MIL models fail one or more tests and can learn anti-correlated instances, which a correct MIL model cannot. The table of the paper marks the attention MIL-pooling model and TransMIL as failing the standard test. A sixth, less-known method passes.
- **Relevance**: it measures how the MIL encoders used for slide-level and lesion-set prediction fail the assumption that a positive bag holds a positive instance, a risk for clinical bag labels.
- **Prediction setting**: other, bag-level classification on synthetic bags.
- **Correspondence handling**: permutation invariance (the models tested).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (synthetic MIL tests; healthcare and cyber security named as settings).
- **Theme tags**: T3e, T3c.
- **Quality**: abstract, introduction table and section list read in the arXiv HTML full text. Peer-reviewed; OpenAlex cited_by_count 15. Quick assessment 12 of 15.
- **Viewpoint**: opposes the validity of common deep-MIL models under the MIL assumption.
- **Potential Use**: failure analysis of MIL.
- **Theme**: Theme 3

#### Ravikumar et al. (2019). Generalised coherent point drift for group-wise multi-dimensional analysis of diffusion brain MRI data.
- **Citation key**: [ravikumar2019generalised]
- **Identifier**: DOI 10.1016/j.media.2019.01.001; PMID 30684740. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2019.01.001.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: A hybrid Student's t-Watson-Gaussian mixture model registers generalised point sets of voxel positions, fibre orientations and FA values non-rigidly, jointly estimating the transformations from an unbiased mean template to white matter ROIs and the joint distribution of the features.
- **Key Findings**: The corpus callosum and cingulum are analysed across 20 healthy controls, 20 patients with MCI and 20 patients with Alzheimer's disease. The framework enables group comparisons of FA and fibre orientations, which the abstract states TBSS and VBM do not afford. It constructs study-specific atlases of white matter regions automatically.
- **Relevance**: It addresses P2: correspondence across subjects is obtained by group-wise registration of point sets to a template estimated jointly with the registration.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 1. OpenAlex counts 10 citations. Small study (60 subjects).
- **Potential Use**: Method background (group-wise registration of point sets and learned templates)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input point cloud; the output is a template and group comparisons of diffusion features.
- **Correspondence handling**: learned template or barycenter; the paper uses an unbiased mean template that is estimated from the data during the joint registration.
- **Pipeline relation**: builds on registration; the method is a group-wise registration of diffusion data.
- **Application domain**: medical imaging, diffusion tensor MRI, brain white matter.
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 3 (generalised coherent point drift dMRI); merge screening reason: probabilistic group-wise registration of generalised point sets from DTI with study-specific atlases

#### Ren et al. (2023). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning for Computational Phenotyping.
- **Citation key**: [ren2023multipar]
- **Identifier**: PMLR 225:498-511, confirmed at https://proceedings.mlr.press/v225/ren23a.html (citation tags read); arXiv 2208.00993 is the preprint.
- **Type**: Conference paper (Machine Learning for Health, PMLR volume 225).
- **Method**: PARAFAC2 factorization of an irregular patient tensor trained jointly with static and dynamic prediction tasks in a multi-task objective.
- **Key Findings**: The preprint abstract states that PARAFAC2 handles irregular tensors where one mode is not aligned, such as patients with records of different lengths, and that supervising the factorization with downstream tasks gives more meaningful phenotypes and better predictive performance on two temporal EHR data sets. The text evaluates the phenotypes by PR-AUC on tasks such as in-hospital mortality.
- **Relevance**: A supervised PARAFAC2 that predicts a subject-level outcome from slices with different numbers of rows per subject.
- **Quality**: Preprint abstract, and the introduction, problem formulation and evaluation statements of the arXiv HTML full text.
- **Potential Use**: Supervised PARAFAC2 as a model for subject-level prediction from an unaligned mode.
- **Stance**: Supports.
- **Prediction setting**: Subject-level classification (for example in-hospital mortality), input set of per-patient matrices (visits by medical features).
- **Correspondence handling**: Other: PARAFAC2 lets the visit mode differ in length per patient; the feature mode is shared.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, electronic health records (MIMIC-Extract).
- **Theme tags**: T1-FAIL, T1-UNAL.
- **Theme**: Theme 1

#### Ren et al. (2026). OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport.
- **Citation key**: [ren2026otsurv]
- **Identifier**: DOI 10.1007/978-3-032-05182-0_43; arXiv 2506.20741. Confirmed by a live lookup at https://doi.org/10.1007/978-3-032-05182-0_43.
- **Type**: Conference paper (Medical Image Computing and Computer Assisted Intervention, MICCAI 2025)
- **Method**: OTSurv formulates MIL survival prediction from whole slide images as an optimal transport problem with a global long-tail constraint on the transport mass and a local uncertainty-aware constraint that raises the total mass progressively, recast as unbalanced OT and solved by matrix scaling.
- **Key Findings**: OTSurv sets new state-of-the-art results on six benchmarks with an absolute 3.6% improvement in average C-index. It reaches statistical significance in log-rank tests. The authors report high interpretability; the abstract does not name the six benchmarks.
- **Relevance**: It addresses P1 and P2: a patient-level survival outcome is predicted from a bag of tiles, with the aggregation done by an unbalanced transport plan instead of a pooling operator.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 14 citations.
- **Potential Use**: Related work (supervised prediction with transport over sets of regions)
- **Stance**: Supports, that transport with marginal constraints captures tissue heterogeneity better than existing MIL methods for survival.
- **Prediction setting**: subject-level regression, input set of lesions or regions; survival is predicted from the tiles of a whole slide image.
- **Correspondence handling**: transport coupling; the tiles are assigned through an unbalanced transport plan whose marginals model prior morphological distributions, and the abstract does not name the target side of the plan.
- **Pipeline relation**: not applicable; the abstract names no registration, radiomics or lesion-segmentation step.
- **Application domain**: medical imaging, histopathology whole slide images.
- **Theme tags**: T2e, T3c, T3d.
- **Theme**: added: handed on by Theme 4 (MICCAI 2025 OTSurv); merge screening reason: MIL with heterogeneity-aware optimal transport for WSI survival (MICCAI 2025)

#### Rioux, Goldfeld and Kato (2024). Entropic Gromov-Wasserstein Distances: Stability and Algorithms.
- **Citation key**: [rioux2024entropic]
- **Type**: Journal article (Journal of Machine Learning Research 25).
- **Method**: A variational form of quadratic entropic GW, solved by an accelerated gradient method with Sinkhorn as an inexact oracle.
- **Key Findings**: The paper gives the first non-asymptotic convergence rates for entropic GW: towards local solutions in general and towards global solutions under a quantitative condition on the regularization parameter. Stationary points of entropic GW converge to stationary points of GW as the regularization vanishes.
- **Relevance**: States when entropic GW can be solved to a global optimum and when it is non-convex, which decides whether a GW template or alignment is reproducible across subjects.
- **Quality**: High. Read: abstract and introduction (arXiv HTML full text). Cited 28 times in OpenAlex on 2026-11-19.
- **Potential Use**: Failure analysis of GW non-convexity.
- **Identifier**: arXiv 2306.00182; https://jmlr.org/papers/v25/24-0039.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input metric measure spaces.
- **Correspondence handling**: Transport coupling.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (theory).
- **Theme tags**: T2b, T2g.
- **Viewpoint**: Neutral.
- **Theme**: Theme 2

#### Rohlfing (2012). Image Similarity and Tissue Overlaps as Surrogates for Image Registration Accuracy: Widely Used but Unreliable.
- **Citation key**: [rohlfing2012image]
- **Identifier**: DOI 10.1109/tmi.2011.2163944. Confirmed by a live lookup at https://doi.org/10.1109/tmi.2011.2163944.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Method**: An experimental test of surrogate measures of nonrigid registration accuracy (tissue label overlap, image similarity, image difference, inverse consistency error) using a deliberately inaccurate registration algorithm that scores well on them.
- **Key Findings**: The surrogate measures, even in combination, cannot distinguish accurate from inaccurate registrations. Only overlap scores of localized anatomical regions reliably separate reasonable from inaccurate registrations. The author concludes that tissue overlap and image similarity should not be reported or accepted as evidence of accurate registration.
- **Relevance**: It addresses P3 by measuring how the usual evidence for a registration step fails to detect a failed registration.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 2. OpenAlex counts 467 citations.
- **Potential Use**: Discussion and limitations (evaluation of registration).
- **Stance**: Opposes, reporting tissue overlap and image similarity as evidence of registration accuracy.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study evaluates registration measures.
- **Correspondence handling**: registration to a common space; the study concerns nonrigid image registration and how its accuracy is judged.
- **Pipeline relation**: measures how a pipeline step fails; it shows that common surrogate measures do not detect inaccurate registrations.
- **Application domain**: medical imaging, nonrigid image registration (the abstract does not name the modality).
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Saha et al. (2018). Breast cancer MRI radiomics: An overview of algorithmic features and impact of inter-reader variability in annotating tumors.
- **Citation key**: [saha2018breast]
- **Identifier**: DOI 10.1002/mp.12925. Confirmed by a live lookup at https://doi.org/10.1002/mp.12925.
- **Type**: Journal article (Medical Physics)
- **Method**: Reviews and implements 529 algorithmic features from tumour and fibroglandular tissue in breast MRI in 10 groups, and measures their inter-reader stability by ICC from four fellowship-trained readers' tumour annotations on preoperative DCE-MRI of 50 patients, followed by automatic segmentation.
- **Key Findings**: Average inter-reader stability over all features was 0.8474 (95 percent CI 0.8068 to 0.8858). Tumour-based features were less stable (0.6348) than fibroglandular-tissue features (0.9984). Breast and fibroglandular volume features were most stable and tumour enhancement variation features least stable.
- **Relevance**: It measures how reader annotation of the lesion propagates into radiomic features (P3).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 75 citations. Small study (50 patients).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics).
- **Stance**: Supports, that tumour-based radiomic features vary widely with inter-reader annotation.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; feature stability is measured and no outcome is predicted.
- **Correspondence handling**: not applicable; features are computed per annotated tumour and compared across readers.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; features are extracted after reader annotation and automatic segmentation, and their stability across readers is measured.
- **Application domain**: medical imaging, dynamic contrast-enhanced breast MRI.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Saha 2018); merge screening reason: inter-reader stability of 529 breast MRI features over four readers' annotations (50 patients)

#### Rodriguez Sanchez et al. (2026). Quality over quantity: biopsy-anchored CT radiogenomics models outperform all-lesion training in a multi-tumour cohort despite a smaller sample size.
- **Citation key**: [sanchez2026quality]
- **Identifier**: DOI 10.1007/s00330-026-12601-9. Confirmed by a live lookup at https://doi.org/10.1007/s00330-026-12601-9.
- **Type**: Journal article (European Radiology)
- **Method**: Retrospective radiomics study of 1646 patients (11473 segmented lesions) with contrast-enhanced CT and EGFR status, comparing models trained on all lesions, on non-biopsied lesions only and on biopsy-confirmed lesions only, with size-matched variants and an external NSCLC cohort (n = 158).
- **Key Findings**: All models discriminated EGFR status on internal validation (AUC 0.62 to 0.68). On external validation the all-lesion and non-biopsied models declined (AUC 0.55 to 0.63) while the biopsy-anchored model stayed at AUC 0.62 with one tenth of the training sample. With size-matched training sets the biopsy-anchored model outperformed the all-lesion model on external validation (p = 0.037).
- **Relevance**: It measures how assigning one patient label to every lesion of the patient degrades a radiomics predictor, a failure of the lesion step in a multi-lesion setting (P3).
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (label assignment over sets of lesions); Related work (radiomics on multiple lesions).
- **Stance**: Supports, that lesion-level label fidelity matters more than the number of training lesions.
- **Prediction setting**: subject-level classification, input set of lesions or regions; the label is the patient's biopsy-derived EGFR status, and models are trained on lesion-level radiomic features.
- **Correspondence handling**: not applicable; each lesion is described by its own radiomic feature vector, and no correspondence between lesions of different patients is formed.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; all visible lesions were segmented, radiomic features extracted, and the lesion selection used for training was varied and measured.
- **Application domain**: medical imaging, contrast-enhanced CT, multi-tumour cohort with an external NSCLC lung cohort.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 3 (biopsy-anchored radiogenomics); merge screening reason: measures how lesion selection and per-patient label assignment change radiogenomic models over 11,473 segmented lesions

#### Sarasua et al. (2021). Geometric Deep Learning on Anatomical Meshes for the Prediction of Alzheimer's Disease.
- **Citation key**: [sarasua2021geometric]
- **Identifier**: DOI 10.1109/isbi48211.2021.9433948; arXiv 2104.10047. Confirmed by a live lookup at https://doi.org/10.1109/isbi48211.2021.9433948.
- **Type**: Conference paper (2021 IEEE 18th International Symposium on Biomedical Imaging (ISBI))
- **Method**: An evaluation of four geometric deep learning approaches on meshes, grouped into template-free methods and template-based methods that need a common reference template and correspondences, for predicting Alzheimer's disease from hippocampus meshes.
- **Key Findings**: Template-based methods show advantages in accuracy, number of learnable parameters and training speed. The abstract states that template creation may limit some applications, while neuroimaging has automated tools for building templates. Working with meshes is more involved than working with point clouds.
- **Relevance**: It addresses P2 and P3 directly: it compares methods that rely on a common template and correspondence with methods that do not, for a subject-level diagnosis.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 16 citations.
- **Potential Use**: Experimental baselines (template-based against template-free mesh networks)
- **Stance**: Supports, that template-based mesh networks predict Alzheimer's disease more accurately and efficiently than template-free ones.
- **Prediction setting**: subject-level classification, input mesh or surface; hippocampus meshes are classified for Alzheimer's disease.
- **Correspondence handling**: registration to a common space; the better-performing template-based methods need a common reference template and correspondences, which the template-free methods do without.
- **Pipeline relation**: builds on registration; the template-based methods require the template and correspondence pre-processing step.
- **Application domain**: medical imaging, hippocampus meshes from brain imaging (the abstract does not name the modality).
- **Theme tags**: T3b, T3d, `reg-template`.
- **Theme**: added: handed on by Theme 3 (GDL anatomical meshes AD); merge screening reason: compares template-free and template-based mesh networks for AD prediction (preprint)

#### Sarasua, Polsterl and Wachinger (2022). Hippocampal representations for deep learning on Alzheimer's disease.
- **Citation key**: [sarasua2022hippocampal]
- **Type**: Journal article (Scientific Reports 12, article 8619).
- **Identifier**: DOI 10.1038/s41598-022-12533-6 (resolved at https://doi.org/10.1038/s41598-022-12533-6).
- **Method**: comparison of five hippocampal representations with tailored networks (PointNet++ for point clouds, SpiralNet++ for meshes, ResNet for volumetric inputs) for AD diagnosis and time-to-dementia prediction, trained on ADNI and tested on AIBL.
- **Key Findings**: The choice of representation changes performance and interpretability. Meshes generalize best to the independent cohort. Predictions from hippocampus segmentations made by FreeSurfer score higher than those made by FSL FIRST, and meshes were evaluated for FSL only because FreeSurfer does not provide registered meshes.
- **Relevance**: it compares a correspondence-free representation (point clouds) with a representation that needs registered meshes on the same subjects, and measures the effect of the segmentation tool on the subject-level prediction.
- **Prediction setting**: subject-level classification (AD diagnosis) and subject-level regression (time to dementia, concordance index), input point cloud, mesh or image on a grid.
- **Correspondence handling**: permutation invariance for point clouds; registration to a common space for meshes, whose vertices correspond across subjects.
- **Pipeline relation**: builds on lesion segmentation (here, structure segmentation by FreeSurfer or FSL FIRST); measures how a pipeline step fails (the segmentation tool changes the prediction); builds on registration for the mesh representation.
- **Application domain**: medical imaging (brain MRI; hippocampus; Alzheimer's disease).
- **Theme tags**: T3d, T3e.
- **Quality**: full text read in part (abstract, introduction, representation and network sections, the first results paragraph). Peer-reviewed; OpenAlex cited_by_count 21. Quick assessment 12 of 15.
- **Viewpoint**: neutral (comparison); does not favour point clouds.
- **Potential Use**: evidence on point clouds against registered meshes for subject-level prediction.
- **Theme**: Theme 3

#### Scetbon, Peyre and Cuturi (2022). Linear-Time Gromov Wasserstein Distances using Low Rank Couplings and Costs.
- **Citation key**: [scetbon2022linear]
- **Type**: Conference paper (ICML, PMLR 162).
- **Method**: GW solved with couplings constrained to low-rank factorizations and with low-rank cost matrices.
- **Key Findings**: The paper states that GW is non-convex and NP-hard, and that the nested entropic approach has cubic cost in the number of points. Its method reaches a stationary point in quadratic time, or linear time with low-rank costs, with results similar to entropic GW at much lower cost.
- **Relevance**: Measures the cost barrier of GW and gives the method that stands in for entropic GW at the point counts of imaging data.
- **Quality**: High. Read: abstract and introduction (arXiv HTML full text). Cited 32 times in OpenAlex on 2026-11-19.
- **Potential Use**: Scaling of GW; a stand-in solver.
- **Identifier**: arXiv 2106.01128; https://proceedings.mlr.press/v162/scetbon22b.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input point clouds in different spaces.
- **Correspondence handling**: Transport coupling (low rank).
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (simulated data and single-cell data).
- **Theme tags**: T2b, T2g.
- **Viewpoint**: Neutral.
- **Theme**: Theme 2

#### Schmitz et al. (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Citation key**: [schmitz2018wasserstein]
- **Type**: Journal article (SIAM Journal on Imaging Sciences).
- **Method**: Each histogram is reconstructed as an entropic Wasserstein barycenter of learned atoms; atoms and weights are learned by automatic differentiation of the Sinkhorn barycenter iterations.
- **Key Findings**: The barycentric reconstruction gives nonlinear relations between atoms and data; the method is applied to several image-processing settings.
- **Relevance**: The first dictionary of transport templates; its weights are a fixed-length code for each object, though learned without labels.
- **Quality**: High. Read: abstract and method passages (arXiv HTML full text). Cited 201 times in OpenAlex on 2026-11-19.
- **Potential Use**: Templates learned without supervision.
- **Identifier**: DOI 10.1137/17M1140431; arXiv 1708.01955; https://doi.org/10.1137/17M1140431 (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input histograms (images on a grid).
- **Correspondence handling**: Learned template or barycenter; templates are learned for reconstruction, not for a supervised loss.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (image processing, astronomy).
- **Theme tags**: T2d, T2c.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Scott et al. (2026). Negative controls reveal volume-driven confounding in radiomics and imaging foundation model features.
- **Citation key**: [scott2026negative]
- **Identifier**: arXiv 2607.28423. Confirmed by a live lookup at https://arxiv.org/abs/2607.28423.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: READII-2-ROQC, an open-source framework, generates volume-preserving voxel-perturbed negative-control images over tumour, background and whole-image regions and compares radiomic and foundation-model features and model performance between original and control images.
- **Key Findings**: On three public cancer imaging cohorts with 3,552 tumour volumes and nine matched controls each, the framework reproduced published survival and HPV-status signatures. Several models kept their performance after spatial structure was destroyed, which reveals volume-driven or contextual confounding, while others showed perturbation-sensitive signal.
- **Relevance**: It addresses P3 by measuring whether radiomic and foundation-model signatures carry information beyond lesion volume and context.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 1, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (negative controls for radiomic and learned imaging features).
- **Stance**: Opposes, the assumption that published radiomic and foundation-model signatures capture image structure beyond tumour volume.
- **Prediction setting**: subject-level classification, input image on a grid; the reproduced signatures predict each patient's survival and HPV status.
- **Correspondence handling**: not applicable; features are computed per tumour volume and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; features from tumour regions are compared against volume-preserving negative controls.
- **Application domain**: medical imaging, three public cancer imaging cohorts; the abstract does not name the modality or organ.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Sejourne, Vialard and Peyre (2021). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
- **Citation key**: [sejourne2021unbalanced]
- **Type**: Conference paper (NeurIPS 34).
- **Method**: Two unbalanced GW formulations that relax mass conservation: a divergence and a conic distance.
- **Key Findings**: Both compare metric spaces with arbitrary positive measures up to isometry. The divergence pairs with entropic regularization; its non-convex problem is solved by a parallel scheme that reaches an approximate stationary point of a biconvex relaxation. The paper notes the link to quadratic assignment problems, which are NP-hard.
- **Relevance**: The unbalanced GW that fused unbalanced GW brain alignment builds on; it addresses objects whose parts differ in size or are missing, as regions and lesions do across subjects.
- **Quality**: High. Read: abstract and method passages (arXiv HTML full text). Cited 61 times in OpenAlex on 2026-11-19.
- **Potential Use**: Unbalanced variants; non-convexity.
- **Identifier**: arXiv 2009.04266; https://proceedings.neurips.cc/paper/2021/hash/4990974d150d0de5e6e15a1454fe6b0f-Abstract.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction (a positive-unlabeled learning example in the experiments); input point clouds.
- **Correspondence handling**: Transport coupling with partial mass.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (synthetic data, domain adaptation).
- **Theme tags**: T2b, T2g.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Shakeri et al. (2016). Deep Spectral-Based Shape Features for Alzheimer's Disease Classification.
- **Citation key**: [shakeri2016deep]
- **Identifier**: DOI 10.1007/978-3-319-51237-2_2. Confirmed by a live lookup at https://doi.org/10.1007/978-3-319-51237-2_2.
- **Type**: Workshop paper (Spectral and Shape Analysis in Medical Imaging, SASHIMI 2016, Lecture Notes in Computer Science)
- **Method**: Triangulated surface meshes of segmented hippocampi from MRI are put in point-to-point correspondence across the population by spectral matching, a variational auto-encoder learns a low-dimensional representation of the vertex coordinates, and a multi-layer perceptron with softmax trained jointly classifies the subjects.
- **Key Findings**: On ADNI the method classifies normal subjects against early MCI, late MCI and AD subjects with classification rates above a standard SVM approach. The abstract does not state the sample size or the accuracies.
- **Relevance**: A subject-level classifier on hippocampal meshes that builds correspondence by spectral matching before learning (P1, P2, P3).
- **Quality**: Abstract read (Springer chapter page). Quick assessment 12 of 15 (High): journal ranking 2, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 53 citations.
- **Potential Use**: Related work (sets of lesions or regions and medical point clouds); Experimental baselines (a correspondence-based mesh classifier).
- **Stance**: Supports, that deep features of corresponded hippocampal meshes separate AD and MCI stages from normal subjects.
- **Prediction setting**: subject-level classification, input mesh or surface (hippocampal meshes); the perceptron classifies each subject as normal, early MCI, late MCI or AD.
- **Correspondence handling**: registration to a common space; spectral matching sets point-to-point correspondences among the population of surfaces, so the vertex coordinates are comparable across subjects.
- **Pipeline relation**: builds on registration; the vertex correspondences come from spectral matching of the surfaces, which are extracted from segmented hippocampus structures (an anatomical segmentation, not a lesion segmentation).
- **Application domain**: medical imaging, structural MRI of the hippocampus (ADNI).
- **Theme tags**: T3d, `reg-analysis`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Shao et al. (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
- **Citation key**: [shao2021transmil]
- **Identifier**: arXiv 2106.00908. Confirmed by a live lookup at https://arxiv.org/abs/2106.00908.
- **Type**: Conference paper (Advances in Neural Information Processing Systems (NeurIPS))
- **Method**: A correlated multiple instance learning framework with a convergence proof, realized as a Transformer-based MIL model that uses morphological and spatial information of the patches of a whole slide image.
- **Key Findings**: Across three computational pathology problems, TransMIL performs better and converges faster than state-of-the-art methods. The test AUC reaches 93.09% for binary tumor classification on CAMELYON16 and 96.03% and 98.82% for cancer subtype classification on TCGA-NSCLC and TCGA-RCC.
- **Relevance**: It addresses P1 and P3: a slide-level diagnosis is predicted from a bag of patches under weak supervision, without patch-level annotation of tumour regions.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 3. OpenAlex counts 1530 citations.
- **Potential Use**: Experimental baselines (attention and transformer MIL on whole slide images)
- **Stance**: Supports, that modelling correlation among instances improves MIL over pooling that assumes independent instances.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each whole slide image is a bag of patches with one diagnostic label.
- **Correspondence handling**: permutation invariance; the slide is treated as a bag of patches aggregated by a transformer, with no patch correspondence across slides.
- **Pipeline relation**: removes lesion segmentation; the abstract frames the task as weakly supervised classification with slide-level labels only.
- **Application domain**: medical imaging, histopathology whole slide images (binary tumor classification on CAMELYON16 and cancer subtyping on TCGA-NSCLC and TCGA-RCC).
- **Theme tags**: T3c, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 3 (TransMIL 2021); merge screening reason: correlated transformer MIL over whole-slide patch bags; standard pathology baseline

#### Shao et al. (2022). Patient-level grading prediction of prostate cancer from mp-MRI via GMINet.
- **Citation key**: [shao2022patient]
- **Identifier**: DOI 10.1016/j.compbiomed.2022.106168; PMID 36240594. Confirmed by a live lookup at https://doi.org/10.1016/j.compbiomed.2022.106168.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: GMINet, a topological graph-guided multi-instance network that integrates multi-slice MRI with slice-to-slice correlations and fuses mp-MRI branches by an attention flowing strategy for patient-level prediction.
- **Key Findings**: On a multi-center dataset (N = 478) the five-class Grade Group accuracy was 81.1 percent (plus or minus 1.8) in five-fold cross-validation, and on a public dataset (N = 204) the area under the curve for clinically significant prostate cancer was 0.801 (plus or minus 0.018). The abstract states that the method addresses tumor delineation dependence. Attention analysis also gives tumor detection.
- **Relevance**: A patient-level grade predicted from a set of slice instances without tumour delineation (P1, P3).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 1, data 3. OpenAlex counts 9 citations.
- **Potential Use**: Related work (multiple-instance models that remove lesion segmentation in imaging).
- **Stance**: Supports, that a multi-instance network can predict patient-level grade without tumour delineation.
- **Prediction setting**: subject-level classification, input image on a grid; the multi-slice mp-MRI of each patient is treated as a set of slice instances that receives a Grade Group label.
- **Correspondence handling**: permutation invariance; multi-instance pooling over slices gives a patient-level output, and the abstract does not state whether the slice graph uses slice order.
- **Pipeline relation**: removes lesion segmentation; the abstract names tumor delineation dependence as a challenge the method addresses, and tumours are located by attention.
- **Application domain**: medical imaging, multi-parametric MRI of the prostate.
- **Theme tags**: T3c, T3d, `step-removal`.
- **Theme**: added: handed on by Theme 3 (GMINet prostate); merge screening reason: graph-guided multi-instance network for patient-level prostate grading that addresses tumour delineation dependence

#### Shi et al. (2016). Shape Analysis with Hyperbolic Wasserstein Distance.
- **Citation key**: [shi2016shape]
- **Identifier**: DOI 10.1109/cvpr.2016.546. Confirmed by a live lookup at https://doi.org/10.1109/cvpr.2016.546.
- **Type**: Conference paper (2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR))
- **Method**: A framework that computes the Wasserstein distance between surfaces of general topology with a hyperbolic metric, using Ricci flow, a hyperbolic harmonic map and a hyperbolic power Voronoi diagram.
- **Key Findings**: The method is applied to human facial expression, longitudinal cortical morphometry in normal aging and cortical shape classification in Alzheimer's disease. In the Alzheimer's disease against healthy control classification, it outperforms some other standard shape measures. The abstract does not state the number of subjects.
- **Relevance**: It addresses P1 and P2: a subject-level diagnosis is made from a transport distance between cortical surfaces, so the surfaces are compared without a voxel grid.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 26 citations.
- **Potential Use**: Related work (supervised prediction with transport on cortical surfaces)
- **Stance**: Supports, that a Wasserstein shape distance is an effective shape index for Alzheimer's disease classification.
- **Prediction setting**: subject-level classification, input mesh or surface; cortical surfaces are classified as Alzheimer's disease or healthy control.
- **Correspondence handling**: transport coupling; the shapes are compared by a Wasserstein distance computed after a hyperbolic parameterization of each surface.
- **Pipeline relation**: not applicable; the abstract does not state whether a registration step is used or replaced.
- **Application domain**: medical imaging, brain cortical surfaces (the abstract does not name the modality); also human facial expression.
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Shi Zhang Wang 2016 hyperbolic Wasserstein); merge screening reason: hyperbolic Wasserstein distance between cortical surfaces for AD classification

#### Shifat-E-Rabbi et al. (2025). Linear Optimal Transport Subspaces for Point Set Classification.
- **Citation key**: [shifaterabbi2025linear]
- **Identifier**: DOI 10.1007/s10851-025-01261-x. Confirmed by a live lookup at https://doi.org/10.1007/s10851-025-01261-x.
- **Type**: Journal article (Journal of Mathematical Imaging and Vision)
- **Method**: Point sets are embedded linearly by the Linear Optimal Transport transform, and a nearest-subspace classifier in the LOT space classifies point sets under spatial deformations, with emphasis on affine ones.
- **Key Findings**: The abstract states that the LOT transform builds a convex data space that simplifies classification and that the method is label efficient, non-iterative and needs no hyper-parameter tuning. It reports competitive accuracies against state-of-the-art methods and robustness when training and test deformation magnitudes differ; it gives no numbers.
- **Relevance**: It addresses P2 with a transport embedding that makes unordered point sets comparable as vectors for classification.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Related work (supervised prediction with transport embeddings).
- **Stance**: Supports, LOT embeddings for point set classification under deformations.
- **Prediction setting**: other (point-set classification), input point cloud; each label belongs to a point set, and the abstract names no subjects.
- **Correspondence handling**: transport coupling; each point set is embedded by its LOT transform, and the abstract does not name the reference measure.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, point set classification in computer vision.
- **Theme tags**: T2e.
- **Theme**: added: merge intersection or gap search; screening note: LOT subspaces for point set classification; P2 OT embedding of sets

#### Siless et al. (2020). Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan.
- **Citation key**: [siless2020registration]
- **Identifier**: DOI 10.1016/j.neuroimage.2020.116703. Confirmed by a live lookup at https://doi.org/10.1016/j.neuroimage.2020.116703.
- **Type**: Journal article (NeuroImage)
- **Method**: Extends the anatomical similarity metric of AnatomiCuts, which clusters streamlines by their neighbouring anatomical structures, to find corresponding tract clusters across subjects and hemispheres without inter-subject or inter-hemispheric registration.
- **Key Findings**: On the pilot MGH-Harvard-USC Lifespan Human Connectome data, the approach improved tract-cluster correspondence across 184 subjects aged 8 to 90. Overlap of corresponding clusters improved by up to 38 percent between subjects with large age differences. The abstract states that the method needs no template registration and suits populations with large inter-subject variability.
- **Relevance**: It sets correspondence between subjects' streamline sets by anatomy, removing the registration step (P2, P3).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 20 citations.
- **Potential Use**: Related work (registration-free correspondence in neuroimaging).
- **Stance**: Supports, that tract-cluster correspondence across subjects can be found without registration.
- **Prediction setting**: representation or comparison only, no prediction, input point cloud; the outputs are tract clusters matched across subjects.
- **Correspondence handling**: not applicable; clusters are matched across subjects by an anatomical similarity metric defined by neighbouring structures, a matching rule that does not fall under the listed categories, and no common space is formed.
- **Pipeline relation**: removes registration; the abstract states that correspondence is found without inter-subject registration to a template.
- **Application domain**: medical imaging, diffusion MRI tractography of the brain.
- **Theme tags**: `step-removal`.
- **Theme**: added: handed on by Theme 4 (Siless 2020 registration-free tractography); merge screening reason: registration-free correspondence of tract clusters across 184 subjects

#### Simpson, Woolrich, Andersson, Groves and Schnabel (2013). Ensemble learning incorporating uncertain registration.
- **Citation key**: [simpson2013ensemble]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Identifier**: DOI 10.1109/TMI.2012.2236651, PMID 23288332; confirmed at https://doi.org/10.1109/TMI.2012.2236651 (resolves to the IEEE Xplore page) and the PubMed record.
- **Method**: A probabilistic registration estimates a distribution of subject-to-atlas mappings; samples of the spatially normalized features (gray-matter maps, deformation tensors) are drawn from it and used to train an ensemble of linear SVMs.
- **Key Findings**: For separating Alzheimer's disease from controls on a region of interest, the method improves discrimination over bootstrap aggregating with voxel-based and deformation tensor-based morphometry. It also gives more reasonable soft classifications.
- **Relevance**: It is a subject-level predictor that keeps registration and treats its error as a source of variance in training and testing, which answers the research question's "builds on registration" with an explicit model of registration failure.
- **Quality**: Abstract read. Published 2013, inside the window.
- **Potential Use**: Example of a predictor that propagates registration uncertainty rather than removing registration.
- **Viewpoint**: supports the view that registration error affects subject-level prediction.
- **Prediction setting**: subject-level classification; image on a grid (spatially normalized MRI features in a region of interest); the SVM ensemble labels each subject AD or control.
- **Correspondence handling**: registration to a common space; correspondence is a distribution of mappings to the atlas, sampled.
- **Pipeline relation**: builds on registration; measures how a pipeline step fails (registration uncertainty enters the predictor).
- **Application domain**: medical imaging, brain MRI, Alzheimer's disease.
- **Theme tags**: `reg-analysis`, `failure`.
- **Theme**: Theme 4

#### Sinclair et al. (2022). Atlas-ISTN: Joint segmentation, registration and atlas construction with image-and-spatial transformer networks.
- **Citation key**: [sinclair2022atlas]
- **Identifier**: DOI 10.1016/j.media.2022.102383. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2022.102383.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: Atlas-ISTN jointly learns segmentation and registration on 2D and 3D images, constructs a population-derived atlas during training, registers the atlas labelmap to an intermediate pixel-wise segmentation and allows test-time refinement of that alignment.
- **Key Findings**: On 2D synthetic data and 3D cardiac CT and brain MR data, the abstract reports that Atlas-ISTN outperforms segmentation and registration baseline models. It states that test-time refinement mitigates noise that causes spurious pixel-wise predictions and that the framework gives inter-subject correspondence of the structures of interest.
- **Relevance**: It addresses P2 with a template learned from the population jointly with the registration to it, and P3 because the segmentation is obtained through that registration.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 64 citations.
- **Potential Use**: Related work (learned templates and atlas construction in registration pipelines).
- **Stance**: Supports, joint atlas construction, registration and segmentation over separate segmentation or registration models.
- **Prediction setting**: other (voxel-wise segmentation of structures), input image on a grid; no subject-level outcome is predicted.
- **Correspondence handling**: learned template or barycenter; the paper calls it a population-derived atlas, constructed from the training data, which is registered to each image to give inter-subject correspondence.
- **Pipeline relation**: builds on registration; the segmentation is obtained by registering the learned atlas labelmap to each image.
- **Application domain**: medical imaging, 3D cardiac CT and brain MRI.
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 4 (Atlas-ISTN); merge screening reason: joint segmentation, registration and population atlas construction

#### Sineglazov and Shevchenko (2026). Impact of Automated Segmentation on Radiomics-based Growth Prediction of Vestibular Schwannoma.
- **Citation key**: [sineglazov2026impact]
- **Identifier**: DOI 10.18372/1990-5548.88.20980. Confirmed by a live lookup at https://doi.org/10.18372/1990-5548.88.20980.
- **Type**: Journal article (Electronics and Control Systems)
- **Method**: An nnU-Net trained on 317 T1C image pairs from 155 patients (Vestibular-Schwannoma-MC-RC2) replaces manual masks in a published radiomics growth-prediction pipeline, with ICC analysis of feature agreement and growth prediction on 96 patients with growth labels.
- **Key Findings**: The segmentation reached mean Dice 0.862, and 88.8 percent of wavelet features kept good or excellent agreement (ICC at least 0.75) between manual and automatic masks. Growth prediction AUC fell from 0.742 with manual masks to 0.639 with automatic masks (minus 14.0 percent). Pipeline changes (ICC filtering, a logistic regression and LDA ensemble) raised it to 0.687 (minus 7.4 percent).
- **Relevance**: It measures how replacing manual by automatic lesion segmentation degrades a subject-level radiomics predictor even when feature agreement is high (P3).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 0 citations. Small study (96 patients with growth labels).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics-based prediction).
- **Stance**: Supports, that automated segmentation carries a measurable cost for radiomics-based growth prediction.
- **Prediction setting**: subject-level classification, input image on a grid; the outcome is tumour growth per patient, predicted from radiomic features.
- **Correspondence handling**: not applicable; features are computed per tumour mask and no cross-subject correspondence is formed.
- **Pipeline relation**: builds on radiomics / builds on lesion segmentation / measures how a pipeline step fails; the study measures the change in feature agreement and prediction AUC when the segmentation step is automated.
- **Application domain**: medical imaging, contrast-enhanced T1-weighted MRI of vestibular schwannoma.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Skianis et al. (2020). Rep the Set: Neural Networks for Learning Set Representations.
- **Citation key**: [skianis2020rep]
- **Identifier**: arXiv 1904.01962. Confirmed by a live lookup at https://arxiv.org/abs/1904.01962.
- **Type**: Conference paper (Proc. Int. Conf. Artificial Intelligence and Statistics (AISTATS))
- **Method**: RepSet computes correspondences between an input set of vectors and learned hidden sets by solving network flow problems, and feeds the result to a standard network, trained end to end.
- **Key Findings**: The abstract states that the architecture handles sets of varying cardinality without element ordering. It reports performance better than or comparable to state-of-the-art algorithms on classification tasks including text categorization and graph classification. The abstract gives no figures.
- **Relevance**: It handles missing correspondence by matching each input set to learned reference sets, a learned template route for set prediction (P2).
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 54 citations.
- **Potential Use**: Method background (learned reference sets with assignment-based matching).
- **Stance**: Supports, that matching sets to learned hidden sets gives competitive set classification.
- **Prediction setting**: other (set-level classification of texts and graphs), input distribution or set of vectors; each set receives one label.
- **Correspondence handling**: learned template or barycenter; the paper calls them hidden sets, and they fall under this category because they are learned from the data, with the correspondence to each hidden set solved by a network flow problem.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, text categorization and graph classification.
- **Theme tags**: T3a, T2d.
- **Theme**: added: handed on by Theme 3 (Rep the Set); merge screening reason: set representation by network-flow correspondences to learned hidden sets

#### Soelch et al. (2019). On Deep Set Learning and the Choice of Aggregations.
- **Citation key**: [soelch2019deep]
- **Identifier**: DOI 10.1007/978-3-030-30487-4_35. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-30487-4_35.
- **Type**: Conference paper (Artificial Neural Networks and Machine Learning, ICANN 2019, Lecture Notes in Computer Science)
- **Method**: An empirical study of the aggregation function of Deep Set networks, with alternatives to the common aggregations that include learnable recurrent aggregation functions.
- **Key Findings**: Deep Set networks are highly sensitive to the choice of aggregation function. Learnable aggregations improve performance, lower the sensitivity to hyper-parameters and generalize better to input sizes outside the training distribution.
- **Relevance**: Measures how the pooling step of a permutation-invariant set predictor changes its accuracy and its behaviour when set sizes differ (P2), which bears on subject-level sets whose size varies across subjects.
- **Quality**: Abstract read (Springer chapter page). Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 28 citations.
- **Potential Use**: Related work (set encoders and their theory); Discussion and limitations (sensitivity to the aggregation and to set size).
- **Stance**: Opposes, a fixed sum or mean aggregation as the default choice for Deep Sets.
- **Prediction setting**: other (set-level prediction tasks), input distribution or set of vectors; the abstract does not name the tasks or data sets.
- **Correspondence handling**: permutation invariance; the sum decomposition of Deep Sets makes the prediction independent of the order of the elements, and the study varies the aggregation inside it.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline.
- **Application domain**: other domain, machine learning on set-valued inputs.
- **Theme tags**: T3a, T3e.
- **Theme**: added: handed on by Theme 3 (deep set aggregations ICANN 2019); merge screening reason: sensitivity of Deep Sets to the aggregation function and to out-of-distribution set size, read on the publisher page

#### Solomon et al. (2016). Entropic metric alignment for correspondence problems.
- **Citation key**: [solomon2016entropic]
- **Identifier**: DOI 10.1145/2897824.2925903. Confirmed by a live lookup at https://doi.org/10.1145/2897824.2925903.
- **Type**: Journal article (ACM Transactions on Graphics)
- **Method**: An algorithm for probabilistic correspondence that optimizes an entropy-regularized Gromov-Wasserstein objective on any domain expressed as a metric measure matrix.
- **Key Findings**: The algorithm is compact and provably convergent, and experiments show its convergence and applicability to graphics tasks. The framework is extended to partial distance matrices, user guidance, shape exploration, symmetry detection and joint analysis of more than two domains. The abstract states that these applications are stable to distortion and noise.
- **Relevance**: It addresses P2: entropic Gromov-Wasserstein gives a soft correspondence between domains that share no common coordinate system.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 262 citations.
- **Potential Use**: Method background (entropic Gromov-Wasserstein correspondence)
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input mesh or surface; the output is a soft correspondence between geometric domains.
- **Correspondence handling**: transport coupling; the soft matches are an entropic Gromov-Wasserstein coupling.
- **Pipeline relation**: not applicable; the work concerns graphics tasks, not a medical-imaging pipeline.
- **Application domain**: other domain, computer graphics and shape analysis.
- **Theme tags**: T2b, T2a.
- **Theme**: added: handed on by Theme 2 (Solomon 2016 entropic metric alignment); merge screening reason: entropic GW correspondence between geometric domains, the soft matching used for unaligned shapes

#### Song et al. (2024). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology.
- **Citation key**: [song2024morphological]
- **Identifier**: DOI 10.1109/cvpr52733.2024.01099. Confirmed by a live lookup at https://doi.org/10.1109/cvpr52733.2024.01099.
- **Type**: Conference paper (2024 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR))
- **Method**: Panther summarizes the set of whole slide image patches into a small set of morphological prototypes with a Gaussian mixture model, and builds a compact slide representation from the mixture parameters for downstream tasks.
- **Key Findings**: On subtyping and survival tasks across 13 datasets, Panther outperformed or matched supervised MIL baselines. The morphological prototypes gave qualitative and quantitative insight into interpretability. Code is released.
- **Relevance**: It handles a variable set of patches per slide through prototypes estimated from the data, giving a fixed-length subject representation for prediction (P1, P2).
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 172 citations.
- **Potential Use**: Related work (learned templates and prototypes for set inputs); Experimental baselines.
- **Stance**: Supports, that unsupervised prototype representations match supervised MIL on slide-level tasks.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; the slide representation is used for subtyping and for survival prediction.
- **Correspondence handling**: learned template or barycenter; the paper calls them morphological prototypes, Gaussian mixture components estimated from the data, and each slide is described by its mixture parameters against them.
- **Pipeline relation**: not applicable; the abstract does not describe a registration, segmentation or radiomics step.
- **Application domain**: medical imaging, histopathology whole slide images (the abstract does not name the organs).
- **Theme tags**: T2d, T3c, T3d.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Su et al. (2015). Optimal Mass Transport for Shape Matching and Comparison.
- **Citation key**: [su2015optimal]
- **Identifier**: DOI 10.1109/tpami.2015.2408346. Confirmed by a live lookup at https://doi.org/10.1109/tpami.2015.2408346.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence)
- **Method**: Composes a conformal map of a disk-topology surface to the unit disk with an optimal mass transport map computed from Monge-Brenier theory, giving an area-preserving diffeomorphic map for surface registration and a Conformal Wasserstein Shape Space for shape comparison.
- **Key Findings**: The abstract states that the Monge-Brenier computation reduces complexity from O(n^2) to O(n) compared with Monge-Kantorovich methods. It states that conformal maps alone may introduce large area distortions that cause numerical instability, and that the composed map is unique, intrinsic to the Riemannian metric and diffeomorphic. Experiments and comparisons with prior approaches are reported as showing efficiency and efficacy, with no figures given in the abstract.
- **Relevance**: It shows transport used as the registration step itself for surfaces, and a transport-based shape space for comparison (P2).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 135 citations.
- **Potential Use**: Method background (transport maps for surface correspondence).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input mesh or surface; the method registers and compares surfaces and predicts no outcome.
- **Correspondence handling**: transport coupling; the paper uses an optimal mass transport map, with the unit disk as the fixed reference domain after conformal mapping, to set point correspondence between surfaces.
- **Pipeline relation**: builds on registration; the method is itself a surface registration step.
- **Application domain**: other domain, surface shape analysis in computer vision and medical imaging (the abstract does not name a modality or organ).
- **Theme tags**: `reg-template`.
- **Theme**: added: handed on by Theme 2 (Su 2015 OMT shape TPAMI); merge screening reason: optimal mass transport maps for surface registration and shape space

#### Su et al. (2015). Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis.
- **Citation key**: [su2015shape]
- **Type**: Conference paper (IPMI, LNCS).
- **Method**: Each cortical surface is conformally mapped to the unit sphere and the Wasserstein distance between the induced area measures is computed with Riemannian optimal mass transport; subjects are classified by k-nearest neighbours on the distance matrix.
- **Key Findings**: On left-hemisphere surfaces of 100 subjects reconstructed with FreeSurfer, the method assigns three IQ classes with a 78.57 percent classification rate, against 53.57 to 67.85 percent for area and curvature features. The method depends only on the Riemannian metric and is invariant to rigid motion and scaling; no inter-subject registration step is described.
- **Relevance**: An early subject-level prediction from unaligned brain shapes by transport.
- **Quality**: Medium (small sample, kNN). Read: abstract, methods and experiments (PMC full text, PMC4527322). Cited 35 times in OpenAlex on 2026-11-19.
- **Potential Use**: Registration-free subject-level classification.
- **Identifier**: DOI 10.1007/978-3-319-19992-4_32; https://doi.org/10.1007/978-3-319-19992-4_32 (confirmed).
- **Prediction setting**: Subject-level classification, input cortical surface meshes.
- **Correspondence handling**: Transport coupling between conformal spherical measures; no common space.
- **Pipeline relation**: Removes registration; builds on cortical surface reconstruction (segmentation by FreeSurfer).
- **Application domain**: Medical imaging (structural MRI, brain cortex).
- **Theme tags**: T2f, T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Suinesiaputra et al. (2018). Statistical Shape Modeling of the Left Ventricle: Myocardial Infarct Classification Challenge.
- **Citation key**: [suinesiaputra2018statistical]
- **Identifier**: DOI 10.1109/jbhi.2017.2652449. Confirmed by a live lookup at https://doi.org/10.1109/jbhi.2017.2652449.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics)
- **Method**: A challenge, started in 2015 at the Statistical Atlases and Computational Models of the Heart workshop with the MICCAI conference, tests statistical shape characterization of MI from three-dimensional left ventricular surface points, with a labelled training set of 100 MI patients and 100 asymptomatic volunteers and a validation set of 200 cases.
- **Key Findings**: Eleven groups with a wide variety of classification and feature extraction approaches participated. All methods reached accuracies from 0.83 to 0.98 and AUCs above 0.90. Four methods performed significantly better than standard clinical measures; the dataset and evaluation software are available from the Cardiac Atlas Project.
- **Relevance**: It addresses P1: a subject-level classification of MI from left ventricular surface points, with a common benchmark of shape methods against clinical measures.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 3. OpenAlex counts 115 citations.
- **Potential Use**: Experimental baselines (shape-based MI classification benchmark)
- **Stance**: Supports, that statistical shape modelling adds information over standard clinical measures in MI.
- **Prediction setting**: subject-level classification, input point cloud; participants submit the likelihood of MI for each case from its left ventricular surface points.
- **Correspondence handling**: assumes alignment; the abstract describes statistical shape modelling of a set of surface points per case and does not state how point correspondence across cases is established.
- **Pipeline relation**: not applicable; the challenge starts from given surface points, and the abstract names no registration, radiomics or lesion-segmentation step.
- **Application domain**: medical imaging, cardiac left ventricle (the abstract does not name the modality).
- **Theme tags**: T3d.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Szabo et al. (2016). Learning Theory for Distribution Regression.
- **Citation key**: [szabo2016learning]
- **Type**: Journal article (JMLR 17(152)). Foundational work named for the theme.
- **Identifier**: arXiv 1411.2066; https://jmlr.org/papers/v17/14-510.html (journal page read).
- **Method**: ridge regression on kernel mean embeddings of distributions, with a consistency analysis in the two-stage sampled setting.
- **Key Findings**: Distribution regression regresses vector outputs on probability measures that are observed only through samples. The paper proves that ridge regression on mean embeddings is consistent in this two-stage sampled setting and matches the one-stage minimax rate under stated conditions. This establishes consistency of the classical set kernel in regression and covers multi-instance learning as a case.
- **Relevance**: it gives learning guarantees for predicting an outcome from a set of samples per subject, with no correspondence between the samples of different subjects.
- **Prediction setting**: other, set-level regression with a sample set from a distribution as input (subject-level when each subject is a distribution).
- **Correspondence handling**: permutation invariance (mean embedding of the sample set).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (theory; applications named in the abstract include multi-instance learning and entropy estimation).
- **Theme tags**: T3c.
- **Quality**: abstract read on the JMLR page. Peer-reviewed; OpenAlex cited_by_count of the arXiv record 120. Quick assessment 13 of 15.
- **Viewpoint**: supports kernel distribution regression.
- **Potential Use**: theory of set-to-outcome regression.
- **Theme**: Theme 3

#### Tang, Bi and Qu (2019). Individualized Multilayer Tensor Learning With an Application in Imaging Analysis.
- **Citation key**: [tang2019individualized]
- **Identifier**: DOI 10.1080/01621459.2019.1585254, confirmed at https://doi.org/10.1080/01621459.2019.1585254 through Crossref, OpenAlex and Semantic Scholar; arXiv 1903.08871 is the preprint, whose full text was read.
- **Type**: Journal article (JASA).
- **Method**: A multilayer tensor decomposition in which each subject's image tensor is the sum of population-shared low-rank layers and an individualized rank-one layer, extended to several imaging modalities that share the individualized layer; the extracted features enter an L1-penalized logistic regression for disease status; fitted by a bi-level block improvement algorithm with convergence, recovery and consistency results.
- **Key Findings**: The text states that tensor regression with voxel-indexed coefficients potentially requires voxel-wise registration over individuals, which is not applicable to cancer imaging where individuals are imaged at various locations and the tumour-associated microvesicles are randomly located, and that a population-wise low-rank CP structure cannot capture such heterogeneous signals. On four-modality optical images of human breast tissue (160 image samples segmented from three normal and two cancerous individuals, 60 for testing, 30 replications), the reported prediction accuracy improves by 34%, 39%, 19%, 13% and 7% over vectorized penalized logistic regression, tensor regression, MPCA, higher-order CP decomposition and a CNN.
- **Relevance**: A tensor model that predicts a subject-level label without voxel-wise correspondence, by letting each subject keep its own spatial layer instead of registering the images.
- **Quality**: Abstract, introduction, model section and real-data section of the arXiv full text.
- **Potential Use**: The closest included tensor regression to an unaligned spatial mode; it keeps a common pixel grid but no correspondence of signal locations across subjects.
- **Stance**: Supports (that tensor regression can drop the registration requirement when signals are not spatially consistent).
- **Prediction setting**: Subject-level classification (cancerous versus normal tissue sample), input image on a grid (four-modality 100 by 100 pixel images).
- **Correspondence handling**: Other: no registration; an individualized layer per subject absorbs location-specific signal, and the population layers capture shared structure.
- **Pipeline relation**: Removes registration (the text states voxel-wise registration is not applicable); builds on a segmentation of tissue regions into image samples.
- **Application domain**: Medical imaging, multimodal optical microscopy of breast tissue.
- **Theme tags**: T1-TR, T1-UNAL.
- **Theme**: Theme 1

#### Tang et al. (2026). Metabolic connectivity alterations in amyotrophic lateral sclerosis: Individual network analysis based on Wasserstein distances.
- **Citation key**: [tang2026metabolic]
- **Identifier**: DOI 10.1162/imag.a.1343. Confirmed by a live lookup at https://doi.org/10.1162/imag.a.1343.
- **Type**: Journal article (Imaging Neuroscience)
- **Method**: Single-subject metabolic connectivity networks built from 18F-FDG PET over 77 atlas-defined brain regions, with the Wasserstein distance between regional uptake distributions as the edge weight in place of a Kullback-Leibler divergence similarity estimate, followed by graph nodal metrics and support vector machine classification.
- **Key Findings**: In 167 individuals with ALS, 36 healthy volunteers and 25 ALS mimics, the Wasserstein and Kullback-Leibler nodal measures were strongly correlated, and the Wasserstein measures showed group differences in more brain regions. For ALS against age-matched healthy volunteers both connectivity approaches reached an accuracy above 0.80, which the abstract reports as significantly lower than voxel-wise data (p below 0.05). For ALS against ALS mimics the connectivity approaches outperformed image-based classification (p below 0.01), with the Wasserstein networks reaching the highest accuracy of 0.65.
- **Relevance**: A subject-level classifier whose features come from transport distances between regional distributions within each subject (P1, P2), with correspondence across subjects given by the atlas regions (P3, builds on registration).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 1 citation.
- **Potential Use**: Related work (supervised prediction with transport in neuroimaging); Experimental baselines (a transport-feature classifier on atlas regions).
- **Stance**: Supports, that Wasserstein distances between regional distributions give subject-level features that separate ALS from ALS mimics.
- **Prediction setting**: subject-level classification, input graph (an individual connectivity network over 77 atlas regions); the support vector machine classifies each subject as ALS, healthy volunteer or ALS mimic.
- **Correspondence handling**: registration to a common space; the 77 regions are defined by an atlas, so regions correspond across subjects through the atlas, and the transport distance compares distributions within one subject.
- **Pipeline relation**: builds on registration; the atlas-defined regions require each PET image to be placed in the atlas space.
- **Application domain**: medical imaging, 18F-FDG PET of the brain (amyotrophic lateral sclerosis).
- **Theme tags**: T2e, `reg-analysis`.
- **Theme**: added: merge PubMed search P3

#### Tang, Kolda and Zhang (2026). Tensor Decomposition with Unaligned Observations.
- **Citation key**: [tang2026tensor]
- **Identifier**: DOI 10.1137/24m1692836, confirmed at https://doi.org/10.1137/24m1692836 through Crossref and OpenAlex; arXiv 2410.14046 is the preprint.
- **Type**: Journal article (SIAM Journal on Matrix Analysis and Applications).
- **Method**: A CP decomposition in which the mode with unaligned observations is a function in a reproducing kernel Hilbert space, with a loss for binary, count and positive data, a stochastic gradient method and a sketching algorithm.
- **Key Findings**: The text defines the setting as subject i measured at a set of time points T_i that differs across subjects, notes that earlier functional tensor methods require the time points to be the same for all subjects, and applies the method to 42 infants of the ECAM microbiome study, whose irregular timing prevents tabular decompositions without binning.
- **Relevance**: The most direct decomposition for a mode whose observation points differ by subject; the RKHS mode removes the need to interpolate to a common grid.
- **Quality**: Abstract, and the introduction, problem formulation and real-data sections of the arXiv HTML full text.
- **Potential Use**: A continuous-mode alternative to registration onto a common grid.
- **Stance**: Supports.
- **Prediction setting**: Representation or comparison only, no prediction, input tensor with one functional mode (subject by feature by continuous time).
- **Correspondence handling**: Other: the unaligned mode is a continuous function evaluated at each subject's own points, so a shared index is replaced by a shared function space.
- **Pipeline relation**: Not applicable; the data are microbiome measurements.
- **Application domain**: Other domain, longitudinal infant gut microbiome.
- **Theme tags**: T1-UNAL.
- **Theme**: Theme 1

#### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
- **Citation key**: [thual2022aligning]
- **Type**: Conference paper (NeurIPS 35).
- **Method**: Fused unbalanced GW (FUGW) between two cortical surfaces: functional features are matched while geodesic distances on each individual mesh penalize large distortions; unbalanced marginals let functional areas differ in size.
- **Key Findings**: FUGW performs whole-brain landmark-free alignment, works across different individual meshes, increases between-subject correlation of activity on independent data and gives sharper group templates than standard anatomical alignment.
- **Relevance**: The closest transport method to registration-free comparison of subjects: individual anatomy replaces the common mesh, though cortical surface reconstruction is still needed.
- **Quality**: High. Read: abstract, introduction, Section 2.1 and the experiment description (arXiv HTML full text). Cited 55 times in OpenAlex on 2026-11-19.
- **Potential Use**: Registration-free alignment; the unbalanced fused coupling.
- **Identifier**: DOI 10.52202/068431-1584; arXiv 2206.09398; https://doi.org/10.52202/068431-1584 (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction; input cortical meshes with functional maps (graphs).
- **Correspondence handling**: Transport coupling (fused unbalanced GW) between individual anatomies; a template is also estimated.
- **Pipeline relation**: Removes registration (no common template mesh); builds on cortical surface reconstruction.
- **Application domain**: Medical imaging (fMRI, brain cortex).
- **Theme tags**: T2f, T2b.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Tilwani et al. (2025). Benchmarking machine learning models in lesion-symptom mapping for predicting language outcomes in stroke survivors.
- **Citation key**: [tilwani2025benchmarking]
- **Identifier**: DOI 10.3389/fnimg.2025.1573816. Confirmed by a live lookup at https://doi.org/10.3389/fnimg.2025.1573816.
- **Type**: Journal article (Frontiers in Neuroimaging)
- **Method**: Nested cross-validation benchmarks five ML regressors on structural and functional MRI features across four atlas parcellations (JHU, AAL, BRO, AICHA) and five modalities, including lesion location, to predict language outcomes after stroke.
- **Key Findings**: In chronic-stage stroke survivors, aphasia severity (N = 238) and naming impairment (N = 191) were predicted best by the JHU atlas with lesion location and a Random Forest, with moderate to high correlations with the behavioral scores. Key regions included perisylvian areas and pathways of the language network.
- **Relevance**: It addresses P3 by measuring how the choice of atlas parcellation, a registration-dependent step, changes subject-level prediction.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 2, rigor 3, relevance 3, citations 2, data 2. OpenAlex counts 4 citations.
- **Potential Use**: Discussion and limitations (dependence of subject-level prediction on parcellation choice).
- **Stance**: Supports, the view that atlas choice and modality change the accuracy of outcome prediction from lesion data.
- **Prediction setting**: subject-level regression, input set of lesions or regions; the inputs are atlas-region features and lesion location, and the targets are each survivor's aphasia severity and naming scores.
- **Correspondence handling**: registration to a common space; the features are defined on atlas parcellations shared across subjects.
- **Pipeline relation**: builds on registration; builds on lesion segmentation; measures how a pipeline step fails; the parcellation scheme is varied and changes accuracy, and lesion location is one input modality whose delineation the abstract does not describe.
- **Application domain**: medical imaging, structural and functional MRI of the brain, chronic stroke with aphasia.
- **Theme tags**: `reg-analysis`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Tilwani 2025 LSM ML benchmark); merge screening reason: measures how atlas parcellation choice changes ML prediction of language outcomes after stroke

#### Tixier et al. (2019). Reliability of tumor segmentation in glioblastoma: Impact on the robustness of MRI-radiomic features.
- **Citation key**: [tixier2019reliability]
- **Identifier**: DOI 10.1002/mp.13624. Confirmed by a live lookup at https://doi.org/10.1002/mp.13624.
- **Type**: Journal article (Medical Physics)
- **Method**: FLAIR and contrast-enhanced T1-weighted MRI of 90 glioblastoma patients segmented by a semiautomatic algorithm and an interactive method with two raters, with robustness of 108 radiomic features from five categories measured by intraclass correlation and Bland-Altman analysis.
- **Key Findings**: Both segmentation methods were reliable (ICC of 0.96 or more, SD of mean differences between raters of 30 percent or less). Histogram and co-occurrence features were the most robust, GLSZM features had mixed robustness, and edge, shape and GLSZM features were the most affected by the segmentation method. The interactive method gave more robust features than the semiautomatic one.
- **Relevance**: It addresses P3 by measuring how segmentation variability changes MRI radiomic features.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 2. OpenAlex counts 51 citations. Small study (90 patients).
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics).
- **Stance**: Neutral.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study measures feature robustness.
- **Correspondence handling**: not applicable; features are computed within each tumour.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; it measures how segmentation method and rater change the features.
- **Application domain**: medical imaging, FLAIR and contrast-enhanced T1-weighted brain MRI, glioblastoma.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Tixier 2019); merge screening reason: effect of glioblastoma segmentation variability on MRI radiomic feature robustness (90 patients)

#### Togninalli et al. (2019). Wasserstein Weisfeiler-Lehman Graph Kernels.
- **Citation key**: [togninalli2019wasserstein]
- **Identifier**: arXiv 1906.01277. Confirmed by a live lookup at https://arxiv.org/abs/1906.01277.
- **Type**: Conference paper (Advances in Neural Information Processing Systems (NeurIPS))
- **Method**: A graph kernel built on the Wasserstein distance between the distributions of node feature vectors of two graphs, with a Weisfeiler-Lehman inspired embedding for graphs with continuous node attributes and weighted edges.
- **Key Findings**: The abstract states that most graph kernels aggregate substructures by a sum or average, which can discard information about the distribution of components. The proposed kernel improves the state-of-the-art prediction performance on several graph classification tasks. The abstract does not name the datasets.
- **Relevance**: It addresses P2: two graphs with different nodes are compared by a transport coupling between their node-feature distributions instead of by a node correspondence.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. The batch gives no OpenAlex citation count, so the citation item is scored at the median.
- **Potential Use**: Related work (supervised prediction with transport between sets of node features)
- **Stance**: Supports, that a transport distance between node-feature distributions improves on sum or average aggregation for graph classification.
- **Prediction setting**: other (graph-level classification), input graph; the kernel is used to classify whole graphs.
- **Correspondence handling**: transport coupling; the Wasserstein distance couples the node embeddings of two graphs without a fixed node correspondence.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline.
- **Application domain**: other domain, graph classification benchmarks (not named in the abstract).
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Togninalli 2019 WWL kernels); merge screening reason: Wasserstein distance between node-feature distributions for graph classification

#### Toosi, Shiri, Zaidi and Rahmim (2024). Segmentation-free outcome prediction from head and neck cancer PET/CT images: deep learning-based feature extraction from multi-angle maximum intensity projections (MA-MIPs).
- **Citation key**: [toosi2024segmentation]
- **Type**: Journal article (Cancers)
- **Identifier**: DOI 10.3390/cancers16142538, PMID 39061178, arXiv 2405.01756 (preprint of the same paper); confirmed at https://doi.org/10.3390/cancers16142538 (resolves to the MDPI page), the PubMed record and the arXiv API record.
- **Method**: An object detector trained on CT bounding boxes crops the head-and-neck region; maximum intensity projections of the cropped PET at 72 axial rotation angles are passed through a pretrained CNN; the 72 feature vectors are aggregated and fused for recurrence-free survival analysis of 489 patients (HECKTOR 2022).
- **Key Findings**: The approach outperformed the best performing method on the target dataset for recurrence-free survival. The authors state that removing manual delineation of tumours and lymph nodes removes the dependence on subjective interpretation.
- **Relevance**: It removes lesion segmentation and engineered features but keeps an anatomical crop from a detector, and pools a set of 72 view features per patient.
- **Quality**: Full text read (abstract, introduction contributions list, methods overview and object detection subsection headings) and abstract.
- **Potential Use**: Recent segmentation-free subject-level predictor; the view aggregation links to Theme 3.
- **Viewpoint**: supports segmentation-free prediction.
- **Prediction setting**: subject-level regression (recurrence-free survival); image on a grid (PET cropped by a CT-trained detector, rendered as 72 projections).
- **Correspondence handling**: not applicable in the cross-subject sense; each patient is cropped to its own head-and-neck box and the 72 view features are fused per patient.
- **Pipeline relation**: removes lesion segmentation; removes radiomic feature engineering.
- **Application domain**: medical imaging, FDG PET/CT, head and neck cancer.
- **Theme tags**: `step-removal`.
- **Theme**: Theme 4

#### Torres et al. (2021). End-to-End Non-Small-Cell Lung Cancer Prognostication Using Deep Learning Applied to Pretreatment Computed Tomography.
- **Citation key**: [torres2021end]
- **Identifier**: DOI 10.1200/cci.21.00096. Confirmed by a live lookup at https://doi.org/10.1200/cci.21.00096.
- **Type**: Journal article (JCO Clinical Cancer Informatics)
- **Method**: A fully automated imaging-based prognostication technique (IPRO) applies deep learning to pretreatment CT to predict 1-year, 2-year and 5-year mortality, evaluated by five-fold cross-validation on six public TCIA datasets and combined with TNM staging in an ensemble risk score.
- **Key Findings**: On 1689 patients, of whom 1110 had NSCLC with TNM staging, IPRO has prognostic power similar to TNM staging (C-index 0.72, 0.70 and 0.68 against 0.71, 0.71 and 0.70 at 1, 2 and 5 years). The ensemble of IPRO and TNM reaches C-indices of 0.77, 0.77 and 0.76. IPRO stratifies patients within TNM stages, with hazard ratios between highest and lowest risk quintiles of 8.60, 5.03, 3.18 and 1.91 in stages I to IV.
- **Relevance**: It addresses P1 and P3: a subject-level mortality risk is predicted from the CT by a fully automated network, without a hand-delineated tumour in the abstract's description.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 2, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 14 citations.
- **Potential Use**: Experimental baselines (end-to-end deep learning prognosis from CT)
- **Stance**: Supports, that deep learning on pretreatment CT adds prognostic information to TNM staging.
- **Prediction setting**: subject-level regression, input image on a grid; mortality risk per patient is predicted and evaluated by C-index.
- **Correspondence handling**: not applicable; the abstract describes a network applied to each CT and says nothing about alignment across patients.
- **Pipeline relation**: removes lesion segmentation; the abstract calls the technique fully automated and describes no manual tumour delineation, though it does not state whether an automated segmentation step is inside.
- **Application domain**: medical imaging, chest CT, lung cancer.
- **Theme tags**: `step-removal`.
- **Theme**: added: handed on by Theme 4 (Torres 2021); merge screening reason: end-to-end lung cancer prognosis from pretreatment CT without manual tumour segmentation (1,689 patients)

#### Tosun et al. (2015). Detection of malignant mesothelioma using nuclear structure of mesothelial cells in effusion cytology specimens.
- **Citation key**: [tosun2015detection]
- **Identifier**: DOI 10.1002/cyto.a.22602. Confirmed by a live lookup at https://doi.org/10.1002/cyto.a.22602.
- **Type**: Journal article (Cytometry Part A)
- **Method**: The chromatin distribution of each segmented nucleus is quantified by the optimal transport-based linear embedding combined with modified Fisher discriminant analysis, and each patient's set of nuclei is classified as benign or malignant by k-nearest neighbours and voting.
- **Key Findings**: On 34 human cases the method gave 100 percent accurate predictions under blind cross-validation. It significantly outperformed standard numerical feature methods in agreement with the clinical gold standard. The authors conclude that nuclear structure alone may separate malignant mesothelioma from benign proliferations.
- **Relevance**: A patient-level classification from a set of nuclei per patient, each embedded by transport, an early case of transport-based subject-level prediction (P1, P2).
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 1, relevance 3, citations 2, data 1. OpenAlex counts 40 citations. Small study (34 cases).
- **Potential Use**: Related work (transport embeddings for subject-level prediction in medical imaging).
- **Stance**: Supports, that transport-based embeddings of nuclei separate malignant from benign cases better than standard features.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each patient's set of segmented nuclei receives a benign or malignant label by voting.
- **Correspondence handling**: transport coupling; the paper uses the optimal transport-based linear embedding, which places each nucleus against a reference by transport, and the abstract does not name the reference.
- **Pipeline relation**: removes radiomic feature engineering / builds on lesion segmentation; the transport embedding replaces standard numerical features, and the nuclei are segmented first.
- **Application domain**: medical imaging, digital cytology of pleural effusion specimens (mesothelial cells).
- **Theme tags**: T2e.
- **Theme**: added: merge intersection or gap search; screening note: OT linear embedding of nuclei sets per patient, mesothelioma; small (34 cases)

#### Tran et al. (2025). Comparing Handcrafted Radiomics Versus Latent Deep Learning Features of Admission Head CT for Hemorrhagic Stroke Outcome Prediction.
- **Citation key**: [tran2025comparing]
- **Identifier**: DOI 10.3390/biotech14040087. Confirmed by a live lookup at https://doi.org/10.3390/biotech14040087.
- **Type**: Journal article (BioTech)
- **Method**: Hematoma segmentation by multiscale U-shaped models, then radiomics from the segmented lesions and two latent deep feature sets (from the segmentation encoder and from a generative autoencoder on dilated lesion patches), reduced by non-negative matrix factorization and fed to six classifiers for 3-month outcome and hematoma expansion, trained on a multicenter trial cohort (n = 866) and externally validated on a single-center dataset (n = 645).
- **Key Findings**: Adding latent deep features to radiomics numerically increased prediction performance for 3-month outcomes and hematoma expansion with Random Forest, XGBoost, Extra Trees or Elastic Net. The improvement reached statistical significance only for expansion above 3 mL. The authors describe the gains as consistent but modest.
- **Relevance**: It addresses P3 by comparing handcrafted radiomics with learned features of the same segmented lesions for a subject-level outcome.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 2, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 9 citations.
- **Potential Use**: Experimental baselines (radiomics against learned lesion features).
- **Stance**: Supports, adding latent deep features to radiomics for outcome prediction.
- **Prediction setting**: subject-level classification, input image on a grid; 3-month outcome and hematoma expansion thresholds are predicted per patient from the segmented hematoma.
- **Correspondence handling**: not applicable; features are computed within each patient's hematoma.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation; both feature types are extracted from the automatically segmented hematoma.
- **Application domain**: medical imaging, non-contrast head CT, intracerebral hemorrhage.
- **Theme tags**: `radiomics`, `lesion-seg`.
- **Theme**: added: handed on by Theme 4 (Tran 2025); merge screening reason: handcrafted radiomics against latent deep features of segmented hematomas for ICH outcome (866 and 645 patients)

#### Tu et al. (2020). Computing Univariate Neurodegenerative Biomarkers with Volumetric Optimal Transportation: A Pilot Study.
- **Citation key**: [tu2020computing]
- **Identifier**: DOI 10.1007/s12021-020-09459-7; PMID 32253701. Confirmed by a live lookup at https://doi.org/10.1007/s12021-020-09459-7.
- **Type**: Journal article (Neuroinformatics)
- **Method**: A variational framework solved with Newton's method computes optimal transport from each structural MRI volume to a template, and the Wasserstein distance to the template is used as a univariate index (Wasserstein Index).
- **Key Findings**: On 314 ADNI subjects (140 amyloid-positive AD and 174 amyloid-negative controls), the abstract reports preliminary evidence that the index correlates with MMSE, identifies group differences and classifies well. It outperformed hippocampal volume and entorhinal cortex thickness, and the authors describe the work as a pilot.
- **Relevance**: It addresses P1 and P2 with a transport distance to a template as a subject-level biomarker for classification.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 6 citations.
- **Potential Use**: Related work (transport-based prediction in medical imaging).
- **Stance**: Supports, a Wasserstein distance to a template as a univariate neurodegeneration biomarker.
- **Prediction setting**: subject-level classification, input image on a grid; each subject's MRI volume gives one index used to classify AD against controls.
- **Correspondence handling**: transport coupling; the reference is a template, and the abstract does not state whether it is fixed or estimated from the data.
- **Pipeline relation**: not applicable; the abstract does not state whether the volumes are registered or segmented before the transport to the template.
- **Application domain**: medical imaging, structural MRI of the brain, Alzheimer's disease.
- **Theme tags**: T2f.
- **Theme**: added: merge intersection or gap search; screening note: volumetric OT univariate biomarker; pilot, small

#### Vanchhay et al. (2026). With foundation-model features, aggregator complexity does not improve cross-hospital discrimination in gastric whole-slide image classification.
- **Citation key**: [vanchhay2026foundation]
- **Identifier**: arXiv 2610.41328. Confirmed by a live lookup at https://arxiv.org/abs/2610.41328.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: Leave-one-hospital-out comparison of multiple-instance learning aggregators on frozen pathology foundation-model features of 5,036 haematoxylin-and-eosin gastric slides from five Korean hospitals, including a hierarchical patch-region-slide graph aggregator (CHIME-MIL) with label-free site alignment and two-scale fusion.
- **Key Findings**: CHIME-MIL reached a mean AUC of 0.837, above six conventional attention and transformer aggregators trained without alignment and fusion, but under a matched recipe it did not exceed attention-based pooling, and global max pooling with the same alignment and fusion was better (AUC 0.855, P = 0.0002). The alignment, which subtracts each hospital's mean feature vector, onboarded a new hospital from ten unlabelled slides at a cost of 0.002 AUC, and its accuracy gains were small and inconsistent. The model had low top-label calibration error (0.053) with under-confident malignancy probabilities.
- **Relevance**: It addresses P1 and P2 by measuring how much the choice of permutation-invariant aggregator matters for slide-level prediction under hospital shift.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 3, relevance 2, citations 1, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Experimental baselines (attention and max pooling aggregators) and Discussion and limitations (aggregator complexity under site shift).
- **Stance**: Opposes, the view that more complex MIL aggregators improve cross-hospital discrimination on foundation-model features.
- **Prediction setting**: other (slide-level malignancy classification), input distribution or set of vectors; each slide is a bag of frozen patch features, with a graph over patches and regions in CHIME-MIL.
- **Correspondence handling**: permutation invariance; all compared aggregators, attention, transformer, graph and max pooling, produce a slide output that does not depend on patch order.
- **Pipeline relation**: not applicable; the study compares aggregators and a site alignment step, none of which is registration, radiomics or lesion segmentation.
- **Application domain**: medical imaging, histopathology whole-slide images of the stomach.
- **Theme tags**: T3c, T3e.
- **Theme**: added: handed on by Theme 3 (gastric WSI aggregator complexity); merge screening reason: leave-one-hospital-out comparison of MIL aggregators on 5,036 gastric slides with label-free site alignment (preprint)

#### van Griethuysen, Fedorov, Parmar, Hosny, Aucoin, Narayan, Beets-Tan, Fillion-Robin, Pieper and Aerts (2017). Computational radiomics system to decode the radiographic phenotype.
- **Citation key**: [vangriethuysen2017computational]
- **Type**: Journal article (Cancer Research)
- **Identifier**: DOI 10.1158/0008-5472.CAN-17-0339, PMID 29092951; confirmed at https://doi.org/10.1158/0008-5472.CAN-17-0339 (resolves to the AACR landing page, which answered 403 to the automated request after the redirect) and the PubMed record.
- **Method**: Describes PyRadiomics, an open-source platform in Python for extracting engineered features from medical images, usable standalone or in 3D Slicer, demonstrated on lung lesions.
- **Key Findings**: The abstract states that the lack of standardized algorithm definitions and image processing hampers reproducibility and comparability of radiomic results, and offers the platform as a reference standard.
- **Relevance**: It is the feature-extraction implementation used by much later radiomics work, and it was cited by 5 of the 12 core papers whose reference lists were read in backward chaining.
- **Quality**: Abstract read. A software paper.
- **Potential Use**: The radiomics step in practice.
- **Viewpoint**: neutral.
- **Prediction setting**: other (feature-extraction software, no prediction); image on a grid within a segmented lesion.
- **Correspondence handling**: not applicable; features are computed per region.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation (features are computed inside a mask).
- **Application domain**: medical imaging, lung lesions in the demonstration.
- **Theme tags**: `radiomics`.
- **Theme**: Theme 4

#### Vayer et al. (2019). Optimal Transport for structured data with application on graphs.
- **Citation key**: [vayer2019optimal]
- **Type**: Conference paper (ICML, PMLR 97).
- **Method**: Fused Gromov-Wasserstein (FGW), a transport distance on node features and graph structure together, solved by conditional gradient.
- **Key Findings**: On graph classification the FGW distance outperforms graph kernels and graph convolutional networks; FGW barycenters of graphs are used for clustering. The paper states that FGW is unsupervised and can be used in nearest-neighbour, distance-substitution kernel or embedding methods.
- **Relevance**: The distance behind template layers, graph dictionaries and the brain alignment methods of the theme.
- **Quality**: High. Read: abstract, method and experiment sections (arXiv HTML full text). Cited 231 times in OpenAlex on 2026-11-19.
- **Potential Use**: Definition of FGW; graph-level prediction with a transport kernel.
- **Identifier**: arXiv 1805.09114; https://proceedings.mlr.press/v97/titouan19a.html (confirmed).
- **Prediction setting**: Subject-level classification (one label per graph), input graphs with node features, through a kernel on FGW distances.
- **Correspondence handling**: Transport coupling between the nodes of each pair of graphs.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (molecular and benchmark graphs).
- **Theme tags**: T2b, T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Vincent-Cuaz et al. (2021). Online Graph Dictionary Learning.
- **Citation key**: [vincentcuaz2021online]
- **Type**: Conference paper (ICML, PMLR 139).
- **Method**: Graphs modelled as convex combinations of graph atoms under a GW data-fitting term, learned online; extended to labelled graphs with FGW.
- **Key Findings**: The method works on "unregistered graphs with potentially different number of nodes" and gives an upper bound that approximates GW in the embedding space. The embedding defines a kernel used for clustering and classification of graph datasets.
- **Relevance**: A dictionary of GW templates whose weights are a subject-level code for unaligned graphs.
- **Quality**: High. Read: abstract, introduction and experiment passages (arXiv HTML full text). Cited 28 times in OpenAlex on 2026-11-19.
- **Potential Use**: Unsupervised templates; embedding for downstream classification.
- **Identifier**: arXiv 2102.06555; https://proceedings.mlr.press/v139/vincent-cuaz21a.html (confirmed).
- **Prediction setting**: Representation or comparison only, no prediction in the learning objective; a downstream classification of graphs uses the embedding; input graphs.
- **Correspondence handling**: Learned template or barycenter, learned without labels.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (benchmark graph datasets).
- **Theme tags**: T2d, T2b.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Citation key**: [vincentcuaz2022template]
- **Type**: Conference paper (NeurIPS 35).
- **Method**: A graph neural network layer that outputs the vector of FGW distances from the input graph to a set of template graphs; the templates are learned end-to-end with the classifier.
- **Key Findings**: The method is competitive with or better than kernel and GNN baselines on graph classification. An ablation with templates fixed by sampling from the dataset shows that "learning the templates is essential" to keep the number of templates small with good accuracy. Each FGW iteration costs O(n^2 m + m^2 n) for graphs of n and m nodes.
- **Relevance**: The clearest case of templates learned for a supervised loss: correspondence is handled by transport to learned templates, and the result is a fixed-length subject representation.
- **Quality**: High. Read: abstract, Sections 2 and 3 and the appendix on fixed templates (arXiv HTML full text). Cited 28 times in OpenAlex on 2026-11-19.
- **Potential Use**: Learned-template prediction; the model a registration-free imaging method would extend.
- **Identifier**: DOI 10.52202/068431-0857; arXiv 2205.15733; https://doi.org/10.52202/068431-0857 (confirmed); https://proceedings.neurips.cc/paper_files/paper/2022/hash/4d3525bc60ba1adc72336c0392d3d902-Abstract-Conference.html (confirmed).
- **Prediction setting**: Subject-level classification, input graphs with node features; one label per graph from distances to templates.
- **Correspondence handling**: Learned template or barycenter, learned for the supervised loss, with a transport coupling to each template.
- **Pipeline relation**: Not applicable; no imaging pipeline.
- **Application domain**: Other domain (molecular, social and synthetic graphs).
- **Theme tags**: T2d, T2e, T2b.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Vinyals et al. (2016). Order Matters: Sequence to sequence for sets.
- **Citation key**: [vinyals2016order]
- **Identifier**: arXiv 1511.06391. Confirmed by a live lookup at https://arxiv.org/abs/1511.06391.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: An extension of the sequence-to-sequence framework that handles input sets, and a loss that searches over possible output orders during training.
- **Key Findings**: The abstract states that the order in which input and output data are organized significantly affects learning. It reports empirical evidence on language modeling, parsing, sorting numbers and estimating the joint probability of unknown graphical models; it gives no numbers.
- **Relevance**: It bears on P2 by showing that an order imposed on a set changes what a model learns, which motivates order-invariant set encoders.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 1078 citations.
- **Potential Use**: Related work (set encoders and their theory).
- **Stance**: Supports, handling inputs as sets instead of imposing an arbitrary order.
- **Prediction setting**: other (set-input tasks such as sorting, language modeling and parsing), input distribution or set of vectors; no subject-level outcome is predicted.
- **Correspondence handling**: permutation invariance; the extended model is built to handle input sets without a fixed element order, and the abstract does not use the term permutation invariance.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, language modeling, parsing and artificial tasks.
- **Theme tags**: T3a, T3e.
- **Theme**: added: handed on by Theme 3 (Vinyals 2016 order matters); merge screening reason: read-process-write set encoder showing that input order matters (seminal, ICLR 2016)

#### Vosylius et al. (2020). Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface.
- **Citation key**: [vosylius2020geometric]
- **Identifier**: DOI 10.1007/978-3-030-60365-6_17; arXiv 2008.06098. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-60365-6_17.
- **Type**: Workshop paper (Uncertainty for Safe Utilization of Machine Learning in Medical Imaging, and Graphs in Biomedical Image Analysis)
- **Method**: MeshCNN, PointNet++, GraphCNN and a volumetric benchmark predict post-menstrual age at scan from different geometric representations of the neonatal white matter cortical surface.
- **Key Findings**: On 650 subjects (727 scans) of the Developing Human Connectome Project with post-menstrual ages from 27 to 45 weeks, the abstract reports a mean prediction error of less than one week. The abstract does not state which representation performed best.
- **Relevance**: It addresses P1 by comparing mesh, point cloud, graph and volumetric networks for one subject-level regression on the same subjects.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 21 citations.
- **Potential Use**: Experimental baselines (mesh, point-cloud and graph networks for subject-level regression).
- **Stance**: Neutral.
- **Prediction setting**: subject-level regression, input mesh or surface; the target is each neonate's post-menstrual age, and the surface is also given as a point cloud and a graph.
- **Correspondence handling**: permutation invariance; the compared networks take each subject's surface as its own mesh, point cloud or graph, and the abstract does not state a registration of surfaces across subjects.
- **Pipeline relation**: not applicable; the abstract does not state the registration or segmentation steps that produce the surfaces.
- **Application domain**: medical imaging, neonatal brain (white matter cortical surface from the Developing Human Connectome Project); the abstract does not name the modality.
- **Theme tags**: T3d, T3b.
- **Theme**: added: handed on by Theme 3 (GDL post-menstrual age); merge screening reason: compares mesh, point cloud, graph and volumetric networks for neonatal age on the same 650 subjects (preprint)

#### Wagstaff et al. (2019). On the Limitations of Representing Functions on Sets.
- **Citation key**: [wagstaff2019limitations]
- **Type**: Conference paper (ICML 2019, PMLR 97). Foundational work named for the theme.
- **Identifier**: arXiv 1901.09006; https://proceedings.mlr.press/v97/wagstaff19a.html (proceedings page read).
- **Method**: theory of sum-decomposition with continuous mappings.
- **Key Findings**: The conjecture that the latent dimension of sum-decomposition can stay fixed as set size grows rests on highly discontinuous mappings. With continuous mappings, as given by neural networks or Gaussian processes, universal representation requires a latent dimension at least the maximum number of input elements.
- **Relevance**: it ties the width of a sum-pooled encoder to the largest set size, which matters for point clouds and lesion sets of varying size.
- **Prediction setting**: representation or comparison only, no prediction; input is a set.
- **Correspondence handling**: permutation invariance (sum pooling).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (theory).
- **Theme tags**: T3e, T3a.
- **Quality**: abstract read on the PMLR page. Peer-reviewed; OpenAlex cited_by_count of the arXiv record 210; 52 citing papers of 2024 or later found by Semantic Scholar. Quick assessment 13 of 15.
- **Viewpoint**: opposes fixed-width sum pooling.
- **Potential Use**: expressivity limits and set-size dependence.
- **Theme**: Theme 3

#### Wagstaff et al. (2022). Universal Approximation of Functions on Sets.
- **Citation key**: [wagstaff2022universal]
- **Identifier**: arXiv 2107.01959. Confirmed by a live lookup at https://arxiv.org/abs/2107.01959.
- **Type**: Journal article (Journal of Machine Learning Research)
- **Method**: A theoretical analysis of the universal approximation property of Deep Sets as a function of the latent dimension, placed within the Janossy pooling paradigm.
- **Key Findings**: Universal approximation by Deep Sets is guaranteed only if the latent space is sufficiently high-dimensional. If the latent space is even one dimension lower than necessary, there exist piecewise-affine functions for which Deep Sets performs no better than a constant baseline in worst-case error. The paper identifies Janossy pooling as encompassing most popular set-learning methods and lists open questions on its universality.
- **Relevance**: It addresses P2 for permutation-invariant encoders by stating when sum-pooled set models can and cannot represent a set function.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 1. OpenAlex counts 90 citations.
- **Potential Use**: Method background (limits of set encoders) and Discussion and limitations.
- **Stance**: Opposes, the reading of Deep Sets as universal regardless of latent width.
- **Prediction setting**: representation or comparison only, no prediction, input distribution or set of vectors; the paper is a theoretical analysis of set functions.
- **Correspondence handling**: permutation invariance; Deep Sets and Janossy pooling are invariant to the order of set elements.
- **Pipeline relation**: not applicable; the paper is theory.
- **Application domain**: other domain, machine learning theory.
- **Theme tags**: T3a, T3e.
- **Theme**: added: handed on by Theme 3 (Wagstaff 2022 universal approximation sets); merge screening reason: universal approximation of set functions and Janossy pooling (journal extension of wagstaff2019limitations)

#### Wang et al. (2013). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Citation key**: [wang2013linear]
- **Identifier**: DOI 10.1007/s11263-012-0566-z, PMID 23729991. Confirmed by a live lookup at https://doi.org/10.1007/s11263-012-0566-z.
- **Type**: Journal article (International Journal of Computer Vision)
- **Method**: Linear optimal transportation (LOT), a distance between images based on a linearized version of the Kantorovich-Wasserstein metric applied to pixel intensities treated as mass, which also gives an isometric linear embedding of the images.
- **Key Findings**: The framework computes all pairwise distances of a large image database efficiently and can be used for pattern recognition in sets of images. The linear embedding allows visualization of discriminant information between classes of images. It is applied to nuclear chromatin patterns in cancer cells, facial expressions, galaxy morphologies and subcellular protein distributions.
- **Relevance**: It is the transport embedding that later fixed-reference and transport-based morphometry methods build on, relevant to P2 as a way to compare images through transport.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 273 citations.
- **Potential Use**: Method background (linearized optimal transport embedding).
- **Stance**: Supports, the use of a linearized transport embedding to compare and classify sets of images.
- **Prediction setting**: other (classification and discrimination of image classes in pattern recognition tasks), input image on a grid; each image is treated as a distribution of mass over its pixels.
- **Correspondence handling**: transport coupling; images are compared through a linearized optimal transport distance, which the screening note describes as an embedding relative to a reference, and the abstract does not name the reference.
- **Pipeline relation**: not applicable; the method works on pixel intensities of microscopy, face and astronomy images outside a radiology pipeline.
- **Application domain**: other domain, cell microscopy, face images and galaxy images.
- **Theme tags**: T2e.
- **Theme**: added: handed on by Theme 2 (Wang 2013 LOT framework); merge screening reason: linear optimal transport embedding of a set of images relative to a reference, for pattern recognition across images

#### Wang et al. (2018). Revisiting multiple instance neural networks.
- **Citation key**: [wang2018revisiting]
- **Identifier**: DOI 10.1016/j.patcog.2017.08.026; arXiv 1610.02501. Confirmed by a live lookup at https://doi.org/10.1016/j.patcog.2017.08.026.
- **Type**: Journal article (Pattern Recognition)
- **Method**: Multiple instance neural networks that take bags with varying numbers of instances and output bag labels end to end, including a new MI-Net that learns bag representations, with deep supervision and residual connections studied.
- **Key Findings**: The abstract reports state-of-the-art or competitive performance on several MIL benchmarks and finds deep supervision and residual connections effective. It reports that prediction takes 0.0003 s per bag and training a few seconds on a moderate CPU.
- **Relevance**: It bears on P2 with bag-level learning over unordered instance sets, the MIL form of a subject described by a set.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 584 citations.
- **Potential Use**: Related work (multiple-instance learning).
- **Stance**: Supports, neural networks that learn bag representations for MIL.
- **Prediction setting**: other (bag-level classification), input distribution or set of vectors; each label belongs to a bag, and the abstract names no subjects.
- **Correspondence handling**: permutation invariance; bags of varying size are pooled into bag representations without matching instances across bags, and the abstract does not use the term permutation invariance.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, MIL benchmarks.
- **Theme tags**: T3c.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Wang et al. (2019). Dynamic Graph CNN for Learning on Point Clouds.
- **Citation key**: [wang2019dynamic]
- **Type**: Journal article (ACM Transactions on Graphics 38(5)).
- **Identifier**: DOI 10.1145/3326362 (resolved at https://doi.org/10.1145/3326362); arXiv 1801.07829.
- **Method**: EdgeConv, a module acting on k-nearest-neighbour graphs recomputed at each layer.
- **Key Findings**: EdgeConv uses local neighbourhood information and can be stacked to learn global shape properties. Affinity in feature space captures semantic relations over long distances in the input. Results are reported on ModelNet40, ShapeNetPart and S3DIS.
- **Relevance**: it builds a graph among the points of one cloud, so it adds within-set structure while keeping permutation invariance across clouds.
- **Prediction setting**: other, object-level classification and segmentation from a point cloud.
- **Correspondence handling**: permutation invariance; the graph is built within each cloud, so no cross-subject correspondence is used.
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (3D objects and scenes).
- **Theme tags**: T3b.
- **Quality**: abstract read on the arXiv record. Peer-reviewed journal; OpenAlex cited_by_count 9034. Quick assessment 14 of 15.
- **Viewpoint**: supports.
- **Potential Use**: point-cloud encoders with local graphs.
- **Theme**: Theme 3

#### Wang et al. (2020). Hierarchical Attention-Based Multiple Instance Learning Network for Patient-Level Lung Cancer Diagnosis.
- **Citation key**: [wang2020hierarchical]
- **Identifier**: DOI 10.1109/bibm49941.2020.9313417. Confirmed by a live lookup at https://doi.org/10.1109/bibm49941.2020.9313417.
- **Type**: Conference paper (2020 IEEE International Conference on Bioinformatics and Biomedicine (BIBM))
- **Method**: A hierarchical attention-based multiple instance learning network aggregates attribute representations into nodule representations and nodule representations into a patient-level lung cancer representation with two cascaded attention mechanisms.
- **Key Findings**: On LIDC-IDRI, the abstract reports that HA-MIL performed significantly better than higher-order transfer learning, instance-space MIL and embedding-space MIL. It reports that higher attention weights identified key nodules and attributes; it gives no numbers.
- **Relevance**: It is a direct case of P1 and P2: a patient-level diagnosis from a set of nodules aggregated by attention, which is invariant to the order of nodules.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 10 citations.
- **Potential Use**: Related work (set encoders on sets of lesions).
- **Stance**: Supports, attention-based MIL over nodules for patient-level diagnosis.
- **Prediction setting**: subject-level classification, input set of lesions or regions; the label is the patient's lung cancer diagnosis and the instances are the patient's nodules with their attributes.
- **Correspondence handling**: permutation invariance; attention pooling over nodules needs no matching of nodules across patients.
- **Pipeline relation**: builds on lesion segmentation; the instances are nodules, so the nodules must be located first, and the abstract does not state whether they come from annotations or a detector.
- **Application domain**: medical imaging, lung imaging from the LIDC-IDRI database; the abstract does not name the modality.
- **Theme tags**: T3c, T3d.
- **Theme**: added: handed on by Theme 3 (hierarchical MIL lung cancer BIBM); merge screening reason: two-level attention MIL over nodules and attributes for patient-level lung cancer diagnosis

#### Wang et al. (2023). BInGo: Bayesian Intrinsic Groupwise Registration via Explicit Hierarchical Disentanglement.
- **Citation key**: [wang2023bingo]
- **Identifier**: DOI 10.1007/978-3-031-34048-2_25; arXiv 2206.02377. Confirmed by a live lookup at https://doi.org/10.1007/978-3-031-34048-2_25.
- **Type**: Conference paper (Information Processing in Medical Imaging, IPMI 2023, Lecture Notes in Computer Science)
- **Method**: An unsupervised hierarchical Bayesian framework for multimodal groupwise registration, in which a variational auto-encoder with a new posterior disentangles structural representations from spatial transformations and models each image as a common structure with shape transition and appearance variation.
- **Key Findings**: BInGo is trained on small groups and tested on large-scale groupwise registration, which reduces the computational cost. Compared with five iterative or deep-learning methods on BraTS, MS-CMR of the heart and Learn2Reg abdomen MR-CT, it is more accurate and more efficient, including groups of over 1300 2D images from MS-CMR.
- **Relevance**: A groupwise registration method that estimates the common structure of a group of images, the registration route to the missing correspondence (P2), with no prediction of an outcome.
- **Quality**: Abstract read (Springer chapter page). Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 1, data 3. OpenAlex counts 8 citations.
- **Potential Use**: Related work (registration and templates); Method background (groupwise registration with a learned common structure).
- **Stance**: Supports, that a disentangled common structure makes multimodal groupwise registration scale to large groups.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the output is a set of spatial transformations to a common structure.
- **Correspondence handling**: registration to a common space; the groupwise registration aligns every image of the group to the common structure, which the model estimates from the data.
- **Pipeline relation**: builds on registration; the method is itself a registration step, evaluated against other registration methods.
- **Application domain**: medical imaging, brain MRI (BraTS), cardiac MRI (MS-CMR) and abdominal MR-CT (Learn2Reg).
- **Theme tags**: `reg-template`.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: unsupervised groupwise registration that estimates a common structure (arXiv 2206.02377)

#### Wang and Fan (2024). Graph Classification via Reference Distribution Learning: Theory and Practice.
- **Citation key**: [wang2024graph]
- **Identifier**: DOI 10.52202/079017-4374, arXiv 2408.11370. Confirmed by a live lookup at https://doi.org/10.52202/079017-4374.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 37)
- **Method**: Graph Reference Distribution Learning (GRDL) treats the GNN node embeddings of each graph as a discrete distribution and classifies it by maximum mean discrepancy to adaptively learned reference distributions, without global pooling.
- **Key Findings**: The paper derives generalization error bounds for GRDL and verifies them numerically, and both theory and experiments show stronger generalization than GNNs with global pooling. On moderate-scale and large-scale graph datasets GRDL is reported superior to the state of the art and at least 10 times faster in training and inference.
- **Relevance**: It addresses P2 with learned references that stand in for a pooling step, a mechanism that could compare sets of regions without a shared index.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 21 citations.
- **Potential Use**: Related work (learned templates and reference distributions for set and graph classification).
- **Stance**: Supports, classification against learned reference distributions in place of global pooling.
- **Prediction setting**: other (graph-level classification), input graph; each graph receives one label from its node-embedding distribution.
- **Correspondence handling**: learned template or barycenter; the paper calls them reference distributions, and they fall under this category because they are learned from the data and every graph is compared to them by maximum mean discrepancy.
- **Pipeline relation**: not applicable; the abstract reports graph benchmarks outside imaging.
- **Application domain**: other domain, graph classification benchmarks (the abstract does not name them).
- **Theme tags**: T2d.
- **Theme**: added: handed on by Theme 2 (Wang Fan 2024 reference distribution graph); merge screening reason: graph classification by MMD to learned reference distributions over node embeddings

#### Wang et al. (2024). Polynomial Width is Sufficient for Set Representation with High-dimensional Features.
- **Citation key**: [wang2024polynomial]
- **Type**: Conference paper (ICLR 2024).
- **Identifier**: arXiv 2307.04001; https://proceedings.iclr.cc/paper_files/paper/2024/hash/e55b33430e344a1ee23710415b1c9d87-Abstract-Conference.html (proceedings page read).
- **Method**: theory of the latent dimension L of Deep Sets with D-dimensional elements and sets of size N.
- **Key Findings**: With a linear plus power activation or a linear plus exponential element embedding, a latent dimension polynomial in N and D is sufficient for set representation. A lower bound on L is given for the power embedding. Earlier analyses treated features as one-dimensional or gave L exponential in N and D.
- **Relevance**: it bounds the width a sum-pooled set encoder needs as the set size grows, which sets the cost of using one on large point clouds or lesion sets.
- **Prediction setting**: representation or comparison only, no prediction; input is a set of D-dimensional vectors.
- **Correspondence handling**: permutation invariance (sum pooling).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (theory).
- **Theme tags**: T3a, T3e.
- **Quality**: abstract and section list read from the arXiv HTML full text. Peer-reviewed proceedings; OpenAlex cited_by_count of the arXiv record 5. Quick assessment 11 of 15.
- **Viewpoint**: supports sum pooling at polynomial width, a counterpoint to `wagstaff2019limitations`.
- **Potential Use**: set-size dependence of the latent dimension.
- **Theme**: Theme 3

#### Wang et al. (2025). Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data.
- **Citation key**: [wang2025linearized]
- **Type**: Preprint (arXiv).
- **Method**: LOT embedding of each patient's single-cell point cloud against a fixed reference, followed by an SVM and spectral co-clustering; LOT barycenters for synthetic profiles.
- **Key Findings**: On single-cell immune profiling of 150 individuals the LOT embedding classifies COVID-19 patient states, with classifier weights that map back to markers and regions; the paper states that the embedding "forms a registration between any two patients".
- **Relevance**: Patient-level classification from unaligned point clouds through a fixed transport reference, in the most recent set.
- **Quality**: Medium (preprint). Read: abstract, Sections 2 and 3 headings and passages (arXiv HTML full text). Cited 1 times in OpenAlex on 2026-11-19.
- **Potential Use**: Recent subject-level prediction with transport embeddings.
- **Identifier**: arXiv 2510.22033; https://arxiv.org/abs/2510.22033 (arXiv record confirmed). Preprint.
- **Prediction setting**: Subject-level classification, input point cloud (cells of a patient).
- **Correspondence handling**: Learned template or barycenter in the sense of a fixed reference; transport maps give the correspondence.
- **Pipeline relation**: Not applicable; cytometry, not imaging.
- **Application domain**: Other domain (single-cell immunology).
- **Theme tags**: T2e.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Wang et al. (2026). Segmentation influence on the generalizability of the overall survival models in CT-based oropharyngeal carcinoma patients.
- **Citation key**: [wang2026segmentation]
- **Identifier**: DOI 10.1002/pro6.70056. Confirmed by a live lookup at https://doi.org/10.1002/pro6.70056.
- **Type**: Journal article (Precision Radiation Oncology)
- **Method**: CT of 1017 oropharyngeal carcinoma patients from three institutions, with simulated perturbations of gross tumour volume segmentation, radiomic features from original and Laplacian of Gaussian filtered images, repeatability by intraclass correlation, and overall survival models built from features above increasing repeatability thresholds.
- **Key Findings**: Adding features with ICC between 0.7 and 0.8 improved the AUC of the two-year and three-year survival models in external validation. With an ICC threshold of 0.7, the model trained on high-repeatability features performed significantly better than the one trained on low-repeatability features in all cohorts. The authors conclude that selecting features with ICC above 0.7 improves generalizability.
- **Relevance**: It addresses P3 by measuring how segmentation variability affects radiomic features and the generalizability of a subject-level survival model.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (segmentation dependence of radiomics).
- **Stance**: Supports, repeatability-based feature selection under segmentation variability.
- **Prediction setting**: subject-level classification, input image on a grid; two-year and three-year overall survival are predicted per patient and scored by AUC.
- **Correspondence handling**: not applicable; features are computed within each patient's tumour volume.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation, measures how a pipeline step fails; it perturbs the tumour segmentation and measures the effect on features and models.
- **Application domain**: medical imaging, CT of oropharyngeal carcinoma.
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Welch et al. (2019). Vulnerabilities of radiomic signature development: The need for safeguards.
- **Citation key**: [welch2019vulnerabilities]
- **Identifier**: DOI 10.1016/j.radonc.2018.10.027. Confirmed by a live lookup at https://doi.org/10.1016/j.radonc.2018.10.027.
- **Type**: Journal article (Radiotherapy and Oncology)
- **Method**: A radiomic signature (MW2018) is fitted and externally validated on lung and head and neck cancer datasets using gross-tumour-volume contours, and compared with features from images with randomly permuted voxel values and with tumour volume alone.
- **Key Findings**: MW2018 had an external validation c-index of 0.64, and features from images with randomized intensities gave c-index 0.64 and 0.60 for head and neck and lung. Tumour volume alone had c-index 0.64 and correlated strongly with three of the four model features, so the signature was a surrogate for tumour volume. The abstract does not state the number of patients.
- **Relevance**: It addresses P3 by showing that a radiomic signature can carry no information beyond the volume of the lesion segmentation.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 2. OpenAlex counts 368 citations.
- **Potential Use**: Discussion and limitations (failure of radiomic signatures and negative controls).
- **Stance**: Opposes, the claim that the tested radiomic signature captures texture information beyond tumour volume.
- **Prediction setting**: subject-level regression, input image on a grid; the signature predicts each patient's survival, scored by the concordance index.
- **Correspondence handling**: not applicable; features are computed per tumour contour and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; builds on lesion segmentation; measures how a pipeline step fails; the radiomic signature is tested against randomized images and contour volume.
- **Application domain**: medical imaging, lung and head and neck cancer images with gross-tumour-volume contours; the abstract does not name the modality.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Whybra et al. (2024). The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights.
- **Citation key**: [whybra2024image]
- **Identifier**: DOI 10.1148/radiol.231319. Confirmed by a live lookup at https://doi.org/10.1148/radiol.231319.
- **Type**: Journal article (Radiology)
- **Method**: A three-phase multi-team study (September 2020 to December 2022) to standardize convolutional filters for radiomics: reference filtered images from digital phantoms, reference feature values from a chest CT image, and validation of reproducibility on a public multimodal dataset of 51 patients with soft-tissue sarcoma.
- **Key Findings**: Fifteen teams established 33 reference filtered images of 36 filter configurations, and 11 teams derived reference values for 323 of 396 features; reference values for Riesz transformations were not established. At validation, 458 of 486 features from nine configurations and three modalities were reproducible across nine teams, with lower bounds of 95 percent CIs of intraclass correlation above 0.75. Eight filter types were standardized and a web-based compliance tool is available.
- **Relevance**: It addresses P3 by measuring the reproducibility of the radiomic feature step across software teams.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 2. OpenAlex counts 292 citations. Small study (51 patients).
- **Potential Use**: Introduction (radiomics standardization) and Discussion and limitations.
- **Stance**: Supports, standardized filters as a condition for reproducible radiomics.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study sets reference values and reproducibility of features.
- **Correspondence handling**: not applicable; features are computed per image and no cross-subject correspondence is formed.
- **Pipeline relation**: builds on radiomics, measures how a pipeline step fails; it standardizes filtered radiomic features and measures their reproducibility across teams.
- **Application domain**: medical imaging, CT, FDG PET and T1-weighted MRI of soft-tissue sarcoma, and chest CT.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: added: handed on by Theme 4 (Whybra 2024 IBSI filters); merge screening reason: IBSI standardization of convolutional filters with reference values and validation on 51 patients

#### Wiers et al. (2026). Geometry-Aware Cardiac MRI Representation Learning with Equivariant Neural Fields.
- **Citation key**: [wiers2026geometry]
- **Identifier**: proceedings url https://proceedings.mlr.press/v315/wiers26a.html (PMLR volume 315, pages 3641 to 3658); the repository copy has DOI 10.3929/ethz-c-000801265. Confirmed by a live lookup at https://proceedings.mlr.press/v315/wiers26a.html.
- **Type**: Conference paper (Medical Imaging with Deep Learning, MIDL 2026, Proceedings of Machine Learning Research volume 315)
- **Method**: Equivariant neural fields fitted to cine cardiac MRI, which replace the single global latent of a conditional neural field by a latent point cloud of latents with poses; the latent point clouds of three short-axis slices over five cardiac phases are stacked and read by a transformer-based classifier.
- **Key Findings**: The abstract reports reconstruction quality on par with conditional neural fields with fewer decoder parameters, and latents that are local and robust to geometric transformations. The text read (sections 1, 3 and 4.2) reports seven classification endpoints from the UK Biobank (cardiomyopathy, sudden cardiac death, all-cause mortality, heart failure, myocardial infarction, atrial fibrillation and ischaemic heart disease) on 14,242 subjects, with the ENF latents most accurate on four of them and ResNet50 or a global-latent baseline on the other three. A second cohort of 978 patients with dilated cardiomyopathy from Amsterdam UMC is also used.
- **Relevance**: A subject-level predictor whose input is a latent point cloud per subject, so the representation carries no voxel correspondence across subjects (P1, P2).
- **Quality**: Abstract and sections 1, 3 and 4.2 of the full text read (PMLR PDF). Quick assessment 10 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 1, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Related work (point clouds and meshes of anatomy); Experimental baselines (a latent point-cloud representation of grid images).
- **Stance**: Supports, that a latent point cloud learned from cardiac MRI predicts clinical endpoints with an accuracy close to that of grid-based models.
- **Prediction setting**: subject-level classification, input point cloud (the latent point cloud fitted to each subject's cine MRI); each of the seven classifiers predicts one endpoint per subject.
- **Correspondence handling**: permutation invariance; the latents of each subject form a set with poses that is read by a transformer-based classifier, and the paper relies on the equivariance of the latent poses to translations and rotations rather than on aligning the images across subjects.
- **Pipeline relation**: not applicable; the paper names no registration, radiomics or lesion segmentation step, and it uses an anatomical segmentation model only to crop each image to a bounding box around the ventricles.
- **Application domain**: medical imaging, cine cardiac MRI of the heart (UK Biobank and a dilated cardiomyopathy cohort).
- **Theme tags**: T3b, T3d.
- **Theme**: added: merge recent-literature search R1 (2024 to 2026)

#### Willette et al. (2023). Scalable Set Encoding with Universal Mini-Batch Consistency and Unbiased Full Set Gradient Approximation.
- **Citation key**: [willette2023scalable]
- **Identifier**: arXiv 2208.12401. Confirmed by a live lookup at https://arxiv.org/abs/2208.12401.
- **Type**: Conference paper (Proc. Int. Conf. Machine Learning (ICML))
- **Method**: A Universally Mini-Batch Consistent (UMBC) class of set functions that can be combined with arbitrary non-MBC components, together with a training algorithm that gives an unbiased approximation of the full set gradient at constant memory.
- **Key Findings**: The abstract states that existing MBC constraints limit expressive power and that prior work did not address the full set gradient for large sets. Experiments on image completion, text classification, unsupervised clustering and cancer detection on high-resolution images verify the efficiency and efficacy of the framework. The abstract does not report numbers.
- **Relevance**: It addresses P1 and P2 for large sets: a permutation-invariant set encoder that processes a set in chunks, which applies to large sets of patches or points per subject.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 2 citations.
- **Potential Use**: Method background (set encoders for large sets)
- **Stance**: Neutral.
- **Prediction setting**: other (set-level prediction across image completion, text classification, clustering and cancer detection), input distribution or set of vectors; the encoder maps a set to one representation.
- **Correspondence handling**: permutation invariance; the set functions give the same output for every partition of the set.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, general machine learning benchmarks, including one cancer detection task on high-resolution images whose modality the abstract does not name.
- **Theme tags**: T3a, T3c.
- **Theme**: added: handed on by Theme 3 (Willette 2023 mini-batch consistency); merge screening reason: mini-batch consistent set encoding for large sets with high-resolution cancer detection

#### Wood et al. (2022). Accurate brain-age models for routine clinical MRI examinations.
- **Citation key**: [wood2022accurate]
- **Identifier**: DOI 10.1016/j.neuroimage.2022.118871. Confirmed by a live lookup at https://doi.org/10.1016/j.neuroimage.2022.118871.
- **Type**: Journal article (NeuroImage)
- **Method**: CNN brain-age models trained on 23,302 radiologically normal clinical head MRI examinations from two UK hospitals, selected by a report classifier, using minimally processed axial T2-weighted and diffusion-weighted scans.
- **Key Findings**: Age prediction was fast (under 5 s) and accurate (mean absolute error under 4 years), with generalisability between hospitals and scanner vendors (change in MAE under 1 year). In 228 patients reported as having atrophy excessive for age, predicted age exceeded chronological age by 5.89 years on average, against 0.05 years for normal scans (p below 0.0001). The abstract states that existing models rely on computationally expensive preprocessing.
- **Relevance**: A subject-level regression from clinical scans with minimal preprocessing, at scale and across sites (P1, P3).
- **Quality**: Abstract read. Quick assessment 15 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 3, data 3. OpenAlex counts 141 citations.
- **Potential Use**: Related work (removal of preprocessing steps in subject-level prediction); Discussion and limitations, read with the counter-evidence of `dular2024extensive`.
- **Stance**: Supports, that brain-age models on minimally processed clinical scans are accurate and generalise across hospitals.
- **Prediction setting**: subject-level regression, input image on a grid; the outcome is each subject's age from routine T2-weighted and diffusion-weighted scans.
- **Correspondence handling**: not applicable; the CNN reads minimally processed scans and the abstract names no correspondence step and does not state which preprocessing remains.
- **Pipeline relation**: removes registration; the abstract states that the model uses minimally processed scans in place of the computationally expensive preprocessing of existing models, and it does not name the steps dropped (the merge screening note names registration).
- **Application domain**: medical imaging, T2-weighted and diffusion-weighted brain MRI.
- **Theme tags**: `step-removal`.
- **Theme**: added: handed on by Theme 4 (Wood 2022); merge screening reason: brain-age models on minimally processed routine clinical scans that drop the registration-based preprocessing

#### Wu et al. (2022). A multicohort geometric deep learning study of age dependent cortical and subcortical morphologic interactions for fluid intelligence prediction.
- **Citation key**: [wu2022multicohort]
- **Identifier**: DOI 10.1038/s41598-022-22313-x. Confirmed by a live lookup at https://doi.org/10.1038/s41598-022-22313-x.
- **Type**: Journal article (Scientific Reports)
- **Method**: Graph convolutional neural networks on cortical ribbon and subcortical surfaces extracted from T1-weighted MRI predict fluid intelligence in two cohorts.
- **Key Findings**: Combining cortical and subcortical surfaces gave the highest accuracy for fluid intelligence in ABCD (R = 0.314) and HCP (R = 0.454), reported as outperforming earlier predictions from other brain measures. The amygdala, hippocampus, nucleus accumbens and temporal, parietal and cingulate cortex consistently drove the prediction. The abstract gives the cohort ages and does not state the number of subjects.
- **Relevance**: A subject-level regression from brain surface meshes by geometric deep learning (P1).
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 18 citations.
- **Potential Use**: Related work (geometric deep learning on brain surfaces for subject-level outcomes).
- **Stance**: Supports, that combined cortical and subcortical surface shape predicts fluid intelligence.
- **Prediction setting**: subject-level regression, input mesh or surface; the outcome is each subject's fluid intelligence score.
- **Correspondence handling**: assumes alignment; the abstract does not state how surface locations correspond across subjects, and the localized shape analysis that identifies the same structures driving prediction across subjects is read here as relying on corresponding surface locations.
- **Pipeline relation**: not applicable; the abstract does not state the surface extraction or registration steps.
- **Application domain**: medical imaging, T1-weighted MRI of the brain (cortical and subcortical surfaces).
- **Theme tags**: T3d.
- **Theme**: added: handed on by Theme 3 (multicohort GDL fluid intelligence); merge screening reason: graph convolution on cortical and subcortical surfaces for fluid intelligence across two cohorts

#### Wynen, Gordaliza, Istasse, Stolting, Maggi, Macq and Bach Cuadra (2025). ConfLUNet: multiple sclerosis lesion instance segmentation in presence of confluent lesions.
- **Citation key**: [wynen2025conflunet]
- **Type**: Journal article (Computers in Biology and Medicine)
- **Identifier**: DOI 10.1016/j.compbiomed.2025.110919, PMID 40850174; confirmed at https://doi.org/10.1016/j.compbiomed.2025.110919 and the PubMed record.
- **Method**: Formal definitions of confluent lesion units and lesion-level metrics; evaluation of connected components and automated confluent splitting; an end-to-end instance segmentation network trained on 50 patients from a single FLAIR image, tested on 13.
- **Key Findings**: Connected components underestimate confluent lesion counts and automated splitting oversplits. ConfLUNet improves panoptic quality (42.0 percent against 37.5 and 36.8) and lesion detection F1 (67.3 against 61.6 and 59.9) with reported p-values.
- **Relevance**: A set-of-lesions input depends on how lesions are separated into instances; this source measures that step and the error in lesion counts it produces.
- **Quality**: Abstract read. Small test set (13 patients), as the abstract states.
- **Potential Use**: How the set of lesions is formed; link to Theme 3 set encoders on lesions.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (FLAIR MRI), with a set of lesion instances as output.
- **Correspondence handling**: not applicable; instances are defined within each subject.
- **Pipeline relation**: builds on lesion segmentation; measures how a pipeline step fails (connected components miscount confluent lesions).
- **Application domain**: medical imaging, brain MRI (FLAIR), multiple sclerosis.
- **Theme tags**: `lesion-seg`, `failure`.
- **Theme**: Theme 4

#### Xiong et al. (2026). Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer's disease diagnosis and prognosis.
- **Citation key**: [xiong2026integrating]
- **Identifier**: DOI 10.1007/s00415-026-13664-w, PMID 41656413. Confirmed by a live lookup at https://doi.org/10.1007/s00415-026-13664-w.
- **Type**: Journal article (Journal of Neurology)
- **Method**: A dual-space framework that extracts radiomic and graph-based network features from T1-weighted MRI in both MNI standard space and native space, with machine learning models for three-class diagnosis and 6-year prediction of MCI-to-AD conversion, developed on 1,477 ADNI participants and tested on 1,349 NACC participants.
- **Key Findings**: The combined-space model performed best for diagnosis (macro-averaged AUC 0.96 in ADNI and 0.94 in NACC) and for prognosis of MCI-to-AD conversion (C-index 0.83; HR 7.60, 95% CI 4.57 to 12.64). The extracted features correlated with APOE epsilon 4 genotype, cognitive scores and CSF biomarkers in ADNI. Models using standard-space, native-space and combined features were compared systematically.
- **Relevance**: It addresses P3 by comparing features computed after registration to a standard space with features computed in native space for subject-level prediction.
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 2 citations.
- **Potential Use**: Experimental baselines (standard-space against native-space radiomics) and Discussion and limitations.
- **Stance**: Supports, combining standard-space and native-space features over a single space.
- **Prediction setting**: subject-level classification, input image on a grid; diagnosis (NC, MCI, AD) and MCI-to-AD conversion are predicted per participant.
- **Correspondence handling**: registration to a common space; standard-space features rest on registration to MNI space, and native-space features are added alongside.
- **Pipeline relation**: builds on registration, builds on radiomics, measures how a pipeline step fails; it compares the predictive value of features with and without registration to standard space.
- **Application domain**: medical imaging, T1-weighted brain MRI, Alzheimer's disease.
- **Theme tags**: `radiomics`, `reg-analysis`.
- **Theme**: added: merge intersection or gap search; screening note: standard vs native space radiomics in AD (PMID 41656413); P3

#### Xu (2020). Gromov-Wasserstein Factorization Models for Graph Clustering.
- **Citation key**: [xu2020gromov]
- **Type**: Conference paper (AAAI 34, published as a journal issue).
- **Method**: Each graph is estimated as a GW barycenter of learned atoms with graph-specific weights, learned by unrolled proximal point or Bregman ADMM modules and backpropagation.
- **Key Findings**: Both the graphs and the atoms can be unaligned and of different sizes. The model clusters graphs and, the paper states, does not use graph labels in learning; it can serve as a structural regularizer in supervised learning.
- **Relevance**: A GW template factorization for unaligned graphs, learned without labels.
- **Quality**: High. Read: abstract and introduction (arXiv HTML full text). Cited 66 times in OpenAlex on 2026-11-19.
- **Potential Use**: GW templates and factorization.
- **Identifier**: DOI 10.1609/aaai.v34i04.6120; arXiv 1911.08530; https://doi.org/10.1609/aaai.v34i04.6120 (confirmed). The Crossref record spells the author "Hongtengl Xu"; the arXiv record gives "Hongteng Xu", which the .bib uses.
- **Prediction setting**: Representation or comparison only, no prediction (clustering); input graphs.
- **Correspondence handling**: Learned template or barycenter, fixed by an unsupervised loss.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain (benchmark graph datasets).
- **Theme tags**: T2d, T2b.
- **Viewpoint**: Supports.
- **Theme**: Theme 2

#### Xu and Cheng (2023). Regularized Optimal Transport Layers for Generalized Global Pooling Operations.
- **Citation key**: [xu2023regularized]
- **Identifier**: DOI 10.1109/tpami.2023.3314661, arXiv 2212.06339. Confirmed by a live lookup at https://doi.org/10.1109/tpami.2023.3314661.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence)
- **Method**: A global pooling framework that learns a regularized optimal transport across sample indices and feature dimensions, implemented as learnable regularized optimal transport pooling (ROTP) layers in the form of deep implicit layers.
- **Key Findings**: Most existing pooling methods are shown to be equivalent to regularized optimal transport problems with different specializations, and more elaborate pooling follows from solving several such problems hierarchically. ROTP layers were tested in multi-instance learning, graph classification, graph set representation and image classification. They can imitate existing pooling methods or yield new pooling layers that fit the data better.
- **Relevance**: It addresses P2 by expressing permutation-invariant pooling through a transport plan, linking the transport and set-encoder strands.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 2. OpenAlex counts 13 citations.
- **Potential Use**: Method background (transport-based pooling for set encoders).
- **Stance**: Supports, regularized optimal transport as a general form of global pooling.
- **Prediction setting**: other (set-level and graph-level classification in MIL, graph and image tasks), input distribution or set of vectors.
- **Correspondence handling**: permutation invariance; the layers pool a set into one vector independent of element order, with the pooling weights obtained from a regularized transport plan.
- **Pipeline relation**: not applicable; the experiments are machine learning benchmarks.
- **Application domain**: other domain, multi-instance learning, graph and image classification benchmarks.
- **Theme tags**: T2a, T3a, T3c.
- **Theme**: added: merge intersection or gap search; screening note: regularized OT layers for global pooling; P2

#### Xu et al. (2024). A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images.
- **Citation key**: [xu2024hybrid]
- **Identifier**: DOI 10.1016/j.cmpb.2023.107872; PMID 37922655. Confirmed by a live lookup at https://doi.org/10.1016/j.cmpb.2023.107872.
- **Type**: Journal article (Computer Methods and Programs in Biomedicine)
- **Method**: An encoder pre-trained by rotation-based self-supervision on a public CT dataset gives deep features per lymphoma lesion, which are combined with PET and CT radiomic features, pooled into a bag-level (patient-level) representation and classified by a distance-based few-shot classifier.
- **Key Findings**: At the bag level the model reaches an accuracy of 0.751, a sensitivity of 0.787, a specificity of 0.715, an F1 of 0.753 and an AUC of 0.795. It outperforms three radiomics-based counterparts (accuracies 0.714, 0.705 and 0.698). The best configuration uses DeepLesion for self-supervision, rotation as the pretext task, hybrid CT and radiomic PET features, max pooling and the distance-based classifier; the abstract does not state the number of patients.
- **Relevance**: It addresses P1, P2 and P3: a patient-level diagnosis is predicted from the set of a patient's lesions, while radiomic features and a per-lesion delineation stay upstream.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 13 citations.
- **Potential Use**: Related work (sets of lesions as MIL bags in medical imaging)
- **Stance**: Supports, that a bag of per-lesion hybrid features with MIL classifies lymphoma aggressiveness better than radiomics pipelines with conventional classifiers.
- **Prediction setting**: subject-level classification, input set of lesions or regions; the lesions of a patient form a bag that is classified as diffuse large B-cell lymphoma or follicular lymphoma.
- **Correspondence handling**: permutation invariance; instance features are pooled into a bag representation, with max pooling the best choice.
- **Pipeline relation**: builds on radiomics, builds on lesion segmentation; radiomic features are computed for each lesion, which requires the lesions to be delineated, and the abstract does not state how they are delineated.
- **Application domain**: medical imaging, PET/CT, non-Hodgkin lymphoma lesions.
- **Theme tags**: T3d, `radiomics`, `lesion-seg`.
- **Theme**: added: handed on by Theme 3 (few-shot MIL lymphoma PET/CT); merge screening reason: bag of per-lesion hybrid deep and radiomic features per patient for lymphoma aggressiveness

#### Xu, Chen and Li (2024). Tensor regression for incomplete observations with application to longitudinal studies.
- **Citation key**: [xu2024tensor]
- **Identifier**: DOI 10.1214/23-aoas1830, confirmed at https://doi.org/10.1214/23-aoas1830 through Crossref, OpenAlex and Semantic Scholar.
- **Type**: Journal article (Annals of Applied Statistics).
- **Method**: Scalar-on-tensor regression on a sample by feature by time tensor with a regularized covariance-based estimator that uses all available observations without imputation, with variable selection and smooth time-varying effects.
- **Key Findings**: The abstract states that blockwise missing values, where not every sample is measured at every time point, defy methods that require complete samples, and that the method links preterm infants' gut microbiome dynamics with their neurodevelopment, with further studies on synthetic data and an aging study.
- **Relevance**: A tensor regression that predicts a subject-level outcome when one mode (time) is not observed at the same points for every subject, which is the unaligned-mode setting of the research question in a temporal mode.
- **Quality**: Abstract alone (the PMC PDF returned a non-PDF reply to the fetch).
- **Potential Use**: Example of subject-level prediction that tolerates an incompletely observed mode without imputation.
- **Stance**: Supports.
- **Prediction setting**: Subject-level regression, input tensor (subject by feature by time with blockwise missing time points); the outcome is a continuous neurodevelopment measure per infant.
- **Correspondence handling**: Other: the time grid is shared and missing points are handled by covariance-based estimation over the observed entries, so the model assumes the observed time points mean the same across subjects.
- **Pipeline relation**: Not applicable; the data are microbiome measurements.
- **Application domain**: Other domain, longitudinal gut microbiome of preterm infants.
- **Theme tags**: T1-TR, T1-UNAL.
- **Theme**: Theme 1

#### Xue, Chen, Zhang, Golby, Makris, Rathi, Cai, Zhang and O'Donnell (2023). TractCloud: registration-free tractography parcellation with a novel local-global streamline point cloud representation.
- **Citation key**: [xue2023tractcloud]
- **Type**: Conference paper (MICCAI 2023, Lecture Notes in Computer Science)
- **Identifier**: DOI 10.1007/978-3-031-43993-3_40, arXiv 2307.09000 (preprint of the same paper); confirmed at https://doi.org/10.1007/978-3-031-43993-3_40 (resolves to the Springer chapter page), the Crossref record, the official paper page https://conferences.miccai.org/2023/papers/664-Paper3146.html (abstract read) and the arXiv API record. Overlap with Theme 3 (point-cloud encoders), included because it is a pipeline that removes the registration step.
- **Method**: Classifies each streamline of a whole-brain tractogram into anatomical fiber tracts in the subject's own space, with a learned local-global representation that describes each streamline by its neighbouring and whole-brain streamlines as a point cloud; trained with synthetic rotation, scaling and translation and tested on five independently acquired datasets.
- **Key Findings**: The abstract states that current parcellation relies on registration, that registration inaccuracy affects parcellation and that registration is costly for large datasets. TractCloud outperformed several state-of-the-art methods on all test datasets and gave consistent whole-brain parcellation from neonates to elderly subjects, including brain tumour patients, without registration.
- **Relevance**: It removes registration by making the representation carry the global pose of the brain, and states the failure of registration as the reason; it is the one included alternative whose input is a point cloud.
- **Quality**: Abstract read (official MICCAI page). Peer-reviewed proceedings paper.
- **Potential Use**: Example of a registration-free method on a point-cloud input; link to Theme 3.
- **Viewpoint**: supports registration-free analysis.
- **Prediction setting**: representation or comparison only, no prediction; point cloud (streamlines of a tractogram); the output is a tract label per streamline, and no subject-level outcome is predicted.
- **Correspondence handling**: not applicable in the registration sense; each streamline is described relative to the subject's own whole-brain tractogram and pose invariance is learned from synthetic transforms, so no common space is formed, and tract labels shared across subjects carry the correspondence. The abstract does not state whether the encoder is permutation invariant.
- **Pipeline relation**: removes registration.
- **Application domain**: medical imaging, diffusion MRI tractography of the brain, across the lifespan and in brain tumour patients.
- **Theme tags**: `step-removal`, `reg-template`.
- **Theme**: Theme 4

#### Yan et al. (2026). GWDRO-Lung: Gromov-Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts.
- **Citation key**: [yan2026gwdro]
- **Identifier**: DOI 10.1038/s41746-026-03323-9. Confirmed by a live lookup at https://doi.org/10.1038/s41746-026-03323-9.
- **Type**: Journal article (npj Digital Medicine)
- **Method**: A weight-shared 3D chest CT encoder with acquisition metadata summarizes each cohort as a relation matrix over learned prototypes, cohort geometries are aligned to a shared Gromov-Wasserstein barycenter, and a distributionally robust, calibration-aware risk head estimates malignancy with a robustness radius set by the residual alignment error.
- **Key Findings**: The model was developed on 1842 nodules from LIDC-IDRI in three acquisition-defined cohorts and validated externally on 618 nodules from LNDb. Against the strongest recent imaging baseline, external AUC rose from 0.857 to 0.878, external expected calibration error fell from 0.106 to 0.066 and worst-cohort AUC rose from 0.829 to 0.851. The abstract states that prospective, pathology-confirmed validation is required before clinical use.
- **Relevance**: It uses a GW barycenter in medical imaging prediction (P2), with the barycenter aligning cohort geometries; the abstract states no alignment between the images of different subjects.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Related work (transport-based fusion in medical imaging).
- **Stance**: Supports, GW barycenter alignment of cohorts for transfer of nodule malignancy prediction.
- **Prediction setting**: other (nodule-level malignancy classification), input image on a grid; the label is the malignancy of each pulmonary nodule from chest CT.
- **Correspondence handling**: learned template or barycenter; the paper calls it a shared Gromov-Wasserstein barycenter of cohort relation matrices over learned prototypes, estimated from the data, so it falls under this category.
- **Pipeline relation**: not applicable; the abstract does not state how nodules are located or whether a segmentation or radiomic step is used.
- **Application domain**: medical imaging, low-dose chest CT, lung (pulmonary nodules).
- **Theme tags**: T2f, T2c, T2b.
- **Theme**: added: handed on by Theme 2 (GWDRO-Lung 2026); merge screening reason: GW barycenter alignment of cohort geometries for nodule malignancy prediction across cohorts

#### Yang et al. (2020). Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers.
- **Citation key**: [yang2020relational]
- **Identifier**: DOI 10.1109/isbi45749.2020.9098722. Confirmed by a live lookup at https://doi.org/10.1109/isbi45749.2020.9098722.
- **Type**: Conference paper (2020 IEEE 17th International Symposium on Biomedical Imaging (ISBI))
- **Method**: A multiple instance learning approach that treats the nodules of one patient as a set and uses NoduleSAT, a self-attention transformer with a 3D CNN, in place of pooling-based aggregation.
- **Key Findings**: The abstract states that it is the first study to learn relations between multiple pulmonary nodules of a patient. Experiments on false positive reduction on LUNA16 and malignancy classification on LIDC-IDRI are reported to validate the method. The abstract does not state any numbers.
- **Relevance**: It addresses P1 and P2 with a set of lesions per patient processed by a permutation-invariant attention model.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 3, citations 2, data 2. OpenAlex counts 35 citations.
- **Potential Use**: Related work (set encoders on sets of lesions).
- **Stance**: Supports, modelling the relations between a patient's nodules over solitary-nodule approaches.
- **Prediction setting**: other (nodule malignancy classification and false positive reduction with the patient's nodules processed as one set), input set of lesions or regions; the abstract does not state whether the label is per nodule or per patient.
- **Correspondence handling**: permutation invariance; self-attention over the set of nodules does not depend on nodule order.
- **Pipeline relation**: not applicable; the abstract does not state how nodules are located or whether hand-crafted features are used.
- **Application domain**: medical imaging, chest CT, pulmonary nodules (LUNA16, LIDC-IDRI).
- **Theme tags**: T3d, T3c.
- **Theme**: added: handed on by Theme 3 (Yang 2020 multiple pulmonary nodules set); merge screening reason: set of pulmonary nodules per patient with a set attention transformer for malignancy

#### Yang et al. (2024). From Histopathology Images to Cell Clouds: Learning Slide Representations with Hierarchical Cell Transformer.
- **Citation key**: [yang2024histopathology]
- **Identifier**: arXiv 2412.16715. Confirmed by a live lookup at https://arxiv.org/abs/2412.16715.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: Builds WSI-Cell5B, 6,998 whole slide images of 11 cancers from the Cancer Genome Atlas with over 5 billion cell annotations of coordinates and types, and CCFormer, a hierarchical transformer that treats each slide as a cell cloud with neighbourhood embedding and hierarchical spatial perception.
- **Key Findings**: The abstract states that cell counts from WSI-Cell5B support clinical evaluation metrics of survival risk. On survival prediction and cancer staging, learning from cell spatial distribution alone achieved state-of-the-art performance. CCFormer is reported to strongly outperform competing methods, with no figures in the abstract.
- **Relevance**: Subject-level survival and staging from a point cloud of cells per slide (P1, P2).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 2, data 3. OpenAlex counts 3 citations.
- **Potential Use**: Related work (point-cloud models for subject-level prediction in pathology).
- **Stance**: Supports, that cell spatial distribution alone supports survival prediction and staging.
- **Prediction setting**: subject-level regression, input point cloud; the outcomes are patient survival and cancer stage from the cell cloud of the slide.
- **Correspondence handling**: permutation invariance; the transformer processes each slide's cells as a cloud with neighbourhood features, and the abstract does not state the invariance in these words.
- **Pipeline relation**: builds on lesion segmentation; the input is per-cell coordinates and types, a cell-level detection step, and the abstract does not state how the annotations were produced.
- **Application domain**: medical imaging, histopathology whole slide images of 11 cancers.
- **Theme tags**: T3b, T3c, T3d.
- **Theme**: added: merge forward citation round (2024 to 2026, cites 5 or more included sources)

#### Yang and Gao (2025). PointCHD: A Point Cloud Benchmark for Congenital Heart Disease Classification and Segmentation.
- **Citation key**: [yang2025pointchd]
- **Identifier**: DOI 10.1109/jbhi.2024.3495035. Confirmed by a live lookup at https://doi.org/10.1109/jbhi.2024.3495035.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics)
- **Method**: PointCHD, a point cloud dataset of hearts for congenital heart disease diagnosis supporting classification, segmentation and reconstruction, with a benchmark of mainstream point cloud methods and a manifold-learning representation that uses normals and an adaptive projection plane.
- **Key Findings**: The abstract states that PointCHD is the first point cloud dataset for congenital heart disease diagnosis, with many high-precision annotated and widely categorized samples of varying distortion. The proposed manifold-learning representation is reported to achieve the best performance on each task of the benchmark. The abstract does not state the number of subjects or any numbers.
- **Relevance**: It addresses P1 with a public benchmark of subject-level classification from organ point clouds.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 2, relevance 2, citations 3, data 2. OpenAlex counts 25 citations.
- **Potential Use**: Experimental baselines (a medical point cloud benchmark).
- **Stance**: Supports, point cloud representations of organs for diagnosis.
- **Prediction setting**: subject-level classification, input point cloud; each heart model is classified by congenital heart disease type.
- **Correspondence handling**: permutation invariance; the benchmark applies point cloud analysis methods, and the abstract does not state any registration of the heart models.
- **Pipeline relation**: not applicable; the abstract states that organ models are reconstructed in 3D after scanning and does not describe registration, radiomic features or lesion segmentation.
- **Application domain**: medical imaging, 3D heart models reconstructed from scans (the abstract does not name the modality of the dataset).
- **Theme tags**: T3b, T3d.
- **Theme**: added: handed on by Theme 3 (PointCHD); merge screening reason: point cloud benchmark for congenital heart disease classification

#### Yao et al. (2020). Whole slide images based cancer survival prediction using attention guided deep multiple instance learning networks.
- **Citation key**: [yao2020whole]
- **Identifier**: DOI 10.1016/j.media.2020.101789; arXiv 2009.11169; PMID 32739769. Confirmed by a live lookup at https://doi.org/10.1016/j.media.2020.101789.
- **Type**: Journal article (Medical Image Analysis)
- **Method**: DeepAttnMISL combines a siamese MI-FCN with attention-based MIL pooling to learn features from whole slide images and aggregate them to patient-level survival prediction.
- **Key Findings**: The abstract states that earlier image-based survival models rely on discriminative patch labeling or are limited to key patches or clusters. On two large cancer whole slide image datasets, the approach is reported as more effective for large datasets and more interpretable in locating patterns that drive survival predictions. The abstract gives no figures.
- **Relevance**: A patient-level survival model from an unordered set of slide patches with attention pooling (P1, P2).
- **Quality**: Abstract read. Quick assessment 14 of 15 (High): journal ranking 3, rigor 2, relevance 3, citations 3, data 3. OpenAlex counts 650 citations.
- **Potential Use**: Related work (multiple-instance learning for subject-level survival).
- **Stance**: Supports, that attention-based MIL aggregation suits patient-level survival prediction from slides.
- **Prediction setting**: subject-level regression, input distribution or set of vectors; the outcome is patient survival, predicted from the set of patch features of the patient's slides.
- **Correspondence handling**: permutation invariance; attention-based MIL pooling aggregates patch features without any correspondence between patches of different patients.
- **Pipeline relation**: removes lesion segmentation; the abstract states that the method avoids the discriminative patch labeling that earlier models rely on.
- **Application domain**: medical imaging, histopathology whole slide images of cancer (the abstract does not name the organs).
- **Theme tags**: T3c, T3d.
- **Theme**: added: handed on by Theme 3 (Yao 2020 WSI survival MIL); merge screening reason: attention MIL survival from whole-slide patch sets aggregated to patient level

#### Yi and Stanley (2021). CytoSet: Predicting clinical outcomes via set-modeling of cytometry data.
- **Citation key**: [yi2021cytoset]
- **Identifier**: DOI 10.1101/2021.04.13.439702. Confirmed by a live lookup at https://doi.org/10.1101/2021.04.13.439702.
- **Type**: Preprint (bioRxiv); Preprint, not peer-reviewed.
- **Method**: CytoSet models the cells profiled in each patient sample as a set and predicts the patient's clinical outcome with a permutation-invariant deep architecture.
- **Key Findings**: The abstract reports state-of-the-art classification performance across several flow and mass cytometry benchmark datasets. It reports robustness to the number of sub-sampled cells per patient and to model depth, which lets the model scale to hundreds of patient samples.
- **Relevance**: It is a direct case of P1 and P2: a patient-level outcome predicted from an unordered set of cells by permutation invariance.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 2. OpenAlex counts 3 citations.
- **Potential Use**: Related work (multiple-instance learning and distribution regression for patient outcomes).
- **Stance**: Supports, set-based permutation-invariant models for patient-level outcome prediction.
- **Prediction setting**: subject-level classification, input distribution or set of vectors; each patient sample is a set of profiled cells and the label is the patient's clinical outcome.
- **Correspondence handling**: permutation invariance; cells carry no correspondence across patients and the architecture is invariant to their order.
- **Pipeline relation**: not applicable; the data are cytometry measurements, not images.
- **Application domain**: other domain, clinical flow and mass cytometry of blood or tissue samples.
- **Theme tags**: T3c, T3a.
- **Theme**: added: handed on by Theme 3 (CytoSet); merge screening reason: patient-level clinical outcome prediction from sets of cytometry cells (preprint)

#### Yin et al. (2020). LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values.
- **Citation key**: [yin2020logpar]
- **Identifier**: DOI 10.1145/3394486.3403213. Confirmed by a live lookup at https://doi.org/10.1145/3394486.3403213.
- **Type**: Conference paper (Proceedings of the 26th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining)
- **Method**: Logistic PARAFAC2 models a binary irregular tensor, whose size varies in one dimension, with a Bernoulli distribution over an underlying real-valued tensor fitted with a positive-unlabeled loss and uniqueness and temporal smoothness regularization.
- **Key Findings**: The abstract reports that LogPar outperforms all baselines on irregular tensor completion and on downstream predictive tasks on large-scale real-world datasets. It reports up to 26% relative improvement for tensor completion and average relative improvements of 13.2% for heart failure prediction and 14% for mortality prediction over state-of-the-art PARAFAC2 models.
- **Relevance**: It addresses P1 and P2 for a tensor whose irregular mode differs in size across slices, with the factorization feeding a downstream clinical prediction.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 39 citations.
- **Potential Use**: Related work (tensor methods for irregular, unaligned modes).
- **Stance**: Supports, PARAFAC2 factorization of irregular binary tensors as a basis for downstream prediction.
- **Prediction setting**: subject-level classification, input tensor; the abstract names heart failure and mortality prediction as downstream tasks, which are read here as per-patient labels, and it does not state the unit of each tensor slice.
- **Correspondence handling**: learned template or barycenter; the paper uses PARAFAC2, whose shared factor is estimated from the data across slices of different sizes and so stands in for an alignment of the irregular mode, and the abstract names PARAFAC2 without describing its factor structure.
- **Pipeline relation**: not applicable; the data are binary feature-presence tensors, and no imaging pipeline step is named.
- **Application domain**: other domain, clinical prediction (heart failure and mortality) from temporal binary data; the abstract does not name the data source.
- **Theme tags**: T1-UNAL.
- **Theme**: added: handed on by Theme 1 (LogPar 2020); merge screening reason: logistic PARAFAC2 on irregular tensors with heart-failure and mortality prediction

#### Yu and Bro (2021). PARAFAC2 and local minima.
- **Citation key**: [yu2021local]
- **Identifier**: DOI 10.1016/j.chemolab.2021.104446, confirmed at https://doi.org/10.1016/j.chemolab.2021.104446 through Crossref, OpenAlex and Semantic Scholar, and on the University of Copenhagen research portal.
- **Type**: Journal article (Chemometrics and Intelligent Laboratory Systems).
- **Method**: Empirical study of local minima of the non-convex PARAFAC2 loss on simulated, GC-MS and EEG data, with non-negativity constraints, optimized initializations and a local-minima avoidance procedure.
- **Key Findings**: The abstract reports that loadings at local and global minima differ much even when the loss values are close, that overfitting raises the fraction of local minima, that the optimized initialization lowered the average fraction of local minima from 84% to 0%, and that the avoidance procedure removed all local minima in their case.
- **Relevance**: A failure analysis of PARAFAC2 fitting on irregular tensors, including EEG.
- **Quality**: Abstract alone, read on the University of Copenhagen research portal (ScienceDirect refused the request).
- **Potential Use**: Reliability of PARAFAC2 factors used downstream.
- **Stance**: Opposes uncritical use of single PARAFAC2 fits.
- **Prediction setting**: Representation or comparison only, no prediction, input irregular tensor.
- **Correspondence handling**: Not applicable.
- **Pipeline relation**: Not applicable.
- **Application domain**: Other domain, chemometrics (GC-MS) and electrophysiology (EEG).
- **Theme tags**: T1-FAIL.
- **Theme**: Theme 1

#### Yu and Zhou (2023). Deep learning theory of distribution regression with CNNs.
- **Citation key**: [yu2023deep]
- **Identifier**: DOI 10.1007/s10444-023-10054-y. Confirmed by a live lookup at https://doi.org/10.1007/s10444-023-10054-y.
- **Type**: Journal article (Advances in Computational Mathematics, volume 49, issue 4)
- **Method**: A deep convolutional neural network framework for two-stage distribution regression, in which the inputs are probability measures, with an approximation theory for functionals on Borel probability measures, a proof that the hypothesis space is compact, and a two-stage oracle inequality.
- **Key Findings**: The abstract states that no mathematical model or learning theory existed for DCNN-based distribution regression, because the classical network requires a Euclidean vector input. The paper derives a two-stage oracle inequality and learning rates that are optimal up to a logarithmic factor for the proposed algorithm.
- **Relevance**: A learning theory for regression from distributions observed through samples, the setting of a subject represented by an unordered set of points (P1, P2), with no experiment.
- **Quality**: Abstract read (Springer article page). Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 3, relevance 2, citations 1, data 1. OpenAlex counts 3 citations.
- **Potential Use**: Method background (learning rates for distribution regression).
- **Stance**: Supports, that convolutional networks can learn functionals of probability measures at near-optimal rates in two-stage sampling.
- **Prediction setting**: other (regression of a response from a probability distribution), input distribution or set of vectors; in two-stage sampling each distribution is observed only through samples drawn from it.
- **Correspondence handling**: permutation invariance; the input is a probability measure estimated from samples, so the order of the samples carries no information and no correspondence between samples of different inputs is used.
- **Pipeline relation**: not applicable; the paper is a learning theory with no imaging pipeline.
- **Application domain**: other domain, statistical learning theory.
- **Theme tags**: T3c.
- **Theme**: added: handed on by Theme 3 (distribution regression CNNs); merge screening reason: learning theory of two-stage distribution regression with deep convolutional networks, read on the publisher page

#### Yuan et al. (2026). BagShift: Measuring How Patch Selection Changes the Evidence Seen by Whole-Slide MIL.
- **Citation key**: [yuan2026bagshift]
- **Identifier**: arXiv 2608.15970. Confirmed by a live lookup at https://arxiv.org/abs/2608.15970.
- **Type**: Preprint (arXiv); Preprint, not peer-reviewed.
- **Method**: BagShift is a paired protocol that changes the patch selector of whole-slide MIL for the same case while the features and predictor are held fixed, so that the response to the selector is separated from case mix.
- **Key Findings**: With equal 128-patch budgets, sampling across the tissue or concentrating around one coordinate reduces quadratic weighted kappa on PANDA by 1.57 and 17.96 points (on the 100 scale). On CAMELYON16, lesion annotations withheld from model development show that localized views retain tumor in only 10.0% of micrometastatic observations, and matched exposure does not consistently recover the loss; the response on external lung subtyping is much smaller. Unioning the patches of repeated localized observations before one nonlinear MIL pass improves PANDA kappa by 7.87 points over averaging regional predictions.
- **Relevance**: It addresses P3: it measures how the patch selection step in front of a MIL model, such as tissue masking or regional sampling, changes the evidence that a case-level prediction rests on.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 1, rigor 3, relevance 3, citations 2, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Discussion and limitations (failure analyses of set encoders on whole slide images)
- **Stance**: Opposes, reporting patch count alone as a description of the evidence a whole-slide MIL model sees.
- **Prediction setting**: subject-level classification, input set of lesions or regions; each case is a bag of patches with a case-level grade or tumor label.
- **Correspondence handling**: permutation invariance; the MIL predictor aggregates a bag of patches, and the protocol changes which patches enter the bag.
- **Pipeline relation**: measures how a pipeline step fails; the patch selector, including tissue masking, is changed while everything else is fixed, and withheld lesion annotations measure how much tumor the selected patches retain.
- **Application domain**: medical imaging, histopathology whole slide images (PANDA grading, CAMELYON16 micrometastases and external lung subtyping).
- **Theme tags**: T3e, T3c, `failure`.
- **Theme**: added: handed on by Theme 3 (BagShift); merge screening reason: paired protocol measuring how the patch selector (tissue masking, regional sampling) changes the evidence seen by MIL (preprint)

#### Zaheer et al. (2017). Deep Sets.
- **Citation key**: [zaheer2017deep]
- **Type**: Conference paper (NeurIPS 2017). Foundational work named for the theme.
- **Identifier**: arXiv 1703.06114; https://proceedings.neurips.cc/paper/2017/hash/f22e4747da1aa27e363d86d40ff442fe-Abstract.html (proceedings page read); https://arxiv.org/abs/1703.06114.
- **Method**: theoretical characterization of permutation-invariant functions and a network architecture built on it.
- **Key Findings**: The main theorem characterizes permutation-invariant objective functions and gives a family to which any such function must belong. The structure of that family yields a deep architecture that operates on sets, applied to population statistic estimation, point cloud classification, set expansion and outlier detection.
- **Relevance**: it is the base architecture that handles a set of unordered elements by permutation invariance alone, which is the correspondence-free route of the research question.
- **Prediction setting**: other, set-level regression and classification with a set of vectors or a point cloud as input; the abstract reports set-level estimation and point-cloud classification, not subject-level outcomes of patients.
- **Correspondence handling**: permutation invariance; the model is invariant to the order of set elements by construction, so no element-to-element matching is used.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain (population statistics, point clouds of objects, text sets, anomaly detection).
- **Theme tags**: T3a.
- **Quality**: abstract read on the NeurIPS proceedings page. Peer-reviewed proceedings; OpenAlex cited_by_count of the arXiv record 489 (the proceedings record was not looked up). Quick assessment 13 of 15.
- **Viewpoint**: supports permutation invariance as sufficient structure for set functions.
- **Potential Use**: definition of the set-encoder family in the related-work section.
- **Theme**: Theme 3

#### Zamorski et al. (2020). Comparison of Aggregation Functions for 3D Point Clouds Classification.
- **Citation key**: [zamorski2020comparison]
- **Identifier**: DOI 10.1007/978-3-030-41964-6_43. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-41964-6_43.
- **Type**: Conference paper (Intelligent Information and Database Systems, ACIIDS 2020, Lecture Notes in Computer Science)
- **Method**: A comparison of permutation-invariant aggregation functions used in place of the feature-wise max of PointNet, evaluated for point-cloud classification on ShapeNet.
- **Key Findings**: The abstract states that point clouds require models that deal with permutation invariance within samples and that PointNet extracts features per point and then takes a feature-wise max. It reports a comparison of other permutation-invariant aggregation functions on the ShapeNet classification task, and the abstract does not state which function performs best.
- **Relevance**: A benchmark of the pooling step of point-cloud classifiers, the permutation-invariant route to the missing correspondence (P2), outside medical imaging.
- **Quality**: Abstract read (Springer chapter page). Quick assessment 9 of 15 (Acceptable): journal ranking 2, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 0 citations.
- **Potential Use**: Related work (point-cloud networks); Experimental baselines (aggregation functions to compare in a point-cloud classifier).
- **Stance**: Neutral.
- **Prediction setting**: other (object-level classification of 3D shapes), input point cloud; each ShapeNet point cloud receives one class label.
- **Correspondence handling**: permutation invariance; the compared functions aggregate per-point features with a symmetric operation, so the label does not depend on the order of the points.
- **Pipeline relation**: not applicable; the paper has no imaging pipeline.
- **Application domain**: other domain, 3D object classification (ShapeNet).
- **Theme tags**: T3b.
- **Theme**: added: handed on by Theme 3 (aggregation functions point clouds ACIIDS); merge screening reason: comparison of permutation-invariant aggregation functions for point-cloud classification, read on the publisher page

#### Zare et al. (2025). Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology.
- **Citation key**: [zare2025permutation]
- **Identifier**: DOI 10.34067/kid.0000000668. Confirmed by a live lookup at https://doi.org/10.34067/kid.0000000668.
- **Type**: Journal article (Kidney360)
- **Method**: PICASO is a Transformer-based permutation-invariant set operator that aggregates histopathologic features from a set of glomerular crops, using initial histopathologic vectors as a static memory updated from the input embeddings.
- **Key Findings**: For active crescent detection in IgA nephropathy (6206 glomerular crops from three institutes), PICASO reached AUROC 0.99 on internal and 0.96 on external validation, significantly above DeepSet, Set Transformer and their variants (P < 0.001). For case-level classification of antibody-mediated rejection (1655 crops from 89 biopsies), it reached AUROC 0.97 (95% CI 0.90 to 1.0).
- **Relevance**: It is a direct case of P1 and P2: a case-level label predicted from an unordered set of regions by a permutation-invariant operator, compared with standard set encoders.
- **Quality**: Abstract read. Quick assessment 13 of 15 (High): journal ranking 3, rigor 3, relevance 3, citations 2, data 2. OpenAlex counts 3 citations. Small study (89 biopsies in the antibody-mediated rejection task; the abstract does not state the number of patients).
- **Potential Use**: Related work (set encoders on sets of regions in medical images), with DeepSet and Set Transformer as experimental baselines.
- **Stance**: Supports, attentional set operators over sets of glomerular crops for case-level classification.
- **Prediction setting**: subject-level classification, input set of lesions or regions; the instances are glomerular crops and the labels are per patient or per biopsy case.
- **Correspondence handling**: permutation invariance; the set operator is invariant to the order of crops, which have no correspondence across cases.
- **Pipeline relation**: not applicable; the abstract does not state how the glomerular crops are obtained, and no registration, radiomic or lesion-segmentation step is named.
- **Application domain**: medical imaging, digital pathology of periodic acid-Schiff-stained kidney biopsies (IgA nephropathy and kidney transplant rejection).
- **Theme tags**: T3d, T3a.
- **Theme**: added: handed on by Theme 3 (cascaded attentional set operator nephropathology); merge screening reason: transformer set operator over sets of glomerular crops for case-level nephropathology classification

#### Zhang et al. (2020). FSPool: Learning Set Representations with Featurewise Sort Pooling.
- **Citation key**: [zhang2020fspool]
- **Identifier**: arXiv 1906.02795. Confirmed by a live lookup at https://arxiv.org/abs/1906.02795.
- **Type**: Conference paper (Proc. Int. Conf. Learning Representations (ICLR))
- **Method**: FSPool pools a set of feature vectors by sorting each feature across set elements, and is used in a permutation-equivariant auto-encoder and as a replacement pooling in existing set encoders.
- **Key Findings**: The abstract names a responsibility problem of set prediction models. On a toy polygon dataset and a set version of MNIST the auto-encoder gave better reconstructions and representations. Replacing the pooling of existing set encoders with FSPool improved accuracy and convergence speed on several datasets.
- **Relevance**: A permutation-invariant pooling operator for set encoders, an alternative to sum and attention pooling (P2).
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 76 citations.
- **Potential Use**: Method background (set pooling operators).
- **Stance**: Supports, that featurewise sort pooling improves set encoders.
- **Prediction setting**: other (set-level classification and set auto-encoding), input distribution or set of vectors; outputs are labels or reconstructions of sets.
- **Correspondence handling**: permutation invariance; sorting each feature across elements gives a representation independent of element order.
- **Pipeline relation**: not applicable; no imaging pipeline is studied.
- **Application domain**: other domain, synthetic polygons and set MNIST.
- **Theme tags**: T3a.
- **Theme**: added: merge backward citation round (cited by 3 or more included sources)

#### Zhang et al. (2021). Cortical Morphometry Analysis Based on Worst Transportation Theory.
- **Citation key**: [zhang2021cortical]
- **Identifier**: DOI 10.1007/978-3-030-78191-0_13, arXiv 2104.00637, PMID 34290489. Confirmed by a live lookup at https://doi.org/10.1007/978-3-030-78191-0_13.
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Method**: The worst transportation cost, the least economical way to transport one measure to another, used as a univariate biomarker of cortical morphometry, with the Brenier theorem generalized to the worst transportation map and an algorithm from computational geometry.
- **Key Findings**: The worst transportation map is shown to be the gradient of a concave function satisfying the Monge-Ampere equation. Applied to cortical shape differences between dementia due to AD and normal aging, the method is reported to give better statistical performance than competing methods including optimal transport. The abstract does not state the number of subjects or any numbers.
- **Relevance**: It addresses P2 with a transport-based comparison of cortical shapes as a biomarker.
- **Quality**: Abstract read. Quick assessment 9 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 1. OpenAlex counts 0 citations.
- **Potential Use**: Related work (transport-based morphometry of the cortex).
- **Stance**: Supports, the worst transportation cost over optimal transport as a cortical biomarker.
- **Prediction setting**: representation or comparison only, no prediction, input mesh or surface; the biomarker is used for group comparison of AD and normal aging, and the abstract does not state a subject-level prediction.
- **Correspondence handling**: transport coupling; each cortical measure is compared with another by the worst transportation map, and the abstract does not state the reference measure.
- **Pipeline relation**: not applicable; the abstract does not state a registration, radiomics or segmentation step.
- **Application domain**: medical imaging, brain cortical morphometry in Alzheimer's disease (the abstract does not name the modality).
- **Theme tags**: T2f.
- **Theme**: added: merge IPMI proceedings search (Crossref, 2013 to 2025); screening note: worst-transportation cost as cortical biomarker (PMID 34290489, arXiv 2104.00637)

#### Zhang et al. (2022). Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets.
- **Citation key**: [zhang2022set]
- **Identifier**: arXiv 2206.11925. Confirmed by a live lookup at https://arxiv.org/abs/2206.11925.
- **Type**: Conference paper (Proc. Int. Conf. Machine Learning (ICML))
- **Method**: The clean path principle for equivariant residual connections and set norm, a normalization for sets, used to build Deep Sets++ and Set Transformer++.
- **Key Findings**: Deep Sets and Set Transformer can suffer from vanishing or exploding gradients when deep, and layer norm can remove information useful for prediction. Deep Sets++ and Set Transformer++ reach high depths with comparable or better performance than the originals on a diverse suite of tasks. The paper introduces Flow-RBC, a single-cell dataset for permutation-invariant prediction, and releases data and code.
- **Relevance**: It addresses P2 by showing how permutation-invariant encoders fail when made deep and how residual connections and normalization change that.
- **Quality**: Abstract read. Quick assessment 11 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 2, data 2. OpenAlex counts 32 citations.
- **Potential Use**: Related work (set encoders) and Experimental baselines (Deep Sets++ and Set Transformer++).
- **Stance**: Supports, deep permutation-invariant models once residual connections and normalization are adapted to sets.
- **Prediction setting**: other (set-level prediction on a suite of tasks and on the Flow-RBC single-cell dataset), input distribution or set of vectors; the abstract does not state the target of the Flow-RBC task.
- **Correspondence handling**: permutation invariance; Deep Sets and Set Transformer variants are invariant to the order of set elements.
- **Pipeline relation**: not applicable; the tasks named are outside imaging pipelines.
- **Application domain**: other domain, set-learning benchmarks and single-cell blood measurements.
- **Theme tags**: T3a, T3e.
- **Theme**: added: handed on by Theme 3 (Set Norm 2022); merge screening reason: deep set normalization with a single-cell blood dataset for permutation-invariant prediction (ICML 2022)

#### Zhang et al. (2024). Wasserstein Discriminant Dictionary Learning for Graph Representation.
- **Citation key**: [zhang2024wasserstein]
- **Identifier**: DOI 10.1109/tpami.2024.3409772. Confirmed by a live lookup at https://doi.org/10.1109/tpami.2024.3409772.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence)
- **Method**: Input graphs are projected onto a dictionary of optimizable graph keys by Wasserstein and Kron-Gromov-Wasserstein couplings over nodes and edges, and a Wasserstein discriminant loss on the keys makes intra-class keys compact and inter-class keys dispersed.
- **Key Findings**: The abstract states that the discriminant loss on the graph dictionary bypasses the computation of global Wasserstein metric centers. It reports experiments on graph classification and cross-modal retrieval against existing methods, with ablations, and states that the results validate the framework; the abstract does not give numbers.
- **Relevance**: It addresses P2 with a reference set of graphs learned for a supervised loss, the transport analogue of a learned template for objects without node correspondence.
- **Quality**: Abstract read. Quick assessment 10 of 15 (Acceptable): journal ranking 3, rigor 2, relevance 2, citations 1, data 2. OpenAlex counts 2 citations.
- **Potential Use**: Related work (transport dictionaries and learnable templates).
- **Stance**: Supports, supervised learning of transport dictionaries for graph-level tasks.
- **Prediction setting**: other (graph-level classification and cross-modal retrieval), input graph; each label belongs to a graph sample, and the abstract names no subjects.
- **Correspondence handling**: learned template or barycenter; the paper calls the template a graph dictionary of graph keys, which are optimized from the data under the discriminant loss, and each input graph is coupled to the keys by Wasserstein and KGW transport.
- **Pipeline relation**: not applicable; the abstract names no imaging pipeline step.
- **Application domain**: other domain, graph pattern analysis (graph classification and cross-modal retrieval); the abstract does not name the datasets.
- **Theme tags**: T2d, T2e, T2b.
- **Theme**: added: handed on by Theme 2 (Zhang 2024 Wasserstein discriminant dictionary); merge screening reason: supervised Wasserstein graph dictionary for graph classification

#### Zhang et al. (2026). Deep Learning with Multiple Instance Learning Aids Cervical Lymph Node Detection and Metastasis Prediction in Laryngeal Cancer on Contrast-Enhanced CT.
- **Citation key**: [zhang2026deep]
- **Identifier**: DOI 10.2139/ssrn.7135982. Confirmed by a live lookup at https://doi.org/10.2139/ssrn.7135982.
- **Type**: Preprint (SSRN). Preprint, not peer-reviewed.
- **Method**: The LNSC model integrates automatically segmented lymph node images from preoperative contrast-enhanced CT with patient-level pathological information in a multiple instance learning framework to predict lymph node metastasis risk.
- **Key Findings**: In 473 patients with laryngeal squamous cell carcinoma (a training set of 218 and external validation sets of 174 and 81), the model reaches an AUC of 0.79 to 0.86 in the external sets. With model assistance the AUC of junior radiologists rises from 0.67 to 0.80 and that of senior radiologists from 0.76 to 0.83. The low-risk group defined by the model score has significantly longer overall survival (log-rank P below 0.05).
- **Relevance**: A patient-level predictor over the set of lymph nodes that an automatic segmentation finds in each patient, so it builds on lesion segmentation and pools a variable number of nodes (P1, P2, P3).
- **Quality**: Abstract read (Crossref record of the SSRN preprint). Quick assessment 10 of 15 (Acceptable): journal ranking 1, rigor 2, relevance 3, citations 1, data 3. OpenAlex counts 0 citations.
- **Potential Use**: Related work (multiple-instance learning and distribution regression; sets of lesions or regions and medical point clouds); Experimental baselines (MIL over segmented lymph nodes).
- **Stance**: Supports, that MIL over automatically segmented lymph nodes predicts metastasis and helps radiologists.
- **Prediction setting**: subject-level classification, input set of lesions or regions (the segmented lymph nodes of each patient); the model predicts lymph node metastasis per patient and its score stratifies survival.
- **Correspondence handling**: permutation invariance; the MIL framework pools the node images of a patient into one prediction, and the abstract does not name the pooling operator.
- **Pipeline relation**: builds on lesion segmentation; the instances are lymph nodes segmented automatically from the CT.
- **Application domain**: medical imaging, contrast-enhanced CT of the neck (laryngeal squamous cell carcinoma).
- **Theme tags**: T3c, T3d, `lesion-seg`.
- **Theme**: added: merge recent-literature search R4r (2024 to 2026)

#### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Citation key**: [zhao2013hopls]
- **Identifier**: DOI 10.1109/tpami.2012.254, confirmed at https://doi.org/10.1109/tpami.2012.254 through Crossref and OpenAlex; arXiv 1207.1230 is the preprint.
- **Type**: Journal article (IEEE TPAMI). Foundational work named for the theme.
- **Method**: Tensor-to-tensor regression through a sum of orthogonal Tucker tensors fitted by deflation, with the loadings obtained by higher-order SVD of a generalized cross-covariance tensor.
- **Key Findings**: The abstract reports better predictive ability than existing methods, suitability for small samples and robustness to noise, on synthetic data and on the decoding of 3D movement trajectories from electrocorticogram signals.
- **Relevance**: The higher-order PLS model of the theme scope; the comparison target of Park and Keles 2025 and the method McLeod et al. 2018 apply to cardiac motion.
- **Quality**: Abstract alone.
- **Potential Use**: Methods background on tensor PLS; the model whose high-dimensional consistency Park and Keles 2025 examine.
- **Stance**: Neutral.
- **Prediction setting**: Other (within-recording decoding of continuous movement trajectories), input tensor (ECoG channels by time by frequency); the outcome is a trajectory per time window, not a subject-level outcome.
- **Correspondence handling**: Assumes alignment; the electrode, time and frequency modes are shared by all samples of a recording.
- **Pipeline relation**: Not applicable; the input is an electrophysiological recording.
- **Application domain**: Other domain, neural decoding from electrocorticography in monkeys.
- **Theme tags**: T1-PLS.
- **Theme**: Theme 1

#### Zhao et al. (2021). Point Transformer.
- **Citation key**: [zhao2021point]
- **Type**: Conference paper (ICCV 2021).
- **Identifier**: DOI 10.1109/ICCV48922.2021.01595 (resolved at https://doi.org/10.1109/ICCV48922.2021.01595); CVF page https://openaccess.thecvf.com/content/ICCV2021/html/Zhao_Point_Transformer_ICCV_2021_paper.html read.
- **Method**: self-attention layers designed for point clouds.
- **Key Findings**: Self-attention networks are built for semantic scene segmentation, part segmentation and object classification. On S3DIS Area 5 the model reaches 70.4 percent mIoU, 3.3 points above the strongest prior model.
- **Relevance**: it is the attention-based point-cloud encoder of the theme scope.
- **Prediction setting**: other, object-level classification and point-level segmentation from a point cloud.
- **Correspondence handling**: permutation invariance (attention over local point neighbourhoods).
- **Pipeline relation**: not applicable.
- **Application domain**: other domain (indoor scenes, objects).
- **Theme tags**: T3b.
- **Quality**: abstract read on the CVF page. Peer-reviewed; OpenAlex cited_by_count 3554. Quick assessment 14 of 15.
- **Viewpoint**: supports.
- **Potential Use**: point transformers.
- **Theme**: Theme 3

#### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Citation key**: [zhou2013tensor]
- **Identifier**: DOI 10.1080/01621459.2013.776499, confirmed at https://doi.org/10.1080/01621459.2013.776499 through Crossref, OpenAlex and Semantic Scholar; arXiv 1203.3209 is the preprint.
- **Type**: Journal article (JASA). Foundational work named for the theme.
- **Method**: Generalized linear models with a tensor covariate whose coefficient array has a low CP rank, fitted by block relaxation with maximum likelihood and studied asymptotically; regularized variants with a lasso penalty.
- **Key Findings**: The abstract reports efficient estimation and prediction on synthetic and real MRI data. The text applies the model to the ADHD-200 sample (776 subjects, 47 removed) with age, gender and whole brain volume as further covariates.
- **Relevance**: The reference model of tensor regression on images. The text states that the T1-weighted images were preprocessed by steps that include segmentation and registration, and that RAVENS maps conform each brain to a template, so the voxel grid is aligned across subjects before the model is fitted.
- **Quality**: Abstract, and the introduction, the simulation and the ADHD data sections of the arXiv HTML full text. Seminal (OpenAlex counts 710 citations).
- **Potential Use**: The baseline that the alignment assumption of tensor regression rests on.
- **Stance**: Neutral.
- **Prediction setting**: Subject-level classification (ADHD versus control), input image on a grid (registered MRI as a tensor); the response is one label per subject.
- **Correspondence handling**: Registration to a common space; the coefficient tensor is indexed by voxel, which has a meaning only after every subject is registered to the template.
- **Pipeline relation**: Builds on registration; the paper uses registered and segmented images as its covariates.
- **Application domain**: Medical imaging, structural MRI of the brain.
- **Theme tags**: T1-TR.
- **Theme**: Theme 1

#### Zwanenburg et al. (2019). Assessing robustness of radiomic features by image perturbation.
- **Citation key**: [zwanenburg2019assessing]
- **Identifier**: DOI 10.1038/s41598-018-36938-4. Confirmed by a live lookup at https://doi.org/10.1038/s41598-018-36938-4.
- **Type**: Journal article (Scientific Reports)
- **Method**: Eighteen combinations of image perturbations (noise addition, translation, rotation, volume growth or shrinkage and supervoxel-based contour randomisation) are compared with test-retest imaging for judging the robustness of 4032 radiomic features from the gross tumour volume on CT.
- **Key Findings**: Robustness was defined by the 95% confidence interval of ICC(1,1) being at least 0.90, in 31 NSCLC and 19 HNSCC patients. The NTCV, TCV, RNCV and RCV perturbation chains gave similar results and the fewest false positive robust features (NSCLC 0.2 to 0.9%, HNSCC 1.7 to 1.9%), so the authors propose them as an alternative to test-retest imaging.
- **Relevance**: It addresses P3 by measuring how radiomic features vary under segmentation and acquisition perturbations.
- **Quality**: Abstract read. Quick assessment 12 of 15 (High): journal ranking 3, rigor 3, relevance 2, citations 3, data 1. OpenAlex counts 295 citations. Small study (50 patients, 31 NSCLC and 19 HNSCC).
- **Potential Use**: Discussion and limitations (robustness of radiomics to contour and acquisition variation).
- **Stance**: Supports, image perturbation chains as a substitute for test-retest imaging in robustness assessment.
- **Prediction setting**: representation or comparison only, no prediction, input image on a grid; the study measures feature robustness and fits no outcome model.
- **Correspondence handling**: not applicable; features are computed per tumour volume and no cross-subject correspondence is used.
- **Pipeline relation**: builds on radiomics; measures how a pipeline step fails; contour randomisation and volume changes perturb the segmentation and the resulting feature instability is measured.
- **Application domain**: medical imaging, CT, lung (non-small-cell lung cancer) and head and neck (squamous cell carcinoma).
- **Theme tags**: `radiomics`, `lesion-seg`, `failure`.
- **Theme**: added: handed on by Theme 4 (Zwanenburg 2019 perturbation); merge screening reason: feature robustness under image perturbation including contour randomisation (31 and 19 patients)

#### Zwanenburg, Vallieres, Abdalah, et al. (2020). The Image Biomarker Standardization Initiative: standardized quantitative radiomics for high-throughput image-based phenotyping.
- **Citation key**: [zwanenburg2020image]
- **Type**: Journal article (Radiology)
- **Identifier**: DOI 10.1148/radiol.2020191145, PMID 32154773; confirmed at https://doi.org/10.1148/radiol.2020191145 (resolves to the RSNA landing page, which answered 403 to the automated request after the redirect) and the PubMed record.
- **Method**: Three-phase consensus study: 25 teams computed 487 features of a digital phantom, 15 teams computed 1,347 derived features from a lung-cancer CT under fixed processing, and reproducibility was then assessed on multimodality images of 51 soft-tissue sarcoma patients.
- **Key Findings**: Consensus on reference values was weak for 76.8 percent of features at phase I and 65.4 percent at phase II at the start, and weak for 0.4 and 1.4 percent at the final iteration. 169 of 174 features were standardized, and most could be reproduced on CT, PET and MRI.
- **Relevance**: It quantifies how much the radiomics step depends on implementation, before any question of segmentation or scanner.
- **Quality**: Abstract read. Named foundational work.
- **Potential Use**: Standard definitions of radiomic features; evidence on implementation variability.
- **Viewpoint**: neutral.
- **Prediction setting**: representation or comparison only, no prediction; image on a grid (CT, FDG PET, T1-weighted MRI).
- **Correspondence handling**: not applicable; features are per region.
- **Pipeline relation**: builds on radiomics; measures how a pipeline step fails (disagreement between software implementations).
- **Application domain**: medical imaging, CT, PET and MRI, lung cancer and soft-tissue sarcoma.
- **Theme tags**: `radiomics`, `failure`.
- **Theme**: Theme 4

### Literature Matrix

Columns: P1 is the prediction setting (reg subject-level regression, cls subject-level classification, other a prediction of another unit, none no prediction). P2 is the correspondence handling (registration, template for a learned template or barycenter, transport for a transport coupling, perm-inv for permutation invariance, assumes for assumed alignment, n/a). Registration, Radiomics and Lesion seg give the pipeline relation to each step (removes, builds, measures, or empty when the step plays no part). Theme names the theme run or, for an added source, the stream that found it.

| Source | Year | P1 | P2 | Registration | Radiomics | Lesion seg | Method | Quality | Theme |
|---|---|---|---|---|---|---|---|---|---|
| [abulnaga2025multimorph] | 2025 | none | template | builds |  |  | Method | High | Theme 4 |
| [acar2022tracing] | 2022 | none | registration | builds |  |  | Application | Medium | Theme 1 |
| [adams2023point] | 2023 | none | perm-inv | removes |  |  | Method | Medium | added (T4) |
| [aerts2014decoding] | 2014 | reg | n/a |  | builds | builds | Application | High | Theme 4 |
| [afshar2020taste] | 2020 | cls | template |  |  |  | Method | Medium | added (T1) |
| [agueh2011barycenters] | 2011 | none | template |  |  |  | Theory | High | Theme 2 |
| [ahmadi2026hippocampal] | 2026 | cls | perm-inv |  |  | builds | Method | Medium | added (recent) |
| [altschuler2022wasserstein] | 2022 | none | template |  |  |  | Theory | High | Theme 2 |
| [amir2023neural] | 2023 | none | perm-inv |  |  |  | Theory | High | Theme 3 |
| [amir2025fourier] | 2025 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [arachchige2026segmentation] | 2026 | other | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [aramayo2023uncovering] | 2023 | none | transport |  |  |  | Benchmark | Medium | added (T2) |
| [ashburner2000voxel] | 2000 | none | registration | builds |  |  | Method | High | Theme 4 |
| [avants2008symmetric] | 2008 | none | registration | builds |  |  | Method | High | Theme 4 |
| [awate2017kernel] | 2017 | reg | perm-inv | removes |  |  | Method | Medium | added (search) |
| [bai2025linear] | 2025 | other | transport |  |  |  | Method | Medium | added (fwd) |
| [balagurunathan2014reproducibility] | 2014 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (T4) |
| [balakrishnan2019voxelmorph] | 2019 | none | registration | builds |  |  | Method | High | Theme 4 |
| [barbarant2026functional] | 2026 | cls | template | builds |  |  | Benchmark | Medium | Theme 2 |
| [basu2014detecting] | 2014 | other | transport |  | removes |  | Method | High | added (back) |
| [bates2003voxel] | 2003 | none | registration | builds |  | builds | Method | High | Theme 4 |
| [bazeille2019local] | 2019 | other | template | builds |  |  | Method | High | Theme 2 |
| [bazeille2021empirical] | 2021 | cls | transport | builds, measures |  |  | Benchmark | High | Theme 2 |
| [beckmann2026generalizations] | 2026 | other | transport |  |  |  | Theory | Medium | added (recent) |
| [beetz20233d] | 2023 | cls | perm-inv |  | removes |  | Application | High | added (T3) |
| [beetz2023multi] | 2023 | cls | perm-inv |  | removes |  | Method | High | added (T4) |
| [beetz20253d] | 2025 | cls | perm-inv |  |  |  | Method | High | added (T3) |
| [belkhatir2022wasserstein] | 2022 | cls | template |  | builds |  | Method | Medium | Theme 2 |
| [benamou2015iterative] | 2015 | none | template |  |  |  | Method | High | Theme 2 |
| [benveniste2026longitudinal] | 2026 | other | registration | builds, measures |  | builds | Benchmark | Medium | added (T4) |
| [besson2021geometric] | 2021 | reg | registration | builds | removes |  | Method | High | added (T3) |
| [bizjak2021deep] | 2021 | cls | perm-inv |  | removes | builds | Method | Medium | added (T3) |
| [bloemreddy2020probabilistic] | 2020 | none | perm-inv |  |  |  | Theory | High | added (T3) |
| [bro1996multiway] | 1996 | other | assumes |  |  |  | Method | High | Theme 1 |
| [bro1999parafac2] | 1999 | none | template |  |  |  | Application | High | Theme 1 |
| [brogatmotte2022learning] | 2022 | other | template |  |  |  | Method | High | Theme 2 |
| [bruggner2014automated] | 2014 | cls | template |  |  |  | Method | High | added (back) |
| [bueno2021representation] | 2021 | none | perm-inv |  |  |  | Theory | High | added (T3) |
| [cama2024study] | 2024 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (recent) |
| [cama2025segmentation] | 2025 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | Theme 4 |
| [campanella2019clinical] | 2019 | cls | perm-inv |  |  | removes | Method | High | Theme 3 |
| [canalini2022quantitative] | 2022 | none | registration | builds, measures |  |  | Benchmark | Medium | added (T4) |
| [chang2020automatic] | 2020 | cls | perm-inv |  |  |  | Method | High | added (back) |
| [chauvin2019analyzing] | 2019 | cls | perm-inv |  |  |  | Method | High | added (search) |
| [chen2020optimal] | 2020 | other | template |  |  |  | Method | Medium | added (back) |
| [chen2021aminn] | 2021 | cls | perm-inv |  | builds | builds | Method | Medium | Theme 3 |
| [chen2021whole] | 2021 | reg | perm-inv |  |  | removes | Method | High | added (T3) |
| [chen2022lung] | 2022 | cls | perm-inv |  | builds | builds | Method | High | added (T3) |
| [chen2023wasserstein] | 2023 | other | transport |  |  |  | Method | High | added (T2) |
| [chen2024tractgeonet] | 2024 | reg | perm-inv |  |  |  | Method | High | added (T3) |
| [chen2026distributionally] | 2026 | other | perm-inv |  |  |  | Method | Medium | added (fwd) |
| [chen2026enhancing] | 2026 | cls | template |  |  |  | Method | High | added (search) |
| [chen2026lumir] | 2026 | none | registration | builds, measures |  |  | Benchmark | High | added (T4) |
| [chen2026screening] | 2026 | cls | perm-inv | removes |  |  | Benchmark | High | added (T3) |
| [choi2020idh1] | 2020 | cls | n/a |  | builds | builds, measures | Application | Medium | added (T4) |
| [choi2025prediction] | 2025 | other | perm-inv |  |  | builds | Application | High | added (T3) |
| [choi2026tumor] | 2026 | cls | registration | builds, measures |  |  | Benchmark | Medium | added (recent) |
| [ciszewski2026decision] | 2026 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (fwd) |
| [cohen2018nonnegative] | 2018 | none | template |  |  |  | Method | Medium | added (T1) |
| [cole2017predicting] | 2017 | reg | registration | removes, measures |  |  | Method | High | Theme 4 |
| [collenne2024reset] | 2024 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [commowick2018objective] | 2018 | none | n/a |  |  | builds, measures | Benchmark | High | Theme 4 |
| [consagra2024continuous] | 2024 | none | assumes | removes |  |  | Method | Medium | added (T1) |
| [costafreda2011automated] | 2011 | cls | registration | builds |  |  | Application | High | added (back) |
| [cuingnet2011automatic] | 2011 | cls | registration | builds, measures |  |  | Benchmark | High | added (back) |
| [cuturi2013sinkhorn] | 2013 | none | transport |  |  |  | Method | High | Theme 2 |
| [cuturi2014fast] | 2014 | none | template |  |  |  | Method | High | Theme 2 |
| [dadashkarimi2023cross] | 2023 | other | transport | builds |  |  | Method | Medium | added (T2) |
| [dalca2019learning] | 2019 | none | template | builds |  |  | Method | High | Theme 4 |
| [dannecker2026cinema] | 2026 | none | template | removes |  |  | Method | High | added (T4) |
| [davidson2025holder] | 2025 | none | perm-inv |  |  |  | Theory | Medium | Theme 3 |
| [devilliers2017inconsistency] | 2017 | none | template | measures |  |  | Theory | Medium | added (search) |
| [devries2025geometric] | 2025 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [devries2025interpretable] | 2025 | other | perm-inv |  |  |  | Method | High | added (fwd) |
| [dietterich1997solving] | 1997 | other | perm-inv |  |  |  | Method | High | added (back) |
| [ding2026application] | 2026 | cls | perm-inv |  |  |  | Application | High | added (fwd) |
| [dole2025enhancing] | 2025 | cls | perm-inv |  |  | builds | Method | High | added (T3) |
| [dular2024extensive] | 2024 | reg | registration | builds, measures |  |  | Benchmark | High | Theme 4 |
| [dutta2024robustness] | 2024 | cls | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [egger2017mri] | 2017 | none | n/a |  |  | measures | Benchmark | High | added (T4) |
| [engelson2026deep] | 2026 | cls | registration | builds |  | removes | Method | Medium | added (search) |
| [fan2024amyloidpetnet] | 2024 | cls | n/a | removes |  |  | Method | High | added (T4) |
| [farazi2023tetcnn] | 2023 | cls | perm-inv |  |  |  | Method | Medium | added (search) |
| [feragen2013geometric] | 2013 | cls | perm-inv |  |  | builds | Method | Medium | added (search) |
| [ferrante2022application] | 2022 | cls | n/a |  | builds | builds, measures | Application | High | added (T4) |
| [feydy2019fast] | 2019 | none | transport |  |  |  | Method | Medium | added (T2) |
| [feydy2019interpolating] | 2019 | none | transport |  |  |  | Theory | High | added (T2) |
| [fornaconwood2020reliability] | 2020 | reg | n/a |  | builds, measures |  | Benchmark | Medium | Theme 4 |
| [francischello2026influence] | 2026 | other | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (recent) |
| [fujibayashi2021nonlinear] | 2021 | cls | registration | builds, measures |  |  | Benchmark | Medium | added (search) |
| [gacheva2026multiple] | 2026 | cls | perm-inv |  |  |  | Application | Medium | added (T3) |
| [gachon2025low] | 2025 | none | template |  |  |  | Method | High | added (T2) |
| [gachon2026scalable] | 2026 | none | template |  |  |  | Method | Medium | added (fwd) |
| [genevay2019sample] | 2019 | none | transport |  |  |  | Theory | High | Theme 2 |
| [gerber2018exploratory] | 2018 | reg | registration | builds |  |  | Method | Medium | Theme 2 |
| [ghosal2026penalized] | 2026 | reg | registration | builds | removes |  | Method | Medium | added (T1) |
| [gong2026robust] | 2026 | cls | transport | removes |  | builds | Method | Medium | Theme 2 |
| [gopinath2019adaptive] | 2019 | cls | registration | builds |  |  | Method | High | added (search) |
| [gramfort2015fast] | 2015 | none | template | builds |  |  | Method | High | Theme 2 |
| [granzier2020mri] | 2020 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [gutierrezbecker2021discriminative] | 2021 | cls | perm-inv | removes |  | builds | Method | High | Theme 3 |
| [haarburger2020radiomics] | 2020 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [han2020accurate] | 2020 | cls | perm-inv |  |  | removes | Method | High | added (T3) |
| [hanna2017predictive] | 2017 | cls | transport |  | removes | builds | Method | Medium | added (search) |
| [harshman1972parafac2] | 1972 | none | template |  |  |  | Theory | Medium | Theme 1 |
| [harshman1996uniqueness] | 1996 | none | n/a |  |  |  | Theory | High | Theme 1 |
| [harvey2026multi] | 2026 | cls | perm-inv |  |  | removes | Benchmark | High | Theme 3 |
| [he2023neural] | 2023 | none | registration | builds |  |  | Method | Medium | added (T4) |
| [hering2023learn2reg] | 2023 | none | registration | measures |  |  | Benchmark | High | added (T4) |
| [hindsholm2025prospective] | 2025 | cls | n/a |  |  | measures | Application | High | added (T4) |
| [hoffmann2024anatomy] | 2024 | none | registration | builds |  |  | Tool or dataset | High | added (T4) |
| [hosny2018deep] | 2018 | cls | n/a |  | removes | builds | Application | High | Theme 4 |
| [hu2023overall] | 2023 | cls | registration | builds |  | builds | Method | Medium | added (T4) |
| [huang2026shift] | 2026 | cls | registration | builds, measures |  |  | Method | Medium | Theme 1 |
| [iglesias2026accuracy] | 2026 | none | registration | builds, measures |  |  | Benchmark | High | added (T4) |
| [ilse2018attention] | 2018 | cls | perm-inv |  |  |  | Method | High | Theme 3 |
| [iporrerivas2026benchmarking] | 2026 | cls | n/a |  |  |  | Benchmark | Medium | added (fwd) |
| [isensee2021nnu] | 2021 | none | n/a |  |  | builds | Method | High | Theme 4 |
| [isensee2024nnu] | 2024 | none | n/a |  |  | measures | Benchmark | High | added (T4) |
| [islam2026neuroaps] | 2026 | cls | perm-inv |  |  |  | Method | Medium | added (T3) |
| [janati2020debiased] | 2020 | none | template |  |  |  | Method | High | Theme 2 |
| [jia20243d] | 2024 | reg | perm-inv |  |  |  | Method | High | added (T3) |
| [joshi2004unbiased] | 2004 | none | template | builds |  |  | Method | High | Theme 4 |
| [kachaiev2024learning] | 2024 | other | perm-inv |  |  |  | Method | Medium | added (fwd) |
| [kag2026attention] | 2026 | other | n/a |  |  | measures | Benchmark | High | added (T3) |
| [kalpathycramer2016radiomics] | 2016 | none | n/a |  | builds, measures | measures | Benchmark | Medium | added (T4) |
| [kan20263d] | 2026 | none | transport |  |  |  | Tool or dataset | Medium | added (fwd) |
| [karimzadeh2026revisiting] | 2026 | cls | perm-inv | builds | builds | builds | Benchmark | Medium | Theme 3 |
| [kazmierski2023multi] | 2023 | reg | n/a |  | builds, measures | builds | Benchmark | High | added (T4) |
| [kiers1999parafac2] | 1999 | none | template |  |  |  | Method | High | Theme 1 |
| [klein2009evaluation] | 2009 | none | registration | measures |  |  | Benchmark | High | Theme 4 |
| [kolda2009tensor] | 2009 | none | n/a |  |  |  | Review | High | Theme 1 |
| [kolouri2016sliced] | 2016 | other | transport |  |  |  | Method | Medium | added (back) |
| [kolouri2021wasserstein] | 2021 | other | transport |  |  |  | Method | High | added (T2) |
| [kothapalli2024equivariant] | 2024 | other | perm-inv |  |  |  | Benchmark | Medium | added (T3) |
| [kothari2022impact] | 2022 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [kovacs2023addressing] | 2023 | cls | registration | removes, measures |  |  | Method | High | added (T1) |
| [kralik2026identifying] | 2026 | none | template |  |  |  | Method | Medium | Theme 1 |
| [kuang2020shift] | 2020 | none | registration | builds |  |  | Method | Medium | Theme 1 |
| [kundu2018discovery] | 2018 | reg | transport |  | removes |  | Method | High | added (T2) |
| [kundu2020enabling] | 2020 | cls | transport |  | removes |  | Application | Medium | Theme 2 |
| [kundu2024discovering] | 2024 | cls | transport |  |  |  | Method | High | added (T2) |
| [kusner2015word] | 2015 | other | transport |  |  |  | Method | High | added (back) |
| [kwon2025graph] | 2025 | cls | template |  |  |  | Method | High | added (T2) |
| [lambin2012radiomics] | 2012 | none | n/a |  | builds | builds | Review | Medium | Theme 4 |
| [law2018bayesian] | 2018 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [lee2019set] | 2019 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [leijenaar2013stability] | 2013 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [leung2024deep] | 2024 | cls | n/a |  | builds | builds | Method | High | added (T4) |
| [li2018tucker] | 2018 | reg | registration | builds |  |  | Method | High | Theme 1 |
| [li2021closer] | 2021 | other | perm-inv | measures |  |  | Method | High | Theme 3 |
| [li2025quantile] | 2025 | cls | transport |  |  |  | Method | Medium | added (recent) |
| [liao2019evaluate] | 2019 | cls | perm-inv |  | removes | removes | Method | High | Theme 3 |
| [liu2025lesion] | 2025 | cls | n/a |  |  | builds | Method | Medium | added (T4) |
| [liu2026three] | 2026 | reg | perm-inv | builds |  |  | Method | Medium | added (T3) |
| [louis2024identification] | 2024 | cls | n/a |  | builds, measures | builds, measures | Application | High | added (T4) |
| [lu2021data] | 2021 | cls | perm-inv |  | removes | removes | Method | High | Theme 3 |
| [luo2023prediction] | 2023 | cls | perm-inv |  | removes |  | Application | High | added (T3) |
| [luo2026bayesian] | 2026 | none | template | builds |  |  | Method | High | added (T4) |
| [ma2024canonicalization] | 2024 | other | registration |  |  |  | Theory | High | added (T3) |
| [mahan2024point] | 2024 | other | transport |  |  |  | Method | Medium | added (T2) |
| [marchewka2014influence] | 2014 | none | registration | builds, measures |  |  | Benchmark | High | added (T4) |
| [maron1997framework] | 1997 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [mazelet2026learning] | 2026 | none | template | removes |  |  | Method | Medium | Theme 2 |
| [mcleod2018cardiac] | 2018 | reg | registration | builds |  |  | Method | Medium | Theme 1 |
| [memoli2011gromov] | 2011 | none | transport |  |  |  | Theory | High | Theme 2 |
| [menze2015multimodal] | 2015 | none | n/a |  |  | builds, measures | Benchmark | High | Theme 4 |
| [mi2017optimal] | 2017 | cls | transport | builds |  |  | Method | Medium | Theme 2 |
| [mialon2021trainable] | 2021 | other | template |  |  |  | Method | High | Theme 2 |
| [miller2025comparison] | 2025 | none | registration | measures |  | builds | Benchmark | Medium | added (T4) |
| [miteva2026segmentation] | 2026 | reg | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (recent) |
| [moosmuller2023linear] | 2023 | other | transport |  |  |  | Theory | High | Theme 2 |
| [morup2008shift] | 2008 | none | template |  |  |  | Method | High | Theme 1 |
| [muandet2012learning] | 2012 | other | perm-inv |  |  |  | Method | High | added (back) |
| [muandet2017kernel] | 2017 | none | perm-inv |  |  |  | Review | High | Theme 3 |
| [mullerfranzes2022reliability] | 2022 | reg | n/a |  | builds, measures | measures | Benchmark | Medium | added (T4) |
| [murphy2019janossy] | 2019 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [naderializadeh2021pooling] | 2021 | other | transport |  |  |  | Method | Medium | added (T2) |
| [naderializadeh2024aggregating] | 2024 | other | transport |  |  |  | Method | Medium | added (fwd) |
| [naderializadeh2025constrained] | 2025 | other | transport |  |  |  | Method | Medium | added (fwd) |
| [nguyen2023linear] | 2023 | other | transport |  |  |  | Method | High | added (T2) |
| [nikolentzos2025lipschitz] | 2025 | none | perm-inv |  |  |  | Theory | Medium | added (fwd) |
| [oner2023distribution] | 2023 | other | perm-inv |  |  | removes | Method | Medium | added (T3) |
| [ou2014comparative] | 2014 | none | registration | builds, measures |  |  | Benchmark | High | added (T4) |
| [pandilova2026multi] | 2026 | none | registration | builds, measures |  | builds, measures | Benchmark | High | added (search) |
| [paquier2022radiomics] | 2022 | none | n/a |  | builds, measures |  | Benchmark | Medium | added (T4) |
| [park2025sparse] | 2025 | other | assumes |  |  |  | Theory | High | Theme 1 |
| [parmar2014robust] | 2014 | none | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (T4) |
| [pasini2023critical] | 2023 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (T4) |
| [patalano2026par2cox] | 2026 | reg | template |  |  |  | Method | Medium | Theme 1 |
| [pathan2026flowlot] | 2026 | cls | transport |  |  |  | Method | Medium | added (fwd) |
| [pavic2018influence] | 2018 | none | n/a |  | builds, measures | builds, measures | Benchmark | Medium | Theme 4 |
| [peng2025ct] | 2025 | cls | perm-inv |  | builds | builds | Application | Medium | added (recent) |
| [peng2026wasserstein] | 2026 | cls | template |  |  |  | Method | Medium | added (T2) |
| [perezngonzalez2019automatic] | 2019 | cls | registration | builds |  |  | Method | Medium | added (search) |
| [peyre2016gromov] | 2016 | other | template |  |  |  | Method | High | Theme 2 |
| [peyre2019computational] | 2019 | none | transport |  |  |  | Review | High | Theme 2 |
| [poirot2022robustness] | 2022 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | Theme 4 |
| [prokudin2019efficient] | 2019 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [puny2022frame] | 2022 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [qaiser2021multiple] | 2021 | cls | perm-inv |  |  | removes | Method | Medium | added (T3) |
| [qi2017pointnet] | 2017 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [qi2017pointnetpp] | 2017 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [qian2024reimagining] | 2024 | other | template |  |  |  | Method | Medium | added (fwd) |
| [qiu2019reproducibility] | 2019 | cls | n/a |  | builds, measures | builds, measures | Benchmark | Medium | added (T4) |
| [qiu2023qcresunet] | 2023 | other | n/a |  |  | builds, measures | Method | Medium | added (T4) |
| [raff2023reproducibility] | 2023 | other | perm-inv |  |  |  | Benchmark | High | Theme 3 |
| [ravikumar2019generalised] | 2019 | none | template | builds |  |  | Method | Medium | added (T3) |
| [ren2023multipar] | 2023 | cls | template |  |  |  | Method | Medium | Theme 1 |
| [ren2026otsurv] | 2026 | reg | transport |  |  |  | Method | High | added (T4) |
| [rioux2024entropic] | 2024 | none | transport |  |  |  | Theory | High | Theme 2 |
| [rohlfing2012image] | 2012 | none | registration | measures |  |  | Benchmark | High | added (back) |
| [saha2018breast] | 2018 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [sanchez2026quality] | 2026 | cls | n/a |  | builds | builds, measures | Benchmark | High | added (T3) |
| [sarasua2021geometric] | 2021 | cls | registration | builds |  |  | Benchmark | Medium | added (T3) |
| [sarasua2022hippocampal] | 2022 | cls | perm-inv | builds |  | builds, measures | Benchmark | High | Theme 3 |
| [scetbon2022linear] | 2022 | none | transport |  |  |  | Method | High | Theme 2 |
| [schmitz2018wasserstein] | 2018 | none | template |  |  |  | Method | High | Theme 2 |
| [scott2026negative] | 2026 | cls | n/a |  | builds, measures | builds | Tool or dataset | High | added (fwd) |
| [sejourne2021unbalanced] | 2021 | none | transport |  |  |  | Theory | High | Theme 2 |
| [shakeri2016deep] | 2016 | cls | registration | builds |  |  | Method | High | added (back) |
| [shao2021transmil] | 2021 | cls | perm-inv |  |  | removes | Method | High | added (T3) |
| [shao2022patient] | 2022 | cls | perm-inv |  |  | removes | Method | High | added (T3) |
| [shi2016shape] | 2016 | cls | transport |  |  |  | Method | Medium | added (T2) |
| [shifaterabbi2025linear] | 2025 | other | transport |  |  |  | Method | Medium | added (search) |
| [siless2020registration] | 2020 | none | n/a | removes |  |  | Method | Medium | added (T4) |
| [simpson2013ensemble] | 2013 | cls | registration | builds, measures |  |  | Method | High | Theme 4 |
| [sinclair2022atlas] | 2022 | other | template | builds |  |  | Method | High | added (T4) |
| [sineglazov2026impact] | 2026 | cls | n/a |  | builds | builds, measures | Benchmark | Medium | added (fwd) |
| [skianis2020rep] | 2020 | other | template |  |  |  | Method | High | added (T3) |
| [soelch2019deep] | 2019 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [solomon2016entropic] | 2016 | none | transport |  |  |  | Method | High | added (T2) |
| [song2024morphological] | 2024 | cls | template |  |  |  | Method | High | added (fwd) |
| [su2015optimal] | 2015 | none | transport | builds |  |  | Method | Medium | added (T2) |
| [su2015shape] | 2015 | cls | transport | removes |  |  | Method | Medium | Theme 2 |
| [suinesiaputra2018statistical] | 2018 | cls | assumes |  |  |  | Benchmark | High | added (back) |
| [szabo2016learning] | 2016 | other | perm-inv |  |  |  | Theory | High | Theme 3 |
| [tang2019individualized] | 2019 | cls | template | removes |  |  | Method | High | Theme 1 |
| [tang2026metabolic] | 2026 | cls | registration | builds |  |  | Method | Medium | added (search) |
| [tang2026tensor] | 2026 | none | template |  |  |  | Method | High | Theme 1 |
| [thual2022aligning] | 2022 | none | transport | removes |  |  | Method | High | Theme 2 |
| [tilwani2025benchmarking] | 2025 | reg | registration | builds, measures |  | builds | Benchmark | High | added (T4) |
| [tixier2019reliability] | 2019 | none | n/a |  | builds, measures | builds, measures | Benchmark | High | added (T4) |
| [togninalli2019wasserstein] | 2019 | other | transport |  |  |  | Method | Medium | added (T2) |
| [toosi2024segmentation] | 2024 | reg | n/a |  | removes | removes | Method | Medium | Theme 4 |
| [torres2021end] | 2021 | reg | n/a |  |  | removes | Method | High | added (T4) |
| [tosun2015detection] | 2015 | cls | transport |  | removes | builds | Application | Medium | added (search) |
| [tran2025comparing] | 2025 | cls | n/a |  | builds | builds | Application | High | added (T4) |
| [tu2020computing] | 2020 | cls | transport |  |  |  | Method | Medium | added (search) |
| [vanchhay2026foundation] | 2026 | other | perm-inv |  |  |  | Benchmark | Medium | added (T3) |
| [vangriethuysen2017computational] | 2017 | none | n/a |  | builds | builds | Tool or dataset | High | Theme 4 |
| [vayer2019optimal] | 2019 | other | transport |  |  |  | Method | High | Theme 2 |
| [vincentcuaz2021online] | 2021 | none | template |  |  |  | Method | High | Theme 2 |
| [vincentcuaz2022template] | 2022 | other | template |  |  |  | Method | High | Theme 2 |
| [vinyals2016order] | 2016 | other | perm-inv |  |  |  | Method | High | added (T3) |
| [vosylius2020geometric] | 2020 | reg | perm-inv |  |  |  | Method | Medium | added (T3) |
| [wagstaff2019limitations] | 2019 | none | perm-inv |  |  |  | Theory | High | Theme 3 |
| [wagstaff2022universal] | 2022 | none | perm-inv |  |  |  | Theory | High | added (T3) |
| [wang2013linear] | 2013 | other | transport |  |  |  | Method | High | added (T2) |
| [wang2018revisiting] | 2018 | other | perm-inv |  |  |  | Method | High | added (back) |
| [wang2019dynamic] | 2019 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [wang2020hierarchical] | 2020 | cls | perm-inv |  |  | builds | Method | Medium | added (T3) |
| [wang2023bingo] | 2023 | none | registration | builds |  |  | Method | High | added (search) |
| [wang2024graph] | 2024 | other | template |  |  |  | Method | High | added (T2) |
| [wang2024polynomial] | 2024 | none | perm-inv |  |  |  | Theory | Medium | Theme 3 |
| [wang2025linearized] | 2025 | cls | transport |  |  |  | Method | Medium | Theme 2 |
| [wang2026segmentation] | 2026 | cls | n/a |  | builds, measures | builds, measures | Application | Medium | added (fwd) |
| [welch2019vulnerabilities] | 2019 | reg | n/a |  | builds, measures | builds | Benchmark | High | added (back) |
| [whybra2024image] | 2024 | none | n/a |  | builds, measures |  | Benchmark | High | added (T4) |
| [wiers2026geometry] | 2026 | cls | perm-inv |  |  |  | Method | Medium | added (recent) |
| [willette2023scalable] | 2023 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [wood2022accurate] | 2022 | reg | n/a | removes |  |  | Method | High | added (T4) |
| [wu2022multicohort] | 2022 | reg | assumes |  |  |  | Method | High | added (T3) |
| [wynen2025conflunet] | 2025 | none | n/a |  |  | builds, measures | Method | Medium | Theme 4 |
| [xiong2026integrating] | 2026 | cls | registration | builds, measures | builds |  | Application | High | added (search) |
| [xu2020gromov] | 2020 | none | template |  |  |  | Method | High | Theme 2 |
| [xu2023regularized] | 2023 | other | perm-inv |  |  |  | Method | High | added (search) |
| [xu2024hybrid] | 2024 | cls | perm-inv |  | builds | builds | Method | High | added (T3) |
| [xu2024tensor] | 2024 | reg | assumes |  |  |  | Method | Medium | Theme 1 |
| [xue2023tractcloud] | 2023 | none | n/a | removes |  |  | Method | High | Theme 4 |
| [yan2026gwdro] | 2026 | other | template |  |  |  | Method | High | added (T2) |
| [yang2020relational] | 2020 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [yang2024histopathology] | 2024 | reg | perm-inv |  |  | builds | Method | Medium | added (fwd) |
| [yang2025pointchd] | 2025 | cls | perm-inv |  |  |  | Tool or dataset | High | added (T3) |
| [yao2020whole] | 2020 | reg | perm-inv |  |  | removes | Method | High | added (T3) |
| [yi2021cytoset] | 2021 | cls | perm-inv |  |  |  | Method | Medium | added (T3) |
| [yin2020logpar] | 2020 | cls | template |  |  |  | Method | Medium | added (T1) |
| [yu2021local] | 2021 | none | n/a |  |  |  | Benchmark | Medium | Theme 1 |
| [yu2023deep] | 2023 | other | perm-inv |  |  |  | Theory | Medium | added (T3) |
| [yuan2026bagshift] | 2026 | cls | perm-inv |  |  | measures | Benchmark | High | added (T3) |
| [zaheer2017deep] | 2017 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [zamorski2020comparison] | 2020 | other | perm-inv |  |  |  | Benchmark | Medium | added (T3) |
| [zare2025permutation] | 2025 | cls | perm-inv |  |  |  | Method | High | added (T3) |
| [zhang2020fspool] | 2020 | other | perm-inv |  |  |  | Method | Medium | added (back) |
| [zhang2021cortical] | 2021 | none | transport |  |  |  | Method | Medium | added (search) |
| [zhang2022set] | 2022 | other | perm-inv |  |  |  | Method | Medium | added (T3) |
| [zhang2024wasserstein] | 2024 | other | template |  |  |  | Method | Medium | added (T2) |
| [zhang2026deep] | 2026 | cls | perm-inv |  |  | builds | Method | Medium | added (recent) |
| [zhao2013hopls] | 2013 | other | assumes |  |  |  | Method | High | Theme 1 |
| [zhao2021point] | 2021 | other | perm-inv |  |  |  | Method | High | Theme 3 |
| [zhou2013tensor] | 2013 | cls | registration | builds |  |  | Method | High | Theme 1 |
| [zwanenburg2019assessing] | 2019 | none | n/a |  | builds, measures | measures | Method | High | added (T4) |
| [zwanenburg2020image] | 2020 | none | n/a |  | builds, measures |  | Benchmark | High | Theme 4 |

Column counts: P1 cls 101, reg 30, other 75, none 97; P2 perm-inv 92, template 50, transport 48, registration 45, assumes 7, n/a 61; Registration 77, Radiomics 62, Lesion seg 86 non-empty.

### Identified Gaps

Each gap names the included sources that come nearest to it and the searches that returned nothing for it. The searches of the theme runs are named by the theme and the query numbers of their files; the searches of this merge are named as recorded in the Search Strategy (M, N, P, R and the citation rounds).

1. **No tensor model with an unaligned spatial mode predicts a subject-level outcome, and no tensor model is fitted after a transport alignment.** PARAFAC2 and its fitting algorithms leave one mode unaligned [harshman1972parafac2, kiers1999parafac2, bro1999parafac2], and the supervised variants predict from electronic health records with an irregular time mode [ren2023multipar, patalano2026par2cox, afshar2020taste, yin2020logpar]. The individualized tensor model keeps a shared pixel grid [tang2019individualized], and the shift-tolerant models shift a time mode [morup2008shift, kuang2020shift, huang2026shift]. Theme 1 found none in queries 4, 8, 20, 26, 27, 43 to 45, 57 to 59, 77 and 78. The merge intersection searches M1a (0 records), M1b (0), M1c (2, both off topic) and the relaxed M1r (71 records, all screened) and M4a (0) and M4r (24) found none either. Type: methodological gap.

2. **No method predicts a subject-level outcome from the set of a patient's lesions without lesion segmentation or detection upstream.** The lesion-set and nodule-set predictors take delineated or detected lesions as instances [yang2020relational, chen2022lung, qaiser2021multiple, xu2024hybrid, shao2022patient, wang2020hierarchical, peng2025ct], and the transport survival model works on slide patches [ren2026otsurv]. The nearest removal is a lymph node classifier on PET/CT trained without pixel annotations, which still uses atlas-to-patient registration [engelson2026deep]. Themes 2, 3 and 4 report none in their lesion-set queries (Theme 2 queries 15, 48 and 52). The merge searches M3b (0 records), M5a (2), N1r (2), PubMed P1 (8) and P5 (11), and the recent-literature search R4r (37) found none. Type: methodological gap.

3. **The correspondence step is rarely evaluated by the subject-level prediction it feeds.** The comparisons of a registration-free predictor with the same predictor on registered data are of image-grid models and radiomics: nonlinear registration against native space for a convolutional classifier [fujibayashi2021nonlinear], standard against native space radiomics [xiong2026integrating], raw against normalized brain age models [cole2017predicting], preprocessing choices for deep models [dular2024extensive], DARTEL against unified segmentation in ten classifiers [cuingnet2011automatic], and three registrations for voxel-based dose analysis [choi2026tumor]. The transport studies compare alignment methods after anatomical registration [bazeille2021empirical, barbarant2026functional] or against voxel-based morphometry on affinely registered data [gerber2018exploratory]. The learned templates of registration are evaluated by alignment and atlas sharpness [joshi2004unbiased, dalca2019learning, abulnaga2025multimorph, sinclair2022atlas, dannecker2026cinema, luo2026bayesian], and the inconsistency of template estimation is shown in theory [devilliers2017inconsistency]. The transport templates that do feed a prediction are graph and point-cloud layers outside medicine [vincentcuaz2022template, wang2024graph, qian2024reimagining] or slide prototypes in pathology [song2024morphological]. No study compares a transport template or a set encoder with the same model on registered data. Theme 2 and Theme 4 report no such head-to-head study and no template evaluated by a downstream prediction. The merge searches N2a (4 records), N2r (55), PubMed P2 (13) and M3a (1), the IPMI search (421 records) and the backward citation round (620 records) found none. Type: methodological gap.

4. **The non-convexity of Gromov-Wasserstein is measured at the distance or coupling, never at a subject-level prediction.** The failure analyses report local minima, hardness and sample complexity of the problem itself [memoli2011gromov, rioux2024entropic, scetbon2022linear, sejourne2021unbalanced, aramayo2023uncovering], and the PARAFAC2 analogue reports local minima of the fit [yu2021local]. The one clinical GW model in the set aligns cohorts of lung nodules [yan2026gwdro]. Theme 2 queries 14, 26a, 49a, 49b and 51 and the merge searches N4a (10 records) and N4r (6) found no study of how initialization or local minima change a downstream prediction. Type: under-researched area.

5. **Segmentation variability is propagated into region-level radiomic predictors, never into a lesion-set, point-cloud or transport predictor.** The studies that carry segmentation variability to the model output use one tumor or region per patient [cama2024study, francischello2026influence, miteva2026segmentation, wang2026segmentation, sineglazov2026impact, ciszewski2026decision, haarburger2020radiomics, kothari2022impact, arachchige2026segmentation]. The set-size and expressivity limits of sum pooling are tested on synthetic and graph benchmarks [wagstaff2019limitations, wagstaff2022universal, amir2023neural]. Themes 3 and 4 report none, and the merge searches R3 (30 records), PubMed P4 (5) and the forward citation round (448 records screened) found none. Type: under-researched area.

### Recommended Sources by Paper Section

The paper the review serves is the later methods paper of the row Output role of `settings.md`, `[GAP: title or working title of the later paper]`. Its sections are taken as Introduction, Related work, Method background, Experimental baselines, and Discussion and limitations. The Related work rows list every source tagged with the strand; the Discussion row lists every source tagged as a failure analysis.

| Section | Key Sources |
|---|---|
| Introduction | [dietterich1997solving, lambin2012radiomics, aerts2014decoding, avants2008symmetric, ashburner2000voxel, menze2015multimodal, isensee2021nnu, harshman1972parafac2, zhou2013tensor, peyre2019computational, zaheer2017deep, qi2017pointnet, ilse2018attention, yang2020relational, gramfort2015fast] |
| Related work: Tensor regression and multiway PLS | [afshar2020taste, bro1996multiway, huang2026shift, li2018tucker, mcleod2018cardiac, park2025sparse, tang2019individualized, xu2024tensor, zhao2013hopls, zhou2013tensor] |
| Related work: Tensor decompositions with an unaligned mode | [acar2022tracing, afshar2020taste, bro1999parafac2, cohen2018nonnegative, ghosal2026penalized, harshman1972parafac2, kiers1999parafac2, kolda2009tensor, kralik2026identifying, kuang2020shift, morup2008shift, patalano2026par2cox, ren2023multipar, tang2019individualized, tang2026tensor, xu2024tensor, yin2020logpar] |
| Related work: Entropic transport and Sinkhorn | [benamou2015iterative, cuturi2013sinkhorn, cuturi2014fast, feydy2019fast, feydy2019interpolating, genevay2019sample, janati2020debiased, peyre2019computational, solomon2016entropic, xu2023regularized] |
| Related work: Gromov-Wasserstein and fused Gromov-Wasserstein | [aramayo2023uncovering, bai2025linear, memoli2011gromov, nguyen2023linear, peyre2016gromov, peyre2019computational, rioux2024entropic, scetbon2022linear, sejourne2021unbalanced, solomon2016entropic, thual2022aligning, vayer2019optimal, vincentcuaz2021online, vincentcuaz2022template, xu2020gromov, yan2026gwdro, zhang2024wasserstein] |
| Related work: Barycenters | [agueh2011barycenters, altschuler2022wasserstein, benamou2015iterative, brogatmotte2022learning, cuturi2014fast, feydy2019fast, gachon2025low, gachon2026scalable, gramfort2015fast, janati2020debiased, peyre2016gromov, peyre2019computational, schmitz2018wasserstein, yan2026gwdro] |
| Related work: Dictionaries and learnable templates | [barbarant2026functional, bazeille2019local, belkhatir2022wasserstein, brogatmotte2022learning, chen2020optimal, gachon2025low, gachon2026scalable, kwon2025graph, mazelet2026learning, mialon2021trainable, peng2026wasserstein, qian2024reimagining, schmitz2018wasserstein, skianis2020rep, song2024morphological, vincentcuaz2021online, vincentcuaz2022template, wang2024graph, xu2020gromov, zhang2024wasserstein] |
| Related work: Supervised prediction with transport | [bai2025linear, basu2014detecting, beckmann2026generalizations, belkhatir2022wasserstein, brogatmotte2022learning, chen2020optimal, chen2023wasserstein, gerber2018exploratory, gong2026robust, hanna2017predictive, kolouri2016sliced, kolouri2021wasserstein, kundu2018discovery, kundu2020enabling, kundu2024discovering, kusner2015word, li2025quantile, mahan2024point, mi2017optimal, mialon2021trainable, moosmuller2023linear, naderializadeh2021pooling, naderializadeh2024aggregating, naderializadeh2025constrained, nguyen2023linear, pathan2026flowlot, peng2026wasserstein, qian2024reimagining, ren2026otsurv, shi2016shape, shifaterabbi2025linear, su2015shape, tang2026metabolic, togninalli2019wasserstein, tosun2015detection, vayer2019optimal, vincentcuaz2022template, wang2013linear, wang2025linearized, zhang2024wasserstein] |
| Related work: Transport-based fusion and alignment in medical imaging | [barbarant2026functional, bazeille2019local, bazeille2021empirical, belkhatir2022wasserstein, dadashkarimi2023cross, gerber2018exploratory, gong2026robust, gramfort2015fast, hanna2017predictive, kan20263d, kundu2018discovery, kundu2020enabling, mazelet2026learning, mi2017optimal, su2015shape, thual2022aligning, tu2020computing, yan2026gwdro, zhang2021cortical] |
| Related work: Set encoders and their theory | [amir2023neural, amir2025fourier, bloemreddy2020probabilistic, bueno2021representation, chen2026distributionally, kothapalli2024equivariant, lee2019set, ma2024canonicalization, mahan2024point, murphy2019janossy, naderializadeh2021pooling, naderializadeh2024aggregating, naderializadeh2025constrained, nikolentzos2025lipschitz, puny2022frame, skianis2020rep, soelch2019deep, vinyals2016order, wagstaff2019limitations, wagstaff2022universal, wang2024polynomial, willette2023scalable, xu2023regularized, yi2021cytoset, zaheer2017deep, zare2025permutation, zhang2020fspool, zhang2022set] |
| Related work: Point-cloud networks | [adams2023point, amir2025fourier, beetz20233d, beetz2023multi, beetz20253d, besson2021geometric, bizjak2021deep, chang2020automatic, chen2021whole, chen2024tractgeonet, chen2026screening, choi2025prediction, devries2025geometric, devries2025interpretable, dole2025enhancing, gopinath2019adaptive, iporrerivas2026benchmarking, islam2026neuroaps, jia20243d, kothapalli2024equivariant, li2021closer, liu2026three, luo2023prediction, prokudin2019efficient, puny2022frame, qi2017pointnet, qi2017pointnetpp, sarasua2021geometric, vosylius2020geometric, wang2019dynamic, wiers2026geometry, yang2024histopathology, yang2025pointchd, zamorski2020comparison, zhao2021point] |
| Related work: Multiple-instance learning and distribution regression | [awate2017kernel, bruggner2014automated, campanella2019clinical, chen2021whole, chen2022lung, devries2025geometric, devries2025interpretable, dietterich1997solving, ding2026application, gacheva2026multiple, ghosal2026penalized, han2020accurate, harvey2026multi, ilse2018attention, kachaiev2024learning, karimzadeh2026revisiting, law2018bayesian, liao2019evaluate, lu2021data, maron1997framework, muandet2012learning, muandet2017kernel, oner2023distribution, peng2025ct, qaiser2021multiple, raff2023reproducibility, ren2026otsurv, shao2021transmil, shao2022patient, song2024morphological, szabo2016learning, vanchhay2026foundation, wang2018revisiting, wang2020hierarchical, willette2023scalable, xu2023regularized, yang2020relational, yang2024histopathology, yao2020whole, yi2021cytoset, yu2023deep, yuan2026bagshift, zhang2026deep] |
| Related work: Sets of lesions or regions and medical point clouds | [adams2023point, ahmadi2026hippocampal, beetz20233d, beetz2023multi, beetz20253d, bizjak2021deep, campanella2019clinical, chang2020automatic, chauvin2019analyzing, chen2021aminn, chen2021whole, chen2022lung, chen2024tractgeonet, chen2026enhancing, chen2026screening, choi2025prediction, collenne2024reset, dole2025enhancing, farazi2023tetcnn, feragen2013geometric, gacheva2026multiple, gopinath2019adaptive, gutierrezbecker2021discriminative, han2020accurate, hanna2017predictive, harvey2026multi, iporrerivas2026benchmarking, islam2026neuroaps, jia20243d, karimzadeh2026revisiting, kwon2025graph, liao2019evaluate, liu2026three, lu2021data, luo2023prediction, peng2025ct, perezngonzalez2019automatic, qaiser2021multiple, ren2026otsurv, sarasua2021geometric, sarasua2022hippocampal, shakeri2016deep, shao2021transmil, shao2022patient, song2024morphological, suinesiaputra2018statistical, vosylius2020geometric, wang2020hierarchical, wiers2026geometry, wu2022multicohort, xu2024hybrid, yang2020relational, yang2024histopathology, yang2025pointchd, yao2020whole, zare2025permutation, zhang2026deep] |
| Related work: Registration and templates | [abulnaga2025multimorph, avants2008symmetric, balakrishnan2019voxelmorph, chen2026enhancing, consagra2024continuous, costafreda2011automated, dalca2019learning, dannecker2026cinema, devilliers2017inconsistency, engelson2026deep, gopinath2019adaptive, he2023neural, hoffmann2024anatomy, joshi2004unbiased, klein2009evaluation, luo2026bayesian, ravikumar2019generalised, sarasua2021geometric, sinclair2022atlas, su2015optimal, wang2023bingo, xue2023tractcloud] |
| Related work: Analyses that depend on registration | [ashburner2000voxel, awate2017kernel, bates2003voxel, benveniste2026longitudinal, besson2021geometric, canalini2022quantitative, chen2026lumir, choi2026tumor, cuingnet2011automatic, dadashkarimi2023cross, dular2024extensive, fujibayashi2021nonlinear, hering2023learn2reg, hu2023overall, iglesias2026accuracy, kovacs2023addressing, marchewka2014influence, miller2025comparison, ou2014comparative, perezngonzalez2019automatic, rohlfing2012image, shakeri2016deep, simpson2013ensemble, tang2026metabolic, tilwani2025benchmarking, xiong2026integrating] |
| Related work: Radiomics | [aerts2014decoding, arachchige2026segmentation, balagurunathan2014reproducibility, cama2024study, cama2025segmentation, chen2022lung, choi2020idh1, ciszewski2026decision, dutta2024robustness, ferrante2022application, fornaconwood2020reliability, francischello2026influence, ghosal2026penalized, granzier2020mri, haarburger2020radiomics, kalpathycramer2016radiomics, kazmierski2023multi, kothari2022impact, lambin2012radiomics, leijenaar2013stability, leung2024deep, louis2024identification, luo2023prediction, miteva2026segmentation, mullerfranzes2022reliability, paquier2022radiomics, parmar2014robust, pasini2023critical, pavic2018influence, peng2025ct, poirot2022robustness, qiu2019reproducibility, saha2018breast, sanchez2026quality, scott2026negative, sineglazov2026impact, tixier2019reliability, tran2025comparing, vangriethuysen2017computational, wang2026segmentation, welch2019vulnerabilities, whybra2024image, xiong2026integrating, xu2024hybrid, zwanenburg2019assessing, zwanenburg2020image] |
| Related work: Lesion segmentation | [arachchige2026segmentation, balagurunathan2014reproducibility, bates2003voxel, benveniste2026longitudinal, choi2020idh1, choi2025prediction, ciszewski2026decision, commowick2018objective, dutta2024robustness, egger2017mri, engelson2026deep, ferrante2022application, francischello2026influence, granzier2020mri, haarburger2020radiomics, han2020accurate, hindsholm2025prospective, hu2023overall, isensee2021nnu, isensee2024nnu, kag2026attention, kalpathycramer2016radiomics, kothari2022impact, leijenaar2013stability, leung2024deep, liu2025lesion, louis2024identification, menze2015multimodal, miller2025comparison, mullerfranzes2022reliability, pandilova2026multi, parmar2014robust, pasini2023critical, qaiser2021multiple, qiu2019reproducibility, qiu2023qcresunet, saha2018breast, sanchez2026quality, sineglazov2026impact, tilwani2025benchmarking, tixier2019reliability, tran2025comparing, wang2026segmentation, wynen2025conflunet, xu2024hybrid, zhang2026deep, zwanenburg2019assessing] |
| Related work: Pipelines that remove a step | [adams2023point, awate2017kernel, basu2014detecting, beetz20233d, beetz2023multi, bizjak2021deep, chen2026screening, cole2017predicting, consagra2024continuous, dannecker2026cinema, engelson2026deep, fan2024amyloidpetnet, han2020accurate, hosny2018deep, kovacs2023addressing, kundu2018discovery, luo2023prediction, qaiser2021multiple, shao2021transmil, shao2022patient, siless2020registration, toosi2024segmentation, torres2021end, wood2022accurate, xue2023tractcloud] |
| Method background | [bro1996multiway, zhao2013hopls, kiers1999parafac2, zhou2013tensor, cuturi2013sinkhorn, peyre2019computational, memoli2011gromov, peyre2016gromov, vayer2019optimal, agueh2011barycenters, cuturi2014fast, vincentcuaz2021online, vincentcuaz2022template, mialon2021trainable, wang2013linear, moosmuller2023linear, kolouri2016sliced, naderializadeh2021pooling, zaheer2017deep, lee2019set, murphy2019janossy, qi2017pointnet, qi2017pointnetpp, wang2019dynamic, ilse2018attention, dietterich1997solving, muandet2017kernel, szabo2016learning, yu2023deep, joshi2004unbiased, balakrishnan2019voxelmorph] |
| Experimental baselines | [zaheer2017deep, lee2019set, ilse2018attention, shao2021transmil, qi2017pointnet, qi2017pointnetpp, wang2019dynamic, mialon2021trainable, naderializadeh2021pooling, vincentcuaz2022template, togninalli2019wasserstein, moosmuller2023linear, kolouri2021wasserstein, yang2020relational, campanella2019clinical, lu2021data, zhou2013tensor, zhao2013hopls, afshar2020taste, balakrishnan2019voxelmorph, avants2008symmetric, isensee2021nnu, vangriethuysen2017computational, zwanenburg2020image, tang2026metabolic, wiers2026geometry, hu2023overall, liu2025lesion, chauvin2019analyzing, gopinath2019adaptive, shakeri2016deep, devries2025interpretable, zhang2026deep] |
| Discussion and limitations | [altschuler2022wasserstein, amir2023neural, arachchige2026segmentation, aramayo2023uncovering, balagurunathan2014reproducibility, bazeille2021empirical, benveniste2026longitudinal, bueno2021representation, cama2024study, cama2025segmentation, canalini2022quantitative, chen2026distributionally, chen2026lumir, choi2020idh1, choi2026tumor, ciszewski2026decision, commowick2018objective, davidson2025holder, devilliers2017inconsistency, dular2024extensive, dutta2024robustness, egger2017mri, fornaconwood2020reliability, francischello2026influence, genevay2019sample, granzier2020mri, haarburger2020radiomics, harshman1996uniqueness, harvey2026multi, hering2023learn2reg, hindsholm2025prospective, huang2026shift, iglesias2026accuracy, isensee2024nnu, janati2020debiased, kag2026attention, kalpathycramer2016radiomics, kazmierski2023multi, klein2009evaluation, kothari2022impact, leijenaar2013stability, li2021closer, louis2024identification, marchewka2014influence, mazelet2026learning, memoli2011gromov, menze2015multimodal, miller2025comparison, miteva2026segmentation, moosmuller2023linear, morup2008shift, mullerfranzes2022reliability, nikolentzos2025lipschitz, ou2014comparative, pandilova2026multi, paquier2022radiomics, park2025sparse, parmar2014robust, pasini2023critical, patalano2026par2cox, pavic2018influence, poirot2022robustness, qi2017pointnetpp, qiu2019reproducibility, qiu2023qcresunet, raff2023reproducibility, ren2023multipar, rioux2024entropic, rohlfing2012image, saha2018breast, sanchez2026quality, sarasua2022hippocampal, scetbon2022linear, scott2026negative, sejourne2021unbalanced, simpson2013ensemble, sineglazov2026impact, soelch2019deep, tilwani2025benchmarking, tixier2019reliability, vanchhay2026foundation, vinyals2016order, wagstaff2019limitations, wagstaff2022universal, wang2024polynomial, wang2026segmentation, welch2019vulnerabilities, whybra2024image, wynen2025conflunet, yu2021local, yuan2026bagshift, zhang2022set, zwanenburg2019assessing, zwanenburg2020image] |

### Synthesis Analysis

#### P1: Methods that predict a subject-level outcome from unaligned data

##### Coverage across the four themes

Of the 303 included sources, 131 predict a subject-level outcome in the matrix: 101 by classification and 30 by regression [zhou2013tensor, mi2017optimal, ilse2018attention, aerts2014decoding]. The other 172 are representation or comparison studies (97) or predict at another level (75), such as an object, a graph or a single nodule [qi2017pointnet, vayer2019optimal, yan2026gwdro]. Medical data make up 121 of the 131 subject-level sources [campanella2019clinical, cuingnet2011automatic]. Theme 3 and the sources added to it hold 38 subject-level predictors among 78 sources [yao2020whole, beetz20253d]. Theme 4 and its additions hold 29 among 76 [hosny2018deep, wood2022accurate]. Theme 2 and its additions hold 14 among 56, and Theme 1 and its additions hold 12 among 28 [kundu2020enabling, ren2023multipar]. The 65 sources found by the merge searches and the citation rounds contain 38 subject-level predictors [kundu2024discovering, choi2026tumor]. The papers that define PARAFAC2, the Sinkhorn solver, the Gromov-Wasserstein distance and Deep Sets predict no subject-level outcome themselves [harshman1972parafac2, cuturi2013sinkhorn, memoli2011gromov, zaheer2017deep].

Of the 131 subject-level predictors, 46 rely on permutation invariance, 24 on registration to a common space, 15 on a transport coupling and 12 on a learned template or barycenter [harvey2026multi, simpson2013ensemble, tu2020computing, song2024morphological]. Another 31 form no cross-subject correspondence at all, because each subject is reduced to features of its own tumour or region [poirot2022robustness, ferrante2022application]. Three assume that alignment is given [suinesiaputra2018statistical, wu2022multicohort, xu2024tensor]. All 24 registration-based predictors are medical, as are 44 of the 46 permutation-invariant ones and 13 of the 15 transport ones [cuingnet2011automatic, han2020accurate, mi2017optimal]. The learned-template route has the fewest medical subject-level predictors: 7 of its 12 [barbarant2026functional, kwon2025graph]. Its other 5 predict from electronic health records or from cytometry [afshar2020taste, yin2020logpar, patalano2026par2cox, ren2023multipar, bruggner2014automated]. A reference learned across subjects is thus the route with the fewest subject-level medical predictors in the set [song2024morphological, chen2026enhancing].

##### Tensor models

Tensor regression on images predicts a subject-level label after registration has made the voxel mode common to all subjects [zhou2013tensor, li2018tucker]. The CP model of Zhou and colleagues classifies ADHD from registered MRI, and its coefficient tensor is indexed by voxel [zhou2013tensor]. The Tucker variant fits the same preprocessed ADHD-200 arrays for continuous, binary and count responses [li2018tucker]. Multiway PLS of cardiac motion regresses regional polyaffine parameters on age [mcleod2018cardiac]. It first aligns the parameters of 25 subjects in space and time to the 17 AHA regions [mcleod2018cardiac]. The shift-aware Kronecker classifier tolerates small circular shifts in registered OASIS-1 and ADNI-1 slices, and it leaves large deformations to registration [huang2026shift]. The individualized multilayer model is the one tensor predictor that drops voxel-wise registration [tang2019individualized]. It gives each subject its own rank-one layer on a shared pixel grid of breast tissue images [tang2019individualized]. Its reported accuracy gains over five comparators range from 7 to 39 percent [tang2019individualized]. The CP and Tucker structures come from the multiway literature [kolda2009tensor]. The base PLS models of that literature predict at sample or window level from aligned modes [bro1996multiway, zhao2013hopls].

The PARAFAC2 strand leaves one mode unaligned, and it reaches subject-level prediction outside imaging [harshman1972parafac2, kiers1999parafac2]. Harshman defined the model for slices whose row units differ [harshman1972parafac2]. Kiers and colleagues gave a direct fitting algorithm for slices with different numbers of rows [kiers1999parafac2]. Bro and colleagues used it to absorb retention time shifts in chromatography [bro1999parafac2]. Cohen and Bro relax the coupling of the varying mode so that it can carry a nonnegativity constraint [cohen2018nonnegative]. The supervised variants predict from electronic health records whose visit mode differs per patient [afshar2020taste, ren2023multipar]. TASTE feeds 60 phenotypes to a logistic regression for heart failure, with the same AUC as a recurrent network on 345 features [afshar2020taste]. LogPar reports average relative gains of 13.2 percent for heart failure and 14 percent for mortality prediction [yin2020logpar]. MULTIPAR trains the factorization jointly with mortality and other prediction tasks [ren2023multipar]. PAR2COX places patient factor weights in a Cox partial likelihood [patalano2026par2cox]. Neuralign applies a PARAFAC2-type coupling to neuron sets without matched neurons, and it predicts no outcome [kralik2026identifying]. The functional CP model and the incomplete-observation tensor regression handle irregular time points in microbiome data [tang2026tensor, xu2024tensor].

##### Transport embeddings and kernels

Thirteen of the 15 subject-level transport predictors are medical, and those on the brain use meshes, volumes, surfaces and MEG distributions [mi2017optimal, tu2020computing, su2015shape, li2025quantile]. Mi and colleagues map each brain mesh to a single-subject template and use the Wasserstein distance as one index per image [mi2017optimal]. On 250 ADNI-1 subjects that index reaches 82.30 percent accuracy and exceeds hippocampal volume [mi2017optimal]. The volumetric Wasserstein Index of Tu and colleagues separates 140 amyloid-positive patients from 174 controls in a pilot [tu2020computing]. Su and colleagues compare conformal spherical measures of cortical surfaces by k-nearest neighbours [su2015shape]. They report 78.57 percent for three IQ classes of 100 subjects, against at most 67.85 percent for area and curvature features [su2015shape]. A hyperbolic Wasserstein distance between cortical surfaces classifies Alzheimer's disease against controls [shi2016shape]. Transport-based morphometry fits linear models in a transport domain of structural MRI [kundu2018discovery]. In the 16p11.2 cohort it predicts copy number variation with 89 to 95 percent test accuracy [kundu2024discovering]. A one-dimensional Wasserstein comparison of quantile functions of MEG results classifies mild traumatic brain injury [li2025quantile].

Outside the brain, transport predictors work on knee cartilage, prostate MRI and cell images [kundu2020enabling, gong2026robust, tosun2015detection]. Transport-based learning on baseline cartilage texture maps predicts symptomatic osteoarthritis at 3 years with 78 percent test accuracy in 86 individuals [kundu2020enabling]. CMOT-Fusion matches T2-weighted and ADC patches of one patient by a learned transport plan [gong2026robust]. It reaches AUC 0.824 on a 50-patient test set, where PI-RADS reaches 0.839 [gong2026robust]. Two cytology studies embed each nucleus by the linear transport embedding and vote over a patient's nuclei [hanna2017predictive, tosun2015detection]. They report 81.29 percent accuracy for melanoma against nevi and 100 percent on 34 mesothelioma cases [hanna2017predictive, tosun2015detection]. OTSurv aggregates slide tiles by an unbalanced transport plan and reports a 3.6 percent gain in average C-index on six benchmarks [ren2026otsurv]. Bazeille and colleagues measure transport alignment by decoding task conditions in left-out subjects [bazeille2021empirical]. The two non-medical predictors classify patient point clouds of single cells against a fixed reference [wang2025linearized, pathan2026flowlot].

The 33 transport sources that do not predict at subject level include embeddings that predict for a graph, a document or an object [vayer2019optimal, kusner2015word, shifaterabbi2025linear]. FGW kernels and template layers classify molecular and benchmark graphs [vayer2019optimal, vincentcuaz2022template]. Wasserstein embeddings of node-embedding sets to a reference give fixed-length graph codes [kolouri2021wasserstein, nguyen2023linear, togninalli2019wasserstein]. Document distances by word transport serve k-nearest-neighbour classification [kusner2015word]. Linear transport embeddings and subspaces classify distributions and point sets [moosmuller2023linear, shifaterabbi2025linear, mahan2024point, wang2013linear]. Sliced-Wasserstein kernels and poolings turn sets into vectors for downstream tasks [kolouri2016sliced, naderializadeh2021pooling, naderializadeh2024aggregating, naderializadeh2025constrained]. The trainable transport embedding of Mialon and colleagues predicts protein folds [mialon2021trainable]. Wasserstein regression takes univariate distributions as predictors [chen2023wasserstein]. The normalized Radon transform reaches near-perfect accuracy on watermarks and shapes [beckmann2026generalizations]. In the one early regression with GW, a 3-nearest-neighbour model of molecular energies has a mean absolute error of 10.83, against 3.07 for a kernel ridge baseline [peyre2016gromov]. FGW barycenters also serve as graph-valued outputs [brogatmotte2022learning]. Linear partial GW embeddings are reported for shape retrieval [bai2025linear].

##### Set encoders and multiple-instance learning

Whole-slide pathology contributes a group of set-based subject-level predictors trained from slide or patient labels [campanella2019clinical, lu2021data]. Campanella and colleagues train on 44,732 slides with diagnoses as labels and report AUCs above 0.98 [campanella2019clinical]. CLAM uses attention and instance clustering with slide labels only [lu2021data]. TransMIL models correlation among patches and reports a test AUC of 93.09 percent on CAMELYON16 [shao2021transmil]. DeepAttnMISL predicts patient survival from attention-pooled patch features [yao2020whole]. Patch-GCN treats a slide as a 2D point cloud and gains 3.58 to 9.46 percent over weakly supervised baselines on 4,370 slides [chen2021whole]. CCFormer predicts survival and stage from the spatial distribution of cells [yang2024histopathology]. Panther summarizes the patch set by Gaussian mixture prototypes and matches or exceeds supervised MIL on 13 datasets [song2024morphological]. BagShift shows that the patch selector changes kappa on PANDA by 1.57 to 17.96 points with features and predictor held fixed [yuan2026bagshift]. PICASO classifies kidney biopsies from glomerular crops with AUROC 0.97 [zare2025permutation]. Distribution pooling and aggregator comparisons on slides predict at slide level [oner2023distribution, vanchhay2026foundation].

Radiology adds bags of slices, regions and spectra [harvey2026multi, qaiser2021multiple, gacheva2026multiple]. AD3D-MIL screens COVID-19 from chest CT as a bag of 3D instances with 97.9 percent accuracy [han2020accurate]. ATMIL classifies multiple myeloma from whole-body MRI with patient-level labels [qaiser2021multiple]. GMINet grades prostate cancer from mp-MRI slices with 81.1 percent five-class accuracy in 478 patients [shao2022patient]. A multiple-instance network classifies brain lesions from bags of MR spectra of 422 patients with AUC 0.82 [gacheva2026multiple]. Harvey and colleagues compare MIL encoders on 9 binary tasks from 7 CT and MRI datasets [harvey2026multi]. Mean pooling matches or beats attention models on 4 of 6 moderate-sized tasks at 25 times less training time [harvey2026multi]. The same set models predict clinical outcomes from cytometry samples, a clinical setting outside imaging [yi2021cytoset, ding2026application]. Attention-based MIL pooling [ilse2018attention] is the pooling of AD3D-MIL, ATMIL and the spectroscopy model [han2020accurate, qaiser2021multiple, gacheva2026multiple]. Dietterich and colleagues defined the multiple instance problem for molecules, each a bag of conformations with one label, and algorithms that ignore the bag structure perform poorly on it [dietterich1997solving]. The diverse density framework [maron1997framework] and the bag-level networks of Wang and colleagues [wang2018revisiting] followed.

A further group predicts from the set of a patient's lesions [chen2021aminn, karimzadeh2026revisiting]. AMINN pools radiomic features of 2 to 17 liver metastases and reaches AUC 0.70 for 3-year survival [chen2021aminn]. Attention MIL over lung nodules with radiomic features reaches AUC 0.842 [chen2022lung]. A hybrid few-shot model pools lymphoma lesions and reaches AUC 0.795 [xu2024hybrid]. Karimzadeh and colleagues compare Deep Sets, Set Transformer and MIL on lymph-node sets of 151 and 80 patients [karimzadeh2026revisiting]. The best models reach ROC-AUC up to 0.91 on the first centre, and test-time adaptation raises the Transformer from 0.81 to 0.87 on the second [karimzadeh2026revisiting]. Hierarchical attention MIL diagnoses lung cancer from nodules and their attributes [wang2020hierarchical]. A leaky noisy-OR gate over the five most confident detected nodules won the Data Science Bowl 2017 [liao2019evaluate]. A habitat nomogram with a multiple-instance signature predicts nodal status in 469 patients with AUC 0.852 [peng2025ct]. A multiple-instance model over automatically segmented lymph nodes predicts metastasis in laryngeal cancer with external AUCs of 0.79 to 0.86 [zhang2026deep]. A nodule-set transformer and a skin-lesion set transformer process a patient's lesions as one set, and their labels are per lesion or not stated [yang2020relational, collenne2024reset].

The set architectures themselves predict at set level on benchmark data [zaheer2017deep, lee2019set]. Deep Sets and Set Transformer define sum and attention encoders [zaheer2017deep, lee2019set]. Janossy pooling, featurewise sort pooling and set normalization extend them [murphy2019janossy, zhang2020fspool, zhang2022set]. Mini-batch consistent encoders process large sets in chunks [willette2023scalable], and order-sensitive sequence models show that input order changes what is learned [vinyals2016order]. Kernel mean embeddings and support measure machines treat each set as a distribution [muandet2017kernel, muandet2012learning]. Distribution regression on mean embeddings is consistent in the two-stage sampled setting [szabo2016learning]. Convolutional networks reach learning rates optimal up to a logarithmic factor in the same setting [yu2023deep]. Bayesian distribution regression weights groups by their size [law2018bayesian], and maximum kernel entropy learns the distribution kernel [kachaiev2024learning]. Regularized transport layers express global pooling as a transport plan [xu2023regularized]. Distributionally robust training targets corrupted set elements [chen2026distributionally]. Attention MIL over 3D cell point clouds predicts population-level drug perturbations [devries2025geometric]. PointMIL places point cloud backbones in a MIL framework and reaches 97.3 percent mean accuracy on IntrA vessel segments, with one label per segment or cell [devries2025interpretable]. The matrix records none of these architecture papers as a subject-level predictor [zaheer2017deep, lee2019set, willette2023scalable].

##### Point clouds and meshes of anatomy

Point clouds of reconstructed organs support subject-level prediction in cardiology [beetz20233d, beetz20253d]. A point cloud network on 1,068 UK Biobank hearts improves over clinical benchmarks by about 13 percent for prevalent and about 5 percent for incident infarction [beetz20233d]. A multi-objective autoencoder improves incident infarction prediction by 19 percent in AUROC [beetz2023multi]. A variational point cloud autoencoder on over 10,000 subjects improves AUROC by 13 and 16 percent for prevalent and incident infarction [beetz20253d]. A point cloud classifier of segmented cardiac MRI reaches 92 percent accuracy for cardiopathy [chang2020automatic]. PointCHD provides a point cloud benchmark for congenital heart disease [yang2025pointchd]. The left-ventricle challenge reports accuracies of 0.83 to 0.98 for infarct classification from surface points [suinesiaputra2018statistical]. Point networks also estimate pulmonary function from vessel centerlines [jia20243d] and classify adenoid hypertrophy with 81.88 percent accuracy from segmented airways [dole2025enhancing]. Geometric tree kernels classify COPD from airway trees [feragen2013geometric]. Equivariant neural fields turn each subject's cine MRI into a latent point cloud, which a transformer classifier reads for seven endpoints in 14,242 UK Biobank subjects [wiers2026geometry]. These latents are the most accurate input on four of the seven endpoints [wiers2026geometry].

Brain shapes form a second group [sarasua2022hippocampal, besson2021geometric]. Point cloud networks classify disease and regress age from subcortical structures without point correspondences [gutierrezbecker2021discriminative]. A comparison of five hippocampal representations finds that meshes generalize best to an independent cohort [sarasua2022hippocampal]. A second comparison finds that template-based mesh networks are more accurate than template-free ones [sarasua2021geometric]. A benchmark of geometric deep learning on hippocampal meshes relates the learned shape space to beta-amyloid burden, cognitive scores and genetic phenotypes by normative modelling [iporrerivas2026benchmarking]. Its abstract states that results depend on cohort selection and preprocessing pipelines [iporrerivas2026benchmarking]. A soft Jaccard distance between bags of keypoints from T1-weighted MRI predicts family structure, racial origin and sex in 1,010 Human Connectome Project subjects [chauvin2019analyzing]. Mesh, point cloud and graph networks predict neonatal age with an error under one week in 650 subjects [vosylius2020geometric]. TractGeoNet regresses language scores from tract point clouds of 806 subjects [chen2024tractgeonet].

Surface and mesh predictors of the brain complete this group, and three of them put the meshes in correspondence before learning [besson2021geometric, gopinath2019adaptive, shakeri2016deep]. Graph convolution on cortical surfaces registered to MNI space predicts sex with 87.99 percent accuracy and age with r of 0.93 in 6,410 subjects [besson2021geometric]. Adaptive graph pooling after spectral alignment classifies disease stage and regresses age from brain surfaces whose meshes differ in structure and size [gopinath2019adaptive]. Hippocampal meshes matched point to point by spectral matching feed a variational autoencoder and a perceptron that separate normal, MCI and AD subjects on ADNI [shakeri2016deep]. Cortical and subcortical surface networks predict fluid intelligence with R of 0.314 and 0.454 in two cohorts [wu2022multicohort]. Tetrahedral mesh networks and landmark-token transformers classify Alzheimer's disease [farazi2023tetcnn, chen2026enhancing]. Anatomically labelled 2D point clouds and Ricci-flow covariance descriptors do the same [islam2026neuroaps, ahmadi2026hippocampal]. Hippocampal shape after automated mapping predicts conversion with 80 percent accuracy in 103 MCI subjects [costafreda2011automated].

Lesion and face shapes complete the point cloud strand [luo2023prediction, chen2026screening]. A point cloud network on cerebral aneurysm models reaches AUC 0.835 in a prospective external cohort, against 0.681 to 0.701 for three radiomics models [luo2023prediction]. PointNet++ shape features predict aneurysm growth with accuracy 0.82, against at most 0.68 for morphologic features, in 39 patients [bizjak2021deep]. An automated nnU-Net and PointNet++ pipeline classifies rupture per aneurysm [choi2025prediction]. Patient point clouds of deep brain stimulation predict motor improvement for 79 patients, with 15 of 24 test predictions within 5 points against 8 of 24 for a voxel CNN [liu2026three]. The authors state that this test set does not support claims of superiority [liu2026three]. A benchmark of 3D facial scans from 18,785 subjects reaches AUC 0.956 for screening without landmark registration [chen2026screening]. Rigid point cloud registration parameters feed a random forest with up to 87.2 percent accuracy for three diagnostic groups [perezngonzalez2019automatic]. A histogram descriptor of the cortex enters kernel regression on clinical variables [awate2017kernel]. PointNet, PointNet++ and DGCNN, the encoders named in the facial, aneurysm and stimulation studies, were developed on objects and scenes [qi2017pointnet, qi2017pointnetpp, wang2019dynamic]. The Point Transformer comes from the same setting [zhao2021point].

##### Image-grid and radiomic predictors

The remaining subject-level predictors read images on a grid [aerts2014decoding, torres2021end]. The radiomics reference predicts survival from 440 tumour features of 1,019 patients [aerts2014decoding]. A 3D CNN on tumour-centred CT patches predicts 2-year survival with AUC 0.70 and 0.71 [hosny2018deep]. IPRO predicts mortality from pretreatment CT of 1,689 patients with C-indices close to TNM staging [torres2021end]. Multi-angle projections give segmentation-free recurrence-free survival on 489 HECKTOR patients [toosi2024segmentation]. Brain age models predict age from registered or minimally processed MRI [cole2017predicting, wood2022accurate, dular2024extensive]. Amyloid positivity is classified on native-space PET [fan2024amyloidpetnet]. Ten Alzheimer's classifiers are compared on 509 ADNI subjects [cuingnet2011automatic]. Ensembles over uncertain registrations [simpson2013ensemble], registration strength [fujibayashi2021nonlinear], misalignment augmentation [kovacs2023addressing] and dual-space radiomics [xiong2026integrating] change the registration input of such predictors. Atlas-region features predict aphasia severity in 238 stroke survivors [tilwani2025benchmarking]. Regional voxel distributions predict conversion in 308 ADNI patients [ghosal2026penalized]. Lesion network mapping places each glioblastoma in a normative connectivity atlas, and a 3D ResNet classifies survival from the maps on BraTS 2020 [hu2023overall]. A lesion-centred vision transformer predicts the 3-month mRS after thrombectomy with AUC 0.80 in 119 stroke patients [liu2025lesion].

Of the 31 subject-level predictors with no cross-subject correspondence, 23 build on radiomics [aerts2014decoding, poirot2022robustness]. Survival, recurrence and mutation models are built on manual or automatic tumour masks [welch2019vulnerabilities, kazmierski2023multi, leung2024deep, choi2020idh1, ferrante2022application]. Further models predict hematoma outcome, EGFR status, survival from reliable features and growth of vestibular schwannoma [tran2025comparing, sanchez2026quality, mullerfranzes2022reliability, sineglazov2026impact]. Other subject-level radiomic studies measure stability under segmentation change [cama2024study, cama2025segmentation, dutta2024robustness, louis2024identification, pasini2023critical, qiu2019reproducibility, wang2026segmentation, ciszewski2026decision, miteva2026segmentation, balagurunathan2014reproducibility]. Further studies vary the segmentation method, the platform or the image content [poirot2022robustness, fornaconwood2020reliability, scott2026negative]. A prospective study scores an automatic MS lesion tool per case [hindsholm2025prospective]. Transport and prototype methods also feed grid-based subject-level models [gerber2018exploratory, barbarant2026functional]. Pairwise unbalanced transport images of affinely registered tissue masks improve regression on dementia ratings over voxel-based morphometry [gerber2018exploratory]. Wasserstein texture features improve COVID-19 classification over radiomic features [belkhatir2022wasserstein]. Transport templates give the highest inter-subject decoding accuracy of four alignment methods [barbarant2026functional]. Prototype graph networks classify congenital heart disease from sulcal graphs and brain networks from fMRI [kwon2025graph, peng2026wasserstein].

##### Where the evidence is thin

The tensor, lesion-set and point cloud strands stop short of the setting of the research question at different points [tang2019individualized, chen2021aminn, beetz20233d]. No tensor model with an unaligned spatial mode predicts a subject-level outcome [tang2019individualized, huang2026shift, kralik2026identifying]. The individualized model keeps a shared pixel grid, the shift-aware classifier rests on registration, and Neuralign predicts nothing [tang2019individualized, huang2026shift, kralik2026identifying]. The supervised PARAFAC2 models predict from health records, not from images [afshar2020taste, patalano2026par2cox]. The medical transport predictors use cohorts from 34 to 314 subjects where the size is stated [tosun2015detection, tu2020computing]. The annotations of the hyperbolic, 16p11.2, MEG and cytology studies rest on the abstract alone [shi2016shape, kundu2024discovering, li2025quantile, hanna2017predictive]. No method predicts a subject-level outcome from the set of a patient's lesions without segmentation or detection upstream [chen2021aminn, karimzadeh2026revisiting, liao2019evaluate, xu2024hybrid]. Bags of slices, regions and slide patches do remove the lesion step, and their instances are image regions, not lesions [qaiser2021multiple, shao2022patient, campanella2019clinical]. The point cloud predictors of anatomy start from a segmented organ or structure [beetz20233d, sarasua2022hippocampal]. The PointCHD, NeuroAPS-Net and TetCNN abstracts give no sample size or accuracy [yang2025pointchd, islam2026neuroaps, farazi2023tetcnn].

#### P2: How the methods handle the missing correspondence

##### Distribution of the four routes

Across all 303 sources, the matrix records permutation invariance for 92, no cross-subject correspondence for 61, a learned template or barycenter for 50, a transport coupling for 48, registration to a common space for 45, and assumed alignment for 7 [zaheer2017deep, lambin2012radiomics, agueh2011barycenters, cuturi2013sinkhorn, avants2008symmetric, bro1996multiway]. The routes follow the themes [zhou2013tensor, memoli2011gromov, zaheer2017deep, ashburner2000voxel]. Theme 3 and its additions use permutation invariance in 70 of 78 sources [qi2017pointnet, lee2019set]. Theme 2 and its additions use a transport coupling in 32 and a learned template in 23 of 56 [memoli2011gromov, vincentcuaz2022template]. Theme 4 and its additions form no cross-subject correspondence in 47 of 76 and register in 20 [menze2015multimodal, klein2009evaluation]. Theme 1 and its additions use a learned reference in 12, registration in 8 and assumed alignment in 5 of 28 [kiers1999parafac2, zhou2013tensor, zhao2013hopls]. The 65 merge additions spread over all six values, with 20 permutation-invariant and 15 transport sources [kolouri2021wasserstein, chen2026screening]. Some sources join two routes: the trainable transport reference of Mialon and colleagues is annotated as an overlap of Theme 2 with Theme 3 [mialon2021trainable], and regularized transport layers recast permutation-invariant pooling as a transport plan [xu2023regularized].

##### Registration to a common space

Registration establishes correspondence before any subject-level statistic is computed [ashburner2000voxel, zhou2013tensor]. Voxel-based morphometry normalizes every subject to one stereotactic space before voxelwise tests [ashburner2000voxel]. Lesion-symptom mapping places manually reconstructed lesions on templates [bates2003voxel]. SyN maps each brain diffeomorphically to a template and performs best when template and target differ most [avants2008symmetric]. Klein and colleagues rank 14 nonlinear algorithms in more than 45,000 registrations of 80 labelled brains [klein2009evaluation]. Ou and colleagues evaluate 12 algorithms on 7 databases that include missing correspondences in pathology [ou2014comparative]. Learned registration replaces per-pair optimization with a network that still outputs a deformation to a fixed target [balakrishnan2019voxelmorph]. SynthMorph trains on synthesized images for acquisition-agnostic registration [hoffmann2024anatomy]. Neural pre-processing learns spatial normalization jointly with skull stripping [he2023neural]. The Learn2Reg and LUMIR challenges score such methods across tasks and domain shifts [hering2023learn2reg, chen2026lumir]. Multi-subject fMRI tensor models share the spatial mode after registration and shift or evolve only the time mode [kuang2020shift, acar2022tracing].

Registration also appears inside methods that the annotations file under other headings [qi2017pointnet, li2021closer]. Canonicalization maps each input to a canonical form before the network, which is registration in invariant learning [ma2024canonicalization]. PointNet adds a learned alignment network that predicts an affine matrix for each input cloud [qi2017pointnet]. PCA canonical poses for rotated point clouds are imperfect, and a pose selector raises accuracy by 5.3 percent [li2021closer]. Frame averaging gives invariance to Euclidean motions without aligning clouds to each other [puny2022frame]. Rigid point cloud registration to a baseline cloud turns the registration parameters into the features of an Alzheimer's classifier [perezngonzalez2019automatic]. Spinal cord lesion tracking finds that registration-based overlap matching performs best among five strategies, ahead of Hungarian matching in an anatomical reference system [benveniste2026longitudinal]. Within one patient, sequences are co-registered before agreement is measured [pandilova2026multi], and pathology changes registration error near a tumour [canalini2022quantitative]. Registration to an atlas locates lymph node stations before a weakly supervised classifier [engelson2026deep].

##### Learned references

The annotations describe one mechanism under six names: a reference object estimated from the data, to which each subject is compared or mapped [joshi2004unbiased, agueh2011barycenters, vincentcuaz2022template]. For registration it is a template or atlas [joshi2004unbiased, dalca2019learning]. Joshi and colleagues estimate an unbiased diffeomorphic atlas without choosing one subject [joshi2004unbiased]. Dalca and colleagues learn conditional templates jointly with the alignment network [dalca2019learning]. MultiMorph builds a group-specific atlas in one forward pass [abulnaga2025multimorph]. Atlas-ISTN learns the atlas jointly with segmentation and registration [sinclair2022atlas]. CINeMA builds a conditional atlas in latent space and avoids image registration [dannecker2026cinema]. The Bayesian groupwise method calls its template the common anatomy [luo2026bayesian]. Coherent point drift estimates a mean template of diffusion point sets [ravikumar2019generalised]. In transport, the same object is the Wasserstein barycenter [agueh2011barycenters]. Its fast computation [cuturi2014fast], its Bregman projections [benamou2015iterative] and its debiased form [janati2020debiased] supply the entropic templates. Transport averaging of fMRI and MEG [gramfort2015fast] and local transport templates of brain function [bazeille2019local] apply it to imaging. GW barycenters extend it to distance matrices of different sizes [peyre2016gromov], and a shared GW barycenter aligns nodule cohorts [yan2026gwdro].

In dictionary learning the reference becomes a set of atoms [schmitz2018wasserstein]. Wasserstein dictionary learning reconstructs each histogram as a barycenter of learned atoms [schmitz2018wasserstein]. Online graph dictionaries and GW factorization do the same for unregistered graphs of different sizes [vincentcuaz2021online, xu2020gromov]. FGW dictionaries learn atoms across individual cortical geometries [mazelet2026learning]. A discriminant loss makes graph keys compact within a class [zhang2024wasserstein]. In supervised graph models the reference is a template graph, a reference distribution or a prototype [vincentcuaz2022template, wang2024graph, chen2020optimal]. The template layer learns graphs end-to-end with the classifier, and fixed sampled templates lose accuracy in its ablation [vincentcuaz2022template]. GRDL classifies graphs by maximum mean discrepancy to learned reference distributions [wang2024graph]. OT-GNN uses prototype point clouds [chen2020optimal], and a prototype view of graph classification uses transport [qian2024reimagining]. FGW barycenters with learned templates serve as graph predictors [brogatmotte2022learning]. RepSet matches each set to learned hidden sets by network flow [skianis2020rep]. A common support of K points plays the same role for a whole collection of measures [gachon2026scalable], and K-means on merged cytometry data gives that support for patients [gachon2025low]. Cytometry subpopulations shared across samples are a further case [bruggner2014automated].

The shared factor of PARAFAC2 is a reference estimated across slices of different sizes, and the matrix records it as a learned template [harshman1972parafac2, kiers1999parafac2, bro1999parafac2]. The shift-invariant decomposition shares a time course across trials [morup2008shift], and the functional decomposition shares a function space across subjects [tang2026tensor]. The supervised clinical variants estimate shared phenotype factors [afshar2020taste, yin2020logpar, ren2023multipar, patalano2026par2cox]. Neuralign maps a shared component geometry to each session by Procrustes [kralik2026identifying]. Landmarks from a pretrained shape model act as shared reference points for mesh tokens [chen2026enhancing]. Class references for texture matrices are selected by Bayesian optimization during SVM training [belkhatir2022wasserstein]. The individualized tensor model has shared population layers next to each subject's own layer [tang2019individualized]. The references divide by how they are fitted [vincentcuaz2022template, schmitz2018wasserstein]. Some are learned for a supervised loss [vincentcuaz2022template, wang2024graph, kwon2025graph, peng2026wasserstein]. Others are fitted without labels and only later used for prediction [schmitz2018wasserstein, song2024morphological, mazelet2026learning]. The references learned for a supervised loss work on graphs, sequences and sets outside imaging [mialon2021trainable, zhang2024wasserstein], on brain graphs from fMRI and sulci [kwon2025graph, peng2026wasserstein], and on CT texture matrices [belkhatir2022wasserstein].

Fixed references give a related route, in which the reference is chosen and not learned [moosmuller2023linear]. The linear transport embedding maps each image or distribution by its transport from one fixed reference [wang2013linear, moosmuller2023linear]. Moosmuller and Cloninger state when such an embedding makes shifts and scalings linearly separable [moosmuller2023linear]. Linearized transport of patient cell clouds forms "a registration between any two patients" [wang2025linearized]. Fixed references also underlie WEGL graph codes [kolouri2021wasserstein] and deep set linearized transport for flow cytometry [mahan2024point]. Sliced-Wasserstein aggregation of protein residues maps against a reference set [naderializadeh2024aggregating]. Basis point sets give a fixed reference point set for unordered clouds [prokudin2019efficient]. The matrix files the fixed-reference methods under transport or permutation invariance, and the methods with a reference estimated from the data under learned templates [moosmuller2023linear, prokudin2019efficient, gachon2025low]. Pairwise transport between all subjects avoids a single template altogether [gerber2018exploratory].

##### Transport couplings

Transport couplings compare subjects that share no coordinate frame [memoli2011gromov, peyre2019computational]. Memoli defines the Gromov-Wasserstein distance between metric measure spaces [memoli2011gromov]. Peyre and Cuturi state that plain transport needs a shared or preregistered space, while GW compares within-object distances [peyre2019computational]. Entropic regularization makes the coupling a matrix scaling problem [cuturi2013sinkhorn], and entropic GW gives soft correspondence between domains [solomon2016entropic]. Fused GW combines node features and structure [vayer2019optimal]. Unbalanced GW lets parts differ in size or be missing [sejourne2021unbalanced]. Fused unbalanced GW aligns individual cortical surfaces without a common mesh and gives sharper group templates than anatomical alignment [thual2022aligning]. Sinkhorn divergences interpolate between transport and MMD [feydy2019interpolating]. A multiscale GPU solver computes plans between millions of tractogram points [feydy2019fast]. Transport maps register surfaces through a conformal disk [su2015optimal]. CAROT maps connectomes between atlases [dadashkarimi2023cross], and the worst transportation cost serves as a cortical biomarker [zhang2021cortical]. Transport-based morphometry of cells and 3D medical images uses invertible transport embeddings [basu2014detecting, kan20263d].

##### Permutation invariance

Permutation invariance removes the need for element correspondence by making the output a symmetric function of the set [zaheer2017deep, muandet2017kernel]. Deep Sets characterizes the family of permutation-invariant functions [zaheer2017deep], and probabilistic symmetry gives its theoretical basis [bloemreddy2020probabilistic]. PointNet uses max pooling over per-point features [qi2017pointnet], and PointNet++ applies it recursively on local regions [qi2017pointnetpp]. EdgeConv builds a graph within each cloud [wang2019dynamic], and the Point Transformer uses local self-attention [zhao2021point]. Set Transformer and attention MIL pool by attention [lee2019set, ilse2018attention]. Fourier sliced-Wasserstein embeddings are injective on measures and bi-Lipschitz on multisets, where sum and max pooling are not [amir2025fourier]. Comparisons of equivariant backbones show that the pooling choice can matter more than backbone width [kothapalli2024equivariant]. Permutation invariance does not address pose, and PointNet adds an alignment network for that reason [qi2017pointnet]. TractCloud learns pose invariance from synthetic transforms and parcellates streamlines in subject space [xue2023tractcloud]. Point cloud networks learn statistical shape models without correspondence-based inputs [adams2023point]. In the medical predictors of the first subsection, an upstream step forms the set, for example by reconstructing an organ, detecting nodules or tiling a slide [beetz20233d, liao2019evaluate, lu2021data].

##### Failure of each route

Each route has measured failure modes at the level of the correspondence itself [memoli2011gromov, yu2021local, wagstaff2019limitations]. GW is non-convex, and its discrete form reduces to an NP-hard quadratic assignment problem [memoli2011gromov, peyre2019computational]. Low-rank couplings reduce the cubic cost of entropic GW to quadratic or linear time [scetbon2022linear]. Entropic GW converges to global solutions only under a condition on the regularization [rioux2024entropic]. No reliable continuous GW solver exists in the benchmark of Aramayo Carrasco and colleagues [aramayo2023uncovering]. Exact Wasserstein barycenters are NP-hard to compute in the dimension [altschuler2022wasserstein]. Entropy blurs barycenters [janati2020debiased], and Sinkhorn divergences have a sample complexity whose constant depends on the regularization [genevay2019sample]. FGW is cubic in the number of nodes, which limited earlier graph dictionaries to a few tens of nodes [mazelet2026learning]. Template estimation by the Frechet mean in quotient space is inconsistent once noise is large [devilliers2017inconsistency]. PARAFAC2 has local minima whose loadings differ even when losses are close [yu2021local]. Its uniqueness, which Harshman reported as unproved, was later proved for a general model that contains PARAFAC2 as a special case [harshman1972parafac2, harshman1996uniqueness]. Unshifted CP gives degenerate solutions on latency-varying data [morup2008shift], and HOPLS is not guaranteed consistent in high dimensions [park2025sparse].

Permutation-invariant encoders have their own measured limits [wagstaff2019limitations, raff2023reproducibility]. Sum pooling with continuous maps needs a latent dimension at least the largest set size [wagstaff2019limitations]. With a latent space one dimension too small, Deep Sets can be no better than a constant baseline [wagstaff2022universal]. Polynomial width suffices under specific element embeddings [wang2024polynomial]. Moments of piecewise-linear networks cannot be injective [amir2023neural]. Sum-based models are lower-Holder with an exponent that decays with depth [davidson2025holder]. Attention aggregation is Lipschitz continuous with respect to none of three multiset distances [nikolentzos2025lipschitz]. PointNet cannot in general approximate averages over a set, such as the centre of mass, so Deep Sets is strictly more expressive than PointNet when the cardinality is constant [bueno2021representation]. When the cardinality is unbounded, any function that PointNet and normalized Deep Sets both approximate uniformly must be constant [bueno2021representation].

Empirical studies measure the same encoders on data [soelch2019deep, raff2023reproducibility]. Deep Set networks are highly sensitive to the choice of aggregation, and learnable aggregations generalize better to set sizes outside the training distribution [soelch2019deep]. A comparison of aggregation functions in place of the PointNet max on ShapeNet classification does not state in its abstract which function performs best [zamorski2020comparison]. Five deep MIL models fail one or more algorithmic unit tests, including attention MIL and TransMIL [raff2023reproducibility]. Learned attention in 3D brain scans does not find reliable per-slice signals [harvey2026multi]. On frozen foundation features, global max pooling beats a graph aggregator under hospital shift [vanchhay2026foundation]. Attention maps of image-level mammography classifiers place their peak inside a lesion in at most 11.5 percent of images [kag2026attention]. For registration, the usual surrogate measures of accuracy do not detect inaccurate registrations [rohlfing2012image].

##### Where the evidence is thin

The non-convexity of GW is measured at the distance or coupling, never at a subject-level prediction [memoli2011gromov, rioux2024entropic, scetbon2022linear, sejourne2021unbalanced, aramayo2023uncovering]. The PARAFAC2 analogue reports local minima of the fit, not of a downstream predictor [yu2021local]. The one clinical GW model in the set aligns cohorts of lung nodules, not subjects [yan2026gwdro]. The learned templates of registration are evaluated by alignment and atlas quality [joshi2004unbiased, dalca2019learning, abulnaga2025multimorph, sinclair2022atlas, dannecker2026cinema, luo2026bayesian]. The transport templates that feed a prediction are graph and point cloud layers outside medicine or slide prototypes in pathology [vincentcuaz2022template, wang2024graph, qian2024reimagining, song2024morphological]. Of the 50 learned-reference sources, 12 predict at subject level and 7 of those are medical [song2024morphological, kwon2025graph, chen2026enhancing]. The limits of sum pooling are tested on synthetic and graph benchmarks [wagstaff2019limitations, wagstaff2022universal, amir2023neural]. No included source tests them on point clouds or lesion sets of varying size from patients [karimzadeh2026revisiting, chen2021aminn].

#### P3: Where the methods remove or build on registration, radiomics and lesion segmentation

##### Counts of pipeline relations

The matrix records a pipeline relation for registration in 77 sources, for radiomics in 62 and for lesion segmentation in 86, and a source can carry more than one relation [ashburner2000voxel, lambin2012radiomics, menze2015multimodal]. For registration, 54 sources build on the step, 17 remove it and 24 measure how it fails [zhou2013tensor, cole2017predicting, klein2009evaluation]. For radiomics, 47 build on it, 15 remove it and 31 measure it [aerts2014decoding, hosny2018deep, zwanenburg2020image]. For lesion segmentation, 64 build on it, 14 remove it and 39 measure it [isensee2021nnu, campanella2019clinical, commowick2018objective]. In all, 43 sources remove at least one step and 34 of them predict a subject-level outcome [toosi2024segmentation, gutierrezbecker2021discriminative]. Another 69 sources measure how a step fails, and 34 of these predict at subject level [cama2025segmentation, dular2024extensive]. Of the 17 sources that remove registration, 10 predict a subject-level outcome [su2015shape, fan2024amyloidpetnet]. Of the 15 that remove radiomics, 14 predict at subject level, and of the 14 that remove lesion segmentation, 13 do [luo2023prediction, shao2021transmil].

##### Methods that build on registration

The subject-level predictors that keep registration use it to define the input grid, the regions or the points [zhou2013tensor, tilwani2025benchmarking, liu2026three]. Tensor regression needs registered images for its voxel-indexed coefficients [zhou2013tensor, li2018tucker]. Regional cardiac parameters are aligned before multiway PLS [mcleod2018cardiac]. The voxel-based Alzheimer's classifiers compare subjects after DARTEL or unified segmentation [cuingnet2011automatic]. Hippocampal shape features come from an automated mapping [costafreda2011automated]. Surface networks register cortical meshes to MNI space before graph convolution [besson2021geometric]. Template-based hippocampal mesh networks need correspondences and a common template [sarasua2021geometric]. Registered meshes appear in the hippocampal comparison only for FSL, since FreeSurfer provides none [sarasua2022hippocampal]. Atlas-region features [tilwani2025benchmarking] and ROI voxel distributions [ghosal2026penalized] presuppose a parcellation common to all patients. Single-subject FDG-PET networks over 77 atlas regions weight each edge by the Wasserstein distance between regional uptake distributions [tang2026metabolic]. Their support vector machine reaches the highest accuracy, 0.65, for ALS against ALS mimics [tang2026metabolic]. Rigid registration supplies the optional spatial features of lymph-node sets [karimzadeh2026revisiting]. Deep brain stimulation point clouds integrate preoperative MRI and postoperative CT, and registration failures excluded patients [liu2026three]. Atlas-to-patient registration locates lymph node stations [engelson2026deep], and inter-patient registration maps dose for pneumonitis prediction [choi2026tumor].

Twelve medical transport and template sources build on registration [gramfort2015fast, mi2017optimal, dalca2019learning]. Transport averaging replaces the smoothing applied after anatomical registration, and the data are in MNI space or on an average cortical surface [gramfort2015fast]. Local transport templates work on data previously registered in MNI space [bazeille2019local]. Functional alignment benchmarks measure what transport adds after anatomical registration [bazeille2021empirical]. Population templates by transport are compared within registered fMRI [barbarant2026functional]. Pairwise unbalanced transport still depends on affine normalization to the Talairach atlas [gerber2018exploratory]. The Wasserstein index of Mi and colleagues is computed after linear alignment with FLIRT or SPM [mi2017optimal]. CAROT starts from data parcellated with one atlas [dadashkarimi2023cross]. Uncertain registration can be modelled inside the predictor, which trains an ensemble on samples of the mapping distribution [simpson2013ensemble]. The learned atlas methods keep registration and remove the precomputed template [dalca2019learning, abulnaga2025multimorph, sinclair2022atlas, joshi2004unbiased]. Learned groupwise registration and coherent point drift likewise estimate a template inside the registration step [luo2026bayesian, ravikumar2019generalised]. BInGo estimates a common structure for multimodal groupwise registration and is more accurate and more efficient than five iterative or deep learning methods, with no outcome predicted [wang2023bingo].

##### Methods that remove registration

The 17 sources that remove registration replace the common space in different ways [su2015shape, xue2023tractcloud, fan2024amyloidpetnet]. In one group, conformal spherical transport compares cortical surfaces without inter-subject registration [su2015shape]. Point cloud networks handle similarity transforms and point correspondence inside the network [gutierrezbecker2021discriminative]. The facial benchmark uses no landmark registration, dense correspondence or template fitting [chen2026screening]. Point cloud networks learn shape models without correspondence-based inputs [adams2023point]. A histogram descriptor of the cortex tolerates misregistration [awate2017kernel]. A second group represents each subject in its own space [xue2023tractcloud, thual2022aligning]. TractCloud parcellates streamlines without registration from neonates to the elderly [xue2023tractcloud]. AnatomiCuts matches tract clusters across 184 subjects by anatomical neighbours [siless2020registration]. Continuous connectivity removes the atlas parcellation [consagra2024continuous]. FUGW and FGW dictionaries work on individual cortical meshes [thual2022aligning, mazelet2026learning]. The individualized tensor model and CINeMA drop registration from the predictor and from atlas construction [tang2019individualized, dannecker2026cinema]. A third group drops registration to a template or between the sequences of one patient [fan2024amyloidpetnet, kovacs2023addressing]. Native-space PET [fan2024amyloidpetnet], minimally processed clinical MRI [wood2022accurate] and raw T1-weighted images [cole2017predicting] feed brain models. Misalignment augmentation [kovacs2023addressing] and learned transport between sequences [gong2026robust] replace inter-sequence registration.

The removal is partial in some of these sources [cole2017predicting, gong2026robust]. The raw images of Cole and colleagues still undergo a rigid six-degree-of-freedom registration to MNI152 space [cole2017predicting]. FUGW and the FGW dictionaries need cortical surface reconstruction [thual2022aligning, mazelet2026learning], and conformal transport needs FreeSurfer surfaces [su2015shape]. CMOT-Fusion uses U-Net gland masks for cropping [gong2026robust]. The point cloud networks of subcortical anatomy rest on a segmentation whose source the abstract does not state [gutierrezbecker2021discriminative]. The cost of removal is measured for brain age and for prostate diagnosis [cole2017predicting, kovacs2023addressing]. Raw-image brain age has poorer between-scanner reliability, with ICC 0.51 to 0.77 against 0.83 to 0.96 for gray matter maps [cole2017predicting]. Affine registration improves brain age error over rigid registration [dular2024extensive]. Misalignment augmentation compensates for no registration, and augmentation with registration performs best on an independent test set [kovacs2023addressing]. Wood and colleagues report cross-hospital changes in MAE under one year with minimal preprocessing [wood2022accurate]. Dular and colleagues report that extensive preprocessing improved error on a new dataset [dular2024extensive].

##### Radiomics

Radiomics is defined as high-throughput extraction of features inside a delineated tumour [lambin2012radiomics]. PyRadiomics implements the step [vangriethuysen2017computational], and the IBSI standardizes 169 of 174 features and later 8 filter types [zwanenburg2020image, whybra2024image]. Subject-level predictors that build on radiomics include the prognostic signature of Aerts and colleagues and lesion-set models that pool per-lesion features [aerts2014decoding, chen2021aminn, chen2022lung, xu2024hybrid, karimzadeh2026revisiting, peng2025ct]. Wasserstein texture features keep co-occurrence matrices as matrices and replace their scalar summaries [belkhatir2022wasserstein]. Learned latent features add modestly to radiomics of segmented hematomas [tran2025comparing]. Dual-space radiomics combines MNI and native features [xiong2026integrating]. The 15 sources that remove radiomics replace engineered features by learned or transport representations [kundu2020enabling, hosny2018deep]. Point cloud networks of the heart and of aneurysms replace single-valued biomarkers or morphologic features [beetz20233d, beetz2023multi, luo2023prediction, bizjak2021deep]. Transport-based morphometry needs no a priori features [kundu2018discovery, kundu2020enabling, basu2014detecting]. Transport embeddings of nuclei replace numerical nuclear features [hanna2017predictive, tosun2015detection]. Surface networks, CNNs on tumour patches, projection features, learned nodule features and pretrained patch features complete the group [besson2021geometric, hosny2018deep, toosi2024segmentation, liao2019evaluate, lu2021data]. Regional voxel distributions replace scalar ROI summaries [ghosal2026penalized].

The radiomics step has measured failures at feature and at predictor level [fornaconwood2020reliability, welch2019vulnerabilities]. Reliability across four platforms exceeds an ICC of 0.9 for 4 of 17 features, and features associated with survival vary between platforms [fornaconwood2020reliability]. Three IBSI-compliant platforms share 41 features and agree well only on shape features [paquier2022radiomics]. Sensitivity to segmentation and implementation is reported for 830 nodule features [kalpathycramer2016radiomics]. A radiomic signature with external c-index 0.64 is a surrogate for tumour volume, which alone gives 0.64 [welch2019vulnerabilities]. Volume-preserving negative controls show that some published signatures keep their performance after spatial structure is destroyed [scott2026negative]. In head and neck cancer, clinical data and tumour volume outperform engineered radiomics and complex deep networks [kazmierski2023multi]. Foundation-model embeddings of lung nodules discriminate less than IBSI radiomics, with AUC 0.833 and 0.798 against 0.940 and 0.930 [arachchige2026segmentation]. Robustness filtering gives no detectable gain in glioblastoma survival models [miteva2026segmentation]. Image perturbation chains are proposed in place of test-retest imaging [zwanenburg2019assessing].

##### Lesion segmentation

Lesion segmentation decides which voxels enter a radiomic feature and which lesions enter a set [lambin2012radiomics, wynen2025conflunet]. Inter-rater Dice on glioma sub-regions ranges from 74 to 85 percent in BRATS [menze2015multimodal]. MS lesion algorithms trail seven experts on detection [commowick2018objective], and lesion counts vary more than lesion volume [egger2017mri]. Connected components miscount confluent MS lesions [wynen2025conflunet]. nnU-Net automates the step across 23 datasets [isensee2021nnu], and recent claims of gains over a U-Net baseline do not hold under rigorous validation [isensee2024nnu]. Switching the reference sequence moves Dice 2.7 to 3.6 times as much as switching the radiologist [pandilova2026multi]. QCResUNet predicts segmentation quality per subject [qiu2023qcresunet]. A commercial MS lesion tool has positive predictive values of 0.35 to 0.65 in 112 patients [hindsholm2025prospective]. Automatic segmentation feeds whole-body PET/CT prognosis [leung2024deep]. The lesion-set predictors take delineated or detected lesions as instances [chen2021aminn, chen2022lung, xu2024hybrid, karimzadeh2026revisiting, wang2020hierarchical, liao2019evaluate, peng2025ct]. Point cloud predictors start from segmented organs, vessels, airways, aneurysms and hippocampi [chang2020automatic, choi2025prediction, dole2025enhancing, feragen2013geometric, ahmadi2026hippocampal]. Cell clouds rest on per-cell detection [yang2024histopathology].

The 14 sources that remove lesion segmentation train from a subject-level or image-level label, or put a detector in its place [campanella2019clinical, liao2019evaluate]. In pathology, slides are bags of tiles or patches with diagnoses or survival as labels [campanella2019clinical, lu2021data, shao2021transmil, yao2020whole, chen2021whole, oner2023distribution]. In radiology, bags of 3D instances, regions or slices replace infection, myeloma and tumour annotations [han2020accurate, qaiser2021multiple, shao2022patient, harvey2026multi]. Multi-angle projections remove manual delineation of tumours and nodes but keep a detector crop [toosi2024segmentation]. Detected nodules replace segmented ones in the noisy-OR model [liao2019evaluate]. IPRO is described as fully automated, and its abstract does not state whether an automated segmentation is inside [torres2021end]. The station classifier is trained without pixel annotations and keeps atlas registration [engelson2026deep]. The 3D CNN of Hosny and colleagues removes the contour at deployment but takes the patch centre from a segmentation in the study [hosny2018deep]. Where the sources describe their preprocessing, a crop, a tissue mask or a patch selector still precedes the predictor [toosi2024segmentation, lu2021data, yuan2026bagshift].

##### Measured failures of the three steps

Registration error is measured directly and through its effect on analyses [klein2009evaluation, marchewka2014influence]. Surrogate measures such as tissue overlap and image similarity cannot distinguish accurate from inaccurate registrations [rohlfing2012image]. Three registration packages have marked difficulty with large perinatal stroke lesions [miller2025comparison]. Real low-field MRI lowers registration accuracy through distortion and artifacts [iglesias2026accuracy]. No single method works best across all Learn2Reg tasks [hering2023learn2reg]. Deep learning methods hold their accuracy under the LUMIR domain shifts, with exceptions that the abstract does not count [chen2026lumir]. The registration strategy changes AD-related atrophy estimates in voxel-based morphometry [marchewka2014influence]. Residual misregistration motivates the shift-aware tensor classifier [huang2026shift]. Segmentation variability is propagated into radiomic features in a series of studies [pavic2018influence, granzier2020mri]. Feature stability correlates with Dice by tumour site, falling to 36 percent stable features for mesothelioma [pavic2018influence]. Semiautomatic segmentation gives more reproducible features than manual delineation [parmar2014robust]. Test-retest and inter-observer stability of PET features agree [leijenaar2013stability]. Tumour features vary more across readers than fibroglandular features [saha2018breast]. Robust fractions of 41.6 and 32.8 percent are reported for two platforms in breast MRI [granzier2020mri]. Glioblastoma features differ by segmentation method [tixier2019reliability], and manual and automated segmentation give consistent reproducibility results [haarburger2020radiomics].

The propagation to a subject-level predictor is measured for one tumour or region per patient [cama2024study, francischello2026influence]. Classification accuracy differs between segmentation methods from 77 to 84 percent even at high Dice [poirot2022robustness]. Moderate segmentation variability leaves triple-negative prediction unchanged [cama2025segmentation], while unstable features degrade subtype accuracy [cama2024study]. Annotator experience changes median AUC between 0.72 and 0.79 in liver metastases [francischello2026influence]. Automatic masks lower vestibular schwannoma growth AUC from 0.742 to 0.639 [sineglazov2026impact]. Contour variants flip the predicted class for 7.5 to 13.4 percent of alternative contours [ciszewski2026decision]. Reliable features raise the mean C-index from 0.56 to 0.58 in CT [mullerfranzes2022reliability]. Repeatability above an ICC of 0.7 improves survival model generalizability [wang2026segmentation]. Robust features generalize better for recurrence [louis2024identification, dutta2024robustness]. Region growing gives the highest accuracy of three PSMA segmentations [pasini2023critical]. HCC classification reaches AUC 0.857 with feature reduction [qiu2019reproducibility]. Automated segmentation gives IDH1 AUC 0.86 against 0.90 for manual masks [choi2020idh1]. Survival classifiers do not differ between manual and nnU-Net contours [ferrante2022application]. Biopsy-anchored lesion selection outperforms all-lesion training on external validation [sanchez2026quality]. Reproducible features predict prognosis in a small set [balagurunathan2014reproducibility]. The segmentation tool also changes hippocampal predictions [sarasua2022hippocampal].

##### Head-to-head comparisons

Few studies compare a registration-free predictor with the same predictor on registered data, and the comparisons that exist use image-grid models and radiomics [fujibayashi2021nonlinear, xiong2026integrating]. Nonlinear DARTEL registration gives much higher deep learning accuracy than affine registration [fujibayashi2021nonlinear]. Standard-space and native-space radiomics combine best for Alzheimer's diagnosis [xiong2026integrating]. Raw and normalized inputs are compared for brain age [cole2017predicting], and four preprocessing variants are compared for four brain age models [dular2024extensive]. DARTEL improves six and lowers two of 20 classification experiments [cuingnet2011automatic]. A tumour-aware registration gives AUC 0.78 against 0.73 and 0.71 for two other registrations [choi2026tumor]. The transport studies compare alignment methods after anatomical registration [bazeille2021empirical, barbarant2026functional], or against voxel-based morphometry on affinely registered data [gerber2018exploratory]. On the shape side, template-based and template-free mesh networks are compared on the same hippocampi [sarasua2021geometric]. Point clouds, meshes and volumes are compared on ADNI with an AIBL test [sarasua2022hippocampal]. A point cloud network and radiomics models are compared on the same aneurysms with an external cohort [luo2023prediction]. Mesh, point cloud, graph and volumetric networks are compared for neonatal age [vosylius2020geometric].

##### Where the evidence is thin

No included study compares a transport template or a set encoder with the same predictor on registered data [bazeille2021empirical, gerber2018exploratory, fujibayashi2021nonlinear]. Segmentation variability is propagated into region-level radiomic predictors, never into a lesion-set, point cloud or transport predictor [cama2024study, francischello2026influence, miteva2026segmentation, wang2026segmentation, sineglazov2026impact, ciszewski2026decision, haarburger2020radiomics, kothari2022impact, arachchige2026segmentation]. The lesion-set predictors keep segmentation or detection upstream, the transport survival model works on slide patches [ren2026otsurv], and the nearest removal still registers an atlas to each patient [engelson2026deep]. The registration-free shape methods remove the common space and keep a segmentation or surface reconstruction [su2015shape, thual2022aligning, chen2026screening]. Of the 17 sources that remove registration, 7 do not predict a subject-level outcome, and these include the tractography and connectivity methods [xue2023tractcloud, siless2020registration, consagra2024continuous]. The learned atlases remove the template choice and keep registration [joshi2004unbiased, dalca2019learning]. The subject-level predictors that need none of the three steps work on data outside imaging [yi2021cytoset, patalano2026par2cox]. Cytometry, health records and graph benchmarks need no registration, radiomics or lesion segmentation [yi2021cytoset, ding2026application, afshar2020taste, vincentcuaz2022template].

### Quality Gates and Stopping Conditions

| Gate | Pass criterion | Computed value | Result |
|---|---|---|---|
| Search strategy documented | databases, strings and criteria recorded | recorded under Search Strategy | Pass |
| Source count | at least 30 (Literature Review) | 303 | Pass |
| Annotated bibliography complete | every source annotated | 303 annotations for 303 sources | Pass |
| Literature matrix coverage | every theme at least 3 | smallest P1 value 30, smallest P2 value 7 (assumes), Registration 77, Radiomics 62, Lesion seg 86, smallest theme 22 (Theme 1) | Pass |
| Research gaps | at least 2 specific gaps | 5 | Pass |
| Peer-reviewed share | at least 70 percent | 278 of 303 (91.7 percent); 25 preprints | Pass |
| Currency | at least 50 percent from the last 5 years (2022 to 2026) | 153 of 303 (50.5 percent) | Pass |

The currency gate first gave 136 of 278 (48.9 percent) over the set as it stood before the recent-literature searches; the failure handling of the page (a search for the last three years) was applied with R1 to R4r, which added 10 sources. The 15 sources included afterwards (one from the PubMed search P3, decided after R2 had returned it, and 15 from the routes outside the indexes) are counted in the value above.

| # | Stopping condition | Holds | Basis |
|---|---|---|---|
| 1 | The source count meets the target | Yes | 303 included, minimum 30 |
| 2 | The latest search adds fewer than 10 percent | Yes | the recent-literature searches, the last search round, added 10 to 278 (3.6 percent) |
| 3 | The themes are saturated | Yes | every matrix column value and every theme has at least 3 sources |
| 4 | The citation loop closes | No | the backward and forward rounds added 35 works not yet collected |
| 5 | The temporal span is covered | Yes | 21 sources before 2013, among them [harshman1972parafac2, bro1996multiway, kiers1999parafac2, memoli2011gromov, agueh2011barycenters], and 105 from 2024 to 2026 |

Four of the five conditions hold, above the three the page requires.

### Excluded and Dropped Sources

#### Sources handed on and excluded

Each is listed with its number in the table of handed-on sources below.

- 0. Zhao Zhang Cichocki 2014 PLS overview (doi 10.1002/widm.1120), T1: review; [zhao2013hopls] covers the multilinear PLS point as a primary study.
- 1. Eliseyev 2013 recursive NPLS (doi 10.1371/journal.pone.0069962), T1: within-subject BCI decoding; no subject-level outcome.
- 2. Eliseyev 2017 REW-NPLS (doi 10.1038/s41598-017-16579-9), T1: within-subject BCI decoding; no subject-level outcome.
- 3. Camarrone 2019 fast multiway PLS (doi 10.1109/tbme.2018.2847404), T1: within-recording ECoG-to-EEG decoding; no subject-level outcome.
- 4. IPS-PLS TCDS 2023 (doi 10.1109/TCDS.2023.3267010), T1: within-subject biosignal decoding; no subject-level outcome.
- 5. Fully Bayesian tensor regression MLSP 2016 (doi 10.1109/MLSP.2016.7738860), T1: tensor PLS variant on synthetic data; abstract does not address alignment or registration.
- 6. Zhang Li 2017 tensor envelope PLS (doi 10.1080/00401706.2016.1272495), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 7. Sun 2024 partial quantile tensor regression (doi 10.1080/01621459.2024.2422129), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 8. Guhaniyogi 2017 Bayesian tensor regression (arxiv 1509.06490), T1: aligned-image tensor regression (preprint of JMLR 2017); abstract does not address alignment or registration.
- 9. Lock 2018 tensor-on-tensor (doi 10.1080/10618600.2017.1401544), T1: tensor-on-tensor regression on face images; abstract does not address alignment or registration.
- 10. Papadogeorgou 2021 soft tensor regression (arxiv 1910.09699), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 11. Song 2016 sparse multi-response tensor regression (doi 10.1109/tmi.2016.2538289), T1: aligned-image tensor regression on ADNI; abstract does not address alignment or registration.
- 12. Bayesian scalar-on-tensor Tucker (doi 10.1093/biostatistics/kxaf029), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 13. Miranda 2018 TPRM (doi 10.1214/17-aoas1116), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 14. CATCH 2018 (doi 10.1080/01621459.2018.1497500), T1: tensor classification; abstract does not address alignment or registration.
- 15. tensor quantile regression 2021 (doi 10.1214/21-aoas1475), T1: aligned-image tensor regression; abstract does not address alignment or registration.
- 16. partially observed dynamic tensor response (doi 10.1080/01621459.2021.1938082), T1: tensor response regression; the image is the response, not the input of a subject-level prediction.
- 17. SKPD JRSSB 2023 (doi 10.1093/jrsssb/qkad024), T1: aligned-image region detection; abstract does not address alignment or registration.
- 18. multi-task GP tensor regression normative (arxiv 1808.00036), T1: normative tensor GP model (preprint); abstract does not address alignment or registration.
- 19. Bayesian ToT varying coefficient AD (arxiv 2604.07764), T1: image-to-image forecasting (preprint); output is a voxel map, abstract does not address alignment.
- 20. COPA 2018 (doi 10.1145/3269206.3271775), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 21. SPARTan 2017 (doi 10.1145/3097983.3098014), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 22. AO-ADMM PARAFAC2 2022 (doi 10.1137/21m1450033), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 24. Larsen 2024 RKHS misaligned (arxiv 2408.05677), T1: decomposition of misaligned data on one synthetic example (preprint); no prediction.
- 25. Madsen 2017 multi-subject fMRI PARAFAC2 (doi 10.1002/hbm.23425), T1: comparison of component models for connectivity; no subject-level prediction.
- 26. tPARAFAC2 2025 (doi 10.1007/s10618-025-01122-6), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 27. probabilistic PARAFAC2 2024 (doi 10.3390/e26080697), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 28. Bayesian PARAFAC2 rank 2023 (doi 10.23919/eusipco58844.2023.10289945), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 29. SPADE 2020 (doi 10.1137/1.9781611976236.65), T1: unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis.
- 30. TedPar 2021 (doi 10.1137/1.9781611976700.67), T1: unsupervised PARAFAC2 phenotyping; reports reconstruction accuracy, no subject-level prediction.
- 31. latent functional PARAFAC 2026 (doi 10.1017/psy.2025.10075), T1: tensor decomposition of longitudinal scores; no prediction.
- 32. shift-invariant trilinearity 2023 (doi 10.1002/cem.3501), T1: chromatography decomposition algorithm; no prediction.
- 33. PARAFAC2 coupled CMTF 2025 (doi 10.1109/jstsp.2025.3579651), T1: coupled PARAFAC2 fitting framework; no prediction and no failure analysis.
- 34. Stegeman Lam 2016 (doi 10.1111/bmsp.12061), T1: multi-set factor analysis; no prediction.
- 35. Helwig 2013 gait PARAFAC2 (doi 10.1002/cnm.2492), T1: descriptive PARAFAC2 analysis of gait waveforms; no prediction.
- 36. Kamstrup-Nielsen 2013 core consistency (doi 10.1002/cem.2497), T1: rank-selection diagnostic for PARAFAC2; no prediction and no registration, radiomics or segmentation step.
- 37. Helwig 2013 sign indeterminacy (doi 10.1007/s11336-013-9331-7), T1: sign indeterminacy of PARAFAC2; no prediction and no registration, radiomics or segmentation step.
- 40. semi-supervised PARAFAC2 2025 (doi 10.1109/jbhi.2025.3530271), T1: semi-supervised PARAFAC2; abstract reports no prediction result, and [ren2023multipar] covers supervised PARAFAC2 with prediction.
- 41. PARAFAC2 speech age gender IWBF 2016 (doi 10.1109/iwbf.2016.7449694), T1: prediction per utterance from a speech feature matrix; workshop paper; no unaligned subject mode.
- 42. PARAFAC2 SVM age gender IET 2017 (doi 10.1049/iet-bmt.2016.0122), T1: prediction per speaker from fused features; PARAFAC2 used as dimension reduction; no unaligned subject mode.
- 43. Lee Wang 2024 unknown permutations (doi 10.1080/01621459.2024.2419114), T1: tensor denoising under unknown permutations; no subject-level prediction.
- 44. Yan Paynabar Shi 2019 point cloud tensor regression (doi 10.1080/00401706.2018.1529628), T1: the point cloud is the response of the regression, not the input of a prediction.
- 48. SCREAM Marini Bro 2013 (doi 10.1016/j.chemolab.2013.09.012), T1: no abstract or text could be read by any route: OpenAlex, Semantic Scholar (abstract elided by the publisher), Crossref, PubMed (0 records by title), Europe PMC and arXiv by title (0), the doi.org landing page (an Elsevier redirect page), the Elsevier API (HTTP 400, no key), ScienceDirect (HTTP 403), the University of Copenhagen research portal (metadata only), CORE (HTTP 403, API 429), the Rome chemometrics page (connection refused), AMiner (no abstract on the page) and a web search (no full copy); the title alone does not show a subject-level prediction in scope.
- 49. Alam 2026 joint longitudinal survival tensor (doi 10.1093/biostatistics/kxag007), T1: supervised tensor decomposition of longitudinal omics; abstract does not address alignment.
- 50. Acar 2025 tensor coupled neuroimaging survey (doi 10.1109/msp.2025.3605746), T1: survey; [acar2022tracing] covers the coupled and PARAFAC2 neuroimaging point as a primary study.
- 51. ten Berge Kiers 1996 uniqueness PARAFAC2 (doi 10.1007/bf02296962), T1: before 2013 and cited fewer than 100 times (time node).
- 52. Zijlstra Kiers 2002 degenerate (doi 10.1002/cem.764), T1: before 2013 and cited fewer than 100 times (time node).
- 64. Chen Das Chung sulcal Wasserstein (arxiv 2307.00385), T2: Wasserstein alignment of sulcal patterns for a group comparison (preprint); no subject-level prediction; [su2015shape] covers transport-based brain shape comparison.
- 65. Any2Graph 2024 (doi 10.52202/079017-3221), T2: predicts a graph as output; the input is not an unaligned set with a subject-level outcome.
- 66. semi-relaxed GW 2022 (arxiv 2110.02753), T2: graph dictionary learning for partitioning, clustering and completion; no subject-level prediction; [vincentcuaz2021online] covers GW dictionaries.
- 67. Kravtsova GW complexity (arxiv 2408.06525), T2: short note on GW non-convexity (preprint); [peyre2016gromov] and [aramayo2023uncovering] cover the point.
- 69. Beier Beinert GW barycenters (doi 10.1137/24m1654804), T2: GW barycenter algorithm; no prediction; [peyre2016gromov] covers GW barycenters.
- 71. Barbarant SpectralOT CCN 2026 (doi 10.32470/gn6tuko), T2: cross-subject stimulus decoding, short abstract; [barbarant2026functional] covers this group's functional templates.
- 72. Vayer 2020 FGW structured objects (doi 10.3390/a13090212), T2: journal version of FGW theory; [vayer2019optimal] covers FGW, and the journal adds no prediction.
- 74. Ryner 2023 global GW point clouds (arxiv 2307.09057), T2: global GW solver for point clouds (preprint); no prediction; [aramayo2023uncovering] covers GW solver difficulty.
- 75. Breitung 2026 GW hardness (arxiv 2610.16926), T2: hardness of graph distortion and GW (preprint); no prediction.
- 77. Zhang Goldfeld 2022 GW sample complexity (arxiv 2212.12848), T2: sample complexity of GW (preprint); no prediction; [memoli2011gromov] and [rioux2024entropic] cover the theory.
- 78. Steinkamp 2026 GW barycenter surrogates (arxiv 2609.11670), T2: GW barycenter test statistics for protein domains (preprint); not a subject-level prediction in a medical or set-input setting.
- 79. Zhang 2017 hyperbolic Wasserstein DTI (doi 10.1109/ISBI.2017.7950574), T2: small preliminary study (20 patients, 20 controls) at ISBI; [kundu2018discovery] and [su2015shape] cover transport-based morphometry.
- 83. Zhang 2021 deep Wasserstein graph discriminant (doi 10.1609/aaai.v35i12.17303), T2: conference version; [zhang2024wasserstein] (TPAMI) by the same line covers the Wasserstein graph dictionary.
- 84. Liu 2023 graph dictionary embedding (doi 10.1109/TAI.2023.3334259), T2: graph dictionary embedding; [zhang2024wasserstein] covers the Wasserstein graph dictionary for classification.
- 85. Belkhatir ICEET 2022 (doi 10.1109/ICEET56468.2022.10007100), T2: conference version; [belkhatir2022wasserstein] (journal) covers the method.
- 87. Ma 2015 surface shape Wasserstein (doi 10.4310/GIC.2015.V2.N4.A1), T2: hippocampal shape classification in a low-visibility venue; [su2015shape] covers the method.
- 88. Lin 2020 fixed-support barycenters (arxiv 2002.04783), T2: barycenter computation hardness; no prediction.
- 89. Wang Redko 2018 Lp OT averaging (doi 10.1109/PRNI.2018.8423953), T2: OT barycenter of fMRI maps; no subject-level prediction; [gramfort2015fast] covers transport averaging of neuroimaging data.
- 90. Rahman 2026 LOT subspaces (doi 10.2139/ssrn.7616061), T2: SSRN preprint on LOT subspaces under deformation of object point clouds; no medical setting; [moosmuller2023linear] covers LOT embeddings.
- 91. Hou 2026 OmicsMap radiomics (doi 10.1088/1361-6560/ae3b94), T2: radiomics application study that builds on segmentation-based features without removing or measuring a step.
- 93. Chowdhury Memoli 2019 GW networks (doi 10.1093/imaiai/iaz026), T2: GW distance between networks; no prediction; [memoli2011gromov] and [peyre2016gromov] cover GW.
- 101. rotation-invariant benchmark 2026 (arxiv 2611.03952), T3: robustness benchmark of rotation-invariant point networks on non-medical data (preprint); no registration, radiomics or segmentation step.
- 106. Muandet 2012 support measure machines (arxiv 1202.6504), T3: [muandet2017kernel] covers kernel mean embeddings and support measure machines.
- 107. Oliva 2013 distribution to distribution regression (openalex W1750591676), T3: distribution-to-distribution regression; no scalar subject-level outcome; [szabo2016learning] covers distribution regression.
- 108. Segol Lipman 2020 (arxiv 1910.02421), T3: universality of equivariant set networks; the output is per element, not subject-level.
- 109. Uy 2019 revisiting point cloud classification (doi 10.1109/ICCV.2019.00167), T3: non-medical point cloud object benchmark; no registration, radiomics or segmentation step.
- 110. Zweig Bruna 2022 (doi 10.52202/068431-2401), T3: separation between symmetric architectures; [wagstaff2019limitations] and [wagstaff2022universal] cover set expressivity limits.
- 112. Andreis 2021 slot set encoder (arxiv 2103.01615), T3: [willette2023scalable] covers mini-batch consistent set encoding and extends this work.
- 113. Tabaghi Wang universal representation (arxiv 2310.13829), T3: latent dimension of sum-decomposable models (preprint); [wang2024polynomial] covers the bound.
- 114. Kimura permutation-invariant survey (arxiv 2403.17410), T3: survey (preprint); primary set-function studies in the set cover the points.
- 116. Lipschitz set aggregation 2025 (arxiv 2505.24403), T3: Lipschitz constants of set aggregations (preprint); [davidson2025holder] covers stability of set embeddings.
- 118. functional perspective symmetric functions (arxiv 2008.06952), T3: learning symmetric functions over measures (preprint); [szabo2016learning] and [wagstaff2022universal] cover the point.
- 119. transformers generalize DeepSets (arxiv 2110.14416), T3: higher-order transformers for graphs and hypergraphs; no set-to-subject prediction in scope.
- 120. Yarotsky invariant maps (arxiv 1804.10306), T3: general invariant universal approximation; [zaheer2017deep] and [wagstaff2022universal] cover the set case.
- 121. sorting-based embeddings bounds (arxiv 2510.22186), T3: sorting-embedding bounds; [amir2023neural] covers injective sorting and sliced embeddings.
- 122. Sannai universal approx (arxiv 1903.01939), T3: general invariant universal approximation; [zaheer2017deep] and [wagstaff2022universal] cover the set case.
- 123. Balan permutation invariant representations (arxiv 2203.07546), T3: sorting and polynomial embeddings for graphs; [amir2023neural] covers the point.
- 124. separation power equivariant (arxiv 2406.08966), T3: separation power of equivariant networks; [wagstaff2022universal] and [amir2023neural] cover set expressivity.
- 125. moment pooling (arxiv 2403.08854), T3: moment pooling on collider physics (preprint); [wang2024polynomial] covers moment-type set embeddings.
- 126. multi-set transformers (arxiv 2206.15444), T3: functions on several sets for counting and divergence estimation (preprint); no subject-level setting in scope.
- 127. Janossy non-injectivity (arxiv 2505.20150), T3: non-injectivity of piecewise-linear Janossy pooling (preprint); [wagstaff2022universal] and [amir2023neural] cover set expressivity.
- 128. DuMLP-Pin (arxiv 2203.04007), T3: global set aggregation variant (preprint); [zaheer2017deep] and [lee2019set] cover the architectures.
- 129. convolutional set transformer (arxiv 2509.22889), T3: image-set classification on natural images (preprint); no medical or subject-level setting.
- 130. is attention interpretation sets (arxiv 2207.13018), T3: synthetic study of attention explanations on sets (preprint); measures no registration, radiomics or segmentation step.
- 131. monotone separable set functions (arxiv 2510.23634), T3: monotone set functions for containment tasks (preprint); outside the prediction setting.
- 132. dimension-free scaling laws size generalization (arxiv 2610.19279), T3: size-generalization theory (preprint); no medical setting.
- 133. quasi-arithmetic neural networks sets (arxiv 2602.04941), T3: learnable aggregation variant (preprint); [lee2019set] and [wang2024polynomial] cover learnable pooling.
- 134. embedding dimension lower bounds deep sets (arxiv 2605.08377), T3: embedding-dimension lower bounds (preprint); [wagstaff2022universal] covers the bound for Deep Sets.
- 136. Chen 2024 quantiles (title Stacking Deep Set Networks and Pooling by Quantiles), T3: confirmed on PMLR 235; quantile pooling and stacked deep sets with no medical setting; [lee2019set] and [wang2024polynomial] cover learnable set pooling.
- 138. learning aggregation functions (arxiv 2012.08482), T3: learnable aggregation function (preprint); [lee2019set] covers learnable attention pooling.
- 140. universal sample-based embeddings (arxiv 2610.19899), T3: sample-based embeddings of higher-order objects (preprint); no medical setting.
- 141. set function learning survey (doi 10.1145/3715905), T3: survey; primary set-function studies in the set cover the points.
- 142. it just takes two large sets (arxiv 2605.07972), T3: amortized inference on large sets (preprint); no subject-level medical setting.
- 143. PCT point cloud transformer (doi 10.1007/s41095-021-0229-5), T3: point cloud transformer on object benchmarks; [zhao2021point] covers transformer point networks.
- 144. PointNeXt (arxiv 2206.04670), T3: training strategies for PointNet++ on object benchmarks; [qi2017pointnetpp] covers the architecture.
- 145. Point Transformer V2 (arxiv 2210.05666), T3: point transformer variant on scene benchmarks; [zhao2021point] covers the architecture.
- 149. RobustPointSet (arxiv 2011.11572), T3: robustness dataset for object point cloud classifiers (preprint); no medical setting.
- 150. generalized sliced-Wasserstein set embeddings (arxiv 2103.03892), T3: preprint of the generalized sliced-Wasserstein set embedding line; [naderializadeh2021pooling] covers it as the peer-reviewed version.
- 153. distribution regression neural networks (doi 10.1007/s00365-025-09715-6), T3: approximation theory of distribution regression; [szabo2016learning] covers distribution regression theory.
- 154. distribution regression network generalizability (arxiv 1811.01506), T3: distribution-to-distribution regression network (preprint); no scalar outcome.
- 157. maximum kernel entropy (arxiv 2408.00549), T3: unsupervised distribution kernels (preprint); [muandet2017kernel] covers distribution kernels.
- 158. transformers distribution regression (doi 10.1162/neco_a_01726), T3: generalization theory of transformers for distribution regression; no medical or set-to-subject experiment.
- 160. MIL WSI comparative JPI (doi 10.1016/j.jpi.2024.100403), T3: comparison of two attention MIL variants on WSI; [ilse2018attention] and [lu2021data] cover attention MIL.
- 163. end-to-end slide-level supervision (arxiv 2506.02408), T3: end-to-end slide-level MIL training (preprint); [campanella2019clinical] covers end-to-end slide-level supervision.
- 164. compact rationales WSI-MIL (arxiv 2605.12575), T3: post-hoc rationale readout for WSI MIL (preprint); measures no registration, radiomics or segmentation step.
- 174. CRLM chemotherapy response DL (doi 10.1002/jso.27673), T3: instances are slices of one volume, so the bag discards a known order; no step measured (small study, 95 patients).
- 175. ranking attention MIL cervical (doi 10.1002/acm2.14547), T3: instances are slices of one volume, so the bag discards a known order; no step measured.
- 176. IDH glioma hierarchical MIL (doi 10.3389/fonc.2025.1665690), T3: instances are positions in one tumour volume with positional encoding; no correspondence across subjects handled and no step measured.
- 179. SRS brain metastases JCO abstract (doi 10.1200/jco.2026.44.16_suppl.2023), T3: conference abstract only; no full peer-reviewed report.
- 180. multiple primary lung cancers (doi 10.64388/irev10i4-1723737), T3: small held-out test set in a low-visibility venue; [yang2020relational] and [chen2022lung] cover lesion sets per patient.
- 181. modality-embedded set transformer prostate (doi 10.1109/CBMS69103.2026.00140), T3: set pooling over modalities for survival; the set is of modalities, not spatial elements.
- 184. MIL MRS brain tumor (arxiv 2112.08845), T3: preprint of the same MRS MIL line; [gacheva2026multiple] covers it in a peer-reviewed report.
- 185. autoimmune encephalitis MIL PET (doi 10.1111/cns.70513), T3: instances are regions of one aligned PET volume; no correspondence across subjects handled and no step measured.
- 186. dementia thick slice MRI (arxiv 2103.10056), T3: instances are slices of one volume; no step measured (preprint).
- 187. MIL NSCLC chemotherapy (doi 10.1038/s41598-022-24278-3), T3: instances are slices of one volume; no step measured.
- 188. patch target MIL 3D MRI (doi 10.1109/BIBM62325.2024.10821985), T3: instances are patches of one aligned volume; no step measured.
- 189. dual graph MIL brain age (arxiv 2403.01246), T3: brain-age application; instances are slices of one volume (preprint).
- 190. slice-based set networks brain age (doi 10.1109/isbi48211.2021.9434081), T3: brain-age estimation; instances are slices of one volume.
- 191. M2EF-NNs (arxiv 2408.04170), T3: multimodal WSI survival with evidence fusion (preprint); [lu2021data] covers WSI MIL.
- 192. HyperMM (arxiv 2407.20768), T3: the set is of modalities, not spatial elements (preprint).
- 193. Gutierrez-Becker Wachinger 2018 (doi 10.1007/978-3-030-00931-1_60), T3: conference version; [gutierrezbecker2021discriminative] is the journal extension and is included.
- 195. white matter tracts are point clouds MICCAI 2022 (doi 10.1007/978-3-031-16431-6_17), T3: conference version; TractGeoNet (index 194) is the journal extension.
- 206. GDL brain aging (doi 10.3389/fnagi.2022.895535), T3: brain-age application study on structure surfaces.
- 208. Azcona spiral networks AD (doi 10.1101/2021.04.15.440008), T3: spiral mesh networks for AD (preprint); [sarasua2021geometric] covers template-based mesh networks for AD.
- 210. geometric fragility hippocampus (doi 10.64898/2026.01.31.702997), T3: small conceptual preprint; no cohort details in the abstract; [sarasua2022hippocampal] covers hippocampal point clouds for AD.
- 211. GNN shape classification neuroimaging (arxiv 2210.16670), T3: comparison of GNN layers for shape classification (preprint); [sarasua2021geometric] covers the comparison.
- 212. imaging and shape features AD brain age (arxiv 2501.07994), T3: fusion of image and shape embeddings (preprint); [sarasua2021geometric] and [besson2021geometric] cover shape networks.
- 213. brain folding point cloud Trans-Unet (arxiv 2607.21840), T3: simulated finite element point clouds; no subject-level outcome.
- 215. G3e-Net haemodynamics (doi 10.1016/j.media.2026.104358), T3: predicts haemodynamic fields; the output is not a subject-level outcome.
- 216. GDL liver resection (doi 10.1016/j.compbiomed.2025.111103), T3: point cloud segmentation of resection zones; the output is a region, not a subject-level outcome.
- 218. PointNet++ OCT retinal (doi 10.1109/UBMK71847.2026.11745271), T3: point cloud built from a regular OCT voxel grid, so no correspondence is missing; small conference report.
- 219. 3D medical point transformer (arxiv 2112.04863), T3: medical point transformer on vessel segments (preprint); [luo2023prediction] covers point networks on vessels.
- 220. PointVoxelFormer (arxiv 2412.17390), T3: hybrid point and voxel network for segmentation and registration (preprint); no subject-level outcome.
- 222. medical point cloud survey (doi 10.1109/BIBM66473.2025.11357130), T3: survey; primary studies cover the points.
- 223. unconfirmed theme 3 (title Histogram Pooling Operators: An Interpretable Alternative for Deep Sets), T3: unconfirmed: title search found no record with this title.
- 231. Ragguett 2024 hydrocephalus (doi 10.3389/fnins.2024.1405363), T4: small study of 8 patients; [miller2025comparison] and [ou2014comparative] cover registration failure in distorted anatomy.
- 234. Blaiotta 2018 template (doi 10.1016/j.neuroimage.2017.10.060), T4: probabilistic template construction; [joshi2004unbiased] and [ashburner2000voxel] cover template building.
- 236. DDTemplate (doi 10.1016/j.neuroimage.2025.121401), T4: groupwise dMRI template by deep registration; [dalca2019learning] covers learned templates.
- 237. MorphLDM (doi 10.1007/978-3-032-04937-7_20), T4: generative model of brain morphology from a learned template; no prediction.
- 240. Zavaglia 2024 lesion inference (doi 10.1093/braincomms/fcae251), T4: validates lesion inference methods; measures the analysis method, not the registration, radiomics or segmentation step.
- 241. Moore 2026 LSM choices (doi 10.1002/hbm.70619), T4: simulated lesion-symptom mapping design choices; measures the analysis design, not the registration, radiomics or segmentation step.
- 244. Lambin 2017 (doi 10.1038/nrclinonc.2017.141), T4: review; [lambin2012radiomics] and [aerts2014decoding] cover the radiomics premise.
- 245. RQS 2.0 (doi 10.1038/s41571-025-01067-1), T4: quality-score review; [zwanenburg2020image] covers radiomics standardization.
- 248. Vallieres 2017 (doi 10.1038/s41598-017-10371-5), T4: radiomics application study that builds on segmentation-based features without removing or measuring a step.
- 249. Rathore 2018 (doi 10.1038/s41598-018-22739-2), T4: radiomics application study that builds on segmentation-based features without removing or measuring a step.
- 250. Carass 2017 (doi 10.1016/j.neuroimage.2016.12.064), T4: MS lesion segmentation challenge; [commowick2018objective] covers MS lesion segmentation challenges.
- 252. De Rosa 2024 (doi 10.1038/s41598-024-72649-9), T4: consensus of segmentation algorithms; [commowick2018objective] and [wynen2025conflunet] cover MS lesion segmentation.
- 256. Traverso 2018 (doi 10.1016/j.ijrobp.2018.05.053), T4: systematic review; [fornaconwood2020reliability] and the primary robustness studies included cover the point.
- 258. Mackin 2015 (doi 10.1097/RLI.0000000000000180), T4: acquisition-parameter radiomics study (scanner variability); no registration or segmentation step measured.
- 269. Owens 2018 (doi 10.1371/journal.pone.0205003), T4: small study of 10 CT scans; [haarburger2020radiomics] and [kothari2022impact] cover segmentation-induced feature uncertainty.
- 272. D'Anna 2024 (doi 10.3390/jimaging10110270), T4: small study of 22 patients on the dataset [kothari2022impact] uses; [kothari2022impact] covers inter-observer effects.
- 273. Damiano 2025 (doi 10.1109/EMBC58623.2025.11253060), T4: conference report; [haarburger2020radiomics] covers probabilistic segmentation and feature reproducibility.
- 276. Zhao 2016 (doi 10.1038/srep23428), T4: acquisition-parameter radiomics study; no registration or segmentation step measured.
- 277. Saha 2016 (doi 10.1118/1.4955435), T4: [saha2018breast] by the same group covers inter-reader variability of breast MRI features with 529 features.
- 279. van Timmeren 2016 (doi 10.18383/j.tom.2016.00208), T4: acquisition-parameter test-retest study; no registration or segmentation step measured.
- 281. He 2016 (doi 10.1038/srep34921), T4: acquisition-parameter radiomics study; no registration or segmentation step measured.
- 282. Larue 2017 (doi 10.1080/0284186X.2017.1351624), T4: acquisition and discretization phantom study; no registration or segmentation step measured.
- 283. Midya 2018 (doi 10.1117/1.JMI.5.1.011020), T4: acquisition-parameter phantom study; no registration or segmentation step measured.
- 284. Ziegelmayer 2022 (doi 10.1097/RLI.0000000000000827), T4: acquisition-parameter phantom comparison of CNN and radiomics features; no registration or segmentation step measured.
- 292. Hwang 2021 (doi 10.1016/j.neurobiolaging.2021.04.015), T4: brain-age application study; the PubMed abstract (PMID 34049061) reports the error of a CNN on routine T2-weighted scans and associations of the age gap with white matter hyperintensity and diabetes, and states no correspondence handling and no registration, radiomics or segmentation step that the study removes, builds on or measures.
- 293. Jonsson 2019 (doi 10.1038/s41467-019-13163-9), T4: brain-age application study with GWAS.
- 294. Cole 2015 TBI (doi 10.1002/ana.24367), T4: brain-age application study.
- 295. Cole 2017 Down syndrome (doi 10.1016/j.neurobiolaging.2017.04.006), T4: brain-age application study.
- 296. Cole 2017 HIV (doi 10.1212/WNL.0000000000003790), T4: brain-age application study.
- 297. Gaser 2013 (doi 10.1371/journal.pone.0067346), T4: brain-age application study.
- 298. Koutsouleris 2014 (doi 10.1093/schbul/sbt142), T4: brain-age application study.
- 299. Pardoe 2017 (doi 10.1016/j.eplepsyres.2017.03.007), T4: brain-age application study; the PubMed abstract (PMID 28410487) reports an older estimated brain age in refractory focal epilepsy than in controls, and states no correspondence handling and no registration, radiomics or segmentation step that the study removes, builds on or measures.
- 300. Kalc 2024 (doi 10.1002/hbm.26632), T4: revision of a brain-age regression workflow; no registration or segmentation step measured.
- 301. Colman 2026 (doi 10.1002/hbm.70425), T4: brain-age application study on FLAIR.
- 302. Juglan 2026 (doi 10.1186/s40708-026-00316-y), T4: architecture comparison for age and sex prediction; no registration or segmentation step measured.
- 304. Shen 2007 VBM template (doi 10.1016/j.mri.2007.03.025), T4: before 2013 and cited fewer than 100 times (time node).
- 310. MICCAI 2025 MoST-IG (title MoST-IG), T4: abstract read on the Springer chapter page and the MICCAI 2025 paper page: spatial transcriptomics integration across slices with graph transport, evaluated on cancer grading and detection of tissue spots and clustering, with no subject-level outcome.
- 311. MICCAI 2025 MOTOR (title MOTOR), T4: confirmed as MOTOR: Multimodal Optimal Transport via Grounded Retrieval in Medical Visual Question Answering (MICCAI 2025, DOI 10.1007/978-3-032-04978-0_44, on the MICCAI 2025 paper list); transport is used to re-rank retrieved context for visual question answering, with no subject-level prediction from unaligned data, so it is off the topic.
- 312. MICCAI 2025 C2MAOT (title C2MAOT), T4: cancer segmentation method; the output is a segmentation, not a subject-level outcome.
- 313. Franke Gaser 2012 unconfirmed (title Longitudinal changes in individual BrainAGE in healthy aging, mild cognitive impairment, and Alzheimer's disease), T4: confirmed by title search (GeroPsych 2012, DOI 10.1024/1662-9647/a000074); brain-age application study.

#### Merge search and IPMI records excluded at the abstract stage

- I35 (10.1007/978-3-642-38868-2_35): within-subject (trial-level) M/EEG decoding (PMID 24683987).
- I120 (10.1007/978-3-319-19992-4_8): no prediction; [adams2023point] covers correspondence-free SSM.
- I254 (10.1007/978-3-030-78191-0_30): TopoTxR: topological biomarker; does not remove or measure registration, radiomics or segmentation.
- I266 (10.1007/978-3-030-78191-0_55): output is a segmentation and its uncertainty; no subject-level prediction.
- I309 (10.1007/978-3-031-34048-2_35): out of scope.
- I313 (10.1007/978-3-031-34048-2_12): abstract read on the Springer chapter page: multi-task MIL over the patches of one whole-slide image for diagnosis and prognosis; slide-level bag classification over the tiles of one slide is covered by the included [campanella2019clinical], [lu2021data] and [shao2021transmil].
- I323 (10.1007/978-3-031-34048-2_23): no prediction.
- I387 (10.1007/978-3-031-96628-6_20): output is a segmentation (arXiv 2412.14619).
- S105 (10.48550/arxiv.2205.15733): TFGW; duplicate of included [vincentcuaz2022template].
- S330 (PMID:29225556): conference version of included S333.
- S336 (10.1038/s41467-021-21467-y): covered by [campanella2019clinical].
- S344 (10.1186/s13195-021-00915-3): OT for domain transfer, not correspondence.

#### Citation-round and recent-literature records excluded at the abstract stage

- Point Transformer with Federated Learning for Predicting Breast Cancer HER2 Status from Whole Slide Images, W4393156131 (DOI 10.1609/aaai.v38i4.28082), forward: the set is the tiles of one slide and the contribution is federated training; slide-level bag classification is covered by [campanella2019clinical, lu2021data, shao2021transmil].
- Modeling 3D Cardiac Contraction and Relaxation With Point Cloud Deformation Networks, W4394994634 (DOI 10.1109/jbhi.2024.3389871), forward: the same group and the same point-cloud myocardial infarction prediction as the included [beetz20233d, beetz2023multi, beetz20253d]; covered.
- Linearized Optimal Transport on Manifolds, W4400466903 (DOI 10.1137/23m1564535), forward: theory of the linearized embedding with no prediction; the embedding for classification is covered by [moosmuller2023linear, wang2025linearized].
- Gromov-Wasserstein Barycenters: The Analysis Problem, W4414699788 (DOI 10.1137/25m1777116), forward: estimation of barycentric coordinates with no prediction of an outcome; GW barycenters are covered by [peyre2016gromov, brogatmotte2022learning].
- Fast and interpretable quantification of biological shape heterogeneity via stratified Wasserstein kernel, W4416011677 (DOI 10.1371/journal.pcbi.1014254), forward: hypothesis testing between cell populations, no subject-level or unit-level prediction.
- Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport-Based Morphometry, W4407845424 (DOI 10.1002/cyto.a.24917), forward: morphological differences between tumor categories with no prediction stated; transport embeddings of nuclei with a patient-level prediction are covered by [tosun2015detection, hanna2017predictive].
- Does consensus contour improve robustness and accuracy in 18F-FDG PET radiomic features?, W4399384579 (DOI 10.1186/s40658-024-00652-0), forward: feature reproducibility (intraclass correlation) with no prediction.
- Benchmarking Embedding Aggregation Methods in Computational Pathology: A Clinical Data Perspective, W4400601311 (DOI 10.48550/arxiv.2407.07841), forward: aggregation of the tiles of one slide; covered by the included slide-level sources [campanella2019clinical, lu2021data, shao2021transmil].
- PointVoxelFormer: Reviving point cloud networks for 3D medical imaging, W4405767859 (DOI 10.48550/arxiv.2412.17390), forward: segmentation and registration outputs, no subject-level outcome (also handed on, number 220).
- Computational Anatomy And AI For Quantifying Tumor-Immune Spatial Geometry From Medical Images, W7139000143 (DOI 10.29284/s98jm241), forward: a narrative review.
- Learning set representations with self-supervised masked transformer, W7162960380 (DOI 10.1016/j.engappai.2026.115209), forward: no abstract or text could be read by any route: OpenAlex and Semantic Scholar give no abstract, the doi.org landing page is an Elsevier redirect page, the Elsevier API returned HTTP 400 (no key held), Europe PMC and arXiv by exact title returned 0 records, and a web search by exact title returned 10 results, none of them this paper; the title alone does not show a subject-level prediction.
- Sparse Dictionary Learning for Measure-Valued Data via Linearized Optimal Transport, W7221515592 (DOI 10.48550/arxiv.2610.12924), forward: representation learning with generalization bounds and no prediction of a labelled outcome stated.
- Automated Three-Dimensional Imaging and Pfirrmann Classification of Intervertebral Disc, W4402478661 (DOI 10.1007/s10278-024-01251-2), recent R1: the label is the grade of each disc, not a subject-level outcome.
- Ranking attention multiple instance learning for lymph node metastasis prediction on cervical cancer MRI, W4403162880 (DOI 10.1002/acm2.14547), recent R4r: the instances are the 2D slices of one MRI volume, an image on a grid.
- Lymph Node Metastasis Classification with Prototype-Guided Multiple Instance Aggregation, W4414380828 (DOI 10.1007/978-3-032-04927-8_30), recent R4r: abstract read on the Springer chapter page: the instances are the CT slices of one 3D lymph node and the label is the metastasis status of that node (809 nodes of 284 patients), so the bag is the slices of one volume, as in W4403162880 above.
- Added value of feature uncertainty in a radiomic analysis of contrast-enhanced digital mammography, W4399117281 (DOI 10.1117/12.3027034), recent R3: the delineation and misalignment uncertainty is added as a model input in 33 patients, and the effect of the segmentation step on the prediction is not measured.
- A PointNet++-Based Deep Learning Approach Using Patient-Specific 3D Point Clouds for DBS Efficacy Prediction, W4414593707 (DOI 10.21203/rs.3.rs-7526425/v1), recent R2: preprint of the work published as the included [liu2026three].
- DeepPoint-DBS: An AI-Driven Point Cloud Framework for Personalized Prediction of DBS Efficacy, W4414077156 (DOI 10.2139/ssrn.5427103), recent R1: preprint of the work published as the included [liu2026three], with no abstract.
- Enhancing stability in cardiac risk stratification with equivariant neural fields, W7123344055 (DOI 10.1093/ehjdh/ztaf143.052), recent R1: a congress abstract in a journal supplement; the full paper of the group is the included [wiers2026geometry].
- Three-dimensional deep-learning age and sex estimation from the fourth rib: dataset and reference implementation, W7202056434 (DOI 10.5281/zenodo.21864405), recent R1: a data deposit.
- Modality-Embedded Set Transformer Pooling for Multimodal Prostate Cancer Survival Prediction, W7221116958 (DOI 10.1109/cbms69103.2026.00140), recent R4r: the set is the modalities of one patient, each modality embedding being fixed in kind.
- Patient-Level Deep Fusion, Radiomics, and Ensemble Learning for Differentiation of Multiple Primary Lung Cancers, W7221155161 (DOI 10.64388/irev10i4-1723737), recent R4r: the venue (Iconic Research and Engineering Journals) does not meet the venue criterion.
- A Wasserstein Weisfeiler-Lehman Kernel Framework for Multimodal Brain Connectome Analysis, W7224278541 (DOI 10.21203/rs.3.rs-11266269/v1), recent R2: benchmark on simulated signal regimes; Wasserstein graph kernels are covered by [togninalli2019wasserstein].
- Clinically Aligned Temporal Point-Cloud Fusion for Lung Cancer Progression Prediction, W7235346440 (DOI 10.1016/j.inffus.2026.104979), recent R1: no abstract or text could be read by any route: OpenAlex and Semantic Scholar give no abstract, the doi.org landing page is an Elsevier redirect page, the Elsevier API returned HTTP 400 (no key held), Europe PMC and arXiv by exact title returned 0 records, and a web search by exact title returned 10 results, none of them this paper; the title names a point-cloud prediction, but no annotation could state what the paper reports.
- A Multicenter Pancreatic CT Radiomics Framework for Assessing Technical Robustness and Segmentation-Related Prediction Sensitivity, W7235349935 (DOI 10.6084/m9.figshare.35043922), recent R3: a data deposit on Figshare, not a published study.

#### Records excluded on title

Records screened on title and not taken to the abstract stage are counted, not listed: 348 of the merge M, N and P searches, 404 of the IPMI search, 604 of the backward round, 417 of the forward round and 113 of the recent-literature searches. Their counts per query are in the table of queries.

#### Unconfirmed, excluded

- Handed-on number 223, "Histogram Pooling Operators: An Interpretable Alternative for Deep Sets": no record with this title in OpenAlex (query T-HPO), in arXiv (T-HPO2, 0 records) or among the Semantic Scholar results (T-HPO3, 81 records, none with this title).

Handed-on number 311, MOTOR, is confirmed on the MICCAI 2025 paper list and by Crossref as "MOTOR: Multimodal Optimal Transport via Grounded Retrieval in Medical Visual Question Answering" (DOI 10.1007/978-3-032-04978-0_44); its abstract was read there and it is excluded as off the topic, with its reason in the table of handed-on sources. The handed-on name described it as transport for survival, which is why T-MOTOR and T-MOTOR2 did not find it.

#### Dropped after annotation

- Wasserstein-Based Distance for Constructing Multi-Scale Individual Brain Networks from FDG-PET Images: Application to Alzheimer's Disease Diagnosis (EUSIPCO 2024, DOI 10.23919/eusipco63174.2024.10714992, W4404577611, recent R2): the abstract reports connectivity differences between diagnostic groups and no classification or other prediction result, so it fails the relevance node.

### Handed-on Sources

All 314 sources the four theme runs handed on, each with its decision and its reason. For an included source the key is given; its reason is in its annotation.

| No. | Theme | Identifier | Source | Decision | Key or reason |
|---|---|---|---|---|---|
| 0 | T1 | doi 10.1002/widm.1120 | Zhao Zhang Cichocki 2014 PLS overview | Excluded | review; [zhao2013hopls] covers the multilinear PLS point as a primary study |
| 1 | T1 | doi 10.1371/journal.pone.0069962 | Eliseyev 2013 recursive NPLS | Excluded | within-subject BCI decoding; no subject-level outcome |
| 2 | T1 | doi 10.1038/s41598-017-16579-9 | Eliseyev 2017 REW-NPLS | Excluded | within-subject BCI decoding; no subject-level outcome |
| 3 | T1 | doi 10.1109/tbme.2018.2847404 | Camarrone 2019 fast multiway PLS | Excluded | within-recording ECoG-to-EEG decoding; no subject-level outcome |
| 4 | T1 | doi 10.1109/TCDS.2023.3267010 | IPS-PLS TCDS 2023 | Excluded | within-subject biosignal decoding; no subject-level outcome |
| 5 | T1 | doi 10.1109/MLSP.2016.7738860 | Fully Bayesian tensor regression MLSP 2016 | Excluded | tensor PLS variant on synthetic data; abstract does not address alignment or registration |
| 6 | T1 | doi 10.1080/00401706.2016.1272495 | Zhang Li 2017 tensor envelope PLS | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 7 | T1 | doi 10.1080/01621459.2024.2422129 | Sun 2024 partial quantile tensor regression | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 8 | T1 | arxiv 1509.06490 | Guhaniyogi 2017 Bayesian tensor regression | Excluded | aligned-image tensor regression (preprint of JMLR 2017); abstract does not address alignment or registration |
| 9 | T1 | doi 10.1080/10618600.2017.1401544 | Lock 2018 tensor-on-tensor | Excluded | tensor-on-tensor regression on face images; abstract does not address alignment or registration |
| 10 | T1 | arxiv 1910.09699 | Papadogeorgou 2021 soft tensor regression | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 11 | T1 | doi 10.1109/tmi.2016.2538289 | Song 2016 sparse multi-response tensor regression | Excluded | aligned-image tensor regression on ADNI; abstract does not address alignment or registration |
| 12 | T1 | doi 10.1093/biostatistics/kxaf029 | Bayesian scalar-on-tensor Tucker | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 13 | T1 | doi 10.1214/17-aoas1116 | Miranda 2018 TPRM | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 14 | T1 | doi 10.1080/01621459.2018.1497500 | CATCH 2018 | Excluded | tensor classification; abstract does not address alignment or registration |
| 15 | T1 | doi 10.1214/21-aoas1475 | tensor quantile regression 2021 | Excluded | aligned-image tensor regression; abstract does not address alignment or registration |
| 16 | T1 | doi 10.1080/01621459.2021.1938082 | partially observed dynamic tensor response | Excluded | tensor response regression; the image is the response, not the input of a subject-level prediction |
| 17 | T1 | doi 10.1093/jrsssb/qkad024 | SKPD JRSSB 2023 | Excluded | aligned-image region detection; abstract does not address alignment or registration |
| 18 | T1 | arxiv 1808.00036 | multi-task GP tensor regression normative | Excluded | normative tensor GP model (preprint); abstract does not address alignment or registration |
| 19 | T1 | arxiv 2604.07764 | Bayesian ToT varying coefficient AD | Excluded | image-to-image forecasting (preprint); output is a voxel map, abstract does not address alignment |
| 20 | T1 | doi 10.1145/3269206.3271775 | COPA 2018 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 21 | T1 | doi 10.1145/3097983.3098014 | SPARTan 2017 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 22 | T1 | doi 10.1137/21m1450033 | AO-ADMM PARAFAC2 2022 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 23 | T1 | doi 10.1007/978-3-319-93764-9_9 | Cohen Bro 2018 nonnegative PARAFAC2 | Included | [cohen2018nonnegative]; PARAFAC2 fitting with nonnegativity on the varying mode; abstract read on the Springer chapter page reached through the Crossref link |
| 24 | T1 | arxiv 2408.05677 | Larsen 2024 RKHS misaligned | Excluded | decomposition of misaligned data on one synthetic example (preprint); no prediction |
| 25 | T1 | doi 10.1002/hbm.23425 | Madsen 2017 multi-subject fMRI PARAFAC2 | Excluded | comparison of component models for connectivity; no subject-level prediction |
| 26 | T1 | doi 10.1007/s10618-025-01122-6 | tPARAFAC2 2025 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 27 | T1 | doi 10.3390/e26080697 | probabilistic PARAFAC2 2024 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 28 | T1 | doi 10.23919/eusipco58844.2023.10289945 | Bayesian PARAFAC2 rank 2023 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 29 | T1 | doi 10.1137/1.9781611976236.65 | SPADE 2020 | Excluded | unsupervised PARAFAC2 fitting variant; no prediction and no failure analysis |
| 30 | T1 | doi 10.1137/1.9781611976700.67 | TedPar 2021 | Excluded | unsupervised PARAFAC2 phenotyping; reports reconstruction accuracy, no subject-level prediction |
| 31 | T1 | doi 10.1017/psy.2025.10075 | latent functional PARAFAC 2026 | Excluded | tensor decomposition of longitudinal scores; no prediction |
| 32 | T1 | doi 10.1002/cem.3501 | shift-invariant trilinearity 2023 | Excluded | chromatography decomposition algorithm; no prediction |
| 33 | T1 | doi 10.1109/jstsp.2025.3579651 | PARAFAC2 coupled CMTF 2025 | Excluded | coupled PARAFAC2 fitting framework; no prediction and no failure analysis |
| 34 | T1 | doi 10.1111/bmsp.12061 | Stegeman Lam 2016 | Excluded | multi-set factor analysis; no prediction |
| 35 | T1 | doi 10.1002/cnm.2492 | Helwig 2013 gait PARAFAC2 | Excluded | descriptive PARAFAC2 analysis of gait waveforms; no prediction |
| 36 | T1 | doi 10.1002/cem.2497 | Kamstrup-Nielsen 2013 core consistency | Excluded | rank-selection diagnostic for PARAFAC2; no prediction and no registration, radiomics or segmentation step |
| 37 | T1 | doi 10.1007/s11336-013-9331-7 | Helwig 2013 sign indeterminacy | Excluded | sign indeterminacy of PARAFAC2; no prediction and no registration, radiomics or segmentation step |
| 38 | T1 | doi 10.1145/3368555.3384464 | TASTE 2020 | Included | [afshar2020taste]; PARAFAC2 on irregular EHR visit mode with a downstream subject-level heart-failure prediction |
| 39 | T1 | doi 10.1145/3394486.3403213 | LogPar 2020 | Included | [yin2020logpar]; logistic PARAFAC2 on irregular tensors with heart-failure and mortality prediction |
| 40 | T1 | doi 10.1109/jbhi.2025.3530271 | semi-supervised PARAFAC2 2025 | Excluded | semi-supervised PARAFAC2; abstract reports no prediction result, and [ren2023multipar] covers supervised PARAFAC2 with prediction |
| 41 | T1 | doi 10.1109/iwbf.2016.7449694 | PARAFAC2 speech age gender IWBF 2016 | Excluded | prediction per utterance from a speech feature matrix; workshop paper; no unaligned subject mode |
| 42 | T1 | doi 10.1049/iet-bmt.2016.0122 | PARAFAC2 SVM age gender IET 2017 | Excluded | prediction per speaker from fused features; PARAFAC2 used as dimension reduction; no unaligned subject mode |
| 43 | T1 | doi 10.1080/01621459.2024.2419114 | Lee Wang 2024 unknown permutations | Excluded | tensor denoising under unknown permutations; no subject-level prediction |
| 44 | T1 | doi 10.1080/00401706.2018.1529628 | Yan Paynabar Shi 2019 point cloud tensor regression | Excluded | the point cloud is the response of the regression, not the input of a prediction |
| 45 | T1 | doi 10.1214/23-aoas1858 | continuous atlas-free connectivity 2024 | Included | [consagra2024continuous]; atlas-free continuous model of structural connectivity that removes the atlas parcellation step |
| 46 | T1 | doi 10.1038/s41598-023-46747-z | prostate MRI misalignment 2023 | Included | [kovacs2023addressing]; compares registration, no registration and misalignment augmentation for prostate cancer diagnosis on the same data |
| 47 | T1 | arxiv 2611.03608 | penalized Cox distribution-valued predictors | Included | [ghosal2026penalized]; distribution-valued ROI predictors for survival (preprint, 308 ADNI patients) |
| 48 | T1 | doi 10.1016/j.chemolab.2013.09.012 | SCREAM Marini Bro 2013 | Excluded | no abstract or text could be read by any route: OpenAlex, Semantic Scholar (abstract elided by the publisher), Crossref, PubMed (0 records by title), Europe PMC and arXiv by title (0), the doi.org landing page (an Elsevier redirect page), the Elsevier API (HTTP 400, no key), ScienceDirect (HTTP 403), the University of Copenhagen research portal (metadata only), CORE (HTTP 403, API 429), the Rome chemometrics page (connection refused), AMiner (no abstract on the page) and a web search (no full copy); the title alone does not show a subject-level prediction in scope |
| 49 | T1 | doi 10.1093/biostatistics/kxag007 | Alam 2026 joint longitudinal survival tensor | Excluded | supervised tensor decomposition of longitudinal omics; abstract does not address alignment |
| 50 | T1 | doi 10.1109/msp.2025.3605746 | Acar 2025 tensor coupled neuroimaging survey | Excluded | survey; [acar2022tracing] covers the coupled and PARAFAC2 neuroimaging point as a primary study |
| 51 | T1 | doi 10.1007/bf02296962 | ten Berge Kiers 1996 uniqueness PARAFAC2 | Excluded | before 2013 and cited fewer than 100 times (time node) |
| 52 | T1 | doi 10.1002/cem.764 | Zijlstra Kiers 2002 degenerate | Excluded | before 2013 and cited fewer than 100 times (time node) |
| 53 | T2 | arxiv 1810.08278 | Feydy 2019 OT MMD Sinkhorn divergences | Included | [feydy2019interpolating]; Sinkhorn divergences, the debiased transport loss used for point sets (AISTATS 2019) |
| 54 | T2 | doi 10.1007/s11263-012-0566-z | Wang 2013 LOT framework | Included | [wang2013linear]; linear optimal transport embedding of a set of images relative to a reference, for pattern recognition across images |
| 55 | T2 | arxiv 2006.09430 | Kolouri 2021 Wasserstein embedding graph | Included | [kolouri2021wasserstein]; linear transport embedding of node-embedding sets to a reference distribution for graph-level prediction |
| 56 | T2 | arxiv 1906.01277 | Togninalli 2019 WWL kernels | Included | [togninalli2019wasserstein]; Wasserstein distance between node-feature distributions for graph classification |
| 57 | T2 | doi 10.1109/TPAMI.2024.3409772 | Zhang 2024 Wasserstein discriminant dictionary | Included | [zhang2024wasserstein]; supervised Wasserstein graph dictionary for graph classification |
| 58 | T2 | doi 10.1016/j.neuroimage.2017.11.006 | Kundu 2018 TBM structural biomarkers | Included | [kundu2018discovery]; transport-based morphometry mapping brain images to a transport domain for phenotype prediction without a priori features |
| 59 | T2 | doi 10.1126/sciadv.adl5307 | Kundu 2024 gene brain behavior autism | Included | [kundu2024discovering]; 3D transport-based morphometry predicting 16p11.2 copy number from brain MRI |
| 60 | T2 | doi 10.1016/j.media.2023.102864 | Dadashkarimi 2023 CAROT | Included | [dadashkarimi2023cross]; optimal transport mapping of connectomes between atlas parcellations without raw data |
| 61 | T2 | arxiv 2401.01460 | Mahan 2024 deep set LOT point cloud | Included | [mahan2024point]; point-cloud classification by linearized transport to a shared reference with input convex networks |
| 62 | T2 | arxiv 2408.11370 | Wang Fan 2024 reference distribution graph | Included | [wang2024graph]; graph classification by MMD to learned reference distributions over node embeddings |
| 63 | T2 | doi 10.1016/j.media.2025.103538 | Kwon 2025 sulcal prototype CHD | Included | [kwon2025graph]; prototype graph network for sulcal pattern graphs that replaces spectral graph matching against a reference set |
| 64 | T2 | arxiv 2307.00385 | Chen Das Chung sulcal Wasserstein | Excluded | Wasserstein alignment of sulcal patterns for a group comparison (preprint); no subject-level prediction; [su2015shape] covers transport-based brain shape comparison |
| 65 | T2 | doi 10.52202/079017-3221 | Any2Graph 2024 | Excluded | predicts a graph as output; the input is not an unaligned set with a subject-level outcome |
| 66 | T2 | arxiv 2110.02753 | semi-relaxed GW 2022 | Excluded | graph dictionary learning for partitioning, clustering and completion; no subject-level prediction; [vincentcuaz2021online] covers GW dictionaries |
| 67 | T2 | arxiv 2408.06525 | Kravtsova GW complexity | Excluded | short note on GW non-convexity (preprint); [peyre2016gromov] and [aramayo2023uncovering] cover the point |
| 68 | T2 | arxiv 2303.05978 | Aramayo continuous GW challenges | Included | [aramayo2023uncovering]; benchmark that measures where continuous GW solvers fail (preprint) |
| 69 | T2 | doi 10.1137/24m1654804 | Beier Beinert GW barycenters | Excluded | GW barycenter algorithm; no prediction; [peyre2016gromov] covers GW barycenters |
| 70 | T2 | doi 10.1016/j.patcog.2023.109351 | Nguyen Tsuda linear FGW | Included | [nguyen2023linear]; linear fused GW embedding of graphs relative to a reference for kernel classification |
| 71 | T2 | doi 10.32470/gn6tuko | Barbarant SpectralOT CCN 2026 | Excluded | cross-subject stimulus decoding, short abstract; [barbarant2026functional] covers this group's functional templates |
| 72 | T2 | doi 10.3390/a13090212 | Vayer 2020 FGW structured objects | Excluded | journal version of FGW theory; [vayer2019optimal] covers FGW, and the journal adds no prediction |
| 73 | T2 | doi 10.1080/01621459.2021.1956937 | Chen Lin Muller Wasserstein regression | Included | [chen2023wasserstein]; regression with distributions as predictors and scalar or distributional responses |
| 74 | T2 | arxiv 2307.09057 | Ryner 2023 global GW point clouds | Excluded | global GW solver for point clouds (preprint); no prediction; [aramayo2023uncovering] covers GW solver difficulty |
| 75 | T2 | arxiv 2610.16926 | Breitung 2026 GW hardness | Excluded | hardness of graph distortion and GW (preprint); no prediction |
| 76 | T2 | arxiv 2107.02010 | Feydy 2019 OT brain tractograms | Included | [feydy2019fast]; multiscale Sinkhorn transport between brain tractograms with a Wasserstein barycenter atlas (MICCAI 2019) |
| 77 | T2 | arxiv 2212.12848 | Zhang Goldfeld 2022 GW sample complexity | Excluded | sample complexity of GW (preprint); no prediction; [memoli2011gromov] and [rioux2024entropic] cover the theory |
| 78 | T2 | arxiv 2609.11670 | Steinkamp 2026 GW barycenter surrogates | Excluded | GW barycenter test statistics for protein domains (preprint); not a subject-level prediction in a medical or set-input setting |
| 79 | T2 | doi 10.1109/ISBI.2017.7950574 | Zhang 2017 hyperbolic Wasserstein DTI | Excluded | small preliminary study (20 patients, 20 controls) at ISBI; [kundu2018discovery] and [su2015shape] cover transport-based morphometry |
| 80 | T2 | doi 10.1109/CVPR.2016.546 | Shi Zhang Wang 2016 hyperbolic Wasserstein | Included | [shi2016shape]; hyperbolic Wasserstein distance between cortical surfaces for AD classification |
| 81 | T2 | doi 10.1038/s41746-026-03323-9 | GWDRO-Lung 2026 | Included | [yan2026gwdro]; GW barycenter alignment of cohort geometries for nodule malignancy prediction across cohorts |
| 82 | T2 | doi 10.1109/tcds.2026.3722535 | Peng 2026 Wasserstein graph brain network | Included | [peng2026wasserstein]; transport-based brain network classification for AD and epilepsy |
| 83 | T2 | doi 10.1609/aaai.v35i12.17303 | Zhang 2021 deep Wasserstein graph discriminant | Excluded | conference version; [zhang2024wasserstein] (TPAMI) by the same line covers the Wasserstein graph dictionary |
| 84 | T2 | doi 10.1109/TAI.2023.3334259 | Liu 2023 graph dictionary embedding | Excluded | graph dictionary embedding; [zhang2024wasserstein] covers the Wasserstein graph dictionary for classification |
| 85 | T2 | doi 10.1109/ICEET56468.2022.10007100 | Belkhatir ICEET 2022 | Excluded | conference version; [belkhatir2022wasserstein] (journal) covers the method |
| 86 | T2 | doi 10.1109/TPAMI.2015.2408346 | Su 2015 OMT shape TPAMI | Included | [su2015optimal]; optimal mass transport maps for surface registration and shape space |
| 87 | T2 | doi 10.4310/GIC.2015.V2.N4.A1 | Ma 2015 surface shape Wasserstein | Excluded | hippocampal shape classification in a low-visibility venue; [su2015shape] covers the method |
| 88 | T2 | arxiv 2002.04783 | Lin 2020 fixed-support barycenters | Excluded | barycenter computation hardness; no prediction |
| 89 | T2 | doi 10.1109/PRNI.2018.8423953 | Wang Redko 2018 Lp OT averaging | Excluded | OT barycenter of fMRI maps; no subject-level prediction; [gramfort2015fast] covers transport averaging of neuroimaging data |
| 90 | T2 | doi 10.2139/ssrn.7616061 | Rahman 2026 LOT subspaces | Excluded | SSRN preprint on LOT subspaces under deformation of object point clouds; no medical setting; [moosmuller2023linear] covers LOT embeddings |
| 91 | T2 | doi 10.1088/1361-6560/ae3b94 | Hou 2026 OmicsMap radiomics | Excluded | radiomics application study that builds on segmentation-based features without removing or measuring a step |
| 92 | T2 | doi 10.1145/2897824.2925903 | Solomon 2016 entropic metric alignment | Included | [solomon2016entropic]; entropic GW correspondence between geometric domains, the soft matching used for unaligned shapes |
| 93 | T2 | doi 10.1093/imaiai/iaz026 | Chowdhury Memoli 2019 GW networks | Excluded | GW distance between networks; no prediction; [memoli2011gromov] and [peyre2016gromov] cover GW |
| 94 | T2 | title Pooling by Sliced-Wasserstein Embedding | Naderializadeh 2021 | Included | [naderializadeh2021pooling]; sliced-Wasserstein embedding as a trainable set pooling (NeurIPS 2021, confirmed on the proceedings page) |
| 95 | T2 | doi 10.1002/cyto.a.24918 | Gachon 2025 cytometry OT | Included | [gachon2025low]; multi-patient flow cytometry point clouds embedded by linearized transport for residual disease detection |
| 96 | T3 | doi 10.52202/079017-1948 | Ma 2024 canonicalization | Included | [ma2024canonicalization]; canonicalization as a design of frames for invariance (NeurIPS 2024) |
| 97 | T3 | arxiv 2106.00908 | TransMIL 2021 | Included | [shao2021transmil]; correlated transformer MIL over whole-slide patch bags; standard pathology baseline |
| 98 | T3 | doi 10.34133/bmef.0276 | Liu 2026 DBS point cloud | Included | [liu2026three]; patient point clouds for DBS motor response prediction (small study, 79 patients) |
| 99 | T3 | arxiv 2107.01959 | Wagstaff 2022 universal approximation sets | Included | [wagstaff2022universal]; universal approximation of set functions and Janossy pooling (journal extension of [wagstaff2019limitations]) |
| 100 | T3 | doi 10.1109/IJCNN69854.2026.11729839 | NeuroAPS-Net 2026 | Included | [islam2026neuroaps]; MRI-derived point clouds for AD classification (IJCNN 2026) |
| 101 | T3 | arxiv 2611.03952 | rotation-invariant benchmark 2026 | Excluded | robustness benchmark of rotation-invariant point networks on non-medical data (preprint); no registration, radiomics or segmentation step |
| 102 | T3 | arxiv 2208.12401 | Willette 2023 mini-batch consistency | Included | [willette2023scalable]; mini-batch consistent set encoding for large sets with high-resolution cancer detection |
| 103 | T3 | arxiv 1511.06391 | Vinyals 2016 order matters | Included | [vinyals2016order]; read-process-write set encoder showing that input order matters (seminal, ICLR 2016) |
| 104 | T3 | arxiv 1901.06082 | Bloem-Reddy Teh 2020 | Included | [bloemreddy2020probabilistic]; probabilistic symmetries and the structure of invariant networks (JMLR 2020) |
| 105 | T3 | openalex W2154318594 | Maron Lozano-Perez 1997 MIL | Included | [maron1997framework]; diverse density framework for multiple-instance learning (seminal) |
| 106 | T3 | arxiv 1202.6504 | Muandet 2012 support measure machines | Excluded | [muandet2017kernel] covers kernel mean embeddings and support measure machines |
| 107 | T3 | openalex W1750591676 | Oliva 2013 distribution to distribution regression | Excluded | distribution-to-distribution regression; no scalar subject-level outcome; [szabo2016learning] covers distribution regression |
| 108 | T3 | arxiv 1910.02421 | Segol Lipman 2020 | Excluded | universality of equivariant set networks; the output is per element, not subject-level |
| 109 | T3 | doi 10.1109/ICCV.2019.00167 | Uy 2019 revisiting point cloud classification | Excluded | non-medical point cloud object benchmark; no registration, radiomics or segmentation step |
| 110 | T3 | doi 10.52202/068431-2401 | Zweig Bruna 2022 | Excluded | separation between symmetric architectures; [wagstaff2019limitations] and [wagstaff2022universal] cover set expressivity limits |
| 111 | T3 | arxiv 2405.16519 | Amir Dym 2025 Fourier sliced-Wasserstein | Included | [amir2025fourier]; Fourier sliced-Wasserstein embedding of multisets, injective and bi-Lipschitz |
| 112 | T3 | arxiv 2103.01615 | Andreis 2021 slot set encoder | Excluded | [willette2023scalable] covers mini-batch consistent set encoding and extends this work |
| 113 | T3 | arxiv 2310.13829 | Tabaghi Wang universal representation | Excluded | latent dimension of sum-decomposable models (preprint); [wang2024polynomial] covers the bound |
| 114 | T3 | arxiv 2403.17410 | Kimura permutation-invariant survey | Excluded | survey (preprint); primary set-function studies in the set cover the points |
| 115 | T3 | arxiv 2110.03336 | Puny frame averaging | Included | [puny2022frame]; frame averaging for invariant point cloud and graph networks (ICLR 2022) |
| 116 | T3 | arxiv 2505.24403 | Lipschitz set aggregation 2025 | Excluded | Lipschitz constants of set aggregations (preprint); [davidson2025holder] covers stability of set embeddings |
| 117 | T3 | arxiv 2206.11925 | Set Norm 2022 | Included | [zhang2022set]; deep set normalization with a single-cell blood dataset for permutation-invariant prediction (ICML 2022) |
| 118 | T3 | arxiv 2008.06952 | functional perspective symmetric functions | Excluded | learning symmetric functions over measures (preprint); [szabo2016learning] and [wagstaff2022universal] cover the point |
| 119 | T3 | arxiv 2110.14416 | transformers generalize DeepSets | Excluded | higher-order transformers for graphs and hypergraphs; no set-to-subject prediction in scope |
| 120 | T3 | arxiv 1804.10306 | Yarotsky invariant maps | Excluded | general invariant universal approximation; [zaheer2017deep] and [wagstaff2022universal] cover the set case |
| 121 | T3 | arxiv 2510.22186 | sorting-based embeddings bounds | Excluded | sorting-embedding bounds; [amir2023neural] covers injective sorting and sliced embeddings |
| 122 | T3 | arxiv 1903.01939 | Sannai universal approx | Excluded | general invariant universal approximation; [zaheer2017deep] and [wagstaff2022universal] cover the set case |
| 123 | T3 | arxiv 2203.07546 | Balan permutation invariant representations | Excluded | sorting and polynomial embeddings for graphs; [amir2023neural] covers the point |
| 124 | T3 | arxiv 2406.08966 | separation power equivariant | Excluded | separation power of equivariant networks; [wagstaff2022universal] and [amir2023neural] cover set expressivity |
| 125 | T3 | arxiv 2403.08854 | moment pooling | Excluded | moment pooling on collider physics (preprint); [wang2024polynomial] covers moment-type set embeddings |
| 126 | T3 | arxiv 2206.15444 | multi-set transformers | Excluded | functions on several sets for counting and divergence estimation (preprint); no subject-level setting in scope |
| 127 | T3 | arxiv 2505.20150 | Janossy non-injectivity | Excluded | non-injectivity of piecewise-linear Janossy pooling (preprint); [wagstaff2022universal] and [amir2023neural] cover set expressivity |
| 128 | T3 | arxiv 2203.04007 | DuMLP-Pin | Excluded | global set aggregation variant (preprint); [zaheer2017deep] and [lee2019set] cover the architectures |
| 129 | T3 | arxiv 2509.22889 | convolutional set transformer | Excluded | image-set classification on natural images (preprint); no medical or subject-level setting |
| 130 | T3 | arxiv 2207.13018 | is attention interpretation sets | Excluded | synthetic study of attention explanations on sets (preprint); measures no registration, radiomics or segmentation step |
| 131 | T3 | arxiv 2510.23634 | monotone separable set functions | Excluded | monotone set functions for containment tasks (preprint); outside the prediction setting |
| 132 | T3 | arxiv 2610.19279 | dimension-free scaling laws size generalization | Excluded | size-generalization theory (preprint); no medical setting |
| 133 | T3 | arxiv 2602.04941 | quasi-arithmetic neural networks sets | Excluded | learnable aggregation variant (preprint); [lee2019set] and [wang2024polynomial] cover learnable pooling |
| 134 | T3 | arxiv 2605.08377 | embedding dimension lower bounds deep sets | Excluded | embedding-dimension lower bounds (preprint); [wagstaff2022universal] covers the bound for Deep Sets |
| 135 | T3 | openalex W3214092167 | Bueno Hylton set pooling 2021 | Included | [bueno2021representation]; expressive power of PointNet and Deep Sets with a failure mode of max pooling; abstract read on the NeurIPS proceedings page |
| 136 | T3 | title Stacking Deep Set Networks and Pooling by Quantiles | Chen 2024 quantiles | Excluded | confirmed on PMLR 235; quantile pooling and stacked deep sets with no medical setting; [lee2019set] and [wang2024polynomial] cover learnable set pooling |
| 137 | T3 | doi 10.1007/978-3-030-30487-4_35 | deep set aggregations ICANN 2019 | Included | [soelch2019deep]; sensitivity of Deep Sets to the aggregation function and to out-of-distribution set size; abstract read on the Springer chapter page |
| 138 | T3 | arxiv 2012.08482 | learning aggregation functions | Excluded | learnable aggregation function (preprint); [lee2019set] covers learnable attention pooling |
| 139 | T3 | arxiv 1904.01962 | Rep the Set | Included | [skianis2020rep]; set representation by network-flow correspondences to learned hidden sets |
| 140 | T3 | arxiv 2610.19899 | universal sample-based embeddings | Excluded | sample-based embeddings of higher-order objects (preprint); no medical setting |
| 141 | T3 | doi 10.1145/3715905 | set function learning survey | Excluded | survey; primary set-function studies in the set cover the points |
| 142 | T3 | arxiv 2605.07972 | it just takes two large sets | Excluded | amortized inference on large sets (preprint); no subject-level medical setting |
| 143 | T3 | doi 10.1007/s41095-021-0229-5 | PCT point cloud transformer | Excluded | point cloud transformer on object benchmarks; [zhao2021point] covers transformer point networks |
| 144 | T3 | arxiv 2206.04670 | PointNeXt | Excluded | training strategies for PointNet++ on object benchmarks; [qi2017pointnetpp] covers the architecture |
| 145 | T3 | arxiv 2210.05666 | Point Transformer V2 | Excluded | point transformer variant on scene benchmarks; [zhao2021point] covers the architecture |
| 146 | T3 | arxiv 2306.05553 | equivariant vs invariant layers point cloud | Included | [kothapalli2024equivariant]; comparison of equivariant backbones and invariant pooling, including transport-based pooling, for point cloud classification (preprint) |
| 147 | T3 | doi 10.1109/ICCV.2019.00443 | basis point sets | Included | [prokudin2019efficient]; basis point sets: a fixed reference point set that turns a point cloud into a fixed-length vector |
| 148 | T3 | doi 10.1007/978-3-030-41964-6_43 | aggregation functions point clouds ACIIDS | Included | [zamorski2020comparison]; comparison of permutation-invariant aggregation functions for point-cloud classification; abstract read on the Springer chapter page |
| 149 | T3 | arxiv 2011.11572 | RobustPointSet | Excluded | robustness dataset for object point cloud classifiers (preprint); no medical setting |
| 150 | T3 | arxiv 2103.03892 | generalized sliced-Wasserstein set embeddings | Excluded | preprint of the generalized sliced-Wasserstein set embedding line; [naderializadeh2021pooling] covers it as the peer-reviewed version |
| 151 | T3 | doi 10.1016/j.media.2023.102813 | Oner 2023 distribution MIL pooling | Included | [oner2023distribution]; distribution-based MIL pooling filters on CAMELYON16 |
| 152 | T3 | doi 10.1016/j.media.2020.101789 | Yao 2020 WSI survival MIL | Included | [yao2020whole]; attention MIL survival from whole-slide patch sets aggregated to patient level |
| 153 | T3 | doi 10.1007/s00365-025-09715-6 | distribution regression neural networks | Excluded | approximation theory of distribution regression; [szabo2016learning] covers distribution regression theory |
| 154 | T3 | arxiv 1811.01506 | distribution regression network generalizability | Excluded | distribution-to-distribution regression network (preprint); no scalar outcome |
| 155 | T3 | arxiv 1705.04293 | Law Bayesian distribution regression | Included | [law2018bayesian]; Bayesian distribution regression that accounts for varying group size, with age prediction from images |
| 156 | T3 | doi 10.1007/s10444-023-10054-y | distribution regression CNNs | Included | [yu2023deep]; learning theory of two-stage distribution regression with deep convolutional networks; abstract read on the Springer article page |
| 157 | T3 | arxiv 2408.00549 | maximum kernel entropy | Excluded | unsupervised distribution kernels (preprint); [muandet2017kernel] covers distribution kernels |
| 158 | T3 | doi 10.1162/neco_a_01726 | transformers distribution regression | Excluded | generalization theory of transformers for distribution regression; no medical or set-to-subject experiment |
| 159 | T3 | doi 10.1101/2021.04.13.439702 | CytoSet | Included | [yi2021cytoset]; patient-level clinical outcome prediction from sets of cytometry cells (preprint) |
| 160 | T3 | doi 10.1016/j.jpi.2024.100403 | MIL WSI comparative JPI | Excluded | comparison of two attention MIL variants on WSI; [ilse2018attention] and [lu2021data] cover attention MIL |
| 161 | T3 | arxiv 2610.41328 | gastric WSI aggregator complexity | Included | [vanchhay2026foundation]; leave-one-hospital-out comparison of MIL aggregators on 5,036 gastric slides with label-free site alignment (preprint) |
| 162 | T3 | doi 10.1007/978-3-030-87237-3_33 | WSI are 2D point clouds | Included | [chen2021whole]; whole-slide images as 2D point clouds with patch graphs for survival prediction |
| 163 | T3 | arxiv 2506.02408 | end-to-end slide-level supervision | Excluded | end-to-end slide-level MIL training (preprint); [campanella2019clinical] covers end-to-end slide-level supervision |
| 164 | T3 | arxiv 2605.12575 | compact rationales WSI-MIL | Excluded | post-hoc rationale readout for WSI MIL (preprint); measures no registration, radiomics or segmentation step |
| 165 | T3 | arxiv 2608.15970 | BagShift | Included | [yuan2026bagshift]; paired protocol measuring how the patch selector (tissue masking, regional sampling) changes the evidence seen by MIL (preprint) |
| 166 | T3 | doi 10.1109/ACCESS.2026.3751717 | attention is not localization mammography | Included | [kag2026attention]; tests weakly supervised attention maps against supervised lesion segmentation for localization in mammography |
| 167 | T3 | doi 10.1109/ISBI45749.2020.9098722 | Yang 2020 multiple pulmonary nodules set | Included | [yang2020relational]; set of pulmonary nodules per patient with a set attention transformer for malignancy |
| 168 | T3 | doi 10.1002/mp.15539 | Chen lung cancer MIL radiomics | Included | [chen2022lung]; set of nodule radiomics vectors per patient with attention MIL (small imbalanced dataset) |
| 169 | T3 | doi 10.1109/TMI.2020.2996256 | Han 2020 COVID MIL | Included | [han2020accurate]; patient-level COVID-19 screening from a bag of 3D CT instances without infection-area annotation |
| 170 | T3 | doi 10.1109/BIBM49941.2020.9313417 | hierarchical MIL lung cancer BIBM | Included | [wang2020hierarchical]; two-level attention MIL over nodules and attributes for patient-level lung cancer diagnosis |
| 171 | T3 | doi 10.1007/978-3-030-87234-2_74 | MIL multiple myeloma | Included | [qaiser2021multiple]; attention MIL on whole-body MRI for myeloma using patient-level labels only, without lesion annotation (small multi-center data) |
| 172 | T3 | doi 10.1016/j.compbiomed.2022.106168 | GMINet prostate | Included | [shao2022patient]; graph-guided multi-instance network for patient-level prostate grading that addresses tumour delineation dependence |
| 173 | T3 | doi 10.1016/j.cmpb.2023.107872 | few-shot MIL lymphoma PET/CT | Included | [xu2024hybrid]; bag of per-lesion hybrid deep and radiomic features per patient for lymphoma aggressiveness |
| 174 | T3 | doi 10.1002/jso.27673 | CRLM chemotherapy response DL | Excluded | instances are slices of one volume, so the bag discards a known order; no step measured (small study, 95 patients) |
| 175 | T3 | doi 10.1002/acm2.14547 | ranking attention MIL cervical | Excluded | instances are slices of one volume, so the bag discards a known order; no step measured |
| 176 | T3 | doi 10.3389/fonc.2025.1665690 | IDH glioma hierarchical MIL | Excluded | instances are positions in one tumour volume with positional encoding; no correspondence across subjects handled and no step measured |
| 177 | T3 | doi 10.34067/KID.0000000668 | cascaded attentional set operator nephropathology | Included | [zare2025permutation]; transformer set operator over sets of glomerular crops for case-level nephropathology classification |
| 178 | T3 | doi 10.1109/icip51287.2024.10647287 | Reset ugly duckling melanoma | Included | [collenne2024reset]; set transformer over all skin lesions of a patient for melanoma detection (ugly-duckling sign) |
| 179 | T3 | doi 10.1200/jco.2026.44.16_suppl.2023 | SRS brain metastases JCO abstract | Excluded | conference abstract only; no full peer-reviewed report |
| 180 | T3 | doi 10.64388/irev10i4-1723737 | multiple primary lung cancers | Excluded | small held-out test set in a low-visibility venue; [yang2020relational] and [chen2022lung] cover lesion sets per patient |
| 181 | T3 | doi 10.1109/CBMS69103.2026.00140 | modality-embedded set transformer prostate | Excluded | set pooling over modalities for survival; the set is of modalities, not spatial elements |
| 182 | T3 | doi 10.1007/s00330-026-12601-9 | biopsy-anchored radiogenomics | Included | [sanchez2026quality]; measures how lesion selection and per-patient label assignment change radiogenomic models over 11,473 segmented lesions |
| 183 | T3 | doi 10.1016/j.ynirp.2026.100418 | MIL MR spectroscopy lesions | Included | [gacheva2026multiple]; variable-size bags of MR spectra per patient with permutation-invariant pooling (422 patients) |
| 184 | T3 | arxiv 2112.08845 | MIL MRS brain tumor | Excluded | preprint of the same MRS MIL line; [gacheva2026multiple] covers it in a peer-reviewed report |
| 185 | T3 | doi 10.1111/cns.70513 | autoimmune encephalitis MIL PET | Excluded | instances are regions of one aligned PET volume; no correspondence across subjects handled and no step measured |
| 186 | T3 | arxiv 2103.10056 | dementia thick slice MRI | Excluded | instances are slices of one volume; no step measured (preprint) |
| 187 | T3 | doi 10.1038/s41598-022-24278-3 | MIL NSCLC chemotherapy | Excluded | instances are slices of one volume; no step measured |
| 188 | T3 | doi 10.1109/BIBM62325.2024.10821985 | patch target MIL 3D MRI | Excluded | instances are patches of one aligned volume; no step measured |
| 189 | T3 | arxiv 2403.01246 | dual graph MIL brain age | Excluded | brain-age application; instances are slices of one volume (preprint) |
| 190 | T3 | doi 10.1109/isbi48211.2021.9434081 | slice-based set networks brain age | Excluded | brain-age estimation; instances are slices of one volume |
| 191 | T3 | arxiv 2408.04170 | M2EF-NNs | Excluded | multimodal WSI survival with evidence fusion (preprint); [lu2021data] covers WSI MIL |
| 192 | T3 | arxiv 2407.20768 | HyperMM | Excluded | the set is of modalities, not spatial elements (preprint) |
| 193 | T3 | doi 10.1007/978-3-030-00931-1_60 | Gutierrez-Becker Wachinger 2018 | Excluded | conference version; [gutierrezbecker2021discriminative] is the journal extension and is included |
| 194 | T3 | doi 10.1016/j.media.2024.103120 | TractGeoNet | Included | [chen2024tractgeonet]; point cloud regression on tract points with microstructure for language performance (806 subjects) |
| 195 | T3 | doi 10.1007/978-3-031-16431-6_17 | white matter tracts are point clouds MICCAI 2022 | Excluded | conference version; TractGeoNet (index 194) is the journal extension |
| 196 | T3 | doi 10.1136/neurintsurg-2022-018655 | aneurysm rupture point cloud | Included | [luo2023prediction]; point cloud network against radiomics models for aneurysm rupture on the same cohort with prospective external test |
| 197 | T3 | doi 10.3389/fphys.2021.644349 | aneurysm growth deep shape | Included | [bizjak2021deep]; PointNet++ shape features against morphologic features for aneurysm growth (small study, 39 patients, 44 aneurysms) |
| 198 | T3 | doi 10.1016/j.compbiomed.2025.110965 | aneurysm rupture CTA automated | Included | [choi2025prediction]; automated nnU-Net and PointNet++ pipeline for aneurysm rupture from CTA |
| 199 | T3 | doi 10.1007/s11548-025-03527-6 | airway obstruction 3D shape | Included | [dole2025enhancing]; point cloud and multi-view shape analysis of automatically segmented airways for adenoid obstruction (1,215 CBCT scans) |
| 200 | T3 | doi 10.1109/JBHI.2024.3495035 | PointCHD | Included | [yang2025pointchd]; point cloud benchmark for congenital heart disease classification |
| 201 | T3 | doi 10.1016/j.compmedimag.2025.102587 | cardiac point cloud VAE MI | Included | [beetz20253d]; variational point cloud autoencoder of multi-class cardiac anatomy for MI prediction (over 10,000 subjects) |
| 202 | T3 | doi 10.1109/EMBC40787.2023.10340878 | MI point cloud classification EMBC | Included | [beetz20233d]; point cloud classification of cardiac shapes for MI detection and prediction (1,068 UK Biobank subjects) |
| 203 | T3 | doi 10.1016/j.cels.2025.101229 | cell shape geometric MIL | Included | [devries2025geometric]; geometric deep learning with attention MIL over sets of 3D cell point clouds for population-level prediction |
| 204 | T3 | doi 10.1016/j.compmedimag.2021.101939 | Besson 2021 brain shape sex age | Included | [besson2021geometric]; graph convolution on registered cortical surfaces for sex and age (6,410 subjects) |
| 205 | T3 | doi 10.1038/s41598-022-22313-x | multicohort GDL fluid intelligence | Included | [wu2022multicohort]; graph convolution on cortical and subcortical surfaces for fluid intelligence across two cohorts |
| 206 | T3 | doi 10.3389/fnagi.2022.895535 | GDL brain aging | Excluded | brain-age application study on structure surfaces |
| 207 | T3 | arxiv 2104.10047 | GDL anatomical meshes AD | Included | [sarasua2021geometric]; compares template-free and template-based mesh networks for AD prediction (preprint) |
| 208 | T3 | doi 10.1101/2021.04.15.440008 | Azcona spiral networks AD | Excluded | spiral mesh networks for AD (preprint); [sarasua2021geometric] covers template-based mesh networks for AD |
| 209 | T3 | arxiv 2008.06098 | GDL post-menstrual age | Included | [vosylius2020geometric]; compares mesh, point cloud, graph and volumetric networks for neonatal age on the same 650 subjects (preprint) |
| 210 | T3 | doi 10.64898/2026.01.31.702997 | geometric fragility hippocampus | Excluded | small conceptual preprint; no cohort details in the abstract; [sarasua2022hippocampal] covers hippocampal point clouds for AD |
| 211 | T3 | arxiv 2210.16670 | GNN shape classification neuroimaging | Excluded | comparison of GNN layers for shape classification (preprint); [sarasua2021geometric] covers the comparison |
| 212 | T3 | arxiv 2501.07994 | imaging and shape features AD brain age | Excluded | fusion of image and shape embeddings (preprint); [sarasua2021geometric] and [besson2021geometric] cover shape networks |
| 213 | T3 | arxiv 2607.21840 | brain folding point cloud Trans-Unet | Excluded | simulated finite element point clouds; no subject-level outcome |
| 214 | T3 | doi 10.1016/j.compbiomed.2024.109192 | point cloud pulmonary function CT | Included | [jia20243d]; point cloud and graph networks on vessel centerlines for pulmonary function from CT |
| 215 | T3 | doi 10.1016/j.media.2026.104358 | G3e-Net haemodynamics | Excluded | predicts haemodynamic fields; the output is not a subject-level outcome |
| 216 | T3 | doi 10.1016/j.compbiomed.2025.111103 | GDL liver resection | Excluded | point cloud segmentation of resection zones; the output is a region, not a subject-level outcome |
| 217 | T3 | doi 10.64898/2026.11.12.766227 | 3D facial representations craniofacial | Included | [chen2026screening]; 3D facial point cloud benchmark across craniofacial conditions without landmark registration or template fitting (preprint, 18,785 subjects) |
| 218 | T3 | doi 10.1109/UBMK71847.2026.11745271 | PointNet++ OCT retinal | Excluded | point cloud built from a regular OCT voxel grid, so no correspondence is missing; small conference report |
| 219 | T3 | arxiv 2112.04863 | 3D medical point transformer | Excluded | medical point transformer on vessel segments (preprint); [luo2023prediction] covers point networks on vessels |
| 220 | T3 | arxiv 2412.17390 | PointVoxelFormer | Excluded | hybrid point and voxel network for segmentation and registration (preprint); no subject-level outcome |
| 221 | T3 | doi 10.1016/j.media.2019.01.001 | generalised coherent point drift dMRI | Included | [ravikumar2019generalised]; probabilistic group-wise registration of generalised point sets from DTI with study-specific atlases |
| 222 | T3 | doi 10.1109/BIBM66473.2025.11357130 | medical point cloud survey | Excluded | survey; primary studies cover the points |
| 223 | T3 | title Histogram Pooling Operators: An Interpretable Alternative for Deep Sets | unconfirmed theme 3 | Excluded | unconfirmed: title search found no record with this title |
| 224 | T4 | doi 10.1109/TMI.2022.3213983 | Learn2Reg | Included | [hering2023learn2reg]; multi-task registration challenge with robustness, accuracy and plausibility metrics |
| 225 | T4 | doi 10.1016/j.media.2026.104175 | LUMIR | Included | [chen2026lumir]; unsupervised brain registration challenge with zero-shot tests across disease, protocol and species |
| 226 | T4 | doi 10.1109/TMI.2014.2330355 | Ou 2014 registration comparison | Included | [ou2014comparative]; 12 registration algorithms across 7 databases including missing correspondences in pathology-bearing images |
| 227 | T4 | doi 10.1162/IMAG.a.1048 | Miller 2025 normalization perinatal stroke | Included | [miller2025comparison]; compares three registration tools and lesion compensation in distorted perinatal stroke brains (small study, 11 brains) |
| 228 | T4 | doi 10.1002/hbm.22297 | Marchewka 2014 VBM registration | Included | [marchewka2014influence]; measures the effect of registration strategy and field strength on VBM atrophy estimates in AD |
| 229 | T4 | doi 10.3389/fnimg.2022.977491 | Canalini 2022 | Included | [canalini2022quantitative]; measures how pathological tissue and sequence choice affect registration of longitudinal tumour images |
| 230 | T4 | doi 10.1038/s41598-026-63646-1 | Iglesias 2026 low-field registration | Included | [iglesias2026accuracy]; measures nonlinear registration accuracy on portable low-field MRI |
| 231 | T4 | doi 10.3389/fnins.2024.1405363 | Ragguett 2024 hydrocephalus | Excluded | small study of 8 patients; [miller2025comparison] and [ou2014comparative] cover registration failure in distorted anatomy |
| 232 | T4 | doi 10.1109/TPAMI.2025.3609521 | Luo 2026 groupwise registration | Included | [luo2026bayesian]; Bayesian groupwise registration that disentangles a common anatomy from geometry, for image groups of variable size |
| 233 | T4 | doi 10.1016/j.media.2022.102383 | Atlas-ISTN | Included | [sinclair2022atlas]; joint segmentation, registration and population atlas construction |
| 234 | T4 | doi 10.1016/j.neuroimage.2017.10.060 | Blaiotta 2018 template | Excluded | probabilistic template construction; [joshi2004unbiased] and [ashburner2000voxel] cover template building |
| 235 | T4 | doi 10.1109/TMI.2025.3605194 | CINeMA | Included | [dannecker2026cinema]; conditional implicit atlas built in latent space without image registration, with age prediction downstream |
| 236 | T4 | doi 10.1016/j.neuroimage.2025.121401 | DDTemplate | Excluded | groupwise dMRI template by deep registration; [dalca2019learning] covers learned templates |
| 237 | T4 | doi 10.1007/978-3-032-04937-7_20 | MorphLDM | Excluded | generative model of brain morphology from a learned template; no prediction |
| 238 | T4 | doi 10.1162/imag_a_00197 | SynthMorph | Included | [hoffmann2024anatomy]; acquisition-agnostic joint affine and deformable registration without preprocessing |
| 239 | T4 | doi 10.1007/978-3-031-43993-3_25 | neural pre-processing | Included | [he2023neural]; end-to-end network that performs skull stripping, intensity normalization and spatial normalization together |
| 240 | T4 | doi 10.1093/braincomms/fcae251 | Zavaglia 2024 lesion inference | Excluded | validates lesion inference methods; measures the analysis method, not the registration, radiomics or segmentation step |
| 241 | T4 | doi 10.1002/hbm.70619 | Moore 2026 LSM choices | Excluded | simulated lesion-symptom mapping design choices; measures the analysis design, not the registration, radiomics or segmentation step |
| 242 | T4 | doi 10.3389/fnimg.2025.1573816 | Tilwani 2025 LSM ML benchmark | Included | [tilwani2025benchmarking]; measures how atlas parcellation choice changes ML prediction of language outcomes after stroke |
| 243 | T4 | doi 10.1007/978-3-031-43993-3_29 | Hu 2023 lesion network mapping survival | Included | [hu2023overall]; lesion network mapping of the tumour into a healthy connectivity atlas for glioblastoma survival classification; abstract read on the Springer chapter page and the MICCAI 2023 paper page |
| 244 | T4 | doi 10.1038/nrclinonc.2017.141 | Lambin 2017 | Excluded | review; [lambin2012radiomics] and [aerts2014decoding] cover the radiomics premise |
| 245 | T4 | doi 10.1038/s41571-025-01067-1 | RQS 2.0 | Excluded | quality-score review; [zwanenburg2020image] covers radiomics standardization |
| 246 | T4 | doi 10.1148/radiol.231319 | Whybra 2024 IBSI filters | Included | [whybra2024image]; IBSI standardization of convolutional filters with reference values and validation on 51 patients |
| 247 | T4 | doi 10.1088/2057-1976/ac8e6f | Paquier 2022 | Included | [paquier2022radiomics]; shows that IBSI-compliant radiomics software still disagrees on feature values (27 CT and 39 MRI cases) |
| 248 | T4 | doi 10.1038/s41598-017-10371-5 | Vallieres 2017 | Excluded | radiomics application study that builds on segmentation-based features without removing or measuring a step |
| 249 | T4 | doi 10.1038/s41598-018-22739-2 | Rathore 2018 | Excluded | radiomics application study that builds on segmentation-based features without removing or measuring a step |
| 250 | T4 | doi 10.1016/j.neuroimage.2016.12.064 | Carass 2017 | Excluded | MS lesion segmentation challenge; [commowick2018objective] covers MS lesion segmentation challenges |
| 251 | T4 | doi 10.1016/j.nicl.2016.11.020 | Egger 2017 | Included | [egger2017mri]; automated against manual MS lesion segmentation and inter-rater variability (50 patients) |
| 252 | T4 | doi 10.1038/s41598-024-72649-9 | De Rosa 2024 | Excluded | consensus of segmentation algorithms; [commowick2018objective] and [wynen2025conflunet] cover MS lesion segmentation |
| 253 | T4 | doi 10.1007/s00234-025-03834-4 | Hindsholm 2025 | Included | [hindsholm2025prospective]; prospective clinical evaluation of an AI MS lesion tool on 112 patients, with low positive predictive value |
| 254 | T4 | doi 10.1007/978-3-031-72114-4_47 | nnU-Net revisited | Included | [isensee2024nnu]; shows that many claimed segmentation gains fail under rigorous validation against nnU-Net baselines |
| 255 | T4 | doi 10.1007/978-3-031-43901-8_17 | QCResUNet | Included | [qiu2023qcresunet]; subject-level and voxel-level prediction of segmentation quality for brain tumour segmentation |
| 256 | T4 | doi 10.1016/j.ijrobp.2018.05.053 | Traverso 2018 | Excluded | systematic review; [fornaconwood2020reliability] and the primary robustness studies included cover the point |
| 257 | T4 | pmid 24772210 | Balagurunathan 2014 | Included | [balagurunathan2014reproducibility]; radiomic feature reproducibility across manual and automated segmentation (small study, 32 scans) |
| 258 | T4 | doi 10.1097/RLI.0000000000000180 | Mackin 2015 | Excluded | acquisition-parameter radiomics study (scanner variability); no registration or segmentation step measured |
| 259 | T4 | doi 10.1038/s41598-018-36938-4 | Zwanenburg 2019 perturbation | Included | [zwanenburg2019assessing]; feature robustness under image perturbation including contour randomisation (31 and 19 patients) |
| 260 | T4 | doi 10.1038/s41598-020-69534-6 | Haarburger 2020 | Included | [haarburger2020radiomics]; feature reproducibility under inter-rater and probabilistic automated segmentations on three datasets |
| 261 | T4 | doi 10.1038/s41598-020-70940-z | Granzier 2020 | Included | [granzier2020mri]; feature robustness to inter-observer breast tumour segmentation on MRI (129 tumours) |
| 262 | T4 | doi 10.3390/diagnostics12020247 | Muller-Franzes 2022 | Included | [mullerfranzes2022reliability]; segmentation reliability analysis over 4,598 tumour segmentations and its effect on survival prediction |
| 263 | T4 | doi 10.3390/jcm11247334 | Ferrante 2022 | Included | [ferrante2022application]; compares survival radiomic models on manual and nnU-Net contours in 899 patients |
| 264 | T4 | doi 10.1016/j.ejrad.2020.109031 | Choi 2020 | Included | [choi2020idh1]; manual against automated deep segmentation for IDH1 radiomics in glioblastoma (small training set, 45 patients) |
| 265 | T4 | doi 10.1038/s41598-022-16520-9 | Kothari 2022 | Included | [kothari2022impact]; feature robustness to inter-observer contouring in NSCLC with survival analysis |
| 266 | T4 | doi 10.3390/diagnostics13243640 | Pasini 2023 | Included | [pasini2023critical]; robustness of PSMA PET radiomics to three segmentation methods and its effect on classifiers (78 patients) |
| 267 | T4 | doi 10.1016/j.phro.2023.100530 | Dutta 2024 | Included | [dutta2024robustness]; robustness of MRI and PET radiomics to segmentation variation and its effect on recurrence prediction (142 patients) |
| 268 | T4 | doi 10.1038/s41598-024-58551-4 | Louis 2024 | Included | [louis2024identification]; CT radiomic features robust to segmentation and acquisition variation and their effect on recurrence prediction |
| 269 | T4 | doi 10.1371/journal.pone.0205003 | Owens 2018 | Excluded | small study of 10 CT scans; [haarburger2020radiomics] and [kothari2022impact] cover segmentation-induced feature uncertainty |
| 270 | T4 | doi 10.3109/0284186X.2013.812798 | Leijenaar 2013 | Included | [leijenaar2013stability]; test-retest and inter-observer stability of PET radiomics (small cohorts, 11 and 23 patients) |
| 271 | T4 | doi 10.18383/j.tom.2016.00235 | Kalpathy-Cramer 2016 | Included | [kalpathycramer2016radiomics]; multi-institutional sensitivity of lung nodule features to segmentation and implementation |
| 272 | T4 | doi 10.3390/jimaging10110270 | D'Anna 2024 | Excluded | small study of 22 patients on the dataset [kothari2022impact] uses; [kothari2022impact] covers inter-observer effects |
| 273 | T4 | doi 10.1109/EMBC58623.2025.11253060 | Damiano 2025 | Excluded | conference report; [haarburger2020radiomics] covers probabilistic segmentation and feature reproducibility |
| 274 | T4 | doi 10.1371/journal.pone.0102107 | Parmar 2014 | Included | [parmar2014robust]; semiautomatic against manual segmentation for radiomic feature reproducibility (small study, 20 patients) |
| 275 | T4 | doi 10.1002/mp.13624 | Tixier 2019 | Included | [tixier2019reliability]; effect of glioblastoma segmentation variability on MRI radiomic feature robustness (90 patients) |
| 276 | T4 | doi 10.1038/srep23428 | Zhao 2016 | Excluded | acquisition-parameter radiomics study; no registration or segmentation step measured |
| 277 | T4 | doi 10.1118/1.4955435 | Saha 2016 | Excluded | [saha2018breast] by the same group covers inter-reader variability of breast MRI features with 529 features |
| 278 | T4 | doi 10.1002/mp.12925 | Saha 2018 | Included | [saha2018breast]; inter-reader stability of 529 breast MRI features over four readers' annotations (50 patients) |
| 279 | T4 | doi 10.18383/j.tom.2016.00208 | van Timmeren 2016 | Excluded | acquisition-parameter test-retest study; no registration or segmentation step measured |
| 280 | T4 | doi 10.21037/qims.2019.03.02 | Qiu 2019 | Included | [qiu2019reproducibility]; effect of three segmentation methods on HCC radiomic features and classification |
| 281 | T4 | doi 10.1038/srep34921 | He 2016 | Excluded | acquisition-parameter radiomics study; no registration or segmentation step measured |
| 282 | T4 | doi 10.1080/0284186X.2017.1351624 | Larue 2017 | Excluded | acquisition and discretization phantom study; no registration or segmentation step measured |
| 283 | T4 | doi 10.1117/1.JMI.5.1.011020 | Midya 2018 | Excluded | acquisition-parameter phantom study; no registration or segmentation step measured |
| 284 | T4 | doi 10.1097/RLI.0000000000000827 | Ziegelmayer 2022 | Excluded | acquisition-parameter phantom comparison of CNN and radiomics features; no registration or segmentation step measured |
| 285 | T4 | doi 10.1088/1361-6560/aebf1b | Wanni Arachchige 2026 | Included | [arachchige2026segmentation]; head-to-head propagation of segmentation-mask perturbation into foundation-model embeddings and IBSI radiomics on 556 nodules |
| 286 | T4 | doi 10.1148/radiol.231442 | AmyloidPETNet | Included | [fan2024amyloidpetnet]; end-to-end amyloid classification on native-space PET without structural MRI or template registration |
| 287 | T4 | doi 10.1016/j.neuroimage.2022.118871 | Wood 2022 | Included | [wood2022accurate]; brain-age models on minimally processed routine clinical scans that drop the registration-based preprocessing |
| 288 | T4 | doi 10.1200/CCI.21.00096 | Torres 2021 | Included | [torres2021end]; end-to-end lung cancer prognosis from pretreatment CT without manual tumour segmentation (1,689 patients) |
| 289 | T4 | doi 10.2967/jnumed.123.267048 | Leung 2024 | Included | [leung2024deep]; fully automated whole-body tumour segmentation feeding prognostic models on PET/CT |
| 290 | T4 | doi 10.3390/biotech14040087 | Tran 2025 | Included | [tran2025comparing]; handcrafted radiomics against latent deep features of segmented hematomas for ICH outcome (866 and 645 patients) |
| 291 | T4 | doi 10.1158/2767-9764.CRC-22-0152 | Kazmierski 2023 | Included | [kazmierski2023multi]; 12 prognostic models comparing engineered radiomics, deep learning and clinical data in head and neck cancer (2,552 and 873 patients) |
| 292 | T4 | doi 10.1016/j.neurobiolaging.2021.04.015 | Hwang 2021 | Excluded | brain-age application study; the PubMed abstract (PMID 34049061) reports the error of a CNN on routine T2-weighted scans and associations of the age gap with white matter hyperintensity and diabetes, and states no correspondence handling and no registration, radiomics or segmentation step that the study removes, builds on or measures |
| 293 | T4 | doi 10.1038/s41467-019-13163-9 | Jonsson 2019 | Excluded | brain-age application study with GWAS |
| 294 | T4 | doi 10.1002/ana.24367 | Cole 2015 TBI | Excluded | brain-age application study |
| 295 | T4 | doi 10.1016/j.neurobiolaging.2017.04.006 | Cole 2017 Down syndrome | Excluded | brain-age application study |
| 296 | T4 | doi 10.1212/WNL.0000000000003790 | Cole 2017 HIV | Excluded | brain-age application study |
| 297 | T4 | doi 10.1371/journal.pone.0067346 | Gaser 2013 | Excluded | brain-age application study |
| 298 | T4 | doi 10.1093/schbul/sbt142 | Koutsouleris 2014 | Excluded | brain-age application study |
| 299 | T4 | doi 10.1016/j.eplepsyres.2017.03.007 | Pardoe 2017 | Excluded | brain-age application study; the PubMed abstract (PMID 28410487) reports an older estimated brain age in refractory focal epilepsy than in controls, and states no correspondence handling and no registration, radiomics or segmentation step that the study removes, builds on or measures |
| 300 | T4 | doi 10.1002/hbm.26632 | Kalc 2024 | Excluded | revision of a brain-age regression workflow; no registration or segmentation step measured |
| 301 | T4 | doi 10.1002/hbm.70425 | Colman 2026 | Excluded | brain-age application study on FLAIR |
| 302 | T4 | doi 10.1186/s40708-026-00316-y | Juglan 2026 | Excluded | architecture comparison for age and sex prediction; no registration or segmentation step measured |
| 303 | T4 | doi 10.1007/978-3-032-05182-0_29 | Liu 2025 lesion-centered ViT | Included | [liu2025lesion]; lesion-centred views from a manual lesion mask for 3-month mRS prediction; abstract read on the Springer chapter page and the MICCAI 2025 paper page, method overview read in the full text |
| 304 | T4 | doi 10.1016/j.mri.2007.03.025 | Shen 2007 VBM template | Excluded | before 2013 and cited fewer than 100 times (time node) |
| 305 | T4 | doi 10.1007/978-3-031-43895-0_50 | Beetz 2023 point cloud MI | Included | [beetz2023multi]; multi-objective point cloud autoencoder for MI prediction from multi-class cardiac point clouds |
| 306 | T4 | doi 10.1007/978-3-031-43907-0_47 | Adams Elhabian 2023 | Included | [adams2023point]; point cloud networks learning statistical shape models without correspondence-based inputs |
| 307 | T4 | arxiv 2609.09424 | spinal cord MS lesion tracking | Included | [benveniste2026longitudinal]; compares registration-based and registration-free lesion correspondence for longitudinal spinal cord MS lesions (preprint) |
| 308 | T4 | doi 10.1016/j.neuroimage.2020.116703 | Siless 2020 registration-free tractography | Included | [siless2020registration]; registration-free correspondence of tract clusters across 184 subjects |
| 309 | T4 | title OTSurv | MICCAI 2025 OTSurv | Included | [ren2026otsurv]; MIL with heterogeneity-aware optimal transport for WSI survival (MICCAI 2025) |
| 310 | T4 | title MoST-IG | MICCAI 2025 MoST-IG | Excluded | abstract read on the Springer chapter page and the MICCAI 2025 paper page: spatial transcriptomics integration across slices with graph transport, evaluated on cancer grading and detection of tissue spots and clustering, with no subject-level outcome |
| 311 | T4 | title MOTOR | MICCAI 2025 MOTOR | Excluded | confirmed as MOTOR: Multimodal Optimal Transport via Grounded Retrieval in Medical Visual Question Answering (MICCAI 2025, DOI 10.1007/978-3-032-04978-0_44, on the MICCAI 2025 paper list); transport is used to re-rank retrieved context for visual question answering, with no subject-level prediction from unaligned data, so it is off the topic |
| 312 | T4 | title C2MAOT | MICCAI 2025 C2MAOT | Excluded | cancer segmentation method; the output is a segmentation, not a subject-level outcome |
| 313 | T4 | title Longitudinal changes in individual BrainAGE in healthy aging, mild cognitive impairment, and Alzheimer's disease | Franke Gaser 2012 unconfirmed | Excluded | confirmed by title search (GeroPsych 2012, DOI 10.1024/1662-9647/a000074); brain-age application study |

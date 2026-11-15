# Literature Search Report

Research question: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

This report is the merge run of the search stage (decision D1 in settings.md). It merges the four theme runs recorded in theme_A_tensor.md, theme_B_transport.md, theme_C_sets.md and theme_D_pipelines.md, which are left unchanged, and adds the searches of this run.

## Search Strategy

### Domain evidence profile

The profile is `cs_ml` (settings.md, intake record). Under it, arXiv preprints count as peer-review-equivalent at the peer-reviewed-ratio gate, and the other gates are unchanged. The profile matches the discipline (machine learning with medical image analysis as the application setting), so no profile advisory tag applies. Preprints are flagged in the annotations and in references.bib, and the peer-reviewed version is cited wherever a Crossref title query found one.

### Shared inclusion and exclusion criteria

The criteria below were applied to every theme source and every merge-run candidate.

- Include: methods whose input is a set of spatial elements (points, regions, lesions, structures) or an image whose spatial mode is not aligned across subjects, with a supervised subject-level regression or classification task, or a method that supplies the representation, correspondence or pipeline step such a predictor builds on (settings.md Notes).
- Window: systematic search 2013 to 2026; works before 2013 only if foundational (more than 100 citations in a bibliographic index) or must-include from citation chaining.
- Retrievability: a bibliographic record with a DOI, an arXiv ID, a PMID or a proceedings page must be retrieved, and the abstract (or, for Beg2005Computing, abstract excerpts) must have been read.
- Surveys: included only when the survey is the standard reference cited by the core papers (Kolda2009Tensor, Peyre2019Computational); other surveys are excluded.
- Preprints: included only when no peer-reviewed version exists and no included peer-reviewed source covers the contribution; earlier versions of an included work are excluded.
- Whole-slide pathology MIL variants: excluded as covered by Campanella2019Clinical, Lu2021CLAM, Shao2021TransMIL and Ilse2018AttentionMIL, unless they combine transport or a template with set pooling, which is the cross-theme intersection of the RQ (Ren2025OTSurv, Xu2023Multimodal, Song2024Multimodal).
- Language: English.

### Theme runs (summarized from the theme files)

- Theme A, tensor and multilinear methods: arXiv, OpenAlex, Crossref, Semantic Scholar (search, references, citations, recommendations), PubMed, and PMLR and JMLR index pages; 47 query runs, 2414 records retrieved (not deduplicated), 36 taken to abstract assessment, 25 included.
- Theme B, optimal transport: arXiv, PubMed, Crossref, Semantic Scholar and OpenAlex; 1036 records retrieved across four layers (not deduplicated), 831 screened by title, 54 assessed, 30 included.
- Theme C, set encoders, point clouds and MIL: Semantic Scholar, arXiv, Crossref, PubMed, OpenAlex and WebSearch; 811 titles screened (744 unique) plus 20 WebSearch links, 28 assessed, 25 included.
- Theme D, pipelines and subject-level prediction: PubMed, Crossref, OpenCitations, Semantic Scholar, arXiv and WebSearch; 922 records screened at title level (counted once per occurrence), 118 unique kept at first pass, 44 assessed, 28 included; the 74 records kept at title screening but not advanced are listed at the end of theme_D_pipelines.md.
- Citation loop closure (saturation condition 4) was not met in any theme run. Theme A could not collect Harshman 1970, which three of its seeds cite; Theme B could not retrieve the reference lists of its NeurIPS and ICML core papers; Theme C did not re-run backward chaining on its final set; Theme D left registration references from backward chaining as candidates.

### Merge-run searches

All merge-run calls were made on 2026-11-15 (UTC) through public APIs with a generic User-Agent and no personal details. Every logged query is listed below with the count the tool returned. "Count" is the tool's total (`total` for Semantic Scholar bulk search, `totalResults` for arXiv, esearch `count` for PubMed, the number of records returned for reference and citation lists, which these endpoints do not total separately). "Retrieved" is the number of records downloaded. Downloaded content was kept outside the repository and nothing from it was executed.

| ID | Tool | Date | Query or identifier | Filters | Count | Retrieved | Status |
|---|---|---|---|---|---|---|---|
| M-D1 | s2bulk | 2026-11-15 | ("tensor regression" \| "multilinear" \| "PARAFAC2" \| "tensor decomposition" \| "tensor factorization" \| "partial least squares") + (supervised \| prediction \| regression \| classification) | venue=Neural Information Processing Systems,International Conference on Machine Learning,International Conference on Learning Representations,International Conference on Artificial Intelligence and Statistics,Medical Image Computing and Computer-Assisted Intervention,Information Processing in Medical Imaging&year=2013-2026&sort=citationCount:desc | 60 | 60 | 200 |
| M-D2 | s2bulk | 2026-11-15 | (tensor \| multilinear \| PARAFAC \| Tucker) + ("irregular" \| "unaligned" \| "misaligned" \| "misalignment" \| "point cloud" \| "permutation" \| "optimal transport" \| "Wasserstein") | venue=Neural Information Processing Systems,International Conference on Machine Learning,International Conference on Learning Representations,International Conference on Artificial Intelligence and Statistics,Medical Image Computing and Computer-Assisted Intervention,Information Processing in Medical Imaging&year=2013-2026 | 42 | 42 | 200 |
| M-D3 | s2bulk | 2026-11-15 | (tensor \| multilinear \| "partial least squares") + (MRI \| neuroimaging \| brain \| fMRI \| PET \| lesion) | venue=Neural Information Processing Systems,International Conference on Machine Learning,International Conference on Learning Representations,International Conference on Artificial Intelligence and Statistics,Medical Image Computing and Computer-Assisted Intervention,Information Processing in Medical Imaging&year=2013-2026 | 104 | 104 | 200 |
| BC-Zhou2013Tensor | s2refs | 2026-11-15 | DOI:10.1080/01621459.2013.776499 |  | none returned | 63 | 200 |
| BC-Tang2026Unaligned | s2refs | 2026-11-15 | arXiv:2410.14046 |  | none returned | 61 | 200 |
| BC-Biehler2024ANTLER | s2refs | 2026-11-15 | DOI:10.1109/TASE.2022.3230563 |  | none returned | 75 | 200 |
| BC-Huang2026ShiftAware | s2refs | 2026-11-15 | arXiv:2505.12113 |  | none returned | 16 | 200 |
| BC-VincentCuaz2022Template | s2refs | 2026-11-15 | arXiv:2205.15733 |  | none returned | 77 | 200 |
| BC-Thual2022Aligning | s2refs | 2026-11-15 | arXiv:2206.09398 |  | none returned | 53 | 200 |
| BC-Kundu2018Discovery | s2refs | 2026-11-15 | DOI:10.1016/j.neuroimage.2017.11.006 |  | none returned | 46 | 200 |
| BC-Mialon2021Trainable | s2refs | 2026-11-15 | arXiv:2006.12065 |  | none returned | 50 | 200 |
| BC-Zaheer2017DeepSets | s2refs | 2026-11-15 | arXiv:1703.06114 |  | none returned | 54 | 200 |
| BC-GutierrezBecker2018MSPNet | s2refs | 2026-11-15 | arXiv:1806.01069 |  | none returned | 17 | 200 |
| BC-Chen2024TractGeoNet | s2refs | 2026-11-15 | DOI:10.1016/j.media.2024.103120 |  | none returned | 0 | HTTP Error 404: Not Found |
| BC-Bowren2022Poststroke | s2refs | 2026-11-15 | DOI:10.1093/brain/awac010 |  | none returned | 0 | {"data": null, "citingPaperInfo": {"openAccessPdf": {"url":  |
| BC-Ironside2025Predictive | s2refs | 2026-11-15 | DOI:10.7554/eLife.105782 |  | none returned | 51 | 200 |
| BC-Chen2024TractGeoNet-OC | opencit | 2026-11-15 | 10.1016/j.media.2024.103120 | references | none returned | 99 | 200 |
| BC-Bowren2022Poststroke-OC | opencit | 2026-11-15 | 10.1093/brain/awac010 | references | none returned | 77 | 200 |
| BC-Chen2024TractGeoNet-arXiv | s2refs | 2026-11-15 | arXiv:2307.03982 |  | none returned | 140 | 200 |
| FT-Zhou2013Tensor | s2cites | 2026-11-15 | DOI:10.1080/01621459.2013.776499 |  | none returned | 650 | 200 |
| FT-Tang2026Unaligned | s2cites | 2026-11-15 | arXiv:2410.14046 |  | none returned | 7 | 200 |
| FT-Biehler2024ANTLER | s2cites | 2026-11-15 | DOI:10.1109/TASE.2022.3230563 |  | none returned | 11 | 200 |
| FT-Huang2026ShiftAware | s2cites | 2026-11-15 | arXiv:2505.12113 |  | none returned | 1 | 200 |
| FT-VincentCuaz2022Template | s2cites | 2026-11-15 | arXiv:2205.15733 |  | none returned | 39 | 200 |
| FT-Thual2022Aligning | s2cites | 2026-11-15 | arXiv:2206.09398 |  | none returned | 63 | 200 |
| FT-Kundu2018Discovery | s2cites | 2026-11-15 | DOI:10.1016/j.neuroimage.2017.11.006 |  | none returned | 29 | 200 |
| FT-Mialon2021Trainable | s2cites | 2026-11-15 | arXiv:2006.12065 |  | none returned | 0 | {"offset": 0, "data": []}  |
| FT-Zaheer2017DeepSets | s2cites | 2026-11-15 | arXiv:1703.06114 |  | none returned | 3000 | 200 |
| FT-GutierrezBecker2018MSPNet | s2cites | 2026-11-15 | arXiv:1806.01069 |  | none returned | 0 | HTTP Error 429:  |
| FT-Chen2024TractGeoNet | s2cites | 2026-11-15 | DOI:10.1016/j.media.2024.103120 |  | none returned | 0 | HTTP Error 404: Not Found |
| FT-Bowren2022Poststroke | s2cites | 2026-11-15 | DOI:10.1093/brain/awac010 |  | none returned | 105 | 200 |
| FT-Ironside2025Predictive | s2cites | 2026-11-15 | DOI:10.7554/eLife.105782 |  | none returned | 0 | {"offset": 0, "data": []}  |
| FT-GutierrezBecker2018MSPNet-doi | s2cites | 2026-11-15 | DOI:10.1007/978-3-030-00931-1_60 |  | none returned | 0 | HTTP Error 404: Not Found |
| FT-Chen2024TractGeoNet-arXiv | s2cites | 2026-11-15 | arXiv:2307.03982 |  | none returned | 17 | 200 |
| FT-Mialon2021Trainable-S2search | s2cites | 2026-11-15 | Trainable Optimal Transport Embedding |  | none returned | 0 | URL can't contain control characters. '/graph/v1/paper/Train |
| FT-Ilse2018-skip | s2cites | 2026-11-15 | CorpusId:3537028 |  | none returned | 2957 | 200 |
| FT-ChenAMINN | s2cites | 2026-11-15 | arXiv:2012.06875 |  | none returned | 17 | 200 |
| FT-Wang2013Linear | s2cites | 2026-11-15 | DOI:10.1007/s11263-012-0566-z |  | none returned | 227 | 200 |
| FT-Mialon2021Trainable-corpus | s2cites | 2026-11-15 | CorpusId:222142008 |  | none returned | 79 | 200 |
| FT-GutierrezBecker2018MSPNet-arXiv | s2cites | 2026-11-15 | arXiv:1806.01069 |  | none returned | 23 | 200 |
| X1 | arxiv | 2026-11-15 | (abs:"optimal transport" OR abs:Wasserstein OR abs:"Gromov-Wasserstein" OR abs:barycenter) AND (abs:lesion OR abs:lesions OR abs:metastases OR abs:nodules) AND (abs:patient OR abs:subject OR abs:"patient-level") AND (abs:prediction OR abs:classification OR abs:survival OR abs:prognosis) | max_results 50 | 3 | 3 | 200 |
| X2 | pubmed | 2026-11-15 | ("optimal transport"[tiab] OR Wasserstein[tiab] OR "Gromov-Wasserstein"[tiab]) AND (lesions[tiab] OR metastases[tiab] OR nodules[tiab] OR "point cloud"[tiab] OR "point clouds"[tiab]) AND (prediction[tiab] OR classification[tiab] OR survival[tiab] OR prognosis[tiab]) AND 2013:2026[dp] | retmax 50, sort relevance | 18 | 18 | 200 |
| X3 | pubmed | 2026-11-15 | ("multiple instance learning"[tiab] OR "set transformer"[tiab] OR "deep sets"[tiab] OR "point cloud"[tiab] OR "permutation invariant"[tiab] OR "permutation-invariant"[tiab]) AND (registration[tiab] OR "voxel-based"[tiab] OR atlas[tiab] OR template[tiab] OR "lesion-symptom"[tiab] OR "common space"[tiab]) AND (compar*[tiab]) AND (prediction[tiab] OR classification[tiab] OR regression[tiab]) AND 2013:2026[dp] | retmax 50, sort relevance | 41 | 41 | 200 |
| X4 | arxiv | 2026-11-15 | (abs:"point cloud" OR abs:"multiple instance" OR abs:"set transformer" OR abs:"deep sets" OR abs:"permutation invariant") AND (abs:registration OR abs:"voxel-based" OR abs:atlas OR abs:template) AND (abs:brain OR abs:MRI OR abs:lesion OR abs:lesions) AND (abs:prediction OR abs:classification OR abs:regression) | max_results 50 | 6 | 6 | 200 |
| X5 | arxiv | 2026-11-15 | (abs:tensor OR abs:multilinear OR abs:PARAFAC2) AND (abs:"optimal transport" OR abs:"Gromov-Wasserstein" OR abs:"permutation invariant" OR abs:"point cloud" OR abs:"point clouds") AND (abs:regression OR abs:classification OR abs:supervised OR abs:prediction) | max_results 50 | 47 | 47 | 200 |
| X6 | s2bulk | 2026-11-15 | ("optimal transport" \| Wasserstein \| "Gromov-Wasserstein") + ("multiple instance" \| "set classification" \| "point cloud classification" \| "set representation" \| "sets of") + (classification \| regression \| prediction) | year=2022-2026&sort=citationCount:desc | 532 | 532 | 200 |
| X7 | s2bulk | 2026-11-15 | (lesions \| metastases \| nodules \| "lesion set") + ("optimal transport" \| Wasserstein \| template \| barycenter \| atlas) + ("patient-level" \| "subject-level" \| survival \| prognosis) | year=2013-2026&sort=citationCount:desc | 1299 | 1000 | 200 |
| X8 | s2bulk | 2026-11-15 | ("point cloud" \| "set transformer" \| "deep sets" \| "multiple instance" \| "permutation invariant") + (lesions \| metastases \| "cortical surface" \| "brain structures" \| tractography \| nodules) + (patient \| subject \| survival \| prognosis \| diagnosis) | year=2023-2026&sort=citationCount:desc | 152 | 152 | 200 |
| PR-PAR2COX_Survival-inf | crossref | 2026-11-15 | PAR2COX Survival-informed tensor decomposition phenotyping risk prediction irregular longitudinal data | rows 3 | 215979 | 3 | 200 |
| PR-Learning_fMRI_activa | crossref | 2026-11-15 | Learning fMRI activations dictionaries across individual geometries via optimal transport | rows 3 | 131320 | 3 | 200 |
| PR-Linearized_Optimal_T | crossref | 2026-11-15 | Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data | rows 3 | 1374209 | 3 | 200 |
| PR-Automated_Radiomics_ | crossref | 2026-11-15 | Automated Radiomics Framework Postoperative Survival Prediction Colorectal Liver Metastases Preoperative MRI SurvAMINN | rows 3 | 135002 | 3 | 200 |
| PR-Atlas-free_Brain_Net | crossref | 2026-11-15 | Atlas-free Brain Network Transformer | rows 3 | 3483270 | 3 | 200 |
| PR-Live(r)_Die:_Predict | crossref | 2026-11-15 | Live(r) Die: Predicting Survival in Colorectal Liver Metastasis | rows 3 | 3589108 | 3 | 200 |
| PR-Multimodal_Prototypi | crossref | 2026-11-15 | Multimodal Prototyping for cancer survival prediction | rows 3 | 4390348 | 3 | 200 |
| PR-MIL_vs._Aggregation: | crossref | 2026-11-15 | MIL vs. Aggregation: Evaluating Patient-Level Survival Prediction Strategies Using Graph-Based Learning | rows 3 | 1940270 | 3 | 200 |
| X9 | openalex | 2026-11-15 | optimal transport lesions patient prediction | from_publication_date:2013-01-01 | none returned | 0 | HTTP Error 429: Too Many Requests |
| X7b | s2bulk | 2026-11-15 | "optimal transport" + (lesions \| metastases \| nodules \| tumors) + (patient \| survival \| prognosis \| classification) | year=2013-2026&sort=citationCount:desc | 54 | 54 | 200 |

Notes on the log. Calls with status other than 200 returned no records and were repeated through another identifier where one existed: BC-Chen2024TractGeoNet (HTTP 404 by DOI) was repeated by arXiv ID and through OpenCitations; BC-Bowren2022Poststroke (no data by DOI) through OpenCitations; FT-Mialon2021Trainable (empty by arXiv ID) by CorpusId; FT-GutierrezBecker2018MSPNet (HTTP 429, then HTTP 404 by DOI) by arXiv ID; FT-Chen2024TractGeoNet (HTTP 404) by arXiv ID. FT-Mialon2021Trainable-S2search was an invalid call (a title passed as a paper identifier) and returned nothing. FT-Ilse2018-skip is the forward-tracking call on Ilse2018AttentionMIL. FT-Ironside2025Predictive returned no citing records. X9 (OpenAlex) failed with HTTP 429 and was not repeated, because OpenAlex reported its daily budget for unauthenticated requests as exhausted; the transport-lesion intersection it targeted was covered by X1, X2, X7 and X7b. The Deep Sets citation list (FT-Zaheer2017DeepSets) stopped at 3000 records, the paging limit of the endpoint, so citers beyond the first 3000 were not seen. X7 was too broad (1299 hits, mostly genomics among the top 100 screened) and was replaced by the narrower X7b. The PR-* rows are Crossref bibliographic title queries for peer-reviewed versions of preprints; their count is Crossref's total for a relevance-ranked title search, and only the top 3 records were compared with the preprint title.

### Item 2a: proceedings papers with a proceedings-page URL

Peyre2016Gromov, which Theme B excluded only because no DOI or arXiv record exists, is included with the PMLR proceedings page (https://proceedings.mlr.press/v48/peyre16.html, PMLR 48:2664-2672), whose abstract was read. The same rule was applied to every NeurIPS, ICML, ICLR or OpenReview paper added in this run: Luise2018Differential and Togninalli2019Wasserstein carry the NeurIPS proceedings page, Song2024Multimodal the PMLR v235 page (PMLR 235:46050-46073), and Bai2025Linear the OpenReview forum page (venue field "ICLR 2025 Poster"). No other theme source had been excluded only for lacking a DOI or an arXiv ID; the theme exclusion tables were read for this.

### Item 2b: the five sources Theme B cut for its 30-source cap

Each was judged on merit and all five are included: Feydy2019Fast (transport couplings and a Wasserstein barycenter atlas on tractograms at the scale of millions of points), Beier2022Linear (linear GW embedding replacing pairwise GW), Luise2018Differential (gradients through Sinkhorn, needed by any trained transport layer), Kundu2020Enabling (subject-level prediction by transport-based morphometry, 78 percent test accuracy for osteoarthritis 3 years ahead) and Peyre2019Computational (the transport survey cited by two backward-chaining seeds, Mialon2021Trainable and VincentCuaz2022Template, which meets the survey rule). The merged corpus has no source cap; source count is the size measure (decision D5).

### Item 2c: Beg 2005 and Harshman 1970 through other routes

- Beg2005Computing: the Crossref record (DOI 10.1023/B:VISI.0000043755.93987.aa; IJCV 61(2):139-157) was retrieved. Crossref, OpenAlex and Semantic Scholar carry no abstract. Abstract excerpts were read on a manuscript-inventory page through WebFetch. The annotation states only what the excerpts, the record and the three citing Theme D Layer 2 papers say, and its Quality line says so. Semantic Scholar shows 2002 citations and Crossref 1590.
- Harshman1970Foundations: the OpenAlex record (W2121739212; UCLA Working Papers in Phonetics 16:1-84; 2255 citations) points to the author-site copy at https://www.psychology.uwo.ca/faculty/harshman/wpppfac0.pdf, whose pages 1 to 3, including the abstract, were read. It is included under the foundational rule and resolves the Theme A citation-loop shortfall. Harshman's 1971 and 1972 JASA meeting abstracts were found on the same route and excluded (conference abstracts without a paper).

### Item 2d: proceedings queries for tensor and multilinear methods

Three Semantic Scholar bulk queries with the venue filter NeurIPS, ICML, ICLR, AISTATS, MICCAI and IPMI and years 2013 to 2026 (M-D1, M-D2, M-D3 in the log) returned 60, 42 and 104 records, all of which were screened by title. Records taken to abstract assessment: He et al. 2018 (NeurIPS), the tensor Gaussian process with contraction (ICML), Song et al. 2015 (MICCAI), Tripathi2023Tensor and Adeli2017Joint. The last two are included; the other three are excluded with reasons in the exclusion section. No proceedings paper with an unaligned spatial mode or a transport or permutation component in a tensor model was found.

### Item 2e: backward chaining and forward tracking

Backward chaining used 13 High-quality core sources across the four themes: Zhou2013Tensor, Tang2026Unaligned, Biehler2024ANTLER, Huang2026ShiftAware, VincentCuaz2022Template, Thual2022Aligning, Kundu2018Discovery, Mialon2021Trainable, Zaheer2017DeepSets, GutierrezBecker2018MSPNet, Chen2024TractGeoNet, Bowren2022Poststroke and Ironside2025Predictive. Their reference lists were aggregated by DOI, arXiv ID or normalized title (rows BC-* in the log). Works cited by three or more of the 13 seeds: PointNet (Biehler, GutierrezBecker, Chen2024TractGeoNet) and Wang 2013 LOT (Ironside, Kundu, Mialon), both already included. Works cited by two seeds and not already included were screened: Togninalli2019Wasserstein is added; Peyre2016Gromov and Peyre2019Computational are added under items 2a and 2b; the others are listed with reasons at the end of the exclusion section.

Forward tracking retrieved the citing records of the same seeds plus Chen2021AMINN, Wang2013Linear and Ilse2018AttentionMIL, kept citers dated 2023 to 2026, applied a stated title filter, and read every filtered title. The broad filter is the regular expression in ft.py (medical terms such as lesion, tumour, metastasis, nodule, patient, brain, MRI, CT, PET, cortical, clinical, radiomic, stroke, cancer, disease, cardiac, together with method terms such as point cloud, set, transport, Wasserstein, template, barycenter, tensor, PARAFAC, registration, align, multiple instance, permutation, graph classification, dictionary). For the three largest lists, narrower filters were used: for Zhou2013Tensor, a tensor or multilinear term together with an imaging, point, misalignment, transport or lesion term; for Zaheer2017DeepSets and Ilse2018AttentionMIL, a lesion, nodule, metastasis, tumour, patient-level, subject-level, multifocal or lymph term, excluding titles on whole slides or histopathology. A filtered title was taken to abstract assessment when it described a subject-level prediction from a set or an unaligned spatial mode, or a transport or template method for such data.

| Seed | Citing records returned | Dated 2023 to 2026 | Filter | Titles read | Taken to abstract assessment |
|---|---|---|---|---|---|
| Zhou2013Tensor | 650 | 225 | tensor-imaging | 16 | 2 (Tensor-GP contraction and He et al. 2018, both also in M-D1; Huang2026ShiftAware already included) |
| Tang2026Unaligned | 7 | 7 | broad | 5 | 0 |
| Biehler2024ANTLER | 11 | 9 | broad | 8 | 0 |
| Huang2026ShiftAware | 1 | 1 | broad | 1 | 0 |
| VincentCuaz2022Template | 39 | 39 | broad | 21 | 2 (Kwon2025Graph, Wang2024Graph) |
| Thual2022Aligning | 63 | 58 | broad | 48 | 2 (DiazMartin2026Gromov; Mazelet2026Learning already included) |
| Kundu2018Discovery | 29 | 7 | broad | 7 | 1 (Kan 2026; Ironside2025Predictive and Bai2023Linear already included) |
| Mialon2021Trainable (CorpusId) | 79 | 47 | broad | 22 | 1 (Song2024Multimodal) |
| GutierrezBecker2018MSPNet (arXiv) | 23 | 4 | broad | 4 | 1 (GeoHSAF) |
| Chen2024TractGeoNet (arXiv) | 17 | 17 | broad | 10 | 2 (TractShapeNet, TractGraphFormer) |
| Chen2021AMINN (arXiv) | 17 | 12 | broad | 5 | 5 (Karimzadeh2026Revisiting, Alberb2026Automated, Diao2024Multi, MGCNet, Live(r) Die) |
| Bowren2022Poststroke | 105 | 85 | broad | 76 | 4 (Brzus2026Clinical, Bonkhoff2024Prediction, Sperber2023Stroke, Seghier2023Elusive) |
| Ironside2025Predictive | 0 | 0 | none | 0 | 0 |
| Wang2013Linear | 227 | 99 | broad | 78 | 5 (Bai2025Linear, DiazMartin2026Gromov, Gachon 2025, FlowLOT, Mahan 2024) |
| Zaheer2017DeepSets | 3000 (endpoint limit) | 1688 | lesion-or-patient, no pathology | 12 | 1 (Karimzadeh2026Revisiting); from the earlier broader pass: Hypergraph NSCLC, FlowLOT, Mahan 2024 |
| Ilse2018AttentionMIL | 2957 | 2197 | lesion-or-patient, no pathology | 108 | 9 (Verdelho2025MIL, Li2025MultiStage, Xu2024Hybrid, Karimzadeh2026Revisiting, DyHG, Ma 2025, Dutta 2026, Davis 2024, DBF-GNN); from the earlier broader pass: Song2024Multimodal, Ren2025OTSurv, Xu2023Multimodal, TractGraphFormer, FlowLOT |

For the Deep Sets and attention-MIL lists, an earlier pass in this run read titles filtered by a broader pattern that was not recorded; the records it took to assessment are named in the last column, and the counts in the Filter and Titles-read columns are those of the recorded filters. Some records appear under more than one seed, so the last column is not deduplicated. The Theme D list of 74 candidates kept at title screening but not advanced was also re-screened against the merge-run criteria through PubMed esummary; Dong2024Self, Sabouri2025Enhancing, Kendrick2022Fully, Huang2026Atlas, Gurler2023Template, Liu2023Coordinatized, Karimzadeh2026Revisiting, Brzus2026Clinical and Gacheva2026Multiple were taken from it, and Tompkins 2025, Geady 2025 MIRV, Tilwani 2025 and LEGNet were excluded.

Citation loop closure: the backward-chaining round over the 13 seeds found no work cited by three or more seeds that is not included, and Harshman 1970, the one three-seed work Theme A could not collect, is now included. The loop therefore closes at the must-include threshold (three or more seeds). It does not close at two seeds: the two-seed works not collected are listed with reasons, and the Deep Sets citation list was truncated at 3000 records by the endpoint.

### Item 2f: cross-theme intersection searches

- Transport or template methods applied to lesion or region sets for subject-level prediction: X1 (arXiv, 3 records; none relevant), X2 (PubMed, 18; none relevant), X6 (Semantic Scholar 2022 to 2026, 532; top 100 by citation count screened; Ren2025OTSurv and Xu2023Representing taken), X7 (Semantic Scholar, 1299 with 1000 retrieved; top 100 screened; none relevant), X7b (Semantic Scholar, 54; all screened; Xu2023Multimodal and Little2023Associating taken, Oh 2025 excluded), X9 (OpenAlex; failed with HTTP 429).
- Set encoders or MIL compared with registration-based predictors on one cohort: X3 (PubMed, 41; all screened; Liu2026Three taken, and Karimzadeh2026Revisiting returned again), X4 (arXiv, 6; all screened; Islam2026NeuroAPS taken), X8 (Semantic Scholar 2023 to 2026, 152; all screened; Collenne2024ReSeT, Gacheva2026Multiple, Alberb2026Automated and Karimzadeh2026Revisiting taken, the MIL systematic review excluded). No study comparing the two routes on one cohort was found; the closest are recorded under Gap 2.
- Tensor models combined with transport or set structure: X5 (arXiv, 47; all screened; it returned the already included Biehler2024ANTLER, Yan2019Structured and Afshar2021SWIFT, and three records taken to assessment and excluded: supervised GW, Transcending Grids and MCUR).

### Record retrieval and verification

Every added source was retrieved from a bibliographic record and its identifier copied from that record: Crossref works records by DOI for all 32 DOIs of added sources, for the article number of ShifatERabbi2025Linear and for the pre-2013 citation counts; arXiv API records for 12 arXiv IDs; PubMed efetch for 16 PMIDs and esummary for the 74 Theme D candidates; Semantic Scholar batch records for 81 identifiers in four batches (abstracts and citation counts); the PMLR v48 paper page and v235 index; the NeurIPS 2018 and 2019 index pages and BibTeX files; the OpenReview notes search; the OpenAlex records for Beg 2005 and Harshman 1970; and the OpenCitations citation-count endpoint for Bro1996Multiway. Two later Semantic Scholar match calls and one OpenAlex search for citation counts returned HTTP 429 and gave no data; the counts they sought were obtained from the Semantic Scholar batch endpoint, Crossref or OpenCitations instead. Pages that are not in a record are omitted from references.bib (Luise2018Differential pages come from the Semantic Scholar record; the NeurIPS BibTeX has none).

## Coverage Distribution Advisory

No distributional skew advisory triggered. No value reaches 70 percent of known_N in any dimension. Counts over the 147 included sources, computed from references.bib and the matrix:

- Time distribution (known_N = 147): 2022 to 2026 79/147 (53.7%); 2018 to 2021 37/147 (25.2%); 2013 to 2017 19/147 (12.9%); before 2013 12/147 (8.2%). Largest value 2022 to 2026, 53.7%.
- Methodological distribution, by the first correspondence-handling label of each source in the matrix (known_N = 147): permutation invariance 39/147 (26.5%); learned template or barycenter 34/147 (23.1%); transport coupling 20/147 (13.6%); registration to a common space 20/147 (13.6%); assumes alignment 18/147 (12.2%); not applicable or not stated 16/147 (10.9%). Largest value permutation invariance, 26.5%.
- Venue tier distribution (known_N = 147): journal 88/147 (59.9%); peer-reviewed proceedings 53/147 (36.1%); preprint 5/147 (3.4%); working paper 1/147 (0.7%). Largest value journal, 59.9%.
- Venue family (known_N = 147): the three largest venue families are NeurIPS 12/147 (8.2%); MICCAI proceedings 12/147 (8.2%); ICML 10/147 (6.8%).
- Geographic distribution (known_N = 0): study sites were not recorded in the annotations, so the dimension is not computed.

## Screening Results

Per-theme counts, as the theme files give them (each theme's counts are its own and overlap with the others; they are not summed):

- Theme A: 2414 records retrieved over 47 query runs (not deduplicated); 36 taken to abstract assessment; 25 included.
- Theme B: 1036 records retrieved (not deduplicated across layers); 831 screened by title; 54 assessed; 30 included.
- Theme C: 811 titles screened (744 unique after title normalisation) plus 20 WebSearch links; 28 assessed; 25 included.
- Theme D: 922 records screened at title level (counted once per occurrence); 120 kept at first pass (118 unique); 44 assessed; 28 included.

Merge-run counts (from the query log above and the forward-tracking table; counts from different calls overlap and are not deduplicated):

- Logged calls: 58 (including 9 calls that returned no records, listed in the notes on the log).
- Titles screened in the proceedings queries M-D1 to M-D3: 206 (60 + 42 + 104).
- Titles screened in the intersection queries: 521 (X1 3, X2 18, X3 41, X4 6, X5 47, X6 top 100 of 532, X7 top 100 of 1299, X7b 54, X8 152); X9 returned nothing.
- Backward chaining: 13 reference lists aggregated; 24 works cited by two or more seeds screened, of which 2 are cited by three or more.
- Forward tracking: 421 filtered titles read across 16 citing lists, plus the earlier broader pass on the Deep Sets and attention-MIL lists.
- Theme D candidate list re-screened: 74 records.
- Records assessed at record level (bibliographic record and abstract) in the merge run: 73; included 40; excluded 33 (the exclusion section lists each one).

Cross-theme deduplication: the four theme files include 108 entries; deduplication by DOI, arXiv ID and citation key found one duplicate (Chen2021AMINN, in Themes C and D), giving 107 unique theme sources, all retained. Adding the 40 merge-run sources gives a final deduplicated included count of 147.

## Annotated Bibliography

Theme annotations are carried over from the theme files unchanged, except the merged entry for Chen2021AMINN, which keeps the Theme C annotation and adds the Theme D record's pipeline relation, relevance sentence and score. Each theme defines its quick-assessment items in the note at the start of its group; the merge-run additions use the Theme D items (J venue, R rigour, Rel relevance, C citation count, D data or evidence quality, 1 to 3 each; 12 or more High, 8 to 11 Medium, 7 or less Low), with citation counts from the Semantic Scholar batch endpoint on 2026-11-15 unless another source is named. Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly.

### Theme A: multilinear and tensor models

Theme note: Quick-assessment items, in order: journal ranking, methodological rigor, relevance to RQ, citation count, data/evidence quality (1 to 3 each). Citation-count scores use the counts OpenAlex or Semantic Scholar returned in this run; sources from 2025 and 2026 are too recent to rank and are scored 1. Rigor scores are judgments from the abstract, since no full text was read. Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly: "supports" marks a source whose model handles a mode that is not aligned across subjects or whose abstract names misalignment as a problem; "neutral" marks a source that assumes aligned modes or is foundational.

##### Carroll, J. D. and Chang, J.-J. (1970). Analysis of individual differences in multidimensional scaling via an N-way generalization of "Eckart-Young" decomposition.
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

##### Bro, R. (1996). Multiway calibration. Multilinear PLS.
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

##### Kiers, H. A. L., ten Berge, J. M. F. and Bro, R. (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
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

##### Martinez-Montes, E., Valdes-Sosa, P. A., Miwakeichi, F., Goldman, R. I. and Cohen, M. S. (2004). Concurrent EEG/fMRI analysis by multiway partial least squares.
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

##### Kolda, T. G. and Bader, B. W. (2009). Tensor decompositions and applications.
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

##### Zhao, Q., Caiafa, C. F., Mandic, D. P., Chao, Z. C., Nagasaka, Y., Fujii, N., Zhang, L. and Cichocki, A. (2013). Higher order partial least squares (HOPLS): A generalized multilinear regression method.
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

##### Zhou, H., Li, L. and Zhu, H. (2013). Tensor regression with applications in neuroimaging data analysis.
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

##### Guhaniyogi, R., Qamar, S. and Dunson, D. B. (2017). Bayesian tensor regression.
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

##### Li, L. and Zhang, X. (2017). Parsimonious tensor response regression.
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

##### Zhang, X. and Li, L. (2017). Tensor envelope partial least-squares regression.
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

##### Lock, E. F. and Li, G. (2018). Supervised multiway factorization.
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

##### Yan, H., Paynabar, K. and Pacella, M. (2019). Structured point cloud data analysis via regularized tensor regression for process modeling and optimization.
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

##### Afshar, A., Yin, K., Yan, S., Qian, C., Ho, J., Park, H. and Sun, J. (2021). SWIFT: Scalable Wasserstein factorization for sparse nonnegative tensors.
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

##### Roald, M., Schenker, C., Calhoun, V. D., Adali, T., Bro, R., Cohen, J. E. and Acar, E. (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes.
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

##### Ren, Y., Lou, J., Xiong, L., Ho, J. C., Jiang, X. and Bhavani, S. V. (2023). MULTIPAR: Supervised irregular tensor factorization with multi-task learning for computational phenotyping.
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

##### Biehler, M., Yan, H. and Shi, J. (2024). ANTLER: Bayesian nonlinear tensor learning and modeler for unstructured, varying-size point cloud data.
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

##### Spencer, D. A., Gutierrez, R., Guhaniyogi, R., Shinohara, R. T., Prado, R. and others (2024). Bayesian scalar-on-tensor regression using the Tucker decomposition for sparse spatial modeling.
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

##### Xu, T., Chen, K. and Li, G. (2024). Tensor regression for incomplete observations with application to longitudinal studies.
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

##### Konyar, E. and Reisi Gahrooei, M. (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping using electronic health records.
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

##### Schenker, C., Wang, X., Horner, D., Rasmussen, M. A. and Acar, E. (2025). PARAFAC2-based coupled matrix and tensor factorizations with constraints.
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

##### Park, K. and Keles, S. (2026). Sparse higher-order partial least squares for simultaneous variable selection, dimension reduction and tensor denoising.
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

##### Tang, R., Kolda, T. G. and Zhang, A. R. (2026). Tensor decomposition with unaligned observations.
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

##### Huang, H.-H., Chen, Y.-H. and Zhang, T. (2026). Shift-aware sparse Kronecker tensor classification.
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

##### Hu, Y., Jiang, T.-X., Ng, M. K. and Zhao, X.-L. (2026). Separable decomposition for ragged tensors.
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

##### Patalano, M., Konyar, E. and Paynabar, K. (2026). PAR2COX: Survival-informed tensor decomposition for phenotyping and risk prediction from irregular longitudinal data.
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

### Theme B: optimal transport

Theme note: Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly. Quick-assessment items are venue, methodological rigor, relevance to RQ, citation count, data or evidence quality (1 to 3 each). Citation counts quoted are the Semantic Scholar `citationCount` returned by the batch lookup on 2026-11-14/15 or the citing-record count from Layer 3.

#### Sub-theme 1: Entropic optimal transport

##### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport Distances.
- **Citation key**: Cuturi2013Sinkhorn
- **Identifier**: arXiv:1306.0895 (no DOI); Advances in Neural Information Processing Systems 26, pp. 2292-2300, per the arXiv journal reference.
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Algorithmic; entropic smoothing of the transport linear program solved by Sinkhorn-Knopp matrix scaling; evaluation on MNIST.
- **Key Findings**: Smoothing the transport problem with an entropic term yields a distance computable by Sinkhorn-Knopp scaling several orders of magnitude faster than transport solvers. The abstract reports improved performance over classical transport distances on MNIST.
- **Relevance**: The computational basis of most transport layers and barycenter methods in this theme.
- **Stance**: neutral (a computational tool; it takes no position on correspondence in prediction).
- **Correspondence handling**: transport coupling; the entropic plan is a soft correspondence between histogram bins.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 2 / 3 / 2 = 13 (6244 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Background on entropic OT; foundational reference.

##### Chizat, Peyre, Schmitzer and Vialard (2018). Scaling algorithms for unbalanced optimal transport problems.
- **Citation key**: Chizat2018Scaling
- **Identifier**: DOI 10.1090/mcom/3303; arXiv:1607.05816
- **Type**: Journal article (Mathematics of Computation 87(314), 2563-2609)
- **Evidence type**: journal
- **Method**: Algorithmic; extension of entropic regularization to unbalanced transport between arbitrary positive measures, solved by diagonal scaling.
- **Key Findings**: The entropic scheme extends to unbalanced problems, giving parallel algorithms that generalize Sinkhorn by pointwise multiplications of the coupling. The abstract states the methods solve unbalanced transport, unbalanced gradient flows and unbalanced barycenters.
- **Relevance**: Unequal total mass is the situation of lesion or region sets of different size and count across subjects.
- **Stance**: neutral (tool paper).
- **Correspondence handling**: transport coupling with relaxed mass conservation, so elements can be left unmatched.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 2 / 3 / 2 = 13 (481 citations)
- **Quality**: High. Read: abstract (Crossref record and arXiv record).
- **Potential Use**: Unbalanced transport for sets of unequal mass.

##### Feydy, Sejourne, Vialard, Amari, Trouve and Peyre (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Citation key**: Feydy2019Interpolating
- **Identifier**: arXiv:1810.08278 (no DOI); AISTATS 2019, PMLR 89, pp. 2681-2690 (venue and pages from the Semantic Scholar record and the PMLR page found by WebSearch).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Theoretical and algorithmic; analysis of Sinkhorn divergences and a GPU numerical scheme.
- **Key Findings**: Sinkhorn divergences interpolate between MMD and OT; the paper proves positivity, convexity and metrization of convergence in law. Gradients of the Sinkhorn loss can be computed on the GPU for batches of a million samples.
- **Relevance**: Establishes the debiased, differentiable entropic loss used for training with transport between point sets.
- **Stance**: neutral.
- **Correspondence handling**: transport coupling (implicit in the divergence).
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 2 / 3 / 2 = 12 (807 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Differentiability and scaling of entropic transport losses.

##### Wang and Goldfeld (2026). Neural Entropic Optimal Transport and Gromov-Wasserstein Alignment.
- **Citation key**: Wang2026NeuralEntropic
- **Identifier**: DOI 10.1109/TIT.2026.3661439; arXiv:2312.07397
- **Type**: Journal article (IEEE Transactions on Information Theory 72(4), 2424-2443)
- **Evidence type**: journal
- **Method**: Theoretical and algorithmic; a neural network trained on mini-batches replaces the Sinkhorn step for entropic OT and entropic GW; non-asymptotic error bounds.
- **Key Findings**: The approach estimates entropic OT and GW cost and plan at dataset sizes beyond standard Sinkhorn. The derived bounds achieve minimax-optimal parametric rates for compactly supported distributions.
- **Relevance**: Recent scaling route for entropic OT and entropic GW to large point sets.
- **Stance**: neutral.
- **Correspondence handling**: transport coupling (OT) and GW alignment plan.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 1 / 2 / 2 = 11 (6 citations)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Recent computational state of entropic OT and GW.

#### Sub-theme 2: Gromov-Wasserstein and fused Gromov-Wasserstein

##### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Citation key**: Memoli2011GromovWasserstein
- **Identifier**: DOI 10.1007/s10208-011-9093-5
- **Type**: Journal article (Foundations of Computational Mathematics 11(4), 417-487)
- **Evidence type**: journal
- **Method**: Theoretical; objects modelled as metric measure spaces, GW distance defined from mass transportation, lower bounds computable in polynomial time.
- **Key Findings**: The GW distance is a strict metric on isomorphism classes of metric measure spaces and is more amenable to computation than Gromov-Hausdorff. The paper proves lower bounds that relate the distance to invariants used by earlier shape-matching methods.
- **Relevance**: Defines the comparison of objects that do not share a coordinate space, the formal basis for transport between unaligned subjects.
- **Stance**: supports (matching is posed as an explicit optimization over correspondences between objects in different spaces).
- **Correspondence handling**: transport coupling between intra-object distance structures, invariant to isometries.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 2 / 3 / 2 = 13 (885 citations)
- **Quality**: High. Read: abstract and table of contents of the journal PDF (pages 417-418).
- **Potential Use**: Foundational definition of GW.

##### Vayer, Chapel, Flamary, Tavenard and Courty (2019). Optimal Transport for structured data with application on graphs.
- **Citation key**: Vayer2019Structured
- **Identifier**: arXiv:1805.09114 (no DOI); ICML 2019, PMLR 97, pp. 6275-6284 (venue and pages from the Semantic Scholar record and the PMLR page found by WebSearch; the PMLR author order differs from the arXiv order, and the arXiv order is used).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological; definition of FGW combining a feature (Wasserstein) term and a structure (GW) term; graph classification benchmarks; FGW barycenters.
- **Key Findings**: FGW uses features and structure jointly. On graph classification it outperforms graph kernels and deep graph convolutional networks, per the abstract, and FGW barycenters of graphs are illustrated for clustering.
- **Relevance**: The distance used by most template-based transport layers for graphs or region sets with attributes.
- **Stance**: supports (FGW solves a soft matching between nodes of graphs with no node correspondence).
- **Correspondence handling**: transport coupling between nodes, using node features and pairwise structure.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 3 / 2 = 13 (404 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Definition of FGW; graph-level supervised use.

##### Sejourne, Vialard and Peyre (2021). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
- **Citation key**: Sejourne2021Unbalanced
- **Identifier**: arXiv:2009.04266 (no DOI); Advances in Neural Information Processing Systems 34, pp. 8766-8779 (venue from the NeurIPS proceedings page found by WebSearch; pages from the Semantic Scholar record).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Theoretical and algorithmic; two unbalanced GW formulations, a divergence relaxing mass conservation and a conic distance; GPU iterative scheme with entropic regularization.
- **Key Findings**: Unbalanced GW compares metric spaces with arbitrary positive measures up to isometries. The relaxed divergence works with entropic regularization and is solved by a parallel iterative scheme; experiments include positive-unlabeled learning.
- **Relevance**: GW between subjects whose sets differ in total mass, the basis of the unbalanced term in FUGW.
- **Stance**: supports.
- **Correspondence handling**: transport coupling with relaxed marginals.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 2 / 2 / 2 = 11 (110 citations)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Unbalanced GW for sets of unequal mass.

##### Thual, Tran, Zemskova, Courty, Flamary, Dehaene and Thirion (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
- **Citation key**: Thual2022Aligning
- **Identifier**: DOI 10.52202/068431-1584; arXiv:2206.09398
- **Type**: Conference paper (Advances in Neural Information Processing Systems 35, 21792-21804)
- **Evidence type**: proceedings
- **Method**: Methodological with neuroimaging evaluation; Fused Unbalanced Gromov-Wasserstein (FUGW) aligns cortical surfaces by functional signatures while penalizing large deformations of topographic organization.
- **Key Findings**: FUGW is suited for whole-brain landmark-free inter-subject alignment, and the unbalanced term handles functional areas that vary in size across subjects. FUGW alignment increases between-subject correlation of activity on independent data and gives more precise group-level mapping.
- **Relevance**: The main transport method that replaces anatomical co-registration for inter-subject alignment.
- **Stance**: supports (the abstract states that current co-registration gives coarse alignment and replaces it with an explicit transport alignment).
- **Correspondence handling**: transport coupling between cortical vertices of two subjects, fused (features plus geometry) and unbalanced.
- **Pipeline relation**: replaces coarse anatomical co-registration for functional inter-subject alignment; builds on cortical surface reconstruction.
- **Quick-assessment score**: 2 / 3 / 3 / 3 / 3 = 14 (63 citing records in Layer 3)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Core example of registration-free transport alignment in neuroimaging.

#### Sub-theme 3: Barycenters and dictionaries with learnable templates

##### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Citation key**: CuturiDoucet2014Fast
- **Identifier**: arXiv:1310.4375 (no DOI); ICML 2014, PMLR 32(2), pp. 685-693 (arXiv journal reference and Semantic Scholar pages).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Algorithmic; subgradient algorithms for the Wasserstein barycenter of empirical measures, smoothed with an entropic regularizer and computed by matrix scaling.
- **Key Findings**: Entropic smoothing gives a strictly convex barycenter objective whose gradients are cheap to compute by matrix scaling. The algorithms are used to visualize image families and solve a constrained clustering problem.
- **Relevance**: The barycenter is the canonical transport template for a population of unaligned measures.
- **Stance**: supports (a common reference is built by transport rather than by registration).
- **Correspondence handling**: learned template or barycenter.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 2 / 3 / 2 = 12 (868 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Foundational barycenter computation.

##### Schmitz, Heitz, Bonneel, Ngole, Coeurjolly, Cuturi, Peyre and Starck (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Citation key**: Schmitz2018Wasserstein
- **Identifier**: DOI 10.1137/17M1140431; arXiv:1708.01955
- **Type**: Journal article (SIAM Journal on Imaging Sciences 11(1), 643-678)
- **Evidence type**: journal
- **Method**: Methodological; histograms reconstructed as Wasserstein barycenters of learned atoms; gradients by automatic differentiation of generalized Sinkhorn iterations.
- **Key Findings**: Atoms and barycentric weights are learned jointly by gradient descent through entropic barycenters. The barycentric formulation gives nonlinear relationships between atoms and data, illustrated on image processing tasks.
- **Relevance**: Learnable transport templates and differentiation through Sinkhorn, the mechanism later used for graph templates.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (dictionary atoms).
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 2 / 2 / 2 = 12 (158 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Learnable atoms via differentiable Sinkhorn barycenters.

##### Vincent-Cuaz, Vayer, Flamary, Corneli and Courty (2021). Online Graph Dictionary Learning.
- **Citation key**: VincentCuaz2021Online
- **Identifier**: arXiv:2102.06555 (no DOI); ICML 2021, PMLR 139, pp. 10564-10574 (arXiv journal reference).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological; graphs modelled as convex combinations of graph atoms with a GW data-fitting term; online stochastic algorithm; upper bound as fast GW approximation in the embedding space.
- **Key Findings**: The method operates on unregistered graphs with different numbers of nodes and extends to labelled graphs. Experiments show unsupervised graph embedding and online subspace tracking.
- **Relevance**: Template dictionaries for unregistered structured objects; the embedding weights can serve as features for a supervised predictor.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (GW atoms), with a GW coupling to each graph.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 2 = 12 (68 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: GW dictionaries for unregistered sets.

##### Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Citation key**: VincentCuaz2022Template
- **Identifier**: DOI 10.52202/068431-0857; arXiv:2205.15733
- **Type**: Conference paper (Advances in Neural Information Processing Systems 35, 11800-11814)
- **Evidence type**: proceedings
- **Method**: Methodological; a layer computing FGW distances to learnable template graphs, fed to a classifier; templates learned end to end by differentiating through the layer.
- **Key Findings**: The vector of FGW distances to template graphs is discriminative and is learned end to end. On synthetic and real graph classification datasets the method is competitive with or better than kernel and GNN baselines, with ablation and sensitivity analyses.
- **Relevance**: The closest existing design to a supervised predictor with learned transport templates.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter; each input is coupled by FGW to every template.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 2 = 12 (39 citing records in Layer 3)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Template-based transport layer for supervised prediction.

##### Brogat-Motte, Flamary, Brouard, Rousu and d'Alche-Buc (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Citation key**: BrogatMotte2022Learning
- **Identifier**: arXiv:2202.03813 (no DOI); ICML 2022, PMLR 162, pp. 2321-2335 (venue from the Semantic Scholar record; volume and pages from the PMLR page found by WebSearch).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological and theoretical; supervised labelled-graph prediction as regression with an FGW loss, predicting an FGW barycenter whose weights depend on the input; kernel ridge estimator with consistency and excess-risk bounds; neural parametric variant with learned barycenter graphs.
- **Key Findings**: The non-parametric estimator has consistency and excess-risk guarantees. The parametric model learns both the weights and the template graphs, and performs well on a metabolic identification problem.
- **Relevance**: Input-dependent barycenter weights over learned templates, with theory for the supervised setting.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 2 / 2 / 2 = 11 (33 citations)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Supervised learning with FGW barycenters.

##### Mallery, Murphy and Aeron (2025). Synthesis and Analysis of Data as Probability Measures with Entropy-Regularized Optimal Transport.
- **Citation key**: Mallery2025Synthesis
- **Identifier**: arXiv:2501.07446 (no DOI); AISTATS 2025, PMLR 258, pp. 2584-2592 (venue from the arXiv comment and Semantic Scholar record; volume and pages from the PMLR page found by WebSearch).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Theoretical with experiments; entropic barycenters of reference measures (synthesis) and recovery of barycentric coefficients (analysis) by a convex quadratic program.
- **Key Findings**: Barycentric coefficients are estimable from samples at dimension-independent rates and are stable under Wasserstein perturbations. Used as features for classifying corrupted point clouds, they are more efficient than neural network baselines with small training sets.
- **Relevance**: Barycentric coordinates relative to fixed references as fixed-length features of unaligned point clouds.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (reference measures), via entropic transport.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 1 / 2 = 11 (3 citations)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Barycentric features for supervised prediction from point clouds.

##### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Citation key**: Mazelet2026Learning
- **Identifier**: arXiv:2605.20883 (preprint; no peer-reviewed version found by Semantic Scholar or Crossref lookup)
- **Type**: Preprint
- **Evidence type**: arXiv preprint
- **Method**: Methodological; FGW-based dictionary learning on fMRI graphs with different geometries; amortized network predicting approximate transport plans; atoms conditioned on the FGW trade-off parameter; HCP data.
- **Key Findings**: The method learns dictionaries without projecting each individual geometry onto a common template, which the abstract says removes subject-specific information. On HCP it captures different levels of geometric variability and gives representations that preserve essential information.
- **Relevance**: Template dictionaries applied directly to unaligned individual brains.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (FGW dictionary atoms), with predicted transport plans.
- **Pipeline relation**: removes projection onto a common anatomical template.
- **Quick-assessment score**: 1 / 2 / 3 / 1 / 3 = 10 (0 citations)
- **Quality**: Medium. Read: abstract and arXiv record. Preprint.
- **Potential Use**: Recent registration-free template learning in fMRI.

#### Sub-theme 4: Transport-based set embeddings and supervised transport prediction

##### Wang, Slepcev, Basu, Ozolek and Rohde (2013). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Citation key**: Wang2013Linear
- **Identifier**: DOI 10.1007/s11263-012-0566-z
- **Type**: Journal article (International Journal of Computer Vision 101(2), 254-269; online 2012, print 2013 per Crossref)
- **Evidence type**: journal
- **Method**: Methodological; linear optimal transportation (LOT), a linearized Kantorovich-Wasserstein distance computed through transport to a reference, giving an isometric linear embedding.
- **Key Findings**: LOT computes all pairwise distances in a large image database efficiently and gives a linear embedding for visualizing discriminant information. Applications include nuclear chromatin patterns in cancer cells, facial expressions, galaxy morphologies and subcellular protein distributions.
- **Relevance**: The reference-based embedding that turns unaligned measures into vectors, used by later transport-based morphometry.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference), with a transport coupling from each image to the reference.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 3 / 3 / 2 / 3 / 2 = 13 (227 citations; cited by 4 of 5 Layer 2 reference lists)
- **Quality**: High. Read: abstract (Semantic Scholar record).
- **Potential Use**: Foundational LOT embedding.

##### Mialon, Chen, d'Aspremont and Mairal (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Citation key**: Mialon2021Trainable
- **Identifier**: arXiv:2006.12065 (no DOI); ICLR 2021 per the arXiv comment field and the ICLR 2021 poster page found by WebSearch.
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological; fixed-size embedding of a feature set by aggregating elements according to the transport plan to a trainable reference; end-to-end or unsupervised training.
- **Key Findings**: The aggregation can be read as an attention-like layer or as a scalable surrogate of a transport kernel. It reaches state-of-the-art results on protein fold recognition and chromatin profile detection, per the abstract.
- **Relevance**: A trainable-reference transport pooling layer for variable-size unordered sets.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (trainable reference) with a transport coupling.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 2 = 12 (Semantic Scholar returned 0 citing records for this ID, judged an indexing gap; item scored at the median)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Trainable transport pooling for sets.

##### Kolouri, Naderializadeh, Rohde and Hoffmann (2021). Wasserstein Embedding for Graph Learning.
- **Citation key**: Kolouri2021Wasserstein
- **Identifier**: arXiv:2006.09430 (no DOI); ICLR 2021 per the arXiv comment field.
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological; graphs as distributions of node embeddings; Monge maps from a reference distribution give a fixed-size vector; graph-property prediction benchmarks.
- **Key Findings**: The embedding avoids pairwise distance computation, reducing complexity from quadratic to linear in the number of graphs. It reports state-of-the-art classification with high computational efficiency.
- **Relevance**: LOT-style reference embedding used for graph-level supervised prediction.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (reference distribution) with transport maps.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 2 = 12 (102 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Reference-based transport embedding for set-level prediction.

##### Moosmuller and Cloninger (2023). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Citation key**: Moosmuller2023Linear
- **Identifier**: DOI 10.1093/imaiai/iaac023; arXiv:2008.09165
- **Type**: Journal article (Information and Inference: A Journal of the IMA 12(1), 363-389; online 2022, print 2023 per Crossref)
- **Evidence type**: journal
- **Method**: Theoretical with experiments; conditions under which LOT gives linear separability and near-isometry to Wasserstein-2.
- **Key Findings**: LOT embeds families generated by shifts and scalings of a fixed distribution into a linearly separable space in arbitrary dimension. Under stated conditions, LOT distances are nearly isometric to Wasserstein-2, so N transport maps give N squared pairwise distances.
- **Relevance**: Theory for when a reference-based transport embedding supports linear prediction.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference) with transport maps.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 2 = 12 (59 citing records in Layer 3)
- **Quality**: High. Read: abstract (Crossref record and arXiv record).
- **Potential Use**: Guarantees for LOT-based classification.

##### Bai, Medri, Diaz Martin, Khan and Kolouri (2023). Linear Optimal Partial Transport Embedding.
- **Citation key**: Bai2023Linear
- **Identifier**: arXiv:2302.03232 (no DOI); ICML 2023, PMLR 202, pp. 1492-1520 (Semantic Scholar record and PMLR page found by WebSearch).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological; linearization of optimal partial transport into an embedding for positive measures.
- **Key Findings**: The LOPT embedding gives faster computation of partial transport distances between pairs of positive measures. It is demonstrated on point-cloud interpolation and PCA.
- **Relevance**: Reference embedding for sets of unequal mass, the case of lesion sets.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (reference) with partial transport, so mass can be left unmatched.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 1 / 1 = 10 (13 citations)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Unequal-mass transport embedding.

##### Shifat-E-Rabbi, Pathan, Li, Zhuang, Rubaiyat and Rohde (2025). Linear Optimal Transport Subspaces for Point Set Classification.
- **Citation key**: ShifatERabbi2025Linear
- **Identifier**: DOI 10.1007/s10851-025-01261-x; arXiv:2403.10015
- **Type**: Journal article (Journal of Mathematical Imaging and Vision 67(4))
- **Evidence type**: journal
- **Method**: Methodological; LOT transform of point sets and a nearest-subspace classifier in LOT space; emphasis on affine deformations.
- **Key Findings**: The LOT transform yields a convex data space that simplifies classification of deformed point sets. The method is label efficient, non-iterative, needs no hyper-parameter tuning, is competitive with state-of-the-art methods, and is robust when train and test deformation magnitudes differ.
- **Relevance**: Supervised point-set classification from a transport embedding, with deformation robustness.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference) with transport maps.
- **Pipeline relation**: not applicable.
- **Quick-assessment score**: 2 / 3 / 3 / 1 / 2 = 11 (0 citations)
- **Quality**: Medium. Read: abstract (arXiv and Semantic Scholar records of the preprint version).
- **Potential Use**: Transport-embedding point-set classification.

##### Wang, Ke, Bhaskar, Krishnaswamy and Cloninger (2025). Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data.
- **Citation key**: Wang2025Linearized
- **Identifier**: arXiv:2510.22033 (preprint; Semantic Scholar lists no other venue)
- **Type**: Preprint
- **Evidence type**: arXiv preprint
- **Method**: Methodological with applications; LOT embedding of each patient's single-cell point cloud into a fixed-dimensional space; classification and synthetic data generation.
- **Key Findings**: Each patient is an irregular point cloud; LOT embeds it into a Euclidean space preserving transport geometry and forms a registration between any two patients. LOT gives interpretable classification of COVID-19 patient states, with classifier weights mapping back to markers and regions, and LOT barycenters give averaged profiles for organoid data.
- **Relevance**: Subject-level prediction from one unaligned point cloud per subject.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (reference) with transport maps; the abstract states the embedding forms a registration between patients.
- **Pipeline relation**: not applicable (single-cell, not imaging).
- **Quick-assessment score**: 1 / 2 / 3 / 1 / 3 = 10 (0 citations)
- **Quality**: Medium. Read: abstract and arXiv record. Preprint.
- **Potential Use**: Subject-level supervised prediction from point clouds via LOT.

#### Sub-theme 5: Registration-free transport in medical imaging and neuroimaging

##### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Citation key**: Gramfort2015Fast
- **Identifier**: DOI 10.1007/978-3-319-19992-4_20; arXiv:1503.08596
- **Type**: Conference paper (Information Processing in Medical Imaging, Lecture Notes in Computer Science, pp. 261-272)
- **Evidence type**: proceedings
- **Method**: Algorithmic with neuroimaging evaluation; Kantorovich means of non-normalized data linked to entropic Wasserstein barycenters; fMRI and MEG source estimates on voxel grids and cortical triangulations.
- **Key Findings**: Between-subject variability gives spatially non-overlapping effects, usually handled by smoothing before linear averaging. The transport average is a smooth convex problem with strong convergence guarantees and is demonstrated on fMRI and MEG data.
- **Relevance**: Early group template for unaligned brain activation maps built by transport.
- **Stance**: supports (smoothing plus linear averaging is replaced by an explicit transport average).
- **Correspondence handling**: learned template or barycenter.
- **Pipeline relation**: replaces spatial smoothing before group averaging; builds on data already defined on a common voxel grid or cortical mesh.
- **Quick-assessment score**: 2 / 3 / 3 / 2 / 3 = 13 (Semantic Scholar did not resolve this DOI)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Transport templates for neuroimaging populations.

##### Kundu, Kolouri, Erickson, Kramer, McAuley and Rohde (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry.
- **Citation key**: Kundu2018Discovery
- **Identifier**: DOI 10.1016/j.neuroimage.2017.11.006; arXiv:1705.04919
- **Type**: Journal article (NeuroImage 167, 256-275)
- **Evidence type**: journal
- **Method**: Methodological with cohort validation; transport-based morphometry (TBM) maps brain images losslessly to a transport domain; linear discrimination, regression and blind source separation; healthy older adults.
- **Key Findings**: Pre-specified features such as thalamic volume or cortical thickness, and deformation-based methods, can miss diffuse changes. In the transport domain even linear models discover aging-related changes and point to mechanisms linking aerobic fitness to brain health, and the inverse transform visualizes the discriminating tissue shifts.
- **Relevance**: Subject-level prediction and regression from MRI via transport to a reference, with visualization in image space.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference image) with a transport map per subject.
- **Pipeline relation**: replaces pre-specified anatomical features and deformation-based morphometry.
- **Quick-assessment score**: 3 / 3 / 3 / 2 / 2 = 13 (29 citations)
- **Quality**: High. Read: abstract (arXiv record).
- **Potential Use**: Transport-based subject-level prediction in neuroimaging.

##### Gerber, Niethammer, Styner and Aylward (2018). Exploratory Population Analysis with Unbalanced Optimal Transport.
- **Citation key**: Gerber2018Exploratory
- **Identifier**: DOI 10.1007/978-3-030-00931-1_53
- **Type**: Conference paper (MICCAI 2018, Lecture Notes in Computer Science 11072, 464-472)
- **Evidence type**: proceedings
- **Method**: Methodological with cohort evaluation; unbalanced transport morphometry separating changes in mass from changes in location; voxelwise correlation with clinical variables; OASIS white and gray matter segmentations.
- **Key Findings**: The method produces per-subject images of mass allocation and transport cost. On OASIS it recovers dementia-related changes not found by voxel-based morphometry and increases the explanatory power of regression on clinical variables.
- **Relevance**: Subject-level regression with transport that allows mass creation and destruction.
- **Stance**: supports.
- **Correspondence handling**: transport coupling (unbalanced).
- **Pipeline relation**: builds on tissue segmentation; replaces voxel-based morphometry.
- **Quick-assessment score**: 2 / 2 / 3 / 1 / 2 = 10 (6 citations)
- **Quality**: Medium. Read: abstract (PubMed).
- **Potential Use**: Unbalanced transport morphometry for clinical regression.

##### Shen, Feydy, Liu, Curiale, San Jose Estepar, San Jose Estepar and Niethammer (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
- **Citation key**: Shen2021Accurate
- **Identifier**: arXiv:2111.00648 (no DOI); Advances in Neural Information Processing Systems 34, pp. 5373-5389 (Semantic Scholar record; arXiv comment states acceptance at NeurIPS 2021).
- **Type**: Conference paper
- **Evidence type**: proceedings
- **Method**: Methodological with benchmarks; robust OT solvers in optimization-based and learned point cloud registration; rigid partial shapes, KITTI scene flow, lung vascular trees; new PVT1010 dataset.
- **Key Findings**: Robust OT improves both optimization-based and deep registration at affordable cost. It reaches state-of-the-art results on KITTI and on lung vessel registration between inspiration and expiration, and the paper releases 1,010 pairs of lung vascular trees.
- **Relevance**: Transport used in place of a deformable image registration for medical point sets.
- **Stance**: supports.
- **Correspondence handling**: transport coupling (robust OT) as pre-alignment and fine-tuning for registration.
- **Pipeline relation**: replaces or initializes deformable registration of lung vessel trees.
- **Quick-assessment score**: 2 / 3 / 2 / 2 / 3 = 12 (81 citations)
- **Quality**: High. Read: abstract and arXiv record.
- **Potential Use**: Transport replacing deformable registration of medical point sets.

##### Kundu, Sair, Sherr, Mukherjee and Rohde (2024). Discovering the gene-brain-behavior link in autism via generative machine learning.
- **Citation key**: Kundu2024Discovering
- **Identifier**: DOI 10.1126/sciadv.adl5307
- **Type**: Journal article (Science Advances 10(24), eadl5307)
- **Evidence type**: journal
- **Method**: Cohort study with 3D transport-based morphometry; Simons Variation in Individuals Project data; prediction of 16p11.2 copy number variation from brain images.
- **Key Findings**: 3D TBM identifies two endophenotypes linked to 16p11.2 CNV and predicts the CNV from brain images with 89 to 95% test accuracy. TBM visualizes dose-dependent brain changes, which relate to articulation disorders and part of IQ variability.
- **Relevance**: Subject-level prediction from MRI via transport to a reference, recent and peer-reviewed.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference) with a transport map per subject.
- **Pipeline relation**: the abstract does not state which registration or segmentation steps precede TBM.
- **Quick-assessment score**: 3 / 3 / 3 / 2 / 3 = 14 (20 citations)
- **Quality**: High. Read: abstract (PubMed).
- **Potential Use**: Recent clinical evidence for transport-based subject-level prediction.

##### Ironside, El Naamani, Rizvi, El-Rabbi, Kundu, Becceril-Gaitan, Pas, Snyder, Chen, Langefeld, Woo, Mayer, Connolly and Rohde (2025). Predictive modeling of hematoma expansion from non-contrast computed tomography in spontaneous intracerebral hemorrhage patients.
- **Citation key**: Ironside2025Predictive
- **Identifier**: DOI 10.7554/eLife.105782 (updates medRxiv 10.1101/2024.05.14.24307384)
- **Type**: Journal article (eLife 14, RP105782)
- **Evidence type**: journal
- **Method**: Cohort study; TBM representation of each presentation NCCT hematoma image; derivation on 170 VISTA-ICH patients, test on 170 ERICH patients; multivariable model with morphological, spatial and clinical information.
- **Key Findings**: TBM identified larger size, density heterogeneity, shape irregularity and peripheral density distribution as features of expansion. The multivariable model reached AUROC 0.71 for 24-hour expansion on the test set, outperforming clinician protocols and alternative machine-learning methods.
- **Relevance**: Subject-level outcome prediction from a single lesion (hematoma) via transport, with external test cohort.
- **Stance**: supports.
- **Correspondence handling**: learned template or barycenter (fixed reference) with a transport map per hematoma image.
- **Pipeline relation**: operates on hematoma images; the abstract does not state how the hematoma is delineated. Compared against clinician-defined features, which a radiomics pipeline would also compute.
- **Quick-assessment score**: 3 / 3 / 3 / 1 / 3 = 13 (0 citations)
- **Quality**: High. Read: abstract (PubMed).
- **Potential Use**: Transport-based lesion-level prediction with external test.

##### Gong, Luo, Mao, Gong, Lu, Ding and Zhu (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence.
- **Citation key**: Gong2026Robust
- **Identifier**: DOI 10.3389/fonc.2025.1700447
- **Type**: Journal article (Frontiers in Oncology 15, 1700447; issued 2026-01-29 per Crossref)
- **Evidence type**: journal
- **Method**: Retrospective single-centre cohort (300 men; 250 development with 5-fold cross-validation, 50 temporal test); CMOT-Fusion: twin encoders on 3D patches of unregistered T2WI and ADC, a learned cost network, balanced entropic OT solved by a stabilized Sinkhorn with fixed iterations, fusion by barycentric projection, MLP classification head.
- **Key Findings**: CMOT-Fusion reached mean AUC 0.849 in cross-validation and ensemble AUC 0.824 on the temporal test set, against 0.839 for PI-RADS v2.1 on the same cohort. The authors state the findings are exploratory given the single-centre design and small test cohort.
- **Relevance**: Transport coupling learned end to end to fuse misaligned sequences for a subject-level outcome.
- **Stance**: supports (the abstract states conventional fusion requires registration and replaces it with a learned transport correspondence).
- **Correspondence handling**: transport coupling between patch embeddings of the two sequences, with a learned cost.
- **Pipeline relation**: removes the inter-sequence registration step.
- **Quick-assessment score**: 2 / 2 / 3 / 1 / 2 = 10 (1 citation)
- **Quality**: Medium. Read: abstract (PubMed) and Methods section 2.5 of the PMC full text.
- **Potential Use**: Registration-free transport fusion for clinical prediction.

##### Qahqaie, Neumann, Heimann, Maier and Zimmer (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
- **Citation key**: Qahqaie2026Unbalanced
- **Identifier**: DOI 10.1109/isbi61048.2026.11516053; arXiv:2602.09933
- **Type**: Conference paper (2026 IEEE 23rd International Symposium on Biomedical Imaging, pp. 1-4)
- **Evidence type**: proceedings
- **Method**: Methodological with clinical data; unbalanced OT matcher for lesions in longitudinal CT, cost combining size-normalized geometry, registration trust from the deformation-field Jacobian and optional appearance; plan sparsified by relative pruning.
- **Key Findings**: The matcher accommodates unequal lesion mass and tumour-load changes and yields one-to-one, new, disappearing, merging and splitting lesions without retraining. On longitudinal CT it gives higher edge-detection precision and recall, lesion-state recall and lesion-graph F1 than distance-only baselines.
- **Relevance**: Transport between lesion sets of unequal mass, the setting of the RQ, though for within-patient matching rather than outcome prediction.
- **Stance**: supports.
- **Correspondence handling**: transport coupling (unbalanced) between lesion sets.
- **Pipeline relation**: builds on lesion segmentation and on a deformable registration, whose Jacobian enters the cost.
- **Quick-assessment score**: 2 / 2 / 3 / 1 / 2 = 10 (1 citation)
- **Quality**: Medium. Read: abstract and arXiv record.
- **Potential Use**: Transport between lesion sets.

### Theme C: set encoders, point clouds and multiple-instance learning

Theme note: Quick-assessment scores follow the agent's five 1-3 items: journal ranking (JR), methodological rigor (MR), relevance to RQ (RR), citation count (CC), data/evidence quality (DE). JR, MR, RR and DE are judgments made by reading. JR uses 3 for a journal judged Q1/Q2 and 2 for a well-known conference; quartiles were not checked against a ranking database, because none was reachable in this run. CC uses the Semantic Scholar citation count retrieved in this run (`/paper/batch` or search output), compared by judgment with same-age literature. Total 12 or more is High, 8 to 11 is Medium.

#### C1. Theory of invariant set functions

##### Zaheer, M., Kottur, S., Ravanbakhsh, S., Poczos, B., Salakhutdinov, R., Smola, A. (2017). Deep Sets.
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

##### Wagstaff, E., Fuchs, F. B., Engelcke, M., Posner, I., Osborne, M. A. (2019). On the Limitations of Representing Functions on Sets.
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

##### Wagstaff, E., Fuchs, F. B., Engelcke, M., Osborne, M. A., Posner, I. (2022). Universal Approximation of Functions on Sets.
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

##### Amir, T., Gortler, S. J., Avni, I., Ravina, R., Dym, N. (2023). Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem.
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

##### Wang, P., Yang, S., Li, S., Wang, Z., Li, P. (2024). Polynomial Width is Sufficient for Set Representation with High-dimensional Features.
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

#### C2. Attention-based and learned-seed set pooling

##### Lee, J., Lee, Y., Kim, J., Kosiorek, A. R., Choi, S., Teh, Y. W. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
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

#### C3. Point-cloud networks

##### Qi, C. R., Su, H., Mo, K., Guibas, L. J. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
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

##### Qi, C. R., Yi, L., Su, H., Guibas, L. J. (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
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

##### Wang, Y., Sun, Y., Liu, Z., Sarma, S. E., Bronstein, M. M., Solomon, J. M. (2019). Dynamic Graph CNN for Learning on Point Clouds.
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

##### Zhao, H., Jiang, L., Jia, J., Torr, P., Koltun, V. (2021). Point Transformer.
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

#### C4. Multiple-instance learning

##### Ilse, M., Tomczak, J. M., Welling, M. (2018). Attention-based Deep Multiple Instance Learning.
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

##### Campanella, G., Hanna, M. G., Geneslaw, L., Miraflor, A., Werneck Krauss Silva, V., Busam, K. J., Brogi, E., Reuter, V. E., Klimstra, D. S., Fuchs, T. J. (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
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

##### Lu, M. Y., Williamson, D. F. K., Chen, T. Y., Chen, R. J., Barbieri, M., Mahmood, F. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
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

##### Shao, Z., Bian, H., Chen, Y., Wang, Y., Zhang, J., Ji, X., Zhang, Y. (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
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

#### C5. Set and point-cloud encoders on medical data

##### Chen, J., Zeng, H., Zhang, C., Shi, Z., Dekker, A., Wee, L., Bermejo, I. (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics.
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

##### Yang, J., Deng, H., Huang, X., Ni, B., Xu, Y. (2020). Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers.
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

##### Chen, J., Cheung, H. M. C., Milot, L., Martel, A. L. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper
- **Evidence type**: proceedings (MICCAI 2021, LNCS, pp. 752-761, DOI 10.1007/978-3-030-87240-3_72 resolved via Crossref); arXiv:2012.06875
- **Method**: autoencoder jointly trained with a multiple instance network that aggregates radiomic features of all lesions of a patient; two-step feature normalisation; 108 colorectal liver metastases patients, of whom 50 multifocal (2 to 17 lesions, 181 lesions); 3-year survival.
- **Key Findings**: AMINN reached AUC 0.70, 11.4% above the best baseline (LASSO logistic regression on the largest tumour); a unifocal AMINN using only the largest tumour performed like the baselines. In the full text, average pooling gave the best result and attention pooling did not outperform the other pooling functions, which the authors attribute to limited data.
- **Relevance**: Lesion-set prediction of a patient outcome, with a direct comparison of invariant pooling functions on a small cohort. Theme D records it as a direct subject-level predictor over a variable-size set of lesions with no spatial correspondence between patients.
- **Stance**: supports (using all lesions as a set improved outcome prediction over the largest-lesion convention).
- **Correspondence handling**: permutation invariance; permutation-invariant MIL pooling over lesion representations.
- **Pipeline relation**: builds on manual lesion delineation (slice by slice by a radiologist) and radiomics (pyradiomics); replaces the largest-lesion selection step; removes registration (Theme D record).
- **Quick-assessment score**: JR 2, MR 2, RR 3, CC 1 (S2: 17), DE 2; total 10. Theme D scored it J2 R2 Rel3 C2 (OpenCitations: 12) D2 = 11.
- **Quality**: Medium. Read: abstract and the Methods and Results sections of the arXiv full text.
- **Potential Use**: lesion-set pooling choice in small cohorts.
- **Citation key**: Chen2021AMINN

##### Zare, S., Vo, H. Q., Altini, N., Bevilacqua, V., Rossini, M., Pesce, F., Gesualdo, L., Turkevi-Nagy, S., Becker, J. U., Mohan, C., Van Nguyen, H. (2025). Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology.
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

##### Gutierrez-Becker, B., Wachinger, C. (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy.
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

##### Vosylius, V., Wang, A., Waters, C., Zakharov, A., Ward, F., Le Folgoc, L., Cupitt, J., Makropoulos, A., Schuh, A., Rueckert, D., Alansary, A. (2020). Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface.
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

##### Sarasua, I., Polsterl, S., Wachinger, C. (2022). Hippocampal representations for deep learning on Alzheimer's disease.
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

##### Chen, Y., Zekelman, L. R., Zhang, C., Xue, T., Song, Y., Makris, N., Rathi, Y., Golby, A. J., Cai, W., Zhang, F., O'Donnell, L. J. (2024). TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance.
- **Type**: Journal article
- **Evidence type**: journal (Medical Image Analysis 94, article 103120, DOI 10.1016/j.media.2024.103120 resolved via Crossref); arXiv:2307.03982
- **Method**: point-cloud regression from dMRI tractography with pointwise microstructure; Paired-Siamese Regression loss; Critical Region Localization; 20 association tracts from 806 Human Connectome Project Young Adult subjects; two language assessments.
- **Key Findings**: Using all points of a tract without averaging or binning along the streamline, TractGeoNet outperformed several regression models used to predict cognitive performance from neuroimaging features. The left arcuate fasciculus was the most predictive tract, and critical regions were consistent across subjects and independently trained models.
- **Relevance**: Subject-level regression from unaligned point sets, journal extension of the MICCAI 2022 study by the same group (excluded at full-text assessment in the Theme C run as the earlier conference version, recorded in theme_C_sets.md as Chen et al. 2022, White Matter Tracts are Point Clouds, DOI 10.1007/978-3-031-16431-6_17, arXiv:2207.02402).
- **Stance**: supports.
- **Correspondence handling**: permutation invariance; each tract is a point cloud with per-point features.
- **Pipeline relation**: builds on tractography and tract identification; removes the along-tract averaging or binning step of tractometry.
- **Quick-assessment score**: JR 3, MR 3, RR 3, CC 2 (S2: 17 for the arXiv record), DE 3; total 14.
- **Quality**: High. Read: abstract only (PubMed and arXiv).
- **Potential Use**: point-cloud subject-level regression in neuroimaging.
- **Citation key**: Chen2024TractGeoNet

##### Beetz, M., Banerjee, A., Li, L., Camps, J., Rodriguez, B., Grau, V. (2025). 3D cardiac shape analysis with variational point cloud autoencoders for myocardial infarction prediction and virtual heart synthesis.
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

##### Jia, J., Yu, B., Mody, P., Ninaber, M. K., Schouffoer, A. A., de Vries-Bouwstra, J. K., Kroft, L. J. M., Staring, M., Stoel, B. C. (2024). Using 3D point cloud and graph-based neural networks to improve the estimation of pulmonary function tests from chest CT.
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

##### van Dijk, R., Arevalo, J., Babadi, M., Carpenter, A. E., Singh, S. (2024). Capturing cell heterogeneity in representations of cell populations for image-based profiling using contrastive learning.
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

### Theme D: pipelines and subject-level prediction

Theme note: Quick-assessment items: J = journal ranking, R = methodological rigour, Rel = relevance to RQ, C = citation count (OpenCitations count on 2026-11-14, judged against same-age literature), D = data or evidence quality; each 1 to 3. Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly: supports = the source gives evidence that the missing correspondence affects results or that handling it explicitly helps; opposes = evidence that it can be ignored; neutral = provides a method, resource or finding without evidence either way.

#### D1. Image registration to a common space

##### Avants, Epstein, Grossman, Gee (2008). Symmetric diffeomorphic image registration with cross-correlation: evaluating automated labeling of elderly and neurodegenerative brain.
- **Type**: Journal article (Medical Image Analysis 12(1):26-41). DOI 10.1016/j.media.2007.06.004; PMID 17659998.
- **Method**: Develops symmetric image normalization (SyN), which maximizes cross-correlation within the space of diffeomorphic maps, and evaluates it against an elastic method and ITK Demons using gold-standard manual cortical labels in frontotemporal dementia and control subjects.
- **Key Findings**: SyN compared favourably with both methods, in particular when template and target brains were far apart; SyN volume measurements correlated most strongly with expert labelling of the three methods.
- **Relevance**: The reference diffeomorphic method that registration-based pipelines use to create correspondence with a template; it is also the SyN baseline in Choi2026Tumor.
- **Quality**: High. Read: PubMed abstract only. Atrophied (neurodegenerative) brains were evaluated, not focal lesions.
- **Potential Use**: Background on registration to a common space.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space; the method estimates a dense diffeomorphic map from each subject to a template.
- **Pipeline relation**: is the registration step.
- **Quick-assessment score**: J3 R2 Rel2 C3 (5514) D2 = 12.
- **Citation key**: Avants2008Symmetric

##### Brett, Leff, Rorden, Ashburner (2001). Spatial normalization of brain images with focal lesions using cost function masking.
- **Type**: Journal article (NeuroImage 14(2):486-500). DOI 10.1006/nimg.2001.0845; PMID 11467921.
- **Method**: Introduces cost function masking (excluding the lesion from the image-difference term during normalization) and evaluates it on brains with focal lesions and normal brains with simulated lesions.
- **Key Findings**: Automated normalization attempts to reduce template mismatch at the lesion site, which can cause significant inappropriate distortion, especially with nonlinear transforms; cost function masking was superior to affine-only normalization, and the authors propose it for routine use.
- **Relevance**: Documents the failure of intensity-based registration when a lesion has no counterpart in the template, which is the missing-correspondence problem in its registration form.
- **Quality**: High. Read: PubMed abstract only. Must-include (cited by three Layer 2 core papers).
- **Potential Use**: Evidence that registration is biased in lesion-bearing images.
- **Stance**: supports.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space, with the lesion masked out of the cost because it has no correspondence in the template.
- **Pipeline relation**: modifies the registration step; requires a lesion mask from the segmentation step.
- **Quick-assessment score**: J3 R2 Rel3 C3 (870) D2 = 13.
- **Citation key**: Brett2001Spatial

##### Balakrishnan, Zhao, Sabuncu, Guttag, Dalca (2019). VoxelMorph: a learning framework for deformable medical image registration.
- **Type**: Journal article (IEEE Transactions on Medical Imaging 38(8):1788-1800). DOI 10.1109/TMI.2019.2897538; PMID 30716034; arXiv 1809.05231.
- **Method**: Formulates registration as a CNN that maps an image pair to a deformation field, trained unsupervised on intensity matching objectives or with auxiliary segmentations.
- **Key Findings**: The unsupervised model's accuracy was comparable to state-of-the-art methods while running orders of magnitude faster; training with auxiliary segmentations improved accuracy at test time; the effect of training set size was evaluated.
- **Relevance**: The reference learning-based registration method; it lowers the cost of registering every subject to a common space but keeps the correspondence assumption.
- **Quality**: High. Read: PubMed abstract and arXiv abstract.
- **Potential Use**: Learning-based registration.
- **Stance**: neutral.
- **Evidence type**: journal (arXiv preprint version also recorded).
- **Correspondence handling**: registration to a common space; a learned function predicts the dense correspondence.
- **Pipeline relation**: is the registration step (learning-based form).
- **Quick-assessment score**: J3 R3 Rel2 C3 (1934) D3 = 14.
- **Citation key**: Balakrishnan2019VoxelMorph

##### Rakic, Hoopes, Abulnaga, Sabuncu, Guttag, Dalca (2026). AtlasMorph: learning conditional deformable templates for brain MRI.
- **Type**: Journal article (Medical Image Analysis 110:103893). DOI 10.1016/j.media.2025.103893; PMID 41604896; arXiv 2511.13609.
- **Method**: A machine-learning framework that uses convolutional registration networks to learn a function outputting templates conditioned on subject attributes such as age and sex, optionally with anatomical segmentation maps; the same network registers subjects to the templates.
- **Key Findings**: The method learned templates representative of populations on a compilation of 3D brain MRI datasets; annotated conditional templates gave better registration than unlabelled unconditional ones and outperformed other template construction methods.
- **Relevance**: Template construction is learned jointly with registration, which is the learned-template route to correspondence in its image-registration form.
- **Quality**: High. Read: PubMed abstract and arXiv abstract. Healthy-anatomy datasets; the abstract does not report lesions.
- **Potential Use**: Template and atlas construction; learned templates.
- **Stance**: neutral.
- **Evidence type**: journal (arXiv preprint version also recorded).
- **Correspondence handling**: learned template or barycenter; a conditional template is learned and subjects are registered to it.
- **Pipeline relation**: builds the template that the registration step maps to.
- **Quick-assessment score**: J3 R2 Rel3 C2 (0; published 2026) D3 = 13.
- **Citation key**: Rakic2026AtlasMorph

##### Juhling, Rajashekar, Cheng, Hilgetag, Forkert, Werner (2024). Spatial normalization for voxel-based lesion symptom mapping: impact of registration approaches.
- **Type**: Journal article (Frontiers in Neuroscience 18:1296357). DOI 10.3389/fnins.2024.1296357; PMID 38298911.
- **Method**: Compares affine, nonlinear, nonlinear with cost function masking, and enantiomorphic registration (ANTs) for VLSM of FLAIR lesion segmentations from 122 acute ischaemic stroke patients against 30-day modified Rankin Scale.
- **Key Findings**: Brain areas found important for mRS were largely consistent across registration approaches; the three nonlinear variants distorted the patient images, and structures such as the lateral ventricles stayed insufficiently aligned; the authors judge an additional benefit of nonlinear registration for VLSM questionable.
- **Relevance**: Measures how the registration choice propagates into a lesion-outcome analysis, and reports that nonlinear registration of lesioned brains introduces distortion.
- **Quality**: High. Read: PubMed abstract (structured, with methods and results). Single cohort.
- **Potential Use**: Evidence on registration failure in lesion-bearing brains and its downstream effect.
- **Stance**: supports.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space; four strategies for the missing lesion correspondence are compared.
- **Pipeline relation**: evaluates the registration step that VLSM builds on; uses lesion segmentations.
- **Quick-assessment score**: J2 R2 Rel3 C2 (6) D3 = 12.
- **Citation key**: Juhling2024Spatial

##### Miller, Steeby, Ortega-Marquez, Palacin, Chui, Alhadid, Sullivan, Boes, Musolino, Cohen (2025). Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging.
- **Type**: Journal article (Imaging Neuroscience 3:IMAG.a.1048). DOI 10.1162/imag.a.1048; PMID 42344990.
- **Method**: Compares FNIRT, ANTs and EasyReg, each with its default lesion compensation, for registering eleven variably distorted chronic perinatal stroke brains to a standard template, and tests "brain grafting" (inserting a healthy tissue mask in the lesion before registration).
- **Key Findings**: ANTs and EasyReg were significantly more accurate than FNIRT, but all three had marked difficulty with large lesions; brain grafting significantly improved FNIRT's lesion mask normalization; the authors still require visual inspection of every registered brain.
- **Relevance**: Recent evidence that registration to a template fails on large lesions and distorted anatomy even with lesion compensation.
- **Quality**: Medium. Read: PubMed abstract only. Eleven subjects.
- **Potential Use**: Evidence on registration failure in pathological brains.
- **Stance**: supports.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space; lesion compensation and lesion replacement are compared as ways to handle tissue with no template counterpart.
- **Pipeline relation**: evaluates the registration step; uses lesion masks.
- **Quick-assessment score**: J1 R2 Rel3 C2 (0; published December 2025) D2 = 10.
- **Citation key**: Miller2025Comparison

##### Mok, Chung (2022). Unsupervised deformable image registration with absent correspondences in pre-operative and post-recurrence brain tumor MRI scans.
- **Type**: Proceedings (MICCAI 2022, LNCS, pp. 25-35). DOI 10.1007/978-3-031-16446-0_3; arXiv 2206.03900.
- **Method**: A deep deformable registration method that jointly estimates the regions with absent correspondence and bidirectional deformation fields, using a forward-backward consistency constraint to localize resection and recurrence regions; evaluated on BraTS-Reg data.
- **Key Findings**: Most learning-based registration methods would be unable to align images with pathologies because of absent correspondences; the proposed method improved alignment over traditional and deep methods with or without cost function masking.
- **Relevance**: Treats missing correspondence as a quantity to estimate inside registration rather than a region to mask by hand.
- **Quality**: Medium. Read: arXiv abstract (the LNCS chapter text was not accessible).
- **Potential Use**: Registration of lesion-bearing images; explicit modelling of absent correspondence.
- **Stance**: supports.
- **Evidence type**: proceedings (arXiv preprint version also recorded).
- **Correspondence handling**: registration to a common space, with a learned mask of voxels that have no correspondence.
- **Pipeline relation**: modifies the registration step; removes the need for a hand-drawn lesion mask for cost function masking.
- **Quick-assessment score**: J2 R2 Rel3 C2 (24) D2 = 11.
- **Citation key**: Mok2022Unsupervised

##### Choi, Jiang, Mankuzhy, Nadkarni, Madhavan, Wu, Deasy, Thor, Rimner, Veeraraghavan (2026). Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients.
- **Type**: Journal article (Physics and Imaging in Radiation Oncology 37:100907). DOI 10.1016/j.phro.2026.100907; PMID 41631006.
- **Method**: Compares two deep inter-patient registration methods (tumour-aware TRACER and PACS, trained on 268 patients) with iterative SyN for voxel-based analysis in 240 locally advanced NSCLC patients, then predicts grade 2 or higher radiation pneumonitis with machine-learning models using clinical, dosimetric and region dose features.
- **Key Findings**: TRACER best preserved tumour volume and organ doses; TRACER-derived regions gave slightly higher pneumonitis prediction (AUC 0.78 vs 0.73 PACS and 0.71 SyN) and outperformed a mean-lung-dose model (0.78 vs 0.69, p = 0.04); the regions found were robust to the registration choice.
- **Relevance**: One of the few retrieved studies that reports the effect of tumour-aware registration on a subject-level prediction rather than on alignment accuracy alone.
- **Quality**: High. Read: PubMed abstract (structured). Single institution test cohort; the AUC differences between registration methods are not reported with a test in the abstract except the TRACER vs MLD comparison.
- **Potential Use**: Registration-based subject-level prediction in tumour-bearing images.
- **Stance**: supports.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space, conditioned on the tumour so that tumour tissue without counterpart is preserved.
- **Pipeline relation**: builds a subject-level predictor on the registration step.
- **Quick-assessment score**: J2 R2 Rel3 C2 (0; published 2026) D3 = 12.
- **Citation key**: Choi2026Tumor

#### D2. Radiomics

##### Lambin, Rios-Velazquez, Leijenaar, Carvalho, van Stiphout, Granton, Zegers, Gillies, Boellard, Dekker, Aerts (2012). Radiomics: extracting more information from medical images using advanced feature analysis.
- **Type**: Journal article, position paper (European Journal of Cancer 48(4):441-446). DOI 10.1016/j.ejca.2011.11.036; PMID 22257792.
- **Method**: Position paper defining radiomics.
- **Key Findings**: Defines radiomics as the high-throughput extraction of large amounts of image features from radiographic images, motivated by spatial and temporal tumour heterogeneity; states that the approach needs further validation in multi-centre settings.
- **Relevance**: Origin of the radiomics pipeline that summarizes each segmented region into a fixed-length feature vector.
- **Quality**: Medium. Read: PubMed abstract only. No original data.
- **Potential Use**: Background on the radiomics workflow.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; features summarize one region of interest, so no voxel correspondence across subjects is needed.
- **Pipeline relation**: is the radiomics step; builds on segmentation.
- **Quick-assessment score**: J3 R2 Rel2 C3 (5288) D1 = 11.
- **Citation key**: Lambin2012Radiomics

##### Aerts, Velazquez, Leijenaar, Parmar, Grossmann, Carvalho, Bussink, Monshouwer, Haibe-Kains, Rietveld, Hoebers, Rietbergen, Leemans, Dekker, Quackenbush, Gillies, Lambin (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Type**: Journal article (Nature Communications 5:4006). DOI 10.1038/ncomms5006; PMID 24892406.
- **Method**: Extracts 440 intensity, shape and texture features from CT of 1,019 patients with lung or head-and-neck cancer and tests their prognostic value in independent data sets, with a radiogenomic analysis.
- **Key Findings**: Many radiomic features had prognostic power in independent lung and head-and-neck data sets; a prognostic signature capturing intratumour heterogeneity was associated with gene-expression patterns.
- **Relevance**: The reference demonstration that per-tumour feature vectors predict patient outcome, which is the single-lesion form of subject-level prediction.
- **Quality**: High. Read: PubMed abstract only. Must-include (cited by three Layer 2 core papers).
- **Potential Use**: Radiomics outcome prediction.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; one tumour per patient is summarized into features.
- **Pipeline relation**: builds a subject-level predictor on the radiomics step.
- **Quick-assessment score**: J3 R3 Rel2 C3 (4328) D3 = 14.
- **Citation key**: Aerts2014Decoding

##### Gillies, Kinahan, Hricak (2016). Radiomics: images are more than pictures, they are data.
- **Type**: Journal article, review (Radiology 278(2):563-577). DOI 10.1148/radiol.2015151169; PMID 26579733.
- **Method**: Review of the radiomics process.
- **Key Findings**: Describes radiomics as conversion of images to mineable data with first-, second- and higher-order statistics, combined with other patient data for decision support, and describes its process, challenges and potential, particularly in cancer.
- **Relevance**: Describes the radiomics workflow that region-set methods either reuse (per-region features) or replace.
- **Quality**: Medium. Read: PubMed abstract only. Review without original data.
- **Potential Use**: Radiomics workflow background.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; per-region feature statistics.
- **Pipeline relation**: is the radiomics step.
- **Quick-assessment score**: J3 R2 Rel2 C3 (7347) D1 = 11.
- **Citation key**: Gillies2016Radiomics

##### van Griethuysen, Fedorov, Parmar, Hosny, Aucoin, Narayan, Beets-Tan, Fillion-Robin, Pieper, Aerts (2017). Computational radiomics system to decode the radiographic phenotype.
- **Type**: Journal article, software (Cancer Research 77(21):e104-e107). DOI 10.1158/0008-5472.CAN-17-0339; PMID 29092951.
- **Method**: Presents PyRadiomics, an open-source Python platform for extracting engineered features from medical images, usable standalone or through 3D Slicer, demonstrated on lung lesions.
- **Key Findings**: Lack of standardized algorithm definitions and image processing hampers reproducibility and comparability; PyRadiomics is offered as a reference standard and maintained resource.
- **Relevance**: The common feature extractor in radiomics pipelines, including multi-lesion studies that extract one feature vector per lesion.
- **Quality**: High. Read: PubMed abstract only.
- **Potential Use**: Radiomics feature extraction and standardization.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; per-region feature extraction.
- **Pipeline relation**: is the radiomics step (software).
- **Quick-assessment score**: J3 R2 Rel2 C3 (5632) D2 = 12.
- **Citation key**: vanGriethuysen2017Computational

##### Zwanenburg, Vallieres, Abdalah, Aerts, et al. (2020). The Image Biomarker Standardization Initiative: standardized quantitative radiomics for high-throughput image-based phenotyping.
- **Type**: Journal article (Radiology 295(2):328-338). DOI 10.1148/radiol.2020191145; PMID 32154773.
- **Method**: Three-phase consensus study: 25 teams computed features on a digital phantom, 15 teams computed 1,347 derived features on a lung cancer CT with predefined processing, and reproducibility was tested prospectively on CT, FDG PET and T1-weighted MRI of 51 soft-tissue sarcoma patients.
- **Key Findings**: Weak consensus fell from 76.8 percent of features (phase I) and 65.4 percent (phase II) at the start to 0.4 percent and 1.4 percent at the final iteration; 169 of 174 features were standardized, and most could be excellently reproduced in the validation phase (166 CT, 164 PET, 164 MRI).
- **Relevance**: Defines the standardized feature set and shows how far feature values differed between implementations before standardization.
- **Quality**: High. Read: PubMed abstract (structured).
- **Potential Use**: Radiomics standardization and reproducibility.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; per-region feature definitions.
- **Pipeline relation**: standardizes the radiomics step.
- **Quick-assessment score**: J3 R3 Rel2 C3 (3318) D3 = 14.
- **Citation key**: Zwanenburg2020Image

##### Traverso, Wee, Dekker, Gillies (2018). Repeatability and reproducibility of radiomic features: a systematic review.
- **Type**: Journal article, systematic review (International Journal of Radiation Oncology Biology Physics 102(4):1143-1158). DOI 10.1016/j.ijrobp.2018.05.053; PMID 30170872.
- **Method**: PRISMA-reported systematic review of 41 studies (from 624 records) on repeatability and reproducibility of radiomic features.
- **Key Findings**: Feature reproducibility is sensitive to acquisition settings, reconstruction, preprocessing and software; first-order features were more reproducible than shape and texture features; only 7 studies addressed every methodological step in detail.
- **Relevance**: The evidence base for the reproducibility problems of the radiomics step.
- **Quality**: High. Read: PubMed abstract (structured).
- **Potential Use**: Radiomics reproducibility problems.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; per-region features.
- **Pipeline relation**: evaluates the radiomics step.
- **Quick-assessment score**: J3 R3 Rel2 C3 (770) D2 = 13.
- **Citation key**: Traverso2018Repeatability

##### Janse, Janssen, Wolters-van der Ben, Moman, Viergever, van Diest, Gilhuijs (2026). Deep learning-based radiomics does not improve residual cancer burden prediction post-chemotherapy in LIMA breast MRI trial.
- **Type**: Journal article (European Radiology 36(2):850-862; online 2025). DOI 10.1007/s00330-025-11801-z; PMID 40770139.
- **Method**: Trains nnU-Net, Attention U-Net and a vector-quantized encoder-decoder for tumour segmentation on 105 patients, extracts bottleneck deep features, and predicts residual cancer burden with random forests; external test on 41 patients; compares with tumour volume and with volume plus subtype.
- **Key Findings**: Deep radiomics AUCs were 0.68 to 0.74 (pCR) and 0.68 to 0.79 (RCB) against 0.74 and 0.70 for the volume-only model, with no statistical difference between models; deep radiomics did not complement standard clinical predictors.
- **Relevance**: Recent comparison of deep radiomics from segmentation networks with a simple volume baseline.
- **Quality**: High. Read: PubMed abstract (structured).
- **Potential Use**: Deep radiomics as a pipeline variant; baseline strength of lesion volume.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; features are taken from one tumour per patient.
- **Pipeline relation**: builds deep radiomics on the segmentation step.
- **Quick-assessment score**: J3 R2 Rel2 C2 (2) D3 = 12.
- **Citation key**: Janse2026Deep

#### D3. Lesion and region segmentation

##### Isensee, Jaeger, Kohl, Petersen, Maier-Hein (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Type**: Journal article (Nature Methods 18(2):203-211). DOI 10.1038/s41592-020-01008-z; PMID 33288961.
- **Method**: A segmentation method that configures its preprocessing, network architecture, training and post-processing for a new task from fixed parameters, interdependent rules and empirical decisions.
- **Key Findings**: Without manual intervention, nnU-Net surpassed most existing approaches, including specialized solutions, on 23 public datasets from international segmentation competitions.
- **Relevance**: The default tool that produces the lesion and region masks from which lesion sets are built.
- **Quality**: High. Read: PubMed abstract only.
- **Potential Use**: Self-configuring segmentation.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable; segmentation is per image.
- **Pipeline relation**: is the segmentation step that provides lesion sets.
- **Quick-assessment score**: J3 R3 Rel2 C3 (7824) D3 = 14.
- **Citation key**: Isensee2021nnUNet

##### Isensee, Wald, Ulrich, Baumgartner, Roy, Maier-Hein, Jaeger (2024). nnU-Net revisited: a call for rigorous validation in 3D medical image segmentation.
- **Type**: Proceedings (MICCAI 2024, LNCS, pp. 488-498). DOI 10.1007/978-3-031-72114-4_47; arXiv 2404.09556.
- **Method**: Benchmarks CNN-, Transformer- and Mamba-based segmentation methods while avoiding inadequate baselines, insufficient datasets and neglected compute.
- **Key Findings**: Many recent claims of superiority over the U-Net baseline do not hold; the recipe for state-of-the-art performance is CNN-based U-Nets (including ResNet and ConvNeXt variants), the nnU-Net framework, and scaling to modern hardware.
- **Relevance**: Current evidence on which segmentation step to use and how to validate it.
- **Quality**: High. Read: arXiv abstract (the LNCS chapter text was not accessible).
- **Potential Use**: Segmentation benchmark and validation practice.
- **Stance**: neutral.
- **Evidence type**: proceedings (arXiv preprint version also recorded).
- **Correspondence handling**: not applicable.
- **Pipeline relation**: evaluates the segmentation step.
- **Quick-assessment score**: J2 R3 Rel2 C3 (204) D3 = 13.
- **Citation key**: Isensee2024Revisited

##### Menze, Jakab, Bauer, Kalpathy-Cramer, Farahani, et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS).
- **Type**: Journal article (IEEE Transactions on Medical Imaging 34(10):1993-2024). DOI 10.1109/TMI.2014.2377694; PMID 25494501.
- **Method**: Reports the MICCAI 2012 and 2013 BRATS challenges: twenty algorithms applied to 65 multi-contrast MR scans of glioma patients annotated by up to four raters and 65 simulated scans.
- **Key Findings**: Raters disagreed considerably (Dice 74 to 85 percent); different algorithms worked best for different sub-regions and none ranked first for all; a hierarchical majority vote of several algorithms ranked above every individual algorithm.
- **Relevance**: The founding brain tumour segmentation benchmark and evidence of rater variability in the masks that radiomics and lesion-set methods depend on.
- **Quality**: High. Read: PubMed abstract only.
- **Potential Use**: Segmentation challenges and benchmarks.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable.
- **Pipeline relation**: benchmarks the segmentation step.
- **Quick-assessment score**: J3 R3 Rel2 C3 (5504) D3 = 14.
- **Citation key**: Menze2015Multimodal

##### Carass, Roy, Jog, Cuzzocreo, Magrath, et al. (2017). Longitudinal multiple sclerosis lesion segmentation: resource and challenge.
- **Type**: Journal article (NeuroImage 148:77-102). DOI 10.1016/j.neuroimage.2016.12.064; PMID 28087490.
- **Method**: Reports the ISBI 2015 longitudinal MS lesion segmentation challenge: 82 data sets (5 training and 14 test subjects, mean 4.4 time-points) delineated by two expert raters; eleven teams and three further algorithms evaluated.
- **Key Findings**: Presents the consistency of the two raters, the performance of the submitted algorithms, a review and refinement of the evaluation metrics, and a consensus delineation; the data stay available as a benchmark.
- **Relevance**: The MS lesion segmentation benchmark from which MS lesion sets are produced.
- **Quality**: High. Read: PubMed abstract only. Small test set (14 subjects).
- **Potential Use**: Segmentation challenges (MS lesions).
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: not applicable.
- **Pipeline relation**: benchmarks the segmentation step.
- **Quick-assessment score**: J3 R2 Rel2 C3 (309) D3 = 13.
- **Citation key**: Carass2017Longitudinal

##### Baumgartner, Jaeger, Isensee, Maier-Hein (2021). nnDetection: a self-configuring method for medical object detection.
- **Type**: Proceedings (MICCAI 2021, LNCS, pp. 530-539). DOI 10.1007/978-3-030-87240-3_51; arXiv 2106.00817.
- **Method**: Applies nnU-Net's agenda to medical object detection, automating method configuration for arbitrary detection problems; evaluated on ADAM and LUNA16 and proposes 11 further detection tasks on public data.
- **Key Findings**: The self-configuring detector performed on par with or better than the state of the art on the two benchmarks without manual intervention.
- **Relevance**: Lesion detection outputs one instance per lesion, which is the form a lesion-set predictor needs.
- **Quality**: High. Read: arXiv abstract (the LNCS chapter text was not accessible).
- **Potential Use**: Lesion instance detection.
- **Stance**: neutral.
- **Evidence type**: proceedings (arXiv preprint version also recorded).
- **Correspondence handling**: not applicable.
- **Pipeline relation**: provides lesion instances (detection form of the segmentation step).
- **Quick-assessment score**: J2 R3 Rel2 C2 (92) D3 = 12.
- **Citation key**: Baumgartner2021nnDetection

##### Wynen, Gordaliza, Istasse, Stolting, Maggi, Macq, Bach Cuadra (2025). ConfLUNet: multiple sclerosis lesion instance segmentation in presence of confluent lesions.
- **Type**: Journal article (Computers in Biology and Medicine 197:110919). DOI 10.1016/j.compbiomed.2025.110919; PMID 40850174; arXiv 2505.22537.
- **Method**: Defines confluent lesion units and CLU-aware detection metrics, evaluates connected components and automated confluent splitting, and proposes an end-to-end instance segmentation network from a single FLAIR image (50 training, 13 test patients).
- **Key Findings**: Connected components consistently underestimated lesion counts and confluent splitting over-split; ConfLUNet improved panoptic quality (42.0 vs 37.5 and 36.8 percent) and lesion detection F1 (67.3 vs 61.6 and 59.9 percent).
- **Relevance**: Shows that the usual way of turning a semantic mask into a lesion set (connected components) miscounts lesions.
- **Quality**: High. Read: PubMed abstract. Small test set (13 patients).
- **Potential Use**: Lesion instance segmentation; how lesion sets are formed.
- **Stance**: neutral.
- **Evidence type**: journal (arXiv preprint version also recorded).
- **Correspondence handling**: not applicable.
- **Pipeline relation**: provides lesion instances; replaces connected-component post-processing in the segmentation step.
- **Quick-assessment score**: J3 R2 Rel3 C2 (1) D2 = 12.
- **Citation key**: Wynen2025ConfLUNet

#### D4. Subject-level prediction from lesion or region sets

Chen2021AMINN is annotated under Theme C (merged entry).

##### Prabhakar, Li, Paetzold, Loehr, Niu, Muhlau, Rueckert, Wiestler, Menze (2023). Self-pruning graph neural network for predicting inflammatory disease activity in multiple sclerosis from brain MR images.
- **Type**: Proceedings (MICCAI 2023, LNCS, pp. 226-236). DOI 10.1007/978-3-031-43993-3_22; arXiv 2308.16863.
- **Method**: A 3D segmentation network detects lesions and a self-supervised algorithm extracts their features; lesions become nodes of a patient graph connected by spatial proximity, disease activity is predicted by graph classification, and a self-pruning step selects the most critical lesions.
- **Key Findings**: AUC 0.67 vs 0.61 (one-year) and 0.66 vs 0.60 (two-year) against the existing baseline; each lesion receives an importance score.
- **Relevance**: States that variable lesion count, shape and location make whole-brain representations hard to learn, and handles this with a lesion graph.
- **Quality**: Medium. Read: arXiv abstract (the LNCS chapter text was not accessible).
- **Potential Use**: Lesion-graph prediction.
- **Stance**: supports.
- **Evidence type**: proceedings (arXiv preprint version also recorded).
- **Correspondence handling**: permutation invariance; graph classification over lesion nodes, with within-subject spatial proximity as edges.
- **Pipeline relation**: builds on lesion segmentation; removes cross-subject registration.
- **Quick-assessment score**: J2 R2 Rel3 C1 (2) D2 = 10.
- **Citation key**: Prabhakar2023Selfpruning

##### Wilk, Swierniak, d'Amico, Suwinski, Fujarewicz, Borys (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: finding a strategy of aggregating lesions.
- **Type**: Journal article (Computer Methods and Programs in Biomedicine 269:108840). DOI 10.1016/j.cmpb.2025.108840; PMID 40451095.
- **Method**: Aggregates per-lesion radiomic feature vectors into a representative vector, or aggregates per-lesion model outputs into a consolidated risk score, to predict distant metastasis in 115 NSCLC patients (60 percent regionally advanced) with PET and PET-interpolated-to-CT features, using Monte Carlo cross-validation.
- **Key Findings**: Using all lesions rather than the primary tumour alone consistently improved the c-index across survival models (0.611 to 0.632 for PET; 0.614 to 0.634 for PET_CT).
- **Relevance**: Compares feature-level and score-level aggregation over a lesion set.
- **Quality**: High. Read: PubMed abstract (structured). Modest cohort; c-index gains are small.
- **Potential Use**: Multi-lesion aggregation strategies.
- **Stance**: supports.
- **Evidence type**: journal.
- **Correspondence handling**: permutation invariance; per-lesion vectors or scores are combined by aggregation functions.
- **Pipeline relation**: builds on segmentation and radiomics; removes registration.
- **Quick-assessment score**: J3 R2 Rel3 C2 (3) D2 = 12.
- **Citation key**: Wilk2025Towards

##### Geady, Patel, Peoples, Simpson, Haibe-Kains (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review.
- **Type**: Journal article, quantitative review (BMC Cancer 25(1):538). DOI 10.1186/s12885-025-13850-5; PMID 40133834; earlier medRxiv version 10.1101/2024.07.04.24309964.
- **Method**: Identifies published methods for combining radiomic features from multiple lesions, replicates ten of them, and applies them to three datasets (16,894 lesions in 3,930 patients) with Cox models, benchmarked against total tumour volume.
- **Key Findings**: No single method consistently outperformed the others; averaging was best in colorectal liver metastases, a multi-lesion method in soft tissue sarcoma, and total tumour volume remained a strong predictor in head and neck cancer.
- **Relevance**: The only retrieved head-to-head replication of lesion aggregation methods across datasets; it states that no established method exists for combining radiomic features across lesions.
- **Quality**: High. Read: PubMed abstract (structured).
- **Potential Use**: Multi-lesion aggregation; evidence that the best aggregation depends on the setting.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: permutation invariance; the compared methods aggregate or select lesion features without spatial correspondence.
- **Pipeline relation**: builds on segmentation and radiomics; removes registration.
- **Quick-assessment score**: J2 R3 Rel3 C2 (3) D3 = 13.
- **Citation key**: Geady2025Radiomic

##### Bates, Wilson, Saygin, Dick, Sereno, Knight, Dronkers (2003). Voxel-based lesion-symptom mapping.
- **Type**: Journal article, brief communication (Nature Neuroscience 6(5):448-450). DOI 10.1038/nn1050; PMID 12704393.
- **Method**: Analyses the relation between tissue damage and behaviour voxel by voxel, as in functional neuroimaging, in 101 left-hemisphere-damaged aphasic patients tested on speech fluency and auditory comprehension.
- **Key Findings**: The fluency and comprehension maps confirmed the anticipated anterior versus posterior contrast and indicated interacting regions supporting fluency and comprehension.
- **Relevance**: The registration-based counterpart to lesion-set prediction: lesions are mapped into a common space and tested per voxel.
- **Quality**: High. Read: the abstract on the nature.com article page (preview, reached through WebFetch, which returned a summary close to the abstract wording; PubMed and Europe PMC carry no abstract). The full text and methods were not visible.
- **Potential Use**: Lesion-symptom mapping as the registration-based route.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space; per-voxel statistics require lesions to be normalized to one template.
- **Pipeline relation**: builds on registration and lesion segmentation.
- **Quick-assessment score**: J3 R2 Rel2 C3 (1403) D2 = 12.
- **Citation key**: Bates2003Voxel

##### Bowren, Bruss, Manzel, Edwards, Liu, Corbetta, Tranel, Boes (2022). Post-stroke outcomes predicted from multivariate lesion-behaviour and lesion network mapping.
- **Type**: Journal article (Brain 145(4):1338-1353). DOI 10.1093/brain/awac010; PMID 35025994.
- **Method**: Builds multivariate lesion-behaviour maps from two large focal-lesion cohorts, derives structural and functional lesion network maps from normative connectivity, and predicts 12-month cognitive and motor outcomes in an independent stroke sample from the overlap of each lesion with these maps, using a latent growth curve model.
- **Key Findings**: Each lesion-deficit mapping modality predicted a significant amount of outcome variance; structural and functional lesion network maps added variance beyond lesion-behaviour maps, functional maps being best for language and structural maps best for motor deficits.
- **Relevance**: Subject-level prediction from a lesion through maps defined in a common space; the registration-based alternative to the lesion-set methods in this sub-theme.
- **Quality**: High. Read: PubMed abstract only.
- **Potential Use**: Registration-based subject-level prediction from lesions.
- **Stance**: neutral.
- **Evidence type**: journal.
- **Correspondence handling**: registration to a common space; lesion location is compared with template-space maps.
- **Pipeline relation**: builds on registration and lesion segmentation.
- **Quick-assessment score**: J3 R3 Rel3 C3 (107) D3 = 15.
- **Citation key**: Bowren2022Poststroke

##### Fujibayashi, Sakaguchi, Ardakani, Okuno (2021). Nonlinear registration as an effective preprocessing technique for deep learning based classification of disease.
- **Type**: Proceedings (Annual International Conference of the IEEE Engineering in Medicine and Biology Society, 2021, pp. 3245-3250). DOI 10.1109/EMBC46164.2021.9631044; PMID 34891933. Crossref returned no record for this DOI; doi.org resolves it to IEEE Xplore document 9631044, and the PubMed record carries it.
- **Method**: Compares affine registration with nonlinear DARTEL registration to a template as preprocessing for deep-learning Alzheimer's disease classification from structural MRI, including noisy images.
- **Key Findings**: Accuracy with nonlinear registration was much higher than with affine registration, and DARTEL was less susceptible to noise; the authors attribute this to reduced spatial variation and less overfitting on small data sets.
- **Relevance**: Evidence that, for whole-brain inputs on small data, removing registration (or keeping only affine alignment) hurts a deep classifier.
- **Quality**: Low. Read: PubMed abstract only. The abstract reports no sample size or statistical test; whole-brain atrophy, not lesions.
- **Potential Use**: Counter-evidence on dropping registration before a deep predictor.
- **Stance**: supports (explicit nonlinear alignment improved the classifier; the source does not test a registration-free set method).
- **Evidence type**: proceedings.
- **Correspondence handling**: registration to a common space; DARTEL versus affine is compared.
- **Pipeline relation**: builds a subject-level deep predictor on the registration step.
- **Quick-assessment score**: J2 R1 Rel2 C1 (2) D2 = 8.
- **Citation key**: Fujibayashi2021Nonlinear

### Added in the merge run

#### Added in the merge run: tensor and multilinear models

##### Harshman (1970). Foundations of the PARAFAC procedure: Models and conditions for an "explanatory" multi-modal factor analysis.
- **Type**: Working paper (UCLA Working Papers in Phonetics 16:1-84, December 1970). OpenAlex record W2121739212; landing page https://www.psychology.uwo.ca/faculty/harshman/wpppfac0.pdf. No DOI exists.
- **Method**: Defines the parallel factor (PARAFAC) model for three-way data through the principle of proportional profiles, proves conditions under which the factors are unique, tests the procedure on synthetic data and applies it to formant data for 11 persons by 8 vowels.
- **Key Findings**: Pages 1 to 3, which carry the abstract, state that the three-way model determines the factors uniquely (no rotation freedom) under the stated conditions, that synthetic tests recover known factors, and that the vowel data give interpretable factors; the text relates the model to Tucker's three-mode analysis and to Carroll and Chang's work.
- **Relevance**: Origin of the PARAFAC model that PARAFAC2 (Kiers1999PARAFAC2) relaxes for an unaligned mode; it is the uniqueness property that the unaligned-mode decompositions in Theme A depend on.
- **Stance**: Neutral (foundational; all slabs share the same row and column index).
- **Evidence type**: Working paper (grey literature, foundational).
- **Correspondence handling**: Assumes alignment: every slab of the three-way array is indexed by the same variables and the same objects.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J1 R2 Rel1 C3 (OpenAlex: 2255) D2 = 9.
- **Quality**: Medium. Read: pages 1 to 3 of the author-site copy, including the abstract; the rest of the 84 pages was not read. Limitation: not peer reviewed; included as a foundational work under the more-than-100-citation rule.
- **Potential Use**: Background on the PARAFAC model and its uniqueness.
- **Citation key**: Harshman1970Foundations

##### Tripathi, Suvon, Schobs, Zhou, Alabed, Swift and Lu (2023). Tensor-based multimodal learning for prediction of pulmonary arterial wedge pressure from cardiac MRI.
- **Type**: Conference paper (MICCAI 2023, LNCS, pp. 206-215). DOI 10.1007/978-3-031-43990-2_20; arXiv:2303.07540.
- **Method**: A tensor learning pipeline extracts spatial and temporal features from short-axis and four-chamber cardiac MRI, uses an epistemic-uncertainty binning step to flag poor-quality training samples, and fuses the imaging features with electronic health records; 1346 subjects with right heart catheterization.
- **Key Findings**: The abstract reports an improvement over the clinical baseline of 0.10 in AUC, 0.06 in accuracy and 0.39 in MCC, and a decision-curve analysis supporting clinical utility.
- **Relevance**: A recent subject-level medical predictor built on multilinear features of images in a standard view; it is the closest proceedings example of tensor learning for imaging prediction found in the merge-run proceedings queries.
- **Stance**: Neutral (the abstract does not discuss correspondence between subjects).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Assumes alignment: the tensor features are taken from scans acquired in standard views; the abstract does not state a registration step.
- **Pipeline relation**: Not determinable from the abstract.
- **Quick-assessment score**: J2 R2 Rel2 C1 (S2: 7) D3 = 10.
- **Quality**: Medium. Read: abstract (Semantic Scholar record) and Crossref record.
- **Potential Use**: Example of multilinear features for subject-level prediction from medical images.
- **Citation key**: Tripathi2023Tensor

##### Adeli, Meng, Li, Lin and Shen (2017). Joint sparse and low-rank regularized multi-task multi-linear regression for prediction of infant brain development with incomplete data.
- **Type**: Conference paper (MICCAI 2017, LNCS 10433, pp. 40-48). DOI 10.1007/978-3-319-66182-7_5; PMID 30159549.
- **Method**: Multilinear regression from imaging measures at earlier time points to several development scores at a later time point, with a joint l1 and low-rank penalty on the weight tensor; time points may be missing for some subjects; imaging features are built with a bag-of-words model.
- **Key Findings**: The abstract reports that development scores at four years can be predicted from imaging data acquired as early as two years of age.
- **Relevance**: A supervised multilinear model in neuroimaging whose time mode is incomplete; its imaging features are bag-of-words summaries, so the spatial mode is reduced before the tensor model is fitted.
- **Stance**: Neutral (handles missing time points; does not discuss spatial correspondence).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Assumes alignment: the time and task modes are shared; the bag-of-words features summarize each image without a voxel index.
- **Pipeline relation**: Not determinable from the abstract.
- **Quick-assessment score**: J2 R2 Rel2 C1 (S2: 4) D2 = 9.
- **Quality**: Medium. Read: abstract (Semantic Scholar and PubMed records).
- **Potential Use**: Multilinear regression with an incomplete mode in neuroimaging.
- **Citation key**: Adeli2017Joint

#### Added in the merge run: optimal transport, templates and transport-based prediction

##### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein averaging of kernel and distance matrices.
- **Type**: Conference paper (Proceedings of the 33rd International Conference on Machine Learning, PMLR 48, pp. 2664-2672). Proceedings page https://proceedings.mlr.press/v48/peyre16.html; no DOI or arXiv ID.
- **Method**: Defines Gromov-Wasserstein barycenters of distance or kernel matrices that need not have the same size or a row correspondence, and computes them with an entropic GW (softassign) scheme; applications to shape barycenters and to prediction of molecular energy levels.
- **Key Findings**: The abstract states that the entropic GW scheme computes a Frechet mean of similarity matrices without a known correspondence, that it handles matrices of different sizes, and that it is applied to shape interpolation and to a regression task on molecules.
- **Relevance**: The first GW barycenter, on which the GW template and dictionary layers in Theme B (VincentCuaz2021Online, VincentCuaz2022Template) build.
- **Stance**: Supports (the method is built to average structured objects without correspondence).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Learned template or barycenter, with a GW transport coupling from each input to the barycenter.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J2 R3 Rel3 C3 (S2: 564) D2 = 13.
- **Quality**: High. Read: abstract on the PMLR proceedings page.
- **Potential Use**: Foundational reference for GW barycenters and templates.
- **Citation key**: Peyre2016Gromov

##### Peyre and Cuturi (2019). Computational optimal transport.
- **Type**: Journal monograph (Foundations and Trends in Machine Learning 11(5-6):355-607). DOI 10.1561/2200000073; arXiv:1803.00567.
- **Method**: Survey of optimal transport with a bias toward numerical methods and their applications in data science.
- **Key Findings**: The abstract states that approximate solvers have made transport usable at the sizes and dimensions of data science, and that the book reviews these solvers and the theoretical properties that make transport useful for imaging, graphics and machine learning.
- **Relevance**: The standard reference for entropic, unbalanced and GW transport cited by the core transport sources; included as a survey under the merge-run survey rule.
- **Stance**: Neutral (survey).
- **Evidence type**: Journal (survey).
- **Correspondence handling**: Transport coupling (survey of transport plans as soft correspondences).
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J3 R2 Rel2 C3 (S2: 3069) D1 = 11.
- **Quality**: Medium. Read: abstract only. Limitation: survey, no primary evidence.
- **Potential Use**: Background reference for transport definitions and solvers.
- **Citation key**: Peyre2019Computational

##### Luise, Rudi, Pontil and Ciliberto (2018). Differential properties of Sinkhorn approximation for learning with Wasserstein distance.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 31, pp. 5864-5874 per the Semantic Scholar record). arXiv:1805.11897; proceedings page https://papers.nips.cc/paper_files/paper/2018/hash/3fc2c60b5782f641f76bcefc39fb2392-Abstract.html.
- **Method**: Theory and algorithm: characterizes the smoothness of the sharp Sinkhorn approximation of the Wasserstein distance and gives an algorithm for its gradient.
- **Key Findings**: The abstract states that the sharp Sinkhorn approximation is as smooth as the regularized version, that high-order smoothness gives statistical guarantees for learning with Wasserstein losses, and that the gradient formula allows learning and optimization problems to be solved efficiently.
- **Relevance**: Gradients through Sinkhorn are needed for any transport layer trained end to end inside a predictor.
- **Stance**: Neutral (a computational tool).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J2 R3 Rel2 C2 (S2: 151) D1 = 10.
- **Quality**: Medium. Read: abstract (arXiv record). Limitation: experiments described in the abstract as preliminary.
- **Potential Use**: Method reference for differentiating through Sinkhorn.
- **Citation key**: Luise2018Differential

##### Feydy, Roussillon, Trouve and Gori (2019). Fast and scalable optimal transport for brain tractograms.
- **Type**: Conference paper (MICCAI 2019, LNCS, pp. 636-644). DOI 10.1007/978-3-030-32248-9_71; arXiv:2107.02010.
- **Method**: Multiscale GPU solver for regularized transport based on Sinkhorn divergences with a linear memory footprint; applied to tractograms as fibre bundles or track density maps.
- **Key Findings**: The abstract states that transport plans between millions of points are computed in minutes, that the smooth assignments transfer labels for atlas-based tractogram segmentation, that the blur and reach parameters can be set from anatomical knowledge, and that a probabilistic atlas of track density maps is estimated as a Wasserstein barycenter.
- **Relevance**: A transport coupling between unregistered point sets in neuroimaging at realistic size, and a Wasserstein barycenter used as a population template.
- **Stance**: Supports (transport couplings are used in place of point correspondences).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling for label transfer, and learned template or barycenter for the atlas.
- **Pipeline relation**: Builds on tractography; replaces point-wise correspondence in atlas-based tract labelling; no subject-level prediction.
- **Quick-assessment score**: J2 R2 Rel2 C2 (S2: 37) D2 = 10.
- **Quality**: Medium. Read: abstract (arXiv record). Limitation: no subject-level outcome.
- **Potential Use**: Scalable transport solver and barycenter template for neuroimaging point sets.
- **Citation key**: Feydy2019Fast

##### Beier, Beinert and Steidl (2022). On a linear Gromov-Wasserstein distance.
- **Type**: Journal article (IEEE Transactions on Image Processing 31:7292-7305). DOI 10.1109/TIP.2022.3221286; arXiv:2112.11964.
- **Method**: Defines linear GW distances through a generalized linear optimal transport model based on barycentric projection maps of transport plans to a reference.
- **Key Findings**: The abstract reports numerical examples in which linear GW distances, like LOT, replace the pairwise GW computation in applications such as shape classification.
- **Relevance**: Gives a fixed-reference embedding for objects compared up to isometry, so that each subject needs one GW problem against a reference instead of one per pair.
- **Stance**: Supports (the embedding needs no correspondence between inputs).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter (fixed reference), with a GW transport coupling from each input.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J3 R3 Rel2 C2 (S2: 42) D1 = 11.
- **Quality**: Medium. Read: abstract (arXiv record).
- **Potential Use**: Linear GW embedding as a fixed-length subject representation.
- **Citation key**: Beier2022Linear

##### Kundu, Ashinsky, Bouhrara, Dam, Demehri, Shifat-E-Rabbi, Spencer, Urish and Rohde (2020). Enabling early detection of osteoarthritis from presymptomatic cartilage texture maps via transport-based learning.
- **Type**: Journal article (Proceedings of the National Academy of Sciences 117(40):24709-24719). DOI 10.1073/pnas.1917405117; PMID 32958644.
- **Method**: Transport-based morphometry combined with statistical pattern recognition on baseline cartilage texture maps from 86 healthy individuals of the Osteoarthritis Initiative, a subset of whom progressed to symptomatic osteoarthritis within 3 years.
- **Key Findings**: The classifier reached a test accuracy of 78 percent in detecting future symptomatic progression 3 years before symptoms; because the method is generative, the predictive cartilage phenotype is visualized, and the authors report early biochemical patterns of fissuring.
- **Relevance**: Subject-level prediction from transport maps to a reference, with a visualizable discriminant, in a small cohort.
- **Stance**: Supports (transport-based features carry the predictive signal).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter (fixed reference) with a transport map per subject.
- **Pipeline relation**: Builds on cartilage texture maps; the abstract does not state the segmentation or registration steps.
- **Quick-assessment score**: J3 R2 Rel3 C2 (S2: 55) D2 = 12.
- **Quality**: High. Read: abstract and significance statement (Semantic Scholar record). Limitation: 86 individuals, single data source.
- **Potential Use**: Example of transport-based morphometry for subject-level prediction.
- **Citation key**: Kundu2020Enabling

##### Diaz Martin, Medri and Murphy (2026). Gromov-Wasserstein barycenters: The analysis problem.
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science 8(3):887-919). DOI 10.1137/25m1777116.
- **Method**: Estimates the barycentric coordinates of a distance or edge-weight matrix with respect to a finite set of known templates under the GW barycentric coding model, by a fixed-point iteration and by a differentiation-based approach with a blow-up technique.
- **Key Findings**: The abstract describes the analysis problem as the inverse of GW barycenter synthesis and reports numerical experiments and machine-learning applications.
- **Relevance**: The barycentric coordinates are a fixed-length representation of an unaligned structured object with respect to templates, which is the representation a template-based predictor would use.
- **Stance**: Supports (the coordinates require no correspondence between objects).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter (known templates) with GW couplings.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J3 R3 Rel2 C1 (S2: 0, published 2026) D1 = 10.
- **Quality**: Medium. Read: abstract (Semantic Scholar record).
- **Potential Use**: GW barycentric coordinates as subject features.
- **Citation key**: DiazMartin2026Gromov

##### Bai, Kothapalli, Du, Diaz Martin and Kolouri (2025). Linear partial Gromov-Wasserstein embedding.
- **Type**: Conference paper (International Conference on Learning Representations 2025, poster, per the OpenReview record; the arXiv comment reads "Published at ICLR 2025"). arXiv:2410.16669; OpenReview https://openreview.net/forum?id=BA1eG7vCNb.
- **Method**: Linearized embedding for the partial GW problem, which relaxes the equal-mass constraint; proves that the embedding defines a metric for metric measure spaces.
- **Key Findings**: The abstract states that pairwise PGW for K spaces needs O(K^2) problems and the linearization O(K), and that LPGW keeps the partial-matching advantages of PGW in shape retrieval and in learning with transport-based embeddings.
- **Relevance**: A fixed-reference embedding that tolerates unequal mass, which matters when subjects carry different numbers or volumes of lesions.
- **Stance**: Supports.
- **Evidence type**: Proceedings (OpenReview).
- **Correspondence handling**: Learned template or barycenter (reference) with partial GW transport, so mass can be left unmatched.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J2 R3 Rel3 C1 (S2: 1) D1 = 10.
- **Quality**: Medium. Read: abstract (arXiv record) and OpenReview venue field.
- **Potential Use**: Unequal-mass reference embedding for region or lesion sets.
- **Citation key**: Bai2025Linear

##### Togninalli, Ghisu, Llinares-Lopez, Rieck and Borgwardt (2019). Wasserstein Weisfeiler-Lehman graph kernels.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 32, pp. 6436-6446 per the Semantic Scholar record). arXiv:1906.01277; proceedings page https://papers.nips.cc/paper_files/paper/2019/hash/73fed7fd472e502d8908794430511f4d-Abstract.html.
- **Method**: Graph kernel based on the Wasserstein distance between the distributions of Weisfeiler-Lehman node embeddings of two graphs, with an embedding scheme for continuous node attributes and weighted edges.
- **Key Findings**: The abstract states that comparing node-feature distributions instead of their sum or mean finds subtler differences, and that the kernel improves the state of the art on several graph classification tasks.
- **Relevance**: Cited by two backward-chaining seeds (Mialon2021Trainable, VincentCuaz2022Template); it is the transport kernel baseline for set and graph classification without node correspondence.
- **Stance**: Supports (averaging discards distributional information that a transport comparison keeps).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling between node-embedding distributions.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J2 R2 Rel2 C3 (S2: 288) D2 = 11.
- **Quality**: Medium. Read: abstract (arXiv record).
- **Potential Use**: Transport kernel baseline for set or graph classification.
- **Citation key**: Togninalli2019Wasserstein

##### Xu, Liu, Luo and Carin (2023). Representing graphs via Gromov-Wasserstein factorization.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence 45(1):999-1016). DOI 10.1109/TPAMI.2022.3153126; PMID 35196227.
- **Method**: Reconstructs each graph, with unknown node correspondence and possibly different size, as a weighted combination of shared graph factors under the GW discrepancy; factors and weights are learned jointly; extensions to node attributes, auto-encoding with a GNN and semi-supervised classification.
- **Key Findings**: The abstract states that the weights give a permutation-invariant graph representation and that the representations perform well in clustering and classification, comparable to state-of-the-art methods.
- **Relevance**: A factorization of unaligned structured objects into shared templates; it is the transport counterpart of a multilinear decomposition with a shared factor and is relevant to the tensor-plus-transport intersection.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter (shared graph factors) with GW couplings.
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J3 R3 Rel3 C2 (S2: 27) D2 = 13.
- **Quality**: High. Read: abstract (Semantic Scholar record).
- **Potential Use**: Template factorization of unaligned sets or graphs; bridge between Themes A and B.
- **Citation key**: Xu2023Representing

##### Wang and Fan (2024). Graph classification via reference distribution learning: Theory and practice.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 37, pp. 137698-137740). DOI 10.52202/079017-4374; arXiv:2408.11370.
- **Method**: Graph Reference Distribution Learning (GRDL) treats a graph's node embeddings as a discrete distribution and classifies it by maximum mean discrepancy to adaptively learned reference distributions; derives generalization error bounds.
- **Key Findings**: The abstract states that the bounds and experiments show stronger generalization than GNNs with global pooling, and that GRDL is at least 10 times faster than leading competitors in training and inference.
- **Relevance**: A learned-template classifier over unordered node sets with a generalization guarantee; it compares to templates by MMD instead of transport, which is why Theme B excluded it as out of theme.
- **Stance**: Supports (global pooling is shown to lose information that reference distributions keep).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Learned template or barycenter (reference distributions compared by MMD).
- **Pipeline relation**: Not applicable.
- **Quick-assessment score**: J2 R3 Rel3 C2 (S2: 18) D2 = 12.
- **Quality**: High. Read: abstract (arXiv record).
- **Potential Use**: Learned-reference set classifier with theory; non-transport comparator for template layers.
- **Citation key**: Wang2024Graph

##### Little, Hsu and Sun (2023). Associating somatic mutation with clinical outcomes through kernel regression and optimal transport.
- **Type**: Journal article (Biometrics 79(3):2705-2718; first published online 2022-10-11 per Crossref). DOI 10.1111/biom.13769.
- **Method**: Optimal transport similarity between the somatic mutation profiles of tumour samples, using gene-gene similarity as the cost, fed into kernel regression on clinical outcomes; applied to 17 cancer types.
- **Key Findings**: The abstract reports at least three cancer types with associations between somatic mutations and overall survival, progression-free interval or cytolytic activity, and states that gene-by-gene analysis is under-powered.
- **Relevance**: A transport kernel between subjects whose elements (mutated genes) differ from subject to subject, used for a subject-level outcome; the merge-run query X7b returned it.
- **Stance**: Supports (aggregating with a transport similarity is presented as the answer to sparse, non-matching profiles).
- **Evidence type**: Journal.
- **Correspondence handling**: Transport coupling between mutation profiles.
- **Pipeline relation**: Not applicable (genomics).
- **Quick-assessment score**: J3 R2 Rel2 C1 (S2: 3) D2 = 10.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: non-imaging.
- **Potential Use**: Transport kernel regression as a subject-level predictor baseline.
- **Citation key**: Little2023Associating

#### Added in the merge run: set encoders and multiple-instance learning

##### Karimzadeh, Hasanabadi, Cheraghi, Bakhshayesh Karam, Arabi and Ibragimov (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study.
- **Type**: Journal article (Physics in Medicine and Biology 71(12):125014). DOI 10.1088/1361-6560/ae7955; PMID 42248208.
- **Method**: Each patient is an unordered set of per-node PET radiomic vectors (107 PyRadiomics features), optionally with demographics and normalized node centre-of-mass coordinates after rigid registration to a common reference space; pooled tabular baselines are compared with Transformer, Deep Sets, MIL, Set Transformer and a graph model; five-fold cross-validation on Centre 1 (151 patients) and external test on Centre 2 (80 patients) with and without unsupervised test-time adaptation.
- **Key Findings**: Adding demographic and spatial features improved discrimination in all models; the best deep aggregation models reached ROC-AUC up to 0.91 plus or minus 0.05 on Centre 1; direct transfer to Centre 2 lost performance, and TENT test-time adaptation raised the Transformer from ROC-AUC 0.81 to 0.87.
- **Relevance**: A two-centre comparison of set encoders against pooled baselines on a lesion set, in which node positions come from a rigid registration; it is the closest found study to a same-cohort comparison of set encoders and a registration-derived feature.
- **Stance**: Supports (the spatial cue derived from a common reference space adds to the set encoder).
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance, with positions from registration to a common space (rigid) as element features.
- **Pipeline relation**: Builds on lesion segmentation, radiomics and rigid registration.
- **Quick-assessment score**: J3 R3 Rel3 C1 (S2: 0, published 2026) D3 = 13.
- **Quality**: High. Read: abstract (Semantic Scholar and PubMed records).
- **Potential Use**: Set-encoder baselines and a two-centre protocol for lesion sets.
- **Citation key**: Karimzadeh2026Revisiting

##### Diao and Jiang (2024). A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features.
- **Type**: Journal article (Computers in Biology and Medicine 174:108461). DOI 10.1016/j.compbiomed.2024.108461.
- **Method**: Radiomic features compressed by an autoencoder are combined with deep features guided by a radiomics-deep-learning attention module, with 2D ROI segmentation and image reconstruction as auxiliary tasks; all lesion features of a patient are aggregated by a multi-instance aggregation layer and classified by an SVM; liver, lung and lymphoma PET datasets.
- **Key Findings**: The abstract reports AUC 0.82, 0.84 and 0.83 for three-class lung cancer subtyping, 0.95 and 0.75 for lymphoma and 0.84 and 0.86 for liver tumour subtyping, and states that the method outperforms the alternatives.
- **Relevance**: A lesion-set aggregation for patient-level classification on small PET datasets.
- **Stance**: Supports (patient-level aggregation over all lesions).
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance (multi-instance aggregation over lesions).
- **Pipeline relation**: Builds on lesion segmentation and radiomics; removes registration.
- **Quick-assessment score**: J2 R2 Rel3 C2 (S2: 17) D2 = 11.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: small datasets; cohort sizes not given in the abstract.
- **Potential Use**: Lesion-set aggregation baseline in PET.
- **Citation key**: Diao2024Multi

##### Gacheva, Lu, Kurz, Triesch, Hattingen and Polomac (2026). Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy.
- **Type**: Journal article (NeuroImage: Reports 6(4):100418). DOI 10.1016/j.ynirp.2026.100418; PMID 42927027.
- **Method**: MIL over each patient's variable-size bag of MR spectra (422 patients, 7442 spectra, internal hold-out test of 844 spectra), with min-max-mean pooling and attention pooling; benchmarked against neuroradiologists.
- **Key Findings**: The best configuration (CNN, min-max-mean pooling, data augmentation) reached AUC 0.82, sensitivity 0.76 and specificity 0.80; neuroradiologists reading MRS only had average sensitivity 0.54 and specificity 0.88; attention weights highlighted lipid, choline and Glx regions.
- **Relevance**: A patient-level set predictor over variable-size bags in neuro-oncology with a reader comparison.
- **Stance**: Supports.
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance (MIL pooling over spectra).
- **Pipeline relation**: Builds on MRS voxel placement; removes registration.
- **Quick-assessment score**: J2 R3 Rel2 C1 (S2: 0, published 2026) D3 = 11.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: internal hold-out only.
- **Potential Use**: Pooling-function comparison for variable-size bags in brain lesions.
- **Citation key**: Gacheva2026Multiple

##### Xu, Feng, Yue, Cheng, He, Qi and Zhang (2024). A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images.
- **Type**: Journal article (Computer Methods and Programs in Biomedicine 243:107872). DOI 10.1016/j.cmpb.2023.107872; PMID 37922655.
- **Method**: Each NHL lesion is an instance described by deep features from a CT encoder pretrained by rotation-based self-supervision combined with PET and CT radiomics; instance features are pooled into a patient-level bag representation and classified by a distance-based few-shot classifier to separate DLBCL from follicular lymphoma.
- **Key Findings**: At bag level the model reached accuracy 0.751, sensitivity 0.787, specificity 0.715 and AUC 0.795, above three radiomics-plus-classical-classifier counterparts (accuracy 0.714, 0.705 and 0.698); max pooling, hybrid CT and PET radiomic features and the distance-based classifier gave the best configuration.
- **Relevance**: A patient-level lesion-set predictor in PET/CT with a pooling comparison, in the same disease as Karimzadeh2026Revisiting.
- **Stance**: Supports (bag-level modelling of all lesions outperforms the radiomics baselines).
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance (MIL pooling over lesions).
- **Pipeline relation**: Builds on lesion segmentation and radiomics; removes registration.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 9) D2 = 10.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: cohort size not given in the abstract.
- **Potential Use**: Lesion-set MIL baseline and pooling evidence in lymphoma PET/CT.
- **Citation key**: Xu2024Hybrid

##### Collenne, Iguernaissi, Dubuisson and Merad (2024). ReSeT: A residual Set-Transformer approach to tackle the ugly-duckling sign in melanoma detection.
- **Type**: Conference paper (2024 IEEE International Conference on Image Processing, pp. 3186-3191). DOI 10.1109/ICIP51287.2024.10647287.
- **Method**: An image encoder embeds each of a patient's skin lesions, and a Set Transformer with a residual prediction layer compares the embeddings within the patient while predicting each lesion.
- **Key Findings**: The abstract reports a significant gain over ConvNets, the need for residual connections in multi-output Transformers, and that self-supervised encoders give embeddings of quality comparable to supervised ones.
- **Relevance**: Within-patient comparison of lesions by a set encoder, the clinical reasoning a subject-level lesion-set model encodes.
- **Stance**: Supports (comparing lesions within the patient improves detection).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Permutation invariance (Set Transformer over a patient's lesions).
- **Pipeline relation**: Builds on per-lesion images; no registration.
- **Quick-assessment score**: J2 R2 Rel2 C1 (S2: 1) D2 = 9.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: predictions are per lesion, not per patient.
- **Potential Use**: Example of within-subject set attention over lesions.
- **Citation key**: Collenne2024ReSeT

##### Liu, Zhu, Wang, Liu, Zhu, Wang, Ge, Shen, Sun, Liu, Zhao, Beeraka, Sorn, Wang, Nikolenko, Wu and Xu (2026). Three-dimensional point-cloud learning for patient-specific deep brain stimulation motor response prediction in Parkinson disease.
- **Type**: Journal article (BME Frontiers 7:0276). DOI 10.34133/bmef.0276; PMID 42774635.
- **Method**: Patient-specific 3D point clouds combine preoperative MRI, postoperative CT, electrode reconstruction, tissue conductivity and finite-element electric fields; 79 patients; PointNet++ compared with a voxelized CNN on a fixed test set of 24.
- **Key Findings**: PointNet++ predicted 15 of 24 motor scores within plus or minus 5 MDS-UPDRS-III points and the voxelized CNN 8 of 24; the authors state that, given the small test set, these estimates do not support claims of generalization, superiority or clinical utility.
- **Relevance**: The only study returned by query X3 that compares a point-cloud encoder with a voxel-grid model for a subject-level outcome; it names atlas and voxel-grid approaches as compressing the geometry.
- **Stance**: Supports, with the authors' own disclaimer on generalization.
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance (point-cloud network on patient-specific geometry).
- **Pipeline relation**: Builds on registration of MRI and CT and on electrode reconstruction; replaces voxelization.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 1) D1 = 9.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: 24 test patients, single split.
- **Potential Use**: Point-cloud versus voxel-grid comparison for a subject-level outcome.
- **Citation key**: Liu2026Three

##### Islam and Mahmud (2026). NeuroAPS-Net: Neuro-anatomically aware point cloud representation for efficient Alzheimer's disease classification.
- **Type**: Conference paper (2026 International Joint Conference on Neural Networks, pp. 1-6). DOI 10.1109/IJCNN69854.2026.11729839; arXiv:2604.22883.
- **Method**: Converts T1-weighted MRI into anatomically informed 2D point clouds by anatomical priority sampling (the ADNI-2DPC dataset) and classifies them with a lightweight network using region-aware feature encoding and ROI token aggregation.
- **Key Findings**: The abstract reports competitive classification accuracy with lower inference latency and GPU memory than state-of-the-art point-cloud methods.
- **Relevance**: A point-cloud alternative to voxel CNNs for subject-level classification from brain MRI; the merge-run query X4 returned it.
- **Stance**: Neutral (the abstract argues efficiency, not correspondence).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Permutation invariance, with anatomical ROI labels attached to points.
- **Pipeline relation**: Builds on anatomical labelling of the T1 image; the abstract does not state the registration step.
- **Quick-assessment score**: J2 R2 Rel2 C1 (S2: 0) D2 = 9.
- **Quality**: Medium. Read: abstract (arXiv record).
- **Potential Use**: Example of point-cloud encoders on structural MRI.
- **Citation key**: Islam2026NeuroAPS

##### Kwon, Son, Morton, Wypij, Cleveland, Rollins, Huang, Goldmuntz, Panigrahy, Thomas, Chung, Anagnostou, Norris-Brilliant, Gelb, McQuillen, Porter, Tristani-Firouzi, Russell, Roberts, Newburger, Grant, Lee and Im (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease.
- **Type**: Journal article (Medical Image Analysis 102:103538). DOI 10.1016/j.media.2025.103538; PMID 40121807.
- **Method**: Prototype-based graph neural network on sulcal pit graphs, with a prototype inverse-projection onto node representations for interpretability; classification of congenital heart disease (345) against healthy controls (174) from four cohort studies and a public dataset.
- **Key Findings**: The abstract states that earlier sulcal pattern analysis used spectral graph matching to a reference set and lacked a standard reference criterion, was slow and assumed uniform node distribution; the prototype model gave superior classification to state-of-the-art models, with ablations.
- **Relevance**: Learned prototypes replace graph matching to a fixed reference for a subject-level prediction from unaligned structural elements (sulcal pits).
- **Stance**: Supports (matching to a fixed reference is named as a limitation and replaced by learned prototypes).
- **Evidence type**: Journal.
- **Correspondence handling**: Learned template or barycenter (learned prototypes) with permutation-invariant graph encoding.
- **Pipeline relation**: Builds on cortical surface extraction and sulcal pit detection; removes graph matching to a reference set.
- **Quick-assessment score**: J3 R3 Rel3 C1 (S2: 1) D3 = 13.
- **Quality**: High. Read: abstract (Semantic Scholar record).
- **Potential Use**: Learned-prototype predictor for unaligned brain structures.
- **Citation key**: Kwon2025Graph

##### Verdelho, Bernardino and Barata (2025). MIL vs. aggregation: Evaluating patient-level survival prediction strategies using graph-based learning.
- **Type**: Conference paper (Pattern Recognition and Image Analysis, IbPRIA 2025, LNCS, pp. 171-182). DOI 10.1007/978-3-031-99568-2_14; arXiv:2503.23042.
- **Method**: Compares slide-level survival prediction with patient-level strategies that aggregate predictions over several WSIs or select the most relevant slide by MIL, with several GNN architectures; MMIST-ccRCC dataset.
- **Key Findings**: The abstract reports that MIL-based selection of the most representative slide improves accuracy.
- **Relevance**: A direct comparison of aggregation and MIL selection when a patient contributes several unaligned images.
- **Stance**: Supports.
- **Evidence type**: Proceedings.
- **Correspondence handling**: Permutation invariance (MIL over a patient's slides).
- **Pipeline relation**: Builds on WSI tiling and feature extraction; no registration.
- **Quick-assessment score**: J2 R2 Rel2 C1 (S2: 1) D2 = 9.
- **Quality**: Medium. Read: abstract (arXiv record). Limitation: single dataset.
- **Potential Use**: Evidence on selection versus aggregation for multi-image patients.
- **Citation key**: Verdelho2025MIL

##### Li, Cai, Wei, Chen, Chen, Zhao, Shi, Dong, Tang, Zhang and Zhang (2025). Multi-stage bidirectional cross-attention model for predicting prognosis in multiple peritoneum lesions with clinical information.
- **Type**: Conference paper (2025 IEEE 22nd International Symposium on Biomedical Imaging, pp. 1-5). DOI 10.1109/ISBI60581.2025.10980928.
- **Method**: Multi-stage bidirectional cross-attention lets the instance features of different peritoneal lesions interact at intermediate stages of the backbone, with clinical information, instead of fusing them only at the final stage as in standard MIL.
- **Key Findings**: Against five baselines the method improved AUC by 8.7 percent and C-index by 5.9 percent; the abstract names variation in shape, size and location of peritoneal lesions as the difficulty.
- **Relevance**: A lesion-set prognostic model in which lesions of one patient interact, in a disease with many lesions per patient.
- **Stance**: Supports (late MIL fusion is reported as a limitation).
- **Evidence type**: Proceedings.
- **Correspondence handling**: Permutation invariance with cross-attention among lesion instances.
- **Pipeline relation**: Builds on lesion delineation; the abstract does not state how lesions are obtained.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 0) D2 = 10.
- **Quality**: Medium. Read: abstract (Semantic Scholar record). Limitation: cohort size not given in the abstract.
- **Potential Use**: Interacting-lesion baseline for subject-level prognosis.
- **Citation key**: Li2025MultiStage

##### Song, Chen, Jaume, Vaidya, Baras and Mahmood (2024). Multimodal prototyping for cancer survival prediction.
- **Type**: Conference paper (Proceedings of the 41st International Conference on Machine Learning, PMLR 235, pp. 46050-46073). arXiv:2407.00224; proceedings page https://proceedings.mlr.press/v235/song24b.html.
- **Method**: Summarizes the patch tokens of a whole-slide image with unsupervised morphological prototypes (over 300 times compression) and the transcriptome with pathway prototypes, then fuses the fixed small token sets with a Transformer or with an optimal transport cross-alignment; six cancer types.
- **Key Findings**: The abstract reports better survival prediction than state-of-the-art methods with much less computation, and new interpretability analyses.
- **Relevance**: Combines learned templates (prototypes) that turn a variable-size unordered set into a fixed representation with a transport alignment, in a subject-level survival task.
- **Stance**: Supports.
- **Evidence type**: Proceedings.
- **Correspondence handling**: Learned template or barycenter (morphological prototypes), with a transport coupling for cross-modal fusion.
- **Pipeline relation**: Builds on WSI tiling and patch features; no registration.
- **Quick-assessment score**: J2 R3 Rel3 C2 (S2: 85) D3 = 13.
- **Quality**: High. Read: abstract (arXiv record) and the PMLR proceedings listing.
- **Potential Use**: Prototype compression plus transport fusion for set-valued subjects.
- **Citation key**: Song2024Multimodal

##### Ren, Wang, Fang, Ling and You (2025). OTSurv: A novel multiple instance learning framework for survival prediction with heterogeneity-aware optimal transport.
- **Type**: Conference paper (MICCAI 2025, LNCS, pp. 439-449). DOI 10.1007/978-3-032-05182-0_43; arXiv:2506.20741.
- **Method**: MIL for WSI survival posed as an optimal transport problem with a global long-tail constraint on mass allocation and a local uncertainty-aware constraint that raises the total transported mass progressively; recast as unbalanced OT solved by matrix scaling.
- **Key Findings**: The abstract reports state-of-the-art results on six benchmarks, an absolute 3.6 percent gain in average C-index, and significant log-rank tests.
- **Relevance**: Unbalanced transport used as the pooling operator of a set-level survival predictor.
- **Stance**: Supports.
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling (unbalanced) between instances and learned prototypes, used as MIL pooling.
- **Pipeline relation**: Builds on WSI tiling and patch features; no registration.
- **Quick-assessment score**: J2 R3 Rel3 C2 (S2: 13) D3 = 13.
- **Quality**: High. Read: abstract (arXiv record).
- **Potential Use**: Unbalanced-OT pooling as a set-encoder comparator.
- **Citation key**: Ren2025OTSurv

##### Xu and Chen (2023). Multimodal optimal transport-based co-attention transformer with global structure consistency for survival prediction.
- **Type**: Conference paper (2023 IEEE/CVF International Conference on Computer Vision, pp. 21184-21194). DOI 10.1109/ICCV51070.2023.01942; arXiv:2306.08330.
- **Method**: MOTCat: optimal transport matches WSI patches and gene embeddings to select informative patches, and OT-based co-attention captures global structure; computed by unbalanced mini-batch OT over micro-batches of patches.
- **Key Findings**: The abstract reports better results than state-of-the-art methods on five benchmark datasets.
- **Relevance**: Transport between two unordered sets inside a subject-level survival predictor.
- **Stance**: Supports.
- **Evidence type**: Proceedings.
- **Correspondence handling**: Transport coupling (unbalanced mini-batch) between patch and gene sets.
- **Pipeline relation**: Builds on WSI tiling and patch features; no registration.
- **Quick-assessment score**: J3 R2 Rel2 C3 (S2: 190) D3 = 13.
- **Quality**: High. Read: abstract (arXiv record).
- **Potential Use**: Transport co-attention baseline for set-valued subjects.
- **Citation key**: Xu2023Multimodal

#### Added in the merge run: registration, pipelines and subject-level prediction

##### Beg, Miller, Trouve and Younes (2005). Computing large deformation metric mappings via geodesic flows of diffeomorphisms.
- **Type**: Journal article (International Journal of Computer Vision 61(2):139-157). DOI 10.1023/B:VISI.0000043755.93987.aa.
- **Method**: Large deformation diffeomorphic metric mapping (LDDMM): the Euler-Lagrange equations for the minimizing time-dependent vector fields are derived and solved with a gradient algorithm using semi-Lagrangian particle flows; metric distances between images are computed along the geodesics.
- **Key Findings**: Crossref, OpenAlex and Semantic Scholar carry no abstract for this record. Excerpts of the abstract read on a manuscript-inventory page state the variational problem, the Euler-Lagrange equations, the semi-Lagrangian scheme and the computation of metric distances; three Theme D Layer 2 core papers cite it as the LDDMM method.
- **Relevance**: The reference diffeomorphic registration method that registration-based predictors and template estimation build on.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space (dense diffeomorphic map).
- **Pipeline relation**: Is the registration step.
- **Quick-assessment score**: J3 R3 Rel2 C3 (S2: 2002) D2 = 13.
- **Quality**: High. Read: excerpts of the abstract (manuscript-inventory page) and the Crossref record; the full abstract was not available in any bibliographic record.
- **Potential Use**: Background on diffeomorphic registration.
- **Citation key**: Beg2005Computing

##### Gurler, Gharsallaoui and Rekik (2023). Template-based graph registration network for boosting the diagnosis of brain connectivity disorders.
- **Type**: Journal article (Computerized Medical Imaging and Graphics 103:102140). DOI 10.1016/j.compmedimag.2022.102140; PMID 36470102.
- **Method**: A graph generative adversarial network registers each brain graph to a population connectional brain template (CBT) before a downstream GNN; the registration network plugs into any GNN end to end.
- **Key Findings**: The abstract reports that the registration network raised the prediction accuracy of four conventional GNN models across four neurological datasets.
- **Relevance**: Evidence that registering subjects to a learned population template before a predictor helps, in the graph domain.
- **Stance**: Supports (explicit template correspondence improves prediction over template-free learning).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space (a population template), with the template estimated from data.
- **Pipeline relation**: Builds on brain graph construction; adds a learned registration step.
- **Quick-assessment score**: J2 R2 Rel3 C2 (S2: 11) D2 = 11.
- **Quality**: Medium. Read: abstract (Semantic Scholar record).
- **Potential Use**: Template-registration comparator in the graph domain.
- **Citation key**: Gurler2023Template

##### Dong, Pachade, Liang, Sheth and Giancardo (2024). A self-supervised learning approach for registration agnostic imaging models with 3D brain CTA.
- **Type**: Journal article (iScience 27(3):109004). DOI 10.1016/j.isci.2024.109004; PMID 38375230.
- **Method**: Contrastive teacher-student self-supervision converts a CNN designed for registered images into one that works on unregistered images, without labels; large vessel occlusion detection on CTA from 402 patients.
- **Key Findings**: The student reached AUC 0.88 on unregistered images against 0.81 for the teacher; a student trained directly on unregistered images with standard supervision reached 0.63; the abstract names registration as added computation and a point of failure.
- **Relevance**: Measures the cost of removing registration without a correspondence mechanism (0.63) and shows one way to recover it.
- **Stance**: Supports (naive training without registration loses performance; an explicit mechanism recovers it).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space for the teacher; the student learns registration-invariant features.
- **Pipeline relation**: Removes registration.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 8) D3 = 11.
- **Quality**: Medium. Read: abstract (Semantic Scholar record).
- **Potential Use**: Same-cohort evidence on registered against unregistered inputs.
- **Citation key**: Dong2024Self

##### Huang, Kan, Lah and Qiu (2025). Atlas-free brain network transformer.
- **Type**: Preprint (arXiv:2510.03306; PubMed record 41810022). A Crossref title query found no peer-reviewed version.
- **Method**: Individualized parcellations from each subject's resting-state fMRI; ROI-to-voxel connectivity features in a standardized voxel-based space are processed by a brain network transformer to give comparable subject embeddings; sex classification and brain-age prediction.
- **Key Findings**: The abstract reports that the atlas-free model outperforms atlas-based methods (elastic net, BrainGNN, Graphormer and the original BNT), and names spatial misalignment across individuals and atlas-selection bias as limitations of fixed atlases.
- **Relevance**: Removes the fixed atlas as the source of correspondence, while keeping a standardized voxel space for the features.
- **Stance**: Supports.
- **Evidence type**: Preprint (cs_ml profile: peer-review-equivalent).
- **Correspondence handling**: Registration to a common space for the voxel feature space; subject-specific regions in place of atlas regions.
- **Pipeline relation**: Builds on registration; removes the fixed atlas parcellation.
- **Quick-assessment score**: J1 R2 Rel2 C1 (S2: 1) D2 = 8.
- **Quality**: Medium. Read: abstract (arXiv record). Limitation: preprint.
- **Potential Use**: Example of atlas-free subject-level prediction.
- **Citation key**: Huang2026Atlas

##### Liu, Zhang, Li, Xu, Zhuo, Li, Zhou, Lu, Zhou, Pan, Wu, Zhou, Shi, Lu, Liu and Zhang (2023). Coordinatized lesion location analysis empowering ROI-based radiomics diagnosis on brain gliomas.
- **Type**: Journal article (European Radiology 33(12):8776-8787). DOI 10.1007/s00330-023-09871-y; PMID 37382614.
- **Method**: Tumour location probability maps in a common coordinate space (coordinatized lesion location analysis) are fused with ROI radiomics to predict grade, IDH status and overall survival; 679 patients from three centres; inter-site cross-validation.
- **Key Findings**: Average AUC for grade, IDH and overall survival was 0.756, 0.748 and 0.768 for the fusion models, against 0.731, 0.686 and 0.716 for radiomics and 0.706, 0.712 and 0.740 for location alone; the fusion models generalized better across sites than radiomics (median delta accuracy -0.125 against -0.200, p = 0.018).
- **Relevance**: A three-centre comparison in which a registration-based location feature adds accuracy and cross-site stability to a per-lesion radiomics predictor.
- **Stance**: Supports (location information from a common space is not redundant with radiomics).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space (location maps), combined with per-region features.
- **Pipeline relation**: Builds on registration, lesion segmentation and radiomics.
- **Quick-assessment score**: J3 R3 Rel3 C1 (S2: 8) D3 = 13.
- **Quality**: High. Read: abstract (PubMed record).
- **Potential Use**: Multi-centre evidence that location adds to radiomics; registration-based comparator.
- **Citation key**: Liu2023Coordinatized

##### Kendrick, Francis, Hassan, Rowshanfarzad, Ong and Ebert (2022). Fully automatic prognostic biomarker extraction from metastatic prostate lesion segmentations in whole-body [68Ga]Ga-PSMA-11 PET/CT images.
- **Type**: Journal article (European Journal of Nuclear Medicine and Molecular Imaging 50(1):67-79; published online 2022-08-17). DOI 10.1007/s00259-022-05927-1; PMID 35976392.
- **Method**: nnU-Net-based 3D CNN segments metastatic lesions in 337 whole-body PSMA PET/CT scans; whole-body total lesional volume and uptake are computed from the automatic segmentations and tested against overall survival by Kaplan-Meier analysis.
- **Key Findings**: Patient-level accuracy, sensitivity and PPV exceeded 90 percent; lesion-level PPV was 88.2 percent and sensitivity 73.0 percent; voxel-level agreement was within inter-observer variability; both whole-body biomarkers were associated with overall survival (p < 0.005).
- **Relevance**: The automatic lesion-set extraction step and the volume-type baseline that a subject-level lesion-set predictor must beat.
- **Stance**: Neutral.
- **Evidence type**: Journal.
- **Correspondence handling**: Not applicable (whole-body sums over lesions).
- **Pipeline relation**: Is the lesion segmentation step; builds a volume biomarker on it.
- **Quick-assessment score**: J3 R2 Rel2 C2 (S2: 45) D3 = 12.
- **Quality**: High. Read: abstract (Semantic Scholar record).
- **Potential Use**: Automated lesion extraction and the total-volume baseline.
- **Citation key**: Kendrick2022Fully

##### Alberb, Chen, El-rewaidy, Karanicolas, Seth, Amemiya, Martel and Cheung (2026). An automated radiomics framework for postoperative survival prediction in colorectal liver metastases using preoperative MRI.
- **Type**: Preprint (arXiv:2603.10216). A Crossref title query found no peer-reviewed version.
- **Method**: 227 colorectal liver metastasis patients; an anatomy-aware segmentation pipeline (SAMONAI prompt propagation extending Segment Anything to 3D point-based segmentation, trained from partial annotations) feeds per-tumour radiomics into SurvAMINN, an autoencoder-based multiple instance network for right-censored survival.
- **Key Findings**: Median Dice was 0.96 for liver and 0.93 for spleen, CRLM Dice 0.78 with detection F1 0.79, and the survival C-index 0.69; the framework was compared with established biomarkers by univariate and multivariate Cox regression.
- **Relevance**: An end-to-end automated lesion-set survival pipeline that extends Chen2021AMINN from manual delineation to automatic segmentation.
- **Stance**: Supports.
- **Evidence type**: Preprint (cs_ml profile: peer-review-equivalent).
- **Correspondence handling**: Permutation invariance (MIL over tumours).
- **Pipeline relation**: Builds on lesion segmentation and radiomics; removes registration.
- **Quick-assessment score**: J1 R2 Rel3 C1 (S2: 0) D2 = 9.
- **Quality**: Medium. Read: abstract (arXiv record). Limitation: preprint, single centre.
- **Potential Use**: Automated lesion-set survival baseline.
- **Citation key**: Alberb2026Automated

##### Brzus, Griffis, Riley, Bruss, Shea, Johnson and Boes (2026). A clinical neuroimaging platform for rapid, automated lesion detection and personalized post-stroke outcome prediction.
- **Type**: Journal article (npj Digital Medicine 9:646). DOI 10.1038/s41746-026-02803-2; PMID 42204350.
- **Method**: Automated platform from raw DICOM: deep-learning lesion segmentation followed by lesion location and network features for cognitive outcome prediction; trained on 604 patients and applied to an independent cohort of 153.
- **Key Findings**: The abstract reports reasonable accuracy for several cognitive outcomes with 96 percent concordance with manual methods, and a report produced in about 3 minutes.
- **Relevance**: The registration-based lesion-location predictor in deployable form, with an independent test cohort.
- **Stance**: Neutral (the abstract does not compare correspondence strategies).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space (location and network features).
- **Pipeline relation**: Builds on lesion segmentation and registration.
- **Quick-assessment score**: J3 R2 Rel3 C1 (S2: 1) D3 = 12.
- **Quality**: High. Read: abstract (Semantic Scholar record).
- **Potential Use**: Registration-based baseline with external validation.
- **Citation key**: Brzus2026Clinical

##### Sabouri, Hajianfar, Gharibi, Rafiei Sardouei, Menda, Dundar, Gadens Zamboni, Jain, Kruzer, Zaidi, Yousefirizi, Rahmim and Shariftabrizi (2025). Enhancing PRRT outcome prediction in neuroendocrine tumors: aggregated multi-lesion PET radiomics incorporating inter-tumor heterogeneity.
- **Type**: Journal article (Cancers 17(23):3887). DOI 10.3390/cancers17233887; PMID 41375088.
- **Method**: Radiomic features from multiple PET lesions per patient are aggregated with different lesion selection and aggregation strategies to predict progression and time to progression after [177Lu]Lu-DOTA-TATE; 81 patients; lesions ranked by SUVmin, SUVmean, SUVmax or volume, with the top one, three or five selected and aggregated by stacked or statistical methods; nested cross-validation.
- **Key Findings**: The simple summary reports that selecting the top lesions by descending SUVmin improved progression prediction, that aggregating all lesions or the top five by SUVmean gave more accurate time-to-progression predictions, and that heterogeneity features added value.
- **Relevance**: Shows that the choice of lesion selection and aggregation changes the result, which a learned set encoder replaces.
- **Stance**: Supports (handling the lesion set changes prediction accuracy).
- **Evidence type**: Journal.
- **Correspondence handling**: Permutation invariance (statistical aggregation over lesions).
- **Pipeline relation**: Builds on lesion segmentation and radiomics; removes registration.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 1) D1 = 9.
- **Quality**: Medium. Read: abstract (PubMed record) and the simple summary (Semantic Scholar record). Limitation: 81 patients, nested cross-validation without an external test.
- **Potential Use**: Hand-designed lesion aggregation baselines.
- **Citation key**: Sabouri2025Enhancing

##### Bonkhoff, Cohen, Drew, Ferguson, Hussain, Lin, Schaper, Bourached, Giese, Oliveira, Regenhardt, Schirmer, Jern, Lindgren, Maguire, Wu, Zafar, Rhee, Kimchi, Corbetta, Rost, Fox and others (2024). Prediction of stroke severity: systematic evaluation of lesion representations.
- **Type**: Journal article (Annals of Clinical and Translational Neurology 11(12):3081-3094). DOI 10.1002/acn3.52215; PMID 39394714.
- **Method**: Lesion volume, lesion location, and structural and functional disconnection from normative connectomes predict acute NIHSS in three independent datasets (109, 638 and 794 patients), comparing within-dataset cross-validation with cross-dataset tests.
- **Key Findings**: Models trained on a small single-centre dataset did well under cross-validation but did not generalize (median R2 0.2 percent); training on a large single-centre dataset gave R2 15.8 percent and on multicentre data 24.4 percent; disconnection features beat volume or location alone (P < 0.001).
- **Relevance**: Quantifies that registration-based lesion representations from one site do not transfer, which bears on the error a registration pipeline carries across cohorts.
- **Stance**: Supports (the representation of the lesion and the data source change cross-dataset performance).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space (location and disconnection maps).
- **Pipeline relation**: Builds on registration and lesion segmentation.
- **Quick-assessment score**: J3 R3 Rel3 C1 (S2: 6) D3 = 13.
- **Quality**: High. Read: abstract (PubMed record).
- **Potential Use**: Cross-dataset protocol and evidence on representation choice.
- **Citation key**: Bonkhoff2024Prediction

##### Sperber, Gallucci, Mirman, Arnold and Umarova (2023). Stroke lesion size: Still a useful biomarker for stroke severity and outcome in times of high-dimensional models.
- **Type**: Journal article (NeuroImage: Clinical 40:103511). DOI 10.1016/j.nicl.2023.103511; PMID 37741168.
- **Method**: 753 first-ever anterior circulation ischaemic stroke patients with lesions traced on diffusion MRI; out-of-sample prediction of 24-hour NIHSS and 3-month mRS from lesion size or from spatial lesion features; training sets reduced to 150 and 50 patients.
- **Key Findings**: For NIHSS, lesion size gave R2 0.322 and spatial features 0.363 (p = 0.004); for mRS, accuracy was 62.8 percent from size and 62.6 percent from spatial features (p = 0.80); with 150 or 50 training patients the spatial models fell to the level of size or below; combining both did not help.
- **Relevance**: The lesion-volume baseline and evidence that registered spatial features help only in large samples.
- **Stance**: Opposes in part (in small samples the spatial information from registered lesion maps adds nothing over a scalar that needs no correspondence).
- **Evidence type**: Journal.
- **Correspondence handling**: Registration to a common space for the spatial features; not applicable for lesion size.
- **Pipeline relation**: Builds on registration and lesion segmentation.
- **Quick-assessment score**: J3 R3 Rel3 C2 (S2: 34) D3 = 14.
- **Quality**: High. Read: abstract (PubMed record).
- **Potential Use**: Volume baseline and sample-size evidence for the experiments.
- **Citation key**: Sperber2023Stroke

##### Seghier (2023). The elusive metric of lesion load.
- **Type**: Journal article, review (Brain Structure and Function 228(3-4):703-716). DOI 10.1007/s00429-023-02630-1; PMID 36947181.
- **Method**: Review of definitions of lesion load, the share of a region of interest that a lesion damages, computed after mapping a voxel lesion map onto atlas-based or data-driven regions.
- **Key Findings**: The abstract lists four issues: lesion load ignores where in the region the damage lies and damage outside it; it carries errors from lesion delineation, spatial warping of the lesion or region and binarization; it depends on the parcellation; and it does not necessarily reflect white matter disconnection.
- **Relevance**: Names spatial warping and parcellation choice as error sources of the registration-based lesion feature.
- **Stance**: Supports (the correspondence step introduces error into the feature).
- **Evidence type**: Journal (review).
- **Correspondence handling**: Registration to a common space (atlas regions).
- **Pipeline relation**: Builds on registration and lesion segmentation.
- **Quick-assessment score**: J2 R2 Rel3 C1 (S2: 3) D1 = 9.
- **Quality**: Medium. Read: abstract (PubMed record). Limitation: review without new data.
- **Potential Use**: Error sources of registration-based lesion features.
- **Citation key**: Seghier2023Elusive

## Literature Matrix

Columns: Themes lists the theme groups a source belongs to (A tensor and multilinear, B transport, C sets and MIL, D pipelines; a merge-run source is placed in every theme whose topic it covers). Method family is the source's main sub-theme. Correspondence handling and Pipeline relation use the RQ's categories; a source can carry more than one; "is a pipeline step" marks sources that are the registration, radiomics or segmentation step itself, and "builds on segmentation" covers lesion and structure segmentation. Quality is the annotation's Quality grade.

| Source | Themes | Method family | Method | Correspondence handling | Pipeline relation | Quality |
|---|---|---|---|---|---|---|
| Carroll1970Individual | A | Unaligned-mode decomposition | Decomposition model | assumes alignment | not applicable or not stated | High |
| Bro1996Multiway | A | Multilinear PLS | Algorithm, real data | assumes alignment | not applicable or not stated | High |
| Kiers1999PARAFAC2 | A | Unaligned-mode decomposition | Algorithm | learned template or barycenter | not applicable or not stated | High |
| MartinezMontes2004Concurrent | A | Tensor model, neuro or medical | Application of N-PLS | assumes alignment | not applicable or not stated | High |
| Kolda2009Tensor | A | Unaligned-mode decomposition | Survey | not applicable or not stated | not applicable or not stated | High |
| Zhao2013HOPLS | A | Multilinear PLS | Algorithm, real data | assumes alignment | not applicable or not stated | High |
| Zhou2013Tensor | A | Tensor regression | Statistical model, theory, real data | assumes alignment | builds on registration | High |
| Guhaniyogi2017Bayesian | A | Tensor regression | Bayesian model, theory | assumes alignment | builds on registration | High |
| Li2017Parsimonious | A | Tensor regression | Statistical model, theory | assumes alignment | builds on registration | High |
| Zhang2017Envelope | A | Multilinear PLS | Statistical model, theory | assumes alignment | builds on registration | High |
| Lock2018Supervised | A | Tensor regression | Probabilistic model, EM | assumes alignment | not applicable or not stated | High |
| Yan2019Structured | A | Tensor regression | Statistical model, case study | assumes alignment | not applicable or not stated | High |
| Afshar2021SWIFT | A | Tensor model with points, sets or transport | Algorithm, downstream prediction | transport coupling | not applicable or not stated | Medium |
| Roald2022AOADMM | A | Unaligned-mode decomposition | Algorithm, real data | learned template or barycenter | not applicable or not stated | High |
| Ren2023MULTIPAR | A | Unaligned-mode decomposition | Supervised factorization, EHR | learned template or barycenter | not applicable or not stated | Medium |
| Biehler2024ANTLER | A | Tensor model with points, sets or transport | Bayesian nonlinear model, case study | not applicable or not stated | not applicable or not stated | High |
| Spencer2024Bayesian | A | Tensor regression | Bayesian model, ADNI | assumes alignment | builds on registration | High |
| Xu2024Incomplete | A | Tensor regression | Statistical model, real data | assumes alignment | not applicable or not stated | High |
| Konyar2025SemiSupervised | A | Unaligned-mode decomposition | Semi-supervised factorization, MIMIC-IV | learned template or barycenter | not applicable or not stated | High |
| Schenker2025PARAFAC2CMTF | A | Unaligned-mode decomposition | Algorithm framework | learned template or barycenter | not applicable or not stated | Medium |
| Park2026Sparse | A | Multilinear PLS | Statistical model, theory | assumes alignment | not applicable or not stated | High |
| Tang2026Unaligned | A | Unaligned-mode decomposition | Algorithm, real data | assumes alignment | not applicable or not stated | High |
| Huang2026ShiftAware | A | Tensor model, neuro or medical | Statistical model, theory, MRI | registration to a common space | builds on registration | High |
| Hu2026Ragged | A | Unaligned-mode decomposition | Algorithm, convergence proof | assumes alignment | not applicable or not stated | High |
| Patalano2026PAR2COX | A | Unaligned-mode decomposition | Supervised factorization, preprint | learned template or barycenter | not applicable or not stated | Medium |
| Cuturi2013Sinkhorn | B | Entropic and unbalanced OT | Algorithm | transport coupling | not applicable or not stated | High |
| Chizat2018Scaling | B | Entropic and unbalanced OT | Algorithm | transport coupling | not applicable or not stated | High |
| Feydy2019Interpolating | B | Entropic and unbalanced OT | Theory and algorithm | transport coupling | not applicable or not stated | High |
| Wang2026NeuralEntropic | B | Entropic and unbalanced OT | Theory and algorithm | transport coupling | not applicable or not stated | Medium |
| Memoli2011GromovWasserstein | B | GW and FGW | Theory | transport coupling | not applicable or not stated | High |
| Vayer2019Structured | B | GW and FGW | Method and benchmark | transport coupling | not applicable or not stated | High |
| Sejourne2021Unbalanced | B | GW and FGW | Theory and algorithm | transport coupling | not applicable or not stated | Medium |
| Thual2022Aligning | B | GW and FGW | Method and neuroimaging evaluation | transport coupling | removes registration | High |
| CuturiDoucet2014Fast | B | Transport barycenters and templates | Algorithm | learned template or barycenter | not applicable or not stated | High |
| Schmitz2018Wasserstein | B | Transport barycenters and templates | Method | learned template or barycenter | not applicable or not stated | High |
| VincentCuaz2021Online | B | Transport barycenters and templates | Method | learned template or barycenter; transport coupling | not applicable or not stated | High |
| VincentCuaz2022Template | B | Transport barycenters and templates | Method and benchmark | learned template or barycenter | not applicable or not stated | High |
| BrogatMotte2022Learning | B | Transport barycenters and templates | Method and theory | learned template or barycenter | not applicable or not stated | Medium |
| Mallery2025Synthesis | B | Transport barycenters and templates | Theory and experiments | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Mazelet2026Learning | B | Transport barycenters and templates | Method and neuroimaging evaluation (preprint) | learned template or barycenter; transport coupling | removes registration | Medium |
| Wang2013Linear | B | Transport embeddings and transport prediction | Method | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Mialon2021Trainable | B | Transport embeddings and transport prediction | Method and benchmark | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Kolouri2021Wasserstein | B | Transport embeddings and transport prediction | Method and benchmark | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Moosmuller2023Linear | B | Transport embeddings and transport prediction | Theory and experiments | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Bai2023Linear | B | Transport embeddings and transport prediction | Method | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| ShifatERabbi2025Linear | B | Transport embeddings and transport prediction | Method and benchmark | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Wang2025Linearized | B | Transport embeddings and transport prediction | Method and application (preprint) | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Gramfort2015Fast | B | Registration-free transport in medical imaging | Algorithm and neuroimaging evaluation | learned template or barycenter | builds on registration | High |
| Kundu2018Discovery | B | Registration-free transport in medical imaging | Method and cohort validation | learned template or barycenter; transport coupling | removes registration | High |
| Gerber2018Exploratory | B | Registration-free transport in medical imaging | Method and cohort evaluation | transport coupling | builds on segmentation | Medium |
| Shen2021Accurate | B | Registration-free transport in medical imaging | Method and benchmark | transport coupling | is a pipeline step | High |
| Kundu2024Discovering | B | Registration-free transport in medical imaging | Cohort study | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Ironside2025Predictive | B | Registration-free transport in medical imaging | Cohort study with external test | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Gong2026Robust | B | Registration-free transport in medical imaging | Cohort study, single centre | transport coupling | removes registration | Medium |
| Qahqaie2026Unbalanced | B | Registration-free transport in medical imaging | Method and clinical evaluation | transport coupling | builds on segmentation; builds on registration | Medium |
| Zaheer2017DeepSets | C | Set-function theory | Theory and architecture | permutation invariance | not applicable or not stated | High |
| Wagstaff2019Limitations | C | Set-function theory | Theory | permutation invariance | not applicable or not stated | High |
| Wagstaff2022Universal | C | Set-function theory | Theory | permutation invariance | not applicable or not stated | High |
| Amir2023Injective | C | Set-function theory | Theory | permutation invariance | not applicable or not stated | High |
| Wang2024PolynomialWidth | C | Set-function theory | Theory | permutation invariance | not applicable or not stated | Medium |
| Lee2019SetTransformer | C | Attention set pooling | Architecture | permutation invariance | not applicable or not stated | High |
| Qi2017PointNet | C | Point-cloud networks | Architecture and theory | permutation invariance | not applicable or not stated | High |
| Qi2017PointNetPP | C | Point-cloud networks | Architecture | permutation invariance | not applicable or not stated | High |
| Wang2019DGCNN | C | Point-cloud networks | Architecture | permutation invariance | not applicable or not stated | High |
| Zhao2021PointTransformer | C | Point-cloud networks | Architecture | permutation invariance | not applicable or not stated | Medium |
| Ilse2018AttentionMIL | C | Multiple-instance learning | Architecture and theory | permutation invariance | not applicable or not stated | High |
| Campanella2019Clinical | C | Multiple-instance learning | Computational evaluation | permutation invariance | not applicable or not stated | High |
| Lu2021CLAM | C | Multiple-instance learning | Architecture and evaluation | permutation invariance | not applicable or not stated | High |
| Shao2021TransMIL | C | Multiple-instance learning | Architecture | permutation invariance | not applicable or not stated | Medium |
| Chen2022LungMIL | C | Set or point encoders on medical data | Computational evaluation | permutation invariance | builds on segmentation; builds on radiomics | Medium |
| Yang2020NoduleSAT | C | Set or point encoders on medical data | Architecture | permutation invariance | builds on segmentation | Medium |
| Chen2021AMINN | C, D | Set or point encoders on medical data | Computational method (multiple instance learning) | permutation invariance | builds on segmentation; builds on radiomics; removes registration | Medium |
| Zare2025PICASO | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation | Medium |
| GutierrezBecker2018MSPNet | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation; removes registration | High |
| Vosylius2020NeonatalSurface | C | Set or point encoders on medical data | Comparative evaluation | permutation invariance | builds on segmentation | Medium |
| Sarasua2022Hippocampal | C | Set or point encoders on medical data | Comparative evaluation | permutation invariance | builds on segmentation | High |
| Chen2024TractGeoNet | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation | High |
| Beetz2025PointVAE | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation | High |
| Jia2024PFT | C | Set or point encoders on medical data | Comparative evaluation | permutation invariance | builds on segmentation | Medium |
| vanDijk2024CytoSummaryNet | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation | High |
| Avants2008Symmetric | D | Registration | Computational method, evaluation against manual labels | registration to a common space | is a pipeline step | High |
| Brett2001Spatial | D | Registration | Computational method, simulation and patient evaluation | registration to a common space | is a pipeline step | High |
| Balakrishnan2019VoxelMorph | D | Registration | Computational method (learning-based registration) | registration to a common space | is a pipeline step | High |
| Rakic2026AtlasMorph | D | Registration | Computational method (learned conditional templates) | learned template or barycenter | is a pipeline step | High |
| Juhling2024Spatial | D | Registration | Empirical comparison, n = 122 | registration to a common space | is a pipeline step | High |
| Miller2025Comparison | D | Registration | Empirical comparison, n = 11 | registration to a common space | is a pipeline step | Medium |
| Mok2022Unsupervised | D | Registration | Computational method (registration with absent correspondences) | registration to a common space | is a pipeline step | Medium |
| Choi2026Tumor | D | Registration | Empirical comparison and prediction, n = 240 test | registration to a common space | builds on registration | High |
| Lambin2012Radiomics | D | Radiomics | Position paper | not applicable or not stated | is a pipeline step | Medium |
| Aerts2014Decoding | D | Radiomics | Quantitative cohort study, n = 1,019 | not applicable or not stated | builds on radiomics | High |
| Gillies2016Radiomics | D | Radiomics | Review | not applicable or not stated | is a pipeline step | Medium |
| vanGriethuysen2017Computational | D | Radiomics | Software | not applicable or not stated | is a pipeline step | High |
| Zwanenburg2020Image | D | Radiomics | Multi-team consensus and validation study | not applicable or not stated | is a pipeline step | High |
| Traverso2018Repeatability | D | Radiomics | Systematic review, 41 studies | not applicable or not stated | is a pipeline step | High |
| Janse2026Deep | D | Radiomics | Empirical comparison, n = 105 + 41 | not applicable or not stated | builds on segmentation; builds on radiomics | High |
| Isensee2021nnUNet | D | Lesion or region segmentation | Computational method, 23 datasets | not applicable or not stated | is a pipeline step | High |
| Isensee2024Revisited | D | Lesion or region segmentation | Benchmark study | not applicable or not stated | is a pipeline step | High |
| Menze2015Multimodal | D | Lesion or region segmentation | Challenge and benchmark | not applicable or not stated | is a pipeline step | High |
| Carass2017Longitudinal | D | Lesion or region segmentation | Challenge and benchmark | not applicable or not stated | is a pipeline step | High |
| Baumgartner2021nnDetection | D | Lesion or region segmentation | Computational method (detection) | not applicable or not stated | is a pipeline step | High |
| Wynen2025ConfLUNet | D | Lesion or region segmentation | Computational method and evaluation framework, n = 63 | not applicable or not stated | is a pipeline step | High |
| Prabhakar2023Selfpruning | D | Subject-level prediction from lesion or region sets | Computational method (lesion graph network) | permutation invariance | builds on segmentation; removes registration | Medium |
| Wilk2025Towards | D | Subject-level prediction from lesion or region sets | Empirical comparison of aggregation, n = 115 | permutation invariance | builds on segmentation; builds on radiomics; removes registration | High |
| Geady2025Radiomic | D | Subject-level prediction from lesion or region sets | Quantitative review with replication, 3,930 patients | permutation invariance | builds on segmentation; builds on radiomics; removes registration | High |
| Bates2003Voxel | D | Subject-level prediction from lesion or region sets | Computational method (VLSM), n = 101 | registration to a common space | builds on registration; builds on segmentation | High |
| Bowren2022Poststroke | D | Subject-level prediction from lesion or region sets | Predictive validation in independent sample | registration to a common space | builds on registration; builds on segmentation | High |
| Fujibayashi2021Nonlinear | D | Subject-level prediction from lesion or region sets | Empirical comparison (sample size not given in abstract) | registration to a common space | builds on registration | Low |
| Peyre2016Gromov | B | Transport barycenters and templates | Algorithm | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Feydy2019Fast | B | Registration-free transport in medical imaging | Algorithm and neuroimaging application | transport coupling; learned template or barycenter | not applicable or not stated | Medium |
| Beier2022Linear | B | Transport embeddings and transport prediction | Theory and experiments | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Luise2018Differential | B | Entropic and unbalanced OT | Theory and algorithm | transport coupling | not applicable or not stated | Medium |
| Kundu2020Enabling | B | Registration-free transport in medical imaging | Method and cohort study | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Peyre2019Computational | B | Entropic and unbalanced OT | Survey | transport coupling | not applicable or not stated | Medium |
| Beg2005Computing | D | Registration | Computational method | registration to a common space | is a pipeline step | High |
| Harshman1970Foundations | A | Unaligned-mode decomposition | Decomposition model, uniqueness proof | assumes alignment | not applicable or not stated | Medium |
| Tripathi2023Tensor | A | Tensor model, neuro or medical | Tensor learning pipeline, cohort study | assumes alignment | not applicable or not stated | Medium |
| Adeli2017Joint | A | Tensor model, neuro or medical | Multilinear regression, longitudinal data | assumes alignment | not applicable or not stated | Medium |
| Togninalli2019Wasserstein | B | Transport embeddings and transport prediction | Kernel method and benchmark | transport coupling | not applicable or not stated | Medium |
| Kwon2025Graph | B, C | Set or point encoders on medical data | Prototype GNN, multi-cohort | learned template or barycenter; permutation invariance | removes registration | High |
| Karimzadeh2026Revisiting | C, D | Set or point encoders on medical data | Comparative evaluation, two centres | permutation invariance; registration to a common space | builds on segmentation; builds on radiomics; builds on registration | High |
| Alberb2026Automated | C, D | Subject-level prediction from lesion or region sets | Pipeline and cohort study, n = 227, preprint | permutation invariance | builds on segmentation; builds on radiomics; removes registration | Medium |
| Diao2024Multi | C, D | Set or point encoders on medical data | Method, small PET datasets | permutation invariance | builds on segmentation; builds on radiomics; removes registration | Medium |
| Brzus2026Clinical | D | Subject-level prediction from lesion or region sets | Platform with independent test, n = 604 + 153 | registration to a common space | builds on segmentation; builds on registration | High |
| DiazMartin2026Gromov | B | Transport barycenters and templates | Theory and algorithm | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Bai2025Linear | B | Transport embeddings and transport prediction | Theory and algorithm | learned template or barycenter; transport coupling | not applicable or not stated | Medium |
| Wang2024Graph | B, C | Transport barycenters and templates | Method, theory and benchmark | learned template or barycenter | not applicable or not stated | High |
| Song2024Multimodal | B, C | Multiple-instance learning | Architecture and benchmark | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Verdelho2025MIL | C | Multiple-instance learning | Comparative evaluation | permutation invariance | not applicable or not stated | Medium |
| Li2025MultiStage | C, D | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | builds on segmentation | Medium |
| Dong2024Self | D | Registration | Self-supervised method, n = 402 | registration to a common space | removes registration | Medium |
| Sabouri2025Enhancing | D | Subject-level prediction from lesion or region sets | Aggregation comparison, n = 81 | permutation invariance | builds on segmentation; builds on radiomics; removes registration | Medium |
| Kendrick2022Fully | D | Lesion or region segmentation | Segmentation and biomarker study, n = 337 scans | not applicable or not stated | is a pipeline step | High |
| Gacheva2026Multiple | C | Set or point encoders on medical data | MIL with reader comparison, n = 422 | permutation invariance | removes registration | Medium |
| Huang2026Atlas | C, D | Subject-level prediction from lesion or region sets | Architecture, preprint | registration to a common space | builds on registration | Medium |
| Gurler2023Template | D | Registration | Template registration network | registration to a common space; learned template or barycenter | builds on registration | Medium |
| Liu2023Coordinatized | D | Subject-level prediction from lesion or region sets | Multi-centre cohort study, n = 679 | registration to a common space | builds on registration; builds on segmentation; builds on radiomics | High |
| Bonkhoff2024Prediction | D | Subject-level prediction from lesion or region sets | Cross-dataset comparison, three datasets | registration to a common space | builds on registration; builds on segmentation | High |
| Sperber2023Stroke | D | Subject-level prediction from lesion or region sets | Comparison of lesion size and spatial features, n = 753 | registration to a common space | builds on registration; builds on segmentation | High |
| Seghier2023Elusive | D | Subject-level prediction from lesion or region sets | Review | registration to a common space | builds on registration; builds on segmentation | Medium |
| Liu2026Three | C | Set or point encoders on medical data | Comparative evaluation, n = 79 | permutation invariance | builds on registration | Medium |
| Islam2026NeuroAPS | C | Set or point encoders on medical data | Architecture and dataset | permutation invariance | not applicable or not stated | Medium |
| Ren2025OTSurv | B, C | Multiple-instance learning | Architecture and benchmark | transport coupling | not applicable or not stated | High |
| Xu2023Representing | A, B | Transport barycenters and templates | Factorization model and benchmark | learned template or barycenter; transport coupling | not applicable or not stated | High |
| Collenne2024ReSeT | C | Set or point encoders on medical data | Architecture and evaluation | permutation invariance | not applicable or not stated | Medium |
| Xu2023Multimodal | B, C | Multiple-instance learning | Architecture and benchmark | transport coupling | not applicable or not stated | High |
| Little2023Associating | B | Transport embeddings and transport prediction | Statistical method, genomic cohorts | transport coupling | not applicable or not stated | Medium |
| Xu2024Hybrid | C, D | Set or point encoders on medical data | MIL with few-shot classifier | permutation invariance | builds on segmentation; builds on radiomics; removes registration | Medium |

Column coverage (a source with several labels is counted under each):

- Themes: A 29; B 46; C 41; D 44.
- Correspondence handling: registration to a common space 21; learned template or barycenter 36; transport coupling 40; permutation invariance 40; assumes alignment 18; not applicable or not stated 16.
- Pipeline relation: removes registration 16; builds on registration 21; builds on radiomics 12; builds on segmentation 30; is a pipeline step 21; not applicable or not stated 76.

## Synthesis

This synthesis is the related-work basis for the later methods paper. It is organized by the three parts of the research question: which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (Part 1), how each handles the missing correspondence (Part 2), and where each removes or builds on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines (Part 3). Every statement is limited to what the annotations in the Annotated Bibliography record, and most annotations rest on abstracts; where a source's full text was read, its annotation says so.

### Part 1. Methods that predict a subject-level outcome from unaligned data

#### 1.1 Multilinear and tensor models

The multilinear line starts from decompositions in which every subject shares the same indices. CANDECOMP models individuals as differently weighting the dimensions of a common space [Carroll1970Individual], PARAFAC gives factors that are unique under stated conditions [Harshman1970Foundations], and the survey of higher-order decompositions places CP, Tucker and PARAFAC2 in one framework [Kolda2009Tensor]. Supervised use follows two routes. Multilinear partial least squares predicts a response from a multiway array: N-PLS stabilizes the decomposition relative to unfolding and predicted better on noisy fluorescence data [Bro1996Multiway], it was applied to concurrent EEG and fMRI [MartinezMontes2004Concurrent], higher-order PLS projects onto sums of orthogonal Tucker tensors and suits small samples [Zhao2013HOPLS], tensor envelope PLS gives a population model with consistency [Zhang2017Envelope], and sparse higher-order PLS restores guarantees when dimensions grow faster than the sample size [Park2026Sparse]. Tensor regression puts a low-rank structure on a coefficient array indexed like the image: CP-structured generalized linear models make voxel-level coefficient arrays estimable [Zhou2013Tensor], Bayesian versions add shrinkage priors on PARAFAC or Tucker coefficients with neuroimaging applications [Guhaniyogi2017Bayesian, Spencer2024Bayesian], envelope methods model a tensor response [Li2017Parsimonious], and covariate-informed CP and incomplete-observation regressions extend the setting [Lock2018Supervised, Xu2024Incomplete].

In medical imaging these models predict subject-level outcomes from registered images: the voxel-indexed coefficient tensors of [Zhou2013Tensor, Guhaniyogi2017Bayesian, Li2017Parsimonious, Zhang2017Envelope, Spencer2024Bayesian] require voxels to correspond across subjects. Shift-aware sparse Kronecker classification is the one tensor classifier found that names spatial misalignment across subjects as a problem; it learns cyclic shifts of the input and reports competitive classification on OASIS-1 and ADNI-1 [Huang2026ShiftAware]. The merge-run proceedings queries added two medical tensor predictors: a tensor learning pipeline for pulmonary arterial wedge pressure from cardiac MRI in 1346 subjects [Tripathi2023Tensor], and a multilinear regression of infant development scores from longitudinal imaging features with missing time points, whose features are bag-of-words summaries of the images [Adeli2017Joint].

Decompositions with an unaligned mode relax the shared index in one mode. PARAFAC2 applies when matrices share column units but differ in row units [Kiers1999PARAFAC2]; it has been fitted with constraints on every mode [Roald2022AOADMM], coupled with matrix factorizations [Schenker2025PARAFAC2CMTF], and supervised by downstream tasks in electronic health records [Ren2023MULTIPAR, Konyar2025SemiSupervised], including a joint PARAFAC2 and Cox model for risk prediction [Patalano2026PAR2COX]. Unaligned observations of a continuous mode are represented by functions in a reproducing kernel Hilbert space [Tang2026Unaligned], and ragged tensors are decomposed with a weighting tensor over the valid domain [Hu2026Ragged]. In all of these the unaligned mode is time or an index range, and the supervised examples are EHR studies [Ren2023MULTIPAR, Konyar2025SemiSupervised, Patalano2026PAR2COX].

Point clouds enter the multilinear line in manufacturing: regularized tensor regression links structured point clouds to process variables [Yan2019Structured], and ANTLER performs nonlinear tensor regression from unstructured point clouds of varying size to a vector response, stating that structured subsampling and hand-crafted features cause quantization artefacts [Biehler2024ANTLER]. Transport appears in a tensor model as the reconstruction loss of a CP factorization whose factors served as features for downstream prediction [Afshar2021SWIFT]. GW factorization reconstructs each graph, of unknown node correspondence and different size, from shared graph factors and gives a permutation-invariant representation used for classification [Xu2023Representing]; it is the closest analogue found of a decomposition with shared factors over unaligned elements.

#### 1.2 Transport-based predictors

The computational basis of transport predictors is entropic regularization solved by Sinkhorn scaling [Cuturi2013Sinkhorn], its extension to unbalanced problems [Chizat2018Scaling], Sinkhorn divergences that interpolate between MMD and transport [Feydy2019Interpolating], gradients of the sharp Sinkhorn approximation [Luise2018Differential], neural estimators that replace the Sinkhorn step at large sizes [Wang2026NeuralEntropic], and the survey of computational transport [Peyre2019Computational]. Gromov-Wasserstein distances compare metric measure spaces up to isometry [Memoli2011GromovWasserstein], fused GW adds node features and outperformed graph kernels and graph convolutional networks on graph classification [Vayer2019Structured], unbalanced GW relaxes mass conservation [Sejourne2021Unbalanced], and GW barycenters average distance or kernel matrices of different sizes without a row correspondence [Peyre2016Gromov].

Three families of subject-level predictors build on these tools. The first is transport-based morphometry, which maps each subject's image to a fixed reference and fits a classifier or regressor in the transport domain. It found aging-related brain changes with linear models [Kundu2018Discovery], predicted 16p11.2 copy number variation from brain images with 89 to 95 percent test accuracy [Kundu2024Discovering], predicted symptomatic osteoarthritis 3 years ahead from cartilage texture maps with 78 percent test accuracy in 86 individuals [Kundu2020Enabling], and predicted hematoma expansion with AUROC 0.71 on an external cohort of 170 patients [Ironside2025Predictive]. Unbalanced transport morphometry separates mass change from location change and recovered dementia-related changes that voxel-based morphometry did not [Gerber2018Exploratory].

The second family embeds each set or image through its transport to a reference. Linear optimal transport gives an isometric linear embedding and efficient pairwise distances [Wang2013Linear], with conditions for linear separability [Moosmuller2023Linear], a nearest-subspace classifier for deformed point sets [ShifatERabbi2025Linear], and patient-level classification of single-cell point clouds [Wang2025Linearized]. Linearized variants exist for partial transport [Bai2023Linear], for GW [Beier2022Linear] and for partial GW [Bai2025Linear]. Trainable references turn the embedding into a layer: elements are aggregated by their transport plan to a trainable reference [Mialon2021Trainable], graphs are embedded by Monge maps from a reference distribution [Kolouri2021Wasserstein], FGW distances to learnable template graphs feed a classifier [VincentCuaz2022Template], and labelled graphs are predicted as FGW barycenters with input-dependent weights [BrogatMotte2022Learning]. Barycentric coefficients with respect to reference measures [Mallery2025Synthesis] or known GW templates [DiazMartin2026Gromov] give fixed-length features, and Mallery2025Synthesis reports better efficiency than neural baselines on small training sets. Transport kernels compare node-feature distributions of graphs [Togninalli2019Wasserstein] or somatic mutation profiles for kernel regression on survival [Little2023Associating]. A learned-reference classifier that compares node-embedding distributions to references by MMD instead of transport carries generalization bounds [Wang2024Graph].

The third family uses transport inside medical or biomedical prediction pipelines. CMOT-Fusion couples patch embeddings of unregistered T2-weighted and ADC prostate MRI through a learned cost and reached ensemble AUC 0.824 on a 50-patient temporal test set against 0.839 for PI-RADS v2.1, with the authors calling the findings exploratory [Gong2026Robust]. In computational pathology, unbalanced transport serves as the MIL pooling operator for survival [Ren2025OTSurv], transport matches whole-slide patches to gene embeddings [Xu2023Multimodal], and morphological prototypes are fused with pathway prototypes by transport cross-alignment [Song2024Multimodal]. Transport is also used for steps that precede prediction: fMRI dictionaries learned across individual geometries [Mazelet2026Learning], functional alignment of cortical surfaces [Thual2022Aligning], group averaging of fMRI and MEG maps [Gramfort2015Fast], tractogram label transfer and atlas estimation [Feydy2019Fast], point-cloud registration of lung vessel trees [Shen2021Accurate], longitudinal lesion matching [Qahqaie2026Unbalanced], and Wasserstein barycenters and dictionaries [CuturiDoucet2014Fast, Schmitz2018Wasserstein, VincentCuaz2021Online].

#### 1.3 Set encoders, point-cloud networks and multiple-instance learning

Permutation-invariant set functions take the sum-decomposition form characterized by Deep Sets [Zaheer2017DeepSets]. Their capacity is bounded by theory: with continuous mappings the latent dimension must be at least the maximum set size [Wagstaff2019Limitations], Deep Sets is universal only with a sufficiently high-dimensional latent space [Wagstaff2022Universal], moments of piecewise-linear networks cannot be injective [Amir2023Injective], and a latent dimension polynomial in set size and feature dimension suffices for two embedding layers [Wang2024PolynomialWidth]. Attention-based set encoders model interactions among elements [Lee2019SetTransformer]. Point-cloud networks consume points directly [Qi2017PointNet], learn hierarchical local features [Qi2017PointNetPP], use dynamic neighbourhood graphs [Wang2019DGCNN] or self-attention [Zhao2021PointTransformer]. Multiple-instance learning predicts a bag label from instances: attention pooling gives per-instance weights [Ilse2018AttentionMIL], weakly supervised slide classification reached AUC above 0.98 on 44,732 whole-slide images [Campanella2019Clinical], attention with instance clustering is data efficient [Lu2021CLAM], and correlated MIL adds spatial information among instances [Shao2021TransMIL].

Subject-level medical uses cover lesion sets, anatomical point clouds and bags of measurements. For lesion sets, attention MIL over pyRadiomics nodule features diagnosed lung cancer in 110 patients [Chen2022LungMIL], set attention over a patient's nodules improved malignancy classification [Yang2020NoduleSAT], an autoencoder-based MIL network over all liver metastases of a patient reached AUC 0.70, 11.4 percent above the largest-lesion baseline [Chen2021AMINN], and its survival extension with automatic segmentation reached C-index 0.69 in 227 patients [Alberb2026Automated]. Multi-nodal PET radiomics sets for Hodgkin versus non-Hodgkin lymphoma were classified by Transformer, Deep Sets, MIL, Set Transformer and graph models across two centres [Karimzadeh2026Revisiting]; multi-instance aggregation of radiomic and deep features classified tumour subtypes in small PET datasets [Diao2024Multi]; MIL over lymphoma lesions in PET/CT with a few-shot classifier reached AUC 0.795 against radiomics baselines [Xu2024Hybrid]; cross-attention among peritoneal lesions improved AUC by 8.7 percent and C-index by 5.9 percent [Li2025MultiStage]; a Set Transformer over a patient's skin lesions encodes the ugly-duckling comparison [Collenne2024ReSeT]; and MIL over a patient's MR spectra reached AUC 0.82 against neuroradiologists [Gacheva2026Multiple]. Hand-designed aggregation of per-lesion radiomics is studied directly: using all lesions improved the c-index for distant metastasis in NSCLC [Wilk2025Towards], ten replicated aggregation methods showed no single best method across 3,930 patients [Geady2025Radiomic], and lesion selection and aggregation choices changed progression and time-to-progression predictions in neuroendocrine tumours [Sabouri2025Enhancing].

For anatomical point clouds and surfaces, multi-structure PointNet-style networks classified Alzheimer's disease from hippocampus and ventricle point clouds [GutierrezBecker2018MSPNet], PointNet++ on neonatal cortical surfaces predicted post-menstrual age with test MAE 0.62 weeks against 0.82 for a 3D CNN [Vosylius2020NeonatalSurface], the choice of hippocampal representation changed Alzheimer's prediction [Sarasua2022Hippocampal], point-cloud regression over tract microstructure predicted language scores in 806 subjects [Chen2024TractGeoNet], a point-cloud autoencoder of cardiac anatomy improved myocardial infarction prediction over clinical benchmarks [Beetz2025PointVAE], vessel point clouds and graphs estimated pulmonary function [Jia2024PFT], an electric-field point cloud predicted deep brain stimulation response in 79 patients [Liu2026Three], and T1 MRI converted to point clouds classified Alzheimer's disease with lower latency [Islam2026NeuroAPS]. Prototype graph networks on sulcal pit graphs classified congenital heart disease against controls [Kwon2025Graph]. Outside imaging, Deep Sets aggregation of single-cell profiles improved mechanism-of-action prediction by 30 to 68 percent over average profiling [vanDijk2024CytoSummaryNet], set operators over glomerular crops classified nephropathology cases with external validation [Zare2025PICASO], and MIL selection of a representative slide improved survival prediction for patients with several whole-slide images [Verdelho2025MIL].

#### 1.4 Registration-based and pipeline predictors

The registration-based comparators map each subject's lesion or image into a template space and predict from location. Voxel-based lesion-symptom mapping relates damage to behaviour voxel by voxel [Bates2003Voxel]; lesion-behaviour and lesion-network maps predicted 12-month outcomes in an independent stroke sample [Bowren2022Poststroke]; an automated platform with lesion location and network features was trained on 604 patients and applied to 153 [Brzus2026Clinical]; volume, location and disconnection representations were compared across three stroke datasets [Bonkhoff2024Prediction]; and lesion size was compared with spatial lesion features in 753 patients [Sperber2023Stroke]. Outside stroke, tumour location probability maps fused with radiomics predicted glioma grade, IDH status and survival across three centres [Liu2023Coordinatized], tumour-aware registration supported radiation pneumonitis prediction in 240 NSCLC patients [Choi2026Tumor], and nonlinear registration preprocessing raised deep-learning Alzheimer's classification accuracy over affine registration [Fujibayashi2021Nonlinear]. In brain graphs, registration to a population template before a GNN raised the accuracy of four GNNs [Gurler2023Template]; an atlas-free brain network transformer with individualized parcellations outperformed atlas-based methods [Huang2026Atlas]; and a teacher-student method made a CNN designed for registered CTA work on unregistered images [Dong2024Self]. Single-region radiomic signatures predict outcomes when one tumour per patient is summarized [Aerts2014Decoding], and whole-body lesional volume from automatic segmentation was associated with survival [Kendrick2022Fully].

### Part 2. How each method handles the missing correspondence

#### 2.1 Registration to a common space

Registration constructs the correspondence before prediction. The reference methods are LDDMM, which computes diffeomorphic maps along geodesic flows [Beg2005Computing], symmetric diffeomorphic normalization [Avants2008Symmetric], and learning-based registration that predicts a deformation field from an image pair [Balakrishnan2019VoxelMorph]. Learned conditional templates give a population target conditioned on subject attributes [Rakic2026AtlasMorph], and a template can also be learned for brain graphs [Gurler2023Template]. The evidence on lesion-bearing images is that the correspondence does not exist at the lesion: cost-function masking was introduced because normalization distorts the image at the lesion site [Brett2001Spatial]; a deep method jointly estimates regions with absent correspondence [Mok2022Unsupervised]; three registration tools all had marked difficulty with large perinatal stroke lesions [Miller2025Comparison]; nonlinear variants distorted stroke images while lesion-symptom maps stayed largely consistent, so the authors judged the benefit of nonlinear registration for VLSM questionable [Juhling2024Spatial]; and tumour-aware registration best preserved tumour volume and gave slightly higher pneumonitis prediction, with regions robust to the registration choice [Choi2026Tumor]. The review of lesion load names spatial warping of the lesion or region and parcellation choice as error sources of the registration-based lesion feature [Seghier2023Elusive]. Two sources show registration helping prediction: nonlinear DARTEL registration raised Alzheimer's classification accuracy over affine registration [Fujibayashi2021Nonlinear], and registration of brain graphs to a template raised GNN accuracy [Gurler2023Template]. Inside a model, the shift-aware tensor classifier learns cyclic shifts as a restricted registration [Huang2026ShiftAware].

#### 2.2 Learned template or barycenter

A template replaces pairwise correspondence with one correspondence per subject to a shared object. The transport form computes Wasserstein barycenters by entropic smoothing [CuturiDoucet2014Fast], GW barycenters of matrices of different sizes [Peyre2016Gromov], dictionaries whose atoms are learned through entropic barycenters [Schmitz2018Wasserstein] or GW barycenters [VincentCuaz2021Online], and shared graph factors under the GW discrepancy [Xu2023Representing]. For supervised prediction, the template is either fixed or learned. Fixed references underlie LOT and transport-based morphometry [Wang2013Linear, Moosmuller2023Linear, ShifatERabbi2025Linear, Kundu2018Discovery, Kundu2020Enabling, Kundu2024Discovering, Ironside2025Predictive]. Learned references are trained end to end in [Mialon2021Trainable, Kolouri2021Wasserstein, VincentCuaz2022Template, BrogatMotte2022Learning], and the analysis problem for known templates gives barycentric coordinates as features [Mallery2025Synthesis, DiazMartin2026Gromov]. Non-transport templates follow the same pattern: learned reference distributions compared by MMD [Wang2024Graph], learned prototypes that replace graph matching to a reference set of sulcal patterns [Kwon2025Graph], and morphological prototypes that compress whole-slide patch sets more than 300 times [Song2024Multimodal]. In the multilinear line, PARAFAC2 shares factors across slabs while the unaligned mode varies per slab; the Theme A annotations file this under learned template as the closest category [Kiers1999PARAFAC2, Roald2022AOADMM, Ren2023MULTIPAR, Konyar2025SemiSupervised, Schenker2025PARAFAC2CMTF, Patalano2026PAR2COX]. On the registration side, conditional templates [Rakic2026AtlasMorph] and the population connectional template [Gurler2023Template] are estimated from data but are then used as registration targets. Fixed-reference transport has produced most of the clinical evidence [Kundu2018Discovery, Kundu2020Enabling, Kundu2024Discovering, Ironside2025Predictive], while learned transport templates have been evaluated on graph, sequence and point-cloud benchmarks [Mialon2021Trainable, Kolouri2021Wasserstein, VincentCuaz2022Template, BrogatMotte2022Learning, Mallery2025Synthesis].

#### 2.3 Transport coupling

A transport coupling is a soft correspondence computed per pair of subjects or per subject and template [Cuturi2013Sinkhorn, Peyre2019Computational]. Couplings between intra-object distance structures are invariant to isometries [Memoli2011GromovWasserstein], fused couplings use node features and structure jointly [Vayer2019Structured], and couplings between cortical vertices of two subjects give landmark-free functional alignment with an unbalanced term for areas that differ in size [Thual2022Aligning]. Unequal mass is handled by unbalanced transport [Chizat2018Scaling, Sejourne2021Unbalanced], partial transport embeddings [Bai2023Linear, Bai2025Linear], unbalanced morphometry [Gerber2018Exploratory], unbalanced lesion matching that yields new, disappearing, merging and splitting lesions [Qahqaie2026Unbalanced], and unbalanced transport pooling in MIL [Ren2025OTSurv]. Couplings serve as the fusion mechanism between unregistered sequences [Gong2026Robust] and between patch and gene sets [Xu2023Multimodal, Song2024Multimodal], as the comparison in graph kernels [Togninalli2019Wasserstein], as a similarity between mutation profiles [Little2023Associating], and as label transfer between tractograms [Feydy2019Fast]. Differentiability matters when the coupling sits inside a trained predictor: the gradient of the sharp Sinkhorn approximation [Luise2018Differential], Sinkhorn divergences with GPU gradients for a million samples [Feydy2019Interpolating], and the multiscale solver for millions of points [Feydy2019Fast] make end-to-end training feasible. Inside a tensor model, transport has been found only as a reconstruction loss [Afshar2021SWIFT].

#### 2.4 Permutation invariance

Permutation-invariant models make the prediction independent of element order, so no correspondence between elements of different subjects is computed [Zaheer2017DeepSets, Qi2017PointNet, Ilse2018AttentionMIL, Lee2019SetTransformer]. The theory says what this costs: sum pooling needs a latent dimension tied to the maximum set size for universal representation [Wagstaff2019Limitations, Wagstaff2022Universal], and injectivity depends on the activation [Amir2023Injective, Wang2024PolynomialWidth]. Invariance removes element-to-element correspondence but also discards where elements are unless position is added as a feature. The medical sources treat position in four ways. Some pool features without positions [Chen2021AMINN, Wilk2025Towards, Geady2025Radiomic, Sabouri2025Enhancing, Diao2024Multi]. Some model relations within a subject through attention or proximity graphs [Yang2020NoduleSAT, Shao2021TransMIL, Prabhakar2023Selfpruning, Li2025MultiStage, Collenne2024ReSeT]. Some map each structure to a canonical space with a learned transform before pooling [GutierrezBecker2018MSPNet]. Some attach coordinates from a registration as element features: in lymphoma, adding demographic variables and lymph-node centres of mass after rigid registration to a common reference space to the radiomic features consistently improved discrimination [Karimzadeh2026Revisiting]. Point clouds in native coordinates were used for neonatal surfaces [Vosylius2020NeonatalSurface], and anatomical region labels were attached to points [Islam2026NeuroAPS].

The pooling function itself is a modelling choice with mixed evidence. In AMINN, average pooling was best and attention pooling did not outperform other pooling functions, which the authors attribute to limited data [Chen2021AMINN]; in MR spectroscopy MIL, min-max-mean pooling gave the best configuration [Gacheva2026Multiple]; in lymphoma PET/CT MIL, max pooling did [Xu2024Hybrid]; across ten replicated multi-lesion aggregation methods no single method was best [Geady2025Radiomic]; and selecting one representative slide by MIL beat aggregating predictions over slides [Verdelho2025MIL]. Learned interactions among lesions were reported to help in peritoneal metastasis [Li2025MultiStage], lung nodules [Yang2020NoduleSAT] and skin lesions [Collenne2024ReSeT].

#### 2.5 Assuming alignment

Many models in the corpus assume a shared index. Voxel-indexed tensor regression and tensor PLS assume registered images [Zhou2013Tensor, Guhaniyogi2017Bayesian, Li2017Parsimonious, Zhang2017Envelope, Spencer2024Bayesian]; multilinear PLS in chemometrics and electrophysiology assumes shared wavelengths or channels [Bro1996Multiway, Zhao2013HOPLS, MartinezMontes2004Concurrent]; and the methods for irregular modes keep a shared coordinate, whether a continuous domain [Tang2026Unaligned], a masked index [Hu2026Ragged] or a common time grid [Xu2024Incomplete]. Structured point-cloud regression requires points on a common structure [Yan2019Structured]. Medical tensor predictors used standard cardiac views [Tripathi2023Tensor] or bag-of-words image summaries [Adeli2017Joint]. The ANTLER abstract states that varying size is handled directly but does not state how points correspond [Biehler2024ANTLER].

#### 2.6 Combinations of the routes

Several methods combine routes. Trainable-reference embeddings combine a learned template with a transport coupling [Mialon2021Trainable, Kolouri2021Wasserstein, VincentCuaz2022Template]; prototype compression is combined with transport fusion [Song2024Multimodal] and transport pooling with learned prototypes [Ren2025OTSurv]; permutation-invariant set encoders are combined with coordinates from rigid registration [Karimzadeh2026Revisiting] or with a learned canonical transform [GutierrezBecker2018MSPNet]; prototype graph networks combine learned templates with permutation-invariant graph encoding [Kwon2025Graph]; fused registration and location features are combined with per-region radiomics [Liu2023Coordinatized]; and GW factorization combines shared factors with GW couplings to give a permutation-invariant representation [Xu2023Representing]. The atlas-free brain network transformer replaces atlas regions with subject-specific regions while keeping a standardized voxel feature space [Huang2026Atlas], and the teacher-student method transfers a registered-image model to unregistered inputs [Dong2024Self].

### Part 3. Where each method removes or builds on pipeline steps

#### 3.1 The registration step

Registration-based predictors build on it by construction [Bates2003Voxel, Bowren2022Poststroke, Brzus2026Clinical, Bonkhoff2024Prediction, Sperber2023Stroke, Liu2023Coordinatized, Choi2026Tumor, Fujibayashi2021Nonlinear], and so do voxel-indexed tensor regressions [Zhou2013Tensor, Guhaniyogi2017Bayesian, Li2017Parsimonious, Zhang2017Envelope, Spencer2024Bayesian] and shift-aware classification, which corrects residual misalignment after registration [Huang2026ShiftAware]. The lesion-set predictors remove cross-subject registration because each lesion is summarized by features computed in its own image [Chen2021AMINN, Prabhakar2023Selfpruning, Wilk2025Towards, Geady2025Radiomic, Alberb2026Automated, Diao2024Multi, Xu2024Hybrid, Sabouri2025Enhancing]. Transport-based sources remove or replace specific registration uses: inter-sequence registration in prostate MRI [Gong2026Robust], projection onto a common anatomical template in fMRI dictionary learning [Mazelet2026Learning], coarse anatomical co-registration in functional alignment [Thual2022Aligning], deformation-based morphometry [Kundu2018Discovery], and graph matching to a reference set in sulcal pattern analysis [Kwon2025Graph]. Some keep a lighter registration: rigid registration supplies lymph-node coordinates [Karimzadeh2026Revisiting], registration of MRI and CT precedes the electric-field point clouds [Liu2026Three], a deformable registration's Jacobian enters the lesion-matching cost [Qahqaie2026Unbalanced], and the atlas-free transformer keeps a standardized voxel space [Huang2026Atlas].

The cost of removing registration without another mechanism was measured once: a CNN trained directly on unregistered CTA reached AUC 0.63, while the teacher on registered images reached 0.81 and the self-supervised student on unregistered images 0.88 [Dong2024Self]. The cost of keeping registration is reported as alignment failure at lesions [Brett2001Spatial, Miller2025Comparison, Mok2022Unsupervised], distortion without a change in the lesion-symptom map [Juhling2024Spatial], error in the lesion-load feature [Seghier2023Elusive], and a small change in prediction AUC between registration methods [Choi2026Tumor]. Registration-based lesion predictors from small single-centre datasets did not generalize across datasets (median R2 0.2 percent), while larger and multicentre training raised R2 to 15.8 and 24.4 percent [Bonkhoff2024Prediction]; spatial lesion features beat lesion size only slightly in 753 patients and fell to its level or below with 150 or 50 training patients [Sperber2023Stroke]. In gliomas, location features from a common space added accuracy and cross-site stability to radiomics [Liu2023Coordinatized].

#### 3.2 The lesion-segmentation step

Lesion-set predictors build on segmentation or detection, because the set is defined by the lesion instances. The segmentation step is supplied by self-configuring frameworks [Isensee2021nnUNet, Baumgartner2021nnDetection] whose CNN-based U-Net recipe remains the reference [Isensee2024Revisited], and instance-level segmentation of confluent lesions changes lesion counts relative to connected components [Wynen2025ConfLUNet]. Benchmarks show rater disagreement (Dice 74 to 85 percent in BRATS) [Menze2015Multimodal] and give longitudinal MS lesion references [Carass2017Longitudinal]. Automatic segmentation now feeds subject-level predictors: whole-body PSMA lesion segmentations with lesion-level PPV 88.2 percent and sensitivity 73.0 percent gave survival-associated volume biomarkers [Kendrick2022Fully]; automated liver metastasis segmentation with Dice 0.78 fed a MIL survival model [Alberb2026Automated]; outcome predictions built on automated stroke lesion segmentation had 96 percent concordance with manual methods [Brzus2026Clinical]; and lesion detection with self-supervised features fed a lesion graph for MS activity [Prabhakar2023Selfpruning]. Other set predictors rely on manual or dataset masks: radiologist delineation in AMINN [Chen2021AMINN] and LIDC-IDRI nodule masks in lung MIL, whose authors state the dependence on detection and segmentation [Chen2022LungMIL]. Anatomical point clouds build on structure segmentation, surface extraction or tractography [GutierrezBecker2018MSPNet, Vosylius2020NeonatalSurface, Sarasua2022Hippocampal, Chen2024TractGeoNet, Beetz2025PointVAE, Jia2024PFT]. Transport-based morphometry has been applied to tissue segmentations [Gerber2018Exploratory] and hematoma images [Ironside2025Predictive], and transport lesion matching builds on lesion segmentation [Qahqaie2026Unbalanced]. Whole-slide MIL removes manual pixel-level annotation from training [Campanella2019Clinical, Lu2021CLAM, Shao2021TransMIL].

#### 3.3 The radiomics step

Radiomics is defined as high-throughput extraction of image features from a region [Lambin2012Radiomics, Gillies2016Radiomics], with prognostic signatures validated on 1,019 patients [Aerts2014Decoding], an open-source extractor [vanGriethuysen2017Computational], standardized feature definitions [Zwanenburg2020Image] and known sensitivity of reproducibility to acquisition and processing [Traverso2018Repeatability]. Lesion-set predictors use radiomics as the per-element encoder [Chen2021AMINN, Chen2022LungMIL, Alberb2026Automated, Karimzadeh2026Revisiting, Diao2024Multi, Xu2024Hybrid, Wilk2025Towards, Geady2025Radiomic, Sabouri2025Enhancing], and location features have been fused with ROI radiomics [Liu2023Coordinatized]. The set models then replace the step that selects one lesion: AMINN over all lesions beat the largest-lesion baseline [Chen2021AMINN], and all-lesion aggregation beat the primary tumour alone [Wilk2025Towards]. The volume baseline remains strong: total tumour volume was a strong predictor in head and neck cancer [Geady2025Radiomic], deep radiomics did not beat tumour volume [Janse2026Deep], lesion size nearly matched spatial lesion features in stroke [Sperber2023Stroke], and whole-body lesional volume was associated with survival [Kendrick2022Fully]. Diao2024Multi and Xu2024Hybrid learn deep features beside radiomics, and the point-cloud and transport methods learn the element representation from geometry or intensity instead of radiomics [GutierrezBecker2018MSPNet, Chen2024TractGeoNet, Kundu2018Discovery, Gong2026Robust].

#### 3.4 Methods outside the medical-imaging pipeline

A large part of the method literature was developed on benchmarks with no imaging pipeline: graph classification [Vayer2019Structured, VincentCuaz2022Template, Kolouri2021Wasserstein, Togninalli2019Wasserstein, Wang2024Graph, Xu2023Representing], sequences and proteins [Mialon2021Trainable], shapes and point clouds [Beier2022Linear, Bai2025Linear, ShifatERabbi2025Linear, Mallery2025Synthesis], single-cell data [Wang2025Linearized, vanDijk2024CytoSummaryNet], genomics [Little2023Associating], EHR tensors [Ren2023MULTIPAR, Konyar2025SemiSupervised, Patalano2026PAR2COX] and manufacturing point clouds [Yan2019Structured, Biehler2024ANTLER]. In a medical pipeline, these methods would take the place of the predictor after segmentation, with the per-element representation supplied by radiomics, learned features or geometry; none of these sources reports such a use, so the pipeline relation of these methods in medical imaging is not established by the corpus.

#### 3.5 Size and validation of the clinical evidence

The clinical studies that remove or replace registration are mostly small or single-centre. AMINN used 50 multifocal patients among 108 [Chen2021AMINN], lung MIL 110 patients [Chen2022LungMIL], transport fusion a 50-patient temporal test set [Gong2026Robust], osteoarthritis transport morphometry 86 individuals [Kundu2020Enabling], neuroendocrine lesion aggregation 81 patients [Sabouri2025Enhancing] and deep brain stimulation point clouds 24 test patients, with the authors disclaiming generalization [Liu2026Three]. External or independent evaluation appears in hematoma transport morphometry (170 test patients from a different study) [Ironside2025Predictive], multi-nodal lymphoma set models (80 patients at a second centre, with a measurable domain shift) [Karimzadeh2026Revisiting], nephropathology set operators [Zare2025PICASO], whole-slide MIL [Lu2021CLAM] and multi-lesion aggregation across three datasets [Geady2025Radiomic]. On the registration side, cross-dataset tests exist for stroke [Bonkhoff2024Prediction, Bowren2022Poststroke, Brzus2026Clinical] and gliomas [Liu2023Coordinatized], and Bonkhoff2024Prediction shows that within-dataset cross-validation overstated cross-dataset performance.

## Identified Gaps

These gaps are cross-theme. Each names the included sources that bound it and the searches, in the theme runs and in this merge run, that returned no source filling it.

1. No subject-level predictor relates the elements of lesion or region sets across subjects through a learned transport template or a transport coupling. Learned transport templates are trained end to end on graph, sequence and point-cloud benchmarks [VincentCuaz2022Template, Mialon2021Trainable, Kolouri2021Wasserstein, BrogatMotte2022Learning, Mallery2025Synthesis, Bai2025Linear]. The clinical transport predictors map one image per subject to a fixed reference [Kundu2018Discovery, Kundu2020Enabling, Kundu2024Discovering, Ironside2025Predictive]. Transport on lesion sets is used for within-patient longitudinal matching [Qahqaie2026Unbalanced], and transport-based MIL acts on whole-slide patches [Ren2025OTSurv, Xu2023Multimodal, Song2024Multimodal]. The lesion-set predictors pool per-lesion features with no cross-subject positional model [Chen2021AMINN, Wilk2025Towards, Geady2025Radiomic, Alberb2026Automated, Sabouri2025Enhancing], or attach rigid-registration coordinates as features [Karimzadeh2026Revisiting]. Searches that found no such study: Theme B L1-24 (OpenAlex, 45 records) and L1-10 (PubMed, 10 records); merge-run X1 (arXiv, 3 records), X2 (PubMed, 18), X7 (Semantic Scholar, top 100 of 1299 screened), X7b (Semantic Scholar, 54; it returned only the pathology and genomics sources Xu2023Multimodal and Little2023Associating), and the forward tracking of VincentCuaz2022Template (39 citers) and Mialon2021Trainable (79 citers).
2. No study compares, on one cohort and outcome, a registration-based predictor with a set-encoder or transport predictor that does without cross-subject registration. Registration-based lesion predictors are evaluated against their own baselines [Bates2003Voxel, Bowren2022Poststroke, Brzus2026Clinical, Bonkhoff2024Prediction, Choi2026Tumor], and so are the lesion-set predictors [Chen2021AMINN, Prabhakar2023Selfpruning, Wilk2025Towards]. The closest same-cohort comparisons change one factor only: registered against unregistered inputs to one CNN [Dong2024Self], affine against nonlinear registration [Fujibayashi2021Nonlinear], registration methods for one downstream model [Choi2026Tumor], location features added to radiomics [Liu2023Coordinatized], set encoders against pooled baselines with rigid-registration coordinates as optional features [Karimzadeh2026Revisiting], and point clouds against a voxel CNN on 24 test patients [Liu2026Three]; MSPNet was compared with spectral shape descriptors and PointNet [GutierrezBecker2018MSPNet]. Searches that found no such study: Theme C and Theme D (their gap 3 and gap 1 respectively), merge-run X3 (PubMed, 41 records) and X4 (arXiv, 6 records), X8 (Semantic Scholar, 152 records, all screened), and forward tracking of Bowren2022Poststroke (105 citers) and Chen2021AMINN (17 citers).
3. No tensor or multilinear model predicts a subject-level imaging outcome with an unaligned spatial mode, and transport enters tensor models only as a loss. Imaging tensor regression and tensor PLS index coefficients by voxel [Zhou2013Tensor, Guhaniyogi2017Bayesian, Li2017Parsimonious, Zhang2017Envelope, Spencer2024Bayesian]; shift-aware classification handles cyclic shifts of a gridded image [Huang2026ShiftAware]; the unaligned-mode models treat time in EHR data or keep a shared coordinate [Ren2023MULTIPAR, Konyar2025SemiSupervised, Patalano2026PAR2COX, Tang2026Unaligned, Hu2026Ragged]; point-cloud tensor regression is limited to manufacturing [Yan2019Structured, Biehler2024ANTLER]; the medical tensor predictors found in proceedings use standard views or bag-of-words features [Tripathi2023Tensor, Adeli2017Joint]; transport appears as a reconstruction loss [Afshar2021SWIFT]; and the GW factorization with shared factors is unsupervised apart from a semi-supervised graph classification extension [Xu2023Representing]. Searches that found no such study: Theme A queries 8, 34 and 37; merge-run M-D1 (60 records), M-D2 (42) and M-D3 (104) over NeurIPS, ICML, ICLR, AISTATS, MICCAI and IPMI; and X5 (arXiv, 47 records), which returned only the already included ANTLER, Yan2019Structured and SWIFT among relevant records.
4. The supervised transport-template layers do not handle unequal total mass, while total lesion load is itself predictive. Unbalanced and partial transport exists as a tool [Chizat2018Scaling, Sejourne2021Unbalanced, Bai2023Linear, Bai2025Linear] and is used for alignment, morphometry, lesion matching and MIL pooling [Thual2022Aligning, Gerber2018Exploratory, Qahqaie2026Unbalanced, Ren2025OTSurv], but the abstracts of the supervised template layers describe no handling of unequal mass [VincentCuaz2022Template, Mialon2021Trainable, Kolouri2021Wasserstein]. In lesion data, total volume or size is a strong baseline [Geady2025Radiomic, Janse2026Deep, Sperber2023Stroke, Kendrick2022Fully], so normalizing each subject's set to unit mass discards a signal the baselines use. Searches that found no supervised unbalanced template predictor on medical sets: Theme B gap 3 searches; merge-run X6 (Semantic Scholar, top 100 of 532 screened), which returned OTSurv and GW factorization, and X7b.
5. The effect of segmentation and registration errors on the subject-level prediction is not measured for lesion-set predictors. Instance errors change lesion counts [Wynen2025ConfLUNet]; raters disagree [Menze2015Multimodal]; automatic lesion detection misses lesions (lesion-level sensitivity 73.0 percent in [Kendrick2022Fully], CRLM Dice 0.78 in [Alberb2026Automated]); and lung MIL states its dependence on segmentation [Chen2022LungMIL]. On the registration side, warping and parcellation are named as error sources of lesion load [Seghier2023Elusive], alignment failure at lesions is documented [Brett2001Spatial, Miller2025Comparison, Mok2022Unsupervised], and only Choi2026Tumor and Dong2024Self report prediction-level effects of the registration choice. Cross-dataset failure of small single-centre models [Bonkhoff2024Prediction] and single-centre designs in most registration-free clinical studies [Gong2026Robust, Chen2021AMINN, Sabouri2025Enhancing, Liu2026Three] leave the transfer of these errors across sites untested. Searches that found no study propagating segmentation or registration error to a subject-level lesion-set prediction: Theme D gaps 3 and 4 searches, merge-run X3 and X8, and forward tracking of Bowren2022Poststroke (76 title matches screened) and Chen2021AMINN.

## Recommended Sources by Paper Section

The later methods paper's sections are not yet written; the grouping below follows the three parts of the research question and the gaps above.

| Section | Key Sources |
|---|---|
| Introduction | [Brett2001Spatial, Seghier2023Elusive, Dong2024Self, Chen2021AMINN, Geady2025Radiomic, Bonkhoff2024Prediction, Kundu2018Discovery, Zaheer2017DeepSets] |
| Related Work: registration to a common space and registration-based predictors | [Beg2005Computing, Avants2008Symmetric, Balakrishnan2019VoxelMorph, Rakic2026AtlasMorph, Brett2001Spatial, Mok2022Unsupervised, Miller2025Comparison, Juhling2024Spatial, Choi2026Tumor, Bates2003Voxel, Bowren2022Poststroke, Brzus2026Clinical, Liu2023Coordinatized, Fujibayashi2021Nonlinear, Gurler2023Template, Huang2026Atlas] |
| Related Work: multilinear and tensor models | [Carroll1970Individual, Harshman1970Foundations, Kolda2009Tensor, Bro1996Multiway, Zhao2013HOPLS, Zhou2013Tensor, Guhaniyogi2017Bayesian, Spencer2024Bayesian, Kiers1999PARAFAC2, Ren2023MULTIPAR, Patalano2026PAR2COX, Tang2026Unaligned, Hu2026Ragged, Huang2026ShiftAware, Biehler2024ANTLER, Afshar2021SWIFT] |
| Related Work: optimal transport, templates and transport-based prediction | [Cuturi2013Sinkhorn, Chizat2018Scaling, Peyre2019Computational, Memoli2011GromovWasserstein, Vayer2019Structured, Sejourne2021Unbalanced, Peyre2016Gromov, CuturiDoucet2014Fast, VincentCuaz2022Template, BrogatMotte2022Learning, Mialon2021Trainable, Kolouri2021Wasserstein, Wang2013Linear, Beier2022Linear, Bai2025Linear, DiazMartin2026Gromov, Xu2023Representing, Kundu2020Enabling, Ironside2025Predictive, Gong2026Robust, Thual2022Aligning, Qahqaie2026Unbalanced] |
| Related Work: set encoders, point clouds and multiple-instance learning | [Zaheer2017DeepSets, Wagstaff2019Limitations, Wagstaff2022Universal, Amir2023Injective, Lee2019SetTransformer, Qi2017PointNet, Qi2017PointNetPP, Ilse2018AttentionMIL, Shao2021TransMIL, Chen2022LungMIL, Yang2020NoduleSAT, Karimzadeh2026Revisiting, GutierrezBecker2018MSPNet, Chen2024TractGeoNet, Kwon2025Graph, Ren2025OTSurv, Song2024Multimodal] |
| Related Work: radiomics and lesion segmentation | [Lambin2012Radiomics, Aerts2014Decoding, vanGriethuysen2017Computational, Zwanenburg2020Image, Traverso2018Repeatability, Isensee2021nnUNet, Baumgartner2021nnDetection, Wynen2025ConfLUNet, Kendrick2022Fully, Alberb2026Automated] |
| Method | [Cuturi2013Sinkhorn, Chizat2018Scaling, Feydy2019Interpolating, Luise2018Differential, Feydy2019Fast, VincentCuaz2022Template, Mialon2021Trainable, Bai2025Linear, Mallery2025Synthesis, Zaheer2017DeepSets, Wagstaff2019Limitations, Isensee2021nnUNet, vanGriethuysen2017Computational] |
| Experiments and baselines | [Chen2021AMINN, Wilk2025Towards, Geady2025Radiomic, Karimzadeh2026Revisiting, Ilse2018AttentionMIL, Lee2019SetTransformer, Qi2017PointNet, Togninalli2019Wasserstein, Wang2024Graph, Bowren2022Poststroke, Liu2023Coordinatized, Sperber2023Stroke, Kendrick2022Fully, Janse2026Deep, Dong2024Self, Bonkhoff2024Prediction] |
| Discussion | [Bonkhoff2024Prediction, Sperber2023Stroke, Seghier2023Elusive, Juhling2024Spatial, Choi2026Tumor, Geady2025Radiomic, Janse2026Deep, Wynen2025ConfLUNet, Wagstaff2022Universal, Liu2026Three, Gong2026Robust] |

## Quality Gates

| Check item | Pass criterion | Computed value | Result |
|---|---|---|---|
| Search strategy documented | Databases, search strings and screening criteria recorded | Theme runs summarized; every merge-run call in the query log with tool, date and returned count; criteria stated | Pass |
| Source count | At least 30 for a Literature Review (typical 40 to 80) | 147 | Pass (above the typical range; source count is the size measure under decision D5) |
| Annotated bibliography completeness | 100 percent of included sources annotated with all fields | 147/147 annotations carry all 12 fields | Pass |
| Literature matrix coverage | Every theme column at least 3 sources | Themes A 29, B 46, C 41, D 44; smallest correspondence or pipeline category 12 | Pass |
| Research gaps | At least 2 specific gaps | 5 | Pass |
| Peer-reviewed ratio, neutral reading | At least 70 percent | 141/147 (95.9%); 5 arXiv preprints and 1 working paper are not peer reviewed | Pass |
| Peer-reviewed ratio, cs_ml reading (preprints peer-review-equivalent) | At least 70 percent | 146/147 (99.3%); the working paper (Harshman1970Foundations) is a foundational work | Pass |
| Currency | At least 50 percent published 2022 to 2026 | 79/147 (53.7%) | Pass |
| Distributional skew advisory | Flag any value at 70 percent or more of known_N | Largest values: time 53.7%, method 26.5%, venue tier 59.9% | No advisory |

Currency failure handling: the 107 theme sources alone have 48/107 (44.9%) published 2022 to 2026, below the 50 percent gate. The forward-tracking round for 2023 to 2026 and the intersection searches X6 and X8 (restricted to 2022 to 2026 and 2023 to 2026) were run as the search for recent work, and 31 of the 40 added sources are from 2022 to 2026, which brings the merged set to 53.7%.

## Sources Excluded or Dropped in the Merge Run

No theme source was dropped. The one cross-theme duplicate, Chen2021AMINN (Themes C and D, DOI 10.1007/978-3-030-87240-3_72), is kept as one entry, and the Theme D record of it is merged into the Theme C annotation. Every pre-2013 source passes the foundational rule (more than 100 citations). Crossref is-referenced-by-count values retrieved on 2026-11-15: Carroll1970Individual 3808, Kiers1999PARAFAC2 254, MartinezMontes2004Concurrent 271, Kolda2009Tensor 8735, Memoli2011GromovWasserstein 446, Avants2008Symmetric 5934, Brett2001Spatial 857, Lambin2012Radiomics 5613, Bates2003Voxel 1318, Beg2005Computing 1590. Crossref returned 39 for Bro1996Multiway, and the OpenCitations citation-count endpoint returned 619 for the same DOI. Harshman1970Foundations has no DOI; its OpenAlex record shows 2255 citations.

The records below were assessed at record level in the merge run and excluded.

| Record | Identifier | Found by | Reason |
|---|---|---|---|
| He et al. 2018, Boosted sparse and low-rank tensor regression (NeurIPS) | arXiv:1811.01158 | M-D1 | Aligned tensor regression; covered by Zhou2013Tensor and Guhaniyogi2017Bayesian. |
| Tensor-GP contraction for imaging regression | arXiv:2301.11203 | M-D1 | Solar imaging on an aligned grid; no unaligned mode and no medical use. |
| Song et al. 2015, fMRI tensor features (MICCAI) | DOI 10.1007/978-3-319-24553-9_75 | M-D1, M-D3 | No abstract retrievable from Crossref or Semantic Scholar. |
| Harshman 1971 and 1972 JASA meeting abstracts | DOI 10.1121/1.1977523; DOI 10.1121/1.1981298 | Retrieval of Harshman 1970 | Conference abstracts without a paper. |
| TractShapeNet | DOI 10.1109/ISBI60581.2025.10981095 | FT-Chen2024TractGeoNet-arXiv | Computes shape measures; no subject-level prediction. |
| Kan et al. 2026, convex potential optimal transport | arXiv:2610.37844 | FT-Kundu2018Discovery | No prediction task. |
| Tang et al. 2024, MGCNet | DOI 10.1109/JBHI.2024.3350247 | FT-ChenAMINN | Single-region fusion; no set of elements. |
| Supervised Gromov-Wasserstein | arXiv:2401.06266 | X5 | Matching only; no subject-level prediction. |
| Transcending Grids | arXiv:2305.15426 | X5 | An image converted to a point cloud; no unaligned spatial mode across subjects. |
| Soubrier et al. 2026, multilinear Gromov-Wasserstein distance capturing chirality | arXiv:2608.27774 | Theme A exclusion table, re-judged for Theme B | Shape distance; no subject-level prediction. |
| Oh et al. 2025, radiomic clustering with unbalanced OT | DOI 10.1016/j.csbj.2025.10.066 | X7b | Unsupervised clustering with no supervised use of the representation. |
| Tompkins et al. 2025, melanoma metastasis models | PMID 39939139 | Theme D candidate list | Organ-level models; no set aggregation method. |
| Active Shape Models (Cootes et al. 1995) | DOI 10.1006/cviu.1995.1004 | Backward chaining (2 seeds) | Segmentation and search method; no subject-level prediction. |
| TractGraphFormer | DOI 10.1016/j.media.2025.103476 | FT-Chen2024TractGeoNet-arXiv | The abstract does not state the representation or correspondence handling; the tract point-cloud route is covered by Chen2024TractGeoNet. |
| GeoHSAF | DOI 10.1109/WACV61042.2026.00214 | FT-GutierrezBecker2018MSPNet-arXiv | The abstract does not state the correspondence handling. |
| Hypergraph model for NSCLC | DOI 10.1016/j.engappai.2026.115313 | FT-Zaheer2017DeepSets | No abstract retrievable. |
| Gachon et al. 2025 (Cytometry A) | DOI 10.1002/cyto.a.24918 | FT-Wang2013Linear | No supervised predictor; LOT for cytometry is covered by Wang2025Linearized. |
| Geady et al. 2025, MIRV | PMID 40739225 | Theme D candidate list | Covered by Geady2025Radiomic from the same group and data. |
| Tilwani et al. 2025 | PMID 40519564 | Theme D candidate list | Registration-based stroke outcome prediction covered by Bowren2022Poststroke and Bonkhoff2024Prediction. |
| Chen et al., LEGNet | PMID 41800187 | Theme D candidate list | Atlas-based lesion network predictor covered by Bowren2022Poststroke. |
| Chen et al., DyHG | DOI 10.1016/j.cmpb.2025.108966 | FT-Ilse2018 | Whole-slide hypergraph MIL; the WSI MIL designs are covered by CLAM, TransMIL and Campanella. |
| FlowLOT | arXiv:2609.17906 | FT-Wang2013Linear | Preprint whose contribution (LOT embeddings) is covered by peer-reviewed included sources. |
| MCUR | arXiv:2303.17852 | X5 | Preprint; MIL survival design covered by peer-reviewed included sources. |
| Mahan et al. 2024 | arXiv:2401.01460 | FT-Wang2013Linear, FT-Zaheer2017DeepSets, X6 | Preprint; transport template embedding covered by VincentCuaz2022Template and Mialon2021Trainable. |
| Multiple instance learning in medical images: a systematic review | DOI 10.1109/ACCESS.2024.3403538 | X8 | Survey; excluded under the survey rule (a survey is included only when it is the standard reference cited by the core papers). |
| Kolouri et al. 2017, Optimal mass transport (IEEE SPM) | DOI 10.1109/msp.2017.2695801 | Backward chaining (2 seeds) | Survey; Peyre2019Computational is the standard transport survey cited by the core papers. |
| Bronstein et al. 2017, Geometric deep learning (IEEE SPM) | DOI 10.1109/msp.2017.2693418 | Backward chaining (2 seeds) | Survey; excluded under the survey rule. |
| Ma et al. 2025, CRLM first-line therapy efficacy (EMBC) | DOI 10.1109/EMBC58623.2025.11254758 | FT-Ilse2018 | Radiomics of segmented tumour regions fused with clinical data; the abstract states no aggregation over a set of lesions. |
| Dutta 2026, multiple primary lung cancers | DOI 10.64388/irev10i4-1723737 | FT-Ilse2018 | MIL instances are axial slices of one volume, not a set of lesions or regions. |
| Davis et al. 2024, CRLM neoadjuvant response | DOI 10.1002/jso.27673 | FT-Ilse2018 | The abstract states no representation or correspondence handling. |
| Wang et al. 2026, DBF-GNN | DOI 10.1109/ICIPAI70034.2026.11605614 | FT-Ilse2018 | Lesion-level classification from patch graphs; no subject-level prediction over a set. |
| Live(r) Die | arXiv:2509.08935 | FT-ChenAMINN | Earlier version of Alberb2026Automated. |

Works cited by two backward-chaining seeds and not collected, with reasons: Tibshirani 1996 lasso, Adam, PyTorch, FreeSurfer, the HCP overview, the multimodal cortical parcellation and the NeurIPS checklist entries (tools, datasets or forms, off-topic); "Mathematics by experiment" and "Recursive deep models for semantic compositionality" (off-topic); Vayer et al. 2020 FGW theory (DOI 10.3390/a13090212; excluded by Theme B as the theory companion of Vayer2019Structured); Basu 2014 transport-based morphometry of cells (DOI 10.1073/pnas.1319779111) and Kolouri 2016 continuous LOT (DOI 10.1016/j.patcog.2015.09.019) (excluded by Theme B as superseded within the same line by Wang2013Linear and Kundu2018Discovery).

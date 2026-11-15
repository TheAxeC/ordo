# Literature Search Report, Theme D: medical-imaging pipelines and subject-level prediction from lesion or region sets

This is the Theme D run of the search stage (lit-review mode), one of the four theme runs set by decision D1 in `settings.md`. It covers four sub-themes: D1 image registration to a common space; D2 radiomics; D3 lesion and region segmentation; D4 subject-level prediction from lesion sets or region sets. The merge run deduplicates this file against Themes A, B and C and emits the single Literature Search Report.

## Search Strategy

### Domain evidence profile resolution

- PCR `Domain Evidence Profile` row (read from `settings.md` section (a) and `intake-record.md`): `cs_ml`. The value is in the four-value enum, carries no `(requested: ...)` suffix and is not absent, so fallback cases (a), (b), (b-reserved) and (c) do not apply. No `[NO-PROFILE-NEUTRAL]`, `[PROFILE-RESERVED-FALLBACK]` or `[PROFILE-UNRESOLVED]` tag is emitted.
- Discipline-mismatch check (case (d)), applied as the agent file's string-category comparison: `cs_ml` implies the category CS / Engineering / Technology. The PCR `Discipline` row reads "Machine learning, with medical image analysis as the application setting; methods admitted from any application domain". Its discipline is machine learning, which falls in the CS category; medical image analysis is stated as the application setting. The Discipline therefore falls inside the profile's implied set, and `[PROFILE-DISCIPLINE-MISMATCH]` is not emitted.
- Effect on screening: under `cs_ml`, archival preprints and conference proceedings are admitted at the peer-review and publication-type nodes (admit-only, combined by OR with the neutral tree). Relevance, methodology and predatory checks were applied to every source unchanged.
- Database selection follows the Discipline row (CS/Engineering: IEEE Xplore, ACM DL, Scopus), and because the application is medical imaging, PubMed was added from the Medicine row.

### Databases and tools

Queried (all on 2026-11-14 UTC, the date printed by `date -u +%F` at the start of the run):

- PubMed via NCBI E-utilities (esearch, esummary, efetch, elink with `pubmed_pubmed_citedin` for forward tracking and `pubmed_pubmed` for similar articles).
- arXiv via the export API (`export.arxiv.org/api/query`).
- Crossref REST API (`api.crossref.org`) for DOI records, author lists, venues and peer-reviewed versions of preprints.
- OpenCitations Index API v2 (`api.opencitations.net`) for reference lists (backward chaining) and citation counts.
- Europe PMC REST API (one lookup, for an abstract missing from PubMed).
- doi.org (resolution check for one DOI without a Crossref record).
- WebSearch (natural-language queries for Layer 4) and WebFetch (publisher abstract page for one source).

Not accessible, and what was used instead:

- IEEE Xplore, ACM Digital Library and Scopus: no API access or subscription in this environment. Crossref and OpenCitations were used for DOI-level coverage of IEEE and ACM venues, and arXiv for CS preprints.
- Semantic Scholar Graph API: returned HTTP 429 (Too Many Requests) on four attempts spread over the run. Layer 4 semantic search used PubMed similar-articles links and WebSearch instead.
- OpenAlex API: returned "Rate limit exceeded ... Insufficient budget" on the first request. Not used.
- Publisher pages for two papers redirected to login pages (nature.com and link.springer.com); the nature.com page was reached on a second redirect and its abstract read. The Springer page for Beg et al. 2005 could not be read.

### Key concepts

- Registration: image registration, spatial normalization, diffeomorphic, symmetric normalization, template or atlas construction, learning-based registration, cost function masking, enantiomorphic normalization, lesioned or pathological brains.
- Radiomics: radiomics, feature standardization (IBSI), repeatability, reproducibility, harmonization, deep radiomics, deep features, outcome prediction.
- Segmentation: self-configuring segmentation (nnU-Net), segmentation challenge or benchmark (BraTS, MS lesion, WMH, ISLES), lesion-wise or instance segmentation, lesion detection.
- Subject-level prediction: multiple lesions, multi-lesion, per-lesion, lesion-level, patient-level, aggregation, multiple instance learning, lesion graph, lesion load, lesion-symptom mapping, registration-free, atlas-free, native space.

### Inclusion and exclusion criteria

- Include: English; peer-reviewed journal articles or peer-reviewed proceedings, or arXiv preprints where no peer-reviewed version exists (admitted under `cs_ml`, flagged); foundational works at any year, systematic search window 2013 to 2026; the source is centrally about a registration, radiomics or lesion-segmentation pipeline step, or about predicting a subject-level outcome from lesion or region data, and says how cross-subject correspondence is handled or removed.
- Exclude: off-topic hits (non-imaging, histopathology-only MIL, which belongs to Theme C, surgical navigation, dosimetry QA); single-lesion clinical prediction studies with no bearing on correspondence or pipeline design; records without a retrievable bibliographic record; records whose abstract or text could not be read (an annotation can only state what was read).
- Filters: date filters as written in each query; no language filter was needed (all retained records are English).

### Layer 1: Boolean queries

Counts: "total" is the count field returned by the API (PubMed `count`, arXiv `opensearch:totalResults`); "retrieved" is the number of records I fetched and screened at title level (top records by relevance); "kept" is the number kept at title/abstract screening.

| ID | Database | Query string | Total | Retrieved | Kept |
|---|---|---|---|---|---|
| R1 | PubMed | ("image registration"[tiab] OR "spatial normalization"[tiab] OR "spatial normalisation"[tiab]) AND (lesion*[tiab] OR tumor*[tiab] OR tumour*[tiab] OR stroke[tiab] OR patholog*[tiab]) AND brain[tiab] AND (bias[tiab] OR failure[tiab] OR accuracy[tiab] OR error*[tiab]) AND 2013:2026[dp] | 112 | 40 | 6 |
| R2 | PubMed | ("cost function masking"[tiab] OR "enantiomorphic"[tiab] OR "lesion masking"[tiab] OR "unified segmentation"[tiab]) AND (normalization[tiab] OR normalisation[tiab] OR registration[tiab]) AND (lesion*[tiab] OR stroke[tiab]) | 19 | 19 | 7 |
| R3 | arXiv | abs:"deformable image registration" AND abs:unsupervised AND abs:learning | 35 | 25 | 3 |
| R4 | arXiv | ti:registration AND (ti:pathological OR ti:tumor OR ti:lesion) AND cat:eess.IV | 24 | 24 | 6 |
| R5 | PubMed | radiomics[tiab] AND (reproducibility[tiab] OR repeatability[tiab] OR standardization[tiab] OR standardisation[tiab] OR harmonization[tiab]) AND (review[pt] OR guideline[tiab] OR initiative[tiab] OR consensus[tiab]) AND 2013:2026[dp] | 721 | 40 | 7 |
| R6 | PubMed | ("deep radiomics"[tiab] OR "deep learning radiomics"[tiab] OR "deep features"[tiab]) AND (radiomic*[tiab]) AND (prognos*[tiab] OR survival[tiab] OR outcome[tiab]) AND (review[pt] OR comparison[tiab] OR versus[tiab]) AND 2013:2026[dp] | 58 | 30 | 4 |
| R7 | PubMed | (radiomics[ti] OR "quantitative image features"[ti] OR "decoding tumour phenotype"[ti] OR "images are more than pictures"[ti] OR pyradiomics[tiab]) AND (2012:2017[dp]) AND (Lambin P[au] OR Aerts HJ[au] OR Gillies RJ[au]) | 23 | 23 | 7 |
| R8 | PubMed | (challenge[ti] OR benchmark[ti]) AND (segmentation[ti]) AND (lesion*[ti] OR tumor*[ti] OR tumour*[ti] OR glioma[ti] OR "multiple sclerosis"[ti] OR stroke[ti] OR "white matter hyperintensit*"[ti] OR metastas*[ti]) | 45 | 40 | 9 |
| R9 | arXiv | abs:"self-configuring" AND abs:segmentation | 16 | 16 | 1 |
| R10 | PubMed | ("lesion-wise"[tiab] OR "lesion-level"[tiab] OR "instance segmentation"[tiab] OR "lesion detection"[tiab]) AND ("multiple sclerosis"[tiab] OR metastas*[tiab]) AND (instance*[tiab] OR "lesion-wise"[tiab] OR "per-lesion"[tiab] OR confluent[tiab]) AND 2013:2026[dp] | 89 | 30 | 4 |
| R11 | PubMed | ("nnU-Net"[tiab] OR "nnUNet"[tiab]) AND (self-configuring[tiab] OR self-adapting[tiab] OR framework[ti] OR revisited[tiab] OR benchmark*[tiab]) AND 2018:2026[dp] | 212 | 25 | 1 |
| R12 | arXiv | ti:nnU-Net | 50 | 20 | 1 |
| R13 | PubMed | ("multiple lesions"[tiab] OR "multi-lesion"[tiab] OR "per-lesion"[tiab] OR "lesion-level"[tiab] OR "all lesions"[tiab] OR "multiple metastases"[tiab]) AND ("patient-level"[tiab] OR "subject-level"[tiab] OR aggregat*[tiab] OR "multiple instance"[tiab] OR attention[tiab]) AND (radiomic*[tiab] OR "deep learning"[tiab]) AND (prediction[tiab] OR prognos*[tiab] OR survival[tiab] OR response[tiab]) AND 2013:2026[dp] | 39 | 39 | 7 |
| R14 | PubMed | ("lesion graph"[tiab] OR "graph of lesions"[tiab] OR "graph neural network"[tiab] OR "multiple instance learning"[tiab] OR "set of lesions"[tiab] OR "point cloud"[tiab]) AND (lesion*[tiab] OR metastas*[tiab] OR "white matter hyperintensit*"[tiab]) AND ("multiple sclerosis"[tiab] OR brain[tiab] OR metastas*[tiab] OR "lymph node*"[tiab]) AND (predict*[tiab] OR classif*[tiab]) AND 2013:2026[dp] | 79 | 40 | 2 |
| R15 | PubMed | ("multiple sclerosis"[tiab] OR "white matter hyperintensit*"[tiab] OR "small vessel disease"[tiab]) AND ("lesion load"[tiab] OR "lesion volume"[tiab] OR "lesion count"[tiab] OR "lesion-level"[tiab] OR "lesion-wise"[tiab] OR "individual lesion*"[tiab]) AND ("machine learning"[tiab] OR "deep learning"[tiab] OR graph[tiab]) AND (disability[tiab] OR EDSS[tiab] OR cognit*[tiab] OR progression[tiab]) AND (predict*[tiab]) AND 2013:2026[dp] | 32 | 32 | 3 |
| R16 | PubMed | ("lesion-symptom mapping"[tiab] OR "lesion symptom mapping"[tiab] OR "lesion-behavior mapping"[tiab] OR "lesion network mapping"[tiab]) AND (multivariate[tiab] OR "machine learning"[tiab] OR prediction[tiab] OR review[pt] OR method*[ti]) AND 2013:2026[dp] | 265 | 40 | 6 |
| R17 | PubMed | ("voxel-based lesion-symptom mapping"[ti] OR "lesion-symptom mapping"[ti]) AND (Bates E[au] OR Rorden C[au]) | 13 | 13 | 3 |
| R18 | PubMed | ("registration-free"[tiab] OR "atlas-free"[tiab] OR "without registration"[tiab] OR "registration-independent"[tiab] OR "template-free"[tiab] OR "native space"[tiab]) AND (predict*[tiab] OR classif*[tiab]) AND (lesion*[tiab] OR tumor*[tiab] OR stroke[tiab] OR brain[tiab]) AND 2013:2026[dp] | 48 | 40 | 4 |
| R19 | arXiv | (abs:lesions OR abs:metastases) AND (abs:"patient-level" OR abs:"set of lesions" OR abs:"multiple instance" OR abs:"lesion-level") AND (abs:prediction OR abs:prognosis OR abs:survival) | 67 | 30 | 4 |
| R20 | PubMed | ("atlas construction"[tiab] OR "template construction"[tiab] OR "unbiased template"[tiab] OR "unbiased atlas"[tiab] OR "population template"[tiab]) AND (diffeomorphic[tiab] OR deformable[tiab] OR registration[tiab]) | 148 | 30 | 4 |
| R21 | arXiv | (abs:"deformable template" OR abs:"atlas construction" OR abs:"conditional template") AND abs:learning AND abs:registration | 8 | 8 | 3 |

Layer 1 totals: 604 records retrieved and screened at title level; 92 kept (91 unique; the R1 and R4 hits for the same inpainting-registration work, PMID 34013242 and arXiv 2101.06775, are one work).

R7 and R17 restrict by author names (Lambin, Aerts, Gillies; Bates, Rorden). These two queries target the foundational radiomics and lesion-symptom mapping papers and are recorded as author-restricted, so they are not topic-neutral searches.

### Layer 2: backward citation chaining

Tool: OpenCitations Index v2 `references` endpoint, on 2026-11-14.

- B1, eight core papers from Layer 1 (DOIs 10.1186/s12885-025-13850-5, 10.1016/j.cmpb.2025.108840, 10.3389/fnins.2024.1296357, 10.1093/brain/awac010, 10.1148/radiol.2020191145, 10.1038/s41592-020-01008-z, 10.1016/j.nicl.2021.102854, 10.1007/s00330-025-11801-z): reference lists of 19, 30, 51, 77, 35, 39, 24 and 34 records; 308 cited records with a DOI, 297 unique. Cited by three core papers: 10.1038/ncomms5006 (Aerts 2014), marked must-include. Cited by two: 10.1016/j.neuroimage.2016.12.064, 10.1109/3dv.2016.79, 10.1016/j.neuropsychologia.2017.08.027, 10.1093/brain/awaa156, 10.1038/nn1050, 10.1093/brain/awu164, 10.1148/radiol.2015151169, 10.1158/0008-5472.can-17-0339, 10.1038/s41592-020-01008-z.
- B2, four registration core papers (10.1016/j.media.2018.11.010, 10.1007/978-3-031-43999-5_51, 10.1016/j.neuroimage.2012.01.094, 10.1016/j.mri.2020.01.016): reference lists of 20, 24, 24 and 40 records; 107 cited records with a DOI, 97 unique. Cited by three: 10.1023/b:visi.0000043755.93987.aa (Beg 2005, LDDMM) and 10.1006/nimg.2001.0845 (Brett 2001), both marked must-include. Cited by two: 10.1016/j.neuroimage.2007.07.007, 10.1016/j.neuroimage.2007.04.065, 10.1016/j.neuroimage.2008.12.037, 10.1016/j.neuroimage.2007.10.002, and two non-imaging statistics references.
- Screening: the 394 unique cited DOIs were screened by co-citation frequency and DOI; 19 of them were resolved to titles via Crossref and screened at title level; 10 new candidates were kept (Beg 2005; Klein 2009; Ashburner 2007 DARTEL; Balakrishnan 2019 VoxelMorph; Avants 2008 SyN; Avants 2011; Sotiras 2013 survey; Ashburner and Friston 2005 unified segmentation; Salvalaggio 2020; Mah 2014). One cited DOI (10.1016/j.neuropsychologia.2017.08.027) had no Crossref record; doi.org resolved it to an Elsevier record.

### Layer 3: forward tracking

Tool: PubMed elink `pubmed_pubmed_citedin` (cited-by links held in PubMed Central reference lists), then esummary filtered to publication years 2023 to 2026, then a title keyword filter, on 2026-11-14.

| ID | Seed (PMID) | PubMed citers | Citers 2023 to 2026 processed | Title filter (regex) | Title matches screened | New kept |
|---|---|---|---|---|---|---|
| PM1 | Brett 2001 (11467921) | 420 | 87 | normali, registration, lesion | 29 | 5 |
| PM2 | Nachev 2008 (18023365) | 181 | 85 | normali, registration, template | 4 | 0 |
| PM3 | Bates 2003 (12704393) | 703 | 159 | predict, machine learning, deep, multivariate, registration, normali | 25 | 5 |
| PM4 | Inter-lesion heterogeneity radiomics 2022 (36307149) | 27 | 27 | lesion, metasta, patient | 17 | 3 |
| PM5 | Lesion selection DLBCL radiomics 2022 (35925442) | 26 | 25 | lesion, aggregat, metasta | 1 | 0 |
| PM6 | VoxelMorph 2019 (30716034) | 541 | 371 | patholog, lesion, tumour, universal, foundation, benchmark, template | 20 | 2 |
| PM7 | nnU-Net 2021 (33288961) | 3317 | 2000 | revisit, instance, lesion-wise, lesion detection, universal lesion, TotalSegmentator, metric, pitfall, patient-level | 113 | 0 |

Layer 3 totals: 2,754 citer records processed by year; 209 title matches screened; 15 new candidates kept (F1: PMIDs 42344990, 41631006, 39928283, 39612808, 37382614; PM3: 42204350, 40519564, 39914289, 39291162, 37417774; PM4: 40739225, 39939139, 38945043; PM6: 42361771, 42261488). PM6 also returned the published versions of two Layer 1 preprints (AtlasMorph, PMID 41604896; tumour-aware inter-patient registration, PMID 39589333). PM7 limits: the script processed the first 2,000 of 3,317 citer IDs, all of which were from 2023 to 2026, so older and remaining citers were not screened; the regex term "metric" also matched "volumetric", which inflated the title matches with off-topic records, all excluded. PM6 confirms that VoxelMorph has 371 PubMed citers from the last three years, so it is not "possibly outdated"; PM1 and PM3 confirm the same for Brett 2001 (87) and Bates 2003 (159).

### Layer 4: semantic search

| ID | Tool | Query or seed | Records returned | Already seen | New kept |
|---|---|---|---|---|---|
| WS1 | WebSearch | patient-level outcome prediction from multiple lesions set aggregation deep learning registration-free MRI | 10 | AMINN (arXiv 2012.06875) | 0 |
| WS2 | WebSearch | nnU-Net revisited rigorous validation 3D medical image segmentation MICCAI 2024 | 10 | none | 1 (arXiv 2404.09556) |
| WS3 | WebSearch | multiple sclerosis lesions graph neural network disability prediction lesion graph | 10 | none | 1 (arXiv 2308.16863) |
| S1 | PubMed similar articles | seed PMID 40451095 (100 neighbours, top 30 screened) | 30 | 0 | 0 |
| S2 | PubMed similar articles | seed PMID 38298911 (100 neighbours, top 30 screened) | 30 | 6 | 1 (PMID 25044213) |

Layer 4 totals: 90 records screened; 3 new candidates kept. Overlap of semantic results with Layers 1 to 3: S1 0 of 30 (all 30 were single-lesion lung PET/CT radiomics studies, off-theme), S2 6 of 30 (20 percent). The 80 percent overlap threshold for semantic saturation is not met.

### Peer-reviewed versions of preprints (Crossref bibliographic queries, 2026-11-14)

- arXiv 2404.09556 (nnU-Net Revisited): MICCAI 2024, DOI 10.1007/978-3-031-72114-4_47.
- arXiv 2308.16863 (self-pruning GNN for MS): MICCAI 2023, DOI 10.1007/978-3-031-43993-3_22.
- arXiv 2012.06875 (AMINN): MICCAI 2021, DOI 10.1007/978-3-030-87240-3_72.
- arXiv 2206.03900 (registration with absent correspondences): MICCAI 2022, DOI 10.1007/978-3-031-16446-0_3.
- arXiv 2309.10153 (preserving tumour volumes): ICCV 2023, DOI 10.1109/iccv51070.2023.01939.
- arXiv 2106.00817 (nnDetection): the arXiv record carries DOI 10.1007/978-3-030-87240-3_51 (MICCAI 2021).
- arXiv 2511.13609 (AtlasMorph): Medical Image Analysis 2026, DOI 10.1016/j.media.2025.103893.
- arXiv 1809.05231 (VoxelMorph): IEEE TMI 2019, DOI 10.1109/TMI.2019.2897538.
- arXiv 2505.22537 (ConfLUNet): Computers in Biology and Medicine 2025, DOI 10.1016/j.compbiomed.2025.110919 (PubMed record 40850174).
- No peer-reviewed version was found for arXiv 2112.06979 (BraTS-Reg) by the Crossref query used.

## Coverage Distribution Advisory

No distributional skew advisory triggered. Counts over the 28 included sources:

- Time distribution: before 2013, 4/28; 2013 to 2019, 7/28; 2020 to 2022, 7/28; 2023 to 2026, 10/28. Largest bucket 36 percent.
- Methodological distribution: computational method papers 11/28 (Avants2008Symmetric, Brett2001Spatial, Balakrishnan2019VoxelMorph, Rakic2026AtlasMorph, Mok2022Unsupervised, Isensee2021nnUNet, Baumgartner2021nnDetection, Wynen2025ConfLUNet, Chen2021AMINN, Prabhakar2023Selfpruning, Bates2003Voxel); empirical comparison or validation studies 9/28; reviews or position papers 4/28; dataset, benchmark or software papers 4/28. Largest 39 percent.
- Venue tier distribution: journals 22/28, peer-reviewed proceedings 6/28 (five MICCAI, one EMBC), preprint-only 0/28. Largest single venue family: MICCAI proceedings (LNCS), 5/28 (18 percent); MICCAI plus the next two venue families (each 2/28: Radiology, IEEE TMI, NeuroImage and Medical Image Analysis are tied) 9/28 (32 percent).
- Geographic distribution: omitted; study sites were not recorded in the annotations.

## Screening Results

- Initial hits: 922 records screened at title level (Layer 1: 604; Layer 2: 19 resolved from 394 unique cited DOIs; Layer 3: 209 title matches from 2,754 citer records; Layer 4: 90). Records that recur across layers are counted once per occurrence in this figure.
- After title/abstract screening, first pass: 120 kept entries, 118 unique works after merging two duplicate pairs (PMID 34013242 with arXiv 2101.06775; arXiv 2307.15615 with PMID 39612808).
- After title/abstract screening, second pass (narrowing to the agent file's 30 to 50 band): 44 records, chosen for direct bearing on how cross-subject correspondence is handled or on a named pipeline step, giving priority to must-include co-citations, foundational works and 2023 to 2026 work. The 74 records not advanced are listed at the end of this file.
- After full-text assessment (Phase B, abstract-level reading of all 44; see each Quality line for what was read): 28 included, 16 excluded.
- Final included sources: 28 (D1 registration: 8; D2 radiomics: 7; D3 segmentation: 6; D4 subject-level prediction: 7, with cross-listings shown in the matrix).

### Saturation (stopping rules)

- Condition 1, source count meets target: met for the theme target of 15 to 28 (28 included). The Literature Review minimum of 30 applies to the merged set across Themes A to D.
- Condition 2, latest round added fewer than 10 percent: met. Layer 4 added 3 candidates to 115 (2.6 percent) and 2 of the 28 included sources (7 percent).
- Condition 3, theme saturation: met. Every sub-theme column of the matrix has at least 6 sources.
- Condition 4, citation loop closure: not met. B2 still surfaced uncollected registration references (for example Klein 2009 and Sotiras 2013) that were kept as candidates but not advanced.
- Condition 5, temporal span coverage: met. Foundational works (Brett 2001, Bates 2003, Avants 2008, Lambin 2012) and ten sources from 2023 to 2026.
- Four of five conditions are met, above the required three, so the search stopped.

## Annotated Bibliography

Quick-assessment items: J = journal ranking, R = methodological rigour, Rel = relevance to RQ, C = citation count (OpenCitations count on 2026-11-14, judged against same-age literature), D = data or evidence quality; each 1 to 3. Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly: supports = the source gives evidence that the missing correspondence affects results or that handling it explicitly helps; opposes = evidence that it can be ignored; neutral = provides a method, resource or finding without evidence either way.

### D1. Image registration to a common space

#### Avants, Epstein, Grossman, Gee (2008). Symmetric diffeomorphic image registration with cross-correlation: evaluating automated labeling of elderly and neurodegenerative brain.
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

#### Brett, Leff, Rorden, Ashburner (2001). Spatial normalization of brain images with focal lesions using cost function masking.
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

#### Balakrishnan, Zhao, Sabuncu, Guttag, Dalca (2019). VoxelMorph: a learning framework for deformable medical image registration.
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

#### Rakic, Hoopes, Abulnaga, Sabuncu, Guttag, Dalca (2026). AtlasMorph: learning conditional deformable templates for brain MRI.
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

#### Juhling, Rajashekar, Cheng, Hilgetag, Forkert, Werner (2024). Spatial normalization for voxel-based lesion symptom mapping: impact of registration approaches.
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

#### Miller, Steeby, Ortega-Marquez, Palacin, Chui, Alhadid, Sullivan, Boes, Musolino, Cohen (2025). Comparison of brain normalization software and lesion compensation techniques in chronic perinatal stroke imaging.
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

#### Mok, Chung (2022). Unsupervised deformable image registration with absent correspondences in pre-operative and post-recurrence brain tumor MRI scans.
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

#### Choi, Jiang, Mankuzhy, Nadkarni, Madhavan, Wu, Deasy, Thor, Rimner, Veeraraghavan (2026). Tumor-conditioned inter-patient registration using planning computed tomography for voxel-based analysis to predict radiation pneumonitis in lung cancer patients.
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

### D2. Radiomics

#### Lambin, Rios-Velazquez, Leijenaar, Carvalho, van Stiphout, Granton, Zegers, Gillies, Boellard, Dekker, Aerts (2012). Radiomics: extracting more information from medical images using advanced feature analysis.
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

#### Aerts, Velazquez, Leijenaar, Parmar, Grossmann, Carvalho, Bussink, Monshouwer, Haibe-Kains, Rietveld, Hoebers, Rietbergen, Leemans, Dekker, Quackenbush, Gillies, Lambin (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
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

#### Gillies, Kinahan, Hricak (2016). Radiomics: images are more than pictures, they are data.
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

#### van Griethuysen, Fedorov, Parmar, Hosny, Aucoin, Narayan, Beets-Tan, Fillion-Robin, Pieper, Aerts (2017). Computational radiomics system to decode the radiographic phenotype.
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

#### Zwanenburg, Vallieres, Abdalah, Aerts, et al. (2020). The Image Biomarker Standardization Initiative: standardized quantitative radiomics for high-throughput image-based phenotyping.
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

#### Traverso, Wee, Dekker, Gillies (2018). Repeatability and reproducibility of radiomic features: a systematic review.
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

#### Janse, Janssen, Wolters-van der Ben, Moman, Viergever, van Diest, Gilhuijs (2026). Deep learning-based radiomics does not improve residual cancer burden prediction post-chemotherapy in LIMA breast MRI trial.
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

### D3. Lesion and region segmentation

#### Isensee, Jaeger, Kohl, Petersen, Maier-Hein (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
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

#### Isensee, Wald, Ulrich, Baumgartner, Roy, Maier-Hein, Jaeger (2024). nnU-Net revisited: a call for rigorous validation in 3D medical image segmentation.
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

#### Menze, Jakab, Bauer, Kalpathy-Cramer, Farahani, et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS).
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

#### Carass, Roy, Jog, Cuzzocreo, Magrath, et al. (2017). Longitudinal multiple sclerosis lesion segmentation: resource and challenge.
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

#### Baumgartner, Jaeger, Isensee, Maier-Hein (2021). nnDetection: a self-configuring method for medical object detection.
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

#### Wynen, Gordaliza, Istasse, Stolting, Maggi, Macq, Bach Cuadra (2025). ConfLUNet: multiple sclerosis lesion instance segmentation in presence of confluent lesions.
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

### D4. Subject-level prediction from lesion or region sets

#### Chen, Cheung, Milot, Martel (2021). AMINN: autoencoder-based multiple instance neural network improves outcome prediction in multifocal liver metastases.
- **Type**: Proceedings (MICCAI 2021, LNCS, pp. 752-761). DOI 10.1007/978-3-030-87240-3_72; arXiv 2012.06875.
- **Method**: Jointly trains an autoencoder on per-lesion radiomic features from contrast-enhanced MRI and a multiple instance network that aggregates all lesions of a patient to predict survival in multifocal colorectal liver metastases; adds two-step normalization for skewed radiomic features.
- **Key Findings**: Including all lesions improved outcome prediction; AUC 0.70, 11.4 percent above the best baseline; ablations supported incorporating all lesions and the normalization.
- **Relevance**: A direct subject-level predictor over a variable-size set of lesions with no spatial correspondence between patients.
- **Quality**: Medium. Read: arXiv abstract (the LNCS chapter text was not accessible). Single cohort.
- **Potential Use**: Lesion-set prediction by multiple instance learning.
- **Stance**: supports.
- **Evidence type**: proceedings (arXiv preprint version also recorded).
- **Correspondence handling**: permutation invariance; a multiple instance network pools per-lesion representations.
- **Pipeline relation**: builds on segmentation and radiomics (per-lesion features); removes registration.
- **Quick-assessment score**: J2 R2 Rel3 C2 (12) D2 = 11.
- **Citation key**: Chen2021AMINN

#### Prabhakar, Li, Paetzold, Loehr, Niu, Muhlau, Rueckert, Wiestler, Menze (2023). Self-pruning graph neural network for predicting inflammatory disease activity in multiple sclerosis from brain MR images.
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

#### Wilk, Swierniak, d'Amico, Suwinski, Fujarewicz, Borys (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: finding a strategy of aggregating lesions.
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

#### Geady, Patel, Peoples, Simpson, Haibe-Kains (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review.
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

#### Bates, Wilson, Saygin, Dick, Sereno, Knight, Dronkers (2003). Voxel-based lesion-symptom mapping.
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

#### Bowren, Bruss, Manzel, Edwards, Liu, Corbetta, Tranel, Boes (2022). Post-stroke outcomes predicted from multivariate lesion-behaviour and lesion network mapping.
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

#### Fujibayashi, Sakaguchi, Ardakani, Okuno (2021). Nonlinear registration as an effective preprocessing technique for deep learning based classification of disease.
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

## Literature Matrix

Columns: D1 registration, D2 radiomics, D3 lesion and region segmentation, D4 subject-level prediction from lesion or region sets. "main" marks the sub-theme a source is filed under; "x" marks a further sub-theme it contributes to.

| Source | D1 Registration | D2 Radiomics | D3 Segmentation | D4 Subject-level | Method | Quality |
|---|---|---|---|---|---|---|
| Avants2008Symmetric | main | | | | Computational method, evaluation against manual labels | High |
| Brett2001Spatial | main | | x | | Computational method, simulation and patient evaluation | High |
| Balakrishnan2019VoxelMorph | main | | | | Computational method (learning-based registration) | High |
| Rakic2026AtlasMorph | main | | | | Computational method (learned conditional templates) | High |
| Juhling2024Spatial | main | | | x | Empirical comparison, n = 122 | High |
| Miller2025Comparison | main | | | | Empirical comparison, n = 11 | Medium |
| Mok2022Unsupervised | main | | | | Computational method (registration with absent correspondences) | Medium |
| Choi2026Tumor | main | | | x | Empirical comparison and prediction, n = 240 test | High |
| Lambin2012Radiomics | | main | | | Position paper | Medium |
| Aerts2014Decoding | | main | | x | Quantitative cohort study, n = 1,019 | High |
| Gillies2016Radiomics | | main | | | Review | Medium |
| vanGriethuysen2017Computational | | main | | | Software | High |
| Zwanenburg2020Image | | main | | | Multi-team consensus and validation study | High |
| Traverso2018Repeatability | | main | | | Systematic review, 41 studies | High |
| Janse2026Deep | | main | x | x | Empirical comparison, n = 105 + 41 | High |
| Isensee2021nnUNet | | | main | | Computational method, 23 datasets | High |
| Isensee2024Revisited | | | main | | Benchmark study | High |
| Menze2015Multimodal | | | main | | Challenge and benchmark | High |
| Carass2017Longitudinal | | | main | | Challenge and benchmark | High |
| Baumgartner2021nnDetection | | | main | | Computational method (detection) | High |
| Wynen2025ConfLUNet | | | main | x | Computational method and evaluation framework, n = 63 | High |
| Chen2021AMINN | | x | | main | Computational method (multiple instance learning) | Medium |
| Prabhakar2023Selfpruning | | | x | main | Computational method (lesion graph network) | Medium |
| Wilk2025Towards | | x | | main | Empirical comparison of aggregation, n = 115 | High |
| Geady2025Radiomic | | x | | main | Quantitative review with replication, 3,930 patients | High |
| Bates2003Voxel | x | | | main | Computational method (VLSM), n = 101 | High |
| Bowren2022Poststroke | x | | | main | Predictive validation in independent sample | High |
| Fujibayashi2021Nonlinear | x | | | main | Empirical comparison (sample size not given in abstract) | Low |

Column totals (main or x): D1 11, D2 10, D3 9, D4 12.

## Identified Gaps

1. No retrieved study compares, on the same cohort and outcome, a registration-based lesion predictor (Bates2003Voxel, Bowren2022Poststroke, Choi2026Tumor) with a registration-free lesion-set predictor (Chen2021AMINN, Prabhakar2023Selfpruning, Wilk2025Towards). The two routes are each evaluated only against their own baselines.
2. The registration-free lesion-set predictors in this theme pool per-lesion features with no cross-subject positional model: Chen2021AMINN and Wilk2025Towards aggregate feature vectors or scores, Geady2025Radiomic compares aggregation and selection rules, and Prabhakar2023Selfpruning uses within-subject proximity edges only. None of them relates lesion positions across subjects through a learned template or a transport coupling; the registration-side learned template (Rakic2026AtlasMorph) is built on healthy anatomy, not on lesion sets.
3. Evidence on registration failure in lesion-bearing images measures alignment accuracy or map stability (Brett2001Spatial, Miller2025Comparison, Mok2022Unsupervised, Juhling2024Spatial). Only Choi2026Tumor reports the effect of the registration choice on a subject-level prediction, in one lung CT cohort, so the size of the prediction error caused by registration failure is largely unmeasured.
4. Lesion-set predictors depend on correct lesion instances, but Wynen2025ConfLUNet shows that connected-component post-processing of semantic masks undercounts confluent MS lesions, while the segmentation benchmarks read here report voxel-overlap evaluation (Menze2015Multimodal reports Dice) and the self-configuring frameworks target semantic masks or boxes (Isensee2021nnUNet, Baumgartner2021nnDetection). No retrieved lesion-set predictor reports how instance errors propagate to the subject-level prediction.
5. Radiomic reproducibility is studied per region (Traverso2018Repeatability, Zwanenburg2020Image), not for the aggregation step; Geady2025Radiomic finds that the best aggregation rule changes with dataset and lesion burden and that total tumour volume is a strong baseline, and Janse2026Deep finds deep radiomics no better than tumour volume. A lesion-set method needs a volume or lesion-load baseline to show added value.

## Recommended Sources by Paper Section

| Section | Key Sources |
|---|---|
| Introduction | Brett2001Spatial, Juhling2024Spatial, Geady2025Radiomic, Chen2021AMINN |
| Literature Review: registration | Avants2008Symmetric, Balakrishnan2019VoxelMorph, Rakic2026AtlasMorph, Brett2001Spatial, Mok2022Unsupervised, Miller2025Comparison, Juhling2024Spatial, Choi2026Tumor |
| Literature Review: radiomics | Lambin2012Radiomics, Aerts2014Decoding, Gillies2016Radiomics, vanGriethuysen2017Computational, Zwanenburg2020Image, Traverso2018Repeatability, Janse2026Deep |
| Literature Review: segmentation | Isensee2021nnUNet, Isensee2024Revisited, Menze2015Multimodal, Carass2017Longitudinal, Baumgartner2021nnDetection, Wynen2025ConfLUNet |
| Literature Review: subject-level prediction | Chen2021AMINN, Prabhakar2023Selfpruning, Wilk2025Towards, Geady2025Radiomic, Bates2003Voxel, Bowren2022Poststroke, Fujibayashi2021Nonlinear |
| Methodology | Isensee2021nnUNet, Zwanenburg2020Image, Geady2025Radiomic |
| Discussion | Janse2026Deep, Geady2025Radiomic, Fujibayashi2021Nonlinear, Choi2026Tumor |

## Excluded at Full-Text Assessment

Sixteen of the 44 Phase B records were excluded; what was read is stated for each.

- Beg, Miller, Trouve, Younes (2005), Computing large deformation metric mappings via geodesic flows of diffeomorphisms, International Journal of Computer Vision 61(2):139-157, DOI 10.1023/B:VISI.0000043755.93987.aa. Cited by three Layer 2 core papers (must-include flag). Excluded because no abstract or text could be read: Crossref carries no abstract, the record is not in PubMed or Europe PMC, the Springer page redirected to a login, and two third-party index pages (MaRDI portal, Bohrium) showed no abstract. Only the bibliographic record was read. The merge run should retry it through another channel before finalizing.
- Zhang, Kimberg, Coslett, Schwartz, Wang (2014), Multivariate lesion-symptom mapping using support vector regression, Human Brain Mapping 35(12):5861-5876, DOI 10.1002/hbm.22590, PMID 25044213. Read: PubMed abstract. Excluded because multivariate lesion-symptom prediction is covered by Bowren2022Poststroke, which predicts outcomes in an independent sample; held out to stay within the 28-source target.
- Crinion et al. (2007), Spatial normalization of lesioned brains: performance evaluation and impact on fMRI analyses, NeuroImage, DOI 10.1016/j.neuroimage.2007.04.065, PMID 17616402. Read: PubMed abstract. Excluded because the strategies it evaluates are compared together on outcome data in Juhling2024Spatial, with Brett2001Spatial kept as the origin of cost function masking.
- Andersen et al. (2010), Cost function masking during normalization of brains with focal lesions: still a necessity?, NeuroImage, DOI 10.1016/j.neuroimage.2010.06.003, PMID 20542122. Read: PubMed abstract (it reports that unmasked unified segmentation was less accurate than masked normalization in 49 chronic stroke images). Excluded for the same reason as Crinion 2007.
- Nachev et al. (2008), Enantiomorphic normalization of focally lesioned brains, NeuroImage, DOI 10.1016/j.neuroimage.2007.10.002, PMID 18023365. Read: PubMed abstract. Excluded because enantiomorphic registration is evaluated in Juhling2024Spatial.
- Spatial normalization of multiple sclerosis brain MRI data depends on analysis method and software package (2020), Magnetic Resonance Imaging 68:83-94, DOI 10.1016/j.mri.2020.01.016, PMID 32007558. Read: PubMed abstract (it reports that all four nonlinear methods beat affine, SPM CAT12 was best, and lesion filling had small effects). Excluded because pathology-aware normalization comparisons are covered by Miller2025Comparison and Juhling2024Spatial; the MS-specific result is noted here for the merge run.
- uniGradICON: a foundation model for medical image registration (2024), MICCAI 2024, DOI 10.1007/978-3-031-72069-7_70, PMID 42261488. Read: PubMed abstract. Excluded because the abstract reports no evaluation on pathological images or on downstream prediction; Balakrishnan2019VoxelMorph is kept for learning-based registration.
- Deep-diffeomorphic networks for conditional brain templates (2025), Human Brain Mapping 46(8):e70229, DOI 10.1002/hbm.70229, PMID 40372124. Read: PubMed abstract. Excluded because Rakic2026AtlasMorph covers learned conditional templates; this abstract evaluates cognitively normal ADNI participants only.
- Standardized assessment of automatic segmentation of white matter hyperintensities and results of the WMH Segmentation Challenge (2019), IEEE TMI 38(11):2556-2568, DOI 10.1109/TMI.2019.2905770, PMID 30908194. Read: PubMed abstract (it ranks methods with lesion-level sensitivity and lesion-level F1 among five metrics). Excluded because the challenge sub-theme is covered by Menze2015Multimodal and Carass2017Longitudinal; its lesion-level metrics are relevant to gap 4 and are noted for the merge run.
- The Brain Tumor Segmentation Metastases (BraTS-METS) Challenge 2023, arXiv 2306.00838 (PubMed record 37396600, an arXiv preprint). Read: arXiv abstract (lesion-wise Dice and HD95 ranking; 402 public studies with 3,076 lesions). Excluded because it is a preprint whose peer-reviewed version was not checked in this run, and lesion-instance evaluation is covered by Wynen2025ConfLUNet.
- Radiomics to evaluate interlesion heterogeneity and to predict lesion response and patient outcomes using a validated signature of CD8 cells in advanced melanoma (2022), Journal for ImmunoTherapy of Cancer 10(10):e004867, DOI 10.1136/jitc-2022-004867, PMID 36307149. Read: PubMed abstract (136 patients, 1,120 lesions; lesion-level AUC 0.55). Excluded because Geady2025Radiomic replicates multi-lesion dispersion and aggregation methods across three datasets.
- Integrating standard and native spaces for radiomics and brain network analysis in Alzheimer's disease diagnosis and prognosis (2026), Journal of Neurology 273(2):124, DOI 10.1007/s00415-026-13664-w, PMID 41656413. Read: PubMed abstract (combined standard-space and native-space features performed best). Excluded because the input is whole-brain T1 anatomy in Alzheimer's disease with no lesion or region sets, outside the lesion-set scope of Theme D.
- Post-stroke outcome prediction based on lesion-derived features (2025), NeuroImage: Clinical 45:103747, DOI 10.1016/j.nicl.2025.103747, PMID 39914289. Read: PubMed abstract (340 patients; lesion masks and thresholded disconnection maps were strong predictors). Excluded because registration-based lesion prediction is covered by Bowren2022Poststroke.
- Radiomics Quality Score 2.0 (2025), Nature Reviews Clinical Oncology 22(11):831-846, DOI 10.1038/s41571-025-01067-1, PMID 40903523. Read: Europe PMC abstract. Excluded because it is a study-quality scoring framework and gives no evidence on correspondence handling or on the pipeline steps.
- The Brain Tumor Sequence Registration (BraTS-Reg) Challenge, arXiv 2112.06979. Read: arXiv abstract. Excluded because it is a preprint with no peer-reviewed version found by the Crossref query, and Mok2022Unsupervised, which is evaluated on BraTS-Reg data, is kept.
- Liver tumor screening and diagnosis in CT with Pixel-Lesion-Patient Network, arXiv 2307.08268. Read: arXiv abstract (patient-level diagnosis from an image-wise classifier alongside per-lesion mask-transformer outputs). Excluded because the abstract does not describe aggregating a lesion set into the patient-level prediction, and Chen2021AMINN and Prabhakar2023Selfpruning are kept for lesion-set prediction; peer-reviewed version not checked.

Duplicate versions merged (counted once): PMID 34013242 with arXiv 2101.06775; arXiv 2307.15615 with PMID 39612808. Preprints of included works recorded with the peer-reviewed version: arXiv 1809.05231, 2511.13609, 2206.03900, 2404.09556, 2106.00817, 2505.22537, 2012.06875, 2308.16863.

## Candidates kept at title/abstract screening but not advanced to Phase B

These 74 records passed the first title/abstract pass and were not selected in the second pass. They were not assessed further, so no judgement on them is made here; they are listed so that the merge run can draw on them.

- D1 registration, PubMed: 29896582, 34013242, 35139030, 22305954, 42582330, 29100938, 35219941, 31689538, 39928283, 42361771. arXiv: 1809.06130, 1704.06065, 2003.09514, 2008.07628, 2309.10153 (ICCV 2023, DOI 10.1109/iccv51070.2023.01939), 2404.16544, 2307.15615 (Medical Image Analysis version PMID 39612808), 2503.03778. DOIs from backward chaining: 10.1016/j.neuroimage.2008.12.037, 10.1016/j.neuroimage.2007.07.007, 10.1016/j.neuroimage.2010.09.025, 10.1109/tmi.2013.2265603, 10.1016/j.neuroimage.2005.02.018.
- D2 radiomics, PubMed: 32785796, 38319168, 38717290, 31481588, 39594139, 37711738, 29594181, 22898692, 28975929, 25025374.
- D3 segmentation, PubMed: 34563682, 37742374, 41469162, 37988921, 27475911, 34666289, 40552999, 37967585. arXiv: 1809.10486.
- D4 subject-level prediction, PubMed: 26465238, 38375230, 41375088, 35925442, 42248208, 35976392, 41800187, 42927027, 32651155, 34892053, 40528098, 38370445, 39364269, 33901427, 37346231, 38593534, 17583985, 42530329, 41810022, 36470102, 37382614, 42204350, 40519564, 39291162, 37417774, 40739225, 39939139, 38945043. arXiv: 2509.08935, 2204.05276. DOIs from backward chaining: 10.1093/brain/awaa156, 10.1093/brain/awu164.

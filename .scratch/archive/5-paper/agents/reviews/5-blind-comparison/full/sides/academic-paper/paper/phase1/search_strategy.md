# Phase 1: Literature search strategy

Produced by `literature_strategist_agent` for the `full`-mode run of `academic-paper`. Inputs read: `paper/config.md` (binding decisions C1, C5, C6, C9), `paper/phase0/paper_configuration_record.md`, `code/README.md`, `code/core/bttn.py`, `code/core/config.py`, `code/core/cnn.py`, `code/core/ssl_pretrain.py`, `code/core/cohort.py`, `code/bttrlib/ace.py`, `code/bttrlib/bttr.py` and `notes/history/NOVELTY-AAAI-METHODS.md`.

## Profile and corpus resolution

- Domain evidence profile: `cs_ml`, read from the confirmed `paper/config.md` row "Domain evidence profile | cs_ml". It is a ship-enum value with no `(requested: ...)` suffix, so no advisory tag applies. The PCR `Discipline` row is "Biomedical informatics / AI in medicine", which the agent's discipline map places outside the `cs_ml` implied set (CS / Engineering / Technology): `[PROFILE-DISCIPLINE-MISMATCH]`. This is a warning only. Admissibility uses `cs_ml` (archival preprints and proceedings admitted, universal relevance, methodology and predatory gates unchanged); database choice follows the Medicine discipline (PubMed first) plus CS sources (arXiv, PMLR, NeurIPS, IEEE and ACL records through Crossref).
- Material Passport `literature_corpus[]`: none exists in this project (no passport file under `paper/`), so the corpus-first flow does not apply and no PRE-SCREENED block is emitted. The project's own prior-art note (`notes/history/NOVELTY-AAAI-METHODS.md`) and the references named in code docstrings were used as known-item seeds and screened with the same criteria as database hits.

## Run constraints (from `paper/config.md`)

- C5: references are verified through web search, metadata pages and PubMed records; no file is saved. No PDF was opened or downloaded, and no dataset was downloaded.
- C6: no code was run. All lookups were read-only fetches of metadata pages.
- The PubMed MCP tools (`search_articles`, `lookup_article_by_citation`) were denied by the permission system when called. PubMed records were read instead through the public NCBI E-utilities pages (`esearch.fcgi`, `esummary.fcgi`, `efetch.fcgi?rettype=abstract&retmode=text`) with WebFetch, which the brief lists as an allowed route (WebFetch of PubMed metadata pages).

## Key concepts

| Concept | Terms used |
|---|---|
| Outcome | atrial fibrillation; incident, new-onset, future AF; AF risk; sinus rhythm |
| Data and modality | 12-lead ECG; electrocardiogram; MIMIC-IV, MIMIC-IV-ECG, PTB-XL, CODE-15, PhysioNet |
| Model family | block term decomposition; block-term tensor regression; Tucker; HOPLS; tensor neural network; multilinear; tensor network |
| Interpretability | interpretable, explainable, explainability, saliency, heat map, concept bottleneck, leakage, faithfulness, attribution |
| Training and evaluation | Cox partial likelihood, deep survival, concordance; contrastive, self-supervised; spectrogram, time-frequency; calibration, decision curve, bootstrap confidence interval, AUROC, TRIPOD+AI |
| Substrate physiology | P-wave duration, P-wave terminal force V1, atrial fibrillatory rate, f-wave, dominant frequency |

## Databases and sources

| Source | Access route | Role |
|---|---|---|
| PubMed / MEDLINE | NCBI E-utilities pages via WebFetch | Topic searches and verification of clinical and biomedical-engineering records (PMID, DOI, abstract) |
| Crossref | `https://api.crossref.org/works` (DOI filter and `query.bibliographic`) | DOI, author, venue, volume and page verification for all journal and IEEE, SIAM, ACL, NeurIPS records |
| arXiv | `http://export.arxiv.org/api/query?id_list=...` | Verification and abstracts for arXiv identifiers |
| PMLR, NeurIPS proceedings, JMLR | Proceedings pages | Venue, volume and pages for ML conference papers without DOIs |
| Semantic Scholar Graph API | `https://api.semanticscholar.org/graph/v1/paper/DOI:...` | Abstracts for two papers whose Crossref record has none |
| PhysioNet, Zenodo | Dataset pages | Dataset records (MIMIC-IV-ECG, CODE-15) |
| Web search (general) | WebSearch tool | Discovery of candidates and proceedings pages |

IEEE Xplore, Scopus, Web of Science and Google Scholar were not queried directly (no access route that returns structured records here); IEEE records were reached through Crossref.

## Inclusion and exclusion criteria

| Criterion | Include | Exclude |
|---|---|---|
| Publication type | Peer-reviewed journal articles, peer-reviewed proceedings, clinical and reporting guidelines, dataset records; under `cs_ml`, archival arXiv preprints | Blogs, news, theses and slides; records whose existence or metadata could not be verified |
| Date | 2016 to 2026, plus seminal works (methods and datasets the paper's methods use directly) | Older works that are neither seminal nor used by the methods |
| Language | English | Other languages |
| Relevance | Addresses one of the topics above and supports a statement the paper needs (background, method, comparator, evaluation, physiology) | Tangential applications (for example ICU mortality, sleep staging, synthetic ECG generation) |
| Methodology | No fatal design flaw visible in the abstract | Abstract shows the task differs from what it would be cited for (for example detection cited as prediction) |
| Verification | Metadata confirmed in at least one record read in this phase | Not verifiable: listed in "Unverified" below and not used |

## Searches run, with hit counts

Counts are those returned by each query at the time it was run (2026-11-14).

### PubMed (E-utilities esearch)

| # | Query (PubMed syntax) | Hits | Screened (title or abstract read) | Included |
|---|---|---|---|---|
| P1 | `("MIMIC-IV-ECG"[Title/Abstract] OR "MIMIC-IV ECG"[Title/Abstract] OR (MIMIC-IV[Title/Abstract] AND electrocardiogram*[Title/Abstract])) AND atrial fibrillation[Title/Abstract]` | 11 | 11 abstracts | 4 (Jabbour 2024, Ko 2026, Nolin-Lapalme 2026, McKeen 2025) |
| P2 | `(interpretable[Title] OR explainable[Title] OR explainability[Title]) AND atrial fibrillation[Title] AND (predict*[Title] OR risk[Title] OR incident[Title] OR new-onset[Title]) AND (ECG[Title/Abstract] OR electrocardiogra*[Title/Abstract])` | 2 | 2 abstracts | 1 (Matsuo 2026) |
| P3 | `(explainable[Title] OR explainability[Title] OR saliency[Title] OR interpretable[Title] OR heat map[Title]) AND (ECG[Title] OR electrocardiogram[Title] OR electrocardiography[Title]) AND (review[Title] OR deep learning[Title])` | 29 | 15 titles (first page), 4 abstracts | 1 (Stor<latin small letter a with ring above>s 2023) |
| P4 | `(spectrogram[Title] OR time-frequency[Title] OR short-time Fourier[Title]) AND (ECG[Title] OR electrocardiogram[Title]) AND (deep learning[Title] OR convolutional[Title] OR neural network[Title])` | 6 | 6 titles, 2 abstracts | 1 (Jeong 2021) |
| P5 | `(P terminal force[Title] OR P-wave terminal force[Title]) AND lead V1[Title] AND atrial fibrillation[Title]` | 6 | 6 titles, 2 abstracts | 2 (Huang 2020, Wolder 2023) |
| P6 | `(Bollmann[Author] AND Europace[Journal] AND 2006[dp]) OR (German DM[Author] AND atrial fibrillation predictors[Title]) OR (Soliman EZ[Author] AND P-wave terminal force[Title] AND atrial fibrillation[Title])` plus the TNNLS DOI | 3 | 3 abstracts | 2 (Bollmann 2006, Faes 2024) |
| P7 | `(Kim Y[Author] AND Discriminative and distinct phenotyping[Title]) OR (Siontis KC[Author] AND electrocardiogram[Title] AND 2021[dp] AND Nat Rev Cardiol[Journal])` | 1 | 1 abstract | 1 (Kim 2017) |
| P8 | DOI batches for known-item verification (`"<doi>"[doi]` joined by OR; five batches) | 16, 8, 3, 2, 1 | all abstracts | verification only |

### Web search (discovery)

| # | Query | Results | Candidates taken forward |
|---|---|---|---|
| W1 | MIMIC-IV-ECG deep learning prediction incident atrial fibrillation sinus rhythm ECG (extended) | 10 | Jabbour 2024, Strodthoff 2024 (later excluded), Nowroozilarki 2024 (later excluded) |
| W2 | Montreal Heart Institute deep learning sinus rhythm ECG predict atrial fibrillation 31 days MIMIC-IV external validation | 10 | Yuan 2023 |
| W3 | Faes Van Hulle extended block-term tensor regression eBTTR finger movement intracranial | 10 | Faes 2022, Faes 2024 |
| W4 | atrial fibrillation f-wave dominant frequency surface ECG lead V1 spectral analysis review | 10 | Platonov 2014 (via Corino); band values not verifiable (see Unverified) |
| W5 | block term decomposition atrial activity extraction atrial fibrillation ECG Zarzoso | 10 | Goulart 2020 |
| W6 | interpretable tensor decomposition ECG prediction incident atrial fibrillation sinus rhythm deep learning faithfulness | 10 | Hammer 2022; a Hasselt master's thesis (unverified) |
| W7 | "Sanity Checks for Saliency Maps" NeurIPS 2018 proceedings | 10 | proceedings page |
| W8 | "Addressing Leakage in Concept Bottleneck Models" Havasi NeurIPS 2022 | 10 | Havasi 2022 |
| W9 | Hooker Erhan Kindermans Kim "A Benchmark for Interpretability Methods in Deep Neural Networks" NeurIPS 2019 | 10 | proceedings page |

### Known-item retrieval and verification

Seeds came from the brief (Attia 2019, Raghunath 2021, Khurshid 2022, CHARGE-AF, MIMIC-IV, MIMIC-IV-ECG, PhysioNet, CODE-15, PTB-XL, De Lathauwer, BT-RNN, BT-Nets, BTTDA, chi-net, B-cos, concept bottlenecks, Rudin 2019, Cox 1972, DeepSurv, Harrell, Vickers, TRIPOD+AI), the novelty note (arXiv:1712.05134, arXiv:1712.05689, arXiv:2010.04963, arXiv:2511.04292, arXiv:2504.02667, Hunyadi 2014, supervised CP phenotyping), and code (`ssl_pretrain.py` "SimCLR-style"; `ace.py` cites Yokota and Cichocki 2014; `bttr.py` mentions HOPLS and eBTTR), plus citation chaining from these (for example Christopoulos 2020, Schnabel 2009, Nielsen 2015, Kvamme 2019, Jacovi 2020, Hooker 2019, Adebayo 2018, Mahinpei 2021, Havasi 2022). Each was looked up by DOI or identifier in Crossref, PubMed, arXiv or the proceedings page, and its abstract was read where one exists.

Crossref queries used: four DOI-filter batches (12, 14, 11 and 9 DOIs) and bibliographic queries for BT-RNN, Block-term tensor neural networks, B-cos networks, eBTTR, BTTR (TNNLS), Goulart 2020, Corino or Platonov, Yokota 2014, Strodthoff 2024, and single-DOI records for Attia 2019, Jabbour 2024, Siontis 2021 and Hammer 2022. arXiv API batches: 10 identifiers, 8 identifiers, 1 identifier.

## Screening results

| Stage | Count |
|---|---|
| Records returned by PubMed topic queries P1 to P7 | 58 |
| Of these, titles screened (P3: first 15 of 29 only) | 44 |
| Result links returned by web searches W1 to W9 | 90 (10 per query; many duplicates and non-scholarly pages) |
| Included sources identified through topic queries P1 to P7 and W1 to W6 | 17 |
| Included sources identified as known-item seeds or by citation chaining | 51 |
| Verified and included (total) | 68 |
| Verified but excluded after abstract assessment (table below) | 14 |
| Other topic-query hits excluded at title or abstract as off-topic (for example ICU mortality, HRV association, ECG synthesis, denoising) | the remainder of the 44 screened titles |
| Not verifiable (not used) | 6 |

Verified and excluded (reason):

| Source (verified record) | Reason for exclusion |
|---|---|
| German DM et al. Ann Noninvasive Electrocardiol 2016;21(1):20-9, PMID 26523405 | Narrative review; its content is covered by the primary cohort studies Nielsen 2015, Huang 2020 and Wolder 2023 |
| Siontis KC et al. Nat Rev Cardiol 2021;18(7):465-78, PMID 33526938 | General AI-ECG review; the primary studies are cited instead |
| Strodthoff N et al. IEEE J Biomed Health Inform 2021;25(5):1519-28, PMID 32903191 | PTB-XL benchmark of detection tasks; not needed for the incident-AF argument |
| Strodthoff N et al. Eur Heart J Digit Health 2024;5(4):454-60, PMID 39081937 | Abstract mentions neither MIMIC-IV-ECG nor AF, so it cannot be cited for either |
| Selvaraju RR et al. Int J Comput Vis 2020;128(2):336-59, doi:10.1007/s11263-019-01228-7 | Post-hoc method not used by the project; Integrated Gradients retained as the representative attribution method |
| Zhang D et al. iScience 2021;24(4):102373, PMID 33981967 | Arrhythmia detection with SHAP; Hughes 2021 and Stor<latin small letter a with ring above>s 2023 cover post-hoc ECG explanation |
| Ayano YM et al. Diagnostics 2022;13(1):111, PMID 36611403 | Systematic review without findings relevant to faithfulness |
| Margeloiu A et al. arXiv:2105.04289 (ICLR 2021 workshop) | Workshop paper; Mahinpei 2021 and Havasi 2022 cover concept leakage |
| Kwon D et al. PLoS One 2025;20(3):e0317630, PMID 40063554 | AF detection on PhysioNet/CinC 2017 single-lead data, not prediction from sinus rhythm |
| DeLong ER et al. Biometrics 1988;44(3):837-45, PMID 3203132 | Paired AUROC test; decision C4 states no paired tests are reported |
| Nowroozilarki Z et al. EMBC 2024, PMID 40039094 | AF detection on MIMIC-IV-ECG, not prediction |
| Khanolkar U et al. Heart Rhythm O2 2026;7(10):1900-11, PMID 42936093 | Baseline rhythm and label source not stated in the abstract; task cannot be matched |
| Torquati MC et al. EMBC 2025, PMID 41337373 | Postoperative AF decision support, no results in the abstract |
| Pantelidis P et al. Front Cardiovasc Med 2025;12:1659971, PMID 41179570 | Detection of current AF |

## Unverified (not used)

| Item | Where it appeared | What was tried | Result |
|---|---|---|---|
| Hasselt University master's thesis on block-term tensor regression for AF detection and prediction from multi-lead ECG | W6 result `documentserver.uhasselt.be/bitstream/1942/47197/...pdf` | Fetch of the repository landing page `https://documentserver.uhasselt.be/handle/1942/47197` | HTTP 503; author, year and title not confirmed. The PDF was not opened (C5, C6). If this is the project's own predecessor work, the authors should supply its citation. |
| Cardoso et al., "Detection of Atrial Fibrillation from ECG using BTD Tensor Decomposition", J Commun Inf Syst 2025 | W6 result `jcis.sbrt.org.br/jcis/article/view/900` | Search snippet only | Authors, volume and DOI not confirmed |
| de Oliveira PMR, Zarzoso V, "Block Term Decomposition of ECG Recordings for Atrial Fibrillation Analysis: Temporal and Inter-Patient Variability", J Commun Inf Syst 2019 | W5 result | Search snippet only | Not confirmed; Goulart 2020 is used for the same point |
| Ribeiro LN, de Almeida ALF, Zarzoso V, enhanced block term decomposition for atrial activity extraction, IEEE SAM 2016 | W5 result (PDF link) | Snippet only; PDF not opened | Not confirmed |
| Numerical f-wave values (largest spectral peak sought between 3 and 12 Hz, analysis in lead V1; dominant frequencies near 6 Hz) | W4 snippets of full-text PDFs (Corino review, CinC 2008 paper) | Abstracts of Bollmann 2006 and Platonov 2014 read | Neither abstract states a band, rate or lead. These numbers are unverified and must not be cited until the citation agent checks a full text. |
| Page ranges for Adebayo 2018 (9505-9515) and Hooker 2019 (9737-9748) | W7 and W9 search summaries (mlanthology) | Official NeurIPS pages read | Official pages show no page range; the entries omit pages |

## Topics from the brief and their yield

| Topic | Yield | Note |
|---|---|---|
| AI-ECG incident AF from sinus rhythm (Attia, Raghunath, Khurshid, MIMIC-IV-ECG work) | 13 included | No verified study develops incident-AF prediction on MIMIC-IV-ECG with ICD-10-dated outcomes; MIMIC-IV appears as external test data (Jabbour 2024, Ko 2026, Nolin-Lapalme 2026) or for detection (McKeen 2025). Searches P1 and W1. |
| Clinical AF risk scores | 2 scores (CHARGE-AF, Framingham) plus epidemiology and guideline | |
| Datasets (MIMIC-IV, MIMIC-IV-ECG, PhysioNet, CODE-15, PTB-XL) | 6 | MIMIC-IV-ECG version 1.0 matches the zip name in `code/core/config.py` |
| Block-term decomposition and block-term or tensor regression | 10 | |
| Block-term tensor neural networks (BT-RNN, BT-Nets, Neural Networks 2020), BTTDA, chi-net | 5 | All five identifiers in the novelty note resolve |
| B-cos networks | 1 | |
| Concept bottleneck models and leakage | 3 | |
| Interpretable versus post-hoc explanation in medicine | 2 (Rudin 2019, Ghassemi 2021) | |
| Faithfulness evaluation of explanations | 4 (Adebayo, Hooker, Jacovi, Sundararajan) | No verified ECG-specific quantitative faithfulness evaluation was found; Stor<latin small letter a with ring above>s 2023 is a qualitative physician assessment. Searches P2, P3, W6. |
| ECG saliency and explainability | 3 (Hughes, Stor<latin small letter a with ring above>s, Matsuo) | |
| Cox partial likelihood, deep survival, Harrell's C | 4 | |
| Self-supervised contrastive pretraining for ECG | 3 core (SimCLR, CLOCS, Mehari) plus 2 recent AF uses (Ko, Nolin-Lapalme) | |
| Spectrogram and time-frequency ECG | 1 (Jeong 2021) | P4 returned 6 hits, all detection or non-AF tasks; no verified study uses time-frequency ECG tensors for incident-AF prediction |
| AF electrophysiology (f-wave band, P-wave, lead V1) | 5 | P-wave and V1 evidence verified from abstracts; f-wave band numbers not verifiable from abstracts (see Unverified) |
| Calibration, decision curve analysis, TRIPOD+AI, bootstrap CIs for AUROC | 5 | |

## Saturation

Stopping conditions met: (1) source count 68 exceeds the IMRaD minimum of 20; (3) every theme in the literature matrix has at least 3 sources; the time-frequency theme reaches 3 only because it is combined with the spectral AF electrophysiology reviews (Jeong 2021 is the only verified time-frequency deep-learning source); (4) citation chaining from the core AI-ECG and interpretability papers returned no new uncollected item in the last round; (5) the corpus spans seminal works (1972 to 2009) and 2024 to 2026 work.

## Quality gates

| Gate | Result |
|---|---|
| Search strategy documented | Yes (this file) |
| Source count | 68 included, minimum 20 |
| Annotation completeness | 68 of 68 annotated in `annotated_bibliography.md` |
| Matrix coverage | Every theme has 3 or more sources (`literature_matrix.md`) |
| Research gaps | 5 stated in `research_gap.md` |
| Peer-reviewed ratio (`cs_ml` counts archival preprints as peer-reviewed-equivalent) | 62 peer-reviewed journal or proceedings records, 4 archival preprints, 2 dataset records: 66 of 68 (97%) |
| Currency (published 2021 to 2026) | 30 of 68 (44%), below the 50% guideline. The 38 older sources are the definitional, dataset and statistical-method citations the Methods use directly (Cox 1972, Harrell 1982, Hanley 1982, Vickers 2006, De Lathauwer 2008, Kolda 2009, Goldberger 2000, Schnabel 2009, Alonso 2013, BTTR lineage) and the 2016 to 2020 core AI-ECG and interpretability papers. Adding marginal recent sources to reach the ratio was not done, because none of the screened recent candidates passed the relevance criterion. Sources from 2016 to 2026: 52 of 68 (76%). |

## Coverage distribution advisory

No distributional skew advisory triggered. Counts over the 68 included sources: publication years 2020 to 2026 account for 40 of 68 (59%); evidence types are journal articles 50, proceedings 12, preprints 4, datasets 2 (journal articles 74%, which is the expected type for a clinical-informatics journal and is not a coverage concern); among the 17 clinical cohorts or datasets whose setting is stated in the record read, 11 include US data (65%); no single venue holds more than 4 sources (PMLR 4; Circulation, Lancet and Eur Heart J 3 each).

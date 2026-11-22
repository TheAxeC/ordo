# Literature review: supervised prediction from data whose spatial mode is not aligned across subjects

## 1. Search strategy

No manuscript `.bib` and no seed list were given, so no screened `.bib` block applies. The search started from scratch.

### The parts of the research question

- **P1**: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects, such as point clouds, sets of lesions or sets of regions?
- **P2**: How does each method handle the missing correspondence: registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance?
- **P3**: Where does each method remove, or build on, the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

### Concepts and search strings

Primary concepts: unaligned spatial data (point cloud, lesion set, set of regions, irregular tensor), the correspondence mechanism (optimal transport, Gromov-Wasserstein, barycenter, template, permutation invariance, tensor regression), and the subject-level outcome (prediction, classification, prognosis, survival). Secondary terms: Wasserstein, Sinkhorn, entropic, fused Gromov-Wasserstein, PARAFAC2, partial least squares, multiple instance learning, Deep Sets, registration-free, radiomics, lesion segmentation.

Whole question (PubMed form):

```
("optimal transport"[tiab] OR "Wasserstein"[tiab] OR "Gromov-Wasserstein"[tiab] OR "permutation invariant"[tiab] OR "point cloud"[tiab] OR "tensor regression"[tiab] OR "partial least squares"[tiab]) AND ("registration-free"[tiab] OR "without registration"[tiab] OR "unaligned"[tiab] OR "correspondence"[tiab]) AND (prediction[tiab] OR classification[tiab] OR regression[tiab]) AND english[la]
Filters in the query: publication date 2016 to 2026, English
```

P1:

```
("point cloud"[tiab] OR "lesion set"[tiab] OR "set of lesions"[tiab] OR "multiple instance learning"[tiab]) AND ("patient-level"[tiab] OR "subject-level"[tiab] OR outcome[tiab] OR prognosis[tiab] OR survival[tiab]) AND ("deep learning"[tiab] OR "machine learning"[tiab] OR "neural network"[tiab]) AND english[la]
```

P2:

```
("optimal transport"[tiab] OR "Gromov-Wasserstein"[tiab] OR "Wasserstein barycenter"[tiab] OR "permutation invariant"[tiab] OR "tensor partial least squares"[tiab] OR "tensor regression"[tiab]) AND (correspondence[tiab] OR alignment[tiab] OR template[tiab] OR registration[tiab]) AND english[la]
```

P3:

```
("radiomics"[tiab] OR "lesion segmentation"[tiab] OR "image registration"[tiab]) AND ("optimal transport"[tiab] OR "point cloud"[tiab] OR "permutation invariant"[tiab] OR "registration-free"[tiab] OR "Gromov-Wasserstein"[tiab]) AND english[la]
```

No NOT term was used. The year range of 2016 to 2026 was applied in the PubMed and MEDLINE queries. Seminal works older than the range entered through layers 2 and 3, which took no year filter. Peer-review and publication-type filters were applied at screening.

### Search record

All searches were run on 2026-11-16.

| # | Part | Database | Interface | String | Filters in the query | Count reported | Records taken into screening |
|---|---|---|---|---|---|---|---|
| 1 | Whole | PubMed | `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=<string>&datetype=pdat&mindate=2016&maxdate=2026&retmax=60&retmode=json`, titles from `esummary.fcgi` | Whole question | 2016 to 2026, `english[la]` | 55 | 55 titles |
| 2 | P1 | PubMed | Same | P1 | Same | 165 | 60 titles |
| 3 | P2 | PubMed | Same | P2 | Same | 183 | 60 titles |
| 4 | P3 | PubMed | Same | P3 | Same | 62 | 60 titles |
| 5 to 8 | Whole, P1, P2, P3 | MEDLINE | Same, with `AND medline[sb]` added, `retmax=0` | Whole, P1, P2, P3 | Same | 23, 94, 79, 35 | 0 (subsets of searches 1 to 4) |
| 9 | P2 | IEEE Xplore | Web search `site:ieeexplore.ieee.org Gromov-Wasserstein OR "optimal transport" classification point cloud OR graph template barycenter` | P2 concepts | none | no count | 0 pages of the site, 10 links from other hosts screened by title |
| 10 | P1 | IEEE Xplore | Web search `site:ieeexplore.ieee.org tensor partial least squares OR "tensor regression" neuroimaging prediction` | P1 and P2 concepts | none | no count | 0 pages of the site, 10 links from other hosts screened |
| 11 | P1 | ACM DL | Web search `site:dl.acm.org permutation invariant set OR "point cloud" OR "multiple instance" medical image prediction without registration` | P1 and P3 concepts | none | no count | 0 pages of the site, 10 links from other hosts screened |
| 12 | P2 | ACM DL | Web search `site:dl.acm.org "optimal transport" OR "Gromov-Wasserstein" dictionary learning graphs template` | P2 concepts | none | no count | 0 pages of the site, 10 links from other hosts screened |
| 13 | P3 | Scopus | Web search `site:scopus.com optimal transport registration-free medical image prediction` | P3 concepts | none | no count | 0 pages of the site, 10 links from other hosts screened |
| 14 | P2 | Crossref, OpenAlex, Semantic Scholar, arXiv | `the lookup script search 'optimal transport classification point clouds without registration' --limit 25` | P2 | none | no count | 66 records |
| 15 | P2 | Same | `the lookup script search 'fused Gromov-Wasserstein graph classification templates' --limit 25` | P2 | none | no count | 61 records |
| 16 | P1 | Same | `the lookup script search 'permutation invariant set encoder lesions outcome prediction' --limit 25` | P1 | none | no count | 75 records |
| 17 | P1 | Same | `the lookup script search 'tensor partial least squares regression multiway' --limit 25` | P1 | none | no count | 70 records |
| 18 | P2 | Same | `the lookup script search 'PARAFAC2 decomposition irregular mode' --limit 25` | P2 | none | no count | 62 records |
| 19 | P3 | Same | `the lookup script search 'registration-free optimal transport medical image fusion' --limit 25` | P3 | none | no count | 71 records |
| 20 | P1 | Same | `the lookup script search 'point cloud deep learning brain shape Alzheimer classification' --limit 20` | P1 | none | no count | 59 records |
| 21 | P1 | Same | `the lookup script search 'Wasserstein distance patient classification medical imaging lesion distribution' --limit 20` | P1 | none | no count | 59 records |
| 22 | P2 | Same | `the lookup script search 'optimal transport pooling feature aggregation sets trainable reference' --limit 20` | P2 | none | no count | 58 records |
| 23 | P1 | Same | `the lookup script search 'multiple instance learning attention lesion level patient level prediction MRI' --limit 20` | P1 | none | no count | 40 records |
| 24 | Whole (layer 4) | Same | `the lookup script search '<research question as a sentence>' --limit 100` | Whole | none | no count | 101 records |
| 25 | Whole (layer 4) | Semantic Scholar | `https://api.semanticscholar.org/graph/v1/paper/search?query=<sentence>&fields=title,year,externalIds,venue,citationCount&limit=100`, key `<REDACTED>` | Whole | none | 0 | 0 |

- The total of a `the lookup script search` call is not reported by the indexes, so these rows carry "no count". Semantic Scholar answered HTTP 429 to three further direct API queries (`optimal transport classification unaligned point clouds without registration`, `fused Gromov-Wasserstein template graph classification`, `permutation invariant set neural network medical image lesions prediction`), and those queries returned no records. In searches 14 to 24, `the lookup script` printed "arXiv: not found" for searches 14, 16, 19, 21, 23 and 24, "Semantic Scholar: not found" for search 24, and "Semantic Scholar: left out, HTTP 429 after 3 retries" for search 23.
- PubMed counts were all between 20 and 500, so no search was relaxed or tightened. The MEDLINE subsets added no record beyond PubMed.

### Databases left out or not reached

- IEEE Xplore, ACM DL and Scopus: not reached. The web search ignored each `site:` restriction and returned no page of the three sites, so no record of these databases could be read. The links from other hosts (arXiv, PMLR, aggregators) were screened as web records.
- Cochrane: not selected. The question asks about methods, and Cochrane holds systematic reviews of interventions.
- Google Scholar: not reached; it has no API and answers automated requests with a bot check.
- Scopus "Cited by": not reached; its site answers with a bot check and its API needs a key.
- Connected Papers: not reached; its pages hold no titles without a browser that runs scripts.
- OpenCitations: not queried. `the lookup script refs` and `cited-by` answered from Semantic Scholar and OpenAlex for every core and foundational work.
- Springer pages: `https://doi.org/10.1007/s10208-011-9093-5` answered with a "Client Challenge" page (status 200 at `https://link.springer.com/10.1007/s10208-011-9093-5`), so the author's copy was read instead.

### Passes

**Pass 1 (four layers), 80 sources added.**

- Layer 1 (searches 1 to 23) gave 59 included sources: Zhou_2013, Qibin_Zhao_2013, Lock_2018, Zhang_2017, Camarrone_2019, Bro_1996, arxiv_1509_06490, Kiers_1999, Kolda_2009, Afshar_2018, Roald_2022, arxiv_2208_00993, arxiv_1306_0895, Peyr__2019, arxiv_1810_08278, arxiv_2111_00648, M_moli_2011, Peyre_2016, arxiv_1805_09114, Vayer_2020, Xu_2023, Thual_2022, arxiv_1310_4375, arxiv_2102_06555, arxiv_2205_15733, arxiv_2006_12065, arxiv_2202_03813, arxiv_2006_09430, Wang_2012, Schmitz_2018, Gong_2026, Kundu_2018, Gerber_2023, Gramfort_2015, Belkhatir_2022, arxiv_2602_07260, arxiv_1703_06114, Charles_2017, arxiv_1810_00825, arxiv_1802_04712, Guti_rrez_Becker_2021, Luo_2022, Gupta_2021, Karimzadeh_2026, Yang_2020, Liu_2026, Kalra_2020, Xie_2025, AVANTS_2008, Balakrishnan_2019, Sotiras_2013, Lambin_2012, Gillies_2016, Zwanenburg_2020, Isensee_2020, Kamnitsas_2017, Traverso_2018, Aerts_2014, Chen_2025.
- Layer 1 also gave these sources, published 2024 to 2026: Shifat_E_Rabbi_2025, arxiv_2401_01460, arxiv_2605_20883, Wang_2024, Kim_2025, Sun_2024, arxiv_2510_22033, Xie_2025a, Winzell_2025, Islam_2026.
- Layer 2 ran `the lookup script refs` on 8 core papers: arxiv_1805_09114, arxiv_2205_15733, arxiv_2102_06555, arxiv_2006_12065, Thual_2022 (2206.09398), Gerber_2023 (2208.05891), arxiv_1703_06114 and Zhou_2013. Works in the references of 3 or more core papers were marked "must include": Peyre_2016 (7), Peyr__2019 (6), arxiv_1306_0895 (5), M_moli_2011 (4), Gramfort_2015 (4), arxiv_1310_4375 (3), Vayer_2020 (3, as its arXiv version), arxiv_1906_01277 (4), Xu_2020 (3) and Ktena_2017 (3). The last three were added by layer 2. Also marked by the count were graph kernels that compare graphs by substructure counts ("Scalable kernels for graphs with continuous attributes" 5, "Efficient graphlet kernels for large graph comparison" 5, "Weisfeiler-Lehman graph kernels" 3, "Shortest-path kernels on graphs" 3, "On graph kernels: hardness results and efficient alternatives" 3, "Deep graph kernels" 3, "Graph kernels" 3), and general works ("Geometric deep learning: going beyond Euclidean data" 3, "Learning convolutional neural networks for graphs" 3, "Matching node embeddings for graph similarity" 3, "Image classification with segmentation graph kernels" 3, "Generalized linear models" 3, "Convergence rate of Frank-Wolfe for non-convex objectives" 3). These were excluded at node 3 of the screening tree. They address graph benchmarks or optimisation and none of the four aspects of the question.
- Layer 3 ran `the lookup script cited-by` on 6 foundational works: Gramfort_2015, Zhou_2013, Kiers_1999, Peyre_2016 (OpenAlex W2417433140), M_moli_2011 and arxiv_1310_4375. Each listing printed "first 100, more exist" for OpenAlex, and also for Semantic Scholar for all but Gramfort_2015 and Peyre_2016. Every foundational work had citing works in 2024 to 2026 (14, 109, 54, 22, 120 and 108 lines), so none was marked "possibly outdated". Layer 3 added: D_az_Mart_n_2026, arxiv_2609_23705, Konyar_2025, Auddy_2025, Zhou_2024, M_rup_2025, Takeda_2025 and arxiv_2609_05919.
- Layer 4 (searches 24 and 25) added no source. Its 101 records were registration, compression and data-analysis works off the question, so the overlap test could not show saturation.

**Pass 2 (four layers), 7 sources added (8.75 percent of 80).**

- Layer 1 was not re-run with new strings, since every part already had at least 3 sources.
- Layer 2 ran `the lookup script refs` on 4 new core papers: Gong_2026, Karimzadeh_2026, arxiv_2510_22033 and arxiv_2605_20883. It added Chang_2021, Geady_2025, Chen_2021, Zhang_2025, Kovacs_2023 and Moosm_ller_2022.
- Layer 3 ran `the lookup script cited-by` on arxiv_2205_15733 and Guti_rrez_Becker_2021, and added Kwon_2025.
- Layer 4 had no new query, since search 25 and its follow-ups were refused or empty.

### Conditions when the search ended

The search ended after pass 2 with 4 of the 5 conditions holding, condition 2 among them:

1. Source count: holds. There are 87 sources against a minimum of 30.
2. Latest pass added little: holds. Pass 2 added 7, under 10 percent of 80.
3. Every theme saturated: holds. Each of the 8 themes has at least 3 sources (section 5).
4. Citation loop closes: does not hold. Pass 2 chaining still listed cited works not collected, for example "Computational Radiomics System to Decode the Radiographic Phenotype" and "elastix: A Toolbox for Intensity-Based Medical Image Registration".
5. Temporal span: holds. The set runs from 1996 (Bro_1996) to 2026, with 27 sources from 2024 to 2026.

### Criteria and profile

The profile is `cs_ml`, which fits the Machine learning discipline row. Archival preprints and conference proceedings were admitted and tagged by evidence type. The language was English. The default date range was 2016 to 2026, and older works entered as seminal works through layers 2 and 3. The paper type is Literature Review, with a minimum of 30 sources and a typical range of 40 to 80. The final set of 87 is above the typical range.

## 2. Distribution advisory

```
Distribution advisory:
- Dimension: method
- Concentration: computational = 75/87 (86 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: no expansion; the research question asks about methods, so computational studies are expected to dominate. The 12 other sources are reviews or surveys (Kolda_2009, Peyr__2019, Sotiras_2013, Traverso_2018, Chen_2025, Auddy_2025, M_rup_2025, Geady_2025, Lambin_2012, Gillies_2016) and tool or standard papers (arxiv_2602_07260, Takeda_2025). Zwanenburg_2020 is counted as computational, since it is a multi-team measurement study.
```

Time: the most frequent year is 2025, with 14 of 87 (16 percent). Venue: arXiv-only entries are 10 of 87, and no venue family reaches 70 percent. Geography: the study site is known for too few sources, so the dimension is left out.

## 3. Screening results

- Records listed by the searches and chaining: 235 PubMed titles, 722 records from `the lookup script search` (searches 14 to 24), 50 web-search links, 657 reference records from layer 2 and 1,064 citing records from layer 3. Duplicates across these lists were not counted.
- Title screening kept 89 candidates. Duplicates sharing a DOI or arXiv ID were merged, for example the arXiv and published versions of HOPLS and of Gerber_2023.
- Abstract screening kept 88. Excluded: "Radiomic clustering using graph network techniques coupled with unbalanced optimal transport" (doi 10.1016/j.csbj.2025.10.066). Its transport acts between samples in feature space for unsupervised subgrouping, and it handles no spatial correspondence (abstract read from `the lookup script fetch`, csbj.org PDF HTTP 403). The graph kernels and general works marked by the layer 2 count were excluded at node 3, as section 1 lists.
- Full-text assessment kept 87. One candidate left at this stage: "Pooling by Sliced-Wasserstein Embedding" (NeurIPS 2021). `the lookup script resolve` gave no DOI and no arXiv ID, the text was not fetched, and it was not cited by 3 core papers, so it was excluded.
- Final included sources: 87.

Candidates that needed more than the first way of reading:

- M_moli_2011: `the lookup script fetch` found no text and no abstract. Europe PMC `https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:10.1007/s10208-011-9093-5&resultType=core&format=json` returned 200 with 0 hits. `https://doi.org/10.1007/s10208-011-9093-5` returned 200 at `https://link.springer.com/10.1007/s10208-011-9093-5` with a challenge page. The author's copy `https://www.math.ucdavis.edu/~saito/data/acha.read.w12/memoli-gromov-dist.pdf` returned 200 and was read.
- Guti_rrez_Becker_2021: `fetch` got HTTP 403 from sciencedirect and no abstract. Europe PMC `...search?query=DOI:10.1016/j.media.2020.101852&resultType=core&format=json` returned 200 with the abstract.
- AVANTS_2008: `fetch` found the PMC page "not a PDF". Europe PMC `...query=DOI:10.1016/j.media.2007.06.004...` returned 200 with the abstract.
- Chen_2025: `fetch` got HTTP 403 and no abstract. Europe PMC `...query=DOI:10.1016/j.media.2024.103385...` returned 200 with the abstract.
- Zhang_2025: `fetch` found no text and no abstract. Europe PMC `...query=DOI:10.1007/978-3-032-04927-8_31...` returned 200 with 0 hits. `https://doi.org/10.1007/978-3-032-04927-8_31` returned 200 at `https://link.springer.com/chapter/10.1007/978-3-032-04927-8_31?error=cookies_not_supported&...`, and the abstract section of that page was read.

No candidate stayed unread.

### Quality scores

Venue, rigour, relevance, citation count and evidence quality are scored 1 to 3. Citation counts were measured only where a `cited-by` listing ran: Zhou_2013, Kiers_1999, M_moli_2011, arxiv_1310_4375, Gramfort_2015 and Peyre_2016 each printed "first 100, more exist" and score 3. Seminal works with known wide use in the chaining counts also score 3. All other citation scores are set at 2, as not measured.

| Key | Venue | Rigour | Relevance | Citations | Evidence | Total | Quality |
|---|---|---|---|---|---|---|---|
| Zhou_2013 | 3 | 3 | 3 | 3 | 3 | 15 | High |
| Qibin_Zhao_2013 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Lock_2018 | 3 | 3 | 2 | 2 | 2 | 12 | High |
| Zhang_2017 | 3 | 3 | 2 | 2 | 3 | 13 | High |
| Camarrone_2019 | 3 | 2 | 2 | 2 | 3 | 12 | High |
| Bro_1996 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| arxiv_1509_06490 | 3 | 3 | 2 | 2 | 3 | 13 | High |
| Kiers_1999 | 3 | 3 | 3 | 3 | 2 | 14 | High |
| Kolda_2009 | 3 | 3 | 2 | 3 | 2 | 13 | High |
| Afshar_2018 | 2 | 3 | 2 | 2 | 3 | 12 | High |
| Roald_2022 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| arxiv_2208_00993 | 1 | 2 | 3 | 2 | 3 | 11 | Medium |
| arxiv_1306_0895 | 2 | 3 | 2 | 3 | 3 | 13 | High |
| Peyr__2019 | 3 | 3 | 2 | 3 | 2 | 13 | High |
| arxiv_1810_08278 | 2 | 3 | 2 | 3 | 2 | 12 | High |
| arxiv_2111_00648 | 2 | 3 | 2 | 2 | 3 | 12 | High |
| M_moli_2011 | 3 | 3 | 3 | 3 | 2 | 14 | High |
| Peyre_2016 | 2 | 3 | 3 | 3 | 2 | 13 | High |
| arxiv_1805_09114 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| Vayer_2020 | 2 | 3 | 3 | 2 | 2 | 12 | High |
| Xu_2023 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Thual_2022 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| arxiv_1310_4375 | 2 | 3 | 3 | 3 | 2 | 13 | High |
| arxiv_2102_06555 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| arxiv_2205_15733 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| arxiv_2006_12065 | 1 | 3 | 3 | 2 | 3 | 12 | High |
| arxiv_2202_03813 | 2 | 3 | 2 | 2 | 3 | 12 | High |
| arxiv_2006_09430 | 1 | 3 | 3 | 2 | 3 | 12 | High |
| Wang_2012 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Schmitz_2018 | 3 | 3 | 2 | 2 | 2 | 12 | High |
| Gong_2026 | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| Kundu_2018 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Gerber_2023 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Gramfort_2015 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| Belkhatir_2022 | 2 | 2 | 3 | 2 | 3 | 12 | High |
| arxiv_2602_07260 | 1 | 2 | 3 | 1 | 2 | 9 | Medium |
| arxiv_1703_06114 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| Charles_2017 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| arxiv_1810_00825 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| arxiv_1802_04712 | 2 | 3 | 3 | 3 | 3 | 14 | High |
| Guti_rrez_Becker_2021 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Luo_2022 | 3 | 3 | 3 | 2 | 3 | 14 | High |
| Gupta_2021 | 2 | 2 | 3 | 2 | 3 | 12 | High |
| Karimzadeh_2026 | 3 | 3 | 3 | 1 | 3 | 13 | High |
| Yang_2020 | 2 | 2 | 3 | 2 | 2 | 11 | Medium |
| Liu_2026 | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| Kalra_2020 | 2 | 2 | 2 | 2 | 3 | 11 | Medium |
| Xie_2025 | 3 | 2 | 3 | 1 | 3 | 12 | High |
| AVANTS_2008 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Balakrishnan_2019 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Sotiras_2013 | 3 | 3 | 2 | 3 | 2 | 13 | High |
| Lambin_2012 | 3 | 2 | 2 | 3 | 1 | 11 | Medium |
| Gillies_2016 | 3 | 2 | 2 | 3 | 1 | 11 | Medium |
| Zwanenburg_2020 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Isensee_2020 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Kamnitsas_2017 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Traverso_2018 | 3 | 3 | 2 | 3 | 2 | 13 | High |
| Aerts_2014 | 3 | 3 | 2 | 3 | 3 | 14 | High |
| Chen_2025 | 3 | 2 | 2 | 2 | 2 | 11 | Medium |
| arxiv_1906_01277 | 2 | 3 | 2 | 3 | 3 | 13 | High |
| Xu_2020 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| Ktena_2017 | 2 | 2 | 3 | 3 | 3 | 13 | High |
| D_az_Mart_n_2026 | 3 | 3 | 3 | 1 | 2 | 12 | High |
| arxiv_2609_23705 | 1 | 2 | 3 | 1 | 3 | 10 | Medium |
| Konyar_2025 | 3 | 2 | 3 | 1 | 3 | 12 | High |
| Auddy_2025 | 3 | 3 | 2 | 2 | 2 | 12 | High |
| Zhou_2024 | 3 | 3 | 2 | 2 | 2 | 12 | High |
| M_rup_2025 | 3 | 3 | 2 | 1 | 2 | 11 | Medium |
| Takeda_2025 | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| Shifat_E_Rabbi_2025 | 2 | 3 | 3 | 1 | 3 | 12 | High |
| arxiv_2401_01460 | 1 | 2 | 3 | 1 | 3 | 10 | Medium |
| arxiv_2605_20883 | 1 | 2 | 3 | 1 | 3 | 10 | Medium |
| Wang_2024 | 2 | 3 | 3 | 1 | 3 | 12 | High |
| Kim_2025 | 3 | 3 | 2 | 1 | 3 | 12 | High |
| Sun_2024 | 3 | 3 | 2 | 1 | 3 | 12 | High |
| arxiv_2510_22033 | 1 | 2 | 3 | 1 | 3 | 10 | Medium |
| Xie_2025a | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| Winzell_2025 | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| arxiv_2609_05919 | 1 | 2 | 2 | 1 | 2 | 8 | Medium |
| Islam_2026 | 2 | 2 | 3 | 1 | 2 | 10 | Medium |
| Chang_2021 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| Geady_2025 | 2 | 3 | 3 | 1 | 3 | 12 | High |
| Chen_2021 | 2 | 2 | 3 | 2 | 3 | 12 | High |
| Zhang_2025 | 2 | 2 | 3 | 1 | 3 | 11 | Medium |
| Kovacs_2023 | 2 | 3 | 3 | 2 | 3 | 13 | High |
| Moosm_ller_2022 | 3 | 3 | 3 | 2 | 2 | 13 | High |
| Kwon_2025 | 3 | 2 | 3 | 1 | 3 | 12 | High |

Under the `cs_ml` profile every source passes the quick assessment. No source scored 7 or less.

## 4. Annotated bibliography

### Theme T1: tensor regression and multilinear partial least squares

### Zhou (2013). Tensor regression with applications in neuroimaging data analysis. [@Zhou_2013]
- **Type**: Journal article (Journal of the American Statistical Association)
- **Read from**: abstract written by `the lookup script fetch` from the indexes (Europe PMC copy `http://europepmc.org/articles/PMC4004091` answered HTTP 403)
- **Method**: a family of regression models with tensor covariates and low-rank coefficient structure, fitted by maximum likelihood.
- **Key results**: the structure reduces ultrahigh dimensionality to a manageable level, giving efficient estimation and prediction. The method was shown on synthetic and real MRI data.
- **Relevance**: the reference model for predicting a scalar outcome from an image array. It assumes the voxel modes are aligned across subjects.
- **Quality**: High, seminal statistical method with asymptotic theory.
- **Stance**: neutral
- **Potential use**: Introduction, Literature Review (T1)

### Zhao (2013). Higher order partial least squares (HOPLS): a generalized multilinear regression method. [@Qibin_Zhao_2013]
- **Type**: Journal article (IEEE TPAMI)
- **Read from**: `https://arxiv.org/pdf/1207.1230` (full text via `the lookup script fetch`)
- **Method**: predicts a tensor Y from a tensor X through a latent space built as a sum of orthogonal Tucker tensors, optimised by HOSVD of a generalized cross-covariance tensor.
- **Key results**: on synthetic data and on decoding 3D movement trajectories from ECoG, HOPLS had better predictive ability than existing methods, suited small samples and was more stable under noise.
- **Relevance**: the multilinear PLS reference, with all modes in correspondence across samples.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1), Methodology

### Lock (2018). Tensor-on-tensor regression. [@Lock_2018]
- **Type**: Journal article (Journal of Computational and Graphical Statistics)
- **Read from**: abstract written by `the lookup script fetch` (PMC page 6188709 "not a PDF")
- **Method**: linear prediction of a tensor from a tensor through the contracted tensor product, with reduced PARAFAC/CANDECOMP rank and a ridge penalty, and a Gibbs sampler for inference.
- **Key results**: the framework generalizes scalar-on-tensor, matrix-on-matrix and tensor-on-scalar models, and was applied to facial image data.
- **Relevance**: T1. All modes are assumed aligned.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1)

### Zhang (2017). Tensor envelope partial least-squares regression. [@Zhang_2017]
- **Type**: Journal article (Technometrics)
- **Read from**: abstract written by `the lookup script fetch` (figshare page "not a PDF")
- **Method**: a tensor PLS algorithm with a population model linked to envelope and sufficient dimension reduction.
- **Key results**: the paper establishes asymptotic consistency of the PLS estimator and applies the method to two neuroimaging data analyses.
- **Relevance**: gives tensor PLS a population interpretation. It is a candidate supervised objective for a model with one unaligned mode.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1), Methodology

### Camarrone (2019). Fast multiway partial least squares regression. [@Camarrone_2019]
- **Type**: Journal article (IEEE Transactions on Biomedical Engineering)
- **Read from**: `https://lirias.kuleuven.be/retrieve/7b7075e5-09b3-4b15-a3bd-dff7d629800a` (full text via `the lookup script fetch`)
- **Method**: fHOPLS, a faster variant of HOPLS for large tensors, compared with HOPLS, unfolded PLS and linear regression.
- **Key results**: fHOPLS was faster than HOPLS on large data with comparable regression performance. Both outperformed unfolded PLS and linear regression when predicting scalp EEG from ECoG.
- **Relevance**: T1; scalability of multilinear PLS.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1)

### Bro (1996). Multiway calibration. Multilinear PLS. [@Bro_1996]
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: N-way PLS (tri-PLS), solved by eigenvalue problems.
- **Key results**: tri-PLS stabilised the decomposition compared with unfold-PLS. On simulated noisy fluorescence data its predictions were almost twice as good as unfold-PLS.
- **Relevance**: seminal multilinear PLS (T1).
- **Quality**: High, seminal
- **Stance**: neutral
- **Potential use**: Introduction, Literature Review (T1)

### Guhaniyogi (2017). Bayesian tensor regression. [@arxiv_1509_06490]
- **Type**: Journal article (Journal of Machine Learning Research). Entry built from `https://jmlr.org/papers/v18/16-362.html` with `the lookup script bibtex 1509.06490 --page`.
- **Read from**: `https://arxiv.org/html/1509.06490`
- **Method**: scalar-on-tensor regression with multiway shrinkage priors on a PARAFAC coefficient tensor, fitted by MCMC.
- **Key results**: posterior consistency holds under mild conditions. Simulations showed gains over vectorising or over existing tensor regression methods, and the paper includes a neuroimaging application.
- **Relevance**: T1, the Bayesian counterpart of Zhou_2013.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1)

### Auddy (2025). Tensors in high-dimensional data analysis: methodological opportunities and theoretical challenges. [@Auddy_2025]
- **Type**: Journal article, review (Annual Review of Statistics and Its Application)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: review.
- **Key results**: the review examines advances of the past decade in modelling multiway data across statistics, optimisation and numerical linear algebra.
- **Relevance**: background for T1 and T2.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction

### Zhou (2024). Broadcasted nonparametric tensor regression. [@Zhou_2024]
- **Type**: Journal article (JRSS Series B)
- **Read from**: `https://arxiv.org/pdf/2008.12927`
- **Method**: a broadcasting operation applies univariate functions to all entries of the tensor covariate, with penalised estimation.
- **Key results**: the estimator attains a convergence rate matched by a minimax lower bound, and it outperformed linear tensor regression in numerical experiments.
- **Relevance**: T1, nonlinear tensor regression with aligned modes.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1)

### Sun (2024). Partial quantile tensor regression. [@Sun_2024]
- **Type**: Journal article (Journal of the American Statistical Association)
- **Read from**: abstract written by `the lookup script fetch` (PMC12448065 "not a PDF")
- **Method**: applies the partial least squares principle to quantile regression with a tensor covariate (PQTR).
- **Key results**: the PQTR estimator is root-n consistent under an envelope model. On a PTSD neuroimaging study its results were more interpretable than those of existing methods.
- **Relevance**: T1; a recent PLS-type tensor regression for neuroimaging outcomes.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T1)

### Theme T2: decompositions with an unaligned mode

### Kiers (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model. [@Kiers_1999]
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: direct fitting of PARAFAC2 to a set of matrices that share column units but have different numbers of row units.
- **Key results**: PARAFAC2 gives unique solutions under mild assumptions, and direct fitting is more efficient than indirect fitting. Direct fitting can handle constraints and missing data.
- **Relevance**: the reference model for a tensor whose one mode differs in size and in identity across slices (P2).
- **Quality**: High, seminal
- **Stance**: neutral
- **Potential use**: Literature Review (T2), Methodology

### Kolda (2009). Tensor decompositions and applications. [@Kolda_2009]
- **Type**: Journal article, survey (SIAM Review)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: survey of CP, Tucker, PARAFAC2, INDSCAL and related decompositions.
- **Key results**: the survey sets out higher-order decompositions, their applications and software.
- **Relevance**: background for T1 and T2.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction

### Afshar (2018). COPA: constrained PARAFAC2 for sparse and large datasets. [@Afshar_2018]
- **Type**: Conference paper (CIKM)
- **Read from**: abstract written by `the lookup script fetch` (dl.acm.org PDF HTTP 403)
- **Method**: PARAFAC2 with temporal smoothness, sparsity and non-negativity constraints, fitted by AO-ADMM.
- **Key results**: on EHR data with hundreds of thousands of patients, COPA ran up to 36 times faster than prior PARAFAC2 approaches at the same accuracy.
- **Relevance**: T2; PARAFAC2 for patients whose numbers of encounters differ.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T2)

### Roald (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes. [@Roald_2022]
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: PARAFAC2 fitted by AO-ADMM, so that general penalties apply to the evolving mode.
- **Key results**: the method recovered underlying patterns in simulations, and constraining the evolving mode improved interpretability on neuroscience and chemometrics data.
- **Relevance**: names measurements with "unaligned time profiles" as a target of PARAFAC2 (P2).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T2)

### Ren (2022). MULTIPAR: supervised irregular tensor factorization with multi-task learning. [@arxiv_2208_00993]
- **Type**: arXiv preprint. Semantic Scholar names a version titled "... for Computational Phenotyping" at ML4H@NeurIPS 2023 with no DOI (`the lookup script resolve` on that title), so the entry is the arXiv record. Published version not confirmed.
- **Read from**: `https://arxiv.org/html/2208.00993`
- **Method**: PARAFAC2 supervised by static and dynamic prediction tasks with multi-task learning.
- **Key results**: on two real temporal EHR datasets, supervision gave more meaningful phenotypes and better predictive performance on downstream tasks.
- **Relevance**: a supervised decomposition in which one mode is not aligned, the closest analogue in T2 of a supervised multilinear model with an unaligned mode (P1, P2).
- **Quality**: Medium; not peer reviewed in this form
- **Stance**: supports
- **Potential use**: Literature Review (T2), Discussion

### Konyar (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping using electronic health records. [@Konyar_2025]
- **Type**: Journal article (IEEE JBHI)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: PARAFAC2 that uses label information available for a subset of patients.
- **Key results**: on synthetic data and on MIMIC-IV, the method outperformed the benchmarks.
- **Relevance**: T2, label-guided factorisation of irregular tensors.
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T2)

### Patalano (2026). PAR2COX: survival-informed tensor decomposition for phenotyping and risk prediction from irregular longitudinal data. [@arxiv_2609_23705]
- **Type**: arXiv preprint; `the lookup script resolve` on the title and on the arXiv ID found no published version
- **Read from**: `https://arxiv.org/html/2609.23705`
- **Method**: PARAFAC2 joined with a Cox model, with patient-specific factors as covariates, by alternating optimisation.
- **Key results**: on MIMIC-IV, risk stratification improved compared with existing approaches.
- **Relevance**: subject-level survival prediction from an irregular tensor (P1, T2).
- **Quality**: Medium (preprint)
- **Stance**: supports
- **Potential use**: Literature Review (T2), Discussion

### Morup (2025). Tensor and coupled decompositions: interpretable pattern discovery in multiset and multimodal functional neuroimaging data. [@M_rup_2025]
- **Type**: Journal article, survey (IEEE Signal Processing Magazine)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: survey of hard and soft coupling models for multiset and multimodal functional neuroimaging.
- **Key results**: the survey stresses model uniqueness as a prerequisite for reliable pattern discovery when variability across individuals is high.
- **Relevance**: T2 in neuroimaging. Soft coupling is one way to relax correspondence across subjects.
- **Quality**: Medium
- **Stance**: neutral
- **Potential use**: Literature Review (T2)

### Theme T3: entropic optimal transport

### Cuturi (2013). Sinkhorn distances: lightspeed computation of optimal transport. [@arxiv_1306_0895]
- **Type**: Conference paper (NeurIPS). Entry built from `https://papers.nips.cc/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html` with `bibtex --page`.
- **Read from**: `https://arxiv.org/html/1306.0895`
- **Method**: entropic regularisation of optimal transport, solved by Sinkhorn-Knopp matrix scaling.
- **Key results**: the regularised optimum is also a distance, it is computed several orders of magnitude faster than transportation solvers, and it improved performance on MNIST.
- **Relevance**: the solver behind most transport couplings in T4 to T6.
- **Quality**: High, seminal
- **Stance**: neutral
- **Potential use**: Literature Review (T3), Methodology

### Peyre (2019). Computational optimal transport. [@Peyr__2019]
- **Type**: Journal article, monograph (Foundations and Trends in Machine Learning)
- **Read from**: `https://arxiv.org/html/1803.00567` (the arXiv version of the monograph)
- **Method**: survey of optimal transport theory and algorithms, including entropic regularisation and Sinkhorn's algorithm (its chapter 4).
- **Key results**: the monograph sets out Kantorovich relaxation, linear programming solvers, Sinkhorn iterations and their stability in log-domain computation.
- **Relevance**: background for T3 to T5.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction, Methodology

### Feydy (2019). Interpolating between optimal transport and MMD using Sinkhorn divergences. [@arxiv_1810_08278]
- **Type**: Conference paper (AISTATS). Entry built from `https://proceedings.mlr.press/v89/feydy19a.html`.
- **Read from**: `https://arxiv.org/html/1810.08278`
- **Method**: Sinkhorn divergences, which interpolate between MMD and optimal transport.
- **Key results**: the divergences are positive, convex and metrize convergence in law. On the GPU, gradients of the Sinkhorn loss can be computed for batches of a million samples.
- **Relevance**: T3; a debiased transport loss usable between point clouds of different sizes.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Methodology

### Shen (2021). Accurate point cloud registration with robust optimal transport. [@arxiv_2111_00648]
- **Type**: Conference paper (NeurIPS 2021 per Semantic Scholar). No proceedings page with citation tags was reached: `bibtex 2111.00648 --page 'https://neurips.cc/virtual/2021/poster/26958'` printed "no citation_title tag". The `@misc` entry stays, published version not confirmed.
- **Read from**: `https://arxiv.org/html/2111.00648`
- **Method**: robust optimal transport for point cloud registration, used for pre-alignment and inside deep registration models.
- **Key results**: the OT-based methods reached state-of-the-art results on Kitti and on lung vascular tree registration. The authors release PVT1010, with 1,010 pairs of lung vascular trees.
- **Relevance**: transport used to build a registration of point clouds (P3), not to bypass it.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T3, T8)

### Theme T4: Gromov-Wasserstein and fused Gromov-Wasserstein

### Memoli (2011). Gromov-Wasserstein distances and the metric approach to object matching. [@M_moli_2011]
- **Type**: Journal article (Foundations of Computational Mathematics)
- **Read from**: `https://www.math.ucdavis.edu/~saito/data/acha.read.w12/memoli-gromov-dist.pdf` (author's copy, HTTP 200)
- **Method**: objects are viewed as metric measure spaces and compared by a Gromov-Wasserstein distance built on mass transportation.
- **Key results**: the distance is a strict metric on isomorphism classes of metric measure spaces, and it admits lower bounds computable in polynomial time.
- **Relevance**: the theory for comparing objects that live in different spaces with no shared coordinates (P2).
- **Quality**: High, seminal
- **Stance**: neutral
- **Potential use**: Introduction, Literature Review (T4)

### Peyre (2016). Gromov-Wasserstein averaging of kernel and distance matrices. [@Peyre_2016]
- **Type**: Conference paper (ICML). Entry from the `the lookup script resolve` record, since the work has no DOI and no arXiv ID.
- **Read from**: abstract written by `the lookup script fetch` for OpenAlex W2417433140 (`https://hal.science/hal-01322992` "not a PDF")
- **Method**: entropic (softassign) Gromov-Wasserstein, and a barycenter of distance or kernel matrices defined as a Frechet mean.
- **Key results**: the matrices need not have the same size nor be in row-by-row correspondence. The method was applied to shape barycenters and to predicting energy levels from molecular configurations.
- **Relevance**: a barycenter template for inputs with no correspondence, and a prediction example (P1, P2).
- **Quality**: High; cited by 7 of 8 core papers
- **Stance**: supports
- **Potential use**: Literature Review (T4, T5), Methodology

### Vayer (2019). Optimal transport for structured data with application on graphs. [@arxiv_1805_09114]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v97/titouan19a.html`.
- **Read from**: `https://arxiv.org/html/1805.09114`
- **Method**: fused Gromov-Wasserstein (FGW), which uses node features and structure together.
- **Key results**: FGW outperformed graph kernels and deep graph convolutional networks on graph classification. FGW barycenters of graphs were used for clustering.
- **Relevance**: the coupling for sets whose elements carry both features and positions, such as lesions with radiomic features and locations (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T4), Methodology

### Vayer (2020). Fused Gromov-Wasserstein distance for structured objects. [@Vayer_2020]
- **Type**: Journal article (Algorithms)
- **Read from**: `https://www.mdpi.com/1999-4893/13/9/212/pdf?version=1599119885`
- **Method**: theory of FGW in the continuous setting.
- **Key results**: the paper proves metric and interpolation properties of FGW and a concentration result for finite samples.
- **Relevance**: T4 theory.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Methodology

### Xu (2023). Representing graphs via Gromov-Wasserstein factorization. [@Xu_2023]
- **Type**: Journal article (IEEE TPAMI)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: each graph is reconstructed as a weighted GW combination of shared graph factors, and the factors and weights are learned jointly.
- **Key results**: the weights form a permutation-invariant representation of graphs whose node correspondence is unknown and whose sizes differ.
- **Relevance**: a learned set of templates for unaligned inputs (P2, T5).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T4, T5)

### Thual (2022). Aligning individual brains with fused unbalanced Gromov-Wasserstein. [@Thual_2022]
- **Type**: Conference paper (NeurIPS)
- **Read from**: `https://arxiv.org/html/2206.09398`
- **Method**: fused unbalanced Gromov-Wasserstein (FUGW) aligns cortical surfaces by their functional signatures while penalising large deformations. FUGW barycenters serve as group templates.
- **Key results**: FUGW increased between-subject correlation of activity on held-out functional data, and gave more precise group-level mapping than usual group analysis.
- **Relevance**: a transport coupling across subjects that replaces anatomical co-registration (P2, P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T4, T6), Discussion

### Togninalli (2019). Wasserstein Weisfeiler-Lehman graph kernels. [@arxiv_1906_01277]
- **Type**: Conference paper (NeurIPS). Entry built from `https://papers.nips.cc/paper/8872-wasserstein-weisfeiler-lehman-graph-kernels`.
- **Read from**: `https://arxiv.org/html/1906.01277`
- **Method**: graph kernel from the Wasserstein distance between node feature distributions after a Weisfeiler-Lehman embedding.
- **Key results**: the kernel improved on the state of the art on several graph classification tasks.
- **Relevance**: transport between unordered node sets for graph-level prediction (P1, P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T4)

### Takeda (2025). Unsupervised alignment in neuroscience: introducing a toolbox for Gromov-Wasserstein optimal transport. [@Takeda_2025]
- **Type**: Journal article, tool (Journal of Neuroscience Methods)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: GWOT for unsupervised alignment of representations, with the toolbox GWTune.
- **Key results**: GWOT revealed one-to-one, group-to-group and shifted correspondences without labels, across behavioural data, neural recordings and network models.
- **Relevance**: GW as a correspondence finder when no shared coordinates exist (P2).
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Discussion

### Theme T5: barycenters, dictionaries and learnable templates

### Cuturi (2014). Fast computation of Wasserstein barycenters. [@arxiv_1310_4375]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v32/cuturi14.html`.
- **Read from**: `https://arxiv.org/html/1310.4375`
- **Method**: entropy-smoothed Wasserstein barycenters computed by matrix scaling.
- **Key results**: smoothing gives a strictly convex objective whose gradients are cheap. The method was used to visualise image families and for constrained clustering.
- **Relevance**: the template (barycenter) computation of T5.
- **Quality**: High, seminal
- **Stance**: neutral
- **Potential use**: Methodology

### Vincent-Cuaz (2021). Online graph dictionary learning. [@arxiv_2102_06555]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v139/vincent-cuaz21a.html`.
- **Read from**: `https://arxiv.org/html/2102.06555`
- **Method**: graphs are modelled as convex combinations of graph atoms under a GW fitting term, learned online.
- **Key results**: the method operates on unregistered graphs with different numbers of nodes, and it was shown on unsupervised embedding and subspace tracking.
- **Relevance**: learnable templates for unaligned inputs (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5), Methodology

### Vincent-Cuaz (2022). Template based graph neural network with optimal transport distances. [@arxiv_2205_15733]
- **Type**: Conference paper (NeurIPS). Entry built from the proceedings page `.../2022/hash/4d3525bc60ba1adc72336c0392d3d902-Abstract.html`.
- **Read from**: `https://arxiv.org/html/2205.15733`
- **Method**: TFGW, a layer that embeds a graph by its FGW distances to learnable template graphs, trained end to end.
- **Key results**: the template distances were validated on synthetic and real graph classification datasets.
- **Relevance**: the most direct supervised form of a learned template with a transport coupling (P1, P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5), Methodology

### Mialon (2021). A trainable optimal transport embedding for feature aggregation and its relationship to attention. [@arxiv_2006_12065]
- **Type**: arXiv preprint. Semantic Scholar names ICLR, but `the lookup script bibtex` printed no venue note and no published DOI, so the entry is the arXiv record. Published version not confirmed.
- **Read from**: `https://arxiv.org/html/2006.12065`
- **Method**: a set is embedded by the optimal transport plan between its elements and a trainable reference, giving a fixed-size representation.
- **Key results**: the method reached state-of-the-art results for protein fold recognition and chromatin profile detection. The aggregation relates to attention and to a transport kernel.
- **Relevance**: pooling by transport to a learned reference, between set encoders (T7) and templates (T5).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5, T7), Methodology

### Brogat-Motte (2022). Learning to predict graphs with fused Gromov-Wasserstein barycenters. [@arxiv_2202_03813]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v162/brogat-motte22a.html`.
- **Read from**: `https://arxiv.org/html/2202.03813`
- **Method**: graph prediction as regression with an FGW loss, where the output is an FGW barycenter whose weights depend on the input, with learned barycenter graphs.
- **Key results**: the paper proves consistency and an excess risk bound, and gave good performance on metabolite identification.
- **Relevance**: barycenters with learned templates in supervised learning (T5).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Kolouri (2021). Wasserstein embedding for graph learning. [@arxiv_2006_09430]
- **Type**: Conference paper (ICLR per Semantic Scholar). The page `https://openreview.net/forum?id=AAes_3W-2z` gave "no citation_title tag" to `bibtex --page`, so the `@misc` entry stays. Published version not confirmed.
- **Read from**: `https://arxiv.org/html/2006.09430`
- **Method**: WEGL computes Monge maps from a reference distribution to each graph's node embeddings and uses them as a fixed-size vector.
- **Key results**: complexity drops from quadratic to linear in the number of graphs, with state-of-the-art classification on graph-property tasks.
- **Relevance**: reference-based linear transport embedding (T5).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Wang (2013). A linear optimal transportation framework for quantifying and visualizing variations in sets of images. [@Wang_2012]
- **Type**: Journal article (International Journal of Computer Vision)
- **Read from**: abstract written by `the lookup script fetch` (PMC3667970 page "not a PDF")
- **Method**: linear optimal transportation (LOT), a linearised Kantorovich-Wasserstein metric with an isometric linear embedding.
- **Key results**: LOT computes all pairwise distances of large image databases efficiently. It was applied to nuclear chromatin patterns in cancer cells, facial expressions, galaxy morphologies and protein distributions.
- **Relevance**: the origin of reference-based transport embeddings used for prediction (T5, T6).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Schmitz (2018). Wasserstein dictionary learning. [@Schmitz_2018]
- **Type**: Journal article (SIAM Journal on Imaging Sciences)
- **Read from**: `https://arxiv.org/html/1708.01955`
- **Method**: histograms are reconstructed as Wasserstein barycenters of learned atoms, with entropic regularisation and automatic differentiation of Sinkhorn iterations.
- **Key results**: atoms and weights are learned by gradient descent, which allows nonlinear relations between atoms and data.
- **Relevance**: T5, dictionaries of templates under transport.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T5)

### Xu (2020). Gromov-Wasserstein factorization models for graph clustering. [@Xu_2020]
- **Type**: Conference paper (AAAI)
- **Read from**: `https://arxiv.org/html/1911.08530`
- **Method**: graphs are estimated as GW barycenters of learned atoms, with loopy computations unrolled for backpropagation.
- **Key results**: both the observed graphs and the atoms can be unaligned and of different sizes, and the model gave encouraging graph clustering results.
- **Relevance**: T5.
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Diaz Martin (2026). Gromov-Wasserstein barycenters: the analysis problem. [@D_az_Mart_n_2026]
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science)
- **Read from**: `https://arxiv.org/pdf/2507.09865`
- **Method**: estimates the barycentric coordinates of a matrix with respect to known GW templates, by fixed-point iteration or a blow-up differentiation.
- **Key results**: the GW analysis approach was demonstrated in numerical experiments and machine learning applications.
- **Relevance**: coordinates relative to templates as features of an unaligned object (P2, T5).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Methodology

### Shifat-E-Rabbi (2025). Linear optimal transport subspaces for point set classification. [@Shifat_E_Rabbi_2025]
- **Type**: Journal article (Journal of Mathematical Imaging and Vision)
- **Read from**: `https://www.researchsquare.com/article/rs-4106387/latest.pdf`
- **Method**: LOT transform of point sets, then nearest-subspace classification in LOT space.
- **Key results**: the LOT space makes point sets under affine deformations a convex data space. The classifier is non-iterative and label efficient.
- **Relevance**: classification of unordered point sets without registration (P1, P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Mahan (2024). Point cloud classification via deep set linearized optimal transport. [@arxiv_2401_01460]
- **Type**: arXiv preprint. `resolve` on the title and arXiv ID found no published version
- **Read from**: `https://arxiv.org/html/2401.01460`
- **Method**: input convex neural networks approximate transport maps from a fixed reference, and a weighting discriminator gives a permutation-invariant classifier.
- **Key results**: on flow cytometry data with few labelled point clouds, the method had advantages over the standard Deep Sets approach.
- **Relevance**: combines transport to a reference with set encoding for subject-level labels (P1, P2).
- **Quality**: Medium (preprint)
- **Stance**: supports
- **Potential use**: Literature Review (T5, T7)

### Wang (2024). Graph classification via reference distribution learning: theory and practice. [@Wang_2024]
- **Type**: Conference paper (NeurIPS)
- **Read from**: `https://arxiv.org/pdf/2408.11370`
- **Method**: GRDL treats each graph's node embeddings as a discrete distribution and classifies by maximum mean discrepancy to learned reference distributions, with no global pooling.
- **Key results**: the theory and experiments show stronger generalisation than GNNs with global pooling.
- **Relevance**: learned references as an alternative to pooling (T5). The distance is MMD, not transport.
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Wang (2025). Linearized optimal transport for analysis of high-dimensional point-cloud and single-cell data. [@arxiv_2510_22033]
- **Type**: arXiv preprint. `resolve` on the title and arXiv ID found no published version
- **Read from**: `https://arxiv.org/html/2510.22033`
- **Method**: LOT embeds each patient's cell point cloud by the barycentric transport map from a shared reference distribution.
- **Key results**: the embedding gave interpretable classification of COVID-19 patient states. It also defines a registration between any two patients.
- **Relevance**: subject-level prediction from per-patient point clouds, with correspondence induced by the reference (P1, P2).
- **Quality**: Medium (preprint)
- **Stance**: supports
- **Potential use**: Literature Review (T5), Discussion

### Liao (2026). A dictionary learning framework for graphs via filters and optimal transport. [@arxiv_2609_05919]
- **Type**: arXiv preprint. `resolve` found no published version
- **Read from**: `https://arxiv.org/html/2609.05919`
- **Method**: graphs as Gaussian distributions from filtered Laplacians, approximated by barycenters of learned atoms under a surrogate filter graph distance.
- **Key results**: the surrogate distance handles graphs without known node correspondence, and the method was competitive on benchmark clustering and classification.
- **Relevance**: T5.
- **Quality**: Medium (preprint)
- **Stance**: supports
- **Potential use**: Literature Review (T5)

### Moosmuller (2022). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations. [@Moosm_ller_2022]
- **Type**: Journal article (Information and Inference)
- **Read from**: `https://arxiv.org/html/2008.09165`
- **Method**: analysis of the LOT embedding to a fixed reference.
- **Key results**: LOT makes families generated by shifts and scalings of a distribution linearly separable. The LOT distance is nearly isometric to Wasserstein-2 under stated conditions.
- **Relevance**: conditions under which a reference replaces pairwise matching (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Methodology

### Theme T6: transport-based and registration-free analysis in medical imaging

### Gong (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence. [@Gong_2026]
- **Type**: Journal article (Frontiers in Oncology)
- **Read from**: `https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf`
- **Method**: CMOT-Fusion matches diagnostically relevant regions between misaligned T2WI and ADC images with an entropic transport plan computed by Sinkhorn iterations, on a retrospective single-institution cohort of 300 men.
- **Key results**: the mean AUC was 0.849 +/- 0.034 in 5-fold cross-validation. On a temporal test set of 50 the ensemble AUC was 0.824 (95% CI 0.694 to 0.930), against 0.839 for PI-RADS v2.1.
- **Relevance**: the registration-free transport fusion named in the topic (P1, P2, P3).
- **Quality**: Medium; single centre, small test set, and the test AUC does not exceed PI-RADS
- **Stance**: supports
- **Potential use**: Introduction, Literature Review (T6), Discussion

### Kundu (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry. [@Kundu_2018]
- **Type**: Journal article (NeuroImage)
- **Read from**: `https://arxiv.org/html/1705.04919`
- **Method**: transport-based morphometry (TBM) maps each brain image losslessly into a transport domain relative to a common template.
- **Key results**: in healthy older adults, linear models in TBM space discovered the characteristic changes of aging and mechanisms by which aerobic fitness may mediate brain health.
- **Relevance**: a template-based transport embedding as an alternative to pixelwise deformation-based analysis (P2, P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T6)

### Gerber (2023). Optimal transport features for morphometric population analysis. [@Gerber_2023]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/html/2208.05891`
- **Method**: an unbalanced optimal transport feature extraction step added to morphometric analysis, with transport maps from each image to a template.
- **Key results**: the step reduced sensitivity to shifts from spatial misalignment and separated volume changes from location changes. On OASIS-1 it found tissue changes not otherwise measurable.
- **Relevance**: transport lowers dependence on registration quality but keeps a template (P2, P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T6)

### Gramfort (2015). Fast optimal transport averaging of neuroimaging data. [@Gramfort_2015]
- **Type**: Conference paper (IPMI, Lecture Notes in Computer Science)
- **Read from**: `https://arxiv.org/html/1503.08596`
- **Method**: Kantorovich means of non-normalised data on arbitrary discrete domains, linked to entropic Wasserstein barycenters.
- **Key results**: the algorithm averaged fMRI and MEG source estimates on voxel grids and cortical triangulations, where between-subject variability gives non-overlapping effects.
- **Relevance**: a transport barycenter in place of smoothing before linear group averaging (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T6)

### Belkhatir (2022). Wasserstein-based texture analysis in radiomic studies. [@Belkhatir_2022]
- **Type**: Journal article (Computerized Medical Imaging and Graphics)
- **Read from**: abstract written by `the lookup script fetch` (sciencedirect PDF HTTP 403)
- **Method**: spatial texture features from GLCMs compared by the Wasserstein metric to selected class references, then SVM with Bayesian optimisation.
- **Key results**: the abstract states that scalar texture features are strongly correlated and discard the spatial information of GLCMs, and the pipeline keeps it.
- **Relevance**: transport placed inside a radiomics pipeline (P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T6, T8)

### Kan (2026). 3D transport-based morphometry (3D-TBM) for medical image analysis. [@arxiv_2602_07260]
- **Type**: arXiv preprint, tool; `resolve` found no published version
- **Read from**: `https://arxiv.org/html/2602.07260`
- **Method**: a tool that embeds 3D images into a transport domain by invertible maps to a reference image.
- **Key results**: the tool supports classification and regression in the transport domain and maps results back to image space. Its preprocessing includes registration, segmentation, cropping and centering, and the reference can be updated toward a Wasserstein barycenter.
- **Relevance**: a TBM pipeline that still builds on registration and segmentation (P3).
- **Quality**: Medium (preprint)
- **Stance**: neutral
- **Potential use**: Literature Review (T6)

### Mazelet (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport. [@arxiv_2605_20883]
- **Type**: arXiv preprint. `resolve` found no published version
- **Read from**: `https://arxiv.org/html/2605.20883`
- **Method**: dictionary learning on fMRI with FGW distances between graphs of different geometries, with amortised prediction of transport plans.
- **Key results**: the paper states that projecting subjects onto a common template removes subject-specific information, and it learns atoms without that projection on HCP data.
- **Relevance**: removes template registration for multi-subject brain data (P2, P3).
- **Quality**: Medium (preprint)
- **Stance**: supports
- **Potential use**: Literature Review (T6), Discussion

### Kim (2025). OTMorph: unsupervised multi-domain abdominal medical image registration using neural optimal transport. [@Kim_2025]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: abstract written by `the lookup script fetch` (PMC12204211 "not a PDF")
- **Method**: a transport module maps the moving image distribution toward the fixed one before a registration module estimates the deformation.
- **Key results**: the domain-transported volume improved deformable registration on multi-modality and multi-parametric abdominal images.
- **Relevance**: transport used to improve registration, not to remove it (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T8)

### Theme T7: permutation-invariant set and point-cloud encoders

### Zaheer (2017). Deep sets. [@arxiv_1703_06114]
- **Type**: Conference paper (NeurIPS). Entry built from `https://papers.nips.cc/paper/6931-deep-sets`.
- **Read from**: `https://arxiv.org/html/1703.06114`
- **Method**: a characterisation of permutation-invariant functions and a network architecture built on it.
- **Key results**: the architecture applies to population statistic estimation, point cloud classification, set expansion and outlier detection.
- **Relevance**: the base of P2's permutation-invariance route.
- **Quality**: High, seminal
- **Stance**: supports
- **Potential use**: Literature Review (T7), Methodology

### Qi (2017). PointNet: deep learning on point sets for 3D classification and segmentation. [@Charles_2017]
- **Type**: Conference paper (CVPR)
- **Read from**: `https://arxiv.org/html/1612.00593`
- **Method**: a network that consumes point clouds directly and respects the permutation invariance of the points.
- **Key results**: performance on par with or better than the state of the art on classification, part segmentation and scene parsing.
- **Relevance**: the point-cloud encoder used by the medical point-cloud studies (P1).
- **Quality**: High, seminal
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Lee (2019). Set transformer. [@arxiv_1810_00825]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v97/lee19d.html`.
- **Read from**: `https://arxiv.org/html/1810.00825`
- **Method**: attention-based permutation-invariant encoder and decoder, with inducing-point attention.
- **Key results**: inducing points reduce self-attention cost from quadratic to linear in set size, and the model improved performance on set-structured tasks.
- **Relevance**: models interactions between set elements, such as lesions (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Ilse (2018). Attention-based deep multiple instance learning. [@arxiv_1802_04712]
- **Type**: Conference paper (ICML). Entry built from `https://proceedings.mlr.press/v80/ilse18a.html`.
- **Read from**: `https://arxiv.org/html/1802.04712`
- **Method**: MIL as learning the Bernoulli distribution of the bag label, with an attention-based permutation-invariant pooling.
- **Key results**: comparable to the best MIL methods on benchmarks, better on an MNIST-based task and two histopathology datasets, with instance-level interpretability.
- **Relevance**: the pooling used by lesion-level MIL studies (P1, P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Kalra (2020). Learning permutation invariant representations using memory networks. [@Kalra_2020]
- **Type**: Conference paper (ECCV, Lecture Notes in Computer Science)
- **Read from**: `https://arxiv.org/html/1911.07984`
- **Method**: MEM, a memory-based exchangeable model with self-attention.
- **Key results**: 84.84% accuracy for classifying two lung cancer subtypes from TCGA whole slide images.
- **Relevance**: T7 in pathology.
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Gutierrez-Becker (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks. [@Guti_rrez_Becker_2021]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: Europe PMC `https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:10.1016/j.media.2020.101852&resultType=core&format=json` (HTTP 200)
- **Method**: networks on unordered anatomical point clouds with invariance to similarity transformations, for disease classification and age regression.
- **Key results**: the networks avoid the need to identify point correspondences between shapes. Task-specific representations outperformed alternative shape descriptors, and multi-structure analysis was more efficient and more accurate.
- **Relevance**: subject-level prediction from anatomy without correspondence (P1, P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Yang (2020). An "augmentation-free" rotation invariant classification scheme on point-cloud and its application to neuroimaging. [@Yang_2020]
- **Type**: Conference paper (ISBI)
- **Read from**: `https://arxiv.org/html/1911.03443`
- **Method**: a rotation-invariant convolution on point clouds, with topology induced from the hypersphere.
- **Key results**: the abstract motivates the work by errors from rigid registration. The method classified subjects with and without dementia on OASIS.
- **Relevance**: removes rigid registration by invariance (P3).
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Luo (2022). Prediction of cerebral aneurysm rupture using a point cloud neural network. [@Luo_2022]
- **Type**: Journal article (Journal of NeuroInterventional Surgery)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: a point cloud network on aneurysm models from MRA and CTA, compared with radiomics models (ridge, SVM, NN), with a prospective external cohort from five centres.
- **Key results**: internal test AUC 0.913 for the network with parent artery against 0.803 for ridge regression on radiomics. External AUC 0.835 against 0.692 to 0.701 for the radiomics models.
- **Relevance**: a point cloud model compared head to head with radiomics on a subject-level outcome (P1, P3). It builds on segmentation.
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7), Discussion

### Xie (2025). CoroPCRNet: integrative prediction of hemodynamically significant coronary stenosis by fusing point cloud network and radiomics feature. [@Xie_2025]
- **Type**: Journal article (Journal of Biomechanics)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: point clouds from manually segmented CCTA vessels, fused with radiomics features of the same regions, on a single-centre cohort of 357 branches from 197 patients.
- **Key results**: the fusion model reached AUC 0.822 +/- 0.111 in validation and 0.761 +/- 0.092 on test. The point-cloud-only and radiomics-only models were lower.
- **Relevance**: a point-cloud encoder that builds on segmentation and radiomics (P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7, T8)

### Liu (2026). Three-dimensional point-cloud learning for patient-specific deep brain stimulation motor response prediction in Parkinson disease. [@Liu_2026]
- **Type**: Journal article (BME Frontiers)
- **Read from**: abstract written by `the lookup script fetch` (doi.org HTTP 403)
- **Method**: patient-specific point clouds from MRI, CT, electrode reconstruction and finite element electric fields, with PointNet++, in 79 patients.
- **Key results**: 37 of 116 eligible patients were excluded for incomplete or unusable data, registration among the listed reasons. On the fixed test set, 15 of 24 predictions fell within the stated tolerance.
- **Relevance**: a point-cloud outcome model that builds on registration (P1, P3).
- **Quality**: Medium; small cohort
- **Stance**: neutral
- **Potential use**: Literature Review (T7)

### Gupta (2021). Improved brain age estimation with slice-based set networks. [@Gupta_2021]
- **Type**: Conference paper (ISBI)
- **Read from**: `https://arxiv.org/pdf/2102.04438`
- **Method**: 2D CNN slice encodings combined by permutation-invariant set layers.
- **Key results**: on UK Biobank, the set model trained faster and predicted brain age better than other state-of-the-art approaches.
- **Relevance**: set pooling for a subject-level target (P1).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Karimzadeh (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study. [@Karimzadeh_2026]
- **Type**: Journal article (Physics in Medicine and Biology)
- **Read from**: `https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf`
- **Method**: each patient is an unordered set of lesion-level PyRadiomics vectors, with optional node coordinates after rigid registration to a reference space. Pooled baselines are compared with Transformer, Deep Sets, MIL, Set Transformer and a graph model.
- **Key results**: on centre 1 (151 patients) the best deep aggregation models reached ROC-AUC up to 0.91 +/- 0.05. External transfer to centre 2 (80 patients) lost performance, and test-time adaptation restored part of it (Transformer 0.81 to 0.87).
- **Relevance**: a lesion-set model that builds on segmentation, radiomics and rigid registration (P1, P2, P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7), Discussion

### Xie (2025). Predicting isocitrate dehydrogenase status in glioma using hierarchical attention-based deep 3D multiple instance learning. [@Xie_2025a]
- **Type**: Journal article (Frontiers in Oncology)
- **Read from**: `https://public-pages-files-2025.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1665690/pdf`
- **Method**: HAB-MIL with positional encoding on 3D lesion representations, in 345 local and 495 TCIA patients.
- **Key results**: AUC 0.917 on TCIA and 0.892 on the local cohort, without pixel-level annotations.
- **Relevance**: MIL removes the lesion-segmentation annotation step (P3).
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Winzell (2025). Longitudinal outcome prediction of prostate cancer patients on active surveillance using multiple instance learning. [@Winzell_2025]
- **Type**: Journal article (Journal of Medical Imaging)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: attention-based MIL on UNI-2 features of whole slide images with patient-level labels, evaluated with Cox models and an external set.
- **Key results**: average AUC 0.958 and C-index 0.824 internally, with a large drop on the external dataset.
- **Relevance**: patient-level MIL outcome prediction, with the external drop as a caution (P1).
- **Quality**: Medium
- **Stance**: neutral
- **Potential use**: Discussion

### Islam (2026). NeuroAPS-Net: neuro-anatomically aware point cloud representation for efficient Alzheimer's disease classification. [@Islam_2026]
- **Type**: Conference paper (IJCNN)
- **Read from**: `https://arxiv.org/html/2604.22883`
- **Method**: T1 MRI converted to anatomically informed 2D point clouds, then a point-cloud model with region-aware encoding.
- **Key results**: competitive AD classification accuracy with lower inference latency and memory than other point-cloud methods.
- **Relevance**: P1.
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Ktena (2017). Distance metric learning using graph convolutional networks: application to functional brain networks. [@Ktena_2017]
- **Type**: Conference paper (MICCAI, Lecture Notes in Computer Science)
- **Read from**: `https://arxiv.org/html/1703.02161`
- **Method**: a siamese spectral graph convolutional network that learns a graph similarity metric.
- **Key results**: on ABIDE, the learned metric improved a k-nn classifier by 11.9% over a traditional distance metric.
- **Relevance**: subject-level prediction from brain graphs (P1). The graphs share a parcellation, so the nodes are in correspondence.
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T7)

### Kwon (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease. [@Kwon_2025]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: abstract written by `the lookup script fetch` (sciencedirect HTTP 403)
- **Method**: prototype-based graph neural networks on sulcal pit graphs, replacing spectral graph matching to a reference set.
- **Key results**: better classification of 345 patients with congenital heart disease against 174 controls than other state-of-the-art models.
- **Relevance**: learned prototypes replace graph matching to a reference (P2).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T5, T7)

### Chen (2021). AMINN: autoencoder-based multiple instance neural network improves outcome prediction in multifocal liver metastases. [@Chen_2021]
- **Type**: Conference paper (MICCAI, Lecture Notes in Computer Science)
- **Read from**: `https://arxiv.org/html/2012.06875`
- **Method**: an autoencoder trained jointly with a MIL network over radiomic features of all lesions of a patient.
- **Key results**: including imaging features of all lesions improved survival prediction for multifocal colorectal liver metastases.
- **Relevance**: lesion-set outcome prediction that builds on radiomics (P1, P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Zhang (2025). Lymphoma prognosis with lesion-anatomy context fusion and attention-based multi-lesion aggregation. [@Zhang_2025]
- **Type**: Conference paper (MICCAI, Lecture Notes in Computer Science)
- **Read from**: `https://link.springer.com/chapter/10.1007/978-3-032-04927-8_31` (saved from `https://doi.org/10.1007/978-3-032-04927-8_31`, HTTP 200), abstract section
- **Method**: LAMP fuses lesion and surrounding-organ context and aggregates lesions by attention scores.
- **Key results**: in 229 patients, 5-fold C-index 0.791 for progression-free survival and 0.828 for overall survival.
- **Relevance**: the abstract names heterogeneity in the number and location of lesions as the problem (P1, P2).
- **Quality**: Medium
- **Stance**: supports
- **Potential use**: Literature Review (T7)

### Theme T8: registration, radiomics and lesion segmentation pipelines

### Avants (2008). Symmetric diffeomorphic image registration with cross-correlation. [@AVANTS_2008]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: Europe PMC `...search?query=DOI:10.1016/j.media.2007.06.004...` (HTTP 200)
- **Method**: SyN, symmetric normalisation maximising cross-correlation in the space of diffeomorphisms.
- **Key results**: SyN compared favourably with elastic and Demons methods, especially for large template-to-target distances. Its volumes correlated most with expert labels.
- **Relevance**: the reference registration to a common space (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction, Literature Review (T8)

### Balakrishnan (2019). VoxelMorph: a learning framework for deformable medical image registration. [@Balakrishnan_2019]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: `https://arxiv.org/html/1809.05231`
- **Method**: a CNN maps an image pair to a deformation field, trained unsupervised or with auxiliary segmentations.
- **Key results**: accuracy comparable to state-of-the-art methods at orders of magnitude faster run time.
- **Relevance**: learned registration, the step registration-free methods remove (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T8)

### Sotiras (2013). Deformable medical image registration: a survey. [@Sotiras_2013]
- **Type**: Journal article, survey (IEEE Transactions on Medical Imaging)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: survey of deformable registration components.
- **Key results**: the survey names multi-modality fusion, longitudinal studies and population atlases as the main applications.
- **Relevance**: background on registration (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction

### Chen (2025). A survey on deep learning in medical image registration. [@Chen_2025]
- **Type**: Journal article, survey (Medical Image Analysis)
- **Read from**: Europe PMC `...search?query=DOI:10.1016/j.media.2024.103385...` (HTTP 200)
- **Method**: survey of networks, losses, uncertainty and evaluation metrics in learned registration.
- **Key results**: the survey lists atlas construction, multi-atlas segmentation, motion estimation and 2D-3D registration as applications.
- **Relevance**: background (P3).
- **Quality**: Medium
- **Stance**: neutral
- **Potential use**: Introduction

### Kovacs (2023). Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer. [@Kovacs_2023]
- **Type**: Journal article (Scientific Reports)
- **Read from**: `https://www.nature.com/articles/s41598-023-46747-z.pdf`
- **Method**: compares registration strategies and a "misalignment augmentation" for CAD on mpMRI.
- **Key results**: the paper states there is no consensus on whether CAD systems profit from registration. Misalignment augmentation compensated for a lack of registration and, with registration, improved performance on an independent test set.
- **Relevance**: the direct evidence on removing registration before prediction (P3).
- **Quality**: High
- **Stance**: supports
- **Potential use**: Introduction, Discussion

### Lambin (2012). Radiomics: extracting more information from medical images using advanced feature analysis. [@Lambin_2012]
- **Type**: Journal article (European Journal of Cancer)
- **Read from**: abstract written by `the lookup script fetch` (ejcancer.com PDF HTTP 403)
- **Method**: concept paper.
- **Key results**: defines radiomics as high-throughput extraction of image features and states that it needs multi-centre validation.
- **Relevance**: the radiomics step (P3).
- **Quality**: Medium; concept paper
- **Stance**: neutral
- **Potential use**: Introduction

### Gillies (2016). Radiomics: images are more than pictures, they are data. [@Gillies_2016]
- **Type**: Journal article, special report (Radiology)
- **Read from**: abstract written by `the lookup script fetch` (PMC page "not a PDF")
- **Method**: report.
- **Key results**: describes the process of radiomics, its challenges and its potential for clinical decision making in cancer.
- **Relevance**: P3 background.
- **Quality**: Medium; abstract only
- **Stance**: neutral
- **Potential use**: Introduction

### Aerts (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach. [@Aerts_2014]
- **Type**: Journal article (Nature Communications)
- **Read from**: `https://www.nature.com/articles/ncomms5006.pdf`
- **Method**: 440 radiomic features from CT of 1,019 patients with lung or head-and-neck cancer.
- **Key results**: many radiomic features had prognostic power in independent datasets, and a prognostic signature was associated with gene-expression patterns.
- **Relevance**: the single-lesion radiomics pipeline (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction

### Zwanenburg (2020). The image biomarker standardization initiative. [@Zwanenburg_2020]
- **Type**: Journal article (Radiology)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: three-phase consensus by 25 teams on 174 radiomic features.
- **Key results**: weak consensus fell from 76.8% of features at phase I to 0.4% at the final iteration.
- **Relevance**: the standard that lesion-level radiomics studies follow, for example Karimzadeh_2026 (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Methodology

### Traverso (2018). Repeatability and reproducibility of radiomic features: a systematic review. [@Traverso_2018]
- **Type**: Journal article, systematic review (International Journal of Radiation Oncology Biology Physics)
- **Read from**: abstract written by `the lookup script fetch`
- **Method**: PRISMA-compliant synthesis of 41 studies.
- **Key results**: only 7 studies addressed every methodological aspect in detail. Features were sensitive to acquisition, reconstruction and preprocessing.
- **Relevance**: the fragility of the radiomics step (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction, Discussion

### Isensee (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation. [@Isensee_2020]
- **Type**: Journal article (Nature Methods)
- **Read from**: `https://arxiv.org/pdf/1904.08128`
- **Method**: a framework that configures a U-Net pipeline automatically for each dataset.
- **Key results**: without manual tuning, nnU-Net surpassed most specialised pipelines in 19 public competitions and set a new state of the art in most of 49 tasks.
- **Relevance**: the segmentation step lesion-set methods build on (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T8)

### Kamnitsas (2017). Efficient multi-scale 3D CNN with fully connected CRF for accurate brain lesion segmentation. [@Kamnitsas_2017]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/html/1603.05959`
- **Method**: dual-pathway 3D CNN with a fully connected CRF.
- **Key results**: improved the state of the art on lesion segmentation for traumatic brain injury, brain tumours and ischemic stroke.
- **Relevance**: lesion segmentation (P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T8)

### Chang (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors. [@Chang_2021]
- **Type**: Journal article (Scientific Reports)
- **Read from**: `https://www.nature.com/articles/s41598-021-89114-6.pdf`
- **Method**: six aggregation methods over 3,596 brain metastases in 831 patients, under three survival models.
- **Key results**: the volume-weighted average of the largest three metastases gave the highest concordance index (0.627 to 0.652 across models).
- **Relevance**: handcrafted set pooling of lesion radiomics (P1, P2, P3).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Literature Review (T7, T8)

### Geady (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review. [@Geady_2025]
- **Type**: Journal article, quantitative review (BMC Cancer)
- **Read from**: abstract written by `the lookup script fetch` (doi.org page "not a PDF")
- **Method**: ten methods for combining radiomic features replicated on three datasets with 16,894 lesions in 3,930 patients.
- **Key results**: results varied by dataset and lesion burden, and no single method consistently outperformed the others.
- **Relevance**: the open question of how to aggregate a lesion set (P2).
- **Quality**: High
- **Stance**: neutral
- **Potential use**: Introduction, Discussion

## 5. Literature matrix

Themes: T1 tensor regression and multilinear PLS; T2 decompositions with an unaligned mode; T3 entropic OT; T4 GW and FGW; T5 barycenters, dictionaries and learned templates or references; T6 transport-based and registration-free medical imaging; T7 permutation-invariant set and point-cloud encoders; T8 registration, radiomics and lesion segmentation. Parts: P1 methods that predict subject-level outcomes; P2 correspondence handling; P3 relation to pipeline steps.

| Source | T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8 | P1 | P2 | P3 | Method | Quality |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Zhou_2013 | main | | | | | | | | x | x | | Computational | High |
| Qibin_Zhao_2013 | main | | | | | | | | x | | | Computational | High |
| Lock_2018 | main | | | | | | | | x | | | Computational | High |
| Zhang_2017 | main | | | | | | | | x | | | Computational | High |
| Camarrone_2019 | main | | | | | | | | x | | | Computational | High |
| Bro_1996 | main | | | | | | | | x | | | Computational | High |
| arxiv_1509_06490 | main | | | | | | | | x | | | Computational | High |
| Auddy_2025 | main | x | | | | | | | | | | Review | High |
| Zhou_2024 | main | | | | | | | | x | | | Computational | High |
| Sun_2024 | main | | | | | | | | x | | | Computational | High |
| Kiers_1999 | | main | | | | | | | | x | | Computational | High |
| Kolda_2009 | x | main | | | | | | | | | | Review | High |
| Afshar_2018 | | main | | | | | | | | x | | Computational | High |
| Roald_2022 | | main | | | | | | | | x | | Computational | High |
| arxiv_2208_00993 | x | main | | | | | | | x | x | | Computational | Medium |
| Konyar_2025 | | main | | | | | | | x | x | | Computational | High |
| arxiv_2609_23705 | | main | | | | | | | x | x | | Computational | Medium |
| M_rup_2025 | | main | | | | x | | | | x | | Review | Medium |
| arxiv_1306_0895 | | | main | | | | | | | x | | Computational | High |
| Peyr__2019 | | | main | x | x | | | | | x | | Review | High |
| arxiv_1810_08278 | | | main | | | | | | | x | | Computational | High |
| arxiv_2111_00648 | | | main | | | | | x | | x | x | Computational | High |
| M_moli_2011 | | | | main | | | | | | x | | Computational | High |
| Peyre_2016 | | | x | main | x | | | | x | x | | Computational | High |
| arxiv_1805_09114 | | | | main | x | | | | x | x | | Computational | High |
| Vayer_2020 | | | | main | | | | | | x | | Computational | High |
| Xu_2023 | | | | main | x | | | | x | x | | Computational | High |
| Thual_2022 | | | | main | x | x | | | | x | x | Computational | High |
| arxiv_1906_01277 | | | | main | | | | | x | x | | Computational | High |
| Takeda_2025 | | | | main | | | | | | x | | Tool | Medium |
| arxiv_1310_4375 | | | x | | main | | | | | x | | Computational | High |
| arxiv_2102_06555 | | | | x | main | | | | | x | | Computational | High |
| arxiv_2205_15733 | | | | x | main | | | | x | x | | Computational | High |
| arxiv_2006_12065 | | | x | | main | | x | | x | x | | Computational | High |
| arxiv_2202_03813 | | | | x | main | | | | x | x | | Computational | High |
| arxiv_2006_09430 | | | | | main | | | | x | x | | Computational | High |
| Wang_2012 | | | | | main | x | | | x | x | | Computational | High |
| Schmitz_2018 | | | x | | main | | | | | x | | Computational | High |
| Xu_2020 | | | | x | main | | | | | x | | Computational | High |
| D_az_Mart_n_2026 | | | | x | main | | | | | x | | Computational | High |
| Shifat_E_Rabbi_2025 | | | | | main | | x | | x | x | | Computational | High |
| arxiv_2401_01460 | | | | | main | | x | | x | x | | Computational | Medium |
| Wang_2024 | | | | | main | | x | | x | x | | Computational | High |
| arxiv_2510_22033 | | | | | main | x | | | x | x | | Computational | Medium |
| arxiv_2609_05919 | | | | | main | | | | | x | | Computational | Medium |
| Moosm_ller_2022 | | | | | main | | | | | x | | Computational | High |
| Gong_2026 | | | x | | | main | | x | x | x | x | Computational | Medium |
| Kundu_2018 | | | | | x | main | | x | x | x | x | Computational | High |
| Gerber_2023 | | | | | x | main | | x | x | x | x | Computational | High |
| Gramfort_2015 | | | | | x | main | | | | x | | Computational | High |
| Belkhatir_2022 | | | | | | main | | x | x | | x | Computational | High |
| arxiv_2602_07260 | | | | | x | main | | x | | x | x | Tool | Medium |
| arxiv_2605_20883 | | | | x | x | main | | | | x | x | Computational | Medium |
| Kim_2025 | | | | | | x | | main | | | x | Computational | High |
| arxiv_1703_06114 | | | | | | | main | | x | x | | Computational | High |
| Charles_2017 | | | | | | | main | | x | x | | Computational | High |
| arxiv_1810_00825 | | | | | | | main | | x | x | | Computational | High |
| arxiv_1802_04712 | | | | | | | main | | x | x | | Computational | High |
| Kalra_2020 | | | | | | | main | | x | x | | Computational | Medium |
| Guti_rrez_Becker_2021 | | | | | | | main | | x | x | x | Computational | High |
| Yang_2020 | | | | | | | main | | x | x | x | Computational | Medium |
| Luo_2022 | | | | | | | main | x | x | | x | Computational | High |
| Xie_2025 | | | | | | | main | x | x | | x | Computational | High |
| Liu_2026 | | | | | | | main | x | x | | x | Computational | Medium |
| Gupta_2021 | | | | | | | main | | x | x | | Computational | High |
| Karimzadeh_2026 | | | | | | | main | x | x | x | x | Computational | High |
| Xie_2025a | | | | | | | main | | x | | x | Computational | Medium |
| Winzell_2025 | | | | | | | main | | x | | | Computational | Medium |
| Islam_2026 | | | | | | | main | | x | | | Computational | Medium |
| Ktena_2017 | | | | | | | main | | x | | | Computational | High |
| Kwon_2025 | | | | | x | | main | | x | x | | Computational | High |
| Chen_2021 | | | | | | | main | x | x | x | x | Computational | High |
| Zhang_2025 | | | | | | | main | x | x | x | | Computational | Medium |
| AVANTS_2008 | | | | | | | | main | | x | x | Computational | High |
| Balakrishnan_2019 | | | | | | | | main | | x | x | Computational | High |
| Sotiras_2013 | | | | | | | | main | | | x | Review | High |
| Chen_2025 | | | | | | | | main | | | x | Review | Medium |
| Kovacs_2023 | | | | | | x | | main | x | x | x | Computational | High |
| Lambin_2012 | | | | | | | | main | | | x | Review | Medium |
| Gillies_2016 | | | | | | | | main | | | x | Review | Medium |
| Aerts_2014 | | | | | | | | main | x | | x | Computational | High |
| Zwanenburg_2020 | | | | | | | | main | | | x | Computational | High |
| Traverso_2018 | | | | | | | | main | | | x | Review | High |
| Isensee_2020 | | | | | | | | main | | | x | Computational | High |
| Kamnitsas_2017 | | | | | | | | main | | | x | Computational | High |
| Chang_2021 | | | | | | | x | main | x | x | x | Computational | High |
| Geady_2025 | | | | | | | x | main | x | x | x | Review | High |

Theme counts with `main`: T1 10, T2 8, T3 4, T4 8, T5 16, T6 7, T7 20, T8 14. Each part has at least 3 sources: P1 52, P2 61, P3 35.

## 6. Identified gaps

1. **Under-researched area: a supervised multilinear objective with a transport coupling on the unaligned mode.** In the included set, tensor regression and multilinear PLS assume every mode is aligned across subjects [@Zhou_2013; @Qibin_Zhao_2013; @Zhang_2017; @Sun_2024]. The supervised decompositions with an unaligned mode use PARAFAC2 on EHR time, not a spatial mode [@arxiv_2208_00993; @Konyar_2025; @arxiv_2609_23705]. No included source couples a PLS-type objective with a GW, FGW or entropic transport coupling for the spatial mode. Actionable: define a tensor PLS whose spatial mode is matched to a learned template by a transport plan, and compare it with registered tensor PLS.
2. **Methodological gap: lesion-set models ignore the geometry between lesions, or recover it by registration.** Lesion-set studies pool radiomic vectors with Deep Sets, MIL or attention [@Karimzadeh_2026; @Chen_2021; @Zhang_2025; @Chang_2021]. Spatial cues come from rigid registration of node coordinates [@Karimzadeh_2026] or from organ context [@Zhang_2025]. FGW templates that use features and pairwise structure together [@arxiv_1805_09114; @arxiv_2205_15733] were not applied to lesion sets in any included study. Actionable: an FGW template layer over lesion graphs, built from lesion features and inter-lesion distances.
3. **Population and validation gap: registration-free transport fusion is tested on single-centre cohorts.** CMOT-Fusion was developed on 300 men from one institution with a temporal test set of 50, where its AUC did not exceed PI-RADS [@Gong_2026]. Set and MIL models lose performance under external transfer [@Karimzadeh_2026; @Winzell_2025]. Actionable: multi-centre external validation of transport-based models against registered pipelines.
4. **Methodological gap: transport embeddings in 3D imaging keep a registration and a template.** TBM computes transport to a common template [@Kundu_2018], the OT feature step maps each image to a template [@Gerber_2023], and the 3D-TBM pipeline includes registration and segmentation [@arxiv_2602_07260]. Template-free learning appears only in brain mapping, not in outcome prediction [@Thual_2022; @arxiv_2605_20883]. Actionable: learned templates trained end to end against a clinical outcome on unregistered 3D data.
5. **Methodological gap: no shared benchmark across the three families.** No single radiomics aggregation method was best across datasets [@Geady_2025], and there is no consensus on whether CAD profits from registration [@Kovacs_2023]. No included study compares tensor, transport and set-encoder methods on the same subject-level task. Actionable: a benchmark with fixed cohorts and splits. Under the `cs_ml` profile this is also a reproducibility concern, since each method family reports results on its own datasets.

## 7. Synthesis

### Topic, rationale and scope

Many clinical predictions start from data whose spatial mode differs between subjects. Examples are a set of lymph nodes or metastases, a vessel or aneurysm surface, or a cortical surface. The standard pipeline aligns subjects by registration, segments lesions and extracts radiomic features before a model sees the data [@AVANTS_2008; @Lambin_2012; @Isensee_2020]. Each of these steps adds variability, and radiomic features are sensitive to acquisition and preprocessing [@Traverso_2018]. This review covers supervised and representation-learning methods that predict a subject-level outcome when the spatial mode is not aligned. It also covers the transport, tensor and set-encoder tools they draw on. Methods from any application domain are included, with medical imaging as the setting. Works from 1996 to 2026 are included, in English. Unsupervised registration methods appear only as the step that other methods remove or build on.

### Review methodology

PubMed and MEDLINE were searched through E-utilities, and Crossref, OpenAlex, Semantic Scholar and arXiv through `the lookup script search`. IEEE Xplore, ACM DL and Scopus were attempted by site-limited web search and were not reached. Two passes of the four search layers (Boolean search, citation chaining, forward tracking and semantic search) gave 87 sources, screened under the `cs_ml` profile. Section 1 gives the full record.

The synthesis follows the three parts of the question:

- P1 groups the predictive methods into tensor models, transport embeddings and set encoders.
- P2 sorts them by how they handle correspondence.
- P3 places each against registration, radiomics and segmentation.

### P1: methods that predict a subject-level outcome

**Tensor models.** Scalar-on-tensor regression predicts an outcome from an image array with a low-rank coefficient [@Zhou_2013; @arxiv_1509_06490], and recent work adds nonparametric and quantile forms [@Zhou_2024; @Sun_2024]. Multilinear PLS builds latent variables across modes [@Bro_1996; @Qibin_Zhao_2013; @Zhang_2017], with faster variants for large tensors [@Camarrone_2019]. All of these index the same voxel or channel across subjects. The tensor work that does allow an unaligned mode is PARAFAC2, and its supervised forms predict mortality or survival from irregular EHR tensors [@arxiv_2208_00993; @Konyar_2025; @arxiv_2609_23705]. The sources agree that tensor structure improves estimation over vectorisation. None of them applies an unaligned spatial mode to imaging outcomes.

**Transport embeddings.** A second family maps each subject's distribution to a fixed-length vector through optimal transport. LOT embeds images by their transport to a reference [@Wang_2012], with conditions for linear separability [@Moosm_ller_2022]. LOT has been used to classify point sets [@Shifat_E_Rabbi_2025] and patient cell point clouds [@arxiv_2510_22033]. WEGL and the trainable OT embedding apply the same idea to graphs and feature sets, with a reference that can be learned [@arxiv_2006_09430; @arxiv_2006_12065]. TFGW embeds a graph by its FGW distances to learned templates and feeds them to a classifier [@arxiv_2205_15733]. In medical imaging, TBM and OT features predict or explain clinical variables from brain MRI [@Kundu_2018; @Gerber_2023]. CMOT-Fusion predicts prostate cancer risk from unregistered mpMRI [@Gong_2026].

**Set and point-cloud encoders.** Permutation-invariant networks act on sets directly [@arxiv_1703_06114; @Charles_2017; @arxiv_1810_00825; @arxiv_1802_04712]. In medicine they predict disease from anatomical point clouds [@Guti_rrez_Becker_2021; @Yang_2020; @Islam_2026], aneurysm rupture [@Luo_2022], coronary stenosis [@Xie_2025] and DBS response [@Liu_2026]. Lesion sets are handled the same way: lymphoma subtype from sets of nodes [@Karimzadeh_2026], survival from multifocal liver metastases [@Chen_2021], and lymphoma prognosis from multiple lesions [@Zhang_2025]. Brain age from slice sets [@Gupta_2021] and IDH status from MIL [@Xie_2025a] follow the same pattern. Reported gains are often against radiomics baselines: the point cloud network had external AUC 0.835 against 0.692 to 0.701 for radiomics models [@Luo_2022]. The sources disagree on how well these gains transfer. Two studies report a drop on external data [@Karimzadeh_2026; @Winzell_2025].

The literature on P1 offers three routes to subject-level prediction. Tensor models have the most statistical theory but assume alignment. Transport embeddings and set encoders work without alignment, and only the set encoders have been tested on clinical outcomes in multi-centre cohorts.

### P2: how each method handles the missing correspondence

**Registration to a common space.** Tensor regression and PLS rely on prior registration [@Zhou_2013; @Qibin_Zhao_2013], typically by diffeomorphic or learned methods [@AVANTS_2008; @Balakrishnan_2019]. Some set models also use registration in part, for example node coordinates after rigid registration to a reference [@Karimzadeh_2026].

**A shared mode with free loadings.** PARAFAC2 allows one mode to differ in size and in identity across slices while keeping the others shared [@Kiers_1999; @Roald_2022]. It never matches elements across slices. It constrains their cross-products instead, which is enough for uniqueness under mild assumptions [@Kiers_1999]. Coupled decompositions relax correspondence across subjects further in functional neuroimaging [@M_rup_2025].

**A transport coupling.** Optimal transport finds a soft matching between two distributions. Entropic regularisation makes it fast and differentiable [@arxiv_1306_0895; @Peyr__2019; @arxiv_1810_08278]. When the two objects share no coordinate space, Gromov-Wasserstein compares their internal distances instead [@M_moli_2011; @Peyre_2016]. Fused GW uses features and structure together [@arxiv_1805_09114; @Vayer_2020]. GW-based alignment recovers correspondences without labels [@Takeda_2025]. FUGW aligns individual brains without landmarks, and its unbalanced term lets functional areas differ in size [@Thual_2022]. CMOT-Fusion computes an entropic plan between regions of two misaligned sequences inside the network [@Gong_2026].

**A learned template or barycenter.** Barycenters give a template that no subject defines alone [@arxiv_1310_4375; @Gramfort_2015]. GW barycenters do so for matrices of different sizes [@Peyre_2016]. Dictionary and factorisation models learn several templates and represent each subject by its weights [@Schmitz_2018; @arxiv_2102_06555; @Xu_2020; @Xu_2023; @arxiv_2609_05919]. These weights are permutation invariant [@Xu_2023]. Coordinates relative to known GW templates can also be estimated directly [@D_az_Mart_n_2026]. Supervised versions learn the templates against the label [@arxiv_2205_15733; @arxiv_2202_03813]. Learned references without transport (MMD to references, or prototypes in a GNN) fill the same role [@Wang_2024; @Kwon_2025].

**Permutation invariance.** Set encoders give up correspondence altogether. Any permutation-invariant function has the sum-decomposition form of Deep Sets [@arxiv_1703_06114]. Attention adds weights per element [@arxiv_1802_04712] and interactions between elements [@arxiv_1810_00825; @Kalra_2020]. Transport pooling with a trainable reference links this route to the template route [@arxiv_2006_12065; @arxiv_2401_01460]. Handcrafted pooling of lesion radiomics, such as a volume-weighted average of the three largest metastases, is the simplest form [@Chang_2021]. No single aggregation was best across datasets [@Geady_2025].

The sources agree that a reference or template turns pairwise matching into one map per subject, which makes large cohorts tractable [@Wang_2012; @arxiv_2006_09430]. They disagree on what the reference should be: a fixed image [@Kundu_2018], a barycenter [@arxiv_1310_4375], or templates learned against the outcome [@arxiv_2205_15733].

### P3: where each method removes or builds on registration, radiomics and segmentation

**Removed registration.** CMOT-Fusion removes the separate registration step between mpMRI sequences [@Gong_2026]. Misalignment augmentation can compensate for a complete lack of registration in prostate CAD [@Kovacs_2023]. Point-cloud networks with similarity or rotation invariance avoid point correspondences and rigid registration [@Guti_rrez_Becker_2021; @Yang_2020]. FUGW replaces anatomical co-registration for functional alignment [@Thual_2022], and FGW dictionaries avoid projecting subjects onto a common template [@arxiv_2605_20883].

**Kept registration, with transport after it.** TBM and OT features still compute maps to a template [@Kundu_2018; @Gerber_2023]. The 3D-TBM tool lists registration, segmentation, cropping and centering in its preprocessing [@arxiv_2602_07260]. Gerber_2023 states that the OT step reduces sensitivity to remaining misalignment rather than removing alignment. Transport is also used to improve registration: robust OT pre-aligns point clouds [@arxiv_2111_00648], and neural OT bridges intensity domains before deformable registration [@Kim_2025].

**Radiomics and segmentation.** Most lesion-set models build on both. They segment lesions and extract IBSI-consistent radiomic features, then pool the vectors [@Karimzadeh_2026; @Chen_2021; @Chang_2021; @Zwanenburg_2020]. Point-cloud models are built from segmentations, manual in CoroPCRNet [@Xie_2025] and also in aneurysm models [@Luo_2022]. Point-cloud features can replace radiomics, as in the head-to-head comparison of Luo_2022, or be fused with them [@Xie_2025]. Transport can also enter the radiomics step itself, comparing texture matrices by the Wasserstein metric [@Belkhatir_2022]. MIL on whole lesions removes the need for pixel-level annotation [@Xie_2025a]. DBS response modelling depends on registration and reconstruction, and patients were excluded when these failed [@Liu_2026].

In summary, registration is removed in a few recent medical studies, while segmentation is removed almost nowhere among lesion-set models. Radiomics is kept by the lesion-set models and replaced by learned point-cloud features in shape-based studies.

### Cross-cutting synthesis

**Convergent findings.** Methods that work without alignment use one of two devices: invariance (set encoders, PARAFAC2) or a reference (LOT, templates, barycenters). Both give a fixed-length subject representation that a standard predictor can use [@arxiv_1703_06114; @Wang_2012; @arxiv_2205_15733]. Studies that compare against radiomics report gains for learned representations [@Luo_2022; @Xie_2025].

**Divergent findings and debates.** Whether registration helps prediction is unsettled [@Kovacs_2023]. The best way to pool lesions depends on the dataset [@Geady_2025; @Chang_2021]. Gains on internal data do not always hold externally [@Karimzadeh_2026; @Winzell_2025]. In the one registration-free transport study, the test AUC was close to the radiologist score [@Gong_2026].

**Dominant and underused methods.** Attention-based pooling over lesion radiomics dominates the medical set literature [@arxiv_1802_04712; @Karimzadeh_2026; @Zhang_2025]. FGW templates, GW barycenters and transport-coupled tensor models are well developed in machine learning [@arxiv_1805_09114; @Peyre_2016; @Xu_2023], yet rare in clinical outcome prediction.

### Research agenda

1. A supervised tensor PLS with a transport-coupled spatial mode, compared against registered tensor PLS and PARAFAC2 baselines (gap 1).
2. FGW template layers over lesion graphs that use features and inter-lesion distances, compared with attention MIL on the same lesion sets (gap 2).
3. Multi-centre external validation of registration-free models, with the registered pipeline as the comparator (gaps 3 and 4).
4. A shared benchmark of fixed cohorts and splits across tensor, transport and set-encoder methods (gap 5).

### Key takeaways

- Three routes predict outcomes from unaligned data: tensor models with an unaligned mode, transport embeddings with references or learned templates, and permutation-invariant set encoders.
- Correspondence is handled by registration, by shared factors with free loadings, by transport couplings, by templates, or by invariance. Transport-based templates link the last three.
- Registration is removed in a few recent clinical studies. Segmentation and radiomics are kept by most lesion-set models.

### Implications for practice

The included studies come from single or few centres and report drops under external transfer [@Karimzadeh_2026; @Winzell_2025]. Clinical adoption of registration-free models therefore depends on multi-centre external validation [@Gong_2026]. Standardised radiomics stays the baseline that such models must beat [@Zwanenburg_2020].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Lambin_2012, Aerts_2014, Traverso_2018, AVANTS_2008, Sotiras_2013, Kovacs_2023, Gong_2026, Geady_2025, Kolda_2009, Peyr__2019, M_moli_2011 |
| Literature Review | Zhou_2013, Qibin_Zhao_2013, Zhang_2017, Kiers_1999, arxiv_2208_00993, arxiv_1306_0895, arxiv_1805_09114, Peyre_2016, arxiv_2205_15733, arxiv_2102_06555, Wang_2012, Kundu_2018, Gerber_2023, Thual_2022, arxiv_1703_06114, arxiv_1802_04712, Guti_rrez_Becker_2021, Luo_2022, Karimzadeh_2026, Chen_2021 |
| Methodology | Bro_1996, Zhang_2017, arxiv_1306_0895, arxiv_1810_08278, Vayer_2020, arxiv_1310_4375, arxiv_2006_12065, D_az_Mart_n_2026, Moosm_ller_2022, Zwanenburg_2020 |
| Discussion | Kovacs_2023, Geady_2025, Chang_2021, Winzell_2025, Karimzadeh_2026, Gong_2026, arxiv_2605_20883, arxiv_2510_22033, arxiv_2609_23705, Takeda_2025 |

## 9. No entry written

None. Every included source has an entry in `refs.bib`, and each entry printed `CONFIRMED` under `the lookup script resolve --entry`.

## 10. Search limitations and gate failures

- Gates: search documented, source count (87 of 30), annotations (87 of 87), matrix coverage (every theme and part at 3 or more), research gaps (5), peer-reviewed share and currency all pass. Currency: 44 of 87 sources (50.6 percent) are from 2021 to 2026, counted from the `year` fields of `refs.bib`. Peer-reviewed share: 77 of 87 entries are journal or proceedings entries. The 10 `@misc` arXiv entries count toward the share under `cs_ml`.
- Condition 4 (the citation loop closes) did not hold when the search ended.
- IEEE Xplore, ACM DL and Scopus were not reached, so their records entered only where other indexes held them.
- The Semantic Scholar search API answered HTTP 429 to three layer 4 queries, and Semantic Scholar was left out with "HTTP 429 after 3 retries" in some `the lookup script` calls (search 23, the `fetch` of Roald_2022, Xu_2023, Belkhatir_2022 and Traverso_2018, and the `bibtex` of arxiv_2202_03813 and arxiv_1906_01277). For arxiv_2202_03813 and arxiv_1906_01277 the published version was confirmed from the venue page instead.
- Citation counts were measured only for six works, so the citation item of the quality score is a default of 2 for most sources.
- The final set (87) is above the typical range of 40 to 80 for a literature review.
- Published versions not confirmed: arxiv_2111_00648 (NeurIPS 2021 per Semantic Scholar; `--page` on `https://neurips.cc/virtual/2021/poster/26958` printed "no citation_title tag"), arxiv_2006_09430 (ICLR per Semantic Scholar; `--page` on `https://openreview.net/forum?id=AAes_3W-2z` printed "no citation_title tag"), arxiv_2006_12065 (ICLR per Semantic Scholar; `bibtex` printed no venue note), and arxiv_2208_00993 (ML4H 2023 per Semantic Scholar, no DOI).
- Labelled preprints after `the lookup script resolve` on the title and the arXiv ID found no published version: arxiv_2602_07260, arxiv_2609_23705, arxiv_2401_01460, arxiv_2605_20883, arxiv_2510_22033 and arxiv_2609_05919.

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (tool and version not known). The AI took part in research assistance for the search and the annotated bibliography. A person oversaw the process, and the authors take responsibility for the content.

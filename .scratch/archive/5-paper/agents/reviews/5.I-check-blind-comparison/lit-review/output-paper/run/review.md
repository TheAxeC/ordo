# Literature review: supervised prediction from data whose spatial mode is not aligned across subjects

## 1. Search strategy

This review merges four theme runs and extends them with the merge run's own searches. The research question, as `settings.md` records it, has three parts:

- P1: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions)? Answers: multilinear or tensor partial least squares or tensor regression / tensor decomposition with an unaligned mode / transport distance or transport embedding fed to a predictor / transport barycenter or dictionary with learnable templates / permutation-invariant set encoder / other.
- P2: How does each method handle the missing correspondence? Answers: registration to a common space / a learned template or barycenter / a transport coupling / permutation invariance / other.
- P3: Where does each method remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? Answers: removes registration / builds on registration / removes handcrafted radiomics features / builds on radiomics features / builds on lesion or region segmentation / other.

The paper type is Literature Review, with a minimum of 30 sources over the merged set. The domain evidence profile is `cs_ml`. It admits archival preprints, conference proceedings and technical reports, and it makes non-reproducible results and benchmark cherry-picking critical gaps. The Discipline row names machine learning, with medical image analysis as the application setting, so the CS/Engineering rows (IEEE Xplore, ACM Digital Library, Scopus) and the Medicine rows (PubMed, MEDLINE) apply. DOI checking is strict.

### The four theme runs

| Theme | Theme | Databases reached | Passes | Records screened | Kept |
|---|---|---|---|---|---|
| 1 | Tensor and multilinear methods | PubMed, IEEE Xplore and ACM DL by site web search (Scopus not reached) | 2 passes and 1 currency pass | 370 PubMed records, 29 site pages, 413 layer-2 records, 982 layer-3 records, 400 layer-4 records | 20 |
| 2 | Optimal transport for unaligned data | ACM DL and IEEE Xplore by site web search, OpenAlex, Semantic Scholar (Scopus not reached) | 4 passes and 3 currency passes | 58 site records, 765 layer-2 lines, 1693 layer-3 lines and 90 records, 468 layer-4 records and 100 Semantic Scholar records, 349 currency OpenAlex records, 21 currency site records; 58 candidates at full text | 22 |
| 3 | Permutation-invariant set encoders and point-cloud learning | PubMed, MEDLINE, OpenAlex, Crossref, Semantic Scholar, arXiv (IEEE Xplore, ACM DL and Scopus not reached) | 3 passes | 3,528 records; 30 candidates at full text | 20 (15 plus 5 from gap chaining) |
| 4 | Medical-imaging pipelines | PubMed and MEDLINE (IEEE Xplore, ACM DL and Scopus not reached) | 2 passes | 235 records; 51 candidates, 4 of them not read | 20 |

The four runs kept 82 sources, which are 76 distinct works. The search strings of each theme, its search record and its gap searches are in its own review and search log (`theme-report-1.md` to `theme-report-4.md`, `search-log-theme-1.md` to `search-log-theme-4.md`).

### Search strings of the merge run

Each merge string joins the concept groups of two themes, so that a work on the boundary between two communities is found. The PubMed strings ran with `AND english[la]`. The OpenAlex strings ran as `filter=title_and_abstract.search:<string>` with the year range and `language:en`. The site web searches took each string in a shorter form, listed in the search log.

| String | Themes joined | Text |
|---|---|---|
| P12 | 1 and 2 | ("tensor regression" OR "tensor partial least squares" OR "tensor decomposition" OR "PARAFAC2" OR "multilinear") AND ("optimal transport" OR "Wasserstein" OR "Gromov-Wasserstein") AND ("prediction" OR "classification" OR "regression") |
| P13 | 1 and 3 | ("tensor regression" OR "tensor partial least squares" OR "tensor decomposition" OR "PARAFAC2") AND ("permutation invariant" OR "deep sets" OR "set transformer" OR "point cloud" OR "multiple instance learning") AND ("prediction" OR "classification") |
| P14 | 1 and 4 | ("tensor regression" OR "tensor partial least squares" OR "tensor decomposition" OR "PARAFAC2") AND ("radiomics" OR "lesion" OR "lesions" OR "registration-free" OR "unregistered") AND ("prediction" OR "classification" OR "outcome") |
| P23 | 2 and 3 | ("optimal transport" OR "Wasserstein" OR "Gromov-Wasserstein") AND ("permutation invariant" OR "set encoder" OR "deep sets" OR "set transformer" OR "multiple instance learning" OR "set pooling") AND ("classification" OR "prediction") |
| P24 | 2 and 4 | ("optimal transport" OR "Wasserstein" OR "Gromov-Wasserstein") AND ("lesion" OR "lesions" OR "radiomics" OR "registration-free" OR "unregistered") AND ("MRI" OR "CT" OR "PET") AND ("prediction" OR "classification" OR "prognosis") |
| P34 | 3 and 4 | ("permutation invariant" OR "deep sets" OR "set transformer" OR "multiple instance learning" OR "point cloud") AND ("radiomics" OR "lesions" OR "metastases" OR "multifocal") AND ("patient-level" OR "prognosis" OR "survival" OR "outcome") |

### Search record of the merge run

All searches ran on 2026-11-18. A site web search takes no filter and reports no count, so its row gives the distinct pages of that site it returned.

| # | Database | String or seed | Filters in the query | Date | Count | Records taken into screening |
|---|---|---|---|---|---|---|
| M1 to M6 | PubMed | P12, P13, P14, P23, P24, P34 | 2016-2026, English | 2026-11-18 | 0, 0, 2, 8, 8, 36 | 54 |
| M7 to M11 | PubMed, relaxed (no NOT term to remove; years widened) | P12, P13, P14, P23, P24 | 2006-2026, English | 2026-11-18 | 0, 0, 3, 8, 8 | 1 new (P14) |
| M12 to M17 | OpenAlex | P12, P13, P14, P23, P24, P34 | 2016-2026, English | 2026-11-18 | 2, 12, 2, 16, 18, 91 | 141 |
| M18 | IEEE Xplore, site web search | P12 to P34 | none | 2026-11-18 | no count | 19 pages |
| M19 | ACM DL, site web search | P12 to P34 | none | 2026-11-18 | no count | 19 pages |
| M20 | Scopus, site web search | P12 to P34 | none | 2026-11-18 | no count | 2 pages, both unrelated or already known |
| R1 | Layer 2, references | 38 core papers of the merged set | none | 2026-11-18 | 2,212 listing lines | 2,212 |
| R1 | Layer 3, citing works | 33 foundational works | none | 2026-11-18 | 5,456 listing lines (5,395 records), 1,860 of them from 2024 to 2026 | 5,456 |
| R2 | Layer 2 and layer 3 | references of 5 new core papers; citing works of Dietterich 1997 | none | 2026-11-18 | 210 and 202 listing lines | 412 |
| R3 | Layer 2 | references of Li_2021 (DSMIL) and Zhang_2022 (DTFD-MIL) | none | 2026-11-18 | 143 listing lines | 143 |
| R4 | Layer 2 | references of Carbonneau_2018 | none | 2026-11-18 | 157 listing lines | 157 |
| R5 | Layer 2 | references of Gaertner_2002 | none | 2026-11-18 | 19 listing lines | 19 |
| C1 to C6 | PubMed, currency pass 1 | P12, P13, P14, P23, P24, P34 | 2024-2026, English | 2026-11-18 | 0, 0, 0, 7, 2, 25 | 34, all screened before |
| C7 to C12 | OpenAlex, currency pass 1 | P12, P13, P14, P23, P24, P34 | 2024-2026, English | 2026-11-18 | 2, 2, 0, 13, 11, 67 | 95, all screened before |
| C13 to C30 | IEEE Xplore, ACM DL and Scopus, currency pass 1 | P12 to P34 with the years 2024 to 2026 | none | 2026-11-18 | no count | 11 pages (search log); Scopus returned no page |
| GC | Gap chaining | 12 seeds (section 6) | none | 2026-11-18 | 624 listing lines | 624 |

Rows M1 to M5 gave fewer than 20 records. Each string held no NOT term, so its relaxation widened the years to 2006-2026, and both counts are kept. Row M6 fell between 20 and 500 records and was kept as run.

### Rounds of layers 2 and 3

The rounds ran over the merged set until the citation loop closed (end condition 4), with a cap of 8.

- Round 1 took 38 core papers and 33 foundational works of the merged set, each named in the search log. The reference listings of the core papers named 52 works cited by three or more core papers. Those that address a part of the question went to full text (section 3), and the generic or tangential ones were excluded at title (search log).
- Round 2 took the 5 sources that round 1 added and that predict an outcome as new core papers (Zhu_2022, Huang_2026, Zhu_2026, Wang_2024b, and arXiv 2203.04964, which section 9 lists as taken out on merit). Ten works were cited by three or more core papers and were not collected. Forward tracking of Dietterich_1997 listed 200 citing works in 202 listing lines, 102 of them from 2024 to 2026.
- Round 3 took Li_2021 and Zhang_2022 as core papers, and 7 works were new at three or more core papers.
- Round 4 took Carbonneau_2018, and 2 works were new: Gaertner_2002, which entered, and Amores 2013, which no route read (section 3).
- Round 5 took Gaertner_2002, and no uncollected work was cited by three or more core papers. The citation loop closed there, after 5 of the 8 rounds allowed.

End conditions after round 5:

| Condition | Holds | Evidence |
|---|---|---|
| 1. Source count | yes | 122 sources against the minimum of 30. |
| 2. The latest round added little | yes | Round 2 added 5 sources to 111 (4.5 percent), round 3 added 4 to 116 (3.4 percent), round 4 added 1 to 120 (0.8 percent), round 5 added none. |
| 3. Every matrix theme is saturated | yes | Each of MT1 to MT4 has at least 3 sources (section 5). |
| 4. The citation loop closes | yes | Round 5 found no uncollected work cited by three or more core papers. |
| 5. The temporal span is covered | yes | Foundational works from 1997 to 2009 and 57 sources from 2022 to 2026. |

### Currency pass

The merged share of sources from 2022 to 2026 is below 50 percent (section 10), so currency pass 1 searched 2024 to 2026 with each merge string on each database (rows C1 to C30). Every PubMed and OpenAlex record it returned had been screened before, compared by identifier. The site pages it returned were already screened or were excluded at title and abstract. The pass added no new eligible source, so no further pass ran. The theme strings' own 2024 to 2026 windows were searched by the theme runs' currency passes (themes 1 and 2) and are not run again.

### Gap chaining

Gap chaining ran once, after the rounds, from at most three seeds per merged gap and for the thin part P3:

| Gap or part | Seed keys | Listing lines screened | Keys added |
|---|---|---|---|
| MG1 | Belkhatir_2022, arxiv_2407_00224, Gong_2026 | 193 (34, 111, 48) | none |
| MG2 | Kovacs_2023, Liu_2018, Zhang_2020 | 173 (64, 81, 28) | none |
| MG3 | Huang_2026, Papastergiou_2019, Afshar_2021 | 114 (19, 24, 71) | none |
| P3 (thin part) | Sabouri_2025, Masson_Grehaigne_2024, Zhu_2022 | 144 (54, 53, 37) | Zhao_2022 |

The search log gives the lines of each seed's listing. The one candidate it brought up beyond Zhao_2022, a multiple-instance study of coronary images from 2010, was excluded at node 2 (outside the years, cited fewer than 100 times).

### Criteria

Peer-reviewed journals, books and conference proceedings, and under `cs_ml` archival preprints and technical reports; 2016 to 2026, and seminal works older than that cited more than 100 times; English; directly addressing at least one part. Duplicates sharing a DOI or arXiv ID were merged, and each keeps the fuller of its annotations. Each source was scored on venue, methodological rigor, relevance, citation count and evidence quality. The citation item was read from the OpenAlex percentile of the source's publication year, and a source with no OpenAlex range was ranked by its `cited-by` count among the included sources published within a year of it.

The search log of the merge run is `search-log.md`.

## 2. Distribution advisory

Distribution advisory:
- Dimension: method
- Concentration: computational = 106/122 (86.9 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: no expansion. The research question asks which methods predict an outcome and how each handles the missing correspondence, so the set is a set of method papers by design. The 16 other sources are surveys and reviews (Kolda_2009, Peyr__2019, Quellec_2017, Carbonneau_2018, Geady_2025, Gillies_2016), a standardization study (Zwanenburg_2020), a tool paper (van_Griethuysen_2017) and clinical radiomics studies (Aerts_2014, Eertink_2022, Wilk_2025, Chang_2021, Salim_2026, Masson_Grehaigne_2024, Sabouri_2025, Zhao_2022).

Time: 75 of the 122 sources are from 2020 to 2026 (61.5 percent), below 70 percent. Venue: the most frequent family, the NeurIPS proceedings, holds 10 sources (8.2 percent), and Medical Image Analysis holds 6. Geography is left out, since the benchmark papers state no study site.

## 3. Screening results

- Carried from the theme runs: 82 kept sources, 76 distinct works after 6 duplicates were merged (Kundu_2018 and Gong_2026 in themes 2 and 4; Karimzadeh_2026, Chen_2021, Chen_2022 and Thiery_2025 in themes 3 and 4).
- Theme cuts judged on merit: 93 cuts at the theme runs' upper bounds (26 in theme 1, 30 in theme 2, 10 in theme 3, 27 in theme 4), which are 91 distinct works not already kept by another theme. Gramfort et al. 2015 was cut by themes 2 and 4, and Qahqaie et al. 2026, cut by theme 2, is in the set through theme 4. Of these, 17 entered.
- Initial hits of the merge run: 54 PubMed and 141 OpenAlex records of the pair searches, 40 site pages, 7,668 listing lines of round 1, 731 of rounds 2 to 5, 624 of the gap chaining, and the currency pass records, all screened by title.
- After title and abstract screening: 40 candidates that no theme run had assessed at full text, Zhao 2022 among them (theme 4 had left it unread).
- After full-text assessment: 29 entered, 6 were excluded at full text, 3 were taken out by the merit rule below, and 2 stayed unread (Zhao et al. 2026 and Amores 2013).
- Final included sources: 122.

**The merit rule.** The theme runs cut by rank at an upper bound, which the merged set does not have. A cut work, and a work the merge run found, enters the merged set when it passes the screening tree and meets one of three grounds: (a) it is must-include (cited by three or more core papers of a theme run or of the merge's round 1) or seminal; (b) it narrows a merged gap of section 6 or fills the thin part P3 through gap chaining; (c) it is from 2022 to 2026, takes relevance 3 (it predicts a subject-level outcome and handles the missing correspondence inside the model) and has a quality total of 12 or more. A work older than 2022 that meets none of these stays out, as does a recent work with relevance 2 or a total of 11 or less.

**Must-include and seminal works the theme runs cut, each settled:**

- Kiers et al. 1999, PARAFAC2 Part I (theme 1, 13): included under (a). It is must-include in theme 1 and in the merge's round 1 (cited by 4 core papers), and it defines the direct fit of a model with a mode that varies across slices.
- SPARTan 2017 (theme 1, 13): included under (a). It is must-include in theme 1 (cited by 4 core papers), and it addresses subjects whose records do not align in time.
- Kolda and Bader 2009 (theme 1, 12): included under (a). It is cited by 6 core papers of round 1 and is cited as a survey.
- Marble 2014, Limestone 2014, Rubik 2015 and SUSTain 2018 (theme 1, 12 or 13): excluded at node 3. Each is must-include in theme 1, but each factorizes a tensor whose slice is one patient with modes aligned by design, so it addresses no part of the question.
- Peyre and Cuturi 2019, Computational Optimal Transport (theme 2, 12): included under (a). It is cited by 5 core papers of round 1 and is cited as a survey.
- Andrews et al. 2002 (theme 3, 13): included under (a). It is must-include in theme 3 (cited by 3 core papers) and seminal (1603 citations).

**Theme 1's failed currency gate.** Theme 1 kept 6 of 20 sources from 2022 to 2026 (30 percent). Its recent candidates cut at the upper bound were judged under ground (c): the shift-aware sparse Kronecker tensor classifier of 2026 (Huang_2026, 13) and REPAR 2025 (Ren_2025b, 12) entered. Lyu et al. 2024 and Cao et al. 2022 (13 each) and tensor radiomics 2022 (12) stayed out on relevance 2, since each works on registered images with no correspondence problem. He and Li 2026 (11), PAR2COX 2026 (11), SCMTF 2025 (10) and the Bayesian tensor-on-tensor varying coefficient model 2026 (10) stayed out on their totals. The merged currency gate is reported in section 10.

**Other theme cuts, each with its ground.**

- Theme 1: Kossaifi et al. 2017 (14), Lock and Li 2018 (14), Perros et al. 2019 (13), Xu et al. 2020 (13), COPA 2018 (13), REPAIR 2020 (13), Guhaniyogi et al. 2017 (13), TaGiTeD 2017 (13), Kobayashi et al. 2021 (12) and Registered CP 2018 (10) stayed out as works older than 2022 that are neither must-include nor seminal and narrow no merged gap.
- Theme 2, entered under (c): Zhu et al. 2024, Wasserstein HOG (Zhu_2024, 13); GRDL 2024 (Wang_2024b, 13); MMP 2024 (arxiv_2407_00224, 13); MMQ 2025 (arxiv_2502_04907, 13).
- Theme 2, out on relevance 2: Liu et al. 2022 (13, transport used for domain adaptation); Thual et al. 2022 (13, alignment of brains with no outcome); Zeng et al. 2023 (13, a graph dictionary with no subject outcome); the radiomic unbalanced-transport work of 2025 (13, clustering); SWWL 2024 (13, physics meshes); FGW barycenters to predict graphs 2022 (graph-valued output); the fMRI activation dictionaries of 2026 (no outcome); the graph dictionary of 2026 with filters and transport (benchmark graphs); GELATO 2026 (molecular graphs); Barbarant et al. 2026 (task decoding within subjects); the brain-network transport model of 2026 (atlas nodes that match across subjects); GWDRO-Lung 2026 (transport aligns cohorts, and each nodule is one image); the protein language model pooling of 2025 and the ADMET graph kernel of 2024 (molecules, not subjects); CARGO (a visualization framework).
- Theme 2, out on totals of 11 or less: Deep Set Linearized Optimal Transport 2024 (arXiv 2401.01460), the region-graph transport routing for slides of 2026 (arXiv 2604.07298) and FlowLOT 2026 (arXiv 2609.17906). Crossref, OpenAlex, Semantic Scholar and arXiv found no published version of any of them, so the venue item is 1. OpenAlex gives them 2, 0 and 0 citations with no percentile, which ranks each below the median of the included sources of its age, so the citation item is 1 and the total is at most 11. Wang et al. 2025, LOT for single-cell data (8), and Kothapalli et al. 2023 (8) stay out on their totals.
- Theme 2, older than 2022 and not must-include: OTKE 2021, OGDL 2021, GOT 2019, Gramfort et al. 2015.
- Theme 3, entered under (c): Shan et al. 2022 (Shan_2022, 13); Wang et al. 2024, ICMIL (Wang_2024a, 13); Lysukhin et al. 2025 (Lysukhin_2025, 12); Thiery et al. 2023 (Thi_ry_2023, 12).
- Theme 3, out: PointNet++ 2017 (13) and Chen et al. 2021, slides as 2D point clouds (13), as works older than 2022 that are not must-include; Gacheva et al. 2026, LENS-GRF 2026 and CELLECTION 2025 (11 each) on their totals.
- Theme 4, entered under (c): Sabouri et al. 2025 (Sabouri_2025, 12); Belkhatir et al. 2022 (Belkhatir_2022, 12).
- Theme 4, out on relevance 2: OTMorph 2025, Geady et al. 2024, Zhu et al. 2023 and TractGeoNet 2024 (12 each). Out on totals of 11 or less: Patch2Space 2026 (11), Ironside 2025 (11), DMAA 2025 (11), Qin 2026 (11), Gharibi 2026 (11), Chen 2026 (11), Cavinato 2023 (10), Henry 2022 (10), ALPaCA 2025 (10), Kolskar 2022 (8) and 3D-TBM 2026 (8). Out as works older than 2022 that are neither must-include nor seminal: Tu 2020, Feydy 2017, Gramfort 2015, Bazeille 2019, Kundu 2020, Wu 2018, Ackaouy 2020, Kuceyeski 2018, Sollini 2020 and Hope 2021.

**Merge candidates excluded at full text.** The self-optimal-transport feature transform (arXiv 2204.03065) transforms the features of one set and predicts no subject outcome (node 3). The generalized sliced-Wasserstein embedding (arXiv 2103.03892) states the contribution of Naderializadeh_2021 by the same authors, so it is a duplicate. SITD 2025 (10.1007/s10915-025-02968-0) decomposes irregular tensors for imputation with no prediction (node 3). The Bayesian scalar-on-tensor quantile regression (arXiv 2603.17294) works on registered images (relevance 2). PoRef-MIL (arXiv 2611.19193) orders the slices of one volume (relevance 2). The coexisting-lesion study of slides (arXiv 2610.22091) recovers lesion labels within one slide (relevance 2).

**Taken out by the merit rule.** Three works the merge run had collected meet none of the three grounds. Xie and Tong 2025, a survey of set function learning, takes relevance 2 (total 12). The Fourier sliced-Wasserstein embedding (arXiv 2405.16519) embeds multisets with no subject-level outcome, so it takes relevance 2. Semantic Scholar names ICLR as its venue, which OpenAlex and Crossref do not confirm. With the venue item at 3 its total would be 12 instead of 10, and it stays out on relevance either way. The injective multiple-instance pooling of Chen and Martel (arXiv 2203.04964) takes relevance 3, but it is a preprint with no published version in Crossref, OpenAlex, Semantic Scholar or arXiv, and OpenAlex gives it 1 citation, so its total is 10. Section 9 lists them.

**Duplicates removed.** The six works above that two theme runs kept. Charles_2017 (theme 3) and arxiv_1612_00593 are the same PointNet paper, now under arxiv_1612_00593. Ren_2023 (theme 1) is MULTIPAR, now under arxiv_2208_00993.

### Not included: not read

- Zhao et al. 2026, Information Fusion (10.1016/j.inffus.2026.104509), a point cloud plus radiomics model of spinal surgery outcomes. Crossref, OpenAlex and Semantic Scholar hold its record and give no abstract. Europe PMC has no record. The page at its DOI is an Elsevier linking page with no abstract. A web search on the exact title found no copy. It is neither must-include nor seminal.
- Ma et al. 2023, Pattern Recognition (10.1016/j.patcog.2023.109716), as `theme-report-2.md` records it. `the lookup script resolve` run again in the merge run found its record in Crossref, OpenAlex and Semantic Scholar, with no abstract. It is neither must-include nor seminal.
- Amores 2013, "Multiple instance classification: Review, taxonomy and comparative study", Artificial Intelligence (10.1016/j.artint.2013.06.003). It is must-include (cited by 3 core papers in round 4) and seminal (674 citations in OpenAlex, percentile 99 to 100). `the lookup script resolve` found it in Crossref, OpenAlex and Semantic Scholar. `the lookup script fetch` tried the ScienceDirect PDF through OpenAlex and Semantic Scholar (HTTP 403 each) and found no abstract. Crossref and the Semantic Scholar API hold no abstract, the Scilit and Typeset pages answered 403, the Datalearner page 404, and the Bohrium and Zhenzhi pages gave no text of the paper. A web search on the exact title found no open copy. It stays out unread. The later survey Carbonneau_2018, which is in the set, covers the same family of methods.
- Abramova 2026 (Physica Medica) and Phan 2026 (Journal of Imaging Informatics in Medicine), as `theme-report-4.md` records them. Neither is must-include nor seminal.

Theme 4 listed Zhang 2025 (MICCAI) and Zhao 2022 (European Radiology) as not read. Theme 3 read the abstract of Zhang 2025 and included it (Zhang_2025), and the merge run read the PubMed abstract of Zhao 2022 and included it (Zhao_2022).

## 4. Annotated bibliography

Each heading starts with the source's key in `refs.bib`. Annotations of sources the theme runs kept are copied from the theme reviews; a duplicate keeps the fuller of its two annotations, and a Potential use field is added where the theme review had none.

### Alam_2026: Alam, Kaddurah-Daouk and Luo (2026). Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition.
- **Type**: Journal article (Biostatistics)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC13070533/
- **Method**: A joint model in which multivariate longitudinal omics data form a functional tensor with a supervised low-rank decomposition informed by baseline covariates, linked to a proportional hazards model and fitted by Monte Carlo expectation-maximization.
- **Key results**: In simulations the joint model estimates and predicts better than a two-stage approach, most under heavy censoring and small samples. On ADNI lipidomics data four components explain over 99 percent of the variation and give subject-level latent predictors of dementia onset.
- **P1**: tensor decomposition with an unaligned mode. The time mode differs across subjects, since each subject has its own number of visits and visit times, and the subject scores of the decomposition predict time to dementia.
- **P2**: other. The time mode is a smooth function evaluated at each subject's own irregular visit times, so no common time grid is needed.
- **P3**: not addressed.
- **Relevance**: A supervised tensor decomposition whose subject-level outcome is survival and whose varying mode is time, the closest of the tensor sources to a supervised model for unaligned measurements.
- **Quality**: High (15). Q1 journal, joint likelihood estimation, real cohort data, code on GitHub; the varying mode is time, not space.
- **Potential use**: The section on P1, as the survival case of supervised decompositions with a varying mode.

### Konyar_2025: Konyar and Gahrooei (2025). Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics)
- **Read from**: the abstract at Europe PMC (https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI:10.1109/JBHI.2025.3530271&resultType=core&format=json), with the conference abstract at https://conferences.enbis.org/event/82/contributions/1108/contribution.pdf; no full text was reached.
- **Method**: A semi-supervised PARAFAC2 decomposition of irregular EHR tensors that uses labels available for a subset of patients.
- **Key results**: On a synthetic data set and a MIMIC-IV case study the authors report better results than their benchmarks. [GAP: Key results, numbers not in the abstract]
- **P1**: tensor decomposition with an unaligned mode. PARAFAC2 decomposes patient slices whose visit mode varies, and label information guides the phenotypes for prediction.
- **P2**: other. PARAFAC2 lets the visit mode differ in length across patients, so visits are not matched across patients.
- **P3**: not addressed.
- **Relevance**: The first PARAFAC2 model in the set with label supervision, a core paper of theme 1.
- **Quality**: High (14). Q1 journal and a real cohort; rigor scored 2 because only the abstract could be read.
- **Potential use**: The section on P1 and P2, supervised irregular tensors.

### Zhang_2021: Zhang, Fanaee-T and Thoresen (2021). Feature extraction from unequal length heterogeneous EHR time series via dynamic time warping and tensor decomposition.
- **Type**: Journal article (Data Mining and Knowledge Discovery)
- **Read from**: https://link.springer.com/article/10.1007/s10618-020-00724-6 (abstract)
- **Method**: Dynamic time warping distances between patients for each temporal feature are stacked into a tensor, a CP decomposition gives patient representations, and a classifier predicts in-hospital mortality.
- **Key results**: On the MIMIC-III sepsis and acute kidney failure cohorts the method outperforms LSTM and DTW-KNN on AUROC, AUPRC and accuracy. Feature importance is analysed for interpretation.
- **P1**: other. The tensor holds pairwise alignment distances between patients rather than the measurements, and its decomposition feeds a mortality classifier.
- **P2**: other. Dynamic time warping aligns each pair of patients' series of unequal length before the decomposition.
- **P3**: not addressed.
- **Relevance**: The one tensor source that builds the tensor from pairwise alignment costs between subjects, which is the structure of a distance-based predictor for unaligned data.
- **Quality**: High (14). Q1 journal and two real cohorts; rigor scored 2 because only the abstract could be read.
- **Potential use**: The section on P2, alignment by pairwise warping.

### Afshar_2020: Afshar et al. (2020). TASTE: temporal and static tensor factorization for phenotyping electronic health records.
- **Type**: Conference paper (ACM CHIL 2020)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC7924914/
- **Method**: A coupled factorization of an irregular PARAFAC2 tensor of visits and a static patient-feature matrix, with non-negativity constraints, followed by logistic regression on the patient factors.
- **Key results**: On Sutter heart-failure data and CMS synthetic data it fits faster than baselines. With 60 extracted phenotypes, logistic regression reaches the same AUC for heart-failure prediction as an RNN on 345 features.
- **P1**: tensor decomposition with an unaligned mode. The PARAFAC2 visit mode varies by patient, and the patient factors predict heart failure.
- **P2**: other. PARAFAC2 allows a different number of visits per patient without matching visits.
- **P3**: not addressed.
- **Relevance**: A two-stage use of an irregular decomposition for a subject-level prediction.
- **Quality**: High (14). Well-known conference, real data, code on GitHub.
- **Potential use**: The section on P1, decompositions with a varying mode.

### Yin_2020: Yin et al. (2020). LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values.
- **Type**: Conference paper (KDD 2020)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC8186437/
- **Method**: A logistic PARAFAC2 factorization for binary irregular tensors with positive-unlabeled missing values, a uniqueness regularization and a time-aware temporal constraint.
- **Key results**: It improves irregular tensor completion by up to 26 percent over the best baseline. Its patient representations improve heart-failure prediction by 13.2 percent and mortality prediction by 14 percent on average over earlier PARAFAC2 models.
- **P1**: tensor decomposition with an unaligned mode. The visit mode varies by patient and the patient factors are used for downstream prediction.
- **P2**: other. PARAFAC2 lets each patient keep his own visit sequence.
- **P3**: not addressed.
- **Relevance**: Shows that the PARAFAC2 representation carries predictive signal for subject outcomes.
- **Quality**: High (14). Well-known conference, real data, code on GitHub.
- **Potential use**: The section on P1.

### Zhou_2013: Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Type**: Journal article (Journal of the American Statistical Association); seminal work, outside the time range and cited by more than 100 works
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC4004091/
- **Method**: Generalized linear models with a tensor covariate whose coefficient array has a low-rank CP structure, fitted by block relaxation, with regularization for region selection.
- **Key results**: The CP structure reduces ultrahigh dimensionality to a manageable number of parameters with efficient estimation and prediction. On the ADHD-200 data (776 subjects before exclusions) the regularized estimate selects brain regions associated with ADHD.
- **P1**: multilinear or tensor partial least squares or tensor regression. A CP-structured tensor regression predicts a subject-level diagnosis from an MRI volume.
- **P2**: registration to a common space. The T1 images are preprocessed with segmentation and registration, so every voxel is assumed to match across subjects.
- **P3**: builds on registration. The model takes registered images as its covariate.
- **Relevance**: The base model of tensor regression that later work in the set extends.
- **Quality**: High (14). Q1 journal, asymptotic theory and real data; no code is named in the text read.
- **Potential use**: The section on P1, foundations of tensor regression.

### Li_2016: Li, Suk, Shen and Li (2016). Sparse Multi-Response Tensor Regression for Alzheimer's Disease Study With Multivariate Clinical Assessments.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC5154176/
- **Method**: A multi-response tensor regression with low-rank coefficients and a group penalty that selects the same regions across responses.
- **Key results**: On 194 ADNI subjects (93 mild AD, 101 controls) it estimates MMSE and ADAS-Cog from grey-matter density maps, evaluated by RMSE and correlation in 10-fold cross-validation. It selects AAL regions known to relate to AD.
- **P1**: multilinear or tensor partial least squares or tensor regression. Tensor regression predicts two clinical scores per subject.
- **P2**: registration to a common space. The images are normalized with HAMMER to an atlas aligned with MNI space and downsized to 32 by 32 by 32 voxels.
- **P3**: builds on registration. The tensor covariate is the registered RAVENS grey-matter density map.
- **Relevance**: A core paper of theme 1 and a medical-imaging tensor regression whose correspondence rests on registration.
- **Quality**: High (14). Q1 journal and cross-validated real data; no code is named in the text read.
- **Potential use**: The section on P2, registration as the source of correspondence.

### Miranda_2018: Miranda, Zhu and Ibrahim (2018). TPRM: Tensor partition regression models with applications in imaging biomarker detection.
- **Type**: Journal article (The Annals of Applied Statistics)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC6221472/
- **Method**: A hierarchical Bayesian model that partitions the tensor into subtensors, reduces each by CP decomposition and principal components, and links them to the outcome through a generalized linear model with a sparsity prior, fitted by MCMC.
- **Key results**: In simulations TPRM outperforms competing methods. It predicts Alzheimer versus control status from ADNI structural MRI.
- **P1**: multilinear or tensor partial least squares or tensor regression. A partitioned tensor regression predicts disease status per subject.
- **P2**: registration to a common space. The images are processed with HAMMER and warped to the Jacob template before RAVENS maps are computed.
- **P3**: builds on registration. The covariates are registered RAVENS maps.
- **Relevance**: A tensor regression that works on local subtensors of registered images.
- **Quality**: High (14). Q1 journal, Bayesian inference and real data; no code is named in the text read.
- **Potential use**: The section on P1.

### Pan_2018: Pan, Mai and Zhang (2018). Covariate-Adjusted Tensor Classification in High Dimensions.
- **Type**: Journal article (Journal of the American Statistical Association)
- **Read from**: https://arxiv.org/pdf/1805.04421
- **Method**: CATCH, a discriminant analysis model that joins a tensor predictor, covariates and a categorical response, with a penalized estimator that selects tensor entries with a direct discriminative effect.
- **Key results**: The method has variable selection consistency and optimal classification error when the tensor dimension exceeds the sample size. It is applied to structural MRI for ADHD (30 by 36 by 30 arrays) and autism (91 by 109 by 91 arrays).
- **P1**: multilinear or tensor partial least squares or tensor regression. A tensor discriminant model predicts each subject's class.
- **P2**: registration to a common space. Each voxel position is treated as the same across subjects, with MRI from the ADHD-200 preprocessed repository.
- **P3**: [GAP: P3]
- **Relevance**: A tensor classifier with covariate adjustment for subject-level diagnosis.
- **Quality**: High (14). Q1 journal, theory and two real data sets; the text read names no code of the method.
- **Potential use**: The section on P1.

### Li_2018: Li, Xu, Zhou and Li (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Type**: Journal article (Statistics in Biosciences)
- **Read from**: https://arxiv.org/html/1304.5637
- **Method**: Generalized linear tensor regression with a Tucker decomposition of the coefficient array, which allows a different number of factors along each mode.
- **Key results**: Tucker models need fewer parameters than CP models for skewed dimensions. On the ADHD-200 data (770 training and 197 test subjects) the regularized Tucker model has the lowest test misclassification, 0.32 to 0.36.
- **P1**: multilinear or tensor partial least squares or tensor regression. Tucker tensor regression classifies subjects from MRI.
- **P2**: registration to a common space. The model assumes the same voxel grid for every subject.
- **P3**: [GAP: P3]
- **Relevance**: The Tucker variant of tensor regression for subject-level classification.
- **Quality**: High (14). Journal, theory and an independent test set; the text read names a sparse-regression toolbox and no code of the method.
- **Potential use**: The section on P1.

### Zhang_2023: Zhang, Liu, Lanfranchi and Yang (2023). Explainable Tensor Multi-Task Ensemble Learning Based on Brain Structure Variation for Alzheimer's Disease Dynamic Prediction.
- **Type**: Journal article (IEEE Journal of Translational Engineering in Health and Medicine)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC9721355/
- **Method**: A tensor multi-task learning model in which each patient's prediction is a task sharing latent factors from a tensor decomposition, with gradient boosting over each subject's successive records.
- **Key results**: On ADNI data it predicts MMSE and ADAS-Cog scores with better accuracy and stability than the authors' benchmarks and other multi-task regression methods.
- **P1**: multilinear or tensor partial least squares or tensor regression. A tensor multi-task regression predicts cognitive scores per subject over time.
- **P2**: other. FreeSurfer volumetric segmentation and cortical parcellation give regional measures that match across subjects by anatomical label.
- **P3**: builds on lesion or region segmentation. The features are FreeSurfer regional volumes, areas and thicknesses.
- **Relevance**: Shows correspondence obtained from a region parcellation instead of a voxel grid.
- **Quality**: High (14). Journal, real longitudinal data; no code is named in the text read.
- **Potential use**: The section on P2.

### Liu_2023a: Liu, Chakraborty, Qin and Kundu (2023). Integrative Bayesian tensor regression for imaging genetics applications.
- **Type**: Journal article (Frontiers in Neuroscience)
- **Read from**: https://www.frontiersin.org/articles/10.3389/fnins.2023.1212218/pdf
- **Method**: A Bayesian scalar-on-image regression with a low-rank tensor coefficient for voxel-level cortical thickness and a graph-Laplacian prior for transcriptomic features, fitted by MCMC.
- **Key results**: On longitudinal ADNI data it predicts cognitive scores at several visits better than single-modality models and than models that ignore the feature dependencies.
- **P1**: multilinear or tensor partial least squares or tensor regression. Tensor regression predicts a cognitive score per subject.
- **P2**: registration to a common space. All T1 images are registered with ANTs to a population template.
- **P3**: builds on registration. The voxel-level thickness maps come from the registration pipeline.
- **Relevance**: A recent medical-imaging tensor regression whose voxel correspondence comes from a template.
- **Quality**: High (14). Journal and real data; no code is named in the text read.
- **Potential use**: The section on P2.

### Lyu_2017: Lyu, Lock and Eberly (2017). Discriminating sample groups with multi-way data.
- **Type**: Journal article (Biostatistics)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC5862387/
- **Method**: Multiway versions of distance weighted discrimination and the support vector machine, with coefficients factorized into weights for each dimension.
- **Key results**: The multiway classifier improves performance and simplifies interpretation over full-rank linear and non-linear classifiers. It is applied to MR spectroscopy over brain regions (spinocerebellar ataxia) and to gene-expression time courses (treatment response in multiple sclerosis).
- **P1**: multilinear or tensor partial least squares or tensor regression. Low-rank multiway classifiers predict each subject's group.
- **P2**: other. The regions and time points are fixed by study design and shared across subjects.
- **P3**: not addressed.
- **Relevance**: A tensor classifier for subject groups outside imaging.
- **Quality**: High (14). Q1 journal, two real studies, an R package on GitHub.
- **Potential use**: The section on P1.

### Lock_2018: Lock (2018). Tensor-on-Tensor Regression.
- **Type**: Journal article (Journal of Computational and Graphical Statistics)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC6188709/
- **Method**: Linear prediction of a tensor from a tensor through the contracted tensor product with a reduced CP-rank coefficient and a ridge penalty, with a Gibbs sampler for inference.
- **Key results**: The framework includes scalar-on-tensor, matrix-on-matrix and tensor-on-scalar regression. It is illustrated on facial images from the Labeled Faces in the Wild database.
- **P1**: multilinear or tensor partial least squares or tensor regression. Tensor-on-tensor regression predicts outcomes per image.
- **P2**: registration to a common space. The faces are aligned to a 90 by 90 pixel grid before analysis.
- **P3**: not addressed.
- **Relevance**: A core paper of theme 1 and the general form of tensor regression.
- **Quality**: High (14). Q1 journal and an R package on GitHub.
- **Potential use**: The section on P1.

### Qibin_Zhao_2013: Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence); seminal work, outside the time range and cited by more than 100 works
- **Read from**: https://arxiv.org/pdf/1207.1230
- **Method**: A tensor-to-tensor partial least squares regression that projects both tensors onto a latent space through a sum of orthogonal Tucker blocks.
- **Key results**: HOPLS predicts better than existing methods, handles small samples and is robust to noise on synthetic data. It decodes 3D movement trajectories from ECoG signals.
- **P1**: multilinear or tensor partial least squares or tensor regression. A multilinear PLS predicts an output tensor.
- **P2**: other. Electrodes and time-frequency bins are the same across samples of one recording, so no correspondence across subjects is needed.
- **P3**: not addressed.
- **Relevance**: The reference form of multilinear PLS, applied within one subject rather than across subjects.
- **Quality**: High (14). Q1 journal and real data; no code is named in the text read.
- **Potential use**: The section on P1, multilinear PLS.

### Bro_1999: Bro, Andersson and Kiers (1999). PARAFAC2, Part II. Modeling chromatographic data with retention time shifts.
- **Type**: Journal article (Journal of Chemometrics); seminal work, outside the time range and cited by more than 100 works
- **Read from**: https://three-mode.leidenuniv.nl/pdf/b/broanderssonkiers1999jc.pdf
- **Method**: PARAFAC2 applied to chromatographic data in which retention time shifts break the parallel profiles assumption of PARAFAC.
- **Key results**: PARAFAC2 resolves chromatographic data with retention time shifts that PARAFAC cannot model. It is shown on size-exclusion chromatography of thick juice from the beet sugar industry.
- **P1**: not addressed.
- **P2**: other. The elution profile of each sample may differ, since PARAFAC2 lets that mode vary across samples under a constant cross-product constraint.
- **P3**: not addressed.
- **Relevance**: The original use of PARAFAC2 for a mode that is shifted across samples, which the EHR methods of the set inherit.
- **Quality**: High (14). Q1 journal and real data; no code is named in the text read.
- **Potential use**: The section on P2, the origin of decompositions with a varying mode.

### van_der_Ploeg_2026: van der Ploeg et al. (2026). ACMTF-R: Supervised multi-omics data integration uncovering shared and distinct outcome-associated variation.
- **Type**: Journal article (PLOS One)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC12795394/
- **Method**: An extension of advanced coupled matrix and tensor factorization with a regression step, so that the decomposition of several multi-way blocks also captures variation associated with an outcome, with a tuning parameter between exploration and prediction.
- **Key results**: In simulations it recovers a small outcome-related component shared between blocks, unlike N-way PLS and unsupervised ACMTF. On mother-infant microbiome and metabolome data it finds variation associated with maternal pre-pregnancy BMI.
- **P1**: multilinear or tensor partial least squares or tensor regression. A supervised coupled factorization, related to N-way PLS, relates multi-way blocks to a subject-level outcome.
- **P2**: other. Subjects are the shared mode, and time points are aligned by design with missing samples kept as missing rows.
- **P3**: not addressed.
- **Relevance**: The most recent supervised multiway factorization in the set.
- **Quality**: High (14). Journal, simulations and a real cohort, an R package on CRAN.
- **Potential use**: The section on P1, multiway PLS and its successors.

### Amante_2019: Amante et al. (2019). Untargeted Metabolomic Profile for the Detection of Prostate Carcinoma: Preliminary Results from PARAFAC2 and PLS-DA Models.
- **Type**: Journal article (Molecules)
- **Read from**: https://www.mdpi.com/1420-3049/24/17/3063/pdf?version=1567074558
- **Method**: GC-MS data of 91 urine samples (samples by retention time by m/z) are aligned, decomposed by PARAFAC2 within retention-time intervals with the PARADISe software, and the resulting compounds feed a PLS-DA classifier validated by repeated double cross-validation.
- **Key results**: The PARAFAC2 models extract 329 compounds as candidate biomarkers. The PLS-DA model separates 43 prostate cancer patients from 48 with benign hyperplasia with what the authors call promising performance, as preliminary results.
- **P1**: tensor decomposition with an unaligned mode. PARAFAC2 models the retention-time mode, which shifts across samples, and its scores feed a subject-level classifier.
- **P2**: registration to a common space. The chromatograms are aligned before modelling, and PARAFAC2 absorbs the shifts left within each interval.
- **P3**: not addressed.
- **Relevance**: A subject-level diagnosis built on a decomposition of a shifted mode, in two stages.
- **Quality**: High (14). Q2 journal and a real cohort; rigor scored 2 for a small preliminary cohort; no code or data release is named in the text read.
- **Potential use**: The section on P2.

### arxiv_1910_09699: Papadogeorgou, Zhang and Dunson (2021). Soft Tensor Regression.
- **Type**: Journal article (Journal of Machine Learning Research); venue page https://www.jmlr.org/papers/v22/20-476.html
- **Read from**: https://arxiv.org/html/1910.09699
- **Method**: A Bayesian tensor regression in which the row-specific contributions of a PARAFAC approximation may vary around their mean, adapted to symmetric tensor predictors.
- **Key results**: The posterior of the coefficient tensor is weakly consistent whatever the true or approximating rank. On Human Connectome Project data it relates structural connectomes over 68 regions to human traits.
- **P1**: multilinear or tensor partial least squares or tensor regression. Soft tensor regression predicts a scalar trait per subject from a connectome.
- **P2**: other. The 68 nodes are regions of the Desikan-Killiany atlas, which give the same node labels in every subject.
- **P3**: builds on lesion or region segmentation. The connectome rests on the atlas parcellation.
- **Relevance**: Tensor regression on region-level structure rather than voxels.
- **Quality**: High (14). Journal, theory and real data; no code is named in the text read.
- **Potential use**: The section on P2.

### arxiv_2208_00993: Ren et al. (2023). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning for Computational Phenotyping.
- **Type**: Conference paper (Machine Learning for Health, ML4H 2023, PMLR volume 225); earlier version arXiv 2208.00993, under the shorter title "MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning". The entry is taken from the proceedings page https://proceedings.mlr.press/v225/ren23a.html.
- **Read from**: https://arxiv.org/html/2208.00993
- **Method**: A PARAFAC2 factorization of irregular EHR tensors trained jointly with several prediction tasks on the patient factors.
- **Key results**: On MIMIC-EXTRACT data the supervised factorization improves the downstream predictions over unsupervised PARAFAC2 followed by a predictor. The phenotypes stay interpretable.
- **P1**: tensor decomposition with an unaligned mode. The visit mode varies by patient and the factorization is supervised by subject-level tasks.
- **P2**: other. PARAFAC2 allows a different number of visits per patient.
- **P3**: not addressed.
- **Relevance**: A core paper of theme 1 and the multi-task form of supervised PARAFAC2.
- **Quality**: High (14). Well-known venue, real data, code on GitHub.
- **Potential use**: The section on P1 and P2.

### arxiv_1306_0895: Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport.
- **Type**: conference paper (NeurIPS)
- **Read from**: https://arxiv.org/html/1306.0895
- **Method**: adds an entropic penalty to the transport problem and solves it by Sinkhorn matrix scaling.
- **Key results**: The entropic distance is computed several orders of magnitude faster than the exact transport distance. Used as a kernel distance on MNIST histograms, it gives a lower classification error than the exact distance and classical histogram distances.
- **P1**: transport distance or transport embedding fed to a predictor. The Sinkhorn distance feeds a support vector machine on digit histograms.
- **P2**: a transport coupling. The entropic coupling matches the mass of two histograms without a given correspondence.
- **P3**: not addressed
- **Relevance**: the solver on which almost every later transport method in this set rests.
- **Quality**: High (13). Strength: the solver became the standard for entropic transport. Limitation: the classification test is one image benchmark. 3370 citations, percentile 93 to 100.
- **Potential use**: the computational basis for any transport coupling between lesion or region sets.

### M_moli_2011: Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Type**: journal article (Foundations of Computational Mathematics)
- **Read from**: https://link.springer.com/article/10.1007/s10208-011-9093-5 (abstract only)
- **Method**: defines the Gromov-Wasserstein distance between metric measure spaces and studies its properties and lower bounds.
- **Key results**: The abstract presents the distance as a way to compare objects up to isometry, without placing them in a common space. It gives lower bounds that can be computed and relates the distance to the Gromov-Hausdorff distance.
- **P1**: [GAP: P1]. The abstract names no prediction task.
- **P2**: a transport coupling. The coupling between two spaces matches their points by comparing internal distances, so no common coordinate frame is needed.
- **P3**: [GAP: P3]
- **Relevance**: the founding work of the distance family that removes the need for a shared space.
- **Quality**: High (13). Strength: foundational theory. Limitation: read from the abstract only, after the ways the theme-2 search log lists. 942 citations, percentile 95 to 100.
- **Potential use**: the definition to cite for comparing lesion configurations across subjects without registration.

### arxiv_1310_4375: Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Type**: conference paper (ICML)
- **Read from**: https://arxiv.org/html/1310.4375
- **Method**: computes the Wasserstein barycenter of several measures by smoothed dual gradient methods built on the Sinkhorn solver.
- **Key results**: Barycenters of many measures become computable at practical sizes. The paper shows barycenters of images and uses them for a constrained clustering problem.
- **P1**: not addressed
- **P2**: a learned template or barycenter. The barycenter is a template computed from the data, to which each measure can be coupled.
- **P3**: not addressed
- **Relevance**: the algorithm for building a transport template from a population.
- **Quality**: High (13). Strength: the standard barycenter algorithm. Limitation: no prediction experiment. 871 citations, percentile 98 to 100.
- **Potential use**: computing a population template of lesion distributions.

### Bonneel_2016: Bonneel, Peyre and Cuturi (2016). Wasserstein barycentric coordinates: histogram regression using optimal transport.
- **Type**: journal article (ACM Transactions on Graphics)
- **Read from**: https://hal.science/hal-01303148v1/document
- **Method**: represents a histogram as a Wasserstein barycenter of a few reference histograms and learns the barycentric weights by differentiating through the Sinkhorn iterations.
- **Key results**: Histograms, shapes and colour distributions are projected onto the barycenters of a dictionary. The weights serve as low-dimensional coordinates for regression and interpolation.
- **P1**: transport barycenter or dictionary with learnable templates. The barycentric weights over reference histograms are the coordinates on which regression is done.
- **P2**: a learned template or barycenter. Each sample is expressed against reference measures through barycenters.
- **P3**: not addressed
- **Relevance**: gives the barycentric coordinate representation that later dictionary methods build on.
- **Quality**: High (14). Strength: differentiable barycenters. Limitation: graphics tasks only. 209 citations, percentile 97 to 100.
- **Potential use**: coordinates of each subject's lesion set with respect to a few templates.

### Wang_2012: Wang et al. (2012). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Type**: journal article (International Journal of Computer Vision)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/
- **Method**: linear optimal transport (LOT): each image, as a particle measure, is transported to one reference, and the transport maps are treated as vectors in a linear space.
- **Key results**: The LOT embedding allows PCA and linear discriminant analysis on sets of images. It separates image classes in cell and nuclear morphology data and shows the main modes of variation.
- **P1**: transport distance or transport embedding fed to a predictor. The LOT vectors feed linear discriminant analysis.
- **P2**: a learned template or barycenter. Every sample is coupled to one reference computed from the data.
- **P3**: not addressed
- **Relevance**: the origin of transport embeddings to a reference, used by several later works in this set.
- **Quality**: High (15). Strength: a linear space in which standard statistics apply. Limitation: the reference choice affects the embedding. 273 citations, percentile 88 to 100.
- **Potential use**: a fixed-length vector for each subject's lesion set.

### Schmitz_2018: Schmitz et al. (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Type**: journal article (SIAM Journal on Imaging Sciences)
- **Read from**: https://arxiv.org/pdf/1708.01955
- **Method**: learns a dictionary of measures and barycentric weights so that each sample is approximated by a Wasserstein barycenter of the atoms.
- **Key results**: The method learns atoms from images, colour histograms and astrophysical spectra. Barycentric reconstruction keeps the geometry of the data better than linear dictionary learning.
- **P1**: not addressed
- **P2**: a learned template or barycenter. The atoms are learned templates.
- **P3**: not addressed
- **Relevance**: makes the transport templates themselves learnable.
- **Quality**: High (14). Strength: a general learnable dictionary. Limitation: unsupervised only. 200 citations, percentile 88 to 100.
- **Potential use**: learning lesion distribution templates from a cohort.

### Peyre_2016: Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Type**: conference paper (ICML)
- **Read from**: https://hal.science/hal-01322992/document
- **Method**: an entropic Gromov-Wasserstein discrepancy and Gromov-Wasserstein barycenters of distance or kernel matrices.
- **Key results**: Shapes given only by their distance matrices are averaged and interpolated. The discrepancy is used in a linear regression that predicts molecular energy levels.
- **P1**: transport distance or transport embedding fed to a predictor. The GW discrepancy enters a regression of energy levels.
- **P2**: a transport coupling. The GW coupling matches points of two spaces by their internal distances.
- **P3**: not addressed
- **Relevance**: makes GW computable and gives the GW barycenter.
- **Quality**: High (14). Strength: an entropic algorithm with code (a gpeyre repository named in the text). Limitation: small experiments. 593 citations, percentile 87 to 100.
- **Potential use**: averaging lesion distance matrices across subjects.

### arxiv_1805_09114: Vayer et al. (2019). Optimal Transport for structured data with application on graphs.
- **Type**: conference paper (ICML)
- **Read from**: https://arxiv.org/html/1805.09114
- **Method**: the fused Gromov-Wasserstein (FGW) distance, which combines a Wasserstein term on node features with a GW term on structure.
- **Key results**: FGW kernels classify graph benchmarks with accuracy at or above graph kernels of the time. FGW barycenters summarise sets of graphs.
- **P1**: transport distance or transport embedding fed to a predictor. The FGW distance feeds a kernel classifier.
- **P2**: a transport coupling. The coupling aligns nodes using features and structure at once.
- **P3**: not addressed
- **Relevance**: the distance for attributed structures, such as lesions with features and positions.
- **Quality**: High (14). Strength: one distance for features and structure. Limitation: benchmark graph sets only. 230 citations, percentile 93 to 100.
- **Potential use**: comparing lesion graphs whose nodes carry imaging features.

### arxiv_2006_09430: Kolouri et al. (2021). Wasserstein Embedding for Graph Learning.
- **Type**: conference paper (ICLR per Semantic Scholar; published version not confirmed), cited as the arXiv preprint
- **Read from**: https://arxiv.org/html/2006.09430
- **Method**: WEGL embeds the node embeddings of each graph by linear transport to one reference, then trains a standard classifier on the embedding.
- **Key results**: WEGL reaches accuracy close to graph neural networks on graph benchmarks at a much lower training cost. The code is at github.com/navid-naderi/WEGL.
- **P1**: transport distance or transport embedding fed to a predictor. The linear transport embedding feeds a classifier.
- **P2**: a learned template or barycenter. Each graph is coupled to one reference distribution.
- **P3**: not addressed
- **Relevance**: shows transport embeddings scaling to graph classification.
- **Quality**: High (14). Strength: fast and simple. Limitation: the reference is fixed. Citation item from the fallback: 124 citing records, the highest among the included works of 2020 to 2022 in theme 2.
- **Potential use**: a baseline embedding for lesion sets.

### Naderializadeh_2021: Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding.
- **Type**: conference paper (NeurIPS)
- **Read from**: https://papers.neurips.cc/paper_files/paper/2021/file/1bc2029a8851ad344a8d503930dfd7f7-Paper.pdf
- **Method**: PSWE pools a set of features by its sliced-Wasserstein embedding with respect to a learnable reference set.
- **Key results**: As a pooling layer, PSWE matches or exceeds other set pooling methods on point cloud, graph and image set classification. Its code is released.
- **P1**: transport distance or transport embedding fed to a predictor. The embedding is pooled and passed to a classifier trained end to end.
- **P2**: a learned template or barycenter. The reference set is learned.
- **P3**: not addressed
- **Relevance**: a trainable transport layer for sets.
- **Quality**: High (14). Strength: end-to-end training. Limitation: sliced projections lose some geometry. 31 citations, percentile 96 to 99.
- **Potential use**: an end-to-end pooling of lesion sets.

### Moosm_ller_2022: Moosmuller and Cloninger (2022). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Type**: journal article (Information and Inference)
- **Read from**: https://arxiv.org/html/2008.09165
- **Method**: proves conditions under which LOT embeddings make classes linearly separable, under shifts, scalings and perturbations.
- **Key results**: Classes that differ by such transformations become linearly separable in the LOT space. An MNIST example illustrates the result.
- **P1**: transport distance or transport embedding fed to a predictor. LOT embeddings feed a linear classifier.
- **P2**: a transport coupling. Each sample is coupled to a reference.
- **P3**: not addressed
- **Relevance**: gives the theory for why LOT embeddings work with linear predictors.
- **Quality**: High (14). Strength: proofs. Limitation: small experiments. 78 citations, percentile 86 to 100.
- **Potential use**: justifying a linear predictor on transport embeddings.

### Vincent_Cuaz_2022: Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Type**: conference paper (NeurIPS)
- **Read from**: https://arxiv.org/html/2205.15733
- **Method**: TFGW computes FGW distances from each graph to a set of learnable template graphs and uses them as features for a classifier, trained end to end.
- **Key results**: TFGW reaches or exceeds the accuracy of graph neural networks on graph benchmarks. The templates are learned jointly with the classifier.
- **P1**: transport barycenter or dictionary with learnable templates. The distances to learned templates form the representation.
- **P2**: a learned template or barycenter. The templates are learned.
- **P3**: not addressed
- **Relevance**: the closest graph method to learned transport templates for prediction.
- **Quality**: High (14). Strength: end-to-end learned templates. Limitation: benchmark graph sets only. 28 citations, percentile 94 to 99.
- **Potential use**: learned lesion templates as the layer of a predictor.

### Xu_2023a: Xu and Cheng (2023). Regularized Optimal Transport Layers for Generalized Global Pooling Operations.
- **Type**: journal article (IEEE TPAMI)
- **Read from**: https://arxiv.org/pdf/2212.06339
- **Method**: ROTP writes global pooling as a regularized transport problem and unrolls its solver into a learnable layer.
- **Key results**: ROTP layers match or improve on standard pooling in multiple instance learning, graph classification and image classification. The code is at github.com/SDS-Lab/ROT-Pooling.
- **P1**: permutation-invariant set encoder. The pooling layer is invariant to the order of instances.
- **P2**: a transport coupling. Pooling weights come from a transport plan.
- **P3**: not addressed
- **Relevance**: links set pooling with transport couplings.
- **Quality**: High (15). Strength: one layer for many pooling rules. Limitation: no medical cohort. 13 citations, percentile 93 to 98.
- **Potential use**: pooling lesion-level features into a subject-level prediction.

### Xu_2023b: Xu et al. (2023). Representing Graphs via Gromov-Wasserstein Factorization.
- **Type**: journal article (IEEE TPAMI)
- **Read from**: https://scholars.duke.edu/publication/1512323 (abstract only)
- **Method**: GWF represents each graph as a GW barycenter of learned atom graphs, with the barycentric weights as its embedding.
- **Key results**: The abstract reports graph clustering and classification results competitive with other graph representation methods. The embeddings come from learned atoms.
- **P1**: transport barycenter or dictionary with learnable templates. The weights over learned atoms are the representation.
- **P2**: a learned template or barycenter. The atoms are learned templates.
- **P3**: not addressed
- **Relevance**: a GW dictionary for graphs.
- **Quality**: High (14). Limitation: read from the abstract only, after the ways the theme-2 search log lists. 33 citations, percentile 92 to 99.
- **Potential use**: a dictionary of lesion configurations.

### Kundu_2018: Kundu et al. (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry.
- **Type**: journal article (NeuroImage)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC5912801/
- **Method**: transport-based morphometry (TBM): brain MRI is affinely registered to MNI space, each tissue map is transported to a template, and linear discrimination and regression are done on the transport maps.
- **Key results**: TBM finds and visualises structural changes linked to aging and to fitness measures in a cohort of older adults. The paper compares it with a deformation-based approach.
- **P1**: transport distance or transport embedding fed to a predictor. The transport maps feed linear discrimination and regression.
- **P2**: registration to a common space. Images are affinely registered before transport.
- **P3**: builds on registration. TBM uses affine registration to MNI space before the transport step.
- **Relevance**: the nearest medical-imaging use of transport embeddings for subject-level outcomes.
- **Quality**: High (15). Strength: a real cohort with visualised biomarkers. Limitation: needs registration. 37 citations, percentile 88 to 98.
- **Potential use**: the baseline that a registration-free method would be compared with.

### Qian_2024: Qian et al. (2024). Reimagining Graph Classification from a Prototype View with Optimal Transport: Algorithm and Theorem.
- **Type**: conference paper (KDD)
- **Read from**: the abstract in the OpenAlex and Semantic Scholar records of 10.1145/3637528.3671696 (abstract only; the publisher PDF answered HTTP 403)
- **Method**: PGOT classifies graphs by GW transport between each graph and learned class prototypes.
- **Key results**: The abstract reports accuracy at or above graph neural networks on graph benchmarks and gives a generalization result. The code is at github.com/ChnQ/PGOT.
- **P1**: transport barycenter or dictionary with learnable templates. The prototypes are learned graphs.
- **P2**: a learned template or barycenter. Each graph is coupled to learned prototypes.
- **P3**: not addressed
- **Relevance**: prototype transport classification with theory.
- **Quality**: High (13). Limitation: read from the abstract only, after the ways the theme-2 search log lists. 9 citations, percentile 95 to 98.
- **Potential use**: class prototypes of lesion configurations.

### Shifat_E_Rabbi_2025: Shifat-E-Rabbi et al. (2025). Linear Optimal Transport Subspaces for Point Set Classification.
- **Type**: journal article (Journal of Mathematical Imaging and Vision)
- **Read from**: https://arxiv.org/html/2403.10015
- **Method**: embeds point sets by LOT and classifies them by the nearest class subspace in the LOT space.
- **Key results**: The method classifies point sets accurately from few training samples and with low computation. It is compared with point cloud neural networks.
- **P1**: transport distance or transport embedding fed to a predictor. LOT embeddings feed a nearest-subspace classifier.
- **P2**: a transport coupling. Each point set is coupled to a reference.
- **P3**: not addressed
- **Relevance**: LOT for point sets with small samples.
- **Quality**: High (15). Strength: works with few samples. Limitation: no clinical data. 3 citations, percentile 87 to 96.
- **Potential use**: classification of lesion point sets in small cohorts.

### Ren_2025: Ren et al. (2025). OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-Aware Optimal Transport.
- **Type**: conference paper (MICCAI)
- **Read from**: https://arxiv.org/pdf/2506.20741
- **Method**: unbalanced transport maps the patch features of a whole-slide image to trainable survival tokens, and the result feeds a survival model.
- **Key results**: On six TCGA cohorts (for example BLCA with 359 and BRCA with 868 patients), with site-stratified 5-fold cross-validation, OTSurv raises the average C-index by 3.6 percent over the strongest baseline. The code is at github.com/Y-Research-SBU/OTSurv.
- **P1**: transport barycenter or dictionary with learnable templates. The survival tokens are learned templates.
- **P2**: a learned template or barycenter. Each patient's patches are coupled to the learned tokens.
- **P3**: other. Patch features come from a pathology foundation model, without positions.
- **Relevance**: a transport model of subject-level outcome from unordered sets in a clinical cohort.
- **Quality**: High (14). Strength: six cohorts. Limitation: patch positions are not used. 14 citations, percentile 92 to 99.
- **Potential use**: the design closest to a lesion-set survival model.

### Gong_2026: Gong et al. (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence.
- **Type**: journal article (Frontiers in Oncology)
- **Read from**: https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2025.1700447/pdf
- **Method**: CMOT-Fusion encodes sets of 32 patches per MRI sequence with twin 3D ResNet-18 networks, computes a log-domain Sinkhorn plan with a learned cost between patches of unregistered T2-weighted and ADC images, and fuses them by barycentric projection, in 300 men with a temporal test set of 50.
- **Key results**: The cross-validation AUC is 0.849 (SD 0.034) and the temporal test AUC is 0.824 (95% CI 0.694 to 0.930), against 0.839 for PI-RADS. In the ablation, the cross-validation AUC falls to 0.802 without transport and to 0.807 with a fixed Euclidean cost. Data are available on request and no code link is given.
- **P1**: transport distance or transport embedding fed to a predictor. The transported features feed the classifier.
- **P2**: a transport coupling. The coupling replaces registration between modalities.
- **P3**: removes registration. The text states that a registration-then-fusion baseline was not evaluated, and a gland mask from a segmentation network still crops and normalizes the input.
- **Relevance**: a clinical use of a transport coupling instead of registration.
- **Quality**: High (14). Strength: a temporal test set. Limitation: one centre and no registration baseline. 1 citation, percentile 89 to 94.
- **Potential use**: evidence that a coupling can replace registration in a clinical model.

### Gachon_2025: Gachon et al. (2025). Low Dimensional Representation of Multi-Patient Flow Cytometry Datasets Using Optimal Transport for Measurable Residual Disease Detection in Leukemia.
- **Type**: journal article (Cytometry Part A)
- **Read from**: https://arxiv.org/pdf/2407.17329v3
- **Method**: quantizes each patient's cell distribution against a K-means quantization of the mean measure, then embeds patients by LOT and Wasserstein PCA.
- **Key results**: Logistic regression with leave-one-out on the LOT embedding predicts the follow-up residual disease status with the best balanced accuracy among the compared representations, including a kernel mean embedding. The code is at github.com/erellgachon/CytoLOT.
- **P1**: transport distance or transport embedding fed to a predictor. LOT embeddings feed logistic regression.
- **P2**: a learned template or barycenter. The reference is a quantized mean measure.
- **P3**: other. The data are cytometry cell sets, not images.
- **Relevance**: patient-level outcome prediction from unordered cell sets through a transport embedding.
- **Quality**: High (14). Strength: real patients and a kernel baseline. Limitation: small cohort. 10 citations, percentile 96 to 98.
- **Potential use**: a template for patient-level transport embedding with a simple predictor.

### Zhang_2024: Zhang et al. (2024). Wasserstein Discriminant Dictionary Learning for Graph Representation.
- **Type**: journal article (IEEE TPAMI)
- **Read from**: the abstract in the bibliographic records of 10.1109/tpami.2024.3409772 (abstract only; no open copy found)
- **Method**: WDDL learns a dictionary of graph atoms with a discriminant objective, so that the transport-based coordinates separate classes.
- **Key results**: The abstract reports graph classification accuracy above other dictionary and graph kernel methods. The atoms are learned with class information.
- **P1**: transport barycenter or dictionary with learnable templates. The discriminant atoms are learned templates.
- **P2**: a learned template or barycenter.
- **P3**: not addressed
- **Relevance**: a supervised transport dictionary.
- **Quality**: High (14). Limitation: read from the abstract only, after the ways the theme-2 search log lists. 2 citations, percentile 87 to 94.
- **Potential use**: a discriminant dictionary of lesion configurations.

### Nguyen_2023: Nguyen and Tsuda (2023). On a linear fused Gromov-Wasserstein distance for graph structured data.
- **Type**: journal article (Pattern Recognition)
- **Read from**: https://arxiv.org/pdf/2203.04711
- **Method**: linear FGW embeds each graph by its FGW coupling to one reference graph, so that the distance between embeddings approximates FGW.
- **Key results**: On seven graph benchmarks, including BZR, COX2 and PROTEINS, linear FGW gives classification and clustering results close to FGW at much lower cost. The code is at github.com/haidnguyen0909/linearFGW.
- **P1**: transport distance or transport embedding fed to a predictor.
- **P2**: a transport coupling. Each graph is coupled to one reference.
- **P3**: not addressed
- **Relevance**: brings the LOT idea to FGW.
- **Quality**: High (15). Strength: cost. Limitation: benchmark graph sets only. 25 citations, percentile 96 to 99.
- **Potential use**: a cheap embedding of attributed lesion graphs.

### arxiv_1703_06114: Zaheer et al. (2017). Deep Sets.
- **Type**: Conference paper (NeurIPS 2017); published version taken from the proceedings page https://proceedings.neurips.cc/paper/2017/hash/f22e4747da1aa27e363d86d40ff442fe-Abstract.html.
- **Read from**: https://arxiv.org/html/1703.06114
- **Method**: Theory and experiments. It proves that a function on sets is permutation invariant if and only if it decomposes as rho(sum of phi(x)), and builds a network of that form.
- **Key results**: The sum decomposition is a universal form for permutation-invariant functions on countable sets, with a matching result for permutation-equivariant layers. The same architecture handles population statistics, point-cloud classification, set expansion and red-shift estimation.
- **P1**: permutation-invariant set encoder. It gives the sum-pooled encoder that the later set models build on.
- **P2**: permutation invariance. The encoder needs no order or correspondence among elements, since sum pooling removes it.
- **P3**: not addressed.
- **Relevance**: It is the theoretical base for predicting one outcome from an unordered set of elements.
- **Quality**: High (14). OpenAlex 481 citations with no percentile range; ranked first by its citing-works listing (100 or more) among the theme-3 sources of 2016 to 2018. Strong theory; the experiments use benchmark data.
- **Potential use**: The section on P1, the definition of a set encoder.

### arxiv_1810_00825: Lee et al. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Type**: Conference paper (ICML 2019), from its proceedings page https://proceedings.mlr.press/v97/lee19d.html.
- **Read from**: https://arxiv.org/html/1810.00825
- **Method**: Architecture. Self-attention blocks over set elements, induced set attention blocks (ISAB) with learned inducing points for linear cost, and pooling by multihead attention (PMA) with learned seed vectors.
- **Key results**: Attention-based pooling captures interactions among elements that sum or mean pooling misses, and it beats Deep Sets on amortized clustering, counting and point-cloud classification. ISAB cuts the cost from quadratic to linear in the set size.
- **P1**: permutation-invariant set encoder. Its encoder and pooling map a set to a fixed vector for prediction.
- **P2**: permutation invariance. Attention without positional terms makes the output independent of element order.
- **P3**: not addressed.
- **Relevance**: It is the attention-based set encoder that later lesion-set and cell-set models compare with or adapt.
- **Quality**: High (14). OpenAlex 836 citations, percentile 99 to 100. Benchmarks only.
- **Potential use**: The section on P1, attention pooling with learned seeds.

### arxiv_1612_00593: Qi et al. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper (CVPR 2017); the entry is taken from the CVF page https://openaccess.thecvf.com/content_cvpr_2017/html/Qi_PointNet_Deep_Learning_CVPR_2017_paper.html.
- **Read from**: https://arxiv.org/html/1612.00593
- **Method**: Architecture and theory. A shared MLP on each point, max pooling as the symmetric function, and a learned input and feature transform (T-Net).
- **Key results**: The network classifies and segments raw point clouds without voxelizing them. The max-pooled global feature is robust to missing and perturbed points, and the paper proves it can approximate any continuous set function.
- **P1**: permutation-invariant set encoder. It predicts a label for a whole point cloud.
- **P2**: permutation invariance. Max pooling removes point order; the T-Net learns a canonical alignment of each cloud before pooling.
- **P3**: not addressed.
- **Relevance**: It is the point-cloud network that the medical point-cloud studies apply.
- **Quality**: High (14). OpenAlex 11372 citations, percentile 88 to 100. Benchmarks only.
- **Potential use**: The section on P1, point-cloud encoders.

### arxiv_1802_04712: Ilse et al. (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Conference paper (ICML 2018); published version taken from the proceedings page https://proceedings.mlr.press/v80/ilse18a.html.
- **Read from**: https://arxiv.org/html/1802.04712
- **Method**: Architecture. Multiple-instance learning with a learned attention weight per instance and a weighted mean as the bag embedding, including a gated variant.
- **Key results**: Attention pooling matches or beats max and mean pooling and earlier multiple-instance methods on MNIST bags and on two histopathology datasets (breast cancer and colon cancer). The weights point to the instances that drive the bag label.
- **P1**: permutation-invariant set encoder. A bag of instances maps to one label.
- **P2**: permutation invariance. The weighted mean does not depend on instance order.
- **P3**: not addressed.
- **Relevance**: It is the attention-pooling form most of the medical multiple-instance sources build on.
- **Quality**: High (14). OpenAlex 2006 citations with no percentile range; ranked first by its citing-works listing (100 or more) among the theme-3 sources of 2017 to 2019. The authors chose the datasets.
- **Potential use**: The section on P1, attention-based multiple-instance pooling.

### arxiv_2106_00908: Shao et al. (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
- **Type**: Conference paper (NeurIPS 2021), from its proceedings page https://proceedings.neurips.cc/paper/2021/hash/10c272d06794d3e5785d5e7c5356e9ff-Abstract.html.
- **Read from**: https://arxiv.org/html/2106.00908
- **Method**: Architecture. Correlated multiple-instance learning, with a Transformer over tile features and a pyramid position encoding generator that reshapes the tile sequence into a square map.
- **Key results**: AUC of 93.09 on CAMELYON16, 96.03 on TCGA-NSCLC and 98.82 on TCGA-RCC, above ABMIL and other baselines. It converges faster than those baselines. Code is released.
- **P1**: permutation-invariant set encoder. It predicts a slide label from a set of tiles.
- **P2**: other. Self-attention correlates the instances, and its position encoding over the tile sequence adds order information.
- **P3**: not addressed.
- **Relevance**: It shows a correlated, Transformer-based alternative to independent-instance pooling for subject-level prediction.
- **Quality**: High (14). OpenAlex 1529 citations with no percentile range; ranked first by its citing-works listing (100 or more) among the theme-3 sources of 2020 to 2022. Three benchmarks the authors chose.
- **Potential use**: The section on P2, where position enters a set model.

### Lu_2021: Lu et al. (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Type**: Journal article (Nature Biomedical Engineering).
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC8711640/
- **Method**: Architecture and evaluation. CLAM: attention-based pooling with one branch per class and an instance-level clustering loss, trained from slide labels only.
- **Key results**: It classifies renal cell carcinoma subtypes, non-small-cell lung cancer subtypes and lymph node metastasis with high AUC. It holds up on independent test cohorts, on biopsies and on smartphone images. Code is released.
- **P1**: permutation-invariant set encoder. A slide is a bag of tile features mapped to a label.
- **P2**: permutation invariance. Attention pooling over tiles needs no tile correspondence across slides.
- **P3**: not addressed.
- **Relevance**: It shows that a set encoder trained on subject labels alone reaches clinical-grade accuracy across many cohorts.
- **Quality**: High (15). OpenAlex 3026 citations, percentile 88 to 100. Multi-cohort validation, code public.
- **Potential use**: The section on P1, set encoders validated across cohorts.

### Campanella_2019: Campanella et al. (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
- **Type**: Journal article (Nature Medicine).
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC7418463/
- **Method**: Multiple-instance learning on 44,732 slides from 15,187 patients. Tiles are ranked by a CNN, and an RNN then aggregates the most suspicious tiles.
- **Key results**: AUC above 0.98 for prostate cancer, basal cell carcinoma and breast cancer metastases to lymph nodes, from slide-level diagnoses alone. Code is released.
- **P1**: other. Top-ranked instance selection with recurrent aggregation, rather than a symmetric set encoder.
- **P2**: other. The RNN reads the selected tiles in order of their predicted probability, so the model fixes an order instead of being permutation invariant.
- **P3**: not addressed.
- **Relevance**: It shows subject-level prediction from very large unordered tile sets at clinical scale.
- **Quality**: High (14). OpenAlex 3431 citations, percentile 99 to 100. Very large cohort.
- **Potential use**: The section on P2, ordering instances by score instead of pooling them symmetrically.

### Zhu_2021: Zhu et al. (2021). Dual Attention Multi-Instance Deep Learning for Alzheimer's Disease Diagnosis With Structural MRI.
- **Type**: Journal article (IEEE Transactions on Medical Imaging).
- **Read from**: the abstract of DOI 10.1109/TMI.2021.3077079 (no text was reachable)
- **Method**: Multiple-instance learning on patches of structural MRI, with patch and spatial attention and an attention-based multi-instance pooling, evaluated on 1689 subjects from ADNI and AIBL.
- **Key results**: The model diagnoses Alzheimer's disease and predicts conversion from mild cognitive impairment, above the patch- and region-based baselines the abstract names. The attention maps point to regions linked to atrophy.
- **P1**: permutation-invariant set encoder. Patches of one brain form a bag mapped to a diagnosis.
- **P2**: [GAP: P2]
- **P3**: [GAP: P3]
- **Relevance**: It is the closest imaging case of a bag of brain patches, where the question is how patch positions are matched across subjects.
- **Quality**: High (14). OpenAlex 316 citations, percentile 96 to 100. Assessed from the abstract alone.
- **Potential use**: The section on P2, as an open case of patch placement.

### Oner_2023: Oner et al. (2023). Distribution based MIL pooling filters: Experiments on a lymph node metastases dataset.
- **Type**: Journal article (Medical Image Analysis).
- **Read from**: https://oar.a-star.edu.sg/storage/k/krrz07y8z1/1362-distribution-based-mil-pooling-filters.pdf
- **Method**: Theory and experiments. The pooling filter estimates the marginal distribution of each instance feature in a bag and passes it to the bag classifier.
- **Key results**: Distribution pooling is proved to keep more information than max or mean pooling. It reaches an AUC of 0.9325 on CAMELYON16, above the attention, max and mean pooling it is compared with.
- **P1**: permutation-invariant set encoder. Pooling into a feature distribution gives a fixed-size bag summary.
- **P2**: permutation invariance. A marginal distribution does not depend on instance order.
- **P3**: not addressed.
- **Relevance**: It gives a distribution-based pooling for a set encoder, close to an embedding of the empirical distribution.
- **Quality**: High (15). OpenAlex 10 citations, percentile 92 to 97. One benchmark only.
- **Potential use**: The section on P1, the link between set pooling and distribution embeddings.

### Jurenaite_2024: Jurenaite et al. (2024). SetQuence and SetOmic: Deep set transformers for whole genome and exome tumour analysis.
- **Type**: Journal article (BioSystems).
- **Read from**: https://edoc.mdc-berlin.de/id/eprint/23931/1/23931oa.pdf
- **Method**: Architecture. A Set Transformer over the set of mutated sequences of a tumour, each embedded with a DNABERT encoder; SetOmic adds other omics.
- **Key results**: It classifies tumour type across 33 TCGA types from whole genome or exome data with high accuracy. It handles sets of variable size without hand-made features.
- **P1**: permutation-invariant set encoder. A patient's tumour is a set of variant sequences mapped to a label.
- **P2**: permutation invariance. Set attention removes the order of the variants.
- **P3**: not addressed.
- **Relevance**: It is a subject-level set encoder outside imaging, with sets that share no correspondence across patients.
- **Quality**: High (14). OpenAlex 6 citations, percentile 86 to 96. Public TCGA data.
- **Potential use**: The section on P1, set encoders outside imaging.

### Elhaminia_2023: Elhaminia et al. (2023). Toxicity Prediction in Pelvic Radiotherapy Using Multiple Instance Learning and Cascaded Attention Layers.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics).
- **Read from**: https://eprints.whiterose.ac.uk/196901/1/TOXICITY%20PREDICTION%20IN%20PELVIC%20RADIOTHERAPY%20USING%20MULTIPLE%20INSTANCE%20LEARNING%20AND%20CASCADED%20ATTENTION%20LAYERS.pdf
- **Method**: Multiple-instance learning over 3D cubes of CT and dose, with cascaded attention, on 315 patients treated with pelvic radiotherapy.
- **Key results**: It predicts toxicity with about 80 percent accuracy, above dose-volume baselines. Attention maps are mapped to a common space only afterwards, to draw a toxicity atlas.
- **P1**: permutation-invariant set encoder. A patient's cubes form a bag mapped to a toxicity label.
- **P2**: permutation invariance. Attention pooling over cubes needs no correspondence for prediction.
- **P3**: removes registration. Prediction uses no registration; diffeomorphic registration serves only the atlas drawn afterwards.
- **Relevance**: It shows an imaging set model that keeps registration out of prediction and uses it only for interpretation.
- **Quality**: High (14). OpenAlex 11 citations, percentile 88 to 98. Single private cohort and no code released.
- **Potential use**: The section on P3, registration moved from prediction to interpretation.

### Craig_2025: Craig et al. (2025). Annotation-free discovery of disease-relevant cells in single-cell datasets.
- **Type**: Journal article (Science Advances).
- **Read from**: https://www.ebi.ac.uk/europepmc/webservices/rest/PMC12383263/fullTextXML
- **Method**: Mixture-model multiple-instance learning. An EM algorithm trains a cell-level classifier from patient-level labels, with each patient's cells as a bag, applied to leukemia and minimal residual disease data.
- **Key results**: The method finds disease-relevant cells without cell annotation and predicts patient outcomes from them. It recovers known populations and flags new ones.
- **P1**: other. A probabilistic mixture model over the cells of a patient.
- **P2**: permutation invariance. The bag likelihood is a product over cells, so cell order plays no role.
- **P3**: not addressed.
- **Relevance**: It gives a statistical multiple-instance model for patient-level prediction from unordered cells.
- **Quality**: High (14). OpenAlex 3 citations, percentile 96 to 97.
- **Potential use**: The section on P1, probabilistic multiple-instance models.

### Liu_2023b: Liu et al. (2023). Development and prospective validation of postoperative pain prediction from preoperative EHR data using attention-based set embeddings.
- **Type**: Journal article (npj Digital Medicine).
- **Read from**: https://www.nature.com/articles/s41746-023-00947-z.pdf
- **Method**: Each patient's health record codes form a set, embedded with multi-head attention without positional embeddings. The model was validated retrospectively and then prospectively.
- **Key results**: The set embedding predicts postoperative pain better than the baselines and holds in a prospective cohort. Code is released.
- **P1**: permutation-invariant set encoder. A set of codes maps to a patient's outcome.
- **P2**: permutation invariance. Attention without positional terms ignores code order.
- **P3**: not addressed.
- **Relevance**: It shows a set encoder for a subject-level clinical outcome with prospective validation.
- **Quality**: High (14). OpenAlex 27 citations, percentile 98 to 99. Prospective validation.
- **Potential use**: The section on P1, prospective validation of a set encoder.

### de_Vente_2024: de Vente et al. (2024). Uncertainty-aware multiple-instance learning for reliable classification: Application to optical coherence tomography.
- **Type**: Journal article (Medical Image Analysis).
- **Read from**: https://pure.uva.nl/ws/files/233416237/1-s2.0-S1361841524001841-main.pdf
- **Method**: UBIX. At inference, instances whose uncertainty is high are excluded before multiple-instance pooling, with OCT B-scans as instances of a volume.
- **Key results**: Under artefacts, UBIX keeps kappa between 0.861 and 0.708, where the plain model falls from 0.852 to 0.084. Code is public.
- **P1**: permutation-invariant set encoder. A volume's slices form a bag mapped to a diagnosis.
- **P2**: permutation invariance. Pooling over slices does not depend on their order.
- **P3**: not addressed.
- **Relevance**: It shows how a set encoder for a subject can be made robust to corrupted instances.
- **Quality**: High (14). OpenAlex 15 citations, percentile 88 to 99. Code public.
- **Potential use**: The section on P1, robustness of set encoders.

### Karimzadeh_2026: Karimzadeh et al. (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study.
- **Type**: Journal article (Physics in Medicine and Biology).
- **Read from**: https://iopscience.iop.org/article/10.1088/1361-6560/ae7955/pdf
- **Method**: Each patient is an unordered set of lesion-level PET radiomic vectors from semi-automatically delineated lesions. Deep Sets, Set Transformer, multiple-instance learning, a Transformer and a graph network are compared on 151 patients with 80 external patients. Lesion coordinates after rigid registration to a common space are an optional added input, and test-time augmentation is used.
- **Key results**: The set models reach an AUC up to 0.91 and beat pooled radiomics baselines, on internal and external data. Code is at github.com/rezakarimzadeh/DeepRadiomics.
- **P1**: permutation-invariant set encoder. A set of lesions maps to a lymphoma class.
- **P2**: permutation invariance. Lesions need no matching across patients; location enters only as coordinates after rigid registration.
- **P3**: builds on radiomics features. It also builds on lesion segmentation and uses rigid registration for the coordinates.
- **Relevance**: It is the closest work to the question: several set encoders compared on lesion sets with external validation.
- **Quality**: High (14). OpenAlex 0 citations with no percentile range; ranked among the theme-3 sources of 2025 to 2026, so 2 points. Multi-center, code public.
- **Potential use**: The section on P1 and P3, the reference comparison of set encoders on lesion radiomics.

### Chen_2021: Chen et al. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper (MICCAI 2021, Lecture Notes in Computer Science); earlier version arXiv 2012.06875
- **Read from**: https://arxiv.org/html/2012.06875
- **Method**: An autoencoder trained jointly with a multiple-instance network on the radiomic features of all liver metastases of a patient from contrast-enhanced MRI, with a two-step feature normalization.
- **Key results**: AUC 0.70 for outcome, 11.4 percent above the best baseline, in a cohort of 50 patients with 181 lesions. Ablations show the gain from using all lesions and from the normalization; a Keras implementation is released.
- **P1**: permutation-invariant set encoder. Multiple-instance pooling aggregates the lesion embeddings.
- **P2**: permutation invariance. Each patient is a bag of lesions with no order.
- **P3**: builds on radiomics features. Handcrafted features of segmented lesions are the input that the autoencoder compresses.
- **Relevance**: A learned aggregation over multifocal lesions for survival, compared with fixed aggregations.
- **Quality**: High (13). Released code; small single cohort.
- **Potential use**: The section on set-based prediction from lesion sets.

### Chen_2022: Chen et al. (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics.
- **Type**: Journal article (Medical Physics)
- **Read from**: the Europe PMC full text of PMC9310706, https://europepmc.org/article/PMC/PMC9310706
- **Method**: Attention-based multiple-instance learning over the radiomic vectors of all nodules of a patient, with an oversampling strategy, on 110 LIDC-IDRI subjects with 310 nodules.
- **Key results**: Mean accuracy 0.807 and AUC 0.842, above other multiple-instance methods. The attention weights indicate the importance of each nodule for the diagnosis.
- **P1**: permutation-invariant set encoder. Attention pooling maps the nodule set of a patient to one diagnosis.
- **P2**: permutation invariance. Nodules are an unordered bag, so no correspondence between patients is needed.
- **P3**: builds on radiomics features. PyRadiomics features of the annotated nodules are the instances.
- **Relevance**: An early set encoder over lesion radiomics for a patient-level label.
- **Quality**: High (13). Public data and released code; one dataset with internal cross-validation.
- **Potential use**: The section on set-based prediction from lesion sets.

### Thiery_2025: Thiery et al. (2025). PET-based lesion graphs meet clinical data: An interpretable cross-attention framework for DLBCL treatment response prediction.
- **Type**: Journal article (Computerized Medical Imaging and Graphics); earlier version arXiv 2310.16863 (a workshop paper)
- **Read from**: https://hal.science/hal-04703974v1/file/Article_journal-1.pdf
- **Method**: Each patient's PET lesions form a graph processed by a graph neural network, with cross-attention to clinical data, on 545 patients with diffuse large B-cell lymphoma.
- **Key results**: It predicts 2-year progression-free survival better than models with clinical data or lesion features alone. The attention weights show which lesions and clinical variables drive the prediction.
- **P1**: other. A graph network over a lesion graph with a clinical fusion.
- **P2**: permutation invariance. Graph pooling over lesions gives an output independent of lesion order; edges carry the lesion relations.
- **P3**: builds on lesion or region segmentation.
- **Relevance**: It handles the lesion set with a graph structure rather than matching lesions across patients.
- **Quality**: High (15). OpenAlex 11 citations, percentile 97 to 99. Large multi-center trial cohort.
- **Potential use**: The section on P1, lesion graphs as an alternative to plain sets.

### Zhang_2025: Zhang et al. (2025). Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation.
- **Type**: Chapter (MICCAI 2025, Lecture Notes in Computer Science).
- **Read from**: the abstract on https://link.springer.com/chapter/10.1007/978-3-032-04927-8_31 (no text was reachable)
- **Method**: LAMP. It fuses each lesion's features with its anatomical context and aggregates the lesions by attention, on 229 lymphoma patients.
- **Key results**: C-index of 0.791 for progression-free and 0.828 for overall survival, above the baselines the abstract names.
- **P1**: permutation-invariant set encoder. Attention aggregates a patient's lesions.
- **P2**: permutation invariance. The lesions are aggregated by attention, with anatomical context as a lesion feature.
- **P3**: [GAP: P3]
- **Relevance**: It adds anatomical context to each lesion of a set model instead of matching lesions across patients.
- **Quality**: High (13). OpenAlex 2 citations, percentile 94 to 96. Assessed from the abstract alone.
- **Potential use**: The section on P2, anatomical context as a lesion feature.

### Liu_2018: Liu et al. (2018). Landmark-based deep multi-instance learning for brain disease diagnosis.
- **Type**: Journal article (Medical Image Analysis).
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC6203325/
- **Method**: Landmarks are found in the Colin27 template space by linear and nonlinear registration and Hotelling T2 tests. At test time a regression forest detects them, and the patches at the landmarks go to a multi-instance CNN. It is evaluated on 1526 subjects from ADNI-1, ADNI-2 and MIRIAD.
- **Key results**: It classifies Alzheimer's disease and mild cognitive impairment conversion better than voxel-, region- and patch-based baselines.
- **P1**: other. A multi-instance CNN over patches placed at registered landmarks.
- **P2**: registration to a common space. Correspondence comes from landmarks defined after registration to a template.
- **P3**: builds on registration.
- **Relevance**: It is the registration-based counterpart of the registration-free set encoders.
- **Quality**: High (15). OpenAlex 455 citations, percentile 89 to 100. Three cohorts.
- **Potential use**: The section on P2 and P3, the registered baseline for a head-to-head comparison.

### Zwanenburg_2020: Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping.
- **Type**: Journal article (Radiology)
- **Read from**: the abstract at https://doi.org/10.1148/radiol.2020191145 (the repository copy answered 403, and no other copy was found)
- **Method**: A three-phase consensus study in which 25 teams computed radiomic features on a digital phantom, then on a lung cancer CT with set processing, then on CT, PET and MRI of 51 soft-tissue sarcoma patients.
- **Key results**: 169 of 174 features were standardized, with strong or better consensus for 95.1 percent of phase I and 90.6 percent of phase II feature values. In phase III, 166 features were reproduced on CT and 164 each on PET and MRI.
- **P1**: not addressed
- **P2**: not addressed
- **P3**: builds on radiomics features. The study fixes the definitions of the handcrafted features that lesion-level pipelines extract and then aggregate.
- **Relevance**: It sets the reference definitions that any pipeline building on handcrafted radiomics refers to, and it is cited by three of the core papers.
- **Quality**: High (15). A multi-team, multi-modality validation; read from the abstract alone.
- **Potential use**: The section on the radiomics step of the pipeline.

### Aerts_2014: Aerts et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Type**: Journal article (Nature Communications)
- **Read from**: https://www.nature.com/articles/ncomms5006.pdf
- **Method**: A radiomic analysis of 440 CT features of intensity, shape and texture in 1,019 patients with lung or head-and-neck cancer, with independent validation cohorts and a radiogenomic analysis.
- **Key results**: Many features were prognostic in independent lung and head-and-neck cohorts. A prognostic signature capturing intratumour heterogeneity was associated with gene-expression patterns.
- **P1**: other. A single-tumour radiomic signature is fed to a survival model, so the predictor never sees a set of lesions.
- **P2**: not addressed
- **P3**: builds on radiomics features. Features are computed inside delineated tumour volumes and the signature is built from them.
- **Relevance**: The foundational radiomics study from which the multi-lesion aggregation work starts; it is seminal and cited by three core papers.
- **Quality**: High (14). Large cohorts with independent validation; one tumour per patient.
- **Potential use**: The section on the radiomics step of the pipeline.

### Geady_2025: Geady et al. (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review.
- **Type**: Journal article (BMC Cancer; a review with replication)
- **Read from**: the abstract at https://doi.org/10.1186/s12885-025-13850-5 (the publisher's page answered with a script challenge, the medRxiv version with 403)
- **Method**: A literature search for multi-lesion radiomic methods, followed by replication of ten aggregation methods on three datasets (16,894 lesions in 3,930 patients) with Cox models benchmarked against total tumour volume.
- **Key results**: No method was best on every dataset. Averaging led in colorectal liver metastases (197 patients), concatenation in soft-tissue sarcoma (545 patients), and total tumour volume stayed a strong predictor in head-and-neck cancer (3,188 patients).
- **P1**: other. Fixed aggregations of lesion features (averages, concatenation, lesion selection) feed a Cox model.
- **P2**: other. Lesions are summarized or selected per patient, so no correspondence between lesions of different patients is formed.
- **P3**: builds on radiomics features. Every method compared takes handcrafted features of segmented lesions as input.
- **Relevance**: It replicates the aggregation methods on shared datasets, which sets a benchmark for any new method that works on lesion sets.
- **Quality**: High (14). Three public or trial datasets and replicated code; read from the abstract alone.
- **Potential use**: The section on radiomic aggregation across lesions.

### Kovacs_2023: Kovacs et al. (2023). Addressing image misalignments in multi-parametric prostate MRI for enhanced computer-aided diagnosis of prostate cancer.
- **Type**: Journal article (Scientific Reports)
- **Read from**: https://www.nature.com/articles/s41598-023-46747-z.pdf
- **Method**: An nnU-Net based detector of clinically significant prostate cancer trained on 625 biparametric MRI exams, comparing no registration, B-spline registration, misalignment augmentation during training, and registration with augmentation, on an independent multicentric test set of 129 exams.
- **Key results**: Registration alone and augmentation alone did not differ significantly from the unregistered model (p = 0.31 and p = 0.11). Registration combined with augmentation reached the highest AUROC, significantly above the unregistered model (p = 0.02).
- **P1**: other. A convolutional detector over aligned image volumes, with no set of lesions as input.
- **P2**: registration to a common space. Sequences are co-registered by B-spline registration, and augmentation simulates the residual misalignment.
- **P3**: builds on registration. The best result kept the registration step and added augmentation for its remaining errors.
- **Relevance**: It measures what the registration step contributes to a downstream diagnosis and tests a way to train without it.
- **Quality**: High (14). Independent multicentric test set and released augmentation code.
- **Potential use**: The section on the registration step of the pipeline.

### Hering_2024: Hering et al. (2024). Deformable MRI Sequence Registration for AI-Based Prostate Cancer Diagnosis.
- **Type**: Conference paper; earlier version arXiv 2404.09666
- **Read from**: https://arxiv.org/html/2404.09666
- **Method**: Deformable registration of T2-weighted to ADC images before the PI-CAI AI system, with registration accuracy measured on 473 annotated cases and diagnosis on 546 external cases.
- **Key results**: Synthetic severe misalignment lowered AUROC from 0.793 to 0.720, and extreme misalignment to 0.487. Deformable alignment raised AUROC by 0.3 percent, a difference that was not significant (p = 0.18).
- **P1**: other. A detection model over aligned sequences.
- **P2**: registration to a common space. The sequences of one patient are aligned deformably.
- **P3**: builds on registration. Registration is kept as a preprocessing step and evaluated by its effect on diagnosis.
- **Relevance**: It quantifies how much a downstream model depends on alignment, which is the question a registration-free method answers.
- **Quality**: High (14). Large external test set; one AI system evaluated.
- **Potential use**: The section on the registration step of the pipeline.

### van_Griethuysen_2017: van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Type**: Journal article (Cancer Research; a software paper)
- **Read from**: the abstract at https://doi.org/10.1158/0008-5472.can-17-0339 (the publisher's PDF and PMC answered 403 or a bot check; the copy found by web search was a summary page)
- **Method**: A description of PyRadiomics, an open-source Python platform for extracting engineered radiomic features, demonstrated on lung lesions.
- **Key results**: The platform runs standalone or in 3D Slicer, and its source code, documentation and examples are public. It is offered as a reference implementation for radiomic analyses.
- **P1**: not addressed
- **P2**: not addressed
- **P3**: builds on radiomics features. It is the extraction tool used by Karimzadeh_2026, Chen_2022 and Chang_2021.
- **Relevance**: The common extraction tool of the multi-lesion pipelines in this set, cited by four core papers.
- **Quality**: High (13). Widely used open software; read from the abstract alone.
- **Potential use**: The section on the radiomics step of the pipeline.

### Eertink_2022: Eertink et al. (2022). Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features.
- **Type**: Journal article (European Journal of Nuclear Medicine and Molecular Imaging)
- **Read from**: https://link.springer.com/content/pdf/10.1007/s00259-022-05916-4.pdf
- **Method**: 485 radiomic features computed per lesion and at patient level (all lesions as one volume) with IBSI-compliant software in 296 DLBCL patients, with lesion selections (largest, hottest, maximum or median over lesions) and data-reduction methods compared in repeated five-fold cross-validation.
- **Key results**: Models with conventional PET and dissemination features gave the highest cross-validated AUC (0.72 to 0.75). No lesion selection beat the group's earlier model; no external validation was done.
- **P1**: other. Selected or pooled lesion features feed logistic models.
- **P2**: other. All lesions are merged into one volume or one lesion is selected, which avoids correspondence.
- **P3**: builds on lesion or region segmentation. Every feature set depends on the delineation of all lesions, and dissemination features use their spatial spread.
- **Relevance**: It compares lesion-selection strategies against patient-level features in a large trial cohort.
- **Quality**: High (13). Trial data and repeated cross-validation; no external cohort.
- **Potential use**: The section on radiomic aggregation across lesions.

### Wilk_2025: Wilk et al. (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: Finding a strategy of aggregating lesions.
- **Type**: Journal article; earlier version arXiv 2405.17668
- **Read from**: https://arxiv.org/html/2405.17668
- **Method**: Feature aggregation (largest lesion, weighted mean, diversity indices) and risk aggregation (mean, maximum, volume-weighted mean of lesion risks) across survival models, in 115 NSCLC patients with Monte Carlo cross-validation.
- **Key results**: Using all lesions raised the c-index above the primary-tumour model in every survival model, from 0.611 to 0.632 on PET features. Risk aggregation tended to do better than feature aggregation.
- **P1**: other. Fixed aggregations of lesion features or of lesion risks.
- **P2**: other. Lesions are ordered by volume or their risks are averaged, so no correspondence is formed.
- **P3**: builds on radiomics features. The input is a radiomic vector per segmented lesion.
- **Relevance**: It separates aggregation of features from aggregation of predictions, two choices any lesion-set method makes.
- **Quality**: High (13). Many models compared; single cohort.
- **Potential use**: The section on radiomic aggregation across lesions.

### Siless_2020: Siless et al. (2020). Registration-free analysis of diffusion MRI tractography data across subjects through the human lifespan.
- **Type**: Journal article (NeuroImage)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC8482444/
- **Method**: Streamlines are clustered within each subject by the anatomical structures around them, and clusters are matched across subjects and hemispheres by an extended anatomical similarity, in 184 subjects aged 8 to 90.
- **Key results**: The anatomical similarity gave better cross-subject correspondence than Euclidean distance. Microstructure trajectories were fitted across the lifespan for 200 matched clusters.
- **P1**: other. Matched clusters feed per-cluster regression on age.
- **P2**: other. Correspondence comes from anatomical neighbourhood labels instead of coordinates.
- **P3**: removes registration. No inter-subject or inter-hemispheric registration is computed.
- **Relevance**: A registration-free way of building correspondence between region sets of different subjects.
- **Quality**: High (13). A large lifespan cohort; no outcome prediction.
- **Potential use**: The section on registration-free correspondence.

### Gerber_2023: Gerber et al. (2023). Optimal transport features for morphometric population analysis.
- **Type**: Journal article (Medical Image Analysis); earlier version arXiv 2208.05891
- **Read from**: https://arxiv.org/html/2208.05891
- **Method**: Unbalanced optimal transport from each subject's tissue image to a template gives mass-allocation and transport-cost images, which enter voxel-wise correlation with clinical variables, on the OASIS-1 Alzheimer's disease study.
- **Key results**: The transport features identified tissue changes that affine-only voxel-based morphometry did not measure, and they separate changes in volume from changes in location. Code is released.
- **P1**: transport distance or transport embedding fed to a predictor. Transport-derived images are the features of the statistical model.
- **P2**: a transport coupling. The transport plan to a template supplies the correspondence that a non-linear registration would otherwise give.
- **P3**: builds on registration. Images are spatially aligned before the transport step, which then absorbs residual misalignment.
- **Relevance**: It uses transport to a template as the correspondence for population analysis of brain images.
- **Quality**: High (13). Released code; association analysis on one dataset.
- **Potential use**: The section on transport-based correspondence.

### arxiv_2111_00648: Shen et al. (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
- **Type**: Conference paper (NeurIPS 2021); earlier version arXiv 2111.00648
- **Read from**: https://arxiv.org/html/2111.00648
- **Method**: Robust optimal transport matching used inside optimization-based and deep registration of point clouds, tested on partial rigid registration, scene flow and lung vascular trees between inspiration and expiration.
- **Key results**: The transport-based methods reached state-of-the-art results on scene flow and lung vessel registration. The authors release PVT1010, 1,010 pairs of lung vascular trees, and code.
- **P1**: not addressed
- **P2**: a transport coupling. A soft transport plan matches the two point clouds before a deformation is fitted.
- **P3**: builds on registration. Transport improves the registration step instead of replacing it.
- **Relevance**: It shows transport couplings as the matching engine for unordered medical point sets.
- **Quality**: High (13). Public dataset and code; no outcome prediction.
- **Potential use**: The section on transport-based correspondence.

### Chang_2021: Chang et al. (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors.
- **Type**: Journal article (Scientific Reports)
- **Read from**: https://www.nature.com/articles/s41598-021-89114-6.pdf
- **Method**: Six aggregations of 851 PyRadiomics features of 3,596 brain metastases in 831 patients, tested with Cox, LASSO Cox and random survival forest models and 100 bootstrap samples.
- **Key results**: The volume-weighted average of the three largest metastases gave the highest c-index in all three models (0.627, 0.628 and 0.652). Patients with 11 or more metastases were best served by the largest lesion plus the number of metastases (0.909).
- **P1**: other. Fixed weighted averages of lesion features feed survival models.
- **P2**: other. Lesions are ranked by volume and averaged, so no correspondence is formed.
- **P3**: builds on radiomics features. Every aggregation takes handcrafted features of manually segmented metastases.
- **Relevance**: The largest comparison of fixed aggregations in one cohort, and a core paper of theme 4.
- **Quality**: High (13). Large cohort and released code; single institution.
- **Potential use**: The section on radiomic aggregation across lesions.

### Salim_2026: Salim et al. (2026). MRI Radiomics for Survival Prediction in Brain Metastases: A Machine Learning Analysis.
- **Type**: Journal article (American Journal of Neuroradiology)
- **Read from**: the abstract at https://doi.org/10.3174/ajnr.A9630 (the publisher's page answered 403, and a web search found no copy)
- **Method**: An elastic-net Cox model on T1 post-contrast radiomics aggregated over the three largest lesions, developed in a public cohort of 198 patients and validated without refitting in an independent cohort of 69 patients.
- **Key results**: The radiomics score had a c-index of 0.615 in training and 0.574 in external validation. Adding the Graded Prognostic Assessment gave 0.591 in the validation subset.
- **P1**: other. A fixed aggregation of the three largest lesions feeds a Cox model.
- **P2**: other. Lesions are selected by size, which avoids correspondence.
- **P3**: builds on radiomics features. Patient-level features are averages of lesion-level handcrafted features.
- **Relevance**: An external test of the three-largest-lesions aggregation that Chang_2021 found best.
- **Quality**: High (13). External validation without refitting; read from the abstract alone.
- **Potential use**: The section on radiomic aggregation across lesions.

### Qahqaie_2026: Qahqaie et al. (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
- **Type**: Conference paper (ISBI 2026); earlier version arXiv 2602.09933
- **Read from**: https://arxiv.org/pdf/2602.09933
- **Method**: Unbalanced optimal transport between baseline and follow-up lesion sets of one patient, with a cost that blends size-normalized geometry, the local Jacobian of a deformable registration and patch appearance, on longitudinal CT of 149 melanoma patients (49 held out).
- **Key results**: The transport matcher gave higher edge-detection precision and recall and higher lesion-graph F1 than distance-only matchers. It recovers one-to-one matches and appearing, disappearing, merging and splitting lesions without retraining.
- **P1**: not addressed
- **P2**: a transport coupling. Unbalanced transport allows unequal lesion mass between time points.
- **P3**: builds on registration. The deformation field of a registration enters the transport cost as a trust weight.
- **Relevance**: A transport coupling over lesion sets, which is the building block a between-patient transport method would use.
- **Quality**: High (12). Public data with a held-out split; four-page paper.
- **Potential use**: The section on transport-based correspondence.

### Sources added by the merge run

The 46 sources below are the 17 theme cuts that entered on merit and the 29 works the merge run found. Each Relevance line names the ground of section 3 under which the source entered.

### Kiers_1999: Kiers et al. (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Type**: Journal article (Journal of Chemometrics)
- **Read from**: https://three-mode.leidenuniv.nl/pdf/k/kierstenbergebro1999jch.pdf
- **Method**: An alternating least squares algorithm that fits the PARAFAC2 model directly, instead of through the cross-product matrices of the indirect fit, with extensions for constraints, missing data and the computation of factor scores.
- **Key results**: The direct fit is more efficient than the indirect fit, and it extends to constraints, missing data and factor scores.
- **P1**: not addressed
- **P2**: other. PARAFAC2 lets one mode differ in size and content across slices and constrains only the cross-products of its loadings, so the rows of that mode are not matched across slices.
- **P3**: not addressed
- **Relevance**: The model with a mode that varies across slices, on which every PARAFAC2 method of theme 1 builds. Entered under ground (a): must-include in theme 1 and in round 1 (cited by 4 core papers).
- **Quality**: High (13). Methodological paper with simulations.
- **Potential use**: The section on P1 and P2, the origin of decompositions with an unaligned mode.

### Perros_2017: Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large and Sparse Data.
- **Type**: Conference paper (KDD 2017)
- **Read from**: https://arxiv.org/html/1703.04219
- **Method**: A scalable PARAFAC2 fit for sparse data, with a parallel algorithm for the costly step of the direct fit, applied to electronic health records where each patient's visits form a slice of its own length.
- **Key results**: SPARTan runs up to 22 times faster than the best earlier implementation and handles data sizes the earlier code could not. The phenotypes it found in pediatric patients were endorsed by clinicians.
- **P1**: tensor decomposition with an unaligned mode. The visit mode differs in length across patients.
- **P2**: other. The PARAFAC2 structure removes the need to align visits across patients.
- **P3**: not addressed
- **Relevance**: It made PARAFAC2 practical for records that do not align in time across subjects. Entered under ground (a): must-include in theme 1 (cited by 4 core papers).
- **Quality**: High (13). Large real data and a clinician review of phenotypes; no outcome prediction.
- **Potential use**: The section on P1, scalable decompositions with an unaligned mode.

### Kolda_2009: Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Type**: Journal article (SIAM Review; a survey)
- **Read from**: https://www.cs.columbia.edu/%7Eblei/fogm/2023F/readings/KoldaBader2009.pdf
- **Method**: A survey of tensor decompositions (CP, Tucker, PARAFAC2, INDSCAL, DEDICOM and others), their fitting algorithms, software and applications.
- **Key results**: It sets the notation and definitions that later tensor regression and decomposition work uses, and it describes PARAFAC2 as the decomposition for slices whose one mode varies in size.
- **P1**: tensor decomposition with an unaligned mode. The survey covers PARAFAC2 among the decompositions.
- **P2**: other. It describes how PARAFAC2 avoids matching the varying mode.
- **P3**: not addressed
- **Relevance**: The reference for the notation of tensor methods. Entered under ground (a): cited by 6 core papers of round 1. It is cited as a survey.
- **Quality**: High (12). A survey; no new experiments.
- **Potential use**: The section on P1, as the survey of tensor decompositions.

### Huang_2026: Huang et al. (2026). Shift-aware sparse kronecker tensor classification.
- **Type**: Journal article (Statistics and Computing)
- **Read from**: https://link.springer.com/content/pdf/10.1007/s11222-026-10892-y.pdf
- **Method**: CS-SKPD, a cyclic-shift logistic sparse Kronecker product decomposition. Shift-aware aligned views of each image enter a low-rank tensor regression, so that a signal displaced across subjects can be captured.
- **Key results**: On OASIS-1 (416 participants) and ADNI-1, with regions of interest from a probabilistic atlas (hippocampus, thalamus, cerebellum, limbic regions), the classifier reaches an AUC of 0.938 to 0.950 across ranks.
- **P1**: multilinear or tensor partial least squares or tensor regression. A low-rank logistic tensor regression predicts the diagnosis.
- **P2**: other. Cyclic shifts inside the model absorb misalignment of the signal across subjects.
- **P3**: builds on lesion or region segmentation. The regions come from a probabilistic atlas.
- **Relevance**: The only tensor regression in the set that models spatial misalignment inside the regression. Entered under ground (c) (2026, relevance 3, 13), and it narrows gap MG3.
- **Quality**: High (13). Two public cohorts; regions from an atlas.
- **Potential use**: The section on P1 and P2, tensor regression with a shift-aware mode.

### Ren_2025b: Ren et al. (2025). Unraveling Complex Temporal Patterns in EHRs via Robust Irregular Tensor Factorization.
- **Type**: Conference paper (AMIA Joint Summits on Translational Science)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC12150736/
- **Method**: REPAR, a robust PARAFAC2 for electronic health records whose temporal factors are regularized by a recurrent network, evaluated on three EHR datasets.
- **Key results**: The factorization improves the predictability of the phenotypes over the PARAFAC2 baselines on the three datasets and is robust to noise in the records.
- **P1**: tensor decomposition with an unaligned mode. The visit mode varies per patient, and the patient factors feed prediction.
- **P2**: other. PARAFAC2 avoids matching visits across patients.
- **P3**: not addressed
- **Relevance**: A recent PARAFAC2 for unaligned records with prediction. Entered under ground (c) (2025, relevance 3, 12).
- **Quality**: High (12). Three datasets; a short proceedings paper.
- **Potential use**: The section on P1, decompositions with an unaligned mode.

### Papastergiou_2018: Papastergiou et al. (2018). Tensor Decomposition for Multiple-Instance Classification of High-Order Medical Data.
- **Type**: Journal article (Complexity)
- **Read from**: the abstract of DOI 10.1155/2018/8651930 (the Hindawi PDF answered 403)
- **Method**: A high-order dictionary learned by tensor decomposition is combined with multiple-instance classification, applied to frailty from multisensor recordings and to breast histopathology.
- **Key results**: The method outperforms or is comparable to the multiple-instance classifiers it is compared with on both applications, and the dictionary handles incomplete data.
- **P1**: tensor decomposition with an unaligned mode. Each subject's instances are summarized through a tensor dictionary before bag classification.
- **P2**: permutation invariance. The multiple-instance step treats each subject's instances as an unordered bag.
- **P3**: not addressed
- **Relevance**: One of the few works that joins a tensor decomposition with a bag of instances per subject. Entered under ground (b): it narrows gap MG3.
- **Quality**: High (12). Assessed from the abstract alone.
- **Potential use**: The section on P1, tensor methods combined with multiple-instance learning.

### Papastergiou_2019: Papastergiou et al. (2019). TensMIL2: Improved Multiple Instance Classification Through Tensor Decomposition and Instance Selection.
- **Type**: Conference paper (EUSIPCO 2019)
- **Read from**: the abstract of DOI 10.23919/eusipco.2019.8902500
- **Method**: Non-negative CP decomposition gives instance features, followed by instance selection and multiple-instance classification, tested on multiple-instance benchmarks including data with 90 percent missing values.
- **Key results**: TensMIL2 performs better than the multiple-instance algorithms it is compared with in most cases, and its CP features beat the earlier features in most cases, on full data and on data with 90 percent missing values.
- **P1**: tensor decomposition with an unaligned mode. CP factors summarize the instances of each bag.
- **P2**: permutation invariance. Bags are unordered sets of instances.
- **P3**: not addressed
- **Relevance**: A tensor decomposition inside a multiple-instance classifier. Entered under ground (b): it narrows gap MG3.
- **Quality**: High (12). Benchmarks only; assessed from the abstract alone.
- **Potential use**: The section on P1, tensor methods combined with multiple-instance learning.

### Afshar_2021: Afshar et al. (2021). SWIFT: Scalable Wasserstein Factorization for Sparse Nonnegative Tensors.
- **Type**: Conference paper (AAAI 2021)
- **Read from**: https://arxiv.org/html/2010.04081
- **Method**: A CP factorization fitted under a Wasserstein loss instead of a least-squares loss, with a scalable solver for sparse nonnegative tensors, evaluated by the downstream prediction of its factors.
- **Key results**: The factors give relative gains of up to 9.65 and 11.31 percent in downstream prediction over the baselines, and 15 and 17 percent under noise.
- **P1**: tensor decomposition with an unaligned mode. The transport loss compares fibres whose entries need not match position by position.
- **P2**: a transport coupling. The loss transports mass between neighbouring entries instead of comparing aligned entries.
- **P3**: not addressed
- **Relevance**: It joins a tensor factorization with a transport cost, the link between themes 1 and 2. Entered under ground (b): it narrows gap MG3.
- **Quality**: High (14). Several datasets and noise tests.
- **Potential use**: The section on P1 and P2, transport losses inside tensor factorization.

### arxiv_2603_06465: Reinhardt et al. (2026). Risk Prediction in Cancer Imaging Using Enriched Radiomics Features.
- **Type**: Preprint (arXiv 2603.06465); Crossref, OpenAlex and arXiv list no published version.
- **Read from**: https://arxiv.org/html/2603.06465
- **Method**: Enriched radiomics from liver MRI. Quantile functional features of the tumour intensity distribution enter an L1 logistic regression, and a Bayesian tensor response regression models the longitudinal change.
- **Key results**: AUC of 0.96 for diagnosis and 0.87 for grade with the enriched features.
- **P1**: multilinear or tensor partial least squares or tensor regression. A tensor response regression models the change over time.
- **P2**: other. Distributional features summarize each tumour without voxel correspondence.
- **P3**: builds on radiomics features. It extends handcrafted features with distributional ones from segmented tumours.
- **Relevance**: A recent tensor regression on radiomic data. Entered under ground (b): it narrows gap MG3.
- **Quality**: Medium (10). Venue 1 (preprint); single cohort.
- **Potential use**: The section on P3, distributional radiomics with tensor regression.

### Peyr__2019: Peyre and Cuturi (2019). Computational Optimal Transport with Applications to Data Sciences.
- **Type**: Journal article (Foundations and Trends in Machine Learning; a survey)
- **Read from**: https://arxiv.org/html/1803.00567
- **Method**: A survey of the computation of optimal transport: linear programs, entropic regularization and Sinkhorn, semi-discrete and sliced methods, barycenters, Gromov-Wasserstein and statistical uses.
- **Key results**: It sets the standard algorithms and notation for transport distances, couplings and barycenters used across theme 2.
- **P1**: transport distance or transport embedding fed to a predictor. The survey covers transport distances and barycenters used as features.
- **P2**: a transport coupling. It defines the couplings that later methods use as a soft correspondence.
- **P3**: not addressed
- **Relevance**: The reference for transport computation. Entered under ground (a): cited by 5 core papers of round 1. It is cited as a survey.
- **Quality**: High (12). A survey.
- **Potential use**: The section on P2, as the survey of computational transport.

### Rubner_2000: Rubner et al. (2000). The Earth Mover's Distance as a Metric for Image Retrieval.
- **Type**: Journal article (International Journal of Computer Vision)
- **Read from**: the abstract on the Springer page of DOI 10.1023/a:1026543900054
- **Method**: Image distributions are represented by vector quantization, and the distance between two of them is the minimal cost of transforming one into the other, the Earth Mover's Distance, solved as a transportation problem.
- **Key results**: The framework often accounts for perceptual similarity better than earlier distances, allows partial matching, and works on representations of variable length. It is compared with other distances on colour and texture retrieval.
- **P1**: transport distance or transport embedding fed to a predictor. The distance between sets ranks images.
- **P2**: a transport coupling. The optimal flow matches clusters of two images without a fixed correspondence.
- **P3**: not addressed
- **Relevance**: The first use of a transport distance between unaligned sets of features in imaging. Entered under ground (a): cited by 3 core papers of round 1, and seminal.
- **Quality**: High (13). Assessed from the abstract.
- **Potential use**: The section on P2, the origin of transport between feature sets.

### arxiv_1807_00094: Zhang et al. (2018). Classification of lung nodules in CT images based on Wasserstein distance in differential geometry.
- **Type**: Preprint (arXiv 1807.00094); Crossref, OpenAlex and Semantic Scholar list no published version.
- **Read from**: https://arxiv.org/html/1807.00094
- **Method**: Each lung nodule surface is mapped to the unit sphere, the area distortion of the mapping gives a probability measure on the sphere, and nodules are compared by a spherical optimal mass transport distance, which is invariant to rigid motion and scaling.
- **Key results**: Transport distances to known benign and malignant nodules classify new nodules, and the spherical transport algorithm is reported as more accurate and efficient than earlier transport computations. The authors describe it as the first use of a Wasserstein distance for lung nodule classification.
- **P1**: transport distance or transport embedding fed to a predictor. Distances between nodules feed a classifier.
- **P2**: a transport coupling. The transport plan on the sphere replaces a point correspondence between nodules.
- **P3**: builds on lesion or region segmentation. The nodule surface comes from a segmentation.
- **Relevance**: A transport distance between lesions of different patients for a diagnosis. Entered under ground (b): it narrows gap MG1.
- **Quality**: Medium (9). Venue 1 (preprint); citation item 1.
- **Potential use**: The section on P1, transport distances between lesions.

### Zhu_2024: Zhu et al. (2024). Wasserstein HOG: Local Directionality Extraction via Optimal Transport.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC11037420/
- **Method**: Each image patch is transported to an iso-intense patch of its mean, and the transport plan is split into directional sub-costs, which give a histogram of local directionality and its entropy as radiomic features.
- **Key results**: Higher entropy goes with worse overall survival in glioblastoma MRI, head-and-neck CT and lung immunotherapy CT. For the longitudinal change in lung cancer, the hazard ratio is 1.95 (95% CI 1.4 to 2.8).
- **P1**: transport distance or transport embedding fed to a predictor. Transport-based features feed survival models.
- **P2**: other. The features are computed per patch, so no correspondence across patients is formed.
- **P3**: removes handcrafted radiomics features. The transport features replace gradient-based texture descriptors.
- **Relevance**: Transport-derived radiomic features with a survival outcome in three cohorts. Entered under ground (c) (2024, relevance 3, 13).
- **Quality**: High (13). Three cohorts; association analyses.
- **Potential use**: The section on P3, transport features in place of handcrafted ones.

### Wang_2024b: Wang and Fan (2024). Graph Classification via Reference Distribution Learning: Theory and Practice.
- **Type**: Conference paper (NeurIPS 2024)
- **Read from**: https://arxiv.org/html/2408.11370
- **Method**: GRDL treats the node embeddings of each graph as a discrete distribution and classifies it by its maximum mean discrepancy to reference distributions learned for each class, with generalization bounds.
- **Key results**: GRDL beats graph pooling baselines on benchmark graphs and runs at least 10 times faster than transport-based graph methods.
- **P1**: transport barycenter or dictionary with learnable templates. Learned reference distributions act as class templates.
- **P2**: a learned template or barycenter. Each graph is compared with templates instead of with other graphs.
- **P3**: not addressed
- **Relevance**: Learned templates for unordered node sets, the structure gap MG1 asks for across patients. Entered under ground (c) (2024, relevance 3, 13), and it narrows gap MG1.
- **Quality**: High (13). Theory and benchmarks.
- **Potential use**: The section on P2, learned templates for set-valued data.

### arxiv_2407_00224: Song et al. (2024). Multimodal Prototyping for cancer survival prediction.
- **Type**: Conference paper (ICML 2024), from its proceedings page https://proceedings.mlr.press/v235/song24b.html
- **Read from**: https://arxiv.org/html/2407.00224
- **Method**: MMP summarizes each whole-slide image by morphological prototypes, fitted as a Gaussian mixture over its patches, and each transcriptomic profile by pathway prototypes, with Transformer or transport cross-alignment fusion for survival.
- **Key results**: More than 300 times compression of the slide, and better survival prediction than the baselines on six cancer types. Code is released.
- **P1**: transport barycenter or dictionary with learnable templates. Shared prototypes define a fixed-size representation.
- **P2**: a learned template or barycenter. Every patient's patches are expressed against the same prototypes.
- **P3**: not addressed
- **Relevance**: A template-based summary of unordered patches for a subject-level outcome. Entered under ground (c) (2024, relevance 3, 13), and it narrows gap MG1.
- **Quality**: High (13). Six cancer types and code.
- **Potential use**: The section on P2, prototypes as a shared template.

### arxiv_2502_04907: Gachon et al. (2025). Scalable Learning from Probability Measures with Mean Measure Quantization.
- **Type**: Preprint (arXiv 2502.04907); OpenAlex names TMLR as its venue, which no other record confirmed.
- **Read from**: https://arxiv.org/html/2502.04907
- **Method**: MMQ quantizes all input measures on a shared support of K points, fitted to the mean measure, so that transport-based learning on many measures becomes cheap.
- **Key results**: The quantized measures keep consistency guarantees for transport downstream tasks, and classification accuracy stays close to that of the full measures.
- **P1**: transport distance or transport embedding fed to a predictor. Quantized measures are compared by transport.
- **P2**: a learned template or barycenter. The shared support plays the role of a template.
- **P3**: not addressed
- **Relevance**: A shared support for many unaligned point sets. Entered under ground (c) (2025, relevance 3, 13).
- **Quality**: High (13). Theory and experiments.
- **Potential use**: The section on P2, shared supports for measures.

### Belkhatir_2022: Belkhatir et al. (2022). Wasserstein-based texture analysis in radiomic studies.
- **Type**: Journal article (Computerized Medical Imaging and Graphics)
- **Read from**: the abstract of DOI 10.1016/j.compmedimag.2022.102129
- **Method**: Wasserstein distances between each patient's gray-level co-occurrence matrices and reference matrices, chosen per class by Bayesian optimization, are the features of a support vector machine, applied to the diagnosis of COVID-19 from CT.
- **Key results**: The pipeline is compared with SVMs on statistical texture features, on optimized spatial features under a Euclidean metric and on non-optimized Wasserstein features, and the authors report that the optimized Wasserstein features show the most promise on unseen CT images. MATLAB code is released.
- **P1**: transport distance or transport embedding fed to a predictor.
- **P2**: a learned template or barycenter. The reference matrices are chosen as templates.
- **P3**: builds on radiomics features. The co-occurrence matrices are a radiomic step.
- **Relevance**: Transport distances to references as radiomic features. Entered under ground (c) (2022, relevance 3, 12), and it narrows gap MG1.
- **Quality**: High (12). Assessed from the abstract alone.
- **Potential use**: The section on P3, transport applied to radiomic matrices.

### Zhu_2026: Zhu et al. (2026). M2OTCA: Multiple-magnification optimal transport-based cross-attention learning for whole slide image classification.
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: the abstract of DOI 10.1016/j.media.2026.104082 (no text was reachable)
- **Method**: Optimal transport matches the feature distributions of one slide across magnifications, with region prototypes and cross-attention, for slide classification.
- **Key results**: It beats the multiple-instance baselines on four slide datasets.
- **P1**: permutation-invariant set encoder. Patch sets are pooled into a slide prediction.
- **P2**: a transport coupling. Transport aligns the patch sets of two magnifications.
- **P3**: not addressed
- **Relevance**: Transport between unordered patch sets inside a set encoder. Entered under ground (c) (2026, relevance 3, 12), and it narrows gap MG1.
- **Quality**: High (12). Assessed from the abstract alone.
- **Potential use**: The section on P2, transport inside a set encoder.

### Cui_2023: Cui et al. (2023). Retrieval-Augmented Multiple Instance Learning.
- **Type**: Conference paper (NeurIPS 2023)
- **Read from**: https://discovery.ucl.ac.uk/10181255/1/8098_retrieval_augmented_multiple_i.pdf
- **Method**: RAM-MIL uses an optimal transport distance between bags to retrieve the nearest neighbours of a bag and merges their representations into the bag's own, to counter the loss of accuracy on out-of-domain test slides.
- **Key results**: The authors report state-of-the-art slide classification within the training domain and out of domain.
- **P1**: permutation-invariant set encoder. An attention encoder pools each bag.
- **P2**: a transport coupling. Transport compares the instance sets of two bags without a correspondence.
- **P3**: not addressed
- **Relevance**: A transport coupling between the bags of two subjects. Entered under ground (b): it narrows gap MG1.
- **Quality**: High (13). Public benchmarks.
- **Potential use**: The section on P2, transport between subjects' bags.

### Quellec_2017: Quellec et al. (2017). Multiple-Instance Learning for Medical Image and Video Analysis.
- **Type**: Journal article (IEEE Reviews in Biomedical Engineering; a review)
- **Read from**: the abstract of DOI 10.1109/rbme.2017.2651164
- **Method**: A review of 73 papers on multiple-instance learning for medical images and videos.
- **Key results**: Multiple-instance learning needs no manual segmentation, since it learns from labels of whole images or videos and detects the relevant patterns locally. The compiled experiments show it is also more accurate than single-instance learning in many cases.
- **P1**: permutation-invariant set encoder. The review covers bag classifiers.
- **P2**: permutation invariance.
- **P3**: removes handcrafted radiomics features. The review stresses that multiple-instance learning removes the need for lesion segmentation; the closed list holds no value for removing segmentation, so the nearest value is given.
- **Relevance**: The review of multiple-instance learning in medical imaging. Entered under ground (a): cited by 4 core papers of round 1. It is cited as a review.
- **Quality**: High (12). A review; assessed from the abstract.
- **Potential use**: The section on P3, as the review of multiple-instance learning in medicine.

### Wang_2018: Wang et al. (2018). Revisiting multiple instance neural networks.
- **Type**: Journal article (Pattern Recognition)
- **Read from**: https://arxiv.org/pdf/1610.02501
- **Method**: MI-Net, multiple-instance networks that learn a bag representation, with deep supervision and residual connections, compared with instance-space networks.
- **Key results**: The bag-representation networks reach better accuracy than earlier multiple-instance methods on the standard benchmarks and run fast.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance. Max or mean pooling over instances.
- **P3**: not addressed
- **Relevance**: An early deep set encoder for bags. Entered under ground (a): cited by 3 core papers of round 1.
- **Quality**: High (13). Benchmarks only.
- **Potential use**: The section on P1, early deep multiple-instance networks.

### Li_2021: Li et al. (2021). Dual-stream Multiple Instance Learning Network for Whole Slide Image Classification with Self-supervised Contrastive Learning.
- **Type**: Conference paper (CVPR 2021)
- **Read from**: https://arxiv.org/html/2011.08939
- **Method**: DSMIL combines a max-pooling stream with a stream that weights every instance by its trainable distance to the critical instance, on features learned by self-supervised contrastive learning.
- **Key results**: It beats earlier multiple-instance methods on CAMELYON16 and TCGA lung cancer and comes close to fully supervised models.
- **P1**: permutation-invariant set encoder.
- **P2**: other. Each instance is weighted by its distance to the critical instance of the same bag, a within-bag reference.
- **P3**: not addressed
- **Relevance**: A widely used set encoder for slides. Entered under ground (a): cited by 3 core papers in round 2.
- **Quality**: High (14). Public benchmarks and code.
- **Potential use**: The section on P1, slide-level set encoders.

### Zhang_2022: Zhang et al. (2022). DTFD-MIL: Double-Tier Feature Distillation Multiple Instance Learning for Histopathology Whole Slide Image Classification.
- **Type**: Conference paper (CVPR 2022)
- **Read from**: https://arxiv.org/html/2203.12081
- **Method**: Each slide is split into pseudo-bags, a first tier classifies the pseudo-bags, and a second tier pools features distilled from them.
- **Key results**: Better AUC than earlier multiple-instance methods on CAMELYON16 and TCGA lung cancer. Code is on GitHub.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance. Pseudo-bags are random subsets of an unordered bag.
- **P3**: not addressed
- **Relevance**: A set encoder that copes with few bags and many instances. Entered under ground (a): cited by 3 core papers in round 2.
- **Quality**: High (14). Public benchmarks and code.
- **Potential use**: The section on P1, slide-level set encoders.

### Dietterich_1997: Dietterich et al. (1997). Solving the multiple instance problem with axis-parallel rectangles.
- **Type**: Journal article (Artificial Intelligence)
- **Read from**: https://web.engr.oregonstate.edu/~tgd/publications/aij-musk-corrected.pdf
- **Method**: It defines the multiple-instance problem on drug activity, where a molecule is a bag of conformations, and learns axis-parallel rectangles that hold at least one instance of each positive bag.
- **Key results**: Algorithms that ignore the multiple-instance structure perform very poorly. The algorithm that identifies the responsible instances performs best, with 89 percent correct predictions on musk-odor prediction.
- **P1**: other. Axis-parallel rectangles, not a set encoder.
- **P2**: permutation invariance. A bag is positive when any of its instances falls in the rectangle.
- **P3**: not addressed
- **Relevance**: The paper that defines multiple-instance learning. Entered under ground (a): cited by 3 core papers in round 2, and seminal.
- **Quality**: High (13). Seminal; one domain.
- **Potential use**: The section on P1, the origin of multiple-instance learning.

### Maron_1997: Maron and Lozano-Perez (1997). A Framework for Multiple-Instance Learning.
- **Type**: Conference paper (NeurIPS 1997)
- **Read from**: https://papers.neurips.cc/paper_files/paper/1997/file/82965d4ed8150294d4330ace00821d77-Paper.pdf
- **Method**: Diverse Density, which finds the point in feature space that is close to at least one instance of every positive bag and far from all instances of negative bags.
- **Key results**: Diverse Density learns concepts from bags on the musk data and on stock selection, competitive with the axis-parallel rectangles.
- **P1**: other. A learned concept point, not a set encoder.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: A foundational multiple-instance method. Entered under ground (a): cited by 3 core papers of round 1, and seminal.
- **Quality**: High (12). Seminal; small experiments.
- **Potential use**: The section on P1, the origin of multiple-instance learning.

### Andrews_2002: Andrews et al. (2002). Support Vector Machines for Multiple-Instance Learning.
- **Type**: Conference paper (NeurIPS 2002)
- **Read from**: https://papers.neurips.cc/paper_files/paper/2002/file/3e6260b81898beacda3d16db379ed329-Paper.pdf
- **Method**: MI-SVM and mi-SVM, which cast multiple-instance learning as mixed integer quadratic programs at the bag and the instance level, solved by heuristics.
- **Key results**: Both formulations are evaluated on drug activity, image indexing and document categorization.
- **P1**: other. Support vector machines with bag constraints.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: The margin-based multiple-instance methods that later baselines use. Entered under ground (a): must-include in theme 3 (cited by 3 core papers) and seminal (1603 citations).
- **Quality**: High (13). Three domains.
- **Potential use**: The section on P1, classical multiple-instance methods.

### Gaertner_2002: Gaertner et al. (2002). Multi-Instance Kernels.
- **Type**: Conference paper (ICML 2002)
- **Read from**: the abstract on https://research-information.bris.ac.uk/en/publications/multi-instance-kernels/
- **Method**: A kernel on bags built from a kernel on instances, so that any kernel method can learn from bags.
- **Key results**: The kernel is shown to separate positive and negative sets under natural assumptions, and it compares favourably with the multi-instance algorithms of its time in an empirical study.
- **P1**: other. A set kernel for a kernel machine.
- **P2**: permutation invariance. The kernel sums over instance pairs, so order plays no role.
- **P3**: not addressed
- **Relevance**: The set kernel that kernel mean embeddings of sets build on. Entered under ground (a): cited by 3 core papers in round 4.
- **Quality**: High (13). Assessed from the abstract.
- **Potential use**: The section on P1, kernels on sets.

### Carbonneau_2018: Carbonneau et al. (2018). Multiple instance learning: A survey of problem characteristics and applications.
- **Type**: Journal article (Pattern Recognition; a survey)
- **Read from**: https://arxiv.org/html/1612.03365
- **Method**: A survey that sorts multiple-instance problems by their characteristics (prediction level, bag composition, label ambiguity, data distributions) and compares 16 methods on them.
- **Key results**: The comparison shows that the performance of each method depends on the characteristics of the problem, such as the witness rate (the share of positive instances in a positive bag).
- **P1**: permutation-invariant set encoder. The survey covers bag classifiers.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: The survey of multiple-instance problem types. Entered under ground (a): cited by 3 core papers in round 3. It is cited as a survey.
- **Quality**: High (14). A survey with a comparative experiment.
- **Potential use**: The section on P1, as the survey of multiple-instance learning.

### Chikontwe_2020: Chikontwe et al. (2020). Multiple Instance Learning with Center Embeddings for Histopathology Classification.
- **Type**: Conference paper (MICCAI 2020)
- **Read from**: the abstract on the Springer page of DOI 10.1007/978-3-030-59722-1_50
- **Method**: Instance and bag embeddings learned jointly, with a center loss that pulls the embeddings of each class together, for histopathology slides.
- **Key results**: It beats the multiple-instance baselines on colon cancer datasets.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: A set encoder for slides. Entered under ground (a): cited by 3 core papers in round 2.
- **Quality**: High (12). Assessed from the abstract.
- **Potential use**: The section on P1, slide-level set encoders.

### Hou_2016: Hou et al. (2016). Patch-Based Convolutional Neural Network for Whole Slide Tissue Image Classification.
- **Type**: Conference paper (CVPR 2016)
- **Read from**: https://arxiv.org/html/1504.07947
- **Method**: A patch-level CNN with an expectation-maximization step that selects discriminative patches, and a decision fusion model that turns patch predictions into a slide label.
- **Key results**: Glioma and non-small-cell lung cancer subtypes are classified with an accuracy close to the agreement between pathologists.
- **P1**: other. Patch predictions are fused by a second-level model.
- **P2**: other. Patch-level histograms of predicted classes are fused, with no correspondence among patches.
- **P3**: not addressed
- **Relevance**: An early subject-level prediction from unordered patches. Entered under ground (a): cited by 3 core papers in round 3.
- **Quality**: High (14). TCGA slides of two cancer types.
- **Potential use**: The section on P1, early patch-based slide models.

### arxiv_1910_10825: Lu et al. (2019). Semi-Supervised Histology Classification using Deep Multiple Instance Learning and Contrastive Predictive Coding.
- **Type**: Preprint (arXiv 1910.10825); the Crossref record of DOI 10.1117/12.2549627 is a recorded SPIE 2020 conference presentation with 3 authors, which is not taken as the published version.
- **Read from**: https://arxiv.org/html/1910.10825
- **Method**: Contrastive predictive coding learns patch features without labels, and attention-based multiple-instance learning pools them into a slide label.
- **Key results**: Breast histology classification with 95 percent accuracy and an AUC of 0.968.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: An early pairing of self-supervised features with attention pooling. Entered under ground (a): cited by 3 core papers in round 3.
- **Quality**: Medium (11). Venue 1 (preprint).
- **Potential use**: The section on P1, self-supervised features for set encoders.

### Feng_2017: Feng and Zhou (2017). Deep MIML Network.
- **Type**: Conference paper (AAAI 2017)
- **Read from**: the abstract of DOI 10.1609/aaai.v31i1.10890
- **Method**: DeepMIML, a deep network that learns instance representations for multi-instance multi-label learning, with a sub-concept layer that links instances to labels.
- **Key results**: The network locates the input patterns that trigger each label and performs well across several domains.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: A deep multi-instance network with several labels per bag. Entered under ground (a): cited by 3 core papers in round 3.
- **Quality**: High (12). Assessed from the abstract.
- **Potential use**: The section on P1, deep multiple-instance networks.

### Niu_2026: Niu et al. (2026). AGE-MIL: Anchor-Guided Evidence Learning for Patient-Level Prediction.
- **Type**: Conference paper (MICCAI 2026)
- **Read from**: https://arxiv.org/html/2606.12126
- **Method**: A patient-level anchor is built from the representations of all of a patient's slides and guides the retrieval and integration of relevant patches, and the patient's risk is modelled as an accumulation of evidence.
- **Key results**: It beats eight multiple-instance methods on six tasks in two cohorts.
- **P1**: permutation-invariant set encoder. A patient is a set of slides.
- **P2**: other. The anchor is a within-patient reference against which slides are weighed.
- **P3**: not addressed
- **Relevance**: A patient-level set model over several slides. Entered under ground (c) (2026, relevance 3, 13).
- **Quality**: High (13). Two cohorts.
- **Potential use**: The section on P1, patient-level aggregation of several images.

### Lysukhin_2025: Lysukhin et al. (2025). Multiple-Instance Learning for thyroid gland disease classification: A hands-on experience.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Read from**: the abstract in the Europe PMC record of DOI 10.1016/j.compbiomed.2024.109424
- **Method**: A multiple-instance model trained on weak patient-level labels of 1102 patients with 5104 whole-slide images, without the curation of research datasets.
- **Key results**: The model separates benign from malignant conditions at patient level with an average test F1 of 0.85 (SD 0.05).
- **P1**: permutation-invariant set encoder. A patient's slides form the bag.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: Patient-level prediction from many unordered slides in real-world data. Entered under ground (c) (2025, relevance 3, 12).
- **Quality**: High (12). Large real-world cohort; assessed from the abstract.
- **Potential use**: The section on P1, patient-level set models in practice.

### Wang_2024a: Wang et al. (2024). Rethinking Multiple Instance Learning for Whole Slide Image Classification: A Bag-Level Classifier is a Good Instance-Level Teacher.
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: the publisher's text of DOI 10.1109/TMI.2024.3404549, saved by the theme-3 run
- **Method**: ICMIL iteratively couples the patch embedder and the bag classifier, using the bag classifier as a teacher for instance-level fine-tuning of the embedder.
- **Key results**: It improves several multiple-instance baselines on slide classification benchmarks.
- **P1**: permutation-invariant set encoder.
- **P2**: permutation invariance.
- **P3**: not addressed
- **Relevance**: Training of the instance embedder of a set encoder from bag labels. Entered under ground (c) (2024, relevance 3, 13).
- **Quality**: High (13). Public benchmarks.
- **Potential use**: The section on P1, training set encoders end to end.

### Shan_2022: Shan et al. (2022). Transparent single-cell set classification with kernel mean embeddings.
- **Type**: Conference paper (ACM BCB 2022)
- **Read from**: https://arxiv.org/html/2201.07322
- **Method**: Each patient's cytometry cells form a set, embedded by a kernel mean embedding with random features, and a linear classifier predicts the patient label.
- **Key results**: With a linear classifier, the method reaches accuracies comparable to or better than the gating-free methods it is compared with, and it learns a score for each cell.
- **P1**: other. A kernel mean embedding with a linear classifier.
- **P2**: permutation invariance. The mean embedding does not depend on cell order.
- **P3**: other. Single-cell data, no imaging pipeline.
- **Relevance**: A distribution embedding of unordered sets for a patient outcome. Entered under ground (c) (2022, relevance 3, 13).
- **Quality**: High (13). Several datasets.
- **Potential use**: The section on P1, kernel embeddings of sets.

### Thi_ry_2023: Thiery et al. (2023). Medical Application of Geometric Deep Learning for the Diagnosis of Glaucoma.
- **Type**: Journal article (Translational Vision Science and Technology)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC9940771/
- **Method**: The optic nerve head is segmented in OCT and represented as a point cloud, which PointNet classifies, in 477 glaucoma and 2296 non-glaucoma subjects.
- **Key results**: AUC of 0.95 for PointNet, against 0.87 and 0.91 for 3D CNNs on the images.
- **P1**: permutation-invariant set encoder. PointNet on a point cloud.
- **P2**: permutation invariance.
- **P3**: builds on lesion or region segmentation. The point cloud comes from a tissue segmentation.
- **Relevance**: A clinical point-cloud classifier that beats image-based CNNs. Entered under ground (c) (2023, relevance 3, 12).
- **Quality**: High (12). Large cohort; single site.
- **Potential use**: The section on P1 and P3, point clouds from segmentation.

### Zhang_2020: Zhang et al. (2020). Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach.
- **Type**: Journal article (European Radiology)
- **Read from**: the abstract on the Springer page of DOI 10.1007/s00330-020-06912-8
- **Method**: Tumours of 104 glioblastoma patients are split into subregions by global K-means clusters (294 subregions), and a multiple-instance model on subregion radiomics predicts survival.
- **Key results**: Accuracy of 87.88 percent, sensitivity of 85.71 percent and specificity of 89.47 percent.
- **P1**: other. Multiple-instance classification over subregions.
- **P2**: other. Subregions are defined by clusters shared across patients, a cluster-based correspondence.
- **P3**: builds on radiomics features.
- **Relevance**: Shared clusters as a correspondence of subregions across patients. Entered under ground (b): it narrows gap MG1.
- **Quality**: High (13). Single cohort; assessed from the abstract.
- **Potential use**: The section on P2, shared clusters as correspondence.

### Zhu_2022: Zhu et al. (2022). A pre-treatment CT-based weighted radiomic approach combined with clinical characteristics to predict durable clinical benefits of immunotherapy in advanced lung cancer.
- **Type**: Journal article (European Radiology)
- **Read from**: the abstract of DOI 10.1007/s00330-022-09337-7 (PMC9748402 gave no text)
- **Method**: Attention-based multiple-instance learning weights the radiomics of all intrapulmonary lesions of a patient, in 185 training and 48 test patients.
- **Key results**: AUC of 0.75 to 0.82 against 0.70 to 0.78 for the largest lesion, test AUC of 0.80, and 0.86 with clinical data.
- **P1**: permutation-invariant set encoder. Attention over lesions.
- **P2**: permutation invariance.
- **P3**: builds on radiomics features.
- **Relevance**: Learned weighting of multiple lesions against the largest-lesion approach. Entered under ground (c) (2022, relevance 3, 13).
- **Quality**: High (13). Independent test set; assessed from the abstract.
- **Potential use**: The section on P1, attention over lesion sets.

### Xu_2024: Xu et al. (2024). A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images.
- **Type**: Journal article (Computer Methods and Programs in Biomedicine)
- **Read from**: the abstract of DOI 10.1016/j.cmpb.2023.107872
- **Method**: Each lymphoma lesion on PET/CT is an instance with deep features from a self-supervised encoder joined with PET and CT radiomics. The instances are turned into a patient-level bag representation, which a distance-based few-shot classifier labels as diffuse large B-cell or follicular lymphoma.
- **Key results**: Accuracy of 0.751 and AUC of 0.795 at patient level, against accuracies of 0.698 to 0.714 for radiomics with random forest selection or support vector machines.
- **P1**: permutation-invariant set encoder. The lesions of a patient form a bag.
- **P2**: permutation invariance.
- **P3**: builds on radiomics features. Lesion radiomics are part of each instance.
- **Relevance**: A multiple-instance model on PET/CT lesions with few patients. Entered under ground (c) (2024, relevance 3, 13).
- **Quality**: High (13). Assessed from the abstract.
- **Potential use**: The section on P1, set encoders for small PET cohorts.

### Diao_2024: Diao and Jiang (2024). A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Read from**: the abstract of DOI 10.1016/j.compbiomed.2024.108461
- **Method**: Radiomic features of each lesion, compressed by an autoencoder, are joined with deep features guided by an RA-DL attention module. A multi-instance aggregation layer turns all lesion features of a patient into one vector, which a support vector machine classifies, on small liver, lung and lymphoma PET datasets.
- **Key results**: AUCs of 0.82, 0.84 and 0.83 for the three lung cancer classes, 0.95 and 0.75 for lymphoma and 0.84 and 0.86 for liver tumours. The authors report that it outperforms the alternatives they compare.
- **P1**: permutation-invariant set encoder. A multi-instance aggregation layer pools the lesions of a patient.
- **P2**: permutation invariance.
- **P3**: builds on radiomics features.
- **Relevance**: A multi-instance model joining deep and radiomic features. Entered under ground (c) (2024, relevance 3, 13).
- **Quality**: High (13). Assessed from the abstract.
- **Potential use**: The section on P3, radiomics inside a set encoder.

### Masson_Grehaigne_2024: Masson-Grehaigne et al. (2024). Enhancing Immunotherapy Response Prediction in Metastatic Lung Adenocarcinoma: Leveraging Shallow and Deep Learning with CT-Based Radiomics across Single and Multiple Tumor Sites.
- **Type**: Journal article (Cancers)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC11240700/
- **Method**: In 140 patients with metastatic lung adenocarcinoma, features of the largest, lowest, highest and mean lesion, with inter-lesion heterogeneity metrics, feed DeepSurv, gradient boosting and Cox models.
- **Key results**: DeepSurv reached a c-index of 0.631 (95% CI 0.625 to 0.647), gradient boosting 0.603 and Cox regression 0.560 to 0.570.
- **P1**: other. Fixed lesion aggregations feed survival models.
- **P2**: other. Lesions are summarized by selection and statistics.
- **P3**: builds on radiomics features.
- **Relevance**: A comparison of fixed multi-lesion aggregations. Entered under ground (c) (2024, relevance 3, 12), and it fills the thin part P3 as a gap-chaining seed.
- **Quality**: High (12). Single centre.
- **Potential use**: The section on radiomic aggregation across lesions.

### Sabouri_2025: Sabouri et al. (2025). Enhancing PRRT Outcome Prediction in Neuroendocrine Tumors: Aggregated Multi-Lesion PET Radiomics Incorporating Inter-Tumor Heterogeneity.
- **Type**: Journal article (Cancers)
- **Read from**: the publisher's PDF of DOI 10.3390/cancers17233887, saved by the theme-4 run
- **Method**: In 81 patients with neuroendocrine tumours treated with PRRT, lesions are ranked by SUV or volume, the top 1, 3 or 5 lesions are taken, and their features are stacked or summarized statistically.
- **Key results**: Ranking by SUVmin in descending order gave the best prediction of progression.
- **P1**: other. Fixed lesion selections and aggregations.
- **P2**: other. Lesions are ordered by a measured value.
- **P3**: builds on radiomics features.
- **Relevance**: Ordering by a lesion measure as a substitute for correspondence. Entered under ground (c) (2025, relevance 3, 12).
- **Quality**: High (12). Small cohort.
- **Potential use**: The section on radiomic aggregation across lesions.

### Zhao_2022: Zhao et al. (2022). Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma.
- **Type**: Journal article (European Radiology)
- **Read from**: the PubMed abstract of DOI 10.1007/s00330-022-08999-7 (no full text was reachable)
- **Method**: In 421 patients with lung adenocarcinoma on FDG PET/CT, all FDG-avid lesions were delineated and 2082 features computed for survival and histologic risk models.
- **Key results**: The model predicts 4-year overall survival with an AUC of 0.88. The abstract does not say how the lesions are combined.
- **P1**: other. Radiomic models over several lesions.
- **P2**: [GAP: P2]
- **P3**: builds on radiomics features.
- **Relevance**: A large multi-lesion radiomic cohort. Entered under ground (b): it fills the thin part P3 through gap chaining.
- **Quality**: High (12). Large cohort; assessed from the abstract.
- **Potential use**: The section on P3, multi-lesion radiomics.

### Gillies_2016: Gillies et al. (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Type**: Journal article (Radiology; a review)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC4734157/
- **Method**: A review of the radiomics process: image acquisition, segmentation, feature extraction, databases and modelling.
- **Key results**: It describes radiomics as the conversion of images into mineable data and calls segmentation the most critical, challenging and contentious step of the pipeline.
- **P1**: not addressed
- **P2**: not addressed
- **P3**: builds on radiomics features. It defines the pipeline whose steps P3 asks about.
- **Relevance**: The reference description of the radiomics pipeline. Entered under ground (a): cited by 3 core papers of round 1, and seminal.
- **Quality**: High (12). A review.
- **Potential use**: The section on P3, as the review of the radiomics pipeline.

### AVANTS_2008: Avants et al. (2008). Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain.
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/
- **Method**: SyN, a symmetric diffeomorphic registration with a cross-correlation similarity, evaluated by how well it transfers cortical labels in elderly and neurodegenerative brains.
- **Key results**: SyN is compared with an elastic cross-correlation optimizer and with the Demons algorithm on the transfer of cortical labels, with paired significance tests.
- **P1**: not addressed
- **P2**: registration to a common space.
- **P3**: other. It is the registration method that the pipelines of theme 4 build on.
- **Relevance**: The registration step that registration-free methods remove. Entered under ground (a): cited by 3 core papers of round 1, and seminal.
- **Quality**: High (14). Validation against manual labels.
- **Potential use**: The section on P3, the registration step.

## 5. Literature matrix

Matrix themes: MT1 tensor regression and decomposition; MT2 transport distances, embeddings, barycenters and dictionaries; MT3 permutation-invariant set encoders and multiple-instance learning; MT4 medical-imaging pipeline steps and multi-lesion aggregation. A source is marked under MT1 when P1 is a tensor method or the source is a tensor method or survey, under MT2 when P1 is a transport method or P2 a transport coupling or learned template, under MT3 when P1 is a set encoder, P2 is permutation invariance or the source is a multiple-instance method, and under MT4 when P2 is registration, P3 names a pipeline step, or the source aggregates lesions.

Codes. P1: TR multilinear or tensor PLS or tensor regression, TD tensor decomposition with an unaligned mode, OTD transport distance or embedding fed to a predictor, OTB transport barycenter or dictionary with learnable templates, SE permutation-invariant set encoder, OTHER, NA not addressed, GAP. P2: REG registration to a common space, TPL learned template or barycenter, CPL transport coupling, PI permutation invariance, OTHER, NA, GAP. P3: noREG removes registration, onREG builds on registration, noRAD removes handcrafted radiomics, onRAD builds on radiomics, onSEG builds on lesion or region segmentation, OTHER, NA, GAP. Theme: the theme run that kept the source, "cut" for a theme cut that entered on merit, M for a work the merge run found.

| Source | P1 | P2 | P3 | MT1 | MT2 | MT3 | MT4 | Theme | Method | Quality |
|---|---|---|---|---|---|---|---|---|---|---|
| Alam_2026 | TD | OTHER | NA | x | | | | 1 | computational | High 15 |
| Konyar_2025 | TD | OTHER | NA | x | | | | 1 | computational | High 14 |
| Zhang_2021 | OTHER | OTHER | NA | x | | | | 1 | computational | High 14 |
| Afshar_2020 | TD | OTHER | NA | x | | | | 1 | computational | High 14 |
| Yin_2020 | TD | OTHER | NA | x | | | | 1 | computational | High 14 |
| Zhou_2013 | TR | REG | onREG | x | | | x | 1 | computational | High 14 |
| Li_2016 | TR | REG | onREG | x | | | x | 1 | computational | High 14 |
| Miranda_2018 | TR | REG | onREG | x | | | x | 1 | computational | High 14 |
| Pan_2018 | TR | REG | GAP | x | | | x | 1 | computational | High 14 |
| Li_2018 | TR | REG | GAP | x | | | x | 1 | computational | High 14 |
| Zhang_2023 | TR | OTHER | onSEG | x | | | x | 1 | computational | High 14 |
| Liu_2023a | TR | REG | onREG | x | | | x | 1 | computational | High 14 |
| Lyu_2017 | TR | OTHER | NA | x | | | | 1 | computational | High 14 |
| Lock_2018 | TR | REG | NA | x | | | x | 1 | computational | High 14 |
| Qibin_Zhao_2013 | TR | OTHER | NA | x | | | | 1 | computational | High 14 |
| Bro_1999 | NA | OTHER | NA | x | | | | 1 | computational | High 14 |
| van_der_Ploeg_2026 | TR | OTHER | NA | x | | | | 1 | computational | High 14 |
| Amante_2019 | TD | REG | NA | x | | | x | 1 | computational | High 14 |
| arxiv_1910_09699 | TR | OTHER | onSEG | x | | | x | 1 | computational | High 14 |
| arxiv_2208_00993 | TD | OTHER | NA | x | | | | 1 | computational | High 14 |
| arxiv_1306_0895 | OTD | CPL | NA | | x | | | 2 | computational | High 13 |
| M_moli_2011 | GAP | CPL | GAP | | x | | | 2 | computational | High 13 |
| arxiv_1310_4375 | NA | TPL | NA | | x | | | 2 | computational | High 13 |
| Bonneel_2016 | OTB | TPL | NA | | x | | | 2 | computational | High 14 |
| Wang_2012 | OTD | TPL | NA | | x | | | 2 | computational | High 15 |
| Schmitz_2018 | NA | TPL | NA | | x | | | 2 | computational | High 14 |
| Peyre_2016 | OTD | CPL | NA | | x | | | 2 | computational | High 14 |
| arxiv_1805_09114 | OTD | CPL | NA | | x | | | 2 | computational | High 14 |
| arxiv_2006_09430 | OTD | TPL | NA | | x | | | 2 | computational | High 14 |
| Naderializadeh_2021 | OTD | TPL | NA | | x | | | 2 | computational | High 14 |
| Moosm_ller_2022 | OTD | CPL | NA | | x | | | 2 | computational | High 14 |
| Vincent_Cuaz_2022 | OTB | TPL | NA | | x | | | 2 | computational | High 14 |
| Xu_2023a | SE | CPL | NA | | x | x | | 2 | computational | High 15 |
| Xu_2023b | OTB | TPL | NA | | x | | | 2 | computational | High 14 |
| Kundu_2018 | OTD | REG | onREG | | x | | x | 2, 4 | computational | High 15 |
| Qian_2024 | OTB | TPL | NA | | x | | | 2 | computational | High 13 |
| Shifat_E_Rabbi_2025 | OTD | CPL | NA | | x | | | 2 | computational | High 15 |
| Ren_2025 | OTB | TPL | OTHER | | x | | | 2 | computational | High 14 |
| Gong_2026 | OTD | CPL | noREG | | x | | x | 2, 4 | computational | High 14 |
| Gachon_2025 | OTD | TPL | OTHER | | x | | | 2 | computational | High 14 |
| Zhang_2024 | OTB | TPL | NA | | x | | | 2 | computational | High 14 |
| Nguyen_2023 | OTD | CPL | NA | | x | | | 2 | computational | High 15 |
| arxiv_1703_06114 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| arxiv_1810_00825 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| arxiv_1612_00593 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| arxiv_1802_04712 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| arxiv_2106_00908 | SE | OTHER | NA | | | x | | 3 | computational | High 14 |
| Lu_2021 | SE | PI | NA | | | x | | 3 | computational | High 15 |
| Campanella_2019 | OTHER | OTHER | NA | | | x | | 3 | computational | High 14 |
| Zhu_2021 | SE | GAP | GAP | | | x | | 3 | computational | High 14 |
| Oner_2023 | SE | PI | NA | | | x | | 3 | computational | High 15 |
| Jurenaite_2024 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| Elhaminia_2023 | SE | PI | noREG | | | x | x | 3 | computational | High 14 |
| Craig_2025 | OTHER | PI | NA | | | x | | 3 | computational | High 14 |
| Liu_2023b | SE | PI | NA | | | x | | 3 | computational | High 14 |
| de_Vente_2024 | SE | PI | NA | | | x | | 3 | computational | High 14 |
| Karimzadeh_2026 | SE | PI | onRAD | | | x | x | 3, 4 | computational | High 14 |
| Chen_2021 | SE | PI | onRAD | | | x | x | 3, 4 | computational | High 13 |
| Chen_2022 | SE | PI | onRAD | | | x | x | 3, 4 | computational | High 13 |
| Thiery_2025 | OTHER | PI | onSEG | | | x | x | 3, 4 | computational | High 15 |
| Zhang_2025 | SE | PI | GAP | | | x | x | 3 | computational | High 13 |
| Liu_2018 | OTHER | REG | onREG | | | x | x | 3 | computational | High 15 |
| Zwanenburg_2020 | NA | NA | onRAD | | | | x | 4 | standardization | High 15 |
| Aerts_2014 | OTHER | NA | onRAD | | | | x | 4 | clinical study | High 14 |
| Geady_2025 | OTHER | OTHER | onRAD | | | | x | 4 | survey | High 14 |
| Kovacs_2023 | OTHER | REG | onREG | | | | x | 4 | computational | High 14 |
| Hering_2024 | OTHER | REG | onREG | | | | x | 4 | computational | High 14 |
| van_Griethuysen_2017 | NA | NA | onRAD | | | | x | 4 | software | High 13 |
| Eertink_2022 | OTHER | OTHER | onSEG | | | | x | 4 | clinical study | High 13 |
| Wilk_2025 | OTHER | OTHER | onRAD | | | | x | 4 | clinical study | High 13 |
| Siless_2020 | OTHER | OTHER | noREG | | | | x | 4 | computational | High 13 |
| Gerber_2023 | OTD | CPL | onREG | | x | | x | 4 | computational | High 13 |
| arxiv_2111_00648 | NA | CPL | onREG | | x | | x | 4 | computational | High 13 |
| Chang_2021 | OTHER | OTHER | onRAD | | | | x | 4 | clinical study | High 13 |
| Salim_2026 | OTHER | OTHER | onRAD | | | | x | 4 | clinical study | High 13 |
| Qahqaie_2026 | NA | CPL | onREG | | x | | x | 4 | computational | High 12 |
| Kiers_1999 | NA | OTHER | NA | x | | | | 1 cut | computational | High 13 |
| Perros_2017 | TD | OTHER | NA | x | | | | 1 cut | computational | High 13 |
| Kolda_2009 | TD | OTHER | NA | x | | | | 1 cut | survey | High 12 |
| Huang_2026 | TR | OTHER | onSEG | x | | | x | 1 cut | computational | High 13 |
| Ren_2025b | TD | OTHER | NA | x | | | | 1 cut | computational | High 12 |
| Papastergiou_2018 | TD | PI | NA | x | | x | | M | computational | High 12 |
| Papastergiou_2019 | TD | PI | NA | x | | x | | M | computational | High 12 |
| Afshar_2021 | TD | CPL | NA | x | x | | | M | computational | High 14 |
| arxiv_2603_06465 | TR | OTHER | onRAD | x | | | x | M | computational | Medium 10 |
| Peyr__2019 | OTD | CPL | NA | | x | | | 2 cut | survey | High 12 |
| Rubner_2000 | OTD | CPL | NA | | x | | | M | computational | High 13 |
| arxiv_1807_00094 | OTD | CPL | onSEG | | x | | x | M | computational | Medium 9 |
| Zhu_2024 | OTD | OTHER | noRAD | | x | | x | 2 cut | computational | High 13 |
| Wang_2024b | OTB | TPL | NA | | x | | | 2 cut | computational | High 13 |
| arxiv_2407_00224 | OTB | TPL | NA | | x | | | 2 cut | computational | High 13 |
| arxiv_2502_04907 | OTD | TPL | NA | | x | | | 2 cut | computational | High 13 |
| Belkhatir_2022 | OTD | TPL | onRAD | | x | | x | 4 cut | computational | High 12 |
| Zhu_2026 | SE | CPL | NA | | x | x | | M | computational | High 12 |
| Cui_2023 | SE | CPL | NA | | x | x | | M | computational | High 13 |
| Quellec_2017 | SE | PI | noRAD | | | x | x | M | survey | High 12 |
| Wang_2018 | SE | PI | NA | | | x | | M | computational | High 13 |
| Li_2021 | SE | OTHER | NA | | | x | | M | computational | High 14 |
| Zhang_2022 | SE | PI | NA | | | x | | M | computational | High 14 |
| Dietterich_1997 | OTHER | PI | NA | | | x | | M | computational | High 13 |
| Maron_1997 | OTHER | PI | NA | | | x | | M | computational | High 12 |
| Andrews_2002 | OTHER | PI | NA | | | x | | 3 cut | computational | High 13 |
| Gaertner_2002 | OTHER | PI | NA | | | x | | M | computational | High 13 |
| Carbonneau_2018 | SE | PI | NA | | | x | | M | survey | High 14 |
| Chikontwe_2020 | SE | PI | NA | | | x | | M | computational | High 12 |
| Hou_2016 | OTHER | OTHER | NA | | | x | | M | computational | High 14 |
| arxiv_1910_10825 | SE | PI | NA | | | x | | M | computational | Medium 11 |
| Feng_2017 | SE | PI | NA | | | x | | M | computational | High 12 |
| Niu_2026 | SE | OTHER | NA | | | x | | M | computational | High 13 |
| Lysukhin_2025 | SE | PI | NA | | | x | | 3 cut | computational | High 12 |
| Wang_2024a | SE | PI | NA | | | x | | 3 cut | computational | High 13 |
| Shan_2022 | OTHER | PI | OTHER | | | x | | 3 cut | computational | High 13 |
| Thi_ry_2023 | SE | PI | onSEG | | | x | x | 3 cut | computational | High 12 |
| Zhang_2020 | OTHER | OTHER | onRAD | | | x | x | M | computational | High 13 |
| Zhu_2022 | SE | PI | onRAD | | | x | x | M | computational | High 13 |
| Xu_2024 | SE | PI | onRAD | | | x | x | M | computational | High 13 |
| Diao_2024 | SE | PI | onRAD | | | x | x | M | computational | High 13 |
| Masson_Grehaigne_2024 | OTHER | OTHER | onRAD | | | | x | M | clinical study | High 12 |
| Sabouri_2025 | OTHER | OTHER | onRAD | | | | x | 4 cut | clinical study | High 12 |
| Zhao_2022 | OTHER | GAP | onRAD | | | | x | M | clinical study | High 12 |
| Gillies_2016 | NA | NA | onRAD | | | | x | M | survey | High 12 |
| AVANTS_2008 | NA | REG | OTHER | | | | x | M | computational | High 14 |

Coverage, counted on the rows above:

| Column | Sources |
|---|---|
| MT1 | 29 |
| MT2 | 36 |
| MT3 | 47 |
| MT4 | 49 |
| P1 with a value | 111 (TR 14, TD 12, OTD 19, OTB 8, SE 34, OTHER 24), with 10 NA and 1 GAP |
| P2 with a value | 116 (REG 13, TPL 16, CPL 18, PI 36, OTHER 33), with 4 NA and 2 GAP |
| P3 with a value | 47 (noREG 3, onREG 11, noRAD 2, onRAD 20, onSEG 7, OTHER 4), with 70 NA and 5 GAP |

Every source is marked under at least one matrix theme, and each theme and each part holds at least 3 sources. P3 is the thin part.

## 6. Identified gaps

### MG1 (P1, P2): no transport coupling or learned template across the lesion sets of different patients for an outcome

- **Kind**: methodological gap. It merges gap G1 of theme 2, Gap A of theme 3 and Gap 1 of theme 4.
- **Statement**: The imaging models that predict a patient outcome from a set of lesions or regions handle the missing correspondence by permutation invariance or by fixed aggregation. None compares the lesion sets of two patients through a transport coupling, and none expresses them against a learned template or barycenter.
- **Matrix evidence**: Of the 49 MT4 sources, 6 take a transport coupling or a learned template on P2 (Gong_2026, Gerber_2023, arxiv_2111_00648, Qahqaie_2026, arxiv_1807_00094, Belkhatir_2022). Gong_2026 couples the sequences of one patient, Qahqaie_2026 the time points of one patient, Gerber_2023 each image to a template image, and arxiv_2111_00648 two point clouds for registration. arxiv_1807_00094 couples single nodules, and Belkhatir_2022 couples texture matrices. The 13 sources under both MT3 and MT4 use permutation invariance or a graph over lesions.
- **Narrowing by the merge run**: Outside lesion imaging, couplings and templates across subjects exist for slide bags (Cui_2023), magnifications of one slide (Zhu_2026), patch prototypes (arxiv_2407_00224), node distributions (Wang_2024b) and cell sets (Gachon_2025, Shan_2022). Zhang_2020 shares K-means clusters of tumour subregions across patients. The gap holds for sets of radiological lesions and regions.
- **Searches that found nothing**: merge rows M1 and M7 (P12, PubMed, 0 and 0 relaxed) and C1 (0). Theme 3 G1 (PubMed, 0 records, and 0 after relaxation), theme 4 G1 (PubMed, 0 records) and theme 2 G1s (104 records, none of this kind). The gap chaining from Belkhatir_2022, arxiv_2407_00224 and Gong_2026 screened 193 listing lines and added none.
- **Action**: a lesion-set model whose pooling is tied to learned transport templates or a coupling between patients, compared on one cohort with the set encoders of Karimzadeh_2026 and on the replicated datasets of Geady_2025.

### MG2 (P2, P3): no head-to-head comparison of registration-based and registration-free methods on the same subjects and outcome

- **Kind**: methodological gap. It merges gap G2 of theme 2, Gap B of theme 3 and Gap 2 of theme 4.
- **Statement**: The studies that measure the registration step keep registration and compare it with no registration or with augmentation inside one detector (Kovacs_2023, Hering_2024). The registration-free studies predict without registration but do not run a registered counterpart on the same subjects (Gong_2026, Elhaminia_2023), or predict no subject outcome (Siless_2020).
- **Matrix evidence**: P3 holds 11 sources that build on registration and 3 that remove it. P2 holds 13 sources that use registration to a common space. No source pairs a registered model with a registration-free set or transport model on one cohort and one outcome.
- **Searches that found nothing**: theme 2 G2s (214 records), theme 3 G2 (PubMed, 15 records, none a comparison), theme 4 G2 (PubMed, 1 record, not on the gap) and merge row C3 (P14, PubMed, 0). The gap chaining from Kovacs_2023, Liu_2018 and Zhang_2020 screened 173 listing lines and added none.
- **Action**: a study on a multicentric cohort in which the same outcome model runs on registered inputs and on a transport coupling or set encoder over unregistered inputs, with an external test set.

### MG3 (P1, P2): no tensor regression or tensor PLS on a spatially unaligned set mode

- **Kind**: under-researched area and methodological gap. It merges Gaps 1 to 3 of theme 1.
- **Statement**: Every tensor source whose mode varies across subjects varies a time or retention-time mode (Alam_2026, Konyar_2025, Afshar_2020, Yin_2020, arxiv_2208_00993, Perros_2017, Ren_2025b, Amante_2019). Every tensor source with a spatial mode takes its correspondence from registration or an atlas (Zhou_2013, Li_2016, Miranda_2018, Pan_2018, Li_2018, Liu_2023a, Zhang_2023, Huang_2026). No tensor PLS fits an outcome together with a varying mode in one model.
- **Narrowing by the merge run**: Huang_2026 absorbs cyclic shifts of the signal inside a tensor regression, though on atlas regions. Papastergiou_2018 and Papastergiou_2019 join tensor features with a bag of instances, and Afshar_2021 puts a transport loss inside a CP factorization. arxiv_2603_06465 applies a tensor response regression to distributional radiomic features. None of them treats a set of lesions or points as a tensor mode.
- **Matrix evidence**: Of the 29 MT1 sources, 3 take a transport coupling or permutation invariance on P2 (Papastergiou_2018, Papastergiou_2019, Afshar_2021), and none a learned template. Of the 12 MT1 sources that also fall under MT4, every one uses registration, an atlas or a segmentation.
- **Searches that found nothing**: merge rows M1, M2, M7 and M8 (P12 and P13, PubMed, 0 each) and C1 and C2 (0 each). Theme 1 G2 (PubMed, 0 records). The gap chaining from Huang_2026, Papastergiou_2019 and Afshar_2021 screened 114 listing lines and added none.
- **Action**: a supervised tensor model whose lesion or point mode is matched inside the fit through a transport coupling or a learned template.

### Critical gaps under `cs_ml`

- **Non-reproducible results**: The texts read give no code for the method in Zhou_2013, Li_2016, Miranda_2018, Pan_2018, Li_2018, Zhang_2023, Liu_2023a, Qibin_Zhao_2013 and arxiv_1910_09699 (theme 1), in arxiv_1310_4375, Bonneel_2016, Wang_2012, Schmitz_2018, Moosm_ller_2022, Vincent_Cuaz_2022, Kundu_2018, Shifat_E_Rabbi_2025 and Gong_2026 (theme 2), and in Elhaminia_2023, Eertink_2022 and Thiery_2025 (themes 3 and 4). Code is released by Karimzadeh_2026, Chen_2021, Chen_2022, Chang_2021, Gerber_2023, arxiv_2111_00648, Kovacs_2023, arxiv_2407_00224, Zhang_2022 and the theme-1 and theme-2 sources the theme runs list. Sources read from the abstract alone leave this open.
- **Benchmark cherry-picking**: The tensor methods are each compared on data and baselines their authors chose, and no two share a protocol (theme 1). The graph and set methods report on subsets of standard benchmarks the authors chose (themes 2 and 3), and Oner_2023 reports on CAMELYON16 alone. Geady_2025 replicated ten aggregation methods on three datasets and found that the best one changes with the dataset, which is the closest the set has to a shared benchmark.

### Each part checked

- P1: MG1 and MG3.
- P2: MG1, MG2 and MG3.
- P3: MG2. P3 is the thin part (47 sources with a value). Its gap chaining from Sabouri_2025, Masson_Grehaigne_2024 and Zhu_2022 screened 144 listing lines and added Zhao_2022.

## 7. Synthesis

### P1: methods that predict a subject-level outcome from unaligned data

Four families of methods predict a subject-level outcome without a fixed correspondence. They are tensor models, transport methods, set encoders and fixed aggregations of lesion features. Tensor regression places a low-rank structure on the coefficient array of an image covariate [@Zhou_2013]. Its extensions add several responses [@Li_2016] or Bayesian priors on the coefficients [@Miranda_2018; @Liu_2023a]. All of them assume that voxels or regions match across subjects. Kolda and Bader survey the decompositions these models use [@Kolda_2009]. PARAFAC2 relaxes this assumption for one mode, whose size may differ across slices [@Bro_1999; @Kiers_1999]. Its scalable fits handle health records whose visits differ in number across patients [@Perros_2017; @Afshar_2020; @Yin_2020]. Supervised versions feed the patient factors to a predictor [@arxiv_2208_00993; @Konyar_2025; @Ren_2025b]. In each of these the varying mode is time. The one tensor regression that absorbs spatial shifts inside the model works on atlas regions [@Huang_2026].

Transport methods compare subjects as distributions. The Earth Mover's Distance first compared sets of image features of different sizes [@Rubner_2000]. Peyre and Cuturi survey the computation of these distances [@Peyr__2019]. Linear transport to one reference turns each subject into a vector that a standard predictor can use [@Wang_2012]. The same idea embeds graphs and sets [@arxiv_2006_09430; @Naderializadeh_2021] and point sets [@Shifat_E_Rabbi_2025]. Fused Gromov-Wasserstein distances compare graphs through node features and structure together [@arxiv_1805_09114]. Barycenters and dictionaries learn the references from data [@Bonneel_2016; @Vincent_Cuaz_2022; @Xu_2023b]. Recent work learns class references for graphs [@Wang_2024b] or shared prototypes for slide patches [@arxiv_2407_00224]. In medical imaging, transport distances classify lung nodules [@arxiv_1807_00094] and texture matrices [@Belkhatir_2022]. Transport-based texture features also predict survival in three cancer cohorts [@Zhu_2024].

Set encoders learn the pooling itself. Multiple-instance learning began with drug molecules seen as bags of conformations [@Dietterich_1997]. Diverse density and margin-based methods followed [@Maron_1997; @Andrews_2002], and so did kernels on sets [@Gaertner_2002]. Deep Sets proved that a sum of element encodings represents any permutation-invariant function [@arxiv_1703_06114]. Attention pooling weights the instances of a bag [@arxiv_1802_04712], and the Set Transformer adds interactions among elements [@arxiv_1810_00825]. PointNet applies a symmetric function to point clouds [@arxiv_1612_00593]. Slide-level models built on these ideas reach clinical accuracy from slide labels alone [@Campanella_2019; @Lu_2021]. Carbonneau and colleagues survey the problem types of multiple-instance learning [@Carbonneau_2018]. Quellec and colleagues review its medical uses [@Quellec_2017]. A patient's slides [@Niu_2026; @Lysukhin_2025], cells [@Craig_2025; @Shan_2022] or record codes [@Liu_2023b] can each form the set.

The lesion-set models of radiology apply these encoders to radiomic vectors. Attention pooling over nodules or metastases predicts diagnosis or outcome [@Chen_2022; @Chen_2021; @Zhu_2022]. PET studies pool lymphoma or tumour lesions with few patients [@Xu_2024; @Diao_2024]. Karimzadeh and colleagues compare Deep Sets, the Set Transformer, attention pooling and a graph network on lymph node sets [@Karimzadeh_2026]. Their set models reach an AUC up to 0.91 with an external centre. Graph networks over lesions add relations between lesions [@Thiery_2025]. The fixed aggregations remain the common baseline. They take the largest lesion, a volume-weighted mean, or a statistic over lesions [@Chang_2021; @Wilk_2025; @Eertink_2022; @Salim_2026]. Others add heterogeneity metrics [@Masson_Grehaigne_2024] or rank lesions by uptake [@Sabouri_2025]. Geady and colleagues replicated ten such aggregations and found no single best one [@Geady_2025]. The pair searches P12 and P13 on PubMed (rows M1, M2, M7 and M8) and their currency rows C1 and C2 found no record that joins a tensor model to a transport or set method.

### P2: how each method handles the missing correspondence

Registration is the oldest answer. The tensor regressions on brain images take registered voxels or atlas regions [@Zhou_2013; @Li_2016; @Pan_2018; @Li_2018]. Landmark-based multiple-instance learning places its patches after registration to a template [@Liu_2018]. Transport-based morphometry registers affinely before it transports each image to a template [@Kundu_2018]. Symmetric diffeomorphic registration is a common tool behind these steps [@AVANTS_2008]. Outside images, two tensor models align a time mode before the decomposition, by dynamic time warping or by alignment of chromatograms [@Zhang_2021; @Amante_2019]. Two prostate studies measure what registration contributes to a detector [@Kovacs_2023; @Hering_2024]. Hering and colleagues found that deformable alignment raised AUROC by 0.3 percent, which was not significant. Kovacs and colleagues found that only registration with augmentation beat the unregistered model. In the matrix, 13 sources rely on registration to a common space.

Permutation invariance removes the question instead of answering it. Sum, attention and max pooling give the same output for any order of the elements [@arxiv_1703_06114; @arxiv_1802_04712; @arxiv_1612_00593]. This is the most frequent answer in the matrix, with 36 sources. Position then returns as a fixed input when it matters. Karimzadeh and colleagues add lesion coordinates after rigid registration [@Karimzadeh_2026]. Thiery and colleagues encode lesion relations as graph edges [@Thiery_2025]. Zhang and colleagues fuse anatomical context into each lesion [@Zhang_2025]. TransMIL adds a position encoding over the tile sequence [@arxiv_2106_00908]. Some models impose an order instead. Campanella and colleagues sort tiles by score before a recurrent network [@Campanella_2019]. Sabouri and colleagues rank lesions by uptake [@Sabouri_2025]. PARAFAC2 leaves its varying mode free under a constraint on the cross-products of its loadings [@Bro_1999; @Kiers_1999].

Templates and couplings answer the question inside the model. A learned reference set gives a common coordinate frame for sets [@Naderializadeh_2021; @arxiv_2006_09430]. Class references play the same role for graphs [@Wang_2024b]. Shared prototypes play it for the patches of whole-slide images [@arxiv_2407_00224]. Survival tokens play it for slides as well [@Ren_2025]. A shared support of K points plays it for many measures [@arxiv_2502_04907; @Gachon_2025]. Couplings match two sets directly. They do so between the sequences of one prostate MRI [@Gong_2026] and between the time points of one patient's lesions [@Qahqaie_2026]. They also link each brain image to a template [@Gerber_2023], the bags of two slides [@Cui_2023] and the magnifications of one slide [@Zhu_2026]. A transport loss can also sit inside a tensor factorization [@Afshar_2021]. The matrix holds 16 template sources and 18 coupling sources. None of them matches the lesion sets of different patients for an outcome. The gap searches of themes 2, 3 and 4 (G1s, G1 and G1) and merge rows M1, M7 and C1 found no such work.

### P3: what the methods remove from or build on the imaging pipeline

The imaging pipeline has three steps that the question names: registration, radiomic feature extraction and lesion segmentation. Gillies and colleagues describe the radiomics pipeline and call segmentation its most critical step [@Gillies_2016]. The Image Biomarker Standardization Initiative fixed the definitions of 169 features [@Zwanenburg_2020]. PyRadiomics is the extraction tool of several multi-lesion studies in the set [@van_Griethuysen_2017]. Eertink and colleagues computed 485 features per lesion with IBSI-compliant software [@Eertink_2022]. The first large radiomic study linked a single-tumour signature to survival and gene expression [@Aerts_2014]. Most set-based methods keep these steps. In the matrix, 20 sources build on radiomics features and 7 on lesion or region segmentation. The set encoders of radiology pool radiomic vectors of delineated lesions [@Karimzadeh_2026; @Chen_2022; @Zhu_2022]. Large multi-lesion cohorts delineate every lesion as well [@Zhao_2022; @Eertink_2022].

Few methods remove a step. Three sources remove registration. Gong and colleagues fuse unregistered MRI sequences through a transport coupling, while a gland mask still crops the input [@Gong_2026]. Elhaminia and colleagues predict toxicity without registration and register only to draw an atlas afterwards [@Elhaminia_2023]. Their model reached about 80 percent accuracy in 315 patients. Gerber and colleagues keep an initial alignment and let transport absorb the residual misalignment [@Gerber_2023]. Siless and colleagues match tract clusters by anatomical labels instead of coordinates [@Siless_2020]. Two sources remove handcrafted radiomics. Transport-based texture features replace gradient descriptors [@Zhu_2024]. The review of medical multiple-instance learning notes that it needs no manual segmentation [@Quellec_2017]. A distributional extension of radiomics keeps the segmentation and enriches the features [@arxiv_2603_06465].

Whether removing registration costs or gains accuracy is not settled by the set. The two prostate studies show a small or conditional effect of registration on one detector [@Kovacs_2023; @Hering_2024]. Gong and colleagues report an AUC of 0.824 on a temporal test set without registration, but they ran no registered baseline [@Gong_2026]. Karimzadeh and colleagues test registered coordinates only as an added input to one set model [@Karimzadeh_2026]. Transport-based morphometry registers first and then transports, so it cannot separate the two effects [@Kundu_2018]. No source runs both kinds of method on one cohort and one outcome. Merge row C3 (P14, PubMed, 0), theme 4 G1 and G3 (PubMed, 0 each) and the theme 3 G2 search (15 records, none a comparison) found no such study.

## 8. Recommended sources

| Part | Sources | Why |
|---|---|---|
| P1 | arxiv_1703_06114, arxiv_1802_04712, Karimzadeh_2026, Wang_2012, arxiv_2407_00224, Huang_2026, Geady_2025 | The definition of set encoders, attention pooling, the closest comparison of set encoders on lesion sets, linear transport embedding, learned prototypes, the one shift-aware tensor regression, and the replicated aggregation benchmark. |
| P2 | Naderializadeh_2021, Wang_2024b, Gong_2026, Cui_2023, Kovacs_2023, Hering_2024, Thiery_2025 | Learned references for sets and graphs, transport couplings between unregistered inputs and between bags, the measured effect of registration, and lesion relations as a graph. |
| P3 | Zwanenburg_2020, Gillies_2016, van_Griethuysen_2017, Elhaminia_2023, Gong_2026, Siless_2020, Zhu_2024 | The pipeline and its standards, and the sources that remove registration or handcrafted radiomics. |

## 9. No entry written

No entry was left unwritten for want of confirmation: all 122 entries of `refs.bib` were confirmed by `the lookup script resolve`, 26 against OpenAlex and 96 against Crossref. The three works the merit rule took out have no entry in `refs.bib`: Xie_2025, arxiv_2405_16519 and arxiv_2203_04964. Two theme entries were replaced by the entry of the same work under another key: Charles_2017 by arxiv_1612_00593, and Ren_2023 by arxiv_2208_00993.

## 10. Search limitations and gate failures

| Gate | Result |
|---|---|
| Search documented | Met: sections 1 and 3 and `search-log.md`. |
| Source count | Met: 122 against the minimum of 30. |
| Annotations | Met: one for each of the 122 sources. |
| Matrix coverage | Met: MT1 29, MT2 36, MT3 47, MT4 49, P1 111, P2 116, P3 47. |
| Research gaps | Met: three merged gaps, the critical gaps, and every part checked. |
| Peer-reviewed share | Met: 117 of 122 (95.9 percent). The 5 preprints count under `cs_ml`. |
| Currency (2022 to 2026) | **Not met**: 57 of 122 (46.7 percent), below 50 percent. Currency pass 1 over 2024 to 2026 added no new eligible source. |

Limitations:

- **Currency.** The share stays below 50 percent because the set holds the foundational works of three communities (multiple-instance learning from 1997, PARAFAC2 from 1999, transport distances from 2000) that the merit rule admits as must-include or seminal. Theme 1's own share was 30 percent (6 of 20). The merge run judged theme 1's recent cuts under ground (c) and took in Huang_2026 and Ren_2025b. The other recent theme-1 candidates stayed out on relevance or on their totals (section 3).
- **Preprints.** arxiv_2006_09430, arxiv_1807_00094, arxiv_2603_06465, arxiv_2502_04907 and arxiv_1910_10825 are entered as preprints. For each, Crossref, OpenAlex and Semantic Scholar were checked for a published version. OpenAlex names TMLR for arxiv_2502_04907 with no confirming record, and Semantic Scholar answered HTTP 429 for it. The SPIE record of arxiv_1910_10825 is a recorded talk. Semantic Scholar names ICLR for arxiv_2006_09430, whose venue page on OpenReview answered with a challenge page in theme 2's run, so its `@misc` entry stays (`search-log-theme-2.md`). The search log gives each lookup.
- **Entry defects left as the sources gave them.** Liu_2023a ends its author field with an empty name, as Crossref prints it. Yin_2020, Jurenaite_2024, Karimzadeh_2026, Perros_2017 and Thi_ry_2023 print `&amp;` in a field. Naderializadeh_2021, Gaertner_2002 and Ren_2025b list "and others" for authors the record does not name. The rules allow no hand edit of a field.
- **Assessed from the abstract.** Zwanenburg_2020, Geady_2025, van_Griethuysen_2017, Salim_2026, Zhu_2021, Zhang_2025, Konyar_2025, Zhang_2021, M_moli_2011, Xu_2023b, Qian_2024, Zhang_2024, Papastergiou_2018, Papastergiou_2019, Rubner_2000, Belkhatir_2022, Zhu_2026, Quellec_2017, Gaertner_2002, Chikontwe_2020, Feng_2017, Lysukhin_2025, Zhang_2020, Zhu_2022, Xu_2024, Diao_2024 and Zhao_2022. Their fields rest on the abstract.
- **Not read.** Amores 2013 (Artificial Intelligence), a must-include and seminal review of multiple-instance classification: no route gave its text or its abstract (section 3). Zhao et al. 2026 (Information Fusion), Ma et al. 2023 (Pattern Recognition), Abramova 2026 and Phan 2026 are not read either, and none of them is must-include or seminal.
- **Databases not reached.** Scopus gave 2 pages to the merge run's site searches, both unrelated or known, and none to the currency pass. Google Scholar, Scopus "Cited by" and Connected Papers were not reached, for the reasons the theme runs give. Semantic Scholar answered HTTP 429 for part of the lookups.
- **Theme-run limits carried over.** Theme 1 failed its currency gate (section 3). Theme 2's citation loop did not close, and the merge rounds closed it (section 1). Themes 3 and 4 did not reach IEEE Xplore or ACM DL, and the merge run's site searches reached both.

## 11. AI disclosure

AI-assisted research tools (`claude-opus-5-5`) were used for research assistance in the search and the bibliography, and for drafting assistance in the synthesis. No person has reviewed this review, and the authors who use it are responsible for what they take from it.

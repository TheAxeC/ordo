# Literature review: supervised prediction from data with an unaligned spatial mode

Merge run of this literature review, over the four theme runs of `settings.md` ("Decisions"). Final set: 225 sources, each with one entry in `refs.bib`, one annotation (section 4) and one matrix row (section 5).

## 1. Search strategy

### Research question and its parts

Research question (`settings.md`): which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?

- P1: the methods that predict a subject-level outcome from such data.
- P2: how each handles the missing correspondence (registration, a learned template or barycenter, a transport coupling, or permutation invariance).
- P3: where each removes or builds on the registration, radiomics and lesion-segmentation steps.

The theme runs 1 to 3 use these parts, each read within its theme. Theme run 4 numbered its parts differently: its P1 is registration to a common space, its P2 is lesion features combined into a subject-level prediction, and its P3 is the methods that remove or replace registration. The Relevance line of each annotation from a theme run (the first 130 annotations of section 4, in the order theme 1, 2, 3, 4) uses its own theme's parts; the annotations the merge run wrote use the parts above.

Profile `cs_ml`: archival preprints and proceedings are admitted and tagged as such; preprints count toward the peer-reviewed share. Paper type: Literature Review, minimum 30 sources. DOI checking: strict.

Criteria (every run): English; a source addresses at least one part of the question; the methods of any application domain are admitted (`settings.md`, Discipline); a work outside the time range of its theme run is admitted as seminal when it is a foundational work of the field cited more than 100 times; methodology reliable under node 4 of the screening tree; scored on the five items of the quick assessment (High 12 or more, Medium 8 to 11, Low 7 or less).

### The theme runs

| Theme | Databases and interfaces | Passes | Records screened | Kept | Cut at the upper bound | Gates not met in the theme run |
|---|---|---|---|---|---|---|
| 1. Tensor regression and multilinear PLS (range 20 to 35) | PubMed E-utilities (2016 to 2026, English); `the lookup script search` (Crossref, OpenAlex, Semantic Scholar, arXiv); Semantic Scholar graph search; OpenAlex; site-limited web searches for IEEE Xplore, ACM DL and Scopus | pass 1 and 3 currency passes | 240 distinct PubMed records in pass 1 and 100 in the currency passes, 1,732 `the lookup script` record lines, 100 Semantic Scholar records, 157 OpenAlex records, 40 web results; 48 Include or Maybe; 47 passed | 35 | 12 | currency (40 percent after 3 passes); condition 4 (Harshman 1972 has no index record) |
| 2. Optimal transport for structured data (range 25 to 40) | PubMed E-utilities; `the lookup script search`, `refs` and `cited-by`; Semantic Scholar; site-limited web searches | 2 passes and 1 currency pass | 1,691 distinct titles in the `the lookup script` listings, 141 PubMed records; 51 candidates; 49 passed | 40 | 9 | currency (47.5 percent after 1 pass) |
| 3. Permutation-invariant set encoders (range 12 to 25) | PubMed E-utilities; `the lookup script search`, `refs` and `cited-by`; Semantic Scholar | 3 passes and 2 currency passes | 1,826 records and listing lines before duplicate removal; 37 candidates; 32 eligible | 25 | 7, plus 1 Maybe left to the merge run | currency (44 percent after 2 passes); condition 4 |
| 4. Medical image pipelines (range 20 to 35) | PubMed E-utilities; `the lookup script search`, `refs` and `cited-by`; web searches; Europe PMC for reading | 3 passes and 3 currency passes | 1,536 records in pass 1 plus 30 web links, and the records of the later passes; 60 candidates; 58 passed | 35 | 23 | currency (40 percent after 3 passes); condition 4 |

Core papers of layer 1, the seeds of citation chaining, as each theme run's search record names them: theme 1 Zhou 2013, Zhao 2013 HOPLS, Perros 2017 SPARTan, Lock 2018, Roald 2022, Liu 2021 and Hoff 2015 (7); theme 2 Vayer 2019 FGW, Vincent-Cuaz 2022 TFGW, Vincent-Cuaz 2021 GDL, Vincent-Cuaz 2022 srGW, Togninalli 2019, Brogat-Motte 2022, Xu 2020, then Krzakala 2024, Mialon 2021, Xu and Cheng 2023, Thual 2022 (11); theme 3 Gutierrez-Becker 2021, Chang and Jung 2020, the Set Transformer, OTKE and Kothapalli 2024 (5); theme 4 VoxelMorph, nnU-Net, PyRadiomics, IBSI, Geady 2025, OTMorph, Feydy 2017 and Thual 2022, then Gerber 2023 and Fontaine 2020 (10). The merge run chained from these 33 cores.

Databases not reached in any run: IEEE Xplore, ACM Digital Library and Scopus, whose site-limited web searches returned no page from those sites, since the search tool did not apply the site limit; Scopus "Cited by" (bot check, API key, subscription) and Connected Papers (a page of scripts with no titles), as `references/literature-search agent.md` records; Semantic Scholar answered HTTP 429 in several calls of themes 1 and 3 and in one merge-run lookup (below).

### The merge run's own searches

Duplicates removed before screening the merged set (by DOI, arXiv ID or title): the second copies of `arxiv_2006_12065` (OTKE) and `Naderializadeh_2021` (PSWE), kept by themes 2 and 3; `Gramfort_2015` and `Thual_2022`, kept by themes 2 and 4; `Geady_2025`, kept by themes 3 and 4. Each kept one entry and one key, and its matrix row names both themes. The TransMorph entry was given the key `Chen_2022a`, since `Chen_2022` was already the key of another work. The 135 theme-run entries less the 5 duplicates give 130 sources from the theme runs.

| Pass | What it ran | Counts | Sources added |
|---|---|---|---|
| Cut sources judged on merit | Every source a theme run cut at its upper bound, read from the theme folders or again with the ways of "Reading a candidate" | 51 cuts; 3 of theme 4's cuts (Bazeille 2019, Liu 2026, Mazelet 2026) and 1 of theme 3's (Cavinato 2023) were already in the set from another theme | 43: theme 1, 12; theme 2, 5 (`arxiv_2401_01460`, `Wang_2024`, `Liu_2023`, `arxiv_2309_16604`, `Zeng_2023`); theme 3, 6 (`arxiv_2203_04964`, `Gharibi_2026`, `Gacheva_2026`, `Yi_2021`, `Liu_2026`, `Shou_2024`); theme 4, 20 |
| Chaining, round 1 (layers 2 and 3) | `the lookup script refs` on the 33 core papers; `the lookup script cited-by` on 12 foundational works; works cited by 3 or more cores marked "must include" | reference listings of the 33 cores | 20: the works that close the loop (`Dalca_2018`, `Yang_2017`, `Sokooti_2017`, `Klein_2009`, `Avants_2011`) and the must-include works `Bronstein_2017`, `Rubner_2000`, `Villani_2009`, `arxiv_1506_02025` (STN), `Ktena_2017`, `arxiv_1806_08804` (DiffPool), `Nikolentzos_2017`, `arxiv_1906_02085` (GOT), `Solomon_2016`, `Sidiropoulos_2000`, `Flamary_2021` (POT), `Kriege_2020`, `Barbe_2021`, `arxiv_1605_05273` (PATCHY-SAN), `arxiv_1904_08082` (SAGPool) |
| Chaining, round 2 | `the lookup script refs` on 8 merge additions (Qahqaie 2026, Yan 2026, Zhu 2022, Chen and Martel 2022, Shi 2026, Gachon 2025, Gharibi 2026, Wilk 2025) | the only work cited by 3 or more of them is Gillies 2016, already collected | 0 |
| Pair searches (the themes the question joins) | PubMed E-utilities, four strings joining the concepts of two themes (transport or set encoders with lesion, radiomics or registration terms; tensor models with transport or irregular-mode terms); `the lookup script search` with six pair strings at `--limit 40` | PubMed counts 33, 21, 38 and 54; `the lookup script` listings of 104, 61, 53, 116, 88 and 102 lines | 10: `Gachon_2025`, `Cang_2025`, `Wang_2025`, `Shifat_E_Rabbi_2025a`, `Tu_2020`, `Shi_2021`, `Zhu_2022`, `Yan_2026`, `Kerdoncuff_2022`, `Wang_2024a` |
| Currency pass 1 | PubMed E-utilities for 2024 to 2026 with the strings of the four themes | counts 27, 54 and 63 | 6: `Chen_2024`, `Wilk_2025`, `Phan_2026`, `Chang_2026`, `Takeda_2025`, `Han_2025` |
| Currency pass 2 | Layer-3 citing works of 2024 to 2026 of the core and foundational works (`the lookup script cited-by`) | citing listings of the 12 foundational works | 14: `Zhang_2025`, `Guo_2025`, `Wang_2026`, `Barbarant_2026`, `Kwon_2024`, `Morup_2025`, `arxiv_2506_20065`, `Ferritto_2026`, `Kwon_2025`, `Olaoluwa_2026`, `Abramova_2026`, `Chen_2026`, `He_2026`, `Barbarant_2026a` |
| Currency pass 3 | Titles from the summaries of the currency searches not yet screened, looked up with `the lookup script resolve` | 4 titles found, 2 not yet in the set | 2: `Karunanayake_2026`, `Tang_2026a` (Thiery 2025 and Karimzadeh 2026 were found again and were already in the set) |

The merge run added 95 sources: 43 + 20 + 0 + 10 + 6 + 14 + 2. The set is 130 + 95 = 225.

Search strings of the pair searches, as PubMed received them (from the `querytranslation` of each reply) and as `the lookup script search` was given them, are kept in the session's transcript; the counts above are the totals each interface reported.

### Conditions when the search ended

| # | Condition | Holds | Evidence |
|---|---|---|---|
| 1 | The source count meets the target | yes | 225 against the minimum of 30 |
| 2 | The latest pass added under 10 percent | yes | currency pass 3 added 2 to 223 sources (0.9 percent) |
| 3 | Every theme has at least 3 sources | yes | the smallest theme column (C, entropic OT) holds 11 sources |
| 4 | The citation loop closes | no | chaining round 2 found no uncollected work cited by 3 or more of its seeds, but Harshman 1972, which theme 1's chaining found, has no record in any index and stays uncollected (section 9) |
| 5 | The temporal span is covered | yes | foundational works from 1970 (Carroll and Chang, Harshman) and 85 sources from 2024 to 2026 |

Four conditions hold, condition 2 among them, so the search ended.

### Entries built from a venue page

For these arXiv IDs `the lookup script bibtex` named a published venue, and the entry is the one `the lookup script bibtex '<arXiv ID>' --page '<url>'` printed from the venue page beside the key:

- `arxiv_2110_02753`: https://mlanthology.org/iclr/2022/vincentcuaz2022iclr-semirelaxed/
- `arxiv_2006_09430`: https://mlanthology.org/iclr/2021/kolouri2021iclr-wasserstein/
- `arxiv_2006_12065`: https://mlanthology.org/iclr/2021/mialon2021iclr-trainable/
- `arxiv_1811_01900`: https://mlanthology.org/iclr/2019/murphy2019iclr-janossy/
- `arxiv_2306_05553`: https://mlanthology.org/icmlw/2024/kothapalli2024icmlw-equivariant/
- `arxiv_2208_00993`: https://proceedings.mlr.press/v225/ren23a.html
- `arxiv_2309_16604`: https://mlanthology.org/tmlr/2024/yang2024tmlr-exploiting/
- `arxiv_1506_02025`: https://mlanthology.org/neurips/2015/jaderberg2015neurips-spatial/
- `arxiv_1806_08804`: https://mlanthology.org/neurips/2018/ying2018neurips-hierarchical/
- `arxiv_1906_02085`: https://mlanthology.org/neurips/2019/maretic2019neurips-got/
- `arxiv_1605_05273`: https://proceedings.mlr.press/v48/niepert16.html
- `arxiv_1904_08082`: https://proceedings.mlr.press/v97/lee19c.html

`Liu_2023` (https://mlanthology.org/iclr/2023/liu2023iclr-robust/), `Zeng_2023` (https://mlanthology.org/icml/2023/zeng2023icml-generative/, PMLR 202, pages 40749 to 40769) and `Flamary_2021` (https://jmlr.org/papers/v22/20-451.html, JMLR 22(78), pages 1 to 8) were written from the citation block or the tags of the page named, since no `bibtex` call gave their published entry; each prints `CONFIRMED` under `the lookup script resolve --entry`.

`arxiv_2312_06467` (Thual et al.): Semantic Scholar names a TMLR 2025 version, with the page https://mlanthology.org/tmlr/2025/thual2025tmlr-sampleefficient under the title "Sample-efficient decoding of visual stimuli from fMRI through inter-individual functional alignment". `the lookup script bibtex '2312.06467' --page` on that page printed "citation_title ratio 0.42" and refused it, so the `@misc` entry of the preprint stays, and its annotation's Type names the TMLR version as not confirmed.

### Preprints and their lookups

Labelled preprints after `the lookup script resolve` on the title (this run's lookups, files `pv-1.txt` to `pv-8.txt` in the temporary folder), on the arXiv ID, and `the lookup script bibtex`, none of which found a published version: `arxiv_2605_20883`, `arxiv_2609_23705`, `arxiv_2401_01460`, `arxiv_2203_04964`, `arxiv_2610_18804`, `arxiv_2506_20065` (for this title Semantic Scholar was left out with "HTTP 429 after 3 retries"; Crossref did not find it, and OpenAlex and arXiv returned only the arXiv record). `Barbarant_2026a` is a bioRxiv preprint (DOI 10.64898/2026.05.21.726781; Crossref, OpenAlex and Semantic Scholar return only the bioRxiv record; arXiv: not found). `Harshman_1970` is a working paper (UCLA Working Papers in Phonetics 16), admitted as seminal.

### Entry repairs in the merged `refs.bib`

Every bare `&` in a field was written `\&`; `&amp;` was replaced; the author fields of `Morup_2025` (`Adal{\i}`), the Naderializadeh entry and the Xu entry, the journal name of the Peyre entry and the Kusner entry were corrected from the records `the lookup script resolve` printed; the empty corporate author of `Tu_2020` was removed. Keys given a letter to avoid a collision with an existing key: `Lock_2018a`, `Shifat_E_Rabbi_2025a`, `Chen_2025a`, `Wang_2024a`, `Barbarant_2026a`, `Tang_2026a`, `Chen_2022a`. `the lookup script resolve --entry refs.bib <key>` printed `CONFIRMED` for each of the 225 entries.

## 2. Distribution advisory

Distribution advisory:
- Dimension: method
- Concentration: computational or simulation = 167/225 (74 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: no expansion; the research question asks which methods exist and how they handle correspondence, so method papers are the expected majority. The other method values are review 16, theoretical 15, clinical study 14, benchmark or challenge 7, software 5 and book 1.

The other dimensions trigger no advisory: by decade the 2020s hold 139 of 225 (62 percent), the 2010s 68, the 2000s 10, the 1990s 3 and the 1970s 5; the most frequent venue, the International Conference on Machine Learning, holds 14 of the 216 entries with a journal or booktitle field (6 percent). Geography is left out, since few sources state a study site.

## 3. Screening results

- Initial records: the theme runs' records of section 1, and in the merge run the 51 cut sources, the reference listings of 33 cores and the citing listings of 12 foundational works, 146 PubMed records of the pair searches, 524 `the lookup script` lines of the pair searches, and 144 PubMed records of the currency searches.
- After duplicate removal, title and abstract screening in the merge run tagged 96 candidates (C01 to C96) Include or Maybe, in addition to the 130 sources the theme runs kept.
- Full-text assessment: the 130 theme-run sources were screened again under the criteria above as one set, and all passed; of the 96 merge candidates 95 passed, and the excluded one is below.
- Final included: 225.

Excluded by the merge run:

- Bigalke et al. 2021, "End-to-end Learning of Body Weight Prediction from Point Clouds with Basis Point Sets" (theme 3's Maybe, doi 10.1007/978-3-658-33198-6_59): a candidate that cannot be read, excluded since layer 2 did not mark it "must include" and the seminal rule does not admit it. Lookups tried: `the lookup script fetch` printed "OpenAlex: no open-access URL", "Semantic Scholar: no open-access URL", "no full text and no abstract"; `the lookup script resolve` found Crossref, OpenAlex and Semantic Scholar records at ratio 1.00 and "arXiv: not found"; Europe PMC search by the DOI returned hitCount 0; the page at the DOI, saved with `curl` as `C24.read-1.html`, HTTP 200 at link.springer.com, is a bot-check page ("Client Challenge") with no abstract; a web search for the title found no author copy.
- Dutta 2026 (a record of the merge run's searches): excluded; its venue was flagged as a possibly predatory, broad-scope journal, so its review cannot be relied on.
- otTensor (CRAN package listing, doi 10.32614/cran.package.ottensor): excluded as a software listing with no method paper.
- Generic must-include works of the chaining (such as Adam, attention and ResNet): excluded on relevance (node 3).

Excluded by the theme runs, carried as they stand: theme 2 excluded Kwon 2025 (doi 10.1016/j.media.2025.103538) from its own theme, and the merge run included it under theme G from its abstract (currency pass 2); theme 3 excluded Jin 2024, Adams and Elhabian 2023, Besson 2021 and the unreadable Zhang 2025 (lymphoma multi-lesion aggregation, doi 10.1007/978-3-032-04927-8_31; lookups: `the lookup script resolve` by title with Crossref, OpenAlex and Semantic Scholar records at ratio 1.00 and arXiv left out with HTTP 429; `the lookup script fetch` with no open-access URL and no text or abstract; the DOI page saved with `curl`, HTTP 200 at link.springer.com, a "Client Challenge" page); theme 4 excluded Oh 2025 and Ackaouy 2020 on relevance; the excluded sources of theme 2's cuts (Feydy 2019, Vayer 2019 sliced GW, Xu 2021 graphons, Aburidi 2025) were judged tangential by the merge run.

### A candidate that could not be read

Included as "must include" with the abstract not read; their annotations are written from the record and the `cited-by` count only.

- Galloway 1975, "Texture analysis using gray level run lengths", doi 10.1016/S0146-664X(75)80008-6 (`Galloway_1975`), cited by 3 of theme 4's 10 core papers. Lookups tried: `the lookup script fetch` printed "no full text and no abstract"; Europe PMC search by the DOI, 200, no record; `https://doi.org/10.1016/S0146-664X(75)80008-6`, 200, at `https://linkinghub.elsevier.com/retrieve/pii/S0146664X75800086`, a redirect page with no abstract tag; a web search for the title found no page holding the abstract; `https://scholarhub.vn/publication/Texture-analysis-using-gray-level-run-lengths/41425b7a-64df-4cc7-be52-0f72f6d32ea7`, 200, redirected to `https://scholarhub.vn/publication/browse`, not the record.
- Villani 2009, "Optimal transport: old and new", doi 10.1007/978-3-540-71050-9 (`Villani_2009`), cited by 3 or more core papers. Lookups tried: `the lookup script fetch '10.1007/978-3-540-71050-9'` found no open-access URL in OpenAlex or Semantic Scholar and no text or abstract; `the lookup script resolve` on the DOI found Crossref, OpenAlex and Semantic Scholar records; a web search for an author copy found only library catalogue and bookseller records.

Sources assessed from the abstract only, with the ways tried, are named in each annotation's "Read from" line.

## 4. Annotated bibliography

The annotations stand in this order: theme run 1 (35), theme run 2 (37), theme run 3 (24), theme run 4 (34), each with its Relevance line read with its own theme's parts (section 1), then the 95 the merge run wrote. A duplicate kept by two theme runs stands once, under the first theme that kept it, with what the other annotation adds. `Faes_2024` is earlier work of the user, judged on merit under the same criteria; its annotation says so.


### Kolda, T. G., and Bader, B. W. (2009). Tensor decompositions and applications. [@Kolda_2009]
- **Type**: Journal article (review), SIAM Review.
- **Read from**: the abstract `the lookup script fetch` wrote from the indexes (https://doi.org/10.1137/07070111x answered 403).
- **Method**: Survey.
- **Key results**: Reviews CP (sum of rank-one tensors) and Tucker (higher-order PCA) as the two higher-order extensions of the SVD, and lists further decompositions including INDSCAL, PARAFAC2, CANDELINC, DEDICOM and PARATUCK2, with software.
- **Relevance**: The shared vocabulary for P1 and P2; cited by all 7 core papers.
- **Quality**: High (12): Q1 review, very highly cited; background only.
- **Stance**: Neutral.
- **Potential use**: Introduction, background on tensor models.

### Carroll, J. D., and Chang, J.-J. (1970). Analysis of individual differences in multidimensional scaling via an N-way generalization of "Eckart-Young" decomposition. [@Carroll_1970]
- **Type**: Journal article, Psychometrika.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page: Cambridge abstract page, 200).
- **Method**: Model and algorithm (CANDECOMP), applied to similarity data.
- **Key results**: Proposes an individual-differences scaling model where individuals weight the dimensions of a common space, fitted by a decomposition of three-way tables that yields a stimulus coordinate matrix and a subject weight matrix.
- **Relevance**: P2: the model assumes one common stimulus space across subjects; the subject mode carries only weights.
- **Quality**: High (13): seminal, layer 2 must include.
- **Stance**: Neutral.
- **Potential use**: Background on CP and on subjects sharing one space.

### Harshman, R. A. (1970). Foundations of the PARAFAC procedure: Models and conditions for an "explanatory" multi-modal factor analysis. [@Harshman_1970]
- **Type**: Working paper (UCLA Working Papers in Phonetics 16), seminal; not peer-reviewed.
- **Read from**: https://psychology.uwo.ca/faculty/harshman/wpppfac0.pdf (curl 200), the author's reproduction of the 1970 manuscript.
- **Method**: Model (PARAFAC, parallel proportional profiles), uniqueness proof, simulations and a vowel formant data set.
- **Key results**: Shows that the principle of parallel proportional profiles gives unique, "explanatory" factors for three-way and higher data in the system-variation case, and proves uniqueness under stated conditions; applied to formant frequencies of 11 speakers saying 8 vowels.
- **Relevance**: P2: PARAFAC assumes the same profiles, up to scale, in every slice; PARAFAC2 relaxes this for one mode.
- **Quality**: High (12): seminal (layer 2 must include), working paper venue.
- **Stance**: Neutral.
- **Potential use**: Background on CP and on the parallel-profiles assumption that unaligned data violate.

### Kruskal, J. B. (1977). Three-way arrays: rank and uniqueness of trilinear decompositions. [@Kruskal_1977]
- **Type**: Journal article, Linear Algebra and its Applications.
- **Read from**: the abstract `the lookup script fetch` wrote (ScienceDirect PDF 403).
- **Method**: Theory.
- **Key results**: Defines tensor rank and proves sufficient conditions under which the factors of a triple product are unique up to scaling and permutation, for example when the k-ranks of the three factor matrices sum to at least 2R + 2.
- **Relevance**: P2: the uniqueness that the PARAFAC2 literature extends to one varying mode.
- **Quality**: High (12): seminal theory, must include.
- **Stance**: Neutral.
- **Potential use**: Background on identifiability.

### De Lathauwer, L., De Moor, B., and Vandewalle, J. (2000). A multilinear singular value decomposition. [@De_Lathauwer_2000]
- **Type**: Journal article, SIAM J. Matrix Anal. Appl.
- **Read from**: https://lirias.kuleuven.be/retrieve/55824a96-4822-4187-9b3c-51f7db896854 (full text, via `the lookup script fetch`).
- **Method**: Theory.
- **Key results**: Develops the higher-order SVD and analyses its uniqueness, its link to the matrix eigenvalue decomposition and first-order perturbation, with a symmetric variant.
- **Relevance**: P1: the HOSVD is the computational core of HOPLS and of Tucker tensor regression.
- **Quality**: High (12): seminal, must include.
- **Stance**: Neutral.
- **Potential use**: Background on Tucker models.

### De Lathauwer, L. (2008). Decompositions of a higher-order tensor in block terms, Part II. [@De_Lathauwer_2008]
- **Type**: Journal article, SIAM J. Matrix Anal. Appl.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Theory.
- **Key results**: Introduces block term decompositions characterized by mode-n ranks, with conditions for essential uniqueness; CP and Tucker are special cases.
- **Relevance**: P1: the decomposition behind block-term tensor regression (Faes 2024).
- **Quality**: High (12): must include.
- **Stance**: Neutral.
- **Potential use**: Background.

### Bro, R. (1996). Multiway calibration. Multilinear PLS. [@Bro_1996]
- **Type**: Journal article, Journal of Chemometrics.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Algorithm (N-PLS), fluorescence data from the sugar industry and simulation.
- **Key results**: Presents N-way PLS, stabler than unfold-PLS; on noisy simulated excitation-emission data its predictions were almost twice as good as unfold-PLS despite 125 calibration samples, and on real sugar data predictions were comparable with clearer interpretation.
- **Relevance**: P1: the original multilinear PLS for predicting an outcome from a multiway array whose modes are indexed alike for every sample.
- **Quality**: High (15).
- **Stance**: Neutral.
- **Potential use**: Methods review, multilinear PLS.

### Zhao, Q., et al. (2013). Higher Order Partial Least Squares (HOPLS). [@Qibin_Zhao_2013]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: https://arxiv.org/pdf/1207.1230 (full text, via `the lookup script fetch`).
- **Method**: Model and algorithm; synthetic data and ECoG decoding of 3D movement trajectories.
- **Key results**: Predicts a tensor Y from a tensor X through a sum of orthogonal Tucker blocks found by HOSVD of a generalized cross-covariance tensor; reported better prediction, small-sample behaviour and noise robustness than existing methods.
- **Relevance**: P1: the tensor-to-tensor form of multilinear PLS.
- **Quality**: High (15).
- **Stance**: Neutral.
- **Potential use**: Methods review, multilinear PLS.

### Zhang, X., and Li, L. (2017). Tensor envelope partial least-squares regression. [@Zhang_2017]
- **Type**: Journal article, Technometrics.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Model, population theory, simulations and two neuroimaging analyses.
- **Key results**: Proposes a tensor PLS algorithm with a population interpretation linked to sufficient dimension reduction, and proves consistency of the estimator.
- **Relevance**: P1 and P3: statistical grounding of tensor PLS, applied to neuroimaging.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review, multilinear PLS.

### Park, K., and Keles, S. (2025). Sparse higher-order partial least squares. [@Park_2025]
- **Type**: Journal article, Biometrika.
- **Read from**: https://arxiv.org/pdf/2310.09428 (full text, via `the lookup script fetch`).
- **Method**: Theory, algorithm (SHOPS), simulations, single-cell 3D data.
- **Key results**: Shows that the HOPLS estimator is not guaranteed consistent when tensor dimensions and features grow faster than the sample size, and proposes SHOPS for simultaneous variable selection, dimension reduction and tensor-response denoising with high-dimensional asymptotics.
- **Relevance**: P1: the current statistical state of multilinear PLS.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review, limits of HOPLS.

### Faes, A., Camarrone, F., and Van Hulle, M. M. (2024). Single finger trajectory prediction using block-term tensor regression. [@Faes_2024]
- **Type**: Journal article, IEEE TNNLS (published online 2022, issue 2024). An earlier work of the author of this review, screened and scored under the same criteria as every other source.
- **Read from**: https://lirias.kuleuven.be/retrieve/ef486b28-a0d2-495d-b4cb-48cf570a2965 (full text, via `the lookup script fetch`).
- **Method**: Algorithm (BTTR with two new factorizations and a marginalization procedure), ECoG decoding.
- **Key results**: Integrates two tensor factorizations into block-term tensor regression with automatic component extraction and a marginalization that reduces overfitting; reports a performance gain over vector- and matrix-based decoders on ECoG recorded with electrode grids or strips.
- **Relevance**: P1 and P3: tensor regression on a spatial mode (electrodes) whose layout is fixed within a subject.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review, block-term regression.

### Sun, D., Peng, L., Qiu, Z., Guo, Y., and Manatunga, A. (2024). Partial quantile tensor regression. [@Sun_2024]
- **Type**: Journal article, JASA.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC12448065/ (curl 200).
- **Method**: Model (PQTR), theory, simulations, PTSD neuroimaging.
- **Key results**: Applies the PLS principle to quantile regression with a tensor covariate, proves root-n consistency under an envelope quantile tensor model, and in 98 PTSD patients relates resting-state connectivity among 279 atlas nodes (Seitzman atlas, after 21 nodes with missing data were removed) to symptom severity.
- **Relevance**: P1 and P3: PLS-type dimension reduction for an outcome; the spatial mode is a fixed atlas parcellation shared by all subjects.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review, multilinear PLS; P3 on atlas-based alignment.

### Zhou, H., Li, L., and Zhu, H. (2013). Tensor regression with applications in neuroimaging data analysis. [@Zhou_2013]
- **Type**: Journal article, JASA.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC4004091/ (curl 200; Europe PMC fullTextXML answered 500 first).
- **Method**: Model (GLM with a CP-structured coefficient tensor), maximum likelihood algorithm, asymptotics, ADHD-200 MRI.
- **Key results**: Reduces ultrahigh-dimensional image covariates to a manageable number of parameters through a low-rank CP coefficient; the MRI images were processed by AC-PC correction, bias correction, skull-stripping, segmentation into four tissues and registration, and RAVENS maps were built from the registration deformation field.
- **Relevance**: P1 and P3: the reference scalar-on-image tensor regression, which presupposes registration and segmentation so that voxel (i, j, k) means the same location in every subject.
- **Quality**: High (15). Core paper.
- **Stance**: Neutral.
- **Potential use**: Methods review; P3 on dependence on registration.

### Li, X., Xu, D., Zhou, H., and Li, L. (2018). Tucker tensor regression and neuroimaging analysis. [@Li_2018]
- **Type**: Journal article, Statistics in Biosciences.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC8336908/ (curl 200).
- **Method**: Model (Tucker coefficient), simulations, MRI data.
- **Key results**: Tucker regression allows a different number of factors per mode, which reduces parameters further, accommodates images with skewed dimensions and gives a principled image downsizing through a duality lemma.
- **Relevance**: P1 and P3: the Tucker form of image regression; works on voxel arrays of equal size across subjects.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Hoff, P. D. (2015). Multilinear tensor regression for longitudinal relational data. [@Hoff_2015]
- **Type**: Journal article, Annals of Applied Statistics.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC4957660/ (curl 200).
- **Method**: Bayesian model with Kronecker-structured coefficients and separable covariance; international relations data.
- **Key results**: A multilinear tensor regression in which a tensor of relations is regressed on earlier tensors via a Tucker-product coefficient, representing reciprocity and transitivity.
- **Relevance**: P1: tensor-on-tensor regression with separable structure; nodes are the same across time points.
- **Quality**: High (13). Core paper.
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor-on-tensor regression.

### Lock, E. F. (2018). Tensor-on-tensor regression. [@Lock_2018]
- **Type**: Journal article, JCGS.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC6188709/ (curl 200).
- **Method**: Model (contracted tensor product with reduced CP rank), ridge-penalized estimation, Gibbs sampler; facial images.
- **Key results**: A framework predicting a tensor of any order from another tensor that includes scalar-on-tensor and tensor-on-scalar regression as special cases.
- **Relevance**: P1.
- **Quality**: High (14). Core paper.
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Guhaniyogi, R., Qamar, S., and Dunson, D. B. (2017). Bayesian tensor regression. [@arxiv_1509_06490]
- **Type**: Journal article, JMLR 18 (published version; entry from https://jmlr.org/papers/v18/16-362.html).
- **Read from**: https://arxiv.org/html/1509.06490 (full text, via `the lookup script fetch`).
- **Method**: Bayesian GLM with a PARAFAC coefficient and multiway Dirichlet generalized double Pareto shrinkage priors; posterior consistency; simulations and 3D MRI (30 x 30 x 30) of 550 adolescents with a simulated response.
- **Key results**: The priors shrink unimportant voxel coefficients and select rank within and across components, giving uncertainty measures in small samples.
- **Relevance**: P1 and P3: Bayesian scalar-on-image regression on voxel grids shared across subjects.
- **Quality**: High (15).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Papadogeorgou, G., Zhang, Z., and Dunson, D. B. (2021). Soft tensor regression. [@arxiv_1910_09699]
- **Type**: Journal article, JMLR 22 (published version; entry from https://www.jmlr.org/papers/v22/20-476.html).
- **Read from**: https://arxiv.org/html/1910.09699 (full text, via `the lookup script fetch`).
- **Method**: Bayesian soft PARAFAC (Softer); Human Connectome Project structural connectomics.
- **Key results**: Lets each row's contribution vary around a row-specific mean, which improved coefficient estimation, identification of important entries and prediction at low rank; applied to connections among a fixed set of brain regions.
- **Relevance**: P1 and P3: region-level (atlas) inputs, so correspondence comes from the parcellation, not voxel registration.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review; P3.

### Kossaifi, J., et al. (2020). Tensor regression networks. [@arxiv_1707_08308]
- **Type**: Journal article, JMLR 21 (published version; entry from https://jmlr.org/papers/v21/18-503.html).
- **Read from**: https://arxiv.org/html/1707.08308 (full text, via `the lookup script fetch`).
- **Method**: Deep learning layers (tensor contraction layers and tensor regression layers).
- **Key results**: Introduces tensor contraction layers, which reduce dimensionality while keeping multilinear structure, and tensor regression layers, which express outputs through a low-rank multilinear map from a high-order activation tensor; both are learned end to end.
- **Relevance**: P1: tensor regression inside a neural network; the input grid is fixed.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review, deep tensor regression.

### Llosa-Vite, C., and Maitra, R. (2023). Reduced-rank tensor-on-tensor regression and tensor-variate ANOVA. [@Llosa_Vite_2023]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: the abstract `the lookup script fetch` wrote.
- **Method**: Model with four low-rank tensor formats and tensor-normal errors; fMRI and face images.
- **Key results**: Maximum likelihood by block relaxation with asymptotics; one-way TANOVA identifies cerebral regions associated with group by word-type interaction in an fMRI study.
- **Relevance**: P1 and P3.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Miranda, M. F., Zhu, H., and Ibrahim, J. G. (2018). TPRM: tensor partition regression models. [@Miranda_2018]
- **Type**: Journal article, Annals of Applied Statistics.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC6221472/ (curl 200).
- **Method**: Bayesian hierarchical model (partition, CP, principal components, sparse GLM); ADNI structural MRI.
- **Key results**: Predicts Alzheimer versus control from subtensors of the image; the T1 images were processed with the HAMMER pipeline (skull-stripping, segmentation) and then registered.
- **Relevance**: P1 and P3: partitions a registered image into blocks before regression.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review; P3 on registration.

### Xu, T., Chen, K., and Li, G. (2024). Tensor regression for incomplete observations. [@Xu_2024]
- **Type**: Journal article, Annals of Applied Statistics.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC11446469/ (curl 200).
- **Method**: Scalar-on-tensor regression (sample by feature by time) with a covariance-based estimator; preterm infant microbiome and an aging study.
- **Key results**: Estimates time-varying effects from blockwise-missing longitudinal data using all available observations without imputation.
- **Relevance**: P1 and P2: an outcome model on a tensor whose time mode is incompletely observed per subject.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review; P2.

### Spencer, D. A., et al. (2024). Bayesian scalar-on-tensor regression using the Tucker decomposition for sparse spatial modeling. [@Spencer_2024]
- **Type**: Journal article, Biostatistics.
- **Read from**: https://arxiv.org/pdf/2203.04733 (full text, via `the lookup script fetch`).
- **Method**: Bayesian Tucker regression with regularization; ADNI tensor-based morphometry.
- **Key results**: Retains spatial structure of the coefficient tensor with fewer parameters; the ADNI images are tensor-based morphometry values relative to a structural template to which subject scans were registered.
- **Relevance**: P1 and P3: depends on registration, since the morphometry values are deformations to a template.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review; P3.

### Pietrosanu, M., Yu, D., Mizera, I., Jiang, B., and Kong, L. (2026). Regularized tensor quantile regression. [@Pietrosanu_2026]
- **Type**: Journal article, Statistics in Medicine.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC13183480/ (curl 200).
- **Method**: Quantile regression with a tensor covariate, regularized through the tensor estimate; simulations and a neuroimaging analysis.
- **Key results**: Regularizing the tensor estimate rather than the decomposition's parameters mitigates noise and overfitting and identifies spatial regions of positive and negative association.
- **Relevance**: P1 and P3.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Kiers, H. A. L., ten Berge, J. M. F., and Bro, R. (1999). PARAFAC2, Part I. A direct fitting algorithm. [@Kiers_1999]
- **Type**: Journal article, Journal of Chemometrics.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Algorithm.
- **Key results**: PARAFAC2 applies when the data matrices share column units but have different (numbers of) row units, keeps uniqueness under mild assumptions, and is fitted directly to the data matrices, which allows constraints and missing data.
- **Relevance**: P2: the model for a mode that differs in size and order across subjects.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review, unaligned-mode decompositions.

### Bro, R., Andersson, C. A., and Kiers, H. A. L. (1999). PARAFAC2, Part II. Retention time shifts. [@Bro_1999]
- **Type**: Journal article, Journal of Chemometrics.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Application to size-exclusion chromatography of sugar juice.
- **Key results**: Treats retention time shifts as a violation of parallel proportional profiles and models them with PARAFAC2, which only requires that the cross-products of the elution profile matrix stay constant across samples.
- **Relevance**: P2: the clearest statement of how PARAFAC2 replaces alignment by a constant cross-product constraint.
- **Quality**: High (15).
- **Stance**: Neutral.
- **Potential use**: Methods review; P2.

### Perros, I., et al. (2017). SPARTan: scalable PARAFAC2 for large and sparse data. [@Perros_2017]
- **Type**: Conference paper, KDD.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Algorithm; synthetic and pediatric EHR data.
- **Key results**: States the problem as subjects whose observations "do not align naturally"; reformulates PARAFAC2 fitting for a 22-fold speed-up and mines temporally evolving phenotypes endorsed by clinicians.
- **Relevance**: P2.
- **Quality**: High (14). Core paper.
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Afshar, A., et al. (2018). COPA: constrained PARAFAC2 for sparse and large datasets. [@Afshar_2018]
- **Type**: Conference paper, CIKM.
- **Read from**: https://pmc.ncbi.nlm.nih.gov/articles/PMC7472553/ (curl 200).
- **Method**: AO-ADMM with smoothness, sparsity and non-negativity constraints; EHR with hundreds of thousands of patients.
- **Key results**: Up to 36 times faster than prior PARAFAC2 approaches at the same accuracy, with concise phenotypes and temporal profiles confirmed by a medical expert.
- **Relevance**: P2.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Roald, M., et al. (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes. [@Roald_2022]
- **Type**: Journal article, SIAM J. Math. Data Sci.
- **Read from**: the abstract `the lookup script fetch` wrote (DOI page 403).
- **Method**: Algorithm; simulations, neuroscience and chemometrics data.
- **Key results**: Fits PARAFAC2 with general penalties and hard constraints on the evolving mode, which the implicit ALS approach could not; constraining the evolving mode improved interpretability.
- **Relevance**: P2: names "unaligned time profiles" as the use case.
- **Quality**: High (14). Core paper.
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Konyar, E., and Gahrooei, M. R. (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping. [@Konyar_2025]
- **Type**: Journal article, IEEE JBHI.
- **Read from**: the abstract `the lookup script fetch` wrote (IEEE page 202, no text).
- **Method**: Semi-supervised PARAFAC2; synthetic data and MIMIC-IV.
- **Key results**: Integrates labels available for a subset of patients into the decomposition of irregular EHR tensors (varying hospital visits) and reports superiority over benchmarks.
- **Relevance**: P1 x P2: the one kept source that supervises an unaligned-mode decomposition with an outcome; its irregular mode is time, not space.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review; gaps.

### Schenker, C., Wang, X., Horner, D., Rasmussen, M. A., and Acar, E. (2025). PARAFAC2-based coupled matrix and tensor factorizations with constraints. [@Schenker_2025]
- **Type**: Journal article, IEEE JSTSP.
- **Read from**: https://arxiv.org/pdf/2406.12338 (full text, via `the lookup script fetch`).
- **Method**: Algorithm for coupled factorizations with PARAFAC2.
- **Key results**: Brings PARAFAC2, which handles irregular or ragged tensors and unaligned time profiles, into coupled matrix and tensor factorizations with flexible constraints for fusing several sources.
- **Relevance**: P2: fusion of sources with one unaligned mode.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Chatzis, C., Schenker, C., Pfeffer, M., and Acar, E. (2025). tPARAFAC2: tracking evolving patterns in (incomplete) temporal data. [@Chatzis_2025]
- **Type**: Journal article, Data Mining and Knowledge Discovery.
- **Read from**: https://link.springer.com/content/pdf/10.1007/s10618-025-01122-6.pdf (full text, via `the lookup script fetch`).
- **Method**: PARAFAC2 with temporal smoothness on the evolving factors; AO-ADMM for partially observed data.
- **Key results**: Tracks evolving patterns while keeping the uniqueness that interpretation needs, and extends the fitting framework to incomplete data.
- **Relevance**: P2.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.

### Hu, Y., Jiang, T.-X., Ng, M. K., and Zhao, X.-L. (2026). Separable decomposition for ragged tensors. [@Hu_2026]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: the abstract `the lookup script fetch` wrote (IEEE page 202, no text).
- **Method**: CP-based decomposition with a binary weighting tensor for the valid domain; proximal alternating minimization with a convergence guarantee.
- **Key results**: Factorizes multidimensionally irregular (ragged) tensors directly; validated on multispectral and hyperspectral images and spatial transcriptomics with better accuracy and efficiency than baselines.
- **Relevance**: P2: irregularity in spatial modes, unsupervised.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review; gaps.

### Ramirez, A., et al. (2025). Integrative analysis of single-cell gene expression across conditions with PARAFAC2-RISE. [@Ramirez_2025]
- **Type**: Journal article, Cell Systems.
- **Read from**: the abstract `the lookup script fetch` wrote (PMC page answered with a browser check).
- **Method**: PARAFAC2 adaptation (RISE); single-cell RNA-seq of drug perturbations and lupus patient samples.
- **Key results**: Reduces single-cell data across conditions, associating gene variation patterns with patients or perturbations and connecting each pattern to single cells without cell-type annotations.
- **Relevance**: P2: PARAFAC2 applied to single-cell data across conditions, linking each pattern to single cells without cell-type annotations; unsupervised.
- **Quality**: High (14).
- **Stance**: Neutral.
- **Potential use**: Methods review; P2.

### Jorgensen, P. J. H., et al. (2024). Probabilistic PARAFAC2. [@J_rgensen_2024]
- **Type**: Journal article, Entropy.
- **Read from**: the abstract `the lookup script fetch` wrote (PMC page answered with a browser check; MDPI page 403).
- **Method**: Two probabilistic formulations with variational Bayes; synthetic, fluorescence and GC-MS data.
- **Key results**: Describes PARAFAC2 as suited to a mode with "incomparable observation units"; the probabilistic versions were more robust to noise and model order misspecification than direct fitting.
- **Relevance**: P2.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review.




### Cuturi (2013). Sinkhorn distances: lightspeed computation of optimal transport. [@arxiv_1306_0895]
- **Type**: Conference paper (NeurIPS 26), venue confirmed on its proceedings page; seminal.
- **Read from**: https://arxiv.org/html/1306.0895
- **Method**: Entropic regularization of the transport linear program, solved by Sinkhorn-Knopp matrix scaling.
- **Key results**: The regularized optimum is a distance that Sinkhorn-Knopp computes several orders of magnitude faster than transport solvers. It improves on classical transport distances on MNIST.
- **Relevance**: The solver every later method of this theme builds on (P2).
- **Quality**: High (13); foundational, small benchmark.
- **Stance**: Neutral (enabling method).
- **Potential use**: Background on entropic transport.

### Peyre and Cuturi (2019). Computational optimal transport with applications to data sciences. [@Peyr__2019]
- **Type**: Journal article (review), Foundations and Trends in Machine Learning.
- **Read from**: https://arxiv.org/html/1803.00567
- **Method**: Review of transport theory with a bias to numerical methods.
- **Key results**: Covers the Kantorovich problem, entropic solvers, barycenters and the generalizations of transport, and connects them with statistics, kernels and information theory.
- **Relevance**: Reference for every strand of the theme (P2).
- **Quality**: High (13); review, no original data.
- **Stance**: Neutral.
- **Potential use**: Introduction and methods background.

### Benamou et al. (2015). Iterative Bregman projections for regularized transportation problems. [@Benamou_2015]
- **Type**: Journal article, SIAM Journal on Scientific Computing; seminal.
- **Read from**: https://arxiv.org/pdf/1412.5154
- **Method**: Entropic transport as a KL Bregman projection onto split linear constraints, solved by iterative Bregman projections or Bregman-Dykstra.
- **Key results**: One framework computes barycenters, multi-marginal transport, partial and unbalanced transport and capacity-constrained transport with closed-form projections.
- **Relevance**: The standard algorithm for entropic barycenters (P2).
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods background on barycenters.

### Altschuler, Weed and Rigollet (2017). Near-linear time approximation algorithms for optimal transport via Sinkhorn iteration. [@arxiv_1705_09634]
- **Type**: Conference paper (NeurIPS 30).
- **Read from**: https://arxiv.org/html/1705.09634
- **Method**: Complexity analysis of Sinkhorn iteration and a greedy variant, Greenkhorn.
- **Key results**: Sinkhorn distances approximate general transport distances in near-linear time. Greenkhorn has the same guarantees and outperforms Sinkhorn in simulations.
- **Relevance**: Cost argument for entropic transport at scale (P2).
- **Quality**: Medium (11); theory with simulations; marked "must include".
- **Stance**: Neutral.
- **Potential use**: Methods background.

### Frogner et al. (2015). Learning with a Wasserstein loss. [@arxiv_1506_05439]
- **Type**: Conference paper (NeurIPS 28); seminal.
- **Read from**: https://arxiv.org/html/1506.05439
- **Method**: An entropic Wasserstein loss for multi-label prediction, extended to unnormalized measures, with a learning bound.
- **Key results**: The loss makes predictions smooth with respect to a metric on the output space, shown on tag prediction.
- **Relevance**: Early transport loss in supervised learning (P1).
- **Quality**: High (13).
- **Stance**: Supports transport losses for supervised prediction.
- **Potential use**: Supervised learning with transport.

### Agueh and Carlier (2011). Barycenters in the Wasserstein space. [@Agueh_2011]
- **Type**: Journal article, SIAM Journal on Mathematical Analysis; seminal.
- **Read from**: the abstract file of `the lookup script fetch` (OpenAlex abstract; HAL page https://hal.science/hal-00637399 was not a PDF)
- **Method**: Theory: existence, uniqueness, characterization and regularity of the Wasserstein barycenter, linked to multi-marginal transport.
- **Key results**: Defines the barycenter of more than two measures, generalizing McCann's interpolation, and solves the Gaussian case.
- **Relevance**: Defines the barycenter as a template of a population of measures (P2).
- **Quality**: High (12); theoretical.
- **Stance**: Neutral.
- **Potential use**: Definition of barycenters.

### Cuturi and Doucet (2014). Fast computation of Wasserstein barycenters. [@arxiv_1310_4375]
- **Type**: Conference paper (ICML 2014, PMLR 32), year confirmed on its proceedings page; seminal.
- **Read from**: https://arxiv.org/html/1310.4375
- **Method**: Two subgradient algorithms for the barycenter of empirical measures, with entropic smoothing for cheap gradients.
- **Key results**: Smoothing gives a strictly convex objective whose gradients come from matrix scaling; shown on image families and constrained clustering.
- **Relevance**: Computable barycenters of point clouds (P2).
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Barycenter methods.

### Bazeille et al. (2019). Local optimal transport for functional brain template estimation. [@Bazeille_2019]
- **Type**: Conference paper (IPMI 2019, LNCS).
- **Read from**: https://hal.science/hal-02278663 (`citation_abstract`)
- **Method**: Entropic transport to build a functional brain template from multi-subject, multi-contrast data.
- **Key results**: The template-based inference improves the transfer of information across individuals over the methods compared.
- **Relevance**: A learned template replaces anatomical correspondence in neuroimaging (P2, P3).
- **Quality**: High (12).
- **Stance**: Supports transport templates.
- **Potential use**: Templates in medical imaging.

### Memoli (2011). Gromov-Wasserstein distances and the metric approach to object matching. [@M_moli_2011]
- **Type**: Journal article, Foundations of Computational Mathematics; seminal.
- **Read from**: https://www.math.ucdavis.edu/~saito/data/acha.read.w12/memoli-gromov-dist.pdf
- **Method**: Theory: objects as metric measure spaces, a Gromov-Wasserstein distance from mass transport, its topology and polynomial-time lower bounds.
- **Key results**: The distance is a metric on isomorphism classes of metric measure spaces, and it bounds several shape-matching invariants from below.
- **Relevance**: Defines the comparison of objects that share no common space (P2).
- **Quality**: High (13); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Definition of Gromov-Wasserstein.

### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein averaging of kernel and distance matrices. [@Peyre_2016]
- **Type**: Conference paper (ICML 2016), per Semantic Scholar; no DOI.
- **Read from**: https://hal.science/hal-01322992 (`citation_abstract`)
- **Method**: Entropic Gromov-Wasserstein and the barycenter of distance or kernel matrices of unequal size without row correspondence.
- **Key results**: An iterative algorithm for the nonconvex barycenter, applied to shape barycenters and to predicting molecular energy levels.
- **Relevance**: The first Gromov-Wasserstein barycenter and an early prediction use (P1, P2).
- **Quality**: High (14); marked "must include".
- **Stance**: Supports barycenter templates.
- **Potential use**: Gromov-Wasserstein barycenters.

### Chowdhury and Memoli (2019). The Gromov-Wasserstein distance between networks and stable network invariants. [@Chowdhury_2019]
- **Type**: Journal article, Information and Inference.
- **Read from**: https://arxiv.org/pdf/1808.04337
- **Method**: Theory: a network Gromov-Wasserstein distance on weighted directed networks, with transport-based lower bounds.
- **Key results**: Proves its properties and tests the bounds on simulated networks and on bilateral migration data.
- **Relevance**: Extends the distance to general networks (P2).
- **Quality**: Medium (11); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Theory background.

### Vayer et al. (2019). Optimal transport for structured data with application on graphs. [@arxiv_1805_09114]
- **Type**: Conference paper (ICML 2019, PMLR 97), year confirmed on its proceedings page.
- **Read from**: https://arxiv.org/html/1805.09114
- **Method**: The fused Gromov-Wasserstein distance, which transports features and structure jointly.
- **Key results**: Outperforms graph kernels and graph convolutional networks on graph classification, and gives barycenters of structured objects.
- **Relevance**: The distance most templates and dictionaries of the theme use (P1, P2).
- **Quality**: High (14); marked "must include".
- **Stance**: Supports transport for structured prediction.
- **Potential use**: Core method.

### Vayer et al. (2020). Fused Gromov-Wasserstein distance for structured objects. [@Vayer_2020]
- **Type**: Journal article, Algorithms (MDPI).
- **Read from**: https://www.mdpi.com/1999-4893/13/9/212/pdf?version=1599119885
- **Method**: Theory of the fused distance in the continuous setting.
- **Key results**: Proves metric and interpolation properties and a concentration result for finite samples.
- **Relevance**: The statistical footing of the fused distance (P2).
- **Quality**: Medium (11); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Theory background.

### Xu et al. (2019). Gromov-Wasserstein learning for graph matching and node embedding. [@arxiv_1901_06003]
- **Type**: Conference paper (ICML 2019, PMLR 97).
- **Read from**: https://arxiv.org/html/1901.06003
- **Method**: Joint graph matching and node embedding by minimizing a regularized Gromov-Wasserstein discrepancy with a proximal point method.
- **Key results**: Outperforms the matching methods compared on real networks.
- **Relevance**: Coupling as a learned correspondence (P2).
- **Quality**: High (13); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Correspondence by coupling.

### Xu, Luo and Carin (2019). Scalable Gromov-Wasserstein learning for graph partitioning and matching. [@arxiv_1905_07645]
- **Type**: Conference paper (NeurIPS 32).
- **Read from**: https://arxiv.org/html/1905.07645
- **Method**: Recursive partitioning with a proximal gradient solver and a learned barycenter graph for several graphs.
- **Key results**: Brings Gromov-Wasserstein to large graphs at $O(K(E+V)\log_K V)$ and unifies partitioning and matching.
- **Relevance**: Barycenter graph as a learned partition template (P2).
- **Quality**: Medium (11); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Scaling.

### Sejourne, Vialard and Peyre (2021). The unbalanced Gromov-Wasserstein distance: conic formulation and relaxation. [@arxiv_2009_04266]
- **Type**: Conference paper (NeurIPS 34), year confirmed on its proceedings page.
- **Read from**: https://arxiv.org/html/2009.04266
- **Method**: Two unbalanced Gromov-Wasserstein formulations, a divergence with entropic solver and a conic distance.
- **Key results**: Compares metric spaces with arbitrary positive measures up to isometry; shown on synthetic and positive-unlabeled domain adaptation data.
- **Relevance**: Relaxes mass conservation, which matters when sets differ in size (P2).
- **Quality**: Medium (11); marked "must include" in pass 2.
- **Stance**: Neutral.
- **Potential use**: Unbalanced variants.

### Thual et al. (2022). Aligning individual brains with fused unbalanced Gromov-Wasserstein. [@Thual_2022]
- **Type**: Conference paper (NeurIPS 35).
- **Read from**: https://arxiv.org/html/2206.09398
- **Method**: Fused unbalanced Gromov-Wasserstein alignment of cortical surfaces from functional signatures, penalizing large deformations.
- **Key results**: Landmark-free whole-brain alignment increases between-subject correlation on independent data and sharpens group maps; the unbalanced term handles areas that differ in size.
- **Relevance**: Transport replaces anatomical co-registration across subjects (P2, P3).
- **Quality**: High (13).
- **Stance**: Supports transport over co-registration.
- **Potential use**: Medical-imaging use of fused transport.

### Vincent-Cuaz et al. (2022). Semi-relaxed Gromov-Wasserstein divergence and applications on graphs. [@arxiv_2110_02753]
- **Type**: Conference paper (ICLR 2022); entry from the proceedings page https://mlanthology.org/iclr/2022/vincentcuaz2022iclr-semirelaxed/ via `the lookup script bibtex 2110.02753 --page`.
- **Read from**: https://arxiv.org/html/2110.02753
- **Method**: Relaxes one marginal constraint of Gromov-Wasserstein.
- **Key results**: Computational gains and an efficient dictionary learning algorithm, shown on partitioning, clustering and completion.
- **Relevance**: A template that need not match every node mass (P2).
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Dictionary variants.

### Schmitz et al. (2018). Wasserstein dictionary learning. [@Schmitz_2018]
- **Type**: Journal article, SIAM Journal on Imaging Sciences.
- **Read from**: https://arxiv.org/pdf/1708.01955
- **Method**: Histograms reconstructed as entropic Wasserstein barycenters of learned atoms, with gradients by differentiating Sinkhorn iterations.
- **Key results**: Learns atoms and barycentric weights jointly, a nonlinear dictionary in place of the matrix product.
- **Relevance**: The template-dictionary idea before graphs (P2).
- **Quality**: High (13); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Dictionaries.

### Xu (2020). Gromov-Wasserstein factorization models for graph clustering. [@Xu_2020]
- **Type**: Conference paper (AAAI 2020, published as a journal-style proceedings article).
- **Read from**: https://arxiv.org/html/1911.08530
- **Method**: Graphs estimated as Gromov-Wasserstein barycenters of learned atoms, with unrolled solvers and backpropagation.
- **Key results**: Atoms and graphs can be unaligned and of different sizes; encouraging clustering results.
- **Relevance**: Learnable templates for unaligned graphs (P2).
- **Quality**: High (12); marked "must include".
- **Stance**: Neutral.
- **Potential use**: Dictionaries.

### Xu et al. (2023). Representing graphs via Gromov-Wasserstein factorization. [@Xu_2023]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: the abstract file of `the lookup script fetch` (no open-access URL)
- **Method**: Each graph reconstructed by a weighted combination of shared graph factors under Gromov-Wasserstein; weights give a permutation-invariant representation.
- **Key results**: Factors and weights learned jointly by minimizing reconstruction error, for graphs of unknown node correspondence and different sizes.
- **Relevance**: Template weights as features for downstream prediction (P1, P2).
- **Quality**: High (14).
- **Stance**: Supports templates.
- **Potential use**: Dictionaries and representations.

### Vincent-Cuaz et al. (2021). Online graph dictionary learning. [@arxiv_2102_06555]
- **Type**: Conference paper (ICML 2021, PMLR 139).
- **Read from**: https://arxiv.org/html/2102.06555
- **Method**: Online stochastic dictionary learning with a Gromov-Wasserstein fitting term on unregistered graphs.
- **Key results**: Graphs modeled as convex combinations of atoms, extended to labeled graphs, with an upper bound for fast approximation; shown on unsupervised embedding and subspace tracking.
- **Relevance**: Learned atoms for unregistered inputs (P2).
- **Quality**: High (13); marked "must include".
- **Stance**: Supports templates.
- **Potential use**: Dictionaries.

### Vincent-Cuaz et al. (2022). Template based graph neural network with optimal transport distances. [@Vincent_Cuaz_2022]
- **Type**: Conference paper (NeurIPS 35).
- **Read from**: https://arxiv.org/html/2205.15733
- **Method**: A layer that outputs fused Gromov-Wasserstein distances to learnable template graphs, fed to a classifier, trained end to end.
- **Key results**: Competitive with or above kernel and GNN methods on synthetic and real graph classification, with an ablation and a sensitivity study.
- **Relevance**: The supervised learnable-template method closest to the research question (P1, P2).
- **Quality**: High (13).
- **Stance**: Supports learnable templates.
- **Potential use**: Core method.

### Zhang et al. (2024). Wasserstein discriminant dictionary learning for graph representation. [@Zhang_2024]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: the abstract file of `the lookup script fetch` (no open-access URL)
- **Method**: A dictionary of graph keys, a Wasserstein graph representation by dictionary lookup, and a discriminant loss on the keys.
- **Key results**: Learns keys that are compact within a class and dispersed between classes, bypassing global Wasserstein centers.
- **Relevance**: Discriminative template learning (P1, P2).
- **Quality**: High (13).
- **Stance**: Supports templates.
- **Potential use**: Supervised dictionaries.

### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport. [@arxiv_2605_20883]
- **Type**: Preprint (arXiv); published version looked for with `the lookup script resolve` on its title and its arXiv ID and with `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2605.20883
- **Method**: Fused Gromov-Wasserstein dictionary learning on fMRI without projecting to a common template, with amortized transport plans predicted by a network.
- **Key results**: On HCP data the dictionaries capture geometric variability across individuals and keep the information that downstream tasks use.
- **Relevance**: Transport dictionaries on unaligned brain data, removing the template projection (P2, P3).
- **Quality**: Medium (11); preprint.
- **Stance**: Supports transport over template projection.
- **Potential use**: Medical-imaging use of dictionaries.

### Brogat-Motte et al. (2022). Learning to predict graphs with fused Gromov-Wasserstein barycenters. [@arxiv_2202_03813]
- **Type**: Conference paper (ICML 2022, PMLR 162).
- **Read from**: https://arxiv.org/html/2202.03813
- **Method**: Regression with a fused loss, predicting a barycenter whose weights depend on the input; kernel ridge and neural variants.
- **Key results**: Consistency and excess-risk bounds for the kernel estimator; good metabolite identification with little engineering.
- **Relevance**: Barycenter-based supervised prediction with structured outputs (P1).
- **Quality**: High (13).
- **Stance**: Supports barycenter prediction.
- **Potential use**: Supervised learning.

### Krzakala et al. (2024). Any2Graph: deep end-to-end supervised graph prediction with an optimal transport loss. [@Krzakala_2024]
- **Type**: Conference paper (NeurIPS 37).
- **Read from**: https://arxiv.org/html/2402.12269
- **Method**: A partially-masked fused Gromov-Wasserstein loss, permutation invariant and differentiable, for graphs of any size.
- **Key results**: Outperforms competitors on a synthetic dataset, Sat2Graph and Fingerprint2Graph.
- **Relevance**: Transport loss for permutation-free supervised learning (P1).
- **Quality**: High (12).
- **Stance**: Supports transport losses.
- **Potential use**: Supervised learning.

### Togninalli et al. (2019). Wasserstein Weisfeiler-Lehman graph kernels. [@arxiv_1906_01277]
- **Type**: Conference paper (NeurIPS 32).
- **Read from**: https://arxiv.org/html/1906.01277
- **Method**: Wasserstein distance between node-embedding distributions from a WL-style scheme for continuous attributes.
- **Key results**: Improves on the state of the art on several graph classification tasks.
- **Relevance**: Graphs as distributions instead of means (P1).
- **Quality**: High (14); marked "must include".
- **Stance**: Supports transport over pooling.
- **Potential use**: Supervised learning on graphs.

### Kolouri et al. (2021). Wasserstein embedding for graph learning. [@arxiv_2006_09430]
- **Type**: Conference paper (ICLR 2021); entry from the proceedings page https://mlanthology.org/iclr/2021/kolouri2021iclr-wasserstein/ via `the lookup script bibtex 2006.09430 --page`.
- **Read from**: https://arxiv.org/html/2006.09430
- **Method**: Monge maps from a reference distribution to each graph's node embeddings give a fixed-size vector.
- **Key results**: State-of-the-art graph property prediction with cost linear in the number of graphs.
- **Relevance**: A reference measure as the shared template (P1, P2).
- **Quality**: High (13).
- **Stance**: Supports reference embeddings.
- **Potential use**: Supervised learning.

### Wang et al. (2012). A linear optimal transportation framework for quantifying and visualizing variations in sets of images. [@Wang_2012]
- **Type**: Journal article, International Journal of Computer Vision; seminal.
- **Read from**: the abstract file of `the lookup script fetch` (PMC page https://pmc.ncbi.nlm.nih.gov/articles/PMC3667970/ was not a PDF)
- **Method**: Linearized Kantorovich-Wasserstein distance and an isometric linear embedding of images.
- **Key results**: Efficient pairwise distances on large image sets; shown on nuclear chromatin patterns in cancer cells, faces, galaxies and subcellular protein distributions.
- **Relevance**: Reference-based transport embedding with a biomedical classification use (P1, P2).
- **Quality**: High (15).
- **Stance**: Supports linear transport embeddings.
- **Potential use**: Linear transport.

### Moosmuller and Cloninger (2022). Linear optimal transport embedding: provable Wasserstein classification. [@Moosm_ller_2022]
- **Type**: Journal article, Information and Inference.
- **Read from**: https://arxiv.org/html/2008.09165
- **Method**: Theory of the LOT embedding: linear separability and near-isometry to Wasserstein-2.
- **Key results**: Families generated by shifts and scalings become linearly separable, and N transport maps give the N squared pairwise distances.
- **Relevance**: When a reference embedding suffices for classification (P1, P2).
- **Quality**: High (12).
- **Stance**: Supports linear embeddings.
- **Potential use**: Theory of reference embeddings.

### Shifat-E-Rabbi et al. (2025). Linear optimal transport subspaces for point set classification. [@Shifat_E_Rabbi_2025]
- **Type**: Journal article, Journal of Mathematical Imaging and Vision.
- **Read from**: https://www.researchsquare.com/article/rs-4106387/latest.pdf
- **Method**: LOT transform of point sets and nearest-subspace classification.
- **Key results**: Label-efficient, non-iterative classification of point sets under affine deformation, with no hyper-parameter tuning.
- **Relevance**: Point-set classification without correspondence (P1).
- **Quality**: High (12).
- **Stance**: Supports linear embeddings.
- **Potential use**: Supervised learning on point clouds.

### Xu and Cheng (2023). Regularized optimal transport layers for generalized global pooling operations. [@Xu_2023a]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: https://arxiv.org/html/2212.06339
- **Method**: Global pooling as a regularized transport across sample indices and feature dimensions; learnable pooling layers as implicit layers.
- **Key results**: Most pooling methods are special cases of regularized transport; hierarchical problems give richer pooling.
- **Relevance**: Unifies pooling of sets under transport (P1).
- **Quality**: High (13).
- **Stance**: Supports transport pooling.
- **Potential use**: Supervised learning on sets.

### Qian et al. (2024). Reimagining graph classification from a prototype view with optimal transport. [@Qian_2024]
- **Type**: Conference paper (KDD 2024).
- **Read from**: the abstract file of `the lookup script fetch` (`dl.acm.org` PDF answered 403)
- **Method**: Class prototypes compared by fused Gromov-Wasserstein, with a network that approximates the distance for GPU training.
- **Key results**: An $O(1/N)$ generalization bound and a transparent prototype classifier.
- **Relevance**: Prototype templates for classification (P1, P2).
- **Quality**: High (12).
- **Stance**: Supports templates.
- **Potential use**: Supervised learning.

### Carpintero Perez et al. (2025). Learning signals defined on graphs with optimal transport and Gaussian process regression. [@arxiv_2410_15721]
- **Type**: Conference paper (AISTATS 2025, PMLR 258), year confirmed on its proceedings page.
- **Read from**: https://arxiv.org/html/2410.15721
- **Method**: Each mesh graph transported to a reference measure; output signals moved through the plan, reduced and regressed with Gaussian processes.
- **Key results**: Signal prediction with confidence intervals on node values, shown in fluid dynamics and solid mechanics.
- **Relevance**: Regression with uncertainty from unaligned geometries via a reference (P1, P2).
- **Quality**: High (12).
- **Stance**: Supports reference transport.
- **Potential use**: Supervised regression.

### Kusner et al. (2015). From word embeddings to document distances. [@Kusner_2015]
- **Type**: Conference paper (ICML 2015); seminal.
- **Read from**: https://proceedings.mlr.press/v37/kusnerb15.pdf
- **Method**: Earth mover's distance between sets of word embeddings.
- **Key results**: Lowest k-nearest-neighbor document classification error on eight datasets against seven baselines.
- **Relevance**: The earliest transport classifier on unordered sets in this set (P1).
- **Quality**: High (13).
- **Stance**: Supports transport on sets.
- **Potential use**: Supervised learning on sets.

### Amir and Dym (2025). Fourier sliced-Wasserstein embedding for multisets and measures. [@arxiv_2405_16519]
- **Type**: Conference paper (ICLR 2025), confirmed on its proceedings page.
- **Read from**: https://arxiv.org/html/2405.16519
- **Method**: An embedding of multisets and measures that approximately preserves sliced-Wasserstein distance.
- **Key results**: Injective on measures and bi-Lipschitz on multisets, unlike sum or max pooling, with near-optimal output dimension.
- **Relevance**: Guarantees for transport embeddings of point clouds (P1).
- **Quality**: High (13).
- **Stance**: Supports transport over sum or max pooling.
- **Potential use**: Supervised learning on point clouds.




### Zaheer et al. (2017). Deep Sets. [@arxiv_1703_06114]
- **Type**: Conference paper (Advances in Neural Information Processing Systems 30; entry from the venue page `https://papers.nips.cc/paper/2017/hash/f22e4747da1aa27e363d86d40ff442fe-Abstract.html`).
- **Read from**: https://arxiv.org/html/1703.06114
- **Method**: Theory and architecture; characterises permutation-invariant functions and evaluates on population statistics, point clouds, set expansion and outlier detection.
- **Key results**: For elements from a countable universe, a function on sets is permutation invariant if and only if it can be written as rho(sum over x of phi(x)); this sum decomposition gives a deep architecture for set inputs, with necessary and sufficient conditions for equivariant layers as well.
- **Relevance**: P1 and P2; the sum-pooling template every later set encoder extends, and the baseline the medical set studies compare against (Karimzadeh_2026, Zare_2025, Song_2024).
- **Quality**: High (14). Must include (layer 2).
- **Stance**: Supports permutation invariance as the way to handle missing correspondence.
- **Potential use**: Methods background on set encoders.

### Qi et al. (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation. [@Charles_2017]
- **Type**: Conference paper (CVPR 2017).
- **Read from**: https://arxiv.org/html/1612.00593
- **Method**: Architecture; shared per-point network, a learned input and feature transformation network, and max pooling as the symmetric function; object classification, part and scene segmentation.
- **Key results**: Consumes raw point clouds without voxelization, respecting the permutation invariance of the points through a single symmetric function, max pooling; performance on par with or better than voxel and multi-view methods, with an analysis of robustness to point perturbation and corruption.
- **Relevance**: P1 and P2; the encoder used or adapted in most medical point-cloud studies here (Gutierrez-Becker, Beetz, Choi via PointNet++). Its joint alignment network is a learned canonicalization, a second answer to missing alignment beside invariance.
- **Quality**: High (14). Must include (layer 2).
- **Stance**: Supports.
- **Potential use**: Methods background; point-cloud encoders.

### Qi et al. (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space. [@arxiv_1706_02413]
- **Type**: Conference paper (Advances in Neural Information Processing Systems 30; entry from the venue page `https://papers.nips.cc/paper/2017/hash/d8bf84be3800d12f74d8b05e9b89836f-Abstract.html`).
- **Read from**: https://arxiv.org/html/1706.02413
- **Method**: Architecture; PointNet applied recursively on a nested partition of the point set, with multi-scale grouping for varying density.
- **Key results**: Captures local structure induced by the metric, which PointNet does not, and adapts to non-uniform sampling density; results significantly better than the state of the art on 3D point-cloud benchmarks.
- **Relevance**: P1; the backbone of Sarasua_2022 and Choi_2025.
- **Quality**: High (13).
- **Stance**: Supports.
- **Potential use**: Methods background.

### Lee et al. (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks. [@arxiv_1810_00825]
- **Type**: Conference paper (ICML 2019, PMLR 97; entry from `https://proceedings.mlr.press/v97/lee19d.html`, year 2019 confirmed on that page).
- **Read from**: https://arxiv.org/html/1810.00825
- **Method**: Architecture; attention-based encoder (set attention blocks, induced set attention with inducing points) and decoder (pooling by multihead attention over a learnable set of k seed vectors).
- **Key results**: Models interactions among set elements, which sum pooling does not; the inducing-point scheme reduces self-attention cost from quadratic to linear in set size; better performance than earlier set methods on max regression, counting, amortized clustering, anomaly detection and point clouds.
- **Relevance**: P1 and P2; the learnable seed vectors are a learned reference set queried by attention, the attention counterpart of the trainable reference of transport pooling (arxiv_2006_12065).
- **Quality**: High (14).
- **Stance**: Supports.
- **Potential use**: Methods background; attention pooling.

### Ilse et al. (2018). Attention-based Deep Multiple Instance Learning. [@arxiv_1802_04712]
- **Type**: Conference paper (ICML 2018, PMLR 80; entry from `https://proceedings.mlr.press/v80/ilse18a.html`).
- **Read from**: https://arxiv.org/html/1802.04712
- **Method**: Model; bag label as a Bernoulli variable parameterised by a network, with a permutation-invariant attention pooling over instances; classical MIL benchmarks, MNIST bags and two histopathology datasets.
- **Key results**: Comparable to the best MIL methods on the benchmarks and better on MNIST bags and the two histopathology datasets, with instance weights that show each instance's contribution to the bag label.
- **Relevance**: P1 and P2; the pooling operator used by the lesion-set studies (Chen_2022, and compared in Karimzadeh_2026).
- **Quality**: High (14).
- **Stance**: Supports.
- **Potential use**: Methods background; MIL formulation of subject-level labels.

### Murphy et al. (2019). Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs. [@arxiv_1811_01900]
- **Type**: Conference paper (ICLR 2019); entry from the proceedings page https://mlanthology.org/iclr/2019/murphy2019iclr-janossy/ via `the lookup script bibtex 1811.01900 --page`.
- **Read from**: https://arxiv.org/html/1811.01900
- **Method**: Theory and models; a permutation-invariant function as the average of a permutation-sensitive function over all orderings, made tractable by canonical orderings, k-order interactions or sampled permutations.
- **Key results**: The framework unifies existing set pooling methods and gives new tractable approximations that outperform the state of the art in its experiments.
- **Relevance**: P2; places sum pooling (k = 1) and pairwise attention (k = 2) on one scale of interaction order.
- **Quality**: High (12).
- **Stance**: Supports.
- **Potential use**: Methods background on expressivity.

### Wagstaff et al. (2019). On the Limitations of Representing Functions on Sets. [@arxiv_1901_09006]
- **Type**: Conference paper (ICML 2019, PMLR 97; entry from `https://proceedings.mlr.press/v97/wagstaff19a.html`).
- **Read from**: https://arxiv.org/html/1901.09006
- **Method**: Theory.
- **Key results**: The conjecture that sum decomposition works with a fixed latent dimension rests on highly discontinuous maps; with continuous maps, as neural networks give, universal representation of set functions needs a latent dimension at least the maximum set size.
- **Relevance**: P2; a limit of sum pooling for large sets such as dense point clouds or many lesions.
- **Quality**: Medium (11).
- **Stance**: Opposes the claim that sum pooling is sufficient in practice.
- **Potential use**: Methods background; limitations.

### Mialon et al. (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and Its Relationship to Attention. [@arxiv_2006_12065]
- **Type**: Conference paper (ICLR 2021); entry from the proceedings page https://mlanthology.org/iclr/2021/mialon2021iclr-trainable/ via `the lookup script bibtex 2006.12065 --page`.
- **Read from**: https://arxiv.org/html/2006.12065
- **Method**: Model; elements of a set are embedded and aggregated according to the optimal transport plan between the set and a trainable reference; evaluated on protein fold recognition, chromatin profiles and text.
- **Key results**: A fixed-size representation that can be trained end to end, including the reference, or learned without labels; it can be read as an attention layer or as a scalable surrogate of a transport kernel; state of the art on protein fold recognition and chromatin profile detection.
- **Relevance**: P1 and P2; the transport-based answer to missing correspondence: each subject's set is coupled to one learned reference (a template), so the output coordinates correspond across subjects without registration. It joins themes 2 and 3.
- **Quality**: High (13).
- **Stance**: Supports.
- **Potential use**: Methods; transport-based pooling and learned templates.

### Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding. [@Naderializadeh_2021]
- **Type**: Conference paper (Advances in Neural Information Processing Systems 34, pp. 3389 to 3400 per the proceedings page). No DOI and no arXiv ID; the entry is built from the `the lookup script resolve` record, with the five authors, volume and pages taken from the `citation_*` tags of the proceedings page.
- **Read from**: https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html (saved as `pswe.read-1.html`, HTTP 200), abstract section.
- **Method**: Model; set elements treated as samples of a distribution and embedded by a trainable Euclidean embedding of the sliced-Wasserstein distance.
- **Key results**: A geometrically interpretable pooling into a fixed-size vector, with better performance than existing set representation methods on point-cloud, graph and image classification.
- **Relevance**: P1 and P2; transport-based pooling against a reference without solving a full transport problem, for point clouds and graphs.
- **Quality**: High (13). Full text not read; abstract only.
- **Stance**: Supports.
- **Potential use**: Methods; transport-based pooling.

### Kothapalli et al. (2024). Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification. [@arxiv_2306_05553]
- **Type**: Workshop paper (ICML 2024 GRaM workshop); entry from the proceedings page https://mlanthology.org/icmlw/2024/kothapalli2024icmlw-equivariant/ via `the lookup script bibtex 2306.05553 --page`. Quality judged as a workshop paper.
- **Read from**: https://arxiv.org/html/2306.05553
- **Method**: Empirical comparison of equivariant backbones and invariant global pooling layers (including transport-based and attention-based pooling) on three point-cloud classification benchmarks.
- **Key results**: Transport-based or attention-based pooling boosts simple backbones markedly, with smaller gains for complex backbones; pooling helps even complex backbones with little data; the choice of pooling can matter more than the width and depth of the backbone.
- **Relevance**: P2; the only direct comparison of sum, attention and transport pooling found in this theme, and its low-data finding bears on medical cohorts.
- **Quality**: Medium (10).
- **Stance**: Supports transport and attention pooling over sum and max in low-data regimes.
- **Potential use**: Discussion of pooling choice.

### Zhang et al. (2022). Set Norm and Equivariant Skip Connections: Putting the Deep in Deep Sets. [@arxiv_2206_11925]
- **Type**: Conference paper (ICML 2022, PMLR 162, pp. 26559 to 26574; entry from `https://proceedings.mlr.press/v162/zhang22ac.html`).
- **Read from**: https://arxiv.org/html/2206.11925
- **Method**: Analysis and architecture; gradient analysis of deep Deep Sets and Set Transformer, a normalization for sets and equivariant residual connections; includes Flow-RBC, a single-cell blood dataset for predicting a patient's hematocrit from red-blood-cell measurements.
- **Key results**: Deep Deep Sets and Set Transformers suffer vanishing or exploding gradients and layer norm can remove information useful for prediction; Deep Sets++ and Set Transformer++ reach high depth with better or comparable performance.
- **Relevance**: P1; a clinical set-to-patient prediction task (hematocrit from a set of cells), and the source of the Deep Sets++ and Set Transformer++ baselines of Zare_2025.
- **Quality**: High (12).
- **Stance**: Supports.
- **Potential use**: Methods; training deep set encoders.

### Gutierrez-Becker and Wachinger (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy. [@Guti_rrez_Becker_2018]
- **Type**: Conference paper (MICCAI 2018, LNCS).
- **Read from**: https://arxiv.org/html/1806.01069
- **Method**: Multi-branch point-cloud network on several brain structures; spatial transformer networks map each point cloud to a canonical space; Alzheimer's disease and mild cognitive impairment classification and brain-age regression on ADNI.
- **Key results**: Operates on raw point clouds without mesh processing or point correspondences, learning the shape representation end to end instead of hand-crafted descriptors; occlusion of points visualises the anatomy that drives the prediction.
- **Relevance**: P3; removes the correspondence and registration step of classical shape analysis, while building on the segmentation of the structures.
- **Quality**: High (13).
- **Stance**: Supports.
- **Potential use**: Medical applications; anatomy.

### Gutierrez-Becker et al. (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks. [@Guti_rrez_Becker_2021]
- **Type**: Journal article (Medical Image Analysis 67).
- **Read from**: https://arxiv.org/html/2010.00820
- **Method**: Modular point-cloud networks for disease classification, age regression and a conditional generative model, with a multi-structure extension; real and synthetic data.
- **Key results**: Invariance to similarity transformations and to point order avoids pre-alignment and point correspondences; a task-specific learned representation outperforms alternative shape descriptors, and joint analysis of multiple structures is more efficient and more accurate than single-structure analysis.
- **Relevance**: P2 and P3; states the registration step these networks remove, and still builds on segmentation.
- **Quality**: High (14).
- **Stance**: Supports.
- **Potential use**: Medical applications; anatomy.

### Sarasua et al. (2022). Hippocampal representations for deep learning on Alzheimer's disease. [@Sarasua_2022]
- **Type**: Journal article (Scientific Reports 12).
- **Read from**: https://www.nature.com/articles/s41598-022-12533-6.pdf (via `the lookup script fetch`)
- **Method**: Comparison of five hippocampal representations (volumetric ROI, mask, texture, mesh with SpiralNet++, point cloud with PointNet++) for AD diagnosis and time to dementia, ADNI training and AIBL test, FSL FIRST and FreeSurfer segmentations.
- **Key results**: Meshes with SpiralNet++, which need a template with vertex correspondence, give the highest performance without augmentation; volumetric ROI and texture lead with augmentation; point clouds perform better than masks when no template is available (FreeSurfer) and depend strongly on the segmentation tool (more than 3 percent accuracy gain from FreeSurfer over FSL).
- **Relevance**: P2 and P3; the one head-to-head comparison in this theme of a correspondence-based representation and a permutation-invariant one on the same cohort.
- **Quality**: High (14).
- **Stance**: Neutral; correspondence-based meshes win where a template exists, point clouds where none does.
- **Potential use**: Discussion of when invariance pays.

### Chang and Jung (2020). Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds. [@Chang_2020]
- **Type**: Journal article (Neurocomputing 418).
- **Read from**: abstract written by `the lookup script fetch '10.1016/j.neucom.2020.08.030'` (no open-access text).
- **Method**: YOLO ROI detection and FCN segmentation of LV, RV and myocardium on cine MRI, surface reconstruction, uniform point sampling and a point-cloud cardiopathy diagnosis network.
- **Key results**: Segmentation comparable to existing methods; 92 percent accuracy for heart-disease classification from the point clouds on the test set.
- **Relevance**: P3; a permutation-invariant classifier built on top of a segmentation pipeline.
- **Quality**: High (13). Abstract only.
- **Stance**: Supports.
- **Potential use**: Medical applications; cardiac.

### Beetz et al. (2023). 3D Shape-Based Myocardial Infarction Prediction Using Point Cloud Classification Networks. [@Beetz_2023]
- **Type**: Conference paper (EMBC 2023).
- **Read from**: https://arxiv.org/html/2307.07298
- **Method**: Multi-step biventricular surface reconstruction from cine MRI (segmentation first) followed by a PointNet-based classifier; 1068 UK Biobank subjects; prevalent and incident MI.
- **Key results**: About 13 percent and 5 percent improvement over clinical benchmarks for prevalent MI detection and incident MI prediction; point-cloud networks outperform the benchmarks for all phases and substructures, by about 10 percent AUROC on average.
- **Relevance**: P3; subject-level prediction from unaligned surface point clouds, built on segmentation.
- **Quality**: Medium (11).
- **Stance**: Supports.
- **Potential use**: Medical applications; cardiac.

### Choi et al. (2025). Prediction of intracranial aneurysm rupture from computed tomography angiography using an automated artificial intelligence framework. [@Choi_2025]
- **Type**: Journal article (Computers in Biology and Medicine 197).
- **Read from**: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=40913905&rettype=abstract&retmode=text (HTTP 200)
- **Method**: nnU-Net vessel segmentation, pretrained PointNet++ models for vessel labelling and aneurysm segmentation, latent keypoint shape features plus conventional features into eight classifiers; 500 aneurysms in 335 patients, external set of 24 from Aneurisk.
- **Key results**: The best model, a random forest with 14 aneurysm shape features, seven conventional features and one vessel shape feature, reached AUC 0.851 internally and 0.805 externally; aneurysm shape features contributed consistently, vessel shape features little.
- **Relevance**: P3; point-cloud latents used as features for a conventional classifier, built on automated segmentation.
- **Quality**: High (13). Abstract only.
- **Stance**: Supports.
- **Potential use**: Medical applications; vascular.

### Karimzadeh et al. (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study. [@Karimzadeh_2026]
- **Type**: Journal article (Physics in Medicine and Biology 71).
- **Read from**: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=42248208&rettype=abstract&retmode=text (HTTP 200)
- **Method**: Each patient as an unordered set of lesion-level PET radiomic vectors (107 PyRadiomics features per node), optionally with demographics and node centre-of-mass coordinates after rigid registration to a reference space; pooled tabular baselines against Transformer, Deep Sets, MIL, Set Transformer and a graph model; 151 patients at centre 1, 80 external at centre 2; test-time adaptation.
- **Key results**: Radiomics plus demographic and spatial features improved discrimination consistently; the best deep aggregation models reached ROC-AUC up to 0.91 (SD 0.05) on centre 1; external transfer showed a domain shift, and TENT test-time adaptation raised the Transformer from ROC-AUC 0.81 to 0.87.
- **Relevance**: P1 to P3; the closest match to the theme: set encoders on lesion sets, building on segmentation and radiomics, with spatial position reintroduced through rigid registration.
- **Quality**: High (13).
- **Stance**: Supports.
- **Potential use**: Medical applications; lesion sets.

### Chen et al. (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics. [@Chen_2022]
- **Type**: Journal article (Medical Physics 49).
- **Read from**: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=35187667&rettype=abstract&retmode=text (HTTP 200)
- **Method**: Patient-level lung cancer diagnosis as MIL over the set of nodules, radiomic features per nodule, attention-based MIL, and a bag simulation method for a small imbalanced dataset.
- **Key results**: Mean accuracy 0.807 (SEM 0.069) and AUC 0.842 (SEM 0.074), outperforming other MIL methods; attention weights indicate each nodule's importance.
- **Relevance**: P1 and P3; attention pooling over a lesion set, built on nodule segmentation and radiomics.
- **Quality**: High (13).
- **Stance**: Supports.
- **Potential use**: Medical applications; lesion sets.

### Chen et al. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases. [@Chen_2021]
- **Type**: Conference paper (MICCAI 2021, LNCS).
- **Read from**: https://arxiv.org/html/2012.06875
- **Method**: Radiomic features of all liver metastases from contrast-enhanced MRI; an autoencoder trained jointly with a multiple-instance network aggregating all lesions of a patient; two-step normalization of skewed radiomic features.
- **Key results**: AUC 0.70, 11.4 percent above the best baseline; ablations show that using all lesions and the two-step normalization both help.
- **Relevance**: P1 and P3; lesion-set MIL on radiomics.
- **Quality**: High (12).
- **Stance**: Supports.
- **Potential use**: Medical applications; lesion sets.

### Chang et al. (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors. [@Chang_2021]
- **Type**: Journal article (Scientific Reports 11).
- **Read from**: https://www.nature.com/articles/s41598-021-89114-6.pdf (via `the lookup script fetch`)
- **Method**: Six fixed aggregation rules for the radiomic features of 3,596 brain metastases in 831 patients, with Cox, Cox-LASSO and random survival forest models.
- **Key results**: The volume-weighted average of the largest three metastases gave the highest concordance index in all three survival models (0.627, 0.628 and 0.652).
- **Relevance**: P2 and P3; the fixed, non-learned baselines a set encoder replaces.
- **Quality**: High (14).
- **Stance**: Neutral; fixed aggregation works without a learned encoder.
- **Potential use**: Medical applications; baselines.

### Thiery et al. (2025). PET-based lesion graphs meet clinical data: An interpretable cross-attention framework for DLBCL treatment response prediction. [@Thiery_2025]
- **Type**: Journal article (Computerized Medical Imaging and Graphics 120).
- **Read from**: abstract written by `the lookup script fetch '10.1016/j.compmedimag.2024.102481'` (the DOI page was "not a PDF").
- **Method**: Each patient's PET as an attributed lesion graph processed by a graph neural network that handles a variable number of lesions, cross-attention fusion with clinical indicators; 545 patients from a prospective multicentre dataset; 2-year progression-free survival.
- **Key results**: The framework integrates multi-lesion image information and improves over a model using only the most prognostic clinical data, and traces decisions back to the most important lesions and features.
- **Relevance**: P1 and P3; a lesion set with inter-lesion relations, built on lesion segmentation.
- **Quality**: High (13). Abstract only.
- **Stance**: Supports.
- **Potential use**: Medical applications; lesion sets.

### Zare et al. (2025). Permutation-Invariant Cascaded Attentional Set Operator for Computational Nephropathology. [@Zare_2025]
- **Type**: Journal article (Kidney360 6).
- **Read from**: https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=40146772&rettype=abstract&retmode=text (HTTP 200)
- **Method**: Transformer-based set operator with histopathologic vectors as a static memory, updated by the input embeddings; sets of glomerular crops; IgA nephropathy crescents (6,206 crops, three institutes) and antibody-mediated rejection (1,655 crops, 89 biopsies); compared with DeepSet, Set Transformer, DeepSet++ and Set Transformer++.
- **Key results**: AUROC 0.99 internal and 0.96 external for active crescents, and 0.97 (95 percent CI 0.90 to 1.0) for case-level rejection, significantly above the other set operators.
- **Relevance**: P1; a medical application of set encoders on sets of regions (glomeruli) with a learned memory acting as reference vectors.
- **Quality**: Medium (11).
- **Stance**: Supports.
- **Potential use**: Medical applications; sets of regions.

### Song et al. (2024). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology. [@Song_2024]
- **Type**: Conference paper (CVPR 2024).
- **Read from**: https://arxiv.org/html/2405.11643
- **Method**: Gaussian mixture model over a whole-slide image's patch embeddings, summarising the set into a small set of morphological prototypes; the slide representation is built from the mixture parameters; section 3.1.1 relates it to optimal transport; 13 datasets, subtyping and survival.
- **Key results**: Outperforms or matches supervised MIL baselines, with prototypes that add interpretability.
- **Relevance**: P2; a set summarised against a learned set of prototypes, the template idea of transport pooling applied to medical images; Deep Sets is among its baselines.
- **Quality**: High (12).
- **Stance**: Supports.
- **Potential use**: Methods and medical applications; learned templates.



### Avants, Epstein, Grossman, Gee (2008). Symmetric diffeomorphic image registration with cross-correlation: evaluating automated labeling of elderly and neurodegenerative brain. [@AVANTS_2008]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC2276735/`
- **Method**: A symmetric image normalization method (SyN) that maximizes cross-correlation within the space of diffeomorphic maps, evaluated against manual cortical labels.
- **Key results**: SyN compares favorably with an elastic method and with the ITK Demons algorithm, in particular when the template brain and the target brain are far apart. Its volume measurements in frontotemporal dementia and control subjects correlate most strongly with expert labeling of the three methods.
- **Relevance**: The registration-to-template step that atlas-based pipelines run before any voxel-wise or region-wise analysis (P1).
- **Quality**: High (14). Must include: cited by 5 of the 10 core papers.
- **Stance**: Neutral
- **Potential use**: P1, registration to a common space.

### Aerts et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach. [@Aerts_2014]
- **Type**: Journal article (Nature Communications)
- **Read from**: `https://www.nature.com/articles/ncomms5006.pdf`
- **Method**: Radiomic analysis of 440 intensity, shape and texture features from CT of 1,019 patients with lung or head-and-neck cancer, with a radiogenomic association analysis.
- **Key results**: Many radiomic features have prognostic power in independent lung and head-and-neck datasets. A prognostic signature that captures intratumour heterogeneity is associated with gene-expression patterns.
- **Relevance**: The reference single-lesion radiomics pipeline: a segmented tumour, hand-crafted features, a patient-level model (P2).
- **Quality**: High (14). Must include: cited by 4 of the 10 core papers.
- **Stance**: Neutral
- **Potential use**: P2, radiomics feature pipelines.

### Haralick, Shanmugam, Dinstein (1973). Textural features for image classification. [@Haralick_1973]
- **Type**: Journal article (IEEE Transactions on Systems, Man, and Cybernetics)
- **Read from**: the abstract `the lookup script fetch` wrote from the indexes (`10.1109_TSMC.1973.4309314.abstract.txt`). No open full text; Europe PMC holds no record (200, hitCount 0).
- **Method**: Texture features computed from gray-tone spatial dependencies (co-occurrence matrices), tested with two decision rules on photomicrographs, aerial photographs and satellite imagery.
- **Key results**: Test-set identification accuracy is 89 percent for the photomicrographs, 82 percent for the aerial images and 83 percent for the satellite images.
- **Relevance**: The origin of the co-occurrence features that radiomics pipelines compute per lesion (P2).
- **Quality**: High (14). Seminal, outside the date range. Must include: cited by 3 of the 10 core papers.
- **Stance**: Neutral
- **Potential use**: P2, radiomics feature pipelines.

### Galloway (1975). Texture analysis using gray level run lengths. [@Galloway_1975]
- **Type**: Journal article (Computer Graphics and Image Processing)
- **Read from**: abstract not read. Lookups tried are listed under "A candidate that could not be read".
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: Its record and its citation by 3 of the 10 core papers (PyRadiomics, IBSI, Fontaine) place it as the source of the run-length texture family used in radiomics (P2).
- **Quality**: Medium (11). Seminal, outside the date range. Must include.
- **Stance**: Neutral
- **Potential use**: P2, radiomics feature pipelines.

### Ashburner (2007). A fast diffeomorphic image registration algorithm. [@Ashburner_2007]
- **Type**: Journal article (NeuroImage)
- **Read from**: Europe PMC abstract, `https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=DOI%3a10.1016%2fj.neuroimage.2007.07.007&resultType=core&format=json`
- **Method**: DARTEL, diffeomorphic registration with a constant Eulerian velocity field, solved by Levenberg-Marquardt with a multigrid method and scaling and squaring.
- **Key results**: Applied to inter-subject registration of 471 whole-brain images. The resulting deformations were evaluated by how well they encode the shape information needed to separate male and female subjects and to predict age.
- **Relevance**: A registration pipeline whose deformations are themselves used as features for subject-level prediction (P1).
- **Quality**: High (14). Must include: cited by 3 of the 10 core papers.
- **Stance**: Neutral
- **Potential use**: P1, registration to a common space.

### Liero, Mielke, Savare (2018; online 2017). Optimal Entropy-Transport problems and a new Hellinger-Kantorovich distance between positive measures. [@Liero_2017]
- **Type**: Journal article (Inventiones mathematicae)
- **Read from**: `https://link.springer.com/content/pdf/10.1007/s00222-017-0759-8.pdf`
- **Method**: Theory. Transport between nonnegative finite measures of different total mass, with the marginal constraints relaxed into convex entropy functionals.
- **Key results**: A full theory of Optimal Entropy-Transport problems in general topological spaces. As an application it defines the Hellinger-Kantorovich distance between positive measures.
- **Relevance**: The unbalanced transport that Feydy 2017, Thual 2022 and Gerber 2023 apply to images of unequal mass (P3).
- **Quality**: High (13). Must include: cited by 3 of the 10 core papers.
- **Stance**: Neutral
- **Potential use**: P3, transport-based methods (shared with theme 2).

### Balakrishnan, Zhao, Sabuncu, Guttag, Dalca (2019). VoxelMorph: A learning framework for deformable medical image registration. [@Balakrishnan_2019]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: `https://arxiv.org/pdf/1809.05231`
- **Method**: A CNN maps a pair of images to a deformation field. It is trained unsupervised on intensity similarity, or with auxiliary segmentations.
- **Key results**: The unsupervised model's accuracy is comparable to state-of-the-art methods while operating orders of magnitude faster. Training with auxiliary segmentations improves registration accuracy at test time.
- **Relevance**: Learned registration that makes atlas alignment cheap inside pipelines (P1).
- **Quality**: High (15)
- **Stance**: Neutral
- **Potential use**: P1, registration to a common space.

### de Vos, Berendsen, Viergever, Sokooti, Staring, Isgum (2019). A deep learning framework for unsupervised affine and deformable image registration. [@de_Vos_2019]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/pdf/1809.06130`
- **Method**: The DLIR framework. ConvNets for affine and deformable registration, trained on image similarity and stacked coarse to fine.
- **Key results**: For cardiac cine MRI and chest CT, performance is comparable to conventional registration while being several orders of magnitude faster.
- **Relevance**: Unsupervised learned registration, including the affine step that pipelines run before deformable alignment (P1).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P1, registration to a common space.

### Dalca, Rakic, Guttag, Sabuncu (2019). Learning conditional deformable templates with convolutional networks. [@arxiv_1908_02738]
- **Type**: Conference paper (NeurIPS 2019; entry built from `https://proceedings.neurips.cc/paper/2019/hash/bbcbff5c1f1ded46c25d28119a85c6c2-Abstract.html`)
- **Read from**: `https://arxiv.org/html/1908.02738`
- **Method**: A probabilistic model and a learning strategy that yield universal or conditional templates, jointly with a network that aligns images to them.
- **Key results**: Templates and fast alignment are learned together, with a focus on neuroimaging. The method helps where no pre-existing template exists or where building one with traditional methods is prohibitively expensive.
- **Relevance**: A learned template as the common space, the registration counterpart of a learned transport barycenter (P1, P3).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P1, learned templates.

### Isensee, Jaeger, Kohl, Petersen, Maier-Hein (2021; online 2020). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation. [@Isensee_2020]
- **Type**: Journal article (Nature Methods)
- **Read from**: `https://arxiv.org/pdf/1904.08128`
- **Method**: A framework that configures a U-Net pipeline (preprocessing, architecture, training, post-processing) from dataset properties without manual tuning.
- **Key results**: Without manual tuning, nnU-Net surpasses most specialised pipelines in 19 public competitions and sets a new state of the art in the majority of 49 tasks.
- **Relevance**: The default lesion-segmentation step that produces the lesion masks radiomics and set-level methods start from (P2).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### Kamnitsas et al. (2017). Efficient multi-scale 3D CNN with fully connected CRF for accurate brain lesion segmentation. [@Kamnitsas_2017]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/html/1603.05959`
- **Method**: An 11-layer, dual-pathway 3D CNN with dense training on patches and a 3D fully connected CRF for post-processing.
- **Key results**: Evaluated on traumatic brain injury, brain tumour and ischemic stroke lesions in multi-channel MRI. It improves on the state of the art in all three, with top-ranking results on BRATS 2015 and ISLES 2015.
- **Relevance**: Multi-lesion brain segmentation that yields the lesion sets downstream models consume (P2).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### Menze et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS). [@Menze_2015]
- **Type**: Journal article (IEEE Transactions on Medical Imaging), benchmark
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC4833122/`
- **Method**: Twenty tumour segmentation algorithms on 65 multi-contrast MR scans of glioma patients, annotated by up to four raters, and on 65 simulated scans.
- **Key results**: Human raters disagree substantially (Dice 74 to 85 percent across sub-regions), and no single algorithm ranks top for all sub-regions. A hierarchical majority vote of several algorithms ranks above every individual one.
- **Relevance**: The segmentation variability that propagates into lesion-level features (P2).
- **Quality**: High (14). Evidence type: benchmark.
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### Bilic et al. (2023). The Liver Tumor Segmentation Benchmark (LiTS). [@Bilic_2023]
- **Type**: Journal article (Medical Image Analysis), benchmark
- **Read from**: `https://www.ebi.ac.uk/europepmc/webservices/rest/PMC10631490/fullTextXML`
- **Method**: Seventy-five liver and liver-tumour segmentation algorithms, trained on 131 CT volumes and tested on 70 unseen volumes across three challenge events.
- **Key results**: The best tumour Dice scores were 0.674, 0.702 and 0.739 in the three events. The best lesion-wise detection recall was 0.458 to 0.554, and top segmenters did not always detect tumours well.
- **Relevance**: Multi-lesion detection and segmentation in one organ, where missed lesions change the set a patient-level model sees (P2).
- **Quality**: High (14). Evidence type: benchmark.
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### Commowick et al. (2018). Objective evaluation of multiple sclerosis lesion segmentation using a data management and processing infrastructure. [@Commowick_2018]
- **Type**: Journal article (Scientific Reports), challenge report
- **Read from**: `https://www.nature.com/articles/s41598-018-31911-7.pdf`
- **Method**: The MICCAI 2016 challenge. Thirteen MS lesion segmentation methods were evaluated automatically on 53 cases from four centres, each annotated by seven experts.
- **Key results**: Automatic algorithms, including random forests and deep learning, still trail human expertise on detection and delineation. A consensus of algorithms comes closer to human performance on segmentation and still trails on detection.
- **Relevance**: The detection and delineation errors in many-lesion diseases that set-level outcome models inherit (P2).
- **Quality**: High (14). Evidence type: challenge report.
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### van Griethuysen et al. (2017). Computational radiomics system to decode the radiographic phenotype. [@van_Griethuysen_2017]
- **Type**: Journal article (Cancer Research), software
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC5672828/`
- **Method**: PyRadiomics, an open-source Python platform that extracts engineered features from medical images, standalone or in 3D Slicer, demonstrated on lung lesions.
- **Key results**: It aims to address the lack of standardized algorithm definitions and image processing, as a tested and maintained reference standard for radiomic analyses.
- **Relevance**: The feature-extraction step of most radiomics pipelines in the set (P2).
- **Quality**: High (14). Evidence type: software paper.
- **Stance**: Neutral
- **Potential use**: P2, radiomics feature pipelines.

### Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative: standardized quantitative radiomics for high-throughput image-based phenotyping. [@Zwanenburg_2020]
- **Type**: Journal article (Radiology)
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC7193906/`
- **Method**: Three phases: 25 teams computed features on a digital phantom, 15 teams on a lung-cancer CT, and reproducibility was tested on CT, PET and MRI of 51 soft-tissue sarcoma patients.
- **Key results**: 169 of 174 features were standardized. Most standardized features were reproduced excellently in phase III (166 with CT, 164 with PET and 164 with MRI).
- **Relevance**: The definitions that make per-lesion radiomic features comparable across software (P2).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P2, radiomics feature pipelines.

### Haker, Zhu, Tannenbaum, Angenent (2004). Optimal mass transport for registration and warping. [@Haker_2004]
- **Type**: Journal article (International Journal of Computer Vision)
- **Read from**: the abstract on `https://link.springer.com/article/10.1023/B:VISI.0000036836.66311.97`
- **Method**: Image registration and warping by the Monge-Kantorovich transport problem (the Earth Mover's distance) under a mass-preservation constraint, with an extension to intensity changes.
- **Key results**: The formulation leads to practical algorithms, shown on examples including medical images, and suits image morphing.
- **Relevance**: The first use in the set of transport as the registration model itself (P3).
- **Quality**: High (14). Seminal, outside the date range.
- **Stance**: Neutral
- **Potential use**: P3, transport-based registration.

### Gramfort, Peyre, Cuturi (2015). Fast optimal transport averaging of neuroimaging data. [@Gramfort_2015]
- **Type**: Conference paper (Information Processing in Medical Imaging)
- **Read from**: `https://arxiv.org/pdf/1503.08596`
- **Method**: Kantorovich means of non-normalized data on arbitrary discrete domains, linked to entropically smoothed Wasserstein barycenters. Applied to fMRI and MEG source estimates.
- **Key results**: The averaging is a smooth convex problem with an algorithm that has strong convergence guarantees. It replaces the smoothing and linear averaging that group analyses use when effects do not overlap across subjects.
- **Relevance**: A transport barycenter as the group template in place of registration and smoothing (P2, P3); also kept by theme 2, which read the same text at https://arxiv.org/html/1503.08596.
- **Quality**: High (14)
- **Stance**: Supports
- **Potential use**: P3, transport barycenters in neuroimaging.

### Feydy, Charlier, Vialard, Peyre (2017). Optimal transport for diffeomorphic registration. [@Feydy_2017]
- **Type**: Conference paper (MICCAI 2017)
- **Read from**: `https://arxiv.org/pdf/1706.05218`
- **Method**: Unbalanced transport as the similarity measure inside diffeomorphic registration of surfaces and volumes.
- **Key results**: The method gives fast, global similarity measures, built on recent theory and numerics of transport, for surface and volumetric imaging data.
- **Relevance**: Transport inside the registration step rather than in place of it (P1, P3).
- **Quality**: High (14). Core paper.
- **Stance**: Neutral
- **Potential use**: P3, transport-based registration.

### Luo et al. (2022). Prediction of cerebral aneurysm rupture using a point cloud neural network. [@Luo_2022]
- **Type**: Journal article (Journal of NeuroInterventional Surgery)
- **Read from**: Europe PMC record and the abstract `the lookup script fetch` wrote (`10.1136_neurintsurg-2022-018655.abstract.txt`)
- **Method**: A point-cloud network on aneurysm geometry, with or without the parent artery, compared with ridge regression, SVM and NN on radiomics features. 418 aneurysms were analysed retrospectively, with prospective external validation on 258 aneurysms from five centres.
- **Key results**: Internal AUC was 0.913 with the parent artery, against 0.788 to 0.805 for the radiomics models. External AUC was 0.835 against 0.681 to 0.701 for the radiomics models.
- **Relevance**: A subject-level outcome predicted from an unordered point set, compared directly with a radiomics pipeline (P2, P3).
- **Quality**: High (14). Single-hospital training data.
- **Stance**: Supports
- **Potential use**: P3, set and point-cloud representations.

### Chen, Frey, He, Segars, Li, Du (2022). TransMorph: Transformer for unsupervised medical image registration. [@Chen_2022a]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/html/2111.10480`
- **Method**: A hybrid Transformer-ConvNet for volumetric registration, with diffeomorphic and Bayesian variants.
- **Key results**: Validated on inter-patient and atlas-to-patient brain MRI and on phantom-to-CT registration. Compared with existing registration methods and Transformer architectures, it gives significantly improved registration.
- **Relevance**: The current learned atlas-to-patient registration (P1).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P1, registration to a common space.

### Ma, He, Li, Han, You, Wang (2024). Segment anything in medical images. [@Ma_2024]
- **Type**: Journal article (Nature Communications)
- **Read from**: `https://www.nature.com/articles/s41467-024-44824-z.pdf`
- **Method**: MedSAM, a promptable segmentation foundation model trained on 1,570,263 image-mask pairs over 10 modalities and more than 30 cancer types.
- **Key results**: On 86 internal and 60 external validation tasks it shows better accuracy and robustness than modality-wise specialist models.
- **Relevance**: The current general segmentation step that could supply lesion masks across modalities (P2).
- **Quality**: High (14)
- **Stance**: Neutral
- **Potential use**: P2, lesion segmentation.

### Iglesias, Sabuncu (2015). Multi-atlas segmentation of biomedical images: a survey. [@Iglesias_2015]
- **Type**: Journal article (Medical Image Analysis), survey
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC4532640/`
- **Method**: A survey of multi-atlas segmentation algorithms and applications from 2003 to 2014.
- **Key results**: Using the whole set of labelled atlases, rather than one average, captures anatomical variation better at a higher computational cost.
- **Relevance**: How registration to several atlases transfers labels and correspondence to a new subject (P1).
- **Quality**: High (13). Evidence type: survey.
- **Stance**: Neutral
- **Potential use**: P1, atlas-based pipelines.

### Fontaine, Acosta, Castelli, De Crevoisier, Muller, Depeursinge (2020). The importance of feature aggregation in radiomics: a head and neck cancer study. [@Fontaine_2020]
- **Type**: Journal article (Scientific Reports)
- **Read from**: `https://www.nature.com/articles/s41598-020-76310-z.pdf`
- **Method**: Aggregation of voxel-wise feature maps over a region by a bag of visual words, compared with mean, variance and volume, on PET and CT of 214 head and neck cancer patients from 4 centres.
- **Key results**: The bag-of-words model reached a concordance index of 0.627 (95% CI 0.616 to 0.637), against 0.505 for standard radiomics and 0.577 for volume.
- **Relevance**: The aggregation step inside a region, the within-lesion analogue of combining lesions (P2).
- **Quality**: High (13). Core paper.
- **Stance**: Supports
- **Potential use**: P2, aggregation.

### Geady, Patel, Peoples, Simpson, Haibe-Kains (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review. [@Geady_2025]
- **Type**: Journal article (BMC Cancer), quantitative review
- **Read from**: `https://www.ebi.ac.uk/europepmc/webservices/rest/PMC11934564/fullTextXML`
- **Method**: Ten published methods for combining radiomic features of several lesions, replicated and compared on three datasets (16,894 lesions in 3,930 patients) with Cox models, against total tumour volume.
- **Key results**: No method was consistently best. Averaging was best in colorectal liver metastases and concatenation in soft-tissue sarcoma, and total tumour volume remained a strong predictor in head and neck cancer.
- **Relevance**: The direct evidence on how lesion-level features become a patient-level prediction (P2).
- **Quality**: High (13). Core paper.
- **Stance**: Neutral
- **Potential use**: P2, multi-lesion aggregation.

### Cavinato et al. (2023). Radiomics-based inter-lesion relation network to describe [18F]FMCH PET/CT imaging phenotypes in prostate cancer. [@Cavinato_2023]
- **Type**: Journal article (Cancers)
- **Read from**: `https://www.mdpi.com/2072-6694/15/3/823/pdf?version=1674980929`
- **Method**: A feature transformation that builds a radiomic profile per lesion, and a network of relations between the lesions of each patient, on 333 lesions of 55 metastatic prostate cancer patients.
- **Key results**: 39 of 55 patients had lesions with different radiomic profiles. The presence of several profiles within a patient was associated with outcome.
- **Relevance**: A patient represented by the relations among an unordered set of lesions (P2, P3).
- **Quality**: High (13). Small cohort.
- **Stance**: Supports
- **Potential use**: P2, multi-lesion aggregation.

### Shen, Feydy, Liu, Curiale, San Jose Estepar, San Jose Estepar, Niethammer (2021). Accurate point cloud registration with robust optimal transport. [@arxiv_2111_00648]
- **Type**: Conference paper (NeurIPS 2021; entry built from `https://proceedings.neurips.cc/paper/2021/hash/2b0f658cbffd284984fb11d90254081f-Abstract.html`)
- **Read from**: `https://arxiv.org/html/2111.00648`
- **Method**: Robust transport solvers for shape matching, used for pre-alignment and inside deep registration models. Evaluated on partial shapes, scene flow and lung vascular trees.
- **Key results**: State-of-the-art results on Kitti and on lung vessel-tree registration between inspiration and expiration. The paper releases PVT1010, 1,010 pairs of lung vascular trees.
- **Relevance**: Transport couplings between medical point sets with no given correspondence (P3).
- **Quality**: High (13)
- **Stance**: Supports
- **Potential use**: P3, transport on point sets.

### Gerber et al. (2023). Optimal transport features for morphometric population analysis. [@Gerber_2023]
- **Type**: Journal article (Medical Image Analysis)
- **Read from**: `https://arxiv.org/html/2208.05891`
- **Method**: Unbalanced transport with local mass balancing from each subject to a template, giving allocation and transport-cost images for morphometric analysis.
- **Key results**: The transport features increase statistical power for dispersed tissue loss. They also reduce sensitivity to misalignment and to differences in brain topology, and separate location changes from volume changes.
- **Relevance**: Transport that builds on a template and reduces dependence on exact registration (P1, P3).
- **Quality**: High (13). Core paper.
- **Stance**: Supports
- **Potential use**: P3, transport features.

### Kim, Zhuang, Mathai, Summers (2025). OTMorph: unsupervised multi-domain abdominal medical image registration using neural optimal transport. [@Kim_2025]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC12204211/`
- **Method**: A transport module learns a transport plan between the intensity distributions of moving and fixed volumes, and a registration module estimates the deformation from the transported volume.
- **Key results**: It gives superior deformable registration on multi-modality and multi-parametric abdominal images. The improvement holds on out-of-distribution data.
- **Relevance**: Transport used to make cross-domain registration work, not to remove it (P1, P3).
- **Quality**: High (13). Core paper.
- **Stance**: Neutral
- **Potential use**: P3, transport inside registration.

### Zhu et al. (2024). Wasserstein HOG: local directionality extraction via optimal transport. [@Zhu_2024]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC11037420/`
- **Method**: Each local patch is mapped by transport to an iso-intense patch of its mean, and the transport map is decomposed into directional sub-work costs. Evaluated on glioblastoma MRI, head and neck CT and longitudinal lung CT under immunotherapy.
- **Key results**: Higher entropy of local directionality inside tumours was associated with worse overall survival in all three datasets. A longitudinal reduction in entropy was associated with longer survival (hazard ratio 1.95, 95% CI 1.4 to 2.8).
- **Relevance**: Transport inside the radiomic feature step, robust to acquisition variability (P2, P3).
- **Quality**: High (13)
- **Stance**: Supports
- **Potential use**: P2, transport-based radiomic features.

### He et al. (2024). Deep learning model based on multi-lesion and time series CT images for predicting the benefits from anti-HER2 targeted therapy in stage IV gastric cancer. [@He_2024]
- **Type**: Journal article (Insights into Imaging)
- **Read from**: `https://insightsimaging.springeropen.com/counter/pdf/10.1186/s13244-024-01639-2`
- **Method**: A two-level attention model (Transformer) over the lesions and time points of each patient, with a learnable aggregation vector, combined with tumour markers in a nomogram. 207 patients from several centres.
- **Key results**: One-year AUCs were 0.894 (0.728 to 1.000) internally and 0.809 (0.561 to 1.000) prospectively. External AUC without tumour markers was 0.771 (0.510 to 1.000).
- **Relevance**: Attention pooling over an unordered set of lesions to a patient-level outcome (P2, P3).
- **Quality**: High (13). Wide confidence intervals on small validation cohorts.
- **Stance**: Supports
- **Potential use**: P2, multi-lesion aggregation.

### Dan, Huang, Yang, Wu (2025). Revealing cortical spreading pathway of neuropathological events by neural optimal mass transport. [@Dan_2025]
- **Type**: Journal article (IEEE Transactions on Medical Imaging)
- **Read from**: `https://pmc.ncbi.nlm.nih.gov/articles/PMC12323683/`
- **Method**: A variational optimal mass transport model of pathology spread between longitudinal PET scans, constrained to the cortex. A physics-informed network learns population dynamics and predicts flows in unseen subjects. Cortical surfaces are reconstructed with FreeSurfer on a common vertex set.
- **Key results**: The model forecasts future pathology accumulation on public datasets, with gains in accuracy and interpretability over traditional methods.
- **Relevance**: Transport for individual-level prediction that still builds on a common surface space from registration (P1, P3).
- **Quality**: High (13)
- **Stance**: Neutral
- **Potential use**: P3, transport for subject-level prediction.

### Juhling, Rajashekar, Cheng, Hilgetag, Forkert, Werner (2024). Spatial normalization for voxel-based lesion symptom mapping: impact of registration approaches. [@J_hling_2024]
- **Type**: Journal article (Frontiers in Neuroscience)
- **Read from**: `https://www.frontiersin.org/articles/10.3389/fnins.2024.1296357/pdf?isPublishedV2=False`
- **Method**: Four registration approaches (affine, nonlinear, nonlinear with cost-function masking, enantiomorphic; ANTs) for mapping lesion segmentations of 122 acute stroke patients to an atlas before relating voxels to 30-day mRS.
- **Key results**: The brain areas found important were largely consistent across approaches. The nonlinear variants distorted patient images, and local structures stayed misaligned with the atlas even after nonlinear registration.
- **Relevance**: Measures what the registration step costs a lesion-to-outcome analysis (P1).
- **Quality**: High (13)
- **Stance**: Supports
- **Potential use**: P1, cost of registration.

### Andresen, Kepp, Ehrhardt, von der Burchard, Roider, Handels (2022). Deep learning-based simultaneous registration and unsupervised non-correspondence segmentation of medical images with pathologies. [@Andresen_2022]
- **Type**: Journal article (International Journal of Computer Assisted Radiology and Surgery)
- **Read from**: `https://link.springer.com/content/pdf/10.1007/s11548-022-02577-4.pdf`
- **Method**: NCR-Net, a CNN trained on a Mumford-Shah-like functional, outputs a diffeomorphic deformation and a segmentation of non-corresponding regions. Tested on LPBA40 with artificial stroke lesions and on longitudinal OCT.
- **Key results**: It segments non-corresponding regions without supervision. It is more robust to non-correspondences than a registration-only network and state-of-the-art registration algorithms.
- **Relevance**: Pathologies break registration's correspondence assumption, and the method models that explicitly (P1, P2).
- **Quality**: High (13)
- **Stance**: Supports
- **Potential use**: P1, missing correspondence in registration.


### Bi, X., Tang, X., Yuan, Y., et al. (2021). Tensors in statistics. [@Bi_2021]
- **Type**: Journal article (review), Annual Review of Statistics and Its Application.
- **Read from**: the abstract `the lookup script fetch` wrote from the indexes (`10.1146_annurev-statistics-042720-020816.abstract.txt`); the index abstract is truncated after two sentences.
- **Method**: Review.
- **Key results**: An overview of tensors, their properties and their applications in statistics, with tensors described as generalizations of matrices to higher order. [GAP: Key results beyond the first two sentences of the abstract]
- **Relevance**: P1: background on tensor methods in statistics, the community of theme 1.
- **Quality**: Medium (9): review, abstract only.
- **Stance**: Neutral.
- **Potential use**: Introduction, background on tensor models.

### Liu, J., Zhu, C., Long, Z., and Liu, Y. (2021). Tensor regression. [@Liu_2021]
- **Type**: Journal article (monograph), Foundations and Trends in Machine Learning 14(4).
- **Read from**: https://arxiv.org/pdf/2308.11419 (full text, via `the lookup script fetch`), abstract and introduction.
- **Method**: Review of tensor regression algorithms by regression family, the low-rank tensor representations and optimization frameworks they use, online and sketching extensions, applications, datasets and software.
- **Key results**: Tensor regression exploits multidirectional relatedness, reduces the number of model parameters and improves robustness and efficiency over vector and matrix models; the monograph collects algorithms, datasets and software across sociology, climatology, computer vision, chemometrics and neuroscience.
- **Relevance**: P1: the reference survey of tensor regression; core paper of theme 1.
- **Quality**: Medium (10): review.
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression.

### Patalano, M., Konyar, E., and Paynabar, K. (2026). PAR2COX: survival-informed tensor decomposition for phenotyping and risk prediction from irregular longitudinal data. [@arxiv_2609_23705]
- **Type**: Preprint (arXiv 2609.23705); published version looked for with `the lookup script resolve` on the title and on the arXiv ID and with `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2609.23705 (full text, via `the lookup script fetch`), abstract.
- **Method**: PARAFAC2 decomposition joined with a Cox proportional hazards model, using patient-specific latent factors as covariates in the likelihood; alternating optimization; simulations and a MIMIC-IV case study.
- **Key results**: Jointly estimates phenotypes and survival parameters, accommodates patients with and without observed outcomes, and improves risk stratification over existing approaches in simulations and on MIMIC-IV.
- **Relevance**: P1 and P2: a supervised (survival) objective on a decomposition whose irregular mode is time in electronic health records.
- **Quality**: Medium (10): preprint, one real dataset.
- **Stance**: Supports supervising an unaligned-mode decomposition with the outcome.
- **Potential use**: Methods review, supervised PARAFAC2.

### van der Ploeg, G. R., White, F. T. G., Jakobsen, R. R., et al. (2026). ACMTF-R: supervised multi-omics data integration uncovering shared and distinct outcome-associated variation. [@van_der_Ploeg_2026]
- **Type**: Journal article, PLOS One.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1371_journal.pone.0339650.abstract.txt`).
- **Method**: Advanced coupled matrix and tensor factorization extended with a regression step, with a tuning parameter balancing exploration and outcome prediction; simulations and a maternal BMI multi-omics dataset.
- **Key results**: ACMTF-R recovers a small outcome-related component shared between blocks and separates shared from distinct outcome-associated variation, which neither N-PLS nor unsupervised ACMTF does.
- **Relevance**: P1: a supervised coupled factorization that sits between N-PLS and coupled decompositions; its modes are aligned across subjects.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Methods review, supervised coupled factorizations.

### Luo, Y., and Zhang, A. R. (2024). Tensor-on-tensor regression: Riemannian optimization, over-parameterization, statistical-computational gap and their interplay. [@Luo_2024]
- **Type**: Journal article, The Annals of Statistics.
- **Read from**: https://arxiv.org/pdf/2206.08756 (full text, via `the lookup script fetch`), abstract.
- **Method**: Theory and algorithms (Riemannian gradient descent and Gauss-Newton) for tensor-on-tensor regression with a low Tucker rank parameter; simulations.
- **Key results**: First convergence guarantees for general tensor-on-tensor regression, linear and quadratic, in correctly and over-parameterized rank settings; moderate rank over-parameterization is essentially cost-free in sample size for tensors of order three or higher.
- **Relevance**: P1: the current statistical theory of tensor-on-tensor regression, which assumes aligned modes.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression theory.

### Cui, L., Guo, G., Ng, M. K., et al. (2024). GSTRPCA: irregular tensor singular value decomposition for single-cell multi-omics data clustering. [@Cui_2024]
- **Type**: Journal article, Briefings in Bioinformatics.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1093_bib_bbae649.abstract.txt`).
- **Method**: Irregular tensor decomposition based on tensor robust PCA with low-rank and sparsity constraints and a weighted threshold model; convergence guarantee; clustering experiments.
- **Key results**: Keeps the original structure of omics layers with different feature dimensions and outperformed the compared methods for clustering single-cell multi-omics data.
- **Relevance**: P2: a decomposition for an irregular mode, unsupervised.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, irregular tensors.

### Ren, Y., Lou, J., Li, X., et al. (2023). MULTIPAR: supervised irregular tensor factorization with multi-task learning. [@arxiv_2208_00993]
- **Type**: Conference paper (Machine Learning for Health, PMLR 225, 2023); entry from the proceedings page https://proceedings.mlr.press/v225/ren23a.html via `the lookup script bibtex 2208.00993 --page`.
- **Read from**: https://arxiv.org/html/2208.00993 (full text, via `the lookup script fetch`), abstract.
- **Method**: PARAFAC2 supervised by static and dynamic prediction tasks in a multi-task framework; two temporal EHR datasets.
- **Key results**: Supervising the irregular tensor factorization with downstream tasks gave better tensor fit, more meaningful subgroups and stronger predictive performance than the state-of-the-art methods compared.
- **Relevance**: P1 and P2: names the irregular mode as "not aligned" and supervises it with patient outcomes; the irregular mode is time.
- **Quality**: High (12).
- **Stance**: Supports supervised unaligned-mode factorization.
- **Potential use**: Methods review, supervised PARAFAC2.

### Alam, M. S., Kaddurah-Daouk, R., and Luo, S. (2026). Joint modeling of high-dimensional longitudinal data and survival using supervised low-rank tensor decomposition. [@Alam_2026]
- **Type**: Journal article, Biostatistics.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1093_biostatistics_kxag007.abstract.txt`).
- **Method**: Supervised low-rank functional tensor decomposition of multivariate longitudinal data joined with a proportional hazards model, estimated by Monte Carlo EM; simulations and ADNI lipidomics.
- **Key results**: Better estimation and prediction than a two-stage approach under high censoring and small samples; four components explain over 99 percent of the variation in ADNI lipidomics and give subject-level latent predictors of dementia onset.
- **Relevance**: P1: one-stage supervision of a tensor decomposition by a survival outcome.
- **Quality**: High (12).
- **Stance**: Supports joint over two-stage modelling.
- **Potential use**: Methods review, supervised decompositions.

### Lock, E. F., and Li, G. (2018). Supervised multiway factorization. [@Lock_2018a]
- **Type**: Journal article, Electronic Journal of Statistics.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1214_18-ejs1421.abstract.txt`).
- **Method**: Probabilistic CP factorization whose latent variables are informed by covariates (SupCP), EM estimation, identifiability conditions; facial images and amino acid fluorescence.
- **Key results**: Covariate supervision gives more accurate and interpretable latent structure and a full probability model of a multiway observation given covariates, usable for prediction.
- **Relevance**: P1: the supervised CP factorization the later supervised decompositions extend.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, supervised decompositions.

### Zhou, Y., Wong, R. K. W., and He, K. (2024). Broadcasted nonparametric tensor regression. [@Zhou_2024]
- **Type**: Journal article, Journal of the Royal Statistical Society Series B.
- **Read from**: https://arxiv.org/pdf/2008.12927 (full text, via `the lookup script fetch`), abstract.
- **Method**: A broadcasting operation that distributes univariate functions to every entry of the tensor covariate; penalized estimation with polynomial splines; rates and a minimax lower bound.
- **Key results**: The estimator attains a desirable convergence rate with diverging tensor dimensions and improves on linear tensor regression in numerical experiments.
- **Relevance**: P1: nonlinear scalar-on-tensor regression; entries are assumed to correspond across subjects.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression.

### Xiao, Q., Liu, G., Feng, Q., et al. (2025). Tensor coupled learning of incomplete longitudinal features and labels for clinical score regression. [@Xiao_2025]
- **Type**: Journal article, IEEE TPAMI.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_tpami.2024.3471800.abstract.txt`).
- **Method**: Tensor coupled learning of incomplete longitudinal features and labels with a dynamic regularizer, inductive inference from baseline features.
- **Key results**: Handles incomplete longitudinal entries of features and labels jointly and reports a marked improvement on clinical score regression with incomplete longitudinal data.
- **Relevance**: P1 and P2: a supervised tensor model where the time mode is incompletely observed per subject.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, supervised tensor models with missing entries.

### Chen, C.-C., Chang, S.-M., Lin, P.-C., et al. (2025). Statistical inference for tensor-based covariates in Cox regression modeling in integrated genome studies. [@Chen_2025]
- **Type**: Journal article, Statistics in Medicine.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1002_sim.70145.abstract.txt`).
- **Method**: Cox regression with tensor covariates under a rank-R decomposition, rank selection, variable-specific tensor tests, asymptotic normality; colorectal cancer multi-omics.
- **Key results**: Reduces the parameter dimension of the partial likelihood and gives tests for covariate effects, shown in simulations and on a multi-omics survival dataset.
- **Relevance**: P1: survival outcome from tensor covariates whose modes are aligned.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor survival models.

### Mahan, S. P., Moosmuller, C., and Cloninger, A. (2024). Point cloud classification via deep set linearized optimal transport. [@arxiv_2401_01460]
- **Type**: Preprint (arXiv 2401.01460); published version looked for with `the lookup script resolve` on the title and the arXiv ID and with `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2401.01460 (full text, via `the lookup script fetch`), abstract.
- **Method**: Input convex neural networks approximate transport maps from a shared reference to each point cloud; a discriminator weights the samples into a permutation-invariant classifier.
- **Key results**: L2 distances between transport maps from a fixed reference approximate Wasserstein-2 distances under stated conditions, so point clouds are embedded jointly and classified; the theme 2 record notes one flow-cytometry experiment.
- **Relevance**: P1 and P2: a reference measure plus a set encoder, joining themes 2 and 3.
- **Quality**: Medium (9): preprint, limited experiments.
- **Stance**: Supports reference-based transport embeddings.
- **Potential use**: Methods review, transport embeddings of sets.

### Wang, Z., and Fan, J. (2024). Graph classification via reference distribution learning: theory and practice. [@Wang_2024]
- **Type**: Conference paper (NeurIPS 2024 per the OpenAlex record).
- **Read from**: https://arxiv.org/html/2408.11370 (full text, via `the lookup script fetch`), abstract.
- **Method**: Node embeddings of each graph treated as a discrete distribution and classified by maximum mean discrepancy to adaptively learned reference distributions, without global pooling; generalization bounds.
- **Key results**: Stronger generalization than GNNs with global pooling in theory and experiments, and at least 10 times faster than leading competitors.
- **Relevance**: P2: learned reference distributions compared by MMD, an alternative to transport templates.
- **Quality**: Medium (11).
- **Stance**: Supports learned references over pooling.
- **Potential use**: Methods review, learned references.

### Liu, W., Xie, J., Zhang, C., Yamada, M., Zheng, N., and Qian, H. (2023). Robust graph dictionary learning. [@Liu_2023]
- **Type**: Conference paper (ICLR 2023). No DOI and no arXiv ID in any index; entry written from the proceedings page https://mlanthology.org/iclr/2023/liu2023iclr-robust/ (its citation block), matching the Semantic Scholar record.
- **Read from**: the conference PDF saved by theme 2 (`theme-2/9078452e8b927597bc0aef46c64b475ea06e2a72.read-2.txt`), abstract and introduction.
- **Method**: Graph dictionary learning in the frame of Vincent-Cuaz et al. 2021, with the Gromov-Wasserstein discrepancy replaced by a robust Gromov-Wasserstein discrepancy (RGWD) that has stated theoretical properties and an efficient numerical scheme.
- **Key results**: GWD-based dictionary learning is sensitive to structural noise; with RGWD the atoms are learned from noisy graphs, and the algorithm performs well on simulated and real datasets.
- **Relevance**: P2: a learned template (dictionary of graph atoms) under transport, made robust to noise in the structure being matched.
- **Quality**: Medium (11): peer-reviewed conference, benchmark graphs only.
- **Stance**: Supports robust transport for template learning.
- **Potential use**: Methods review, transport dictionaries.

### Yang, J., Labeau, M., and d'Alche-Buc, F. (2024). Exploiting edge features in graph-based learning with fused network Gromov-Wasserstein distance. [@arxiv_2309_16604]
- **Type**: Journal article (Transactions on Machine Learning Research, 2024); entry from the proceedings page https://mlanthology.org/tmlr/2024/yang2024tmlr-exploiting/ via `the lookup script bibtex 2309.16604 --page`.
- **Read from**: https://arxiv.org/html/2309.16604 (full text saved by theme 2), abstract.
- **Method**: An extension of Gromov-Wasserstein to graphs with features on both nodes and edges, with algorithms for the distance and for barycenters.
- **Key results**: The distance is effective in learning tasks where graphs are inputs (classification) or outputs (graph prediction).
- **Relevance**: P2: a transport coupling between unaligned structured objects that uses edge attributes, which plain fused GW leaves out.
- **Quality**: Medium (11).
- **Stance**: Supports richer transport costs.
- **Potential use**: Methods review, Gromov-Wasserstein variants.

### Zeng, Z., Zhu, R., Xia, Y., Zeng, H., and Tong, H. (2023). Generative graph dictionary learning. [@Zeng_2023]
- **Type**: Conference paper (ICML 2023, PMLR 202). No DOI and no arXiv ID in any index; entry written from the proceedings page https://mlanthology.org/icml/2023/zeng2023icml-generative/ (its citation block), matching the Semantic Scholar record.
- **Read from**: the abstract in `theme-2/W4414003189.abstract.txt` (OpenAlex record, PubMed Central copy PMC12403051).
- **Method**: A fused Gromov-Wasserstein mixture model (FraMe) that treats graph dictionary learning generatively, with a graph generation function built on a radial basis function kernel and FGW, fitted by expectation-maximization.
- **Key results**: The nonlinear embedding spaces approximate the original graph spaces (proved), the EM solution converges, and node and graph embeddings improve over the methods compared.
- **Relevance**: P2: a generative counterpart of linear transport dictionaries.
- **Quality**: Medium (10): abstract only.
- **Stance**: Supports nonlinear transport dictionaries.
- **Potential use**: Methods review, transport dictionaries.

### Chen, J., and Martel, A. L. (2022). Metastatic cancer outcome prediction with injective multiple instance pooling. [@arxiv_2203_04964]
- **Type**: Preprint (arXiv 2203.04964); published version looked for with `the lookup script resolve` on the title and the arXiv ID and with `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2203.04964 (full text, via `the lookup script fetch`), abstract and introduction.
- **Method**: Two public datasets processed into a 341-patient multifocal cohort; multiple instance learning over per-lesion radiomic features with two injective pooling functions.
- **Key results**: Common multiple instance classifiers lack expressiveness for outcome prediction; injective pooling reaches state-of-the-art performance on non-small-cell lung cancer and head and neck CT outcome prediction.
- **Relevance**: P1, P2 and P3: patient-level prediction from a variable set of lesions by permutation-invariant pooling, built on lesion segmentation and radiomics.
- **Quality**: Medium (10): preprint, public cohorts.
- **Stance**: Supports set-based multi-lesion models.
- **Potential use**: Literature review, multi-lesion outcome models.

### Gharibi, O., Sabouri, M., Hajianfar, G., et al. (2026). Radiomic phenotype-informed patient-level aggregation of multiple lesions: application to PET prognostic modeling in NET and DLBCL. [@Gharibi_2026]
- **Type**: Journal article, Chemical and Biomedical Imaging.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1021_cbmi.6c00173.abstract.txt`).
- **Method**: Lesion-level PET radiomics (PyRadiomics, ComBat), unsupervised consensus clustering into radiomic phenotypes, aggregation at body, phenotype, organ and phenotype-organ level, nested cross-validation for survival and progression in 81 NET and 76 DLBCL patients.
- **Key results**: Hierarchical aggregation was numerically favourable over single-lesion approaches; clinical plus aggregated models gave the highest C-indices (for example NET OS 0.72 against 0.65 for clinical-only).
- **Relevance**: P1 and P3: hand-designed aggregation of a variable lesion set into a fixed patient vector, the step a learned set model replaces.
- **Quality**: Medium (10): small cohorts, abstract only.
- **Stance**: Supports phenotype-aware aggregation.
- **Potential use**: Literature review, multi-lesion radiomics.

### Gacheva, I., Lu, D., Kurz, G., et al. (2026). Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy. [@Gacheva_2026]
- **Type**: Journal article, NeuroImage: Reports.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.ynirp.2026.100418.abstract.txt`).
- **Method**: Full MR spectra (7442 spectra, 422 patients) as bags in multiple instance learning with min-max-mean and attention pooling; comparison with neuroradiologists.
- **Key results**: The best configuration reached AUC 0.82 (sensitivity 0.76, specificity 0.80) on a hold-out set; attention weights pointed to lipid, choline and Glx regions.
- **Relevance**: P1 and P2: patient-level labels from a variable number of unordered spectra by permutation-invariant pooling.
- **Quality**: Medium (10): single centre.
- **Stance**: Supports MIL for weak patient-level labels.
- **Potential use**: Literature review, medical MIL.

### Yi, H., and Stanley, N. (2021). CytoSet: predicting clinical outcomes via set-modeling of cytometry data. [@Yi_2021]
- **Type**: Conference paper, ACM BCB 2021.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1145_3459930.3469529.abstract.txt`).
- **Method**: Each patient sample of flow or mass cytometry treated as a set of cells and encoded by permutation-invariant architectures to predict clinical outcome.
- **Key results**: State-of-the-art classification across flow and mass cytometry benchmarks, robust to the number of sub-sampled cells and to model depth.
- **Relevance**: P1 and P2: a subject is an unordered point set with no correspondence between subjects, handled by permutation invariance.
- **Quality**: Medium (10).
- **Stance**: Supports set encoders for clinical point sets.
- **Potential use**: Literature review, set encoders on clinical data.

### Liu, K., Zhu, Y., Wang, R., et al. (2026). Three-dimensional point-cloud learning for patient-specific deep brain stimulation motor response prediction in Parkinson disease. [@Liu_2026]
- **Type**: Journal article, BME Frontiers.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.34133_bmef.0276.abstract.txt`).
- **Method**: Patient-specific point clouds from MRI, CT, electrode reconstruction and finite element electric fields; PointNet++ compared with a voxelized CNN on 79 patients.
- **Key results**: PointNet++ predicted 15 of 24 test patients within 5 MDS-UPDRS-III points (62.5 percent), against 8 of 24 for the voxelized CNN.
- **Relevance**: P1 and P3: point-cloud prediction that keeps patient anatomy rather than mapping to an atlas grid, though registration still enters the pipeline.
- **Quality**: Medium (9): small test set.
- **Stance**: Supports point-cloud over voxel representations.
- **Potential use**: Literature review, medical point clouds.

### Shou, Y., Chen, Z., Feng, P., et al. (2024). Integrating PointNet-based model and machine learning algorithms for classification of rupture status of IAs. [@Shou_2024]
- **Type**: Journal article, Bioengineering.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.3390_bioengineering11070660.abstract.txt`).
- **Method**: PointNet features of CFD hemodynamic clouds of intracranial aneurysms combined with geometric and hemodynamic parameters in five classifiers.
- **Key results**: 16-dimensional cloud features gave the best results (accuracy up to 0.908, AUC up to 0.946) and improved on geometric and hemodynamic parameters alone.
- **Relevance**: P1: a permutation-invariant encoder on a per-patient point cloud, used as a feature extractor.
- **Quality**: Low (7): small study, two-stage pipeline.
- **Stance**: Supports point-cloud features.
- **Potential use**: Literature review, medical point clouds.

### Ronneberger, O., Fischer, P., and Brox, T. (2015). U-Net: convolutional networks for biomedical image segmentation. [@Ronneberger_2015]
- **Type**: Conference paper, MICCAI 2015 (LNCS).
- **Read from**: https://arxiv.org/html/1505.04597 (full text saved by theme 4), abstract.
- **Method**: Encoder-decoder convolutional network with skip connections and heavy augmentation for segmentation from few annotated images.
- **Key results**: Outperformed the earlier best method on the ISBI neuronal structure challenge and won the cell tracking challenge categories it entered.
- **Relevance**: P3: the segmentation backbone behind the lesion masks most multi-lesion pipelines start from.
- **Quality**: High (13): seminal.
- **Stance**: Neutral.
- **Potential use**: Background, segmentation step.

### Hering, A., Hansen, L., Mok, T. C. W., et al. (2023). Learn2Reg: comprehensive multi-task medical image registration challenge, dataset and evaluation in the era of deep learning. [@Hering_2023]
- **Type**: Journal article, IEEE Transactions on Medical Imaging.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_TMI.2022.3213983.abstract.txt`).
- **Method**: Multi-task registration challenge across brain, abdomen and thorax, CT, MR and ultrasound, with robustness, accuracy, plausibility and runtime metrics over 65 submissions.
- **Key results**: No single approach was best across tasks; the paper also challenges the belief that conventional methods must be much slower than learned ones.
- **Relevance**: P3: the benchmark that states what registration costs and how well it works.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Sotiras, A., Davatzikos, C., and Paragios, N. (2013). Deformable medical image registration: a survey. [@Sotiras_2013]
- **Type**: Journal article (survey), IEEE Transactions on Medical Imaging.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_TMI.2013.2265603.abstract.txt`).
- **Method**: Survey organized by the components of deformable registration (deformation model, matching criterion, optimization).
- **Key results**: Systematic account of deformable registration for multi-modality fusion, longitudinal studies and population atlases.
- **Relevance**: P3: reference for classical registration to a common space.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Chen, J., Liu, Y., Wei, S., et al. (2025). A survey on deep learning in medical image registration: new technologies, uncertainty, evaluation metrics, and beyond. [@Chen_2025a]
- **Type**: Journal article (survey), Medical Image Analysis.
- **Read from**: the full text saved by theme 4 (`theme-4/10.1016_j.media.2024.103385.txt`), abstract.
- **Method**: Survey of learned registration: similarity measures, deformation regularization, architectures, uncertainty and evaluation.
- **Key results**: Traces learned registration from regression and U-Net networks to current methods and evaluation practice.
- **Relevance**: P3: current state of the registration step that template-free methods would remove.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Wiltgen, T., McGinnis, J., Schlaeger, S., et al. (2024). LST-AI: a deep learning ensemble for accurate MS lesion segmentation. [@Wiltgen_2024]
- **Type**: Journal article, NeuroImage: Clinical.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.nicl.2024.103611.abstract.txt`).
- **Method**: Ensemble of three 3D U-Nets with BCE and Tversky loss trained on 491 T1w and FLAIR pairs, with a lesion location annotation tool.
- **Key results**: Dice and F1 above 0.5 on 270 test cases, ahead of LST-LGA, LST-LPA, SAMSEG and nnU-Net (all below 0.45).
- **Relevance**: P3: lesion segmentation that produces the lesion sets downstream models consume.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, segmentation step.

### Dexl, J., Gatidis, S., Fruh, M., et al. (2025). AutoPET challenge on fully automated lesion segmentation in oncologic PET/CT imaging, part 2: domain generalization. [@Dexl_2025]
- **Type**: Journal article, Journal of Nuclear Medicine.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.2967_jnumed.125.270260.abstract.txt`).
- **Method**: Challenge: models trained on 1014 FDG PET/CT studies and tested on 200 cases from five domains (institution, pathology, population, tracer).
- **Key results**: Single-source generalization remained hard; the best team reached mean Dice 0.5038; nnU-Net was the most used framework.
- **Relevance**: P3: whole-body lesion segmentation quality, which bounds any multi-lesion pipeline built on it.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, segmentation step and its limits.

### Gillies, R. J., Kinahan, P. E., and Hricak, H. (2016). Radiomics: images are more than pictures, they are data. [@Gillies_2016]
- **Type**: Journal article (review), Radiology.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1148_radiol.2015151169.abstract.txt`).
- **Method**: Review of the radiomics process and its challenges.
- **Key results**: Describes the conversion of images to mineable features combined with other patient data for decision support.
- **Relevance**: P3: the radiomics step.
- **Quality**: High (12): seminal review.
- **Stance**: Neutral.
- **Potential use**: Background, radiomics step.

### Fischl, B. (2012). FreeSurfer. [@Fischl_2012]
- **Type**: Journal article, NeuroImage.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.neuroimage.2012.01.021.abstract.txt`).
- **Method**: Description of the FreeSurfer suite.
- **Key results**: Automatic models of most macroscopically visible brain structures from a T1-weighted image, freely available.
- **Relevance**: P3: atlas-based parcellation that defines region sets in brain studies.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, atlas step.

### Sabouri, M., Hajianfar, G., Gharibi, O., et al. (2025). Enhancing PRRT outcome prediction in neuroendocrine tumors: aggregated multi-lesion PET radiomics incorporating inter-tumor heterogeneity. [@Sabouri_2025]
- **Type**: Journal article, Cancers.
- **Read from**: https://www.mdpi.com/2072-6694/17/23/3887/pdf (full text, via `the lookup script fetch`), abstract.
- **Method**: 81 NET patients; lesions ranked by SUV or volume, top 1, 3 or 5 selected, radiomics aggregated by stacking or statistics; eight classifiers for progression and time to progression.
- **Key results**: For progression, the single top lesion by descending SUVmin gave the best recall and specificity (logistic regression, 0.75 and 0.77); for time to progression, statistically aggregated features of the top five lesions by SUVmean gave the best C-index (0.68, random survival forest).
- **Relevance**: P1 and P3: hand-designed lesion selection and aggregation.
- **Quality**: Medium (9): small cohort.
- **Stance**: Supports multi-lesion aggregation.
- **Potential use**: Literature review, multi-lesion radiomics.

### Mi, L., Zhang, W., Zhang, J., et al. (2017). An optimal transportation based univariate neuroimaging index. [@Mi_2017]
- **Type**: Conference paper, ICCV 2017.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_ICCV.2017.29.abstract.txt`).
- **Method**: Variational optimal transport in 3D from each brain image to a template, solved by Newton's method; the Wasserstein distance to the template as an index.
- **Key results**: 82.30 percent accuracy for AD against controls on ADNI sMRI and 88.37 percent on FDG-PET with pairwise Wasserstein distances.
- **Relevance**: P2 and P3: transport to a template replaces voxel correspondence by a mass coupling.
- **Quality**: Medium (11).
- **Stance**: Supports transport-based indices.
- **Potential use**: Literature review, transport in neuroimaging.

### Belkhatir, Z., San Jose Estepar, R., and Tannenbaum, A. R. (2022). Wasserstein-based texture analysis in radiomic studies. [@Belkhatir_2022]
- **Type**: Journal article, Computerized Medical Imaging and Graphics.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.compmedimag.2022.102129.abstract.txt`).
- **Method**: GLCM texture matrices compared by the Wasserstein metric to class-wise reference GLCMs selected in training; SVM with Bayesian optimization.
- **Key results**: The Wasserstein-optimized spatial texture features outperformed statistical features, Euclidean-optimized spatial features and non-optimized Wasserstein features in classifying unseen COVID CT images; no figures are given in the abstract.
- **Relevance**: P2 and P3: transport inside the radiomics step, with learned references.
- **Quality**: Medium (10).
- **Stance**: Supports transport in radiomics.
- **Potential use**: Literature review, transport in radiomics.

### Tang, Z., Li, S., Ding, C., et al. (2026). Patch2Space: a registration-free segmentation method for misaligned multimodal medical images. [@Tang_2026]
- **Type**: Journal article, Physics in Medicine and Biology.
- **Read from**: the full text `the lookup script fetch` wrote (`10.1088_1361-6560_ae4286.txt`), abstract.
- **Method**: Patches of misaligned modalities encoded to positions in a unified body space, with spatial attention and multilevel fusion, 1472 patients.
- **Key results**: Segmentation from misaligned multimodal images outperforms state-of-the-art methods and approaches results with well-aligned inputs.
- **Relevance**: P3: removes the inter-modality registration step inside one subject.
- **Quality**: Medium (11).
- **Stance**: Supports registration-free fusion.
- **Potential use**: Literature review, registration-free methods.

### Shi, J., Xu, Y., Chen, Z., et al. (2026). Deep learning-based spatiotemporal estimation of lesion changes for patient-level assessment of breast cancer lung metastases on longitudinal CT. [@Shi_2026]
- **Type**: Journal article, npj Precision Oncology.
- **Read from**: the full text `the lookup script fetch` wrote (`10.1038_s41698-026-01473-3.txt`), abstract.
- **Method**: Patient-level spatiotemporal assessment of multiple lesions on longitudinal CT without image registration.
- **Key results**: Outperforms state-of-the-art methods on an in-house breast cancer lung metastasis dataset and a public dataset.
- **Relevance**: P1 and P3: patient-level assessment of a lesion set with the registration step removed.
- **Quality**: Medium (11).
- **Stance**: Supports registration-free multi-lesion models.
- **Potential use**: Literature review, registration-free methods.

### Haskins, G., Kruger, U., and Yan, P. (2020). Deep learning in medical image registration: a survey. [@Haskins_2020]
- **Type**: Journal article (survey), Machine Vision and Applications.
- **Read from**: the full text `the lookup script fetch` wrote (`10.1007_s00138-020-01060-x.txt`), abstract.
- **Method**: Survey of learned registration.
- **Key results**: Reviews the rapid adoption of deep learning for registration in fusion, atlas creation and tumour monitoring.
- **Relevance**: P3: registration step.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Lambin, P., Rios-Velazquez, E., Leijenaar, R., et al. (2012). Radiomics: extracting more information from medical images using advanced feature analysis. [@Lambin_2012]
- **Type**: Journal article, European Journal of Cancer.
- **Read from**: the full text saved by theme 4 (`theme-4/10.1016_j.ejca.2011.11.036.txt`), abstract.
- **Method**: Position paper introducing radiomics.
- **Key results**: High-throughput image features can capture intra-tumour heterogeneity non-invasively but need multi-centre validation.
- **Relevance**: P3: origin of the radiomics step.
- **Quality**: High (12): seminal.
- **Stance**: Neutral.
- **Potential use**: Background, radiomics step.

### Lv, J., Zhang, Q., Liao, Z., et al. (2026). AMMR-Surv: learning metabolic and morphologic responses across lesions from longitudinal PET/CT for survival prediction in non-small-cell lung cancer. [@Lv_2026]
- **Type**: Journal article, Bioengineering.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.3390_bioengineering13111288.abstract.txt`).
- **Method**: Prototype-based metabolic response learning, asymmetric CT comparison and event-aware multi-lesion aggregation on 126 ACRIN 6668 patients, nested cross-validation.
- **Key results**: Uno concordance 0.719 (95 percent CI 0.670 to 0.772); the gain over generic longitudinal modelling was 0.007 (CI -0.021 to 0.046), so superiority over it is uncertain.
- **Relevance**: P1 and P2: learned prototypes and aggregation over a lesion set.
- **Quality**: Medium (10): small cohort, honest intervals.
- **Stance**: Neutral.
- **Potential use**: Literature review, multi-lesion survival models.

### Kocak, B., Akinci D'Antonoli, T., Mercaldo, N., et al. (2024). METhodological RadiomICs Score (METRICS): a quality scoring tool for radiomics research endorsed by EuSoMII. [@Kocak_2024]
- **Type**: Journal article, Insights into Imaging.
- **Read from**: the full text `the lookup script fetch` wrote (`10.1186_s13244-023-01572-w.txt`), abstract.
- **Method**: Modified Delphi study with 59 panelists from 19 countries.
- **Key results**: 30 weighted items in 9 categories, study design and imaging data weighted highest.
- **Relevance**: P3: quality standard for radiomics pipelines.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methodology, quality appraisal of radiomics studies.

### Qahqaie, M., Neumann, D., Heimann, T., et al. (2026). Unbalanced optimal transport for robust longitudinal lesion evolution with registration-aware and appearance-guided priors. [@Qahqaie_2026]
- **Type**: Conference paper, ISBI 2026.
- **Read from**: https://arxiv.org/html/2602.09933 (full text, via `the lookup script fetch`), abstract.
- **Method**: Unbalanced transport between lesion sets at two time points, cost blending size-normalized geometry, registration trust from the Jacobian and patch appearance; pruning of the plan.
- **Key results**: Higher edge-detection precision and recall, lesion-state recall and lesion-graph F1 than distance-only matchers, with new, vanishing, merging and splitting lesions handled.
- **Relevance**: P2 and P3: a transport coupling between lesion sets that builds on registration rather than removing it.
- **Quality**: Medium (11).
- **Stance**: Supports transport for lesion correspondence.
- **Potential use**: Literature review, transport between lesion sets.

### Thual, A., Benchetrit, Y., Geilert, F., et al. (2023). Aligning brain functions boosts the decoding of visual semantics in novel subjects. [@arxiv_2312_06467]
- **Type**: Preprint (arXiv 2312.06467). Semantic Scholar and https://mlanthology.org/tmlr/2025/thual2025tmlr-sampleefficient name a TMLR 2025 version under the title "Sample-efficient decoding of visual stimuli from fMRI through inter-individual functional alignment"; `the lookup script bibtex 2312.06467 --page` on that page refused it (citation_title ratio 0.42), so the entry stays the preprint.
- **Read from**: https://arxiv.org/html/2312.06467 (full text, via `the lookup script fetch`), abstract.
- **Method**: Functional alignment of brain responses across subjects before decoding, plus a multi-subject alignment method.
- **Key results**: Out-of-subject decoding improved by up to 75 percent over anatomical alignment, and beat single-subject models when under 100 minutes of data were available.
- **Relevance**: P2 and P3: functional (transport) alignment replacing anatomical registration before prediction.
- **Quality**: Medium (10): preprint version.
- **Stance**: Supports functional over anatomical alignment.
- **Potential use**: Literature review, alignment in neuroimaging.

### Dey, N., and Dalca, A. V. (2026). Registration is a representation problem: solving whole-body PET/CT registration. [@arxiv_2610_18804]
- **Type**: Preprint (arXiv 2610.18804); published version looked for with `the lookup script resolve` and `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2610.18804 (full text, via `the lookup script fetch`), abstract.
- **Method**: Per-voxel representations from a 3D foundation model plus segmentation labels drive an iterative GPU registration solver, with lesion-wise volume preservation.
- **Key results**: First place on the Learn2Reg 2026 PSMAReg leaderboard without task-specific training.
- **Relevance**: P3: current registration for whole-body lesion follow-up, with lesion volume kept.
- **Quality**: Medium (9): preprint, challenge report.
- **Stance**: Supports representation-driven registration.
- **Potential use**: Literature review, registration step.

### Dalca, A. V., Balakrishnan, G., Guttag, J., and Sabuncu, M. R. (2018). Unsupervised learning for fast probabilistic diffeomorphic registration. [@Dalca_2018]
- **Type**: Conference paper, MICCAI 2018 (LNCS).
- **Read from**: https://arxiv.org/html/1805.04605 (full text, via `the lookup script fetch`), abstract.
- **Method**: Probabilistic generative model of deformation with an unsupervised CNN inference algorithm giving diffeomorphic fields and uncertainty.
- **Key results**: State-of-the-art accuracy on 3D brain registration with very fast runtimes, diffeomorphic guarantees and uncertainty estimates.
- **Relevance**: P3: learned registration to a template, the step correspondence-free methods avoid.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Yang, X., Kwitt, R., Styner, M., and Niethammer, M. (2017). Quicksilver: fast predictive image registration, a deep learning approach. [@Yang_2017]
- **Type**: Journal article, NeuroImage.
- **Read from**: the PubMed abstract (PMID 28705497, saved as `pubmed-C46.txt` from NCBI E-utilities).
- **Method**: Patch-wise prediction of the LDDMM momentum by an encoder-decoder network, a probabilistic version for uncertainty and a correction network.
- **Key results**: Accurately predicts registrations obtained by optimization, is very fast and reaches state-of-the-art results on four validation datasets for atlas-to-image and image-to-image registration.
- **Relevance**: P3: learned diffeomorphic registration.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Klein, A., Andersson, J., Ardekani, B. A., et al. (2009). Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration. [@Klein_2009]
- **Type**: Journal article, NeuroImage.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.neuroimage.2008.12.037.abstract.txt`).
- **Method**: Over 45,000 registrations between 80 manually labelled brains by 14 algorithms, scored by 8 error measures.
- **Key results**: The relative performance of the algorithms was largely independent of the subject population, labelling protocol and error measure.
- **Relevance**: P3: evidence on how well registration aligns anatomy across subjects.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Avants, B. B., Tustison, N. J., Song, G., et al. (2011). A reproducible evaluation of ANTs similarity metric performance in brain image registration. [@Avants_2011]
- **Type**: Journal article, NeuroImage.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.neuroimage.2010.09.025.abstract.txt`).
- **Method**: ANTs template-based normalization evaluated with three similarity metrics by two-fold cross-validation on LPBA40.
- **Key results**: The best ANTs methods are competitive with existing brain extraction (Jaccard 0.958) and cortical labelling results.
- **Relevance**: P3: the template-building and registration toolkit most atlas pipelines use.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Bronstein, M. M., Bruna, J., LeCun, Y., Szlam, A., and Vandergheynst, P. (2017). Geometric deep learning: going beyond Euclidean data. [@Bronstein_2017]
- **Type**: Journal article (tutorial), IEEE Signal Processing Magazine.
- **Read from**: https://arxiv.org/pdf/1611.08097 (full text, via `the lookup script fetch`), opening section.
- **Method**: Overview of deep learning on graphs and manifolds.
- **Key results**: Frames the generalization of deep networks to non-Euclidean data such as brain networks and meshed surfaces, where grid invariances do not hold.
- **Relevance**: P1 and P2: background for networks on data without a shared grid.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Introduction, background.

### Jaderberg, M., Simonyan, K., Zisserman, A., and Kavukcuoglu, K. (2015). Spatial transformer networks. [@arxiv_1506_02025]
- **Type**: Conference paper (NeurIPS 2015); entry from the proceedings page https://mlanthology.org/neurips/2015/jaderberg2015neurips-spatial/ via `the lookup script bibtex 1506.02025 --page`.
- **Read from**: https://arxiv.org/html/1506.02025 (full text, via `the lookup script fetch`), abstract.
- **Method**: A differentiable module that applies a learned spatial transformation to feature maps inside a network.
- **Key results**: Networks learn invariance to translation, scale, rotation and warping and improve on several benchmarks.
- **Relevance**: P2 and P3: learned alignment inside the model, the basis of learned registration.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review, learned alignment.

### Ktena, S. I., Parisot, S., Ferrante, E., et al. (2017). Distance metric learning using graph convolutional networks: application to functional brain networks. [@Ktena_2017]
- **Type**: Conference paper, MICCAI 2017 (LNCS).
- **Read from**: https://arxiv.org/html/1703.02161 (full text, via `the lookup script fetch`), abstract.
- **Method**: Siamese spectral graph convolution to learn a similarity metric between brain graphs.
- **Key results**: On ABIDE the learned metric improved a k-nn classifier by 11.9 percent over a traditional distance.
- **Relevance**: P1: subject-level prediction from brain graphs whose nodes come from an atlas, so correspondence is given by the parcellation.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Literature review, graph methods in neuroimaging.

### Ying, Z., You, J., Morris, C., Ren, X., Hamilton, W., and Leskovec, J. (2018). Hierarchical graph representation learning with differentiable pooling. [@arxiv_1806_08804]
- **Type**: Conference paper (NeurIPS 2018); entry from the proceedings page https://mlanthology.org/neurips/2018/ying2018neurips-hierarchical/ via `the lookup script bibtex 1806.08804 --page`.
- **Read from**: https://arxiv.org/html/1806.08804 (full text, via `the lookup script fetch`), abstract.
- **Method**: Learned soft cluster assignment of nodes at each GNN layer to coarsen graphs hierarchically.
- **Key results**: An average improvement of 5 to 10 percent accuracy on graph classification benchmarks over existing pooling.
- **Relevance**: P2: learned pooling of a variable node set.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, graph pooling.

### Nikolentzos, G., Meladianos, P., and Vazirgiannis, M. (2017). Matching node embeddings for graph similarity. [@Nikolentzos_2017]
- **Type**: Conference paper, AAAI 2017.
- **Read from**: https://ojs.aaai.org/index.php/AAAI/article/download/10839/10698 (full text, via `the lookup script fetch`), abstract.
- **Method**: Graphs represented as sets of eigenvector node embeddings compared by the earth mover's distance or a pyramid match kernel.
- **Key results**: Comparing global structure through node embeddings is effective for labelled and unlabelled graph comparison. [GAP: Key results figures not in the abstract read]
- **Relevance**: P2: a transport distance between node sets as a graph similarity.
- **Quality**: Medium (11).
- **Stance**: Supports transport between embedded node sets.
- **Potential use**: Methods review, transport graph kernels.

### Maretic, H. P., El Gheche, M., Chierchia, G., and Frossard, P. (2019). GOT: an optimal transport framework for graph comparison. [@arxiv_1906_02085]
- **Type**: Conference paper (NeurIPS 2019); entry from the proceedings page https://mlanthology.org/neurips/2019/maretic2019neurips-got/ via `the lookup script bibtex 1906.02085 --page`.
- **Read from**: https://arxiv.org/html/1906.02085 (full text, via `the lookup script fetch`), abstract.
- **Method**: Wasserstein distance between smooth graph signal distributions expressed through graph Laplacians; graph alignment by stochastic Bayesian exploration over permutations.
- **Key results**: Improvement over state-of-the-art on graph alignment, classification and signal prediction.
- **Relevance**: P2: transport-based alignment of unaligned graphs.
- **Quality**: High (12).
- **Stance**: Supports transport alignment.
- **Potential use**: Methods review, graph transport.

### Solomon, J., Peyre, G., Kim, V. G., and Sra, S. (2016). Entropic metric alignment for correspondence problems. [@Solomon_2016]
- **Type**: Journal article, ACM Transactions on Graphics (SIGGRAPH).
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1145_2897824.2925903.abstract.txt`).
- **Method**: Entropy-regularized Gromov-Wasserstein solved by a compact, provably convergent algorithm on metric measure matrices.
- **Key results**: Soft correspondences across geometric domains, extended to partial distances, user guidance, symmetry detection and joint analysis of several domains.
- **Relevance**: P2: the entropic GW solver that later GW learning builds on.
- **Quality**: High (13).
- **Stance**: Neutral.
- **Potential use**: Methods review, entropic GW.

### Sidiropoulos, N. D., and Bro, R. (2000). On the uniqueness of multilinear decomposition of N-way arrays. [@Sidiropoulos_2000]
- **Type**: Journal article, Journal of Chemometrics.
- **Read from**: the opening text the indexes give as the abstract (`10.1002_1099-128x(200005_06)14_3<229__aid-cem587>3.0.co;2-n.abstract.txt`), which starts the paper's introduction.
- **Method**: Theory of uniqueness for the PARAFAC (CP) decomposition of N-way arrays.
- **Key results**: Extends Kruskal's uniqueness condition from three-way to N-way arrays. [GAP: Key results beyond the opening of the introduction read]
- **Relevance**: P1 and P2: the identifiability that makes CP factors interpretable, which an unaligned mode can break.
- **Quality**: Medium (10): only the opening read.
- **Stance**: Neutral.
- **Potential use**: Methods review, decomposition theory.

### Flamary, R., Courty, N., Gramfort, A., et al. (2021). POT: Python Optimal Transport. [@Flamary_2021]
- **Type**: Journal article (software paper), Journal of Machine Learning Research 22(78). No DOI and no arXiv ID; entry written from the citation tags of https://jmlr.org/papers/v22/20-451.html.
- **Read from**: http://jmlr.org/papers/volume22/20-451/20-451.pdf (full text, via `the lookup script fetch --page`), abstract.
- **Method**: Python toolbox implementing transport solvers, Sinkhorn, barycenters and Gromov-Wasserstein.
- **Key results**: Collects founding OT methods for machine learning and generic solvers in one library.
- **Relevance**: P2: the software most transport studies in this set use.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methodology, implementation.

### Kriege, N. M., Johansson, F. D., and Morris, C. (2020). A survey on graph kernels. [@Kriege_2020]
- **Type**: Journal article (survey), Applied Network Science.
- **Read from**: https://appliednetsci.springeropen.com/track/pdf/10.1007/s41109-019-0195-3 (full text, via `the lookup script fetch`), abstract.
- **Method**: Survey and experimental comparison of graph kernels.
- **Key results**: Simple baselines become competitive on some datasets after a Gaussian RBF transformation of a kernel metric; a data-driven categorization of kernels and a practitioner's guide.
- **Relevance**: P2: the kernel family that transport-based graph distances compete with.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, graph kernels.

### Barbe, A., Sebban, M., Goncalves, P., Borgnat, P., and Gribonval, R. (2021). Graph diffusion Wasserstein distances. [@Barbe_2021]
- **Type**: Conference paper, ECML PKDD 2020 (LNCS, published 2021).
- **Read from**: https://inria.hal.science/hal-02795056/document (full text, via `the lookup script fetch --page`), abstract.
- **Method**: Diffusion Wasserstein distance using the Laplacian heat kernel to combine structure and node features, with bounds, and its use inside fused GW.
- **Key results**: DW captures structural and feature information and can be plugged into FGW. [GAP: Key results figures not in the abstract read]
- **Relevance**: P2: a cheaper alternative to GW for attributed graphs.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Methods review, graph transport.

### Niepert, M., Ahmed, M., and Kutzkov, K. (2016). Learning convolutional neural networks for graphs. [@arxiv_1605_05273]
- **Type**: Conference paper (ICML 2016, PMLR 48); entry from https://proceedings.mlr.press/v48/niepert16.html via `the lookup script bibtex 1605.05273 --page`.
- **Read from**: https://arxiv.org/html/1605.05273 (full text, via `the lookup script fetch`), abstract.
- **Method**: Locally connected regions extracted from arbitrary graphs by a node ordering, then convolution (PATCHY-SAN).
- **Key results**: Learned features are competitive with graph kernels and efficient to compute.
- **Relevance**: P2: canonical ordering, an alternative to invariance for unaligned nodes.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, canonicalization.

### Lee, J., Lee, I., and Kang, J. (2019). Self-attention graph pooling. [@arxiv_1904_08082]
- **Type**: Conference paper (ICML 2019, PMLR 97); entry from https://proceedings.mlr.press/v97/lee19c.html via `the lookup script bibtex 1904.08082 --page`.
- **Read from**: https://arxiv.org/html/1904.08082 (full text, via `the lookup script fetch`), abstract.
- **Method**: Graph pooling by self-attention scores computed with graph convolution.
- **Key results**: Superior graph classification under matched training procedures with a reasonable parameter count.
- **Relevance**: P2: attention pooling of a variable node set.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, graph pooling.

### Gachon, E., Bigot, J., Cazelles, E., et al. (2025). Low dimensional representation of multi-patient flow cytometry datasets using optimal transport for measurable residual disease detection in leukemia. [@Gachon_2025]
- **Type**: Journal article, Cytometry Part A.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1002_cyto.a.24918.abstract.txt`).
- **Method**: Each patient's cytometry as a probability measure; K-means quantization of the pooled cloud justified by OT; Wasserstein PCA through linearized OT or log-ratio PCA.
- **Key results**: Better than kernel mean embedding for learning from multiple distributions on a public and a hospital dataset; informative 2D views of MRD levels.
- **Relevance**: P1 and P2: patients as unaligned point clouds embedded by linearized transport against a reference.
- **Quality**: Medium (11).
- **Stance**: Supports linearized OT embeddings.
- **Potential use**: Literature review, transport on clinical point clouds.

### Cang, Z., Wu, Y., and Zhao, Y. (2025). Supervised Gromov-Wasserstein optimal transport with metric-preserving constraints. [@Cang_2025]
- **Type**: Journal article, SIAM Journal on Mathematics of Data Science.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1137_24m1630499.abstract.txt`).
- **Method**: GW with infinite entries in the cost tensor to enforce distance preservation, solved by mirror-C descent after a vertex cover transformation.
- **Key results**: Controls distance preservation and estimates the overlapping part of partially overlapping datasets, shown on synthetic data and single-cell RNA alignment.
- **Relevance**: P2: constrained GW couplings.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, GW variants.

### Wang, S., Wang, Z., Zhao, X.-L., and Shen, X. (2025). An unbalanced optimal transport-based approach for robust dictionary learning. [@Wang_2025]
- **Type**: Journal article, IEEE Transactions on Neural Networks and Learning Systems.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_tnnls.2025.3526254.abstract.txt`).
- **Method**: Dictionary learning with an unbalanced OT loss and a hybrid block coordinate descent with convergence without Lipschitz smoothness.
- **Key results**: Robust to outliers on synthetic data, MNIST, Olivetti faces and hyperspectral images.
- **Relevance**: P2: unbalanced transport dictionaries.
- **Quality**: Medium (11).
- **Stance**: Supports unbalanced transport.
- **Potential use**: Methods review, transport dictionaries.

### Shifat-E-Rabbi, M., Ironside, N., Pathan, N. S., et al. (2025). Quantifying nuclear structures of digital pathology images across cancers using transport-based morphometry. [@Shifat_E_Rabbi_2025a]
- **Type**: Journal article, Cytometry Part A.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1002_cyto.a.24917.abstract.txt`).
- **Method**: Transport-based morphometry: each nucleus represented by its transport map from a template nucleus.
- **Key results**: Robust to staining and imaging protocol, and distinguishes benign from malignant nuclear features across liver, thyroid, mesothelium and skin tumours.
- **Relevance**: P2 and P3: a template plus transport maps in place of registration of shapes.
- **Quality**: Medium (10).
- **Stance**: Supports transport-based morphometry.
- **Potential use**: Literature review, transport to templates.

### Tu, Y., Mi, L., Zhang, W., et al. (2020). Computing univariate neurodegenerative biomarkers with volumetric optimal transportation: a pilot study. [@Tu_2020]
- **Type**: Journal article, Neuroinformatics.
- **Read from**: the PubMed abstract (PMID 32253701, saved as `pubmed-C69.txt` from NCBI E-utilities).
- **Method**: Variational OT of structural MRI volumes to a template by Newton's method; the Wasserstein distance as an index.
- **Key results**: On 314 ADNI subjects the index correlated with MMSE and classified better than hippocampal volume and entorhinal thickness.
- **Relevance**: P2 and P3: transport to a template as a biomarker.
- **Quality**: Medium (10): pilot study.
- **Stance**: Supports transport indices.
- **Potential use**: Literature review, transport in neuroimaging.

### Shi, C., Xian, M., Zhou, X., Wang, H., and Cheng, H.-D. (2021). Multi-slice low-rank tensor decomposition based multi-atlas segmentation: application to automatic pathological liver CT segmentation. [@Shi_2021]
- **Type**: Journal article, Medical Image Analysis.
- **Read from**: https://arxiv.org/pdf/2102.12056 (full text, via `the lookup script fetch`), abstract.
- **Method**: Multi-slice low-rank tensor decomposition to recover tumour-free liver atlases, then multi-atlas segmentation.
- **Key results**: Accurate and robust segmentation of pathological livers where existing methods degrade. [GAP: Key results figures not in the abstract part read]
- **Relevance**: P3: a tensor decomposition built into the atlas and registration step.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Literature review, tensors in atlas pipelines.

### Zhu, Z., Chen, M., Hu, G., et al. (2022). A pre-treatment CT-based weighted radiomic approach combined with clinical characteristics to predict durable clinical benefits of immunotherapy in advanced lung cancer. [@Zhu_2022]
- **Type**: Journal article, European Radiology.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1007_s00330-022-09337-7.abstract.txt`).
- **Method**: Radiomics of multiple intrapulmonary lesions weighted by attention-based multiple instance learning, ridge selection, five classifiers; 185 training and 48 test patients.
- **Key results**: Weighted radiomics gave AUCs 0.75 to 0.82 against 0.70 to 0.78 for the largest lesion and 0.64 to 0.80 for averaging; test AUC 0.80, 0.86 with clinical features.
- **Relevance**: P1 and P2: learned attention weights over a lesion set compared with largest-lesion and mean aggregation.
- **Quality**: Medium (11).
- **Stance**: Supports learned lesion weighting.
- **Potential use**: Literature review, multi-lesion aggregation.

### Yan, Y., Yan, A., Li, W., Bu, J., and Ning, J. (2026). GWDRO-Lung: Gromov-Wasserstein distributionally robust learning for calibrated pulmonary nodule malignancy prediction across imaging cohorts. [@Yan_2026]
- **Type**: Journal article, npj Digital Medicine (article in press).
- **Read from**: the full text `the lookup script fetch` wrote (`10.1038_s41746-026-03323-9.txt`), abstract.
- **Method**: Each cohort summarized as a relation matrix over learned prototypes, aligned to a shared Gromov-Wasserstein barycenter, with a distributionally robust calibration-aware risk head; 1842 LIDC-IDRI nodules, external LNDb validation.
- **Key results**: External AUC 0.857 to 0.878 and expected calibration error 0.106 to 0.066 against the strongest baseline; prospective validation still required.
- **Relevance**: P2: a GW barycenter as a learned template across cohorts.
- **Quality**: Medium (11).
- **Stance**: Supports GW barycenters as templates.
- **Potential use**: Literature review, transport templates in medical imaging.

### Kerdoncuff, T., Emonet, R., Perrot, M., and Sebban, M. (2022). Optimal tensor transport. [@Kerdoncuff_2022]
- **Type**: Conference paper, AAAI 2022.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1609_aaai.v36i7.20672.abstract.txt`).
- **Method**: A transport formulation over tensors of any order with possibly several plans, covering OT, GW and co-OT.
- **Key results**: Theory of the new distance, an efficient computation, and use in domain adaptation and comparison-based clustering.
- **Relevance**: P2: joins transport and tensors, the two method families of this review.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, transport for tensors.

### Wang, G. (2024). LPOT: locality-preserving Gromov-Wasserstein discrepancy for nonrigid point set registration. [@Wang_2024a]
- **Type**: Journal article, IEEE Transactions on Neural Networks and Learning Systems (online 2022, issue 2024).
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_tnnls.2022.3231652.abstract.txt`).
- **Method**: Point registration as joint estimation of local GW couplings and global transformations, alternating optimization.
- **Key results**: Better than state-of-the-art registration under large degradations, fully unsupervised.
- **Relevance**: P2 and P3: GW used to register point sets, the reverse of using GW to avoid registration.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, transport registration.

### Chen, Y., Zekelman, L. R., Zhang, C., et al. (2024). TractGeoNet: a geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance. [@Chen_2024]
- **Type**: Journal article, Medical Image Analysis.
- **Read from**: the PubMed abstract (PMID 38458095, saved as `pubmed-C77.txt` from NCBI E-utilities).
- **Method**: Fiber tracts as point clouds with microstructure features; a paired-Siamese regression loss and critical region localization; 806 HCP subjects.
- **Key results**: Better prediction of language scores than popular regression models; the left arcuate fasciculus was most predictive.
- **Relevance**: P1 and P3: point-cloud regression that skips along-tract binning to a common parameterization.
- **Quality**: High (12).
- **Stance**: Supports point-cloud subject models.
- **Potential use**: Literature review, medical point clouds.

### Wilk, A. M., Swierniak, A., d'Amico, A., et al. (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: finding a strategy of aggregating lesions. [@Wilk_2025]
- **Type**: Journal article, Computer Methods and Programs in Biomedicine.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.cmpb.2025.108840.abstract.txt`).
- **Method**: Feature-level and model-level aggregation of lesion radiomics for distant metastasis risk in 115 NSCLC patients, Monte Carlo cross-validation.
- **Key results**: Using all lesions raised the C-index over primary-tumour-only models (0.611 to 0.632 for PET, 0.614 to 0.634 for PET-CT).
- **Relevance**: P1 and P3: aggregation strategies for a lesion set.
- **Quality**: Medium (10): small gains, one cohort.
- **Stance**: Supports using all lesions.
- **Potential use**: Literature review, multi-lesion radiomics.

### Phan, L., Sitruk, L. A., Masson-Grehaigne, C., et al. (2026). Estimating metastatic disease heterogeneity using radiomics-based lesion clustering and heterogeneity index: application in lung adenocarcinoma patients and correlations with patient outcomes. [@Phan_2026]
- **Type**: Journal article, Journal of Imaging Informatics in Medicine.
- **Read from**: the PubMed abstract (PMID 42443650, saved as `pubmed-C79.txt` from NCBI E-utilities).
- **Method**: 1583 lesions of 335 patients clustered by radiomics; the Hill number of lesion clusters per patient as a heterogeneity index; temporal validation.
- **Key results**: Higher Hill number associated with lower response (adjusted OR 0.68) and shorter survival (HR 1.23); adding it raised validation AUC from 0.72 to 0.74.
- **Relevance**: P1 and P2: a permutation-invariant summary of a lesion set built from a shared cluster vocabulary.
- **Quality**: Medium (11).
- **Stance**: Supports lesion-set heterogeneity measures.
- **Potential use**: Literature review, multi-lesion models.

### Chang, X., Jia, X., Ren, B., and Zeng, W. (2026). ViTAE-HGOT: vision transformer-based autoencoder with hypergraph optimal transport for cross-atlas functional connectome remapping. [@Chang_2026]
- **Type**: Journal article, Medical Image Analysis.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.media.2026.104135.abstract.txt`).
- **Method**: Latent region features from a ViT autoencoder, a group-level hypergraph OT plan between atlases guided by Yeo-7 networks, and individual remapping.
- **Key results**: CC 0.5471 and MAE 0.1153 on 583 CamCAN subjects (at least 13.3 percent and 21.2 percent better), CC 0.5186 on ICBM; remapped connectomes support brain age prediction.
- **Relevance**: P2 and P3: transport between region sets of different atlases in place of re-parcellation.
- **Quality**: Medium (11).
- **Stance**: Supports transport between atlases.
- **Potential use**: Literature review, transport across atlases.

### Takeda, K., Sasaki, M., Abe, K., and Oizumi, M. (2025). Unsupervised alignment in neuroscience: introducing a toolbox for Gromov-Wasserstein optimal transport. [@Takeda_2025]
- **Type**: Journal article, Journal of Neuroscience Methods.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.jneumeth.2025.110443.abstract.txt`).
- **Method**: GW alignment of representations without stimulus correspondence; the GWTune toolbox.
- **Key results**: GWOT reveals one-to-one, group-to-group and shifted correspondences that supervised alignment misses, across behavioural, neural and model data.
- **Relevance**: P2: unsupervised GW correspondence in neuroscience.
- **Quality**: Medium (10).
- **Stance**: Supports GW alignment.
- **Potential use**: Methods review, GW tools.

### Han, K., Hu, D., Cheng, J., et al. (2025). Dual multi-atlas representation alignment for brain disorder diagnosis using morphological connectome. [@Han_2025]
- **Type**: Conference paper, ISBI 2025.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_isbi60581.2025.10981287.abstract.txt`).
- **Method**: MMD alignment of multi-atlas representations and OT harmonization of region-wise differences.
- **Key results**: Effective diagnosis on ADNI, PPMI, ADHD200 and SchizConnect. [GAP: Key results figures not in the abstract]
- **Relevance**: P2 and P3: transport across atlases with different regions.
- **Quality**: Low (7): short conference paper, abstract only.
- **Stance**: Supports transport across atlases.
- **Potential use**: Literature review, multi-atlas transport.

### Zhang, T., Liang, Z., and Wang, B. (2025). A survey of medical point cloud shape learning: registration, reconstruction and variation. [@Zhang_2025]
- **Type**: Conference paper (survey), IEEE BIBM 2025.
- **Read from**: https://arxiv.org/pdf/2508.03057 (full text, via `the lookup script fetch`), abstract.
- **Method**: Survey of learning-based shape analysis on medical point clouds.
- **Key results**: Summarizes methods, datasets and metrics for registration, reconstruction and variation modelling; trends toward hybrid representations, self-supervised and generative models.
- **Relevance**: P1 and P3: survey of the medical point-cloud setting.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Introduction, medical point clouds.

### Wang, S.-H., and Huang, H.-H. (2026). A Bayesian sparse Kronecker product decomposition framework for tensor predictors with mixed-type responses. [@Wang_2026]
- **Type**: Journal article, Statistical Analysis and Data Mining.
- **Read from**: https://arxiv.org/pdf/2505.13821 (full text, via `the lookup script fetch`), abstract.
- **Method**: Coefficient tensors as sparse low-rank Kronecker products with shrinkage priors, Polya-Gamma augmentation and Gibbs sampling for Gaussian, Poisson and binary responses.
- **Key results**: Posterior consistency and identifiability with growing mode dimensions; scales to full-resolution 3D images.
- **Relevance**: P1: scalar-on-image tensor regression that assumes registered voxels.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression.

### Barbarant, P.-L., Meyniel, F., and Thirion, B. (2026). Fast whole-brain, geometry-aware functional alignment for cross-subject decoding. [@Barbarant_2026]
- **Type**: Conference paper, Cognitive Computational Neuroscience 2026 (arXiv 2607.10931).
- **Read from**: https://arxiv.org/html/2607.10931 (full text, via `the lookup script fetch`), abstract.
- **Method**: SpectralOT: functional alignment regularized by Laplace-Beltrami eigenmodes of cortical geometry.
- **Key results**: Balances functional alignment and anatomical structure at whole-brain scale for cross-subject decoding. [GAP: Key results figures not in the abstract]
- **Relevance**: P2 and P3: transport alignment that keeps anatomy, between registration and pure functional matching.
- **Quality**: Medium (9).
- **Stance**: Supports geometry-aware transport alignment.
- **Potential use**: Literature review, functional alignment.

### Kwon, T., Ko, J., Jung, J., Jang, J.-G., and Shin, K. (2024). Compact decomposition of irregular tensors for data compression: from sparse to dense to high-order tensors. [@Kwon_2024]
- **Type**: Conference paper, KDD 2024.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1145_3637528.3671846.abstract.txt`).
- **Method**: Light-IT unifies the first-mode factor matrices of PARAFAC2; Light-IT++ adds a Tucker core; extended to higher order and sparse data.
- **Key results**: Up to 37 times smaller output and up to 5 times more accurate than baselines on six datasets.
- **Relevance**: P2: irregular-mode decomposition, here unsupervised.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Methods review, irregular tensors.

### Morup, M., Acar, E., and Adali, T. (2025). Tensor and coupled decompositions: interpretable pattern discovery in multiset and multimodal functional neuroimaging data. [@Morup_2025]
- **Type**: Journal article (survey), IEEE Signal Processing Magazine.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_MSP.2025.3605746.abstract.txt`).
- **Method**: Survey of hard to soft coupling in multiset and multimodal decompositions of neuroimaging data.
- **Key results**: Stresses uniqueness as a prerequisite for reproducible pattern discovery across variable subjects and modalities.
- **Relevance**: P1 and P2: the decomposition view of between-subject variability.
- **Quality**: High (12).
- **Stance**: Neutral.
- **Potential use**: Methods review, coupled decompositions.

### Minoccheri, C., Tesic, S., Najarian, K., and Stidham, R. (2025). Supervised coupled matrix-tensor factorization (SCMTF) for computational phenotyping of patient reported outcomes in ulcerative colitis. [@arxiv_2506_20065]
- **Type**: Preprint (arXiv 2506.20065); published version looked for with `the lookup script resolve` and `the lookup script bibtex`; none found.
- **Read from**: https://arxiv.org/html/2506.20065 (full text, via `the lookup script fetch`), abstract.
- **Method**: Supervised coupled matrix-tensor factorization of temporal PROs, labs and static features in a deep learning framework to predict medication persistence.
- **Key results**: Handles heavily missing PRO data and predicts medication changes 8 and 20 months ahead; phenotypes include symptom variables.
- **Relevance**: P1: supervised coupled factorization.
- **Quality**: Medium (8): preprint, one cohort.
- **Stance**: Supports supervised coupled factorization.
- **Potential use**: Methods review, supervised decompositions.

### Ferritto, C., Lioi, G., Jonin, P.-Y., and Coloigner, J. (2026). Mind the brain age: how segmentation and template selection reshape structural connectomes. [@Ferritto_2026]
- **Type**: Journal article, Imaging Neuroscience.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1162_IMAG.a.1384.abstract.txt`).
- **Method**: Conventional connectome pipeline in healthy elderly with normalization template and segmentation varied.
- **Key results**: Template and segmentation choices changed network topology and its relation to clinical variables; age-appropriate templates and lesion-aware segmentation gave more plausible networks.
- **Relevance**: P3: direct evidence of what the template choice costs downstream.
- **Quality**: Medium (11).
- **Stance**: Cautions on template-dependent pipelines.
- **Potential use**: Literature review, cost of registration to a template.

### Kwon, H., Son, S., Morton, S. U., et al. (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease. [@Kwon_2025]
- **Type**: Journal article, Medical Image Analysis.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.media.2025.103538.abstract.txt`).
- **Method**: Prototype-based GNN on sulcal pit graphs with prototype inverse-projection, replacing spectral graph matching to a reference set.
- **Key results**: Better classification of congenital heart disease (345 patients) against 174 controls than state-of-the-art models.
- **Relevance**: P2: learned prototypes in place of graph matching to a reference set.
- **Quality**: Medium (11).
- **Stance**: Supports learned prototypes.
- **Potential use**: Literature review, learned templates.

### Olaoluwa, M., Loukil, H., Sbei, A., and Drira, H. (2026). GeoHSAF: geometric hippocampus shape analysis framework for longitudinal Alzheimer's disease classification. [@Olaoluwa_2026]
- **Type**: Conference paper, WACV 2026.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1109_wacv61042.2026.00214.abstract.txt`).
- **Method**: Geometric learning on longitudinal hippocampal shapes with an interpolation module for missing time points.
- **Key results**: State-of-the-art on AD against controls on ADNI, OASIS and AIBL, and strong three-class performance.
- **Relevance**: P1: shape-based subject prediction with missing longitudinal observations.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Literature review, shape models.

### Abramova, H., Gabrys, H. S., Huellner, M., et al. (2026). Patient survival prediction based on PET/CT radiomics extracted from metastatic melanoma bone lesions. [@Abramova_2026]
- **Type**: Journal article, Physica Medica.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1016_j.ejmp.2026.105873.abstract.txt`).
- **Method**: Bone lesion radiomics in 36 patients pooled by mean, volume-weighted mean and largest lesion; nested cross-validation.
- **Key results**: 3-year OS AUC 0.76 (95 percent CI 0.57 to 0.95) combining aggregation methods; 5-year AUC 0.84 with the largest lesion.
- **Relevance**: P1 and P3: fixed aggregation rules for a lesion set.
- **Quality**: Low (7): 36 patients, wide intervals.
- **Stance**: Neutral.
- **Potential use**: Literature review, multi-lesion radiomics.

### Chen, X., Sun, Z., Huang, C., and Liu, R. (2026). DPA: deep parcellation analysis for human trait prediction. [@Chen_2026]
- **Type**: Journal article, Neuroinformatics.
- **Read from**: https://link.springer.com/content/pdf/10.1007/s12021-026-09823-z.pdf (full text, via `the lookup script fetch`), abstract.
- **Method**: Multiscale geometric features along whole streamlines encoded by a fiber autoencoder, clustered into an atlas-free parcellation linked to traits; HCP-YA.
- **Key results**: Better trait association than atlas-based and principal parcellations and connections that endpoint-based methods miss.
- **Relevance**: P3: removes the anatomical atlas from connectome-trait analysis.
- **Quality**: Medium (11).
- **Stance**: Supports atlas-free analysis.
- **Potential use**: Literature review, atlas-free methods.

### He, J., and Li, J. (2026). An ensemble approach to tensor learning. [@He_2026]
- **Type**: Journal article, Statistical Methods in Medical Research.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1177_09622802261424654.abstract.txt`).
- **Method**: Tensor partitions into blocks, candidate CP models and a weighted ensemble under the predictability, computability and stability framework.
- **Key results**: Better than existing methods in simulations and in glaucoma fundus and Alzheimer neuroimaging applications.
- **Relevance**: P1: tensor regression with rank uncertainty, on aligned images.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression.

### Barbarant, P.-L., Meyniel, F., and Thirion, B. (2026). Functional templates in fMRI: building accurate and interpretable group-level decoders. [@Barbarant_2026a]
- **Type**: Preprint (bioRxiv, DOI 10.64898/2026.05.21.726781).
- **Read from**: the abstract `the lookup script fetch` wrote (`10.64898_2026.05.21.726781.abstract.txt`).
- **Method**: Comparison of functional alignment methods (OT, Procrustes, ridge, SRM) and template strategies within task decoding.
- **Key results**: Templates built with OT gave the highest decoding accuracy, were not biased by individual subjects and kept cortical topography.
- **Relevance**: P2 and P3: transport templates as the common space for decoding.
- **Quality**: Medium (9): preprint.
- **Stance**: Supports transport templates.
- **Potential use**: Literature review, functional templates.

### Sokooti, H., de Vos, B., Berendsen, F., et al. (2017). Nonrigid image registration using multi-scale 3D convolutional neural networks. [@Sokooti_2017]
- **Type**: Conference paper, MICCAI 2017 (LNCS 10433).
- **Read from**: the abstract on the repository page https://pure.amsterdamumc.nl/en/publications/0d81ecdb-b0dd-4221-96b2-e86250be5c25 (saved with `curl` as `C47.read-1.html`, HTTP 200); `the lookup script fetch` found no text.
- **Method**: RegNet, a CNN that estimates the displacement field from an image pair at several scales, trained on artificially generated deformations, applied to 3D chest CT follow-up.
- **Key results**: Single-shot registration with accuracy on par with conventional B-spline registration for anatomy within the capture range.
- **Relevance**: P3: early learned deformable registration, the step correspondence-free methods remove.
- **Quality**: Medium (11).
- **Stance**: Neutral.
- **Potential use**: Background, registration step.

### Rubner, Y., Tomasi, C., and Guibas, L. J. (2000). The earth mover's distance as a metric for image retrieval. [@Rubner_2000]
- **Type**: Journal article, International Journal of Computer Vision 40(2).
- **Read from**: the author copy at https://math.ucdavis.edu/~saito/data/emd/rubner-tomasi-guibas-emd.pdf (found by web search, saved with `curl` as `C51.read-2.pdf`, HTTP 200, text by `the lookup script text`), abstract.
- **Method**: The earth mover's distance between distributions represented by vector-quantized signatures, solved as a transportation problem.
- **Key results**: The EMD often matches perceptual similarity better than earlier distances, allows partial matching, works on variable-length signatures without binning, and is a true metric for distributions of equal mass.
- **Relevance**: P2: the transport distance between variable-size sets that later set and graph methods build on; cited by 3 or more core papers of the theme runs.
- **Quality**: High (14): seminal.
- **Stance**: Neutral.
- **Potential use**: Introduction and methods review, transport distances.

### Villani, C. (2009). Optimal transport: old and new. [@Villani_2009]
- **Type**: Book, Grundlehren der mathematischen Wissenschaften 338, Springer.
- **Read from**: abstract not read. Lookups tried: `the lookup script fetch 10.1007/978-3-540-71050-9` (no open-access URL in OpenAlex or Semantic Scholar, no text and no abstract); `the lookup script resolve` on the DOI (Crossref, OpenAlex and Semantic Scholar records found); a web search for an author copy found only library catalogue and bookseller records. Included because it is cited by 3 or more core papers of the theme runs (must include).
- **Method**: [GAP: Method]
- **Key results**: [GAP: Key results]
- **Relevance**: P2: the reference monograph on optimal transport theory that the transport papers of this set cite.
- **Quality**: High (12): seminal monograph, assessed on its record and citations.
- **Stance**: Neutral.
- **Potential use**: Background, transport theory (cited for definitions only).

### Guo, D., He, Y., Lin, L., and Liu, L. (2025). Integrative tensor regression for stratified data with application to neuroimaging analysis. [@Guo_2025]
- **Type**: Journal article, Statistical Papers 66(5).
- **Read from**: the abstract on the RePEc page https://ideas.repec.org/a/spr/stpapr/v66y2025i5d10.1007_s00362-025-01740-8.html (saved with `curl` as `C84.read-2.html`, HTTP 200); `the lookup script fetch` found no text and the Springer page answered a bot check.
- **Method**: Tensor regression over several stratified neuroimaging datasets with a Tucker decomposition of the coefficients whose cores and factors split shared and stratum-specific structure; a quantile regression extension; alternating updates.
- **Key results**: An alternating update estimator with asymptotic properties under mild conditions; effective on synthetic data and on stratified ADHD neuroimaging datasets (the abstract gives no figures).
- **Relevance**: P1: scalar-on-tensor regression across cohorts, on registered images.
- **Quality**: Medium (10).
- **Stance**: Neutral.
- **Potential use**: Methods review, tensor regression.

### Karunanayake, N., Yang, H., Geng, P., et al. (2026). Automated model-based lesion tracking in CT: colorectal liver metastases as a use case for development and performance analysis. [@Karunanayake_2026]
- **Type**: Journal article, European Radiology Experimental.
- **Read from**: https://link.springer.com/content/pdf/10.1186/s41747-026-00750-x.pdf (full text, via `the lookup script fetch`), abstract.
- **Method**: Machine-learning model-based lesion tracking with per-lesion confidence on baseline and follow-up CT of 87 patients, compared with deformable registration plus overlap and with registration plus the tracker; external melanoma test set.
- **Key results**: Affine registration plus the tracker matched 458 of 464 lesions (F1 0.989) against 0.797 for deformable registration plus overlap; external F1 0.994.
- **Relevance**: P2 and P3: lesion correspondence across time, where a learned matcher after only affine alignment beats deformable registration.
- **Quality**: Medium (11).
- **Stance**: Supports learned matching over dense registration for lesion sets.
- **Potential use**: Literature review, lesion correspondence.

### Tang, C., De Vocht, J., Van Damme, P., et al. (2026). Metabolic connectivity alterations in amyotrophic lateral sclerosis: individual network analysis based on Wasserstein distances. [@Tang_2026a]
- **Type**: Journal article, Imaging Neuroscience.
- **Read from**: the abstract `the lookup script fetch` wrote (`10.1162_IMAG.a.1343.abstract.txt`).
- **Method**: Single-subject FDG-PET connectivity matrices over 77 atlas regions built with the Wasserstein distance between regional uptake distributions, compared with KL-divergence similarity; SVM classification of 167 ALS patients, 36 controls and 25 mimics.
- **Key results**: WD and KL nodal measures correlated strongly; WD found differences in more regions and gave the best ALS against mimic accuracy (0.65), while voxel-wise data stayed better for ALS against controls.
- **Relevance**: P1 and P2: transport between within-region value distributions, which needs no voxel correspondence inside a region.
- **Quality**: Medium (11).
- **Stance**: Supports transport-based single-subject networks.
- **Potential use**: Literature review, transport in neuroimaging.


## 5. Literature matrix

Theme columns: A, tensor decompositions with an irregular or coupled mode (34 sources); B, tensor regression and supervised decompositions (35); C, entropic optimal transport, computation and theory (11); D, Gromov-Wasserstein and fused Gromov-Wasserstein (28); E, barycenters, dictionaries and learned templates (30); F, transport embeddings and transport learning on graphs and sets (27); G, set and point-cloud encoders and pooling, graph networks (40); H, medical point clouds, sets and multi-lesion models (39); I, registration to a common space (46); J, radiomics and lesion segmentation (45); K, transport and functional alignment in medical imaging and neuroscience (28). A count is the number of rows with `main` or `x` in the column.

Parts of the research question: P1 (prediction methods) is answered by A, B, F, G and H; P2 (handling of correspondence) by A, D, E, F, G and K; P3 (registration, radiomics and segmentation steps) by H, I, J and K. Each part holds more than 3 sources.

Method: Comp, computational or simulation; Theory, theoretical; Review; Clin, clinical study; Bench, benchmark or challenge; Soft, software or tool; Book. Theme: the theme run or runs that kept the source, or "merge run".

| Source | A | B | C | D | E | F | G | H | I | J | K | Method | Quality | Theme |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Kolda (2009) [@Kolda_2009] | main | x |  |  |  |  |  |  |  |  |  | Review | High | 1 |
| Carroll (1970) [@Carroll_1970] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Harshman (1970) [@Harshman_1970] | main |  |  |  |  |  |  |  |  |  |  | Theory | High | 1 |
| Kruskal (1977) [@Kruskal_1977] | main |  |  |  |  |  |  |  |  |  |  | Theory | High | 1 |
| De Lathauwer (2000) [@De_Lathauwer_2000] | main |  |  |  |  |  |  |  |  |  |  | Theory | High | 1 |
| De Lathauwer (2008) [@De_Lathauwer_2008] | main |  |  |  |  |  |  |  |  |  |  | Theory | High | 1 |
| Bro (1996) [@Bro_1996] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Zhao (2013) [@Qibin_Zhao_2013] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Zhang (2017) [@Zhang_2017] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Park (2025) [@Park_2025] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Faes (2024) [@Faes_2024] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Sun (2024) [@Sun_2024] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Zhou (2013) [@Zhou_2013] |  | main |  |  |  |  |  |  | x |  |  | Comp | High | 1 |
| Li (2018) [@Li_2018] |  | main |  |  |  |  |  |  | x |  |  | Comp | High | 1 |
| Hoff (2015) [@Hoff_2015] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Lock (2018) [@Lock_2018] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Guhaniyogi (2017) [@arxiv_1509_06490] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Papadogeorgou (2021) [@arxiv_1910_09699] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Kossaifi (2020) [@arxiv_1707_08308] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Llosa-Vite (2023) [@Llosa_Vite_2023] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Miranda (2018) [@Miranda_2018] |  | main |  |  |  |  |  |  | x |  |  | Comp | High | 1 |
| Xu (2024) [@Xu_2024] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Spencer (2024) [@Spencer_2024] |  | main |  |  |  |  |  |  | x |  |  | Comp | High | 1 |
| Pietrosanu (2026) [@Pietrosanu_2026] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Kiers (1999) [@Kiers_1999] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Bro (1999) [@Bro_1999] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Perros (2017) [@Perros_2017] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Afshar (2018) [@Afshar_2018] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Roald (2022) [@Roald_2022] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Konyar (2025) [@Konyar_2025] | main | x |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Schenker (2025) [@Schenker_2025] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Chatzis (2025) [@Chatzis_2025] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Hu (2026) [@Hu_2026] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Ramirez (2025) [@Ramirez_2025] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Jorgensen (2024) [@J_rgensen_2024] | main |  |  |  |  |  |  |  |  |  |  | Comp | High | 1 |
| Cuturi (2013) [@arxiv_1306_0895] |  |  | main |  |  |  |  |  |  |  |  | Comp | High | 2 |
| Peyre (2019) [@Peyr__2019] |  |  | main | x | x |  |  |  |  |  |  | Review | High | 2 |
| Benamou (2015) [@Benamou_2015] |  |  | main |  | x |  |  |  |  |  |  | Comp | High | 2 |
| Altschuler (2017) [@arxiv_1705_09634] |  |  | main |  |  |  |  |  |  |  |  | Theory | Medium | 2 |
| Frogner (2015) [@arxiv_1506_05439] |  |  | x |  |  | main |  |  |  |  |  | Comp | High | 2 |
| Agueh (2011) [@Agueh_2011] |  |  |  |  | main |  |  |  |  |  |  | Theory | High | 2 |
| Cuturi (2014) [@arxiv_1310_4375] |  |  | x |  | main |  |  |  |  |  |  | Comp | High | 2 |
| Bazeille (2019) [@Bazeille_2019] |  |  |  |  | x |  |  |  |  |  | main | Comp | High | 2 |
| Memoli (2011) [@M_moli_2011] |  |  |  | main |  |  |  |  |  |  |  | Theory | High | 2 |
| Peyre (2016) [@Peyre_2016] |  |  |  | main | x |  |  |  |  |  |  | Comp | High | 2 |
| Chowdhury (2019) [@Chowdhury_2019] |  |  |  | main |  |  |  |  |  |  |  | Theory | Medium | 2 |
| Vayer (2019) [@arxiv_1805_09114] |  |  |  | main |  | x |  |  |  |  |  | Comp | High | 2 |
| Vayer (2020) [@Vayer_2020] |  |  |  | main |  |  |  |  |  |  |  | Theory | Medium | 2 |
| Xu (2019) [@arxiv_1901_06003] |  |  |  | main |  |  |  |  |  |  |  | Comp | High | 2 |
| Xu (2019) [@arxiv_1905_07645] |  |  |  | main |  |  |  |  |  |  |  | Comp | Medium | 2 |
| Sejourne (2021) [@arxiv_2009_04266] |  |  |  | main |  |  |  |  |  |  |  | Theory | Medium | 2 |
| Thual (2022) [@Thual_2022] |  |  |  | x |  |  |  |  |  |  | main | Comp | High | 2, 4 |
| Vincent-Cuaz (2022) [@arxiv_2110_02753] |  |  |  | main | x |  |  |  |  |  |  | Comp | High | 2 |
| Schmitz (2018) [@Schmitz_2018] |  |  |  |  | main |  |  |  |  |  |  | Comp | High | 2 |
| Xu (2020) [@Xu_2020] |  |  |  | x | main |  |  |  |  |  |  | Comp | High | 2 |
| Xu (2023) [@Xu_2023] |  |  |  | x | main |  |  |  |  |  |  | Comp | High | 2 |
| Vincent-Cuaz (2021) [@arxiv_2102_06555] |  |  |  | x | main |  |  |  |  |  |  | Comp | High | 2 |
| Vincent-Cuaz (2022) [@Vincent_Cuaz_2022] |  |  |  |  | main | x | x |  |  |  |  | Comp | High | 2 |
| Zhang (2024) [@Zhang_2024] |  |  |  |  | main | x |  |  |  |  |  | Comp | High | 2 |
| Mazelet (2026) [@arxiv_2605_20883] |  |  |  |  | x |  |  |  |  |  | main | Comp | Medium | 2 |
| Brogat-Motte (2022) [@arxiv_2202_03813] |  |  |  |  | main | x |  |  |  |  |  | Comp | High | 2 |
| Krzakala (2024) [@Krzakala_2024] |  |  |  | x |  | main |  |  |  |  |  | Comp | High | 2 |
| Togninalli (2019) [@arxiv_1906_01277] |  |  |  | x |  | main |  |  |  |  |  | Comp | High | 2 |
| Kolouri (2021) [@arxiv_2006_09430] |  |  |  |  |  | main | x |  |  |  |  | Comp | High | 2 |
| Wang (2012) [@Wang_2012] |  |  |  |  |  | main |  |  |  |  | x | Comp | High | 2 |
| Moosmuller (2022) [@Moosm_ller_2022] |  |  |  |  |  | main |  |  |  |  |  | Theory | High | 2 |
| Shifat-E-Rabbi (2025) [@Shifat_E_Rabbi_2025] |  |  |  |  |  | main | x |  |  |  |  | Comp | High | 2 |
| Xu (2023) [@Xu_2023a] |  |  |  |  |  | x | main |  |  |  |  | Comp | High | 2 |
| Qian (2024) [@Qian_2024] |  |  |  |  | x | main |  |  |  |  |  | Comp | High | 2 |
| Carpintero Perez (2025) [@arxiv_2410_15721] |  |  |  | x |  | main |  |  |  |  |  | Comp | High | 2 |
| Kusner (2015) [@Kusner_2015] |  |  |  |  |  | main |  |  |  |  |  | Comp | High | 2 |
| Amir (2025) [@arxiv_2405_16519] |  |  |  |  |  | main | x |  |  |  |  | Comp | High | 2 |
| Zaheer (2017) [@arxiv_1703_06114] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Qi (2017) [@Charles_2017] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Qi (2017) [@arxiv_1706_02413] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Lee (2019) [@arxiv_1810_00825] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Ilse (2018) [@arxiv_1802_04712] |  |  |  |  |  |  | main | x |  |  |  | Comp | High | 3 |
| Murphy (2019) [@arxiv_1811_01900] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Wagstaff (2019) [@arxiv_1901_09006] |  |  |  |  |  |  | main |  |  |  |  | Theory | Medium | 3 |
| Mialon (2021) [@arxiv_2006_12065] |  |  |  |  |  | main | x |  |  |  |  | Comp | High | 2, 3 |
| Naderializadeh (2021) [@Naderializadeh_2021] |  |  |  |  |  | main | x |  |  |  |  | Comp | High | 2, 3 |
| Kothapalli (2024) [@arxiv_2306_05553] |  |  |  |  |  | x | main |  |  |  |  | Comp | Medium | 3 |
| Zhang (2022) [@arxiv_2206_11925] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | 3 |
| Gutierrez-Becker (2018) [@Guti_rrez_Becker_2018] |  |  |  |  |  |  | x | main |  |  |  | Comp | High | 3 |
| Gutierrez-Becker (2021) [@Guti_rrez_Becker_2021] |  |  |  |  |  |  | x | main |  |  |  | Comp | High | 3 |
| Sarasua (2022) [@Sarasua_2022] |  |  |  |  |  |  |  | main | x |  |  | Comp | High | 3 |
| Chang (2020) [@Chang_2020] |  |  |  |  |  |  | x | main |  |  |  | Comp | High | 3 |
| Beetz (2023) [@Beetz_2023] |  |  |  |  |  |  | x | main |  |  |  | Comp | Medium | 3 |
| Choi (2025) [@Choi_2025] |  |  |  |  |  |  | x | main |  |  |  | Comp | High | 3 |
| Karimzadeh (2026) [@Karimzadeh_2026] |  |  |  |  |  |  |  | main |  | x |  | Comp | High | 3 |
| Chen (2022) [@Chen_2022] |  |  |  |  |  |  |  | main |  | x |  | Comp | High | 3 |
| Chen (2021) [@Chen_2021] |  |  |  |  |  |  |  | main |  | x |  | Comp | High | 3 |
| Chang (2021) [@Chang_2021] |  |  |  |  |  |  |  | main |  | x |  | Clin | High | 3 |
| Thiery (2025) [@Thiery_2025] |  |  |  |  |  |  |  | main |  | x |  | Comp | High | 3 |
| Zare (2025) [@Zare_2025] |  |  |  |  |  |  | x | main |  |  |  | Comp | Medium | 3 |
| Song (2024) [@Song_2024] |  |  |  |  | x |  |  | main |  |  |  | Comp | High | 3 |
| Avants (2008) [@AVANTS_2008] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | 4 |
| Aerts (2014) [@Aerts_2014] |  |  |  |  |  |  |  |  |  | main |  | Clin | High | 4 |
| Haralick (1973) [@Haralick_1973] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | 4 |
| Galloway (1975) [@Galloway_1975] |  |  |  |  |  |  |  |  |  | main |  | Comp | Medium | 4 |
| Ashburner (2007) [@Ashburner_2007] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | 4 |
| Liero (2018) [@Liero_2017] |  |  | main |  |  |  |  |  |  |  | x | Theory | High | 4 |
| Balakrishnan (2019) [@Balakrishnan_2019] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | 4 |
| de Vos (2019) [@de_Vos_2019] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | 4 |
| Dalca (2019) [@arxiv_1908_02738] |  |  |  |  | x |  |  |  | main |  |  | Comp | High | 4 |
| Isensee (2021) [@Isensee_2020] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | 4 |
| Kamnitsas (2017) [@Kamnitsas_2017] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | 4 |
| Menze (2015) [@Menze_2015] |  |  |  |  |  |  |  |  |  | main |  | Bench | High | 4 |
| Bilic (2023) [@Bilic_2023] |  |  |  |  |  |  |  |  |  | main |  | Bench | High | 4 |
| Commowick (2018) [@Commowick_2018] |  |  |  |  |  |  |  |  |  | main |  | Bench | High | 4 |
| van Griethuysen (2017) [@van_Griethuysen_2017] |  |  |  |  |  |  |  |  |  | main |  | Soft | High | 4 |
| Zwanenburg (2020) [@Zwanenburg_2020] |  |  |  |  |  |  |  |  |  | main |  | Bench | High | 4 |
| Haker (2004) [@Haker_2004] |  |  |  |  |  |  |  |  | x |  | main | Comp | High | 4 |
| Gramfort (2015) [@Gramfort_2015] |  |  |  |  | x |  |  |  |  |  | main | Comp | High | 2, 4 |
| Feydy (2017) [@Feydy_2017] |  |  |  |  |  |  |  |  | x |  | main | Comp | High | 4 |
| Luo (2022) [@Luo_2022] |  |  |  |  |  |  |  | main |  | x |  | Clin | High | 4 |
| Chen (2022) [@Chen_2022a] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | 4 |
| Ma (2024) [@Ma_2024] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | 4 |
| Iglesias (2015) [@Iglesias_2015] |  |  |  |  |  |  |  |  | main | x |  | Review | High | 4 |
| Fontaine (2020) [@Fontaine_2020] |  |  |  |  |  |  |  | x |  | main |  | Clin | High | 4 |
| Geady (2025) [@Geady_2025] |  |  |  |  |  |  |  | main |  | x |  | Review | High | 3, 4 |
| Cavinato (2023) [@Cavinato_2023] |  |  |  |  |  |  |  | main |  | x |  | Clin | High | 4 |
| Shen (2021) [@arxiv_2111_00648] |  |  |  |  |  |  |  |  | x |  | main | Comp | High | 4 |
| Gerber (2023) [@Gerber_2023] |  |  |  |  | x |  |  |  |  |  | main | Comp | High | 4 |
| Kim (2025) [@Kim_2025] |  |  |  |  |  |  |  |  | x |  | main | Comp | High | 4 |
| Zhu (2024) [@Zhu_2024] |  |  |  |  |  |  |  |  |  | x | main | Comp | High | 4 |
| He (2024) [@He_2024] |  |  |  |  |  |  |  | main |  | x |  | Clin | High | 4 |
| Dan (2025) [@Dan_2025] |  |  |  |  |  |  |  |  |  |  | main | Comp | High | 4 |
| Juhling (2024) [@J_hling_2024] |  |  |  |  |  |  |  |  | main | x |  | Clin | High | 4 |
| Andresen (2022) [@Andresen_2022] |  |  |  |  |  |  |  |  | main | x |  | Comp | High | 4 |
| Bi (2021) [@Bi_2021] | x | main |  |  |  |  |  |  |  |  |  | Review | Medium | merge run |
| Liu (2021) [@Liu_2021] |  | main |  |  |  |  |  |  |  |  |  | Review | Medium | merge run |
| Patalano (2026) [@arxiv_2609_23705] | main | x |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| van der Ploeg (2026) [@van_der_Ploeg_2026] | main | x |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Luo (2024) [@Luo_2024] |  | main |  |  |  |  |  |  |  |  |  | Theory | High | merge run |
| Cui (2024) [@Cui_2024] | main |  |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Ren (2023) [@arxiv_2208_00993] | main | x |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Alam (2026) [@Alam_2026] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Lock (2018) [@Lock_2018a] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Zhou (2024) [@Zhou_2024] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Xiao (2025) [@Xiao_2025] | x | main |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Chen (2025) [@Chen_2025] |  | main |  |  |  |  |  |  |  |  |  | Comp | High | merge run |
| Mahan (2024) [@arxiv_2401_01460] |  |  |  |  |  | main | x |  |  |  |  | Comp | Medium | merge run |
| Wang (2024) [@Wang_2024] |  |  |  |  | x | main | x |  |  |  |  | Comp | Medium | merge run |
| Liu (2023) [@Liu_2023] |  |  |  | x | main |  |  |  |  |  |  | Comp | Medium | merge run |
| Yang (2024) [@arxiv_2309_16604] |  |  |  | main | x |  |  |  |  |  |  | Comp | Medium | merge run |
| Zeng (2023) [@Zeng_2023] |  |  |  | x | main |  |  |  |  |  |  | Comp | Medium | merge run |
| Chen (2022) [@arxiv_2203_04964] |  |  |  |  |  |  | x | main |  | x |  | Comp | Medium | merge run |
| Gharibi (2026) [@Gharibi_2026] |  |  |  |  |  |  |  | main |  | x |  | Clin | Medium | merge run |
| Gacheva (2026) [@Gacheva_2026] |  |  |  |  |  |  | x | main |  |  |  | Comp | Medium | merge run |
| Yi (2021) [@Yi_2021] |  |  |  |  |  |  | x | main |  |  |  | Comp | Medium | merge run |
| Liu (2026) [@Liu_2026] |  |  |  |  |  |  | x | main | x |  |  | Comp | Medium | merge run |
| Shou (2024) [@Shou_2024] |  |  |  |  |  |  | x | main |  |  |  | Comp | Low | merge run |
| Ronneberger (2015) [@Ronneberger_2015] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | merge run |
| Hering (2023) [@Hering_2023] |  |  |  |  |  |  |  |  | main |  |  | Bench | High | merge run |
| Sotiras (2013) [@Sotiras_2013] |  |  |  |  |  |  |  |  | main |  |  | Review | High | merge run |
| Chen (2025) [@Chen_2025a] |  |  |  |  |  |  |  |  | main |  |  | Review | High | merge run |
| Wiltgen (2024) [@Wiltgen_2024] |  |  |  |  |  |  |  |  |  | main |  | Comp | High | merge run |
| Dexl (2025) [@Dexl_2025] |  |  |  |  |  |  |  |  |  | main |  | Bench | High | merge run |
| Gillies (2016) [@Gillies_2016] |  |  |  |  |  |  |  |  |  | main |  | Review | High | merge run |
| Fischl (2012) [@Fischl_2012] |  |  |  |  |  |  |  |  | main | x |  | Soft | High | merge run |
| Sabouri (2025) [@Sabouri_2025] |  |  |  |  |  |  |  | main |  | x |  | Clin | Medium | merge run |
| Mi (2017) [@Mi_2017] |  |  |  |  |  |  |  |  | x |  | main | Comp | Medium | merge run |
| Belkhatir (2022) [@Belkhatir_2022] |  |  |  |  |  |  |  |  |  | x | main | Comp | Medium | merge run |
| Tang (2026) [@Tang_2026] |  |  |  |  |  |  |  |  | main | x |  | Comp | Medium | merge run |
| Shi (2026) [@Shi_2026] |  |  |  |  |  |  |  | main | x |  |  | Comp | Medium | merge run |
| Haskins (2020) [@Haskins_2020] |  |  |  |  |  |  |  |  | main |  |  | Review | Medium | merge run |
| Lambin (2012) [@Lambin_2012] |  |  |  |  |  |  |  |  |  | main |  | Review | High | merge run |
| Lv (2026) [@Lv_2026] |  |  |  |  | x |  |  | main |  |  |  | Comp | Medium | merge run |
| Kocak (2024) [@Kocak_2024] |  |  |  |  |  |  |  |  |  | main |  | Review | High | merge run |
| Qahqaie (2026) [@Qahqaie_2026] |  |  |  |  |  |  |  | x | x |  | main | Comp | Medium | merge run |
| Thual (2023) [@arxiv_2312_06467] |  |  |  |  |  |  |  |  | x |  | main | Comp | Medium | merge run |
| Dey (2026) [@arxiv_2610_18804] |  |  |  |  |  |  |  |  | main | x |  | Comp | Medium | merge run |
| Dalca (2018) [@Dalca_2018] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | merge run |
| Yang (2017) [@Yang_2017] |  |  |  |  |  |  |  |  | main |  |  | Comp | High | merge run |
| Klein (2009) [@Klein_2009] |  |  |  |  |  |  |  |  | main |  |  | Bench | High | merge run |
| Avants (2011) [@Avants_2011] |  |  |  |  |  |  |  |  | main |  |  | Soft | High | merge run |
| Bronstein (2017) [@Bronstein_2017] |  |  |  |  |  |  | main |  |  |  |  | Review | High | merge run |
| Jaderberg (2015) [@arxiv_1506_02025] |  |  |  |  |  |  | x |  | main |  |  | Comp | High | merge run |
| Ktena (2017) [@Ktena_2017] |  |  |  |  |  |  | main |  |  |  | x | Comp | Medium | merge run |
| Ying (2018) [@arxiv_1806_08804] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | merge run |
| Nikolentzos (2017) [@Nikolentzos_2017] |  |  |  |  |  | main | x |  |  |  |  | Comp | Medium | merge run |
| Maretic (2019) [@arxiv_1906_02085] |  |  |  | x |  | main |  |  |  |  |  | Comp | High | merge run |
| Solomon (2016) [@Solomon_2016] |  |  | x | main |  |  |  |  |  |  |  | Comp | High | merge run |
| Sidiropoulos (2000) [@Sidiropoulos_2000] | main |  |  |  |  |  |  |  |  |  |  | Theory | Medium | merge run |
| Flamary (2021) [@Flamary_2021] |  |  | main | x |  |  |  |  |  |  |  | Soft | High | merge run |
| Kriege (2020) [@Kriege_2020] |  |  |  |  |  | main | x |  |  |  |  | Review | High | merge run |
| Barbe (2021) [@Barbe_2021] |  |  |  | main |  | x |  |  |  |  |  | Comp | Medium | merge run |
| Niepert (2016) [@arxiv_1605_05273] |  |  |  |  |  |  | main |  |  |  |  | Comp | High | merge run |
| Lee (2019) [@arxiv_1904_08082] |  |  |  |  |  |  | main |  |  |  |  | Comp | Medium | merge run |
| Gachon (2025) [@Gachon_2025] |  |  |  |  |  | main |  | x |  |  |  | Comp | Medium | merge run |
| Cang (2025) [@Cang_2025] |  |  |  | main |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Wang (2025) [@Wang_2025] |  |  |  |  | main |  |  |  |  |  |  | Comp | Medium | merge run |
| Shifat-E-Rabbi (2025) [@Shifat_E_Rabbi_2025a] |  |  |  |  | x |  |  |  |  |  | main | Comp | Medium | merge run |
| Tu (2020) [@Tu_2020] |  |  |  |  |  |  |  |  | x |  | main | Comp | Medium | merge run |
| Shi (2021) [@Shi_2021] | x |  |  |  |  |  |  |  | main | x |  | Comp | Medium | merge run |
| Zhu (2022) [@Zhu_2022] |  |  |  |  |  |  |  | main |  | x |  | Clin | Medium | merge run |
| Yan (2026) [@Yan_2026] |  |  |  |  | x |  |  |  |  |  | main | Comp | Medium | merge run |
| Kerdoncuff (2022) [@Kerdoncuff_2022] | x |  |  | main |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Wang (2024) [@Wang_2024a] |  |  |  | main |  |  |  |  | x |  |  | Comp | Medium | merge run |
| Chen (2024) [@Chen_2024] |  |  |  |  |  |  | x | main |  |  |  | Comp | High | merge run |
| Wilk (2025) [@Wilk_2025] |  |  |  |  |  |  |  | main |  | x |  | Clin | Medium | merge run |
| Phan (2026) [@Phan_2026] |  |  |  |  |  |  |  | main |  | x |  | Clin | Medium | merge run |
| Chang (2026) [@Chang_2026] |  |  |  |  |  |  |  |  | x |  | main | Comp | Medium | merge run |
| Takeda (2025) [@Takeda_2025] |  |  |  | x |  |  |  |  |  |  | main | Soft | Medium | merge run |
| Han (2025) [@Han_2025] |  |  |  |  |  |  |  |  | x |  | main | Comp | Low | merge run |
| Zhang (2025) [@Zhang_2025] |  |  |  |  |  |  |  | main | x |  |  | Review | Medium | merge run |
| Wang (2026) [@Wang_2026] |  | main |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Barbarant (2026) [@Barbarant_2026] |  |  |  |  |  |  |  |  | x |  | main | Comp | Medium | merge run |
| Kwon (2024) [@Kwon_2024] | main |  |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Morup (2025) [@Morup_2025] | main |  |  |  |  |  |  |  |  |  | x | Review | High | merge run |
| Minoccheri (2025) [@arxiv_2506_20065] | main | x |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Ferritto (2026) [@Ferritto_2026] |  |  |  |  |  |  |  |  | main | x |  | Clin | Medium | merge run |
| Kwon (2025) [@Kwon_2025] |  |  |  |  | x |  | main |  |  |  |  | Comp | Medium | merge run |
| Olaoluwa (2026) [@Olaoluwa_2026] |  |  |  |  |  |  | x | main |  |  |  | Comp | Medium | merge run |
| Abramova (2026) [@Abramova_2026] |  |  |  |  |  |  |  | main |  | x |  | Clin | Low | merge run |
| Chen (2026) [@Chen_2026] |  |  |  |  |  |  |  | x | main |  |  | Comp | Medium | merge run |
| He (2026) [@He_2026] |  | main |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Barbarant (2026) [@Barbarant_2026a] |  |  |  |  | x |  |  |  |  |  | main | Comp | Medium | merge run |
| Sokooti (2017) [@Sokooti_2017] |  |  |  |  |  |  |  |  | main |  |  | Comp | Medium | merge run |
| Rubner (2000) [@Rubner_2000] |  |  | x |  |  | main |  |  |  |  |  | Comp | High | merge run |
| Villani (2009) [@Villani_2009] |  |  | main |  |  |  |  |  |  |  |  | Book | High | merge run |
| Guo (2025) [@Guo_2025] |  | main |  |  |  |  |  |  |  |  |  | Comp | Medium | merge run |
| Karunanayake (2026) [@Karunanayake_2026] |  |  |  |  |  |  |  | main | x |  |  | Comp | Medium | merge run |
| Tang (2026) [@Tang_2026a] |  |  |  |  |  |  |  |  |  | x | main | Comp | Medium | merge run |

## 6. Identified gaps

1. Under-researched area: a supervised multilinear model whose spatial mode is matched across subjects by a transport coupling. The tensor regression and tensor PLS sources predict from images registered to a template [@Zhou_2013; @Miranda_2018; @Spencer_2024] or from a mode whose layout is fixed within the study [@Faes_2024; @Sun_2024]. The decompositions that admit an irregular mode are PARAFAC2 and its coupled variants [@Kiers_1999; @Roald_2022; @Schenker_2025], and their supervised forms act on an irregular time mode of health records [@Konyar_2025; @arxiv_2208_00993; @arxiv_2609_23705]. The transport methods that learn a predictor over unaligned structures are graph and set classifiers [@Vincent_Cuaz_2022; @arxiv_2006_12065]. No included source fits a tensor regression or tensor PLS model in which a learned transport plan aligns the spatial mode of each subject to a template.
2. Methodological gap: transport-based pooling is not compared with attention pooling on multi-lesion clinical outcomes. The multi-lesion studies aggregate hand-crafted radiomic features by rules (the largest lesion, averaging, volume weighting) [@Chang_2021; @Zhu_2022; @Wilk_2025; @Sabouri_2025; @Abramova_2026; @Geady_2025] or by attention and injective multiple-instance pooling [@Chen_2021; @Chen_2022; @arxiv_2203_04964; @Karimzadeh_2026; @Thiery_2025]. The transport pooling layers [@arxiv_2006_12065; @Naderializadeh_2021; @arxiv_2006_09430] are evaluated on machine-learning benchmarks, and the benchmark of pooling choices [@arxiv_2306_05553] uses no clinical cohort.
3. Methodological gap: few head-to-head comparisons of registration-based and correspondence-free representations on one cohort and one outcome. One study compares template meshes, point clouds, masks and texture features for the hippocampus in Alzheimer disease [@Sarasua_2022], one compares registration with a learned lesion matcher for lesion tracking [@Karunanayake_2026], and one compares point clouds with voxelized input on 24 test patients [@Liu_2026]. The other correspondence-free models report against their own baselines [@Guti_rrez_Becker_2021; @Beetz_2023; @Shou_2024].
4. Under-researched area: guarantees for models that learn a template and a predictor jointly. Consistency and convergence results exist for tensor PLS and tensor regression [@Zhang_2017; @Park_2025; @Luo_2024], uniqueness results for CP and PARAFAC2 [@Kruskal_1977; @Sidiropoulos_2000; @Kiers_1999], and generalization or excess-risk bounds for some transport embeddings [@Qian_2024; @arxiv_2202_03813; @Wang_2024]. The template and dictionary methods that are fitted with a nonconvex transport objective [@Peyre_2016; @arxiv_2102_06555; @arxiv_1908_02738] are reported with empirical results only in the included sources.
5. Population and evaluation gap: small cohorts and little external validation. Several multi-lesion and point-cloud studies report on tens to a few hundred patients [@Liu_2026; @Abramova_2026; @Sabouri_2025], one reports a domain shift at external transfer [@Karimzadeh_2026], one states that prospective validation is still required [@Yan_2026], and one finds the gain over a generic longitudinal model uncertain [@Lv_2026].

Coverage limits that carry into these gaps: IEEE Xplore, ACM Digital Library and Scopus were not reached (section 10), so engineering and computing venues indexed only there may hold work on gaps 1 and 2 that this set does not; the matrix holds no geography dimension.

## 7. Synthesis

### Topic, rationale and scope

Many prediction problems in medical imaging and neuroscience give each subject a set of spatial units that has no counterpart in another subject: a point cloud of an organ surface, a variable number of lesions, a set of regions or a cortical sheet with its own geometry. The standard pipeline restores a common index by registration to a template, as two surveys of registration describe [@Sotiras_2013; @Haskins_2020], and then extracts features from segmented structures [@Isensee_2020], for example the radiomic features that two reviews describe [@Gillies_2016; @Lambin_2012]. Three families of methods instead treat the missing correspondence as part of the model: decompositions with an irregular mode, transport couplings and templates, and permutation-invariant encoders. This review covers the four communities that build them: statistics and chemometrics for tensor models, machine learning and applied mathematics for transport, machine learning for set encoders, and medical image analysis for the pipelines. It includes methods from any application domain, in English, from 1970 to 2026, and it excludes unsupervised clustering with no prediction and domain adaptation that aligns feature distributions rather than spatial units.

### Review methodology

Four theme runs searched PubMed, the Crossref, OpenAlex, Semantic Scholar and arXiv indexes through `the lookup script`, and Semantic Scholar's search, with Boolean strings for the whole question and for each part, citation chaining backward and forward from named core papers, and semantic search (section 1). A merge run removed 5 duplicates, judged the 51 sources the theme runs had cut at their upper bounds, chained again from 33 core papers, searched the pairs of communities the question joins, and ran three currency passes. Screening followed the criteria of section 1, and 225 sources were included.

### Preview

The synthesis follows the three parts of the question. P1, the prediction methods, draws on themes B (tensor regression), A (decompositions with an irregular mode), F (transport embeddings), G (set encoders) and H (medical point clouds and multi-lesion models). P2, the handling of correspondence, draws on A, D (Gromov-Wasserstein), E (barycenters and templates), F, G and K (transport and functional alignment in imaging). P3, the pipeline steps, draws on I (registration), J (radiomics and segmentation), H and K.

### P1: methods that predict a subject-level outcome

**Tensor regression and tensor PLS.** N-way PLS predicted almost twice as well as unfolded PLS on noisy simulated excitation-emission data [@Bro_1996], and later work predicts a tensor from a tensor through Tucker blocks [@Qibin_Zhao_2013], gives tensor PLS a population interpretation with a consistency proof [@Zhang_2017], and extends it to quantile regression [@Sun_2024] and to high-dimensional settings where the earlier HOPLS estimator is not guaranteed consistent [@Park_2025]. Scalar-on-image regression with a low-rank CP or Tucker coefficient reduces ultrahigh-dimensional covariates to a manageable number of parameters [@Zhou_2013; @Li_2018], with Bayesian shrinkage [@arxiv_1509_06490], regularization of the tensor estimate itself [@Pietrosanu_2026] and tensor regression layers inside deep networks [@arxiv_1707_08308]. Block-term tensor regression with automatic component extraction outperformed vector and matrix decoders on ECoG [@Faes_2024]. These sources agree that multilinear structure reduces parameters and improves robustness, as the monograph of the field summarizes [@Liu_2021]; they assume a fixed index on every mode, and the imaging applications reach it by registration [@Zhou_2013; @Miranda_2018; @Spencer_2024].

**Supervised decompositions with an irregular mode.** PARAFAC2 lets each subject have its own number of rows while keeping uniqueness under mild assumptions [@Kiers_1999], and it has been made faster [@Perros_2017; @Afshar_2018], constrained [@Roald_2022], coupled with other sources [@Schenker_2025], probabilistic [@J_rgensen_2024] and extended to incomplete data [@Chatzis_2025]. Supervision enters through labels for a subset of patients [@Konyar_2025], downstream tasks [@arxiv_2208_00993], a survival model [@arxiv_2609_23705], covariates [@Lock_2018a], or an outcome shared between coupled blocks [@van_der_Ploeg_2026]. In these sources the irregular mode is time or visits; the spatial mode stays shared.

**Transport embeddings and transport learning.** A transport loss makes predictions smooth with respect to a metric on the output space [@arxiv_1506_05439], and the earth mover's distance compares variable-length signatures without binning [@Rubner_2000]. Graph and set classifiers built on transport include Wasserstein Weisfeiler-Lehman kernels [@arxiv_1906_01277], Wasserstein embeddings with cost linear in the number of graphs [@arxiv_2006_09430], linearized transport for point sets [@Moosm_ller_2022; @Shifat_E_Rabbi_2025; @arxiv_2401_01460], template-based fused Gromov-Wasserstein layers [@Vincent_Cuaz_2022] and graph prediction with a transport loss [@arxiv_2202_03813; @Krzakala_2024]. Theory accompanies some of them: an $O(1/N)$ generalization bound for a prototype classifier [@Qian_2024] and stronger generalization than global pooling [@Wang_2024].

**Set and point-cloud encoders.** A function on sets from a countable universe is permutation invariant exactly when it is a sum decomposition [@arxiv_1703_06114], but with continuous maps the latent dimension must be at least the maximum set size [@arxiv_1901_09006]. PointNet consumes raw point clouds through max pooling [@Charles_2017], PointNet++ adds local structure [@arxiv_1706_02413], the Set Transformer models interactions among elements [@arxiv_1810_00825], and attention multiple-instance learning weights each instance [@arxiv_1802_04712]. Transport pooling gives fixed-size representations that can be read as attention or as a surrogate of a transport kernel [@arxiv_2006_12065; @Naderializadeh_2021], and a later embedding is injective on measures and bi-Lipschitz on multisets, unlike sum or max pooling [@arxiv_2405_16519]. A benchmark finds that the choice of pooling can matter more than the backbone's width and depth [@arxiv_2306_05553].

**Medical point clouds and multi-lesion models.** Point-cloud networks predict from anatomy without correspondences [@Guti_rrez_Becker_2018; @Guti_rrez_Becker_2021], classify heart disease at 92 percent accuracy [@Chang_2020], improve myocardial infarction detection by about 13 percent over clinical benchmarks [@Beetz_2023], and predict motor scores in Parkinson disease better than a voxelized CNN on a small test set [@Liu_2026]. Multi-lesion models aggregate lesions by attention [@Chen_2022; @Karimzadeh_2026; @Thiery_2025], injective pooling [@arxiv_2203_04964] or hierarchical aggregation [@Gharibi_2026], and set operators also apply to glomeruli in kidney biopsies [@Zare_2025] and to cells in cytometry [@Yi_2021].

**Summary of P1.** The literature offers predictors at every point between a fixed multilinear index and a fully unordered set. Tensor models give interpretable low-rank coefficients with theory, and they assume the index; set and transport models drop the index, and the multi-lesion clinical studies use them with small cohorts.

### P2: handling of the missing correspondence

**Registration to a common space.** Deformable registration maps every subject to a template, through symmetric diffeomorphic normalization [@AVANTS_2008], DARTEL [@Ashburner_2007] or learned networks that are orders of magnitude faster at comparable accuracy [@Balakrishnan_2019; @de_Vos_2019; @Dalca_2018; @Chen_2022a]. A benchmark of fourteen nonlinear methods found their ranking largely independent of population and error measure [@Klein_2009], and Learn2Reg found no single approach best across tasks [@Hering_2023]. Registration leaves residual misalignment: local structures stayed misaligned with the atlas after nonlinear registration in one stroke study [@J_hling_2024], and networks that segment non-corresponding regions are more robust than registration alone [@Andresen_2022].

**Learned templates and barycenters.** The Wasserstein barycenter generalizes interpolation to several measures [@Agueh_2011] and is computed by entropic smoothing [@arxiv_1310_4375; @Benamou_2015]. Gromov-Wasserstein barycenters average structures of different sizes [@Peyre_2016], and dictionaries of graph atoms represent each graph as a combination of templates without node correspondence [@Xu_2020; @arxiv_2102_06555; @Liu_2023; @Zeng_2023]. In neuroimaging, templates and their alignment are learned together where no template exists [@arxiv_1908_02738], and functional templates built with transport gave the highest decoding accuracy without bias toward individual subjects [@Barbarant_2026a].

**Transport couplings.** Entropic regularization makes transport distances computable by Sinkhorn iterations several orders of magnitude faster than exact solvers [@arxiv_1306_0895], with near-linear-time approximation [@arxiv_1705_09634], a general theory of entropy-transport problems [@Liero_2017] and a survey of the field [@Peyr__2019]. Gromov-Wasserstein compares metric measure spaces up to isomorphism [@M_moli_2011], fused Gromov-Wasserstein adds node features [@arxiv_1805_09114; @Vayer_2020], the unbalanced variant handles measures of different mass [@arxiv_2009_04266], and the semi-relaxed variant gives computational gains [@arxiv_2110_02753]. In the brain, unbalanced transport aligns cortices without landmarks and raises between-subject correlation [@Thual_2022], improves out-of-subject decoding by up to 75 percent over anatomical alignment [@arxiv_2312_06467], and averages activation maps whose effects do not overlap across subjects [@Gramfort_2015]. Gromov-Wasserstein also finds correspondences that supervised alignment misses [@Takeda_2025].

**Permutation invariance.** Set encoders remove the need for correspondence by construction [@arxiv_1703_06114; @Charles_2017], and models that are also invariant to similarity transforms avoid pre-alignment as well [@Guti_rrez_Becker_2021]. The cost is expressiveness: sum decomposition needs a latent size that grows with the set [@arxiv_1901_09006], and common multiple-instance classifiers lack expressiveness for outcome prediction [@arxiv_2203_04964].

**Summary of P2.** The four answers trade the cost of computing a correspondence against what the model can still say about location. Registration and templates keep a common index that downstream tensor and voxel models need; transport couplings give a soft correspondence per subject; permutation invariance discards location unless it is added as a feature.

### P3: where methods remove or build on the pipeline steps

**Registration.** Registration-based studies build on it explicitly, for tensor regression [@Zhou_2013; @Spencer_2024], shape analysis from deformations [@Ashburner_2007] and atlas-based segmentation, where a survey reports that the whole set of labelled atlases captures anatomical variation better than one average [@Iglesias_2015]. Methods that remove it include point-cloud models [@Guti_rrez_Becker_2021; @Liu_2026], transport features for morphometry, which reduce sensitivity to misalignment [@Gerber_2023], and segmentation from misaligned multimodal images [@Tang_2026]. For lesion tracking, a learned matcher after affine registration matched 458 of 464 lesions, against an F1 of 0.797 for deformable registration with overlap [@Karunanayake_2026]. One recent PET/CT method reframes registration as a representation problem [@arxiv_2610_18804].

**Radiomics.** Radiomic features carry prognostic power across cohorts [@Aerts_2014], and standardization initiatives define them [@Zwanenburg_2020; @van_Griethuysen_2017] from texture families such as co-occurrence statistics [@Haralick_1973]. Multi-lesion studies disagree on aggregation: a quantitative review that replicated ten methods on three datasets found no method consistently best [@Geady_2025], a bag-of-words model beat standard radiomics [@Fontaine_2020], a volume-weighted average of the three largest metastases gave the best concordance [@Chang_2021], weighted radiomics beat the largest lesion [@Zhu_2022], and using all lesions raised the C-index over primary-tumour models [@Wilk_2025]. Transport enters radiomics as Wasserstein-optimized texture features [@Belkhatir_2022] and as distances between regional uptake distributions [@Tang_2026a].

**Segmentation.** Segmentation is the step the multi-lesion and point-cloud methods of the set build on. Self-configuring networks set the state of the art on most of 49 tasks [@Isensee_2020], and a multi-scale 3D CNN improved on the state of the art for three kinds of brain lesion [@Kamnitsas_2017], while challenges show substantial rater disagreement [@Menze_2015], low lesion-wise detection recall [@Bilic_2023] and a gap to human experts on detection [@Commowick_2018]. Point-cloud performance depends strongly on the segmentation [@Sarasua_2022], and the choice of template and segmentation changes network topology and its clinical associations [@Ferritto_2026].

**Summary of P3.** Correspondence-free methods remove registration but not segmentation: the point-cloud and multi-lesion models of the set take segmented structures as input, and their results depend on that segmentation [@Sarasua_2022]. Radiomics persists as the feature extractor inside most multi-lesion models.

### Cross-cutting synthesis

**Convergent findings.** Sources from all four communities agree that forcing a common index loses information or costs robustness: PARAFAC2 exists for modes with incomparable units [@J_rgensen_2024], unbalanced transport for cortical areas that differ in size [@Thual_2022], invariant point-cloud models to avoid pre-alignment [@Guti_rrez_Becker_2021], and lesion-level models because lesions within one patient differ and using all of them improves prediction [@Cavinato_2023; @Wilk_2025].

**Divergent findings and debates.** Learned registration is reported as much faster at comparable accuracy [@Balakrishnan_2019; @de_Vos_2019], while Learn2Reg challenges the belief that conventional methods must be much slower [@Hering_2023]. Multi-lesion aggregation has no consistent winner [@Geady_2025; @Sabouri_2025; @Abramova_2026]. Sum pooling is universal in one analysis [@arxiv_1703_06114] and needs a latent size at least the set size in another [@arxiv_1901_09006].

**Methods that dominate or are underused.** Computational method papers make up 74 percent of the set (section 2). Clinical studies of correspondence-free prediction are few and small, and external or prospective validation is rare [@Karimzadeh_2026; @Yan_2026]. Supervised tensor models with a spatial irregular mode, and transport pooling on clinical cohorts, are absent from the included sources (section 6).

### Gaps

The gaps of section 6 apply: (1) no supervised multilinear model with a transport-aligned spatial mode; (2) no comparison of transport pooling with attention pooling on multi-lesion outcomes; (3) few head-to-head comparisons of registration-based and correspondence-free representations; (4) no guarantees for jointly learned templates and predictors; (5) small cohorts and little external validation.

### Research agenda

1. Fit tensor regression or tensor PLS with a transport plan per subject that maps its spatial units to a learned template, so that the coefficient keeps a spatial reading without registration, and compare it with registration-based tensor regression on the same cohort.
2. Benchmark transport pooling, attention pooling and rule-based aggregation on public multi-lesion cohorts with external test sets.
3. Study identifiability and consistency for models that learn a template and a predictor jointly, starting from the uniqueness theory of PARAFAC2 and the bounds of transport embeddings.

### Key takeaways

- Registration and templates are the default answer to missing correspondence; transport couplings and permutation-invariant encoders are the two alternatives with a growing literature.
- Tensor models carry the strongest theory and assume a common index; set and transport models drop the index and carry less theory.
- Segmentation remains a prerequisite of the correspondence-free clinical models in the set.

### Implications for practice

A study that predicts from lesions or point clouds can drop deformable registration only where its segmentation is reliable, and should report how lesions are aggregated, since the choice changes the result [@Geady_2025]. Radiomic features used inside such models should follow the standardized definitions [@Zwanenburg_2020] and can be scored with the quality scoring tool for radiomics research [@Kocak_2024].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | [@Sotiras_2013], [@Haskins_2020], [@Gillies_2016], [@Lambin_2012], [@Peyr__2019], [@Kolda_2009], [@arxiv_1703_06114], [@Geady_2025] |
| Literature Review | [@Bro_1996], [@Zhang_2017], [@Zhou_2013], [@Kiers_1999], [@Konyar_2025], [@arxiv_2208_00993], [@M_moli_2011], [@arxiv_1805_09114], [@Vincent_Cuaz_2022], [@arxiv_2006_12065], [@Naderializadeh_2021], [@Charles_2017], [@arxiv_1810_00825], [@Guti_rrez_Becker_2021], [@Beetz_2023], [@arxiv_2203_04964], [@Thual_2022], [@Gerber_2023], [@Wilk_2025] |
| Methodology | [@arxiv_1306_0895], [@Peyre_2016], [@arxiv_2102_06555], [@arxiv_1908_02738], [@Roald_2022], [@Park_2025], [@arxiv_2306_05553], [@arxiv_2405_16519], [@AVANTS_2008], [@Balakrishnan_2019], [@Isensee_2020], [@Zwanenburg_2020], [@Flamary_2021] |
| Discussion | [@Hering_2023], [@Sarasua_2022], [@Karunanayake_2026], [@J_hling_2024], [@arxiv_1901_09006], [@Karimzadeh_2026], [@Yan_2026], [@Kocak_2024] |

## 9. No entry written

- Harshman 1972, "PARAFAC2: Mathematical and technical notes" (in the references of 2 of theme 1's core papers and of MULTIPAR): no index holds a record of it, and no readable copy was found, so it has no entry in `refs.bib` and is not cited. Theme run 1's section 9 gives the lookups tried.
- No entry of a theme run or of the merge run was taken out as not confirmed: `the lookup script resolve --entry refs.bib <key>` printed `CONFIRMED` for each of the 225 entries.

## 10. Search limitations and gate failures

Gates over the whole set:

| Gate | Result |
|---|---|
| Search documented | met (section 1) |
| Source count | met: 225 against the minimum of 30 |
| Annotations | met: 225 annotations, one per entry |
| Matrix coverage | met: every theme column holds 11 or more sources, and every part of the question more than 3 |
| Research gaps | met: 5 gaps (section 6) |
| Peer-reviewed share | met: 216 of 225 (96 percent) are peer-reviewed journal, proceedings or book publications; with the preprints the `cs_ml` profile counts, 224 of 225; the one other source is the seminal working paper `Harshman_1970` |
| Currency | met after three merge-run currency passes: 113 of 225 (50.2 percent) are from 2022 to 2026 |

Limitations:

- IEEE Xplore, ACM Digital Library and Scopus were not reached: the site-limited web searches returned no page from those sites. Their works are covered only where Crossref, OpenAlex, Semantic Scholar or PubMed hold them.
- Semantic Scholar answered HTTP 429 in several calls of theme runs 1 and 3 and in the merge run's title lookup of `arxiv_2506_20065`, so the published version of that preprint was not checked through Semantic Scholar.
- `arxiv_2312_06467` stays the preprint entry: its TMLR 2025 page carries a different title, and `the lookup script bibtex --page` refused it at a title ratio of 0.42.
- `Galloway_1975` and `Villani_2009` are included with the abstract not read; their Method and Key results fields are GAP.
- Bigalke 2021 and Zhang 2025 (lymphoma) were excluded unread (section 3).
- Condition 4 (the citation loop closes) is not met, because Harshman 1972 has no index record (section 9).
- Dutta 2026 was excluded on a possibly predatory venue.
- The method dimension is concentrated: 74 percent of the sources are computational (section 2).
- Several annotations leave a field as GAP where the abstract gives no figures: the Key results of `Nikolentzos_2017`, `Sidiropoulos_2000`, `Barbe_2021`, `Shi_2021`, `Han_2025`, `Barbarant_2026` and `Bi_2021`.

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (a literature review tool, model claude-opus-5-5). The AI took part in research assistance (the search and the annotated bibliography). A person oversaw the process, and the authors take responsibility for the content.
